; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117064 () Bool)

(assert start!117064)

(declare-fun b!1378125 () Bool)

(declare-fun res!920661 () Bool)

(declare-fun e!780689 () Bool)

(assert (=> b!1378125 (=> (not res!920661) (not e!780689))))

(declare-datatypes ((array!93681 0))(
  ( (array!93682 (arr!45241 (Array (_ BitVec 32) (_ BitVec 64))) (size!45791 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93681)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378125 (= res!920661 (validKeyInArray!0 (select (arr!45241 a!4094) i!1451)))))

(declare-fun b!1378127 () Bool)

(declare-fun res!920662 () Bool)

(assert (=> b!1378127 (=> (not res!920662) (not e!780689))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378127 (= res!920662 (and (bvslt (size!45791 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45791 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378128 () Bool)

(assert (=> b!1378128 (= e!780689 false)))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun lt!606311 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378128 (= lt!606311 (arrayCountValidKeys!0 (array!93682 (store (arr!45241 a!4094) i!1451 k!2953) (size!45791 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606312 () (_ BitVec 32))

(assert (=> b!1378128 (= lt!606312 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378126 () Bool)

(declare-fun res!920659 () Bool)

(assert (=> b!1378126 (=> (not res!920659) (not e!780689))))

(assert (=> b!1378126 (= res!920659 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!920660 () Bool)

(assert (=> start!117064 (=> (not res!920660) (not e!780689))))

(assert (=> start!117064 (= res!920660 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45791 a!4094))))))

(assert (=> start!117064 e!780689))

(assert (=> start!117064 true))

(declare-fun array_inv!34269 (array!93681) Bool)

(assert (=> start!117064 (array_inv!34269 a!4094)))

(assert (= (and start!117064 res!920660) b!1378125))

(assert (= (and b!1378125 res!920661) b!1378126))

(assert (= (and b!1378126 res!920659) b!1378127))

(assert (= (and b!1378127 res!920662) b!1378128))

(declare-fun m!1262569 () Bool)

(assert (=> b!1378125 m!1262569))

(assert (=> b!1378125 m!1262569))

(declare-fun m!1262571 () Bool)

(assert (=> b!1378125 m!1262571))

(declare-fun m!1262573 () Bool)

(assert (=> b!1378128 m!1262573))

(declare-fun m!1262575 () Bool)

(assert (=> b!1378128 m!1262575))

(declare-fun m!1262577 () Bool)

(assert (=> b!1378128 m!1262577))

(declare-fun m!1262579 () Bool)

(assert (=> b!1378126 m!1262579))

(declare-fun m!1262581 () Bool)

(assert (=> start!117064 m!1262581))

(push 1)

(assert (not b!1378125))

(assert (not start!117064))

(assert (not b!1378128))

(assert (not b!1378126))

