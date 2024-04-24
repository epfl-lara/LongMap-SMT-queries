; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51540 () Bool)

(assert start!51540)

(declare-fun b!563455 () Bool)

(declare-fun res!354508 () Bool)

(declare-fun e!324738 () Bool)

(assert (=> b!563455 (=> (not res!354508) (not e!324738))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35352 0))(
  ( (array!35353 (arr!16975 (Array (_ BitVec 32) (_ BitVec 64))) (size!17339 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35352)

(declare-datatypes ((SeekEntryResult!5380 0))(
  ( (MissingZero!5380 (index!23747 (_ BitVec 32))) (Found!5380 (index!23748 (_ BitVec 32))) (Intermediate!5380 (undefined!6192 Bool) (index!23749 (_ BitVec 32)) (x!52790 (_ BitVec 32))) (Undefined!5380) (MissingVacant!5380 (index!23750 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35352 (_ BitVec 32)) SeekEntryResult!5380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563455 (= res!354508 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16975 a!3118) j!142) mask!3119) (select (arr!16975 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16975 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16975 a!3118) i!1132 k0!1914) j!142) (array!35353 (store (arr!16975 a!3118) i!1132 k0!1914) (size!17339 a!3118)) mask!3119)))))

(declare-fun b!563456 () Bool)

(declare-fun res!354502 () Bool)

(assert (=> b!563456 (=> (not res!354502) (not e!324738))))

(declare-datatypes ((List!10962 0))(
  ( (Nil!10959) (Cons!10958 (h!11964 (_ BitVec 64)) (t!17182 List!10962)) )
))
(declare-fun arrayNoDuplicates!0 (array!35352 (_ BitVec 32) List!10962) Bool)

(assert (=> b!563456 (= res!354502 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10959))))

(declare-fun b!563457 () Bool)

(declare-fun res!354506 () Bool)

(declare-fun e!324739 () Bool)

(assert (=> b!563457 (=> (not res!354506) (not e!324739))))

(declare-fun arrayContainsKey!0 (array!35352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563457 (= res!354506 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563458 () Bool)

(assert (=> b!563458 (= e!324739 e!324738)))

(declare-fun res!354507 () Bool)

(assert (=> b!563458 (=> (not res!354507) (not e!324738))))

(declare-fun lt!257271 () SeekEntryResult!5380)

(assert (=> b!563458 (= res!354507 (or (= lt!257271 (MissingZero!5380 i!1132)) (= lt!257271 (MissingVacant!5380 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35352 (_ BitVec 32)) SeekEntryResult!5380)

(assert (=> b!563458 (= lt!257271 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563459 () Bool)

(declare-fun res!354511 () Bool)

(assert (=> b!563459 (=> (not res!354511) (not e!324739))))

(assert (=> b!563459 (= res!354511 (and (= (size!17339 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17339 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17339 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563460 () Bool)

(declare-fun res!354510 () Bool)

(assert (=> b!563460 (=> (not res!354510) (not e!324739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563460 (= res!354510 (validKeyInArray!0 k0!1914))))

(declare-fun b!563461 () Bool)

(assert (=> b!563461 (= e!324738 (not true))))

(declare-fun e!324740 () Bool)

(assert (=> b!563461 e!324740))

(declare-fun res!354505 () Bool)

(assert (=> b!563461 (=> (not res!354505) (not e!324740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35352 (_ BitVec 32)) Bool)

(assert (=> b!563461 (= res!354505 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17605 0))(
  ( (Unit!17606) )
))
(declare-fun lt!257272 () Unit!17605)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17605)

(assert (=> b!563461 (= lt!257272 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563462 () Bool)

(declare-fun res!354504 () Bool)

(assert (=> b!563462 (=> (not res!354504) (not e!324738))))

(assert (=> b!563462 (= res!354504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!354509 () Bool)

(assert (=> start!51540 (=> (not res!354509) (not e!324739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51540 (= res!354509 (validMask!0 mask!3119))))

(assert (=> start!51540 e!324739))

(assert (=> start!51540 true))

(declare-fun array_inv!12834 (array!35352) Bool)

(assert (=> start!51540 (array_inv!12834 a!3118)))

(declare-fun b!563463 () Bool)

(assert (=> b!563463 (= e!324740 (= (seekEntryOrOpen!0 (select (arr!16975 a!3118) j!142) a!3118 mask!3119) (Found!5380 j!142)))))

(declare-fun b!563464 () Bool)

(declare-fun res!354503 () Bool)

(assert (=> b!563464 (=> (not res!354503) (not e!324739))))

(assert (=> b!563464 (= res!354503 (validKeyInArray!0 (select (arr!16975 a!3118) j!142)))))

(assert (= (and start!51540 res!354509) b!563459))

(assert (= (and b!563459 res!354511) b!563464))

(assert (= (and b!563464 res!354503) b!563460))

(assert (= (and b!563460 res!354510) b!563457))

(assert (= (and b!563457 res!354506) b!563458))

(assert (= (and b!563458 res!354507) b!563462))

(assert (= (and b!563462 res!354504) b!563456))

(assert (= (and b!563456 res!354502) b!563455))

(assert (= (and b!563455 res!354508) b!563461))

(assert (= (and b!563461 res!354505) b!563463))

(declare-fun m!541901 () Bool)

(assert (=> b!563464 m!541901))

(assert (=> b!563464 m!541901))

(declare-fun m!541903 () Bool)

(assert (=> b!563464 m!541903))

(declare-fun m!541905 () Bool)

(assert (=> b!563458 m!541905))

(declare-fun m!541907 () Bool)

(assert (=> b!563462 m!541907))

(declare-fun m!541909 () Bool)

(assert (=> start!51540 m!541909))

(declare-fun m!541911 () Bool)

(assert (=> start!51540 m!541911))

(assert (=> b!563463 m!541901))

(assert (=> b!563463 m!541901))

(declare-fun m!541913 () Bool)

(assert (=> b!563463 m!541913))

(declare-fun m!541915 () Bool)

(assert (=> b!563460 m!541915))

(declare-fun m!541917 () Bool)

(assert (=> b!563461 m!541917))

(declare-fun m!541919 () Bool)

(assert (=> b!563461 m!541919))

(assert (=> b!563455 m!541901))

(declare-fun m!541921 () Bool)

(assert (=> b!563455 m!541921))

(assert (=> b!563455 m!541901))

(declare-fun m!541923 () Bool)

(assert (=> b!563455 m!541923))

(declare-fun m!541925 () Bool)

(assert (=> b!563455 m!541925))

(assert (=> b!563455 m!541923))

(declare-fun m!541927 () Bool)

(assert (=> b!563455 m!541927))

(assert (=> b!563455 m!541921))

(assert (=> b!563455 m!541901))

(declare-fun m!541929 () Bool)

(assert (=> b!563455 m!541929))

(declare-fun m!541931 () Bool)

(assert (=> b!563455 m!541931))

(assert (=> b!563455 m!541923))

(assert (=> b!563455 m!541925))

(declare-fun m!541933 () Bool)

(assert (=> b!563457 m!541933))

(declare-fun m!541935 () Bool)

(assert (=> b!563456 m!541935))

(check-sat (not b!563464) (not b!563455) (not b!563458) (not b!563460) (not b!563462) (not b!563463) (not b!563461) (not b!563456) (not b!563457) (not start!51540))
(check-sat)
