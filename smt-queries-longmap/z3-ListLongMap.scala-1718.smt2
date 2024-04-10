; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31654 () Bool)

(assert start!31654)

(declare-fun b!316563 () Bool)

(declare-fun res!171501 () Bool)

(declare-fun e!196888 () Bool)

(assert (=> b!316563 (=> (not res!171501) (not e!196888))))

(declare-datatypes ((array!16127 0))(
  ( (array!16128 (arr!7632 (Array (_ BitVec 32) (_ BitVec 64))) (size!7984 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16127)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316563 (= res!171501 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!171498 () Bool)

(assert (=> start!31654 (=> (not res!171498) (not e!196888))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31654 (= res!171498 (validMask!0 mask!3709))))

(assert (=> start!31654 e!196888))

(declare-fun array_inv!5595 (array!16127) Bool)

(assert (=> start!31654 (array_inv!5595 a!3293)))

(assert (=> start!31654 true))

(declare-fun b!316564 () Bool)

(declare-fun res!171497 () Bool)

(assert (=> b!316564 (=> (not res!171497) (not e!196888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316564 (= res!171497 (validKeyInArray!0 k0!2441))))

(declare-fun b!316565 () Bool)

(declare-fun res!171496 () Bool)

(assert (=> b!316565 (=> (not res!171496) (not e!196888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16127 (_ BitVec 32)) Bool)

(assert (=> b!316565 (= res!171496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316566 () Bool)

(declare-fun e!196891 () Bool)

(assert (=> b!316566 (= e!196888 e!196891)))

(declare-fun res!171504 () Bool)

(assert (=> b!316566 (=> (not res!171504) (not e!196891))))

(declare-datatypes ((SeekEntryResult!2772 0))(
  ( (MissingZero!2772 (index!13264 (_ BitVec 32))) (Found!2772 (index!13265 (_ BitVec 32))) (Intermediate!2772 (undefined!3584 Bool) (index!13266 (_ BitVec 32)) (x!31515 (_ BitVec 32))) (Undefined!2772) (MissingVacant!2772 (index!13267 (_ BitVec 32))) )
))
(declare-fun lt!154614 () SeekEntryResult!2772)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16127 (_ BitVec 32)) SeekEntryResult!2772)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316566 (= res!171504 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154614))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!316566 (= lt!154614 (Intermediate!2772 false resIndex!52 resX!52))))

(declare-fun b!316567 () Bool)

(declare-fun res!171503 () Bool)

(assert (=> b!316567 (=> (not res!171503) (not e!196888))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16127 (_ BitVec 32)) SeekEntryResult!2772)

(assert (=> b!316567 (= res!171503 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2772 i!1240)))))

(declare-fun e!196889 () Bool)

(declare-fun lt!154613 () SeekEntryResult!2772)

(declare-fun b!316568 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316568 (= e!196889 (not (= lt!154613 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))))

(declare-fun b!316569 () Bool)

(declare-fun res!171502 () Bool)

(assert (=> b!316569 (=> (not res!171502) (not e!196891))))

(assert (=> b!316569 (= res!171502 (and (= (select (arr!7632 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7984 a!3293))))))

(declare-fun b!316570 () Bool)

(declare-fun res!171500 () Bool)

(assert (=> b!316570 (=> (not res!171500) (not e!196888))))

(assert (=> b!316570 (= res!171500 (and (= (size!7984 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7984 a!3293))))))

(declare-fun b!316571 () Bool)

(assert (=> b!316571 (= e!196891 e!196889)))

(declare-fun res!171499 () Bool)

(assert (=> b!316571 (=> (not res!171499) (not e!196889))))

(assert (=> b!316571 (= res!171499 (and (= lt!154613 lt!154614) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7632 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316571 (= lt!154613 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31654 res!171498) b!316570))

(assert (= (and b!316570 res!171500) b!316564))

(assert (= (and b!316564 res!171497) b!316563))

(assert (= (and b!316563 res!171501) b!316567))

(assert (= (and b!316567 res!171503) b!316565))

(assert (= (and b!316565 res!171496) b!316566))

(assert (= (and b!316566 res!171504) b!316569))

(assert (= (and b!316569 res!171502) b!316571))

(assert (= (and b!316571 res!171499) b!316568))

(declare-fun m!325417 () Bool)

(assert (=> start!31654 m!325417))

(declare-fun m!325419 () Bool)

(assert (=> start!31654 m!325419))

(declare-fun m!325421 () Bool)

(assert (=> b!316568 m!325421))

(assert (=> b!316568 m!325421))

(declare-fun m!325423 () Bool)

(assert (=> b!316568 m!325423))

(declare-fun m!325425 () Bool)

(assert (=> b!316569 m!325425))

(declare-fun m!325427 () Bool)

(assert (=> b!316566 m!325427))

(assert (=> b!316566 m!325427))

(declare-fun m!325429 () Bool)

(assert (=> b!316566 m!325429))

(declare-fun m!325431 () Bool)

(assert (=> b!316564 m!325431))

(declare-fun m!325433 () Bool)

(assert (=> b!316567 m!325433))

(declare-fun m!325435 () Bool)

(assert (=> b!316571 m!325435))

(declare-fun m!325437 () Bool)

(assert (=> b!316571 m!325437))

(declare-fun m!325439 () Bool)

(assert (=> b!316565 m!325439))

(declare-fun m!325441 () Bool)

(assert (=> b!316563 m!325441))

(check-sat (not b!316563) (not start!31654) (not b!316567) (not b!316571) (not b!316566) (not b!316568) (not b!316564) (not b!316565))
(check-sat)
(get-model)

(declare-fun b!316611 () Bool)

(declare-fun e!196912 () SeekEntryResult!2772)

(declare-fun lt!154629 () SeekEntryResult!2772)

(assert (=> b!316611 (= e!196912 (Found!2772 (index!13266 lt!154629)))))

(declare-fun b!316612 () Bool)

(declare-fun e!196910 () SeekEntryResult!2772)

(assert (=> b!316612 (= e!196910 e!196912)))

(declare-fun lt!154628 () (_ BitVec 64))

(assert (=> b!316612 (= lt!154628 (select (arr!7632 a!3293) (index!13266 lt!154629)))))

(declare-fun c!50159 () Bool)

(assert (=> b!316612 (= c!50159 (= lt!154628 k0!2441))))

(declare-fun b!316613 () Bool)

(assert (=> b!316613 (= e!196910 Undefined!2772)))

(declare-fun d!69049 () Bool)

(declare-fun lt!154627 () SeekEntryResult!2772)

(get-info :version)

(assert (=> d!69049 (and (or ((_ is Undefined!2772) lt!154627) (not ((_ is Found!2772) lt!154627)) (and (bvsge (index!13265 lt!154627) #b00000000000000000000000000000000) (bvslt (index!13265 lt!154627) (size!7984 a!3293)))) (or ((_ is Undefined!2772) lt!154627) ((_ is Found!2772) lt!154627) (not ((_ is MissingZero!2772) lt!154627)) (and (bvsge (index!13264 lt!154627) #b00000000000000000000000000000000) (bvslt (index!13264 lt!154627) (size!7984 a!3293)))) (or ((_ is Undefined!2772) lt!154627) ((_ is Found!2772) lt!154627) ((_ is MissingZero!2772) lt!154627) (not ((_ is MissingVacant!2772) lt!154627)) (and (bvsge (index!13267 lt!154627) #b00000000000000000000000000000000) (bvslt (index!13267 lt!154627) (size!7984 a!3293)))) (or ((_ is Undefined!2772) lt!154627) (ite ((_ is Found!2772) lt!154627) (= (select (arr!7632 a!3293) (index!13265 lt!154627)) k0!2441) (ite ((_ is MissingZero!2772) lt!154627) (= (select (arr!7632 a!3293) (index!13264 lt!154627)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2772) lt!154627) (= (select (arr!7632 a!3293) (index!13267 lt!154627)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69049 (= lt!154627 e!196910)))

(declare-fun c!50158 () Bool)

(assert (=> d!69049 (= c!50158 (and ((_ is Intermediate!2772) lt!154629) (undefined!3584 lt!154629)))))

(assert (=> d!69049 (= lt!154629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!69049 (validMask!0 mask!3709)))

(assert (=> d!69049 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154627)))

(declare-fun b!316614 () Bool)

(declare-fun e!196911 () SeekEntryResult!2772)

(assert (=> b!316614 (= e!196911 (MissingZero!2772 (index!13266 lt!154629)))))

(declare-fun b!316615 () Bool)

(declare-fun c!50160 () Bool)

(assert (=> b!316615 (= c!50160 (= lt!154628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316615 (= e!196912 e!196911)))

(declare-fun b!316616 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16127 (_ BitVec 32)) SeekEntryResult!2772)

(assert (=> b!316616 (= e!196911 (seekKeyOrZeroReturnVacant!0 (x!31515 lt!154629) (index!13266 lt!154629) (index!13266 lt!154629) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69049 c!50158) b!316613))

(assert (= (and d!69049 (not c!50158)) b!316612))

(assert (= (and b!316612 c!50159) b!316611))

(assert (= (and b!316612 (not c!50159)) b!316615))

(assert (= (and b!316615 c!50160) b!316614))

(assert (= (and b!316615 (not c!50160)) b!316616))

(declare-fun m!325469 () Bool)

(assert (=> b!316612 m!325469))

(declare-fun m!325471 () Bool)

(assert (=> d!69049 m!325471))

(assert (=> d!69049 m!325417))

(assert (=> d!69049 m!325427))

(declare-fun m!325473 () Bool)

(assert (=> d!69049 m!325473))

(assert (=> d!69049 m!325427))

(assert (=> d!69049 m!325429))

(declare-fun m!325475 () Bool)

(assert (=> d!69049 m!325475))

(declare-fun m!325477 () Bool)

(assert (=> b!316616 m!325477))

(assert (=> b!316567 d!69049))

(declare-fun d!69055 () Bool)

(declare-fun e!196935 () Bool)

(assert (=> d!69055 e!196935))

(declare-fun c!50172 () Bool)

(declare-fun lt!154648 () SeekEntryResult!2772)

(assert (=> d!69055 (= c!50172 (and ((_ is Intermediate!2772) lt!154648) (undefined!3584 lt!154648)))))

(declare-fun e!196934 () SeekEntryResult!2772)

(assert (=> d!69055 (= lt!154648 e!196934)))

(declare-fun c!50170 () Bool)

(assert (=> d!69055 (= c!50170 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154647 () (_ BitVec 64))

(assert (=> d!69055 (= lt!154647 (select (arr!7632 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!69055 (validMask!0 mask!3709)))

(assert (=> d!69055 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!154648)))

(declare-fun b!316647 () Bool)

(assert (=> b!316647 (and (bvsge (index!13266 lt!154648) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154648) (size!7984 a!3293)))))

(declare-fun res!171545 () Bool)

(assert (=> b!316647 (= res!171545 (= (select (arr!7632 a!3293) (index!13266 lt!154648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196932 () Bool)

(assert (=> b!316647 (=> res!171545 e!196932)))

(declare-fun b!316648 () Bool)

(declare-fun e!196936 () SeekEntryResult!2772)

(assert (=> b!316648 (= e!196934 e!196936)))

(declare-fun c!50171 () Bool)

(assert (=> b!316648 (= c!50171 (or (= lt!154647 k0!2441) (= (bvadd lt!154647 lt!154647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316649 () Bool)

(declare-fun e!196933 () Bool)

(assert (=> b!316649 (= e!196935 e!196933)))

(declare-fun res!171544 () Bool)

(assert (=> b!316649 (= res!171544 (and ((_ is Intermediate!2772) lt!154648) (not (undefined!3584 lt!154648)) (bvslt (x!31515 lt!154648) #b01111111111111111111111111111110) (bvsge (x!31515 lt!154648) #b00000000000000000000000000000000) (bvsge (x!31515 lt!154648) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316649 (=> (not res!171544) (not e!196933))))

(declare-fun b!316650 () Bool)

(assert (=> b!316650 (= e!196934 (Intermediate!2772 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316651 () Bool)

(assert (=> b!316651 (= e!196936 (Intermediate!2772 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316652 () Bool)

(assert (=> b!316652 (and (bvsge (index!13266 lt!154648) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154648) (size!7984 a!3293)))))

(declare-fun res!171546 () Bool)

(assert (=> b!316652 (= res!171546 (= (select (arr!7632 a!3293) (index!13266 lt!154648)) k0!2441))))

(assert (=> b!316652 (=> res!171546 e!196932)))

(assert (=> b!316652 (= e!196933 e!196932)))

(declare-fun b!316653 () Bool)

(assert (=> b!316653 (and (bvsge (index!13266 lt!154648) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154648) (size!7984 a!3293)))))

(assert (=> b!316653 (= e!196932 (= (select (arr!7632 a!3293) (index!13266 lt!154648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316654 () Bool)

(assert (=> b!316654 (= e!196935 (bvsge (x!31515 lt!154648) #b01111111111111111111111111111110))))

(declare-fun b!316655 () Bool)

(assert (=> b!316655 (= e!196936 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69055 c!50170) b!316650))

(assert (= (and d!69055 (not c!50170)) b!316648))

(assert (= (and b!316648 c!50171) b!316651))

(assert (= (and b!316648 (not c!50171)) b!316655))

(assert (= (and d!69055 c!50172) b!316654))

(assert (= (and d!69055 (not c!50172)) b!316649))

(assert (= (and b!316649 res!171544) b!316652))

(assert (= (and b!316652 (not res!171546)) b!316647))

(assert (= (and b!316647 (not res!171545)) b!316653))

(assert (=> b!316655 m!325421))

(declare-fun m!325491 () Bool)

(assert (=> b!316655 m!325491))

(assert (=> b!316655 m!325491))

(declare-fun m!325493 () Bool)

(assert (=> b!316655 m!325493))

(declare-fun m!325495 () Bool)

(assert (=> b!316652 m!325495))

(assert (=> b!316653 m!325495))

(assert (=> b!316647 m!325495))

(assert (=> d!69055 m!325421))

(declare-fun m!325497 () Bool)

(assert (=> d!69055 m!325497))

(assert (=> d!69055 m!325417))

(assert (=> b!316568 d!69055))

(declare-fun d!69063 () Bool)

(declare-fun lt!154651 () (_ BitVec 32))

(assert (=> d!69063 (and (bvsge lt!154651 #b00000000000000000000000000000000) (bvslt lt!154651 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69063 (= lt!154651 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69063 (validMask!0 mask!3709)))

(assert (=> d!69063 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154651)))

(declare-fun bs!11051 () Bool)

(assert (= bs!11051 d!69063))

(declare-fun m!325499 () Bool)

(assert (=> bs!11051 m!325499))

(assert (=> bs!11051 m!325417))

(assert (=> b!316568 d!69063))

(declare-fun d!69065 () Bool)

(declare-fun e!196950 () Bool)

(assert (=> d!69065 e!196950))

(declare-fun c!50181 () Bool)

(declare-fun lt!154653 () SeekEntryResult!2772)

(assert (=> d!69065 (= c!50181 (and ((_ is Intermediate!2772) lt!154653) (undefined!3584 lt!154653)))))

(declare-fun e!196949 () SeekEntryResult!2772)

(assert (=> d!69065 (= lt!154653 e!196949)))

(declare-fun c!50179 () Bool)

(assert (=> d!69065 (= c!50179 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154652 () (_ BitVec 64))

(assert (=> d!69065 (= lt!154652 (select (arr!7632 a!3293) index!1781))))

(assert (=> d!69065 (validMask!0 mask!3709)))

(assert (=> d!69065 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154653)))

(declare-fun b!316674 () Bool)

(assert (=> b!316674 (and (bvsge (index!13266 lt!154653) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154653) (size!7984 a!3293)))))

(declare-fun res!171554 () Bool)

(assert (=> b!316674 (= res!171554 (= (select (arr!7632 a!3293) (index!13266 lt!154653)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196947 () Bool)

(assert (=> b!316674 (=> res!171554 e!196947)))

(declare-fun b!316675 () Bool)

(declare-fun e!196951 () SeekEntryResult!2772)

(assert (=> b!316675 (= e!196949 e!196951)))

(declare-fun c!50180 () Bool)

(assert (=> b!316675 (= c!50180 (or (= lt!154652 k0!2441) (= (bvadd lt!154652 lt!154652) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316676 () Bool)

(declare-fun e!196948 () Bool)

(assert (=> b!316676 (= e!196950 e!196948)))

(declare-fun res!171553 () Bool)

(assert (=> b!316676 (= res!171553 (and ((_ is Intermediate!2772) lt!154653) (not (undefined!3584 lt!154653)) (bvslt (x!31515 lt!154653) #b01111111111111111111111111111110) (bvsge (x!31515 lt!154653) #b00000000000000000000000000000000) (bvsge (x!31515 lt!154653) x!1427)))))

(assert (=> b!316676 (=> (not res!171553) (not e!196948))))

(declare-fun b!316677 () Bool)

(assert (=> b!316677 (= e!196949 (Intermediate!2772 true index!1781 x!1427))))

(declare-fun b!316678 () Bool)

(assert (=> b!316678 (= e!196951 (Intermediate!2772 false index!1781 x!1427))))

(declare-fun b!316679 () Bool)

(assert (=> b!316679 (and (bvsge (index!13266 lt!154653) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154653) (size!7984 a!3293)))))

(declare-fun res!171555 () Bool)

(assert (=> b!316679 (= res!171555 (= (select (arr!7632 a!3293) (index!13266 lt!154653)) k0!2441))))

(assert (=> b!316679 (=> res!171555 e!196947)))

(assert (=> b!316679 (= e!196948 e!196947)))

(declare-fun b!316680 () Bool)

(assert (=> b!316680 (and (bvsge (index!13266 lt!154653) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154653) (size!7984 a!3293)))))

(assert (=> b!316680 (= e!196947 (= (select (arr!7632 a!3293) (index!13266 lt!154653)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316681 () Bool)

(assert (=> b!316681 (= e!196950 (bvsge (x!31515 lt!154653) #b01111111111111111111111111111110))))

(declare-fun b!316682 () Bool)

(assert (=> b!316682 (= e!196951 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69065 c!50179) b!316677))

(assert (= (and d!69065 (not c!50179)) b!316675))

(assert (= (and b!316675 c!50180) b!316678))

(assert (= (and b!316675 (not c!50180)) b!316682))

(assert (= (and d!69065 c!50181) b!316681))

(assert (= (and d!69065 (not c!50181)) b!316676))

(assert (= (and b!316676 res!171553) b!316679))

(assert (= (and b!316679 (not res!171555)) b!316674))

(assert (= (and b!316674 (not res!171554)) b!316680))

(assert (=> b!316682 m!325421))

(assert (=> b!316682 m!325421))

(declare-fun m!325501 () Bool)

(assert (=> b!316682 m!325501))

(declare-fun m!325503 () Bool)

(assert (=> b!316679 m!325503))

(assert (=> b!316680 m!325503))

(assert (=> b!316674 m!325503))

(assert (=> d!69065 m!325435))

(assert (=> d!69065 m!325417))

(assert (=> b!316571 d!69065))

(declare-fun d!69067 () Bool)

(declare-fun e!196955 () Bool)

(assert (=> d!69067 e!196955))

(declare-fun c!50184 () Bool)

(declare-fun lt!154655 () SeekEntryResult!2772)

(assert (=> d!69067 (= c!50184 (and ((_ is Intermediate!2772) lt!154655) (undefined!3584 lt!154655)))))

(declare-fun e!196954 () SeekEntryResult!2772)

(assert (=> d!69067 (= lt!154655 e!196954)))

(declare-fun c!50182 () Bool)

(assert (=> d!69067 (= c!50182 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154654 () (_ BitVec 64))

(assert (=> d!69067 (= lt!154654 (select (arr!7632 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!69067 (validMask!0 mask!3709)))

(assert (=> d!69067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154655)))

(declare-fun b!316683 () Bool)

(assert (=> b!316683 (and (bvsge (index!13266 lt!154655) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154655) (size!7984 a!3293)))))

(declare-fun res!171557 () Bool)

(assert (=> b!316683 (= res!171557 (= (select (arr!7632 a!3293) (index!13266 lt!154655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196952 () Bool)

(assert (=> b!316683 (=> res!171557 e!196952)))

(declare-fun b!316684 () Bool)

(declare-fun e!196956 () SeekEntryResult!2772)

(assert (=> b!316684 (= e!196954 e!196956)))

(declare-fun c!50183 () Bool)

(assert (=> b!316684 (= c!50183 (or (= lt!154654 k0!2441) (= (bvadd lt!154654 lt!154654) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316685 () Bool)

(declare-fun e!196953 () Bool)

(assert (=> b!316685 (= e!196955 e!196953)))

(declare-fun res!171556 () Bool)

(assert (=> b!316685 (= res!171556 (and ((_ is Intermediate!2772) lt!154655) (not (undefined!3584 lt!154655)) (bvslt (x!31515 lt!154655) #b01111111111111111111111111111110) (bvsge (x!31515 lt!154655) #b00000000000000000000000000000000) (bvsge (x!31515 lt!154655) #b00000000000000000000000000000000)))))

(assert (=> b!316685 (=> (not res!171556) (not e!196953))))

(declare-fun b!316686 () Bool)

(assert (=> b!316686 (= e!196954 (Intermediate!2772 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316687 () Bool)

(assert (=> b!316687 (= e!196956 (Intermediate!2772 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316688 () Bool)

(assert (=> b!316688 (and (bvsge (index!13266 lt!154655) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154655) (size!7984 a!3293)))))

(declare-fun res!171558 () Bool)

(assert (=> b!316688 (= res!171558 (= (select (arr!7632 a!3293) (index!13266 lt!154655)) k0!2441))))

(assert (=> b!316688 (=> res!171558 e!196952)))

(assert (=> b!316688 (= e!196953 e!196952)))

(declare-fun b!316689 () Bool)

(assert (=> b!316689 (and (bvsge (index!13266 lt!154655) #b00000000000000000000000000000000) (bvslt (index!13266 lt!154655) (size!7984 a!3293)))))

(assert (=> b!316689 (= e!196952 (= (select (arr!7632 a!3293) (index!13266 lt!154655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316690 () Bool)

(assert (=> b!316690 (= e!196955 (bvsge (x!31515 lt!154655) #b01111111111111111111111111111110))))

(declare-fun b!316691 () Bool)

(assert (=> b!316691 (= e!196956 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69067 c!50182) b!316686))

(assert (= (and d!69067 (not c!50182)) b!316684))

(assert (= (and b!316684 c!50183) b!316687))

(assert (= (and b!316684 (not c!50183)) b!316691))

(assert (= (and d!69067 c!50184) b!316690))

(assert (= (and d!69067 (not c!50184)) b!316685))

(assert (= (and b!316685 res!171556) b!316688))

(assert (= (and b!316688 (not res!171558)) b!316683))

(assert (= (and b!316683 (not res!171557)) b!316689))

(assert (=> b!316691 m!325427))

(declare-fun m!325505 () Bool)

(assert (=> b!316691 m!325505))

(assert (=> b!316691 m!325505))

(declare-fun m!325507 () Bool)

(assert (=> b!316691 m!325507))

(declare-fun m!325509 () Bool)

(assert (=> b!316688 m!325509))

(assert (=> b!316689 m!325509))

(assert (=> b!316683 m!325509))

(assert (=> d!69067 m!325427))

(declare-fun m!325511 () Bool)

(assert (=> d!69067 m!325511))

(assert (=> d!69067 m!325417))

(assert (=> b!316566 d!69067))

(declare-fun d!69069 () Bool)

(declare-fun lt!154674 () (_ BitVec 32))

(declare-fun lt!154673 () (_ BitVec 32))

(assert (=> d!69069 (= lt!154674 (bvmul (bvxor lt!154673 (bvlshr lt!154673 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69069 (= lt!154673 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69069 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171562 (let ((h!5373 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31520 (bvmul (bvxor h!5373 (bvlshr h!5373 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31520 (bvlshr x!31520 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171562 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171562 #b00000000000000000000000000000000))))))

(assert (=> d!69069 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154674 (bvlshr lt!154674 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!316566 d!69069))

(declare-fun b!316766 () Bool)

(declare-fun e!197006 () Bool)

(declare-fun e!197005 () Bool)

(assert (=> b!316766 (= e!197006 e!197005)))

(declare-fun c!50205 () Bool)

(assert (=> b!316766 (= c!50205 (validKeyInArray!0 (select (arr!7632 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!316767 () Bool)

(declare-fun call!26014 () Bool)

(assert (=> b!316767 (= e!197005 call!26014)))

(declare-fun bm!26011 () Bool)

(assert (=> bm!26011 (= call!26014 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!316768 () Bool)

(declare-fun e!197007 () Bool)

(assert (=> b!316768 (= e!197007 call!26014)))

(declare-fun d!69077 () Bool)

(declare-fun res!171596 () Bool)

(assert (=> d!69077 (=> res!171596 e!197006)))

(assert (=> d!69077 (= res!171596 (bvsge #b00000000000000000000000000000000 (size!7984 a!3293)))))

(assert (=> d!69077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!197006)))

(declare-fun b!316769 () Bool)

(assert (=> b!316769 (= e!197005 e!197007)))

(declare-fun lt!154691 () (_ BitVec 64))

(assert (=> b!316769 (= lt!154691 (select (arr!7632 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9784 0))(
  ( (Unit!9785) )
))
(declare-fun lt!154690 () Unit!9784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16127 (_ BitVec 64) (_ BitVec 32)) Unit!9784)

(assert (=> b!316769 (= lt!154690 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154691 #b00000000000000000000000000000000))))

(assert (=> b!316769 (arrayContainsKey!0 a!3293 lt!154691 #b00000000000000000000000000000000)))

(declare-fun lt!154689 () Unit!9784)

(assert (=> b!316769 (= lt!154689 lt!154690)))

(declare-fun res!171595 () Bool)

(assert (=> b!316769 (= res!171595 (= (seekEntryOrOpen!0 (select (arr!7632 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2772 #b00000000000000000000000000000000)))))

(assert (=> b!316769 (=> (not res!171595) (not e!197007))))

(assert (= (and d!69077 (not res!171596)) b!316766))

(assert (= (and b!316766 c!50205) b!316769))

(assert (= (and b!316766 (not c!50205)) b!316767))

(assert (= (and b!316769 res!171595) b!316768))

(assert (= (or b!316768 b!316767) bm!26011))

(declare-fun m!325545 () Bool)

(assert (=> b!316766 m!325545))

(assert (=> b!316766 m!325545))

(declare-fun m!325547 () Bool)

(assert (=> b!316766 m!325547))

(declare-fun m!325549 () Bool)

(assert (=> bm!26011 m!325549))

(assert (=> b!316769 m!325545))

(declare-fun m!325551 () Bool)

(assert (=> b!316769 m!325551))

(declare-fun m!325553 () Bool)

(assert (=> b!316769 m!325553))

(assert (=> b!316769 m!325545))

(declare-fun m!325555 () Bool)

(assert (=> b!316769 m!325555))

(assert (=> b!316565 d!69077))

(declare-fun d!69089 () Bool)

(declare-fun res!171604 () Bool)

(declare-fun e!197017 () Bool)

(assert (=> d!69089 (=> res!171604 e!197017)))

(assert (=> d!69089 (= res!171604 (= (select (arr!7632 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!69089 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!197017)))

(declare-fun b!316783 () Bool)

(declare-fun e!197018 () Bool)

(assert (=> b!316783 (= e!197017 e!197018)))

(declare-fun res!171605 () Bool)

(assert (=> b!316783 (=> (not res!171605) (not e!197018))))

(assert (=> b!316783 (= res!171605 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7984 a!3293)))))

(declare-fun b!316784 () Bool)

(assert (=> b!316784 (= e!197018 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69089 (not res!171604)) b!316783))

(assert (= (and b!316783 res!171605) b!316784))

(assert (=> d!69089 m!325545))

(declare-fun m!325565 () Bool)

(assert (=> b!316784 m!325565))

(assert (=> b!316563 d!69089))

(declare-fun d!69095 () Bool)

(assert (=> d!69095 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31654 d!69095))

(declare-fun d!69103 () Bool)

(assert (=> d!69103 (= (array_inv!5595 a!3293) (bvsge (size!7984 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31654 d!69103))

(declare-fun d!69105 () Bool)

(assert (=> d!69105 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!316564 d!69105))

(check-sat (not b!316682) (not bm!26011) (not b!316769) (not b!316691) (not b!316766) (not b!316655) (not d!69049) (not d!69065) (not b!316784) (not d!69055) (not d!69063) (not d!69067) (not b!316616))
(check-sat)
