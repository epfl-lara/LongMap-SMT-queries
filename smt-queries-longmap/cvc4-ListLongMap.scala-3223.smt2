; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45088 () Bool)

(assert start!45088)

(declare-fun b!494974 () Bool)

(declare-fun e!290404 () Bool)

(declare-fun e!290402 () Bool)

(assert (=> b!494974 (= e!290404 (not e!290402))))

(declare-fun res!297549 () Bool)

(assert (=> b!494974 (=> res!297549 e!290402)))

(declare-fun lt!224081 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32033 0))(
  ( (array!32034 (arr!15401 (Array (_ BitVec 32) (_ BitVec 64))) (size!15765 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32033)

(declare-datatypes ((SeekEntryResult!3868 0))(
  ( (MissingZero!3868 (index!17651 (_ BitVec 32))) (Found!3868 (index!17652 (_ BitVec 32))) (Intermediate!3868 (undefined!4680 Bool) (index!17653 (_ BitVec 32)) (x!46714 (_ BitVec 32))) (Undefined!3868) (MissingVacant!3868 (index!17654 (_ BitVec 32))) )
))
(declare-fun lt!224079 () SeekEntryResult!3868)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32033 (_ BitVec 32)) SeekEntryResult!3868)

(assert (=> b!494974 (= res!297549 (= lt!224079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224081 (select (store (arr!15401 a!3235) i!1204 k!2280) j!176) (array!32034 (store (arr!15401 a!3235) i!1204 k!2280) (size!15765 a!3235)) mask!3524)))))

(declare-fun lt!224082 () (_ BitVec 32))

(assert (=> b!494974 (= lt!224079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224082 (select (arr!15401 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494974 (= lt!224081 (toIndex!0 (select (store (arr!15401 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494974 (= lt!224082 (toIndex!0 (select (arr!15401 a!3235) j!176) mask!3524))))

(declare-fun e!290403 () Bool)

(assert (=> b!494974 e!290403))

(declare-fun res!297547 () Bool)

(assert (=> b!494974 (=> (not res!297547) (not e!290403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32033 (_ BitVec 32)) Bool)

(assert (=> b!494974 (= res!297547 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14682 0))(
  ( (Unit!14683) )
))
(declare-fun lt!224083 () Unit!14682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14682)

(assert (=> b!494974 (= lt!224083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494975 () Bool)

(declare-fun res!297545 () Bool)

(declare-fun e!290406 () Bool)

(assert (=> b!494975 (=> (not res!297545) (not e!290406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494975 (= res!297545 (validKeyInArray!0 k!2280))))

(declare-fun b!494976 () Bool)

(declare-fun res!297544 () Bool)

(assert (=> b!494976 (=> (not res!297544) (not e!290404))))

(declare-datatypes ((List!9559 0))(
  ( (Nil!9556) (Cons!9555 (h!10423 (_ BitVec 64)) (t!15787 List!9559)) )
))
(declare-fun arrayNoDuplicates!0 (array!32033 (_ BitVec 32) List!9559) Bool)

(assert (=> b!494976 (= res!297544 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9556))))

(declare-fun res!297551 () Bool)

(assert (=> start!45088 (=> (not res!297551) (not e!290406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45088 (= res!297551 (validMask!0 mask!3524))))

(assert (=> start!45088 e!290406))

(assert (=> start!45088 true))

(declare-fun array_inv!11197 (array!32033) Bool)

(assert (=> start!45088 (array_inv!11197 a!3235)))

(declare-fun b!494977 () Bool)

(assert (=> b!494977 (= e!290406 e!290404)))

(declare-fun res!297548 () Bool)

(assert (=> b!494977 (=> (not res!297548) (not e!290404))))

(declare-fun lt!224080 () SeekEntryResult!3868)

(assert (=> b!494977 (= res!297548 (or (= lt!224080 (MissingZero!3868 i!1204)) (= lt!224080 (MissingVacant!3868 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32033 (_ BitVec 32)) SeekEntryResult!3868)

(assert (=> b!494977 (= lt!224080 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494978 () Bool)

(assert (=> b!494978 (= e!290403 (= (seekEntryOrOpen!0 (select (arr!15401 a!3235) j!176) a!3235 mask!3524) (Found!3868 j!176)))))

(declare-fun b!494979 () Bool)

(declare-fun res!297553 () Bool)

(assert (=> b!494979 (=> (not res!297553) (not e!290406))))

(assert (=> b!494979 (= res!297553 (validKeyInArray!0 (select (arr!15401 a!3235) j!176)))))

(declare-fun b!494980 () Bool)

(declare-fun res!297546 () Bool)

(assert (=> b!494980 (=> (not res!297546) (not e!290406))))

(assert (=> b!494980 (= res!297546 (and (= (size!15765 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15765 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15765 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494981 () Bool)

(declare-fun res!297554 () Bool)

(assert (=> b!494981 (=> (not res!297554) (not e!290404))))

(assert (=> b!494981 (= res!297554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494982 () Bool)

(assert (=> b!494982 (= e!290402 (or (not (= (select (arr!15401 a!3235) (index!17653 lt!224079)) (select (arr!15401 a!3235) j!176))) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!494982 (and (bvslt (x!46714 lt!224079) #b01111111111111111111111111111110) (or (= (select (arr!15401 a!3235) (index!17653 lt!224079)) (select (arr!15401 a!3235) j!176)) (= (select (arr!15401 a!3235) (index!17653 lt!224079)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15401 a!3235) (index!17653 lt!224079)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494983 () Bool)

(declare-fun res!297550 () Bool)

(assert (=> b!494983 (=> res!297550 e!290402)))

(assert (=> b!494983 (= res!297550 (or (undefined!4680 lt!224079) (not (is-Intermediate!3868 lt!224079))))))

(declare-fun b!494984 () Bool)

(declare-fun res!297552 () Bool)

(assert (=> b!494984 (=> (not res!297552) (not e!290406))))

(declare-fun arrayContainsKey!0 (array!32033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494984 (= res!297552 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45088 res!297551) b!494980))

(assert (= (and b!494980 res!297546) b!494979))

(assert (= (and b!494979 res!297553) b!494975))

(assert (= (and b!494975 res!297545) b!494984))

(assert (= (and b!494984 res!297552) b!494977))

(assert (= (and b!494977 res!297548) b!494981))

(assert (= (and b!494981 res!297554) b!494976))

(assert (= (and b!494976 res!297544) b!494974))

(assert (= (and b!494974 res!297547) b!494978))

(assert (= (and b!494974 (not res!297549)) b!494983))

(assert (= (and b!494983 (not res!297550)) b!494982))

(declare-fun m!476119 () Bool)

(assert (=> b!494979 m!476119))

(assert (=> b!494979 m!476119))

(declare-fun m!476121 () Bool)

(assert (=> b!494979 m!476121))

(declare-fun m!476123 () Bool)

(assert (=> b!494975 m!476123))

(declare-fun m!476125 () Bool)

(assert (=> b!494976 m!476125))

(declare-fun m!476127 () Bool)

(assert (=> start!45088 m!476127))

(declare-fun m!476129 () Bool)

(assert (=> start!45088 m!476129))

(declare-fun m!476131 () Bool)

(assert (=> b!494981 m!476131))

(declare-fun m!476133 () Bool)

(assert (=> b!494974 m!476133))

(declare-fun m!476135 () Bool)

(assert (=> b!494974 m!476135))

(declare-fun m!476137 () Bool)

(assert (=> b!494974 m!476137))

(assert (=> b!494974 m!476119))

(declare-fun m!476139 () Bool)

(assert (=> b!494974 m!476139))

(assert (=> b!494974 m!476119))

(declare-fun m!476141 () Bool)

(assert (=> b!494974 m!476141))

(assert (=> b!494974 m!476119))

(declare-fun m!476143 () Bool)

(assert (=> b!494974 m!476143))

(assert (=> b!494974 m!476137))

(declare-fun m!476145 () Bool)

(assert (=> b!494974 m!476145))

(assert (=> b!494974 m!476137))

(declare-fun m!476147 () Bool)

(assert (=> b!494974 m!476147))

(declare-fun m!476149 () Bool)

(assert (=> b!494982 m!476149))

(assert (=> b!494982 m!476119))

(declare-fun m!476151 () Bool)

(assert (=> b!494984 m!476151))

(declare-fun m!476153 () Bool)

(assert (=> b!494977 m!476153))

(assert (=> b!494978 m!476119))

(assert (=> b!494978 m!476119))

(declare-fun m!476155 () Bool)

(assert (=> b!494978 m!476155))

(push 1)

