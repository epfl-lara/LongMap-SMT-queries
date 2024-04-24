; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51756 () Bool)

(assert start!51756)

(declare-fun b!565843 () Bool)

(declare-fun res!356709 () Bool)

(declare-fun e!325772 () Bool)

(assert (=> b!565843 (=> (not res!356709) (not e!325772))))

(declare-datatypes ((array!35511 0))(
  ( (array!35512 (arr!17053 (Array (_ BitVec 32) (_ BitVec 64))) (size!17417 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35511)

(declare-datatypes ((List!11040 0))(
  ( (Nil!11037) (Cons!11036 (h!12045 (_ BitVec 64)) (t!17260 List!11040)) )
))
(declare-fun arrayNoDuplicates!0 (array!35511 (_ BitVec 32) List!11040) Bool)

(assert (=> b!565843 (= res!356709 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11037))))

(declare-fun b!565844 () Bool)

(assert (=> b!565844 (= e!325772 (not true))))

(declare-fun e!325773 () Bool)

(assert (=> b!565844 e!325773))

(declare-fun res!356715 () Bool)

(assert (=> b!565844 (=> (not res!356715) (not e!325773))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35511 (_ BitVec 32)) Bool)

(assert (=> b!565844 (= res!356715 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17689 0))(
  ( (Unit!17690) )
))
(declare-fun lt!258039 () Unit!17689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17689)

(assert (=> b!565844 (= lt!258039 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565845 () Bool)

(declare-fun e!325770 () Bool)

(assert (=> b!565845 (= e!325770 e!325772)))

(declare-fun res!356712 () Bool)

(assert (=> b!565845 (=> (not res!356712) (not e!325772))))

(declare-datatypes ((SeekEntryResult!5458 0))(
  ( (MissingZero!5458 (index!24059 (_ BitVec 32))) (Found!5458 (index!24060 (_ BitVec 32))) (Intermediate!5458 (undefined!6270 Bool) (index!24061 (_ BitVec 32)) (x!53082 (_ BitVec 32))) (Undefined!5458) (MissingVacant!5458 (index!24062 (_ BitVec 32))) )
))
(declare-fun lt!258040 () SeekEntryResult!5458)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565845 (= res!356712 (or (= lt!258040 (MissingZero!5458 i!1132)) (= lt!258040 (MissingVacant!5458 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35511 (_ BitVec 32)) SeekEntryResult!5458)

(assert (=> b!565845 (= lt!258040 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565846 () Bool)

(declare-fun res!356711 () Bool)

(assert (=> b!565846 (=> (not res!356711) (not e!325772))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35511 (_ BitVec 32)) SeekEntryResult!5458)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565846 (= res!356711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17053 a!3118) j!142) mask!3119) (select (arr!17053 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17053 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17053 a!3118) i!1132 k0!1914) j!142) (array!35512 (store (arr!17053 a!3118) i!1132 k0!1914) (size!17417 a!3118)) mask!3119)))))

(declare-fun b!565847 () Bool)

(declare-fun res!356708 () Bool)

(assert (=> b!565847 (=> (not res!356708) (not e!325770))))

(assert (=> b!565847 (= res!356708 (and (= (size!17417 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17417 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17417 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565848 () Bool)

(assert (=> b!565848 (= e!325773 (= (seekEntryOrOpen!0 (select (arr!17053 a!3118) j!142) a!3118 mask!3119) (Found!5458 j!142)))))

(declare-fun b!565849 () Bool)

(declare-fun res!356713 () Bool)

(assert (=> b!565849 (=> (not res!356713) (not e!325770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565849 (= res!356713 (validKeyInArray!0 (select (arr!17053 a!3118) j!142)))))

(declare-fun b!565850 () Bool)

(declare-fun res!356716 () Bool)

(assert (=> b!565850 (=> (not res!356716) (not e!325770))))

(assert (=> b!565850 (= res!356716 (validKeyInArray!0 k0!1914))))

(declare-fun res!356707 () Bool)

(assert (=> start!51756 (=> (not res!356707) (not e!325770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51756 (= res!356707 (validMask!0 mask!3119))))

(assert (=> start!51756 e!325770))

(assert (=> start!51756 true))

(declare-fun array_inv!12912 (array!35511) Bool)

(assert (=> start!51756 (array_inv!12912 a!3118)))

(declare-fun b!565851 () Bool)

(declare-fun res!356710 () Bool)

(assert (=> b!565851 (=> (not res!356710) (not e!325770))))

(declare-fun arrayContainsKey!0 (array!35511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565851 (= res!356710 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565852 () Bool)

(declare-fun res!356714 () Bool)

(assert (=> b!565852 (=> (not res!356714) (not e!325772))))

(assert (=> b!565852 (= res!356714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51756 res!356707) b!565847))

(assert (= (and b!565847 res!356708) b!565849))

(assert (= (and b!565849 res!356713) b!565850))

(assert (= (and b!565850 res!356716) b!565851))

(assert (= (and b!565851 res!356710) b!565845))

(assert (= (and b!565845 res!356712) b!565852))

(assert (= (and b!565852 res!356714) b!565843))

(assert (= (and b!565843 res!356709) b!565846))

(assert (= (and b!565846 res!356711) b!565844))

(assert (= (and b!565844 res!356715) b!565848))

(declare-fun m!544481 () Bool)

(assert (=> b!565844 m!544481))

(declare-fun m!544483 () Bool)

(assert (=> b!565844 m!544483))

(declare-fun m!544485 () Bool)

(assert (=> b!565851 m!544485))

(declare-fun m!544487 () Bool)

(assert (=> b!565843 m!544487))

(declare-fun m!544489 () Bool)

(assert (=> b!565850 m!544489))

(declare-fun m!544491 () Bool)

(assert (=> b!565848 m!544491))

(assert (=> b!565848 m!544491))

(declare-fun m!544493 () Bool)

(assert (=> b!565848 m!544493))

(assert (=> b!565849 m!544491))

(assert (=> b!565849 m!544491))

(declare-fun m!544495 () Bool)

(assert (=> b!565849 m!544495))

(declare-fun m!544497 () Bool)

(assert (=> b!565852 m!544497))

(declare-fun m!544499 () Bool)

(assert (=> b!565845 m!544499))

(assert (=> b!565846 m!544491))

(declare-fun m!544501 () Bool)

(assert (=> b!565846 m!544501))

(assert (=> b!565846 m!544491))

(declare-fun m!544503 () Bool)

(assert (=> b!565846 m!544503))

(declare-fun m!544505 () Bool)

(assert (=> b!565846 m!544505))

(assert (=> b!565846 m!544503))

(declare-fun m!544507 () Bool)

(assert (=> b!565846 m!544507))

(assert (=> b!565846 m!544501))

(assert (=> b!565846 m!544491))

(declare-fun m!544509 () Bool)

(assert (=> b!565846 m!544509))

(declare-fun m!544511 () Bool)

(assert (=> b!565846 m!544511))

(assert (=> b!565846 m!544503))

(assert (=> b!565846 m!544505))

(declare-fun m!544513 () Bool)

(assert (=> start!51756 m!544513))

(declare-fun m!544515 () Bool)

(assert (=> start!51756 m!544515))

(check-sat (not b!565849) (not b!565844) (not b!565845) (not b!565852) (not b!565843) (not start!51756) (not b!565850) (not b!565848) (not b!565846) (not b!565851))
(check-sat)
