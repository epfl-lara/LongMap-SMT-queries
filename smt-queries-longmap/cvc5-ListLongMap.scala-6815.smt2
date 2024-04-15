; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85708 () Bool)

(assert start!85708)

(declare-fun b!994449 () Bool)

(declare-fun e!561179 () Bool)

(assert (=> b!994449 (= e!561179 false)))

(declare-datatypes ((array!62861 0))(
  ( (array!62862 (arr!30269 (Array (_ BitVec 32) (_ BitVec 64))) (size!30773 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62861)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9226 0))(
  ( (MissingZero!9226 (index!39275 (_ BitVec 32))) (Found!9226 (index!39276 (_ BitVec 32))) (Intermediate!9226 (undefined!10038 Bool) (index!39277 (_ BitVec 32)) (x!86734 (_ BitVec 32))) (Undefined!9226) (MissingVacant!9226 (index!39278 (_ BitVec 32))) )
))
(declare-fun lt!440509 () SeekEntryResult!9226)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62861 (_ BitVec 32)) SeekEntryResult!9226)

(assert (=> b!994449 (= lt!440509 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994450 () Bool)

(declare-fun res!665084 () Bool)

(assert (=> b!994450 (=> (not res!665084) (not e!561179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994450 (= res!665084 (validKeyInArray!0 k!2224))))

(declare-fun b!994451 () Bool)

(declare-fun res!665081 () Bool)

(assert (=> b!994451 (=> (not res!665081) (not e!561179))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994451 (= res!665081 (validKeyInArray!0 (select (arr!30269 a!3219) j!170)))))

(declare-fun b!994452 () Bool)

(declare-fun res!665082 () Bool)

(assert (=> b!994452 (=> (not res!665082) (not e!561179))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994452 (= res!665082 (and (= (size!30773 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30773 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30773 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994453 () Bool)

(declare-fun res!665083 () Bool)

(assert (=> b!994453 (=> (not res!665083) (not e!561179))))

(declare-fun arrayContainsKey!0 (array!62861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994453 (= res!665083 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!665080 () Bool)

(assert (=> start!85708 (=> (not res!665080) (not e!561179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85708 (= res!665080 (validMask!0 mask!3464))))

(assert (=> start!85708 e!561179))

(declare-fun array_inv!23412 (array!62861) Bool)

(assert (=> start!85708 (array_inv!23412 a!3219)))

(assert (=> start!85708 true))

(assert (= (and start!85708 res!665080) b!994452))

(assert (= (and b!994452 res!665082) b!994451))

(assert (= (and b!994451 res!665081) b!994450))

(assert (= (and b!994450 res!665084) b!994453))

(assert (= (and b!994453 res!665083) b!994449))

(declare-fun m!921491 () Bool)

(assert (=> start!85708 m!921491))

(declare-fun m!921493 () Bool)

(assert (=> start!85708 m!921493))

(declare-fun m!921495 () Bool)

(assert (=> b!994450 m!921495))

(declare-fun m!921497 () Bool)

(assert (=> b!994449 m!921497))

(declare-fun m!921499 () Bool)

(assert (=> b!994453 m!921499))

(declare-fun m!921501 () Bool)

(assert (=> b!994451 m!921501))

(assert (=> b!994451 m!921501))

(declare-fun m!921503 () Bool)

(assert (=> b!994451 m!921503))

(push 1)

(assert (not b!994450))

(assert (not start!85708))

(assert (not b!994451))

(assert (not b!994453))

(assert (not b!994449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

