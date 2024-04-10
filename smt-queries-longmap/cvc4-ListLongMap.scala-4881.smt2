; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67270 () Bool)

(assert start!67270)

(declare-fun b!778020 () Bool)

(declare-fun e!432869 () Bool)

(declare-fun e!432871 () Bool)

(assert (=> b!778020 (= e!432869 e!432871)))

(declare-fun res!526401 () Bool)

(assert (=> b!778020 (=> (not res!526401) (not e!432871))))

(declare-datatypes ((SeekEntryResult!7975 0))(
  ( (MissingZero!7975 (index!34268 (_ BitVec 32))) (Found!7975 (index!34269 (_ BitVec 32))) (Intermediate!7975 (undefined!8787 Bool) (index!34270 (_ BitVec 32)) (x!65207 (_ BitVec 32))) (Undefined!7975) (MissingVacant!7975 (index!34271 (_ BitVec 32))) )
))
(declare-fun lt!346626 () SeekEntryResult!7975)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778020 (= res!526401 (or (= lt!346626 (MissingZero!7975 i!1173)) (= lt!346626 (MissingVacant!7975 i!1173))))))

(declare-datatypes ((array!42562 0))(
  ( (array!42563 (arr!20375 (Array (_ BitVec 32) (_ BitVec 64))) (size!20796 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42562)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42562 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!778020 (= lt!346626 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!778021 () Bool)

(declare-fun res!526400 () Bool)

(declare-fun e!432872 () Bool)

(assert (=> b!778021 (=> (not res!526400) (not e!432872))))

(declare-fun e!432868 () Bool)

(assert (=> b!778021 (= res!526400 e!432868)))

(declare-fun c!86215 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778021 (= c!86215 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778022 () Bool)

(declare-fun res!526395 () Bool)

(assert (=> b!778022 (=> (not res!526395) (not e!432871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42562 (_ BitVec 32)) Bool)

(assert (=> b!778022 (= res!526395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778023 () Bool)

(declare-fun res!526393 () Bool)

(assert (=> b!778023 (=> (not res!526393) (not e!432871))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!778023 (= res!526393 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20796 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20796 a!3186))))))

(declare-fun b!778024 () Bool)

(declare-fun e!432865 () Bool)

(assert (=> b!778024 (= e!432872 e!432865)))

(declare-fun res!526399 () Bool)

(assert (=> b!778024 (=> (not res!526399) (not e!432865))))

(declare-fun lt!346625 () SeekEntryResult!7975)

(declare-fun lt!346631 () SeekEntryResult!7975)

(assert (=> b!778024 (= res!526399 (= lt!346625 lt!346631))))

(declare-fun lt!346624 () (_ BitVec 64))

(declare-fun lt!346627 () array!42562)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42562 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!778024 (= lt!346631 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346624 lt!346627 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778024 (= lt!346625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346624 mask!3328) lt!346624 lt!346627 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!778024 (= lt!346624 (select (store (arr!20375 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!778024 (= lt!346627 (array!42563 (store (arr!20375 a!3186) i!1173 k!2102) (size!20796 a!3186)))))

(declare-fun lt!346623 () SeekEntryResult!7975)

(declare-fun b!778025 () Bool)

(assert (=> b!778025 (= e!432868 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346623))))

(declare-fun b!778026 () Bool)

(declare-fun res!526398 () Bool)

(assert (=> b!778026 (=> (not res!526398) (not e!432869))))

(declare-fun arrayContainsKey!0 (array!42562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778026 (= res!526398 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778027 () Bool)

(declare-fun res!526394 () Bool)

(assert (=> b!778027 (=> (not res!526394) (not e!432869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778027 (= res!526394 (validKeyInArray!0 (select (arr!20375 a!3186) j!159)))))

(declare-fun b!778028 () Bool)

(declare-fun e!432867 () Bool)

(assert (=> b!778028 (= e!432867 true)))

(declare-fun lt!346629 () SeekEntryResult!7975)

(assert (=> b!778028 (= lt!346629 (seekEntryOrOpen!0 lt!346624 lt!346627 mask!3328))))

(declare-fun b!778029 () Bool)

(assert (=> b!778029 (= e!432865 (not e!432867))))

(declare-fun res!526402 () Bool)

(assert (=> b!778029 (=> res!526402 e!432867)))

(assert (=> b!778029 (= res!526402 (or (not (is-Intermediate!7975 lt!346631)) (bvslt x!1131 (x!65207 lt!346631)) (not (= x!1131 (x!65207 lt!346631))) (not (= index!1321 (index!34270 lt!346631)))))))

(declare-fun e!432864 () Bool)

(assert (=> b!778029 e!432864))

(declare-fun res!526406 () Bool)

(assert (=> b!778029 (=> (not res!526406) (not e!432864))))

(assert (=> b!778029 (= res!526406 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26844 0))(
  ( (Unit!26845) )
))
(declare-fun lt!346628 () Unit!26844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26844)

(assert (=> b!778029 (= lt!346628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778030 () Bool)

(declare-fun e!432870 () Bool)

(assert (=> b!778030 (= e!432864 e!432870)))

(declare-fun res!526408 () Bool)

(assert (=> b!778030 (=> (not res!526408) (not e!432870))))

(declare-fun lt!346630 () SeekEntryResult!7975)

(assert (=> b!778030 (= res!526408 (= (seekEntryOrOpen!0 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346630))))

(assert (=> b!778030 (= lt!346630 (Found!7975 j!159))))

(declare-fun b!778031 () Bool)

(declare-fun res!526405 () Bool)

(assert (=> b!778031 (=> res!526405 e!432867)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42562 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!778031 (= res!526405 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) (Found!7975 j!159))))))

(declare-fun b!778032 () Bool)

(declare-fun res!526403 () Bool)

(assert (=> b!778032 (=> (not res!526403) (not e!432869))))

(assert (=> b!778032 (= res!526403 (validKeyInArray!0 k!2102))))

(declare-fun res!526396 () Bool)

(assert (=> start!67270 (=> (not res!526396) (not e!432869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67270 (= res!526396 (validMask!0 mask!3328))))

(assert (=> start!67270 e!432869))

(assert (=> start!67270 true))

(declare-fun array_inv!16171 (array!42562) Bool)

(assert (=> start!67270 (array_inv!16171 a!3186)))

(declare-fun b!778019 () Bool)

(assert (=> b!778019 (= e!432871 e!432872)))

(declare-fun res!526407 () Bool)

(assert (=> b!778019 (=> (not res!526407) (not e!432872))))

(assert (=> b!778019 (= res!526407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346623))))

(assert (=> b!778019 (= lt!346623 (Intermediate!7975 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778033 () Bool)

(declare-fun res!526404 () Bool)

(assert (=> b!778033 (=> (not res!526404) (not e!432872))))

(assert (=> b!778033 (= res!526404 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20375 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778034 () Bool)

(declare-fun res!526409 () Bool)

(assert (=> b!778034 (=> (not res!526409) (not e!432871))))

(declare-datatypes ((List!14377 0))(
  ( (Nil!14374) (Cons!14373 (h!15484 (_ BitVec 64)) (t!20692 List!14377)) )
))
(declare-fun arrayNoDuplicates!0 (array!42562 (_ BitVec 32) List!14377) Bool)

(assert (=> b!778034 (= res!526409 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14374))))

(declare-fun b!778035 () Bool)

(assert (=> b!778035 (= e!432868 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) (Found!7975 j!159)))))

(declare-fun b!778036 () Bool)

(declare-fun res!526392 () Bool)

(assert (=> b!778036 (=> res!526392 e!432867)))

(assert (=> b!778036 (= res!526392 (or (not (= (select (store (arr!20375 a!3186) i!1173 k!2102) index!1321) lt!346624)) (undefined!8787 lt!346631)))))

(declare-fun b!778037 () Bool)

(declare-fun res!526397 () Bool)

(assert (=> b!778037 (=> (not res!526397) (not e!432869))))

(assert (=> b!778037 (= res!526397 (and (= (size!20796 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20796 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20796 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778038 () Bool)

(assert (=> b!778038 (= e!432870 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346630))))

(assert (= (and start!67270 res!526396) b!778037))

(assert (= (and b!778037 res!526397) b!778027))

(assert (= (and b!778027 res!526394) b!778032))

(assert (= (and b!778032 res!526403) b!778026))

(assert (= (and b!778026 res!526398) b!778020))

(assert (= (and b!778020 res!526401) b!778022))

(assert (= (and b!778022 res!526395) b!778034))

(assert (= (and b!778034 res!526409) b!778023))

(assert (= (and b!778023 res!526393) b!778019))

(assert (= (and b!778019 res!526407) b!778033))

(assert (= (and b!778033 res!526404) b!778021))

(assert (= (and b!778021 c!86215) b!778025))

(assert (= (and b!778021 (not c!86215)) b!778035))

(assert (= (and b!778021 res!526400) b!778024))

(assert (= (and b!778024 res!526399) b!778029))

(assert (= (and b!778029 res!526406) b!778030))

(assert (= (and b!778030 res!526408) b!778038))

(assert (= (and b!778029 (not res!526402)) b!778031))

(assert (= (and b!778031 (not res!526405)) b!778036))

(assert (= (and b!778036 (not res!526392)) b!778028))

(declare-fun m!721791 () Bool)

(assert (=> start!67270 m!721791))

(declare-fun m!721793 () Bool)

(assert (=> start!67270 m!721793))

(declare-fun m!721795 () Bool)

(assert (=> b!778026 m!721795))

(declare-fun m!721797 () Bool)

(assert (=> b!778019 m!721797))

(assert (=> b!778019 m!721797))

(declare-fun m!721799 () Bool)

(assert (=> b!778019 m!721799))

(assert (=> b!778019 m!721799))

(assert (=> b!778019 m!721797))

(declare-fun m!721801 () Bool)

(assert (=> b!778019 m!721801))

(assert (=> b!778030 m!721797))

(assert (=> b!778030 m!721797))

(declare-fun m!721803 () Bool)

(assert (=> b!778030 m!721803))

(declare-fun m!721805 () Bool)

(assert (=> b!778032 m!721805))

(assert (=> b!778031 m!721797))

(assert (=> b!778031 m!721797))

(declare-fun m!721807 () Bool)

(assert (=> b!778031 m!721807))

(assert (=> b!778025 m!721797))

(assert (=> b!778025 m!721797))

(declare-fun m!721809 () Bool)

(assert (=> b!778025 m!721809))

(declare-fun m!721811 () Bool)

(assert (=> b!778033 m!721811))

(declare-fun m!721813 () Bool)

(assert (=> b!778020 m!721813))

(declare-fun m!721815 () Bool)

(assert (=> b!778029 m!721815))

(declare-fun m!721817 () Bool)

(assert (=> b!778029 m!721817))

(assert (=> b!778038 m!721797))

(assert (=> b!778038 m!721797))

(declare-fun m!721819 () Bool)

(assert (=> b!778038 m!721819))

(assert (=> b!778035 m!721797))

(assert (=> b!778035 m!721797))

(assert (=> b!778035 m!721807))

(declare-fun m!721821 () Bool)

(assert (=> b!778036 m!721821))

(declare-fun m!721823 () Bool)

(assert (=> b!778036 m!721823))

(declare-fun m!721825 () Bool)

(assert (=> b!778022 m!721825))

(declare-fun m!721827 () Bool)

(assert (=> b!778028 m!721827))

(assert (=> b!778027 m!721797))

(assert (=> b!778027 m!721797))

(declare-fun m!721829 () Bool)

(assert (=> b!778027 m!721829))

(declare-fun m!721831 () Bool)

(assert (=> b!778034 m!721831))

(declare-fun m!721833 () Bool)

(assert (=> b!778024 m!721833))

(declare-fun m!721835 () Bool)

(assert (=> b!778024 m!721835))

(assert (=> b!778024 m!721821))

(declare-fun m!721837 () Bool)

(assert (=> b!778024 m!721837))

(assert (=> b!778024 m!721833))

(declare-fun m!721839 () Bool)

(assert (=> b!778024 m!721839))

(push 1)

