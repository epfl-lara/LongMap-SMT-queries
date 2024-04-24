; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50036 () Bool)

(assert start!50036)

(declare-fun b!548301 () Bool)

(declare-fun res!341606 () Bool)

(declare-fun e!316812 () Bool)

(assert (=> b!548301 (=> (not res!341606) (not e!316812))))

(declare-datatypes ((array!34564 0))(
  ( (array!34565 (arr!16600 (Array (_ BitVec 32) (_ BitVec 64))) (size!16964 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34564)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34564 (_ BitVec 32)) Bool)

(assert (=> b!548301 (= res!341606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548302 () Bool)

(declare-fun res!341604 () Bool)

(declare-fun e!316811 () Bool)

(assert (=> b!548302 (=> (not res!341604) (not e!316811))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548302 (= res!341604 (and (= (size!16964 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16964 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16964 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548303 () Bool)

(declare-fun res!341611 () Bool)

(assert (=> b!548303 (=> (not res!341611) (not e!316812))))

(declare-datatypes ((List!10587 0))(
  ( (Nil!10584) (Cons!10583 (h!11553 (_ BitVec 64)) (t!16807 List!10587)) )
))
(declare-fun arrayNoDuplicates!0 (array!34564 (_ BitVec 32) List!10587) Bool)

(assert (=> b!548303 (= res!341611 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10584))))

(declare-fun b!548304 () Bool)

(declare-fun res!341609 () Bool)

(assert (=> b!548304 (=> (not res!341609) (not e!316811))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548304 (= res!341609 (validKeyInArray!0 k0!1914))))

(declare-fun b!548305 () Bool)

(declare-fun res!341605 () Bool)

(assert (=> b!548305 (=> (not res!341605) (not e!316811))))

(assert (=> b!548305 (= res!341605 (validKeyInArray!0 (select (arr!16600 a!3118) j!142)))))

(declare-fun b!548306 () Bool)

(assert (=> b!548306 (= e!316811 e!316812)))

(declare-fun res!341610 () Bool)

(assert (=> b!548306 (=> (not res!341610) (not e!316812))))

(declare-datatypes ((SeekEntryResult!5005 0))(
  ( (MissingZero!5005 (index!22247 (_ BitVec 32))) (Found!5005 (index!22248 (_ BitVec 32))) (Intermediate!5005 (undefined!5817 Bool) (index!22249 (_ BitVec 32)) (x!51340 (_ BitVec 32))) (Undefined!5005) (MissingVacant!5005 (index!22250 (_ BitVec 32))) )
))
(declare-fun lt!249834 () SeekEntryResult!5005)

(assert (=> b!548306 (= res!341610 (or (= lt!249834 (MissingZero!5005 i!1132)) (= lt!249834 (MissingVacant!5005 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34564 (_ BitVec 32)) SeekEntryResult!5005)

(assert (=> b!548306 (= lt!249834 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548307 () Bool)

(assert (=> b!548307 (= e!316812 false)))

(declare-fun lt!249835 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548307 (= lt!249835 (toIndex!0 (select (arr!16600 a!3118) j!142) mask!3119))))

(declare-fun res!341607 () Bool)

(assert (=> start!50036 (=> (not res!341607) (not e!316811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50036 (= res!341607 (validMask!0 mask!3119))))

(assert (=> start!50036 e!316811))

(assert (=> start!50036 true))

(declare-fun array_inv!12459 (array!34564) Bool)

(assert (=> start!50036 (array_inv!12459 a!3118)))

(declare-fun b!548308 () Bool)

(declare-fun res!341608 () Bool)

(assert (=> b!548308 (=> (not res!341608) (not e!316811))))

(declare-fun arrayContainsKey!0 (array!34564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548308 (= res!341608 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50036 res!341607) b!548302))

(assert (= (and b!548302 res!341604) b!548305))

(assert (= (and b!548305 res!341605) b!548304))

(assert (= (and b!548304 res!341609) b!548308))

(assert (= (and b!548308 res!341608) b!548306))

(assert (= (and b!548306 res!341610) b!548301))

(assert (= (and b!548301 res!341606) b!548303))

(assert (= (and b!548303 res!341611) b!548307))

(declare-fun m!525559 () Bool)

(assert (=> b!548304 m!525559))

(declare-fun m!525561 () Bool)

(assert (=> b!548303 m!525561))

(declare-fun m!525563 () Bool)

(assert (=> b!548308 m!525563))

(declare-fun m!525565 () Bool)

(assert (=> b!548307 m!525565))

(assert (=> b!548307 m!525565))

(declare-fun m!525567 () Bool)

(assert (=> b!548307 m!525567))

(declare-fun m!525569 () Bool)

(assert (=> b!548301 m!525569))

(declare-fun m!525571 () Bool)

(assert (=> start!50036 m!525571))

(declare-fun m!525573 () Bool)

(assert (=> start!50036 m!525573))

(declare-fun m!525575 () Bool)

(assert (=> b!548306 m!525575))

(assert (=> b!548305 m!525565))

(assert (=> b!548305 m!525565))

(declare-fun m!525577 () Bool)

(assert (=> b!548305 m!525577))

(check-sat (not b!548305) (not b!548303) (not b!548306) (not start!50036) (not b!548301) (not b!548308) (not b!548307) (not b!548304))
(check-sat)
