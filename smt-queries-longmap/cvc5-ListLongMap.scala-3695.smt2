; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50786 () Bool)

(assert start!50786)

(declare-fun res!348022 () Bool)

(declare-fun e!320209 () Bool)

(assert (=> start!50786 (=> (not res!348022) (not e!320209))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50786 (= res!348022 (validMask!0 mask!3119))))

(assert (=> start!50786 e!320209))

(assert (=> start!50786 true))

(declare-datatypes ((array!35011 0))(
  ( (array!35012 (arr!16815 (Array (_ BitVec 32) (_ BitVec 64))) (size!17179 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35011)

(declare-fun array_inv!12611 (array!35011) Bool)

(assert (=> start!50786 (array_inv!12611 a!3118)))

(declare-fun b!555603 () Bool)

(declare-fun e!320211 () Bool)

(assert (=> b!555603 (= e!320209 e!320211)))

(declare-fun res!348019 () Bool)

(assert (=> b!555603 (=> (not res!348019) (not e!320211))))

(declare-datatypes ((SeekEntryResult!5264 0))(
  ( (MissingZero!5264 (index!23283 (_ BitVec 32))) (Found!5264 (index!23284 (_ BitVec 32))) (Intermediate!5264 (undefined!6076 Bool) (index!23285 (_ BitVec 32)) (x!52186 (_ BitVec 32))) (Undefined!5264) (MissingVacant!5264 (index!23286 (_ BitVec 32))) )
))
(declare-fun lt!252529 () SeekEntryResult!5264)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555603 (= res!348019 (or (= lt!252529 (MissingZero!5264 i!1132)) (= lt!252529 (MissingVacant!5264 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35011 (_ BitVec 32)) SeekEntryResult!5264)

(assert (=> b!555603 (= lt!252529 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555604 () Bool)

(declare-fun res!348018 () Bool)

(assert (=> b!555604 (=> (not res!348018) (not e!320209))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!555604 (= res!348018 (and (= (size!17179 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17179 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17179 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555605 () Bool)

(declare-fun e!320210 () Bool)

(assert (=> b!555605 (= e!320210 (not true))))

(declare-fun lt!252526 () SeekEntryResult!5264)

(declare-fun lt!252525 () SeekEntryResult!5264)

(assert (=> b!555605 (and (= lt!252526 (Found!5264 j!142)) (or (undefined!6076 lt!252525) (not (is-Intermediate!5264 lt!252525)) (= (select (arr!16815 a!3118) (index!23285 lt!252525)) (select (arr!16815 a!3118) j!142)) (not (= (select (arr!16815 a!3118) (index!23285 lt!252525)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252526 (MissingZero!5264 (index!23285 lt!252525)))))))

(assert (=> b!555605 (= lt!252526 (seekEntryOrOpen!0 (select (arr!16815 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35011 (_ BitVec 32)) Bool)

(assert (=> b!555605 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17302 0))(
  ( (Unit!17303) )
))
(declare-fun lt!252524 () Unit!17302)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35011 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17302)

(assert (=> b!555605 (= lt!252524 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555606 () Bool)

(declare-fun res!348017 () Bool)

(assert (=> b!555606 (=> (not res!348017) (not e!320211))))

(assert (=> b!555606 (= res!348017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555607 () Bool)

(declare-fun res!348023 () Bool)

(assert (=> b!555607 (=> (not res!348023) (not e!320209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555607 (= res!348023 (validKeyInArray!0 k!1914))))

(declare-fun b!555608 () Bool)

(declare-fun res!348020 () Bool)

(assert (=> b!555608 (=> (not res!348020) (not e!320209))))

(declare-fun arrayContainsKey!0 (array!35011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555608 (= res!348020 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555609 () Bool)

(assert (=> b!555609 (= e!320211 e!320210)))

(declare-fun res!348015 () Bool)

(assert (=> b!555609 (=> (not res!348015) (not e!320210))))

(declare-fun lt!252528 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35011 (_ BitVec 32)) SeekEntryResult!5264)

(assert (=> b!555609 (= res!348015 (= lt!252525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252528 (select (store (arr!16815 a!3118) i!1132 k!1914) j!142) (array!35012 (store (arr!16815 a!3118) i!1132 k!1914) (size!17179 a!3118)) mask!3119)))))

(declare-fun lt!252527 () (_ BitVec 32))

(assert (=> b!555609 (= lt!252525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252527 (select (arr!16815 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555609 (= lt!252528 (toIndex!0 (select (store (arr!16815 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555609 (= lt!252527 (toIndex!0 (select (arr!16815 a!3118) j!142) mask!3119))))

(declare-fun b!555610 () Bool)

(declare-fun res!348016 () Bool)

(assert (=> b!555610 (=> (not res!348016) (not e!320211))))

(declare-datatypes ((List!10895 0))(
  ( (Nil!10892) (Cons!10891 (h!11876 (_ BitVec 64)) (t!17123 List!10895)) )
))
(declare-fun arrayNoDuplicates!0 (array!35011 (_ BitVec 32) List!10895) Bool)

(assert (=> b!555610 (= res!348016 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10892))))

(declare-fun b!555611 () Bool)

(declare-fun res!348021 () Bool)

(assert (=> b!555611 (=> (not res!348021) (not e!320209))))

(assert (=> b!555611 (= res!348021 (validKeyInArray!0 (select (arr!16815 a!3118) j!142)))))

(assert (= (and start!50786 res!348022) b!555604))

(assert (= (and b!555604 res!348018) b!555611))

(assert (= (and b!555611 res!348021) b!555607))

(assert (= (and b!555607 res!348023) b!555608))

(assert (= (and b!555608 res!348020) b!555603))

(assert (= (and b!555603 res!348019) b!555606))

(assert (= (and b!555606 res!348017) b!555610))

(assert (= (and b!555610 res!348016) b!555609))

(assert (= (and b!555609 res!348015) b!555605))

(declare-fun m!533355 () Bool)

(assert (=> b!555610 m!533355))

(declare-fun m!533357 () Bool)

(assert (=> b!555605 m!533357))

(declare-fun m!533359 () Bool)

(assert (=> b!555605 m!533359))

(declare-fun m!533361 () Bool)

(assert (=> b!555605 m!533361))

(declare-fun m!533363 () Bool)

(assert (=> b!555605 m!533363))

(assert (=> b!555605 m!533357))

(declare-fun m!533365 () Bool)

(assert (=> b!555605 m!533365))

(declare-fun m!533367 () Bool)

(assert (=> start!50786 m!533367))

(declare-fun m!533369 () Bool)

(assert (=> start!50786 m!533369))

(declare-fun m!533371 () Bool)

(assert (=> b!555603 m!533371))

(declare-fun m!533373 () Bool)

(assert (=> b!555607 m!533373))

(assert (=> b!555611 m!533357))

(assert (=> b!555611 m!533357))

(declare-fun m!533375 () Bool)

(assert (=> b!555611 m!533375))

(declare-fun m!533377 () Bool)

(assert (=> b!555606 m!533377))

(assert (=> b!555609 m!533357))

(declare-fun m!533379 () Bool)

(assert (=> b!555609 m!533379))

(assert (=> b!555609 m!533357))

(declare-fun m!533381 () Bool)

(assert (=> b!555609 m!533381))

(declare-fun m!533383 () Bool)

(assert (=> b!555609 m!533383))

(assert (=> b!555609 m!533381))

(declare-fun m!533385 () Bool)

(assert (=> b!555609 m!533385))

(assert (=> b!555609 m!533357))

(declare-fun m!533387 () Bool)

(assert (=> b!555609 m!533387))

(assert (=> b!555609 m!533381))

(declare-fun m!533389 () Bool)

(assert (=> b!555609 m!533389))

(declare-fun m!533391 () Bool)

(assert (=> b!555608 m!533391))

(push 1)

