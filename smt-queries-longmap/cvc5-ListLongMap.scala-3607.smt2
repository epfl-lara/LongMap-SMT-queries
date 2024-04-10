; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49698 () Bool)

(assert start!49698)

(declare-fun b!546530 () Bool)

(declare-fun res!340246 () Bool)

(declare-fun e!315890 () Bool)

(assert (=> b!546530 (=> (not res!340246) (not e!315890))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34448 0))(
  ( (array!34449 (arr!16551 (Array (_ BitVec 32) (_ BitVec 64))) (size!16915 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34448)

(assert (=> b!546530 (= res!340246 (and (= (size!16915 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16915 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16915 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546533 () Bool)

(assert (=> b!546533 (= e!315890 (and (bvslt #b00000000000000000000000000000000 (size!16915 a!3118)) (bvsge (size!16915 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!546532 () Bool)

(declare-fun res!340247 () Bool)

(assert (=> b!546532 (=> (not res!340247) (not e!315890))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546532 (= res!340247 (validKeyInArray!0 k!1914))))

(declare-fun res!340245 () Bool)

(assert (=> start!49698 (=> (not res!340245) (not e!315890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49698 (= res!340245 (validMask!0 mask!3119))))

(assert (=> start!49698 e!315890))

(assert (=> start!49698 true))

(declare-fun array_inv!12347 (array!34448) Bool)

(assert (=> start!49698 (array_inv!12347 a!3118)))

(declare-fun b!546531 () Bool)

(declare-fun res!340244 () Bool)

(assert (=> b!546531 (=> (not res!340244) (not e!315890))))

(assert (=> b!546531 (= res!340244 (validKeyInArray!0 (select (arr!16551 a!3118) j!142)))))

(assert (= (and start!49698 res!340245) b!546530))

(assert (= (and b!546530 res!340246) b!546531))

(assert (= (and b!546531 res!340244) b!546532))

(assert (= (and b!546532 res!340247) b!546533))

(declare-fun m!523959 () Bool)

(assert (=> b!546532 m!523959))

(declare-fun m!523961 () Bool)

(assert (=> start!49698 m!523961))

(declare-fun m!523963 () Bool)

(assert (=> start!49698 m!523963))

(declare-fun m!523965 () Bool)

(assert (=> b!546531 m!523965))

(assert (=> b!546531 m!523965))

(declare-fun m!523967 () Bool)

(assert (=> b!546531 m!523967))

(push 1)

(assert (not start!49698))

(assert (not b!546531))

(assert (not b!546532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82359 () Bool)

(assert (=> d!82359 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

