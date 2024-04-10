; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45650 () Bool)

(assert start!45650)

(declare-fun b!503503 () Bool)

(declare-fun e!294861 () Bool)

(declare-fun e!294863 () Bool)

(assert (=> b!503503 (= e!294861 (not e!294863))))

(declare-fun res!304794 () Bool)

(assert (=> b!503503 (=> res!304794 e!294863)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229065 () (_ BitVec 64))

(declare-datatypes ((array!32406 0))(
  ( (array!32407 (arr!15583 (Array (_ BitVec 32) (_ BitVec 64))) (size!15947 (_ BitVec 32))) )
))
(declare-fun lt!229074 () array!32406)

(declare-datatypes ((SeekEntryResult!4050 0))(
  ( (MissingZero!4050 (index!18388 (_ BitVec 32))) (Found!4050 (index!18389 (_ BitVec 32))) (Intermediate!4050 (undefined!4862 Bool) (index!18390 (_ BitVec 32)) (x!47411 (_ BitVec 32))) (Undefined!4050) (MissingVacant!4050 (index!18391 (_ BitVec 32))) )
))
(declare-fun lt!229068 () SeekEntryResult!4050)

(declare-fun lt!229066 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32406 (_ BitVec 32)) SeekEntryResult!4050)

(assert (=> b!503503 (= res!304794 (= lt!229068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229066 lt!229065 lt!229074 mask!3524)))))

(declare-fun a!3235 () array!32406)

(declare-fun lt!229072 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503503 (= lt!229068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229072 (select (arr!15583 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503503 (= lt!229066 (toIndex!0 lt!229065 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503503 (= lt!229065 (select (store (arr!15583 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503503 (= lt!229072 (toIndex!0 (select (arr!15583 a!3235) j!176) mask!3524))))

(assert (=> b!503503 (= lt!229074 (array!32407 (store (arr!15583 a!3235) i!1204 k0!2280) (size!15947 a!3235)))))

(declare-fun e!294858 () Bool)

(assert (=> b!503503 e!294858))

(declare-fun res!304797 () Bool)

(assert (=> b!503503 (=> (not res!304797) (not e!294858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32406 (_ BitVec 32)) Bool)

(assert (=> b!503503 (= res!304797 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15276 0))(
  ( (Unit!15277) )
))
(declare-fun lt!229069 () Unit!15276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15276)

(assert (=> b!503503 (= lt!229069 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503504 () Bool)

(declare-fun res!304800 () Bool)

(declare-fun e!294862 () Bool)

(assert (=> b!503504 (=> (not res!304800) (not e!294862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503504 (= res!304800 (validKeyInArray!0 k0!2280))))

(declare-fun b!503505 () Bool)

(declare-fun e!294864 () Unit!15276)

(declare-fun Unit!15278 () Unit!15276)

(assert (=> b!503505 (= e!294864 Unit!15278)))

(declare-fun b!503506 () Bool)

(declare-fun res!304805 () Bool)

(assert (=> b!503506 (=> (not res!304805) (not e!294861))))

(assert (=> b!503506 (= res!304805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!304799 () Bool)

(assert (=> start!45650 (=> (not res!304799) (not e!294862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45650 (= res!304799 (validMask!0 mask!3524))))

(assert (=> start!45650 e!294862))

(assert (=> start!45650 true))

(declare-fun array_inv!11379 (array!32406) Bool)

(assert (=> start!45650 (array_inv!11379 a!3235)))

(declare-fun b!503507 () Bool)

(declare-fun res!304803 () Bool)

(assert (=> b!503507 (=> res!304803 e!294863)))

(get-info :version)

(assert (=> b!503507 (= res!304803 (or (undefined!4862 lt!229068) (not ((_ is Intermediate!4050) lt!229068))))))

(declare-fun b!503508 () Bool)

(declare-fun e!294856 () Bool)

(assert (=> b!503508 (= e!294856 true)))

(declare-fun lt!229070 () SeekEntryResult!4050)

(assert (=> b!503508 (= lt!229070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229072 lt!229065 lt!229074 mask!3524))))

(declare-fun b!503509 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32406 (_ BitVec 32)) SeekEntryResult!4050)

(assert (=> b!503509 (= e!294858 (= (seekEntryOrOpen!0 (select (arr!15583 a!3235) j!176) a!3235 mask!3524) (Found!4050 j!176)))))

(declare-fun b!503510 () Bool)

(declare-fun res!304804 () Bool)

(assert (=> b!503510 (=> (not res!304804) (not e!294862))))

(assert (=> b!503510 (= res!304804 (and (= (size!15947 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15947 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15947 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503511 () Bool)

(declare-fun e!294859 () Bool)

(assert (=> b!503511 (= e!294859 false)))

(declare-fun b!503512 () Bool)

(declare-fun res!304801 () Bool)

(assert (=> b!503512 (=> (not res!304801) (not e!294861))))

(declare-datatypes ((List!9741 0))(
  ( (Nil!9738) (Cons!9737 (h!10614 (_ BitVec 64)) (t!15969 List!9741)) )
))
(declare-fun arrayNoDuplicates!0 (array!32406 (_ BitVec 32) List!9741) Bool)

(assert (=> b!503512 (= res!304801 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9738))))

(declare-fun b!503513 () Bool)

(declare-fun e!294857 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32406 (_ BitVec 32)) SeekEntryResult!4050)

(assert (=> b!503513 (= e!294857 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229072 (index!18390 lt!229068) (select (arr!15583 a!3235) j!176) a!3235 mask!3524) (Found!4050 j!176))))))

(declare-fun b!503514 () Bool)

(declare-fun res!304798 () Bool)

(assert (=> b!503514 (=> (not res!304798) (not e!294862))))

(assert (=> b!503514 (= res!304798 (validKeyInArray!0 (select (arr!15583 a!3235) j!176)))))

(declare-fun b!503515 () Bool)

(assert (=> b!503515 (= e!294862 e!294861)))

(declare-fun res!304808 () Bool)

(assert (=> b!503515 (=> (not res!304808) (not e!294861))))

(declare-fun lt!229075 () SeekEntryResult!4050)

(assert (=> b!503515 (= res!304808 (or (= lt!229075 (MissingZero!4050 i!1204)) (= lt!229075 (MissingVacant!4050 i!1204))))))

(assert (=> b!503515 (= lt!229075 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503516 () Bool)

(assert (=> b!503516 (= e!294863 e!294856)))

(declare-fun res!304796 () Bool)

(assert (=> b!503516 (=> res!304796 e!294856)))

(assert (=> b!503516 (= res!304796 (or (bvsgt (x!47411 lt!229068) #b01111111111111111111111111111110) (bvslt lt!229072 #b00000000000000000000000000000000) (bvsge lt!229072 (size!15947 a!3235)) (bvslt (index!18390 lt!229068) #b00000000000000000000000000000000) (bvsge (index!18390 lt!229068) (size!15947 a!3235)) (not (= lt!229068 (Intermediate!4050 false (index!18390 lt!229068) (x!47411 lt!229068))))))))

(assert (=> b!503516 (= (index!18390 lt!229068) i!1204)))

(declare-fun lt!229073 () Unit!15276)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32406 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15276)

(assert (=> b!503516 (= lt!229073 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229072 #b00000000000000000000000000000000 (index!18390 lt!229068) (x!47411 lt!229068) mask!3524))))

(assert (=> b!503516 (and (or (= (select (arr!15583 a!3235) (index!18390 lt!229068)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15583 a!3235) (index!18390 lt!229068)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15583 a!3235) (index!18390 lt!229068)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15583 a!3235) (index!18390 lt!229068)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229071 () Unit!15276)

(assert (=> b!503516 (= lt!229071 e!294864)))

(declare-fun c!59633 () Bool)

(assert (=> b!503516 (= c!59633 (= (select (arr!15583 a!3235) (index!18390 lt!229068)) (select (arr!15583 a!3235) j!176)))))

(assert (=> b!503516 (and (bvslt (x!47411 lt!229068) #b01111111111111111111111111111110) (or (= (select (arr!15583 a!3235) (index!18390 lt!229068)) (select (arr!15583 a!3235) j!176)) (= (select (arr!15583 a!3235) (index!18390 lt!229068)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15583 a!3235) (index!18390 lt!229068)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503517 () Bool)

(declare-fun res!304806 () Bool)

(assert (=> b!503517 (=> (not res!304806) (not e!294862))))

(declare-fun arrayContainsKey!0 (array!32406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503517 (= res!304806 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503518 () Bool)

(declare-fun Unit!15279 () Unit!15276)

(assert (=> b!503518 (= e!294864 Unit!15279)))

(declare-fun lt!229067 () Unit!15276)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32406 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15276)

(assert (=> b!503518 (= lt!229067 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229072 #b00000000000000000000000000000000 (index!18390 lt!229068) (x!47411 lt!229068) mask!3524))))

(declare-fun res!304795 () Bool)

(assert (=> b!503518 (= res!304795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229072 lt!229065 lt!229074 mask!3524) (Intermediate!4050 false (index!18390 lt!229068) (x!47411 lt!229068))))))

(assert (=> b!503518 (=> (not res!304795) (not e!294859))))

(assert (=> b!503518 e!294859))

(declare-fun b!503519 () Bool)

(declare-fun res!304807 () Bool)

(assert (=> b!503519 (=> res!304807 e!294856)))

(assert (=> b!503519 (= res!304807 e!294857)))

(declare-fun res!304802 () Bool)

(assert (=> b!503519 (=> (not res!304802) (not e!294857))))

(assert (=> b!503519 (= res!304802 (bvsgt #b00000000000000000000000000000000 (x!47411 lt!229068)))))

(assert (= (and start!45650 res!304799) b!503510))

(assert (= (and b!503510 res!304804) b!503514))

(assert (= (and b!503514 res!304798) b!503504))

(assert (= (and b!503504 res!304800) b!503517))

(assert (= (and b!503517 res!304806) b!503515))

(assert (= (and b!503515 res!304808) b!503506))

(assert (= (and b!503506 res!304805) b!503512))

(assert (= (and b!503512 res!304801) b!503503))

(assert (= (and b!503503 res!304797) b!503509))

(assert (= (and b!503503 (not res!304794)) b!503507))

(assert (= (and b!503507 (not res!304803)) b!503516))

(assert (= (and b!503516 c!59633) b!503518))

(assert (= (and b!503516 (not c!59633)) b!503505))

(assert (= (and b!503518 res!304795) b!503511))

(assert (= (and b!503516 (not res!304796)) b!503519))

(assert (= (and b!503519 res!304802) b!503513))

(assert (= (and b!503519 (not res!304807)) b!503508))

(declare-fun m!484333 () Bool)

(assert (=> b!503506 m!484333))

(declare-fun m!484335 () Bool)

(assert (=> b!503504 m!484335))

(declare-fun m!484337 () Bool)

(assert (=> b!503516 m!484337))

(declare-fun m!484339 () Bool)

(assert (=> b!503516 m!484339))

(declare-fun m!484341 () Bool)

(assert (=> b!503516 m!484341))

(declare-fun m!484343 () Bool)

(assert (=> b!503503 m!484343))

(declare-fun m!484345 () Bool)

(assert (=> b!503503 m!484345))

(declare-fun m!484347 () Bool)

(assert (=> b!503503 m!484347))

(assert (=> b!503503 m!484341))

(declare-fun m!484349 () Bool)

(assert (=> b!503503 m!484349))

(declare-fun m!484351 () Bool)

(assert (=> b!503503 m!484351))

(assert (=> b!503503 m!484341))

(declare-fun m!484353 () Bool)

(assert (=> b!503503 m!484353))

(declare-fun m!484355 () Bool)

(assert (=> b!503503 m!484355))

(assert (=> b!503503 m!484341))

(declare-fun m!484357 () Bool)

(assert (=> b!503503 m!484357))

(declare-fun m!484359 () Bool)

(assert (=> start!45650 m!484359))

(declare-fun m!484361 () Bool)

(assert (=> start!45650 m!484361))

(assert (=> b!503509 m!484341))

(assert (=> b!503509 m!484341))

(declare-fun m!484363 () Bool)

(assert (=> b!503509 m!484363))

(declare-fun m!484365 () Bool)

(assert (=> b!503508 m!484365))

(declare-fun m!484367 () Bool)

(assert (=> b!503512 m!484367))

(declare-fun m!484369 () Bool)

(assert (=> b!503517 m!484369))

(declare-fun m!484371 () Bool)

(assert (=> b!503515 m!484371))

(assert (=> b!503514 m!484341))

(assert (=> b!503514 m!484341))

(declare-fun m!484373 () Bool)

(assert (=> b!503514 m!484373))

(declare-fun m!484375 () Bool)

(assert (=> b!503518 m!484375))

(assert (=> b!503518 m!484365))

(assert (=> b!503513 m!484341))

(assert (=> b!503513 m!484341))

(declare-fun m!484377 () Bool)

(assert (=> b!503513 m!484377))

(check-sat (not b!503517) (not b!503515) (not b!503518) (not b!503514) (not b!503509) (not b!503516) (not b!503508) (not start!45650) (not b!503506) (not b!503512) (not b!503504) (not b!503513) (not b!503503))
(check-sat)
