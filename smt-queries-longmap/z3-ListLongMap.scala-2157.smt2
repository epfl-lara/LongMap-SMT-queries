; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36254 () Bool)

(assert start!36254)

(declare-fun b!363151 () Bool)

(declare-fun e!222375 () Bool)

(assert (=> b!363151 (= e!222375 (not true))))

(declare-datatypes ((array!20555 0))(
  ( (array!20556 (arr!9758 (Array (_ BitVec 32) (_ BitVec 64))) (size!10110 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20555)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363151 (= (arrayCountValidKeys!0 (array!20556 (store (arr!9758 a!4337) i!1478 k0!2980) (size!10110 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11204 0))(
  ( (Unit!11205) )
))
(declare-fun lt!167371 () Unit!11204)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11204)

(assert (=> b!363151 (= lt!167371 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363148 () Bool)

(declare-fun res!202383 () Bool)

(assert (=> b!363148 (=> (not res!202383) (not e!222375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363148 (= res!202383 (not (validKeyInArray!0 (select (arr!9758 a!4337) i!1478))))))

(declare-fun b!363150 () Bool)

(declare-fun res!202382 () Bool)

(assert (=> b!363150 (=> (not res!202382) (not e!222375))))

(assert (=> b!363150 (= res!202382 (bvslt (size!10110 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202381 () Bool)

(assert (=> start!36254 (=> (not res!202381) (not e!222375))))

(assert (=> start!36254 (= res!202381 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10110 a!4337))))))

(assert (=> start!36254 e!222375))

(assert (=> start!36254 true))

(declare-fun array_inv!7200 (array!20555) Bool)

(assert (=> start!36254 (array_inv!7200 a!4337)))

(declare-fun b!363149 () Bool)

(declare-fun res!202384 () Bool)

(assert (=> b!363149 (=> (not res!202384) (not e!222375))))

(assert (=> b!363149 (= res!202384 (validKeyInArray!0 k0!2980))))

(assert (= (and start!36254 res!202381) b!363148))

(assert (= (and b!363148 res!202383) b!363149))

(assert (= (and b!363149 res!202384) b!363150))

(assert (= (and b!363150 res!202382) b!363151))

(declare-fun m!360027 () Bool)

(assert (=> b!363151 m!360027))

(declare-fun m!360029 () Bool)

(assert (=> b!363151 m!360029))

(declare-fun m!360031 () Bool)

(assert (=> b!363151 m!360031))

(declare-fun m!360033 () Bool)

(assert (=> b!363151 m!360033))

(declare-fun m!360035 () Bool)

(assert (=> b!363148 m!360035))

(assert (=> b!363148 m!360035))

(declare-fun m!360037 () Bool)

(assert (=> b!363148 m!360037))

(declare-fun m!360039 () Bool)

(assert (=> start!36254 m!360039))

(declare-fun m!360041 () Bool)

(assert (=> b!363149 m!360041))

(check-sat (not b!363151) (not b!363148) (not b!363149) (not start!36254))
