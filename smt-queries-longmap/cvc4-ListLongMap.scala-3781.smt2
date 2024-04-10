; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51744 () Bool)

(assert start!51744)

(declare-fun b!566154 () Bool)

(declare-fun e!325847 () Bool)

(assert (=> b!566154 (= e!325847 (not true))))

(declare-fun e!325845 () Bool)

(assert (=> b!566154 e!325845))

(declare-fun res!357128 () Bool)

(assert (=> b!566154 (=> (not res!357128) (not e!325845))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35552 0))(
  ( (array!35553 (arr!17075 (Array (_ BitVec 32) (_ BitVec 64))) (size!17439 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35552)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35552 (_ BitVec 32)) Bool)

(assert (=> b!566154 (= res!357128 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17750 0))(
  ( (Unit!17751) )
))
(declare-fun lt!258031 () Unit!17750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17750)

(assert (=> b!566154 (= lt!258031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566155 () Bool)

(declare-fun res!357122 () Bool)

(assert (=> b!566155 (=> (not res!357122) (not e!325847))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5524 0))(
  ( (MissingZero!5524 (index!24323 (_ BitVec 32))) (Found!5524 (index!24324 (_ BitVec 32))) (Intermediate!5524 (undefined!6336 Bool) (index!24325 (_ BitVec 32)) (x!53185 (_ BitVec 32))) (Undefined!5524) (MissingVacant!5524 (index!24326 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35552 (_ BitVec 32)) SeekEntryResult!5524)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566155 (= res!357122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17075 a!3118) j!142) mask!3119) (select (arr!17075 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17075 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17075 a!3118) i!1132 k!1914) j!142) (array!35553 (store (arr!17075 a!3118) i!1132 k!1914) (size!17439 a!3118)) mask!3119)))))

(declare-fun b!566156 () Bool)

(declare-fun res!357127 () Bool)

(declare-fun e!325846 () Bool)

(assert (=> b!566156 (=> (not res!357127) (not e!325846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566156 (= res!357127 (validKeyInArray!0 k!1914))))

(declare-fun b!566157 () Bool)

(declare-fun res!357123 () Bool)

(assert (=> b!566157 (=> (not res!357123) (not e!325846))))

(assert (=> b!566157 (= res!357123 (validKeyInArray!0 (select (arr!17075 a!3118) j!142)))))

(declare-fun b!566158 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35552 (_ BitVec 32)) SeekEntryResult!5524)

(assert (=> b!566158 (= e!325845 (= (seekEntryOrOpen!0 (select (arr!17075 a!3118) j!142) a!3118 mask!3119) (Found!5524 j!142)))))

(declare-fun b!566159 () Bool)

(assert (=> b!566159 (= e!325846 e!325847)))

(declare-fun res!357125 () Bool)

(assert (=> b!566159 (=> (not res!357125) (not e!325847))))

(declare-fun lt!258030 () SeekEntryResult!5524)

(assert (=> b!566159 (= res!357125 (or (= lt!258030 (MissingZero!5524 i!1132)) (= lt!258030 (MissingVacant!5524 i!1132))))))

(assert (=> b!566159 (= lt!258030 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!566160 () Bool)

(declare-fun res!357129 () Bool)

(assert (=> b!566160 (=> (not res!357129) (not e!325846))))

(declare-fun arrayContainsKey!0 (array!35552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566160 (= res!357129 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566161 () Bool)

(declare-fun res!357131 () Bool)

(assert (=> b!566161 (=> (not res!357131) (not e!325847))))

(declare-datatypes ((List!11155 0))(
  ( (Nil!11152) (Cons!11151 (h!12157 (_ BitVec 64)) (t!17383 List!11155)) )
))
(declare-fun arrayNoDuplicates!0 (array!35552 (_ BitVec 32) List!11155) Bool)

(assert (=> b!566161 (= res!357131 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11152))))

(declare-fun b!566162 () Bool)

(declare-fun res!357126 () Bool)

(assert (=> b!566162 (=> (not res!357126) (not e!325846))))

(assert (=> b!566162 (= res!357126 (and (= (size!17439 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17439 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17439 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566153 () Bool)

(declare-fun res!357130 () Bool)

(assert (=> b!566153 (=> (not res!357130) (not e!325847))))

(assert (=> b!566153 (= res!357130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!357124 () Bool)

(assert (=> start!51744 (=> (not res!357124) (not e!325846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51744 (= res!357124 (validMask!0 mask!3119))))

(assert (=> start!51744 e!325846))

(assert (=> start!51744 true))

(declare-fun array_inv!12871 (array!35552) Bool)

(assert (=> start!51744 (array_inv!12871 a!3118)))

(assert (= (and start!51744 res!357124) b!566162))

(assert (= (and b!566162 res!357126) b!566157))

(assert (= (and b!566157 res!357123) b!566156))

(assert (= (and b!566156 res!357127) b!566160))

(assert (= (and b!566160 res!357129) b!566159))

(assert (= (and b!566159 res!357125) b!566153))

(assert (= (and b!566153 res!357130) b!566161))

(assert (= (and b!566161 res!357131) b!566155))

(assert (= (and b!566155 res!357122) b!566154))

(assert (= (and b!566154 res!357128) b!566158))

(declare-fun m!544755 () Bool)

(assert (=> b!566155 m!544755))

(declare-fun m!544757 () Bool)

(assert (=> b!566155 m!544757))

(assert (=> b!566155 m!544755))

(declare-fun m!544759 () Bool)

(assert (=> b!566155 m!544759))

(declare-fun m!544761 () Bool)

(assert (=> b!566155 m!544761))

(assert (=> b!566155 m!544759))

(declare-fun m!544763 () Bool)

(assert (=> b!566155 m!544763))

(assert (=> b!566155 m!544757))

(assert (=> b!566155 m!544755))

(declare-fun m!544765 () Bool)

(assert (=> b!566155 m!544765))

(declare-fun m!544767 () Bool)

(assert (=> b!566155 m!544767))

(assert (=> b!566155 m!544759))

(assert (=> b!566155 m!544761))

(assert (=> b!566158 m!544755))

(assert (=> b!566158 m!544755))

(declare-fun m!544769 () Bool)

(assert (=> b!566158 m!544769))

(declare-fun m!544771 () Bool)

(assert (=> b!566160 m!544771))

(assert (=> b!566157 m!544755))

(assert (=> b!566157 m!544755))

(declare-fun m!544773 () Bool)

(assert (=> b!566157 m!544773))

(declare-fun m!544775 () Bool)

(assert (=> b!566156 m!544775))

(declare-fun m!544777 () Bool)

(assert (=> b!566153 m!544777))

(declare-fun m!544779 () Bool)

(assert (=> b!566159 m!544779))

(declare-fun m!544781 () Bool)

(assert (=> start!51744 m!544781))

(declare-fun m!544783 () Bool)

(assert (=> start!51744 m!544783))

(declare-fun m!544785 () Bool)

(assert (=> b!566154 m!544785))

(declare-fun m!544787 () Bool)

(assert (=> b!566154 m!544787))

(declare-fun m!544789 () Bool)

(assert (=> b!566161 m!544789))

(push 1)

