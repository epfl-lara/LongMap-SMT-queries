; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31242 () Bool)

(assert start!31242)

(declare-fun b!313494 () Bool)

(declare-fun res!169653 () Bool)

(declare-fun e!195347 () Bool)

(assert (=> b!313494 (=> (not res!169653) (not e!195347))))

(declare-datatypes ((array!16007 0))(
  ( (array!16008 (arr!7581 (Array (_ BitVec 32) (_ BitVec 64))) (size!7934 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16007)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313494 (= res!169653 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313495 () Bool)

(declare-fun res!169657 () Bool)

(assert (=> b!313495 (=> (not res!169657) (not e!195347))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2720 0))(
  ( (MissingZero!2720 (index!13056 (_ BitVec 32))) (Found!2720 (index!13057 (_ BitVec 32))) (Intermediate!2720 (undefined!3532 Bool) (index!13058 (_ BitVec 32)) (x!31293 (_ BitVec 32))) (Undefined!2720) (MissingVacant!2720 (index!13059 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16007 (_ BitVec 32)) SeekEntryResult!2720)

(assert (=> b!313495 (= res!169657 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2720 i!1240)))))

(declare-fun res!169655 () Bool)

(assert (=> start!31242 (=> (not res!169655) (not e!195347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31242 (= res!169655 (validMask!0 mask!3709))))

(assert (=> start!31242 e!195347))

(declare-fun array_inv!5553 (array!16007) Bool)

(assert (=> start!31242 (array_inv!5553 a!3293)))

(assert (=> start!31242 true))

(declare-fun b!313496 () Bool)

(declare-fun res!169656 () Bool)

(assert (=> b!313496 (=> (not res!169656) (not e!195347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313496 (= res!169656 (validKeyInArray!0 k0!2441))))

(declare-fun b!313497 () Bool)

(declare-fun res!169658 () Bool)

(assert (=> b!313497 (=> (not res!169658) (not e!195347))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16007 (_ BitVec 32)) SeekEntryResult!2720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313497 (= res!169658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2720 false resIndex!52 resX!52)))))

(declare-fun b!313498 () Bool)

(declare-fun res!169654 () Bool)

(assert (=> b!313498 (=> (not res!169654) (not e!195347))))

(assert (=> b!313498 (= res!169654 (and (= (size!7934 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7934 a!3293))))))

(declare-fun b!313499 () Bool)

(assert (=> b!313499 (= e!195347 (or (bvslt resIndex!52 #b00000000000000000000000000000000) (bvsge resIndex!52 (size!7934 a!3293))))))

(declare-fun b!313500 () Bool)

(declare-fun res!169659 () Bool)

(assert (=> b!313500 (=> (not res!169659) (not e!195347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16007 (_ BitVec 32)) Bool)

(assert (=> b!313500 (= res!169659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31242 res!169655) b!313498))

(assert (= (and b!313498 res!169654) b!313496))

(assert (= (and b!313496 res!169656) b!313494))

(assert (= (and b!313494 res!169653) b!313495))

(assert (= (and b!313495 res!169657) b!313500))

(assert (= (and b!313500 res!169659) b!313497))

(assert (= (and b!313497 res!169658) b!313499))

(declare-fun m!322843 () Bool)

(assert (=> b!313497 m!322843))

(assert (=> b!313497 m!322843))

(declare-fun m!322845 () Bool)

(assert (=> b!313497 m!322845))

(declare-fun m!322847 () Bool)

(assert (=> b!313500 m!322847))

(declare-fun m!322849 () Bool)

(assert (=> b!313495 m!322849))

(declare-fun m!322851 () Bool)

(assert (=> start!31242 m!322851))

(declare-fun m!322853 () Bool)

(assert (=> start!31242 m!322853))

(declare-fun m!322855 () Bool)

(assert (=> b!313496 m!322855))

(declare-fun m!322857 () Bool)

(assert (=> b!313494 m!322857))

(check-sat (not b!313495) (not b!313494) (not b!313500) (not start!31242) (not b!313496) (not b!313497))
(check-sat)
(get-model)

(declare-fun d!68453 () Bool)

(declare-fun res!169706 () Bool)

(declare-fun e!195364 () Bool)

(assert (=> d!68453 (=> res!169706 e!195364)))

(assert (=> d!68453 (= res!169706 (= (select (arr!7581 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68453 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195364)))

(declare-fun b!313547 () Bool)

(declare-fun e!195365 () Bool)

(assert (=> b!313547 (= e!195364 e!195365)))

(declare-fun res!169707 () Bool)

(assert (=> b!313547 (=> (not res!169707) (not e!195365))))

(assert (=> b!313547 (= res!169707 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7934 a!3293)))))

(declare-fun b!313548 () Bool)

(assert (=> b!313548 (= e!195365 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68453 (not res!169706)) b!313547))

(assert (= (and b!313547 res!169707) b!313548))

(declare-fun m!322891 () Bool)

(assert (=> d!68453 m!322891))

(declare-fun m!322893 () Bool)

(assert (=> b!313548 m!322893))

(assert (=> b!313494 d!68453))

(declare-fun b!313585 () Bool)

(declare-fun e!195392 () SeekEntryResult!2720)

(declare-fun e!195391 () SeekEntryResult!2720)

(assert (=> b!313585 (= e!195392 e!195391)))

(declare-fun lt!153484 () (_ BitVec 64))

(declare-fun lt!153483 () SeekEntryResult!2720)

(assert (=> b!313585 (= lt!153484 (select (arr!7581 a!3293) (index!13058 lt!153483)))))

(declare-fun c!49544 () Bool)

(assert (=> b!313585 (= c!49544 (= lt!153484 k0!2441))))

(declare-fun b!313586 () Bool)

(declare-fun c!49542 () Bool)

(assert (=> b!313586 (= c!49542 (= lt!153484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195390 () SeekEntryResult!2720)

(assert (=> b!313586 (= e!195391 e!195390)))

(declare-fun b!313587 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16007 (_ BitVec 32)) SeekEntryResult!2720)

(assert (=> b!313587 (= e!195390 (seekKeyOrZeroReturnVacant!0 (x!31293 lt!153483) (index!13058 lt!153483) (index!13058 lt!153483) k0!2441 a!3293 mask!3709))))

(declare-fun b!313588 () Bool)

(assert (=> b!313588 (= e!195392 Undefined!2720)))

(declare-fun d!68455 () Bool)

(declare-fun lt!153485 () SeekEntryResult!2720)

(get-info :version)

(assert (=> d!68455 (and (or ((_ is Undefined!2720) lt!153485) (not ((_ is Found!2720) lt!153485)) (and (bvsge (index!13057 lt!153485) #b00000000000000000000000000000000) (bvslt (index!13057 lt!153485) (size!7934 a!3293)))) (or ((_ is Undefined!2720) lt!153485) ((_ is Found!2720) lt!153485) (not ((_ is MissingZero!2720) lt!153485)) (and (bvsge (index!13056 lt!153485) #b00000000000000000000000000000000) (bvslt (index!13056 lt!153485) (size!7934 a!3293)))) (or ((_ is Undefined!2720) lt!153485) ((_ is Found!2720) lt!153485) ((_ is MissingZero!2720) lt!153485) (not ((_ is MissingVacant!2720) lt!153485)) (and (bvsge (index!13059 lt!153485) #b00000000000000000000000000000000) (bvslt (index!13059 lt!153485) (size!7934 a!3293)))) (or ((_ is Undefined!2720) lt!153485) (ite ((_ is Found!2720) lt!153485) (= (select (arr!7581 a!3293) (index!13057 lt!153485)) k0!2441) (ite ((_ is MissingZero!2720) lt!153485) (= (select (arr!7581 a!3293) (index!13056 lt!153485)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2720) lt!153485) (= (select (arr!7581 a!3293) (index!13059 lt!153485)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68455 (= lt!153485 e!195392)))

(declare-fun c!49543 () Bool)

(assert (=> d!68455 (= c!49543 (and ((_ is Intermediate!2720) lt!153483) (undefined!3532 lt!153483)))))

(assert (=> d!68455 (= lt!153483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68455 (validMask!0 mask!3709)))

(assert (=> d!68455 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153485)))

(declare-fun b!313589 () Bool)

(assert (=> b!313589 (= e!195391 (Found!2720 (index!13058 lt!153483)))))

(declare-fun b!313590 () Bool)

(assert (=> b!313590 (= e!195390 (MissingZero!2720 (index!13058 lt!153483)))))

(assert (= (and d!68455 c!49543) b!313588))

(assert (= (and d!68455 (not c!49543)) b!313585))

(assert (= (and b!313585 c!49544) b!313589))

(assert (= (and b!313585 (not c!49544)) b!313586))

(assert (= (and b!313586 c!49542) b!313590))

(assert (= (and b!313586 (not c!49542)) b!313587))

(declare-fun m!322919 () Bool)

(assert (=> b!313585 m!322919))

(declare-fun m!322921 () Bool)

(assert (=> b!313587 m!322921))

(assert (=> d!68455 m!322851))

(declare-fun m!322923 () Bool)

(assert (=> d!68455 m!322923))

(declare-fun m!322925 () Bool)

(assert (=> d!68455 m!322925))

(declare-fun m!322927 () Bool)

(assert (=> d!68455 m!322927))

(assert (=> d!68455 m!322843))

(assert (=> d!68455 m!322845))

(assert (=> d!68455 m!322843))

(assert (=> b!313495 d!68455))

(declare-fun b!313625 () Bool)

(declare-fun e!195415 () Bool)

(declare-fun call!25937 () Bool)

(assert (=> b!313625 (= e!195415 call!25937)))

(declare-fun bm!25934 () Bool)

(assert (=> bm!25934 (= call!25937 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68467 () Bool)

(declare-fun res!169726 () Bool)

(declare-fun e!195413 () Bool)

(assert (=> d!68467 (=> res!169726 e!195413)))

(assert (=> d!68467 (= res!169726 (bvsge #b00000000000000000000000000000000 (size!7934 a!3293)))))

(assert (=> d!68467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195413)))

(declare-fun b!313626 () Bool)

(declare-fun e!195414 () Bool)

(assert (=> b!313626 (= e!195413 e!195414)))

(declare-fun c!49559 () Bool)

(assert (=> b!313626 (= c!49559 (validKeyInArray!0 (select (arr!7581 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313627 () Bool)

(assert (=> b!313627 (= e!195414 e!195415)))

(declare-fun lt!153504 () (_ BitVec 64))

(assert (=> b!313627 (= lt!153504 (select (arr!7581 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9645 0))(
  ( (Unit!9646) )
))
(declare-fun lt!153503 () Unit!9645)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16007 (_ BitVec 64) (_ BitVec 32)) Unit!9645)

(assert (=> b!313627 (= lt!153503 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153504 #b00000000000000000000000000000000))))

(assert (=> b!313627 (arrayContainsKey!0 a!3293 lt!153504 #b00000000000000000000000000000000)))

(declare-fun lt!153502 () Unit!9645)

(assert (=> b!313627 (= lt!153502 lt!153503)))

(declare-fun res!169727 () Bool)

(assert (=> b!313627 (= res!169727 (= (seekEntryOrOpen!0 (select (arr!7581 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2720 #b00000000000000000000000000000000)))))

(assert (=> b!313627 (=> (not res!169727) (not e!195415))))

(declare-fun b!313628 () Bool)

(assert (=> b!313628 (= e!195414 call!25937)))

(assert (= (and d!68467 (not res!169726)) b!313626))

(assert (= (and b!313626 c!49559) b!313627))

(assert (= (and b!313626 (not c!49559)) b!313628))

(assert (= (and b!313627 res!169727) b!313625))

(assert (= (or b!313625 b!313628) bm!25934))

(declare-fun m!322929 () Bool)

(assert (=> bm!25934 m!322929))

(assert (=> b!313626 m!322891))

(assert (=> b!313626 m!322891))

(declare-fun m!322931 () Bool)

(assert (=> b!313626 m!322931))

(assert (=> b!313627 m!322891))

(declare-fun m!322933 () Bool)

(assert (=> b!313627 m!322933))

(declare-fun m!322935 () Bool)

(assert (=> b!313627 m!322935))

(assert (=> b!313627 m!322891))

(declare-fun m!322937 () Bool)

(assert (=> b!313627 m!322937))

(assert (=> b!313500 d!68467))

(declare-fun d!68469 () Bool)

(assert (=> d!68469 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31242 d!68469))

(declare-fun d!68477 () Bool)

(assert (=> d!68477 (= (array_inv!5553 a!3293) (bvsge (size!7934 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31242 d!68477))

(declare-fun b!313699 () Bool)

(declare-fun e!195460 () SeekEntryResult!2720)

(assert (=> b!313699 (= e!195460 (Intermediate!2720 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313700 () Bool)

(declare-fun e!195457 () Bool)

(declare-fun lt!153532 () SeekEntryResult!2720)

(assert (=> b!313700 (= e!195457 (bvsge (x!31293 lt!153532) #b01111111111111111111111111111110))))

(declare-fun b!313701 () Bool)

(declare-fun e!195458 () SeekEntryResult!2720)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313701 (= e!195458 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313702 () Bool)

(assert (=> b!313702 (= e!195460 e!195458)))

(declare-fun c!49581 () Bool)

(declare-fun lt!153533 () (_ BitVec 64))

(assert (=> b!313702 (= c!49581 (or (= lt!153533 k0!2441) (= (bvadd lt!153533 lt!153533) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313703 () Bool)

(assert (=> b!313703 (and (bvsge (index!13058 lt!153532) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153532) (size!7934 a!3293)))))

(declare-fun res!169760 () Bool)

(assert (=> b!313703 (= res!169760 (= (select (arr!7581 a!3293) (index!13058 lt!153532)) k0!2441))))

(declare-fun e!195459 () Bool)

(assert (=> b!313703 (=> res!169760 e!195459)))

(declare-fun e!195461 () Bool)

(assert (=> b!313703 (= e!195461 e!195459)))

(declare-fun b!313704 () Bool)

(assert (=> b!313704 (and (bvsge (index!13058 lt!153532) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153532) (size!7934 a!3293)))))

(assert (=> b!313704 (= e!195459 (= (select (arr!7581 a!3293) (index!13058 lt!153532)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313705 () Bool)

(assert (=> b!313705 (and (bvsge (index!13058 lt!153532) #b00000000000000000000000000000000) (bvslt (index!13058 lt!153532) (size!7934 a!3293)))))

(declare-fun res!169759 () Bool)

(assert (=> b!313705 (= res!169759 (= (select (arr!7581 a!3293) (index!13058 lt!153532)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313705 (=> res!169759 e!195459)))

(declare-fun b!313706 () Bool)

(assert (=> b!313706 (= e!195457 e!195461)))

(declare-fun res!169758 () Bool)

(assert (=> b!313706 (= res!169758 (and ((_ is Intermediate!2720) lt!153532) (not (undefined!3532 lt!153532)) (bvslt (x!31293 lt!153532) #b01111111111111111111111111111110) (bvsge (x!31293 lt!153532) #b00000000000000000000000000000000) (bvsge (x!31293 lt!153532) #b00000000000000000000000000000000)))))

(assert (=> b!313706 (=> (not res!169758) (not e!195461))))

(declare-fun d!68479 () Bool)

(assert (=> d!68479 e!195457))

(declare-fun c!49583 () Bool)

(assert (=> d!68479 (= c!49583 (and ((_ is Intermediate!2720) lt!153532) (undefined!3532 lt!153532)))))

(assert (=> d!68479 (= lt!153532 e!195460)))

(declare-fun c!49582 () Bool)

(assert (=> d!68479 (= c!49582 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68479 (= lt!153533 (select (arr!7581 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68479 (validMask!0 mask!3709)))

(assert (=> d!68479 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153532)))

(declare-fun b!313707 () Bool)

(assert (=> b!313707 (= e!195458 (Intermediate!2720 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68479 c!49582) b!313699))

(assert (= (and d!68479 (not c!49582)) b!313702))

(assert (= (and b!313702 c!49581) b!313707))

(assert (= (and b!313702 (not c!49581)) b!313701))

(assert (= (and d!68479 c!49583) b!313700))

(assert (= (and d!68479 (not c!49583)) b!313706))

(assert (= (and b!313706 res!169758) b!313703))

(assert (= (and b!313703 (not res!169760)) b!313705))

(assert (= (and b!313705 (not res!169759)) b!313704))

(assert (=> b!313701 m!322843))

(declare-fun m!322967 () Bool)

(assert (=> b!313701 m!322967))

(assert (=> b!313701 m!322967))

(declare-fun m!322969 () Bool)

(assert (=> b!313701 m!322969))

(declare-fun m!322971 () Bool)

(assert (=> b!313704 m!322971))

(assert (=> d!68479 m!322843))

(declare-fun m!322973 () Bool)

(assert (=> d!68479 m!322973))

(assert (=> d!68479 m!322851))

(assert (=> b!313705 m!322971))

(assert (=> b!313703 m!322971))

(assert (=> b!313497 d!68479))

(declare-fun d!68493 () Bool)

(declare-fun lt!153539 () (_ BitVec 32))

(declare-fun lt!153538 () (_ BitVec 32))

(assert (=> d!68493 (= lt!153539 (bvmul (bvxor lt!153538 (bvlshr lt!153538 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68493 (= lt!153538 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68493 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169761 (let ((h!5325 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31301 (bvmul (bvxor h!5325 (bvlshr h!5325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31301 (bvlshr x!31301 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169761 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169761 #b00000000000000000000000000000000))))))

(assert (=> d!68493 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153539 (bvlshr lt!153539 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313497 d!68493))

(declare-fun d!68495 () Bool)

(assert (=> d!68495 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313496 d!68495))

(check-sat (not d!68479) (not b!313548) (not bm!25934) (not d!68455) (not b!313701) (not b!313587) (not b!313626) (not b!313627))
(check-sat)
