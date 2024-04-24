; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50880 () Bool)

(assert start!50880)

(declare-fun b!556489 () Bool)

(declare-fun e!320637 () Bool)

(declare-fun e!320636 () Bool)

(assert (=> b!556489 (= e!320637 e!320636)))

(declare-fun res!348798 () Bool)

(assert (=> b!556489 (=> (not res!348798) (not e!320636))))

(declare-datatypes ((SeekEntryResult!5239 0))(
  ( (MissingZero!5239 (index!23183 (_ BitVec 32))) (Found!5239 (index!23184 (_ BitVec 32))) (Intermediate!5239 (undefined!6051 Bool) (index!23185 (_ BitVec 32)) (x!52228 (_ BitVec 32))) (Undefined!5239) (MissingVacant!5239 (index!23186 (_ BitVec 32))) )
))
(declare-fun lt!252943 () SeekEntryResult!5239)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556489 (= res!348798 (or (= lt!252943 (MissingZero!5239 i!1132)) (= lt!252943 (MissingVacant!5239 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35052 0))(
  ( (array!35053 (arr!16834 (Array (_ BitVec 32) (_ BitVec 64))) (size!17198 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35052)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35052 (_ BitVec 32)) SeekEntryResult!5239)

(assert (=> b!556489 (= lt!252943 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!348801 () Bool)

(assert (=> start!50880 (=> (not res!348801) (not e!320637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50880 (= res!348801 (validMask!0 mask!3119))))

(assert (=> start!50880 e!320637))

(assert (=> start!50880 true))

(declare-fun array_inv!12693 (array!35052) Bool)

(assert (=> start!50880 (array_inv!12693 a!3118)))

(declare-fun b!556490 () Bool)

(declare-fun res!348804 () Bool)

(assert (=> b!556490 (=> (not res!348804) (not e!320637))))

(declare-fun arrayContainsKey!0 (array!35052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556490 (= res!348804 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556491 () Bool)

(declare-fun res!348803 () Bool)

(assert (=> b!556491 (=> (not res!348803) (not e!320636))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35052 (_ BitVec 32)) SeekEntryResult!5239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556491 (= res!348803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16834 a!3118) j!142) mask!3119) (select (arr!16834 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16834 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16834 a!3118) i!1132 k0!1914) j!142) (array!35053 (store (arr!16834 a!3118) i!1132 k0!1914) (size!17198 a!3118)) mask!3119)))))

(declare-fun e!320635 () Bool)

(declare-fun b!556492 () Bool)

(assert (=> b!556492 (= e!320635 (= (seekEntryOrOpen!0 (select (arr!16834 a!3118) j!142) a!3118 mask!3119) (Found!5239 j!142)))))

(declare-fun b!556493 () Bool)

(declare-fun res!348805 () Bool)

(assert (=> b!556493 (=> (not res!348805) (not e!320637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556493 (= res!348805 (validKeyInArray!0 (select (arr!16834 a!3118) j!142)))))

(declare-fun b!556494 () Bool)

(declare-fun res!348799 () Bool)

(assert (=> b!556494 (=> (not res!348799) (not e!320636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35052 (_ BitVec 32)) Bool)

(assert (=> b!556494 (= res!348799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556495 () Bool)

(declare-fun res!348797 () Bool)

(assert (=> b!556495 (=> (not res!348797) (not e!320637))))

(assert (=> b!556495 (= res!348797 (validKeyInArray!0 k0!1914))))

(declare-fun b!556496 () Bool)

(assert (=> b!556496 (= e!320636 (not true))))

(assert (=> b!556496 e!320635))

(declare-fun res!348796 () Bool)

(assert (=> b!556496 (=> (not res!348796) (not e!320635))))

(assert (=> b!556496 (= res!348796 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17323 0))(
  ( (Unit!17324) )
))
(declare-fun lt!252942 () Unit!17323)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17323)

(assert (=> b!556496 (= lt!252942 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556497 () Bool)

(declare-fun res!348802 () Bool)

(assert (=> b!556497 (=> (not res!348802) (not e!320637))))

(assert (=> b!556497 (= res!348802 (and (= (size!17198 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17198 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17198 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556498 () Bool)

(declare-fun res!348800 () Bool)

(assert (=> b!556498 (=> (not res!348800) (not e!320636))))

(declare-datatypes ((List!10821 0))(
  ( (Nil!10818) (Cons!10817 (h!11805 (_ BitVec 64)) (t!17041 List!10821)) )
))
(declare-fun arrayNoDuplicates!0 (array!35052 (_ BitVec 32) List!10821) Bool)

(assert (=> b!556498 (= res!348800 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10818))))

(assert (= (and start!50880 res!348801) b!556497))

(assert (= (and b!556497 res!348802) b!556493))

(assert (= (and b!556493 res!348805) b!556495))

(assert (= (and b!556495 res!348797) b!556490))

(assert (= (and b!556490 res!348804) b!556489))

(assert (= (and b!556489 res!348798) b!556494))

(assert (= (and b!556494 res!348799) b!556498))

(assert (= (and b!556498 res!348800) b!556491))

(assert (= (and b!556491 res!348803) b!556496))

(assert (= (and b!556496 res!348796) b!556492))

(declare-fun m!534587 () Bool)

(assert (=> b!556493 m!534587))

(assert (=> b!556493 m!534587))

(declare-fun m!534589 () Bool)

(assert (=> b!556493 m!534589))

(declare-fun m!534591 () Bool)

(assert (=> b!556498 m!534591))

(declare-fun m!534593 () Bool)

(assert (=> b!556494 m!534593))

(declare-fun m!534595 () Bool)

(assert (=> start!50880 m!534595))

(declare-fun m!534597 () Bool)

(assert (=> start!50880 m!534597))

(declare-fun m!534599 () Bool)

(assert (=> b!556496 m!534599))

(declare-fun m!534601 () Bool)

(assert (=> b!556496 m!534601))

(declare-fun m!534603 () Bool)

(assert (=> b!556490 m!534603))

(declare-fun m!534605 () Bool)

(assert (=> b!556495 m!534605))

(assert (=> b!556491 m!534587))

(declare-fun m!534607 () Bool)

(assert (=> b!556491 m!534607))

(assert (=> b!556491 m!534587))

(declare-fun m!534609 () Bool)

(assert (=> b!556491 m!534609))

(declare-fun m!534611 () Bool)

(assert (=> b!556491 m!534611))

(assert (=> b!556491 m!534609))

(declare-fun m!534613 () Bool)

(assert (=> b!556491 m!534613))

(assert (=> b!556491 m!534607))

(assert (=> b!556491 m!534587))

(declare-fun m!534615 () Bool)

(assert (=> b!556491 m!534615))

(declare-fun m!534617 () Bool)

(assert (=> b!556491 m!534617))

(assert (=> b!556491 m!534609))

(assert (=> b!556491 m!534611))

(declare-fun m!534619 () Bool)

(assert (=> b!556489 m!534619))

(assert (=> b!556492 m!534587))

(assert (=> b!556492 m!534587))

(declare-fun m!534621 () Bool)

(assert (=> b!556492 m!534621))

(check-sat (not b!556495) (not b!556492) (not start!50880) (not b!556490) (not b!556489) (not b!556498) (not b!556491) (not b!556494) (not b!556496) (not b!556493))
(check-sat)
