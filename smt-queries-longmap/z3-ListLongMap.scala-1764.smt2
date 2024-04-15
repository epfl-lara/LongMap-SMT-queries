; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32216 () Bool)

(assert start!32216)

(declare-fun b!320698 () Bool)

(declare-fun e!198857 () Bool)

(declare-fun e!198855 () Bool)

(assert (=> b!320698 (= e!198857 e!198855)))

(declare-fun res!174971 () Bool)

(assert (=> b!320698 (=> (not res!174971) (not e!198855))))

(declare-datatypes ((array!16410 0))(
  ( (array!16411 (arr!7764 (Array (_ BitVec 32) (_ BitVec 64))) (size!8117 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16410)

(declare-datatypes ((SeekEntryResult!2894 0))(
  ( (MissingZero!2894 (index!13752 (_ BitVec 32))) (Found!2894 (index!13753 (_ BitVec 32))) (Intermediate!2894 (undefined!3706 Bool) (index!13754 (_ BitVec 32)) (x!32036 (_ BitVec 32))) (Undefined!2894) (MissingVacant!2894 (index!13755 (_ BitVec 32))) )
))
(declare-fun lt!155906 () SeekEntryResult!2894)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16410 (_ BitVec 32)) SeekEntryResult!2894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320698 (= res!174971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155906))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320698 (= lt!155906 (Intermediate!2894 false resIndex!58 resX!58))))

(declare-fun b!320699 () Bool)

(declare-fun res!174972 () Bool)

(assert (=> b!320699 (=> (not res!174972) (not e!198857))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320699 (= res!174972 (and (= (size!8117 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8117 a!3305))))))

(declare-fun b!320700 () Bool)

(declare-fun res!174967 () Bool)

(assert (=> b!320700 (=> (not res!174967) (not e!198855))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!320700 (= res!174967 (and (= (select (arr!7764 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8117 a!3305))))))

(declare-fun b!320701 () Bool)

(declare-fun res!174970 () Bool)

(assert (=> b!320701 (=> (not res!174970) (not e!198857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16410 (_ BitVec 32)) Bool)

(assert (=> b!320701 (= res!174970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320702 () Bool)

(declare-fun res!174964 () Bool)

(assert (=> b!320702 (=> (not res!174964) (not e!198857))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16410 (_ BitVec 32)) SeekEntryResult!2894)

(assert (=> b!320702 (= res!174964 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2894 i!1250)))))

(declare-fun b!320703 () Bool)

(declare-fun res!174965 () Bool)

(assert (=> b!320703 (=> (not res!174965) (not e!198857))))

(declare-fun arrayContainsKey!0 (array!16410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320703 (= res!174965 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320705 () Bool)

(declare-fun res!174969 () Bool)

(assert (=> b!320705 (=> (not res!174969) (not e!198857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320705 (= res!174969 (validKeyInArray!0 k0!2497))))

(declare-fun b!320706 () Bool)

(declare-fun res!174968 () Bool)

(assert (=> b!320706 (=> (not res!174968) (not e!198855))))

(assert (=> b!320706 (= res!174968 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!155906))))

(declare-fun res!174966 () Bool)

(assert (=> start!32216 (=> (not res!174966) (not e!198857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32216 (= res!174966 (validMask!0 mask!3777))))

(assert (=> start!32216 e!198857))

(declare-fun array_inv!5736 (array!16410) Bool)

(assert (=> start!32216 (array_inv!5736 a!3305)))

(assert (=> start!32216 true))

(declare-fun b!320704 () Bool)

(assert (=> b!320704 (= e!198855 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7764 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7764 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7764 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(assert (= (and start!32216 res!174966) b!320699))

(assert (= (and b!320699 res!174972) b!320705))

(assert (= (and b!320705 res!174969) b!320703))

(assert (= (and b!320703 res!174965) b!320702))

(assert (= (and b!320702 res!174964) b!320701))

(assert (= (and b!320701 res!174970) b!320698))

(assert (= (and b!320698 res!174971) b!320700))

(assert (= (and b!320700 res!174967) b!320706))

(assert (= (and b!320706 res!174968) b!320704))

(declare-fun m!328471 () Bool)

(assert (=> b!320704 m!328471))

(declare-fun m!328473 () Bool)

(assert (=> b!320702 m!328473))

(declare-fun m!328475 () Bool)

(assert (=> b!320706 m!328475))

(declare-fun m!328477 () Bool)

(assert (=> b!320703 m!328477))

(declare-fun m!328479 () Bool)

(assert (=> b!320700 m!328479))

(declare-fun m!328481 () Bool)

(assert (=> b!320701 m!328481))

(declare-fun m!328483 () Bool)

(assert (=> b!320698 m!328483))

(assert (=> b!320698 m!328483))

(declare-fun m!328485 () Bool)

(assert (=> b!320698 m!328485))

(declare-fun m!328487 () Bool)

(assert (=> b!320705 m!328487))

(declare-fun m!328489 () Bool)

(assert (=> start!32216 m!328489))

(declare-fun m!328491 () Bool)

(assert (=> start!32216 m!328491))

(check-sat (not start!32216) (not b!320702) (not b!320698) (not b!320706) (not b!320705) (not b!320701) (not b!320703))
(check-sat)
