; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51712 () Bool)

(assert start!51712)

(declare-fun b!565673 () Bool)

(declare-fun res!356644 () Bool)

(declare-fun e!325653 () Bool)

(assert (=> b!565673 (=> (not res!356644) (not e!325653))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35520 0))(
  ( (array!35521 (arr!17059 (Array (_ BitVec 32) (_ BitVec 64))) (size!17423 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35520)

(declare-datatypes ((SeekEntryResult!5508 0))(
  ( (MissingZero!5508 (index!24259 (_ BitVec 32))) (Found!5508 (index!24260 (_ BitVec 32))) (Intermediate!5508 (undefined!6320 Bool) (index!24261 (_ BitVec 32)) (x!53129 (_ BitVec 32))) (Undefined!5508) (MissingVacant!5508 (index!24262 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35520 (_ BitVec 32)) SeekEntryResult!5508)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565673 (= res!356644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17059 a!3118) j!142) mask!3119) (select (arr!17059 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17059 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17059 a!3118) i!1132 k0!1914) j!142) (array!35521 (store (arr!17059 a!3118) i!1132 k0!1914) (size!17423 a!3118)) mask!3119)))))

(declare-fun b!565674 () Bool)

(declare-fun res!356646 () Bool)

(assert (=> b!565674 (=> (not res!356646) (not e!325653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35520 (_ BitVec 32)) Bool)

(assert (=> b!565674 (= res!356646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565675 () Bool)

(declare-fun res!356643 () Bool)

(declare-fun e!325656 () Bool)

(assert (=> b!565675 (=> (not res!356643) (not e!325656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565675 (= res!356643 (validKeyInArray!0 k0!1914))))

(declare-fun b!565676 () Bool)

(declare-fun e!325655 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35520 (_ BitVec 32)) SeekEntryResult!5508)

(assert (=> b!565676 (= e!325655 (= (seekEntryOrOpen!0 (select (arr!17059 a!3118) j!142) a!3118 mask!3119) (Found!5508 j!142)))))

(declare-fun b!565678 () Bool)

(declare-fun res!356648 () Bool)

(assert (=> b!565678 (=> (not res!356648) (not e!325653))))

(declare-datatypes ((List!11139 0))(
  ( (Nil!11136) (Cons!11135 (h!12141 (_ BitVec 64)) (t!17367 List!11139)) )
))
(declare-fun arrayNoDuplicates!0 (array!35520 (_ BitVec 32) List!11139) Bool)

(assert (=> b!565678 (= res!356648 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11136))))

(declare-fun b!565679 () Bool)

(assert (=> b!565679 (= e!325653 (not true))))

(assert (=> b!565679 e!325655))

(declare-fun res!356651 () Bool)

(assert (=> b!565679 (=> (not res!356651) (not e!325655))))

(assert (=> b!565679 (= res!356651 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17718 0))(
  ( (Unit!17719) )
))
(declare-fun lt!257935 () Unit!17718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17718)

(assert (=> b!565679 (= lt!257935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565680 () Bool)

(declare-fun res!356650 () Bool)

(assert (=> b!565680 (=> (not res!356650) (not e!325656))))

(assert (=> b!565680 (= res!356650 (and (= (size!17423 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17423 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17423 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565681 () Bool)

(declare-fun res!356649 () Bool)

(assert (=> b!565681 (=> (not res!356649) (not e!325656))))

(declare-fun arrayContainsKey!0 (array!35520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565681 (= res!356649 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565682 () Bool)

(declare-fun res!356642 () Bool)

(assert (=> b!565682 (=> (not res!356642) (not e!325656))))

(assert (=> b!565682 (= res!356642 (validKeyInArray!0 (select (arr!17059 a!3118) j!142)))))

(declare-fun res!356647 () Bool)

(assert (=> start!51712 (=> (not res!356647) (not e!325656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51712 (= res!356647 (validMask!0 mask!3119))))

(assert (=> start!51712 e!325656))

(assert (=> start!51712 true))

(declare-fun array_inv!12855 (array!35520) Bool)

(assert (=> start!51712 (array_inv!12855 a!3118)))

(declare-fun b!565677 () Bool)

(assert (=> b!565677 (= e!325656 e!325653)))

(declare-fun res!356645 () Bool)

(assert (=> b!565677 (=> (not res!356645) (not e!325653))))

(declare-fun lt!257934 () SeekEntryResult!5508)

(assert (=> b!565677 (= res!356645 (or (= lt!257934 (MissingZero!5508 i!1132)) (= lt!257934 (MissingVacant!5508 i!1132))))))

(assert (=> b!565677 (= lt!257934 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51712 res!356647) b!565680))

(assert (= (and b!565680 res!356650) b!565682))

(assert (= (and b!565682 res!356642) b!565675))

(assert (= (and b!565675 res!356643) b!565681))

(assert (= (and b!565681 res!356649) b!565677))

(assert (= (and b!565677 res!356645) b!565674))

(assert (= (and b!565674 res!356646) b!565678))

(assert (= (and b!565678 res!356648) b!565673))

(assert (= (and b!565673 res!356644) b!565679))

(assert (= (and b!565679 res!356651) b!565676))

(declare-fun m!544179 () Bool)

(assert (=> b!565674 m!544179))

(declare-fun m!544181 () Bool)

(assert (=> b!565681 m!544181))

(declare-fun m!544183 () Bool)

(assert (=> b!565678 m!544183))

(declare-fun m!544185 () Bool)

(assert (=> b!565682 m!544185))

(assert (=> b!565682 m!544185))

(declare-fun m!544187 () Bool)

(assert (=> b!565682 m!544187))

(declare-fun m!544189 () Bool)

(assert (=> b!565677 m!544189))

(declare-fun m!544191 () Bool)

(assert (=> start!51712 m!544191))

(declare-fun m!544193 () Bool)

(assert (=> start!51712 m!544193))

(assert (=> b!565673 m!544185))

(declare-fun m!544195 () Bool)

(assert (=> b!565673 m!544195))

(assert (=> b!565673 m!544185))

(declare-fun m!544197 () Bool)

(assert (=> b!565673 m!544197))

(declare-fun m!544199 () Bool)

(assert (=> b!565673 m!544199))

(assert (=> b!565673 m!544197))

(declare-fun m!544201 () Bool)

(assert (=> b!565673 m!544201))

(assert (=> b!565673 m!544195))

(assert (=> b!565673 m!544185))

(declare-fun m!544203 () Bool)

(assert (=> b!565673 m!544203))

(declare-fun m!544205 () Bool)

(assert (=> b!565673 m!544205))

(assert (=> b!565673 m!544197))

(assert (=> b!565673 m!544199))

(assert (=> b!565676 m!544185))

(assert (=> b!565676 m!544185))

(declare-fun m!544207 () Bool)

(assert (=> b!565676 m!544207))

(declare-fun m!544209 () Bool)

(assert (=> b!565679 m!544209))

(declare-fun m!544211 () Bool)

(assert (=> b!565679 m!544211))

(declare-fun m!544213 () Bool)

(assert (=> b!565675 m!544213))

(check-sat (not b!565678) (not b!565679) (not b!565677) (not start!51712) (not b!565676) (not b!565674) (not b!565681) (not b!565682) (not b!565675) (not b!565673))
(check-sat)
