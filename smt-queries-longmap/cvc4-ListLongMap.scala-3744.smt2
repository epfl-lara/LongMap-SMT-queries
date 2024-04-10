; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51462 () Bool)

(assert start!51462)

(declare-fun res!353836 () Bool)

(declare-fun e!324274 () Bool)

(assert (=> start!51462 (=> (not res!353836) (not e!324274))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51462 (= res!353836 (validMask!0 mask!3119))))

(assert (=> start!51462 e!324274))

(assert (=> start!51462 true))

(declare-datatypes ((array!35327 0))(
  ( (array!35328 (arr!16964 (Array (_ BitVec 32) (_ BitVec 64))) (size!17328 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35327)

(declare-fun array_inv!12760 (array!35327) Bool)

(assert (=> start!51462 (array_inv!12760 a!3118)))

(declare-fun b!562674 () Bool)

(declare-fun res!353829 () Bool)

(declare-fun e!324272 () Bool)

(assert (=> b!562674 (=> (not res!353829) (not e!324272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35327 (_ BitVec 32)) Bool)

(assert (=> b!562674 (= res!353829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562675 () Bool)

(declare-fun e!324276 () Bool)

(declare-fun e!324275 () Bool)

(assert (=> b!562675 (= e!324276 e!324275)))

(declare-fun res!353834 () Bool)

(assert (=> b!562675 (=> res!353834 e!324275)))

(declare-datatypes ((SeekEntryResult!5413 0))(
  ( (MissingZero!5413 (index!23879 (_ BitVec 32))) (Found!5413 (index!23880 (_ BitVec 32))) (Intermediate!5413 (undefined!6225 Bool) (index!23881 (_ BitVec 32)) (x!52772 (_ BitVec 32))) (Undefined!5413) (MissingVacant!5413 (index!23882 (_ BitVec 32))) )
))
(declare-fun lt!256517 () SeekEntryResult!5413)

(declare-fun lt!256520 () SeekEntryResult!5413)

(declare-fun lt!256525 () SeekEntryResult!5413)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!256512 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562675 (= res!353834 (or (bvslt (index!23881 lt!256525) #b00000000000000000000000000000000) (bvsge (index!23881 lt!256525) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52772 lt!256525) #b01111111111111111111111111111110) (bvslt (x!52772 lt!256525) #b00000000000000000000000000000000) (not (= lt!256512 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16964 a!3118) i!1132 k!1914) (index!23881 lt!256525)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256517 lt!256520))))))

(declare-fun lt!256518 () SeekEntryResult!5413)

(declare-fun lt!256513 () SeekEntryResult!5413)

(assert (=> b!562675 (= lt!256518 lt!256513)))

(declare-fun lt!256524 () (_ BitVec 64))

(declare-fun lt!256515 () array!35327)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35327 (_ BitVec 32)) SeekEntryResult!5413)

(assert (=> b!562675 (= lt!256513 (seekKeyOrZeroReturnVacant!0 (x!52772 lt!256525) (index!23881 lt!256525) (index!23881 lt!256525) lt!256524 lt!256515 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35327 (_ BitVec 32)) SeekEntryResult!5413)

(assert (=> b!562675 (= lt!256518 (seekEntryOrOpen!0 lt!256524 lt!256515 mask!3119))))

(declare-fun lt!256522 () SeekEntryResult!5413)

(assert (=> b!562675 (= lt!256522 lt!256517)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562675 (= lt!256517 (seekKeyOrZeroReturnVacant!0 (x!52772 lt!256525) (index!23881 lt!256525) (index!23881 lt!256525) (select (arr!16964 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562676 () Bool)

(declare-fun e!324270 () Bool)

(declare-fun e!324271 () Bool)

(assert (=> b!562676 (= e!324270 (not e!324271))))

(declare-fun res!353828 () Bool)

(assert (=> b!562676 (=> res!353828 e!324271)))

(assert (=> b!562676 (= res!353828 (or (undefined!6225 lt!256525) (not (is-Intermediate!5413 lt!256525))))))

(assert (=> b!562676 (= lt!256522 lt!256520)))

(assert (=> b!562676 (= lt!256520 (Found!5413 j!142))))

(assert (=> b!562676 (= lt!256522 (seekEntryOrOpen!0 (select (arr!16964 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562676 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17600 0))(
  ( (Unit!17601) )
))
(declare-fun lt!256516 () Unit!17600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17600)

(assert (=> b!562676 (= lt!256516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562677 () Bool)

(assert (=> b!562677 (= e!324275 true)))

(assert (=> b!562677 (= lt!256517 lt!256513)))

(declare-fun lt!256523 () Unit!17600)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17600)

(assert (=> b!562677 (= lt!256523 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52772 lt!256525) (index!23881 lt!256525) (index!23881 lt!256525) mask!3119))))

(declare-fun b!562678 () Bool)

(declare-fun res!353831 () Bool)

(assert (=> b!562678 (=> (not res!353831) (not e!324274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562678 (= res!353831 (validKeyInArray!0 k!1914))))

(declare-fun b!562679 () Bool)

(declare-fun res!353833 () Bool)

(assert (=> b!562679 (=> (not res!353833) (not e!324274))))

(assert (=> b!562679 (= res!353833 (validKeyInArray!0 (select (arr!16964 a!3118) j!142)))))

(declare-fun b!562680 () Bool)

(declare-fun res!353830 () Bool)

(assert (=> b!562680 (=> (not res!353830) (not e!324274))))

(assert (=> b!562680 (= res!353830 (and (= (size!17328 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17328 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17328 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562681 () Bool)

(assert (=> b!562681 (= e!324274 e!324272)))

(declare-fun res!353826 () Bool)

(assert (=> b!562681 (=> (not res!353826) (not e!324272))))

(declare-fun lt!256519 () SeekEntryResult!5413)

(assert (=> b!562681 (= res!353826 (or (= lt!256519 (MissingZero!5413 i!1132)) (= lt!256519 (MissingVacant!5413 i!1132))))))

(assert (=> b!562681 (= lt!256519 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562682 () Bool)

(declare-fun res!353835 () Bool)

(assert (=> b!562682 (=> (not res!353835) (not e!324272))))

(declare-datatypes ((List!11044 0))(
  ( (Nil!11041) (Cons!11040 (h!12043 (_ BitVec 64)) (t!17272 List!11044)) )
))
(declare-fun arrayNoDuplicates!0 (array!35327 (_ BitVec 32) List!11044) Bool)

(assert (=> b!562682 (= res!353835 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11041))))

(declare-fun b!562683 () Bool)

(assert (=> b!562683 (= e!324271 e!324276)))

(declare-fun res!353827 () Bool)

(assert (=> b!562683 (=> res!353827 e!324276)))

(assert (=> b!562683 (= res!353827 (or (= lt!256512 (select (arr!16964 a!3118) j!142)) (= lt!256512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562683 (= lt!256512 (select (arr!16964 a!3118) (index!23881 lt!256525)))))

(declare-fun b!562684 () Bool)

(assert (=> b!562684 (= e!324272 e!324270)))

(declare-fun res!353832 () Bool)

(assert (=> b!562684 (=> (not res!353832) (not e!324270))))

(declare-fun lt!256514 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35327 (_ BitVec 32)) SeekEntryResult!5413)

(assert (=> b!562684 (= res!353832 (= lt!256525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256514 lt!256524 lt!256515 mask!3119)))))

(declare-fun lt!256521 () (_ BitVec 32))

(assert (=> b!562684 (= lt!256525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256521 (select (arr!16964 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562684 (= lt!256514 (toIndex!0 lt!256524 mask!3119))))

(assert (=> b!562684 (= lt!256524 (select (store (arr!16964 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562684 (= lt!256521 (toIndex!0 (select (arr!16964 a!3118) j!142) mask!3119))))

(assert (=> b!562684 (= lt!256515 (array!35328 (store (arr!16964 a!3118) i!1132 k!1914) (size!17328 a!3118)))))

(declare-fun b!562685 () Bool)

(declare-fun res!353837 () Bool)

(assert (=> b!562685 (=> (not res!353837) (not e!324274))))

(declare-fun arrayContainsKey!0 (array!35327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562685 (= res!353837 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51462 res!353836) b!562680))

(assert (= (and b!562680 res!353830) b!562679))

(assert (= (and b!562679 res!353833) b!562678))

(assert (= (and b!562678 res!353831) b!562685))

(assert (= (and b!562685 res!353837) b!562681))

(assert (= (and b!562681 res!353826) b!562674))

(assert (= (and b!562674 res!353829) b!562682))

(assert (= (and b!562682 res!353835) b!562684))

(assert (= (and b!562684 res!353832) b!562676))

(assert (= (and b!562676 (not res!353828)) b!562683))

(assert (= (and b!562683 (not res!353827)) b!562675))

(assert (= (and b!562675 (not res!353834)) b!562677))

(declare-fun m!540789 () Bool)

(assert (=> b!562676 m!540789))

(assert (=> b!562676 m!540789))

(declare-fun m!540791 () Bool)

(assert (=> b!562676 m!540791))

(declare-fun m!540793 () Bool)

(assert (=> b!562676 m!540793))

(declare-fun m!540795 () Bool)

(assert (=> b!562676 m!540795))

(declare-fun m!540797 () Bool)

(assert (=> b!562685 m!540797))

(assert (=> b!562679 m!540789))

(assert (=> b!562679 m!540789))

(declare-fun m!540799 () Bool)

(assert (=> b!562679 m!540799))

(declare-fun m!540801 () Bool)

(assert (=> b!562674 m!540801))

(declare-fun m!540803 () Bool)

(assert (=> b!562675 m!540803))

(declare-fun m!540805 () Bool)

(assert (=> b!562675 m!540805))

(assert (=> b!562675 m!540789))

(declare-fun m!540807 () Bool)

(assert (=> b!562675 m!540807))

(assert (=> b!562675 m!540789))

(declare-fun m!540809 () Bool)

(assert (=> b!562675 m!540809))

(declare-fun m!540811 () Bool)

(assert (=> b!562675 m!540811))

(declare-fun m!540813 () Bool)

(assert (=> b!562684 m!540813))

(assert (=> b!562684 m!540789))

(declare-fun m!540815 () Bool)

(assert (=> b!562684 m!540815))

(assert (=> b!562684 m!540789))

(declare-fun m!540817 () Bool)

(assert (=> b!562684 m!540817))

(assert (=> b!562684 m!540811))

(declare-fun m!540819 () Bool)

(assert (=> b!562684 m!540819))

(assert (=> b!562684 m!540789))

(declare-fun m!540821 () Bool)

(assert (=> b!562684 m!540821))

(declare-fun m!540823 () Bool)

(assert (=> b!562677 m!540823))

(declare-fun m!540825 () Bool)

(assert (=> b!562682 m!540825))

(declare-fun m!540827 () Bool)

(assert (=> b!562681 m!540827))

(assert (=> b!562683 m!540789))

(declare-fun m!540829 () Bool)

(assert (=> b!562683 m!540829))

(declare-fun m!540831 () Bool)

(assert (=> b!562678 m!540831))

(declare-fun m!540833 () Bool)

(assert (=> start!51462 m!540833))

(declare-fun m!540835 () Bool)

(assert (=> start!51462 m!540835))

(push 1)

