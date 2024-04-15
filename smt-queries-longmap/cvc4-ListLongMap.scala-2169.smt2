; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36336 () Bool)

(assert start!36336)

(declare-fun b!363423 () Bool)

(declare-fun e!222504 () Bool)

(assert (=> b!363423 (= e!222504 (not true))))

(declare-datatypes ((array!20612 0))(
  ( (array!20613 (arr!9785 (Array (_ BitVec 32) (_ BitVec 64))) (size!10138 (_ BitVec 32))) )
))
(declare-fun lt!167592 () array!20612)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!167590 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20612 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363423 (= (bvadd (arrayCountValidKeys!0 lt!167592 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167590) (arrayCountValidKeys!0 lt!167592 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11236 0))(
  ( (Unit!11237) )
))
(declare-fun lt!167593 () Unit!11236)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11236)

(assert (=> b!363423 (= lt!167593 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167592 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167591 () (_ BitVec 32))

(declare-fun a!4289 () array!20612)

(assert (=> b!363423 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167591) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167589 () Unit!11236)

(assert (=> b!363423 (= lt!167589 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363424 () Bool)

(declare-fun res!202727 () Bool)

(declare-fun e!222503 () Bool)

(assert (=> b!363424 (=> (not res!202727) (not e!222503))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363424 (= res!202727 (validKeyInArray!0 k!2974))))

(declare-fun b!363425 () Bool)

(assert (=> b!363425 (= e!222503 e!222504)))

(declare-fun res!202725 () Bool)

(assert (=> b!363425 (=> (not res!202725) (not e!222504))))

(assert (=> b!363425 (= res!202725 (and (= lt!167590 (bvadd #b00000000000000000000000000000001 lt!167591)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363425 (= lt!167590 (arrayCountValidKeys!0 lt!167592 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363425 (= lt!167591 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363425 (= lt!167592 (array!20613 (store (arr!9785 a!4289) i!1472 k!2974) (size!10138 a!4289)))))

(declare-fun b!363426 () Bool)

(declare-fun res!202729 () Bool)

(assert (=> b!363426 (=> (not res!202729) (not e!222503))))

(assert (=> b!363426 (= res!202729 (not (validKeyInArray!0 (select (arr!9785 a!4289) i!1472))))))

(declare-fun res!202728 () Bool)

(assert (=> start!36336 (=> (not res!202728) (not e!222503))))

(assert (=> start!36336 (= res!202728 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10138 a!4289))))))

(assert (=> start!36336 e!222503))

(assert (=> start!36336 true))

(declare-fun array_inv!7234 (array!20612) Bool)

(assert (=> start!36336 (array_inv!7234 a!4289)))

(declare-fun b!363422 () Bool)

(declare-fun res!202726 () Bool)

(assert (=> b!363422 (=> (not res!202726) (not e!222503))))

(assert (=> b!363422 (= res!202726 (and (bvslt (size!10138 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10138 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36336 res!202728) b!363426))

(assert (= (and b!363426 res!202729) b!363424))

(assert (= (and b!363424 res!202727) b!363422))

(assert (= (and b!363422 res!202726) b!363425))

(assert (= (and b!363425 res!202725) b!363423))

(declare-fun m!360111 () Bool)

(assert (=> start!36336 m!360111))

(declare-fun m!360113 () Bool)

(assert (=> b!363426 m!360113))

(assert (=> b!363426 m!360113))

(declare-fun m!360115 () Bool)

(assert (=> b!363426 m!360115))

(declare-fun m!360117 () Bool)

(assert (=> b!363424 m!360117))

(declare-fun m!360119 () Bool)

(assert (=> b!363423 m!360119))

(declare-fun m!360121 () Bool)

(assert (=> b!363423 m!360121))

(declare-fun m!360123 () Bool)

(assert (=> b!363423 m!360123))

(declare-fun m!360125 () Bool)

(assert (=> b!363423 m!360125))

(declare-fun m!360127 () Bool)

(assert (=> b!363423 m!360127))

(declare-fun m!360129 () Bool)

(assert (=> b!363423 m!360129))

(declare-fun m!360131 () Bool)

(assert (=> b!363425 m!360131))

(declare-fun m!360133 () Bool)

(assert (=> b!363425 m!360133))

(declare-fun m!360135 () Bool)

(assert (=> b!363425 m!360135))

(push 1)

(assert (not b!363423))

(assert (not start!36336))

(assert (not b!363426))

(assert (not b!363425))

(assert (not b!363424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

