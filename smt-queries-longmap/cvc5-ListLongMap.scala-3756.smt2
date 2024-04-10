; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51530 () Bool)

(assert start!51530)

(declare-fun b!563795 () Bool)

(declare-fun res!354948 () Bool)

(declare-fun e!324846 () Bool)

(assert (=> b!563795 (=> (not res!354948) (not e!324846))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563795 (= res!354948 (validKeyInArray!0 k!1914))))

(declare-fun b!563796 () Bool)

(declare-fun res!354950 () Bool)

(assert (=> b!563796 (=> (not res!354950) (not e!324846))))

(declare-datatypes ((array!35395 0))(
  ( (array!35396 (arr!16998 (Array (_ BitVec 32) (_ BitVec 64))) (size!17362 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35395)

(declare-fun arrayContainsKey!0 (array!35395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563796 (= res!354950 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563797 () Bool)

(declare-fun res!354955 () Bool)

(declare-fun e!324844 () Bool)

(assert (=> b!563797 (=> (not res!354955) (not e!324844))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5447 0))(
  ( (MissingZero!5447 (index!24015 (_ BitVec 32))) (Found!5447 (index!24016 (_ BitVec 32))) (Intermediate!5447 (undefined!6259 Bool) (index!24017 (_ BitVec 32)) (x!52902 (_ BitVec 32))) (Undefined!5447) (MissingVacant!5447 (index!24018 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35395 (_ BitVec 32)) SeekEntryResult!5447)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563797 (= res!354955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16998 a!3118) j!142) mask!3119) (select (arr!16998 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16998 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16998 a!3118) i!1132 k!1914) j!142) (array!35396 (store (arr!16998 a!3118) i!1132 k!1914) (size!17362 a!3118)) mask!3119)))))

(declare-fun b!563798 () Bool)

(assert (=> b!563798 (= e!324844 (not true))))

(declare-fun e!324843 () Bool)

(assert (=> b!563798 e!324843))

(declare-fun res!354949 () Bool)

(assert (=> b!563798 (=> (not res!354949) (not e!324843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35395 (_ BitVec 32)) Bool)

(assert (=> b!563798 (= res!354949 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17668 0))(
  ( (Unit!17669) )
))
(declare-fun lt!257341 () Unit!17668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17668)

(assert (=> b!563798 (= lt!257341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563799 () Bool)

(declare-fun res!354951 () Bool)

(assert (=> b!563799 (=> (not res!354951) (not e!324846))))

(assert (=> b!563799 (= res!354951 (validKeyInArray!0 (select (arr!16998 a!3118) j!142)))))

(declare-fun b!563800 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35395 (_ BitVec 32)) SeekEntryResult!5447)

(assert (=> b!563800 (= e!324843 (= (seekEntryOrOpen!0 (select (arr!16998 a!3118) j!142) a!3118 mask!3119) (Found!5447 j!142)))))

(declare-fun res!354953 () Bool)

(assert (=> start!51530 (=> (not res!354953) (not e!324846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51530 (= res!354953 (validMask!0 mask!3119))))

(assert (=> start!51530 e!324846))

(assert (=> start!51530 true))

(declare-fun array_inv!12794 (array!35395) Bool)

(assert (=> start!51530 (array_inv!12794 a!3118)))

(declare-fun b!563801 () Bool)

(assert (=> b!563801 (= e!324846 e!324844)))

(declare-fun res!354956 () Bool)

(assert (=> b!563801 (=> (not res!354956) (not e!324844))))

(declare-fun lt!257340 () SeekEntryResult!5447)

(assert (=> b!563801 (= res!354956 (or (= lt!257340 (MissingZero!5447 i!1132)) (= lt!257340 (MissingVacant!5447 i!1132))))))

(assert (=> b!563801 (= lt!257340 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563802 () Bool)

(declare-fun res!354952 () Bool)

(assert (=> b!563802 (=> (not res!354952) (not e!324844))))

(declare-datatypes ((List!11078 0))(
  ( (Nil!11075) (Cons!11074 (h!12077 (_ BitVec 64)) (t!17306 List!11078)) )
))
(declare-fun arrayNoDuplicates!0 (array!35395 (_ BitVec 32) List!11078) Bool)

(assert (=> b!563802 (= res!354952 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11075))))

(declare-fun b!563803 () Bool)

(declare-fun res!354954 () Bool)

(assert (=> b!563803 (=> (not res!354954) (not e!324844))))

(assert (=> b!563803 (= res!354954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563804 () Bool)

(declare-fun res!354947 () Bool)

(assert (=> b!563804 (=> (not res!354947) (not e!324846))))

(assert (=> b!563804 (= res!354947 (and (= (size!17362 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17362 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17362 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51530 res!354953) b!563804))

(assert (= (and b!563804 res!354947) b!563799))

(assert (= (and b!563799 res!354951) b!563795))

(assert (= (and b!563795 res!354948) b!563796))

(assert (= (and b!563796 res!354950) b!563801))

(assert (= (and b!563801 res!354956) b!563803))

(assert (= (and b!563803 res!354954) b!563802))

(assert (= (and b!563802 res!354952) b!563797))

(assert (= (and b!563797 res!354955) b!563798))

(assert (= (and b!563798 res!354949) b!563800))

(declare-fun m!542211 () Bool)

(assert (=> b!563796 m!542211))

(declare-fun m!542213 () Bool)

(assert (=> b!563801 m!542213))

(declare-fun m!542215 () Bool)

(assert (=> b!563798 m!542215))

(declare-fun m!542217 () Bool)

(assert (=> b!563798 m!542217))

(declare-fun m!542219 () Bool)

(assert (=> b!563795 m!542219))

(declare-fun m!542221 () Bool)

(assert (=> b!563800 m!542221))

(assert (=> b!563800 m!542221))

(declare-fun m!542223 () Bool)

(assert (=> b!563800 m!542223))

(declare-fun m!542225 () Bool)

(assert (=> start!51530 m!542225))

(declare-fun m!542227 () Bool)

(assert (=> start!51530 m!542227))

(declare-fun m!542229 () Bool)

(assert (=> b!563802 m!542229))

(declare-fun m!542231 () Bool)

(assert (=> b!563803 m!542231))

(assert (=> b!563797 m!542221))

(declare-fun m!542233 () Bool)

(assert (=> b!563797 m!542233))

(assert (=> b!563797 m!542221))

(declare-fun m!542235 () Bool)

(assert (=> b!563797 m!542235))

(declare-fun m!542237 () Bool)

(assert (=> b!563797 m!542237))

(assert (=> b!563797 m!542235))

(declare-fun m!542239 () Bool)

(assert (=> b!563797 m!542239))

(assert (=> b!563797 m!542233))

(assert (=> b!563797 m!542221))

(declare-fun m!542241 () Bool)

(assert (=> b!563797 m!542241))

(declare-fun m!542243 () Bool)

(assert (=> b!563797 m!542243))

(assert (=> b!563797 m!542235))

(assert (=> b!563797 m!542237))

(assert (=> b!563799 m!542221))

(assert (=> b!563799 m!542221))

(declare-fun m!542245 () Bool)

(assert (=> b!563799 m!542245))

(push 1)

