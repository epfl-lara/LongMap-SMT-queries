; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50590 () Bool)

(assert start!50590)

(declare-fun b!552764 () Bool)

(declare-fun res!345180 () Bool)

(declare-fun e!318951 () Bool)

(assert (=> b!552764 (=> (not res!345180) (not e!318951))))

(declare-datatypes ((array!34815 0))(
  ( (array!34816 (arr!16717 (Array (_ BitVec 32) (_ BitVec 64))) (size!17081 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34815)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552764 (= res!345180 (validKeyInArray!0 (select (arr!16717 a!3118) j!142)))))

(declare-fun b!552765 () Bool)

(declare-fun res!345176 () Bool)

(assert (=> b!552765 (=> (not res!345176) (not e!318951))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!552765 (= res!345176 (validKeyInArray!0 k0!1914))))

(declare-fun b!552766 () Bool)

(declare-fun e!318954 () Bool)

(assert (=> b!552766 (= e!318954 (not true))))

(declare-fun e!318952 () Bool)

(assert (=> b!552766 e!318952))

(declare-fun res!345177 () Bool)

(assert (=> b!552766 (=> (not res!345177) (not e!318952))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34815 (_ BitVec 32)) Bool)

(assert (=> b!552766 (= res!345177 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17106 0))(
  ( (Unit!17107) )
))
(declare-fun lt!251272 () Unit!17106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17106)

(assert (=> b!552766 (= lt!251272 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552767 () Bool)

(declare-fun res!345182 () Bool)

(assert (=> b!552767 (=> (not res!345182) (not e!318951))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552767 (= res!345182 (and (= (size!17081 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17081 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17081 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!345185 () Bool)

(assert (=> start!50590 (=> (not res!345185) (not e!318951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50590 (= res!345185 (validMask!0 mask!3119))))

(assert (=> start!50590 e!318951))

(assert (=> start!50590 true))

(declare-fun array_inv!12513 (array!34815) Bool)

(assert (=> start!50590 (array_inv!12513 a!3118)))

(declare-fun b!552768 () Bool)

(assert (=> b!552768 (= e!318951 e!318954)))

(declare-fun res!345184 () Bool)

(assert (=> b!552768 (=> (not res!345184) (not e!318954))))

(declare-datatypes ((SeekEntryResult!5166 0))(
  ( (MissingZero!5166 (index!22891 (_ BitVec 32))) (Found!5166 (index!22892 (_ BitVec 32))) (Intermediate!5166 (undefined!5978 Bool) (index!22893 (_ BitVec 32)) (x!51824 (_ BitVec 32))) (Undefined!5166) (MissingVacant!5166 (index!22894 (_ BitVec 32))) )
))
(declare-fun lt!251271 () SeekEntryResult!5166)

(assert (=> b!552768 (= res!345184 (or (= lt!251271 (MissingZero!5166 i!1132)) (= lt!251271 (MissingVacant!5166 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34815 (_ BitVec 32)) SeekEntryResult!5166)

(assert (=> b!552768 (= lt!251271 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552769 () Bool)

(declare-fun res!345181 () Bool)

(assert (=> b!552769 (=> (not res!345181) (not e!318954))))

(declare-datatypes ((List!10797 0))(
  ( (Nil!10794) (Cons!10793 (h!11778 (_ BitVec 64)) (t!17025 List!10797)) )
))
(declare-fun arrayNoDuplicates!0 (array!34815 (_ BitVec 32) List!10797) Bool)

(assert (=> b!552769 (= res!345181 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10794))))

(declare-fun b!552770 () Bool)

(declare-fun res!345179 () Bool)

(assert (=> b!552770 (=> (not res!345179) (not e!318954))))

(assert (=> b!552770 (= res!345179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552771 () Bool)

(declare-fun res!345178 () Bool)

(assert (=> b!552771 (=> (not res!345178) (not e!318954))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34815 (_ BitVec 32)) SeekEntryResult!5166)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552771 (= res!345178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16717 a!3118) j!142) mask!3119) (select (arr!16717 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16717 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16717 a!3118) i!1132 k0!1914) j!142) (array!34816 (store (arr!16717 a!3118) i!1132 k0!1914) (size!17081 a!3118)) mask!3119)))))

(declare-fun b!552772 () Bool)

(assert (=> b!552772 (= e!318952 (= (seekEntryOrOpen!0 (select (arr!16717 a!3118) j!142) a!3118 mask!3119) (Found!5166 j!142)))))

(declare-fun b!552773 () Bool)

(declare-fun res!345183 () Bool)

(assert (=> b!552773 (=> (not res!345183) (not e!318951))))

(declare-fun arrayContainsKey!0 (array!34815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552773 (= res!345183 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50590 res!345185) b!552767))

(assert (= (and b!552767 res!345182) b!552764))

(assert (= (and b!552764 res!345180) b!552765))

(assert (= (and b!552765 res!345176) b!552773))

(assert (= (and b!552773 res!345183) b!552768))

(assert (= (and b!552768 res!345184) b!552770))

(assert (= (and b!552770 res!345179) b!552769))

(assert (= (and b!552769 res!345181) b!552771))

(assert (= (and b!552771 res!345178) b!552766))

(assert (= (and b!552766 res!345177) b!552772))

(declare-fun m!529713 () Bool)

(assert (=> b!552766 m!529713))

(declare-fun m!529715 () Bool)

(assert (=> b!552766 m!529715))

(declare-fun m!529717 () Bool)

(assert (=> start!50590 m!529717))

(declare-fun m!529719 () Bool)

(assert (=> start!50590 m!529719))

(declare-fun m!529721 () Bool)

(assert (=> b!552768 m!529721))

(declare-fun m!529723 () Bool)

(assert (=> b!552764 m!529723))

(assert (=> b!552764 m!529723))

(declare-fun m!529725 () Bool)

(assert (=> b!552764 m!529725))

(declare-fun m!529727 () Bool)

(assert (=> b!552769 m!529727))

(assert (=> b!552772 m!529723))

(assert (=> b!552772 m!529723))

(declare-fun m!529729 () Bool)

(assert (=> b!552772 m!529729))

(declare-fun m!529731 () Bool)

(assert (=> b!552773 m!529731))

(declare-fun m!529733 () Bool)

(assert (=> b!552765 m!529733))

(declare-fun m!529735 () Bool)

(assert (=> b!552770 m!529735))

(assert (=> b!552771 m!529723))

(declare-fun m!529737 () Bool)

(assert (=> b!552771 m!529737))

(assert (=> b!552771 m!529723))

(declare-fun m!529739 () Bool)

(assert (=> b!552771 m!529739))

(declare-fun m!529741 () Bool)

(assert (=> b!552771 m!529741))

(assert (=> b!552771 m!529739))

(declare-fun m!529743 () Bool)

(assert (=> b!552771 m!529743))

(assert (=> b!552771 m!529737))

(assert (=> b!552771 m!529723))

(declare-fun m!529745 () Bool)

(assert (=> b!552771 m!529745))

(declare-fun m!529747 () Bool)

(assert (=> b!552771 m!529747))

(assert (=> b!552771 m!529739))

(assert (=> b!552771 m!529741))

(check-sat (not start!50590) (not b!552768) (not b!552770) (not b!552772) (not b!552773) (not b!552766) (not b!552764) (not b!552771) (not b!552769) (not b!552765))
(check-sat)
