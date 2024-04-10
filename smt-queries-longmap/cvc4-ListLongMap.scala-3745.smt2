; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51468 () Bool)

(assert start!51468)

(declare-fun res!353942 () Bool)

(declare-fun e!324336 () Bool)

(assert (=> start!51468 (=> (not res!353942) (not e!324336))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51468 (= res!353942 (validMask!0 mask!3119))))

(assert (=> start!51468 e!324336))

(assert (=> start!51468 true))

(declare-datatypes ((array!35333 0))(
  ( (array!35334 (arr!16967 (Array (_ BitVec 32) (_ BitVec 64))) (size!17331 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35333)

(declare-fun array_inv!12763 (array!35333) Bool)

(assert (=> start!51468 (array_inv!12763 a!3118)))

(declare-fun b!562782 () Bool)

(declare-fun res!353936 () Bool)

(assert (=> b!562782 (=> (not res!353936) (not e!324336))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562782 (= res!353936 (and (= (size!17331 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17331 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17331 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562783 () Bool)

(declare-fun res!353940 () Bool)

(declare-fun e!324334 () Bool)

(assert (=> b!562783 (=> (not res!353940) (not e!324334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35333 (_ BitVec 32)) Bool)

(assert (=> b!562783 (= res!353940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562784 () Bool)

(declare-fun e!324333 () Bool)

(assert (=> b!562784 (= e!324333 true)))

(declare-datatypes ((SeekEntryResult!5416 0))(
  ( (MissingZero!5416 (index!23891 (_ BitVec 32))) (Found!5416 (index!23892 (_ BitVec 32))) (Intermediate!5416 (undefined!6228 Bool) (index!23893 (_ BitVec 32)) (x!52783 (_ BitVec 32))) (Undefined!5416) (MissingVacant!5416 (index!23894 (_ BitVec 32))) )
))
(declare-fun lt!256640 () SeekEntryResult!5416)

(declare-fun lt!256646 () SeekEntryResult!5416)

(assert (=> b!562784 (= lt!256640 lt!256646)))

(declare-fun lt!256642 () SeekEntryResult!5416)

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((Unit!17606 0))(
  ( (Unit!17607) )
))
(declare-fun lt!256639 () Unit!17606)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35333 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17606)

(assert (=> b!562784 (= lt!256639 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52783 lt!256642) (index!23893 lt!256642) (index!23893 lt!256642) mask!3119))))

(declare-fun b!562785 () Bool)

(declare-fun e!324339 () Bool)

(assert (=> b!562785 (= e!324339 e!324333)))

(declare-fun res!353939 () Bool)

(assert (=> b!562785 (=> res!353939 e!324333)))

(declare-fun lt!256649 () SeekEntryResult!5416)

(declare-fun lt!256650 () (_ BitVec 64))

(assert (=> b!562785 (= res!353939 (or (bvslt (index!23893 lt!256642) #b00000000000000000000000000000000) (bvsge (index!23893 lt!256642) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52783 lt!256642) #b01111111111111111111111111111110) (bvslt (x!52783 lt!256642) #b00000000000000000000000000000000) (not (= lt!256650 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16967 a!3118) i!1132 k!1914) (index!23893 lt!256642)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256640 lt!256649))))))

(declare-fun lt!256647 () SeekEntryResult!5416)

(assert (=> b!562785 (= lt!256647 lt!256646)))

(declare-fun lt!256638 () array!35333)

(declare-fun lt!256651 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35333 (_ BitVec 32)) SeekEntryResult!5416)

(assert (=> b!562785 (= lt!256646 (seekKeyOrZeroReturnVacant!0 (x!52783 lt!256642) (index!23893 lt!256642) (index!23893 lt!256642) lt!256651 lt!256638 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35333 (_ BitVec 32)) SeekEntryResult!5416)

(assert (=> b!562785 (= lt!256647 (seekEntryOrOpen!0 lt!256651 lt!256638 mask!3119))))

(declare-fun lt!256648 () SeekEntryResult!5416)

(assert (=> b!562785 (= lt!256648 lt!256640)))

(assert (=> b!562785 (= lt!256640 (seekKeyOrZeroReturnVacant!0 (x!52783 lt!256642) (index!23893 lt!256642) (index!23893 lt!256642) (select (arr!16967 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562786 () Bool)

(assert (=> b!562786 (= e!324336 e!324334)))

(declare-fun res!353937 () Bool)

(assert (=> b!562786 (=> (not res!353937) (not e!324334))))

(declare-fun lt!256643 () SeekEntryResult!5416)

(assert (=> b!562786 (= res!353937 (or (= lt!256643 (MissingZero!5416 i!1132)) (= lt!256643 (MissingVacant!5416 i!1132))))))

(assert (=> b!562786 (= lt!256643 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562787 () Bool)

(declare-fun res!353943 () Bool)

(assert (=> b!562787 (=> (not res!353943) (not e!324334))))

(declare-datatypes ((List!11047 0))(
  ( (Nil!11044) (Cons!11043 (h!12046 (_ BitVec 64)) (t!17275 List!11047)) )
))
(declare-fun arrayNoDuplicates!0 (array!35333 (_ BitVec 32) List!11047) Bool)

(assert (=> b!562787 (= res!353943 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11044))))

(declare-fun b!562788 () Bool)

(declare-fun e!324338 () Bool)

(assert (=> b!562788 (= e!324338 e!324339)))

(declare-fun res!353934 () Bool)

(assert (=> b!562788 (=> res!353934 e!324339)))

(assert (=> b!562788 (= res!353934 (or (= lt!256650 (select (arr!16967 a!3118) j!142)) (= lt!256650 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562788 (= lt!256650 (select (arr!16967 a!3118) (index!23893 lt!256642)))))

(declare-fun b!562789 () Bool)

(declare-fun e!324337 () Bool)

(assert (=> b!562789 (= e!324337 (not e!324338))))

(declare-fun res!353938 () Bool)

(assert (=> b!562789 (=> res!353938 e!324338)))

(assert (=> b!562789 (= res!353938 (or (undefined!6228 lt!256642) (not (is-Intermediate!5416 lt!256642))))))

(assert (=> b!562789 (= lt!256648 lt!256649)))

(assert (=> b!562789 (= lt!256649 (Found!5416 j!142))))

(assert (=> b!562789 (= lt!256648 (seekEntryOrOpen!0 (select (arr!16967 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562789 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256644 () Unit!17606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17606)

(assert (=> b!562789 (= lt!256644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562790 () Bool)

(declare-fun res!353941 () Bool)

(assert (=> b!562790 (=> (not res!353941) (not e!324336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562790 (= res!353941 (validKeyInArray!0 k!1914))))

(declare-fun b!562791 () Bool)

(declare-fun res!353935 () Bool)

(assert (=> b!562791 (=> (not res!353935) (not e!324336))))

(declare-fun arrayContainsKey!0 (array!35333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562791 (= res!353935 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562792 () Bool)

(assert (=> b!562792 (= e!324334 e!324337)))

(declare-fun res!353944 () Bool)

(assert (=> b!562792 (=> (not res!353944) (not e!324337))))

(declare-fun lt!256645 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35333 (_ BitVec 32)) SeekEntryResult!5416)

(assert (=> b!562792 (= res!353944 (= lt!256642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256645 lt!256651 lt!256638 mask!3119)))))

(declare-fun lt!256641 () (_ BitVec 32))

(assert (=> b!562792 (= lt!256642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256641 (select (arr!16967 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562792 (= lt!256645 (toIndex!0 lt!256651 mask!3119))))

(assert (=> b!562792 (= lt!256651 (select (store (arr!16967 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562792 (= lt!256641 (toIndex!0 (select (arr!16967 a!3118) j!142) mask!3119))))

(assert (=> b!562792 (= lt!256638 (array!35334 (store (arr!16967 a!3118) i!1132 k!1914) (size!17331 a!3118)))))

(declare-fun b!562793 () Bool)

(declare-fun res!353945 () Bool)

(assert (=> b!562793 (=> (not res!353945) (not e!324336))))

(assert (=> b!562793 (= res!353945 (validKeyInArray!0 (select (arr!16967 a!3118) j!142)))))

(assert (= (and start!51468 res!353942) b!562782))

(assert (= (and b!562782 res!353936) b!562793))

(assert (= (and b!562793 res!353945) b!562790))

(assert (= (and b!562790 res!353941) b!562791))

(assert (= (and b!562791 res!353935) b!562786))

(assert (= (and b!562786 res!353937) b!562783))

(assert (= (and b!562783 res!353940) b!562787))

(assert (= (and b!562787 res!353943) b!562792))

(assert (= (and b!562792 res!353944) b!562789))

(assert (= (and b!562789 (not res!353938)) b!562788))

(assert (= (and b!562788 (not res!353934)) b!562785))

(assert (= (and b!562785 (not res!353939)) b!562784))

(declare-fun m!540933 () Bool)

(assert (=> b!562788 m!540933))

(declare-fun m!540935 () Bool)

(assert (=> b!562788 m!540935))

(declare-fun m!540937 () Bool)

(assert (=> b!562783 m!540937))

(assert (=> b!562792 m!540933))

(declare-fun m!540939 () Bool)

(assert (=> b!562792 m!540939))

(assert (=> b!562792 m!540933))

(assert (=> b!562792 m!540933))

(declare-fun m!540941 () Bool)

(assert (=> b!562792 m!540941))

(declare-fun m!540943 () Bool)

(assert (=> b!562792 m!540943))

(declare-fun m!540945 () Bool)

(assert (=> b!562792 m!540945))

(declare-fun m!540947 () Bool)

(assert (=> b!562792 m!540947))

(declare-fun m!540949 () Bool)

(assert (=> b!562792 m!540949))

(declare-fun m!540951 () Bool)

(assert (=> start!51468 m!540951))

(declare-fun m!540953 () Bool)

(assert (=> start!51468 m!540953))

(declare-fun m!540955 () Bool)

(assert (=> b!562791 m!540955))

(assert (=> b!562789 m!540933))

(assert (=> b!562789 m!540933))

(declare-fun m!540957 () Bool)

(assert (=> b!562789 m!540957))

(declare-fun m!540959 () Bool)

(assert (=> b!562789 m!540959))

(declare-fun m!540961 () Bool)

(assert (=> b!562789 m!540961))

(declare-fun m!540963 () Bool)

(assert (=> b!562787 m!540963))

(assert (=> b!562793 m!540933))

(assert (=> b!562793 m!540933))

(declare-fun m!540965 () Bool)

(assert (=> b!562793 m!540965))

(declare-fun m!540967 () Bool)

(assert (=> b!562785 m!540967))

(assert (=> b!562785 m!540933))

(declare-fun m!540969 () Bool)

(assert (=> b!562785 m!540969))

(assert (=> b!562785 m!540933))

(declare-fun m!540971 () Bool)

(assert (=> b!562785 m!540971))

(assert (=> b!562785 m!540949))

(declare-fun m!540973 () Bool)

(assert (=> b!562785 m!540973))

(declare-fun m!540975 () Bool)

(assert (=> b!562790 m!540975))

(declare-fun m!540977 () Bool)

(assert (=> b!562784 m!540977))

(declare-fun m!540979 () Bool)

(assert (=> b!562786 m!540979))

(push 1)

