; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51518 () Bool)

(assert start!51518)

(declare-fun b!563524 () Bool)

(declare-fun res!354821 () Bool)

(declare-fun e!324669 () Bool)

(assert (=> b!563524 (=> (not res!354821) (not e!324669))))

(declare-datatypes ((array!35392 0))(
  ( (array!35393 (arr!16997 (Array (_ BitVec 32) (_ BitVec 64))) (size!17362 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35392)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563524 (= res!354821 (validKeyInArray!0 (select (arr!16997 a!3118) j!142)))))

(declare-fun b!563525 () Bool)

(declare-fun e!324670 () Bool)

(assert (=> b!563525 (= e!324669 e!324670)))

(declare-fun res!354820 () Bool)

(assert (=> b!563525 (=> (not res!354820) (not e!324670))))

(declare-datatypes ((SeekEntryResult!5443 0))(
  ( (MissingZero!5443 (index!23999 (_ BitVec 32))) (Found!5443 (index!24000 (_ BitVec 32))) (Intermediate!5443 (undefined!6255 Bool) (index!24001 (_ BitVec 32)) (x!52893 (_ BitVec 32))) (Undefined!5443) (MissingVacant!5443 (index!24002 (_ BitVec 32))) )
))
(declare-fun lt!257106 () SeekEntryResult!5443)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563525 (= res!354820 (or (= lt!257106 (MissingZero!5443 i!1132)) (= lt!257106 (MissingVacant!5443 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35392 (_ BitVec 32)) SeekEntryResult!5443)

(assert (=> b!563525 (= lt!257106 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563526 () Bool)

(declare-fun res!354826 () Bool)

(assert (=> b!563526 (=> (not res!354826) (not e!324670))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35392 (_ BitVec 32)) SeekEntryResult!5443)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563526 (= res!354826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16997 a!3118) j!142) mask!3119) (select (arr!16997 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16997 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16997 a!3118) i!1132 k0!1914) j!142) (array!35393 (store (arr!16997 a!3118) i!1132 k0!1914) (size!17362 a!3118)) mask!3119)))))

(declare-fun b!563527 () Bool)

(declare-fun res!354819 () Bool)

(assert (=> b!563527 (=> (not res!354819) (not e!324669))))

(assert (=> b!563527 (= res!354819 (and (= (size!17362 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17362 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17362 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563528 () Bool)

(declare-fun res!354818 () Bool)

(assert (=> b!563528 (=> (not res!354818) (not e!324670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35392 (_ BitVec 32)) Bool)

(assert (=> b!563528 (= res!354818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563529 () Bool)

(declare-fun e!324671 () Bool)

(assert (=> b!563529 (= e!324671 (= (seekEntryOrOpen!0 (select (arr!16997 a!3118) j!142) a!3118 mask!3119) (Found!5443 j!142)))))

(declare-fun b!563530 () Bool)

(declare-fun res!354827 () Bool)

(assert (=> b!563530 (=> (not res!354827) (not e!324669))))

(declare-fun arrayContainsKey!0 (array!35392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563530 (= res!354827 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563531 () Bool)

(declare-fun res!354822 () Bool)

(assert (=> b!563531 (=> (not res!354822) (not e!324669))))

(assert (=> b!563531 (= res!354822 (validKeyInArray!0 k0!1914))))

(declare-fun res!354823 () Bool)

(assert (=> start!51518 (=> (not res!354823) (not e!324669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51518 (= res!354823 (validMask!0 mask!3119))))

(assert (=> start!51518 e!324669))

(assert (=> start!51518 true))

(declare-fun array_inv!12880 (array!35392) Bool)

(assert (=> start!51518 (array_inv!12880 a!3118)))

(declare-fun b!563532 () Bool)

(assert (=> b!563532 (= e!324670 (not true))))

(assert (=> b!563532 e!324671))

(declare-fun res!354824 () Bool)

(assert (=> b!563532 (=> (not res!354824) (not e!324671))))

(assert (=> b!563532 (= res!354824 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17646 0))(
  ( (Unit!17647) )
))
(declare-fun lt!257107 () Unit!17646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17646)

(assert (=> b!563532 (= lt!257107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563533 () Bool)

(declare-fun res!354825 () Bool)

(assert (=> b!563533 (=> (not res!354825) (not e!324670))))

(declare-datatypes ((List!11116 0))(
  ( (Nil!11113) (Cons!11112 (h!12115 (_ BitVec 64)) (t!17335 List!11116)) )
))
(declare-fun arrayNoDuplicates!0 (array!35392 (_ BitVec 32) List!11116) Bool)

(assert (=> b!563533 (= res!354825 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11113))))

(assert (= (and start!51518 res!354823) b!563527))

(assert (= (and b!563527 res!354819) b!563524))

(assert (= (and b!563524 res!354821) b!563531))

(assert (= (and b!563531 res!354822) b!563530))

(assert (= (and b!563530 res!354827) b!563525))

(assert (= (and b!563525 res!354820) b!563528))

(assert (= (and b!563528 res!354818) b!563533))

(assert (= (and b!563533 res!354825) b!563526))

(assert (= (and b!563526 res!354826) b!563532))

(assert (= (and b!563532 res!354824) b!563529))

(declare-fun m!541439 () Bool)

(assert (=> b!563530 m!541439))

(declare-fun m!541441 () Bool)

(assert (=> b!563529 m!541441))

(assert (=> b!563529 m!541441))

(declare-fun m!541443 () Bool)

(assert (=> b!563529 m!541443))

(assert (=> b!563524 m!541441))

(assert (=> b!563524 m!541441))

(declare-fun m!541445 () Bool)

(assert (=> b!563524 m!541445))

(assert (=> b!563526 m!541441))

(declare-fun m!541447 () Bool)

(assert (=> b!563526 m!541447))

(assert (=> b!563526 m!541441))

(declare-fun m!541449 () Bool)

(assert (=> b!563526 m!541449))

(declare-fun m!541451 () Bool)

(assert (=> b!563526 m!541451))

(assert (=> b!563526 m!541449))

(declare-fun m!541453 () Bool)

(assert (=> b!563526 m!541453))

(assert (=> b!563526 m!541447))

(assert (=> b!563526 m!541441))

(declare-fun m!541455 () Bool)

(assert (=> b!563526 m!541455))

(declare-fun m!541457 () Bool)

(assert (=> b!563526 m!541457))

(assert (=> b!563526 m!541449))

(assert (=> b!563526 m!541451))

(declare-fun m!541459 () Bool)

(assert (=> b!563531 m!541459))

(declare-fun m!541461 () Bool)

(assert (=> b!563528 m!541461))

(declare-fun m!541463 () Bool)

(assert (=> b!563533 m!541463))

(declare-fun m!541465 () Bool)

(assert (=> b!563525 m!541465))

(declare-fun m!541467 () Bool)

(assert (=> start!51518 m!541467))

(declare-fun m!541469 () Bool)

(assert (=> start!51518 m!541469))

(declare-fun m!541471 () Bool)

(assert (=> b!563532 m!541471))

(declare-fun m!541473 () Bool)

(assert (=> b!563532 m!541473))

(check-sat (not b!563525) (not b!563528) (not b!563532) (not b!563530) (not b!563524) (not b!563526) (not b!563531) (not b!563533) (not start!51518) (not b!563529))
(check-sat)
