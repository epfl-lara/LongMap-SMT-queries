; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52764 () Bool)

(assert start!52764)

(declare-fun b!575229 () Bool)

(declare-fun res!363646 () Bool)

(declare-fun e!330979 () Bool)

(assert (=> b!575229 (=> (not res!363646) (not e!330979))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35909 0))(
  ( (array!35910 (arr!17237 (Array (_ BitVec 32) (_ BitVec 64))) (size!17601 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35909)

(assert (=> b!575229 (= res!363646 (and (= (size!17601 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17601 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17601 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575230 () Bool)

(declare-fun res!363648 () Bool)

(assert (=> b!575230 (=> (not res!363648) (not e!330979))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575230 (= res!363648 (validKeyInArray!0 k!1914))))

(declare-fun b!575231 () Bool)

(declare-fun e!330980 () Bool)

(assert (=> b!575231 (= e!330979 e!330980)))

(declare-fun res!363656 () Bool)

(assert (=> b!575231 (=> (not res!363656) (not e!330980))))

(declare-datatypes ((SeekEntryResult!5686 0))(
  ( (MissingZero!5686 (index!24971 (_ BitVec 32))) (Found!5686 (index!24972 (_ BitVec 32))) (Intermediate!5686 (undefined!6498 Bool) (index!24973 (_ BitVec 32)) (x!53863 (_ BitVec 32))) (Undefined!5686) (MissingVacant!5686 (index!24974 (_ BitVec 32))) )
))
(declare-fun lt!262783 () SeekEntryResult!5686)

(assert (=> b!575231 (= res!363656 (or (= lt!262783 (MissingZero!5686 i!1132)) (= lt!262783 (MissingVacant!5686 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35909 (_ BitVec 32)) SeekEntryResult!5686)

(assert (=> b!575231 (= lt!262783 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575232 () Bool)

(declare-fun lt!262782 () SeekEntryResult!5686)

(declare-fun lt!262784 () (_ BitVec 64))

(declare-fun lt!262789 () SeekEntryResult!5686)

(declare-fun e!330976 () Bool)

(declare-fun lt!262787 () SeekEntryResult!5686)

(assert (=> b!575232 (= e!330976 (or (bvslt (index!24973 lt!262789) #b00000000000000000000000000000000) (bvsge (index!24973 lt!262789) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53863 lt!262789) #b01111111111111111111111111111110) (bvslt (x!53863 lt!262789) #b00000000000000000000000000000000) (not (= lt!262784 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17237 a!3118) i!1132 k!1914) (index!24973 lt!262789)) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!262782 lt!262787)))))

(declare-fun e!330978 () Bool)

(assert (=> b!575232 e!330978))

(declare-fun res!363654 () Bool)

(assert (=> b!575232 (=> (not res!363654) (not e!330978))))

(declare-fun lt!262792 () SeekEntryResult!5686)

(assert (=> b!575232 (= res!363654 (= lt!262792 lt!262782))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35909 (_ BitVec 32)) SeekEntryResult!5686)

(assert (=> b!575232 (= lt!262782 (seekKeyOrZeroReturnVacant!0 (x!53863 lt!262789) (index!24973 lt!262789) (index!24973 lt!262789) (select (arr!17237 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575233 () Bool)

(declare-fun lt!262785 () array!35909)

(declare-fun lt!262790 () (_ BitVec 64))

(assert (=> b!575233 (= e!330978 (= (seekEntryOrOpen!0 lt!262790 lt!262785 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53863 lt!262789) (index!24973 lt!262789) (index!24973 lt!262789) lt!262790 lt!262785 mask!3119)))))

(declare-fun b!575234 () Bool)

(declare-fun e!330981 () Bool)

(declare-fun e!330975 () Bool)

(assert (=> b!575234 (= e!330981 (not e!330975))))

(declare-fun res!363650 () Bool)

(assert (=> b!575234 (=> res!363650 e!330975)))

(assert (=> b!575234 (= res!363650 (or (undefined!6498 lt!262789) (not (is-Intermediate!5686 lt!262789))))))

(assert (=> b!575234 (= lt!262792 lt!262787)))

(assert (=> b!575234 (= lt!262787 (Found!5686 j!142))))

(assert (=> b!575234 (= lt!262792 (seekEntryOrOpen!0 (select (arr!17237 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35909 (_ BitVec 32)) Bool)

(assert (=> b!575234 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18074 0))(
  ( (Unit!18075) )
))
(declare-fun lt!262788 () Unit!18074)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18074)

(assert (=> b!575234 (= lt!262788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!363647 () Bool)

(assert (=> start!52764 (=> (not res!363647) (not e!330979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52764 (= res!363647 (validMask!0 mask!3119))))

(assert (=> start!52764 e!330979))

(assert (=> start!52764 true))

(declare-fun array_inv!13033 (array!35909) Bool)

(assert (=> start!52764 (array_inv!13033 a!3118)))

(declare-fun b!575235 () Bool)

(assert (=> b!575235 (= e!330980 e!330981)))

(declare-fun res!363652 () Bool)

(assert (=> b!575235 (=> (not res!363652) (not e!330981))))

(declare-fun lt!262786 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35909 (_ BitVec 32)) SeekEntryResult!5686)

(assert (=> b!575235 (= res!363652 (= lt!262789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262786 lt!262790 lt!262785 mask!3119)))))

(declare-fun lt!262791 () (_ BitVec 32))

(assert (=> b!575235 (= lt!262789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262791 (select (arr!17237 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575235 (= lt!262786 (toIndex!0 lt!262790 mask!3119))))

(assert (=> b!575235 (= lt!262790 (select (store (arr!17237 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575235 (= lt!262791 (toIndex!0 (select (arr!17237 a!3118) j!142) mask!3119))))

(assert (=> b!575235 (= lt!262785 (array!35910 (store (arr!17237 a!3118) i!1132 k!1914) (size!17601 a!3118)))))

(declare-fun b!575236 () Bool)

(declare-fun res!363651 () Bool)

(assert (=> b!575236 (=> (not res!363651) (not e!330980))))

(assert (=> b!575236 (= res!363651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575237 () Bool)

(declare-fun res!363645 () Bool)

(assert (=> b!575237 (=> (not res!363645) (not e!330979))))

(assert (=> b!575237 (= res!363645 (validKeyInArray!0 (select (arr!17237 a!3118) j!142)))))

(declare-fun b!575238 () Bool)

(assert (=> b!575238 (= e!330975 e!330976)))

(declare-fun res!363653 () Bool)

(assert (=> b!575238 (=> res!363653 e!330976)))

(assert (=> b!575238 (= res!363653 (or (= lt!262784 (select (arr!17237 a!3118) j!142)) (= lt!262784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575238 (= lt!262784 (select (arr!17237 a!3118) (index!24973 lt!262789)))))

(declare-fun b!575239 () Bool)

(declare-fun res!363649 () Bool)

(assert (=> b!575239 (=> (not res!363649) (not e!330979))))

(declare-fun arrayContainsKey!0 (array!35909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575239 (= res!363649 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575240 () Bool)

(declare-fun res!363655 () Bool)

(assert (=> b!575240 (=> (not res!363655) (not e!330980))))

(declare-datatypes ((List!11317 0))(
  ( (Nil!11314) (Cons!11313 (h!12352 (_ BitVec 64)) (t!17545 List!11317)) )
))
(declare-fun arrayNoDuplicates!0 (array!35909 (_ BitVec 32) List!11317) Bool)

(assert (=> b!575240 (= res!363655 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11314))))

(assert (= (and start!52764 res!363647) b!575229))

(assert (= (and b!575229 res!363646) b!575237))

(assert (= (and b!575237 res!363645) b!575230))

(assert (= (and b!575230 res!363648) b!575239))

(assert (= (and b!575239 res!363649) b!575231))

(assert (= (and b!575231 res!363656) b!575236))

(assert (= (and b!575236 res!363651) b!575240))

(assert (= (and b!575240 res!363655) b!575235))

(assert (= (and b!575235 res!363652) b!575234))

(assert (= (and b!575234 (not res!363650)) b!575238))

(assert (= (and b!575238 (not res!363653)) b!575232))

(assert (= (and b!575232 res!363654) b!575233))

(declare-fun m!554015 () Bool)

(assert (=> b!575237 m!554015))

(assert (=> b!575237 m!554015))

(declare-fun m!554017 () Bool)

(assert (=> b!575237 m!554017))

(declare-fun m!554019 () Bool)

(assert (=> b!575239 m!554019))

(declare-fun m!554021 () Bool)

(assert (=> b!575231 m!554021))

(declare-fun m!554023 () Bool)

(assert (=> start!52764 m!554023))

(declare-fun m!554025 () Bool)

(assert (=> start!52764 m!554025))

(declare-fun m!554027 () Bool)

(assert (=> b!575236 m!554027))

(declare-fun m!554029 () Bool)

(assert (=> b!575230 m!554029))

(assert (=> b!575238 m!554015))

(declare-fun m!554031 () Bool)

(assert (=> b!575238 m!554031))

(assert (=> b!575234 m!554015))

(assert (=> b!575234 m!554015))

(declare-fun m!554033 () Bool)

(assert (=> b!575234 m!554033))

(declare-fun m!554035 () Bool)

(assert (=> b!575234 m!554035))

(declare-fun m!554037 () Bool)

(assert (=> b!575234 m!554037))

(declare-fun m!554039 () Bool)

(assert (=> b!575232 m!554039))

(declare-fun m!554041 () Bool)

(assert (=> b!575232 m!554041))

(assert (=> b!575232 m!554015))

(assert (=> b!575232 m!554015))

(declare-fun m!554043 () Bool)

(assert (=> b!575232 m!554043))

(declare-fun m!554045 () Bool)

(assert (=> b!575233 m!554045))

(declare-fun m!554047 () Bool)

(assert (=> b!575233 m!554047))

(declare-fun m!554049 () Bool)

(assert (=> b!575240 m!554049))

(declare-fun m!554051 () Bool)

(assert (=> b!575235 m!554051))

(assert (=> b!575235 m!554015))

(declare-fun m!554053 () Bool)

(assert (=> b!575235 m!554053))

(assert (=> b!575235 m!554039))

(declare-fun m!554055 () Bool)

(assert (=> b!575235 m!554055))

(assert (=> b!575235 m!554015))

(declare-fun m!554057 () Bool)

(assert (=> b!575235 m!554057))

(assert (=> b!575235 m!554015))

(declare-fun m!554059 () Bool)

(assert (=> b!575235 m!554059))

(push 1)

