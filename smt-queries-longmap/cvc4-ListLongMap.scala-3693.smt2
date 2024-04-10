; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50778 () Bool)

(assert start!50778)

(declare-fun b!555495 () Bool)

(declare-fun res!347914 () Bool)

(declare-fun e!320161 () Bool)

(assert (=> b!555495 (=> (not res!347914) (not e!320161))))

(declare-datatypes ((array!35003 0))(
  ( (array!35004 (arr!16811 (Array (_ BitVec 32) (_ BitVec 64))) (size!17175 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35003)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555495 (= res!347914 (validKeyInArray!0 (select (arr!16811 a!3118) j!142)))))

(declare-fun b!555497 () Bool)

(declare-fun e!320163 () Bool)

(assert (=> b!555497 (= e!320163 (not true))))

(declare-datatypes ((SeekEntryResult!5260 0))(
  ( (MissingZero!5260 (index!23267 (_ BitVec 32))) (Found!5260 (index!23268 (_ BitVec 32))) (Intermediate!5260 (undefined!6072 Bool) (index!23269 (_ BitVec 32)) (x!52166 (_ BitVec 32))) (Undefined!5260) (MissingVacant!5260 (index!23270 (_ BitVec 32))) )
))
(declare-fun lt!252455 () SeekEntryResult!5260)

(declare-fun lt!252457 () SeekEntryResult!5260)

(assert (=> b!555497 (and (= lt!252455 (Found!5260 j!142)) (or (undefined!6072 lt!252457) (not (is-Intermediate!5260 lt!252457)) (= (select (arr!16811 a!3118) (index!23269 lt!252457)) (select (arr!16811 a!3118) j!142)) (not (= (select (arr!16811 a!3118) (index!23269 lt!252457)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252455 (MissingZero!5260 (index!23269 lt!252457)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35003 (_ BitVec 32)) SeekEntryResult!5260)

(assert (=> b!555497 (= lt!252455 (seekEntryOrOpen!0 (select (arr!16811 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35003 (_ BitVec 32)) Bool)

(assert (=> b!555497 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17294 0))(
  ( (Unit!17295) )
))
(declare-fun lt!252454 () Unit!17294)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17294)

(assert (=> b!555497 (= lt!252454 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555498 () Bool)

(declare-fun res!347912 () Bool)

(assert (=> b!555498 (=> (not res!347912) (not e!320161))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555498 (= res!347912 (and (= (size!17175 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17175 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17175 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555499 () Bool)

(declare-fun res!347907 () Bool)

(assert (=> b!555499 (=> (not res!347907) (not e!320161))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!555499 (= res!347907 (validKeyInArray!0 k!1914))))

(declare-fun b!555500 () Bool)

(declare-fun e!320162 () Bool)

(assert (=> b!555500 (= e!320162 e!320163)))

(declare-fun res!347915 () Bool)

(assert (=> b!555500 (=> (not res!347915) (not e!320163))))

(declare-fun lt!252452 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35003 (_ BitVec 32)) SeekEntryResult!5260)

(assert (=> b!555500 (= res!347915 (= lt!252457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252452 (select (store (arr!16811 a!3118) i!1132 k!1914) j!142) (array!35004 (store (arr!16811 a!3118) i!1132 k!1914) (size!17175 a!3118)) mask!3119)))))

(declare-fun lt!252453 () (_ BitVec 32))

(assert (=> b!555500 (= lt!252457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252453 (select (arr!16811 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555500 (= lt!252452 (toIndex!0 (select (store (arr!16811 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555500 (= lt!252453 (toIndex!0 (select (arr!16811 a!3118) j!142) mask!3119))))

(declare-fun b!555501 () Bool)

(declare-fun res!347908 () Bool)

(assert (=> b!555501 (=> (not res!347908) (not e!320162))))

(declare-datatypes ((List!10891 0))(
  ( (Nil!10888) (Cons!10887 (h!11872 (_ BitVec 64)) (t!17119 List!10891)) )
))
(declare-fun arrayNoDuplicates!0 (array!35003 (_ BitVec 32) List!10891) Bool)

(assert (=> b!555501 (= res!347908 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10888))))

(declare-fun b!555502 () Bool)

(declare-fun res!347911 () Bool)

(assert (=> b!555502 (=> (not res!347911) (not e!320161))))

(declare-fun arrayContainsKey!0 (array!35003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555502 (= res!347911 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555503 () Bool)

(declare-fun res!347910 () Bool)

(assert (=> b!555503 (=> (not res!347910) (not e!320162))))

(assert (=> b!555503 (= res!347910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!347913 () Bool)

(assert (=> start!50778 (=> (not res!347913) (not e!320161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50778 (= res!347913 (validMask!0 mask!3119))))

(assert (=> start!50778 e!320161))

(assert (=> start!50778 true))

(declare-fun array_inv!12607 (array!35003) Bool)

(assert (=> start!50778 (array_inv!12607 a!3118)))

(declare-fun b!555496 () Bool)

(assert (=> b!555496 (= e!320161 e!320162)))

(declare-fun res!347909 () Bool)

(assert (=> b!555496 (=> (not res!347909) (not e!320162))))

(declare-fun lt!252456 () SeekEntryResult!5260)

(assert (=> b!555496 (= res!347909 (or (= lt!252456 (MissingZero!5260 i!1132)) (= lt!252456 (MissingVacant!5260 i!1132))))))

(assert (=> b!555496 (= lt!252456 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!50778 res!347913) b!555498))

(assert (= (and b!555498 res!347912) b!555495))

(assert (= (and b!555495 res!347914) b!555499))

(assert (= (and b!555499 res!347907) b!555502))

(assert (= (and b!555502 res!347911) b!555496))

(assert (= (and b!555496 res!347909) b!555503))

(assert (= (and b!555503 res!347910) b!555501))

(assert (= (and b!555501 res!347908) b!555500))

(assert (= (and b!555500 res!347915) b!555497))

(declare-fun m!533203 () Bool)

(assert (=> b!555500 m!533203))

(declare-fun m!533205 () Bool)

(assert (=> b!555500 m!533205))

(assert (=> b!555500 m!533203))

(declare-fun m!533207 () Bool)

(assert (=> b!555500 m!533207))

(declare-fun m!533209 () Bool)

(assert (=> b!555500 m!533209))

(declare-fun m!533211 () Bool)

(assert (=> b!555500 m!533211))

(assert (=> b!555500 m!533207))

(declare-fun m!533213 () Bool)

(assert (=> b!555500 m!533213))

(assert (=> b!555500 m!533207))

(assert (=> b!555500 m!533203))

(declare-fun m!533215 () Bool)

(assert (=> b!555500 m!533215))

(declare-fun m!533217 () Bool)

(assert (=> b!555503 m!533217))

(declare-fun m!533219 () Bool)

(assert (=> b!555496 m!533219))

(declare-fun m!533221 () Bool)

(assert (=> b!555502 m!533221))

(assert (=> b!555495 m!533203))

(assert (=> b!555495 m!533203))

(declare-fun m!533223 () Bool)

(assert (=> b!555495 m!533223))

(declare-fun m!533225 () Bool)

(assert (=> b!555501 m!533225))

(declare-fun m!533227 () Bool)

(assert (=> start!50778 m!533227))

(declare-fun m!533229 () Bool)

(assert (=> start!50778 m!533229))

(assert (=> b!555497 m!533203))

(declare-fun m!533231 () Bool)

(assert (=> b!555497 m!533231))

(declare-fun m!533233 () Bool)

(assert (=> b!555497 m!533233))

(declare-fun m!533235 () Bool)

(assert (=> b!555497 m!533235))

(assert (=> b!555497 m!533203))

(declare-fun m!533237 () Bool)

(assert (=> b!555497 m!533237))

(declare-fun m!533239 () Bool)

(assert (=> b!555499 m!533239))

(push 1)

