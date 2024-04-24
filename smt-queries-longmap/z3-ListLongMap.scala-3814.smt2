; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52350 () Bool)

(assert start!52350)

(declare-fun b!571020 () Bool)

(declare-fun e!328420 () Bool)

(assert (=> b!571020 (= e!328420 (not true))))

(declare-fun e!328422 () Bool)

(assert (=> b!571020 e!328422))

(declare-fun res!360698 () Bool)

(assert (=> b!571020 (=> (not res!360698) (not e!328422))))

(declare-datatypes ((SeekEntryResult!5572 0))(
  ( (MissingZero!5572 (index!24515 (_ BitVec 32))) (Found!5572 (index!24516 (_ BitVec 32))) (Intermediate!5572 (undefined!6384 Bool) (index!24517 (_ BitVec 32)) (x!53539 (_ BitVec 32))) (Undefined!5572) (MissingVacant!5572 (index!24518 (_ BitVec 32))) )
))
(declare-fun lt!260353 () SeekEntryResult!5572)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571020 (= res!360698 (= lt!260353 (Found!5572 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35757 0))(
  ( (array!35758 (arr!17167 (Array (_ BitVec 32) (_ BitVec 64))) (size!17531 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35757)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35757 (_ BitVec 32)) SeekEntryResult!5572)

(assert (=> b!571020 (= lt!260353 (seekEntryOrOpen!0 (select (arr!17167 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35757 (_ BitVec 32)) Bool)

(assert (=> b!571020 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17917 0))(
  ( (Unit!17918) )
))
(declare-fun lt!260356 () Unit!17917)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17917)

(assert (=> b!571020 (= lt!260356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571021 () Bool)

(declare-fun e!328421 () Bool)

(declare-fun lt!260352 () SeekEntryResult!5572)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35757 (_ BitVec 32)) SeekEntryResult!5572)

(assert (=> b!571021 (= e!328421 (= lt!260353 (seekKeyOrZeroReturnVacant!0 (x!53539 lt!260352) (index!24517 lt!260352) (index!24517 lt!260352) (select (arr!17167 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571022 () Bool)

(declare-fun e!328425 () Bool)

(assert (=> b!571022 (= e!328425 e!328420)))

(declare-fun res!360701 () Bool)

(assert (=> b!571022 (=> (not res!360701) (not e!328420))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!260354 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35757 (_ BitVec 32)) SeekEntryResult!5572)

(assert (=> b!571022 (= res!360701 (= lt!260352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260354 (select (store (arr!17167 a!3118) i!1132 k0!1914) j!142) (array!35758 (store (arr!17167 a!3118) i!1132 k0!1914) (size!17531 a!3118)) mask!3119)))))

(declare-fun lt!260355 () (_ BitVec 32))

(assert (=> b!571022 (= lt!260352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260355 (select (arr!17167 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571022 (= lt!260354 (toIndex!0 (select (store (arr!17167 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!571022 (= lt!260355 (toIndex!0 (select (arr!17167 a!3118) j!142) mask!3119))))

(declare-fun b!571023 () Bool)

(declare-fun res!360704 () Bool)

(declare-fun e!328424 () Bool)

(assert (=> b!571023 (=> (not res!360704) (not e!328424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571023 (= res!360704 (validKeyInArray!0 (select (arr!17167 a!3118) j!142)))))

(declare-fun res!360700 () Bool)

(assert (=> start!52350 (=> (not res!360700) (not e!328424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52350 (= res!360700 (validMask!0 mask!3119))))

(assert (=> start!52350 e!328424))

(assert (=> start!52350 true))

(declare-fun array_inv!13026 (array!35757) Bool)

(assert (=> start!52350 (array_inv!13026 a!3118)))

(declare-fun b!571024 () Bool)

(declare-fun res!360699 () Bool)

(assert (=> b!571024 (=> (not res!360699) (not e!328425))))

(declare-datatypes ((List!11154 0))(
  ( (Nil!11151) (Cons!11150 (h!12177 (_ BitVec 64)) (t!17374 List!11154)) )
))
(declare-fun arrayNoDuplicates!0 (array!35757 (_ BitVec 32) List!11154) Bool)

(assert (=> b!571024 (= res!360699 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11151))))

(declare-fun b!571025 () Bool)

(declare-fun res!360696 () Bool)

(assert (=> b!571025 (=> (not res!360696) (not e!328424))))

(declare-fun arrayContainsKey!0 (array!35757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571025 (= res!360696 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571026 () Bool)

(declare-fun res!360703 () Bool)

(assert (=> b!571026 (=> (not res!360703) (not e!328424))))

(assert (=> b!571026 (= res!360703 (validKeyInArray!0 k0!1914))))

(declare-fun b!571027 () Bool)

(declare-fun res!360697 () Bool)

(assert (=> b!571027 (=> (not res!360697) (not e!328424))))

(assert (=> b!571027 (= res!360697 (and (= (size!17531 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17531 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17531 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571028 () Bool)

(assert (=> b!571028 (= e!328422 e!328421)))

(declare-fun res!360705 () Bool)

(assert (=> b!571028 (=> res!360705 e!328421)))

(get-info :version)

(assert (=> b!571028 (= res!360705 (or (undefined!6384 lt!260352) (not ((_ is Intermediate!5572) lt!260352)) (= (select (arr!17167 a!3118) (index!24517 lt!260352)) (select (arr!17167 a!3118) j!142)) (= (select (arr!17167 a!3118) (index!24517 lt!260352)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!571029 () Bool)

(assert (=> b!571029 (= e!328424 e!328425)))

(declare-fun res!360706 () Bool)

(assert (=> b!571029 (=> (not res!360706) (not e!328425))))

(declare-fun lt!260351 () SeekEntryResult!5572)

(assert (=> b!571029 (= res!360706 (or (= lt!260351 (MissingZero!5572 i!1132)) (= lt!260351 (MissingVacant!5572 i!1132))))))

(assert (=> b!571029 (= lt!260351 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571030 () Bool)

(declare-fun res!360702 () Bool)

(assert (=> b!571030 (=> (not res!360702) (not e!328425))))

(assert (=> b!571030 (= res!360702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52350 res!360700) b!571027))

(assert (= (and b!571027 res!360697) b!571023))

(assert (= (and b!571023 res!360704) b!571026))

(assert (= (and b!571026 res!360703) b!571025))

(assert (= (and b!571025 res!360696) b!571029))

(assert (= (and b!571029 res!360706) b!571030))

(assert (= (and b!571030 res!360702) b!571024))

(assert (= (and b!571024 res!360699) b!571022))

(assert (= (and b!571022 res!360701) b!571020))

(assert (= (and b!571020 res!360698) b!571028))

(assert (= (and b!571028 (not res!360705)) b!571021))

(declare-fun m!550067 () Bool)

(assert (=> b!571025 m!550067))

(declare-fun m!550069 () Bool)

(assert (=> b!571030 m!550069))

(declare-fun m!550071 () Bool)

(assert (=> start!52350 m!550071))

(declare-fun m!550073 () Bool)

(assert (=> start!52350 m!550073))

(declare-fun m!550075 () Bool)

(assert (=> b!571022 m!550075))

(declare-fun m!550077 () Bool)

(assert (=> b!571022 m!550077))

(assert (=> b!571022 m!550075))

(declare-fun m!550079 () Bool)

(assert (=> b!571022 m!550079))

(assert (=> b!571022 m!550075))

(declare-fun m!550081 () Bool)

(assert (=> b!571022 m!550081))

(assert (=> b!571022 m!550081))

(declare-fun m!550083 () Bool)

(assert (=> b!571022 m!550083))

(declare-fun m!550085 () Bool)

(assert (=> b!571022 m!550085))

(assert (=> b!571022 m!550081))

(declare-fun m!550087 () Bool)

(assert (=> b!571022 m!550087))

(assert (=> b!571023 m!550075))

(assert (=> b!571023 m!550075))

(declare-fun m!550089 () Bool)

(assert (=> b!571023 m!550089))

(declare-fun m!550091 () Bool)

(assert (=> b!571024 m!550091))

(declare-fun m!550093 () Bool)

(assert (=> b!571026 m!550093))

(declare-fun m!550095 () Bool)

(assert (=> b!571028 m!550095))

(assert (=> b!571028 m!550075))

(assert (=> b!571020 m!550075))

(assert (=> b!571020 m!550075))

(declare-fun m!550097 () Bool)

(assert (=> b!571020 m!550097))

(declare-fun m!550099 () Bool)

(assert (=> b!571020 m!550099))

(declare-fun m!550101 () Bool)

(assert (=> b!571020 m!550101))

(assert (=> b!571021 m!550075))

(assert (=> b!571021 m!550075))

(declare-fun m!550103 () Bool)

(assert (=> b!571021 m!550103))

(declare-fun m!550105 () Bool)

(assert (=> b!571029 m!550105))

(check-sat (not b!571022) (not b!571023) (not b!571024) (not b!571020) (not b!571030) (not b!571029) (not start!52350) (not b!571026) (not b!571025) (not b!571021))
(check-sat)
