; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51762 () Bool)

(assert start!51762)

(declare-fun b!565933 () Bool)

(declare-fun res!356806 () Bool)

(declare-fun e!325807 () Bool)

(assert (=> b!565933 (=> (not res!356806) (not e!325807))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35517 0))(
  ( (array!35518 (arr!17056 (Array (_ BitVec 32) (_ BitVec 64))) (size!17420 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35517)

(declare-datatypes ((SeekEntryResult!5461 0))(
  ( (MissingZero!5461 (index!24071 (_ BitVec 32))) (Found!5461 (index!24072 (_ BitVec 32))) (Intermediate!5461 (undefined!6273 Bool) (index!24073 (_ BitVec 32)) (x!53093 (_ BitVec 32))) (Undefined!5461) (MissingVacant!5461 (index!24074 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35517 (_ BitVec 32)) SeekEntryResult!5461)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565933 (= res!356806 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17056 a!3118) j!142) mask!3119) (select (arr!17056 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17056 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17056 a!3118) i!1132 k0!1914) j!142) (array!35518 (store (arr!17056 a!3118) i!1132 k0!1914) (size!17420 a!3118)) mask!3119)))))

(declare-fun b!565934 () Bool)

(assert (=> b!565934 (= e!325807 (not true))))

(declare-fun e!325806 () Bool)

(assert (=> b!565934 e!325806))

(declare-fun res!356800 () Bool)

(assert (=> b!565934 (=> (not res!356800) (not e!325806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35517 (_ BitVec 32)) Bool)

(assert (=> b!565934 (= res!356800 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17695 0))(
  ( (Unit!17696) )
))
(declare-fun lt!258057 () Unit!17695)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17695)

(assert (=> b!565934 (= lt!258057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!356804 () Bool)

(declare-fun e!325809 () Bool)

(assert (=> start!51762 (=> (not res!356804) (not e!325809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51762 (= res!356804 (validMask!0 mask!3119))))

(assert (=> start!51762 e!325809))

(assert (=> start!51762 true))

(declare-fun array_inv!12915 (array!35517) Bool)

(assert (=> start!51762 (array_inv!12915 a!3118)))

(declare-fun b!565935 () Bool)

(declare-fun res!356801 () Bool)

(assert (=> b!565935 (=> (not res!356801) (not e!325809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565935 (= res!356801 (validKeyInArray!0 (select (arr!17056 a!3118) j!142)))))

(declare-fun b!565936 () Bool)

(assert (=> b!565936 (= e!325809 e!325807)))

(declare-fun res!356798 () Bool)

(assert (=> b!565936 (=> (not res!356798) (not e!325807))))

(declare-fun lt!258058 () SeekEntryResult!5461)

(assert (=> b!565936 (= res!356798 (or (= lt!258058 (MissingZero!5461 i!1132)) (= lt!258058 (MissingVacant!5461 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35517 (_ BitVec 32)) SeekEntryResult!5461)

(assert (=> b!565936 (= lt!258058 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565937 () Bool)

(declare-fun res!356802 () Bool)

(assert (=> b!565937 (=> (not res!356802) (not e!325809))))

(declare-fun arrayContainsKey!0 (array!35517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565937 (= res!356802 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565938 () Bool)

(declare-fun res!356799 () Bool)

(assert (=> b!565938 (=> (not res!356799) (not e!325807))))

(assert (=> b!565938 (= res!356799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565939 () Bool)

(declare-fun res!356797 () Bool)

(assert (=> b!565939 (=> (not res!356797) (not e!325809))))

(assert (=> b!565939 (= res!356797 (validKeyInArray!0 k0!1914))))

(declare-fun b!565940 () Bool)

(assert (=> b!565940 (= e!325806 (= (seekEntryOrOpen!0 (select (arr!17056 a!3118) j!142) a!3118 mask!3119) (Found!5461 j!142)))))

(declare-fun b!565941 () Bool)

(declare-fun res!356803 () Bool)

(assert (=> b!565941 (=> (not res!356803) (not e!325807))))

(declare-datatypes ((List!11043 0))(
  ( (Nil!11040) (Cons!11039 (h!12048 (_ BitVec 64)) (t!17263 List!11043)) )
))
(declare-fun arrayNoDuplicates!0 (array!35517 (_ BitVec 32) List!11043) Bool)

(assert (=> b!565941 (= res!356803 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11040))))

(declare-fun b!565942 () Bool)

(declare-fun res!356805 () Bool)

(assert (=> b!565942 (=> (not res!356805) (not e!325809))))

(assert (=> b!565942 (= res!356805 (and (= (size!17420 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17420 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17420 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51762 res!356804) b!565942))

(assert (= (and b!565942 res!356805) b!565935))

(assert (= (and b!565935 res!356801) b!565939))

(assert (= (and b!565939 res!356797) b!565937))

(assert (= (and b!565937 res!356802) b!565936))

(assert (= (and b!565936 res!356798) b!565938))

(assert (= (and b!565938 res!356799) b!565941))

(assert (= (and b!565941 res!356803) b!565933))

(assert (= (and b!565933 res!356806) b!565934))

(assert (= (and b!565934 res!356800) b!565940))

(declare-fun m!544589 () Bool)

(assert (=> b!565937 m!544589))

(declare-fun m!544591 () Bool)

(assert (=> start!51762 m!544591))

(declare-fun m!544593 () Bool)

(assert (=> start!51762 m!544593))

(declare-fun m!544595 () Bool)

(assert (=> b!565934 m!544595))

(declare-fun m!544597 () Bool)

(assert (=> b!565934 m!544597))

(declare-fun m!544599 () Bool)

(assert (=> b!565939 m!544599))

(declare-fun m!544601 () Bool)

(assert (=> b!565935 m!544601))

(assert (=> b!565935 m!544601))

(declare-fun m!544603 () Bool)

(assert (=> b!565935 m!544603))

(assert (=> b!565933 m!544601))

(declare-fun m!544605 () Bool)

(assert (=> b!565933 m!544605))

(assert (=> b!565933 m!544601))

(declare-fun m!544607 () Bool)

(assert (=> b!565933 m!544607))

(declare-fun m!544609 () Bool)

(assert (=> b!565933 m!544609))

(assert (=> b!565933 m!544607))

(declare-fun m!544611 () Bool)

(assert (=> b!565933 m!544611))

(assert (=> b!565933 m!544605))

(assert (=> b!565933 m!544601))

(declare-fun m!544613 () Bool)

(assert (=> b!565933 m!544613))

(declare-fun m!544615 () Bool)

(assert (=> b!565933 m!544615))

(assert (=> b!565933 m!544607))

(assert (=> b!565933 m!544609))

(declare-fun m!544617 () Bool)

(assert (=> b!565941 m!544617))

(assert (=> b!565940 m!544601))

(assert (=> b!565940 m!544601))

(declare-fun m!544619 () Bool)

(assert (=> b!565940 m!544619))

(declare-fun m!544621 () Bool)

(assert (=> b!565938 m!544621))

(declare-fun m!544623 () Bool)

(assert (=> b!565936 m!544623))

(check-sat (not b!565938) (not b!565934) (not b!565936) (not b!565941) (not b!565933) (not start!51762) (not b!565939) (not b!565935) (not b!565940) (not b!565937))
(check-sat)
