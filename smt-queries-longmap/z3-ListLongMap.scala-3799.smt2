; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52194 () Bool)

(assert start!52194)

(declare-fun b!569357 () Bool)

(declare-fun res!359277 () Bool)

(declare-fun e!327585 () Bool)

(assert (=> b!569357 (=> (not res!359277) (not e!327585))))

(declare-datatypes ((array!35664 0))(
  ( (array!35665 (arr!17122 (Array (_ BitVec 32) (_ BitVec 64))) (size!17486 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35664)

(declare-datatypes ((List!11109 0))(
  ( (Nil!11106) (Cons!11105 (h!12129 (_ BitVec 64)) (t!17329 List!11109)) )
))
(declare-fun arrayNoDuplicates!0 (array!35664 (_ BitVec 32) List!11109) Bool)

(assert (=> b!569357 (= res!359277 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11106))))

(declare-fun b!569359 () Bool)

(declare-fun res!359273 () Bool)

(declare-fun e!327583 () Bool)

(assert (=> b!569359 (=> (not res!359273) (not e!327583))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569359 (= res!359273 (validKeyInArray!0 k0!1914))))

(declare-fun e!327582 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!569360 () Bool)

(declare-datatypes ((SeekEntryResult!5527 0))(
  ( (MissingZero!5527 (index!24335 (_ BitVec 32))) (Found!5527 (index!24336 (_ BitVec 32))) (Intermediate!5527 (undefined!6339 Bool) (index!24337 (_ BitVec 32)) (x!53365 (_ BitVec 32))) (Undefined!5527) (MissingVacant!5527 (index!24338 (_ BitVec 32))) )
))
(declare-fun lt!259469 () SeekEntryResult!5527)

(get-info :version)

(assert (=> b!569360 (= e!327582 (not (or (undefined!6339 lt!259469) (not ((_ is Intermediate!5527) lt!259469)) (= (select (arr!17122 a!3118) (index!24337 lt!259469)) (select (arr!17122 a!3118) j!142)) (not (= (select (arr!17122 a!3118) (index!24337 lt!259469)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!17486 a!3118)) (bvsle j!142 (size!17486 a!3118)))))))

(declare-fun lt!259471 () SeekEntryResult!5527)

(assert (=> b!569360 (and (= lt!259471 (Found!5527 j!142)) (or (undefined!6339 lt!259469) (not ((_ is Intermediate!5527) lt!259469)) (= (select (arr!17122 a!3118) (index!24337 lt!259469)) (select (arr!17122 a!3118) j!142)) (not (= (select (arr!17122 a!3118) (index!24337 lt!259469)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259471 (MissingZero!5527 (index!24337 lt!259469)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35664 (_ BitVec 32)) SeekEntryResult!5527)

(assert (=> b!569360 (= lt!259471 (seekEntryOrOpen!0 (select (arr!17122 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35664 (_ BitVec 32)) Bool)

(assert (=> b!569360 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17827 0))(
  ( (Unit!17828) )
))
(declare-fun lt!259470 () Unit!17827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17827)

(assert (=> b!569360 (= lt!259470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569361 () Bool)

(declare-fun res!359275 () Bool)

(assert (=> b!569361 (=> (not res!359275) (not e!327583))))

(declare-fun arrayContainsKey!0 (array!35664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569361 (= res!359275 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569362 () Bool)

(declare-fun res!359271 () Bool)

(assert (=> b!569362 (=> (not res!359271) (not e!327585))))

(assert (=> b!569362 (= res!359271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569363 () Bool)

(declare-fun res!359274 () Bool)

(assert (=> b!569363 (=> (not res!359274) (not e!327583))))

(assert (=> b!569363 (= res!359274 (validKeyInArray!0 (select (arr!17122 a!3118) j!142)))))

(declare-fun b!569358 () Bool)

(declare-fun res!359270 () Bool)

(assert (=> b!569358 (=> (not res!359270) (not e!327583))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569358 (= res!359270 (and (= (size!17486 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17486 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17486 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359278 () Bool)

(assert (=> start!52194 (=> (not res!359278) (not e!327583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52194 (= res!359278 (validMask!0 mask!3119))))

(assert (=> start!52194 e!327583))

(assert (=> start!52194 true))

(declare-fun array_inv!12981 (array!35664) Bool)

(assert (=> start!52194 (array_inv!12981 a!3118)))

(declare-fun b!569364 () Bool)

(assert (=> b!569364 (= e!327585 e!327582)))

(declare-fun res!359276 () Bool)

(assert (=> b!569364 (=> (not res!359276) (not e!327582))))

(declare-fun lt!259467 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35664 (_ BitVec 32)) SeekEntryResult!5527)

(assert (=> b!569364 (= res!359276 (= lt!259469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259467 (select (store (arr!17122 a!3118) i!1132 k0!1914) j!142) (array!35665 (store (arr!17122 a!3118) i!1132 k0!1914) (size!17486 a!3118)) mask!3119)))))

(declare-fun lt!259468 () (_ BitVec 32))

(assert (=> b!569364 (= lt!259469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259468 (select (arr!17122 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569364 (= lt!259467 (toIndex!0 (select (store (arr!17122 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569364 (= lt!259468 (toIndex!0 (select (arr!17122 a!3118) j!142) mask!3119))))

(declare-fun b!569365 () Bool)

(assert (=> b!569365 (= e!327583 e!327585)))

(declare-fun res!359272 () Bool)

(assert (=> b!569365 (=> (not res!359272) (not e!327585))))

(declare-fun lt!259466 () SeekEntryResult!5527)

(assert (=> b!569365 (= res!359272 (or (= lt!259466 (MissingZero!5527 i!1132)) (= lt!259466 (MissingVacant!5527 i!1132))))))

(assert (=> b!569365 (= lt!259466 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52194 res!359278) b!569358))

(assert (= (and b!569358 res!359270) b!569363))

(assert (= (and b!569363 res!359274) b!569359))

(assert (= (and b!569359 res!359273) b!569361))

(assert (= (and b!569361 res!359275) b!569365))

(assert (= (and b!569365 res!359272) b!569362))

(assert (= (and b!569362 res!359271) b!569357))

(assert (= (and b!569357 res!359277) b!569364))

(assert (= (and b!569364 res!359276) b!569360))

(declare-fun m!548111 () Bool)

(assert (=> b!569364 m!548111))

(declare-fun m!548113 () Bool)

(assert (=> b!569364 m!548113))

(assert (=> b!569364 m!548111))

(assert (=> b!569364 m!548111))

(declare-fun m!548115 () Bool)

(assert (=> b!569364 m!548115))

(declare-fun m!548117 () Bool)

(assert (=> b!569364 m!548117))

(assert (=> b!569364 m!548117))

(declare-fun m!548119 () Bool)

(assert (=> b!569364 m!548119))

(declare-fun m!548121 () Bool)

(assert (=> b!569364 m!548121))

(assert (=> b!569364 m!548117))

(declare-fun m!548123 () Bool)

(assert (=> b!569364 m!548123))

(declare-fun m!548125 () Bool)

(assert (=> b!569357 m!548125))

(declare-fun m!548127 () Bool)

(assert (=> b!569365 m!548127))

(declare-fun m!548129 () Bool)

(assert (=> b!569359 m!548129))

(assert (=> b!569360 m!548111))

(declare-fun m!548131 () Bool)

(assert (=> b!569360 m!548131))

(declare-fun m!548133 () Bool)

(assert (=> b!569360 m!548133))

(declare-fun m!548135 () Bool)

(assert (=> b!569360 m!548135))

(assert (=> b!569360 m!548111))

(declare-fun m!548137 () Bool)

(assert (=> b!569360 m!548137))

(declare-fun m!548139 () Bool)

(assert (=> b!569361 m!548139))

(declare-fun m!548141 () Bool)

(assert (=> b!569362 m!548141))

(declare-fun m!548143 () Bool)

(assert (=> start!52194 m!548143))

(declare-fun m!548145 () Bool)

(assert (=> start!52194 m!548145))

(assert (=> b!569363 m!548111))

(assert (=> b!569363 m!548111))

(declare-fun m!548147 () Bool)

(assert (=> b!569363 m!548147))

(check-sat (not b!569361) (not b!569363) (not b!569357) (not b!569364) (not b!569360) (not b!569362) (not b!569359) (not start!52194) (not b!569365))
(check-sat)
