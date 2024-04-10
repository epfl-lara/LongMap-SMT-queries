; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50592 () Bool)

(assert start!50592)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!552794 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!318965 () Bool)

(declare-datatypes ((array!34817 0))(
  ( (array!34818 (arr!16718 (Array (_ BitVec 32) (_ BitVec 64))) (size!17082 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34817)

(declare-datatypes ((SeekEntryResult!5167 0))(
  ( (MissingZero!5167 (index!22895 (_ BitVec 32))) (Found!5167 (index!22896 (_ BitVec 32))) (Intermediate!5167 (undefined!5979 Bool) (index!22897 (_ BitVec 32)) (x!51825 (_ BitVec 32))) (Undefined!5167) (MissingVacant!5167 (index!22898 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34817 (_ BitVec 32)) SeekEntryResult!5167)

(assert (=> b!552794 (= e!318965 (= (seekEntryOrOpen!0 (select (arr!16718 a!3118) j!142) a!3118 mask!3119) (Found!5167 j!142)))))

(declare-fun b!552795 () Bool)

(declare-fun res!345211 () Bool)

(declare-fun e!318963 () Bool)

(assert (=> b!552795 (=> (not res!345211) (not e!318963))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552795 (= res!345211 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552796 () Bool)

(declare-fun res!345213 () Bool)

(assert (=> b!552796 (=> (not res!345213) (not e!318963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552796 (= res!345213 (validKeyInArray!0 (select (arr!16718 a!3118) j!142)))))

(declare-fun b!552797 () Bool)

(declare-fun res!345210 () Bool)

(declare-fun e!318964 () Bool)

(assert (=> b!552797 (=> (not res!345210) (not e!318964))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34817 (_ BitVec 32)) SeekEntryResult!5167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552797 (= res!345210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16718 a!3118) j!142) mask!3119) (select (arr!16718 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16718 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16718 a!3118) i!1132 k!1914) j!142) (array!34818 (store (arr!16718 a!3118) i!1132 k!1914) (size!17082 a!3118)) mask!3119)))))

(declare-fun res!345207 () Bool)

(assert (=> start!50592 (=> (not res!345207) (not e!318963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50592 (= res!345207 (validMask!0 mask!3119))))

(assert (=> start!50592 e!318963))

(assert (=> start!50592 true))

(declare-fun array_inv!12514 (array!34817) Bool)

(assert (=> start!50592 (array_inv!12514 a!3118)))

(declare-fun b!552798 () Bool)

(declare-fun res!345208 () Bool)

(assert (=> b!552798 (=> (not res!345208) (not e!318964))))

(declare-datatypes ((List!10798 0))(
  ( (Nil!10795) (Cons!10794 (h!11779 (_ BitVec 64)) (t!17026 List!10798)) )
))
(declare-fun arrayNoDuplicates!0 (array!34817 (_ BitVec 32) List!10798) Bool)

(assert (=> b!552798 (= res!345208 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10795))))

(declare-fun b!552799 () Bool)

(declare-fun res!345209 () Bool)

(assert (=> b!552799 (=> (not res!345209) (not e!318964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34817 (_ BitVec 32)) Bool)

(assert (=> b!552799 (= res!345209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552800 () Bool)

(declare-fun res!345215 () Bool)

(assert (=> b!552800 (=> (not res!345215) (not e!318963))))

(assert (=> b!552800 (= res!345215 (and (= (size!17082 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17082 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17082 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552801 () Bool)

(assert (=> b!552801 (= e!318964 (not true))))

(assert (=> b!552801 e!318965))

(declare-fun res!345212 () Bool)

(assert (=> b!552801 (=> (not res!345212) (not e!318965))))

(assert (=> b!552801 (= res!345212 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17108 0))(
  ( (Unit!17109) )
))
(declare-fun lt!251278 () Unit!17108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17108)

(assert (=> b!552801 (= lt!251278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552802 () Bool)

(assert (=> b!552802 (= e!318963 e!318964)))

(declare-fun res!345206 () Bool)

(assert (=> b!552802 (=> (not res!345206) (not e!318964))))

(declare-fun lt!251277 () SeekEntryResult!5167)

(assert (=> b!552802 (= res!345206 (or (= lt!251277 (MissingZero!5167 i!1132)) (= lt!251277 (MissingVacant!5167 i!1132))))))

(assert (=> b!552802 (= lt!251277 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552803 () Bool)

(declare-fun res!345214 () Bool)

(assert (=> b!552803 (=> (not res!345214) (not e!318963))))

(assert (=> b!552803 (= res!345214 (validKeyInArray!0 k!1914))))

(assert (= (and start!50592 res!345207) b!552800))

(assert (= (and b!552800 res!345215) b!552796))

(assert (= (and b!552796 res!345213) b!552803))

(assert (= (and b!552803 res!345214) b!552795))

(assert (= (and b!552795 res!345211) b!552802))

(assert (= (and b!552802 res!345206) b!552799))

(assert (= (and b!552799 res!345209) b!552798))

(assert (= (and b!552798 res!345208) b!552797))

(assert (= (and b!552797 res!345210) b!552801))

(assert (= (and b!552801 res!345212) b!552794))

(declare-fun m!529749 () Bool)

(assert (=> b!552801 m!529749))

(declare-fun m!529751 () Bool)

(assert (=> b!552801 m!529751))

(declare-fun m!529753 () Bool)

(assert (=> b!552796 m!529753))

(assert (=> b!552796 m!529753))

(declare-fun m!529755 () Bool)

(assert (=> b!552796 m!529755))

(declare-fun m!529757 () Bool)

(assert (=> b!552803 m!529757))

(assert (=> b!552797 m!529753))

(declare-fun m!529759 () Bool)

(assert (=> b!552797 m!529759))

(assert (=> b!552797 m!529753))

(declare-fun m!529761 () Bool)

(assert (=> b!552797 m!529761))

(declare-fun m!529763 () Bool)

(assert (=> b!552797 m!529763))

(assert (=> b!552797 m!529761))

(declare-fun m!529765 () Bool)

(assert (=> b!552797 m!529765))

(assert (=> b!552797 m!529759))

(assert (=> b!552797 m!529753))

(declare-fun m!529767 () Bool)

(assert (=> b!552797 m!529767))

(declare-fun m!529769 () Bool)

(assert (=> b!552797 m!529769))

(assert (=> b!552797 m!529761))

(assert (=> b!552797 m!529763))

(declare-fun m!529771 () Bool)

(assert (=> b!552795 m!529771))

(declare-fun m!529773 () Bool)

(assert (=> b!552802 m!529773))

(assert (=> b!552794 m!529753))

(assert (=> b!552794 m!529753))

(declare-fun m!529775 () Bool)

(assert (=> b!552794 m!529775))

(declare-fun m!529777 () Bool)

(assert (=> start!50592 m!529777))

(declare-fun m!529779 () Bool)

(assert (=> start!50592 m!529779))

(declare-fun m!529781 () Bool)

(assert (=> b!552799 m!529781))

(declare-fun m!529783 () Bool)

(assert (=> b!552798 m!529783))

(push 1)

