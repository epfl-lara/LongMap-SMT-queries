; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45230 () Bool)

(assert start!45230)

(declare-fun b!496722 () Bool)

(declare-fun e!291243 () Bool)

(declare-fun e!291242 () Bool)

(assert (=> b!496722 (= e!291243 (not e!291242))))

(declare-fun res!299170 () Bool)

(assert (=> b!496722 (=> res!299170 e!291242)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32119 0))(
  ( (array!32120 (arr!15442 (Array (_ BitVec 32) (_ BitVec 64))) (size!15806 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32119)

(declare-datatypes ((SeekEntryResult!3865 0))(
  ( (MissingZero!3865 (index!17639 (_ BitVec 32))) (Found!3865 (index!17640 (_ BitVec 32))) (Intermediate!3865 (undefined!4677 Bool) (index!17641 (_ BitVec 32)) (x!46842 (_ BitVec 32))) (Undefined!3865) (MissingVacant!3865 (index!17642 (_ BitVec 32))) )
))
(declare-fun lt!224911 () SeekEntryResult!3865)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!224910 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32119 (_ BitVec 32)) SeekEntryResult!3865)

(assert (=> b!496722 (= res!299170 (= lt!224911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224910 (select (store (arr!15442 a!3235) i!1204 k0!2280) j!176) (array!32120 (store (arr!15442 a!3235) i!1204 k0!2280) (size!15806 a!3235)) mask!3524)))))

(declare-fun lt!224914 () (_ BitVec 32))

(assert (=> b!496722 (= lt!224911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224914 (select (arr!15442 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496722 (= lt!224910 (toIndex!0 (select (store (arr!15442 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496722 (= lt!224914 (toIndex!0 (select (arr!15442 a!3235) j!176) mask!3524))))

(declare-fun e!291239 () Bool)

(assert (=> b!496722 e!291239))

(declare-fun res!299169 () Bool)

(assert (=> b!496722 (=> (not res!299169) (not e!291239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32119 (_ BitVec 32)) Bool)

(assert (=> b!496722 (= res!299169 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14737 0))(
  ( (Unit!14738) )
))
(declare-fun lt!224913 () Unit!14737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14737)

(assert (=> b!496722 (= lt!224913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496724 () Bool)

(declare-fun res!299172 () Bool)

(declare-fun e!291240 () Bool)

(assert (=> b!496724 (=> (not res!299172) (not e!291240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496724 (= res!299172 (validKeyInArray!0 (select (arr!15442 a!3235) j!176)))))

(declare-fun b!496725 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32119 (_ BitVec 32)) SeekEntryResult!3865)

(assert (=> b!496725 (= e!291239 (= (seekEntryOrOpen!0 (select (arr!15442 a!3235) j!176) a!3235 mask!3524) (Found!3865 j!176)))))

(declare-fun b!496726 () Bool)

(assert (=> b!496726 (= e!291240 e!291243)))

(declare-fun res!299167 () Bool)

(assert (=> b!496726 (=> (not res!299167) (not e!291243))))

(declare-fun lt!224912 () SeekEntryResult!3865)

(assert (=> b!496726 (= res!299167 (or (= lt!224912 (MissingZero!3865 i!1204)) (= lt!224912 (MissingVacant!3865 i!1204))))))

(assert (=> b!496726 (= lt!224912 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496727 () Bool)

(declare-fun res!299173 () Bool)

(assert (=> b!496727 (=> (not res!299173) (not e!291240))))

(assert (=> b!496727 (= res!299173 (validKeyInArray!0 k0!2280))))

(declare-fun b!496728 () Bool)

(declare-fun res!299163 () Bool)

(assert (=> b!496728 (=> (not res!299163) (not e!291240))))

(assert (=> b!496728 (= res!299163 (and (= (size!15806 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15806 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15806 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496723 () Bool)

(declare-fun res!299165 () Bool)

(assert (=> b!496723 (=> (not res!299165) (not e!291240))))

(declare-fun arrayContainsKey!0 (array!32119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496723 (= res!299165 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299166 () Bool)

(assert (=> start!45230 (=> (not res!299166) (not e!291240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45230 (= res!299166 (validMask!0 mask!3524))))

(assert (=> start!45230 e!291240))

(assert (=> start!45230 true))

(declare-fun array_inv!11301 (array!32119) Bool)

(assert (=> start!45230 (array_inv!11301 a!3235)))

(declare-fun b!496729 () Bool)

(assert (=> b!496729 (= e!291242 true)))

(assert (=> b!496729 (and (bvslt (x!46842 lt!224911) #b01111111111111111111111111111110) (or (= (select (arr!15442 a!3235) (index!17641 lt!224911)) (select (arr!15442 a!3235) j!176)) (= (select (arr!15442 a!3235) (index!17641 lt!224911)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15442 a!3235) (index!17641 lt!224911)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496730 () Bool)

(declare-fun res!299164 () Bool)

(assert (=> b!496730 (=> (not res!299164) (not e!291243))))

(assert (=> b!496730 (= res!299164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496731 () Bool)

(declare-fun res!299171 () Bool)

(assert (=> b!496731 (=> (not res!299171) (not e!291243))))

(declare-datatypes ((List!9507 0))(
  ( (Nil!9504) (Cons!9503 (h!10374 (_ BitVec 64)) (t!15727 List!9507)) )
))
(declare-fun arrayNoDuplicates!0 (array!32119 (_ BitVec 32) List!9507) Bool)

(assert (=> b!496731 (= res!299171 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9504))))

(declare-fun b!496732 () Bool)

(declare-fun res!299168 () Bool)

(assert (=> b!496732 (=> res!299168 e!291242)))

(get-info :version)

(assert (=> b!496732 (= res!299168 (or (undefined!4677 lt!224911) (not ((_ is Intermediate!3865) lt!224911))))))

(assert (= (and start!45230 res!299166) b!496728))

(assert (= (and b!496728 res!299163) b!496724))

(assert (= (and b!496724 res!299172) b!496727))

(assert (= (and b!496727 res!299173) b!496723))

(assert (= (and b!496723 res!299165) b!496726))

(assert (= (and b!496726 res!299167) b!496730))

(assert (= (and b!496730 res!299164) b!496731))

(assert (= (and b!496731 res!299171) b!496722))

(assert (= (and b!496722 res!299169) b!496725))

(assert (= (and b!496722 (not res!299170)) b!496732))

(assert (= (and b!496732 (not res!299168)) b!496729))

(declare-fun m!478255 () Bool)

(assert (=> b!496722 m!478255))

(declare-fun m!478257 () Bool)

(assert (=> b!496722 m!478257))

(declare-fun m!478259 () Bool)

(assert (=> b!496722 m!478259))

(assert (=> b!496722 m!478259))

(declare-fun m!478261 () Bool)

(assert (=> b!496722 m!478261))

(declare-fun m!478263 () Bool)

(assert (=> b!496722 m!478263))

(declare-fun m!478265 () Bool)

(assert (=> b!496722 m!478265))

(assert (=> b!496722 m!478263))

(assert (=> b!496722 m!478263))

(declare-fun m!478267 () Bool)

(assert (=> b!496722 m!478267))

(declare-fun m!478269 () Bool)

(assert (=> b!496722 m!478269))

(assert (=> b!496722 m!478259))

(declare-fun m!478271 () Bool)

(assert (=> b!496722 m!478271))

(assert (=> b!496725 m!478263))

(assert (=> b!496725 m!478263))

(declare-fun m!478273 () Bool)

(assert (=> b!496725 m!478273))

(assert (=> b!496724 m!478263))

(assert (=> b!496724 m!478263))

(declare-fun m!478275 () Bool)

(assert (=> b!496724 m!478275))

(declare-fun m!478277 () Bool)

(assert (=> b!496731 m!478277))

(declare-fun m!478279 () Bool)

(assert (=> start!45230 m!478279))

(declare-fun m!478281 () Bool)

(assert (=> start!45230 m!478281))

(declare-fun m!478283 () Bool)

(assert (=> b!496726 m!478283))

(declare-fun m!478285 () Bool)

(assert (=> b!496723 m!478285))

(declare-fun m!478287 () Bool)

(assert (=> b!496729 m!478287))

(assert (=> b!496729 m!478263))

(declare-fun m!478289 () Bool)

(assert (=> b!496727 m!478289))

(declare-fun m!478291 () Bool)

(assert (=> b!496730 m!478291))

(check-sat (not b!496730) (not b!496726) (not b!496724) (not start!45230) (not b!496731) (not b!496725) (not b!496727) (not b!496722) (not b!496723))
(check-sat)
