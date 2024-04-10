; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52760 () Bool)

(assert start!52760)

(declare-fun b!575157 () Bool)

(declare-fun res!363576 () Bool)

(declare-fun e!330937 () Bool)

(assert (=> b!575157 (=> (not res!363576) (not e!330937))))

(declare-datatypes ((array!35905 0))(
  ( (array!35906 (arr!17235 (Array (_ BitVec 32) (_ BitVec 64))) (size!17599 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35905)

(declare-datatypes ((List!11315 0))(
  ( (Nil!11312) (Cons!11311 (h!12350 (_ BitVec 64)) (t!17543 List!11315)) )
))
(declare-fun arrayNoDuplicates!0 (array!35905 (_ BitVec 32) List!11315) Bool)

(assert (=> b!575157 (= res!363576 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11312))))

(declare-fun b!575158 () Bool)

(declare-fun res!363577 () Bool)

(declare-fun e!330934 () Bool)

(assert (=> b!575158 (=> (not res!363577) (not e!330934))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575158 (= res!363577 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575159 () Bool)

(assert (=> b!575159 (= e!330934 e!330937)))

(declare-fun res!363583 () Bool)

(assert (=> b!575159 (=> (not res!363583) (not e!330937))))

(declare-datatypes ((SeekEntryResult!5684 0))(
  ( (MissingZero!5684 (index!24963 (_ BitVec 32))) (Found!5684 (index!24964 (_ BitVec 32))) (Intermediate!5684 (undefined!6496 Bool) (index!24965 (_ BitVec 32)) (x!53861 (_ BitVec 32))) (Undefined!5684) (MissingVacant!5684 (index!24966 (_ BitVec 32))) )
))
(declare-fun lt!262722 () SeekEntryResult!5684)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575159 (= res!363583 (or (= lt!262722 (MissingZero!5684 i!1132)) (= lt!262722 (MissingVacant!5684 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35905 (_ BitVec 32)) SeekEntryResult!5684)

(assert (=> b!575159 (= lt!262722 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575160 () Bool)

(declare-fun res!363574 () Bool)

(assert (=> b!575160 (=> (not res!363574) (not e!330934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575160 (= res!363574 (validKeyInArray!0 k!1914))))

(declare-fun b!575161 () Bool)

(declare-fun lt!262719 () (_ BitVec 64))

(declare-fun e!330935 () Bool)

(declare-fun lt!262717 () SeekEntryResult!5684)

(declare-fun lt!262718 () SeekEntryResult!5684)

(declare-fun lt!262723 () SeekEntryResult!5684)

(assert (=> b!575161 (= e!330935 (or (bvslt (index!24965 lt!262718) #b00000000000000000000000000000000) (bvsge (index!24965 lt!262718) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53861 lt!262718) #b01111111111111111111111111111110) (bvslt (x!53861 lt!262718) #b00000000000000000000000000000000) (not (= lt!262719 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17235 a!3118) i!1132 k!1914) (index!24965 lt!262718)) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!262717 lt!262723)))))

(declare-fun e!330933 () Bool)

(assert (=> b!575161 e!330933))

(declare-fun res!363581 () Bool)

(assert (=> b!575161 (=> (not res!363581) (not e!330933))))

(declare-fun lt!262724 () SeekEntryResult!5684)

(assert (=> b!575161 (= res!363581 (= lt!262724 lt!262717))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35905 (_ BitVec 32)) SeekEntryResult!5684)

(assert (=> b!575161 (= lt!262717 (seekKeyOrZeroReturnVacant!0 (x!53861 lt!262718) (index!24965 lt!262718) (index!24965 lt!262718) (select (arr!17235 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!363573 () Bool)

(assert (=> start!52760 (=> (not res!363573) (not e!330934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52760 (= res!363573 (validMask!0 mask!3119))))

(assert (=> start!52760 e!330934))

(assert (=> start!52760 true))

(declare-fun array_inv!13031 (array!35905) Bool)

(assert (=> start!52760 (array_inv!13031 a!3118)))

(declare-fun b!575162 () Bool)

(declare-fun e!330936 () Bool)

(assert (=> b!575162 (= e!330936 e!330935)))

(declare-fun res!363575 () Bool)

(assert (=> b!575162 (=> res!363575 e!330935)))

(assert (=> b!575162 (= res!363575 (or (= lt!262719 (select (arr!17235 a!3118) j!142)) (= lt!262719 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575162 (= lt!262719 (select (arr!17235 a!3118) (index!24965 lt!262718)))))

(declare-fun b!575163 () Bool)

(declare-fun e!330938 () Bool)

(assert (=> b!575163 (= e!330938 (not e!330936))))

(declare-fun res!363579 () Bool)

(assert (=> b!575163 (=> res!363579 e!330936)))

(assert (=> b!575163 (= res!363579 (or (undefined!6496 lt!262718) (not (is-Intermediate!5684 lt!262718))))))

(assert (=> b!575163 (= lt!262724 lt!262723)))

(assert (=> b!575163 (= lt!262723 (Found!5684 j!142))))

(assert (=> b!575163 (= lt!262724 (seekEntryOrOpen!0 (select (arr!17235 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35905 (_ BitVec 32)) Bool)

(assert (=> b!575163 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18070 0))(
  ( (Unit!18071) )
))
(declare-fun lt!262725 () Unit!18070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18070)

(assert (=> b!575163 (= lt!262725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575164 () Bool)

(declare-fun res!363584 () Bool)

(assert (=> b!575164 (=> (not res!363584) (not e!330937))))

(assert (=> b!575164 (= res!363584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575165 () Bool)

(declare-fun res!363580 () Bool)

(assert (=> b!575165 (=> (not res!363580) (not e!330934))))

(assert (=> b!575165 (= res!363580 (validKeyInArray!0 (select (arr!17235 a!3118) j!142)))))

(declare-fun b!575166 () Bool)

(assert (=> b!575166 (= e!330937 e!330938)))

(declare-fun res!363578 () Bool)

(assert (=> b!575166 (=> (not res!363578) (not e!330938))))

(declare-fun lt!262721 () (_ BitVec 32))

(declare-fun lt!262716 () array!35905)

(declare-fun lt!262726 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35905 (_ BitVec 32)) SeekEntryResult!5684)

(assert (=> b!575166 (= res!363578 (= lt!262718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262721 lt!262726 lt!262716 mask!3119)))))

(declare-fun lt!262720 () (_ BitVec 32))

(assert (=> b!575166 (= lt!262718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262720 (select (arr!17235 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575166 (= lt!262721 (toIndex!0 lt!262726 mask!3119))))

(assert (=> b!575166 (= lt!262726 (select (store (arr!17235 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575166 (= lt!262720 (toIndex!0 (select (arr!17235 a!3118) j!142) mask!3119))))

(assert (=> b!575166 (= lt!262716 (array!35906 (store (arr!17235 a!3118) i!1132 k!1914) (size!17599 a!3118)))))

(declare-fun b!575167 () Bool)

(assert (=> b!575167 (= e!330933 (= (seekEntryOrOpen!0 lt!262726 lt!262716 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53861 lt!262718) (index!24965 lt!262718) (index!24965 lt!262718) lt!262726 lt!262716 mask!3119)))))

(declare-fun b!575168 () Bool)

(declare-fun res!363582 () Bool)

(assert (=> b!575168 (=> (not res!363582) (not e!330934))))

(assert (=> b!575168 (= res!363582 (and (= (size!17599 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17599 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17599 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52760 res!363573) b!575168))

(assert (= (and b!575168 res!363582) b!575165))

(assert (= (and b!575165 res!363580) b!575160))

(assert (= (and b!575160 res!363574) b!575158))

(assert (= (and b!575158 res!363577) b!575159))

(assert (= (and b!575159 res!363583) b!575164))

(assert (= (and b!575164 res!363584) b!575157))

(assert (= (and b!575157 res!363576) b!575166))

(assert (= (and b!575166 res!363578) b!575163))

(assert (= (and b!575163 (not res!363579)) b!575162))

(assert (= (and b!575162 (not res!363575)) b!575161))

(assert (= (and b!575161 res!363581) b!575167))

(declare-fun m!553923 () Bool)

(assert (=> b!575167 m!553923))

(declare-fun m!553925 () Bool)

(assert (=> b!575167 m!553925))

(declare-fun m!553927 () Bool)

(assert (=> b!575160 m!553927))

(declare-fun m!553929 () Bool)

(assert (=> b!575163 m!553929))

(assert (=> b!575163 m!553929))

(declare-fun m!553931 () Bool)

(assert (=> b!575163 m!553931))

(declare-fun m!553933 () Bool)

(assert (=> b!575163 m!553933))

(declare-fun m!553935 () Bool)

(assert (=> b!575163 m!553935))

(declare-fun m!553937 () Bool)

(assert (=> b!575159 m!553937))

(declare-fun m!553939 () Bool)

(assert (=> b!575161 m!553939))

(declare-fun m!553941 () Bool)

(assert (=> b!575161 m!553941))

(assert (=> b!575161 m!553929))

(assert (=> b!575161 m!553929))

(declare-fun m!553943 () Bool)

(assert (=> b!575161 m!553943))

(declare-fun m!553945 () Bool)

(assert (=> b!575164 m!553945))

(assert (=> b!575162 m!553929))

(declare-fun m!553947 () Bool)

(assert (=> b!575162 m!553947))

(assert (=> b!575165 m!553929))

(assert (=> b!575165 m!553929))

(declare-fun m!553949 () Bool)

(assert (=> b!575165 m!553949))

(declare-fun m!553951 () Bool)

(assert (=> b!575157 m!553951))

(declare-fun m!553953 () Bool)

(assert (=> start!52760 m!553953))

(declare-fun m!553955 () Bool)

(assert (=> start!52760 m!553955))

(declare-fun m!553957 () Bool)

(assert (=> b!575158 m!553957))

(assert (=> b!575166 m!553929))

(declare-fun m!553959 () Bool)

(assert (=> b!575166 m!553959))

(assert (=> b!575166 m!553929))

(assert (=> b!575166 m!553929))

(declare-fun m!553961 () Bool)

(assert (=> b!575166 m!553961))

(declare-fun m!553963 () Bool)

(assert (=> b!575166 m!553963))

(assert (=> b!575166 m!553939))

(declare-fun m!553965 () Bool)

(assert (=> b!575166 m!553965))

(declare-fun m!553967 () Bool)

(assert (=> b!575166 m!553967))

(push 1)

