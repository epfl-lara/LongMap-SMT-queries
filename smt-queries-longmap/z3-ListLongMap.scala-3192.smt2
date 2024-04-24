; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44768 () Bool)

(assert start!44768)

(declare-fun b!491543 () Bool)

(declare-fun res!294539 () Bool)

(declare-fun e!288791 () Bool)

(assert (=> b!491543 (=> (not res!294539) (not e!288791))))

(declare-datatypes ((array!31828 0))(
  ( (array!31829 (arr!15301 (Array (_ BitVec 32) (_ BitVec 64))) (size!15665 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31828)

(declare-datatypes ((List!9366 0))(
  ( (Nil!9363) (Cons!9362 (h!10224 (_ BitVec 64)) (t!15586 List!9366)) )
))
(declare-fun arrayNoDuplicates!0 (array!31828 (_ BitVec 32) List!9366) Bool)

(assert (=> b!491543 (= res!294539 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9363))))

(declare-fun b!491544 () Bool)

(declare-fun e!288790 () Bool)

(assert (=> b!491544 (= e!288791 (not e!288790))))

(declare-fun res!294534 () Bool)

(assert (=> b!491544 (=> res!294534 e!288790)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222277 () array!31828)

(declare-fun lt!222276 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3724 0))(
  ( (MissingZero!3724 (index!17075 (_ BitVec 32))) (Found!3724 (index!17076 (_ BitVec 32))) (Intermediate!3724 (undefined!4536 Bool) (index!17077 (_ BitVec 32)) (x!46307 (_ BitVec 32))) (Undefined!3724) (MissingVacant!3724 (index!17078 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31828 (_ BitVec 32)) SeekEntryResult!3724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491544 (= res!294534 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15301 a!3235) j!176) mask!3524) (select (arr!15301 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222276 mask!3524) lt!222276 lt!222277 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491544 (= lt!222276 (select (store (arr!15301 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491544 (= lt!222277 (array!31829 (store (arr!15301 a!3235) i!1204 k0!2280) (size!15665 a!3235)))))

(declare-fun lt!222279 () SeekEntryResult!3724)

(assert (=> b!491544 (= lt!222279 (Found!3724 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31828 (_ BitVec 32)) SeekEntryResult!3724)

(assert (=> b!491544 (= lt!222279 (seekEntryOrOpen!0 (select (arr!15301 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31828 (_ BitVec 32)) Bool)

(assert (=> b!491544 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14455 0))(
  ( (Unit!14456) )
))
(declare-fun lt!222275 () Unit!14455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14455)

(assert (=> b!491544 (= lt!222275 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491545 () Bool)

(assert (=> b!491545 (= e!288790 true)))

(assert (=> b!491545 (= lt!222279 (seekEntryOrOpen!0 lt!222276 lt!222277 mask!3524))))

(declare-fun lt!222278 () Unit!14455)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31828 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14455)

(assert (=> b!491545 (= lt!222278 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491546 () Bool)

(declare-fun res!294533 () Bool)

(declare-fun e!288792 () Bool)

(assert (=> b!491546 (=> (not res!294533) (not e!288792))))

(declare-fun arrayContainsKey!0 (array!31828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491546 (= res!294533 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294536 () Bool)

(assert (=> start!44768 (=> (not res!294536) (not e!288792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44768 (= res!294536 (validMask!0 mask!3524))))

(assert (=> start!44768 e!288792))

(assert (=> start!44768 true))

(declare-fun array_inv!11160 (array!31828) Bool)

(assert (=> start!44768 (array_inv!11160 a!3235)))

(declare-fun b!491547 () Bool)

(assert (=> b!491547 (= e!288792 e!288791)))

(declare-fun res!294541 () Bool)

(assert (=> b!491547 (=> (not res!294541) (not e!288791))))

(declare-fun lt!222280 () SeekEntryResult!3724)

(assert (=> b!491547 (= res!294541 (or (= lt!222280 (MissingZero!3724 i!1204)) (= lt!222280 (MissingVacant!3724 i!1204))))))

(assert (=> b!491547 (= lt!222280 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491548 () Bool)

(declare-fun res!294535 () Bool)

(assert (=> b!491548 (=> (not res!294535) (not e!288792))))

(assert (=> b!491548 (= res!294535 (and (= (size!15665 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15665 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15665 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491549 () Bool)

(declare-fun res!294537 () Bool)

(assert (=> b!491549 (=> (not res!294537) (not e!288792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491549 (= res!294537 (validKeyInArray!0 k0!2280))))

(declare-fun b!491550 () Bool)

(declare-fun res!294540 () Bool)

(assert (=> b!491550 (=> (not res!294540) (not e!288792))))

(assert (=> b!491550 (= res!294540 (validKeyInArray!0 (select (arr!15301 a!3235) j!176)))))

(declare-fun b!491551 () Bool)

(declare-fun res!294538 () Bool)

(assert (=> b!491551 (=> (not res!294538) (not e!288791))))

(assert (=> b!491551 (= res!294538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44768 res!294536) b!491548))

(assert (= (and b!491548 res!294535) b!491550))

(assert (= (and b!491550 res!294540) b!491549))

(assert (= (and b!491549 res!294537) b!491546))

(assert (= (and b!491546 res!294533) b!491547))

(assert (= (and b!491547 res!294541) b!491551))

(assert (= (and b!491551 res!294538) b!491543))

(assert (= (and b!491543 res!294539) b!491544))

(assert (= (and b!491544 (not res!294534)) b!491545))

(declare-fun m!472447 () Bool)

(assert (=> b!491543 m!472447))

(declare-fun m!472449 () Bool)

(assert (=> b!491549 m!472449))

(declare-fun m!472451 () Bool)

(assert (=> b!491547 m!472451))

(declare-fun m!472453 () Bool)

(assert (=> b!491544 m!472453))

(declare-fun m!472455 () Bool)

(assert (=> b!491544 m!472455))

(declare-fun m!472457 () Bool)

(assert (=> b!491544 m!472457))

(declare-fun m!472459 () Bool)

(assert (=> b!491544 m!472459))

(declare-fun m!472461 () Bool)

(assert (=> b!491544 m!472461))

(declare-fun m!472463 () Bool)

(assert (=> b!491544 m!472463))

(declare-fun m!472465 () Bool)

(assert (=> b!491544 m!472465))

(assert (=> b!491544 m!472461))

(assert (=> b!491544 m!472459))

(assert (=> b!491544 m!472465))

(declare-fun m!472467 () Bool)

(assert (=> b!491544 m!472467))

(assert (=> b!491544 m!472461))

(declare-fun m!472469 () Bool)

(assert (=> b!491544 m!472469))

(assert (=> b!491544 m!472461))

(declare-fun m!472471 () Bool)

(assert (=> b!491544 m!472471))

(declare-fun m!472473 () Bool)

(assert (=> b!491551 m!472473))

(declare-fun m!472475 () Bool)

(assert (=> start!44768 m!472475))

(declare-fun m!472477 () Bool)

(assert (=> start!44768 m!472477))

(declare-fun m!472479 () Bool)

(assert (=> b!491546 m!472479))

(assert (=> b!491550 m!472461))

(assert (=> b!491550 m!472461))

(declare-fun m!472481 () Bool)

(assert (=> b!491550 m!472481))

(declare-fun m!472483 () Bool)

(assert (=> b!491545 m!472483))

(declare-fun m!472485 () Bool)

(assert (=> b!491545 m!472485))

(check-sat (not b!491546) (not b!491544) (not b!491551) (not b!491543) (not b!491549) (not b!491550) (not b!491545) (not b!491547) (not start!44768))
(check-sat)
