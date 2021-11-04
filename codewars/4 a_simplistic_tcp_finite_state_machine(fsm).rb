# frozen_string_literal: true

# -Automatons, or Finite State Machines (FSM), are extremely useful to programmers when it comes
# to software design. You will be given a simplistic version of an FSM to code for a basic TCP session.
# -The outcome of this exercise will be to return the correct state of the TCP FSM based on the array of events given.
# -The input will be an array of events. Your job is to traverse the FSM as determined by the events,
# and return the proper state as a string, all caps, as shown above.
# -If an event is not applicable to the current state, your code will return "ERROR".
# -Action of each event upon each state: (the format is INITIAL_STATE: EVENT -> NEW_STATE)

# Example:
# ["APP_PASSIVE_OPEN", "APP_SEND", "RCV_SYN_ACK"] =>  "ESTABLISHED"
# ["APP_ACTIVE_OPEN"] =>  "SYN_SENT"
# ["APP_ACTIVE_OPEN", "RCV_SYN_ACK", "APP_CLOSE", "RCV_FIN_ACK", "RCV_ACK"] =>  "ERROR"

TCP_STATES = {
  CLOSED: { APP_PASSIVE_OPEN: :LISTEN,
            APP_ACTIVE_OPEN: :SYN_SENT },
  LISTEN: { RCV_SYN: :SYN_RCVD,
            APP_SEND: :SYN_SENT,
            APP_CLOSE: :CLOSED },
  SYN_RCVD: { APP_CLOSE: :FIN_WAIT_1,
              RCV_ACK: :ESTABLISHED },
  SYN_SENT: { RCV_SYN: :SYN_RCVD,
              RCV_SYN_ACK: :ESTABLISHED,
              APP_CLOSE: :CLOSED },
  ESTABLISHED: { APP_CLOSE: :FIN_WAIT_1,
                 RCV_FIN: :CLOSE_WAIT },
  FIN_WAIT_1: { RCV_FIN: :CLOSING,
                RCV_FIN_ACK: :TIME_WAIT,
                RCV_ACK: :FIN_WAIT_2 },
  CLOSING: { RCV_ACK: :TIME_WAIT },
  FIN_WAIT_2: { RCV_FIN: :TIME_WAIT },
  TIME_WAIT: { APP_TIMEOUT: :CLOSED },
  CLOSE_WAIT: { APP_CLOSE: :LAST_ACK },
  LAST_ACK: { RCV_ACK: :CLOSED }
}.freeze

# def traverse_TCP_states(eventList)
#   state, sname = TCP_STATES[:CLOSED], :CLOSED  # initial state, always
#   eventList.each do |e|
#     sname = (state[e.to_sym])
#     TCP_STATES[ state[e.to_sym] ] ? (state = TCP_STATES[state[e.to_sym]]) : (return "ERROR")
#   end
#   return sname.to_s
# end

def traverse_TCP_states(eventList)
  state = :CLOSED
  eventList.map(&:to_sym).each do |event|
    state = TCP_STATES[state][event] || raise
  rescue StandardError
    return 'ERROR'
  end
  state.to_s
end

p traverse_TCP_states(%w[APP_PASSIVE_OPEN RCV_SYN RCV_ACK APP_CLOSE]) == 'FIN_WAIT_1'
p traverse_TCP_states(%w[APP_PASSIVE_OPEN RCV_SYN RCV_ACK]) == 'ESTABLISHED'
p traverse_TCP_states(%w[APP_PASSIVE_OPEN RCV_SYN]) == 'SYN_RCVD'
p traverse_TCP_states(['APP_PASSIVE_OPEN']) == 'LISTEN'
p traverse_TCP_states(%w[APP_ACTIVE_OPEN APP_CLOSE]) == 'CLOSED'
p traverse_TCP_states(%w[APP_ACTIVE_OPEN RCV_SYN APP_CLOSE RCV_FIN RCV_ACK]) == 'TIME_WAIT'
p traverse_TCP_states(%w[APP_ACTIVE_OPEN RCV_SYN APP_CLOSE RCV_FIN RCV_ACK APP_TIMEOUT]) == 'CLOSED'
p traverse_TCP_states(%w[RCV_SYN RCV_ACK APP_CLOSE]) == 'ERROR'
p traverse_TCP_states(%w[APP_ACTIVE_OPEN RCV_SYN APP_CLOSE RCV_ACK]) == 'FIN_WAIT_2'
p traverse_TCP_states(%w[APP_ACTIVE_OPEN RCV_SYN_ACK RCV_FIN]) == 'CLOSE_WAIT'
p traverse_TCP_states(%w[APP_ACTIVE_OPEN RCV_SYN_ACK RCV_FIN APP_CLOSE]) == 'LAST_ACK'
p traverse_TCP_states(['APP_ACTIVE_OPEN']) == 'SYN_SENT'
