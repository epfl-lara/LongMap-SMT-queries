; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45348 () Bool)

(assert start!45348)

(declare-fun b!497792 () Bool)

(declare-datatypes ((Unit!14818 0))(
  ( (Unit!14819) )
))
(declare-fun e!291762 () Unit!14818)

(declare-fun Unit!14820 () Unit!14818)

(assert (=> b!497792 (= e!291762 Unit!14820)))

(declare-fun b!497793 () Bool)

(declare-fun e!291768 () Bool)

(declare-fun e!291763 () Bool)

(assert (=> b!497793 (= e!291768 e!291763)))

(declare-fun res!300088 () Bool)

(assert (=> b!497793 (=> (not res!300088) (not e!291763))))

(declare-datatypes ((SeekEntryResult!3937 0))(
  ( (MissingZero!3937 (index!17930 (_ BitVec 32))) (Found!3937 (index!17931 (_ BitVec 32))) (Intermediate!3937 (undefined!4749 Bool) (index!17932 (_ BitVec 32)) (x!46993 (_ BitVec 32))) (Undefined!3937) (MissingVacant!3937 (index!17933 (_ BitVec 32))) )
))
(declare-fun lt!225295 () SeekEntryResult!3937)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497793 (= res!300088 (or (= lt!225295 (MissingZero!3937 i!1204)) (= lt!225295 (MissingVacant!3937 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32183 0))(
  ( (array!32184 (arr!15473 (Array (_ BitVec 32) (_ BitVec 64))) (size!15838 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32183)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32183 (_ BitVec 32)) SeekEntryResult!3937)

(assert (=> b!497793 (= lt!225295 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497794 () Bool)

(declare-fun e!291767 () Bool)

(assert (=> b!497794 (= e!291767 true)))

(declare-fun lt!225302 () SeekEntryResult!3937)

(declare-fun lt!225304 () array!32183)

(declare-fun lt!225303 () (_ BitVec 64))

(declare-fun lt!225301 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32183 (_ BitVec 32)) SeekEntryResult!3937)

(assert (=> b!497794 (= lt!225302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225301 lt!225303 lt!225304 mask!3524))))

(declare-fun b!497795 () Bool)

(declare-fun res!300080 () Bool)

(assert (=> b!497795 (=> (not res!300080) (not e!291768))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497795 (= res!300080 (validKeyInArray!0 (select (arr!15473 a!3235) j!176)))))

(declare-fun b!497796 () Bool)

(declare-fun Unit!14821 () Unit!14818)

(assert (=> b!497796 (= e!291762 Unit!14821)))

(declare-fun lt!225299 () SeekEntryResult!3937)

(declare-fun lt!225296 () Unit!14818)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32183 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14818)

(assert (=> b!497796 (= lt!225296 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225301 #b00000000000000000000000000000000 (index!17932 lt!225299) (x!46993 lt!225299) mask!3524))))

(declare-fun res!300086 () Bool)

(assert (=> b!497796 (= res!300086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225301 lt!225303 lt!225304 mask!3524) (Intermediate!3937 false (index!17932 lt!225299) (x!46993 lt!225299))))))

(declare-fun e!291764 () Bool)

(assert (=> b!497796 (=> (not res!300086) (not e!291764))))

(assert (=> b!497796 e!291764))

(declare-fun b!497797 () Bool)

(declare-fun res!300092 () Bool)

(assert (=> b!497797 (=> (not res!300092) (not e!291768))))

(assert (=> b!497797 (= res!300092 (and (= (size!15838 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15838 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15838 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497798 () Bool)

(declare-fun res!300083 () Bool)

(assert (=> b!497798 (=> (not res!300083) (not e!291763))))

(declare-datatypes ((List!9670 0))(
  ( (Nil!9667) (Cons!9666 (h!10540 (_ BitVec 64)) (t!15889 List!9670)) )
))
(declare-fun arrayNoDuplicates!0 (array!32183 (_ BitVec 32) List!9670) Bool)

(assert (=> b!497798 (= res!300083 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9667))))

(declare-fun b!497799 () Bool)

(declare-fun e!291761 () Bool)

(assert (=> b!497799 (= e!291761 (= (seekEntryOrOpen!0 (select (arr!15473 a!3235) j!176) a!3235 mask!3524) (Found!3937 j!176)))))

(declare-fun b!497800 () Bool)

(assert (=> b!497800 (= e!291764 false)))

(declare-fun b!497801 () Bool)

(declare-fun e!291765 () Bool)

(assert (=> b!497801 (= e!291765 e!291767)))

(declare-fun res!300081 () Bool)

(assert (=> b!497801 (=> res!300081 e!291767)))

(assert (=> b!497801 (= res!300081 (or (bvsgt #b00000000000000000000000000000000 (x!46993 lt!225299)) (bvsgt (x!46993 lt!225299) #b01111111111111111111111111111110) (bvslt lt!225301 #b00000000000000000000000000000000) (bvsge lt!225301 (size!15838 a!3235)) (bvslt (index!17932 lt!225299) #b00000000000000000000000000000000) (bvsge (index!17932 lt!225299) (size!15838 a!3235)) (not (= lt!225299 (Intermediate!3937 false (index!17932 lt!225299) (x!46993 lt!225299))))))))

(assert (=> b!497801 (and (or (= (select (arr!15473 a!3235) (index!17932 lt!225299)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15473 a!3235) (index!17932 lt!225299)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15473 a!3235) (index!17932 lt!225299)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15473 a!3235) (index!17932 lt!225299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225300 () Unit!14818)

(assert (=> b!497801 (= lt!225300 e!291762)))

(declare-fun c!59133 () Bool)

(assert (=> b!497801 (= c!59133 (= (select (arr!15473 a!3235) (index!17932 lt!225299)) (select (arr!15473 a!3235) j!176)))))

(assert (=> b!497801 (and (bvslt (x!46993 lt!225299) #b01111111111111111111111111111110) (or (= (select (arr!15473 a!3235) (index!17932 lt!225299)) (select (arr!15473 a!3235) j!176)) (= (select (arr!15473 a!3235) (index!17932 lt!225299)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15473 a!3235) (index!17932 lt!225299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497802 () Bool)

(declare-fun res!300089 () Bool)

(assert (=> b!497802 (=> (not res!300089) (not e!291768))))

(declare-fun arrayContainsKey!0 (array!32183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497802 (= res!300089 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497804 () Bool)

(declare-fun res!300085 () Bool)

(assert (=> b!497804 (=> (not res!300085) (not e!291763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32183 (_ BitVec 32)) Bool)

(assert (=> b!497804 (= res!300085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!300087 () Bool)

(assert (=> start!45348 (=> (not res!300087) (not e!291768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45348 (= res!300087 (validMask!0 mask!3524))))

(assert (=> start!45348 e!291768))

(assert (=> start!45348 true))

(declare-fun array_inv!11356 (array!32183) Bool)

(assert (=> start!45348 (array_inv!11356 a!3235)))

(declare-fun b!497803 () Bool)

(declare-fun res!300090 () Bool)

(assert (=> b!497803 (=> (not res!300090) (not e!291768))))

(assert (=> b!497803 (= res!300090 (validKeyInArray!0 k0!2280))))

(declare-fun b!497805 () Bool)

(declare-fun res!300091 () Bool)

(assert (=> b!497805 (=> res!300091 e!291765)))

(get-info :version)

(assert (=> b!497805 (= res!300091 (or (undefined!4749 lt!225299) (not ((_ is Intermediate!3937) lt!225299))))))

(declare-fun b!497806 () Bool)

(assert (=> b!497806 (= e!291763 (not e!291765))))

(declare-fun res!300082 () Bool)

(assert (=> b!497806 (=> res!300082 e!291765)))

(declare-fun lt!225298 () (_ BitVec 32))

(assert (=> b!497806 (= res!300082 (= lt!225299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225298 lt!225303 lt!225304 mask!3524)))))

(assert (=> b!497806 (= lt!225299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225301 (select (arr!15473 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497806 (= lt!225298 (toIndex!0 lt!225303 mask!3524))))

(assert (=> b!497806 (= lt!225303 (select (store (arr!15473 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497806 (= lt!225301 (toIndex!0 (select (arr!15473 a!3235) j!176) mask!3524))))

(assert (=> b!497806 (= lt!225304 (array!32184 (store (arr!15473 a!3235) i!1204 k0!2280) (size!15838 a!3235)))))

(assert (=> b!497806 e!291761))

(declare-fun res!300084 () Bool)

(assert (=> b!497806 (=> (not res!300084) (not e!291761))))

(assert (=> b!497806 (= res!300084 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225297 () Unit!14818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14818)

(assert (=> b!497806 (= lt!225297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45348 res!300087) b!497797))

(assert (= (and b!497797 res!300092) b!497795))

(assert (= (and b!497795 res!300080) b!497803))

(assert (= (and b!497803 res!300090) b!497802))

(assert (= (and b!497802 res!300089) b!497793))

(assert (= (and b!497793 res!300088) b!497804))

(assert (= (and b!497804 res!300085) b!497798))

(assert (= (and b!497798 res!300083) b!497806))

(assert (= (and b!497806 res!300084) b!497799))

(assert (= (and b!497806 (not res!300082)) b!497805))

(assert (= (and b!497805 (not res!300091)) b!497801))

(assert (= (and b!497801 c!59133) b!497796))

(assert (= (and b!497801 (not c!59133)) b!497792))

(assert (= (and b!497796 res!300086) b!497800))

(assert (= (and b!497801 (not res!300081)) b!497794))

(declare-fun m!478603 () Bool)

(assert (=> b!497793 m!478603))

(declare-fun m!478605 () Bool)

(assert (=> b!497795 m!478605))

(assert (=> b!497795 m!478605))

(declare-fun m!478607 () Bool)

(assert (=> b!497795 m!478607))

(declare-fun m!478609 () Bool)

(assert (=> b!497798 m!478609))

(declare-fun m!478611 () Bool)

(assert (=> b!497802 m!478611))

(declare-fun m!478613 () Bool)

(assert (=> b!497804 m!478613))

(declare-fun m!478615 () Bool)

(assert (=> b!497803 m!478615))

(declare-fun m!478617 () Bool)

(assert (=> b!497794 m!478617))

(declare-fun m!478619 () Bool)

(assert (=> b!497806 m!478619))

(declare-fun m!478621 () Bool)

(assert (=> b!497806 m!478621))

(declare-fun m!478623 () Bool)

(assert (=> b!497806 m!478623))

(declare-fun m!478625 () Bool)

(assert (=> b!497806 m!478625))

(assert (=> b!497806 m!478605))

(declare-fun m!478627 () Bool)

(assert (=> b!497806 m!478627))

(assert (=> b!497806 m!478605))

(declare-fun m!478629 () Bool)

(assert (=> b!497806 m!478629))

(assert (=> b!497806 m!478605))

(declare-fun m!478631 () Bool)

(assert (=> b!497806 m!478631))

(declare-fun m!478633 () Bool)

(assert (=> b!497806 m!478633))

(declare-fun m!478635 () Bool)

(assert (=> start!45348 m!478635))

(declare-fun m!478637 () Bool)

(assert (=> start!45348 m!478637))

(assert (=> b!497799 m!478605))

(assert (=> b!497799 m!478605))

(declare-fun m!478639 () Bool)

(assert (=> b!497799 m!478639))

(declare-fun m!478641 () Bool)

(assert (=> b!497801 m!478641))

(assert (=> b!497801 m!478605))

(declare-fun m!478643 () Bool)

(assert (=> b!497796 m!478643))

(assert (=> b!497796 m!478617))

(check-sat (not b!497795) (not b!497794) (not b!497806) (not b!497796) (not start!45348) (not b!497793) (not b!497799) (not b!497803) (not b!497798) (not b!497802) (not b!497804))
(check-sat)
