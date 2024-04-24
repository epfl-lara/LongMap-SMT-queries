; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52200 () Bool)

(assert start!52200)

(declare-fun b!569438 () Bool)

(declare-fun res!359351 () Bool)

(declare-fun e!327619 () Bool)

(assert (=> b!569438 (=> (not res!359351) (not e!327619))))

(declare-datatypes ((array!35670 0))(
  ( (array!35671 (arr!17125 (Array (_ BitVec 32) (_ BitVec 64))) (size!17489 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35670)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569438 (= res!359351 (validKeyInArray!0 (select (arr!17125 a!3118) j!142)))))

(declare-fun b!569439 () Bool)

(declare-fun e!327621 () Bool)

(assert (=> b!569439 (= e!327619 e!327621)))

(declare-fun res!359353 () Bool)

(assert (=> b!569439 (=> (not res!359353) (not e!327621))))

(declare-datatypes ((SeekEntryResult!5530 0))(
  ( (MissingZero!5530 (index!24347 (_ BitVec 32))) (Found!5530 (index!24348 (_ BitVec 32))) (Intermediate!5530 (undefined!6342 Bool) (index!24349 (_ BitVec 32)) (x!53376 (_ BitVec 32))) (Undefined!5530) (MissingVacant!5530 (index!24350 (_ BitVec 32))) )
))
(declare-fun lt!259525 () SeekEntryResult!5530)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569439 (= res!359353 (or (= lt!259525 (MissingZero!5530 i!1132)) (= lt!259525 (MissingVacant!5530 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35670 (_ BitVec 32)) SeekEntryResult!5530)

(assert (=> b!569439 (= lt!259525 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569440 () Bool)

(declare-fun res!359352 () Bool)

(assert (=> b!569440 (=> (not res!359352) (not e!327619))))

(assert (=> b!569440 (= res!359352 (and (= (size!17489 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17489 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17489 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569441 () Bool)

(declare-fun res!359354 () Bool)

(assert (=> b!569441 (=> (not res!359354) (not e!327621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35670 (_ BitVec 32)) Bool)

(assert (=> b!569441 (= res!359354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569442 () Bool)

(declare-fun res!359359 () Bool)

(assert (=> b!569442 (=> (not res!359359) (not e!327619))))

(assert (=> b!569442 (= res!359359 (validKeyInArray!0 k0!1914))))

(declare-fun b!569443 () Bool)

(declare-fun e!327620 () Bool)

(assert (=> b!569443 (= e!327620 (not true))))

(declare-fun lt!259521 () SeekEntryResult!5530)

(declare-fun lt!259524 () SeekEntryResult!5530)

(get-info :version)

(assert (=> b!569443 (and (= lt!259524 (Found!5530 j!142)) (or (undefined!6342 lt!259521) (not ((_ is Intermediate!5530) lt!259521)) (= (select (arr!17125 a!3118) (index!24349 lt!259521)) (select (arr!17125 a!3118) j!142)) (not (= (select (arr!17125 a!3118) (index!24349 lt!259521)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259524 (MissingZero!5530 (index!24349 lt!259521)))))))

(assert (=> b!569443 (= lt!259524 (seekEntryOrOpen!0 (select (arr!17125 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569443 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17833 0))(
  ( (Unit!17834) )
))
(declare-fun lt!259522 () Unit!17833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17833)

(assert (=> b!569443 (= lt!259522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359356 () Bool)

(assert (=> start!52200 (=> (not res!359356) (not e!327619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52200 (= res!359356 (validMask!0 mask!3119))))

(assert (=> start!52200 e!327619))

(assert (=> start!52200 true))

(declare-fun array_inv!12984 (array!35670) Bool)

(assert (=> start!52200 (array_inv!12984 a!3118)))

(declare-fun b!569444 () Bool)

(assert (=> b!569444 (= e!327621 e!327620)))

(declare-fun res!359358 () Bool)

(assert (=> b!569444 (=> (not res!359358) (not e!327620))))

(declare-fun lt!259523 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35670 (_ BitVec 32)) SeekEntryResult!5530)

(assert (=> b!569444 (= res!359358 (= lt!259521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259523 (select (store (arr!17125 a!3118) i!1132 k0!1914) j!142) (array!35671 (store (arr!17125 a!3118) i!1132 k0!1914) (size!17489 a!3118)) mask!3119)))))

(declare-fun lt!259520 () (_ BitVec 32))

(assert (=> b!569444 (= lt!259521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259520 (select (arr!17125 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569444 (= lt!259523 (toIndex!0 (select (store (arr!17125 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569444 (= lt!259520 (toIndex!0 (select (arr!17125 a!3118) j!142) mask!3119))))

(declare-fun b!569445 () Bool)

(declare-fun res!359355 () Bool)

(assert (=> b!569445 (=> (not res!359355) (not e!327619))))

(declare-fun arrayContainsKey!0 (array!35670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569445 (= res!359355 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569446 () Bool)

(declare-fun res!359357 () Bool)

(assert (=> b!569446 (=> (not res!359357) (not e!327621))))

(declare-datatypes ((List!11112 0))(
  ( (Nil!11109) (Cons!11108 (h!12132 (_ BitVec 64)) (t!17332 List!11112)) )
))
(declare-fun arrayNoDuplicates!0 (array!35670 (_ BitVec 32) List!11112) Bool)

(assert (=> b!569446 (= res!359357 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11109))))

(assert (= (and start!52200 res!359356) b!569440))

(assert (= (and b!569440 res!359352) b!569438))

(assert (= (and b!569438 res!359351) b!569442))

(assert (= (and b!569442 res!359359) b!569445))

(assert (= (and b!569445 res!359355) b!569439))

(assert (= (and b!569439 res!359353) b!569441))

(assert (= (and b!569441 res!359354) b!569446))

(assert (= (and b!569446 res!359357) b!569444))

(assert (= (and b!569444 res!359358) b!569443))

(declare-fun m!548225 () Bool)

(assert (=> b!569439 m!548225))

(declare-fun m!548227 () Bool)

(assert (=> b!569444 m!548227))

(declare-fun m!548229 () Bool)

(assert (=> b!569444 m!548229))

(assert (=> b!569444 m!548227))

(declare-fun m!548231 () Bool)

(assert (=> b!569444 m!548231))

(declare-fun m!548233 () Bool)

(assert (=> b!569444 m!548233))

(assert (=> b!569444 m!548231))

(declare-fun m!548235 () Bool)

(assert (=> b!569444 m!548235))

(assert (=> b!569444 m!548231))

(declare-fun m!548237 () Bool)

(assert (=> b!569444 m!548237))

(assert (=> b!569444 m!548227))

(declare-fun m!548239 () Bool)

(assert (=> b!569444 m!548239))

(assert (=> b!569443 m!548227))

(declare-fun m!548241 () Bool)

(assert (=> b!569443 m!548241))

(declare-fun m!548243 () Bool)

(assert (=> b!569443 m!548243))

(declare-fun m!548245 () Bool)

(assert (=> b!569443 m!548245))

(assert (=> b!569443 m!548227))

(declare-fun m!548247 () Bool)

(assert (=> b!569443 m!548247))

(declare-fun m!548249 () Bool)

(assert (=> b!569442 m!548249))

(declare-fun m!548251 () Bool)

(assert (=> b!569445 m!548251))

(declare-fun m!548253 () Bool)

(assert (=> start!52200 m!548253))

(declare-fun m!548255 () Bool)

(assert (=> start!52200 m!548255))

(declare-fun m!548257 () Bool)

(assert (=> b!569446 m!548257))

(declare-fun m!548259 () Bool)

(assert (=> b!569441 m!548259))

(assert (=> b!569438 m!548227))

(assert (=> b!569438 m!548227))

(declare-fun m!548261 () Bool)

(assert (=> b!569438 m!548261))

(check-sat (not b!569446) (not b!569438) (not b!569444) (not start!52200) (not b!569445) (not b!569442) (not b!569439) (not b!569443) (not b!569441))
(check-sat)
