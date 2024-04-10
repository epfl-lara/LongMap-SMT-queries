; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47760 () Bool)

(assert start!47760)

(declare-fun b!525760 () Bool)

(declare-fun res!322483 () Bool)

(declare-fun e!306524 () Bool)

(assert (=> b!525760 (=> (not res!322483) (not e!306524))))

(declare-datatypes ((array!33397 0))(
  ( (array!33398 (arr!16050 (Array (_ BitVec 32) (_ BitVec 64))) (size!16414 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33397)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525760 (= res!322483 (validKeyInArray!0 (select (arr!16050 a!3235) j!176)))))

(declare-fun b!525761 () Bool)

(declare-fun e!306519 () Bool)

(declare-fun e!306520 () Bool)

(assert (=> b!525761 (= e!306519 (not e!306520))))

(declare-fun res!322480 () Bool)

(assert (=> b!525761 (=> res!322480 e!306520)))

(declare-datatypes ((SeekEntryResult!4517 0))(
  ( (MissingZero!4517 (index!20280 (_ BitVec 32))) (Found!4517 (index!20281 (_ BitVec 32))) (Intermediate!4517 (undefined!5329 Bool) (index!20282 (_ BitVec 32)) (x!49258 (_ BitVec 32))) (Undefined!4517) (MissingVacant!4517 (index!20283 (_ BitVec 32))) )
))
(declare-fun lt!241633 () SeekEntryResult!4517)

(declare-fun lt!241627 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!241631 () array!33397)

(declare-fun lt!241630 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33397 (_ BitVec 32)) SeekEntryResult!4517)

(assert (=> b!525761 (= res!322480 (= lt!241633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241627 lt!241630 lt!241631 mask!3524)))))

(declare-fun lt!241629 () (_ BitVec 32))

(assert (=> b!525761 (= lt!241633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241629 (select (arr!16050 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525761 (= lt!241627 (toIndex!0 lt!241630 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525761 (= lt!241630 (select (store (arr!16050 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525761 (= lt!241629 (toIndex!0 (select (arr!16050 a!3235) j!176) mask!3524))))

(assert (=> b!525761 (= lt!241631 (array!33398 (store (arr!16050 a!3235) i!1204 k!2280) (size!16414 a!3235)))))

(declare-fun e!306525 () Bool)

(assert (=> b!525761 e!306525))

(declare-fun res!322482 () Bool)

(assert (=> b!525761 (=> (not res!322482) (not e!306525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33397 (_ BitVec 32)) Bool)

(assert (=> b!525761 (= res!322482 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16520 0))(
  ( (Unit!16521) )
))
(declare-fun lt!241625 () Unit!16520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16520)

(assert (=> b!525761 (= lt!241625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525762 () Bool)

(declare-fun res!322489 () Bool)

(assert (=> b!525762 (=> (not res!322489) (not e!306519))))

(assert (=> b!525762 (= res!322489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525763 () Bool)

(declare-fun e!306521 () Unit!16520)

(declare-fun Unit!16522 () Unit!16520)

(assert (=> b!525763 (= e!306521 Unit!16522)))

(declare-fun lt!241632 () Unit!16520)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33397 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16520)

(assert (=> b!525763 (= lt!241632 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241629 #b00000000000000000000000000000000 (index!20282 lt!241633) (x!49258 lt!241633) mask!3524))))

(declare-fun res!322485 () Bool)

(assert (=> b!525763 (= res!322485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241629 lt!241630 lt!241631 mask!3524) (Intermediate!4517 false (index!20282 lt!241633) (x!49258 lt!241633))))))

(declare-fun e!306523 () Bool)

(assert (=> b!525763 (=> (not res!322485) (not e!306523))))

(assert (=> b!525763 e!306523))

(declare-fun b!525764 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33397 (_ BitVec 32)) SeekEntryResult!4517)

(assert (=> b!525764 (= e!306525 (= (seekEntryOrOpen!0 (select (arr!16050 a!3235) j!176) a!3235 mask!3524) (Found!4517 j!176)))))

(declare-fun b!525765 () Bool)

(declare-fun res!322490 () Bool)

(assert (=> b!525765 (=> (not res!322490) (not e!306524))))

(declare-fun arrayContainsKey!0 (array!33397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525765 (= res!322490 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525766 () Bool)

(declare-fun Unit!16523 () Unit!16520)

(assert (=> b!525766 (= e!306521 Unit!16523)))

(declare-fun b!525767 () Bool)

(assert (=> b!525767 (= e!306520 true)))

(assert (=> b!525767 (= (index!20282 lt!241633) i!1204)))

(declare-fun lt!241624 () Unit!16520)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33397 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16520)

(assert (=> b!525767 (= lt!241624 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241629 #b00000000000000000000000000000000 (index!20282 lt!241633) (x!49258 lt!241633) mask!3524))))

(assert (=> b!525767 (and (or (= (select (arr!16050 a!3235) (index!20282 lt!241633)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16050 a!3235) (index!20282 lt!241633)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16050 a!3235) (index!20282 lt!241633)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16050 a!3235) (index!20282 lt!241633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241628 () Unit!16520)

(assert (=> b!525767 (= lt!241628 e!306521)))

(declare-fun c!61946 () Bool)

(assert (=> b!525767 (= c!61946 (= (select (arr!16050 a!3235) (index!20282 lt!241633)) (select (arr!16050 a!3235) j!176)))))

(assert (=> b!525767 (and (bvslt (x!49258 lt!241633) #b01111111111111111111111111111110) (or (= (select (arr!16050 a!3235) (index!20282 lt!241633)) (select (arr!16050 a!3235) j!176)) (= (select (arr!16050 a!3235) (index!20282 lt!241633)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16050 a!3235) (index!20282 lt!241633)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525768 () Bool)

(declare-fun res!322487 () Bool)

(assert (=> b!525768 (=> res!322487 e!306520)))

(assert (=> b!525768 (= res!322487 (or (undefined!5329 lt!241633) (not (is-Intermediate!4517 lt!241633))))))

(declare-fun b!525769 () Bool)

(declare-fun res!322484 () Bool)

(assert (=> b!525769 (=> (not res!322484) (not e!306519))))

(declare-datatypes ((List!10208 0))(
  ( (Nil!10205) (Cons!10204 (h!11135 (_ BitVec 64)) (t!16436 List!10208)) )
))
(declare-fun arrayNoDuplicates!0 (array!33397 (_ BitVec 32) List!10208) Bool)

(assert (=> b!525769 (= res!322484 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10205))))

(declare-fun b!525770 () Bool)

(declare-fun res!322486 () Bool)

(assert (=> b!525770 (=> (not res!322486) (not e!306524))))

(assert (=> b!525770 (= res!322486 (validKeyInArray!0 k!2280))))

(declare-fun b!525771 () Bool)

(assert (=> b!525771 (= e!306524 e!306519)))

(declare-fun res!322488 () Bool)

(assert (=> b!525771 (=> (not res!322488) (not e!306519))))

(declare-fun lt!241626 () SeekEntryResult!4517)

(assert (=> b!525771 (= res!322488 (or (= lt!241626 (MissingZero!4517 i!1204)) (= lt!241626 (MissingVacant!4517 i!1204))))))

(assert (=> b!525771 (= lt!241626 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525772 () Bool)

(assert (=> b!525772 (= e!306523 false)))

(declare-fun res!322479 () Bool)

(assert (=> start!47760 (=> (not res!322479) (not e!306524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47760 (= res!322479 (validMask!0 mask!3524))))

(assert (=> start!47760 e!306524))

(assert (=> start!47760 true))

(declare-fun array_inv!11846 (array!33397) Bool)

(assert (=> start!47760 (array_inv!11846 a!3235)))

(declare-fun b!525773 () Bool)

(declare-fun res!322481 () Bool)

(assert (=> b!525773 (=> (not res!322481) (not e!306524))))

(assert (=> b!525773 (= res!322481 (and (= (size!16414 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16414 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16414 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47760 res!322479) b!525773))

(assert (= (and b!525773 res!322481) b!525760))

(assert (= (and b!525760 res!322483) b!525770))

(assert (= (and b!525770 res!322486) b!525765))

(assert (= (and b!525765 res!322490) b!525771))

(assert (= (and b!525771 res!322488) b!525762))

(assert (= (and b!525762 res!322489) b!525769))

(assert (= (and b!525769 res!322484) b!525761))

(assert (= (and b!525761 res!322482) b!525764))

(assert (= (and b!525761 (not res!322480)) b!525768))

(assert (= (and b!525768 (not res!322487)) b!525767))

(assert (= (and b!525767 c!61946) b!525763))

(assert (= (and b!525767 (not c!61946)) b!525766))

(assert (= (and b!525763 res!322485) b!525772))

(declare-fun m!506433 () Bool)

(assert (=> b!525770 m!506433))

(declare-fun m!506435 () Bool)

(assert (=> b!525760 m!506435))

(assert (=> b!525760 m!506435))

(declare-fun m!506437 () Bool)

(assert (=> b!525760 m!506437))

(declare-fun m!506439 () Bool)

(assert (=> start!47760 m!506439))

(declare-fun m!506441 () Bool)

(assert (=> start!47760 m!506441))

(declare-fun m!506443 () Bool)

(assert (=> b!525763 m!506443))

(declare-fun m!506445 () Bool)

(assert (=> b!525763 m!506445))

(declare-fun m!506447 () Bool)

(assert (=> b!525765 m!506447))

(assert (=> b!525764 m!506435))

(assert (=> b!525764 m!506435))

(declare-fun m!506449 () Bool)

(assert (=> b!525764 m!506449))

(declare-fun m!506451 () Bool)

(assert (=> b!525767 m!506451))

(declare-fun m!506453 () Bool)

(assert (=> b!525767 m!506453))

(assert (=> b!525767 m!506435))

(declare-fun m!506455 () Bool)

(assert (=> b!525762 m!506455))

(declare-fun m!506457 () Bool)

(assert (=> b!525771 m!506457))

(declare-fun m!506459 () Bool)

(assert (=> b!525761 m!506459))

(declare-fun m!506461 () Bool)

(assert (=> b!525761 m!506461))

(declare-fun m!506463 () Bool)

(assert (=> b!525761 m!506463))

(assert (=> b!525761 m!506435))

(declare-fun m!506465 () Bool)

(assert (=> b!525761 m!506465))

(assert (=> b!525761 m!506435))

(declare-fun m!506467 () Bool)

(assert (=> b!525761 m!506467))

(assert (=> b!525761 m!506435))

(declare-fun m!506469 () Bool)

(assert (=> b!525761 m!506469))

(declare-fun m!506471 () Bool)

(assert (=> b!525761 m!506471))

(declare-fun m!506473 () Bool)

(assert (=> b!525761 m!506473))

(declare-fun m!506475 () Bool)

(assert (=> b!525769 m!506475))

(push 1)

