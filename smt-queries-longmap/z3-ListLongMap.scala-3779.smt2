; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51716 () Bool)

(assert start!51716)

(declare-fun b!565642 () Bool)

(declare-fun e!325577 () Bool)

(declare-fun e!325576 () Bool)

(assert (=> b!565642 (= e!325577 e!325576)))

(declare-fun res!356762 () Bool)

(assert (=> b!565642 (=> (not res!356762) (not e!325576))))

(declare-datatypes ((SeekEntryResult!5512 0))(
  ( (MissingZero!5512 (index!24275 (_ BitVec 32))) (Found!5512 (index!24276 (_ BitVec 32))) (Intermediate!5512 (undefined!6324 Bool) (index!24277 (_ BitVec 32)) (x!53152 (_ BitVec 32))) (Undefined!5512) (MissingVacant!5512 (index!24278 (_ BitVec 32))) )
))
(declare-fun lt!257749 () SeekEntryResult!5512)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565642 (= res!356762 (or (= lt!257749 (MissingZero!5512 i!1132)) (= lt!257749 (MissingVacant!5512 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35533 0))(
  ( (array!35534 (arr!17066 (Array (_ BitVec 32) (_ BitVec 64))) (size!17431 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35533)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35533 (_ BitVec 32)) SeekEntryResult!5512)

(assert (=> b!565642 (= lt!257749 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!565643 () Bool)

(declare-fun e!325578 () Bool)

(assert (=> b!565643 (= e!325578 (= (seekEntryOrOpen!0 (select (arr!17066 a!3118) j!142) a!3118 mask!3119) (Found!5512 j!142)))))

(declare-fun b!565644 () Bool)

(declare-fun res!356757 () Bool)

(assert (=> b!565644 (=> (not res!356757) (not e!325576))))

(declare-datatypes ((List!11185 0))(
  ( (Nil!11182) (Cons!11181 (h!12187 (_ BitVec 64)) (t!17404 List!11185)) )
))
(declare-fun arrayNoDuplicates!0 (array!35533 (_ BitVec 32) List!11185) Bool)

(assert (=> b!565644 (= res!356757 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11182))))

(declare-fun res!356761 () Bool)

(assert (=> start!51716 (=> (not res!356761) (not e!325577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51716 (= res!356761 (validMask!0 mask!3119))))

(assert (=> start!51716 e!325577))

(assert (=> start!51716 true))

(declare-fun array_inv!12949 (array!35533) Bool)

(assert (=> start!51716 (array_inv!12949 a!3118)))

(declare-fun b!565645 () Bool)

(declare-fun res!356756 () Bool)

(assert (=> b!565645 (=> (not res!356756) (not e!325576))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35533 (_ BitVec 32)) SeekEntryResult!5512)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565645 (= res!356756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17066 a!3118) j!142) mask!3119) (select (arr!17066 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17066 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17066 a!3118) i!1132 k0!1914) j!142) (array!35534 (store (arr!17066 a!3118) i!1132 k0!1914) (size!17431 a!3118)) mask!3119)))))

(declare-fun b!565646 () Bool)

(declare-fun res!356760 () Bool)

(assert (=> b!565646 (=> (not res!356760) (not e!325577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565646 (= res!356760 (validKeyInArray!0 k0!1914))))

(declare-fun b!565647 () Bool)

(assert (=> b!565647 (= e!325576 (not true))))

(assert (=> b!565647 e!325578))

(declare-fun res!356758 () Bool)

(assert (=> b!565647 (=> (not res!356758) (not e!325578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35533 (_ BitVec 32)) Bool)

(assert (=> b!565647 (= res!356758 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17712 0))(
  ( (Unit!17713) )
))
(declare-fun lt!257748 () Unit!17712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17712)

(assert (=> b!565647 (= lt!257748 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565648 () Bool)

(declare-fun res!356755 () Bool)

(assert (=> b!565648 (=> (not res!356755) (not e!325577))))

(assert (=> b!565648 (= res!356755 (validKeyInArray!0 (select (arr!17066 a!3118) j!142)))))

(declare-fun b!565649 () Bool)

(declare-fun res!356754 () Bool)

(assert (=> b!565649 (=> (not res!356754) (not e!325577))))

(declare-fun arrayContainsKey!0 (array!35533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565649 (= res!356754 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565650 () Bool)

(declare-fun res!356753 () Bool)

(assert (=> b!565650 (=> (not res!356753) (not e!325576))))

(assert (=> b!565650 (= res!356753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565651 () Bool)

(declare-fun res!356759 () Bool)

(assert (=> b!565651 (=> (not res!356759) (not e!325577))))

(assert (=> b!565651 (= res!356759 (and (= (size!17431 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17431 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17431 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51716 res!356761) b!565651))

(assert (= (and b!565651 res!356759) b!565648))

(assert (= (and b!565648 res!356755) b!565646))

(assert (= (and b!565646 res!356760) b!565649))

(assert (= (and b!565649 res!356754) b!565642))

(assert (= (and b!565642 res!356762) b!565650))

(assert (= (and b!565650 res!356753) b!565644))

(assert (= (and b!565644 res!356757) b!565645))

(assert (= (and b!565645 res!356756) b!565647))

(assert (= (and b!565647 res!356758) b!565643))

(declare-fun m!543695 () Bool)

(assert (=> b!565643 m!543695))

(assert (=> b!565643 m!543695))

(declare-fun m!543697 () Bool)

(assert (=> b!565643 m!543697))

(declare-fun m!543699 () Bool)

(assert (=> b!565649 m!543699))

(assert (=> b!565645 m!543695))

(declare-fun m!543701 () Bool)

(assert (=> b!565645 m!543701))

(assert (=> b!565645 m!543695))

(declare-fun m!543703 () Bool)

(assert (=> b!565645 m!543703))

(declare-fun m!543705 () Bool)

(assert (=> b!565645 m!543705))

(assert (=> b!565645 m!543703))

(declare-fun m!543707 () Bool)

(assert (=> b!565645 m!543707))

(assert (=> b!565645 m!543701))

(assert (=> b!565645 m!543695))

(declare-fun m!543709 () Bool)

(assert (=> b!565645 m!543709))

(declare-fun m!543711 () Bool)

(assert (=> b!565645 m!543711))

(assert (=> b!565645 m!543703))

(assert (=> b!565645 m!543705))

(declare-fun m!543713 () Bool)

(assert (=> b!565650 m!543713))

(declare-fun m!543715 () Bool)

(assert (=> start!51716 m!543715))

(declare-fun m!543717 () Bool)

(assert (=> start!51716 m!543717))

(declare-fun m!543719 () Bool)

(assert (=> b!565644 m!543719))

(declare-fun m!543721 () Bool)

(assert (=> b!565646 m!543721))

(declare-fun m!543723 () Bool)

(assert (=> b!565642 m!543723))

(declare-fun m!543725 () Bool)

(assert (=> b!565647 m!543725))

(declare-fun m!543727 () Bool)

(assert (=> b!565647 m!543727))

(assert (=> b!565648 m!543695))

(assert (=> b!565648 m!543695))

(declare-fun m!543729 () Bool)

(assert (=> b!565648 m!543729))

(check-sat (not b!565648) (not start!51716) (not b!565645) (not b!565646) (not b!565644) (not b!565649) (not b!565647) (not b!565642) (not b!565650) (not b!565643))
(check-sat)
