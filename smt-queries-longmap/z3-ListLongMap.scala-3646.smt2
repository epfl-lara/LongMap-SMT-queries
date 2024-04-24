; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50298 () Bool)

(assert start!50298)

(declare-fun b!550321 () Bool)

(declare-fun res!343368 () Bool)

(declare-fun e!317713 () Bool)

(assert (=> b!550321 (=> (not res!343368) (not e!317713))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550321 (= res!343368 (validKeyInArray!0 k0!1914))))

(declare-fun b!550322 () Bool)

(declare-fun res!343366 () Bool)

(assert (=> b!550322 (=> (not res!343366) (not e!317713))))

(declare-datatypes ((array!34698 0))(
  ( (array!34699 (arr!16663 (Array (_ BitVec 32) (_ BitVec 64))) (size!17027 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34698)

(declare-fun arrayContainsKey!0 (array!34698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550322 (= res!343366 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!550323 () Bool)

(declare-fun e!317714 () Bool)

(declare-datatypes ((SeekEntryResult!5068 0))(
  ( (MissingZero!5068 (index!22499 (_ BitVec 32))) (Found!5068 (index!22500 (_ BitVec 32))) (Intermediate!5068 (undefined!5880 Bool) (index!22501 (_ BitVec 32)) (x!51577 (_ BitVec 32))) (Undefined!5068) (MissingVacant!5068 (index!22502 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34698 (_ BitVec 32)) SeekEntryResult!5068)

(assert (=> b!550323 (= e!317714 (= (seekEntryOrOpen!0 (select (arr!16663 a!3118) j!142) a!3118 mask!3119) (Found!5068 j!142)))))

(declare-fun b!550324 () Bool)

(declare-fun res!343363 () Bool)

(declare-fun e!317715 () Bool)

(assert (=> b!550324 (=> (not res!343363) (not e!317715))))

(declare-datatypes ((List!10650 0))(
  ( (Nil!10647) (Cons!10646 (h!11622 (_ BitVec 64)) (t!16870 List!10650)) )
))
(declare-fun arrayNoDuplicates!0 (array!34698 (_ BitVec 32) List!10650) Bool)

(assert (=> b!550324 (= res!343363 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10647))))

(declare-fun b!550325 () Bool)

(assert (=> b!550325 (= e!317715 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!550325 e!317714))

(declare-fun res!343367 () Bool)

(assert (=> b!550325 (=> (not res!343367) (not e!317714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34698 (_ BitVec 32)) Bool)

(assert (=> b!550325 (= res!343367 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!16981 0))(
  ( (Unit!16982) )
))
(declare-fun lt!250528 () Unit!16981)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16981)

(assert (=> b!550325 (= lt!250528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550326 () Bool)

(declare-fun res!343362 () Bool)

(assert (=> b!550326 (=> (not res!343362) (not e!317715))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34698 (_ BitVec 32)) SeekEntryResult!5068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550326 (= res!343362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16663 a!3118) j!142) mask!3119) (select (arr!16663 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16663 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16663 a!3118) i!1132 k0!1914) j!142) (array!34699 (store (arr!16663 a!3118) i!1132 k0!1914) (size!17027 a!3118)) mask!3119)))))

(declare-fun b!550327 () Bool)

(declare-fun res!343365 () Bool)

(assert (=> b!550327 (=> (not res!343365) (not e!317713))))

(assert (=> b!550327 (= res!343365 (and (= (size!17027 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17027 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17027 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550328 () Bool)

(declare-fun res!343360 () Bool)

(assert (=> b!550328 (=> (not res!343360) (not e!317713))))

(assert (=> b!550328 (= res!343360 (validKeyInArray!0 (select (arr!16663 a!3118) j!142)))))

(declare-fun b!550329 () Bool)

(assert (=> b!550329 (= e!317713 e!317715)))

(declare-fun res!343361 () Bool)

(assert (=> b!550329 (=> (not res!343361) (not e!317715))))

(declare-fun lt!250527 () SeekEntryResult!5068)

(assert (=> b!550329 (= res!343361 (or (= lt!250527 (MissingZero!5068 i!1132)) (= lt!250527 (MissingVacant!5068 i!1132))))))

(assert (=> b!550329 (= lt!250527 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550330 () Bool)

(declare-fun res!343369 () Bool)

(assert (=> b!550330 (=> (not res!343369) (not e!317715))))

(assert (=> b!550330 (= res!343369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!343364 () Bool)

(assert (=> start!50298 (=> (not res!343364) (not e!317713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50298 (= res!343364 (validMask!0 mask!3119))))

(assert (=> start!50298 e!317713))

(assert (=> start!50298 true))

(declare-fun array_inv!12522 (array!34698) Bool)

(assert (=> start!50298 (array_inv!12522 a!3118)))

(assert (= (and start!50298 res!343364) b!550327))

(assert (= (and b!550327 res!343365) b!550328))

(assert (= (and b!550328 res!343360) b!550321))

(assert (= (and b!550321 res!343368) b!550322))

(assert (= (and b!550322 res!343366) b!550329))

(assert (= (and b!550329 res!343361) b!550330))

(assert (= (and b!550330 res!343369) b!550324))

(assert (= (and b!550324 res!343363) b!550326))

(assert (= (and b!550326 res!343362) b!550325))

(assert (= (and b!550325 res!343367) b!550323))

(declare-fun m!527477 () Bool)

(assert (=> b!550322 m!527477))

(declare-fun m!527479 () Bool)

(assert (=> b!550328 m!527479))

(assert (=> b!550328 m!527479))

(declare-fun m!527481 () Bool)

(assert (=> b!550328 m!527481))

(declare-fun m!527483 () Bool)

(assert (=> b!550324 m!527483))

(declare-fun m!527485 () Bool)

(assert (=> b!550330 m!527485))

(declare-fun m!527487 () Bool)

(assert (=> start!50298 m!527487))

(declare-fun m!527489 () Bool)

(assert (=> start!50298 m!527489))

(declare-fun m!527491 () Bool)

(assert (=> b!550329 m!527491))

(assert (=> b!550326 m!527479))

(declare-fun m!527493 () Bool)

(assert (=> b!550326 m!527493))

(assert (=> b!550326 m!527479))

(declare-fun m!527495 () Bool)

(assert (=> b!550326 m!527495))

(declare-fun m!527497 () Bool)

(assert (=> b!550326 m!527497))

(assert (=> b!550326 m!527495))

(declare-fun m!527499 () Bool)

(assert (=> b!550326 m!527499))

(assert (=> b!550326 m!527493))

(assert (=> b!550326 m!527479))

(declare-fun m!527501 () Bool)

(assert (=> b!550326 m!527501))

(declare-fun m!527503 () Bool)

(assert (=> b!550326 m!527503))

(assert (=> b!550326 m!527495))

(assert (=> b!550326 m!527497))

(assert (=> b!550323 m!527479))

(assert (=> b!550323 m!527479))

(declare-fun m!527505 () Bool)

(assert (=> b!550323 m!527505))

(declare-fun m!527507 () Bool)

(assert (=> b!550321 m!527507))

(declare-fun m!527509 () Bool)

(assert (=> b!550325 m!527509))

(declare-fun m!527511 () Bool)

(assert (=> b!550325 m!527511))

(check-sat (not b!550321) (not b!550322) (not b!550330) (not b!550325) (not b!550329) (not b!550328) (not b!550324) (not b!550326) (not b!550323) (not start!50298))
(check-sat)
