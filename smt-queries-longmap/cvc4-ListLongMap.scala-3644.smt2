; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50244 () Bool)

(assert start!50244)

(declare-fun b!550011 () Bool)

(declare-fun res!343156 () Bool)

(declare-fun e!317546 () Bool)

(assert (=> b!550011 (=> (not res!343156) (not e!317546))))

(declare-datatypes ((array!34697 0))(
  ( (array!34698 (arr!16664 (Array (_ BitVec 32) (_ BitVec 64))) (size!17028 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34697)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550011 (= res!343156 (validKeyInArray!0 (select (arr!16664 a!3118) j!142)))))

(declare-fun b!550012 () Bool)

(declare-fun res!343157 () Bool)

(declare-fun e!317545 () Bool)

(assert (=> b!550012 (=> (not res!343157) (not e!317545))))

(declare-datatypes ((List!10744 0))(
  ( (Nil!10741) (Cons!10740 (h!11713 (_ BitVec 64)) (t!16972 List!10744)) )
))
(declare-fun arrayNoDuplicates!0 (array!34697 (_ BitVec 32) List!10744) Bool)

(assert (=> b!550012 (= res!343157 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10741))))

(declare-fun b!550013 () Bool)

(assert (=> b!550013 (= e!317546 e!317545)))

(declare-fun res!343163 () Bool)

(assert (=> b!550013 (=> (not res!343163) (not e!317545))))

(declare-datatypes ((SeekEntryResult!5113 0))(
  ( (MissingZero!5113 (index!22679 (_ BitVec 32))) (Found!5113 (index!22680 (_ BitVec 32))) (Intermediate!5113 (undefined!5925 Bool) (index!22681 (_ BitVec 32)) (x!51603 (_ BitVec 32))) (Undefined!5113) (MissingVacant!5113 (index!22682 (_ BitVec 32))) )
))
(declare-fun lt!250393 () SeekEntryResult!5113)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550013 (= res!343163 (or (= lt!250393 (MissingZero!5113 i!1132)) (= lt!250393 (MissingVacant!5113 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34697 (_ BitVec 32)) SeekEntryResult!5113)

(assert (=> b!550013 (= lt!250393 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!550014 () Bool)

(declare-fun res!343162 () Bool)

(assert (=> b!550014 (=> (not res!343162) (not e!317545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34697 (_ BitVec 32)) Bool)

(assert (=> b!550014 (= res!343162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550015 () Bool)

(declare-fun res!343161 () Bool)

(assert (=> b!550015 (=> (not res!343161) (not e!317546))))

(declare-fun arrayContainsKey!0 (array!34697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550015 (= res!343161 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!343159 () Bool)

(assert (=> start!50244 (=> (not res!343159) (not e!317546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50244 (= res!343159 (validMask!0 mask!3119))))

(assert (=> start!50244 e!317546))

(assert (=> start!50244 true))

(declare-fun array_inv!12460 (array!34697) Bool)

(assert (=> start!50244 (array_inv!12460 a!3118)))

(declare-fun b!550016 () Bool)

(declare-fun res!343155 () Bool)

(assert (=> b!550016 (=> (not res!343155) (not e!317545))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34697 (_ BitVec 32)) SeekEntryResult!5113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550016 (= res!343155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16664 a!3118) j!142) mask!3119) (select (arr!16664 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16664 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16664 a!3118) i!1132 k!1914) j!142) (array!34698 (store (arr!16664 a!3118) i!1132 k!1914) (size!17028 a!3118)) mask!3119)))))

(declare-fun b!550017 () Bool)

(assert (=> b!550017 (= e!317545 (not true))))

(assert (=> b!550017 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17000 0))(
  ( (Unit!17001) )
))
(declare-fun lt!250392 () Unit!17000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17000)

(assert (=> b!550017 (= lt!250392 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550018 () Bool)

(declare-fun res!343160 () Bool)

(assert (=> b!550018 (=> (not res!343160) (not e!317546))))

(assert (=> b!550018 (= res!343160 (and (= (size!17028 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17028 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17028 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550019 () Bool)

(declare-fun res!343158 () Bool)

(assert (=> b!550019 (=> (not res!343158) (not e!317546))))

(assert (=> b!550019 (= res!343158 (validKeyInArray!0 k!1914))))

(assert (= (and start!50244 res!343159) b!550018))

(assert (= (and b!550018 res!343160) b!550011))

(assert (= (and b!550011 res!343156) b!550019))

(assert (= (and b!550019 res!343158) b!550015))

(assert (= (and b!550015 res!343161) b!550013))

(assert (= (and b!550013 res!343163) b!550014))

(assert (= (and b!550014 res!343162) b!550012))

(assert (= (and b!550012 res!343157) b!550016))

(assert (= (and b!550016 res!343155) b!550017))

(declare-fun m!527003 () Bool)

(assert (=> b!550011 m!527003))

(assert (=> b!550011 m!527003))

(declare-fun m!527005 () Bool)

(assert (=> b!550011 m!527005))

(declare-fun m!527007 () Bool)

(assert (=> b!550017 m!527007))

(declare-fun m!527009 () Bool)

(assert (=> b!550017 m!527009))

(assert (=> b!550016 m!527003))

(declare-fun m!527011 () Bool)

(assert (=> b!550016 m!527011))

(assert (=> b!550016 m!527003))

(declare-fun m!527013 () Bool)

(assert (=> b!550016 m!527013))

(declare-fun m!527015 () Bool)

(assert (=> b!550016 m!527015))

(assert (=> b!550016 m!527013))

(declare-fun m!527017 () Bool)

(assert (=> b!550016 m!527017))

(assert (=> b!550016 m!527011))

(assert (=> b!550016 m!527003))

(declare-fun m!527019 () Bool)

(assert (=> b!550016 m!527019))

(declare-fun m!527021 () Bool)

(assert (=> b!550016 m!527021))

(assert (=> b!550016 m!527013))

(assert (=> b!550016 m!527015))

(declare-fun m!527023 () Bool)

(assert (=> b!550012 m!527023))

(declare-fun m!527025 () Bool)

(assert (=> b!550013 m!527025))

(declare-fun m!527027 () Bool)

(assert (=> b!550019 m!527027))

(declare-fun m!527029 () Bool)

(assert (=> b!550014 m!527029))

(declare-fun m!527031 () Bool)

(assert (=> start!50244 m!527031))

(declare-fun m!527033 () Bool)

(assert (=> start!50244 m!527033))

(declare-fun m!527035 () Bool)

(assert (=> b!550015 m!527035))

(push 1)

(assert (not b!550013))

