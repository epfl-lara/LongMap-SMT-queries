; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36430 () Bool)

(assert start!36430)

(declare-fun b!364360 () Bool)

(declare-fun e!223051 () Bool)

(assert (=> b!364360 (= e!223051 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168506 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20705 0))(
  ( (array!20706 (arr!9831 (Array (_ BitVec 32) (_ BitVec 64))) (size!10183 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20705)

(declare-fun arrayCountValidKeys!0 (array!20705 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364360 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168506) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11305 0))(
  ( (Unit!11306) )
))
(declare-fun lt!168505 () Unit!11305)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11305)

(assert (=> b!364360 (= lt!168505 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364361 () Bool)

(declare-fun res!203570 () Bool)

(declare-fun e!223050 () Bool)

(assert (=> b!364361 (=> (not res!203570) (not e!223050))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364361 (= res!203570 (validKeyInArray!0 k0!2974))))

(declare-fun b!364362 () Bool)

(declare-fun res!203569 () Bool)

(assert (=> b!364362 (=> (not res!203569) (not e!223051))))

(assert (=> b!364362 (= res!203569 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!364363 () Bool)

(assert (=> b!364363 (= e!223050 e!223051)))

(declare-fun res!203572 () Bool)

(assert (=> b!364363 (=> (not res!203572) (not e!223051))))

(assert (=> b!364363 (= res!203572 (= (arrayCountValidKeys!0 (array!20706 (store (arr!9831 a!4289) i!1472 k0!2974) (size!10183 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168506)))))

(assert (=> b!364363 (= lt!168506 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364364 () Bool)

(declare-fun res!203567 () Bool)

(assert (=> b!364364 (=> (not res!203567) (not e!223050))))

(assert (=> b!364364 (= res!203567 (not (validKeyInArray!0 (select (arr!9831 a!4289) i!1472))))))

(declare-fun res!203571 () Bool)

(assert (=> start!36430 (=> (not res!203571) (not e!223050))))

(assert (=> start!36430 (= res!203571 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10183 a!4289))))))

(assert (=> start!36430 e!223050))

(assert (=> start!36430 true))

(declare-fun array_inv!7303 (array!20705) Bool)

(assert (=> start!36430 (array_inv!7303 a!4289)))

(declare-fun b!364365 () Bool)

(declare-fun res!203568 () Bool)

(assert (=> b!364365 (=> (not res!203568) (not e!223050))))

(assert (=> b!364365 (= res!203568 (and (bvslt (size!10183 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10183 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36430 res!203571) b!364364))

(assert (= (and b!364364 res!203567) b!364361))

(assert (= (and b!364361 res!203570) b!364365))

(assert (= (and b!364365 res!203568) b!364363))

(assert (= (and b!364363 res!203572) b!364362))

(assert (= (and b!364362 res!203569) b!364360))

(declare-fun m!362143 () Bool)

(assert (=> start!36430 m!362143))

(declare-fun m!362145 () Bool)

(assert (=> b!364363 m!362145))

(declare-fun m!362147 () Bool)

(assert (=> b!364363 m!362147))

(declare-fun m!362149 () Bool)

(assert (=> b!364363 m!362149))

(declare-fun m!362151 () Bool)

(assert (=> b!364364 m!362151))

(assert (=> b!364364 m!362151))

(declare-fun m!362153 () Bool)

(assert (=> b!364364 m!362153))

(declare-fun m!362155 () Bool)

(assert (=> b!364360 m!362155))

(declare-fun m!362157 () Bool)

(assert (=> b!364360 m!362157))

(declare-fun m!362159 () Bool)

(assert (=> b!364360 m!362159))

(declare-fun m!362161 () Bool)

(assert (=> b!364361 m!362161))

(check-sat (not b!364361) (not b!364363) (not b!364360) (not start!36430) (not b!364364))
(check-sat)
