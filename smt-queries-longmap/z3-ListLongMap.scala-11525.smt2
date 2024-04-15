; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134136 () Bool)

(assert start!134136)

(declare-fun b!1567438 () Bool)

(declare-fun e!873730 () Bool)

(declare-fun e!873728 () Bool)

(assert (=> b!1567438 (= e!873730 e!873728)))

(declare-fun res!1071309 () Bool)

(assert (=> b!1567438 (=> (not res!1071309) (not e!873728))))

(declare-fun e!873729 () Bool)

(assert (=> b!1567438 (= res!1071309 e!873729)))

(declare-fun res!1071311 () Bool)

(assert (=> b!1567438 (=> res!1071311 e!873729)))

(declare-fun lt!672756 () Bool)

(assert (=> b!1567438 (= res!1071311 lt!672756)))

(declare-datatypes ((array!104646 0))(
  ( (array!104647 (arr!50507 (Array (_ BitVec 32) (_ BitVec 64))) (size!51059 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104646)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567438 (= lt!672756 (not (validKeyInArray!0 (select (arr!50507 a!3481) from!2856))))))

(declare-datatypes ((List!36715 0))(
  ( (Nil!36712) (Cons!36711 (h!38159 (_ BitVec 64)) (t!51615 List!36715)) )
))
(declare-fun acc!619 () List!36715)

(declare-fun b!1567440 () Bool)

(declare-fun contains!10331 (List!36715 (_ BitVec 64)) Bool)

(assert (=> b!1567440 (= e!873729 (not (contains!10331 acc!619 (select (arr!50507 a!3481) from!2856))))))

(declare-fun b!1567441 () Bool)

(declare-fun res!1071314 () Bool)

(assert (=> b!1567441 (=> (not res!1071314) (not e!873730))))

(assert (=> b!1567441 (= res!1071314 (not (contains!10331 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567442 () Bool)

(declare-fun res!1071310 () Bool)

(assert (=> b!1567442 (=> (not res!1071310) (not e!873730))))

(assert (=> b!1567442 (= res!1071310 (not (contains!10331 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567443 () Bool)

(declare-fun res!1071312 () Bool)

(assert (=> b!1567443 (=> (not res!1071312) (not e!873730))))

(declare-fun noDuplicate!2672 (List!36715) Bool)

(assert (=> b!1567443 (= res!1071312 (noDuplicate!2672 acc!619))))

(declare-fun res!1071308 () Bool)

(assert (=> start!134136 (=> (not res!1071308) (not e!873730))))

(assert (=> start!134136 (= res!1071308 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51059 a!3481)) (bvslt (size!51059 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134136 e!873730))

(assert (=> start!134136 true))

(declare-fun array_inv!39443 (array!104646) Bool)

(assert (=> start!134136 (array_inv!39443 a!3481)))

(declare-fun b!1567439 () Bool)

(declare-fun res!1071313 () Bool)

(assert (=> b!1567439 (=> (not res!1071313) (not e!873730))))

(assert (=> b!1567439 (= res!1071313 (bvslt from!2856 (size!51059 a!3481)))))

(declare-fun b!1567444 () Bool)

(declare-fun res!1071315 () Bool)

(assert (=> b!1567444 (=> (not res!1071315) (not e!873728))))

(assert (=> b!1567444 (= res!1071315 (and (not lt!672756) (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1567445 () Bool)

(assert (=> b!1567445 (= e!873728 (not (noDuplicate!2672 (Cons!36711 (select (arr!50507 a!3481) from!2856) acc!619))))))

(assert (= (and start!134136 res!1071308) b!1567443))

(assert (= (and b!1567443 res!1071312) b!1567442))

(assert (= (and b!1567442 res!1071310) b!1567441))

(assert (= (and b!1567441 res!1071314) b!1567439))

(assert (= (and b!1567439 res!1071313) b!1567438))

(assert (= (and b!1567438 (not res!1071311)) b!1567440))

(assert (= (and b!1567438 res!1071309) b!1567444))

(assert (= (and b!1567444 res!1071315) b!1567445))

(declare-fun m!1441629 () Bool)

(assert (=> start!134136 m!1441629))

(declare-fun m!1441631 () Bool)

(assert (=> b!1567445 m!1441631))

(declare-fun m!1441633 () Bool)

(assert (=> b!1567445 m!1441633))

(assert (=> b!1567438 m!1441631))

(assert (=> b!1567438 m!1441631))

(declare-fun m!1441635 () Bool)

(assert (=> b!1567438 m!1441635))

(declare-fun m!1441637 () Bool)

(assert (=> b!1567443 m!1441637))

(assert (=> b!1567440 m!1441631))

(assert (=> b!1567440 m!1441631))

(declare-fun m!1441639 () Bool)

(assert (=> b!1567440 m!1441639))

(declare-fun m!1441641 () Bool)

(assert (=> b!1567441 m!1441641))

(declare-fun m!1441643 () Bool)

(assert (=> b!1567442 m!1441643))

(check-sat (not b!1567438) (not b!1567440) (not b!1567442) (not b!1567443) (not b!1567441) (not start!134136) (not b!1567445))
(check-sat)
(get-model)

(declare-fun d!163377 () Bool)

(declare-fun lt!672765 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!800 (List!36715) (InoxSet (_ BitVec 64)))

(assert (=> d!163377 (= lt!672765 (select (content!800 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873761 () Bool)

(assert (=> d!163377 (= lt!672765 e!873761)))

(declare-fun res!1071368 () Bool)

(assert (=> d!163377 (=> (not res!1071368) (not e!873761))))

(get-info :version)

(assert (=> d!163377 (= res!1071368 ((_ is Cons!36711) acc!619))))

(assert (=> d!163377 (= (contains!10331 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!672765)))

(declare-fun b!1567498 () Bool)

(declare-fun e!873760 () Bool)

(assert (=> b!1567498 (= e!873761 e!873760)))

(declare-fun res!1071369 () Bool)

(assert (=> b!1567498 (=> res!1071369 e!873760)))

(assert (=> b!1567498 (= res!1071369 (= (h!38159 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567499 () Bool)

(assert (=> b!1567499 (= e!873760 (contains!10331 (t!51615 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163377 res!1071368) b!1567498))

(assert (= (and b!1567498 (not res!1071369)) b!1567499))

(declare-fun m!1441677 () Bool)

(assert (=> d!163377 m!1441677))

(declare-fun m!1441679 () Bool)

(assert (=> d!163377 m!1441679))

(declare-fun m!1441681 () Bool)

(assert (=> b!1567499 m!1441681))

(assert (=> b!1567442 d!163377))

(declare-fun d!163379 () Bool)

(assert (=> d!163379 (= (validKeyInArray!0 (select (arr!50507 a!3481) from!2856)) (and (not (= (select (arr!50507 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50507 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567438 d!163379))

(declare-fun d!163381 () Bool)

(declare-fun res!1071374 () Bool)

(declare-fun e!873766 () Bool)

(assert (=> d!163381 (=> res!1071374 e!873766)))

(assert (=> d!163381 (= res!1071374 ((_ is Nil!36712) acc!619))))

(assert (=> d!163381 (= (noDuplicate!2672 acc!619) e!873766)))

(declare-fun b!1567504 () Bool)

(declare-fun e!873767 () Bool)

(assert (=> b!1567504 (= e!873766 e!873767)))

(declare-fun res!1071375 () Bool)

(assert (=> b!1567504 (=> (not res!1071375) (not e!873767))))

(assert (=> b!1567504 (= res!1071375 (not (contains!10331 (t!51615 acc!619) (h!38159 acc!619))))))

(declare-fun b!1567505 () Bool)

(assert (=> b!1567505 (= e!873767 (noDuplicate!2672 (t!51615 acc!619)))))

(assert (= (and d!163381 (not res!1071374)) b!1567504))

(assert (= (and b!1567504 res!1071375) b!1567505))

(declare-fun m!1441683 () Bool)

(assert (=> b!1567504 m!1441683))

(declare-fun m!1441685 () Bool)

(assert (=> b!1567505 m!1441685))

(assert (=> b!1567443 d!163381))

(declare-fun d!163385 () Bool)

(declare-fun res!1071376 () Bool)

(declare-fun e!873768 () Bool)

(assert (=> d!163385 (=> res!1071376 e!873768)))

(assert (=> d!163385 (= res!1071376 ((_ is Nil!36712) (Cons!36711 (select (arr!50507 a!3481) from!2856) acc!619)))))

(assert (=> d!163385 (= (noDuplicate!2672 (Cons!36711 (select (arr!50507 a!3481) from!2856) acc!619)) e!873768)))

(declare-fun b!1567506 () Bool)

(declare-fun e!873769 () Bool)

(assert (=> b!1567506 (= e!873768 e!873769)))

(declare-fun res!1071377 () Bool)

(assert (=> b!1567506 (=> (not res!1071377) (not e!873769))))

(assert (=> b!1567506 (= res!1071377 (not (contains!10331 (t!51615 (Cons!36711 (select (arr!50507 a!3481) from!2856) acc!619)) (h!38159 (Cons!36711 (select (arr!50507 a!3481) from!2856) acc!619)))))))

(declare-fun b!1567507 () Bool)

(assert (=> b!1567507 (= e!873769 (noDuplicate!2672 (t!51615 (Cons!36711 (select (arr!50507 a!3481) from!2856) acc!619))))))

(assert (= (and d!163385 (not res!1071376)) b!1567506))

(assert (= (and b!1567506 res!1071377) b!1567507))

(declare-fun m!1441687 () Bool)

(assert (=> b!1567506 m!1441687))

(declare-fun m!1441689 () Bool)

(assert (=> b!1567507 m!1441689))

(assert (=> b!1567445 d!163385))

(declare-fun d!163387 () Bool)

(declare-fun lt!672766 () Bool)

(assert (=> d!163387 (= lt!672766 (select (content!800 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873771 () Bool)

(assert (=> d!163387 (= lt!672766 e!873771)))

(declare-fun res!1071378 () Bool)

(assert (=> d!163387 (=> (not res!1071378) (not e!873771))))

(assert (=> d!163387 (= res!1071378 ((_ is Cons!36711) acc!619))))

(assert (=> d!163387 (= (contains!10331 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!672766)))

(declare-fun b!1567508 () Bool)

(declare-fun e!873770 () Bool)

(assert (=> b!1567508 (= e!873771 e!873770)))

(declare-fun res!1071379 () Bool)

(assert (=> b!1567508 (=> res!1071379 e!873770)))

(assert (=> b!1567508 (= res!1071379 (= (h!38159 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567509 () Bool)

(assert (=> b!1567509 (= e!873770 (contains!10331 (t!51615 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163387 res!1071378) b!1567508))

(assert (= (and b!1567508 (not res!1071379)) b!1567509))

(assert (=> d!163387 m!1441677))

(declare-fun m!1441691 () Bool)

(assert (=> d!163387 m!1441691))

(declare-fun m!1441693 () Bool)

(assert (=> b!1567509 m!1441693))

(assert (=> b!1567441 d!163387))

(declare-fun d!163391 () Bool)

(assert (=> d!163391 (= (array_inv!39443 a!3481) (bvsge (size!51059 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134136 d!163391))

(declare-fun lt!672767 () Bool)

(declare-fun d!163393 () Bool)

(assert (=> d!163393 (= lt!672767 (select (content!800 acc!619) (select (arr!50507 a!3481) from!2856)))))

(declare-fun e!873777 () Bool)

(assert (=> d!163393 (= lt!672767 e!873777)))

(declare-fun res!1071384 () Bool)

(assert (=> d!163393 (=> (not res!1071384) (not e!873777))))

(assert (=> d!163393 (= res!1071384 ((_ is Cons!36711) acc!619))))

(assert (=> d!163393 (= (contains!10331 acc!619 (select (arr!50507 a!3481) from!2856)) lt!672767)))

(declare-fun b!1567514 () Bool)

(declare-fun e!873776 () Bool)

(assert (=> b!1567514 (= e!873777 e!873776)))

(declare-fun res!1071385 () Bool)

(assert (=> b!1567514 (=> res!1071385 e!873776)))

(assert (=> b!1567514 (= res!1071385 (= (h!38159 acc!619) (select (arr!50507 a!3481) from!2856)))))

(declare-fun b!1567515 () Bool)

(assert (=> b!1567515 (= e!873776 (contains!10331 (t!51615 acc!619) (select (arr!50507 a!3481) from!2856)))))

(assert (= (and d!163393 res!1071384) b!1567514))

(assert (= (and b!1567514 (not res!1071385)) b!1567515))

(assert (=> d!163393 m!1441677))

(assert (=> d!163393 m!1441631))

(declare-fun m!1441695 () Bool)

(assert (=> d!163393 m!1441695))

(assert (=> b!1567515 m!1441631))

(declare-fun m!1441697 () Bool)

(assert (=> b!1567515 m!1441697))

(assert (=> b!1567440 d!163393))

(check-sat (not b!1567509) (not b!1567505) (not b!1567506) (not d!163377) (not b!1567507) (not d!163393) (not b!1567504) (not d!163387) (not b!1567499) (not b!1567515))
(check-sat)
