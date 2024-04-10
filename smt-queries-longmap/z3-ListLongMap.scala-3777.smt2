; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51718 () Bool)

(assert start!51718)

(declare-fun b!565763 () Bool)

(declare-fun res!356741 () Bool)

(declare-fun e!325690 () Bool)

(assert (=> b!565763 (=> (not res!356741) (not e!325690))))

(declare-datatypes ((array!35526 0))(
  ( (array!35527 (arr!17062 (Array (_ BitVec 32) (_ BitVec 64))) (size!17426 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35526)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35526 (_ BitVec 32)) Bool)

(assert (=> b!565763 (= res!356741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565764 () Bool)

(declare-fun res!356732 () Bool)

(assert (=> b!565764 (=> (not res!356732) (not e!325690))))

(declare-datatypes ((List!11142 0))(
  ( (Nil!11139) (Cons!11138 (h!12144 (_ BitVec 64)) (t!17370 List!11142)) )
))
(declare-fun arrayNoDuplicates!0 (array!35526 (_ BitVec 32) List!11142) Bool)

(assert (=> b!565764 (= res!356732 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11139))))

(declare-fun b!565765 () Bool)

(assert (=> b!565765 (= e!325690 (not true))))

(declare-fun e!325692 () Bool)

(assert (=> b!565765 e!325692))

(declare-fun res!356737 () Bool)

(assert (=> b!565765 (=> (not res!356737) (not e!325692))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565765 (= res!356737 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17724 0))(
  ( (Unit!17725) )
))
(declare-fun lt!257953 () Unit!17724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17724)

(assert (=> b!565765 (= lt!257953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565766 () Bool)

(declare-fun res!356739 () Bool)

(declare-fun e!325691 () Bool)

(assert (=> b!565766 (=> (not res!356739) (not e!325691))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565766 (= res!356739 (and (= (size!17426 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17426 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17426 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565767 () Bool)

(declare-fun res!356735 () Bool)

(assert (=> b!565767 (=> (not res!356735) (not e!325691))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565767 (= res!356735 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565768 () Bool)

(declare-datatypes ((SeekEntryResult!5511 0))(
  ( (MissingZero!5511 (index!24271 (_ BitVec 32))) (Found!5511 (index!24272 (_ BitVec 32))) (Intermediate!5511 (undefined!6323 Bool) (index!24273 (_ BitVec 32)) (x!53140 (_ BitVec 32))) (Undefined!5511) (MissingVacant!5511 (index!24274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35526 (_ BitVec 32)) SeekEntryResult!5511)

(assert (=> b!565768 (= e!325692 (= (seekEntryOrOpen!0 (select (arr!17062 a!3118) j!142) a!3118 mask!3119) (Found!5511 j!142)))))

(declare-fun b!565769 () Bool)

(declare-fun res!356740 () Bool)

(assert (=> b!565769 (=> (not res!356740) (not e!325691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565769 (= res!356740 (validKeyInArray!0 (select (arr!17062 a!3118) j!142)))))

(declare-fun b!565770 () Bool)

(declare-fun res!356734 () Bool)

(assert (=> b!565770 (=> (not res!356734) (not e!325690))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35526 (_ BitVec 32)) SeekEntryResult!5511)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565770 (= res!356734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17062 a!3118) j!142) mask!3119) (select (arr!17062 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17062 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17062 a!3118) i!1132 k0!1914) j!142) (array!35527 (store (arr!17062 a!3118) i!1132 k0!1914) (size!17426 a!3118)) mask!3119)))))

(declare-fun b!565771 () Bool)

(assert (=> b!565771 (= e!325691 e!325690)))

(declare-fun res!356736 () Bool)

(assert (=> b!565771 (=> (not res!356736) (not e!325690))))

(declare-fun lt!257952 () SeekEntryResult!5511)

(assert (=> b!565771 (= res!356736 (or (= lt!257952 (MissingZero!5511 i!1132)) (= lt!257952 (MissingVacant!5511 i!1132))))))

(assert (=> b!565771 (= lt!257952 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!356738 () Bool)

(assert (=> start!51718 (=> (not res!356738) (not e!325691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51718 (= res!356738 (validMask!0 mask!3119))))

(assert (=> start!51718 e!325691))

(assert (=> start!51718 true))

(declare-fun array_inv!12858 (array!35526) Bool)

(assert (=> start!51718 (array_inv!12858 a!3118)))

(declare-fun b!565772 () Bool)

(declare-fun res!356733 () Bool)

(assert (=> b!565772 (=> (not res!356733) (not e!325691))))

(assert (=> b!565772 (= res!356733 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51718 res!356738) b!565766))

(assert (= (and b!565766 res!356739) b!565769))

(assert (= (and b!565769 res!356740) b!565772))

(assert (= (and b!565772 res!356733) b!565767))

(assert (= (and b!565767 res!356735) b!565771))

(assert (= (and b!565771 res!356736) b!565763))

(assert (= (and b!565763 res!356741) b!565764))

(assert (= (and b!565764 res!356732) b!565770))

(assert (= (and b!565770 res!356734) b!565765))

(assert (= (and b!565765 res!356737) b!565768))

(declare-fun m!544287 () Bool)

(assert (=> b!565772 m!544287))

(declare-fun m!544289 () Bool)

(assert (=> b!565771 m!544289))

(declare-fun m!544291 () Bool)

(assert (=> start!51718 m!544291))

(declare-fun m!544293 () Bool)

(assert (=> start!51718 m!544293))

(declare-fun m!544295 () Bool)

(assert (=> b!565765 m!544295))

(declare-fun m!544297 () Bool)

(assert (=> b!565765 m!544297))

(declare-fun m!544299 () Bool)

(assert (=> b!565763 m!544299))

(declare-fun m!544301 () Bool)

(assert (=> b!565767 m!544301))

(declare-fun m!544303 () Bool)

(assert (=> b!565768 m!544303))

(assert (=> b!565768 m!544303))

(declare-fun m!544305 () Bool)

(assert (=> b!565768 m!544305))

(assert (=> b!565770 m!544303))

(declare-fun m!544307 () Bool)

(assert (=> b!565770 m!544307))

(assert (=> b!565770 m!544303))

(declare-fun m!544309 () Bool)

(assert (=> b!565770 m!544309))

(declare-fun m!544311 () Bool)

(assert (=> b!565770 m!544311))

(assert (=> b!565770 m!544309))

(declare-fun m!544313 () Bool)

(assert (=> b!565770 m!544313))

(assert (=> b!565770 m!544307))

(assert (=> b!565770 m!544303))

(declare-fun m!544315 () Bool)

(assert (=> b!565770 m!544315))

(declare-fun m!544317 () Bool)

(assert (=> b!565770 m!544317))

(assert (=> b!565770 m!544309))

(assert (=> b!565770 m!544311))

(declare-fun m!544319 () Bool)

(assert (=> b!565764 m!544319))

(assert (=> b!565769 m!544303))

(assert (=> b!565769 m!544303))

(declare-fun m!544321 () Bool)

(assert (=> b!565769 m!544321))

(check-sat (not b!565769) (not b!565764) (not b!565772) (not b!565770) (not start!51718) (not b!565767) (not b!565768) (not b!565763) (not b!565765) (not b!565771))
(check-sat)
