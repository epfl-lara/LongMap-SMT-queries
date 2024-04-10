; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52286 () Bool)

(assert start!52286)

(declare-fun b!570523 () Bool)

(declare-fun res!360310 () Bool)

(declare-fun e!328133 () Bool)

(assert (=> b!570523 (=> (not res!360310) (not e!328133))))

(declare-datatypes ((array!35746 0))(
  ( (array!35747 (arr!17163 (Array (_ BitVec 32) (_ BitVec 64))) (size!17527 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35746)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570523 (= res!360310 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570524 () Bool)

(declare-fun res!360314 () Bool)

(assert (=> b!570524 (=> (not res!360314) (not e!328133))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!570524 (= res!360314 (and (= (size!17527 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17527 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17527 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570525 () Bool)

(declare-fun res!360306 () Bool)

(declare-fun e!328130 () Bool)

(assert (=> b!570525 (=> (not res!360306) (not e!328130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35746 (_ BitVec 32)) Bool)

(assert (=> b!570525 (= res!360306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!360307 () Bool)

(assert (=> start!52286 (=> (not res!360307) (not e!328133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52286 (= res!360307 (validMask!0 mask!3119))))

(assert (=> start!52286 e!328133))

(assert (=> start!52286 true))

(declare-fun array_inv!12959 (array!35746) Bool)

(assert (=> start!52286 (array_inv!12959 a!3118)))

(declare-fun b!570526 () Bool)

(assert (=> b!570526 (= e!328133 e!328130)))

(declare-fun res!360311 () Bool)

(assert (=> b!570526 (=> (not res!360311) (not e!328130))))

(declare-datatypes ((SeekEntryResult!5612 0))(
  ( (MissingZero!5612 (index!24675 (_ BitVec 32))) (Found!5612 (index!24676 (_ BitVec 32))) (Intermediate!5612 (undefined!6424 Bool) (index!24677 (_ BitVec 32)) (x!53552 (_ BitVec 32))) (Undefined!5612) (MissingVacant!5612 (index!24678 (_ BitVec 32))) )
))
(declare-fun lt!260083 () SeekEntryResult!5612)

(assert (=> b!570526 (= res!360311 (or (= lt!260083 (MissingZero!5612 i!1132)) (= lt!260083 (MissingVacant!5612 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35746 (_ BitVec 32)) SeekEntryResult!5612)

(assert (=> b!570526 (= lt!260083 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570527 () Bool)

(declare-fun e!328134 () Bool)

(assert (=> b!570527 (= e!328130 e!328134)))

(declare-fun res!360312 () Bool)

(assert (=> b!570527 (=> (not res!360312) (not e!328134))))

(declare-fun lt!260078 () SeekEntryResult!5612)

(declare-fun lt!260080 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35746 (_ BitVec 32)) SeekEntryResult!5612)

(assert (=> b!570527 (= res!360312 (= lt!260078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260080 (select (store (arr!17163 a!3118) i!1132 k!1914) j!142) (array!35747 (store (arr!17163 a!3118) i!1132 k!1914) (size!17527 a!3118)) mask!3119)))))

(declare-fun lt!260079 () (_ BitVec 32))

(assert (=> b!570527 (= lt!260078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260079 (select (arr!17163 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570527 (= lt!260080 (toIndex!0 (select (store (arr!17163 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570527 (= lt!260079 (toIndex!0 (select (arr!17163 a!3118) j!142) mask!3119))))

(declare-fun b!570528 () Bool)

(declare-fun res!360305 () Bool)

(assert (=> b!570528 (=> (not res!360305) (not e!328133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570528 (= res!360305 (validKeyInArray!0 k!1914))))

(declare-fun b!570529 () Bool)

(declare-fun e!328132 () Bool)

(declare-fun e!328129 () Bool)

(assert (=> b!570529 (= e!328132 e!328129)))

(declare-fun res!360304 () Bool)

(assert (=> b!570529 (=> res!360304 e!328129)))

(assert (=> b!570529 (= res!360304 (or (undefined!6424 lt!260078) (not (is-Intermediate!5612 lt!260078)) (= (select (arr!17163 a!3118) (index!24677 lt!260078)) (select (arr!17163 a!3118) j!142)) (= (select (arr!17163 a!3118) (index!24677 lt!260078)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!260082 () SeekEntryResult!5612)

(declare-fun b!570530 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35746 (_ BitVec 32)) SeekEntryResult!5612)

(assert (=> b!570530 (= e!328129 (= lt!260082 (seekKeyOrZeroReturnVacant!0 (x!53552 lt!260078) (index!24677 lt!260078) (index!24677 lt!260078) (select (arr!17163 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570531 () Bool)

(declare-fun res!360313 () Bool)

(assert (=> b!570531 (=> (not res!360313) (not e!328130))))

(declare-datatypes ((List!11243 0))(
  ( (Nil!11240) (Cons!11239 (h!12263 (_ BitVec 64)) (t!17471 List!11243)) )
))
(declare-fun arrayNoDuplicates!0 (array!35746 (_ BitVec 32) List!11243) Bool)

(assert (=> b!570531 (= res!360313 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11240))))

(declare-fun b!570532 () Bool)

(declare-fun res!360308 () Bool)

(assert (=> b!570532 (=> (not res!360308) (not e!328133))))

(assert (=> b!570532 (= res!360308 (validKeyInArray!0 (select (arr!17163 a!3118) j!142)))))

(declare-fun b!570533 () Bool)

(assert (=> b!570533 (= e!328134 (not true))))

(assert (=> b!570533 e!328132))

(declare-fun res!360309 () Bool)

(assert (=> b!570533 (=> (not res!360309) (not e!328132))))

(assert (=> b!570533 (= res!360309 (= lt!260082 (Found!5612 j!142)))))

(assert (=> b!570533 (= lt!260082 (seekEntryOrOpen!0 (select (arr!17163 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570533 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17926 0))(
  ( (Unit!17927) )
))
(declare-fun lt!260081 () Unit!17926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17926)

(assert (=> b!570533 (= lt!260081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52286 res!360307) b!570524))

(assert (= (and b!570524 res!360314) b!570532))

(assert (= (and b!570532 res!360308) b!570528))

(assert (= (and b!570528 res!360305) b!570523))

(assert (= (and b!570523 res!360310) b!570526))

(assert (= (and b!570526 res!360311) b!570525))

(assert (= (and b!570525 res!360306) b!570531))

(assert (= (and b!570531 res!360313) b!570527))

(assert (= (and b!570527 res!360312) b!570533))

(assert (= (and b!570533 res!360309) b!570529))

(assert (= (and b!570529 (not res!360304)) b!570530))

(declare-fun m!549369 () Bool)

(assert (=> b!570527 m!549369))

(declare-fun m!549371 () Bool)

(assert (=> b!570527 m!549371))

(assert (=> b!570527 m!549369))

(assert (=> b!570527 m!549369))

(declare-fun m!549373 () Bool)

(assert (=> b!570527 m!549373))

(declare-fun m!549375 () Bool)

(assert (=> b!570527 m!549375))

(declare-fun m!549377 () Bool)

(assert (=> b!570527 m!549377))

(assert (=> b!570527 m!549375))

(declare-fun m!549379 () Bool)

(assert (=> b!570527 m!549379))

(assert (=> b!570527 m!549375))

(declare-fun m!549381 () Bool)

(assert (=> b!570527 m!549381))

(declare-fun m!549383 () Bool)

(assert (=> b!570531 m!549383))

(assert (=> b!570532 m!549369))

(assert (=> b!570532 m!549369))

(declare-fun m!549385 () Bool)

(assert (=> b!570532 m!549385))

(assert (=> b!570533 m!549369))

(assert (=> b!570533 m!549369))

(declare-fun m!549387 () Bool)

(assert (=> b!570533 m!549387))

(declare-fun m!549389 () Bool)

(assert (=> b!570533 m!549389))

(declare-fun m!549391 () Bool)

(assert (=> b!570533 m!549391))

(declare-fun m!549393 () Bool)

(assert (=> b!570526 m!549393))

(declare-fun m!549395 () Bool)

(assert (=> b!570525 m!549395))

(declare-fun m!549397 () Bool)

(assert (=> start!52286 m!549397))

(declare-fun m!549399 () Bool)

(assert (=> start!52286 m!549399))

(assert (=> b!570530 m!549369))

(assert (=> b!570530 m!549369))

(declare-fun m!549401 () Bool)

(assert (=> b!570530 m!549401))

(declare-fun m!549403 () Bool)

(assert (=> b!570528 m!549403))

(declare-fun m!549405 () Bool)

(assert (=> b!570523 m!549405))

(declare-fun m!549407 () Bool)

(assert (=> b!570529 m!549407))

(assert (=> b!570529 m!549369))

(push 1)

