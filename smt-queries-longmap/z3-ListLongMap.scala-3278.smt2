; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45614 () Bool)

(assert start!45614)

(declare-fun b!502585 () Bool)

(declare-fun res!303988 () Bool)

(declare-fun e!294372 () Bool)

(assert (=> b!502585 (=> res!303988 e!294372)))

(declare-fun e!294377 () Bool)

(assert (=> b!502585 (= res!303988 e!294377)))

(declare-fun res!303990 () Bool)

(assert (=> b!502585 (=> (not res!303990) (not e!294377))))

(declare-datatypes ((SeekEntryResult!4032 0))(
  ( (MissingZero!4032 (index!18316 (_ BitVec 32))) (Found!4032 (index!18317 (_ BitVec 32))) (Intermediate!4032 (undefined!4844 Bool) (index!18318 (_ BitVec 32)) (x!47345 (_ BitVec 32))) (Undefined!4032) (MissingVacant!4032 (index!18319 (_ BitVec 32))) )
))
(declare-fun lt!228471 () SeekEntryResult!4032)

(assert (=> b!502585 (= res!303990 (bvsgt #b00000000000000000000000000000000 (x!47345 lt!228471)))))

(declare-fun b!502586 () Bool)

(declare-fun e!294373 () Bool)

(assert (=> b!502586 (= e!294373 e!294372)))

(declare-fun res!303998 () Bool)

(assert (=> b!502586 (=> res!303998 e!294372)))

(declare-datatypes ((array!32370 0))(
  ( (array!32371 (arr!15565 (Array (_ BitVec 32) (_ BitVec 64))) (size!15929 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32370)

(declare-fun lt!228473 () (_ BitVec 32))

(assert (=> b!502586 (= res!303998 (or (bvsgt (x!47345 lt!228471) #b01111111111111111111111111111110) (bvslt lt!228473 #b00000000000000000000000000000000) (bvsge lt!228473 (size!15929 a!3235)) (bvslt (index!18318 lt!228471) #b00000000000000000000000000000000) (bvsge (index!18318 lt!228471) (size!15929 a!3235)) (not (= lt!228471 (Intermediate!4032 false (index!18318 lt!228471) (x!47345 lt!228471))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502586 (= (index!18318 lt!228471) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15204 0))(
  ( (Unit!15205) )
))
(declare-fun lt!228477 () Unit!15204)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32370 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15204)

(assert (=> b!502586 (= lt!228477 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228473 #b00000000000000000000000000000000 (index!18318 lt!228471) (x!47345 lt!228471) mask!3524))))

(assert (=> b!502586 (and (or (= (select (arr!15565 a!3235) (index!18318 lt!228471)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15565 a!3235) (index!18318 lt!228471)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15565 a!3235) (index!18318 lt!228471)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15565 a!3235) (index!18318 lt!228471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228476 () Unit!15204)

(declare-fun e!294375 () Unit!15204)

(assert (=> b!502586 (= lt!228476 e!294375)))

(declare-fun c!59579 () Bool)

(assert (=> b!502586 (= c!59579 (= (select (arr!15565 a!3235) (index!18318 lt!228471)) (select (arr!15565 a!3235) j!176)))))

(assert (=> b!502586 (and (bvslt (x!47345 lt!228471) #b01111111111111111111111111111110) (or (= (select (arr!15565 a!3235) (index!18318 lt!228471)) (select (arr!15565 a!3235) j!176)) (= (select (arr!15565 a!3235) (index!18318 lt!228471)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15565 a!3235) (index!18318 lt!228471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502587 () Bool)

(declare-fun Unit!15206 () Unit!15204)

(assert (=> b!502587 (= e!294375 Unit!15206)))

(declare-fun b!502588 () Bool)

(declare-fun res!303987 () Bool)

(declare-fun e!294371 () Bool)

(assert (=> b!502588 (=> (not res!303987) (not e!294371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502588 (= res!303987 (validKeyInArray!0 (select (arr!15565 a!3235) j!176)))))

(declare-fun res!303984 () Bool)

(assert (=> start!45614 (=> (not res!303984) (not e!294371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45614 (= res!303984 (validMask!0 mask!3524))))

(assert (=> start!45614 e!294371))

(assert (=> start!45614 true))

(declare-fun array_inv!11361 (array!32370) Bool)

(assert (=> start!45614 (array_inv!11361 a!3235)))

(declare-fun b!502589 () Bool)

(declare-fun res!303989 () Bool)

(assert (=> b!502589 (=> (not res!303989) (not e!294371))))

(assert (=> b!502589 (= res!303989 (and (= (size!15929 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15929 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15929 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502590 () Bool)

(declare-fun res!303992 () Bool)

(assert (=> b!502590 (=> (not res!303992) (not e!294371))))

(declare-fun arrayContainsKey!0 (array!32370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502590 (= res!303992 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502591 () Bool)

(declare-fun res!303993 () Bool)

(assert (=> b!502591 (=> (not res!303993) (not e!294371))))

(assert (=> b!502591 (= res!303993 (validKeyInArray!0 k0!2280))))

(declare-fun b!502592 () Bool)

(declare-fun e!294370 () Bool)

(assert (=> b!502592 (= e!294370 (not e!294373))))

(declare-fun res!303997 () Bool)

(assert (=> b!502592 (=> res!303997 e!294373)))

(declare-fun lt!228474 () array!32370)

(declare-fun lt!228472 () (_ BitVec 64))

(declare-fun lt!228478 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32370 (_ BitVec 32)) SeekEntryResult!4032)

(assert (=> b!502592 (= res!303997 (= lt!228471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228478 lt!228472 lt!228474 mask!3524)))))

(assert (=> b!502592 (= lt!228471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228473 (select (arr!15565 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502592 (= lt!228478 (toIndex!0 lt!228472 mask!3524))))

(assert (=> b!502592 (= lt!228472 (select (store (arr!15565 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502592 (= lt!228473 (toIndex!0 (select (arr!15565 a!3235) j!176) mask!3524))))

(assert (=> b!502592 (= lt!228474 (array!32371 (store (arr!15565 a!3235) i!1204 k0!2280) (size!15929 a!3235)))))

(declare-fun e!294376 () Bool)

(assert (=> b!502592 e!294376))

(declare-fun res!303996 () Bool)

(assert (=> b!502592 (=> (not res!303996) (not e!294376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32370 (_ BitVec 32)) Bool)

(assert (=> b!502592 (= res!303996 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228475 () Unit!15204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15204)

(assert (=> b!502592 (= lt!228475 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502593 () Bool)

(declare-fun res!303991 () Bool)

(assert (=> b!502593 (=> (not res!303991) (not e!294370))))

(declare-datatypes ((List!9723 0))(
  ( (Nil!9720) (Cons!9719 (h!10596 (_ BitVec 64)) (t!15951 List!9723)) )
))
(declare-fun arrayNoDuplicates!0 (array!32370 (_ BitVec 32) List!9723) Bool)

(assert (=> b!502593 (= res!303991 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9720))))

(declare-fun b!502594 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32370 (_ BitVec 32)) SeekEntryResult!4032)

(assert (=> b!502594 (= e!294376 (= (seekEntryOrOpen!0 (select (arr!15565 a!3235) j!176) a!3235 mask!3524) (Found!4032 j!176)))))

(declare-fun b!502595 () Bool)

(assert (=> b!502595 (= e!294371 e!294370)))

(declare-fun res!303995 () Bool)

(assert (=> b!502595 (=> (not res!303995) (not e!294370))))

(declare-fun lt!228480 () SeekEntryResult!4032)

(assert (=> b!502595 (= res!303995 (or (= lt!228480 (MissingZero!4032 i!1204)) (= lt!228480 (MissingVacant!4032 i!1204))))))

(assert (=> b!502595 (= lt!228480 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502596 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32370 (_ BitVec 32)) SeekEntryResult!4032)

(assert (=> b!502596 (= e!294377 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228473 (index!18318 lt!228471) (select (arr!15565 a!3235) j!176) a!3235 mask!3524) (Found!4032 j!176))))))

(declare-fun b!502597 () Bool)

(assert (=> b!502597 (= e!294372 true)))

(declare-fun lt!228481 () SeekEntryResult!4032)

(assert (=> b!502597 (= lt!228481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228473 lt!228472 lt!228474 mask!3524))))

(declare-fun b!502598 () Bool)

(declare-fun res!303986 () Bool)

(assert (=> b!502598 (=> res!303986 e!294373)))

(get-info :version)

(assert (=> b!502598 (= res!303986 (or (undefined!4844 lt!228471) (not ((_ is Intermediate!4032) lt!228471))))))

(declare-fun b!502599 () Bool)

(declare-fun e!294378 () Bool)

(assert (=> b!502599 (= e!294378 false)))

(declare-fun b!502600 () Bool)

(declare-fun Unit!15207 () Unit!15204)

(assert (=> b!502600 (= e!294375 Unit!15207)))

(declare-fun lt!228479 () Unit!15204)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32370 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15204)

(assert (=> b!502600 (= lt!228479 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228473 #b00000000000000000000000000000000 (index!18318 lt!228471) (x!47345 lt!228471) mask!3524))))

(declare-fun res!303985 () Bool)

(assert (=> b!502600 (= res!303985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228473 lt!228472 lt!228474 mask!3524) (Intermediate!4032 false (index!18318 lt!228471) (x!47345 lt!228471))))))

(assert (=> b!502600 (=> (not res!303985) (not e!294378))))

(assert (=> b!502600 e!294378))

(declare-fun b!502601 () Bool)

(declare-fun res!303994 () Bool)

(assert (=> b!502601 (=> (not res!303994) (not e!294370))))

(assert (=> b!502601 (= res!303994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45614 res!303984) b!502589))

(assert (= (and b!502589 res!303989) b!502588))

(assert (= (and b!502588 res!303987) b!502591))

(assert (= (and b!502591 res!303993) b!502590))

(assert (= (and b!502590 res!303992) b!502595))

(assert (= (and b!502595 res!303995) b!502601))

(assert (= (and b!502601 res!303994) b!502593))

(assert (= (and b!502593 res!303991) b!502592))

(assert (= (and b!502592 res!303996) b!502594))

(assert (= (and b!502592 (not res!303997)) b!502598))

(assert (= (and b!502598 (not res!303986)) b!502586))

(assert (= (and b!502586 c!59579) b!502600))

(assert (= (and b!502586 (not c!59579)) b!502587))

(assert (= (and b!502600 res!303985) b!502599))

(assert (= (and b!502586 (not res!303998)) b!502585))

(assert (= (and b!502585 res!303990) b!502596))

(assert (= (and b!502585 (not res!303988)) b!502597))

(declare-fun m!483505 () Bool)

(assert (=> b!502592 m!483505))

(declare-fun m!483507 () Bool)

(assert (=> b!502592 m!483507))

(declare-fun m!483509 () Bool)

(assert (=> b!502592 m!483509))

(declare-fun m!483511 () Bool)

(assert (=> b!502592 m!483511))

(declare-fun m!483513 () Bool)

(assert (=> b!502592 m!483513))

(assert (=> b!502592 m!483505))

(declare-fun m!483515 () Bool)

(assert (=> b!502592 m!483515))

(assert (=> b!502592 m!483505))

(declare-fun m!483517 () Bool)

(assert (=> b!502592 m!483517))

(declare-fun m!483519 () Bool)

(assert (=> b!502592 m!483519))

(declare-fun m!483521 () Bool)

(assert (=> b!502592 m!483521))

(declare-fun m!483523 () Bool)

(assert (=> b!502600 m!483523))

(declare-fun m!483525 () Bool)

(assert (=> b!502600 m!483525))

(declare-fun m!483527 () Bool)

(assert (=> start!45614 m!483527))

(declare-fun m!483529 () Bool)

(assert (=> start!45614 m!483529))

(declare-fun m!483531 () Bool)

(assert (=> b!502590 m!483531))

(declare-fun m!483533 () Bool)

(assert (=> b!502595 m!483533))

(assert (=> b!502597 m!483525))

(declare-fun m!483535 () Bool)

(assert (=> b!502591 m!483535))

(declare-fun m!483537 () Bool)

(assert (=> b!502593 m!483537))

(assert (=> b!502596 m!483505))

(assert (=> b!502596 m!483505))

(declare-fun m!483539 () Bool)

(assert (=> b!502596 m!483539))

(declare-fun m!483541 () Bool)

(assert (=> b!502601 m!483541))

(assert (=> b!502588 m!483505))

(assert (=> b!502588 m!483505))

(declare-fun m!483543 () Bool)

(assert (=> b!502588 m!483543))

(assert (=> b!502594 m!483505))

(assert (=> b!502594 m!483505))

(declare-fun m!483545 () Bool)

(assert (=> b!502594 m!483545))

(declare-fun m!483547 () Bool)

(assert (=> b!502586 m!483547))

(declare-fun m!483549 () Bool)

(assert (=> b!502586 m!483549))

(assert (=> b!502586 m!483505))

(check-sat (not b!502595) (not b!502586) (not b!502601) (not b!502597) (not b!502593) (not b!502590) (not b!502600) (not b!502591) (not start!45614) (not b!502588) (not b!502594) (not b!502592) (not b!502596))
(check-sat)
