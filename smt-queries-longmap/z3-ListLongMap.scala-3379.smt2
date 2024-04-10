; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46688 () Bool)

(assert start!46688)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!300849 () Bool)

(declare-datatypes ((array!33000 0))(
  ( (array!33001 (arr!15868 (Array (_ BitVec 32) (_ BitVec 64))) (size!16232 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33000)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!515215 () Bool)

(declare-datatypes ((SeekEntryResult!4335 0))(
  ( (MissingZero!4335 (index!19528 (_ BitVec 32))) (Found!4335 (index!19529 (_ BitVec 32))) (Intermediate!4335 (undefined!5147 Bool) (index!19530 (_ BitVec 32)) (x!48498 (_ BitVec 32))) (Undefined!4335) (MissingVacant!4335 (index!19531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33000 (_ BitVec 32)) SeekEntryResult!4335)

(assert (=> b!515215 (= e!300849 (= (seekEntryOrOpen!0 (select (arr!15868 a!3235) j!176) a!3235 mask!3524) (Found!4335 j!176)))))

(declare-fun b!515216 () Bool)

(declare-fun res!314787 () Bool)

(declare-fun e!300846 () Bool)

(assert (=> b!515216 (=> (not res!314787) (not e!300846))))

(declare-datatypes ((List!10026 0))(
  ( (Nil!10023) (Cons!10022 (h!10920 (_ BitVec 64)) (t!16254 List!10026)) )
))
(declare-fun arrayNoDuplicates!0 (array!33000 (_ BitVec 32) List!10026) Bool)

(assert (=> b!515216 (= res!314787 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10023))))

(declare-fun b!515217 () Bool)

(declare-fun res!314785 () Bool)

(declare-fun e!300848 () Bool)

(assert (=> b!515217 (=> (not res!314785) (not e!300848))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515217 (= res!314785 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515218 () Bool)

(declare-fun res!314786 () Bool)

(assert (=> b!515218 (=> (not res!314786) (not e!300848))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515218 (= res!314786 (and (= (size!16232 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16232 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16232 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515219 () Bool)

(declare-fun res!314783 () Bool)

(assert (=> b!515219 (=> (not res!314783) (not e!300848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515219 (= res!314783 (validKeyInArray!0 (select (arr!15868 a!3235) j!176)))))

(declare-fun b!515220 () Bool)

(declare-fun e!300847 () Bool)

(assert (=> b!515220 (= e!300847 true)))

(declare-fun lt!235861 () SeekEntryResult!4335)

(assert (=> b!515220 (and (bvslt (x!48498 lt!235861) #b01111111111111111111111111111110) (or (= (select (arr!15868 a!3235) (index!19530 lt!235861)) (select (arr!15868 a!3235) j!176)) (= (select (arr!15868 a!3235) (index!19530 lt!235861)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15868 a!3235) (index!19530 lt!235861)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515221 () Bool)

(assert (=> b!515221 (= e!300846 (not e!300847))))

(declare-fun res!314789 () Bool)

(assert (=> b!515221 (=> res!314789 e!300847)))

(declare-fun lt!235862 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33000 (_ BitVec 32)) SeekEntryResult!4335)

(assert (=> b!515221 (= res!314789 (= lt!235861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235862 (select (store (arr!15868 a!3235) i!1204 k0!2280) j!176) (array!33001 (store (arr!15868 a!3235) i!1204 k0!2280) (size!16232 a!3235)) mask!3524)))))

(declare-fun lt!235860 () (_ BitVec 32))

(assert (=> b!515221 (= lt!235861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235860 (select (arr!15868 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515221 (= lt!235862 (toIndex!0 (select (store (arr!15868 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515221 (= lt!235860 (toIndex!0 (select (arr!15868 a!3235) j!176) mask!3524))))

(assert (=> b!515221 e!300849))

(declare-fun res!314788 () Bool)

(assert (=> b!515221 (=> (not res!314788) (not e!300849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33000 (_ BitVec 32)) Bool)

(assert (=> b!515221 (= res!314788 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15928 0))(
  ( (Unit!15929) )
))
(declare-fun lt!235863 () Unit!15928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15928)

(assert (=> b!515221 (= lt!235863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!314784 () Bool)

(assert (=> start!46688 (=> (not res!314784) (not e!300848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46688 (= res!314784 (validMask!0 mask!3524))))

(assert (=> start!46688 e!300848))

(assert (=> start!46688 true))

(declare-fun array_inv!11664 (array!33000) Bool)

(assert (=> start!46688 (array_inv!11664 a!3235)))

(declare-fun b!515222 () Bool)

(declare-fun res!314779 () Bool)

(assert (=> b!515222 (=> (not res!314779) (not e!300848))))

(assert (=> b!515222 (= res!314779 (validKeyInArray!0 k0!2280))))

(declare-fun b!515223 () Bool)

(assert (=> b!515223 (= e!300848 e!300846)))

(declare-fun res!314781 () Bool)

(assert (=> b!515223 (=> (not res!314781) (not e!300846))))

(declare-fun lt!235864 () SeekEntryResult!4335)

(assert (=> b!515223 (= res!314781 (or (= lt!235864 (MissingZero!4335 i!1204)) (= lt!235864 (MissingVacant!4335 i!1204))))))

(assert (=> b!515223 (= lt!235864 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515224 () Bool)

(declare-fun res!314782 () Bool)

(assert (=> b!515224 (=> (not res!314782) (not e!300846))))

(assert (=> b!515224 (= res!314782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515225 () Bool)

(declare-fun res!314780 () Bool)

(assert (=> b!515225 (=> res!314780 e!300847)))

(get-info :version)

(assert (=> b!515225 (= res!314780 (or (undefined!5147 lt!235861) (not ((_ is Intermediate!4335) lt!235861))))))

(assert (= (and start!46688 res!314784) b!515218))

(assert (= (and b!515218 res!314786) b!515219))

(assert (= (and b!515219 res!314783) b!515222))

(assert (= (and b!515222 res!314779) b!515217))

(assert (= (and b!515217 res!314785) b!515223))

(assert (= (and b!515223 res!314781) b!515224))

(assert (= (and b!515224 res!314782) b!515216))

(assert (= (and b!515216 res!314787) b!515221))

(assert (= (and b!515221 res!314788) b!515215))

(assert (= (and b!515221 (not res!314789)) b!515225))

(assert (= (and b!515225 (not res!314780)) b!515220))

(declare-fun m!496517 () Bool)

(assert (=> b!515221 m!496517))

(declare-fun m!496519 () Bool)

(assert (=> b!515221 m!496519))

(declare-fun m!496521 () Bool)

(assert (=> b!515221 m!496521))

(assert (=> b!515221 m!496521))

(declare-fun m!496523 () Bool)

(assert (=> b!515221 m!496523))

(declare-fun m!496525 () Bool)

(assert (=> b!515221 m!496525))

(declare-fun m!496527 () Bool)

(assert (=> b!515221 m!496527))

(assert (=> b!515221 m!496521))

(declare-fun m!496529 () Bool)

(assert (=> b!515221 m!496529))

(assert (=> b!515221 m!496525))

(declare-fun m!496531 () Bool)

(assert (=> b!515221 m!496531))

(assert (=> b!515221 m!496525))

(declare-fun m!496533 () Bool)

(assert (=> b!515221 m!496533))

(declare-fun m!496535 () Bool)

(assert (=> b!515217 m!496535))

(declare-fun m!496537 () Bool)

(assert (=> start!46688 m!496537))

(declare-fun m!496539 () Bool)

(assert (=> start!46688 m!496539))

(declare-fun m!496541 () Bool)

(assert (=> b!515220 m!496541))

(assert (=> b!515220 m!496525))

(assert (=> b!515219 m!496525))

(assert (=> b!515219 m!496525))

(declare-fun m!496543 () Bool)

(assert (=> b!515219 m!496543))

(declare-fun m!496545 () Bool)

(assert (=> b!515223 m!496545))

(declare-fun m!496547 () Bool)

(assert (=> b!515222 m!496547))

(declare-fun m!496549 () Bool)

(assert (=> b!515224 m!496549))

(assert (=> b!515215 m!496525))

(assert (=> b!515215 m!496525))

(declare-fun m!496551 () Bool)

(assert (=> b!515215 m!496551))

(declare-fun m!496553 () Bool)

(assert (=> b!515216 m!496553))

(check-sat (not b!515219) (not b!515221) (not b!515216) (not start!46688) (not b!515224) (not b!515217) (not b!515222) (not b!515215) (not b!515223))
(check-sat)
