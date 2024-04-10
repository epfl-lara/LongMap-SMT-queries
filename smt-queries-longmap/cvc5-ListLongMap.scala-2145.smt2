; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36162 () Bool)

(assert start!36162)

(declare-fun res!201898 () Bool)

(declare-fun e!222074 () Bool)

(assert (=> start!36162 (=> (not res!201898) (not e!222074))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20478 0))(
  ( (array!20479 (arr!9721 (Array (_ BitVec 32) (_ BitVec 64))) (size!10073 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20478)

(assert (=> start!36162 (= res!201898 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10073 a!4337))))))

(assert (=> start!36162 e!222074))

(assert (=> start!36162 true))

(declare-fun array_inv!7163 (array!20478) Bool)

(assert (=> start!36162 (array_inv!7163 a!4337)))

(declare-fun b!362605 () Bool)

(declare-fun res!201894 () Bool)

(assert (=> b!362605 (=> (not res!201894) (not e!222074))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362605 (= res!201894 (validKeyInArray!0 k!2980))))

(declare-fun b!362606 () Bool)

(declare-fun res!201897 () Bool)

(assert (=> b!362606 (=> (not res!201897) (not e!222074))))

(assert (=> b!362606 (= res!201897 (not (validKeyInArray!0 (select (arr!9721 a!4337) i!1478))))))

(declare-fun b!362607 () Bool)

(declare-fun res!201896 () Bool)

(assert (=> b!362607 (=> (not res!201896) (not e!222074))))

(assert (=> b!362607 (= res!201896 (bvslt (size!10073 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362608 () Bool)

(declare-fun e!222075 () Bool)

(assert (=> b!362608 (= e!222075 true)))

(declare-fun lt!166856 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20478 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362608 (= lt!166856 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166857 () (_ BitVec 32))

(declare-fun lt!166858 () array!20478)

(assert (=> b!362608 (= lt!166857 (arrayCountValidKeys!0 lt!166858 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362609 () Bool)

(assert (=> b!362609 (= e!222074 (not e!222075))))

(declare-fun res!201895 () Bool)

(assert (=> b!362609 (=> res!201895 e!222075)))

(assert (=> b!362609 (= res!201895 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362609 (= (arrayCountValidKeys!0 lt!166858 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362609 (= lt!166858 (array!20479 (store (arr!9721 a!4337) i!1478 k!2980) (size!10073 a!4337)))))

(declare-datatypes ((Unit!11142 0))(
  ( (Unit!11143) )
))
(declare-fun lt!166859 () Unit!11142)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11142)

(assert (=> b!362609 (= lt!166859 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36162 res!201898) b!362606))

(assert (= (and b!362606 res!201897) b!362605))

(assert (= (and b!362605 res!201894) b!362607))

(assert (= (and b!362607 res!201896) b!362609))

(assert (= (and b!362609 (not res!201895)) b!362608))

(declare-fun m!359189 () Bool)

(assert (=> b!362606 m!359189))

(assert (=> b!362606 m!359189))

(declare-fun m!359191 () Bool)

(assert (=> b!362606 m!359191))

(declare-fun m!359193 () Bool)

(assert (=> b!362609 m!359193))

(declare-fun m!359195 () Bool)

(assert (=> b!362609 m!359195))

(declare-fun m!359197 () Bool)

(assert (=> b!362609 m!359197))

(declare-fun m!359199 () Bool)

(assert (=> b!362609 m!359199))

(declare-fun m!359201 () Bool)

(assert (=> start!36162 m!359201))

(declare-fun m!359203 () Bool)

(assert (=> b!362608 m!359203))

(declare-fun m!359205 () Bool)

(assert (=> b!362608 m!359205))

(declare-fun m!359207 () Bool)

(assert (=> b!362605 m!359207))

(push 1)

(assert (not b!362609))

(assert (not b!362605))

(assert (not start!36162))

(assert (not b!362606))

(assert (not b!362608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

