; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85744 () Bool)

(assert start!85744)

(declare-fun b!994887 () Bool)

(declare-fun res!665398 () Bool)

(declare-fun e!561399 () Bool)

(assert (=> b!994887 (=> (not res!665398) (not e!561399))))

(declare-datatypes ((array!62950 0))(
  ( (array!62951 (arr!30314 (Array (_ BitVec 32) (_ BitVec 64))) (size!30816 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62950)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62950 (_ BitVec 32)) Bool)

(assert (=> b!994887 (= res!665398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!994888 () Bool)

(declare-fun res!665395 () Bool)

(declare-fun e!561400 () Bool)

(assert (=> b!994888 (=> (not res!665395) (not e!561400))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994888 (= res!665395 (and (= (size!30816 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30816 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30816 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994889 () Bool)

(assert (=> b!994889 (= e!561399 (bvsgt #b00000000000000000000000000000000 (size!30816 a!3219)))))

(declare-fun b!994890 () Bool)

(assert (=> b!994890 (= e!561400 e!561399)))

(declare-fun res!665397 () Bool)

(assert (=> b!994890 (=> (not res!665397) (not e!561399))))

(declare-datatypes ((SeekEntryResult!9246 0))(
  ( (MissingZero!9246 (index!39355 (_ BitVec 32))) (Found!9246 (index!39356 (_ BitVec 32))) (Intermediate!9246 (undefined!10058 Bool) (index!39357 (_ BitVec 32)) (x!86799 (_ BitVec 32))) (Undefined!9246) (MissingVacant!9246 (index!39358 (_ BitVec 32))) )
))
(declare-fun lt!440783 () SeekEntryResult!9246)

(assert (=> b!994890 (= res!665397 (or (= lt!440783 (MissingVacant!9246 i!1194)) (= lt!440783 (MissingZero!9246 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62950 (_ BitVec 32)) SeekEntryResult!9246)

(assert (=> b!994890 (= lt!440783 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!665394 () Bool)

(assert (=> start!85744 (=> (not res!665394) (not e!561400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85744 (= res!665394 (validMask!0 mask!3464))))

(assert (=> start!85744 e!561400))

(declare-fun array_inv!23438 (array!62950) Bool)

(assert (=> start!85744 (array_inv!23438 a!3219)))

(assert (=> start!85744 true))

(declare-fun b!994891 () Bool)

(declare-fun res!665396 () Bool)

(assert (=> b!994891 (=> (not res!665396) (not e!561400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994891 (= res!665396 (validKeyInArray!0 k0!2224))))

(declare-fun b!994892 () Bool)

(declare-fun res!665400 () Bool)

(assert (=> b!994892 (=> (not res!665400) (not e!561400))))

(assert (=> b!994892 (= res!665400 (validKeyInArray!0 (select (arr!30314 a!3219) j!170)))))

(declare-fun b!994893 () Bool)

(declare-fun res!665399 () Bool)

(assert (=> b!994893 (=> (not res!665399) (not e!561400))))

(declare-fun arrayContainsKey!0 (array!62950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994893 (= res!665399 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85744 res!665394) b!994888))

(assert (= (and b!994888 res!665395) b!994892))

(assert (= (and b!994892 res!665400) b!994891))

(assert (= (and b!994891 res!665396) b!994893))

(assert (= (and b!994893 res!665399) b!994890))

(assert (= (and b!994890 res!665397) b!994887))

(assert (= (and b!994887 res!665398) b!994889))

(declare-fun m!922419 () Bool)

(assert (=> start!85744 m!922419))

(declare-fun m!922421 () Bool)

(assert (=> start!85744 m!922421))

(declare-fun m!922423 () Bool)

(assert (=> b!994890 m!922423))

(declare-fun m!922425 () Bool)

(assert (=> b!994893 m!922425))

(declare-fun m!922427 () Bool)

(assert (=> b!994892 m!922427))

(assert (=> b!994892 m!922427))

(declare-fun m!922429 () Bool)

(assert (=> b!994892 m!922429))

(declare-fun m!922431 () Bool)

(assert (=> b!994887 m!922431))

(declare-fun m!922433 () Bool)

(assert (=> b!994891 m!922433))

(check-sat (not b!994891) (not start!85744) (not b!994887) (not b!994892) (not b!994890) (not b!994893))
(check-sat)
