; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50660 () Bool)

(assert start!50660)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!553823 () Bool)

(declare-fun e!319418 () Bool)

(declare-datatypes ((array!34885 0))(
  ( (array!34886 (arr!16752 (Array (_ BitVec 32) (_ BitVec 64))) (size!17116 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34885)

(declare-datatypes ((SeekEntryResult!5201 0))(
  ( (MissingZero!5201 (index!23031 (_ BitVec 32))) (Found!5201 (index!23032 (_ BitVec 32))) (Intermediate!5201 (undefined!6013 Bool) (index!23033 (_ BitVec 32)) (x!51955 (_ BitVec 32))) (Undefined!5201) (MissingVacant!5201 (index!23034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34885 (_ BitVec 32)) SeekEntryResult!5201)

(assert (=> b!553823 (= e!319418 (= (seekEntryOrOpen!0 (select (arr!16752 a!3118) j!142) a!3118 mask!3119) (Found!5201 j!142)))))

(declare-fun b!553824 () Bool)

(declare-fun res!346236 () Bool)

(declare-fun e!319416 () Bool)

(assert (=> b!553824 (=> (not res!346236) (not e!319416))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553824 (= res!346236 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!346239 () Bool)

(assert (=> start!50660 (=> (not res!346239) (not e!319416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50660 (= res!346239 (validMask!0 mask!3119))))

(assert (=> start!50660 e!319416))

(assert (=> start!50660 true))

(declare-fun array_inv!12548 (array!34885) Bool)

(assert (=> start!50660 (array_inv!12548 a!3118)))

(declare-fun b!553825 () Bool)

(declare-fun res!346235 () Bool)

(assert (=> b!553825 (=> (not res!346235) (not e!319416))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553825 (= res!346235 (and (= (size!17116 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17116 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17116 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553826 () Bool)

(declare-fun res!346237 () Bool)

(declare-fun e!319419 () Bool)

(assert (=> b!553826 (=> (not res!346237) (not e!319419))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34885 (_ BitVec 32)) SeekEntryResult!5201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553826 (= res!346237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16752 a!3118) j!142) mask!3119) (select (arr!16752 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16752 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16752 a!3118) i!1132 k!1914) j!142) (array!34886 (store (arr!16752 a!3118) i!1132 k!1914) (size!17116 a!3118)) mask!3119)))))

(declare-fun b!553827 () Bool)

(declare-fun res!346244 () Bool)

(assert (=> b!553827 (=> (not res!346244) (not e!319416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553827 (= res!346244 (validKeyInArray!0 k!1914))))

(declare-fun b!553828 () Bool)

(declare-fun res!346242 () Bool)

(assert (=> b!553828 (=> (not res!346242) (not e!319416))))

(assert (=> b!553828 (= res!346242 (validKeyInArray!0 (select (arr!16752 a!3118) j!142)))))

(declare-fun b!553829 () Bool)

(declare-fun res!346240 () Bool)

(assert (=> b!553829 (=> (not res!346240) (not e!319419))))

(declare-datatypes ((List!10832 0))(
  ( (Nil!10829) (Cons!10828 (h!11813 (_ BitVec 64)) (t!17060 List!10832)) )
))
(declare-fun arrayNoDuplicates!0 (array!34885 (_ BitVec 32) List!10832) Bool)

(assert (=> b!553829 (= res!346240 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10829))))

(declare-fun b!553830 () Bool)

(assert (=> b!553830 (= e!319416 e!319419)))

(declare-fun res!346243 () Bool)

(assert (=> b!553830 (=> (not res!346243) (not e!319419))))

(declare-fun lt!251589 () SeekEntryResult!5201)

(assert (=> b!553830 (= res!346243 (or (= lt!251589 (MissingZero!5201 i!1132)) (= lt!251589 (MissingVacant!5201 i!1132))))))

(assert (=> b!553830 (= lt!251589 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553831 () Bool)

(assert (=> b!553831 (= e!319419 (not true))))

(assert (=> b!553831 e!319418))

(declare-fun res!346241 () Bool)

(assert (=> b!553831 (=> (not res!346241) (not e!319418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34885 (_ BitVec 32)) Bool)

(assert (=> b!553831 (= res!346241 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17176 0))(
  ( (Unit!17177) )
))
(declare-fun lt!251590 () Unit!17176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17176)

(assert (=> b!553831 (= lt!251590 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553832 () Bool)

(declare-fun res!346238 () Bool)

(assert (=> b!553832 (=> (not res!346238) (not e!319419))))

(assert (=> b!553832 (= res!346238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50660 res!346239) b!553825))

(assert (= (and b!553825 res!346235) b!553828))

(assert (= (and b!553828 res!346242) b!553827))

(assert (= (and b!553827 res!346244) b!553824))

(assert (= (and b!553824 res!346236) b!553830))

(assert (= (and b!553830 res!346243) b!553832))

(assert (= (and b!553832 res!346238) b!553829))

(assert (= (and b!553829 res!346240) b!553826))

(assert (= (and b!553826 res!346237) b!553831))

(assert (= (and b!553831 res!346241) b!553823))

(declare-fun m!530985 () Bool)

(assert (=> b!553832 m!530985))

(declare-fun m!530987 () Bool)

(assert (=> start!50660 m!530987))

(declare-fun m!530989 () Bool)

(assert (=> start!50660 m!530989))

(declare-fun m!530991 () Bool)

(assert (=> b!553831 m!530991))

(declare-fun m!530993 () Bool)

(assert (=> b!553831 m!530993))

(declare-fun m!530995 () Bool)

(assert (=> b!553823 m!530995))

(assert (=> b!553823 m!530995))

(declare-fun m!530997 () Bool)

(assert (=> b!553823 m!530997))

(declare-fun m!530999 () Bool)

(assert (=> b!553830 m!530999))

(assert (=> b!553828 m!530995))

(assert (=> b!553828 m!530995))

(declare-fun m!531001 () Bool)

(assert (=> b!553828 m!531001))

(assert (=> b!553826 m!530995))

(declare-fun m!531003 () Bool)

(assert (=> b!553826 m!531003))

(assert (=> b!553826 m!530995))

(declare-fun m!531005 () Bool)

(assert (=> b!553826 m!531005))

(declare-fun m!531007 () Bool)

(assert (=> b!553826 m!531007))

(assert (=> b!553826 m!531005))

(declare-fun m!531009 () Bool)

(assert (=> b!553826 m!531009))

(assert (=> b!553826 m!531003))

(assert (=> b!553826 m!530995))

(declare-fun m!531011 () Bool)

(assert (=> b!553826 m!531011))

(declare-fun m!531013 () Bool)

(assert (=> b!553826 m!531013))

(assert (=> b!553826 m!531005))

(assert (=> b!553826 m!531007))

(declare-fun m!531015 () Bool)

(assert (=> b!553824 m!531015))

(declare-fun m!531017 () Bool)

(assert (=> b!553829 m!531017))

(declare-fun m!531019 () Bool)

(assert (=> b!553827 m!531019))

(push 1)

