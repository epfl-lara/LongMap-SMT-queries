; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85692 () Bool)

(assert start!85692)

(declare-fun b!994322 () Bool)

(declare-fun res!664958 () Bool)

(declare-fun e!561131 () Bool)

(assert (=> b!994322 (=> (not res!664958) (not e!561131))))

(declare-datatypes ((array!62845 0))(
  ( (array!62846 (arr!30261 (Array (_ BitVec 32) (_ BitVec 64))) (size!30765 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62845)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994322 (= res!664958 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994323 () Bool)

(declare-fun res!664956 () Bool)

(assert (=> b!994323 (=> (not res!664956) (not e!561131))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9218 0))(
  ( (MissingZero!9218 (index!39243 (_ BitVec 32))) (Found!9218 (index!39244 (_ BitVec 32))) (Intermediate!9218 (undefined!10030 Bool) (index!39245 (_ BitVec 32)) (x!86710 (_ BitVec 32))) (Undefined!9218) (MissingVacant!9218 (index!39246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62845 (_ BitVec 32)) SeekEntryResult!9218)

(assert (=> b!994323 (= res!664956 (not (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) (MissingVacant!9218 i!1194))))))

(declare-fun b!994324 () Bool)

(declare-fun res!664953 () Bool)

(assert (=> b!994324 (=> (not res!664953) (not e!561131))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994324 (= res!664953 (validKeyInArray!0 (select (arr!30261 a!3219) j!170)))))

(declare-fun b!994325 () Bool)

(declare-fun res!664957 () Bool)

(assert (=> b!994325 (=> (not res!664957) (not e!561131))))

(assert (=> b!994325 (= res!664957 (validKeyInArray!0 k0!2224))))

(declare-fun res!664955 () Bool)

(assert (=> start!85692 (=> (not res!664955) (not e!561131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85692 (= res!664955 (validMask!0 mask!3464))))

(assert (=> start!85692 e!561131))

(declare-fun array_inv!23404 (array!62845) Bool)

(assert (=> start!85692 (array_inv!23404 a!3219)))

(assert (=> start!85692 true))

(declare-fun b!994326 () Bool)

(declare-fun res!664954 () Bool)

(assert (=> b!994326 (=> (not res!664954) (not e!561131))))

(assert (=> b!994326 (= res!664954 (and (= (size!30765 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30765 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30765 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994327 () Bool)

(assert (=> b!994327 (= e!561131 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!85692 res!664955) b!994326))

(assert (= (and b!994326 res!664954) b!994324))

(assert (= (and b!994324 res!664953) b!994325))

(assert (= (and b!994325 res!664957) b!994322))

(assert (= (and b!994322 res!664958) b!994323))

(assert (= (and b!994323 res!664956) b!994327))

(declare-fun m!921379 () Bool)

(assert (=> b!994323 m!921379))

(declare-fun m!921381 () Bool)

(assert (=> b!994324 m!921381))

(assert (=> b!994324 m!921381))

(declare-fun m!921383 () Bool)

(assert (=> b!994324 m!921383))

(declare-fun m!921385 () Bool)

(assert (=> b!994325 m!921385))

(declare-fun m!921387 () Bool)

(assert (=> start!85692 m!921387))

(declare-fun m!921389 () Bool)

(assert (=> start!85692 m!921389))

(declare-fun m!921391 () Bool)

(assert (=> b!994322 m!921391))

(check-sat (not start!85692) (not b!994324) (not b!994323) (not b!994325) (not b!994322))
(check-sat)
