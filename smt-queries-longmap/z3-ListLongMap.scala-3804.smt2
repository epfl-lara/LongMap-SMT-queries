; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52180 () Bool)

(assert start!52180)

(declare-fun b!569589 () Bool)

(declare-fun res!359612 () Bool)

(declare-fun e!327648 () Bool)

(assert (=> b!569589 (=> (not res!359612) (not e!327648))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569589 (= res!359612 (validKeyInArray!0 k0!1914))))

(declare-fun b!569590 () Bool)

(declare-fun e!327647 () Bool)

(assert (=> b!569590 (= e!327647 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5592 0))(
  ( (MissingZero!5592 (index!24595 (_ BitVec 32))) (Found!5592 (index!24596 (_ BitVec 32))) (Intermediate!5592 (undefined!6404 Bool) (index!24597 (_ BitVec 32)) (x!53467 (_ BitVec 32))) (Undefined!5592) (MissingVacant!5592 (index!24598 (_ BitVec 32))) )
))
(declare-fun lt!259646 () SeekEntryResult!5592)

(declare-fun lt!259647 () SeekEntryResult!5592)

(declare-datatypes ((array!35703 0))(
  ( (array!35704 (arr!17143 (Array (_ BitVec 32) (_ BitVec 64))) (size!17507 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35703)

(get-info :version)

(assert (=> b!569590 (and (= lt!259647 (Found!5592 j!142)) (or (undefined!6404 lt!259646) (not ((_ is Intermediate!5592) lt!259646)) (= (select (arr!17143 a!3118) (index!24597 lt!259646)) (select (arr!17143 a!3118) j!142)) (not (= (select (arr!17143 a!3118) (index!24597 lt!259646)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259647 (MissingZero!5592 (index!24597 lt!259646)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35703 (_ BitVec 32)) SeekEntryResult!5592)

(assert (=> b!569590 (= lt!259647 (seekEntryOrOpen!0 (select (arr!17143 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35703 (_ BitVec 32)) Bool)

(assert (=> b!569590 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17886 0))(
  ( (Unit!17887) )
))
(declare-fun lt!259648 () Unit!17886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17886)

(assert (=> b!569590 (= lt!259648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569591 () Bool)

(declare-fun res!359607 () Bool)

(assert (=> b!569591 (=> (not res!359607) (not e!327648))))

(assert (=> b!569591 (= res!359607 (validKeyInArray!0 (select (arr!17143 a!3118) j!142)))))

(declare-fun b!569592 () Bool)

(declare-fun res!359611 () Bool)

(assert (=> b!569592 (=> (not res!359611) (not e!327648))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569592 (= res!359611 (and (= (size!17507 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17507 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17507 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569593 () Bool)

(declare-fun res!359610 () Bool)

(declare-fun e!327645 () Bool)

(assert (=> b!569593 (=> (not res!359610) (not e!327645))))

(declare-datatypes ((List!11223 0))(
  ( (Nil!11220) (Cons!11219 (h!12240 (_ BitVec 64)) (t!17451 List!11223)) )
))
(declare-fun arrayNoDuplicates!0 (array!35703 (_ BitVec 32) List!11223) Bool)

(assert (=> b!569593 (= res!359610 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11220))))

(declare-fun b!569594 () Bool)

(assert (=> b!569594 (= e!327645 e!327647)))

(declare-fun res!359609 () Bool)

(assert (=> b!569594 (=> (not res!359609) (not e!327647))))

(declare-fun lt!259643 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35703 (_ BitVec 32)) SeekEntryResult!5592)

(assert (=> b!569594 (= res!359609 (= lt!259646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259643 (select (store (arr!17143 a!3118) i!1132 k0!1914) j!142) (array!35704 (store (arr!17143 a!3118) i!1132 k0!1914) (size!17507 a!3118)) mask!3119)))))

(declare-fun lt!259644 () (_ BitVec 32))

(assert (=> b!569594 (= lt!259646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259644 (select (arr!17143 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569594 (= lt!259643 (toIndex!0 (select (store (arr!17143 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569594 (= lt!259644 (toIndex!0 (select (arr!17143 a!3118) j!142) mask!3119))))

(declare-fun res!359614 () Bool)

(assert (=> start!52180 (=> (not res!359614) (not e!327648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52180 (= res!359614 (validMask!0 mask!3119))))

(assert (=> start!52180 e!327648))

(assert (=> start!52180 true))

(declare-fun array_inv!12939 (array!35703) Bool)

(assert (=> start!52180 (array_inv!12939 a!3118)))

(declare-fun b!569595 () Bool)

(declare-fun res!359608 () Bool)

(assert (=> b!569595 (=> (not res!359608) (not e!327645))))

(assert (=> b!569595 (= res!359608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569596 () Bool)

(declare-fun res!359615 () Bool)

(assert (=> b!569596 (=> (not res!359615) (not e!327648))))

(declare-fun arrayContainsKey!0 (array!35703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569596 (= res!359615 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569597 () Bool)

(assert (=> b!569597 (= e!327648 e!327645)))

(declare-fun res!359613 () Bool)

(assert (=> b!569597 (=> (not res!359613) (not e!327645))))

(declare-fun lt!259645 () SeekEntryResult!5592)

(assert (=> b!569597 (= res!359613 (or (= lt!259645 (MissingZero!5592 i!1132)) (= lt!259645 (MissingVacant!5592 i!1132))))))

(assert (=> b!569597 (= lt!259645 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52180 res!359614) b!569592))

(assert (= (and b!569592 res!359611) b!569591))

(assert (= (and b!569591 res!359607) b!569589))

(assert (= (and b!569589 res!359612) b!569596))

(assert (= (and b!569596 res!359615) b!569597))

(assert (= (and b!569597 res!359613) b!569595))

(assert (= (and b!569595 res!359608) b!569593))

(assert (= (and b!569593 res!359610) b!569594))

(assert (= (and b!569594 res!359609) b!569590))

(declare-fun m!548381 () Bool)

(assert (=> b!569597 m!548381))

(declare-fun m!548383 () Bool)

(assert (=> b!569590 m!548383))

(declare-fun m!548385 () Bool)

(assert (=> b!569590 m!548385))

(declare-fun m!548387 () Bool)

(assert (=> b!569590 m!548387))

(declare-fun m!548389 () Bool)

(assert (=> b!569590 m!548389))

(declare-fun m!548391 () Bool)

(assert (=> b!569590 m!548391))

(assert (=> b!569590 m!548387))

(declare-fun m!548393 () Bool)

(assert (=> start!52180 m!548393))

(declare-fun m!548395 () Bool)

(assert (=> start!52180 m!548395))

(declare-fun m!548397 () Bool)

(assert (=> b!569596 m!548397))

(declare-fun m!548399 () Bool)

(assert (=> b!569593 m!548399))

(declare-fun m!548401 () Bool)

(assert (=> b!569595 m!548401))

(assert (=> b!569594 m!548387))

(declare-fun m!548403 () Bool)

(assert (=> b!569594 m!548403))

(assert (=> b!569594 m!548387))

(declare-fun m!548405 () Bool)

(assert (=> b!569594 m!548405))

(assert (=> b!569594 m!548387))

(declare-fun m!548407 () Bool)

(assert (=> b!569594 m!548407))

(declare-fun m!548409 () Bool)

(assert (=> b!569594 m!548409))

(assert (=> b!569594 m!548405))

(declare-fun m!548411 () Bool)

(assert (=> b!569594 m!548411))

(assert (=> b!569594 m!548405))

(declare-fun m!548413 () Bool)

(assert (=> b!569594 m!548413))

(assert (=> b!569591 m!548387))

(assert (=> b!569591 m!548387))

(declare-fun m!548415 () Bool)

(assert (=> b!569591 m!548415))

(declare-fun m!548417 () Bool)

(assert (=> b!569589 m!548417))

(check-sat (not b!569594) (not start!52180) (not b!569589) (not b!569596) (not b!569595) (not b!569591) (not b!569590) (not b!569593) (not b!569597))
(check-sat)
