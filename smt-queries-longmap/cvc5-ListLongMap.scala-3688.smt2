; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50744 () Bool)

(assert start!50744)

(declare-fun b!555036 () Bool)

(declare-fun e!319956 () Bool)

(declare-fun e!319957 () Bool)

(assert (=> b!555036 (= e!319956 e!319957)))

(declare-fun res!347453 () Bool)

(assert (=> b!555036 (=> (not res!347453) (not e!319957))))

(declare-fun lt!252147 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5243 0))(
  ( (MissingZero!5243 (index!23199 (_ BitVec 32))) (Found!5243 (index!23200 (_ BitVec 32))) (Intermediate!5243 (undefined!6055 Bool) (index!23201 (_ BitVec 32)) (x!52109 (_ BitVec 32))) (Undefined!5243) (MissingVacant!5243 (index!23202 (_ BitVec 32))) )
))
(declare-fun lt!252148 () SeekEntryResult!5243)

(declare-datatypes ((array!34969 0))(
  ( (array!34970 (arr!16794 (Array (_ BitVec 32) (_ BitVec 64))) (size!17158 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34969 (_ BitVec 32)) SeekEntryResult!5243)

(assert (=> b!555036 (= res!347453 (= lt!252148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252147 (select (store (arr!16794 a!3118) i!1132 k!1914) j!142) (array!34970 (store (arr!16794 a!3118) i!1132 k!1914) (size!17158 a!3118)) mask!3119)))))

(declare-fun lt!252150 () (_ BitVec 32))

(assert (=> b!555036 (= lt!252148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252150 (select (arr!16794 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555036 (= lt!252147 (toIndex!0 (select (store (arr!16794 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555036 (= lt!252150 (toIndex!0 (select (arr!16794 a!3118) j!142) mask!3119))))

(declare-fun res!347456 () Bool)

(declare-fun e!319958 () Bool)

(assert (=> start!50744 (=> (not res!347456) (not e!319958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50744 (= res!347456 (validMask!0 mask!3119))))

(assert (=> start!50744 e!319958))

(assert (=> start!50744 true))

(declare-fun array_inv!12590 (array!34969) Bool)

(assert (=> start!50744 (array_inv!12590 a!3118)))

(declare-fun b!555037 () Bool)

(declare-fun res!347452 () Bool)

(assert (=> b!555037 (=> (not res!347452) (not e!319958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555037 (= res!347452 (validKeyInArray!0 (select (arr!16794 a!3118) j!142)))))

(declare-fun b!555038 () Bool)

(assert (=> b!555038 (= e!319958 e!319956)))

(declare-fun res!347451 () Bool)

(assert (=> b!555038 (=> (not res!347451) (not e!319956))))

(declare-fun lt!252149 () SeekEntryResult!5243)

(assert (=> b!555038 (= res!347451 (or (= lt!252149 (MissingZero!5243 i!1132)) (= lt!252149 (MissingVacant!5243 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34969 (_ BitVec 32)) SeekEntryResult!5243)

(assert (=> b!555038 (= lt!252149 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555039 () Bool)

(declare-fun res!347450 () Bool)

(assert (=> b!555039 (=> (not res!347450) (not e!319958))))

(assert (=> b!555039 (= res!347450 (and (= (size!17158 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17158 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17158 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555040 () Bool)

(declare-fun res!347448 () Bool)

(assert (=> b!555040 (=> (not res!347448) (not e!319956))))

(declare-datatypes ((List!10874 0))(
  ( (Nil!10871) (Cons!10870 (h!11855 (_ BitVec 64)) (t!17102 List!10874)) )
))
(declare-fun arrayNoDuplicates!0 (array!34969 (_ BitVec 32) List!10874) Bool)

(assert (=> b!555040 (= res!347448 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10871))))

(declare-fun b!555041 () Bool)

(declare-fun res!347455 () Bool)

(assert (=> b!555041 (=> (not res!347455) (not e!319958))))

(declare-fun arrayContainsKey!0 (array!34969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555041 (= res!347455 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555042 () Bool)

(declare-fun res!347449 () Bool)

(assert (=> b!555042 (=> (not res!347449) (not e!319958))))

(assert (=> b!555042 (= res!347449 (validKeyInArray!0 k!1914))))

(declare-fun b!555043 () Bool)

(declare-fun res!347454 () Bool)

(assert (=> b!555043 (=> (not res!347454) (not e!319956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34969 (_ BitVec 32)) Bool)

(assert (=> b!555043 (= res!347454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555044 () Bool)

(assert (=> b!555044 (= e!319957 (not true))))

(declare-fun lt!252151 () SeekEntryResult!5243)

(assert (=> b!555044 (and (= lt!252151 (Found!5243 j!142)) (or (undefined!6055 lt!252148) (not (is-Intermediate!5243 lt!252148)) (= (select (arr!16794 a!3118) (index!23201 lt!252148)) (select (arr!16794 a!3118) j!142)) (not (= (select (arr!16794 a!3118) (index!23201 lt!252148)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252151 (MissingZero!5243 (index!23201 lt!252148)))))))

(assert (=> b!555044 (= lt!252151 (seekEntryOrOpen!0 (select (arr!16794 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555044 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17260 0))(
  ( (Unit!17261) )
))
(declare-fun lt!252146 () Unit!17260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17260)

(assert (=> b!555044 (= lt!252146 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50744 res!347456) b!555039))

(assert (= (and b!555039 res!347450) b!555037))

(assert (= (and b!555037 res!347452) b!555042))

(assert (= (and b!555042 res!347449) b!555041))

(assert (= (and b!555041 res!347455) b!555038))

(assert (= (and b!555038 res!347451) b!555043))

(assert (= (and b!555043 res!347454) b!555040))

(assert (= (and b!555040 res!347448) b!555036))

(assert (= (and b!555036 res!347453) b!555044))

(declare-fun m!532557 () Bool)

(assert (=> b!555038 m!532557))

(declare-fun m!532559 () Bool)

(assert (=> b!555041 m!532559))

(declare-fun m!532561 () Bool)

(assert (=> b!555036 m!532561))

(declare-fun m!532563 () Bool)

(assert (=> b!555036 m!532563))

(assert (=> b!555036 m!532561))

(declare-fun m!532565 () Bool)

(assert (=> b!555036 m!532565))

(assert (=> b!555036 m!532561))

(declare-fun m!532567 () Bool)

(assert (=> b!555036 m!532567))

(declare-fun m!532569 () Bool)

(assert (=> b!555036 m!532569))

(assert (=> b!555036 m!532567))

(declare-fun m!532571 () Bool)

(assert (=> b!555036 m!532571))

(assert (=> b!555036 m!532567))

(declare-fun m!532573 () Bool)

(assert (=> b!555036 m!532573))

(declare-fun m!532575 () Bool)

(assert (=> b!555040 m!532575))

(assert (=> b!555044 m!532561))

(declare-fun m!532577 () Bool)

(assert (=> b!555044 m!532577))

(declare-fun m!532579 () Bool)

(assert (=> b!555044 m!532579))

(declare-fun m!532581 () Bool)

(assert (=> b!555044 m!532581))

(assert (=> b!555044 m!532561))

(declare-fun m!532583 () Bool)

(assert (=> b!555044 m!532583))

(declare-fun m!532585 () Bool)

(assert (=> start!50744 m!532585))

(declare-fun m!532587 () Bool)

(assert (=> start!50744 m!532587))

(declare-fun m!532589 () Bool)

(assert (=> b!555043 m!532589))

(assert (=> b!555037 m!532561))

(assert (=> b!555037 m!532561))

(declare-fun m!532591 () Bool)

(assert (=> b!555037 m!532591))

(declare-fun m!532593 () Bool)

(assert (=> b!555042 m!532593))

(push 1)

