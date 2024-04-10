; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36372 () Bool)

(assert start!36372)

(declare-fun b!363858 () Bool)

(declare-fun res!203023 () Bool)

(declare-fun e!222776 () Bool)

(assert (=> b!363858 (=> (not res!203023) (not e!222776))))

(declare-datatypes ((array!20652 0))(
  ( (array!20653 (arr!9805 (Array (_ BitVec 32) (_ BitVec 64))) (size!10157 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20652)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363858 (= res!203023 (not (validKeyInArray!0 (select (arr!9805 a!4289) i!1472))))))

(declare-fun b!363860 () Bool)

(declare-fun res!203022 () Bool)

(assert (=> b!363860 (=> (not res!203022) (not e!222776))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363860 (= res!203022 (and (bvslt (size!10157 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10157 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363861 () Bool)

(declare-fun res!203020 () Bool)

(assert (=> b!363861 (=> (not res!203020) (not e!222776))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!363861 (= res!203020 (validKeyInArray!0 k!2974))))

(declare-fun b!363862 () Bool)

(declare-fun e!222778 () Bool)

(assert (=> b!363862 (= e!222778 (not true))))

(declare-fun lt!167990 () array!20652)

(declare-fun lt!167992 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20652 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363862 (= (bvadd (arrayCountValidKeys!0 lt!167990 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167992) (arrayCountValidKeys!0 lt!167990 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11280 0))(
  ( (Unit!11281) )
))
(declare-fun lt!167991 () Unit!11280)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11280)

(assert (=> b!363862 (= lt!167991 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167990 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!167988 () (_ BitVec 32))

(assert (=> b!363862 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167988) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167989 () Unit!11280)

(assert (=> b!363862 (= lt!167989 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363859 () Bool)

(assert (=> b!363859 (= e!222776 e!222778)))

(declare-fun res!203021 () Bool)

(assert (=> b!363859 (=> (not res!203021) (not e!222778))))

(assert (=> b!363859 (= res!203021 (and (= lt!167992 (bvadd #b00000000000000000000000000000001 lt!167988)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!363859 (= lt!167992 (arrayCountValidKeys!0 lt!167990 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363859 (= lt!167988 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363859 (= lt!167990 (array!20653 (store (arr!9805 a!4289) i!1472 k!2974) (size!10157 a!4289)))))

(declare-fun res!203019 () Bool)

(assert (=> start!36372 (=> (not res!203019) (not e!222776))))

(assert (=> start!36372 (= res!203019 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10157 a!4289))))))

(assert (=> start!36372 e!222776))

(assert (=> start!36372 true))

(declare-fun array_inv!7247 (array!20652) Bool)

(assert (=> start!36372 (array_inv!7247 a!4289)))

(assert (= (and start!36372 res!203019) b!363858))

(assert (= (and b!363858 res!203023) b!363861))

(assert (= (and b!363861 res!203020) b!363860))

(assert (= (and b!363860 res!203022) b!363859))

(assert (= (and b!363859 res!203021) b!363862))

(declare-fun m!361121 () Bool)

(assert (=> b!363862 m!361121))

(declare-fun m!361123 () Bool)

(assert (=> b!363862 m!361123))

(declare-fun m!361125 () Bool)

(assert (=> b!363862 m!361125))

(declare-fun m!361127 () Bool)

(assert (=> b!363862 m!361127))

(declare-fun m!361129 () Bool)

(assert (=> b!363862 m!361129))

(declare-fun m!361131 () Bool)

(assert (=> b!363862 m!361131))

(declare-fun m!361133 () Bool)

(assert (=> b!363861 m!361133))

(declare-fun m!361135 () Bool)

(assert (=> b!363858 m!361135))

(assert (=> b!363858 m!361135))

(declare-fun m!361137 () Bool)

(assert (=> b!363858 m!361137))

(declare-fun m!361139 () Bool)

(assert (=> start!36372 m!361139))

(declare-fun m!361141 () Bool)

(assert (=> b!363859 m!361141))

(declare-fun m!361143 () Bool)

(assert (=> b!363859 m!361143))

(declare-fun m!361145 () Bool)

(assert (=> b!363859 m!361145))

(push 1)

(assert (not b!363858))

(assert (not b!363861))

(assert (not b!363859))

(assert (not b!363862))

(assert (not start!36372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

