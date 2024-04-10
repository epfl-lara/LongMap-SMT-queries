; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50606 () Bool)

(assert start!50606)

(declare-fun b!553004 () Bool)

(declare-fun res!345419 () Bool)

(declare-fun e!319058 () Bool)

(assert (=> b!553004 (=> (not res!345419) (not e!319058))))

(declare-datatypes ((array!34831 0))(
  ( (array!34832 (arr!16725 (Array (_ BitVec 32) (_ BitVec 64))) (size!17089 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34831)

(declare-datatypes ((List!10805 0))(
  ( (Nil!10802) (Cons!10801 (h!11786 (_ BitVec 64)) (t!17033 List!10805)) )
))
(declare-fun arrayNoDuplicates!0 (array!34831 (_ BitVec 32) List!10805) Bool)

(assert (=> b!553004 (= res!345419 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10802))))

(declare-fun b!553005 () Bool)

(declare-fun res!345422 () Bool)

(declare-fun e!319056 () Bool)

(assert (=> b!553005 (=> (not res!345422) (not e!319056))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553005 (= res!345422 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553007 () Bool)

(declare-fun res!345420 () Bool)

(assert (=> b!553007 (=> (not res!345420) (not e!319058))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34831 (_ BitVec 32)) Bool)

(assert (=> b!553007 (= res!345420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!319059 () Bool)

(declare-fun b!553008 () Bool)

(declare-datatypes ((SeekEntryResult!5174 0))(
  ( (MissingZero!5174 (index!22923 (_ BitVec 32))) (Found!5174 (index!22924 (_ BitVec 32))) (Intermediate!5174 (undefined!5986 Bool) (index!22925 (_ BitVec 32)) (x!51856 (_ BitVec 32))) (Undefined!5174) (MissingVacant!5174 (index!22926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34831 (_ BitVec 32)) SeekEntryResult!5174)

(assert (=> b!553008 (= e!319059 (= (seekEntryOrOpen!0 (select (arr!16725 a!3118) j!142) a!3118 mask!3119) (Found!5174 j!142)))))

(declare-fun b!553009 () Bool)

(declare-fun res!345418 () Bool)

(assert (=> b!553009 (=> (not res!345418) (not e!319056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553009 (= res!345418 (validKeyInArray!0 k!1914))))

(declare-fun b!553010 () Bool)

(declare-fun res!345425 () Bool)

(assert (=> b!553010 (=> (not res!345425) (not e!319056))))

(assert (=> b!553010 (= res!345425 (validKeyInArray!0 (select (arr!16725 a!3118) j!142)))))

(declare-fun b!553011 () Bool)

(declare-fun res!345417 () Bool)

(assert (=> b!553011 (=> (not res!345417) (not e!319058))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34831 (_ BitVec 32)) SeekEntryResult!5174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553011 (= res!345417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16725 a!3118) j!142) mask!3119) (select (arr!16725 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16725 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16725 a!3118) i!1132 k!1914) j!142) (array!34832 (store (arr!16725 a!3118) i!1132 k!1914) (size!17089 a!3118)) mask!3119)))))

(declare-fun b!553012 () Bool)

(assert (=> b!553012 (= e!319058 (not true))))

(assert (=> b!553012 e!319059))

(declare-fun res!345421 () Bool)

(assert (=> b!553012 (=> (not res!345421) (not e!319059))))

(assert (=> b!553012 (= res!345421 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17122 0))(
  ( (Unit!17123) )
))
(declare-fun lt!251346 () Unit!17122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17122)

(assert (=> b!553012 (= lt!251346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553013 () Bool)

(declare-fun res!345424 () Bool)

(assert (=> b!553013 (=> (not res!345424) (not e!319056))))

(assert (=> b!553013 (= res!345424 (and (= (size!17089 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17089 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17089 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553006 () Bool)

(assert (=> b!553006 (= e!319056 e!319058)))

(declare-fun res!345423 () Bool)

(assert (=> b!553006 (=> (not res!345423) (not e!319058))))

(declare-fun lt!251347 () SeekEntryResult!5174)

(assert (=> b!553006 (= res!345423 (or (= lt!251347 (MissingZero!5174 i!1132)) (= lt!251347 (MissingVacant!5174 i!1132))))))

(assert (=> b!553006 (= lt!251347 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!345416 () Bool)

(assert (=> start!50606 (=> (not res!345416) (not e!319056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50606 (= res!345416 (validMask!0 mask!3119))))

(assert (=> start!50606 e!319056))

(assert (=> start!50606 true))

(declare-fun array_inv!12521 (array!34831) Bool)

(assert (=> start!50606 (array_inv!12521 a!3118)))

(assert (= (and start!50606 res!345416) b!553013))

(assert (= (and b!553013 res!345424) b!553010))

(assert (= (and b!553010 res!345425) b!553009))

(assert (= (and b!553009 res!345418) b!553005))

(assert (= (and b!553005 res!345422) b!553006))

(assert (= (and b!553006 res!345423) b!553007))

(assert (= (and b!553007 res!345420) b!553004))

(assert (= (and b!553004 res!345419) b!553011))

(assert (= (and b!553011 res!345417) b!553012))

(assert (= (and b!553012 res!345421) b!553008))

(declare-fun m!530001 () Bool)

(assert (=> b!553008 m!530001))

(assert (=> b!553008 m!530001))

(declare-fun m!530003 () Bool)

(assert (=> b!553008 m!530003))

(assert (=> b!553010 m!530001))

(assert (=> b!553010 m!530001))

(declare-fun m!530005 () Bool)

(assert (=> b!553010 m!530005))

(declare-fun m!530007 () Bool)

(assert (=> b!553009 m!530007))

(declare-fun m!530009 () Bool)

(assert (=> start!50606 m!530009))

(declare-fun m!530011 () Bool)

(assert (=> start!50606 m!530011))

(declare-fun m!530013 () Bool)

(assert (=> b!553005 m!530013))

(declare-fun m!530015 () Bool)

(assert (=> b!553006 m!530015))

(assert (=> b!553011 m!530001))

(declare-fun m!530017 () Bool)

(assert (=> b!553011 m!530017))

(assert (=> b!553011 m!530001))

(declare-fun m!530019 () Bool)

(assert (=> b!553011 m!530019))

(declare-fun m!530021 () Bool)

(assert (=> b!553011 m!530021))

(assert (=> b!553011 m!530019))

(declare-fun m!530023 () Bool)

(assert (=> b!553011 m!530023))

(assert (=> b!553011 m!530017))

(assert (=> b!553011 m!530001))

(declare-fun m!530025 () Bool)

(assert (=> b!553011 m!530025))

(declare-fun m!530027 () Bool)

(assert (=> b!553011 m!530027))

(assert (=> b!553011 m!530019))

(assert (=> b!553011 m!530021))

(declare-fun m!530029 () Bool)

(assert (=> b!553004 m!530029))

(declare-fun m!530031 () Bool)

(assert (=> b!553007 m!530031))

(declare-fun m!530033 () Bool)

(assert (=> b!553012 m!530033))

(declare-fun m!530035 () Bool)

(assert (=> b!553012 m!530035))

(push 1)

