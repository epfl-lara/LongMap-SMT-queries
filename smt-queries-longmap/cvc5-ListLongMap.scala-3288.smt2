; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45672 () Bool)

(assert start!45672)

(declare-fun b!504064 () Bool)

(declare-fun res!305291 () Bool)

(declare-fun e!295160 () Bool)

(assert (=> b!504064 (=> (not res!305291) (not e!295160))))

(declare-datatypes ((array!32428 0))(
  ( (array!32429 (arr!15594 (Array (_ BitVec 32) (_ BitVec 64))) (size!15958 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32428)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504064 (= res!305291 (validKeyInArray!0 (select (arr!15594 a!3235) j!176)))))

(declare-fun b!504065 () Bool)

(declare-fun res!305298 () Bool)

(assert (=> b!504065 (=> (not res!305298) (not e!295160))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!504065 (= res!305298 (and (= (size!15958 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15958 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15958 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504066 () Bool)

(declare-datatypes ((Unit!15320 0))(
  ( (Unit!15321) )
))
(declare-fun e!295161 () Unit!15320)

(declare-fun Unit!15322 () Unit!15320)

(assert (=> b!504066 (= e!295161 Unit!15322)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4061 0))(
  ( (MissingZero!4061 (index!18432 (_ BitVec 32))) (Found!4061 (index!18433 (_ BitVec 32))) (Intermediate!4061 (undefined!4873 Bool) (index!18434 (_ BitVec 32)) (x!47454 (_ BitVec 32))) (Undefined!4061) (MissingVacant!4061 (index!18435 (_ BitVec 32))) )
))
(declare-fun lt!229434 () SeekEntryResult!4061)

(declare-fun lt!229431 () Unit!15320)

(declare-fun lt!229429 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32428 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15320)

(assert (=> b!504066 (= lt!229431 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229429 #b00000000000000000000000000000000 (index!18434 lt!229434) (x!47454 lt!229434) mask!3524))))

(declare-fun lt!229428 () array!32428)

(declare-fun lt!229437 () (_ BitVec 64))

(declare-fun res!305290 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32428 (_ BitVec 32)) SeekEntryResult!4061)

(assert (=> b!504066 (= res!305290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229429 lt!229437 lt!229428 mask!3524) (Intermediate!4061 false (index!18434 lt!229434) (x!47454 lt!229434))))))

(declare-fun e!295153 () Bool)

(assert (=> b!504066 (=> (not res!305290) (not e!295153))))

(assert (=> b!504066 e!295153))

(declare-fun b!504067 () Bool)

(declare-fun e!295157 () Bool)

(declare-fun e!295154 () Bool)

(assert (=> b!504067 (= e!295157 e!295154)))

(declare-fun res!305303 () Bool)

(assert (=> b!504067 (=> res!305303 e!295154)))

(assert (=> b!504067 (= res!305303 (or (bvsgt (x!47454 lt!229434) #b01111111111111111111111111111110) (bvslt lt!229429 #b00000000000000000000000000000000) (bvsge lt!229429 (size!15958 a!3235)) (bvslt (index!18434 lt!229434) #b00000000000000000000000000000000) (bvsge (index!18434 lt!229434) (size!15958 a!3235)) (not (= lt!229434 (Intermediate!4061 false (index!18434 lt!229434) (x!47454 lt!229434))))))))

(assert (=> b!504067 (= (index!18434 lt!229434) i!1204)))

(declare-fun lt!229435 () Unit!15320)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32428 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15320)

(assert (=> b!504067 (= lt!229435 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229429 #b00000000000000000000000000000000 (index!18434 lt!229434) (x!47454 lt!229434) mask!3524))))

(assert (=> b!504067 (and (or (= (select (arr!15594 a!3235) (index!18434 lt!229434)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15594 a!3235) (index!18434 lt!229434)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15594 a!3235) (index!18434 lt!229434)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15594 a!3235) (index!18434 lt!229434)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229430 () Unit!15320)

(assert (=> b!504067 (= lt!229430 e!295161)))

(declare-fun c!59666 () Bool)

(assert (=> b!504067 (= c!59666 (= (select (arr!15594 a!3235) (index!18434 lt!229434)) (select (arr!15594 a!3235) j!176)))))

(assert (=> b!504067 (and (bvslt (x!47454 lt!229434) #b01111111111111111111111111111110) (or (= (select (arr!15594 a!3235) (index!18434 lt!229434)) (select (arr!15594 a!3235) j!176)) (= (select (arr!15594 a!3235) (index!18434 lt!229434)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15594 a!3235) (index!18434 lt!229434)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504068 () Bool)

(declare-fun e!295159 () Bool)

(assert (=> b!504068 (= e!295159 (not e!295157))))

(declare-fun res!305294 () Bool)

(assert (=> b!504068 (=> res!305294 e!295157)))

(declare-fun lt!229433 () (_ BitVec 32))

(assert (=> b!504068 (= res!305294 (= lt!229434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229433 lt!229437 lt!229428 mask!3524)))))

(assert (=> b!504068 (= lt!229434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229429 (select (arr!15594 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504068 (= lt!229433 (toIndex!0 lt!229437 mask!3524))))

(assert (=> b!504068 (= lt!229437 (select (store (arr!15594 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504068 (= lt!229429 (toIndex!0 (select (arr!15594 a!3235) j!176) mask!3524))))

(assert (=> b!504068 (= lt!229428 (array!32429 (store (arr!15594 a!3235) i!1204 k!2280) (size!15958 a!3235)))))

(declare-fun e!295155 () Bool)

(assert (=> b!504068 e!295155))

(declare-fun res!305295 () Bool)

(assert (=> b!504068 (=> (not res!305295) (not e!295155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32428 (_ BitVec 32)) Bool)

(assert (=> b!504068 (= res!305295 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229432 () Unit!15320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15320)

(assert (=> b!504068 (= lt!229432 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504069 () Bool)

(assert (=> b!504069 (= e!295154 true)))

(declare-fun lt!229438 () SeekEntryResult!4061)

(assert (=> b!504069 (= lt!229438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229429 lt!229437 lt!229428 mask!3524))))

(declare-fun e!295156 () Bool)

(declare-fun b!504070 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32428 (_ BitVec 32)) SeekEntryResult!4061)

(assert (=> b!504070 (= e!295156 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229429 (index!18434 lt!229434) (select (arr!15594 a!3235) j!176) a!3235 mask!3524) (Found!4061 j!176))))))

(declare-fun b!504071 () Bool)

(declare-fun res!305293 () Bool)

(assert (=> b!504071 (=> (not res!305293) (not e!295159))))

(declare-datatypes ((List!9752 0))(
  ( (Nil!9749) (Cons!9748 (h!10625 (_ BitVec 64)) (t!15980 List!9752)) )
))
(declare-fun arrayNoDuplicates!0 (array!32428 (_ BitVec 32) List!9752) Bool)

(assert (=> b!504071 (= res!305293 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9749))))

(declare-fun b!504072 () Bool)

(declare-fun res!305301 () Bool)

(assert (=> b!504072 (=> res!305301 e!295157)))

(assert (=> b!504072 (= res!305301 (or (undefined!4873 lt!229434) (not (is-Intermediate!4061 lt!229434))))))

(declare-fun res!305289 () Bool)

(assert (=> start!45672 (=> (not res!305289) (not e!295160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45672 (= res!305289 (validMask!0 mask!3524))))

(assert (=> start!45672 e!295160))

(assert (=> start!45672 true))

(declare-fun array_inv!11390 (array!32428) Bool)

(assert (=> start!45672 (array_inv!11390 a!3235)))

(declare-fun b!504073 () Bool)

(declare-fun Unit!15323 () Unit!15320)

(assert (=> b!504073 (= e!295161 Unit!15323)))

(declare-fun b!504074 () Bool)

(declare-fun res!305299 () Bool)

(assert (=> b!504074 (=> (not res!305299) (not e!295159))))

(assert (=> b!504074 (= res!305299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504075 () Bool)

(assert (=> b!504075 (= e!295153 false)))

(declare-fun b!504076 () Bool)

(assert (=> b!504076 (= e!295160 e!295159)))

(declare-fun res!305302 () Bool)

(assert (=> b!504076 (=> (not res!305302) (not e!295159))))

(declare-fun lt!229436 () SeekEntryResult!4061)

(assert (=> b!504076 (= res!305302 (or (= lt!229436 (MissingZero!4061 i!1204)) (= lt!229436 (MissingVacant!4061 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32428 (_ BitVec 32)) SeekEntryResult!4061)

(assert (=> b!504076 (= lt!229436 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504077 () Bool)

(assert (=> b!504077 (= e!295155 (= (seekEntryOrOpen!0 (select (arr!15594 a!3235) j!176) a!3235 mask!3524) (Found!4061 j!176)))))

(declare-fun b!504078 () Bool)

(declare-fun res!305300 () Bool)

(assert (=> b!504078 (=> (not res!305300) (not e!295160))))

(declare-fun arrayContainsKey!0 (array!32428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504078 (= res!305300 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504079 () Bool)

(declare-fun res!305296 () Bool)

(assert (=> b!504079 (=> (not res!305296) (not e!295160))))

(assert (=> b!504079 (= res!305296 (validKeyInArray!0 k!2280))))

(declare-fun b!504080 () Bool)

(declare-fun res!305297 () Bool)

(assert (=> b!504080 (=> res!305297 e!295154)))

(assert (=> b!504080 (= res!305297 e!295156)))

(declare-fun res!305292 () Bool)

(assert (=> b!504080 (=> (not res!305292) (not e!295156))))

(assert (=> b!504080 (= res!305292 (bvsgt #b00000000000000000000000000000000 (x!47454 lt!229434)))))

(assert (= (and start!45672 res!305289) b!504065))

(assert (= (and b!504065 res!305298) b!504064))

(assert (= (and b!504064 res!305291) b!504079))

(assert (= (and b!504079 res!305296) b!504078))

(assert (= (and b!504078 res!305300) b!504076))

(assert (= (and b!504076 res!305302) b!504074))

(assert (= (and b!504074 res!305299) b!504071))

(assert (= (and b!504071 res!305293) b!504068))

(assert (= (and b!504068 res!305295) b!504077))

(assert (= (and b!504068 (not res!305294)) b!504072))

(assert (= (and b!504072 (not res!305301)) b!504067))

(assert (= (and b!504067 c!59666) b!504066))

(assert (= (and b!504067 (not c!59666)) b!504073))

(assert (= (and b!504066 res!305290) b!504075))

(assert (= (and b!504067 (not res!305303)) b!504080))

(assert (= (and b!504080 res!305292) b!504070))

(assert (= (and b!504080 (not res!305297)) b!504069))

(declare-fun m!484839 () Bool)

(assert (=> b!504078 m!484839))

(declare-fun m!484841 () Bool)

(assert (=> b!504071 m!484841))

(declare-fun m!484843 () Bool)

(assert (=> b!504068 m!484843))

(declare-fun m!484845 () Bool)

(assert (=> b!504068 m!484845))

(declare-fun m!484847 () Bool)

(assert (=> b!504068 m!484847))

(declare-fun m!484849 () Bool)

(assert (=> b!504068 m!484849))

(declare-fun m!484851 () Bool)

(assert (=> b!504068 m!484851))

(declare-fun m!484853 () Bool)

(assert (=> b!504068 m!484853))

(assert (=> b!504068 m!484849))

(declare-fun m!484855 () Bool)

(assert (=> b!504068 m!484855))

(assert (=> b!504068 m!484849))

(declare-fun m!484857 () Bool)

(assert (=> b!504068 m!484857))

(declare-fun m!484859 () Bool)

(assert (=> b!504068 m!484859))

(assert (=> b!504070 m!484849))

(assert (=> b!504070 m!484849))

(declare-fun m!484861 () Bool)

(assert (=> b!504070 m!484861))

(declare-fun m!484863 () Bool)

(assert (=> b!504066 m!484863))

(declare-fun m!484865 () Bool)

(assert (=> b!504066 m!484865))

(declare-fun m!484867 () Bool)

(assert (=> start!45672 m!484867))

(declare-fun m!484869 () Bool)

(assert (=> start!45672 m!484869))

(assert (=> b!504064 m!484849))

(assert (=> b!504064 m!484849))

(declare-fun m!484871 () Bool)

(assert (=> b!504064 m!484871))

(declare-fun m!484873 () Bool)

(assert (=> b!504076 m!484873))

(assert (=> b!504069 m!484865))

(declare-fun m!484875 () Bool)

(assert (=> b!504067 m!484875))

(declare-fun m!484877 () Bool)

(assert (=> b!504067 m!484877))

(assert (=> b!504067 m!484849))

(declare-fun m!484879 () Bool)

(assert (=> b!504079 m!484879))

(declare-fun m!484881 () Bool)

(assert (=> b!504074 m!484881))

(assert (=> b!504077 m!484849))

(assert (=> b!504077 m!484849))

(declare-fun m!484883 () Bool)

(assert (=> b!504077 m!484883))

(push 1)

