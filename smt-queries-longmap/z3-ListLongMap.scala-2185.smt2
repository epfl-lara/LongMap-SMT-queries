; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36430 () Bool)

(assert start!36430)

(declare-fun b!364138 () Bool)

(declare-fun res!203441 () Bool)

(declare-fun e!222910 () Bool)

(assert (=> b!364138 (=> (not res!203441) (not e!222910))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20706 0))(
  ( (array!20707 (arr!9832 (Array (_ BitVec 32) (_ BitVec 64))) (size!10185 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20706)

(assert (=> b!364138 (= res!203441 (and (bvslt (size!10185 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10185 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364139 () Bool)

(declare-fun e!222909 () Bool)

(assert (=> b!364139 (= e!222909 (not true))))

(declare-fun lt!168252 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20706 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364139 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168252) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11294 0))(
  ( (Unit!11295) )
))
(declare-fun lt!168253 () Unit!11294)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11294)

(assert (=> b!364139 (= lt!168253 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364140 () Bool)

(declare-fun res!203442 () Bool)

(assert (=> b!364140 (=> (not res!203442) (not e!222910))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364140 (= res!203442 (validKeyInArray!0 k0!2974))))

(declare-fun res!203444 () Bool)

(assert (=> start!36430 (=> (not res!203444) (not e!222910))))

(assert (=> start!36430 (= res!203444 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10185 a!4289))))))

(assert (=> start!36430 e!222910))

(assert (=> start!36430 true))

(declare-fun array_inv!7281 (array!20706) Bool)

(assert (=> start!36430 (array_inv!7281 a!4289)))

(declare-fun b!364141 () Bool)

(declare-fun res!203446 () Bool)

(assert (=> b!364141 (=> (not res!203446) (not e!222909))))

(assert (=> b!364141 (= res!203446 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!364142 () Bool)

(declare-fun res!203443 () Bool)

(assert (=> b!364142 (=> (not res!203443) (not e!222910))))

(assert (=> b!364142 (= res!203443 (not (validKeyInArray!0 (select (arr!9832 a!4289) i!1472))))))

(declare-fun b!364143 () Bool)

(assert (=> b!364143 (= e!222910 e!222909)))

(declare-fun res!203445 () Bool)

(assert (=> b!364143 (=> (not res!203445) (not e!222909))))

(assert (=> b!364143 (= res!203445 (= (arrayCountValidKeys!0 (array!20707 (store (arr!9832 a!4289) i!1472 k0!2974) (size!10185 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168252)))))

(assert (=> b!364143 (= lt!168252 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36430 res!203444) b!364142))

(assert (= (and b!364142 res!203443) b!364140))

(assert (= (and b!364140 res!203442) b!364138))

(assert (= (and b!364138 res!203441) b!364143))

(assert (= (and b!364143 res!203445) b!364141))

(assert (= (and b!364141 res!203446) b!364139))

(declare-fun m!361189 () Bool)

(assert (=> b!364140 m!361189))

(declare-fun m!361191 () Bool)

(assert (=> b!364139 m!361191))

(declare-fun m!361193 () Bool)

(assert (=> b!364139 m!361193))

(declare-fun m!361195 () Bool)

(assert (=> b!364139 m!361195))

(declare-fun m!361197 () Bool)

(assert (=> start!36430 m!361197))

(declare-fun m!361199 () Bool)

(assert (=> b!364142 m!361199))

(assert (=> b!364142 m!361199))

(declare-fun m!361201 () Bool)

(assert (=> b!364142 m!361201))

(declare-fun m!361203 () Bool)

(assert (=> b!364143 m!361203))

(declare-fun m!361205 () Bool)

(assert (=> b!364143 m!361205))

(declare-fun m!361207 () Bool)

(assert (=> b!364143 m!361207))

(check-sat (not b!364139) (not b!364140) (not b!364142) (not b!364143) (not start!36430))
(check-sat)
