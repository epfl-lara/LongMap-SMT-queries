; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51512 () Bool)

(assert start!51512)

(declare-fun b!563434 () Bool)

(declare-fun res!354729 () Bool)

(declare-fun e!324629 () Bool)

(assert (=> b!563434 (=> (not res!354729) (not e!324629))))

(declare-datatypes ((array!35386 0))(
  ( (array!35387 (arr!16994 (Array (_ BitVec 32) (_ BitVec 64))) (size!17359 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35386)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563434 (= res!354729 (validKeyInArray!0 (select (arr!16994 a!3118) j!142)))))

(declare-fun b!563435 () Bool)

(declare-fun e!324628 () Bool)

(assert (=> b!563435 (= e!324629 e!324628)))

(declare-fun res!354733 () Bool)

(assert (=> b!563435 (=> (not res!354733) (not e!324628))))

(declare-datatypes ((SeekEntryResult!5440 0))(
  ( (MissingZero!5440 (index!23987 (_ BitVec 32))) (Found!5440 (index!23988 (_ BitVec 32))) (Intermediate!5440 (undefined!6252 Bool) (index!23989 (_ BitVec 32)) (x!52882 (_ BitVec 32))) (Undefined!5440) (MissingVacant!5440 (index!23990 (_ BitVec 32))) )
))
(declare-fun lt!257063 () SeekEntryResult!5440)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563435 (= res!354733 (or (= lt!257063 (MissingZero!5440 i!1132)) (= lt!257063 (MissingVacant!5440 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35386 (_ BitVec 32)) SeekEntryResult!5440)

(assert (=> b!563435 (= lt!257063 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563436 () Bool)

(declare-fun e!324630 () Bool)

(assert (=> b!563436 (= e!324628 e!324630)))

(declare-fun res!354732 () Bool)

(assert (=> b!563436 (=> (not res!354732) (not e!324630))))

(declare-fun lt!257065 () SeekEntryResult!5440)

(declare-fun lt!257061 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35386 (_ BitVec 32)) SeekEntryResult!5440)

(assert (=> b!563436 (= res!354732 (= lt!257065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257061 (select (store (arr!16994 a!3118) i!1132 k0!1914) j!142) (array!35387 (store (arr!16994 a!3118) i!1132 k0!1914) (size!17359 a!3118)) mask!3119)))))

(declare-fun lt!257064 () (_ BitVec 32))

(assert (=> b!563436 (= lt!257065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257064 (select (arr!16994 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563436 (= lt!257061 (toIndex!0 (select (store (arr!16994 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563436 (= lt!257064 (toIndex!0 (select (arr!16994 a!3118) j!142) mask!3119))))

(declare-fun b!563437 () Bool)

(declare-fun res!354736 () Bool)

(assert (=> b!563437 (=> (not res!354736) (not e!324629))))

(declare-fun arrayContainsKey!0 (array!35386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563437 (= res!354736 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563438 () Bool)

(declare-fun res!354730 () Bool)

(assert (=> b!563438 (=> (not res!354730) (not e!324628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35386 (_ BitVec 32)) Bool)

(assert (=> b!563438 (= res!354730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563439 () Bool)

(declare-fun res!354734 () Bool)

(assert (=> b!563439 (=> (not res!354734) (not e!324629))))

(assert (=> b!563439 (= res!354734 (and (= (size!17359 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17359 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17359 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!354737 () Bool)

(assert (=> start!51512 (=> (not res!354737) (not e!324629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51512 (= res!354737 (validMask!0 mask!3119))))

(assert (=> start!51512 e!324629))

(assert (=> start!51512 true))

(declare-fun array_inv!12877 (array!35386) Bool)

(assert (=> start!51512 (array_inv!12877 a!3118)))

(declare-fun b!563440 () Bool)

(declare-fun res!354728 () Bool)

(assert (=> b!563440 (=> (not res!354728) (not e!324628))))

(declare-datatypes ((List!11113 0))(
  ( (Nil!11110) (Cons!11109 (h!12112 (_ BitVec 64)) (t!17332 List!11113)) )
))
(declare-fun arrayNoDuplicates!0 (array!35386 (_ BitVec 32) List!11113) Bool)

(assert (=> b!563440 (= res!354728 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11110))))

(declare-fun b!563441 () Bool)

(declare-fun e!324626 () Bool)

(assert (=> b!563441 (= e!324626 (= (seekEntryOrOpen!0 (select (arr!16994 a!3118) j!142) a!3118 mask!3119) (Found!5440 j!142)))))

(declare-fun b!563442 () Bool)

(declare-fun res!354735 () Bool)

(assert (=> b!563442 (=> (not res!354735) (not e!324629))))

(assert (=> b!563442 (= res!354735 (validKeyInArray!0 k0!1914))))

(declare-fun lt!257062 () Bool)

(declare-fun b!563443 () Bool)

(assert (=> b!563443 (= e!324630 (not (or (and (not lt!257062) (undefined!6252 lt!257065)) (and (not lt!257062) (not (undefined!6252 lt!257065))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(get-info :version)

(assert (=> b!563443 (= lt!257062 (not ((_ is Intermediate!5440) lt!257065)))))

(assert (=> b!563443 e!324626))

(declare-fun res!354731 () Bool)

(assert (=> b!563443 (=> (not res!354731) (not e!324626))))

(assert (=> b!563443 (= res!354731 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17640 0))(
  ( (Unit!17641) )
))
(declare-fun lt!257060 () Unit!17640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17640)

(assert (=> b!563443 (= lt!257060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51512 res!354737) b!563439))

(assert (= (and b!563439 res!354734) b!563434))

(assert (= (and b!563434 res!354729) b!563442))

(assert (= (and b!563442 res!354735) b!563437))

(assert (= (and b!563437 res!354736) b!563435))

(assert (= (and b!563435 res!354733) b!563438))

(assert (= (and b!563438 res!354730) b!563440))

(assert (= (and b!563440 res!354728) b!563436))

(assert (= (and b!563436 res!354732) b!563443))

(assert (= (and b!563443 res!354731) b!563441))

(declare-fun m!541331 () Bool)

(assert (=> b!563435 m!541331))

(declare-fun m!541333 () Bool)

(assert (=> start!51512 m!541333))

(declare-fun m!541335 () Bool)

(assert (=> start!51512 m!541335))

(declare-fun m!541337 () Bool)

(assert (=> b!563440 m!541337))

(declare-fun m!541339 () Bool)

(assert (=> b!563434 m!541339))

(assert (=> b!563434 m!541339))

(declare-fun m!541341 () Bool)

(assert (=> b!563434 m!541341))

(assert (=> b!563436 m!541339))

(declare-fun m!541343 () Bool)

(assert (=> b!563436 m!541343))

(assert (=> b!563436 m!541339))

(declare-fun m!541345 () Bool)

(assert (=> b!563436 m!541345))

(assert (=> b!563436 m!541339))

(declare-fun m!541347 () Bool)

(assert (=> b!563436 m!541347))

(assert (=> b!563436 m!541345))

(declare-fun m!541349 () Bool)

(assert (=> b!563436 m!541349))

(declare-fun m!541351 () Bool)

(assert (=> b!563436 m!541351))

(assert (=> b!563436 m!541345))

(declare-fun m!541353 () Bool)

(assert (=> b!563436 m!541353))

(assert (=> b!563441 m!541339))

(assert (=> b!563441 m!541339))

(declare-fun m!541355 () Bool)

(assert (=> b!563441 m!541355))

(declare-fun m!541357 () Bool)

(assert (=> b!563438 m!541357))

(declare-fun m!541359 () Bool)

(assert (=> b!563437 m!541359))

(declare-fun m!541361 () Bool)

(assert (=> b!563443 m!541361))

(declare-fun m!541363 () Bool)

(assert (=> b!563443 m!541363))

(declare-fun m!541365 () Bool)

(assert (=> b!563442 m!541365))

(check-sat (not b!563440) (not b!563436) (not start!51512) (not b!563443) (not b!563434) (not b!563438) (not b!563435) (not b!563442) (not b!563441) (not b!563437))
(check-sat)
