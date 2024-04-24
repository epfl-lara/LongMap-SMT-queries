; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50454 () Bool)

(assert start!50454)

(declare-fun b!551443 () Bool)

(declare-fun res!344118 () Bool)

(declare-fun e!318309 () Bool)

(assert (=> b!551443 (=> (not res!344118) (not e!318309))))

(declare-datatypes ((array!34740 0))(
  ( (array!34741 (arr!16681 (Array (_ BitVec 32) (_ BitVec 64))) (size!17045 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34740)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551443 (= res!344118 (validKeyInArray!0 (select (arr!16681 a!3118) j!142)))))

(declare-fun b!551444 () Bool)

(declare-fun res!344116 () Bool)

(assert (=> b!551444 (=> (not res!344116) (not e!318309))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!551444 (= res!344116 (validKeyInArray!0 k0!1914))))

(declare-fun b!551445 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!318312 () Bool)

(declare-datatypes ((SeekEntryResult!5086 0))(
  ( (MissingZero!5086 (index!22571 (_ BitVec 32))) (Found!5086 (index!22572 (_ BitVec 32))) (Intermediate!5086 (undefined!5898 Bool) (index!22573 (_ BitVec 32)) (x!51655 (_ BitVec 32))) (Undefined!5086) (MissingVacant!5086 (index!22574 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34740 (_ BitVec 32)) SeekEntryResult!5086)

(assert (=> b!551445 (= e!318312 (= (seekEntryOrOpen!0 (select (arr!16681 a!3118) j!142) a!3118 mask!3119) (Found!5086 j!142)))))

(declare-fun b!551446 () Bool)

(declare-fun res!344123 () Bool)

(assert (=> b!551446 (=> (not res!344123) (not e!318309))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551446 (= res!344123 (and (= (size!17045 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17045 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17045 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551447 () Bool)

(declare-fun e!318311 () Bool)

(assert (=> b!551447 (= e!318311 (not true))))

(assert (=> b!551447 e!318312))

(declare-fun res!344121 () Bool)

(assert (=> b!551447 (=> (not res!344121) (not e!318312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34740 (_ BitVec 32)) Bool)

(assert (=> b!551447 (= res!344121 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17017 0))(
  ( (Unit!17018) )
))
(declare-fun lt!250903 () Unit!17017)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17017)

(assert (=> b!551447 (= lt!250903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551448 () Bool)

(declare-fun res!344125 () Bool)

(assert (=> b!551448 (=> (not res!344125) (not e!318311))))

(declare-datatypes ((List!10668 0))(
  ( (Nil!10665) (Cons!10664 (h!11646 (_ BitVec 64)) (t!16888 List!10668)) )
))
(declare-fun arrayNoDuplicates!0 (array!34740 (_ BitVec 32) List!10668) Bool)

(assert (=> b!551448 (= res!344125 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10665))))

(declare-fun b!551449 () Bool)

(assert (=> b!551449 (= e!318309 e!318311)))

(declare-fun res!344124 () Bool)

(assert (=> b!551449 (=> (not res!344124) (not e!318311))))

(declare-fun lt!250902 () SeekEntryResult!5086)

(assert (=> b!551449 (= res!344124 (or (= lt!250902 (MissingZero!5086 i!1132)) (= lt!250902 (MissingVacant!5086 i!1132))))))

(assert (=> b!551449 (= lt!250902 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551451 () Bool)

(declare-fun res!344117 () Bool)

(assert (=> b!551451 (=> (not res!344117) (not e!318311))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34740 (_ BitVec 32)) SeekEntryResult!5086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551451 (= res!344117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16681 a!3118) j!142) mask!3119) (select (arr!16681 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16681 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16681 a!3118) i!1132 k0!1914) j!142) (array!34741 (store (arr!16681 a!3118) i!1132 k0!1914) (size!17045 a!3118)) mask!3119)))))

(declare-fun b!551452 () Bool)

(declare-fun res!344120 () Bool)

(assert (=> b!551452 (=> (not res!344120) (not e!318309))))

(declare-fun arrayContainsKey!0 (array!34740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551452 (= res!344120 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551450 () Bool)

(declare-fun res!344122 () Bool)

(assert (=> b!551450 (=> (not res!344122) (not e!318311))))

(assert (=> b!551450 (= res!344122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!344119 () Bool)

(assert (=> start!50454 (=> (not res!344119) (not e!318309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50454 (= res!344119 (validMask!0 mask!3119))))

(assert (=> start!50454 e!318309))

(assert (=> start!50454 true))

(declare-fun array_inv!12540 (array!34740) Bool)

(assert (=> start!50454 (array_inv!12540 a!3118)))

(assert (= (and start!50454 res!344119) b!551446))

(assert (= (and b!551446 res!344123) b!551443))

(assert (= (and b!551443 res!344118) b!551444))

(assert (= (and b!551444 res!344116) b!551452))

(assert (= (and b!551452 res!344120) b!551449))

(assert (= (and b!551449 res!344124) b!551450))

(assert (= (and b!551450 res!344122) b!551448))

(assert (= (and b!551448 res!344125) b!551451))

(assert (= (and b!551451 res!344117) b!551447))

(assert (= (and b!551447 res!344121) b!551445))

(declare-fun m!528527 () Bool)

(assert (=> b!551443 m!528527))

(assert (=> b!551443 m!528527))

(declare-fun m!528529 () Bool)

(assert (=> b!551443 m!528529))

(declare-fun m!528531 () Bool)

(assert (=> start!50454 m!528531))

(declare-fun m!528533 () Bool)

(assert (=> start!50454 m!528533))

(declare-fun m!528535 () Bool)

(assert (=> b!551450 m!528535))

(assert (=> b!551445 m!528527))

(assert (=> b!551445 m!528527))

(declare-fun m!528537 () Bool)

(assert (=> b!551445 m!528537))

(declare-fun m!528539 () Bool)

(assert (=> b!551448 m!528539))

(declare-fun m!528541 () Bool)

(assert (=> b!551444 m!528541))

(declare-fun m!528543 () Bool)

(assert (=> b!551452 m!528543))

(declare-fun m!528545 () Bool)

(assert (=> b!551447 m!528545))

(declare-fun m!528547 () Bool)

(assert (=> b!551447 m!528547))

(declare-fun m!528549 () Bool)

(assert (=> b!551449 m!528549))

(assert (=> b!551451 m!528527))

(declare-fun m!528551 () Bool)

(assert (=> b!551451 m!528551))

(assert (=> b!551451 m!528527))

(declare-fun m!528553 () Bool)

(assert (=> b!551451 m!528553))

(declare-fun m!528555 () Bool)

(assert (=> b!551451 m!528555))

(assert (=> b!551451 m!528553))

(declare-fun m!528557 () Bool)

(assert (=> b!551451 m!528557))

(assert (=> b!551451 m!528551))

(assert (=> b!551451 m!528527))

(declare-fun m!528559 () Bool)

(assert (=> b!551451 m!528559))

(declare-fun m!528561 () Bool)

(assert (=> b!551451 m!528561))

(assert (=> b!551451 m!528553))

(assert (=> b!551451 m!528555))

(check-sat (not b!551452) (not start!50454) (not b!551449) (not b!551443) (not b!551444) (not b!551445) (not b!551450) (not b!551451) (not b!551447) (not b!551448))
(check-sat)
