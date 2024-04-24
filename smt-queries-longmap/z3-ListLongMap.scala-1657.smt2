; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30762 () Bool)

(assert start!30762)

(declare-fun b!308797 () Bool)

(declare-fun res!165465 () Bool)

(declare-fun e!193018 () Bool)

(assert (=> b!308797 (=> (not res!165465) (not e!193018))))

(declare-datatypes ((array!15728 0))(
  ( (array!15729 (arr!7447 (Array (_ BitVec 32) (_ BitVec 64))) (size!7799 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15728)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308797 (= res!165465 (and (= (select (arr!7447 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7799 a!3293))))))

(declare-fun b!308798 () Bool)

(declare-fun res!165466 () Bool)

(declare-fun e!193017 () Bool)

(assert (=> b!308798 (=> (not res!165466) (not e!193017))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308798 (= res!165466 (validKeyInArray!0 k0!2441))))

(declare-fun b!308799 () Bool)

(assert (=> b!308799 (= e!193017 e!193018)))

(declare-fun res!165462 () Bool)

(assert (=> b!308799 (=> (not res!165462) (not e!193018))))

(declare-datatypes ((SeekEntryResult!2552 0))(
  ( (MissingZero!2552 (index!12384 (_ BitVec 32))) (Found!2552 (index!12385 (_ BitVec 32))) (Intermediate!2552 (undefined!3364 Bool) (index!12386 (_ BitVec 32)) (x!30729 (_ BitVec 32))) (Undefined!2552) (MissingVacant!2552 (index!12387 (_ BitVec 32))) )
))
(declare-fun lt!151476 () SeekEntryResult!2552)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15728 (_ BitVec 32)) SeekEntryResult!2552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308799 (= res!165462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151476))))

(assert (=> b!308799 (= lt!151476 (Intermediate!2552 false resIndex!52 resX!52))))

(declare-fun res!165463 () Bool)

(assert (=> start!30762 (=> (not res!165463) (not e!193017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30762 (= res!165463 (validMask!0 mask!3709))))

(assert (=> start!30762 e!193017))

(declare-fun array_inv!5397 (array!15728) Bool)

(assert (=> start!30762 (array_inv!5397 a!3293)))

(assert (=> start!30762 true))

(declare-fun b!308800 () Bool)

(declare-fun e!193019 () Bool)

(assert (=> b!308800 (= e!193018 e!193019)))

(declare-fun res!165467 () Bool)

(assert (=> b!308800 (=> (not res!165467) (not e!193019))))

(declare-fun lt!151475 () SeekEntryResult!2552)

(assert (=> b!308800 (= res!165467 (and (= lt!151475 lt!151476) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7447 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308800 (= lt!151475 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308801 () Bool)

(declare-fun res!165461 () Bool)

(assert (=> b!308801 (=> (not res!165461) (not e!193017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15728 (_ BitVec 32)) Bool)

(assert (=> b!308801 (= res!165461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308802 () Bool)

(declare-fun res!165460 () Bool)

(assert (=> b!308802 (=> (not res!165460) (not e!193017))))

(assert (=> b!308802 (= res!165460 (and (= (size!7799 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7799 a!3293))))))

(declare-fun b!308803 () Bool)

(declare-fun res!165464 () Bool)

(assert (=> b!308803 (=> (not res!165464) (not e!193017))))

(declare-fun arrayContainsKey!0 (array!15728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308803 (= res!165464 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308804 () Bool)

(assert (=> b!308804 (= e!193019 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308804 (= lt!151475 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308805 () Bool)

(declare-fun res!165468 () Bool)

(assert (=> b!308805 (=> (not res!165468) (not e!193017))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15728 (_ BitVec 32)) SeekEntryResult!2552)

(assert (=> b!308805 (= res!165468 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2552 i!1240)))))

(assert (= (and start!30762 res!165463) b!308802))

(assert (= (and b!308802 res!165460) b!308798))

(assert (= (and b!308798 res!165466) b!308803))

(assert (= (and b!308803 res!165464) b!308805))

(assert (= (and b!308805 res!165468) b!308801))

(assert (= (and b!308801 res!165461) b!308799))

(assert (= (and b!308799 res!165462) b!308797))

(assert (= (and b!308797 res!165465) b!308800))

(assert (= (and b!308800 res!165467) b!308804))

(declare-fun m!319003 () Bool)

(assert (=> b!308804 m!319003))

(assert (=> b!308804 m!319003))

(declare-fun m!319005 () Bool)

(assert (=> b!308804 m!319005))

(declare-fun m!319007 () Bool)

(assert (=> b!308805 m!319007))

(declare-fun m!319009 () Bool)

(assert (=> b!308798 m!319009))

(declare-fun m!319011 () Bool)

(assert (=> start!30762 m!319011))

(declare-fun m!319013 () Bool)

(assert (=> start!30762 m!319013))

(declare-fun m!319015 () Bool)

(assert (=> b!308799 m!319015))

(assert (=> b!308799 m!319015))

(declare-fun m!319017 () Bool)

(assert (=> b!308799 m!319017))

(declare-fun m!319019 () Bool)

(assert (=> b!308800 m!319019))

(declare-fun m!319021 () Bool)

(assert (=> b!308800 m!319021))

(declare-fun m!319023 () Bool)

(assert (=> b!308801 m!319023))

(declare-fun m!319025 () Bool)

(assert (=> b!308803 m!319025))

(declare-fun m!319027 () Bool)

(assert (=> b!308797 m!319027))

(check-sat (not b!308803) (not start!30762) (not b!308800) (not b!308804) (not b!308798) (not b!308805) (not b!308801) (not b!308799))
(check-sat)
