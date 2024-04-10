; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36464 () Bool)

(assert start!36464)

(declare-fun b!364575 () Bool)

(declare-fun res!203738 () Bool)

(declare-fun e!223173 () Bool)

(assert (=> b!364575 (=> (not res!203738) (not e!223173))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364575 (= res!203738 (validKeyInArray!0 k0!2974))))

(declare-fun b!364576 () Bool)

(declare-fun e!223174 () Bool)

(assert (=> b!364576 (= e!223174 (not true))))

(declare-datatypes ((array!20744 0))(
  ( (array!20745 (arr!9851 (Array (_ BitVec 32) (_ BitVec 64))) (size!10203 (_ BitVec 32))) )
))
(declare-fun lt!168592 () array!20744)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168591 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20744 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364576 (= (bvadd (arrayCountValidKeys!0 lt!168592 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168591) (arrayCountValidKeys!0 lt!168592 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11336 0))(
  ( (Unit!11337) )
))
(declare-fun lt!168590 () Unit!11336)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11336)

(assert (=> b!364576 (= lt!168590 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168592 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168588 () (_ BitVec 32))

(declare-fun a!4289 () array!20744)

(assert (=> b!364576 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168588) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168589 () Unit!11336)

(assert (=> b!364576 (= lt!168589 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364577 () Bool)

(declare-fun res!203736 () Bool)

(assert (=> b!364577 (=> (not res!203736) (not e!223173))))

(assert (=> b!364577 (= res!203736 (and (bvslt (size!10203 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10203 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364578 () Bool)

(declare-fun res!203740 () Bool)

(assert (=> b!364578 (=> (not res!203740) (not e!223173))))

(assert (=> b!364578 (= res!203740 (not (validKeyInArray!0 (select (arr!9851 a!4289) i!1472))))))

(declare-fun res!203737 () Bool)

(assert (=> start!36464 (=> (not res!203737) (not e!223173))))

(assert (=> start!36464 (= res!203737 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10203 a!4289))))))

(assert (=> start!36464 e!223173))

(assert (=> start!36464 true))

(declare-fun array_inv!7293 (array!20744) Bool)

(assert (=> start!36464 (array_inv!7293 a!4289)))

(declare-fun b!364579 () Bool)

(assert (=> b!364579 (= e!223173 e!223174)))

(declare-fun res!203739 () Bool)

(assert (=> b!364579 (=> (not res!203739) (not e!223174))))

(assert (=> b!364579 (= res!203739 (and (= lt!168591 (bvadd #b00000000000000000000000000000001 lt!168588)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364579 (= lt!168591 (arrayCountValidKeys!0 lt!168592 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364579 (= lt!168588 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364579 (= lt!168592 (array!20745 (store (arr!9851 a!4289) i!1472 k0!2974) (size!10203 a!4289)))))

(assert (= (and start!36464 res!203737) b!364578))

(assert (= (and b!364578 res!203740) b!364575))

(assert (= (and b!364575 res!203738) b!364577))

(assert (= (and b!364577 res!203736) b!364579))

(assert (= (and b!364579 res!203739) b!364576))

(declare-fun m!362137 () Bool)

(assert (=> b!364576 m!362137))

(declare-fun m!362139 () Bool)

(assert (=> b!364576 m!362139))

(declare-fun m!362141 () Bool)

(assert (=> b!364576 m!362141))

(declare-fun m!362143 () Bool)

(assert (=> b!364576 m!362143))

(declare-fun m!362145 () Bool)

(assert (=> b!364576 m!362145))

(declare-fun m!362147 () Bool)

(assert (=> b!364576 m!362147))

(declare-fun m!362149 () Bool)

(assert (=> b!364579 m!362149))

(declare-fun m!362151 () Bool)

(assert (=> b!364579 m!362151))

(declare-fun m!362153 () Bool)

(assert (=> b!364579 m!362153))

(declare-fun m!362155 () Bool)

(assert (=> start!36464 m!362155))

(declare-fun m!362157 () Bool)

(assert (=> b!364578 m!362157))

(assert (=> b!364578 m!362157))

(declare-fun m!362159 () Bool)

(assert (=> b!364578 m!362159))

(declare-fun m!362161 () Bool)

(assert (=> b!364575 m!362161))

(check-sat (not start!36464) (not b!364575) (not b!364578) (not b!364576) (not b!364579))
(check-sat)
