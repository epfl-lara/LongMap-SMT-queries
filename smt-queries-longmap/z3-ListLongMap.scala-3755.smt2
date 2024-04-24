; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51570 () Bool)

(assert start!51570)

(declare-fun b!563905 () Bool)

(declare-fun e!324932 () Bool)

(declare-fun e!324929 () Bool)

(assert (=> b!563905 (= e!324932 e!324929)))

(declare-fun res!354954 () Bool)

(assert (=> b!563905 (=> (not res!354954) (not e!324929))))

(declare-datatypes ((SeekEntryResult!5395 0))(
  ( (MissingZero!5395 (index!23807 (_ BitVec 32))) (Found!5395 (index!23808 (_ BitVec 32))) (Intermediate!5395 (undefined!6207 Bool) (index!23809 (_ BitVec 32)) (x!52845 (_ BitVec 32))) (Undefined!5395) (MissingVacant!5395 (index!23810 (_ BitVec 32))) )
))
(declare-fun lt!257407 () SeekEntryResult!5395)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563905 (= res!354954 (or (= lt!257407 (MissingZero!5395 i!1132)) (= lt!257407 (MissingVacant!5395 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35382 0))(
  ( (array!35383 (arr!16990 (Array (_ BitVec 32) (_ BitVec 64))) (size!17354 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35382)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35382 (_ BitVec 32)) SeekEntryResult!5395)

(assert (=> b!563905 (= lt!257407 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563906 () Bool)

(declare-fun res!354952 () Bool)

(assert (=> b!563906 (=> (not res!354952) (not e!324932))))

(declare-fun arrayContainsKey!0 (array!35382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563906 (= res!354952 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!354961 () Bool)

(assert (=> start!51570 (=> (not res!354961) (not e!324932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51570 (= res!354961 (validMask!0 mask!3119))))

(assert (=> start!51570 e!324932))

(assert (=> start!51570 true))

(declare-fun array_inv!12849 (array!35382) Bool)

(assert (=> start!51570 (array_inv!12849 a!3118)))

(declare-fun b!563907 () Bool)

(declare-fun res!354953 () Bool)

(assert (=> b!563907 (=> (not res!354953) (not e!324929))))

(declare-datatypes ((List!10977 0))(
  ( (Nil!10974) (Cons!10973 (h!11979 (_ BitVec 64)) (t!17197 List!10977)) )
))
(declare-fun arrayNoDuplicates!0 (array!35382 (_ BitVec 32) List!10977) Bool)

(assert (=> b!563907 (= res!354953 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10974))))

(declare-fun b!563908 () Bool)

(declare-fun lt!257408 () Bool)

(declare-fun lt!257406 () SeekEntryResult!5395)

(declare-fun e!324931 () Bool)

(assert (=> b!563908 (= e!324931 (not (or (and (not lt!257408) (undefined!6207 lt!257406)) (and (not lt!257408) (not (undefined!6207 lt!257406))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(get-info :version)

(assert (=> b!563908 (= lt!257408 (not ((_ is Intermediate!5395) lt!257406)))))

(declare-fun e!324930 () Bool)

(assert (=> b!563908 e!324930))

(declare-fun res!354959 () Bool)

(assert (=> b!563908 (=> (not res!354959) (not e!324930))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35382 (_ BitVec 32)) Bool)

(assert (=> b!563908 (= res!354959 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17635 0))(
  ( (Unit!17636) )
))
(declare-fun lt!257410 () Unit!17635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17635)

(assert (=> b!563908 (= lt!257410 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563909 () Bool)

(declare-fun res!354960 () Bool)

(assert (=> b!563909 (=> (not res!354960) (not e!324932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563909 (= res!354960 (validKeyInArray!0 (select (arr!16990 a!3118) j!142)))))

(declare-fun b!563910 () Bool)

(declare-fun res!354956 () Bool)

(assert (=> b!563910 (=> (not res!354956) (not e!324932))))

(assert (=> b!563910 (= res!354956 (validKeyInArray!0 k0!1914))))

(declare-fun b!563911 () Bool)

(assert (=> b!563911 (= e!324929 e!324931)))

(declare-fun res!354955 () Bool)

(assert (=> b!563911 (=> (not res!354955) (not e!324931))))

(declare-fun lt!257405 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35382 (_ BitVec 32)) SeekEntryResult!5395)

(assert (=> b!563911 (= res!354955 (= lt!257406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257405 (select (store (arr!16990 a!3118) i!1132 k0!1914) j!142) (array!35383 (store (arr!16990 a!3118) i!1132 k0!1914) (size!17354 a!3118)) mask!3119)))))

(declare-fun lt!257409 () (_ BitVec 32))

(assert (=> b!563911 (= lt!257406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257409 (select (arr!16990 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563911 (= lt!257405 (toIndex!0 (select (store (arr!16990 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563911 (= lt!257409 (toIndex!0 (select (arr!16990 a!3118) j!142) mask!3119))))

(declare-fun b!563912 () Bool)

(declare-fun res!354958 () Bool)

(assert (=> b!563912 (=> (not res!354958) (not e!324932))))

(assert (=> b!563912 (= res!354958 (and (= (size!17354 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17354 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17354 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563913 () Bool)

(declare-fun res!354957 () Bool)

(assert (=> b!563913 (=> (not res!354957) (not e!324929))))

(assert (=> b!563913 (= res!354957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563914 () Bool)

(assert (=> b!563914 (= e!324930 (= (seekEntryOrOpen!0 (select (arr!16990 a!3118) j!142) a!3118 mask!3119) (Found!5395 j!142)))))

(assert (= (and start!51570 res!354961) b!563912))

(assert (= (and b!563912 res!354958) b!563909))

(assert (= (and b!563909 res!354960) b!563910))

(assert (= (and b!563910 res!354956) b!563906))

(assert (= (and b!563906 res!354952) b!563905))

(assert (= (and b!563905 res!354954) b!563913))

(assert (= (and b!563913 res!354957) b!563907))

(assert (= (and b!563907 res!354953) b!563911))

(assert (= (and b!563911 res!354955) b!563908))

(assert (= (and b!563908 res!354959) b!563914))

(declare-fun m!542441 () Bool)

(assert (=> b!563913 m!542441))

(declare-fun m!542443 () Bool)

(assert (=> b!563908 m!542443))

(declare-fun m!542445 () Bool)

(assert (=> b!563908 m!542445))

(declare-fun m!542447 () Bool)

(assert (=> start!51570 m!542447))

(declare-fun m!542449 () Bool)

(assert (=> start!51570 m!542449))

(declare-fun m!542451 () Bool)

(assert (=> b!563914 m!542451))

(assert (=> b!563914 m!542451))

(declare-fun m!542453 () Bool)

(assert (=> b!563914 m!542453))

(assert (=> b!563909 m!542451))

(assert (=> b!563909 m!542451))

(declare-fun m!542455 () Bool)

(assert (=> b!563909 m!542455))

(declare-fun m!542457 () Bool)

(assert (=> b!563910 m!542457))

(assert (=> b!563911 m!542451))

(declare-fun m!542459 () Bool)

(assert (=> b!563911 m!542459))

(assert (=> b!563911 m!542451))

(declare-fun m!542461 () Bool)

(assert (=> b!563911 m!542461))

(assert (=> b!563911 m!542451))

(declare-fun m!542463 () Bool)

(assert (=> b!563911 m!542463))

(declare-fun m!542465 () Bool)

(assert (=> b!563911 m!542465))

(assert (=> b!563911 m!542463))

(declare-fun m!542467 () Bool)

(assert (=> b!563911 m!542467))

(assert (=> b!563911 m!542463))

(declare-fun m!542469 () Bool)

(assert (=> b!563911 m!542469))

(declare-fun m!542471 () Bool)

(assert (=> b!563905 m!542471))

(declare-fun m!542473 () Bool)

(assert (=> b!563907 m!542473))

(declare-fun m!542475 () Bool)

(assert (=> b!563906 m!542475))

(check-sat (not b!563908) (not b!563905) (not start!51570) (not b!563914) (not b!563911) (not b!563906) (not b!563910) (not b!563907) (not b!563913) (not b!563909))
(check-sat)
