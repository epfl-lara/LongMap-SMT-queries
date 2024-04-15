; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50744 () Bool)

(assert start!50744)

(declare-fun b!554927 () Bool)

(declare-fun res!347488 () Bool)

(declare-fun e!319856 () Bool)

(assert (=> b!554927 (=> (not res!347488) (not e!319856))))

(declare-datatypes ((array!34978 0))(
  ( (array!34979 (arr!16799 (Array (_ BitVec 32) (_ BitVec 64))) (size!17164 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34978)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34978 (_ BitVec 32)) Bool)

(assert (=> b!554927 (= res!347488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554928 () Bool)

(declare-fun res!347486 () Bool)

(declare-fun e!319857 () Bool)

(assert (=> b!554928 (=> (not res!347486) (not e!319857))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554928 (= res!347486 (validKeyInArray!0 (select (arr!16799 a!3118) j!142)))))

(declare-fun b!554929 () Bool)

(declare-fun e!319854 () Bool)

(assert (=> b!554929 (= e!319854 (not true))))

(declare-datatypes ((SeekEntryResult!5245 0))(
  ( (MissingZero!5245 (index!23207 (_ BitVec 32))) (Found!5245 (index!23208 (_ BitVec 32))) (Intermediate!5245 (undefined!6057 Bool) (index!23209 (_ BitVec 32)) (x!52122 (_ BitVec 32))) (Undefined!5245) (MissingVacant!5245 (index!23210 (_ BitVec 32))) )
))
(declare-fun lt!252020 () SeekEntryResult!5245)

(declare-fun lt!252022 () SeekEntryResult!5245)

(get-info :version)

(assert (=> b!554929 (and (= lt!252022 (Found!5245 j!142)) (or (undefined!6057 lt!252020) (not ((_ is Intermediate!5245) lt!252020)) (= (select (arr!16799 a!3118) (index!23209 lt!252020)) (select (arr!16799 a!3118) j!142)) (not (= (select (arr!16799 a!3118) (index!23209 lt!252020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252022 (MissingZero!5245 (index!23209 lt!252020)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34978 (_ BitVec 32)) SeekEntryResult!5245)

(assert (=> b!554929 (= lt!252022 (seekEntryOrOpen!0 (select (arr!16799 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554929 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17250 0))(
  ( (Unit!17251) )
))
(declare-fun lt!252023 () Unit!17250)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17250)

(assert (=> b!554929 (= lt!252023 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554930 () Bool)

(assert (=> b!554930 (= e!319856 e!319854)))

(declare-fun res!347484 () Bool)

(assert (=> b!554930 (=> (not res!347484) (not e!319854))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!252025 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34978 (_ BitVec 32)) SeekEntryResult!5245)

(assert (=> b!554930 (= res!347484 (= lt!252020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252025 (select (store (arr!16799 a!3118) i!1132 k0!1914) j!142) (array!34979 (store (arr!16799 a!3118) i!1132 k0!1914) (size!17164 a!3118)) mask!3119)))))

(declare-fun lt!252024 () (_ BitVec 32))

(assert (=> b!554930 (= lt!252020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252024 (select (arr!16799 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554930 (= lt!252025 (toIndex!0 (select (store (arr!16799 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554930 (= lt!252024 (toIndex!0 (select (arr!16799 a!3118) j!142) mask!3119))))

(declare-fun b!554931 () Bool)

(declare-fun res!347489 () Bool)

(assert (=> b!554931 (=> (not res!347489) (not e!319857))))

(declare-fun arrayContainsKey!0 (array!34978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554931 (= res!347489 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554932 () Bool)

(declare-fun res!347482 () Bool)

(assert (=> b!554932 (=> (not res!347482) (not e!319857))))

(assert (=> b!554932 (= res!347482 (and (= (size!17164 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17164 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17164 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!347487 () Bool)

(assert (=> start!50744 (=> (not res!347487) (not e!319857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50744 (= res!347487 (validMask!0 mask!3119))))

(assert (=> start!50744 e!319857))

(assert (=> start!50744 true))

(declare-fun array_inv!12682 (array!34978) Bool)

(assert (=> start!50744 (array_inv!12682 a!3118)))

(declare-fun b!554933 () Bool)

(assert (=> b!554933 (= e!319857 e!319856)))

(declare-fun res!347481 () Bool)

(assert (=> b!554933 (=> (not res!347481) (not e!319856))))

(declare-fun lt!252021 () SeekEntryResult!5245)

(assert (=> b!554933 (= res!347481 (or (= lt!252021 (MissingZero!5245 i!1132)) (= lt!252021 (MissingVacant!5245 i!1132))))))

(assert (=> b!554933 (= lt!252021 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554934 () Bool)

(declare-fun res!347485 () Bool)

(assert (=> b!554934 (=> (not res!347485) (not e!319857))))

(assert (=> b!554934 (= res!347485 (validKeyInArray!0 k0!1914))))

(declare-fun b!554935 () Bool)

(declare-fun res!347483 () Bool)

(assert (=> b!554935 (=> (not res!347483) (not e!319856))))

(declare-datatypes ((List!10918 0))(
  ( (Nil!10915) (Cons!10914 (h!11899 (_ BitVec 64)) (t!17137 List!10918)) )
))
(declare-fun arrayNoDuplicates!0 (array!34978 (_ BitVec 32) List!10918) Bool)

(assert (=> b!554935 (= res!347483 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10915))))

(assert (= (and start!50744 res!347487) b!554932))

(assert (= (and b!554932 res!347482) b!554928))

(assert (= (and b!554928 res!347486) b!554934))

(assert (= (and b!554934 res!347485) b!554931))

(assert (= (and b!554931 res!347489) b!554933))

(assert (= (and b!554933 res!347481) b!554927))

(assert (= (and b!554927 res!347488) b!554935))

(assert (= (and b!554935 res!347483) b!554930))

(assert (= (and b!554930 res!347484) b!554929))

(declare-fun m!532013 () Bool)

(assert (=> b!554933 m!532013))

(declare-fun m!532015 () Bool)

(assert (=> b!554927 m!532015))

(declare-fun m!532017 () Bool)

(assert (=> b!554928 m!532017))

(assert (=> b!554928 m!532017))

(declare-fun m!532019 () Bool)

(assert (=> b!554928 m!532019))

(assert (=> b!554930 m!532017))

(declare-fun m!532021 () Bool)

(assert (=> b!554930 m!532021))

(declare-fun m!532023 () Bool)

(assert (=> b!554930 m!532023))

(declare-fun m!532025 () Bool)

(assert (=> b!554930 m!532025))

(assert (=> b!554930 m!532017))

(assert (=> b!554930 m!532023))

(declare-fun m!532027 () Bool)

(assert (=> b!554930 m!532027))

(assert (=> b!554930 m!532017))

(declare-fun m!532029 () Bool)

(assert (=> b!554930 m!532029))

(assert (=> b!554930 m!532023))

(declare-fun m!532031 () Bool)

(assert (=> b!554930 m!532031))

(declare-fun m!532033 () Bool)

(assert (=> b!554929 m!532033))

(assert (=> b!554929 m!532017))

(declare-fun m!532035 () Bool)

(assert (=> b!554929 m!532035))

(declare-fun m!532037 () Bool)

(assert (=> b!554929 m!532037))

(assert (=> b!554929 m!532017))

(declare-fun m!532039 () Bool)

(assert (=> b!554929 m!532039))

(declare-fun m!532041 () Bool)

(assert (=> b!554935 m!532041))

(declare-fun m!532043 () Bool)

(assert (=> b!554931 m!532043))

(declare-fun m!532045 () Bool)

(assert (=> start!50744 m!532045))

(declare-fun m!532047 () Bool)

(assert (=> start!50744 m!532047))

(declare-fun m!532049 () Bool)

(assert (=> b!554934 m!532049))

(check-sat (not b!554933) (not b!554935) (not b!554929) (not b!554927) (not b!554931) (not b!554930) (not b!554934) (not start!50744) (not b!554928))
(check-sat)
