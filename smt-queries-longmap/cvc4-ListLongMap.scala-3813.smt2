; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52302 () Bool)

(assert start!52302)

(declare-fun b!570787 () Bool)

(declare-fun res!360571 () Bool)

(declare-fun e!328275 () Bool)

(assert (=> b!570787 (=> (not res!360571) (not e!328275))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35762 0))(
  ( (array!35763 (arr!17171 (Array (_ BitVec 32) (_ BitVec 64))) (size!17535 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35762)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570787 (= res!360571 (and (= (size!17535 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17535 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17535 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570788 () Bool)

(declare-fun e!328278 () Bool)

(assert (=> b!570788 (= e!328275 e!328278)))

(declare-fun res!360578 () Bool)

(assert (=> b!570788 (=> (not res!360578) (not e!328278))))

(declare-datatypes ((SeekEntryResult!5620 0))(
  ( (MissingZero!5620 (index!24707 (_ BitVec 32))) (Found!5620 (index!24708 (_ BitVec 32))) (Intermediate!5620 (undefined!6432 Bool) (index!24709 (_ BitVec 32)) (x!53576 (_ BitVec 32))) (Undefined!5620) (MissingVacant!5620 (index!24710 (_ BitVec 32))) )
))
(declare-fun lt!260227 () SeekEntryResult!5620)

(assert (=> b!570788 (= res!360578 (or (= lt!260227 (MissingZero!5620 i!1132)) (= lt!260227 (MissingVacant!5620 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35762 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!570788 (= lt!260227 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570789 () Bool)

(declare-fun res!360573 () Bool)

(assert (=> b!570789 (=> (not res!360573) (not e!328275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570789 (= res!360573 (validKeyInArray!0 k!1914))))

(declare-fun b!570790 () Bool)

(declare-fun res!360568 () Bool)

(assert (=> b!570790 (=> (not res!360568) (not e!328278))))

(declare-datatypes ((List!11251 0))(
  ( (Nil!11248) (Cons!11247 (h!12271 (_ BitVec 64)) (t!17479 List!11251)) )
))
(declare-fun arrayNoDuplicates!0 (array!35762 (_ BitVec 32) List!11251) Bool)

(assert (=> b!570790 (= res!360568 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11248))))

(declare-fun lt!260223 () SeekEntryResult!5620)

(declare-fun lt!260226 () SeekEntryResult!5620)

(declare-fun e!328273 () Bool)

(declare-fun b!570791 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35762 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!570791 (= e!328273 (= lt!260226 (seekKeyOrZeroReturnVacant!0 (x!53576 lt!260223) (index!24709 lt!260223) (index!24709 lt!260223) (select (arr!17171 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570793 () Bool)

(declare-fun res!360576 () Bool)

(assert (=> b!570793 (=> (not res!360576) (not e!328275))))

(assert (=> b!570793 (= res!360576 (validKeyInArray!0 (select (arr!17171 a!3118) j!142)))))

(declare-fun b!570794 () Bool)

(declare-fun res!360569 () Bool)

(assert (=> b!570794 (=> (not res!360569) (not e!328275))))

(declare-fun arrayContainsKey!0 (array!35762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570794 (= res!360569 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570795 () Bool)

(declare-fun res!360572 () Bool)

(assert (=> b!570795 (=> (not res!360572) (not e!328278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35762 (_ BitVec 32)) Bool)

(assert (=> b!570795 (= res!360572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570796 () Bool)

(declare-fun e!328274 () Bool)

(assert (=> b!570796 (= e!328278 e!328274)))

(declare-fun res!360575 () Bool)

(assert (=> b!570796 (=> (not res!360575) (not e!328274))))

(declare-fun lt!260224 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35762 (_ BitVec 32)) SeekEntryResult!5620)

(assert (=> b!570796 (= res!360575 (= lt!260223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260224 (select (store (arr!17171 a!3118) i!1132 k!1914) j!142) (array!35763 (store (arr!17171 a!3118) i!1132 k!1914) (size!17535 a!3118)) mask!3119)))))

(declare-fun lt!260225 () (_ BitVec 32))

(assert (=> b!570796 (= lt!260223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260225 (select (arr!17171 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570796 (= lt!260224 (toIndex!0 (select (store (arr!17171 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570796 (= lt!260225 (toIndex!0 (select (arr!17171 a!3118) j!142) mask!3119))))

(declare-fun b!570797 () Bool)

(declare-fun e!328277 () Bool)

(assert (=> b!570797 (= e!328277 e!328273)))

(declare-fun res!360574 () Bool)

(assert (=> b!570797 (=> res!360574 e!328273)))

(assert (=> b!570797 (= res!360574 (or (undefined!6432 lt!260223) (not (is-Intermediate!5620 lt!260223)) (= (select (arr!17171 a!3118) (index!24709 lt!260223)) (select (arr!17171 a!3118) j!142)) (= (select (arr!17171 a!3118) (index!24709 lt!260223)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!360570 () Bool)

(assert (=> start!52302 (=> (not res!360570) (not e!328275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52302 (= res!360570 (validMask!0 mask!3119))))

(assert (=> start!52302 e!328275))

(assert (=> start!52302 true))

(declare-fun array_inv!12967 (array!35762) Bool)

(assert (=> start!52302 (array_inv!12967 a!3118)))

(declare-fun b!570792 () Bool)

(assert (=> b!570792 (= e!328274 (not true))))

(assert (=> b!570792 e!328277))

(declare-fun res!360577 () Bool)

(assert (=> b!570792 (=> (not res!360577) (not e!328277))))

(assert (=> b!570792 (= res!360577 (= lt!260226 (Found!5620 j!142)))))

(assert (=> b!570792 (= lt!260226 (seekEntryOrOpen!0 (select (arr!17171 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570792 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17942 0))(
  ( (Unit!17943) )
))
(declare-fun lt!260222 () Unit!17942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17942)

(assert (=> b!570792 (= lt!260222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52302 res!360570) b!570787))

(assert (= (and b!570787 res!360571) b!570793))

(assert (= (and b!570793 res!360576) b!570789))

(assert (= (and b!570789 res!360573) b!570794))

(assert (= (and b!570794 res!360569) b!570788))

(assert (= (and b!570788 res!360578) b!570795))

(assert (= (and b!570795 res!360572) b!570790))

(assert (= (and b!570790 res!360568) b!570796))

(assert (= (and b!570796 res!360575) b!570792))

(assert (= (and b!570792 res!360577) b!570797))

(assert (= (and b!570797 (not res!360574)) b!570791))

(declare-fun m!549689 () Bool)

(assert (=> b!570791 m!549689))

(assert (=> b!570791 m!549689))

(declare-fun m!549691 () Bool)

(assert (=> b!570791 m!549691))

(assert (=> b!570793 m!549689))

(assert (=> b!570793 m!549689))

(declare-fun m!549693 () Bool)

(assert (=> b!570793 m!549693))

(assert (=> b!570792 m!549689))

(assert (=> b!570792 m!549689))

(declare-fun m!549695 () Bool)

(assert (=> b!570792 m!549695))

(declare-fun m!549697 () Bool)

(assert (=> b!570792 m!549697))

(declare-fun m!549699 () Bool)

(assert (=> b!570792 m!549699))

(declare-fun m!549701 () Bool)

(assert (=> b!570794 m!549701))

(declare-fun m!549703 () Bool)

(assert (=> b!570788 m!549703))

(assert (=> b!570796 m!549689))

(declare-fun m!549705 () Bool)

(assert (=> b!570796 m!549705))

(declare-fun m!549707 () Bool)

(assert (=> b!570796 m!549707))

(declare-fun m!549709 () Bool)

(assert (=> b!570796 m!549709))

(assert (=> b!570796 m!549689))

(assert (=> b!570796 m!549707))

(assert (=> b!570796 m!549689))

(declare-fun m!549711 () Bool)

(assert (=> b!570796 m!549711))

(declare-fun m!549713 () Bool)

(assert (=> b!570796 m!549713))

(assert (=> b!570796 m!549707))

(declare-fun m!549715 () Bool)

(assert (=> b!570796 m!549715))

(declare-fun m!549717 () Bool)

(assert (=> b!570789 m!549717))

(declare-fun m!549719 () Bool)

(assert (=> b!570795 m!549719))

(declare-fun m!549721 () Bool)

(assert (=> b!570790 m!549721))

(declare-fun m!549723 () Bool)

(assert (=> start!52302 m!549723))

(declare-fun m!549725 () Bool)

(assert (=> start!52302 m!549725))

(declare-fun m!549727 () Bool)

(assert (=> b!570797 m!549727))

(assert (=> b!570797 m!549689))

(push 1)

