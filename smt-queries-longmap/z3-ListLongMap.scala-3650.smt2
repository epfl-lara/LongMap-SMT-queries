; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50324 () Bool)

(assert start!50324)

(declare-fun b!550501 () Bool)

(declare-fun res!343610 () Bool)

(declare-fun e!317741 () Bool)

(assert (=> b!550501 (=> (not res!343610) (not e!317741))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550501 (= res!343610 (validKeyInArray!0 k0!1914))))

(declare-fun res!343605 () Bool)

(assert (=> start!50324 (=> (not res!343605) (not e!317741))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50324 (= res!343605 (validMask!0 mask!3119))))

(assert (=> start!50324 e!317741))

(assert (=> start!50324 true))

(declare-datatypes ((array!34729 0))(
  ( (array!34730 (arr!16679 (Array (_ BitVec 32) (_ BitVec 64))) (size!17044 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34729)

(declare-fun array_inv!12562 (array!34729) Bool)

(assert (=> start!50324 (array_inv!12562 a!3118)))

(declare-fun b!550502 () Bool)

(declare-fun res!343613 () Bool)

(assert (=> b!550502 (=> (not res!343613) (not e!317741))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550502 (= res!343613 (and (= (size!17044 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17044 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17044 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550503 () Bool)

(declare-fun res!343608 () Bool)

(declare-fun e!317740 () Bool)

(assert (=> b!550503 (=> (not res!343608) (not e!317740))))

(declare-datatypes ((SeekEntryResult!5125 0))(
  ( (MissingZero!5125 (index!22727 (_ BitVec 32))) (Found!5125 (index!22728 (_ BitVec 32))) (Intermediate!5125 (undefined!5937 Bool) (index!22729 (_ BitVec 32)) (x!51664 (_ BitVec 32))) (Undefined!5125) (MissingVacant!5125 (index!22730 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34729 (_ BitVec 32)) SeekEntryResult!5125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550503 (= res!343608 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16679 a!3118) j!142) mask!3119) (select (arr!16679 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16679 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16679 a!3118) i!1132 k0!1914) j!142) (array!34730 (store (arr!16679 a!3118) i!1132 k0!1914) (size!17044 a!3118)) mask!3119)))))

(declare-fun b!550504 () Bool)

(assert (=> b!550504 (= e!317740 (not true))))

(declare-fun e!317739 () Bool)

(assert (=> b!550504 e!317739))

(declare-fun res!343611 () Bool)

(assert (=> b!550504 (=> (not res!343611) (not e!317739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34729 (_ BitVec 32)) Bool)

(assert (=> b!550504 (= res!343611 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17010 0))(
  ( (Unit!17011) )
))
(declare-fun lt!250384 () Unit!17010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17010)

(assert (=> b!550504 (= lt!250384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550505 () Bool)

(assert (=> b!550505 (= e!317741 e!317740)))

(declare-fun res!343609 () Bool)

(assert (=> b!550505 (=> (not res!343609) (not e!317740))))

(declare-fun lt!250383 () SeekEntryResult!5125)

(assert (=> b!550505 (= res!343609 (or (= lt!250383 (MissingZero!5125 i!1132)) (= lt!250383 (MissingVacant!5125 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34729 (_ BitVec 32)) SeekEntryResult!5125)

(assert (=> b!550505 (= lt!250383 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550506 () Bool)

(declare-fun res!343607 () Bool)

(assert (=> b!550506 (=> (not res!343607) (not e!317741))))

(declare-fun arrayContainsKey!0 (array!34729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550506 (= res!343607 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550507 () Bool)

(declare-fun res!343606 () Bool)

(assert (=> b!550507 (=> (not res!343606) (not e!317741))))

(assert (=> b!550507 (= res!343606 (validKeyInArray!0 (select (arr!16679 a!3118) j!142)))))

(declare-fun b!550508 () Bool)

(assert (=> b!550508 (= e!317739 (= (seekEntryOrOpen!0 (select (arr!16679 a!3118) j!142) a!3118 mask!3119) (Found!5125 j!142)))))

(declare-fun b!550509 () Bool)

(declare-fun res!343604 () Bool)

(assert (=> b!550509 (=> (not res!343604) (not e!317740))))

(assert (=> b!550509 (= res!343604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550510 () Bool)

(declare-fun res!343612 () Bool)

(assert (=> b!550510 (=> (not res!343612) (not e!317740))))

(declare-datatypes ((List!10798 0))(
  ( (Nil!10795) (Cons!10794 (h!11770 (_ BitVec 64)) (t!17017 List!10798)) )
))
(declare-fun arrayNoDuplicates!0 (array!34729 (_ BitVec 32) List!10798) Bool)

(assert (=> b!550510 (= res!343612 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10795))))

(assert (= (and start!50324 res!343605) b!550502))

(assert (= (and b!550502 res!343613) b!550507))

(assert (= (and b!550507 res!343606) b!550501))

(assert (= (and b!550501 res!343610) b!550506))

(assert (= (and b!550506 res!343607) b!550505))

(assert (= (and b!550505 res!343609) b!550509))

(assert (= (and b!550509 res!343604) b!550510))

(assert (= (and b!550510 res!343612) b!550503))

(assert (= (and b!550503 res!343608) b!550504))

(assert (= (and b!550504 res!343611) b!550508))

(declare-fun m!526997 () Bool)

(assert (=> b!550508 m!526997))

(assert (=> b!550508 m!526997))

(declare-fun m!526999 () Bool)

(assert (=> b!550508 m!526999))

(declare-fun m!527001 () Bool)

(assert (=> b!550509 m!527001))

(declare-fun m!527003 () Bool)

(assert (=> b!550501 m!527003))

(declare-fun m!527005 () Bool)

(assert (=> b!550504 m!527005))

(declare-fun m!527007 () Bool)

(assert (=> b!550504 m!527007))

(declare-fun m!527009 () Bool)

(assert (=> b!550510 m!527009))

(assert (=> b!550503 m!526997))

(declare-fun m!527011 () Bool)

(assert (=> b!550503 m!527011))

(assert (=> b!550503 m!526997))

(declare-fun m!527013 () Bool)

(assert (=> b!550503 m!527013))

(declare-fun m!527015 () Bool)

(assert (=> b!550503 m!527015))

(assert (=> b!550503 m!527013))

(declare-fun m!527017 () Bool)

(assert (=> b!550503 m!527017))

(assert (=> b!550503 m!527011))

(assert (=> b!550503 m!526997))

(declare-fun m!527019 () Bool)

(assert (=> b!550503 m!527019))

(declare-fun m!527021 () Bool)

(assert (=> b!550503 m!527021))

(assert (=> b!550503 m!527013))

(assert (=> b!550503 m!527015))

(declare-fun m!527023 () Bool)

(assert (=> b!550506 m!527023))

(assert (=> b!550507 m!526997))

(assert (=> b!550507 m!526997))

(declare-fun m!527025 () Bool)

(assert (=> b!550507 m!527025))

(declare-fun m!527027 () Bool)

(assert (=> b!550505 m!527027))

(declare-fun m!527029 () Bool)

(assert (=> start!50324 m!527029))

(declare-fun m!527031 () Bool)

(assert (=> start!50324 m!527031))

(check-sat (not b!550509) (not b!550510) (not b!550506) (not b!550501) (not b!550508) (not b!550504) (not b!550507) (not b!550503) (not start!50324) (not b!550505))
(check-sat)
