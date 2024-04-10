; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45644 () Bool)

(assert start!45644)

(declare-fun b!503350 () Bool)

(declare-fun e!294778 () Bool)

(declare-fun e!294782 () Bool)

(assert (=> b!503350 (= e!294778 e!294782)))

(declare-fun res!304659 () Bool)

(assert (=> b!503350 (=> (not res!304659) (not e!294782))))

(declare-datatypes ((SeekEntryResult!4047 0))(
  ( (MissingZero!4047 (index!18376 (_ BitVec 32))) (Found!4047 (index!18377 (_ BitVec 32))) (Intermediate!4047 (undefined!4859 Bool) (index!18378 (_ BitVec 32)) (x!47400 (_ BitVec 32))) (Undefined!4047) (MissingVacant!4047 (index!18379 (_ BitVec 32))) )
))
(declare-fun lt!228968 () SeekEntryResult!4047)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503350 (= res!304659 (or (= lt!228968 (MissingZero!4047 i!1204)) (= lt!228968 (MissingVacant!4047 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32400 0))(
  ( (array!32401 (arr!15580 (Array (_ BitVec 32) (_ BitVec 64))) (size!15944 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32400)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32400 (_ BitVec 32)) SeekEntryResult!4047)

(assert (=> b!503350 (= lt!228968 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503351 () Bool)

(declare-fun res!304671 () Bool)

(declare-fun e!294776 () Bool)

(assert (=> b!503351 (=> res!304671 e!294776)))

(declare-fun lt!228973 () SeekEntryResult!4047)

(get-info :version)

(assert (=> b!503351 (= res!304671 (or (undefined!4859 lt!228973) (not ((_ is Intermediate!4047) lt!228973))))))

(declare-fun b!503352 () Bool)

(declare-fun res!304665 () Bool)

(assert (=> b!503352 (=> (not res!304665) (not e!294782))))

(declare-datatypes ((List!9738 0))(
  ( (Nil!9735) (Cons!9734 (h!10611 (_ BitVec 64)) (t!15966 List!9738)) )
))
(declare-fun arrayNoDuplicates!0 (array!32400 (_ BitVec 32) List!9738) Bool)

(assert (=> b!503352 (= res!304665 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9735))))

(declare-fun res!304673 () Bool)

(assert (=> start!45644 (=> (not res!304673) (not e!294778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45644 (= res!304673 (validMask!0 mask!3524))))

(assert (=> start!45644 e!294778))

(assert (=> start!45644 true))

(declare-fun array_inv!11376 (array!32400) Bool)

(assert (=> start!45644 (array_inv!11376 a!3235)))

(declare-fun b!503353 () Bool)

(declare-fun res!304672 () Bool)

(assert (=> b!503353 (=> (not res!304672) (not e!294778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503353 (= res!304672 (validKeyInArray!0 k0!2280))))

(declare-fun b!503354 () Bool)

(declare-fun res!304670 () Bool)

(assert (=> b!503354 (=> (not res!304670) (not e!294778))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503354 (= res!304670 (validKeyInArray!0 (select (arr!15580 a!3235) j!176)))))

(declare-fun b!503355 () Bool)

(declare-fun lt!228974 () (_ BitVec 32))

(declare-fun e!294783 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32400 (_ BitVec 32)) SeekEntryResult!4047)

(assert (=> b!503355 (= e!294783 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228974 (index!18378 lt!228973) (select (arr!15580 a!3235) j!176) a!3235 mask!3524) (Found!4047 j!176))))))

(declare-fun b!503356 () Bool)

(declare-fun e!294775 () Bool)

(assert (=> b!503356 (= e!294775 true)))

(declare-fun lt!228972 () array!32400)

(declare-fun lt!228976 () (_ BitVec 64))

(declare-fun lt!228967 () SeekEntryResult!4047)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32400 (_ BitVec 32)) SeekEntryResult!4047)

(assert (=> b!503356 (= lt!228967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228974 lt!228976 lt!228972 mask!3524))))

(declare-fun b!503357 () Bool)

(assert (=> b!503357 (= e!294776 e!294775)))

(declare-fun res!304663 () Bool)

(assert (=> b!503357 (=> res!304663 e!294775)))

(assert (=> b!503357 (= res!304663 (or (bvsgt (x!47400 lt!228973) #b01111111111111111111111111111110) (bvslt lt!228974 #b00000000000000000000000000000000) (bvsge lt!228974 (size!15944 a!3235)) (bvslt (index!18378 lt!228973) #b00000000000000000000000000000000) (bvsge (index!18378 lt!228973) (size!15944 a!3235)) (not (= lt!228973 (Intermediate!4047 false (index!18378 lt!228973) (x!47400 lt!228973))))))))

(assert (=> b!503357 (= (index!18378 lt!228973) i!1204)))

(declare-datatypes ((Unit!15264 0))(
  ( (Unit!15265) )
))
(declare-fun lt!228971 () Unit!15264)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32400 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15264)

(assert (=> b!503357 (= lt!228971 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228974 #b00000000000000000000000000000000 (index!18378 lt!228973) (x!47400 lt!228973) mask!3524))))

(assert (=> b!503357 (and (or (= (select (arr!15580 a!3235) (index!18378 lt!228973)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15580 a!3235) (index!18378 lt!228973)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15580 a!3235) (index!18378 lt!228973)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15580 a!3235) (index!18378 lt!228973)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228970 () Unit!15264)

(declare-fun e!294779 () Unit!15264)

(assert (=> b!503357 (= lt!228970 e!294779)))

(declare-fun c!59624 () Bool)

(assert (=> b!503357 (= c!59624 (= (select (arr!15580 a!3235) (index!18378 lt!228973)) (select (arr!15580 a!3235) j!176)))))

(assert (=> b!503357 (and (bvslt (x!47400 lt!228973) #b01111111111111111111111111111110) (or (= (select (arr!15580 a!3235) (index!18378 lt!228973)) (select (arr!15580 a!3235) j!176)) (= (select (arr!15580 a!3235) (index!18378 lt!228973)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15580 a!3235) (index!18378 lt!228973)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503358 () Bool)

(declare-fun e!294780 () Bool)

(assert (=> b!503358 (= e!294780 false)))

(declare-fun b!503359 () Bool)

(assert (=> b!503359 (= e!294782 (not e!294776))))

(declare-fun res!304664 () Bool)

(assert (=> b!503359 (=> res!304664 e!294776)))

(declare-fun lt!228969 () (_ BitVec 32))

(assert (=> b!503359 (= res!304664 (= lt!228973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228969 lt!228976 lt!228972 mask!3524)))))

(assert (=> b!503359 (= lt!228973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228974 (select (arr!15580 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503359 (= lt!228969 (toIndex!0 lt!228976 mask!3524))))

(assert (=> b!503359 (= lt!228976 (select (store (arr!15580 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503359 (= lt!228974 (toIndex!0 (select (arr!15580 a!3235) j!176) mask!3524))))

(assert (=> b!503359 (= lt!228972 (array!32401 (store (arr!15580 a!3235) i!1204 k0!2280) (size!15944 a!3235)))))

(declare-fun e!294781 () Bool)

(assert (=> b!503359 e!294781))

(declare-fun res!304668 () Bool)

(assert (=> b!503359 (=> (not res!304668) (not e!294781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32400 (_ BitVec 32)) Bool)

(assert (=> b!503359 (= res!304668 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228975 () Unit!15264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15264)

(assert (=> b!503359 (= lt!228975 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503360 () Bool)

(declare-fun res!304660 () Bool)

(assert (=> b!503360 (=> (not res!304660) (not e!294782))))

(assert (=> b!503360 (= res!304660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503361 () Bool)

(declare-fun Unit!15266 () Unit!15264)

(assert (=> b!503361 (= e!294779 Unit!15266)))

(declare-fun b!503362 () Bool)

(declare-fun res!304667 () Bool)

(assert (=> b!503362 (=> (not res!304667) (not e!294778))))

(assert (=> b!503362 (= res!304667 (and (= (size!15944 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15944 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15944 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503363 () Bool)

(declare-fun res!304666 () Bool)

(assert (=> b!503363 (=> res!304666 e!294775)))

(assert (=> b!503363 (= res!304666 e!294783)))

(declare-fun res!304669 () Bool)

(assert (=> b!503363 (=> (not res!304669) (not e!294783))))

(assert (=> b!503363 (= res!304669 (bvsgt #b00000000000000000000000000000000 (x!47400 lt!228973)))))

(declare-fun b!503364 () Bool)

(declare-fun res!304661 () Bool)

(assert (=> b!503364 (=> (not res!304661) (not e!294778))))

(declare-fun arrayContainsKey!0 (array!32400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503364 (= res!304661 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503365 () Bool)

(declare-fun Unit!15267 () Unit!15264)

(assert (=> b!503365 (= e!294779 Unit!15267)))

(declare-fun lt!228966 () Unit!15264)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32400 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15264)

(assert (=> b!503365 (= lt!228966 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228974 #b00000000000000000000000000000000 (index!18378 lt!228973) (x!47400 lt!228973) mask!3524))))

(declare-fun res!304662 () Bool)

(assert (=> b!503365 (= res!304662 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228974 lt!228976 lt!228972 mask!3524) (Intermediate!4047 false (index!18378 lt!228973) (x!47400 lt!228973))))))

(assert (=> b!503365 (=> (not res!304662) (not e!294780))))

(assert (=> b!503365 e!294780))

(declare-fun b!503366 () Bool)

(assert (=> b!503366 (= e!294781 (= (seekEntryOrOpen!0 (select (arr!15580 a!3235) j!176) a!3235 mask!3524) (Found!4047 j!176)))))

(assert (= (and start!45644 res!304673) b!503362))

(assert (= (and b!503362 res!304667) b!503354))

(assert (= (and b!503354 res!304670) b!503353))

(assert (= (and b!503353 res!304672) b!503364))

(assert (= (and b!503364 res!304661) b!503350))

(assert (= (and b!503350 res!304659) b!503360))

(assert (= (and b!503360 res!304660) b!503352))

(assert (= (and b!503352 res!304665) b!503359))

(assert (= (and b!503359 res!304668) b!503366))

(assert (= (and b!503359 (not res!304664)) b!503351))

(assert (= (and b!503351 (not res!304671)) b!503357))

(assert (= (and b!503357 c!59624) b!503365))

(assert (= (and b!503357 (not c!59624)) b!503361))

(assert (= (and b!503365 res!304662) b!503358))

(assert (= (and b!503357 (not res!304663)) b!503363))

(assert (= (and b!503363 res!304669) b!503355))

(assert (= (and b!503363 (not res!304666)) b!503356))

(declare-fun m!484195 () Bool)

(assert (=> b!503366 m!484195))

(assert (=> b!503366 m!484195))

(declare-fun m!484197 () Bool)

(assert (=> b!503366 m!484197))

(declare-fun m!484199 () Bool)

(assert (=> b!503356 m!484199))

(assert (=> b!503354 m!484195))

(assert (=> b!503354 m!484195))

(declare-fun m!484201 () Bool)

(assert (=> b!503354 m!484201))

(assert (=> b!503355 m!484195))

(assert (=> b!503355 m!484195))

(declare-fun m!484203 () Bool)

(assert (=> b!503355 m!484203))

(declare-fun m!484205 () Bool)

(assert (=> b!503350 m!484205))

(declare-fun m!484207 () Bool)

(assert (=> b!503353 m!484207))

(declare-fun m!484209 () Bool)

(assert (=> b!503352 m!484209))

(declare-fun m!484211 () Bool)

(assert (=> b!503357 m!484211))

(declare-fun m!484213 () Bool)

(assert (=> b!503357 m!484213))

(assert (=> b!503357 m!484195))

(declare-fun m!484215 () Bool)

(assert (=> b!503364 m!484215))

(declare-fun m!484217 () Bool)

(assert (=> b!503365 m!484217))

(assert (=> b!503365 m!484199))

(declare-fun m!484219 () Bool)

(assert (=> start!45644 m!484219))

(declare-fun m!484221 () Bool)

(assert (=> start!45644 m!484221))

(declare-fun m!484223 () Bool)

(assert (=> b!503360 m!484223))

(declare-fun m!484225 () Bool)

(assert (=> b!503359 m!484225))

(declare-fun m!484227 () Bool)

(assert (=> b!503359 m!484227))

(declare-fun m!484229 () Bool)

(assert (=> b!503359 m!484229))

(assert (=> b!503359 m!484195))

(declare-fun m!484231 () Bool)

(assert (=> b!503359 m!484231))

(declare-fun m!484233 () Bool)

(assert (=> b!503359 m!484233))

(assert (=> b!503359 m!484195))

(declare-fun m!484235 () Bool)

(assert (=> b!503359 m!484235))

(assert (=> b!503359 m!484195))

(declare-fun m!484237 () Bool)

(assert (=> b!503359 m!484237))

(declare-fun m!484239 () Bool)

(assert (=> b!503359 m!484239))

(check-sat (not b!503365) (not b!503360) (not b!503359) (not b!503364) (not b!503356) (not b!503355) (not b!503354) (not start!45644) (not b!503366) (not b!503353) (not b!503350) (not b!503352) (not b!503357))
(check-sat)
