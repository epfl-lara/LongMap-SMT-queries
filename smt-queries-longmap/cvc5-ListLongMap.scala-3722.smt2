; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51326 () Bool)

(assert start!51326)

(declare-fun b!560041 () Bool)

(declare-fun res!351202 () Bool)

(declare-fun e!322662 () Bool)

(assert (=> b!560041 (=> (not res!351202) (not e!322662))))

(declare-datatypes ((array!35191 0))(
  ( (array!35192 (arr!16896 (Array (_ BitVec 32) (_ BitVec 64))) (size!17260 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35191)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35191 (_ BitVec 32)) Bool)

(assert (=> b!560041 (= res!351202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560042 () Bool)

(declare-fun e!322658 () Bool)

(declare-fun e!322664 () Bool)

(assert (=> b!560042 (= e!322658 (not e!322664))))

(declare-fun res!351203 () Bool)

(assert (=> b!560042 (=> res!351203 e!322664)))

(declare-datatypes ((SeekEntryResult!5345 0))(
  ( (MissingZero!5345 (index!23607 (_ BitVec 32))) (Found!5345 (index!23608 (_ BitVec 32))) (Intermediate!5345 (undefined!6157 Bool) (index!23609 (_ BitVec 32)) (x!52528 (_ BitVec 32))) (Undefined!5345) (MissingVacant!5345 (index!23610 (_ BitVec 32))) )
))
(declare-fun lt!254554 () SeekEntryResult!5345)

(assert (=> b!560042 (= res!351203 (or (undefined!6157 lt!254554) (not (is-Intermediate!5345 lt!254554))))))

(declare-fun e!322665 () Bool)

(assert (=> b!560042 e!322665))

(declare-fun res!351200 () Bool)

(assert (=> b!560042 (=> (not res!351200) (not e!322665))))

(declare-fun lt!254546 () SeekEntryResult!5345)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560042 (= res!351200 (= lt!254546 (Found!5345 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35191 (_ BitVec 32)) SeekEntryResult!5345)

(assert (=> b!560042 (= lt!254546 (seekEntryOrOpen!0 (select (arr!16896 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560042 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17464 0))(
  ( (Unit!17465) )
))
(declare-fun lt!254547 () Unit!17464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17464)

(assert (=> b!560042 (= lt!254547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560043 () Bool)

(declare-fun e!322661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35191 (_ BitVec 32)) SeekEntryResult!5345)

(assert (=> b!560043 (= e!322661 (= lt!254546 (seekKeyOrZeroReturnVacant!0 (x!52528 lt!254554) (index!23609 lt!254554) (index!23609 lt!254554) (select (arr!16896 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!351206 () Bool)

(declare-fun e!322657 () Bool)

(assert (=> start!51326 (=> (not res!351206) (not e!322657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51326 (= res!351206 (validMask!0 mask!3119))))

(assert (=> start!51326 e!322657))

(assert (=> start!51326 true))

(declare-fun array_inv!12692 (array!35191) Bool)

(assert (=> start!51326 (array_inv!12692 a!3118)))

(declare-fun b!560044 () Bool)

(declare-fun res!351194 () Bool)

(assert (=> b!560044 (=> (not res!351194) (not e!322657))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560044 (= res!351194 (validKeyInArray!0 k!1914))))

(declare-fun b!560045 () Bool)

(assert (=> b!560045 (= e!322657 e!322662)))

(declare-fun res!351195 () Bool)

(assert (=> b!560045 (=> (not res!351195) (not e!322662))))

(declare-fun lt!254551 () SeekEntryResult!5345)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560045 (= res!351195 (or (= lt!254551 (MissingZero!5345 i!1132)) (= lt!254551 (MissingVacant!5345 i!1132))))))

(assert (=> b!560045 (= lt!254551 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560046 () Bool)

(declare-fun res!351193 () Bool)

(assert (=> b!560046 (=> (not res!351193) (not e!322657))))

(declare-fun arrayContainsKey!0 (array!35191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560046 (= res!351193 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560047 () Bool)

(declare-fun res!351205 () Bool)

(assert (=> b!560047 (=> (not res!351205) (not e!322662))))

(declare-datatypes ((List!10976 0))(
  ( (Nil!10973) (Cons!10972 (h!11975 (_ BitVec 64)) (t!17204 List!10976)) )
))
(declare-fun arrayNoDuplicates!0 (array!35191 (_ BitVec 32) List!10976) Bool)

(assert (=> b!560047 (= res!351205 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10973))))

(declare-fun b!560048 () Bool)

(declare-fun e!322663 () Bool)

(declare-fun lt!254553 () (_ BitVec 64))

(assert (=> b!560048 (= e!322663 (validKeyInArray!0 lt!254553))))

(declare-fun b!560049 () Bool)

(declare-fun res!351197 () Bool)

(assert (=> b!560049 (=> (not res!351197) (not e!322657))))

(assert (=> b!560049 (= res!351197 (and (= (size!17260 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17260 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17260 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560050 () Bool)

(assert (=> b!560050 (= e!322662 e!322658)))

(declare-fun res!351199 () Bool)

(assert (=> b!560050 (=> (not res!351199) (not e!322658))))

(declare-fun lt!254549 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35191 (_ BitVec 32)) SeekEntryResult!5345)

(assert (=> b!560050 (= res!351199 (= lt!254554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254549 lt!254553 (array!35192 (store (arr!16896 a!3118) i!1132 k!1914) (size!17260 a!3118)) mask!3119)))))

(declare-fun lt!254550 () (_ BitVec 32))

(assert (=> b!560050 (= lt!254554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254550 (select (arr!16896 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560050 (= lt!254549 (toIndex!0 lt!254553 mask!3119))))

(assert (=> b!560050 (= lt!254553 (select (store (arr!16896 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560050 (= lt!254550 (toIndex!0 (select (arr!16896 a!3118) j!142) mask!3119))))

(declare-fun b!560051 () Bool)

(declare-fun res!351198 () Bool)

(assert (=> b!560051 (=> (not res!351198) (not e!322657))))

(assert (=> b!560051 (= res!351198 (validKeyInArray!0 (select (arr!16896 a!3118) j!142)))))

(declare-fun b!560052 () Bool)

(declare-fun e!322660 () Bool)

(assert (=> b!560052 (= e!322660 e!322661)))

(declare-fun res!351201 () Bool)

(assert (=> b!560052 (=> res!351201 e!322661)))

(declare-fun lt!254552 () (_ BitVec 64))

(assert (=> b!560052 (= res!351201 (or (= lt!254552 (select (arr!16896 a!3118) j!142)) (= lt!254552 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560052 (= lt!254552 (select (arr!16896 a!3118) (index!23609 lt!254554)))))

(declare-fun b!560053 () Bool)

(assert (=> b!560053 (= e!322665 e!322660)))

(declare-fun res!351204 () Bool)

(assert (=> b!560053 (=> res!351204 e!322660)))

(assert (=> b!560053 (= res!351204 (or (undefined!6157 lt!254554) (not (is-Intermediate!5345 lt!254554))))))

(declare-fun b!560054 () Bool)

(assert (=> b!560054 (= e!322664 e!322663)))

(declare-fun res!351196 () Bool)

(assert (=> b!560054 (=> res!351196 e!322663)))

(declare-fun lt!254548 () (_ BitVec 64))

(assert (=> b!560054 (= res!351196 (or (= lt!254548 (select (arr!16896 a!3118) j!142)) (= lt!254548 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23609 lt!254554) #b00000000000000000000000000000000) (bvsge (index!23609 lt!254554) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52528 lt!254554) #b01111111111111111111111111111110) (bvslt (x!52528 lt!254554) #b00000000000000000000000000000000) (not (= (select (store (arr!16896 a!3118) i!1132 k!1914) (index!23609 lt!254554)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!560054 (= lt!254548 (select (arr!16896 a!3118) (index!23609 lt!254554)))))

(assert (= (and start!51326 res!351206) b!560049))

(assert (= (and b!560049 res!351197) b!560051))

(assert (= (and b!560051 res!351198) b!560044))

(assert (= (and b!560044 res!351194) b!560046))

(assert (= (and b!560046 res!351193) b!560045))

(assert (= (and b!560045 res!351195) b!560041))

(assert (= (and b!560041 res!351202) b!560047))

(assert (= (and b!560047 res!351205) b!560050))

(assert (= (and b!560050 res!351199) b!560042))

(assert (= (and b!560042 res!351200) b!560053))

(assert (= (and b!560053 (not res!351204)) b!560052))

(assert (= (and b!560052 (not res!351201)) b!560043))

(assert (= (and b!560042 (not res!351203)) b!560054))

(assert (= (and b!560054 (not res!351196)) b!560048))

(declare-fun m!537765 () Bool)

(assert (=> b!560041 m!537765))

(declare-fun m!537767 () Bool)

(assert (=> b!560048 m!537767))

(declare-fun m!537769 () Bool)

(assert (=> b!560052 m!537769))

(declare-fun m!537771 () Bool)

(assert (=> b!560052 m!537771))

(declare-fun m!537773 () Bool)

(assert (=> b!560045 m!537773))

(declare-fun m!537775 () Bool)

(assert (=> b!560046 m!537775))

(assert (=> b!560051 m!537769))

(assert (=> b!560051 m!537769))

(declare-fun m!537777 () Bool)

(assert (=> b!560051 m!537777))

(declare-fun m!537779 () Bool)

(assert (=> b!560044 m!537779))

(declare-fun m!537781 () Bool)

(assert (=> start!51326 m!537781))

(declare-fun m!537783 () Bool)

(assert (=> start!51326 m!537783))

(assert (=> b!560054 m!537769))

(declare-fun m!537785 () Bool)

(assert (=> b!560054 m!537785))

(declare-fun m!537787 () Bool)

(assert (=> b!560054 m!537787))

(assert (=> b!560054 m!537771))

(assert (=> b!560050 m!537769))

(declare-fun m!537789 () Bool)

(assert (=> b!560050 m!537789))

(declare-fun m!537791 () Bool)

(assert (=> b!560050 m!537791))

(assert (=> b!560050 m!537769))

(assert (=> b!560050 m!537785))

(assert (=> b!560050 m!537769))

(declare-fun m!537793 () Bool)

(assert (=> b!560050 m!537793))

(declare-fun m!537795 () Bool)

(assert (=> b!560050 m!537795))

(declare-fun m!537797 () Bool)

(assert (=> b!560050 m!537797))

(declare-fun m!537799 () Bool)

(assert (=> b!560047 m!537799))

(assert (=> b!560042 m!537769))

(assert (=> b!560042 m!537769))

(declare-fun m!537801 () Bool)

(assert (=> b!560042 m!537801))

(declare-fun m!537803 () Bool)

(assert (=> b!560042 m!537803))

(declare-fun m!537805 () Bool)

(assert (=> b!560042 m!537805))

(assert (=> b!560043 m!537769))

(assert (=> b!560043 m!537769))

(declare-fun m!537807 () Bool)

(assert (=> b!560043 m!537807))

(push 1)

