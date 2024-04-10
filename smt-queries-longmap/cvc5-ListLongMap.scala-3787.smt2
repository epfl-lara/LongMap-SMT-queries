; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51896 () Bool)

(assert start!51896)

(declare-fun b!567233 () Bool)

(declare-fun e!326439 () Bool)

(declare-fun e!326436 () Bool)

(assert (=> b!567233 (= e!326439 e!326436)))

(declare-fun res!357819 () Bool)

(assert (=> b!567233 (=> (not res!357819) (not e!326436))))

(declare-datatypes ((SeekEntryResult!5540 0))(
  ( (MissingZero!5540 (index!24387 (_ BitVec 32))) (Found!5540 (index!24388 (_ BitVec 32))) (Intermediate!5540 (undefined!6352 Bool) (index!24389 (_ BitVec 32)) (x!53261 (_ BitVec 32))) (Undefined!5540) (MissingVacant!5540 (index!24390 (_ BitVec 32))) )
))
(declare-fun lt!258475 () SeekEntryResult!5540)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567233 (= res!357819 (or (= lt!258475 (MissingZero!5540 i!1132)) (= lt!258475 (MissingVacant!5540 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35590 0))(
  ( (array!35591 (arr!17091 (Array (_ BitVec 32) (_ BitVec 64))) (size!17455 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35590)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35590 (_ BitVec 32)) SeekEntryResult!5540)

(assert (=> b!567233 (= lt!258475 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!357821 () Bool)

(assert (=> start!51896 (=> (not res!357821) (not e!326439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51896 (= res!357821 (validMask!0 mask!3119))))

(assert (=> start!51896 e!326439))

(assert (=> start!51896 true))

(declare-fun array_inv!12887 (array!35590) Bool)

(assert (=> start!51896 (array_inv!12887 a!3118)))

(declare-fun b!567234 () Bool)

(declare-fun res!357822 () Bool)

(assert (=> b!567234 (=> (not res!357822) (not e!326439))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!567234 (= res!357822 (and (= (size!17455 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17455 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17455 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567235 () Bool)

(declare-fun res!357825 () Bool)

(assert (=> b!567235 (=> (not res!357825) (not e!326436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35590 (_ BitVec 32)) Bool)

(assert (=> b!567235 (= res!357825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567236 () Bool)

(assert (=> b!567236 (= e!326436 (not true))))

(declare-fun e!326438 () Bool)

(assert (=> b!567236 e!326438))

(declare-fun res!357824 () Bool)

(assert (=> b!567236 (=> (not res!357824) (not e!326438))))

(assert (=> b!567236 (= res!357824 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17782 0))(
  ( (Unit!17783) )
))
(declare-fun lt!258474 () Unit!17782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17782)

(assert (=> b!567236 (= lt!258474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567237 () Bool)

(assert (=> b!567237 (= e!326438 (= (seekEntryOrOpen!0 (select (arr!17091 a!3118) j!142) a!3118 mask!3119) (Found!5540 j!142)))))

(declare-fun b!567238 () Bool)

(declare-fun res!357827 () Bool)

(assert (=> b!567238 (=> (not res!357827) (not e!326439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567238 (= res!357827 (validKeyInArray!0 (select (arr!17091 a!3118) j!142)))))

(declare-fun b!567239 () Bool)

(declare-fun res!357823 () Bool)

(assert (=> b!567239 (=> (not res!357823) (not e!326439))))

(declare-fun arrayContainsKey!0 (array!35590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567239 (= res!357823 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567240 () Bool)

(declare-fun res!357826 () Bool)

(assert (=> b!567240 (=> (not res!357826) (not e!326436))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35590 (_ BitVec 32)) SeekEntryResult!5540)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567240 (= res!357826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17091 a!3118) j!142) mask!3119) (select (arr!17091 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17091 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17091 a!3118) i!1132 k!1914) j!142) (array!35591 (store (arr!17091 a!3118) i!1132 k!1914) (size!17455 a!3118)) mask!3119)))))

(declare-fun b!567241 () Bool)

(declare-fun res!357818 () Bool)

(assert (=> b!567241 (=> (not res!357818) (not e!326439))))

(assert (=> b!567241 (= res!357818 (validKeyInArray!0 k!1914))))

(declare-fun b!567242 () Bool)

(declare-fun res!357820 () Bool)

(assert (=> b!567242 (=> (not res!357820) (not e!326436))))

(declare-datatypes ((List!11171 0))(
  ( (Nil!11168) (Cons!11167 (h!12179 (_ BitVec 64)) (t!17399 List!11171)) )
))
(declare-fun arrayNoDuplicates!0 (array!35590 (_ BitVec 32) List!11171) Bool)

(assert (=> b!567242 (= res!357820 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11168))))

(assert (= (and start!51896 res!357821) b!567234))

(assert (= (and b!567234 res!357822) b!567238))

(assert (= (and b!567238 res!357827) b!567241))

(assert (= (and b!567241 res!357818) b!567239))

(assert (= (and b!567239 res!357823) b!567233))

(assert (= (and b!567233 res!357819) b!567235))

(assert (= (and b!567235 res!357825) b!567242))

(assert (= (and b!567242 res!357820) b!567240))

(assert (= (and b!567240 res!357826) b!567236))

(assert (= (and b!567236 res!357824) b!567237))

(declare-fun m!545781 () Bool)

(assert (=> b!567237 m!545781))

(assert (=> b!567237 m!545781))

(declare-fun m!545783 () Bool)

(assert (=> b!567237 m!545783))

(assert (=> b!567240 m!545781))

(declare-fun m!545785 () Bool)

(assert (=> b!567240 m!545785))

(assert (=> b!567240 m!545781))

(declare-fun m!545787 () Bool)

(assert (=> b!567240 m!545787))

(declare-fun m!545789 () Bool)

(assert (=> b!567240 m!545789))

(assert (=> b!567240 m!545787))

(declare-fun m!545791 () Bool)

(assert (=> b!567240 m!545791))

(assert (=> b!567240 m!545785))

(assert (=> b!567240 m!545781))

(declare-fun m!545793 () Bool)

(assert (=> b!567240 m!545793))

(declare-fun m!545795 () Bool)

(assert (=> b!567240 m!545795))

(assert (=> b!567240 m!545787))

(assert (=> b!567240 m!545789))

(declare-fun m!545797 () Bool)

(assert (=> start!51896 m!545797))

(declare-fun m!545799 () Bool)

(assert (=> start!51896 m!545799))

(assert (=> b!567238 m!545781))

(assert (=> b!567238 m!545781))

(declare-fun m!545801 () Bool)

(assert (=> b!567238 m!545801))

(declare-fun m!545803 () Bool)

(assert (=> b!567242 m!545803))

(declare-fun m!545805 () Bool)

(assert (=> b!567239 m!545805))

(declare-fun m!545807 () Bool)

(assert (=> b!567236 m!545807))

(declare-fun m!545809 () Bool)

(assert (=> b!567236 m!545809))

(declare-fun m!545811 () Bool)

(assert (=> b!567235 m!545811))

(declare-fun m!545813 () Bool)

(assert (=> b!567241 m!545813))

(declare-fun m!545815 () Bool)

(assert (=> b!567233 m!545815))

(push 1)

