; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51902 () Bool)

(assert start!51902)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!567323 () Bool)

(declare-datatypes ((array!35596 0))(
  ( (array!35597 (arr!17094 (Array (_ BitVec 32) (_ BitVec 64))) (size!17458 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35596)

(declare-fun e!326472 () Bool)

(declare-datatypes ((SeekEntryResult!5543 0))(
  ( (MissingZero!5543 (index!24399 (_ BitVec 32))) (Found!5543 (index!24400 (_ BitVec 32))) (Intermediate!5543 (undefined!6355 Bool) (index!24401 (_ BitVec 32)) (x!53272 (_ BitVec 32))) (Undefined!5543) (MissingVacant!5543 (index!24402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35596 (_ BitVec 32)) SeekEntryResult!5543)

(assert (=> b!567323 (= e!326472 (= (seekEntryOrOpen!0 (select (arr!17094 a!3118) j!142) a!3118 mask!3119) (Found!5543 j!142)))))

(declare-fun b!567324 () Bool)

(declare-fun e!326473 () Bool)

(assert (=> b!567324 (= e!326473 (not true))))

(assert (=> b!567324 e!326472))

(declare-fun res!357910 () Bool)

(assert (=> b!567324 (=> (not res!357910) (not e!326472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35596 (_ BitVec 32)) Bool)

(assert (=> b!567324 (= res!357910 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17788 0))(
  ( (Unit!17789) )
))
(declare-fun lt!258492 () Unit!17788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17788)

(assert (=> b!567324 (= lt!258492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!357908 () Bool)

(declare-fun e!326475 () Bool)

(assert (=> start!51902 (=> (not res!357908) (not e!326475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51902 (= res!357908 (validMask!0 mask!3119))))

(assert (=> start!51902 e!326475))

(assert (=> start!51902 true))

(declare-fun array_inv!12890 (array!35596) Bool)

(assert (=> start!51902 (array_inv!12890 a!3118)))

(declare-fun b!567325 () Bool)

(assert (=> b!567325 (= e!326475 e!326473)))

(declare-fun res!357913 () Bool)

(assert (=> b!567325 (=> (not res!357913) (not e!326473))))

(declare-fun lt!258493 () SeekEntryResult!5543)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567325 (= res!357913 (or (= lt!258493 (MissingZero!5543 i!1132)) (= lt!258493 (MissingVacant!5543 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!567325 (= lt!258493 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567326 () Bool)

(declare-fun res!357912 () Bool)

(assert (=> b!567326 (=> (not res!357912) (not e!326473))))

(declare-datatypes ((List!11174 0))(
  ( (Nil!11171) (Cons!11170 (h!12182 (_ BitVec 64)) (t!17402 List!11174)) )
))
(declare-fun arrayNoDuplicates!0 (array!35596 (_ BitVec 32) List!11174) Bool)

(assert (=> b!567326 (= res!357912 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11171))))

(declare-fun b!567327 () Bool)

(declare-fun res!357917 () Bool)

(assert (=> b!567327 (=> (not res!357917) (not e!326473))))

(assert (=> b!567327 (= res!357917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567328 () Bool)

(declare-fun res!357914 () Bool)

(assert (=> b!567328 (=> (not res!357914) (not e!326475))))

(assert (=> b!567328 (= res!357914 (and (= (size!17458 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17458 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17458 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567329 () Bool)

(declare-fun res!357909 () Bool)

(assert (=> b!567329 (=> (not res!357909) (not e!326475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567329 (= res!357909 (validKeyInArray!0 k!1914))))

(declare-fun b!567330 () Bool)

(declare-fun res!357911 () Bool)

(assert (=> b!567330 (=> (not res!357911) (not e!326475))))

(declare-fun arrayContainsKey!0 (array!35596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567330 (= res!357911 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567331 () Bool)

(declare-fun res!357916 () Bool)

(assert (=> b!567331 (=> (not res!357916) (not e!326475))))

(assert (=> b!567331 (= res!357916 (validKeyInArray!0 (select (arr!17094 a!3118) j!142)))))

(declare-fun b!567332 () Bool)

(declare-fun res!357915 () Bool)

(assert (=> b!567332 (=> (not res!357915) (not e!326473))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35596 (_ BitVec 32)) SeekEntryResult!5543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567332 (= res!357915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17094 a!3118) j!142) mask!3119) (select (arr!17094 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17094 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17094 a!3118) i!1132 k!1914) j!142) (array!35597 (store (arr!17094 a!3118) i!1132 k!1914) (size!17458 a!3118)) mask!3119)))))

(assert (= (and start!51902 res!357908) b!567328))

(assert (= (and b!567328 res!357914) b!567331))

(assert (= (and b!567331 res!357916) b!567329))

(assert (= (and b!567329 res!357909) b!567330))

(assert (= (and b!567330 res!357911) b!567325))

(assert (= (and b!567325 res!357913) b!567327))

(assert (= (and b!567327 res!357917) b!567326))

(assert (= (and b!567326 res!357912) b!567332))

(assert (= (and b!567332 res!357915) b!567324))

(assert (= (and b!567324 res!357910) b!567323))

(declare-fun m!545889 () Bool)

(assert (=> b!567323 m!545889))

(assert (=> b!567323 m!545889))

(declare-fun m!545891 () Bool)

(assert (=> b!567323 m!545891))

(assert (=> b!567331 m!545889))

(assert (=> b!567331 m!545889))

(declare-fun m!545893 () Bool)

(assert (=> b!567331 m!545893))

(declare-fun m!545895 () Bool)

(assert (=> b!567329 m!545895))

(declare-fun m!545897 () Bool)

(assert (=> b!567324 m!545897))

(declare-fun m!545899 () Bool)

(assert (=> b!567324 m!545899))

(declare-fun m!545901 () Bool)

(assert (=> b!567330 m!545901))

(declare-fun m!545903 () Bool)

(assert (=> b!567326 m!545903))

(declare-fun m!545905 () Bool)

(assert (=> start!51902 m!545905))

(declare-fun m!545907 () Bool)

(assert (=> start!51902 m!545907))

(declare-fun m!545909 () Bool)

(assert (=> b!567327 m!545909))

(assert (=> b!567332 m!545889))

(declare-fun m!545911 () Bool)

(assert (=> b!567332 m!545911))

(assert (=> b!567332 m!545889))

(declare-fun m!545913 () Bool)

(assert (=> b!567332 m!545913))

(declare-fun m!545915 () Bool)

(assert (=> b!567332 m!545915))

(assert (=> b!567332 m!545913))

(declare-fun m!545917 () Bool)

(assert (=> b!567332 m!545917))

(assert (=> b!567332 m!545911))

(assert (=> b!567332 m!545889))

(declare-fun m!545919 () Bool)

(assert (=> b!567332 m!545919))

(declare-fun m!545921 () Bool)

(assert (=> b!567332 m!545921))

(assert (=> b!567332 m!545913))

(assert (=> b!567332 m!545915))

(declare-fun m!545923 () Bool)

(assert (=> b!567325 m!545923))

(push 1)

