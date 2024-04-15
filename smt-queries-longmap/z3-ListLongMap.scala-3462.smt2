; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48090 () Bool)

(assert start!48090)

(declare-fun b!529371 () Bool)

(declare-fun res!325229 () Bool)

(declare-fun e!308454 () Bool)

(assert (=> b!529371 (=> (not res!325229) (not e!308454))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33536 0))(
  ( (array!33537 (arr!16115 (Array (_ BitVec 32) (_ BitVec 64))) (size!16480 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33536)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529371 (= res!325229 (and (= (size!16480 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16480 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16480 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529373 () Bool)

(declare-fun res!325221 () Bool)

(assert (=> b!529373 (=> (not res!325221) (not e!308454))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529373 (= res!325221 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529374 () Bool)

(declare-fun res!325226 () Bool)

(declare-fun e!308457 () Bool)

(assert (=> b!529374 (=> (not res!325226) (not e!308457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33536 (_ BitVec 32)) Bool)

(assert (=> b!529374 (= res!325226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529375 () Bool)

(declare-fun res!325224 () Bool)

(assert (=> b!529375 (=> (not res!325224) (not e!308454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529375 (= res!325224 (validKeyInArray!0 (select (arr!16115 a!3235) j!176)))))

(declare-fun b!529376 () Bool)

(declare-fun res!325222 () Bool)

(assert (=> b!529376 (=> (not res!325222) (not e!308454))))

(assert (=> b!529376 (= res!325222 (validKeyInArray!0 k0!2280))))

(declare-fun b!529377 () Bool)

(declare-fun e!308456 () Bool)

(assert (=> b!529377 (= e!308457 (not e!308456))))

(declare-fun res!325225 () Bool)

(assert (=> b!529377 (=> res!325225 e!308456)))

(declare-datatypes ((SeekEntryResult!4579 0))(
  ( (MissingZero!4579 (index!20540 (_ BitVec 32))) (Found!4579 (index!20541 (_ BitVec 32))) (Intermediate!4579 (undefined!5391 Bool) (index!20542 (_ BitVec 32)) (x!49524 (_ BitVec 32))) (Undefined!4579) (MissingVacant!4579 (index!20543 (_ BitVec 32))) )
))
(declare-fun lt!243946 () SeekEntryResult!4579)

(declare-fun lt!243942 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33536 (_ BitVec 32)) SeekEntryResult!4579)

(assert (=> b!529377 (= res!325225 (= lt!243946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243942 (select (store (arr!16115 a!3235) i!1204 k0!2280) j!176) (array!33537 (store (arr!16115 a!3235) i!1204 k0!2280) (size!16480 a!3235)) mask!3524)))))

(declare-fun lt!243944 () (_ BitVec 32))

(assert (=> b!529377 (= lt!243946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243944 (select (arr!16115 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529377 (= lt!243942 (toIndex!0 (select (store (arr!16115 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529377 (= lt!243944 (toIndex!0 (select (arr!16115 a!3235) j!176) mask!3524))))

(declare-fun e!308455 () Bool)

(assert (=> b!529377 e!308455))

(declare-fun res!325219 () Bool)

(assert (=> b!529377 (=> (not res!325219) (not e!308455))))

(assert (=> b!529377 (= res!325219 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16756 0))(
  ( (Unit!16757) )
))
(declare-fun lt!243941 () Unit!16756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16756)

(assert (=> b!529377 (= lt!243941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!325220 () Bool)

(assert (=> start!48090 (=> (not res!325220) (not e!308454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48090 (= res!325220 (validMask!0 mask!3524))))

(assert (=> start!48090 e!308454))

(assert (=> start!48090 true))

(declare-fun array_inv!11998 (array!33536) Bool)

(assert (=> start!48090 (array_inv!11998 a!3235)))

(declare-fun b!529372 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33536 (_ BitVec 32)) SeekEntryResult!4579)

(assert (=> b!529372 (= e!308455 (= (seekEntryOrOpen!0 (select (arr!16115 a!3235) j!176) a!3235 mask!3524) (Found!4579 j!176)))))

(declare-fun b!529378 () Bool)

(declare-fun res!325227 () Bool)

(assert (=> b!529378 (=> (not res!325227) (not e!308457))))

(declare-datatypes ((List!10312 0))(
  ( (Nil!10309) (Cons!10308 (h!11248 (_ BitVec 64)) (t!16531 List!10312)) )
))
(declare-fun arrayNoDuplicates!0 (array!33536 (_ BitVec 32) List!10312) Bool)

(assert (=> b!529378 (= res!325227 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10309))))

(declare-fun b!529379 () Bool)

(declare-fun e!308452 () Bool)

(assert (=> b!529379 (= e!308452 true)))

(assert (=> b!529379 false))

(declare-fun b!529380 () Bool)

(assert (=> b!529380 (= e!308454 e!308457)))

(declare-fun res!325223 () Bool)

(assert (=> b!529380 (=> (not res!325223) (not e!308457))))

(declare-fun lt!243945 () SeekEntryResult!4579)

(assert (=> b!529380 (= res!325223 (or (= lt!243945 (MissingZero!4579 i!1204)) (= lt!243945 (MissingVacant!4579 i!1204))))))

(assert (=> b!529380 (= lt!243945 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529381 () Bool)

(assert (=> b!529381 (= e!308456 e!308452)))

(declare-fun res!325228 () Bool)

(assert (=> b!529381 (=> res!325228 e!308452)))

(declare-fun lt!243943 () Bool)

(assert (=> b!529381 (= res!325228 (or (and (not lt!243943) (undefined!5391 lt!243946)) (and (not lt!243943) (not (undefined!5391 lt!243946)))))))

(get-info :version)

(assert (=> b!529381 (= lt!243943 (not ((_ is Intermediate!4579) lt!243946)))))

(assert (= (and start!48090 res!325220) b!529371))

(assert (= (and b!529371 res!325229) b!529375))

(assert (= (and b!529375 res!325224) b!529376))

(assert (= (and b!529376 res!325222) b!529373))

(assert (= (and b!529373 res!325221) b!529380))

(assert (= (and b!529380 res!325223) b!529374))

(assert (= (and b!529374 res!325226) b!529378))

(assert (= (and b!529378 res!325227) b!529377))

(assert (= (and b!529377 res!325219) b!529372))

(assert (= (and b!529377 (not res!325225)) b!529381))

(assert (= (and b!529381 (not res!325228)) b!529379))

(declare-fun m!509365 () Bool)

(assert (=> b!529380 m!509365))

(declare-fun m!509367 () Bool)

(assert (=> start!48090 m!509367))

(declare-fun m!509369 () Bool)

(assert (=> start!48090 m!509369))

(declare-fun m!509371 () Bool)

(assert (=> b!529372 m!509371))

(assert (=> b!529372 m!509371))

(declare-fun m!509373 () Bool)

(assert (=> b!529372 m!509373))

(declare-fun m!509375 () Bool)

(assert (=> b!529376 m!509375))

(assert (=> b!529375 m!509371))

(assert (=> b!529375 m!509371))

(declare-fun m!509377 () Bool)

(assert (=> b!529375 m!509377))

(declare-fun m!509379 () Bool)

(assert (=> b!529378 m!509379))

(declare-fun m!509381 () Bool)

(assert (=> b!529374 m!509381))

(declare-fun m!509383 () Bool)

(assert (=> b!529373 m!509383))

(declare-fun m!509385 () Bool)

(assert (=> b!529377 m!509385))

(declare-fun m!509387 () Bool)

(assert (=> b!529377 m!509387))

(declare-fun m!509389 () Bool)

(assert (=> b!529377 m!509389))

(assert (=> b!529377 m!509389))

(declare-fun m!509391 () Bool)

(assert (=> b!529377 m!509391))

(assert (=> b!529377 m!509371))

(declare-fun m!509393 () Bool)

(assert (=> b!529377 m!509393))

(assert (=> b!529377 m!509371))

(declare-fun m!509395 () Bool)

(assert (=> b!529377 m!509395))

(assert (=> b!529377 m!509371))

(declare-fun m!509397 () Bool)

(assert (=> b!529377 m!509397))

(assert (=> b!529377 m!509389))

(declare-fun m!509399 () Bool)

(assert (=> b!529377 m!509399))

(check-sat (not b!529380) (not start!48090) (not b!529376) (not b!529373) (not b!529372) (not b!529378) (not b!529377) (not b!529375) (not b!529374))
(check-sat)
