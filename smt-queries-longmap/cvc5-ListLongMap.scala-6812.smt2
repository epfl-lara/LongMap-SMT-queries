; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85690 () Bool)

(assert start!85690)

(declare-fun b!994305 () Bool)

(declare-fun res!664937 () Bool)

(declare-fun e!561124 () Bool)

(assert (=> b!994305 (=> (not res!664937) (not e!561124))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994305 (= res!664937 (validKeyInArray!0 k!2224))))

(declare-fun b!994306 () Bool)

(declare-fun res!664940 () Bool)

(assert (=> b!994306 (=> (not res!664940) (not e!561124))))

(declare-datatypes ((array!62843 0))(
  ( (array!62844 (arr!30260 (Array (_ BitVec 32) (_ BitVec 64))) (size!30764 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62843)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!994306 (= res!664940 (validKeyInArray!0 (select (arr!30260 a!3219) j!170)))))

(declare-fun b!994307 () Bool)

(declare-fun res!664938 () Bool)

(assert (=> b!994307 (=> (not res!664938) (not e!561124))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994307 (= res!664938 (and (= (size!30764 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30764 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30764 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!664939 () Bool)

(assert (=> start!85690 (=> (not res!664939) (not e!561124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85690 (= res!664939 (validMask!0 mask!3464))))

(assert (=> start!85690 e!561124))

(declare-fun array_inv!23403 (array!62843) Bool)

(assert (=> start!85690 (array_inv!23403 a!3219)))

(assert (=> start!85690 true))

(declare-fun b!994308 () Bool)

(declare-fun res!664936 () Bool)

(assert (=> b!994308 (=> (not res!664936) (not e!561124))))

(declare-fun arrayContainsKey!0 (array!62843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994308 (= res!664936 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994309 () Bool)

(assert (=> b!994309 (= e!561124 false)))

(declare-datatypes ((SeekEntryResult!9217 0))(
  ( (MissingZero!9217 (index!39239 (_ BitVec 32))) (Found!9217 (index!39240 (_ BitVec 32))) (Intermediate!9217 (undefined!10029 Bool) (index!39241 (_ BitVec 32)) (x!86701 (_ BitVec 32))) (Undefined!9217) (MissingVacant!9217 (index!39242 (_ BitVec 32))) )
))
(declare-fun lt!440491 () SeekEntryResult!9217)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62843 (_ BitVec 32)) SeekEntryResult!9217)

(assert (=> b!994309 (= lt!440491 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85690 res!664939) b!994307))

(assert (= (and b!994307 res!664938) b!994306))

(assert (= (and b!994306 res!664940) b!994305))

(assert (= (and b!994305 res!664937) b!994308))

(assert (= (and b!994308 res!664936) b!994309))

(declare-fun m!921365 () Bool)

(assert (=> start!85690 m!921365))

(declare-fun m!921367 () Bool)

(assert (=> start!85690 m!921367))

(declare-fun m!921369 () Bool)

(assert (=> b!994309 m!921369))

(declare-fun m!921371 () Bool)

(assert (=> b!994306 m!921371))

(assert (=> b!994306 m!921371))

(declare-fun m!921373 () Bool)

(assert (=> b!994306 m!921373))

(declare-fun m!921375 () Bool)

(assert (=> b!994308 m!921375))

(declare-fun m!921377 () Bool)

(assert (=> b!994305 m!921377))

(push 1)

(assert (not b!994309))

(assert (not start!85690))

(assert (not b!994308))

(assert (not b!994305))

(assert (not b!994306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

