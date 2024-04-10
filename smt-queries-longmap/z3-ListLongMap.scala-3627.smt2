; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50050 () Bool)

(assert start!50050)

(declare-fun b!548422 () Bool)

(declare-fun res!341750 () Bool)

(declare-fun e!316853 () Bool)

(assert (=> b!548422 (=> (not res!341750) (not e!316853))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34587 0))(
  ( (array!34588 (arr!16612 (Array (_ BitVec 32) (_ BitVec 64))) (size!16976 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34587)

(assert (=> b!548422 (= res!341750 (and (= (size!16976 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16976 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16976 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548423 () Bool)

(declare-fun res!341748 () Bool)

(declare-fun e!316854 () Bool)

(assert (=> b!548423 (=> (not res!341748) (not e!316854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34587 (_ BitVec 32)) Bool)

(assert (=> b!548423 (= res!341748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548424 () Bool)

(declare-fun res!341749 () Bool)

(assert (=> b!548424 (=> (not res!341749) (not e!316853))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548424 (= res!341749 (validKeyInArray!0 k0!1914))))

(declare-fun b!548425 () Bool)

(assert (=> b!548425 (= e!316853 e!316854)))

(declare-fun res!341745 () Bool)

(assert (=> b!548425 (=> (not res!341745) (not e!316854))))

(declare-datatypes ((SeekEntryResult!5061 0))(
  ( (MissingZero!5061 (index!22471 (_ BitVec 32))) (Found!5061 (index!22472 (_ BitVec 32))) (Intermediate!5061 (undefined!5873 Bool) (index!22473 (_ BitVec 32)) (x!51412 (_ BitVec 32))) (Undefined!5061) (MissingVacant!5061 (index!22474 (_ BitVec 32))) )
))
(declare-fun lt!249838 () SeekEntryResult!5061)

(assert (=> b!548425 (= res!341745 (or (= lt!249838 (MissingZero!5061 i!1132)) (= lt!249838 (MissingVacant!5061 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34587 (_ BitVec 32)) SeekEntryResult!5061)

(assert (=> b!548425 (= lt!249838 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548426 () Bool)

(declare-fun res!341746 () Bool)

(assert (=> b!548426 (=> (not res!341746) (not e!316854))))

(declare-datatypes ((List!10692 0))(
  ( (Nil!10689) (Cons!10688 (h!11658 (_ BitVec 64)) (t!16920 List!10692)) )
))
(declare-fun arrayNoDuplicates!0 (array!34587 (_ BitVec 32) List!10692) Bool)

(assert (=> b!548426 (= res!341746 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10689))))

(declare-fun b!548427 () Bool)

(assert (=> b!548427 (= e!316854 false)))

(declare-fun lt!249837 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548427 (= lt!249837 (toIndex!0 (select (arr!16612 a!3118) j!142) mask!3119))))

(declare-fun b!548428 () Bool)

(declare-fun res!341743 () Bool)

(assert (=> b!548428 (=> (not res!341743) (not e!316853))))

(assert (=> b!548428 (= res!341743 (validKeyInArray!0 (select (arr!16612 a!3118) j!142)))))

(declare-fun b!548429 () Bool)

(declare-fun res!341747 () Bool)

(assert (=> b!548429 (=> (not res!341747) (not e!316853))))

(declare-fun arrayContainsKey!0 (array!34587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548429 (= res!341747 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!341744 () Bool)

(assert (=> start!50050 (=> (not res!341744) (not e!316853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50050 (= res!341744 (validMask!0 mask!3119))))

(assert (=> start!50050 e!316853))

(assert (=> start!50050 true))

(declare-fun array_inv!12408 (array!34587) Bool)

(assert (=> start!50050 (array_inv!12408 a!3118)))

(assert (= (and start!50050 res!341744) b!548422))

(assert (= (and b!548422 res!341750) b!548428))

(assert (= (and b!548428 res!341743) b!548424))

(assert (= (and b!548424 res!341749) b!548429))

(assert (= (and b!548429 res!341747) b!548425))

(assert (= (and b!548425 res!341745) b!548423))

(assert (= (and b!548423 res!341748) b!548426))

(assert (= (and b!548426 res!341746) b!548427))

(declare-fun m!525443 () Bool)

(assert (=> b!548423 m!525443))

(declare-fun m!525445 () Bool)

(assert (=> start!50050 m!525445))

(declare-fun m!525447 () Bool)

(assert (=> start!50050 m!525447))

(declare-fun m!525449 () Bool)

(assert (=> b!548426 m!525449))

(declare-fun m!525451 () Bool)

(assert (=> b!548424 m!525451))

(declare-fun m!525453 () Bool)

(assert (=> b!548428 m!525453))

(assert (=> b!548428 m!525453))

(declare-fun m!525455 () Bool)

(assert (=> b!548428 m!525455))

(declare-fun m!525457 () Bool)

(assert (=> b!548425 m!525457))

(assert (=> b!548427 m!525453))

(assert (=> b!548427 m!525453))

(declare-fun m!525459 () Bool)

(assert (=> b!548427 m!525459))

(declare-fun m!525461 () Bool)

(assert (=> b!548429 m!525461))

(check-sat (not start!50050) (not b!548427) (not b!548423) (not b!548425) (not b!548426) (not b!548429) (not b!548428) (not b!548424))
(check-sat)
