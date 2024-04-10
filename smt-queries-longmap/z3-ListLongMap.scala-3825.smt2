; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52438 () Bool)

(assert start!52438)

(declare-fun b!572504 () Bool)

(declare-fun res!362019 () Bool)

(declare-fun e!329321 () Bool)

(assert (=> b!572504 (=> (not res!362019) (not e!329321))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35835 0))(
  ( (array!35836 (arr!17206 (Array (_ BitVec 32) (_ BitVec 64))) (size!17570 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35835)

(assert (=> b!572504 (= res!362019 (and (= (size!17570 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17570 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17570 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572505 () Bool)

(declare-fun e!329315 () Bool)

(declare-fun e!329318 () Bool)

(assert (=> b!572505 (= e!329315 e!329318)))

(declare-fun res!362018 () Bool)

(assert (=> b!572505 (=> (not res!362018) (not e!329318))))

(declare-fun lt!261284 () (_ BitVec 64))

(declare-fun lt!261282 () (_ BitVec 32))

(declare-fun lt!261287 () array!35835)

(declare-datatypes ((SeekEntryResult!5655 0))(
  ( (MissingZero!5655 (index!24847 (_ BitVec 32))) (Found!5655 (index!24848 (_ BitVec 32))) (Intermediate!5655 (undefined!6467 Bool) (index!24849 (_ BitVec 32)) (x!53716 (_ BitVec 32))) (Undefined!5655) (MissingVacant!5655 (index!24850 (_ BitVec 32))) )
))
(declare-fun lt!261289 () SeekEntryResult!5655)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35835 (_ BitVec 32)) SeekEntryResult!5655)

(assert (=> b!572505 (= res!362018 (= lt!261289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261282 lt!261284 lt!261287 mask!3119)))))

(declare-fun lt!261286 () (_ BitVec 32))

(assert (=> b!572505 (= lt!261289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261286 (select (arr!17206 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572505 (= lt!261282 (toIndex!0 lt!261284 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!572505 (= lt!261284 (select (store (arr!17206 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572505 (= lt!261286 (toIndex!0 (select (arr!17206 a!3118) j!142) mask!3119))))

(assert (=> b!572505 (= lt!261287 (array!35836 (store (arr!17206 a!3118) i!1132 k0!1914) (size!17570 a!3118)))))

(declare-fun b!572506 () Bool)

(declare-fun res!362017 () Bool)

(assert (=> b!572506 (=> (not res!362017) (not e!329321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572506 (= res!362017 (validKeyInArray!0 (select (arr!17206 a!3118) j!142)))))

(declare-fun b!572507 () Bool)

(assert (=> b!572507 (= e!329318 (not true))))

(declare-fun e!329320 () Bool)

(assert (=> b!572507 e!329320))

(declare-fun res!362021 () Bool)

(assert (=> b!572507 (=> (not res!362021) (not e!329320))))

(declare-fun lt!261288 () SeekEntryResult!5655)

(assert (=> b!572507 (= res!362021 (= lt!261288 (Found!5655 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35835 (_ BitVec 32)) SeekEntryResult!5655)

(assert (=> b!572507 (= lt!261288 (seekEntryOrOpen!0 (select (arr!17206 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35835 (_ BitVec 32)) Bool)

(assert (=> b!572507 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18012 0))(
  ( (Unit!18013) )
))
(declare-fun lt!261285 () Unit!18012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18012)

(assert (=> b!572507 (= lt!261285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572508 () Bool)

(declare-fun e!329322 () Bool)

(declare-fun e!329316 () Bool)

(assert (=> b!572508 (= e!329322 e!329316)))

(declare-fun res!362020 () Bool)

(assert (=> b!572508 (=> res!362020 e!329316)))

(declare-fun lt!261283 () (_ BitVec 64))

(assert (=> b!572508 (= res!362020 (or (= lt!261283 (select (arr!17206 a!3118) j!142)) (= lt!261283 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572508 (= lt!261283 (select (arr!17206 a!3118) (index!24849 lt!261289)))))

(declare-fun b!572509 () Bool)

(declare-fun res!362015 () Bool)

(assert (=> b!572509 (=> (not res!362015) (not e!329321))))

(assert (=> b!572509 (= res!362015 (validKeyInArray!0 k0!1914))))

(declare-fun b!572510 () Bool)

(declare-fun res!362012 () Bool)

(assert (=> b!572510 (=> (not res!362012) (not e!329315))))

(assert (=> b!572510 (= res!362012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!362023 () Bool)

(assert (=> start!52438 (=> (not res!362023) (not e!329321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52438 (= res!362023 (validMask!0 mask!3119))))

(assert (=> start!52438 e!329321))

(assert (=> start!52438 true))

(declare-fun array_inv!13002 (array!35835) Bool)

(assert (=> start!52438 (array_inv!13002 a!3118)))

(declare-fun e!329319 () Bool)

(declare-fun b!572511 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35835 (_ BitVec 32)) SeekEntryResult!5655)

(assert (=> b!572511 (= e!329319 (= (seekEntryOrOpen!0 lt!261284 lt!261287 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53716 lt!261289) (index!24849 lt!261289) (index!24849 lt!261289) lt!261284 lt!261287 mask!3119)))))

(declare-fun b!572512 () Bool)

(declare-fun res!362016 () Bool)

(assert (=> b!572512 (=> (not res!362016) (not e!329315))))

(declare-datatypes ((List!11286 0))(
  ( (Nil!11283) (Cons!11282 (h!12309 (_ BitVec 64)) (t!17514 List!11286)) )
))
(declare-fun arrayNoDuplicates!0 (array!35835 (_ BitVec 32) List!11286) Bool)

(assert (=> b!572512 (= res!362016 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11283))))

(declare-fun b!572513 () Bool)

(declare-fun res!362022 () Bool)

(assert (=> b!572513 (=> (not res!362022) (not e!329321))))

(declare-fun arrayContainsKey!0 (array!35835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572513 (= res!362022 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572514 () Bool)

(assert (=> b!572514 (= e!329320 e!329322)))

(declare-fun res!362013 () Bool)

(assert (=> b!572514 (=> res!362013 e!329322)))

(get-info :version)

(assert (=> b!572514 (= res!362013 (or (undefined!6467 lt!261289) (not ((_ is Intermediate!5655) lt!261289))))))

(declare-fun b!572515 () Bool)

(assert (=> b!572515 (= e!329316 e!329319)))

(declare-fun res!362014 () Bool)

(assert (=> b!572515 (=> (not res!362014) (not e!329319))))

(assert (=> b!572515 (= res!362014 (= lt!261288 (seekKeyOrZeroReturnVacant!0 (x!53716 lt!261289) (index!24849 lt!261289) (index!24849 lt!261289) (select (arr!17206 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572516 () Bool)

(assert (=> b!572516 (= e!329321 e!329315)))

(declare-fun res!362024 () Bool)

(assert (=> b!572516 (=> (not res!362024) (not e!329315))))

(declare-fun lt!261281 () SeekEntryResult!5655)

(assert (=> b!572516 (= res!362024 (or (= lt!261281 (MissingZero!5655 i!1132)) (= lt!261281 (MissingVacant!5655 i!1132))))))

(assert (=> b!572516 (= lt!261281 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52438 res!362023) b!572504))

(assert (= (and b!572504 res!362019) b!572506))

(assert (= (and b!572506 res!362017) b!572509))

(assert (= (and b!572509 res!362015) b!572513))

(assert (= (and b!572513 res!362022) b!572516))

(assert (= (and b!572516 res!362024) b!572510))

(assert (= (and b!572510 res!362012) b!572512))

(assert (= (and b!572512 res!362016) b!572505))

(assert (= (and b!572505 res!362018) b!572507))

(assert (= (and b!572507 res!362021) b!572514))

(assert (= (and b!572514 (not res!362013)) b!572508))

(assert (= (and b!572508 (not res!362020)) b!572515))

(assert (= (and b!572515 res!362014) b!572511))

(declare-fun m!551489 () Bool)

(assert (=> start!52438 m!551489))

(declare-fun m!551491 () Bool)

(assert (=> start!52438 m!551491))

(declare-fun m!551493 () Bool)

(assert (=> b!572509 m!551493))

(declare-fun m!551495 () Bool)

(assert (=> b!572507 m!551495))

(assert (=> b!572507 m!551495))

(declare-fun m!551497 () Bool)

(assert (=> b!572507 m!551497))

(declare-fun m!551499 () Bool)

(assert (=> b!572507 m!551499))

(declare-fun m!551501 () Bool)

(assert (=> b!572507 m!551501))

(declare-fun m!551503 () Bool)

(assert (=> b!572510 m!551503))

(assert (=> b!572505 m!551495))

(declare-fun m!551505 () Bool)

(assert (=> b!572505 m!551505))

(declare-fun m!551507 () Bool)

(assert (=> b!572505 m!551507))

(assert (=> b!572505 m!551495))

(declare-fun m!551509 () Bool)

(assert (=> b!572505 m!551509))

(declare-fun m!551511 () Bool)

(assert (=> b!572505 m!551511))

(assert (=> b!572505 m!551495))

(declare-fun m!551513 () Bool)

(assert (=> b!572505 m!551513))

(declare-fun m!551515 () Bool)

(assert (=> b!572505 m!551515))

(assert (=> b!572515 m!551495))

(assert (=> b!572515 m!551495))

(declare-fun m!551517 () Bool)

(assert (=> b!572515 m!551517))

(assert (=> b!572508 m!551495))

(declare-fun m!551519 () Bool)

(assert (=> b!572508 m!551519))

(declare-fun m!551521 () Bool)

(assert (=> b!572513 m!551521))

(assert (=> b!572506 m!551495))

(assert (=> b!572506 m!551495))

(declare-fun m!551523 () Bool)

(assert (=> b!572506 m!551523))

(declare-fun m!551525 () Bool)

(assert (=> b!572516 m!551525))

(declare-fun m!551527 () Bool)

(assert (=> b!572511 m!551527))

(declare-fun m!551529 () Bool)

(assert (=> b!572511 m!551529))

(declare-fun m!551531 () Bool)

(assert (=> b!572512 m!551531))

(check-sat (not b!572516) (not b!572515) (not b!572509) (not b!572511) (not start!52438) (not b!572513) (not b!572512) (not b!572506) (not b!572505) (not b!572510) (not b!572507))
(check-sat)
