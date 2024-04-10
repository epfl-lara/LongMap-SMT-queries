; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51608 () Bool)

(assert start!51608)

(declare-fun b!564765 () Bool)

(declare-fun e!325237 () Bool)

(declare-datatypes ((array!35473 0))(
  ( (array!35474 (arr!17037 (Array (_ BitVec 32) (_ BitVec 64))) (size!17401 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35473)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564765 (= e!325237 (and (bvsle #b00000000000000000000000000000000 (size!17401 a!3118)) (bvsgt j!142 (size!17401 a!3118))))))

(declare-fun b!564766 () Bool)

(declare-fun res!355920 () Bool)

(assert (=> b!564766 (=> (not res!355920) (not e!325237))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5486 0))(
  ( (MissingZero!5486 (index!24171 (_ BitVec 32))) (Found!5486 (index!24172 (_ BitVec 32))) (Intermediate!5486 (undefined!6298 Bool) (index!24173 (_ BitVec 32)) (x!53045 (_ BitVec 32))) (Undefined!5486) (MissingVacant!5486 (index!24174 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35473 (_ BitVec 32)) SeekEntryResult!5486)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564766 (= res!355920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17037 a!3118) j!142) mask!3119) (select (arr!17037 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17037 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17037 a!3118) i!1132 k!1914) j!142) (array!35474 (store (arr!17037 a!3118) i!1132 k!1914) (size!17401 a!3118)) mask!3119)))))

(declare-fun b!564767 () Bool)

(declare-fun res!355919 () Bool)

(declare-fun e!325238 () Bool)

(assert (=> b!564767 (=> (not res!355919) (not e!325238))))

(assert (=> b!564767 (= res!355919 (and (= (size!17401 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17401 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17401 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564768 () Bool)

(assert (=> b!564768 (= e!325238 e!325237)))

(declare-fun res!355925 () Bool)

(assert (=> b!564768 (=> (not res!355925) (not e!325237))))

(declare-fun lt!257653 () SeekEntryResult!5486)

(assert (=> b!564768 (= res!355925 (or (= lt!257653 (MissingZero!5486 i!1132)) (= lt!257653 (MissingVacant!5486 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35473 (_ BitVec 32)) SeekEntryResult!5486)

(assert (=> b!564768 (= lt!257653 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564769 () Bool)

(declare-fun res!355917 () Bool)

(assert (=> b!564769 (=> (not res!355917) (not e!325237))))

(declare-datatypes ((List!11117 0))(
  ( (Nil!11114) (Cons!11113 (h!12116 (_ BitVec 64)) (t!17345 List!11117)) )
))
(declare-fun arrayNoDuplicates!0 (array!35473 (_ BitVec 32) List!11117) Bool)

(assert (=> b!564769 (= res!355917 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11114))))

(declare-fun b!564770 () Bool)

(declare-fun res!355918 () Bool)

(assert (=> b!564770 (=> (not res!355918) (not e!325238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564770 (= res!355918 (validKeyInArray!0 (select (arr!17037 a!3118) j!142)))))

(declare-fun b!564771 () Bool)

(declare-fun res!355922 () Bool)

(assert (=> b!564771 (=> (not res!355922) (not e!325238))))

(assert (=> b!564771 (= res!355922 (validKeyInArray!0 k!1914))))

(declare-fun b!564773 () Bool)

(declare-fun res!355923 () Bool)

(assert (=> b!564773 (=> (not res!355923) (not e!325237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35473 (_ BitVec 32)) Bool)

(assert (=> b!564773 (= res!355923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564772 () Bool)

(declare-fun res!355924 () Bool)

(assert (=> b!564772 (=> (not res!355924) (not e!325238))))

(declare-fun arrayContainsKey!0 (array!35473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564772 (= res!355924 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!355921 () Bool)

(assert (=> start!51608 (=> (not res!355921) (not e!325238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51608 (= res!355921 (validMask!0 mask!3119))))

(assert (=> start!51608 e!325238))

(assert (=> start!51608 true))

(declare-fun array_inv!12833 (array!35473) Bool)

(assert (=> start!51608 (array_inv!12833 a!3118)))

(assert (= (and start!51608 res!355921) b!564767))

(assert (= (and b!564767 res!355919) b!564770))

(assert (= (and b!564770 res!355918) b!564771))

(assert (= (and b!564771 res!355922) b!564772))

(assert (= (and b!564772 res!355924) b!564768))

(assert (= (and b!564768 res!355925) b!564773))

(assert (= (and b!564773 res!355923) b!564769))

(assert (= (and b!564769 res!355917) b!564766))

(assert (= (and b!564766 res!355920) b!564765))

(declare-fun m!543231 () Bool)

(assert (=> b!564770 m!543231))

(assert (=> b!564770 m!543231))

(declare-fun m!543233 () Bool)

(assert (=> b!564770 m!543233))

(declare-fun m!543235 () Bool)

(assert (=> b!564768 m!543235))

(declare-fun m!543237 () Bool)

(assert (=> b!564772 m!543237))

(declare-fun m!543239 () Bool)

(assert (=> start!51608 m!543239))

(declare-fun m!543241 () Bool)

(assert (=> start!51608 m!543241))

(declare-fun m!543243 () Bool)

(assert (=> b!564769 m!543243))

(assert (=> b!564766 m!543231))

(declare-fun m!543245 () Bool)

(assert (=> b!564766 m!543245))

(assert (=> b!564766 m!543231))

(declare-fun m!543247 () Bool)

(assert (=> b!564766 m!543247))

(declare-fun m!543249 () Bool)

(assert (=> b!564766 m!543249))

(assert (=> b!564766 m!543247))

(declare-fun m!543251 () Bool)

(assert (=> b!564766 m!543251))

(assert (=> b!564766 m!543245))

(assert (=> b!564766 m!543231))

(declare-fun m!543253 () Bool)

(assert (=> b!564766 m!543253))

(declare-fun m!543255 () Bool)

(assert (=> b!564766 m!543255))

(assert (=> b!564766 m!543247))

(assert (=> b!564766 m!543249))

(declare-fun m!543257 () Bool)

(assert (=> b!564771 m!543257))

(declare-fun m!543259 () Bool)

(assert (=> b!564773 m!543259))

(push 1)

(assert (not b!564768))

(assert (not b!564769))

(assert (not b!564773))

(assert (not b!564771))

(assert (not b!564772))

(assert (not b!564766))

(assert (not start!51608))

(assert (not b!564770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

