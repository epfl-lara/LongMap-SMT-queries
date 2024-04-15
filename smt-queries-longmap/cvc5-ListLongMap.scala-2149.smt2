; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36176 () Bool)

(assert start!36176)

(declare-fun b!362526 () Bool)

(declare-fun res!201959 () Bool)

(declare-fun e!222007 () Bool)

(assert (=> b!362526 (=> (not res!201959) (not e!222007))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362526 (= res!201959 (validKeyInArray!0 k!2980))))

(declare-fun b!362527 () Bool)

(declare-fun e!222008 () Bool)

(assert (=> b!362527 (= e!222008 true)))

(declare-fun lt!166852 () (_ BitVec 32))

(declare-datatypes ((array!20488 0))(
  ( (array!20489 (arr!9726 (Array (_ BitVec 32) (_ BitVec 64))) (size!10079 (_ BitVec 32))) )
))
(declare-fun lt!166848 () array!20488)

(declare-fun lt!166856 () (_ BitVec 32))

(declare-fun a!4337 () array!20488)

(declare-fun arrayCountValidKeys!0 (array!20488 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362527 (= (bvadd lt!166856 lt!166852) (arrayCountValidKeys!0 lt!166848 #b00000000000000000000000000000000 (size!10079 a!4337)))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((Unit!11148 0))(
  ( (Unit!11149) )
))
(declare-fun lt!166855 () Unit!11148)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11148)

(assert (=> b!362527 (= lt!166855 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!166848 #b00000000000000000000000000000000 (size!10079 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362528 () Bool)

(assert (=> b!362528 (= e!222007 (not e!222008))))

(declare-fun res!201957 () Bool)

(assert (=> b!362528 (=> res!201957 e!222008)))

(assert (=> b!362528 (= res!201957 (or (bvslt (size!10079 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!166850 () (_ BitVec 32))

(declare-fun lt!166854 () (_ BitVec 32))

(assert (=> b!362528 (= (bvadd lt!166850 lt!166854) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10079 a!4337)))))

(declare-fun lt!166851 () Unit!11148)

(assert (=> b!362528 (= lt!166851 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10079 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362528 (= lt!166852 lt!166854)))

(assert (=> b!362528 (= lt!166854 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10079 a!4337)))))

(assert (=> b!362528 (= lt!166852 (arrayCountValidKeys!0 lt!166848 (bvadd #b00000000000000000000000000000001 i!1478) (size!10079 a!4337)))))

(declare-fun lt!166853 () Unit!11148)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11148)

(assert (=> b!362528 (= lt!166853 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362528 (= lt!166856 (bvadd #b00000000000000000000000000000001 lt!166850))))

(assert (=> b!362528 (= lt!166856 (arrayCountValidKeys!0 lt!166848 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362528 (= lt!166850 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362528 (= lt!166848 (array!20489 (store (arr!9726 a!4337) i!1478 k!2980) (size!10079 a!4337)))))

(declare-fun lt!166849 () Unit!11148)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11148)

(assert (=> b!362528 (= lt!166849 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!201958 () Bool)

(assert (=> start!36176 (=> (not res!201958) (not e!222007))))

(assert (=> start!36176 (= res!201958 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10079 a!4337))))))

(assert (=> start!36176 e!222007))

(assert (=> start!36176 true))

(declare-fun array_inv!7175 (array!20488) Bool)

(assert (=> start!36176 (array_inv!7175 a!4337)))

(declare-fun b!362529 () Bool)

(declare-fun res!201961 () Bool)

(assert (=> b!362529 (=> (not res!201961) (not e!222007))))

(assert (=> b!362529 (= res!201961 (bvslt (size!10079 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362530 () Bool)

(declare-fun res!201960 () Bool)

(assert (=> b!362530 (=> (not res!201960) (not e!222007))))

(assert (=> b!362530 (= res!201960 (not (validKeyInArray!0 (select (arr!9726 a!4337) i!1478))))))

(assert (= (and start!36176 res!201958) b!362530))

(assert (= (and b!362530 res!201960) b!362526))

(assert (= (and b!362526 res!201959) b!362529))

(assert (= (and b!362529 res!201961) b!362528))

(assert (= (and b!362528 (not res!201957)) b!362527))

(declare-fun m!358789 () Bool)

(assert (=> b!362526 m!358789))

(declare-fun m!358791 () Bool)

(assert (=> b!362528 m!358791))

(declare-fun m!358793 () Bool)

(assert (=> b!362528 m!358793))

(declare-fun m!358795 () Bool)

(assert (=> b!362528 m!358795))

(declare-fun m!358797 () Bool)

(assert (=> b!362528 m!358797))

(declare-fun m!358799 () Bool)

(assert (=> b!362528 m!358799))

(declare-fun m!358801 () Bool)

(assert (=> b!362528 m!358801))

(declare-fun m!358803 () Bool)

(assert (=> b!362528 m!358803))

(declare-fun m!358805 () Bool)

(assert (=> b!362528 m!358805))

(declare-fun m!358807 () Bool)

(assert (=> b!362528 m!358807))

(declare-fun m!358809 () Bool)

(assert (=> b!362527 m!358809))

(declare-fun m!358811 () Bool)

(assert (=> b!362527 m!358811))

(declare-fun m!358813 () Bool)

(assert (=> b!362530 m!358813))

(assert (=> b!362530 m!358813))

(declare-fun m!358815 () Bool)

(assert (=> b!362530 m!358815))

(declare-fun m!358817 () Bool)

(assert (=> start!36176 m!358817))

(push 1)

(assert (not b!362527))

(assert (not b!362528))

(assert (not start!36176))

(assert (not b!362526))

(assert (not b!362530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

