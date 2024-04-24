; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52476 () Bool)

(assert start!52476)

(declare-fun b!572548 () Bool)

(declare-fun e!329349 () Bool)

(declare-fun e!329351 () Bool)

(assert (=> b!572548 (= e!329349 e!329351)))

(declare-fun res!361956 () Bool)

(assert (=> b!572548 (=> (not res!361956) (not e!329351))))

(declare-datatypes ((SeekEntryResult!5602 0))(
  ( (MissingZero!5602 (index!24635 (_ BitVec 32))) (Found!5602 (index!24636 (_ BitVec 32))) (Intermediate!5602 (undefined!6414 Bool) (index!24637 (_ BitVec 32)) (x!53658 (_ BitVec 32))) (Undefined!5602) (MissingVacant!5602 (index!24638 (_ BitVec 32))) )
))
(declare-fun lt!261288 () SeekEntryResult!5602)

(declare-fun lt!261285 () (_ BitVec 64))

(declare-datatypes ((array!35820 0))(
  ( (array!35821 (arr!17197 (Array (_ BitVec 32) (_ BitVec 64))) (size!17561 (_ BitVec 32))) )
))
(declare-fun lt!261290 () array!35820)

(declare-fun lt!261286 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35820 (_ BitVec 32)) SeekEntryResult!5602)

(assert (=> b!572548 (= res!361956 (= lt!261288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261286 lt!261285 lt!261290 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun a!3118 () array!35820)

(declare-fun lt!261287 () (_ BitVec 32))

(assert (=> b!572548 (= lt!261288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261287 (select (arr!17197 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572548 (= lt!261286 (toIndex!0 lt!261285 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572548 (= lt!261285 (select (store (arr!17197 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572548 (= lt!261287 (toIndex!0 (select (arr!17197 a!3118) j!142) mask!3119))))

(assert (=> b!572548 (= lt!261290 (array!35821 (store (arr!17197 a!3118) i!1132 k0!1914) (size!17561 a!3118)))))

(declare-fun b!572549 () Bool)

(declare-fun res!361961 () Bool)

(assert (=> b!572549 (=> (not res!361961) (not e!329349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35820 (_ BitVec 32)) Bool)

(assert (=> b!572549 (= res!361961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572551 () Bool)

(declare-fun e!329353 () Bool)

(declare-fun e!329354 () Bool)

(assert (=> b!572551 (= e!329353 e!329354)))

(declare-fun res!361959 () Bool)

(assert (=> b!572551 (=> res!361959 e!329354)))

(get-info :version)

(assert (=> b!572551 (= res!361959 (or (undefined!6414 lt!261288) (not ((_ is Intermediate!5602) lt!261288))))))

(declare-fun b!572552 () Bool)

(declare-fun e!329348 () Bool)

(assert (=> b!572552 (= e!329354 e!329348)))

(declare-fun res!361954 () Bool)

(assert (=> b!572552 (=> res!361954 e!329348)))

(declare-fun lt!261291 () (_ BitVec 64))

(assert (=> b!572552 (= res!361954 (or (= lt!261291 (select (arr!17197 a!3118) j!142)) (= lt!261291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572552 (= lt!261291 (select (arr!17197 a!3118) (index!24637 lt!261288)))))

(declare-fun b!572553 () Bool)

(declare-fun e!329350 () Bool)

(assert (=> b!572553 (= e!329350 e!329349)))

(declare-fun res!361958 () Bool)

(assert (=> b!572553 (=> (not res!361958) (not e!329349))))

(declare-fun lt!261292 () SeekEntryResult!5602)

(assert (=> b!572553 (= res!361958 (or (= lt!261292 (MissingZero!5602 i!1132)) (= lt!261292 (MissingVacant!5602 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35820 (_ BitVec 32)) SeekEntryResult!5602)

(assert (=> b!572553 (= lt!261292 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572554 () Bool)

(declare-fun e!329355 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35820 (_ BitVec 32)) SeekEntryResult!5602)

(assert (=> b!572554 (= e!329355 (= (seekEntryOrOpen!0 lt!261285 lt!261290 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53658 lt!261288) (index!24637 lt!261288) (index!24637 lt!261288) lt!261285 lt!261290 mask!3119)))))

(declare-fun b!572555 () Bool)

(declare-fun res!361957 () Bool)

(assert (=> b!572555 (=> (not res!361957) (not e!329350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572555 (= res!361957 (validKeyInArray!0 (select (arr!17197 a!3118) j!142)))))

(declare-fun b!572556 () Bool)

(assert (=> b!572556 (= e!329351 (not true))))

(assert (=> b!572556 e!329353))

(declare-fun res!361962 () Bool)

(assert (=> b!572556 (=> (not res!361962) (not e!329353))))

(declare-fun lt!261289 () SeekEntryResult!5602)

(assert (=> b!572556 (= res!361962 (= lt!261289 (Found!5602 j!142)))))

(assert (=> b!572556 (= lt!261289 (seekEntryOrOpen!0 (select (arr!17197 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572556 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17977 0))(
  ( (Unit!17978) )
))
(declare-fun lt!261284 () Unit!17977)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17977)

(assert (=> b!572556 (= lt!261284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572557 () Bool)

(declare-fun res!361951 () Bool)

(assert (=> b!572557 (=> (not res!361951) (not e!329350))))

(declare-fun arrayContainsKey!0 (array!35820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572557 (= res!361951 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!361960 () Bool)

(assert (=> start!52476 (=> (not res!361960) (not e!329350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52476 (= res!361960 (validMask!0 mask!3119))))

(assert (=> start!52476 e!329350))

(assert (=> start!52476 true))

(declare-fun array_inv!13056 (array!35820) Bool)

(assert (=> start!52476 (array_inv!13056 a!3118)))

(declare-fun b!572550 () Bool)

(declare-fun res!361963 () Bool)

(assert (=> b!572550 (=> (not res!361963) (not e!329350))))

(assert (=> b!572550 (= res!361963 (and (= (size!17561 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17561 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17561 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572558 () Bool)

(declare-fun res!361955 () Bool)

(assert (=> b!572558 (=> (not res!361955) (not e!329350))))

(assert (=> b!572558 (= res!361955 (validKeyInArray!0 k0!1914))))

(declare-fun b!572559 () Bool)

(assert (=> b!572559 (= e!329348 e!329355)))

(declare-fun res!361953 () Bool)

(assert (=> b!572559 (=> (not res!361953) (not e!329355))))

(assert (=> b!572559 (= res!361953 (= lt!261289 (seekKeyOrZeroReturnVacant!0 (x!53658 lt!261288) (index!24637 lt!261288) (index!24637 lt!261288) (select (arr!17197 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572560 () Bool)

(declare-fun res!361952 () Bool)

(assert (=> b!572560 (=> (not res!361952) (not e!329349))))

(declare-datatypes ((List!11184 0))(
  ( (Nil!11181) (Cons!11180 (h!12210 (_ BitVec 64)) (t!17404 List!11184)) )
))
(declare-fun arrayNoDuplicates!0 (array!35820 (_ BitVec 32) List!11184) Bool)

(assert (=> b!572560 (= res!361952 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11181))))

(assert (= (and start!52476 res!361960) b!572550))

(assert (= (and b!572550 res!361963) b!572555))

(assert (= (and b!572555 res!361957) b!572558))

(assert (= (and b!572558 res!361955) b!572557))

(assert (= (and b!572557 res!361951) b!572553))

(assert (= (and b!572553 res!361958) b!572549))

(assert (= (and b!572549 res!361961) b!572560))

(assert (= (and b!572560 res!361952) b!572548))

(assert (= (and b!572548 res!361956) b!572556))

(assert (= (and b!572556 res!361962) b!572551))

(assert (= (and b!572551 (not res!361959)) b!572552))

(assert (= (and b!572552 (not res!361954)) b!572559))

(assert (= (and b!572559 res!361953) b!572554))

(declare-fun m!551651 () Bool)

(assert (=> b!572555 m!551651))

(assert (=> b!572555 m!551651))

(declare-fun m!551653 () Bool)

(assert (=> b!572555 m!551653))

(declare-fun m!551655 () Bool)

(assert (=> b!572558 m!551655))

(assert (=> b!572548 m!551651))

(declare-fun m!551657 () Bool)

(assert (=> b!572548 m!551657))

(declare-fun m!551659 () Bool)

(assert (=> b!572548 m!551659))

(assert (=> b!572548 m!551651))

(declare-fun m!551661 () Bool)

(assert (=> b!572548 m!551661))

(declare-fun m!551663 () Bool)

(assert (=> b!572548 m!551663))

(declare-fun m!551665 () Bool)

(assert (=> b!572548 m!551665))

(assert (=> b!572548 m!551651))

(declare-fun m!551667 () Bool)

(assert (=> b!572548 m!551667))

(assert (=> b!572552 m!551651))

(declare-fun m!551669 () Bool)

(assert (=> b!572552 m!551669))

(assert (=> b!572556 m!551651))

(assert (=> b!572556 m!551651))

(declare-fun m!551671 () Bool)

(assert (=> b!572556 m!551671))

(declare-fun m!551673 () Bool)

(assert (=> b!572556 m!551673))

(declare-fun m!551675 () Bool)

(assert (=> b!572556 m!551675))

(assert (=> b!572559 m!551651))

(assert (=> b!572559 m!551651))

(declare-fun m!551677 () Bool)

(assert (=> b!572559 m!551677))

(declare-fun m!551679 () Bool)

(assert (=> b!572553 m!551679))

(declare-fun m!551681 () Bool)

(assert (=> b!572560 m!551681))

(declare-fun m!551683 () Bool)

(assert (=> start!52476 m!551683))

(declare-fun m!551685 () Bool)

(assert (=> start!52476 m!551685))

(declare-fun m!551687 () Bool)

(assert (=> b!572549 m!551687))

(declare-fun m!551689 () Bool)

(assert (=> b!572557 m!551689))

(declare-fun m!551691 () Bool)

(assert (=> b!572554 m!551691))

(declare-fun m!551693 () Bool)

(assert (=> b!572554 m!551693))

(check-sat (not b!572558) (not b!572554) (not b!572556) (not b!572560) (not b!572553) (not b!572559) (not b!572555) (not b!572557) (not b!572548) (not b!572549) (not start!52476))
(check-sat)
