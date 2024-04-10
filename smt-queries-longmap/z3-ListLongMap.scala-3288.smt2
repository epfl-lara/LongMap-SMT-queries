; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45674 () Bool)

(assert start!45674)

(declare-fun b!504115 () Bool)

(declare-datatypes ((Unit!15324 0))(
  ( (Unit!15325) )
))
(declare-fun e!295185 () Unit!15324)

(declare-fun Unit!15326 () Unit!15324)

(assert (=> b!504115 (= e!295185 Unit!15326)))

(declare-fun b!504116 () Bool)

(declare-fun Unit!15327 () Unit!15324)

(assert (=> b!504116 (= e!295185 Unit!15327)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4062 0))(
  ( (MissingZero!4062 (index!18436 (_ BitVec 32))) (Found!4062 (index!18437 (_ BitVec 32))) (Intermediate!4062 (undefined!4874 Bool) (index!18438 (_ BitVec 32)) (x!47455 (_ BitVec 32))) (Undefined!4062) (MissingVacant!4062 (index!18439 (_ BitVec 32))) )
))
(declare-fun lt!229462 () SeekEntryResult!4062)

(declare-fun lt!229463 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!229465 () Unit!15324)

(declare-datatypes ((array!32430 0))(
  ( (array!32431 (arr!15595 (Array (_ BitVec 32) (_ BitVec 64))) (size!15959 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32430)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32430 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15324)

(assert (=> b!504116 (= lt!229465 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229463 #b00000000000000000000000000000000 (index!18438 lt!229462) (x!47455 lt!229462) mask!3524))))

(declare-fun lt!229470 () (_ BitVec 64))

(declare-fun lt!229468 () array!32430)

(declare-fun res!305337 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32430 (_ BitVec 32)) SeekEntryResult!4062)

(assert (=> b!504116 (= res!305337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229463 lt!229470 lt!229468 mask!3524) (Intermediate!4062 false (index!18438 lt!229462) (x!47455 lt!229462))))))

(declare-fun e!295186 () Bool)

(assert (=> b!504116 (=> (not res!305337) (not e!295186))))

(assert (=> b!504116 e!295186))

(declare-fun b!504117 () Bool)

(declare-fun e!295188 () Bool)

(assert (=> b!504117 (= e!295188 true)))

(declare-fun lt!229466 () SeekEntryResult!4062)

(assert (=> b!504117 (= lt!229466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229463 lt!229470 lt!229468 mask!3524))))

(declare-fun b!504118 () Bool)

(declare-fun e!295183 () Bool)

(declare-fun e!295184 () Bool)

(assert (=> b!504118 (= e!295183 (not e!295184))))

(declare-fun res!305340 () Bool)

(assert (=> b!504118 (=> res!305340 e!295184)))

(declare-fun lt!229467 () (_ BitVec 32))

(assert (=> b!504118 (= res!305340 (= lt!229462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229467 lt!229470 lt!229468 mask!3524)))))

(assert (=> b!504118 (= lt!229462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229463 (select (arr!15595 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504118 (= lt!229467 (toIndex!0 lt!229470 mask!3524))))

(assert (=> b!504118 (= lt!229470 (select (store (arr!15595 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504118 (= lt!229463 (toIndex!0 (select (arr!15595 a!3235) j!176) mask!3524))))

(assert (=> b!504118 (= lt!229468 (array!32431 (store (arr!15595 a!3235) i!1204 k0!2280) (size!15959 a!3235)))))

(declare-fun e!295181 () Bool)

(assert (=> b!504118 e!295181))

(declare-fun res!305336 () Bool)

(assert (=> b!504118 (=> (not res!305336) (not e!295181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32430 (_ BitVec 32)) Bool)

(assert (=> b!504118 (= res!305336 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229461 () Unit!15324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15324)

(assert (=> b!504118 (= lt!229461 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504119 () Bool)

(assert (=> b!504119 (= e!295184 e!295188)))

(declare-fun res!305348 () Bool)

(assert (=> b!504119 (=> res!305348 e!295188)))

(assert (=> b!504119 (= res!305348 (or (bvsgt (x!47455 lt!229462) #b01111111111111111111111111111110) (bvslt lt!229463 #b00000000000000000000000000000000) (bvsge lt!229463 (size!15959 a!3235)) (bvslt (index!18438 lt!229462) #b00000000000000000000000000000000) (bvsge (index!18438 lt!229462) (size!15959 a!3235)) (not (= lt!229462 (Intermediate!4062 false (index!18438 lt!229462) (x!47455 lt!229462))))))))

(assert (=> b!504119 (= (index!18438 lt!229462) i!1204)))

(declare-fun lt!229469 () Unit!15324)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32430 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15324)

(assert (=> b!504119 (= lt!229469 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229463 #b00000000000000000000000000000000 (index!18438 lt!229462) (x!47455 lt!229462) mask!3524))))

(assert (=> b!504119 (and (or (= (select (arr!15595 a!3235) (index!18438 lt!229462)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15595 a!3235) (index!18438 lt!229462)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15595 a!3235) (index!18438 lt!229462)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15595 a!3235) (index!18438 lt!229462)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229471 () Unit!15324)

(assert (=> b!504119 (= lt!229471 e!295185)))

(declare-fun c!59669 () Bool)

(assert (=> b!504119 (= c!59669 (= (select (arr!15595 a!3235) (index!18438 lt!229462)) (select (arr!15595 a!3235) j!176)))))

(assert (=> b!504119 (and (bvslt (x!47455 lt!229462) #b01111111111111111111111111111110) (or (= (select (arr!15595 a!3235) (index!18438 lt!229462)) (select (arr!15595 a!3235) j!176)) (= (select (arr!15595 a!3235) (index!18438 lt!229462)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15595 a!3235) (index!18438 lt!229462)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504120 () Bool)

(declare-fun res!305345 () Bool)

(assert (=> b!504120 (=> (not res!305345) (not e!295183))))

(declare-datatypes ((List!9753 0))(
  ( (Nil!9750) (Cons!9749 (h!10626 (_ BitVec 64)) (t!15981 List!9753)) )
))
(declare-fun arrayNoDuplicates!0 (array!32430 (_ BitVec 32) List!9753) Bool)

(assert (=> b!504120 (= res!305345 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9750))))

(declare-fun b!504121 () Bool)

(assert (=> b!504121 (= e!295186 false)))

(declare-fun b!504122 () Bool)

(declare-fun res!305339 () Bool)

(declare-fun e!295187 () Bool)

(assert (=> b!504122 (=> (not res!305339) (not e!295187))))

(declare-fun arrayContainsKey!0 (array!32430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504122 (= res!305339 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504123 () Bool)

(declare-fun res!305343 () Bool)

(assert (=> b!504123 (=> res!305343 e!295188)))

(declare-fun e!295180 () Bool)

(assert (=> b!504123 (= res!305343 e!295180)))

(declare-fun res!305347 () Bool)

(assert (=> b!504123 (=> (not res!305347) (not e!295180))))

(assert (=> b!504123 (= res!305347 (bvsgt #b00000000000000000000000000000000 (x!47455 lt!229462)))))

(declare-fun res!305342 () Bool)

(assert (=> start!45674 (=> (not res!305342) (not e!295187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45674 (= res!305342 (validMask!0 mask!3524))))

(assert (=> start!45674 e!295187))

(assert (=> start!45674 true))

(declare-fun array_inv!11391 (array!32430) Bool)

(assert (=> start!45674 (array_inv!11391 a!3235)))

(declare-fun b!504124 () Bool)

(declare-fun res!305344 () Bool)

(assert (=> b!504124 (=> res!305344 e!295184)))

(get-info :version)

(assert (=> b!504124 (= res!305344 (or (undefined!4874 lt!229462) (not ((_ is Intermediate!4062) lt!229462))))))

(declare-fun b!504125 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32430 (_ BitVec 32)) SeekEntryResult!4062)

(assert (=> b!504125 (= e!295180 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229463 (index!18438 lt!229462) (select (arr!15595 a!3235) j!176) a!3235 mask!3524) (Found!4062 j!176))))))

(declare-fun b!504126 () Bool)

(declare-fun res!305335 () Bool)

(assert (=> b!504126 (=> (not res!305335) (not e!295187))))

(assert (=> b!504126 (= res!305335 (and (= (size!15959 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15959 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15959 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504127 () Bool)

(declare-fun res!305346 () Bool)

(assert (=> b!504127 (=> (not res!305346) (not e!295187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504127 (= res!305346 (validKeyInArray!0 (select (arr!15595 a!3235) j!176)))))

(declare-fun b!504128 () Bool)

(declare-fun res!305338 () Bool)

(assert (=> b!504128 (=> (not res!305338) (not e!295183))))

(assert (=> b!504128 (= res!305338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504129 () Bool)

(declare-fun res!305341 () Bool)

(assert (=> b!504129 (=> (not res!305341) (not e!295187))))

(assert (=> b!504129 (= res!305341 (validKeyInArray!0 k0!2280))))

(declare-fun b!504130 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32430 (_ BitVec 32)) SeekEntryResult!4062)

(assert (=> b!504130 (= e!295181 (= (seekEntryOrOpen!0 (select (arr!15595 a!3235) j!176) a!3235 mask!3524) (Found!4062 j!176)))))

(declare-fun b!504131 () Bool)

(assert (=> b!504131 (= e!295187 e!295183)))

(declare-fun res!305334 () Bool)

(assert (=> b!504131 (=> (not res!305334) (not e!295183))))

(declare-fun lt!229464 () SeekEntryResult!4062)

(assert (=> b!504131 (= res!305334 (or (= lt!229464 (MissingZero!4062 i!1204)) (= lt!229464 (MissingVacant!4062 i!1204))))))

(assert (=> b!504131 (= lt!229464 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45674 res!305342) b!504126))

(assert (= (and b!504126 res!305335) b!504127))

(assert (= (and b!504127 res!305346) b!504129))

(assert (= (and b!504129 res!305341) b!504122))

(assert (= (and b!504122 res!305339) b!504131))

(assert (= (and b!504131 res!305334) b!504128))

(assert (= (and b!504128 res!305338) b!504120))

(assert (= (and b!504120 res!305345) b!504118))

(assert (= (and b!504118 res!305336) b!504130))

(assert (= (and b!504118 (not res!305340)) b!504124))

(assert (= (and b!504124 (not res!305344)) b!504119))

(assert (= (and b!504119 c!59669) b!504116))

(assert (= (and b!504119 (not c!59669)) b!504115))

(assert (= (and b!504116 res!305337) b!504121))

(assert (= (and b!504119 (not res!305348)) b!504123))

(assert (= (and b!504123 res!305347) b!504125))

(assert (= (and b!504123 (not res!305343)) b!504117))

(declare-fun m!484885 () Bool)

(assert (=> b!504130 m!484885))

(assert (=> b!504130 m!484885))

(declare-fun m!484887 () Bool)

(assert (=> b!504130 m!484887))

(declare-fun m!484889 () Bool)

(assert (=> b!504119 m!484889))

(declare-fun m!484891 () Bool)

(assert (=> b!504119 m!484891))

(assert (=> b!504119 m!484885))

(declare-fun m!484893 () Bool)

(assert (=> b!504128 m!484893))

(declare-fun m!484895 () Bool)

(assert (=> b!504117 m!484895))

(assert (=> b!504125 m!484885))

(assert (=> b!504125 m!484885))

(declare-fun m!484897 () Bool)

(assert (=> b!504125 m!484897))

(declare-fun m!484899 () Bool)

(assert (=> b!504129 m!484899))

(declare-fun m!484901 () Bool)

(assert (=> b!504122 m!484901))

(declare-fun m!484903 () Bool)

(assert (=> b!504116 m!484903))

(assert (=> b!504116 m!484895))

(declare-fun m!484905 () Bool)

(assert (=> start!45674 m!484905))

(declare-fun m!484907 () Bool)

(assert (=> start!45674 m!484907))

(declare-fun m!484909 () Bool)

(assert (=> b!504120 m!484909))

(assert (=> b!504127 m!484885))

(assert (=> b!504127 m!484885))

(declare-fun m!484911 () Bool)

(assert (=> b!504127 m!484911))

(declare-fun m!484913 () Bool)

(assert (=> b!504131 m!484913))

(declare-fun m!484915 () Bool)

(assert (=> b!504118 m!484915))

(declare-fun m!484917 () Bool)

(assert (=> b!504118 m!484917))

(declare-fun m!484919 () Bool)

(assert (=> b!504118 m!484919))

(declare-fun m!484921 () Bool)

(assert (=> b!504118 m!484921))

(assert (=> b!504118 m!484885))

(declare-fun m!484923 () Bool)

(assert (=> b!504118 m!484923))

(assert (=> b!504118 m!484885))

(declare-fun m!484925 () Bool)

(assert (=> b!504118 m!484925))

(assert (=> b!504118 m!484885))

(declare-fun m!484927 () Bool)

(assert (=> b!504118 m!484927))

(declare-fun m!484929 () Bool)

(assert (=> b!504118 m!484929))

(check-sat (not b!504118) (not b!504128) (not b!504122) (not b!504125) (not b!504120) (not b!504116) (not b!504130) (not b!504127) (not b!504119) (not b!504131) (not b!504117) (not b!504129) (not start!45674))
(check-sat)
