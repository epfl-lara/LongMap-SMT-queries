; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36168 () Bool)

(assert start!36168)

(declare-fun b!362650 () Bool)

(declare-fun res!201940 () Bool)

(declare-fun e!222102 () Bool)

(assert (=> b!362650 (=> (not res!201940) (not e!222102))))

(declare-datatypes ((array!20484 0))(
  ( (array!20485 (arr!9724 (Array (_ BitVec 32) (_ BitVec 64))) (size!10076 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20484)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362650 (= res!201940 (not (validKeyInArray!0 (select (arr!9724 a!4337) i!1478))))))

(declare-fun b!362651 () Bool)

(declare-fun e!222101 () Bool)

(assert (=> b!362651 (= e!222102 (not e!222101))))

(declare-fun res!201941 () Bool)

(assert (=> b!362651 (=> res!201941 e!222101)))

(assert (=> b!362651 (= res!201941 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166894 () array!20484)

(declare-fun arrayCountValidKeys!0 (array!20484 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362651 (= (arrayCountValidKeys!0 lt!166894 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362651 (= lt!166894 (array!20485 (store (arr!9724 a!4337) i!1478 k!2980) (size!10076 a!4337)))))

(declare-datatypes ((Unit!11148 0))(
  ( (Unit!11149) )
))
(declare-fun lt!166893 () Unit!11148)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11148)

(assert (=> b!362651 (= lt!166893 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362652 () Bool)

(assert (=> b!362652 (= e!222101 true)))

(declare-fun lt!166895 () (_ BitVec 32))

(assert (=> b!362652 (= lt!166895 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166892 () (_ BitVec 32))

(assert (=> b!362652 (= lt!166892 (arrayCountValidKeys!0 lt!166894 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201942 () Bool)

(assert (=> start!36168 (=> (not res!201942) (not e!222102))))

(assert (=> start!36168 (= res!201942 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10076 a!4337))))))

(assert (=> start!36168 e!222102))

(assert (=> start!36168 true))

(declare-fun array_inv!7166 (array!20484) Bool)

(assert (=> start!36168 (array_inv!7166 a!4337)))

(declare-fun b!362653 () Bool)

(declare-fun res!201939 () Bool)

(assert (=> b!362653 (=> (not res!201939) (not e!222102))))

(assert (=> b!362653 (= res!201939 (validKeyInArray!0 k!2980))))

(declare-fun b!362654 () Bool)

(declare-fun res!201943 () Bool)

(assert (=> b!362654 (=> (not res!201943) (not e!222102))))

(assert (=> b!362654 (= res!201943 (bvslt (size!10076 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36168 res!201942) b!362650))

(assert (= (and b!362650 res!201940) b!362653))

(assert (= (and b!362653 res!201939) b!362654))

(assert (= (and b!362654 res!201943) b!362651))

(assert (= (and b!362651 (not res!201941)) b!362652))

(declare-fun m!359249 () Bool)

(assert (=> b!362650 m!359249))

(assert (=> b!362650 m!359249))

(declare-fun m!359251 () Bool)

(assert (=> b!362650 m!359251))

(declare-fun m!359253 () Bool)

(assert (=> start!36168 m!359253))

(declare-fun m!359255 () Bool)

(assert (=> b!362652 m!359255))

(declare-fun m!359257 () Bool)

(assert (=> b!362652 m!359257))

(declare-fun m!359259 () Bool)

(assert (=> b!362653 m!359259))

(declare-fun m!359261 () Bool)

(assert (=> b!362651 m!359261))

(declare-fun m!359263 () Bool)

(assert (=> b!362651 m!359263))

(declare-fun m!359265 () Bool)

(assert (=> b!362651 m!359265))

(declare-fun m!359267 () Bool)

(assert (=> b!362651 m!359267))

(push 1)

(assert (not b!362650))

(assert (not b!362652))

(assert (not b!362653))

(assert (not b!362651))

(assert (not start!36168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

