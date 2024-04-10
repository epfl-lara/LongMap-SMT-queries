; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51060 () Bool)

(assert start!51060)

(declare-fun b!557852 () Bool)

(declare-fun e!321377 () Bool)

(declare-fun e!321378 () Bool)

(assert (=> b!557852 (= e!321377 e!321378)))

(declare-fun res!349718 () Bool)

(assert (=> b!557852 (=> (not res!349718) (not e!321378))))

(declare-datatypes ((SeekEntryResult!5311 0))(
  ( (MissingZero!5311 (index!23471 (_ BitVec 32))) (Found!5311 (index!23472 (_ BitVec 32))) (Intermediate!5311 (undefined!6123 Bool) (index!23473 (_ BitVec 32)) (x!52371 (_ BitVec 32))) (Undefined!5311) (MissingVacant!5311 (index!23474 (_ BitVec 32))) )
))
(declare-fun lt!253464 () SeekEntryResult!5311)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557852 (= res!349718 (or (= lt!253464 (MissingZero!5311 i!1132)) (= lt!253464 (MissingVacant!5311 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35114 0))(
  ( (array!35115 (arr!16862 (Array (_ BitVec 32) (_ BitVec 64))) (size!17226 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35114)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35114 (_ BitVec 32)) SeekEntryResult!5311)

(assert (=> b!557852 (= lt!253464 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557853 () Bool)

(declare-fun res!349719 () Bool)

(assert (=> b!557853 (=> (not res!349719) (not e!321377))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!557853 (= res!349719 (and (= (size!17226 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17226 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17226 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!349724 () Bool)

(assert (=> start!51060 (=> (not res!349724) (not e!321377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51060 (= res!349724 (validMask!0 mask!3119))))

(assert (=> start!51060 e!321377))

(assert (=> start!51060 true))

(declare-fun array_inv!12658 (array!35114) Bool)

(assert (=> start!51060 (array_inv!12658 a!3118)))

(declare-fun b!557854 () Bool)

(declare-fun res!349717 () Bool)

(assert (=> b!557854 (=> (not res!349717) (not e!321377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557854 (= res!349717 (validKeyInArray!0 k!1914))))

(declare-fun b!557855 () Bool)

(declare-fun e!321376 () Bool)

(assert (=> b!557855 (= e!321376 (= (seekEntryOrOpen!0 (select (arr!16862 a!3118) j!142) a!3118 mask!3119) (Found!5311 j!142)))))

(declare-fun b!557856 () Bool)

(declare-fun res!349715 () Bool)

(assert (=> b!557856 (=> (not res!349715) (not e!321378))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35114 (_ BitVec 32)) SeekEntryResult!5311)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557856 (= res!349715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16862 a!3118) j!142) mask!3119) (select (arr!16862 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16862 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16862 a!3118) i!1132 k!1914) j!142) (array!35115 (store (arr!16862 a!3118) i!1132 k!1914) (size!17226 a!3118)) mask!3119)))))

(declare-fun b!557857 () Bool)

(declare-fun res!349716 () Bool)

(assert (=> b!557857 (=> (not res!349716) (not e!321378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35114 (_ BitVec 32)) Bool)

(assert (=> b!557857 (= res!349716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557858 () Bool)

(declare-fun res!349722 () Bool)

(assert (=> b!557858 (=> (not res!349722) (not e!321378))))

(declare-datatypes ((List!10942 0))(
  ( (Nil!10939) (Cons!10938 (h!11932 (_ BitVec 64)) (t!17170 List!10942)) )
))
(declare-fun arrayNoDuplicates!0 (array!35114 (_ BitVec 32) List!10942) Bool)

(assert (=> b!557858 (= res!349722 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10939))))

(declare-fun b!557859 () Bool)

(declare-fun res!349721 () Bool)

(assert (=> b!557859 (=> (not res!349721) (not e!321377))))

(assert (=> b!557859 (= res!349721 (validKeyInArray!0 (select (arr!16862 a!3118) j!142)))))

(declare-fun b!557860 () Bool)

(declare-fun res!349720 () Bool)

(assert (=> b!557860 (=> (not res!349720) (not e!321377))))

(declare-fun arrayContainsKey!0 (array!35114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557860 (= res!349720 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557861 () Bool)

(assert (=> b!557861 (= e!321378 (not true))))

(assert (=> b!557861 e!321376))

(declare-fun res!349723 () Bool)

(assert (=> b!557861 (=> (not res!349723) (not e!321376))))

(assert (=> b!557861 (= res!349723 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17396 0))(
  ( (Unit!17397) )
))
(declare-fun lt!253465 () Unit!17396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17396)

(assert (=> b!557861 (= lt!253465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51060 res!349724) b!557853))

(assert (= (and b!557853 res!349719) b!557859))

(assert (= (and b!557859 res!349721) b!557854))

(assert (= (and b!557854 res!349717) b!557860))

(assert (= (and b!557860 res!349720) b!557852))

(assert (= (and b!557852 res!349718) b!557857))

(assert (= (and b!557857 res!349716) b!557858))

(assert (= (and b!557858 res!349722) b!557856))

(assert (= (and b!557856 res!349715) b!557861))

(assert (= (and b!557861 res!349723) b!557855))

(declare-fun m!535713 () Bool)

(assert (=> b!557855 m!535713))

(assert (=> b!557855 m!535713))

(declare-fun m!535715 () Bool)

(assert (=> b!557855 m!535715))

(assert (=> b!557856 m!535713))

(declare-fun m!535717 () Bool)

(assert (=> b!557856 m!535717))

(assert (=> b!557856 m!535713))

(declare-fun m!535719 () Bool)

(assert (=> b!557856 m!535719))

(declare-fun m!535721 () Bool)

(assert (=> b!557856 m!535721))

(assert (=> b!557856 m!535719))

(declare-fun m!535723 () Bool)

(assert (=> b!557856 m!535723))

(assert (=> b!557856 m!535717))

(assert (=> b!557856 m!535713))

(declare-fun m!535725 () Bool)

(assert (=> b!557856 m!535725))

(declare-fun m!535727 () Bool)

(assert (=> b!557856 m!535727))

(assert (=> b!557856 m!535719))

(assert (=> b!557856 m!535721))

(declare-fun m!535729 () Bool)

(assert (=> b!557861 m!535729))

(declare-fun m!535731 () Bool)

(assert (=> b!557861 m!535731))

(declare-fun m!535733 () Bool)

(assert (=> b!557857 m!535733))

(assert (=> b!557859 m!535713))

(assert (=> b!557859 m!535713))

(declare-fun m!535735 () Bool)

(assert (=> b!557859 m!535735))

(declare-fun m!535737 () Bool)

(assert (=> b!557854 m!535737))

(declare-fun m!535739 () Bool)

(assert (=> b!557860 m!535739))

(declare-fun m!535741 () Bool)

(assert (=> start!51060 m!535741))

(declare-fun m!535743 () Bool)

(assert (=> start!51060 m!535743))

(declare-fun m!535745 () Bool)

(assert (=> b!557858 m!535745))

(declare-fun m!535747 () Bool)

(assert (=> b!557852 m!535747))

(push 1)

(assert (not start!51060))

(assert (not b!557857))

(assert (not b!557854))

(assert (not b!557859))

(assert (not b!557856))

(assert (not b!557852))

(assert (not b!557861))

(assert (not b!557858))

(assert (not b!557860))

(assert (not b!557855))

(check-sat)

