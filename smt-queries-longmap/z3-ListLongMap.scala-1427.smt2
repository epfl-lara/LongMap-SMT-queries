; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27590 () Bool)

(assert start!27590)

(declare-fun b!284930 () Bool)

(declare-fun e!180615 () Bool)

(declare-fun e!180616 () Bool)

(assert (=> b!284930 (= e!180615 e!180616)))

(declare-fun res!147491 () Bool)

(assert (=> b!284930 (=> (not res!147491) (not e!180616))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284930 (= res!147491 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14229 0))(
  ( (array!14230 (arr!6753 (Array (_ BitVec 32) (_ BitVec 64))) (size!7106 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14229)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!140503 () array!14229)

(assert (=> b!284930 (= lt!140503 (array!14230 (store (arr!6753 a!3325) i!1267 k0!2581) (size!7106 a!3325)))))

(declare-fun b!284931 () Bool)

(declare-fun res!147493 () Bool)

(assert (=> b!284931 (=> (not res!147493) (not e!180616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284931 (= res!147493 (not (validKeyInArray!0 (select (arr!6753 a!3325) startIndex!26))))))

(declare-fun b!284932 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14229 (_ BitVec 32)) Bool)

(assert (=> b!284932 (= e!180616 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140503 mask!3868)))))

(assert (=> b!284932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140503 mask!3868)))

(declare-datatypes ((Unit!8988 0))(
  ( (Unit!8989) )
))
(declare-fun lt!140504 () Unit!8988)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> b!284932 (= lt!140504 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!284933 () Bool)

(declare-fun res!147498 () Bool)

(declare-fun e!180617 () Bool)

(assert (=> b!284933 (=> (not res!147498) (not e!180617))))

(assert (=> b!284933 (= res!147498 (validKeyInArray!0 k0!2581))))

(declare-fun b!284934 () Bool)

(assert (=> b!284934 (= e!180617 e!180615)))

(declare-fun res!147496 () Bool)

(assert (=> b!284934 (=> (not res!147496) (not e!180615))))

(declare-datatypes ((SeekEntryResult!1910 0))(
  ( (MissingZero!1910 (index!9810 (_ BitVec 32))) (Found!1910 (index!9811 (_ BitVec 32))) (Intermediate!1910 (undefined!2722 Bool) (index!9812 (_ BitVec 32)) (x!28028 (_ BitVec 32))) (Undefined!1910) (MissingVacant!1910 (index!9813 (_ BitVec 32))) )
))
(declare-fun lt!140505 () SeekEntryResult!1910)

(assert (=> b!284934 (= res!147496 (or (= lt!140505 (MissingZero!1910 i!1267)) (= lt!140505 (MissingVacant!1910 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14229 (_ BitVec 32)) SeekEntryResult!1910)

(assert (=> b!284934 (= lt!140505 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284935 () Bool)

(declare-fun res!147495 () Bool)

(assert (=> b!284935 (=> (not res!147495) (not e!180616))))

(assert (=> b!284935 (= res!147495 (and (bvslt startIndex!26 (bvsub (size!7106 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!284936 () Bool)

(declare-fun res!147492 () Bool)

(assert (=> b!284936 (=> (not res!147492) (not e!180617))))

(declare-datatypes ((List!4534 0))(
  ( (Nil!4531) (Cons!4530 (h!5203 (_ BitVec 64)) (t!9607 List!4534)) )
))
(declare-fun arrayNoDuplicates!0 (array!14229 (_ BitVec 32) List!4534) Bool)

(assert (=> b!284936 (= res!147492 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4531))))

(declare-fun b!284937 () Bool)

(declare-fun res!147490 () Bool)

(assert (=> b!284937 (=> (not res!147490) (not e!180617))))

(assert (=> b!284937 (= res!147490 (and (= (size!7106 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7106 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7106 a!3325))))))

(declare-fun b!284939 () Bool)

(declare-fun res!147499 () Bool)

(assert (=> b!284939 (=> (not res!147499) (not e!180615))))

(assert (=> b!284939 (= res!147499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147497 () Bool)

(assert (=> start!27590 (=> (not res!147497) (not e!180617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27590 (= res!147497 (validMask!0 mask!3868))))

(assert (=> start!27590 e!180617))

(declare-fun array_inv!4725 (array!14229) Bool)

(assert (=> start!27590 (array_inv!4725 a!3325)))

(assert (=> start!27590 true))

(declare-fun b!284938 () Bool)

(declare-fun res!147494 () Bool)

(assert (=> b!284938 (=> (not res!147494) (not e!180617))))

(declare-fun arrayContainsKey!0 (array!14229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284938 (= res!147494 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27590 res!147497) b!284937))

(assert (= (and b!284937 res!147490) b!284933))

(assert (= (and b!284933 res!147498) b!284936))

(assert (= (and b!284936 res!147492) b!284938))

(assert (= (and b!284938 res!147494) b!284934))

(assert (= (and b!284934 res!147496) b!284939))

(assert (= (and b!284939 res!147499) b!284930))

(assert (= (and b!284930 res!147491) b!284931))

(assert (= (and b!284931 res!147493) b!284935))

(assert (= (and b!284935 res!147495) b!284932))

(declare-fun m!299345 () Bool)

(assert (=> b!284938 m!299345))

(declare-fun m!299347 () Bool)

(assert (=> b!284934 m!299347))

(declare-fun m!299349 () Bool)

(assert (=> b!284939 m!299349))

(declare-fun m!299351 () Bool)

(assert (=> start!27590 m!299351))

(declare-fun m!299353 () Bool)

(assert (=> start!27590 m!299353))

(declare-fun m!299355 () Bool)

(assert (=> b!284931 m!299355))

(assert (=> b!284931 m!299355))

(declare-fun m!299357 () Bool)

(assert (=> b!284931 m!299357))

(declare-fun m!299359 () Bool)

(assert (=> b!284932 m!299359))

(declare-fun m!299361 () Bool)

(assert (=> b!284932 m!299361))

(declare-fun m!299363 () Bool)

(assert (=> b!284932 m!299363))

(declare-fun m!299365 () Bool)

(assert (=> b!284936 m!299365))

(declare-fun m!299367 () Bool)

(assert (=> b!284933 m!299367))

(declare-fun m!299369 () Bool)

(assert (=> b!284930 m!299369))

(check-sat (not b!284939) (not b!284934) (not b!284932) (not start!27590) (not b!284931) (not b!284936) (not b!284933) (not b!284938))
(check-sat)
(get-model)

(declare-fun b!285008 () Bool)

(declare-fun e!180650 () Bool)

(declare-fun e!180649 () Bool)

(assert (=> b!285008 (= e!180650 e!180649)))

(declare-fun lt!140532 () (_ BitVec 64))

(assert (=> b!285008 (= lt!140532 (select (arr!6753 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140530 () Unit!8988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14229 (_ BitVec 64) (_ BitVec 32)) Unit!8988)

(assert (=> b!285008 (= lt!140530 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140532 #b00000000000000000000000000000000))))

(assert (=> b!285008 (arrayContainsKey!0 a!3325 lt!140532 #b00000000000000000000000000000000)))

(declare-fun lt!140531 () Unit!8988)

(assert (=> b!285008 (= lt!140531 lt!140530)))

(declare-fun res!147564 () Bool)

(assert (=> b!285008 (= res!147564 (= (seekEntryOrOpen!0 (select (arr!6753 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1910 #b00000000000000000000000000000000)))))

(assert (=> b!285008 (=> (not res!147564) (not e!180649))))

(declare-fun bm!25510 () Bool)

(declare-fun call!25513 () Bool)

(assert (=> bm!25510 (= call!25513 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!285009 () Bool)

(assert (=> b!285009 (= e!180650 call!25513)))

(declare-fun b!285010 () Bool)

(assert (=> b!285010 (= e!180649 call!25513)))

(declare-fun b!285011 () Bool)

(declare-fun e!180651 () Bool)

(assert (=> b!285011 (= e!180651 e!180650)))

(declare-fun c!46276 () Bool)

(assert (=> b!285011 (= c!46276 (validKeyInArray!0 (select (arr!6753 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65541 () Bool)

(declare-fun res!147565 () Bool)

(assert (=> d!65541 (=> res!147565 e!180651)))

(assert (=> d!65541 (= res!147565 (bvsge #b00000000000000000000000000000000 (size!7106 a!3325)))))

(assert (=> d!65541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!180651)))

(assert (= (and d!65541 (not res!147565)) b!285011))

(assert (= (and b!285011 c!46276) b!285008))

(assert (= (and b!285011 (not c!46276)) b!285009))

(assert (= (and b!285008 res!147564) b!285010))

(assert (= (or b!285010 b!285009) bm!25510))

(declare-fun m!299423 () Bool)

(assert (=> b!285008 m!299423))

(declare-fun m!299425 () Bool)

(assert (=> b!285008 m!299425))

(declare-fun m!299427 () Bool)

(assert (=> b!285008 m!299427))

(assert (=> b!285008 m!299423))

(declare-fun m!299429 () Bool)

(assert (=> b!285008 m!299429))

(declare-fun m!299431 () Bool)

(assert (=> bm!25510 m!299431))

(assert (=> b!285011 m!299423))

(assert (=> b!285011 m!299423))

(declare-fun m!299433 () Bool)

(assert (=> b!285011 m!299433))

(assert (=> b!284939 d!65541))

(declare-fun b!285067 () Bool)

(declare-fun e!180688 () SeekEntryResult!1910)

(declare-fun e!180689 () SeekEntryResult!1910)

(assert (=> b!285067 (= e!180688 e!180689)))

(declare-fun lt!140557 () (_ BitVec 64))

(declare-fun lt!140558 () SeekEntryResult!1910)

(assert (=> b!285067 (= lt!140557 (select (arr!6753 a!3325) (index!9812 lt!140558)))))

(declare-fun c!46297 () Bool)

(assert (=> b!285067 (= c!46297 (= lt!140557 k0!2581))))

(declare-fun b!285068 () Bool)

(declare-fun c!46296 () Bool)

(assert (=> b!285068 (= c!46296 (= lt!140557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180690 () SeekEntryResult!1910)

(assert (=> b!285068 (= e!180689 e!180690)))

(declare-fun b!285069 () Bool)

(assert (=> b!285069 (= e!180690 (MissingZero!1910 (index!9812 lt!140558)))))

(declare-fun d!65543 () Bool)

(declare-fun lt!140559 () SeekEntryResult!1910)

(get-info :version)

(assert (=> d!65543 (and (or ((_ is Undefined!1910) lt!140559) (not ((_ is Found!1910) lt!140559)) (and (bvsge (index!9811 lt!140559) #b00000000000000000000000000000000) (bvslt (index!9811 lt!140559) (size!7106 a!3325)))) (or ((_ is Undefined!1910) lt!140559) ((_ is Found!1910) lt!140559) (not ((_ is MissingZero!1910) lt!140559)) (and (bvsge (index!9810 lt!140559) #b00000000000000000000000000000000) (bvslt (index!9810 lt!140559) (size!7106 a!3325)))) (or ((_ is Undefined!1910) lt!140559) ((_ is Found!1910) lt!140559) ((_ is MissingZero!1910) lt!140559) (not ((_ is MissingVacant!1910) lt!140559)) (and (bvsge (index!9813 lt!140559) #b00000000000000000000000000000000) (bvslt (index!9813 lt!140559) (size!7106 a!3325)))) (or ((_ is Undefined!1910) lt!140559) (ite ((_ is Found!1910) lt!140559) (= (select (arr!6753 a!3325) (index!9811 lt!140559)) k0!2581) (ite ((_ is MissingZero!1910) lt!140559) (= (select (arr!6753 a!3325) (index!9810 lt!140559)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1910) lt!140559) (= (select (arr!6753 a!3325) (index!9813 lt!140559)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65543 (= lt!140559 e!180688)))

(declare-fun c!46298 () Bool)

(assert (=> d!65543 (= c!46298 (and ((_ is Intermediate!1910) lt!140558) (undefined!2722 lt!140558)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14229 (_ BitVec 32)) SeekEntryResult!1910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65543 (= lt!140558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65543 (validMask!0 mask!3868)))

(assert (=> d!65543 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140559)))

(declare-fun b!285070 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14229 (_ BitVec 32)) SeekEntryResult!1910)

(assert (=> b!285070 (= e!180690 (seekKeyOrZeroReturnVacant!0 (x!28028 lt!140558) (index!9812 lt!140558) (index!9812 lt!140558) k0!2581 a!3325 mask!3868))))

(declare-fun b!285071 () Bool)

(assert (=> b!285071 (= e!180688 Undefined!1910)))

(declare-fun b!285072 () Bool)

(assert (=> b!285072 (= e!180689 (Found!1910 (index!9812 lt!140558)))))

(assert (= (and d!65543 c!46298) b!285071))

(assert (= (and d!65543 (not c!46298)) b!285067))

(assert (= (and b!285067 c!46297) b!285072))

(assert (= (and b!285067 (not c!46297)) b!285068))

(assert (= (and b!285068 c!46296) b!285069))

(assert (= (and b!285068 (not c!46296)) b!285070))

(declare-fun m!299467 () Bool)

(assert (=> b!285067 m!299467))

(declare-fun m!299469 () Bool)

(assert (=> d!65543 m!299469))

(declare-fun m!299471 () Bool)

(assert (=> d!65543 m!299471))

(declare-fun m!299473 () Bool)

(assert (=> d!65543 m!299473))

(declare-fun m!299475 () Bool)

(assert (=> d!65543 m!299475))

(declare-fun m!299477 () Bool)

(assert (=> d!65543 m!299477))

(assert (=> d!65543 m!299473))

(assert (=> d!65543 m!299351))

(declare-fun m!299479 () Bool)

(assert (=> b!285070 m!299479))

(assert (=> b!284934 d!65543))

(declare-fun b!285102 () Bool)

(declare-fun e!180715 () Bool)

(declare-fun e!180713 () Bool)

(assert (=> b!285102 (= e!180715 e!180713)))

(declare-fun c!46306 () Bool)

(assert (=> b!285102 (= c!46306 (validKeyInArray!0 (select (arr!6753 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65555 () Bool)

(declare-fun res!147600 () Bool)

(declare-fun e!180714 () Bool)

(assert (=> d!65555 (=> res!147600 e!180714)))

(assert (=> d!65555 (= res!147600 (bvsge #b00000000000000000000000000000000 (size!7106 a!3325)))))

(assert (=> d!65555 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4531) e!180714)))

(declare-fun b!285103 () Bool)

(declare-fun e!180716 () Bool)

(declare-fun contains!1973 (List!4534 (_ BitVec 64)) Bool)

(assert (=> b!285103 (= e!180716 (contains!1973 Nil!4531 (select (arr!6753 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25522 () Bool)

(declare-fun call!25525 () Bool)

(assert (=> bm!25522 (= call!25525 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46306 (Cons!4530 (select (arr!6753 a!3325) #b00000000000000000000000000000000) Nil!4531) Nil!4531)))))

(declare-fun b!285104 () Bool)

(assert (=> b!285104 (= e!180713 call!25525)))

(declare-fun b!285105 () Bool)

(assert (=> b!285105 (= e!180713 call!25525)))

(declare-fun b!285106 () Bool)

(assert (=> b!285106 (= e!180714 e!180715)))

(declare-fun res!147598 () Bool)

(assert (=> b!285106 (=> (not res!147598) (not e!180715))))

(assert (=> b!285106 (= res!147598 (not e!180716))))

(declare-fun res!147599 () Bool)

(assert (=> b!285106 (=> (not res!147599) (not e!180716))))

(assert (=> b!285106 (= res!147599 (validKeyInArray!0 (select (arr!6753 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65555 (not res!147600)) b!285106))

(assert (= (and b!285106 res!147599) b!285103))

(assert (= (and b!285106 res!147598) b!285102))

(assert (= (and b!285102 c!46306) b!285104))

(assert (= (and b!285102 (not c!46306)) b!285105))

(assert (= (or b!285104 b!285105) bm!25522))

(assert (=> b!285102 m!299423))

(assert (=> b!285102 m!299423))

(assert (=> b!285102 m!299433))

(assert (=> b!285103 m!299423))

(assert (=> b!285103 m!299423))

(declare-fun m!299499 () Bool)

(assert (=> b!285103 m!299499))

(assert (=> bm!25522 m!299423))

(declare-fun m!299501 () Bool)

(assert (=> bm!25522 m!299501))

(assert (=> b!285106 m!299423))

(assert (=> b!285106 m!299423))

(assert (=> b!285106 m!299433))

(assert (=> b!284936 d!65555))

(declare-fun d!65563 () Bool)

(assert (=> d!65563 (= (validKeyInArray!0 (select (arr!6753 a!3325) startIndex!26)) (and (not (= (select (arr!6753 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6753 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!284931 d!65563))

(declare-fun b!285112 () Bool)

(declare-fun e!180722 () Bool)

(declare-fun e!180721 () Bool)

(assert (=> b!285112 (= e!180722 e!180721)))

(declare-fun lt!140568 () (_ BitVec 64))

(assert (=> b!285112 (= lt!140568 (select (arr!6753 lt!140503) startIndex!26))))

(declare-fun lt!140566 () Unit!8988)

(assert (=> b!285112 (= lt!140566 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140503 lt!140568 startIndex!26))))

(assert (=> b!285112 (arrayContainsKey!0 lt!140503 lt!140568 #b00000000000000000000000000000000)))

(declare-fun lt!140567 () Unit!8988)

(assert (=> b!285112 (= lt!140567 lt!140566)))

(declare-fun res!147604 () Bool)

(assert (=> b!285112 (= res!147604 (= (seekEntryOrOpen!0 (select (arr!6753 lt!140503) startIndex!26) lt!140503 mask!3868) (Found!1910 startIndex!26)))))

(assert (=> b!285112 (=> (not res!147604) (not e!180721))))

(declare-fun bm!25524 () Bool)

(declare-fun call!25527 () Bool)

(assert (=> bm!25524 (= call!25527 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140503 mask!3868))))

(declare-fun b!285113 () Bool)

(assert (=> b!285113 (= e!180722 call!25527)))

(declare-fun b!285114 () Bool)

(assert (=> b!285114 (= e!180721 call!25527)))

(declare-fun b!285115 () Bool)

(declare-fun e!180723 () Bool)

(assert (=> b!285115 (= e!180723 e!180722)))

(declare-fun c!46308 () Bool)

(assert (=> b!285115 (= c!46308 (validKeyInArray!0 (select (arr!6753 lt!140503) startIndex!26)))))

(declare-fun d!65565 () Bool)

(declare-fun res!147605 () Bool)

(assert (=> d!65565 (=> res!147605 e!180723)))

(assert (=> d!65565 (= res!147605 (bvsge startIndex!26 (size!7106 lt!140503)))))

(assert (=> d!65565 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140503 mask!3868) e!180723)))

(assert (= (and d!65565 (not res!147605)) b!285115))

(assert (= (and b!285115 c!46308) b!285112))

(assert (= (and b!285115 (not c!46308)) b!285113))

(assert (= (and b!285112 res!147604) b!285114))

(assert (= (or b!285114 b!285113) bm!25524))

(declare-fun m!299511 () Bool)

(assert (=> b!285112 m!299511))

(declare-fun m!299513 () Bool)

(assert (=> b!285112 m!299513))

(declare-fun m!299515 () Bool)

(assert (=> b!285112 m!299515))

(assert (=> b!285112 m!299511))

(declare-fun m!299517 () Bool)

(assert (=> b!285112 m!299517))

(declare-fun m!299519 () Bool)

(assert (=> bm!25524 m!299519))

(assert (=> b!285115 m!299511))

(assert (=> b!285115 m!299511))

(declare-fun m!299521 () Bool)

(assert (=> b!285115 m!299521))

(assert (=> b!284932 d!65565))

(declare-fun b!285116 () Bool)

(declare-fun e!180725 () Bool)

(declare-fun e!180724 () Bool)

(assert (=> b!285116 (= e!180725 e!180724)))

(declare-fun lt!140571 () (_ BitVec 64))

(assert (=> b!285116 (= lt!140571 (select (arr!6753 lt!140503) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140569 () Unit!8988)

(assert (=> b!285116 (= lt!140569 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140503 lt!140571 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!285116 (arrayContainsKey!0 lt!140503 lt!140571 #b00000000000000000000000000000000)))

(declare-fun lt!140570 () Unit!8988)

(assert (=> b!285116 (= lt!140570 lt!140569)))

(declare-fun res!147606 () Bool)

(assert (=> b!285116 (= res!147606 (= (seekEntryOrOpen!0 (select (arr!6753 lt!140503) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!140503 mask!3868) (Found!1910 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!285116 (=> (not res!147606) (not e!180724))))

(declare-fun call!25528 () Bool)

(declare-fun bm!25525 () Bool)

(assert (=> bm!25525 (= call!25528 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!140503 mask!3868))))

(declare-fun b!285117 () Bool)

(assert (=> b!285117 (= e!180725 call!25528)))

(declare-fun b!285118 () Bool)

(assert (=> b!285118 (= e!180724 call!25528)))

(declare-fun b!285119 () Bool)

(declare-fun e!180726 () Bool)

(assert (=> b!285119 (= e!180726 e!180725)))

(declare-fun c!46309 () Bool)

(assert (=> b!285119 (= c!46309 (validKeyInArray!0 (select (arr!6753 lt!140503) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun d!65569 () Bool)

(declare-fun res!147607 () Bool)

(assert (=> d!65569 (=> res!147607 e!180726)))

(assert (=> d!65569 (= res!147607 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7106 lt!140503)))))

(assert (=> d!65569 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140503 mask!3868) e!180726)))

(assert (= (and d!65569 (not res!147607)) b!285119))

(assert (= (and b!285119 c!46309) b!285116))

(assert (= (and b!285119 (not c!46309)) b!285117))

(assert (= (and b!285116 res!147606) b!285118))

(assert (= (or b!285118 b!285117) bm!25525))

(declare-fun m!299523 () Bool)

(assert (=> b!285116 m!299523))

(declare-fun m!299525 () Bool)

(assert (=> b!285116 m!299525))

(declare-fun m!299527 () Bool)

(assert (=> b!285116 m!299527))

(assert (=> b!285116 m!299523))

(declare-fun m!299529 () Bool)

(assert (=> b!285116 m!299529))

(declare-fun m!299531 () Bool)

(assert (=> bm!25525 m!299531))

(assert (=> b!285119 m!299523))

(assert (=> b!285119 m!299523))

(declare-fun m!299533 () Bool)

(assert (=> b!285119 m!299533))

(assert (=> b!284932 d!65569))

(declare-fun d!65571 () Bool)

(declare-fun e!180735 () Bool)

(assert (=> d!65571 e!180735))

(declare-fun res!147614 () Bool)

(assert (=> d!65571 (=> (not res!147614) (not e!180735))))

(assert (=> d!65571 (= res!147614 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7106 a!3325))))))

(declare-fun lt!140580 () Unit!8988)

(declare-fun choose!98 (array!14229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> d!65571 (= lt!140580 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65571 (validMask!0 mask!3868)))

(assert (=> d!65571 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140580)))

(declare-fun b!285130 () Bool)

(assert (=> b!285130 (= e!180735 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14230 (store (arr!6753 a!3325) i!1267 k0!2581) (size!7106 a!3325)) mask!3868))))

(assert (= (and d!65571 res!147614) b!285130))

(declare-fun m!299535 () Bool)

(assert (=> d!65571 m!299535))

(assert (=> d!65571 m!299351))

(assert (=> b!285130 m!299369))

(declare-fun m!299537 () Bool)

(assert (=> b!285130 m!299537))

(assert (=> b!284932 d!65571))

(declare-fun d!65573 () Bool)

(declare-fun res!147623 () Bool)

(declare-fun e!180746 () Bool)

(assert (=> d!65573 (=> res!147623 e!180746)))

(assert (=> d!65573 (= res!147623 (= (select (arr!6753 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65573 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!180746)))

(declare-fun b!285143 () Bool)

(declare-fun e!180747 () Bool)

(assert (=> b!285143 (= e!180746 e!180747)))

(declare-fun res!147624 () Bool)

(assert (=> b!285143 (=> (not res!147624) (not e!180747))))

(assert (=> b!285143 (= res!147624 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7106 a!3325)))))

(declare-fun b!285144 () Bool)

(assert (=> b!285144 (= e!180747 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65573 (not res!147623)) b!285143))

(assert (= (and b!285143 res!147624) b!285144))

(assert (=> d!65573 m!299423))

(declare-fun m!299563 () Bool)

(assert (=> b!285144 m!299563))

(assert (=> b!284938 d!65573))

(declare-fun d!65579 () Bool)

(assert (=> d!65579 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27590 d!65579))

(declare-fun d!65589 () Bool)

(assert (=> d!65589 (= (array_inv!4725 a!3325) (bvsge (size!7106 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27590 d!65589))

(declare-fun d!65595 () Bool)

(assert (=> d!65595 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!284933 d!65595))

(check-sat (not b!285102) (not b!285119) (not d!65571) (not bm!25522) (not d!65543) (not b!285112) (not b!285144) (not bm!25525) (not bm!25510) (not b!285070) (not b!285011) (not b!285103) (not bm!25524) (not b!285116) (not b!285106) (not b!285008) (not b!285115) (not b!285130))
(check-sat)
