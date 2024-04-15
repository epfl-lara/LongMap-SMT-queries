; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48378 () Bool)

(assert start!48378)

(declare-fun b!531448 () Bool)

(declare-fun res!327083 () Bool)

(declare-fun e!309525 () Bool)

(assert (=> b!531448 (=> (not res!327083) (not e!309525))))

(declare-datatypes ((array!33696 0))(
  ( (array!33697 (arr!16190 (Array (_ BitVec 32) (_ BitVec 64))) (size!16555 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33696)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531448 (= res!327083 (validKeyInArray!0 (select (arr!16190 a!3154) j!147)))))

(declare-fun b!531449 () Bool)

(declare-fun res!327085 () Bool)

(assert (=> b!531449 (=> (not res!327085) (not e!309525))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531449 (= res!327085 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531450 () Bool)

(declare-fun res!327080 () Bool)

(assert (=> b!531450 (=> (not res!327080) (not e!309525))))

(assert (=> b!531450 (= res!327080 (validKeyInArray!0 k0!1998))))

(declare-fun b!531451 () Bool)

(declare-fun res!327082 () Bool)

(assert (=> b!531451 (=> (not res!327082) (not e!309525))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531451 (= res!327082 (and (= (size!16555 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16555 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16555 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531452 () Bool)

(declare-fun e!309523 () Bool)

(assert (=> b!531452 (= e!309523 false)))

(declare-fun lt!244828 () Bool)

(declare-datatypes ((List!10348 0))(
  ( (Nil!10345) (Cons!10344 (h!11284 (_ BitVec 64)) (t!16567 List!10348)) )
))
(declare-fun arrayNoDuplicates!0 (array!33696 (_ BitVec 32) List!10348) Bool)

(assert (=> b!531452 (= lt!244828 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10345))))

(declare-fun res!327084 () Bool)

(assert (=> start!48378 (=> (not res!327084) (not e!309525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48378 (= res!327084 (validMask!0 mask!3216))))

(assert (=> start!48378 e!309525))

(assert (=> start!48378 true))

(declare-fun array_inv!12073 (array!33696) Bool)

(assert (=> start!48378 (array_inv!12073 a!3154)))

(declare-fun b!531453 () Bool)

(declare-fun res!327081 () Bool)

(assert (=> b!531453 (=> (not res!327081) (not e!309523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33696 (_ BitVec 32)) Bool)

(assert (=> b!531453 (= res!327081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531454 () Bool)

(assert (=> b!531454 (= e!309525 e!309523)))

(declare-fun res!327086 () Bool)

(assert (=> b!531454 (=> (not res!327086) (not e!309523))))

(declare-datatypes ((SeekEntryResult!4645 0))(
  ( (MissingZero!4645 (index!20804 (_ BitVec 32))) (Found!4645 (index!20805 (_ BitVec 32))) (Intermediate!4645 (undefined!5457 Bool) (index!20806 (_ BitVec 32)) (x!49790 (_ BitVec 32))) (Undefined!4645) (MissingVacant!4645 (index!20807 (_ BitVec 32))) )
))
(declare-fun lt!244827 () SeekEntryResult!4645)

(assert (=> b!531454 (= res!327086 (or (= lt!244827 (MissingZero!4645 i!1153)) (= lt!244827 (MissingVacant!4645 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33696 (_ BitVec 32)) SeekEntryResult!4645)

(assert (=> b!531454 (= lt!244827 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48378 res!327084) b!531451))

(assert (= (and b!531451 res!327082) b!531448))

(assert (= (and b!531448 res!327083) b!531450))

(assert (= (and b!531450 res!327080) b!531449))

(assert (= (and b!531449 res!327085) b!531454))

(assert (= (and b!531454 res!327086) b!531453))

(assert (= (and b!531453 res!327081) b!531452))

(declare-fun m!511333 () Bool)

(assert (=> b!531448 m!511333))

(assert (=> b!531448 m!511333))

(declare-fun m!511335 () Bool)

(assert (=> b!531448 m!511335))

(declare-fun m!511337 () Bool)

(assert (=> b!531454 m!511337))

(declare-fun m!511339 () Bool)

(assert (=> b!531450 m!511339))

(declare-fun m!511341 () Bool)

(assert (=> b!531453 m!511341))

(declare-fun m!511343 () Bool)

(assert (=> b!531452 m!511343))

(declare-fun m!511345 () Bool)

(assert (=> start!48378 m!511345))

(declare-fun m!511347 () Bool)

(assert (=> start!48378 m!511347))

(declare-fun m!511349 () Bool)

(assert (=> b!531449 m!511349))

(check-sat (not b!531453) (not b!531449) (not b!531454) (not b!531450) (not start!48378) (not b!531452) (not b!531448))
(check-sat)
