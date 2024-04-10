; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50418 () Bool)

(assert start!50418)

(declare-fun b!551393 () Bool)

(declare-fun e!318240 () Bool)

(assert (=> b!551393 (= e!318240 (not true))))

(declare-fun e!318243 () Bool)

(assert (=> b!551393 e!318243))

(declare-fun res!344180 () Bool)

(assert (=> b!551393 (=> (not res!344180) (not e!318243))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34757 0))(
  ( (array!34758 (arr!16691 (Array (_ BitVec 32) (_ BitVec 64))) (size!17055 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34757)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34757 (_ BitVec 32)) Bool)

(assert (=> b!551393 (= res!344180 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17054 0))(
  ( (Unit!17055) )
))
(declare-fun lt!250822 () Unit!17054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17054)

(assert (=> b!551393 (= lt!250822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551394 () Bool)

(declare-fun res!344179 () Bool)

(assert (=> b!551394 (=> (not res!344179) (not e!318240))))

(declare-datatypes ((List!10771 0))(
  ( (Nil!10768) (Cons!10767 (h!11746 (_ BitVec 64)) (t!16999 List!10771)) )
))
(declare-fun arrayNoDuplicates!0 (array!34757 (_ BitVec 32) List!10771) Bool)

(assert (=> b!551394 (= res!344179 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10768))))

(declare-fun res!344177 () Bool)

(declare-fun e!318242 () Bool)

(assert (=> start!50418 (=> (not res!344177) (not e!318242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50418 (= res!344177 (validMask!0 mask!3119))))

(assert (=> start!50418 e!318242))

(assert (=> start!50418 true))

(declare-fun array_inv!12487 (array!34757) Bool)

(assert (=> start!50418 (array_inv!12487 a!3118)))

(declare-fun b!551395 () Bool)

(assert (=> b!551395 (= e!318242 e!318240)))

(declare-fun res!344176 () Bool)

(assert (=> b!551395 (=> (not res!344176) (not e!318240))))

(declare-datatypes ((SeekEntryResult!5140 0))(
  ( (MissingZero!5140 (index!22787 (_ BitVec 32))) (Found!5140 (index!22788 (_ BitVec 32))) (Intermediate!5140 (undefined!5952 Bool) (index!22789 (_ BitVec 32)) (x!51714 (_ BitVec 32))) (Undefined!5140) (MissingVacant!5140 (index!22790 (_ BitVec 32))) )
))
(declare-fun lt!250821 () SeekEntryResult!5140)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551395 (= res!344176 (or (= lt!250821 (MissingZero!5140 i!1132)) (= lt!250821 (MissingVacant!5140 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34757 (_ BitVec 32)) SeekEntryResult!5140)

(assert (=> b!551395 (= lt!250821 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551396 () Bool)

(declare-fun res!344172 () Bool)

(assert (=> b!551396 (=> (not res!344172) (not e!318242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551396 (= res!344172 (validKeyInArray!0 k!1914))))

(declare-fun b!551397 () Bool)

(declare-fun res!344174 () Bool)

(assert (=> b!551397 (=> (not res!344174) (not e!318240))))

(assert (=> b!551397 (= res!344174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551398 () Bool)

(declare-fun res!344175 () Bool)

(assert (=> b!551398 (=> (not res!344175) (not e!318242))))

(assert (=> b!551398 (= res!344175 (validKeyInArray!0 (select (arr!16691 a!3118) j!142)))))

(declare-fun b!551399 () Bool)

(declare-fun res!344173 () Bool)

(assert (=> b!551399 (=> (not res!344173) (not e!318242))))

(declare-fun arrayContainsKey!0 (array!34757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551399 (= res!344173 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551400 () Bool)

(assert (=> b!551400 (= e!318243 (= (seekEntryOrOpen!0 (select (arr!16691 a!3118) j!142) a!3118 mask!3119) (Found!5140 j!142)))))

(declare-fun b!551401 () Bool)

(declare-fun res!344171 () Bool)

(assert (=> b!551401 (=> (not res!344171) (not e!318242))))

(assert (=> b!551401 (= res!344171 (and (= (size!17055 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17055 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17055 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551402 () Bool)

(declare-fun res!344178 () Bool)

(assert (=> b!551402 (=> (not res!344178) (not e!318240))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34757 (_ BitVec 32)) SeekEntryResult!5140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551402 (= res!344178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16691 a!3118) j!142) mask!3119) (select (arr!16691 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16691 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16691 a!3118) i!1132 k!1914) j!142) (array!34758 (store (arr!16691 a!3118) i!1132 k!1914) (size!17055 a!3118)) mask!3119)))))

(assert (= (and start!50418 res!344177) b!551401))

(assert (= (and b!551401 res!344171) b!551398))

(assert (= (and b!551398 res!344175) b!551396))

(assert (= (and b!551396 res!344172) b!551399))

(assert (= (and b!551399 res!344173) b!551395))

(assert (= (and b!551395 res!344176) b!551397))

(assert (= (and b!551397 res!344174) b!551394))

(assert (= (and b!551394 res!344179) b!551402))

(assert (= (and b!551402 res!344178) b!551393))

(assert (= (and b!551393 res!344180) b!551400))

(declare-fun m!528369 () Bool)

(assert (=> start!50418 m!528369))

(declare-fun m!528371 () Bool)

(assert (=> start!50418 m!528371))

(declare-fun m!528373 () Bool)

(assert (=> b!551393 m!528373))

(declare-fun m!528375 () Bool)

(assert (=> b!551393 m!528375))

(declare-fun m!528377 () Bool)

(assert (=> b!551400 m!528377))

(assert (=> b!551400 m!528377))

(declare-fun m!528379 () Bool)

(assert (=> b!551400 m!528379))

(assert (=> b!551398 m!528377))

(assert (=> b!551398 m!528377))

(declare-fun m!528381 () Bool)

(assert (=> b!551398 m!528381))

(assert (=> b!551402 m!528377))

(declare-fun m!528383 () Bool)

(assert (=> b!551402 m!528383))

(assert (=> b!551402 m!528377))

(declare-fun m!528385 () Bool)

(assert (=> b!551402 m!528385))

(declare-fun m!528387 () Bool)

(assert (=> b!551402 m!528387))

(assert (=> b!551402 m!528385))

(declare-fun m!528389 () Bool)

(assert (=> b!551402 m!528389))

(assert (=> b!551402 m!528383))

(assert (=> b!551402 m!528377))

(declare-fun m!528391 () Bool)

(assert (=> b!551402 m!528391))

(declare-fun m!528393 () Bool)

(assert (=> b!551402 m!528393))

(assert (=> b!551402 m!528385))

(assert (=> b!551402 m!528387))

(declare-fun m!528395 () Bool)

(assert (=> b!551395 m!528395))

(declare-fun m!528397 () Bool)

(assert (=> b!551397 m!528397))

(declare-fun m!528399 () Bool)

(assert (=> b!551396 m!528399))

(declare-fun m!528401 () Bool)

(assert (=> b!551399 m!528401))

(declare-fun m!528403 () Bool)

(assert (=> b!551394 m!528403))

(push 1)

(assert (not b!551395))

(assert (not b!551398))

(assert (not b!551393))

(assert (not b!551400))

(assert (not b!551397))

(assert (not b!551402))

(assert (not b!551394))

(assert (not start!50418))

(assert (not b!551396))

(assert (not b!551399))

(check-sat)

(pop 1)

