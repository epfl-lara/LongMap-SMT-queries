; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50808 () Bool)

(assert start!50808)

(declare-fun b!555900 () Bool)

(declare-fun e!320342 () Bool)

(declare-fun e!320341 () Bool)

(assert (=> b!555900 (= e!320342 e!320341)))

(declare-fun res!348316 () Bool)

(assert (=> b!555900 (=> (not res!348316) (not e!320341))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5275 0))(
  ( (MissingZero!5275 (index!23327 (_ BitVec 32))) (Found!5275 (index!23328 (_ BitVec 32))) (Intermediate!5275 (undefined!6087 Bool) (index!23329 (_ BitVec 32)) (x!52221 (_ BitVec 32))) (Undefined!5275) (MissingVacant!5275 (index!23330 (_ BitVec 32))) )
))
(declare-fun lt!252723 () SeekEntryResult!5275)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35033 0))(
  ( (array!35034 (arr!16826 (Array (_ BitVec 32) (_ BitVec 64))) (size!17190 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35033)

(declare-fun lt!252726 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35033 (_ BitVec 32)) SeekEntryResult!5275)

(assert (=> b!555900 (= res!348316 (= lt!252723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252726 (select (store (arr!16826 a!3118) i!1132 k!1914) j!142) (array!35034 (store (arr!16826 a!3118) i!1132 k!1914) (size!17190 a!3118)) mask!3119)))))

(declare-fun lt!252722 () (_ BitVec 32))

(assert (=> b!555900 (= lt!252723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252722 (select (arr!16826 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555900 (= lt!252726 (toIndex!0 (select (store (arr!16826 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555900 (= lt!252722 (toIndex!0 (select (arr!16826 a!3118) j!142) mask!3119))))

(declare-fun b!555901 () Bool)

(declare-fun res!348318 () Bool)

(declare-fun e!320343 () Bool)

(assert (=> b!555901 (=> (not res!348318) (not e!320343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555901 (= res!348318 (validKeyInArray!0 (select (arr!16826 a!3118) j!142)))))

(declare-fun b!555902 () Bool)

(declare-fun res!348317 () Bool)

(assert (=> b!555902 (=> (not res!348317) (not e!320342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35033 (_ BitVec 32)) Bool)

(assert (=> b!555902 (= res!348317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555903 () Bool)

(declare-fun res!348314 () Bool)

(assert (=> b!555903 (=> (not res!348314) (not e!320343))))

(assert (=> b!555903 (= res!348314 (validKeyInArray!0 k!1914))))

(declare-fun b!555904 () Bool)

(declare-fun res!348319 () Bool)

(assert (=> b!555904 (=> (not res!348319) (not e!320342))))

(declare-datatypes ((List!10906 0))(
  ( (Nil!10903) (Cons!10902 (h!11887 (_ BitVec 64)) (t!17134 List!10906)) )
))
(declare-fun arrayNoDuplicates!0 (array!35033 (_ BitVec 32) List!10906) Bool)

(assert (=> b!555904 (= res!348319 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10903))))

(declare-fun res!348313 () Bool)

(assert (=> start!50808 (=> (not res!348313) (not e!320343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50808 (= res!348313 (validMask!0 mask!3119))))

(assert (=> start!50808 e!320343))

(assert (=> start!50808 true))

(declare-fun array_inv!12622 (array!35033) Bool)

(assert (=> start!50808 (array_inv!12622 a!3118)))

(declare-fun b!555905 () Bool)

(declare-fun res!348312 () Bool)

(assert (=> b!555905 (=> (not res!348312) (not e!320343))))

(declare-fun arrayContainsKey!0 (array!35033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555905 (= res!348312 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555906 () Bool)

(assert (=> b!555906 (= e!320341 (not true))))

(declare-fun lt!252725 () SeekEntryResult!5275)

(assert (=> b!555906 (and (= lt!252725 (Found!5275 j!142)) (or (undefined!6087 lt!252723) (not (is-Intermediate!5275 lt!252723)) (= (select (arr!16826 a!3118) (index!23329 lt!252723)) (select (arr!16826 a!3118) j!142)) (not (= (select (arr!16826 a!3118) (index!23329 lt!252723)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252725 (MissingZero!5275 (index!23329 lt!252723)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35033 (_ BitVec 32)) SeekEntryResult!5275)

(assert (=> b!555906 (= lt!252725 (seekEntryOrOpen!0 (select (arr!16826 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555906 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17324 0))(
  ( (Unit!17325) )
))
(declare-fun lt!252727 () Unit!17324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17324)

(assert (=> b!555906 (= lt!252727 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555907 () Bool)

(assert (=> b!555907 (= e!320343 e!320342)))

(declare-fun res!348315 () Bool)

(assert (=> b!555907 (=> (not res!348315) (not e!320342))))

(declare-fun lt!252724 () SeekEntryResult!5275)

(assert (=> b!555907 (= res!348315 (or (= lt!252724 (MissingZero!5275 i!1132)) (= lt!252724 (MissingVacant!5275 i!1132))))))

(assert (=> b!555907 (= lt!252724 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555908 () Bool)

(declare-fun res!348320 () Bool)

(assert (=> b!555908 (=> (not res!348320) (not e!320343))))

(assert (=> b!555908 (= res!348320 (and (= (size!17190 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17190 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17190 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50808 res!348313) b!555908))

(assert (= (and b!555908 res!348320) b!555901))

(assert (= (and b!555901 res!348318) b!555903))

(assert (= (and b!555903 res!348314) b!555905))

(assert (= (and b!555905 res!348312) b!555907))

(assert (= (and b!555907 res!348315) b!555902))

(assert (= (and b!555902 res!348317) b!555904))

(assert (= (and b!555904 res!348319) b!555900))

(assert (= (and b!555900 res!348316) b!555906))

(declare-fun m!533773 () Bool)

(assert (=> start!50808 m!533773))

(declare-fun m!533775 () Bool)

(assert (=> start!50808 m!533775))

(declare-fun m!533777 () Bool)

(assert (=> b!555902 m!533777))

(declare-fun m!533779 () Bool)

(assert (=> b!555906 m!533779))

(declare-fun m!533781 () Bool)

(assert (=> b!555906 m!533781))

(declare-fun m!533783 () Bool)

(assert (=> b!555906 m!533783))

(declare-fun m!533785 () Bool)

(assert (=> b!555906 m!533785))

(assert (=> b!555906 m!533781))

(declare-fun m!533787 () Bool)

(assert (=> b!555906 m!533787))

(assert (=> b!555900 m!533781))

(declare-fun m!533789 () Bool)

(assert (=> b!555900 m!533789))

(assert (=> b!555900 m!533781))

(declare-fun m!533791 () Bool)

(assert (=> b!555900 m!533791))

(declare-fun m!533793 () Bool)

(assert (=> b!555900 m!533793))

(assert (=> b!555900 m!533781))

(declare-fun m!533795 () Bool)

(assert (=> b!555900 m!533795))

(assert (=> b!555900 m!533791))

(declare-fun m!533797 () Bool)

(assert (=> b!555900 m!533797))

(assert (=> b!555900 m!533791))

(declare-fun m!533799 () Bool)

(assert (=> b!555900 m!533799))

(declare-fun m!533801 () Bool)

(assert (=> b!555904 m!533801))

(declare-fun m!533803 () Bool)

(assert (=> b!555907 m!533803))

(declare-fun m!533805 () Bool)

(assert (=> b!555903 m!533805))

(declare-fun m!533807 () Bool)

(assert (=> b!555905 m!533807))

(assert (=> b!555901 m!533781))

(assert (=> b!555901 m!533781))

(declare-fun m!533809 () Bool)

(assert (=> b!555901 m!533809))

(push 1)

