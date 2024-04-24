; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36460 () Bool)

(assert start!36460)

(declare-fun res!203809 () Bool)

(declare-fun e!223187 () Bool)

(assert (=> start!36460 (=> (not res!203809) (not e!223187))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20735 0))(
  ( (array!20736 (arr!9846 (Array (_ BitVec 32) (_ BitVec 64))) (size!10198 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20735)

(assert (=> start!36460 (= res!203809 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10198 a!4289))))))

(assert (=> start!36460 e!223187))

(assert (=> start!36460 true))

(declare-fun array_inv!7318 (array!20735) Bool)

(assert (=> start!36460 (array_inv!7318 a!4289)))

(declare-fun b!364601 () Bool)

(declare-fun e!223186 () Bool)

(assert (=> b!364601 (= e!223186 (not true))))

(declare-fun lt!168682 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168684 () array!20735)

(declare-fun arrayCountValidKeys!0 (array!20735 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364601 (= (bvadd (arrayCountValidKeys!0 lt!168684 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168682) (arrayCountValidKeys!0 lt!168684 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11335 0))(
  ( (Unit!11336) )
))
(declare-fun lt!168686 () Unit!11335)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11335)

(assert (=> b!364601 (= lt!168686 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168684 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168685 () (_ BitVec 32))

(assert (=> b!364601 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168685) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168683 () Unit!11335)

(assert (=> b!364601 (= lt!168683 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364602 () Bool)

(declare-fun res!203812 () Bool)

(assert (=> b!364602 (=> (not res!203812) (not e!223187))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364602 (= res!203812 (validKeyInArray!0 k0!2974))))

(declare-fun b!364603 () Bool)

(declare-fun res!203810 () Bool)

(assert (=> b!364603 (=> (not res!203810) (not e!223187))))

(assert (=> b!364603 (= res!203810 (not (validKeyInArray!0 (select (arr!9846 a!4289) i!1472))))))

(declare-fun b!364604 () Bool)

(assert (=> b!364604 (= e!223187 e!223186)))

(declare-fun res!203808 () Bool)

(assert (=> b!364604 (=> (not res!203808) (not e!223186))))

(assert (=> b!364604 (= res!203808 (and (= lt!168682 (bvadd #b00000000000000000000000000000001 lt!168685)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364604 (= lt!168682 (arrayCountValidKeys!0 lt!168684 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364604 (= lt!168685 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364604 (= lt!168684 (array!20736 (store (arr!9846 a!4289) i!1472 k0!2974) (size!10198 a!4289)))))

(declare-fun b!364605 () Bool)

(declare-fun res!203811 () Bool)

(assert (=> b!364605 (=> (not res!203811) (not e!223187))))

(assert (=> b!364605 (= res!203811 (and (bvslt (size!10198 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10198 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36460 res!203809) b!364603))

(assert (= (and b!364603 res!203810) b!364602))

(assert (= (and b!364602 res!203812) b!364605))

(assert (= (and b!364605 res!203811) b!364604))

(assert (= (and b!364604 res!203808) b!364601))

(declare-fun m!362497 () Bool)

(assert (=> b!364601 m!362497))

(declare-fun m!362499 () Bool)

(assert (=> b!364601 m!362499))

(declare-fun m!362501 () Bool)

(assert (=> b!364601 m!362501))

(declare-fun m!362503 () Bool)

(assert (=> b!364601 m!362503))

(declare-fun m!362505 () Bool)

(assert (=> b!364601 m!362505))

(declare-fun m!362507 () Bool)

(assert (=> b!364601 m!362507))

(declare-fun m!362509 () Bool)

(assert (=> b!364604 m!362509))

(declare-fun m!362511 () Bool)

(assert (=> b!364604 m!362511))

(declare-fun m!362513 () Bool)

(assert (=> b!364604 m!362513))

(declare-fun m!362515 () Bool)

(assert (=> b!364602 m!362515))

(declare-fun m!362517 () Bool)

(assert (=> start!36460 m!362517))

(declare-fun m!362519 () Bool)

(assert (=> b!364603 m!362519))

(assert (=> b!364603 m!362519))

(declare-fun m!362521 () Bool)

(assert (=> b!364603 m!362521))

(check-sat (not b!364602) (not b!364601) (not start!36460) (not b!364604) (not b!364603))
(check-sat)
