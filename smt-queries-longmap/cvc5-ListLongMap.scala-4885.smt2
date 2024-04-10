; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67356 () Bool)

(assert start!67356)

(declare-fun b!779014 () Bool)

(declare-fun res!527021 () Bool)

(declare-fun e!433395 () Bool)

(assert (=> b!779014 (=> (not res!527021) (not e!433395))))

(declare-datatypes ((array!42585 0))(
  ( (array!42586 (arr!20385 (Array (_ BitVec 32) (_ BitVec 64))) (size!20806 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42585)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42585 (_ BitVec 32)) Bool)

(assert (=> b!779014 (= res!527021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779015 () Bool)

(declare-fun res!527027 () Bool)

(declare-fun e!433398 () Bool)

(assert (=> b!779015 (=> (not res!527027) (not e!433398))))

(declare-fun e!433399 () Bool)

(assert (=> b!779015 (= res!527027 e!433399)))

(declare-fun c!86401 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779015 (= c!86401 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!779016 () Bool)

(declare-datatypes ((SeekEntryResult!7985 0))(
  ( (MissingZero!7985 (index!34308 (_ BitVec 32))) (Found!7985 (index!34309 (_ BitVec 32))) (Intermediate!7985 (undefined!8797 Bool) (index!34310 (_ BitVec 32)) (x!65258 (_ BitVec 32))) (Undefined!7985) (MissingVacant!7985 (index!34311 (_ BitVec 32))) )
))
(declare-fun lt!347077 () SeekEntryResult!7985)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42585 (_ BitVec 32)) SeekEntryResult!7985)

(assert (=> b!779016 (= e!433399 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20385 a!3186) j!159) a!3186 mask!3328) lt!347077))))

(declare-fun b!779017 () Bool)

(declare-fun res!527025 () Bool)

(declare-fun e!433396 () Bool)

(assert (=> b!779017 (=> (not res!527025) (not e!433396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779017 (= res!527025 (validKeyInArray!0 (select (arr!20385 a!3186) j!159)))))

(declare-fun b!779018 () Bool)

(declare-fun e!433401 () Bool)

(declare-fun e!433400 () Bool)

(assert (=> b!779018 (= e!433401 e!433400)))

(declare-fun res!527032 () Bool)

(assert (=> b!779018 (=> (not res!527032) (not e!433400))))

(declare-fun lt!347079 () SeekEntryResult!7985)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42585 (_ BitVec 32)) SeekEntryResult!7985)

(assert (=> b!779018 (= res!527032 (= (seekEntryOrOpen!0 (select (arr!20385 a!3186) j!159) a!3186 mask!3328) lt!347079))))

(assert (=> b!779018 (= lt!347079 (Found!7985 j!159))))

(declare-fun b!779019 () Bool)

(assert (=> b!779019 (= e!433395 e!433398)))

(declare-fun res!527028 () Bool)

(assert (=> b!779019 (=> (not res!527028) (not e!433398))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779019 (= res!527028 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20385 a!3186) j!159) mask!3328) (select (arr!20385 a!3186) j!159) a!3186 mask!3328) lt!347077))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!779019 (= lt!347077 (Intermediate!7985 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779020 () Bool)

(declare-fun res!527019 () Bool)

(assert (=> b!779020 (=> (not res!527019) (not e!433395))))

(assert (=> b!779020 (= res!527019 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20806 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20806 a!3186))))))

(declare-fun b!779021 () Bool)

(declare-fun res!527026 () Bool)

(assert (=> b!779021 (=> (not res!527026) (not e!433395))))

(declare-datatypes ((List!14387 0))(
  ( (Nil!14384) (Cons!14383 (h!15497 (_ BitVec 64)) (t!20702 List!14387)) )
))
(declare-fun arrayNoDuplicates!0 (array!42585 (_ BitVec 32) List!14387) Bool)

(assert (=> b!779021 (= res!527026 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14384))))

(declare-fun b!779022 () Bool)

(declare-fun e!433403 () Bool)

(declare-fun e!433397 () Bool)

(assert (=> b!779022 (= e!433403 (not e!433397))))

(declare-fun res!527033 () Bool)

(assert (=> b!779022 (=> res!527033 e!433397)))

(declare-fun lt!347084 () SeekEntryResult!7985)

(assert (=> b!779022 (= res!527033 (or (not (is-Intermediate!7985 lt!347084)) (bvslt x!1131 (x!65258 lt!347084)) (not (= x!1131 (x!65258 lt!347084))) (not (= index!1321 (index!34310 lt!347084)))))))

(assert (=> b!779022 e!433401))

(declare-fun res!527024 () Bool)

(assert (=> b!779022 (=> (not res!527024) (not e!433401))))

(assert (=> b!779022 (= res!527024 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26864 0))(
  ( (Unit!26865) )
))
(declare-fun lt!347076 () Unit!26864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26864)

(assert (=> b!779022 (= lt!347076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42585 (_ BitVec 32)) SeekEntryResult!7985)

(assert (=> b!779024 (= e!433399 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20385 a!3186) j!159) a!3186 mask!3328) (Found!7985 j!159)))))

(declare-fun b!779025 () Bool)

(assert (=> b!779025 (= e!433400 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20385 a!3186) j!159) a!3186 mask!3328) lt!347079))))

(declare-fun b!779026 () Bool)

(assert (=> b!779026 (= e!433397 true)))

(declare-fun lt!347083 () SeekEntryResult!7985)

(assert (=> b!779026 (= lt!347083 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20385 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779027 () Bool)

(declare-fun res!527030 () Bool)

(assert (=> b!779027 (=> (not res!527030) (not e!433396))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779027 (= res!527030 (and (= (size!20806 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20806 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20806 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!527022 () Bool)

(assert (=> start!67356 (=> (not res!527022) (not e!433396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67356 (= res!527022 (validMask!0 mask!3328))))

(assert (=> start!67356 e!433396))

(assert (=> start!67356 true))

(declare-fun array_inv!16181 (array!42585) Bool)

(assert (=> start!67356 (array_inv!16181 a!3186)))

(declare-fun b!779023 () Bool)

(assert (=> b!779023 (= e!433396 e!433395)))

(declare-fun res!527018 () Bool)

(assert (=> b!779023 (=> (not res!527018) (not e!433395))))

(declare-fun lt!347082 () SeekEntryResult!7985)

(assert (=> b!779023 (= res!527018 (or (= lt!347082 (MissingZero!7985 i!1173)) (= lt!347082 (MissingVacant!7985 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!779023 (= lt!347082 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!779028 () Bool)

(declare-fun res!527031 () Bool)

(assert (=> b!779028 (=> (not res!527031) (not e!433396))))

(declare-fun arrayContainsKey!0 (array!42585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779028 (= res!527031 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779029 () Bool)

(declare-fun res!527023 () Bool)

(assert (=> b!779029 (=> (not res!527023) (not e!433398))))

(assert (=> b!779029 (= res!527023 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20385 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779030 () Bool)

(declare-fun res!527020 () Bool)

(assert (=> b!779030 (=> (not res!527020) (not e!433396))))

(assert (=> b!779030 (= res!527020 (validKeyInArray!0 k!2102))))

(declare-fun b!779031 () Bool)

(assert (=> b!779031 (= e!433398 e!433403)))

(declare-fun res!527029 () Bool)

(assert (=> b!779031 (=> (not res!527029) (not e!433403))))

(declare-fun lt!347080 () SeekEntryResult!7985)

(assert (=> b!779031 (= res!527029 (= lt!347080 lt!347084))))

(declare-fun lt!347078 () (_ BitVec 64))

(declare-fun lt!347081 () array!42585)

(assert (=> b!779031 (= lt!347084 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347078 lt!347081 mask!3328))))

(assert (=> b!779031 (= lt!347080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347078 mask!3328) lt!347078 lt!347081 mask!3328))))

(assert (=> b!779031 (= lt!347078 (select (store (arr!20385 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779031 (= lt!347081 (array!42586 (store (arr!20385 a!3186) i!1173 k!2102) (size!20806 a!3186)))))

(assert (= (and start!67356 res!527022) b!779027))

(assert (= (and b!779027 res!527030) b!779017))

(assert (= (and b!779017 res!527025) b!779030))

(assert (= (and b!779030 res!527020) b!779028))

(assert (= (and b!779028 res!527031) b!779023))

(assert (= (and b!779023 res!527018) b!779014))

(assert (= (and b!779014 res!527021) b!779021))

(assert (= (and b!779021 res!527026) b!779020))

(assert (= (and b!779020 res!527019) b!779019))

(assert (= (and b!779019 res!527028) b!779029))

(assert (= (and b!779029 res!527023) b!779015))

(assert (= (and b!779015 c!86401) b!779016))

(assert (= (and b!779015 (not c!86401)) b!779024))

(assert (= (and b!779015 res!527027) b!779031))

(assert (= (and b!779031 res!527029) b!779022))

(assert (= (and b!779022 res!527024) b!779018))

(assert (= (and b!779018 res!527032) b!779025))

(assert (= (and b!779022 (not res!527033)) b!779026))

(declare-fun m!722579 () Bool)

(assert (=> b!779018 m!722579))

(assert (=> b!779018 m!722579))

(declare-fun m!722581 () Bool)

(assert (=> b!779018 m!722581))

(declare-fun m!722583 () Bool)

(assert (=> b!779023 m!722583))

(declare-fun m!722585 () Bool)

(assert (=> b!779022 m!722585))

(declare-fun m!722587 () Bool)

(assert (=> b!779022 m!722587))

(declare-fun m!722589 () Bool)

(assert (=> start!67356 m!722589))

(declare-fun m!722591 () Bool)

(assert (=> start!67356 m!722591))

(assert (=> b!779025 m!722579))

(assert (=> b!779025 m!722579))

(declare-fun m!722593 () Bool)

(assert (=> b!779025 m!722593))

(assert (=> b!779017 m!722579))

(assert (=> b!779017 m!722579))

(declare-fun m!722595 () Bool)

(assert (=> b!779017 m!722595))

(declare-fun m!722597 () Bool)

(assert (=> b!779014 m!722597))

(assert (=> b!779019 m!722579))

(assert (=> b!779019 m!722579))

(declare-fun m!722599 () Bool)

(assert (=> b!779019 m!722599))

(assert (=> b!779019 m!722599))

(assert (=> b!779019 m!722579))

(declare-fun m!722601 () Bool)

(assert (=> b!779019 m!722601))

(declare-fun m!722603 () Bool)

(assert (=> b!779029 m!722603))

(declare-fun m!722605 () Bool)

(assert (=> b!779030 m!722605))

(declare-fun m!722607 () Bool)

(assert (=> b!779021 m!722607))

(assert (=> b!779026 m!722579))

(assert (=> b!779026 m!722579))

(declare-fun m!722609 () Bool)

(assert (=> b!779026 m!722609))

(assert (=> b!779016 m!722579))

(assert (=> b!779016 m!722579))

(declare-fun m!722611 () Bool)

(assert (=> b!779016 m!722611))

(declare-fun m!722613 () Bool)

(assert (=> b!779028 m!722613))

(assert (=> b!779024 m!722579))

(assert (=> b!779024 m!722579))

(assert (=> b!779024 m!722609))

(declare-fun m!722615 () Bool)

(assert (=> b!779031 m!722615))

(declare-fun m!722617 () Bool)

(assert (=> b!779031 m!722617))

(assert (=> b!779031 m!722617))

(declare-fun m!722619 () Bool)

(assert (=> b!779031 m!722619))

(declare-fun m!722621 () Bool)

(assert (=> b!779031 m!722621))

(declare-fun m!722623 () Bool)

(assert (=> b!779031 m!722623))

(push 1)

