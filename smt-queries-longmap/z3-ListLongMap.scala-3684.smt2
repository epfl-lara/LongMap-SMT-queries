; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50708 () Bool)

(assert start!50708)

(declare-fun res!347003 () Bool)

(declare-fun e!319641 () Bool)

(assert (=> start!50708 (=> (not res!347003) (not e!319641))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50708 (= res!347003 (validMask!0 mask!3119))))

(assert (=> start!50708 e!319641))

(assert (=> start!50708 true))

(declare-datatypes ((array!34942 0))(
  ( (array!34943 (arr!16781 (Array (_ BitVec 32) (_ BitVec 64))) (size!17146 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34942)

(declare-fun array_inv!12664 (array!34942) Bool)

(assert (=> start!50708 (array_inv!12664 a!3118)))

(declare-fun b!554441 () Bool)

(declare-fun e!319639 () Bool)

(assert (=> b!554441 (= e!319641 e!319639)))

(declare-fun res!347002 () Bool)

(assert (=> b!554441 (=> (not res!347002) (not e!319639))))

(declare-datatypes ((SeekEntryResult!5227 0))(
  ( (MissingZero!5227 (index!23135 (_ BitVec 32))) (Found!5227 (index!23136 (_ BitVec 32))) (Intermediate!5227 (undefined!6039 Bool) (index!23137 (_ BitVec 32)) (x!52056 (_ BitVec 32))) (Undefined!5227) (MissingVacant!5227 (index!23138 (_ BitVec 32))) )
))
(declare-fun lt!251697 () SeekEntryResult!5227)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554441 (= res!347002 (or (= lt!251697 (MissingZero!5227 i!1132)) (= lt!251697 (MissingVacant!5227 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34942 (_ BitVec 32)) SeekEntryResult!5227)

(assert (=> b!554441 (= lt!251697 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554442 () Bool)

(declare-fun e!319638 () Bool)

(assert (=> b!554442 (= e!319638 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!251700 () SeekEntryResult!5227)

(declare-fun lt!251696 () SeekEntryResult!5227)

(get-info :version)

(assert (=> b!554442 (and (= lt!251700 (Found!5227 j!142)) (or (undefined!6039 lt!251696) (not ((_ is Intermediate!5227) lt!251696)) (= (select (arr!16781 a!3118) (index!23137 lt!251696)) (select (arr!16781 a!3118) j!142)) (not (= (select (arr!16781 a!3118) (index!23137 lt!251696)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251700 (MissingZero!5227 (index!23137 lt!251696)))))))

(assert (=> b!554442 (= lt!251700 (seekEntryOrOpen!0 (select (arr!16781 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34942 (_ BitVec 32)) Bool)

(assert (=> b!554442 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17214 0))(
  ( (Unit!17215) )
))
(declare-fun lt!251701 () Unit!17214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17214)

(assert (=> b!554442 (= lt!251701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554443 () Bool)

(declare-fun res!346995 () Bool)

(assert (=> b!554443 (=> (not res!346995) (not e!319641))))

(declare-fun arrayContainsKey!0 (array!34942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554443 (= res!346995 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554444 () Bool)

(declare-fun res!347001 () Bool)

(assert (=> b!554444 (=> (not res!347001) (not e!319639))))

(assert (=> b!554444 (= res!347001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554445 () Bool)

(declare-fun res!346998 () Bool)

(assert (=> b!554445 (=> (not res!346998) (not e!319641))))

(assert (=> b!554445 (= res!346998 (and (= (size!17146 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17146 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17146 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554446 () Bool)

(declare-fun res!347000 () Bool)

(assert (=> b!554446 (=> (not res!347000) (not e!319641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554446 (= res!347000 (validKeyInArray!0 k0!1914))))

(declare-fun b!554447 () Bool)

(declare-fun res!346999 () Bool)

(assert (=> b!554447 (=> (not res!346999) (not e!319641))))

(assert (=> b!554447 (= res!346999 (validKeyInArray!0 (select (arr!16781 a!3118) j!142)))))

(declare-fun b!554448 () Bool)

(assert (=> b!554448 (= e!319639 e!319638)))

(declare-fun res!346997 () Bool)

(assert (=> b!554448 (=> (not res!346997) (not e!319638))))

(declare-fun lt!251699 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34942 (_ BitVec 32)) SeekEntryResult!5227)

(assert (=> b!554448 (= res!346997 (= lt!251696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251699 (select (store (arr!16781 a!3118) i!1132 k0!1914) j!142) (array!34943 (store (arr!16781 a!3118) i!1132 k0!1914) (size!17146 a!3118)) mask!3119)))))

(declare-fun lt!251698 () (_ BitVec 32))

(assert (=> b!554448 (= lt!251696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251698 (select (arr!16781 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554448 (= lt!251699 (toIndex!0 (select (store (arr!16781 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554448 (= lt!251698 (toIndex!0 (select (arr!16781 a!3118) j!142) mask!3119))))

(declare-fun b!554449 () Bool)

(declare-fun res!346996 () Bool)

(assert (=> b!554449 (=> (not res!346996) (not e!319639))))

(declare-datatypes ((List!10900 0))(
  ( (Nil!10897) (Cons!10896 (h!11881 (_ BitVec 64)) (t!17119 List!10900)) )
))
(declare-fun arrayNoDuplicates!0 (array!34942 (_ BitVec 32) List!10900) Bool)

(assert (=> b!554449 (= res!346996 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10897))))

(assert (= (and start!50708 res!347003) b!554445))

(assert (= (and b!554445 res!346998) b!554447))

(assert (= (and b!554447 res!346999) b!554446))

(assert (= (and b!554446 res!347000) b!554443))

(assert (= (and b!554443 res!346995) b!554441))

(assert (= (and b!554441 res!347002) b!554444))

(assert (= (and b!554444 res!347001) b!554449))

(assert (= (and b!554449 res!346996) b!554448))

(assert (= (and b!554448 res!346997) b!554442))

(declare-fun m!531329 () Bool)

(assert (=> b!554443 m!531329))

(declare-fun m!531331 () Bool)

(assert (=> b!554442 m!531331))

(declare-fun m!531333 () Bool)

(assert (=> b!554442 m!531333))

(declare-fun m!531335 () Bool)

(assert (=> b!554442 m!531335))

(declare-fun m!531337 () Bool)

(assert (=> b!554442 m!531337))

(assert (=> b!554442 m!531331))

(declare-fun m!531339 () Bool)

(assert (=> b!554442 m!531339))

(declare-fun m!531341 () Bool)

(assert (=> b!554449 m!531341))

(assert (=> b!554448 m!531331))

(declare-fun m!531343 () Bool)

(assert (=> b!554448 m!531343))

(assert (=> b!554448 m!531331))

(declare-fun m!531345 () Bool)

(assert (=> b!554448 m!531345))

(declare-fun m!531347 () Bool)

(assert (=> b!554448 m!531347))

(assert (=> b!554448 m!531345))

(assert (=> b!554448 m!531331))

(declare-fun m!531349 () Bool)

(assert (=> b!554448 m!531349))

(declare-fun m!531351 () Bool)

(assert (=> b!554448 m!531351))

(assert (=> b!554448 m!531345))

(declare-fun m!531353 () Bool)

(assert (=> b!554448 m!531353))

(declare-fun m!531355 () Bool)

(assert (=> b!554446 m!531355))

(declare-fun m!531357 () Bool)

(assert (=> b!554441 m!531357))

(assert (=> b!554447 m!531331))

(assert (=> b!554447 m!531331))

(declare-fun m!531359 () Bool)

(assert (=> b!554447 m!531359))

(declare-fun m!531361 () Bool)

(assert (=> start!50708 m!531361))

(declare-fun m!531363 () Bool)

(assert (=> start!50708 m!531363))

(declare-fun m!531365 () Bool)

(assert (=> b!554444 m!531365))

(check-sat (not b!554444) (not b!554447) (not b!554442) (not b!554449) (not b!554443) (not b!554441) (not b!554446) (not b!554448) (not start!50708))
(check-sat)
