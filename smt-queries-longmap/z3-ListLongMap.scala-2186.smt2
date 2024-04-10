; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36452 () Bool)

(assert start!36452)

(declare-fun b!364481 () Bool)

(declare-fun res!203647 () Bool)

(declare-fun e!223120 () Bool)

(assert (=> b!364481 (=> (not res!203647) (not e!223120))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364481 (= res!203647 (validKeyInArray!0 k0!2974))))

(declare-fun b!364482 () Bool)

(declare-fun res!203642 () Bool)

(assert (=> b!364482 (=> (not res!203642) (not e!223120))))

(declare-datatypes ((array!20732 0))(
  ( (array!20733 (arr!9845 (Array (_ BitVec 32) (_ BitVec 64))) (size!10197 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20732)

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364482 (= res!203642 (not (validKeyInArray!0 (select (arr!9845 a!4289) i!1472))))))

(declare-fun b!364483 () Bool)

(declare-fun res!203643 () Bool)

(assert (=> b!364483 (=> (not res!203643) (not e!223120))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364483 (= res!203643 (and (bvslt (size!10197 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10197 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203646 () Bool)

(assert (=> start!36452 (=> (not res!203646) (not e!223120))))

(assert (=> start!36452 (= res!203646 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10197 a!4289))))))

(assert (=> start!36452 e!223120))

(assert (=> start!36452 true))

(declare-fun array_inv!7287 (array!20732) Bool)

(assert (=> start!36452 (array_inv!7287 a!4289)))

(declare-fun b!364484 () Bool)

(declare-fun e!223118 () Bool)

(assert (=> b!364484 (= e!223118 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun lt!168511 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20732 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364484 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168511) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11324 0))(
  ( (Unit!11325) )
))
(declare-fun lt!168510 () Unit!11324)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11324)

(assert (=> b!364484 (= lt!168510 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364485 () Bool)

(assert (=> b!364485 (= e!223120 e!223118)))

(declare-fun res!203644 () Bool)

(assert (=> b!364485 (=> (not res!203644) (not e!223118))))

(assert (=> b!364485 (= res!203644 (= (arrayCountValidKeys!0 (array!20733 (store (arr!9845 a!4289) i!1472 k0!2974) (size!10197 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168511)))))

(assert (=> b!364485 (= lt!168511 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364486 () Bool)

(declare-fun res!203645 () Bool)

(assert (=> b!364486 (=> (not res!203645) (not e!223118))))

(assert (=> b!364486 (= res!203645 (bvsgt from!3650 #b00000000000000000000000000000000))))

(assert (= (and start!36452 res!203646) b!364482))

(assert (= (and b!364482 res!203642) b!364481))

(assert (= (and b!364481 res!203647) b!364483))

(assert (= (and b!364483 res!203643) b!364485))

(assert (= (and b!364485 res!203644) b!364486))

(assert (= (and b!364486 res!203645) b!364484))

(declare-fun m!361993 () Bool)

(assert (=> b!364481 m!361993))

(declare-fun m!361995 () Bool)

(assert (=> start!36452 m!361995))

(declare-fun m!361997 () Bool)

(assert (=> b!364482 m!361997))

(assert (=> b!364482 m!361997))

(declare-fun m!361999 () Bool)

(assert (=> b!364482 m!361999))

(declare-fun m!362001 () Bool)

(assert (=> b!364484 m!362001))

(declare-fun m!362003 () Bool)

(assert (=> b!364484 m!362003))

(declare-fun m!362005 () Bool)

(assert (=> b!364484 m!362005))

(declare-fun m!362007 () Bool)

(assert (=> b!364485 m!362007))

(declare-fun m!362009 () Bool)

(assert (=> b!364485 m!362009))

(declare-fun m!362011 () Bool)

(assert (=> b!364485 m!362011))

(check-sat (not b!364484) (not b!364481) (not start!36452) (not b!364482) (not b!364485))
(check-sat)
