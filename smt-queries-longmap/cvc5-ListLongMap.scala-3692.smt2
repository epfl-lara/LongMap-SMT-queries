; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50768 () Bool)

(assert start!50768)

(declare-fun b!555360 () Bool)

(declare-fun res!347773 () Bool)

(declare-fun e!320100 () Bool)

(assert (=> b!555360 (=> (not res!347773) (not e!320100))))

(declare-datatypes ((array!34993 0))(
  ( (array!34994 (arr!16806 (Array (_ BitVec 32) (_ BitVec 64))) (size!17170 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34993)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555360 (= res!347773 (validKeyInArray!0 (select (arr!16806 a!3118) j!142)))))

(declare-fun b!555361 () Bool)

(declare-fun e!320103 () Bool)

(assert (=> b!555361 (= e!320100 e!320103)))

(declare-fun res!347776 () Bool)

(assert (=> b!555361 (=> (not res!347776) (not e!320103))))

(declare-datatypes ((SeekEntryResult!5255 0))(
  ( (MissingZero!5255 (index!23247 (_ BitVec 32))) (Found!5255 (index!23248 (_ BitVec 32))) (Intermediate!5255 (undefined!6067 Bool) (index!23249 (_ BitVec 32)) (x!52153 (_ BitVec 32))) (Undefined!5255) (MissingVacant!5255 (index!23250 (_ BitVec 32))) )
))
(declare-fun lt!252367 () SeekEntryResult!5255)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555361 (= res!347776 (or (= lt!252367 (MissingZero!5255 i!1132)) (= lt!252367 (MissingVacant!5255 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34993 (_ BitVec 32)) SeekEntryResult!5255)

(assert (=> b!555361 (= lt!252367 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!347772 () Bool)

(assert (=> start!50768 (=> (not res!347772) (not e!320100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50768 (= res!347772 (validMask!0 mask!3119))))

(assert (=> start!50768 e!320100))

(assert (=> start!50768 true))

(declare-fun array_inv!12602 (array!34993) Bool)

(assert (=> start!50768 (array_inv!12602 a!3118)))

(declare-fun b!555362 () Bool)

(declare-fun res!347778 () Bool)

(assert (=> b!555362 (=> (not res!347778) (not e!320103))))

(declare-datatypes ((List!10886 0))(
  ( (Nil!10883) (Cons!10882 (h!11867 (_ BitVec 64)) (t!17114 List!10886)) )
))
(declare-fun arrayNoDuplicates!0 (array!34993 (_ BitVec 32) List!10886) Bool)

(assert (=> b!555362 (= res!347778 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10883))))

(declare-fun b!555363 () Bool)

(declare-fun e!320102 () Bool)

(assert (=> b!555363 (= e!320102 (not true))))

(declare-fun lt!252366 () SeekEntryResult!5255)

(declare-fun lt!252363 () SeekEntryResult!5255)

(assert (=> b!555363 (and (= lt!252363 (Found!5255 j!142)) (or (undefined!6067 lt!252366) (not (is-Intermediate!5255 lt!252366)) (= (select (arr!16806 a!3118) (index!23249 lt!252366)) (select (arr!16806 a!3118) j!142)) (not (= (select (arr!16806 a!3118) (index!23249 lt!252366)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252363 (MissingZero!5255 (index!23249 lt!252366)))))))

(assert (=> b!555363 (= lt!252363 (seekEntryOrOpen!0 (select (arr!16806 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34993 (_ BitVec 32)) Bool)

(assert (=> b!555363 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17284 0))(
  ( (Unit!17285) )
))
(declare-fun lt!252365 () Unit!17284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17284)

(assert (=> b!555363 (= lt!252365 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555364 () Bool)

(declare-fun res!347774 () Bool)

(assert (=> b!555364 (=> (not res!347774) (not e!320100))))

(assert (=> b!555364 (= res!347774 (and (= (size!17170 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17170 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17170 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555365 () Bool)

(declare-fun res!347777 () Bool)

(assert (=> b!555365 (=> (not res!347777) (not e!320103))))

(assert (=> b!555365 (= res!347777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555366 () Bool)

(assert (=> b!555366 (= e!320103 e!320102)))

(declare-fun res!347780 () Bool)

(assert (=> b!555366 (=> (not res!347780) (not e!320102))))

(declare-fun lt!252362 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34993 (_ BitVec 32)) SeekEntryResult!5255)

(assert (=> b!555366 (= res!347780 (= lt!252366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252362 (select (store (arr!16806 a!3118) i!1132 k!1914) j!142) (array!34994 (store (arr!16806 a!3118) i!1132 k!1914) (size!17170 a!3118)) mask!3119)))))

(declare-fun lt!252364 () (_ BitVec 32))

(assert (=> b!555366 (= lt!252366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252364 (select (arr!16806 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555366 (= lt!252362 (toIndex!0 (select (store (arr!16806 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555366 (= lt!252364 (toIndex!0 (select (arr!16806 a!3118) j!142) mask!3119))))

(declare-fun b!555367 () Bool)

(declare-fun res!347775 () Bool)

(assert (=> b!555367 (=> (not res!347775) (not e!320100))))

(declare-fun arrayContainsKey!0 (array!34993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555367 (= res!347775 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555368 () Bool)

(declare-fun res!347779 () Bool)

(assert (=> b!555368 (=> (not res!347779) (not e!320100))))

(assert (=> b!555368 (= res!347779 (validKeyInArray!0 k!1914))))

(assert (= (and start!50768 res!347772) b!555364))

(assert (= (and b!555364 res!347774) b!555360))

(assert (= (and b!555360 res!347773) b!555368))

(assert (= (and b!555368 res!347779) b!555367))

(assert (= (and b!555367 res!347775) b!555361))

(assert (= (and b!555361 res!347776) b!555365))

(assert (= (and b!555365 res!347777) b!555362))

(assert (= (and b!555362 res!347778) b!555366))

(assert (= (and b!555366 res!347780) b!555363))

(declare-fun m!533013 () Bool)

(assert (=> b!555362 m!533013))

(declare-fun m!533015 () Bool)

(assert (=> b!555366 m!533015))

(declare-fun m!533017 () Bool)

(assert (=> b!555366 m!533017))

(assert (=> b!555366 m!533015))

(declare-fun m!533019 () Bool)

(assert (=> b!555366 m!533019))

(assert (=> b!555366 m!533015))

(declare-fun m!533021 () Bool)

(assert (=> b!555366 m!533021))

(declare-fun m!533023 () Bool)

(assert (=> b!555366 m!533023))

(assert (=> b!555366 m!533021))

(declare-fun m!533025 () Bool)

(assert (=> b!555366 m!533025))

(assert (=> b!555366 m!533021))

(declare-fun m!533027 () Bool)

(assert (=> b!555366 m!533027))

(assert (=> b!555360 m!533015))

(assert (=> b!555360 m!533015))

(declare-fun m!533029 () Bool)

(assert (=> b!555360 m!533029))

(declare-fun m!533031 () Bool)

(assert (=> start!50768 m!533031))

(declare-fun m!533033 () Bool)

(assert (=> start!50768 m!533033))

(declare-fun m!533035 () Bool)

(assert (=> b!555365 m!533035))

(assert (=> b!555363 m!533015))

(declare-fun m!533037 () Bool)

(assert (=> b!555363 m!533037))

(declare-fun m!533039 () Bool)

(assert (=> b!555363 m!533039))

(declare-fun m!533041 () Bool)

(assert (=> b!555363 m!533041))

(assert (=> b!555363 m!533015))

(declare-fun m!533043 () Bool)

(assert (=> b!555363 m!533043))

(declare-fun m!533045 () Bool)

(assert (=> b!555368 m!533045))

(declare-fun m!533047 () Bool)

(assert (=> b!555361 m!533047))

(declare-fun m!533049 () Bool)

(assert (=> b!555367 m!533049))

(push 1)

