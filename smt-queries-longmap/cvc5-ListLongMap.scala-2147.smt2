; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36164 () Bool)

(assert start!36164)

(declare-fun b!362668 () Bool)

(declare-fun res!202006 () Bool)

(declare-fun e!222106 () Bool)

(assert (=> b!362668 (=> (not res!202006) (not e!222106))))

(declare-datatypes ((array!20475 0))(
  ( (array!20476 (arr!9719 (Array (_ BitVec 32) (_ BitVec 64))) (size!10071 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20475)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362668 (= res!202006 (not (validKeyInArray!0 (select (arr!9719 a!4337) i!1478))))))

(declare-fun b!362671 () Bool)

(assert (=> b!362671 (= e!222106 (not true))))

(declare-fun lt!166965 () array!20475)

(declare-fun arrayCountValidKeys!0 (array!20475 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362671 (= (arrayCountValidKeys!0 lt!166965 (bvadd #b00000000000000000000000000000001 i!1478) (size!10071 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10071 a!4337)))))

(declare-datatypes ((Unit!11147 0))(
  ( (Unit!11148) )
))
(declare-fun lt!166964 () Unit!11147)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11147)

(assert (=> b!362671 (= lt!166964 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362671 (= (arrayCountValidKeys!0 lt!166965 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362671 (= lt!166965 (array!20476 (store (arr!9719 a!4337) i!1478 k!2980) (size!10071 a!4337)))))

(declare-fun lt!166963 () Unit!11147)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11147)

(assert (=> b!362671 (= lt!166963 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202003 () Bool)

(assert (=> start!36164 (=> (not res!202003) (not e!222106))))

(assert (=> start!36164 (= res!202003 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10071 a!4337))))))

(assert (=> start!36164 e!222106))

(assert (=> start!36164 true))

(declare-fun array_inv!7191 (array!20475) Bool)

(assert (=> start!36164 (array_inv!7191 a!4337)))

(declare-fun b!362669 () Bool)

(declare-fun res!202005 () Bool)

(assert (=> b!362669 (=> (not res!202005) (not e!222106))))

(assert (=> b!362669 (= res!202005 (validKeyInArray!0 k!2980))))

(declare-fun b!362670 () Bool)

(declare-fun res!202004 () Bool)

(assert (=> b!362670 (=> (not res!202004) (not e!222106))))

(assert (=> b!362670 (= res!202004 (bvslt (size!10071 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36164 res!202003) b!362668))

(assert (= (and b!362668 res!202006) b!362669))

(assert (= (and b!362669 res!202005) b!362670))

(assert (= (and b!362670 res!202004) b!362671))

(declare-fun m!359583 () Bool)

(assert (=> b!362668 m!359583))

(assert (=> b!362668 m!359583))

(declare-fun m!359585 () Bool)

(assert (=> b!362668 m!359585))

(declare-fun m!359587 () Bool)

(assert (=> b!362671 m!359587))

(declare-fun m!359589 () Bool)

(assert (=> b!362671 m!359589))

(declare-fun m!359591 () Bool)

(assert (=> b!362671 m!359591))

(declare-fun m!359593 () Bool)

(assert (=> b!362671 m!359593))

(declare-fun m!359595 () Bool)

(assert (=> b!362671 m!359595))

(declare-fun m!359597 () Bool)

(assert (=> b!362671 m!359597))

(declare-fun m!359599 () Bool)

(assert (=> b!362671 m!359599))

(declare-fun m!359601 () Bool)

(assert (=> start!36164 m!359601))

(declare-fun m!359603 () Bool)

(assert (=> b!362669 m!359603))

(push 1)

(assert (not b!362668))

(assert (not b!362671))

(assert (not b!362669))

(assert (not start!36164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

