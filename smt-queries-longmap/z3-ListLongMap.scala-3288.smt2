; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45660 () Bool)

(assert start!45660)

(declare-fun res!305172 () Bool)

(declare-fun e!294980 () Bool)

(assert (=> start!45660 (=> (not res!305172) (not e!294980))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45660 (= res!305172 (validMask!0 mask!3524))))

(assert (=> start!45660 e!294980))

(assert (=> start!45660 true))

(declare-datatypes ((array!32426 0))(
  ( (array!32427 (arr!15593 (Array (_ BitVec 32) (_ BitVec 64))) (size!15958 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32426)

(declare-fun array_inv!11476 (array!32426) Bool)

(assert (=> start!45660 (array_inv!11476 a!3235)))

(declare-fun b!503793 () Bool)

(declare-fun e!294985 () Bool)

(assert (=> b!503793 (= e!294985 false)))

(declare-fun b!503794 () Bool)

(declare-fun lt!229201 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4057 0))(
  ( (MissingZero!4057 (index!18416 (_ BitVec 32))) (Found!4057 (index!18417 (_ BitVec 32))) (Intermediate!4057 (undefined!4869 Bool) (index!18418 (_ BitVec 32)) (x!47445 (_ BitVec 32))) (Undefined!4057) (MissingVacant!4057 (index!18419 (_ BitVec 32))) )
))
(declare-fun lt!229197 () SeekEntryResult!4057)

(declare-fun e!294981 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32426 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!503794 (= e!294981 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229201 (index!18418 lt!229197) (select (arr!15593 a!3235) j!176) a!3235 mask!3524) (Found!4057 j!176))))))

(declare-fun b!503795 () Bool)

(declare-fun e!294987 () Bool)

(declare-fun e!294986 () Bool)

(assert (=> b!503795 (= e!294987 (not e!294986))))

(declare-fun res!305170 () Bool)

(assert (=> b!503795 (=> res!305170 e!294986)))

(declare-fun lt!229194 () (_ BitVec 32))

(declare-fun lt!229204 () (_ BitVec 64))

(declare-fun lt!229196 () array!32426)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32426 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!503795 (= res!305170 (= lt!229197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229194 lt!229204 lt!229196 mask!3524)))))

(assert (=> b!503795 (= lt!229197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229201 (select (arr!15593 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503795 (= lt!229194 (toIndex!0 lt!229204 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503795 (= lt!229204 (select (store (arr!15593 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503795 (= lt!229201 (toIndex!0 (select (arr!15593 a!3235) j!176) mask!3524))))

(assert (=> b!503795 (= lt!229196 (array!32427 (store (arr!15593 a!3235) i!1204 k0!2280) (size!15958 a!3235)))))

(declare-fun e!294982 () Bool)

(assert (=> b!503795 e!294982))

(declare-fun res!305165 () Bool)

(assert (=> b!503795 (=> (not res!305165) (not e!294982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32426 (_ BitVec 32)) Bool)

(assert (=> b!503795 (= res!305165 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15298 0))(
  ( (Unit!15299) )
))
(declare-fun lt!229200 () Unit!15298)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15298)

(assert (=> b!503795 (= lt!229200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503796 () Bool)

(declare-fun res!305161 () Bool)

(assert (=> b!503796 (=> (not res!305161) (not e!294980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503796 (= res!305161 (validKeyInArray!0 k0!2280))))

(declare-fun b!503797 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32426 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!503797 (= e!294982 (= (seekEntryOrOpen!0 (select (arr!15593 a!3235) j!176) a!3235 mask!3524) (Found!4057 j!176)))))

(declare-fun b!503798 () Bool)

(declare-fun e!294983 () Bool)

(assert (=> b!503798 (= e!294983 true)))

(declare-fun lt!229198 () SeekEntryResult!4057)

(assert (=> b!503798 (= lt!229198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229201 lt!229204 lt!229196 mask!3524))))

(declare-fun b!503799 () Bool)

(declare-fun e!294984 () Unit!15298)

(declare-fun Unit!15300 () Unit!15298)

(assert (=> b!503799 (= e!294984 Unit!15300)))

(declare-fun b!503800 () Bool)

(declare-fun res!305168 () Bool)

(assert (=> b!503800 (=> res!305168 e!294986)))

(get-info :version)

(assert (=> b!503800 (= res!305168 (or (undefined!4869 lt!229197) (not ((_ is Intermediate!4057) lt!229197))))))

(declare-fun b!503801 () Bool)

(declare-fun res!305171 () Bool)

(assert (=> b!503801 (=> res!305171 e!294983)))

(assert (=> b!503801 (= res!305171 e!294981)))

(declare-fun res!305167 () Bool)

(assert (=> b!503801 (=> (not res!305167) (not e!294981))))

(assert (=> b!503801 (= res!305167 (bvsgt #b00000000000000000000000000000000 (x!47445 lt!229197)))))

(declare-fun b!503802 () Bool)

(assert (=> b!503802 (= e!294986 e!294983)))

(declare-fun res!305164 () Bool)

(assert (=> b!503802 (=> res!305164 e!294983)))

(assert (=> b!503802 (= res!305164 (or (bvsgt (x!47445 lt!229197) #b01111111111111111111111111111110) (bvslt lt!229201 #b00000000000000000000000000000000) (bvsge lt!229201 (size!15958 a!3235)) (bvslt (index!18418 lt!229197) #b00000000000000000000000000000000) (bvsge (index!18418 lt!229197) (size!15958 a!3235)) (not (= lt!229197 (Intermediate!4057 false (index!18418 lt!229197) (x!47445 lt!229197))))))))

(assert (=> b!503802 (= (index!18418 lt!229197) i!1204)))

(declare-fun lt!229202 () Unit!15298)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32426 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15298)

(assert (=> b!503802 (= lt!229202 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229201 #b00000000000000000000000000000000 (index!18418 lt!229197) (x!47445 lt!229197) mask!3524))))

(assert (=> b!503802 (and (or (= (select (arr!15593 a!3235) (index!18418 lt!229197)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15593 a!3235) (index!18418 lt!229197)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15593 a!3235) (index!18418 lt!229197)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15593 a!3235) (index!18418 lt!229197)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229199 () Unit!15298)

(assert (=> b!503802 (= lt!229199 e!294984)))

(declare-fun c!59595 () Bool)

(assert (=> b!503802 (= c!59595 (= (select (arr!15593 a!3235) (index!18418 lt!229197)) (select (arr!15593 a!3235) j!176)))))

(assert (=> b!503802 (and (bvslt (x!47445 lt!229197) #b01111111111111111111111111111110) (or (= (select (arr!15593 a!3235) (index!18418 lt!229197)) (select (arr!15593 a!3235) j!176)) (= (select (arr!15593 a!3235) (index!18418 lt!229197)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15593 a!3235) (index!18418 lt!229197)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503803 () Bool)

(declare-fun res!305169 () Bool)

(assert (=> b!503803 (=> (not res!305169) (not e!294987))))

(declare-datatypes ((List!9790 0))(
  ( (Nil!9787) (Cons!9786 (h!10663 (_ BitVec 64)) (t!16009 List!9790)) )
))
(declare-fun arrayNoDuplicates!0 (array!32426 (_ BitVec 32) List!9790) Bool)

(assert (=> b!503803 (= res!305169 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9787))))

(declare-fun b!503804 () Bool)

(declare-fun Unit!15301 () Unit!15298)

(assert (=> b!503804 (= e!294984 Unit!15301)))

(declare-fun lt!229195 () Unit!15298)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32426 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15298)

(assert (=> b!503804 (= lt!229195 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229201 #b00000000000000000000000000000000 (index!18418 lt!229197) (x!47445 lt!229197) mask!3524))))

(declare-fun res!305166 () Bool)

(assert (=> b!503804 (= res!305166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229201 lt!229204 lt!229196 mask!3524) (Intermediate!4057 false (index!18418 lt!229197) (x!47445 lt!229197))))))

(assert (=> b!503804 (=> (not res!305166) (not e!294985))))

(assert (=> b!503804 e!294985))

(declare-fun b!503805 () Bool)

(declare-fun res!305160 () Bool)

(assert (=> b!503805 (=> (not res!305160) (not e!294980))))

(declare-fun arrayContainsKey!0 (array!32426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503805 (= res!305160 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503806 () Bool)

(assert (=> b!503806 (= e!294980 e!294987)))

(declare-fun res!305162 () Bool)

(assert (=> b!503806 (=> (not res!305162) (not e!294987))))

(declare-fun lt!229203 () SeekEntryResult!4057)

(assert (=> b!503806 (= res!305162 (or (= lt!229203 (MissingZero!4057 i!1204)) (= lt!229203 (MissingVacant!4057 i!1204))))))

(assert (=> b!503806 (= lt!229203 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503807 () Bool)

(declare-fun res!305174 () Bool)

(assert (=> b!503807 (=> (not res!305174) (not e!294987))))

(assert (=> b!503807 (= res!305174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503808 () Bool)

(declare-fun res!305163 () Bool)

(assert (=> b!503808 (=> (not res!305163) (not e!294980))))

(assert (=> b!503808 (= res!305163 (and (= (size!15958 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15958 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15958 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503809 () Bool)

(declare-fun res!305173 () Bool)

(assert (=> b!503809 (=> (not res!305173) (not e!294980))))

(assert (=> b!503809 (= res!305173 (validKeyInArray!0 (select (arr!15593 a!3235) j!176)))))

(assert (= (and start!45660 res!305172) b!503808))

(assert (= (and b!503808 res!305163) b!503809))

(assert (= (and b!503809 res!305173) b!503796))

(assert (= (and b!503796 res!305161) b!503805))

(assert (= (and b!503805 res!305160) b!503806))

(assert (= (and b!503806 res!305162) b!503807))

(assert (= (and b!503807 res!305174) b!503803))

(assert (= (and b!503803 res!305169) b!503795))

(assert (= (and b!503795 res!305165) b!503797))

(assert (= (and b!503795 (not res!305170)) b!503800))

(assert (= (and b!503800 (not res!305168)) b!503802))

(assert (= (and b!503802 c!59595) b!503804))

(assert (= (and b!503802 (not c!59595)) b!503799))

(assert (= (and b!503804 res!305166) b!503793))

(assert (= (and b!503802 (not res!305164)) b!503801))

(assert (= (and b!503801 res!305167) b!503794))

(assert (= (and b!503801 (not res!305171)) b!503798))

(declare-fun m!484087 () Bool)

(assert (=> b!503807 m!484087))

(declare-fun m!484089 () Bool)

(assert (=> b!503798 m!484089))

(declare-fun m!484091 () Bool)

(assert (=> b!503802 m!484091))

(declare-fun m!484093 () Bool)

(assert (=> b!503802 m!484093))

(declare-fun m!484095 () Bool)

(assert (=> b!503802 m!484095))

(declare-fun m!484097 () Bool)

(assert (=> start!45660 m!484097))

(declare-fun m!484099 () Bool)

(assert (=> start!45660 m!484099))

(assert (=> b!503809 m!484095))

(assert (=> b!503809 m!484095))

(declare-fun m!484101 () Bool)

(assert (=> b!503809 m!484101))

(declare-fun m!484103 () Bool)

(assert (=> b!503803 m!484103))

(declare-fun m!484105 () Bool)

(assert (=> b!503806 m!484105))

(assert (=> b!503797 m!484095))

(assert (=> b!503797 m!484095))

(declare-fun m!484107 () Bool)

(assert (=> b!503797 m!484107))

(declare-fun m!484109 () Bool)

(assert (=> b!503804 m!484109))

(assert (=> b!503804 m!484089))

(assert (=> b!503794 m!484095))

(assert (=> b!503794 m!484095))

(declare-fun m!484111 () Bool)

(assert (=> b!503794 m!484111))

(declare-fun m!484113 () Bool)

(assert (=> b!503805 m!484113))

(declare-fun m!484115 () Bool)

(assert (=> b!503796 m!484115))

(declare-fun m!484117 () Bool)

(assert (=> b!503795 m!484117))

(declare-fun m!484119 () Bool)

(assert (=> b!503795 m!484119))

(declare-fun m!484121 () Bool)

(assert (=> b!503795 m!484121))

(declare-fun m!484123 () Bool)

(assert (=> b!503795 m!484123))

(assert (=> b!503795 m!484095))

(declare-fun m!484125 () Bool)

(assert (=> b!503795 m!484125))

(assert (=> b!503795 m!484095))

(declare-fun m!484127 () Bool)

(assert (=> b!503795 m!484127))

(assert (=> b!503795 m!484095))

(declare-fun m!484129 () Bool)

(assert (=> b!503795 m!484129))

(declare-fun m!484131 () Bool)

(assert (=> b!503795 m!484131))

(check-sat (not b!503809) (not b!503796) (not b!503806) (not b!503795) (not b!503807) (not b!503794) (not b!503804) (not b!503802) (not b!503797) (not b!503805) (not b!503803) (not start!45660) (not b!503798))
(check-sat)
