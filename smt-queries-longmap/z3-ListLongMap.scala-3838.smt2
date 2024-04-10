; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52780 () Bool)

(assert start!52780)

(declare-fun b!575517 () Bool)

(declare-fun res!363944 () Bool)

(declare-fun e!331148 () Bool)

(assert (=> b!575517 (=> (not res!363944) (not e!331148))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35925 0))(
  ( (array!35926 (arr!17245 (Array (_ BitVec 32) (_ BitVec 64))) (size!17609 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35925)

(assert (=> b!575517 (= res!363944 (and (= (size!17609 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17609 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17609 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575518 () Bool)

(declare-fun res!363939 () Bool)

(assert (=> b!575518 (=> (not res!363939) (not e!331148))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575518 (= res!363939 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575519 () Bool)

(declare-fun e!331144 () Bool)

(declare-fun e!331143 () Bool)

(assert (=> b!575519 (= e!331144 e!331143)))

(declare-fun res!363937 () Bool)

(assert (=> b!575519 (=> res!363937 e!331143)))

(declare-fun lt!263116 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5694 0))(
  ( (MissingZero!5694 (index!25003 (_ BitVec 32))) (Found!5694 (index!25004 (_ BitVec 32))) (Intermediate!5694 (undefined!6506 Bool) (index!25005 (_ BitVec 32)) (x!53895 (_ BitVec 32))) (Undefined!5694) (MissingVacant!5694 (index!25006 (_ BitVec 32))) )
))
(declare-fun lt!263118 () SeekEntryResult!5694)

(declare-fun lt!263128 () SeekEntryResult!5694)

(declare-fun lt!263126 () SeekEntryResult!5694)

(assert (=> b!575519 (= res!363937 (or (bvslt (index!25005 lt!263118) #b00000000000000000000000000000000) (bvsge (index!25005 lt!263118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53895 lt!263118) #b01111111111111111111111111111110) (bvslt (x!53895 lt!263118) #b00000000000000000000000000000000) (not (= lt!263116 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17245 a!3118) i!1132 k0!1914) (index!25005 lt!263118)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263128 lt!263126))))))

(declare-fun lt!263123 () SeekEntryResult!5694)

(declare-fun lt!263119 () SeekEntryResult!5694)

(assert (=> b!575519 (= lt!263123 lt!263119)))

(declare-fun lt!263117 () array!35925)

(declare-fun lt!263120 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35925 (_ BitVec 32)) SeekEntryResult!5694)

(assert (=> b!575519 (= lt!263119 (seekKeyOrZeroReturnVacant!0 (x!53895 lt!263118) (index!25005 lt!263118) (index!25005 lt!263118) lt!263120 lt!263117 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35925 (_ BitVec 32)) SeekEntryResult!5694)

(assert (=> b!575519 (= lt!263123 (seekEntryOrOpen!0 lt!263120 lt!263117 mask!3119))))

(declare-fun lt!263122 () SeekEntryResult!5694)

(assert (=> b!575519 (= lt!263122 lt!263128)))

(assert (=> b!575519 (= lt!263128 (seekKeyOrZeroReturnVacant!0 (x!53895 lt!263118) (index!25005 lt!263118) (index!25005 lt!263118) (select (arr!17245 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575520 () Bool)

(declare-fun res!363935 () Bool)

(assert (=> b!575520 (=> (not res!363935) (not e!331148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575520 (= res!363935 (validKeyInArray!0 (select (arr!17245 a!3118) j!142)))))

(declare-fun b!575522 () Bool)

(assert (=> b!575522 (= e!331143 true)))

(assert (=> b!575522 (= lt!263128 lt!263119)))

(declare-datatypes ((Unit!18090 0))(
  ( (Unit!18091) )
))
(declare-fun lt!263121 () Unit!18090)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35925 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18090)

(assert (=> b!575522 (= lt!263121 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53895 lt!263118) (index!25005 lt!263118) (index!25005 lt!263118) mask!3119))))

(declare-fun b!575523 () Bool)

(declare-fun e!331146 () Bool)

(declare-fun e!331145 () Bool)

(assert (=> b!575523 (= e!331146 (not e!331145))))

(declare-fun res!363941 () Bool)

(assert (=> b!575523 (=> res!363941 e!331145)))

(get-info :version)

(assert (=> b!575523 (= res!363941 (or (undefined!6506 lt!263118) (not ((_ is Intermediate!5694) lt!263118))))))

(assert (=> b!575523 (= lt!263122 lt!263126)))

(assert (=> b!575523 (= lt!263126 (Found!5694 j!142))))

(assert (=> b!575523 (= lt!263122 (seekEntryOrOpen!0 (select (arr!17245 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35925 (_ BitVec 32)) Bool)

(assert (=> b!575523 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263125 () Unit!18090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18090)

(assert (=> b!575523 (= lt!263125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575524 () Bool)

(declare-fun res!363942 () Bool)

(declare-fun e!331149 () Bool)

(assert (=> b!575524 (=> (not res!363942) (not e!331149))))

(declare-datatypes ((List!11325 0))(
  ( (Nil!11322) (Cons!11321 (h!12360 (_ BitVec 64)) (t!17553 List!11325)) )
))
(declare-fun arrayNoDuplicates!0 (array!35925 (_ BitVec 32) List!11325) Bool)

(assert (=> b!575524 (= res!363942 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11322))))

(declare-fun b!575525 () Bool)

(assert (=> b!575525 (= e!331149 e!331146)))

(declare-fun res!363933 () Bool)

(assert (=> b!575525 (=> (not res!363933) (not e!331146))))

(declare-fun lt!263124 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35925 (_ BitVec 32)) SeekEntryResult!5694)

(assert (=> b!575525 (= res!363933 (= lt!263118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263124 lt!263120 lt!263117 mask!3119)))))

(declare-fun lt!263115 () (_ BitVec 32))

(assert (=> b!575525 (= lt!263118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263115 (select (arr!17245 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575525 (= lt!263124 (toIndex!0 lt!263120 mask!3119))))

(assert (=> b!575525 (= lt!263120 (select (store (arr!17245 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575525 (= lt!263115 (toIndex!0 (select (arr!17245 a!3118) j!142) mask!3119))))

(assert (=> b!575525 (= lt!263117 (array!35926 (store (arr!17245 a!3118) i!1132 k0!1914) (size!17609 a!3118)))))

(declare-fun b!575526 () Bool)

(assert (=> b!575526 (= e!331145 e!331144)))

(declare-fun res!363936 () Bool)

(assert (=> b!575526 (=> res!363936 e!331144)))

(assert (=> b!575526 (= res!363936 (or (= lt!263116 (select (arr!17245 a!3118) j!142)) (= lt!263116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575526 (= lt!263116 (select (arr!17245 a!3118) (index!25005 lt!263118)))))

(declare-fun b!575527 () Bool)

(declare-fun res!363934 () Bool)

(assert (=> b!575527 (=> (not res!363934) (not e!331149))))

(assert (=> b!575527 (= res!363934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575528 () Bool)

(declare-fun res!363938 () Bool)

(assert (=> b!575528 (=> (not res!363938) (not e!331148))))

(assert (=> b!575528 (= res!363938 (validKeyInArray!0 k0!1914))))

(declare-fun res!363940 () Bool)

(assert (=> start!52780 (=> (not res!363940) (not e!331148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52780 (= res!363940 (validMask!0 mask!3119))))

(assert (=> start!52780 e!331148))

(assert (=> start!52780 true))

(declare-fun array_inv!13041 (array!35925) Bool)

(assert (=> start!52780 (array_inv!13041 a!3118)))

(declare-fun b!575521 () Bool)

(assert (=> b!575521 (= e!331148 e!331149)))

(declare-fun res!363943 () Bool)

(assert (=> b!575521 (=> (not res!363943) (not e!331149))))

(declare-fun lt!263127 () SeekEntryResult!5694)

(assert (=> b!575521 (= res!363943 (or (= lt!263127 (MissingZero!5694 i!1132)) (= lt!263127 (MissingVacant!5694 i!1132))))))

(assert (=> b!575521 (= lt!263127 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52780 res!363940) b!575517))

(assert (= (and b!575517 res!363944) b!575520))

(assert (= (and b!575520 res!363935) b!575528))

(assert (= (and b!575528 res!363938) b!575518))

(assert (= (and b!575518 res!363939) b!575521))

(assert (= (and b!575521 res!363943) b!575527))

(assert (= (and b!575527 res!363934) b!575524))

(assert (= (and b!575524 res!363942) b!575525))

(assert (= (and b!575525 res!363933) b!575523))

(assert (= (and b!575523 (not res!363941)) b!575526))

(assert (= (and b!575526 (not res!363936)) b!575519))

(assert (= (and b!575519 (not res!363937)) b!575522))

(declare-fun m!554397 () Bool)

(assert (=> b!575527 m!554397))

(declare-fun m!554399 () Bool)

(assert (=> b!575519 m!554399))

(declare-fun m!554401 () Bool)

(assert (=> b!575519 m!554401))

(declare-fun m!554403 () Bool)

(assert (=> b!575519 m!554403))

(assert (=> b!575519 m!554401))

(declare-fun m!554405 () Bool)

(assert (=> b!575519 m!554405))

(declare-fun m!554407 () Bool)

(assert (=> b!575519 m!554407))

(declare-fun m!554409 () Bool)

(assert (=> b!575519 m!554409))

(assert (=> b!575523 m!554401))

(assert (=> b!575523 m!554401))

(declare-fun m!554411 () Bool)

(assert (=> b!575523 m!554411))

(declare-fun m!554413 () Bool)

(assert (=> b!575523 m!554413))

(declare-fun m!554415 () Bool)

(assert (=> b!575523 m!554415))

(declare-fun m!554417 () Bool)

(assert (=> b!575524 m!554417))

(declare-fun m!554419 () Bool)

(assert (=> b!575518 m!554419))

(assert (=> b!575520 m!554401))

(assert (=> b!575520 m!554401))

(declare-fun m!554421 () Bool)

(assert (=> b!575520 m!554421))

(declare-fun m!554423 () Bool)

(assert (=> start!52780 m!554423))

(declare-fun m!554425 () Bool)

(assert (=> start!52780 m!554425))

(declare-fun m!554427 () Bool)

(assert (=> b!575522 m!554427))

(declare-fun m!554429 () Bool)

(assert (=> b!575521 m!554429))

(assert (=> b!575526 m!554401))

(declare-fun m!554431 () Bool)

(assert (=> b!575526 m!554431))

(assert (=> b!575525 m!554401))

(declare-fun m!554433 () Bool)

(assert (=> b!575525 m!554433))

(declare-fun m!554435 () Bool)

(assert (=> b!575525 m!554435))

(assert (=> b!575525 m!554401))

(declare-fun m!554437 () Bool)

(assert (=> b!575525 m!554437))

(declare-fun m!554439 () Bool)

(assert (=> b!575525 m!554439))

(assert (=> b!575525 m!554407))

(assert (=> b!575525 m!554401))

(declare-fun m!554441 () Bool)

(assert (=> b!575525 m!554441))

(declare-fun m!554443 () Bool)

(assert (=> b!575528 m!554443))

(check-sat (not b!575522) (not b!575528) (not b!575518) (not b!575520) (not b!575524) (not b!575521) (not b!575527) (not start!52780) (not b!575519) (not b!575525) (not b!575523))
(check-sat)
