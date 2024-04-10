; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46038 () Bool)

(assert start!46038)

(declare-fun b!509811 () Bool)

(declare-fun res!310659 () Bool)

(declare-fun e!298086 () Bool)

(assert (=> b!509811 (=> (not res!310659) (not e!298086))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32749 0))(
  ( (array!32750 (arr!15753 (Array (_ BitVec 32) (_ BitVec 64))) (size!16117 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32749)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509811 (= res!310659 (and (= (size!16117 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16117 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16117 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509812 () Bool)

(declare-fun res!310661 () Bool)

(assert (=> b!509812 (=> (not res!310661) (not e!298086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509812 (= res!310661 (validKeyInArray!0 (select (arr!15753 a!3235) j!176)))))

(declare-fun b!509813 () Bool)

(declare-fun e!298089 () Bool)

(assert (=> b!509813 (= e!298086 e!298089)))

(declare-fun res!310660 () Bool)

(assert (=> b!509813 (=> (not res!310660) (not e!298089))))

(declare-datatypes ((SeekEntryResult!4220 0))(
  ( (MissingZero!4220 (index!19068 (_ BitVec 32))) (Found!4220 (index!19069 (_ BitVec 32))) (Intermediate!4220 (undefined!5032 Bool) (index!19070 (_ BitVec 32)) (x!48037 (_ BitVec 32))) (Undefined!4220) (MissingVacant!4220 (index!19071 (_ BitVec 32))) )
))
(declare-fun lt!232969 () SeekEntryResult!4220)

(assert (=> b!509813 (= res!310660 (or (= lt!232969 (MissingZero!4220 i!1204)) (= lt!232969 (MissingVacant!4220 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32749 (_ BitVec 32)) SeekEntryResult!4220)

(assert (=> b!509813 (= lt!232969 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!310662 () Bool)

(assert (=> start!46038 (=> (not res!310662) (not e!298086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46038 (= res!310662 (validMask!0 mask!3524))))

(assert (=> start!46038 e!298086))

(assert (=> start!46038 true))

(declare-fun array_inv!11549 (array!32749) Bool)

(assert (=> start!46038 (array_inv!11549 a!3235)))

(declare-fun b!509814 () Bool)

(declare-fun res!310657 () Bool)

(assert (=> b!509814 (=> (not res!310657) (not e!298089))))

(declare-datatypes ((List!9911 0))(
  ( (Nil!9908) (Cons!9907 (h!10784 (_ BitVec 64)) (t!16139 List!9911)) )
))
(declare-fun arrayNoDuplicates!0 (array!32749 (_ BitVec 32) List!9911) Bool)

(assert (=> b!509814 (= res!310657 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9908))))

(declare-fun b!509815 () Bool)

(declare-fun res!310663 () Bool)

(assert (=> b!509815 (=> (not res!310663) (not e!298089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32749 (_ BitVec 32)) Bool)

(assert (=> b!509815 (= res!310663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509816 () Bool)

(declare-fun e!298088 () Bool)

(assert (=> b!509816 (= e!298088 (= (seekEntryOrOpen!0 (select (arr!15753 a!3235) j!176) a!3235 mask!3524) (Found!4220 j!176)))))

(declare-fun b!509817 () Bool)

(declare-fun res!310664 () Bool)

(assert (=> b!509817 (=> (not res!310664) (not e!298086))))

(declare-fun arrayContainsKey!0 (array!32749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509817 (= res!310664 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509818 () Bool)

(assert (=> b!509818 (= e!298089 (not true))))

(declare-fun lt!232965 () (_ BitVec 32))

(declare-fun lt!232967 () SeekEntryResult!4220)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32749 (_ BitVec 32)) SeekEntryResult!4220)

(assert (=> b!509818 (= lt!232967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232965 (select (store (arr!15753 a!3235) i!1204 k!2280) j!176) (array!32750 (store (arr!15753 a!3235) i!1204 k!2280) (size!16117 a!3235)) mask!3524))))

(declare-fun lt!232964 () (_ BitVec 32))

(declare-fun lt!232966 () SeekEntryResult!4220)

(assert (=> b!509818 (= lt!232966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232964 (select (arr!15753 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509818 (= lt!232965 (toIndex!0 (select (store (arr!15753 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509818 (= lt!232964 (toIndex!0 (select (arr!15753 a!3235) j!176) mask!3524))))

(assert (=> b!509818 e!298088))

(declare-fun res!310656 () Bool)

(assert (=> b!509818 (=> (not res!310656) (not e!298088))))

(assert (=> b!509818 (= res!310656 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15698 0))(
  ( (Unit!15699) )
))
(declare-fun lt!232968 () Unit!15698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15698)

(assert (=> b!509818 (= lt!232968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509819 () Bool)

(declare-fun res!310658 () Bool)

(assert (=> b!509819 (=> (not res!310658) (not e!298086))))

(assert (=> b!509819 (= res!310658 (validKeyInArray!0 k!2280))))

(assert (= (and start!46038 res!310662) b!509811))

(assert (= (and b!509811 res!310659) b!509812))

(assert (= (and b!509812 res!310661) b!509819))

(assert (= (and b!509819 res!310658) b!509817))

(assert (= (and b!509817 res!310664) b!509813))

(assert (= (and b!509813 res!310660) b!509815))

(assert (= (and b!509815 res!310663) b!509814))

(assert (= (and b!509814 res!310657) b!509818))

(assert (= (and b!509818 res!310656) b!509816))

(declare-fun m!490821 () Bool)

(assert (=> b!509814 m!490821))

(declare-fun m!490823 () Bool)

(assert (=> b!509818 m!490823))

(declare-fun m!490825 () Bool)

(assert (=> b!509818 m!490825))

(declare-fun m!490827 () Bool)

(assert (=> b!509818 m!490827))

(assert (=> b!509818 m!490827))

(declare-fun m!490829 () Bool)

(assert (=> b!509818 m!490829))

(declare-fun m!490831 () Bool)

(assert (=> b!509818 m!490831))

(declare-fun m!490833 () Bool)

(assert (=> b!509818 m!490833))

(assert (=> b!509818 m!490831))

(declare-fun m!490835 () Bool)

(assert (=> b!509818 m!490835))

(assert (=> b!509818 m!490831))

(declare-fun m!490837 () Bool)

(assert (=> b!509818 m!490837))

(assert (=> b!509818 m!490827))

(declare-fun m!490839 () Bool)

(assert (=> b!509818 m!490839))

(declare-fun m!490841 () Bool)

(assert (=> b!509819 m!490841))

(declare-fun m!490843 () Bool)

(assert (=> b!509817 m!490843))

(declare-fun m!490845 () Bool)

(assert (=> b!509815 m!490845))

(assert (=> b!509812 m!490831))

(assert (=> b!509812 m!490831))

(declare-fun m!490847 () Bool)

(assert (=> b!509812 m!490847))

(declare-fun m!490849 () Bool)

(assert (=> start!46038 m!490849))

(declare-fun m!490851 () Bool)

(assert (=> start!46038 m!490851))

(assert (=> b!509816 m!490831))

(assert (=> b!509816 m!490831))

(declare-fun m!490853 () Bool)

(assert (=> b!509816 m!490853))

(declare-fun m!490855 () Bool)

(assert (=> b!509813 m!490855))

(push 1)

