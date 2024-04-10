; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51392 () Bool)

(assert start!51392)

(declare-fun b!561335 () Bool)

(declare-fun e!323456 () Bool)

(declare-fun e!323459 () Bool)

(assert (=> b!561335 (= e!323456 e!323459)))

(declare-fun res!352491 () Bool)

(assert (=> b!561335 (=> res!352491 e!323459)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35257 0))(
  ( (array!35258 (arr!16929 (Array (_ BitVec 32) (_ BitVec 64))) (size!17293 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35257)

(declare-fun lt!255441 () (_ BitVec 64))

(assert (=> b!561335 (= res!352491 (or (= lt!255441 (select (arr!16929 a!3118) j!142)) (= lt!255441 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5378 0))(
  ( (MissingZero!5378 (index!23739 (_ BitVec 32))) (Found!5378 (index!23740 (_ BitVec 32))) (Intermediate!5378 (undefined!6190 Bool) (index!23741 (_ BitVec 32)) (x!52649 (_ BitVec 32))) (Undefined!5378) (MissingVacant!5378 (index!23742 (_ BitVec 32))) )
))
(declare-fun lt!255438 () SeekEntryResult!5378)

(assert (=> b!561335 (= lt!255441 (select (arr!16929 a!3118) (index!23741 lt!255438)))))

(declare-fun b!561337 () Bool)

(declare-fun res!352497 () Bool)

(declare-fun e!323463 () Bool)

(assert (=> b!561337 (=> (not res!352497) (not e!323463))))

(declare-datatypes ((List!11009 0))(
  ( (Nil!11006) (Cons!11005 (h!12008 (_ BitVec 64)) (t!17237 List!11009)) )
))
(declare-fun arrayNoDuplicates!0 (array!35257 (_ BitVec 32) List!11009) Bool)

(assert (=> b!561337 (= res!352497 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11006))))

(declare-fun b!561338 () Bool)

(declare-fun e!323461 () Bool)

(assert (=> b!561338 (= e!323459 e!323461)))

(declare-fun res!352494 () Bool)

(assert (=> b!561338 (=> (not res!352494) (not e!323461))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255439 () SeekEntryResult!5378)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35257 (_ BitVec 32)) SeekEntryResult!5378)

(assert (=> b!561338 (= res!352494 (= lt!255439 (seekKeyOrZeroReturnVacant!0 (x!52649 lt!255438) (index!23741 lt!255438) (index!23741 lt!255438) (select (arr!16929 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561339 () Bool)

(declare-fun res!352490 () Bool)

(declare-fun e!323457 () Bool)

(assert (=> b!561339 (=> (not res!352490) (not e!323457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561339 (= res!352490 (validKeyInArray!0 (select (arr!16929 a!3118) j!142)))))

(declare-fun b!561340 () Bool)

(declare-fun res!352499 () Bool)

(assert (=> b!561340 (=> (not res!352499) (not e!323457))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561340 (= res!352499 (and (= (size!17293 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17293 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17293 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561341 () Bool)

(declare-fun res!352495 () Bool)

(assert (=> b!561341 (=> (not res!352495) (not e!323457))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!561341 (= res!352495 (validKeyInArray!0 k!1914))))

(declare-fun b!561342 () Bool)

(declare-fun e!323462 () Bool)

(assert (=> b!561342 (= e!323462 (not true))))

(declare-fun e!323460 () Bool)

(assert (=> b!561342 e!323460))

(declare-fun res!352489 () Bool)

(assert (=> b!561342 (=> (not res!352489) (not e!323460))))

(assert (=> b!561342 (= res!352489 (= lt!255439 (Found!5378 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35257 (_ BitVec 32)) SeekEntryResult!5378)

(assert (=> b!561342 (= lt!255439 (seekEntryOrOpen!0 (select (arr!16929 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35257 (_ BitVec 32)) Bool)

(assert (=> b!561342 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17530 0))(
  ( (Unit!17531) )
))
(declare-fun lt!255437 () Unit!17530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17530)

(assert (=> b!561342 (= lt!255437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561343 () Bool)

(declare-fun res!352492 () Bool)

(assert (=> b!561343 (=> (not res!352492) (not e!323463))))

(assert (=> b!561343 (= res!352492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun lt!255442 () (_ BitVec 64))

(declare-fun lt!255443 () array!35257)

(declare-fun b!561336 () Bool)

(assert (=> b!561336 (= e!323461 (= (seekEntryOrOpen!0 lt!255442 lt!255443 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52649 lt!255438) (index!23741 lt!255438) (index!23741 lt!255438) lt!255442 lt!255443 mask!3119)))))

(declare-fun res!352496 () Bool)

(assert (=> start!51392 (=> (not res!352496) (not e!323457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51392 (= res!352496 (validMask!0 mask!3119))))

(assert (=> start!51392 e!323457))

(assert (=> start!51392 true))

(declare-fun array_inv!12725 (array!35257) Bool)

(assert (=> start!51392 (array_inv!12725 a!3118)))

(declare-fun b!561344 () Bool)

(assert (=> b!561344 (= e!323460 e!323456)))

(declare-fun res!352488 () Bool)

(assert (=> b!561344 (=> res!352488 e!323456)))

(assert (=> b!561344 (= res!352488 (or (undefined!6190 lt!255438) (not (is-Intermediate!5378 lt!255438))))))

(declare-fun b!561345 () Bool)

(assert (=> b!561345 (= e!323457 e!323463)))

(declare-fun res!352487 () Bool)

(assert (=> b!561345 (=> (not res!352487) (not e!323463))))

(declare-fun lt!255444 () SeekEntryResult!5378)

(assert (=> b!561345 (= res!352487 (or (= lt!255444 (MissingZero!5378 i!1132)) (= lt!255444 (MissingVacant!5378 i!1132))))))

(assert (=> b!561345 (= lt!255444 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561346 () Bool)

(declare-fun res!352493 () Bool)

(assert (=> b!561346 (=> (not res!352493) (not e!323457))))

(declare-fun arrayContainsKey!0 (array!35257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561346 (= res!352493 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561347 () Bool)

(assert (=> b!561347 (= e!323463 e!323462)))

(declare-fun res!352498 () Bool)

(assert (=> b!561347 (=> (not res!352498) (not e!323462))))

(declare-fun lt!255445 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35257 (_ BitVec 32)) SeekEntryResult!5378)

(assert (=> b!561347 (= res!352498 (= lt!255438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255445 lt!255442 lt!255443 mask!3119)))))

(declare-fun lt!255440 () (_ BitVec 32))

(assert (=> b!561347 (= lt!255438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255440 (select (arr!16929 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561347 (= lt!255445 (toIndex!0 lt!255442 mask!3119))))

(assert (=> b!561347 (= lt!255442 (select (store (arr!16929 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561347 (= lt!255440 (toIndex!0 (select (arr!16929 a!3118) j!142) mask!3119))))

(assert (=> b!561347 (= lt!255443 (array!35258 (store (arr!16929 a!3118) i!1132 k!1914) (size!17293 a!3118)))))

(assert (= (and start!51392 res!352496) b!561340))

(assert (= (and b!561340 res!352499) b!561339))

(assert (= (and b!561339 res!352490) b!561341))

(assert (= (and b!561341 res!352495) b!561346))

(assert (= (and b!561346 res!352493) b!561345))

(assert (= (and b!561345 res!352487) b!561343))

(assert (= (and b!561343 res!352492) b!561337))

(assert (= (and b!561337 res!352497) b!561347))

(assert (= (and b!561347 res!352498) b!561342))

(assert (= (and b!561342 res!352489) b!561344))

(assert (= (and b!561344 (not res!352488)) b!561335))

(assert (= (and b!561335 (not res!352491)) b!561338))

(assert (= (and b!561338 res!352494) b!561336))

(declare-fun m!539217 () Bool)

(assert (=> b!561343 m!539217))

(declare-fun m!539219 () Bool)

(assert (=> b!561341 m!539219))

(declare-fun m!539221 () Bool)

(assert (=> b!561339 m!539221))

(assert (=> b!561339 m!539221))

(declare-fun m!539223 () Bool)

(assert (=> b!561339 m!539223))

(declare-fun m!539225 () Bool)

(assert (=> b!561337 m!539225))

(declare-fun m!539227 () Bool)

(assert (=> b!561336 m!539227))

(declare-fun m!539229 () Bool)

(assert (=> b!561336 m!539229))

(assert (=> b!561338 m!539221))

(assert (=> b!561338 m!539221))

(declare-fun m!539231 () Bool)

(assert (=> b!561338 m!539231))

(declare-fun m!539233 () Bool)

(assert (=> start!51392 m!539233))

(declare-fun m!539235 () Bool)

(assert (=> start!51392 m!539235))

(assert (=> b!561347 m!539221))

(declare-fun m!539237 () Bool)

(assert (=> b!561347 m!539237))

(assert (=> b!561347 m!539221))

(declare-fun m!539239 () Bool)

(assert (=> b!561347 m!539239))

(assert (=> b!561347 m!539221))

(declare-fun m!539241 () Bool)

(assert (=> b!561347 m!539241))

(declare-fun m!539243 () Bool)

(assert (=> b!561347 m!539243))

(declare-fun m!539245 () Bool)

(assert (=> b!561347 m!539245))

(declare-fun m!539247 () Bool)

(assert (=> b!561347 m!539247))

(declare-fun m!539249 () Bool)

(assert (=> b!561345 m!539249))

(assert (=> b!561342 m!539221))

(assert (=> b!561342 m!539221))

(declare-fun m!539251 () Bool)

(assert (=> b!561342 m!539251))

(declare-fun m!539253 () Bool)

(assert (=> b!561342 m!539253))

(declare-fun m!539255 () Bool)

(assert (=> b!561342 m!539255))

(declare-fun m!539257 () Bool)

(assert (=> b!561346 m!539257))

(assert (=> b!561335 m!539221))

(declare-fun m!539259 () Bool)

(assert (=> b!561335 m!539259))

(push 1)

