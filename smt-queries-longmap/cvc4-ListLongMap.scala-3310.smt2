; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45808 () Bool)

(assert start!45808)

(declare-fun b!507115 () Bool)

(declare-fun e!296789 () Bool)

(declare-fun e!296785 () Bool)

(assert (=> b!507115 (= e!296789 e!296785)))

(declare-fun res!308075 () Bool)

(assert (=> b!507115 (=> (not res!308075) (not e!296785))))

(declare-datatypes ((SeekEntryResult!4129 0))(
  ( (MissingZero!4129 (index!18704 (_ BitVec 32))) (Found!4129 (index!18705 (_ BitVec 32))) (Intermediate!4129 (undefined!4941 Bool) (index!18706 (_ BitVec 32)) (x!47698 (_ BitVec 32))) (Undefined!4129) (MissingVacant!4129 (index!18707 (_ BitVec 32))) )
))
(declare-fun lt!231462 () SeekEntryResult!4129)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507115 (= res!308075 (or (= lt!231462 (MissingZero!4129 i!1204)) (= lt!231462 (MissingVacant!4129 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32564 0))(
  ( (array!32565 (arr!15662 (Array (_ BitVec 32) (_ BitVec 64))) (size!16026 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32564)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32564 (_ BitVec 32)) SeekEntryResult!4129)

(assert (=> b!507115 (= lt!231462 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507116 () Bool)

(declare-fun e!296786 () Bool)

(declare-fun e!296787 () Bool)

(assert (=> b!507116 (= e!296786 e!296787)))

(declare-fun res!308074 () Bool)

(assert (=> b!507116 (=> res!308074 e!296787)))

(declare-fun lt!231465 () Bool)

(declare-fun lt!231463 () SeekEntryResult!4129)

(assert (=> b!507116 (= res!308074 (or (and (not lt!231465) (undefined!4941 lt!231463)) (and (not lt!231465) (not (undefined!4941 lt!231463)))))))

(assert (=> b!507116 (= lt!231465 (not (is-Intermediate!4129 lt!231463)))))

(declare-fun b!507117 () Bool)

(assert (=> b!507117 (= e!296785 (not e!296786))))

(declare-fun res!308081 () Bool)

(assert (=> b!507117 (=> res!308081 e!296786)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!231461 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32564 (_ BitVec 32)) SeekEntryResult!4129)

(assert (=> b!507117 (= res!308081 (= lt!231463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231461 (select (store (arr!15662 a!3235) i!1204 k!2280) j!176) (array!32565 (store (arr!15662 a!3235) i!1204 k!2280) (size!16026 a!3235)) mask!3524)))))

(declare-fun lt!231466 () (_ BitVec 32))

(assert (=> b!507117 (= lt!231463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231466 (select (arr!15662 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507117 (= lt!231461 (toIndex!0 (select (store (arr!15662 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!507117 (= lt!231466 (toIndex!0 (select (arr!15662 a!3235) j!176) mask!3524))))

(declare-fun e!296790 () Bool)

(assert (=> b!507117 e!296790))

(declare-fun res!308079 () Bool)

(assert (=> b!507117 (=> (not res!308079) (not e!296790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32564 (_ BitVec 32)) Bool)

(assert (=> b!507117 (= res!308079 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15546 0))(
  ( (Unit!15547) )
))
(declare-fun lt!231464 () Unit!15546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15546)

(assert (=> b!507117 (= lt!231464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507118 () Bool)

(declare-fun res!308082 () Bool)

(assert (=> b!507118 (=> (not res!308082) (not e!296789))))

(assert (=> b!507118 (= res!308082 (and (= (size!16026 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16026 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16026 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507119 () Bool)

(declare-fun res!308083 () Bool)

(assert (=> b!507119 (=> (not res!308083) (not e!296785))))

(declare-datatypes ((List!9820 0))(
  ( (Nil!9817) (Cons!9816 (h!10693 (_ BitVec 64)) (t!16048 List!9820)) )
))
(declare-fun arrayNoDuplicates!0 (array!32564 (_ BitVec 32) List!9820) Bool)

(assert (=> b!507119 (= res!308083 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9817))))

(declare-fun res!308076 () Bool)

(assert (=> start!45808 (=> (not res!308076) (not e!296789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45808 (= res!308076 (validMask!0 mask!3524))))

(assert (=> start!45808 e!296789))

(assert (=> start!45808 true))

(declare-fun array_inv!11458 (array!32564) Bool)

(assert (=> start!45808 (array_inv!11458 a!3235)))

(declare-fun b!507120 () Bool)

(declare-fun res!308084 () Bool)

(assert (=> b!507120 (=> (not res!308084) (not e!296789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507120 (= res!308084 (validKeyInArray!0 k!2280))))

(declare-fun b!507121 () Bool)

(assert (=> b!507121 (= e!296787 true)))

(assert (=> b!507121 false))

(declare-fun b!507122 () Bool)

(declare-fun res!308078 () Bool)

(assert (=> b!507122 (=> (not res!308078) (not e!296789))))

(declare-fun arrayContainsKey!0 (array!32564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507122 (= res!308078 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507123 () Bool)

(assert (=> b!507123 (= e!296790 (= (seekEntryOrOpen!0 (select (arr!15662 a!3235) j!176) a!3235 mask!3524) (Found!4129 j!176)))))

(declare-fun b!507124 () Bool)

(declare-fun res!308080 () Bool)

(assert (=> b!507124 (=> (not res!308080) (not e!296785))))

(assert (=> b!507124 (= res!308080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507125 () Bool)

(declare-fun res!308077 () Bool)

(assert (=> b!507125 (=> (not res!308077) (not e!296789))))

(assert (=> b!507125 (= res!308077 (validKeyInArray!0 (select (arr!15662 a!3235) j!176)))))

(assert (= (and start!45808 res!308076) b!507118))

(assert (= (and b!507118 res!308082) b!507125))

(assert (= (and b!507125 res!308077) b!507120))

(assert (= (and b!507120 res!308084) b!507122))

(assert (= (and b!507122 res!308078) b!507115))

(assert (= (and b!507115 res!308075) b!507124))

(assert (= (and b!507124 res!308080) b!507119))

(assert (= (and b!507119 res!308083) b!507117))

(assert (= (and b!507117 res!308079) b!507123))

(assert (= (and b!507117 (not res!308081)) b!507116))

(assert (= (and b!507116 (not res!308074)) b!507121))

(declare-fun m!487839 () Bool)

(assert (=> start!45808 m!487839))

(declare-fun m!487841 () Bool)

(assert (=> start!45808 m!487841))

(declare-fun m!487843 () Bool)

(assert (=> b!507125 m!487843))

(assert (=> b!507125 m!487843))

(declare-fun m!487845 () Bool)

(assert (=> b!507125 m!487845))

(declare-fun m!487847 () Bool)

(assert (=> b!507115 m!487847))

(declare-fun m!487849 () Bool)

(assert (=> b!507119 m!487849))

(declare-fun m!487851 () Bool)

(assert (=> b!507120 m!487851))

(declare-fun m!487853 () Bool)

(assert (=> b!507122 m!487853))

(assert (=> b!507123 m!487843))

(assert (=> b!507123 m!487843))

(declare-fun m!487855 () Bool)

(assert (=> b!507123 m!487855))

(declare-fun m!487857 () Bool)

(assert (=> b!507124 m!487857))

(declare-fun m!487859 () Bool)

(assert (=> b!507117 m!487859))

(assert (=> b!507117 m!487843))

(declare-fun m!487861 () Bool)

(assert (=> b!507117 m!487861))

(declare-fun m!487863 () Bool)

(assert (=> b!507117 m!487863))

(assert (=> b!507117 m!487843))

(declare-fun m!487865 () Bool)

(assert (=> b!507117 m!487865))

(assert (=> b!507117 m!487843))

(declare-fun m!487867 () Bool)

(assert (=> b!507117 m!487867))

(declare-fun m!487869 () Bool)

(assert (=> b!507117 m!487869))

(declare-fun m!487871 () Bool)

(assert (=> b!507117 m!487871))

(assert (=> b!507117 m!487869))

(declare-fun m!487873 () Bool)

(assert (=> b!507117 m!487873))

(assert (=> b!507117 m!487869))

(push 1)

