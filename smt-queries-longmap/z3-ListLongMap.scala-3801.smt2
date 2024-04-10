; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52162 () Bool)

(assert start!52162)

(declare-fun b!569347 () Bool)

(declare-fun res!359364 () Bool)

(declare-fun e!327540 () Bool)

(assert (=> b!569347 (=> (not res!359364) (not e!327540))))

(declare-datatypes ((array!35685 0))(
  ( (array!35686 (arr!17134 (Array (_ BitVec 32) (_ BitVec 64))) (size!17498 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35685)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35685 (_ BitVec 32)) Bool)

(assert (=> b!569347 (= res!359364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569348 () Bool)

(declare-fun e!327538 () Bool)

(assert (=> b!569348 (= e!327540 e!327538)))

(declare-fun res!359370 () Bool)

(assert (=> b!569348 (=> (not res!359370) (not e!327538))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5583 0))(
  ( (MissingZero!5583 (index!24559 (_ BitVec 32))) (Found!5583 (index!24560 (_ BitVec 32))) (Intermediate!5583 (undefined!6395 Bool) (index!24561 (_ BitVec 32)) (x!53434 (_ BitVec 32))) (Undefined!5583) (MissingVacant!5583 (index!24562 (_ BitVec 32))) )
))
(declare-fun lt!259483 () SeekEntryResult!5583)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!259482 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35685 (_ BitVec 32)) SeekEntryResult!5583)

(assert (=> b!569348 (= res!359370 (= lt!259483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259482 (select (store (arr!17134 a!3118) i!1132 k0!1914) j!142) (array!35686 (store (arr!17134 a!3118) i!1132 k0!1914) (size!17498 a!3118)) mask!3119)))))

(declare-fun lt!259486 () (_ BitVec 32))

(assert (=> b!569348 (= lt!259483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259486 (select (arr!17134 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569348 (= lt!259482 (toIndex!0 (select (store (arr!17134 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569348 (= lt!259486 (toIndex!0 (select (arr!17134 a!3118) j!142) mask!3119))))

(declare-fun b!569349 () Bool)

(declare-fun res!359367 () Bool)

(declare-fun e!327537 () Bool)

(assert (=> b!569349 (=> (not res!359367) (not e!327537))))

(assert (=> b!569349 (= res!359367 (and (= (size!17498 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17498 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17498 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569350 () Bool)

(declare-fun res!359368 () Bool)

(assert (=> b!569350 (=> (not res!359368) (not e!327537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569350 (= res!359368 (validKeyInArray!0 k0!1914))))

(declare-fun b!569351 () Bool)

(declare-fun res!359365 () Bool)

(assert (=> b!569351 (=> (not res!359365) (not e!327537))))

(assert (=> b!569351 (= res!359365 (validKeyInArray!0 (select (arr!17134 a!3118) j!142)))))

(declare-fun b!569352 () Bool)

(assert (=> b!569352 (= e!327537 e!327540)))

(declare-fun res!359369 () Bool)

(assert (=> b!569352 (=> (not res!359369) (not e!327540))))

(declare-fun lt!259485 () SeekEntryResult!5583)

(assert (=> b!569352 (= res!359369 (or (= lt!259485 (MissingZero!5583 i!1132)) (= lt!259485 (MissingVacant!5583 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35685 (_ BitVec 32)) SeekEntryResult!5583)

(assert (=> b!569352 (= lt!259485 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569353 () Bool)

(declare-fun res!359366 () Bool)

(assert (=> b!569353 (=> (not res!359366) (not e!327540))))

(declare-datatypes ((List!11214 0))(
  ( (Nil!11211) (Cons!11210 (h!12231 (_ BitVec 64)) (t!17442 List!11214)) )
))
(declare-fun arrayNoDuplicates!0 (array!35685 (_ BitVec 32) List!11214) Bool)

(assert (=> b!569353 (= res!359366 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11211))))

(declare-fun b!569354 () Bool)

(get-info :version)

(assert (=> b!569354 (= e!327538 (not (or (undefined!6395 lt!259483) (not ((_ is Intermediate!5583) lt!259483)) (= (select (arr!17134 a!3118) (index!24561 lt!259483)) (select (arr!17134 a!3118) j!142)) (not (= (select (arr!17134 a!3118) (index!24561 lt!259483)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!259481 () SeekEntryResult!5583)

(assert (=> b!569354 (and (= lt!259481 (Found!5583 j!142)) (or (undefined!6395 lt!259483) (not ((_ is Intermediate!5583) lt!259483)) (= (select (arr!17134 a!3118) (index!24561 lt!259483)) (select (arr!17134 a!3118) j!142)) (not (= (select (arr!17134 a!3118) (index!24561 lt!259483)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259481 (MissingZero!5583 (index!24561 lt!259483)))))))

(assert (=> b!569354 (= lt!259481 (seekEntryOrOpen!0 (select (arr!17134 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569354 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17868 0))(
  ( (Unit!17869) )
))
(declare-fun lt!259484 () Unit!17868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17868)

(assert (=> b!569354 (= lt!259484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569346 () Bool)

(declare-fun res!359371 () Bool)

(assert (=> b!569346 (=> (not res!359371) (not e!327537))))

(declare-fun arrayContainsKey!0 (array!35685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569346 (= res!359371 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!359372 () Bool)

(assert (=> start!52162 (=> (not res!359372) (not e!327537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52162 (= res!359372 (validMask!0 mask!3119))))

(assert (=> start!52162 e!327537))

(assert (=> start!52162 true))

(declare-fun array_inv!12930 (array!35685) Bool)

(assert (=> start!52162 (array_inv!12930 a!3118)))

(assert (= (and start!52162 res!359372) b!569349))

(assert (= (and b!569349 res!359367) b!569351))

(assert (= (and b!569351 res!359365) b!569350))

(assert (= (and b!569350 res!359368) b!569346))

(assert (= (and b!569346 res!359371) b!569352))

(assert (= (and b!569352 res!359369) b!569347))

(assert (= (and b!569347 res!359364) b!569353))

(assert (= (and b!569353 res!359366) b!569348))

(assert (= (and b!569348 res!359370) b!569354))

(declare-fun m!548039 () Bool)

(assert (=> b!569354 m!548039))

(declare-fun m!548041 () Bool)

(assert (=> b!569354 m!548041))

(declare-fun m!548043 () Bool)

(assert (=> b!569354 m!548043))

(declare-fun m!548045 () Bool)

(assert (=> b!569354 m!548045))

(assert (=> b!569354 m!548039))

(declare-fun m!548047 () Bool)

(assert (=> b!569354 m!548047))

(declare-fun m!548049 () Bool)

(assert (=> b!569352 m!548049))

(declare-fun m!548051 () Bool)

(assert (=> b!569347 m!548051))

(declare-fun m!548053 () Bool)

(assert (=> b!569346 m!548053))

(declare-fun m!548055 () Bool)

(assert (=> b!569353 m!548055))

(assert (=> b!569348 m!548039))

(declare-fun m!548057 () Bool)

(assert (=> b!569348 m!548057))

(assert (=> b!569348 m!548039))

(declare-fun m!548059 () Bool)

(assert (=> b!569348 m!548059))

(assert (=> b!569348 m!548039))

(declare-fun m!548061 () Bool)

(assert (=> b!569348 m!548061))

(assert (=> b!569348 m!548061))

(declare-fun m!548063 () Bool)

(assert (=> b!569348 m!548063))

(declare-fun m!548065 () Bool)

(assert (=> b!569348 m!548065))

(assert (=> b!569348 m!548061))

(declare-fun m!548067 () Bool)

(assert (=> b!569348 m!548067))

(assert (=> b!569351 m!548039))

(assert (=> b!569351 m!548039))

(declare-fun m!548069 () Bool)

(assert (=> b!569351 m!548069))

(declare-fun m!548071 () Bool)

(assert (=> b!569350 m!548071))

(declare-fun m!548073 () Bool)

(assert (=> start!52162 m!548073))

(declare-fun m!548075 () Bool)

(assert (=> start!52162 m!548075))

(check-sat (not b!569351) (not b!569352) (not b!569353) (not b!569354) (not start!52162) (not b!569348) (not b!569350) (not b!569346) (not b!569347))
(check-sat)
