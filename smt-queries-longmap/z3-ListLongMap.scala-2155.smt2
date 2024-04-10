; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36242 () Bool)

(assert start!36242)

(declare-fun res!202312 () Bool)

(declare-fun e!222340 () Bool)

(assert (=> start!36242 (=> (not res!202312) (not e!222340))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20543 0))(
  ( (array!20544 (arr!9752 (Array (_ BitVec 32) (_ BitVec 64))) (size!10104 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20543)

(assert (=> start!36242 (= res!202312 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10104 a!4337))))))

(assert (=> start!36242 e!222340))

(assert (=> start!36242 true))

(declare-fun array_inv!7194 (array!20543) Bool)

(assert (=> start!36242 (array_inv!7194 a!4337)))

(declare-fun b!363076 () Bool)

(declare-fun res!202310 () Bool)

(assert (=> b!363076 (=> (not res!202310) (not e!222340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363076 (= res!202310 (not (validKeyInArray!0 (select (arr!9752 a!4337) i!1478))))))

(declare-fun b!363077 () Bool)

(declare-fun res!202309 () Bool)

(assert (=> b!363077 (=> (not res!202309) (not e!222340))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!363077 (= res!202309 (validKeyInArray!0 k0!2980))))

(declare-fun b!363078 () Bool)

(declare-fun res!202311 () Bool)

(assert (=> b!363078 (=> (not res!202311) (not e!222340))))

(assert (=> b!363078 (= res!202311 (bvslt (size!10104 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363079 () Bool)

(assert (=> b!363079 (= e!222340 (not true))))

(declare-fun arrayCountValidKeys!0 (array!20543 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363079 (= (arrayCountValidKeys!0 (array!20544 (store (arr!9752 a!4337) i!1478 k0!2980) (size!10104 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11192 0))(
  ( (Unit!11193) )
))
(declare-fun lt!167353 () Unit!11192)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20543 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11192)

(assert (=> b!363079 (= lt!167353 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(assert (= (and start!36242 res!202312) b!363076))

(assert (= (and b!363076 res!202310) b!363077))

(assert (= (and b!363077 res!202309) b!363078))

(assert (= (and b!363078 res!202311) b!363079))

(declare-fun m!359931 () Bool)

(assert (=> start!36242 m!359931))

(declare-fun m!359933 () Bool)

(assert (=> b!363076 m!359933))

(assert (=> b!363076 m!359933))

(declare-fun m!359935 () Bool)

(assert (=> b!363076 m!359935))

(declare-fun m!359937 () Bool)

(assert (=> b!363077 m!359937))

(declare-fun m!359939 () Bool)

(assert (=> b!363079 m!359939))

(declare-fun m!359941 () Bool)

(assert (=> b!363079 m!359941))

(declare-fun m!359943 () Bool)

(assert (=> b!363079 m!359943))

(declare-fun m!359945 () Bool)

(assert (=> b!363079 m!359945))

(check-sat (not b!363076) (not b!363077) (not start!36242) (not b!363079))
