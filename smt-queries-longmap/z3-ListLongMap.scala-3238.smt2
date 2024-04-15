; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45222 () Bool)

(assert start!45222)

(declare-fun b!496413 () Bool)

(declare-fun res!298948 () Bool)

(declare-fun e!291061 () Bool)

(assert (=> b!496413 (=> (not res!298948) (not e!291061))))

(declare-datatypes ((array!32120 0))(
  ( (array!32121 (arr!15443 (Array (_ BitVec 32) (_ BitVec 64))) (size!15808 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32120)

(declare-datatypes ((List!9640 0))(
  ( (Nil!9637) (Cons!9636 (h!10507 (_ BitVec 64)) (t!15859 List!9640)) )
))
(declare-fun arrayNoDuplicates!0 (array!32120 (_ BitVec 32) List!9640) Bool)

(assert (=> b!496413 (= res!298948 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9637))))

(declare-fun res!298946 () Bool)

(declare-fun e!291062 () Bool)

(assert (=> start!45222 (=> (not res!298946) (not e!291062))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45222 (= res!298946 (validMask!0 mask!3524))))

(assert (=> start!45222 e!291062))

(assert (=> start!45222 true))

(declare-fun array_inv!11326 (array!32120) Bool)

(assert (=> start!45222 (array_inv!11326 a!3235)))

(declare-fun b!496414 () Bool)

(declare-fun res!298950 () Bool)

(assert (=> b!496414 (=> (not res!298950) (not e!291062))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496414 (= res!298950 (and (= (size!15808 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15808 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15808 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496415 () Bool)

(declare-fun res!298945 () Bool)

(assert (=> b!496415 (=> (not res!298945) (not e!291062))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496415 (= res!298945 (validKeyInArray!0 k0!2280))))

(declare-fun b!496416 () Bool)

(declare-fun res!298951 () Bool)

(declare-fun e!291059 () Bool)

(assert (=> b!496416 (=> res!298951 e!291059)))

(declare-datatypes ((SeekEntryResult!3907 0))(
  ( (MissingZero!3907 (index!17807 (_ BitVec 32))) (Found!3907 (index!17808 (_ BitVec 32))) (Intermediate!3907 (undefined!4719 Bool) (index!17809 (_ BitVec 32)) (x!46874 (_ BitVec 32))) (Undefined!3907) (MissingVacant!3907 (index!17810 (_ BitVec 32))) )
))
(declare-fun lt!224623 () SeekEntryResult!3907)

(get-info :version)

(assert (=> b!496416 (= res!298951 (or (undefined!4719 lt!224623) (not ((_ is Intermediate!3907) lt!224623))))))

(declare-fun b!496417 () Bool)

(declare-fun e!291060 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32120 (_ BitVec 32)) SeekEntryResult!3907)

(assert (=> b!496417 (= e!291060 (= (seekEntryOrOpen!0 (select (arr!15443 a!3235) j!176) a!3235 mask!3524) (Found!3907 j!176)))))

(declare-fun b!496418 () Bool)

(declare-fun res!298952 () Bool)

(assert (=> b!496418 (=> (not res!298952) (not e!291062))))

(assert (=> b!496418 (= res!298952 (validKeyInArray!0 (select (arr!15443 a!3235) j!176)))))

(declare-fun b!496419 () Bool)

(declare-fun res!298944 () Bool)

(assert (=> b!496419 (=> (not res!298944) (not e!291062))))

(declare-fun arrayContainsKey!0 (array!32120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496419 (= res!298944 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496420 () Bool)

(assert (=> b!496420 (= e!291059 true)))

(assert (=> b!496420 (and (bvslt (x!46874 lt!224623) #b01111111111111111111111111111110) (or (= (select (arr!15443 a!3235) (index!17809 lt!224623)) (select (arr!15443 a!3235) j!176)) (= (select (arr!15443 a!3235) (index!17809 lt!224623)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15443 a!3235) (index!17809 lt!224623)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496421 () Bool)

(declare-fun res!298947 () Bool)

(assert (=> b!496421 (=> (not res!298947) (not e!291061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32120 (_ BitVec 32)) Bool)

(assert (=> b!496421 (= res!298947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496422 () Bool)

(assert (=> b!496422 (= e!291061 (not e!291059))))

(declare-fun res!298943 () Bool)

(assert (=> b!496422 (=> res!298943 e!291059)))

(declare-fun lt!224620 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32120 (_ BitVec 32)) SeekEntryResult!3907)

(assert (=> b!496422 (= res!298943 (= lt!224623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224620 (select (store (arr!15443 a!3235) i!1204 k0!2280) j!176) (array!32121 (store (arr!15443 a!3235) i!1204 k0!2280) (size!15808 a!3235)) mask!3524)))))

(declare-fun lt!224621 () (_ BitVec 32))

(assert (=> b!496422 (= lt!224623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224621 (select (arr!15443 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496422 (= lt!224620 (toIndex!0 (select (store (arr!15443 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496422 (= lt!224621 (toIndex!0 (select (arr!15443 a!3235) j!176) mask!3524))))

(assert (=> b!496422 e!291060))

(declare-fun res!298942 () Bool)

(assert (=> b!496422 (=> (not res!298942) (not e!291060))))

(assert (=> b!496422 (= res!298942 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14746 0))(
  ( (Unit!14747) )
))
(declare-fun lt!224622 () Unit!14746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14746)

(assert (=> b!496422 (= lt!224622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496423 () Bool)

(assert (=> b!496423 (= e!291062 e!291061)))

(declare-fun res!298949 () Bool)

(assert (=> b!496423 (=> (not res!298949) (not e!291061))))

(declare-fun lt!224619 () SeekEntryResult!3907)

(assert (=> b!496423 (= res!298949 (or (= lt!224619 (MissingZero!3907 i!1204)) (= lt!224619 (MissingVacant!3907 i!1204))))))

(assert (=> b!496423 (= lt!224619 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45222 res!298946) b!496414))

(assert (= (and b!496414 res!298950) b!496418))

(assert (= (and b!496418 res!298952) b!496415))

(assert (= (and b!496415 res!298945) b!496419))

(assert (= (and b!496419 res!298944) b!496423))

(assert (= (and b!496423 res!298949) b!496421))

(assert (= (and b!496421 res!298947) b!496413))

(assert (= (and b!496413 res!298948) b!496422))

(assert (= (and b!496422 res!298942) b!496417))

(assert (= (and b!496422 (not res!298943)) b!496416))

(assert (= (and b!496416 (not res!298951)) b!496420))

(declare-fun m!477205 () Bool)

(assert (=> b!496419 m!477205))

(declare-fun m!477207 () Bool)

(assert (=> start!45222 m!477207))

(declare-fun m!477209 () Bool)

(assert (=> start!45222 m!477209))

(declare-fun m!477211 () Bool)

(assert (=> b!496418 m!477211))

(assert (=> b!496418 m!477211))

(declare-fun m!477213 () Bool)

(assert (=> b!496418 m!477213))

(declare-fun m!477215 () Bool)

(assert (=> b!496421 m!477215))

(declare-fun m!477217 () Bool)

(assert (=> b!496420 m!477217))

(assert (=> b!496420 m!477211))

(declare-fun m!477219 () Bool)

(assert (=> b!496422 m!477219))

(declare-fun m!477221 () Bool)

(assert (=> b!496422 m!477221))

(declare-fun m!477223 () Bool)

(assert (=> b!496422 m!477223))

(assert (=> b!496422 m!477211))

(declare-fun m!477225 () Bool)

(assert (=> b!496422 m!477225))

(assert (=> b!496422 m!477211))

(declare-fun m!477227 () Bool)

(assert (=> b!496422 m!477227))

(assert (=> b!496422 m!477211))

(declare-fun m!477229 () Bool)

(assert (=> b!496422 m!477229))

(assert (=> b!496422 m!477223))

(declare-fun m!477231 () Bool)

(assert (=> b!496422 m!477231))

(assert (=> b!496422 m!477223))

(declare-fun m!477233 () Bool)

(assert (=> b!496422 m!477233))

(declare-fun m!477235 () Bool)

(assert (=> b!496413 m!477235))

(declare-fun m!477237 () Bool)

(assert (=> b!496415 m!477237))

(assert (=> b!496417 m!477211))

(assert (=> b!496417 m!477211))

(declare-fun m!477239 () Bool)

(assert (=> b!496417 m!477239))

(declare-fun m!477241 () Bool)

(assert (=> b!496423 m!477241))

(check-sat (not b!496415) (not b!496418) (not start!45222) (not b!496421) (not b!496413) (not b!496422) (not b!496417) (not b!496423) (not b!496419))
(check-sat)
