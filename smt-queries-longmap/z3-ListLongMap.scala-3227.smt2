; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45156 () Bool)

(assert start!45156)

(declare-fun b!495324 () Bool)

(declare-fun res!297856 () Bool)

(declare-fun e!290564 () Bool)

(assert (=> b!495324 (=> (not res!297856) (not e!290564))))

(declare-datatypes ((array!32054 0))(
  ( (array!32055 (arr!15410 (Array (_ BitVec 32) (_ BitVec 64))) (size!15775 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32054)

(declare-datatypes ((List!9607 0))(
  ( (Nil!9604) (Cons!9603 (h!10474 (_ BitVec 64)) (t!15826 List!9607)) )
))
(declare-fun arrayNoDuplicates!0 (array!32054 (_ BitVec 32) List!9607) Bool)

(assert (=> b!495324 (= res!297856 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9604))))

(declare-fun b!495325 () Bool)

(declare-fun e!290567 () Bool)

(assert (=> b!495325 (= e!290567 true)))

(declare-datatypes ((SeekEntryResult!3874 0))(
  ( (MissingZero!3874 (index!17675 (_ BitVec 32))) (Found!3874 (index!17676 (_ BitVec 32))) (Intermediate!3874 (undefined!4686 Bool) (index!17677 (_ BitVec 32)) (x!46753 (_ BitVec 32))) (Undefined!3874) (MissingVacant!3874 (index!17678 (_ BitVec 32))) )
))
(declare-fun lt!224127 () SeekEntryResult!3874)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495325 (and (bvslt (x!46753 lt!224127) #b01111111111111111111111111111110) (or (= (select (arr!15410 a!3235) (index!17677 lt!224127)) (select (arr!15410 a!3235) j!176)) (= (select (arr!15410 a!3235) (index!17677 lt!224127)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15410 a!3235) (index!17677 lt!224127)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495326 () Bool)

(declare-fun res!297863 () Bool)

(declare-fun e!290566 () Bool)

(assert (=> b!495326 (=> (not res!297863) (not e!290566))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495326 (= res!297863 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495327 () Bool)

(declare-fun res!297853 () Bool)

(assert (=> b!495327 (=> (not res!297853) (not e!290566))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495327 (= res!297853 (and (= (size!15775 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15775 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15775 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495328 () Bool)

(declare-fun res!297857 () Bool)

(assert (=> b!495328 (=> (not res!297857) (not e!290564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32054 (_ BitVec 32)) Bool)

(assert (=> b!495328 (= res!297857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495329 () Bool)

(assert (=> b!495329 (= e!290564 (not e!290567))))

(declare-fun res!297855 () Bool)

(assert (=> b!495329 (=> res!297855 e!290567)))

(declare-fun lt!224125 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32054 (_ BitVec 32)) SeekEntryResult!3874)

(assert (=> b!495329 (= res!297855 (= lt!224127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224125 (select (store (arr!15410 a!3235) i!1204 k0!2280) j!176) (array!32055 (store (arr!15410 a!3235) i!1204 k0!2280) (size!15775 a!3235)) mask!3524)))))

(declare-fun lt!224124 () (_ BitVec 32))

(assert (=> b!495329 (= lt!224127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224124 (select (arr!15410 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495329 (= lt!224125 (toIndex!0 (select (store (arr!15410 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495329 (= lt!224124 (toIndex!0 (select (arr!15410 a!3235) j!176) mask!3524))))

(declare-fun e!290565 () Bool)

(assert (=> b!495329 e!290565))

(declare-fun res!297860 () Bool)

(assert (=> b!495329 (=> (not res!297860) (not e!290565))))

(assert (=> b!495329 (= res!297860 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14680 0))(
  ( (Unit!14681) )
))
(declare-fun lt!224126 () Unit!14680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14680)

(assert (=> b!495329 (= lt!224126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495330 () Bool)

(declare-fun res!297859 () Bool)

(assert (=> b!495330 (=> (not res!297859) (not e!290566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495330 (= res!297859 (validKeyInArray!0 k0!2280))))

(declare-fun b!495331 () Bool)

(assert (=> b!495331 (= e!290566 e!290564)))

(declare-fun res!297858 () Bool)

(assert (=> b!495331 (=> (not res!297858) (not e!290564))))

(declare-fun lt!224128 () SeekEntryResult!3874)

(assert (=> b!495331 (= res!297858 (or (= lt!224128 (MissingZero!3874 i!1204)) (= lt!224128 (MissingVacant!3874 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32054 (_ BitVec 32)) SeekEntryResult!3874)

(assert (=> b!495331 (= lt!224128 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495332 () Bool)

(declare-fun res!297861 () Bool)

(assert (=> b!495332 (=> res!297861 e!290567)))

(get-info :version)

(assert (=> b!495332 (= res!297861 (or (undefined!4686 lt!224127) (not ((_ is Intermediate!3874) lt!224127))))))

(declare-fun b!495333 () Bool)

(assert (=> b!495333 (= e!290565 (= (seekEntryOrOpen!0 (select (arr!15410 a!3235) j!176) a!3235 mask!3524) (Found!3874 j!176)))))

(declare-fun b!495334 () Bool)

(declare-fun res!297854 () Bool)

(assert (=> b!495334 (=> (not res!297854) (not e!290566))))

(assert (=> b!495334 (= res!297854 (validKeyInArray!0 (select (arr!15410 a!3235) j!176)))))

(declare-fun res!297862 () Bool)

(assert (=> start!45156 (=> (not res!297862) (not e!290566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45156 (= res!297862 (validMask!0 mask!3524))))

(assert (=> start!45156 e!290566))

(assert (=> start!45156 true))

(declare-fun array_inv!11293 (array!32054) Bool)

(assert (=> start!45156 (array_inv!11293 a!3235)))

(assert (= (and start!45156 res!297862) b!495327))

(assert (= (and b!495327 res!297853) b!495334))

(assert (= (and b!495334 res!297854) b!495330))

(assert (= (and b!495330 res!297859) b!495326))

(assert (= (and b!495326 res!297863) b!495331))

(assert (= (and b!495331 res!297858) b!495328))

(assert (= (and b!495328 res!297857) b!495324))

(assert (= (and b!495324 res!297856) b!495329))

(assert (= (and b!495329 res!297860) b!495333))

(assert (= (and b!495329 (not res!297855)) b!495332))

(assert (= (and b!495332 (not res!297861)) b!495325))

(declare-fun m!475951 () Bool)

(assert (=> b!495329 m!475951))

(declare-fun m!475953 () Bool)

(assert (=> b!495329 m!475953))

(declare-fun m!475955 () Bool)

(assert (=> b!495329 m!475955))

(assert (=> b!495329 m!475955))

(declare-fun m!475957 () Bool)

(assert (=> b!495329 m!475957))

(declare-fun m!475959 () Bool)

(assert (=> b!495329 m!475959))

(declare-fun m!475961 () Bool)

(assert (=> b!495329 m!475961))

(declare-fun m!475963 () Bool)

(assert (=> b!495329 m!475963))

(assert (=> b!495329 m!475955))

(declare-fun m!475965 () Bool)

(assert (=> b!495329 m!475965))

(assert (=> b!495329 m!475959))

(declare-fun m!475967 () Bool)

(assert (=> b!495329 m!475967))

(assert (=> b!495329 m!475959))

(declare-fun m!475969 () Bool)

(assert (=> b!495324 m!475969))

(declare-fun m!475971 () Bool)

(assert (=> b!495331 m!475971))

(declare-fun m!475973 () Bool)

(assert (=> start!45156 m!475973))

(declare-fun m!475975 () Bool)

(assert (=> start!45156 m!475975))

(declare-fun m!475977 () Bool)

(assert (=> b!495328 m!475977))

(declare-fun m!475979 () Bool)

(assert (=> b!495330 m!475979))

(declare-fun m!475981 () Bool)

(assert (=> b!495325 m!475981))

(assert (=> b!495325 m!475959))

(assert (=> b!495333 m!475959))

(assert (=> b!495333 m!475959))

(declare-fun m!475983 () Bool)

(assert (=> b!495333 m!475983))

(assert (=> b!495334 m!475959))

(assert (=> b!495334 m!475959))

(declare-fun m!475985 () Bool)

(assert (=> b!495334 m!475985))

(declare-fun m!475987 () Bool)

(assert (=> b!495326 m!475987))

(check-sat (not b!495331) (not b!495326) (not b!495333) (not b!495324) (not b!495330) (not b!495329) (not start!45156) (not b!495334) (not b!495328))
(check-sat)
