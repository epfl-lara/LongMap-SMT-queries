; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52452 () Bool)

(assert start!52452)

(declare-fun b!572777 () Bool)

(declare-fun e!329490 () Bool)

(declare-fun e!329486 () Bool)

(assert (=> b!572777 (= e!329490 e!329486)))

(declare-fun res!362290 () Bool)

(assert (=> b!572777 (=> res!362290 e!329486)))

(declare-datatypes ((SeekEntryResult!5662 0))(
  ( (MissingZero!5662 (index!24875 (_ BitVec 32))) (Found!5662 (index!24876 (_ BitVec 32))) (Intermediate!5662 (undefined!6474 Bool) (index!24877 (_ BitVec 32)) (x!53739 (_ BitVec 32))) (Undefined!5662) (MissingVacant!5662 (index!24878 (_ BitVec 32))) )
))
(declare-fun lt!261472 () SeekEntryResult!5662)

(assert (=> b!572777 (= res!362290 (or (undefined!6474 lt!261472) (not (is-Intermediate!5662 lt!261472))))))

(declare-fun b!572778 () Bool)

(declare-fun e!329487 () Bool)

(declare-fun e!329485 () Bool)

(assert (=> b!572778 (= e!329487 e!329485)))

(declare-fun res!362291 () Bool)

(assert (=> b!572778 (=> (not res!362291) (not e!329485))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!261477 () SeekEntryResult!5662)

(declare-datatypes ((array!35849 0))(
  ( (array!35850 (arr!17213 (Array (_ BitVec 32) (_ BitVec 64))) (size!17577 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35849)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35849 (_ BitVec 32)) SeekEntryResult!5662)

(assert (=> b!572778 (= res!362291 (= lt!261477 (seekKeyOrZeroReturnVacant!0 (x!53739 lt!261472) (index!24877 lt!261472) (index!24877 lt!261472) (select (arr!17213 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572779 () Bool)

(declare-fun res!362293 () Bool)

(declare-fun e!329489 () Bool)

(assert (=> b!572779 (=> (not res!362293) (not e!329489))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572779 (= res!362293 (and (= (size!17577 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17577 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17577 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572780 () Bool)

(declare-fun e!329483 () Bool)

(declare-fun e!329484 () Bool)

(assert (=> b!572780 (= e!329483 e!329484)))

(declare-fun res!362288 () Bool)

(assert (=> b!572780 (=> (not res!362288) (not e!329484))))

(declare-fun lt!261475 () (_ BitVec 32))

(declare-fun lt!261478 () array!35849)

(declare-fun lt!261473 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35849 (_ BitVec 32)) SeekEntryResult!5662)

(assert (=> b!572780 (= res!362288 (= lt!261472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261475 lt!261473 lt!261478 mask!3119)))))

(declare-fun lt!261476 () (_ BitVec 32))

(assert (=> b!572780 (= lt!261472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261476 (select (arr!17213 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572780 (= lt!261475 (toIndex!0 lt!261473 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!572780 (= lt!261473 (select (store (arr!17213 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572780 (= lt!261476 (toIndex!0 (select (arr!17213 a!3118) j!142) mask!3119))))

(assert (=> b!572780 (= lt!261478 (array!35850 (store (arr!17213 a!3118) i!1132 k!1914) (size!17577 a!3118)))))

(declare-fun b!572781 () Bool)

(declare-fun res!362289 () Bool)

(assert (=> b!572781 (=> (not res!362289) (not e!329483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35849 (_ BitVec 32)) Bool)

(assert (=> b!572781 (= res!362289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572782 () Bool)

(declare-fun res!362292 () Bool)

(assert (=> b!572782 (=> (not res!362292) (not e!329483))))

(declare-datatypes ((List!11293 0))(
  ( (Nil!11290) (Cons!11289 (h!12316 (_ BitVec 64)) (t!17521 List!11293)) )
))
(declare-fun arrayNoDuplicates!0 (array!35849 (_ BitVec 32) List!11293) Bool)

(assert (=> b!572782 (= res!362292 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11290))))

(declare-fun res!362295 () Bool)

(assert (=> start!52452 (=> (not res!362295) (not e!329489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52452 (= res!362295 (validMask!0 mask!3119))))

(assert (=> start!52452 e!329489))

(assert (=> start!52452 true))

(declare-fun array_inv!13009 (array!35849) Bool)

(assert (=> start!52452 (array_inv!13009 a!3118)))

(declare-fun b!572783 () Bool)

(declare-fun res!362296 () Bool)

(assert (=> b!572783 (=> (not res!362296) (not e!329489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572783 (= res!362296 (validKeyInArray!0 k!1914))))

(declare-fun b!572784 () Bool)

(declare-fun res!362297 () Bool)

(assert (=> b!572784 (=> (not res!362297) (not e!329489))))

(declare-fun arrayContainsKey!0 (array!35849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572784 (= res!362297 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572785 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35849 (_ BitVec 32)) SeekEntryResult!5662)

(assert (=> b!572785 (= e!329485 (= (seekEntryOrOpen!0 lt!261473 lt!261478 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53739 lt!261472) (index!24877 lt!261472) (index!24877 lt!261472) lt!261473 lt!261478 mask!3119)))))

(declare-fun b!572786 () Bool)

(assert (=> b!572786 (= e!329484 (not true))))

(assert (=> b!572786 e!329490))

(declare-fun res!362285 () Bool)

(assert (=> b!572786 (=> (not res!362285) (not e!329490))))

(assert (=> b!572786 (= res!362285 (= lt!261477 (Found!5662 j!142)))))

(assert (=> b!572786 (= lt!261477 (seekEntryOrOpen!0 (select (arr!17213 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572786 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18026 0))(
  ( (Unit!18027) )
))
(declare-fun lt!261471 () Unit!18026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18026)

(assert (=> b!572786 (= lt!261471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572787 () Bool)

(declare-fun res!362294 () Bool)

(assert (=> b!572787 (=> (not res!362294) (not e!329489))))

(assert (=> b!572787 (= res!362294 (validKeyInArray!0 (select (arr!17213 a!3118) j!142)))))

(declare-fun b!572788 () Bool)

(assert (=> b!572788 (= e!329486 e!329487)))

(declare-fun res!362286 () Bool)

(assert (=> b!572788 (=> res!362286 e!329487)))

(declare-fun lt!261470 () (_ BitVec 64))

(assert (=> b!572788 (= res!362286 (or (= lt!261470 (select (arr!17213 a!3118) j!142)) (= lt!261470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572788 (= lt!261470 (select (arr!17213 a!3118) (index!24877 lt!261472)))))

(declare-fun b!572789 () Bool)

(assert (=> b!572789 (= e!329489 e!329483)))

(declare-fun res!362287 () Bool)

(assert (=> b!572789 (=> (not res!362287) (not e!329483))))

(declare-fun lt!261474 () SeekEntryResult!5662)

(assert (=> b!572789 (= res!362287 (or (= lt!261474 (MissingZero!5662 i!1132)) (= lt!261474 (MissingVacant!5662 i!1132))))))

(assert (=> b!572789 (= lt!261474 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52452 res!362295) b!572779))

(assert (= (and b!572779 res!362293) b!572787))

(assert (= (and b!572787 res!362294) b!572783))

(assert (= (and b!572783 res!362296) b!572784))

(assert (= (and b!572784 res!362297) b!572789))

(assert (= (and b!572789 res!362287) b!572781))

(assert (= (and b!572781 res!362289) b!572782))

(assert (= (and b!572782 res!362292) b!572780))

(assert (= (and b!572780 res!362288) b!572786))

(assert (= (and b!572786 res!362285) b!572777))

(assert (= (and b!572777 (not res!362290)) b!572788))

(assert (= (and b!572788 (not res!362286)) b!572778))

(assert (= (and b!572778 res!362291) b!572785))

(declare-fun m!551797 () Bool)

(assert (=> b!572789 m!551797))

(declare-fun m!551799 () Bool)

(assert (=> b!572787 m!551799))

(assert (=> b!572787 m!551799))

(declare-fun m!551801 () Bool)

(assert (=> b!572787 m!551801))

(assert (=> b!572788 m!551799))

(declare-fun m!551803 () Bool)

(assert (=> b!572788 m!551803))

(declare-fun m!551805 () Bool)

(assert (=> b!572785 m!551805))

(declare-fun m!551807 () Bool)

(assert (=> b!572785 m!551807))

(assert (=> b!572780 m!551799))

(declare-fun m!551809 () Bool)

(assert (=> b!572780 m!551809))

(assert (=> b!572780 m!551799))

(assert (=> b!572780 m!551799))

(declare-fun m!551811 () Bool)

(assert (=> b!572780 m!551811))

(declare-fun m!551813 () Bool)

(assert (=> b!572780 m!551813))

(declare-fun m!551815 () Bool)

(assert (=> b!572780 m!551815))

(declare-fun m!551817 () Bool)

(assert (=> b!572780 m!551817))

(declare-fun m!551819 () Bool)

(assert (=> b!572780 m!551819))

(declare-fun m!551821 () Bool)

(assert (=> b!572784 m!551821))

(assert (=> b!572786 m!551799))

(assert (=> b!572786 m!551799))

(declare-fun m!551823 () Bool)

(assert (=> b!572786 m!551823))

(declare-fun m!551825 () Bool)

(assert (=> b!572786 m!551825))

(declare-fun m!551827 () Bool)

(assert (=> b!572786 m!551827))

(declare-fun m!551829 () Bool)

(assert (=> b!572781 m!551829))

(declare-fun m!551831 () Bool)

(assert (=> start!52452 m!551831))

(declare-fun m!551833 () Bool)

(assert (=> start!52452 m!551833))

(assert (=> b!572778 m!551799))

(assert (=> b!572778 m!551799))

(declare-fun m!551835 () Bool)

(assert (=> b!572778 m!551835))

(declare-fun m!551837 () Bool)

(assert (=> b!572782 m!551837))

(declare-fun m!551839 () Bool)

(assert (=> b!572783 m!551839))

(push 1)

