; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27648 () Bool)

(assert start!27648)

(declare-fun b!285454 () Bool)

(declare-fun res!147843 () Bool)

(declare-fun e!180937 () Bool)

(assert (=> b!285454 (=> (not res!147843) (not e!180937))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285454 (= res!147843 (not (= startIndex!26 i!1267)))))

(declare-fun b!285455 () Bool)

(declare-fun res!147839 () Bool)

(declare-fun e!180938 () Bool)

(assert (=> b!285455 (=> (not res!147839) (not e!180938))))

(declare-datatypes ((array!14252 0))(
  ( (array!14253 (arr!6763 (Array (_ BitVec 32) (_ BitVec 64))) (size!7115 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14252)

(declare-datatypes ((List!4484 0))(
  ( (Nil!4481) (Cons!4480 (h!5153 (_ BitVec 64)) (t!9558 List!4484)) )
))
(declare-fun arrayNoDuplicates!0 (array!14252 (_ BitVec 32) List!4484) Bool)

(assert (=> b!285455 (= res!147839 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4481))))

(declare-fun b!285456 () Bool)

(declare-fun res!147835 () Bool)

(assert (=> b!285456 (=> (not res!147835) (not e!180937))))

(assert (=> b!285456 (= res!147835 (bvsge startIndex!26 (bvsub (size!7115 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!285457 () Bool)

(declare-fun res!147838 () Bool)

(assert (=> b!285457 (=> (not res!147838) (not e!180938))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285457 (= res!147838 (validKeyInArray!0 k0!2581))))

(declare-fun b!285458 () Bool)

(declare-fun res!147837 () Bool)

(assert (=> b!285458 (=> (not res!147837) (not e!180938))))

(declare-fun arrayContainsKey!0 (array!14252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285458 (= res!147837 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285459 () Bool)

(declare-fun res!147840 () Bool)

(assert (=> b!285459 (=> (not res!147840) (not e!180937))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14252 (_ BitVec 32)) Bool)

(assert (=> b!285459 (= res!147840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285460 () Bool)

(assert (=> b!285460 (= e!180937 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868)))))

(declare-fun b!285461 () Bool)

(assert (=> b!285461 (= e!180938 e!180937)))

(declare-fun res!147841 () Bool)

(assert (=> b!285461 (=> (not res!147841) (not e!180937))))

(declare-datatypes ((SeekEntryResult!1886 0))(
  ( (MissingZero!1886 (index!9714 (_ BitVec 32))) (Found!1886 (index!9715 (_ BitVec 32))) (Intermediate!1886 (undefined!2698 Bool) (index!9716 (_ BitVec 32)) (x!28021 (_ BitVec 32))) (Undefined!1886) (MissingVacant!1886 (index!9717 (_ BitVec 32))) )
))
(declare-fun lt!140865 () SeekEntryResult!1886)

(assert (=> b!285461 (= res!147841 (or (= lt!140865 (MissingZero!1886 i!1267)) (= lt!140865 (MissingVacant!1886 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14252 (_ BitVec 32)) SeekEntryResult!1886)

(assert (=> b!285461 (= lt!140865 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!147834 () Bool)

(assert (=> start!27648 (=> (not res!147834) (not e!180938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27648 (= res!147834 (validMask!0 mask!3868))))

(assert (=> start!27648 e!180938))

(declare-fun array_inv!4713 (array!14252) Bool)

(assert (=> start!27648 (array_inv!4713 a!3325)))

(assert (=> start!27648 true))

(declare-fun b!285462 () Bool)

(declare-fun res!147842 () Bool)

(assert (=> b!285462 (=> (not res!147842) (not e!180937))))

(assert (=> b!285462 (= res!147842 (not (validKeyInArray!0 (select (arr!6763 a!3325) startIndex!26))))))

(declare-fun b!285463 () Bool)

(declare-fun res!147836 () Bool)

(assert (=> b!285463 (=> (not res!147836) (not e!180938))))

(assert (=> b!285463 (= res!147836 (and (= (size!7115 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7115 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7115 a!3325))))))

(assert (= (and start!27648 res!147834) b!285463))

(assert (= (and b!285463 res!147836) b!285457))

(assert (= (and b!285457 res!147838) b!285455))

(assert (= (and b!285455 res!147839) b!285458))

(assert (= (and b!285458 res!147837) b!285461))

(assert (= (and b!285461 res!147841) b!285459))

(assert (= (and b!285459 res!147840) b!285454))

(assert (= (and b!285454 res!147843) b!285462))

(assert (= (and b!285462 res!147842) b!285456))

(assert (= (and b!285456 res!147835) b!285460))

(declare-fun m!300443 () Bool)

(assert (=> b!285461 m!300443))

(declare-fun m!300445 () Bool)

(assert (=> b!285459 m!300445))

(declare-fun m!300447 () Bool)

(assert (=> b!285460 m!300447))

(declare-fun m!300449 () Bool)

(assert (=> b!285460 m!300449))

(declare-fun m!300451 () Bool)

(assert (=> b!285458 m!300451))

(declare-fun m!300453 () Bool)

(assert (=> b!285457 m!300453))

(declare-fun m!300455 () Bool)

(assert (=> start!27648 m!300455))

(declare-fun m!300457 () Bool)

(assert (=> start!27648 m!300457))

(declare-fun m!300459 () Bool)

(assert (=> b!285462 m!300459))

(assert (=> b!285462 m!300459))

(declare-fun m!300461 () Bool)

(assert (=> b!285462 m!300461))

(declare-fun m!300463 () Bool)

(assert (=> b!285455 m!300463))

(check-sat (not start!27648) (not b!285459) (not b!285457) (not b!285455) (not b!285462) (not b!285461) (not b!285460) (not b!285458))
(check-sat)
(get-model)

(declare-fun d!65831 () Bool)

(declare-fun res!147908 () Bool)

(declare-fun e!180961 () Bool)

(assert (=> d!65831 (=> res!147908 e!180961)))

(assert (=> d!65831 (= res!147908 (= (select (arr!6763 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65831 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!180961)))

(declare-fun b!285528 () Bool)

(declare-fun e!180962 () Bool)

(assert (=> b!285528 (= e!180961 e!180962)))

(declare-fun res!147909 () Bool)

(assert (=> b!285528 (=> (not res!147909) (not e!180962))))

(assert (=> b!285528 (= res!147909 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7115 a!3325)))))

(declare-fun b!285529 () Bool)

(assert (=> b!285529 (= e!180962 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65831 (not res!147908)) b!285528))

(assert (= (and b!285528 res!147909) b!285529))

(declare-fun m!300509 () Bool)

(assert (=> d!65831 m!300509))

(declare-fun m!300511 () Bool)

(assert (=> b!285529 m!300511))

(assert (=> b!285458 d!65831))

(declare-fun d!65833 () Bool)

(assert (=> d!65833 (= (validKeyInArray!0 (select (arr!6763 a!3325) startIndex!26)) (and (not (= (select (arr!6763 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6763 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285462 d!65833))

(declare-fun d!65835 () Bool)

(assert (=> d!65835 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285457 d!65835))

(declare-fun b!285540 () Bool)

(declare-fun e!180972 () Bool)

(declare-fun e!180973 () Bool)

(assert (=> b!285540 (= e!180972 e!180973)))

(declare-fun c!46366 () Bool)

(assert (=> b!285540 (= c!46366 (validKeyInArray!0 (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285541 () Bool)

(declare-fun e!180974 () Bool)

(declare-fun contains!1972 (List!4484 (_ BitVec 64)) Bool)

(assert (=> b!285541 (= e!180974 (contains!1972 Nil!4481 (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285542 () Bool)

(declare-fun e!180971 () Bool)

(assert (=> b!285542 (= e!180971 e!180972)))

(declare-fun res!147916 () Bool)

(assert (=> b!285542 (=> (not res!147916) (not e!180972))))

(assert (=> b!285542 (= res!147916 (not e!180974))))

(declare-fun res!147918 () Bool)

(assert (=> b!285542 (=> (not res!147918) (not e!180974))))

(assert (=> b!285542 (= res!147918 (validKeyInArray!0 (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25546 () Bool)

(declare-fun call!25549 () Bool)

(assert (=> bm!25546 (= call!25549 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46366 (Cons!4480 (select (arr!6763 a!3325) #b00000000000000000000000000000000) Nil!4481) Nil!4481)))))

(declare-fun d!65837 () Bool)

(declare-fun res!147917 () Bool)

(assert (=> d!65837 (=> res!147917 e!180971)))

(assert (=> d!65837 (= res!147917 (bvsge #b00000000000000000000000000000000 (size!7115 a!3325)))))

(assert (=> d!65837 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4481) e!180971)))

(declare-fun b!285543 () Bool)

(assert (=> b!285543 (= e!180973 call!25549)))

(declare-fun b!285544 () Bool)

(assert (=> b!285544 (= e!180973 call!25549)))

(assert (= (and d!65837 (not res!147917)) b!285542))

(assert (= (and b!285542 res!147918) b!285541))

(assert (= (and b!285542 res!147916) b!285540))

(assert (= (and b!285540 c!46366) b!285544))

(assert (= (and b!285540 (not c!46366)) b!285543))

(assert (= (or b!285544 b!285543) bm!25546))

(assert (=> b!285540 m!300509))

(assert (=> b!285540 m!300509))

(declare-fun m!300513 () Bool)

(assert (=> b!285540 m!300513))

(assert (=> b!285541 m!300509))

(assert (=> b!285541 m!300509))

(declare-fun m!300515 () Bool)

(assert (=> b!285541 m!300515))

(assert (=> b!285542 m!300509))

(assert (=> b!285542 m!300509))

(assert (=> b!285542 m!300513))

(assert (=> bm!25546 m!300509))

(declare-fun m!300517 () Bool)

(assert (=> bm!25546 m!300517))

(assert (=> b!285455 d!65837))

(declare-fun d!65843 () Bool)

(assert (=> d!65843 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27648 d!65843))

(declare-fun d!65849 () Bool)

(assert (=> d!65849 (= (array_inv!4713 a!3325) (bvsge (size!7115 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27648 d!65849))

(declare-fun b!285584 () Bool)

(declare-fun e!181003 () SeekEntryResult!1886)

(assert (=> b!285584 (= e!181003 Undefined!1886)))

(declare-fun b!285585 () Bool)

(declare-fun c!46380 () Bool)

(declare-fun lt!140888 () (_ BitVec 64))

(assert (=> b!285585 (= c!46380 (= lt!140888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181002 () SeekEntryResult!1886)

(declare-fun e!181004 () SeekEntryResult!1886)

(assert (=> b!285585 (= e!181002 e!181004)))

(declare-fun b!285586 () Bool)

(declare-fun lt!140889 () SeekEntryResult!1886)

(assert (=> b!285586 (= e!181004 (MissingZero!1886 (index!9716 lt!140889)))))

(declare-fun d!65853 () Bool)

(declare-fun lt!140887 () SeekEntryResult!1886)

(get-info :version)

(assert (=> d!65853 (and (or ((_ is Undefined!1886) lt!140887) (not ((_ is Found!1886) lt!140887)) (and (bvsge (index!9715 lt!140887) #b00000000000000000000000000000000) (bvslt (index!9715 lt!140887) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!140887) ((_ is Found!1886) lt!140887) (not ((_ is MissingZero!1886) lt!140887)) (and (bvsge (index!9714 lt!140887) #b00000000000000000000000000000000) (bvslt (index!9714 lt!140887) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!140887) ((_ is Found!1886) lt!140887) ((_ is MissingZero!1886) lt!140887) (not ((_ is MissingVacant!1886) lt!140887)) (and (bvsge (index!9717 lt!140887) #b00000000000000000000000000000000) (bvslt (index!9717 lt!140887) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!140887) (ite ((_ is Found!1886) lt!140887) (= (select (arr!6763 a!3325) (index!9715 lt!140887)) k0!2581) (ite ((_ is MissingZero!1886) lt!140887) (= (select (arr!6763 a!3325) (index!9714 lt!140887)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1886) lt!140887) (= (select (arr!6763 a!3325) (index!9717 lt!140887)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65853 (= lt!140887 e!181003)))

(declare-fun c!46379 () Bool)

(assert (=> d!65853 (= c!46379 (and ((_ is Intermediate!1886) lt!140889) (undefined!2698 lt!140889)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14252 (_ BitVec 32)) SeekEntryResult!1886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65853 (= lt!140889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65853 (validMask!0 mask!3868)))

(assert (=> d!65853 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140887)))

(declare-fun b!285587 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14252 (_ BitVec 32)) SeekEntryResult!1886)

(assert (=> b!285587 (= e!181004 (seekKeyOrZeroReturnVacant!0 (x!28021 lt!140889) (index!9716 lt!140889) (index!9716 lt!140889) k0!2581 a!3325 mask!3868))))

(declare-fun b!285588 () Bool)

(assert (=> b!285588 (= e!181003 e!181002)))

(assert (=> b!285588 (= lt!140888 (select (arr!6763 a!3325) (index!9716 lt!140889)))))

(declare-fun c!46381 () Bool)

(assert (=> b!285588 (= c!46381 (= lt!140888 k0!2581))))

(declare-fun b!285589 () Bool)

(assert (=> b!285589 (= e!181002 (Found!1886 (index!9716 lt!140889)))))

(assert (= (and d!65853 c!46379) b!285584))

(assert (= (and d!65853 (not c!46379)) b!285588))

(assert (= (and b!285588 c!46381) b!285589))

(assert (= (and b!285588 (not c!46381)) b!285585))

(assert (= (and b!285585 c!46380) b!285586))

(assert (= (and b!285585 (not c!46380)) b!285587))

(assert (=> d!65853 m!300455))

(declare-fun m!300539 () Bool)

(assert (=> d!65853 m!300539))

(declare-fun m!300541 () Bool)

(assert (=> d!65853 m!300541))

(declare-fun m!300543 () Bool)

(assert (=> d!65853 m!300543))

(assert (=> d!65853 m!300541))

(declare-fun m!300545 () Bool)

(assert (=> d!65853 m!300545))

(declare-fun m!300547 () Bool)

(assert (=> d!65853 m!300547))

(declare-fun m!300549 () Bool)

(assert (=> b!285587 m!300549))

(declare-fun m!300551 () Bool)

(assert (=> b!285588 m!300551))

(assert (=> b!285461 d!65853))

(declare-fun b!285642 () Bool)

(declare-fun e!181037 () Bool)

(declare-fun call!25559 () Bool)

(assert (=> b!285642 (= e!181037 call!25559)))

(declare-fun b!285643 () Bool)

(declare-fun e!181038 () Bool)

(assert (=> b!285643 (= e!181037 e!181038)))

(declare-fun lt!140917 () (_ BitVec 64))

(assert (=> b!285643 (= lt!140917 (select (arr!6763 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9020 0))(
  ( (Unit!9021) )
))
(declare-fun lt!140919 () Unit!9020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14252 (_ BitVec 64) (_ BitVec 32)) Unit!9020)

(assert (=> b!285643 (= lt!140919 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140917 #b00000000000000000000000000000000))))

(assert (=> b!285643 (arrayContainsKey!0 a!3325 lt!140917 #b00000000000000000000000000000000)))

(declare-fun lt!140918 () Unit!9020)

(assert (=> b!285643 (= lt!140918 lt!140919)))

(declare-fun res!147944 () Bool)

(assert (=> b!285643 (= res!147944 (= (seekEntryOrOpen!0 (select (arr!6763 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1886 #b00000000000000000000000000000000)))))

(assert (=> b!285643 (=> (not res!147944) (not e!181038))))

(declare-fun b!285645 () Bool)

(assert (=> b!285645 (= e!181038 call!25559)))

(declare-fun bm!25556 () Bool)

(assert (=> bm!25556 (= call!25559 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!285644 () Bool)

(declare-fun e!181036 () Bool)

(assert (=> b!285644 (= e!181036 e!181037)))

(declare-fun c!46403 () Bool)

(assert (=> b!285644 (= c!46403 (validKeyInArray!0 (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65861 () Bool)

(declare-fun res!147945 () Bool)

(assert (=> d!65861 (=> res!147945 e!181036)))

(assert (=> d!65861 (= res!147945 (bvsge #b00000000000000000000000000000000 (size!7115 a!3325)))))

(assert (=> d!65861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!181036)))

(assert (= (and d!65861 (not res!147945)) b!285644))

(assert (= (and b!285644 c!46403) b!285643))

(assert (= (and b!285644 (not c!46403)) b!285642))

(assert (= (and b!285643 res!147944) b!285645))

(assert (= (or b!285645 b!285642) bm!25556))

(assert (=> b!285643 m!300509))

(declare-fun m!300593 () Bool)

(assert (=> b!285643 m!300593))

(declare-fun m!300597 () Bool)

(assert (=> b!285643 m!300597))

(assert (=> b!285643 m!300509))

(declare-fun m!300599 () Bool)

(assert (=> b!285643 m!300599))

(declare-fun m!300601 () Bool)

(assert (=> bm!25556 m!300601))

(assert (=> b!285644 m!300509))

(assert (=> b!285644 m!300509))

(assert (=> b!285644 m!300513))

(assert (=> b!285459 d!65861))

(declare-fun b!285648 () Bool)

(declare-fun e!181042 () Bool)

(declare-fun call!25560 () Bool)

(assert (=> b!285648 (= e!181042 call!25560)))

(declare-fun b!285649 () Bool)

(declare-fun e!181043 () Bool)

(assert (=> b!285649 (= e!181042 e!181043)))

(declare-fun lt!140920 () (_ BitVec 64))

(assert (=> b!285649 (= lt!140920 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26))))

(declare-fun lt!140922 () Unit!9020)

(assert (=> b!285649 (= lt!140922 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!140920 startIndex!26))))

(assert (=> b!285649 (arrayContainsKey!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!140920 #b00000000000000000000000000000000)))

(declare-fun lt!140921 () Unit!9020)

(assert (=> b!285649 (= lt!140921 lt!140922)))

(declare-fun res!147948 () Bool)

(assert (=> b!285649 (= res!147948 (= (seekEntryOrOpen!0 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868) (Found!1886 startIndex!26)))))

(assert (=> b!285649 (=> (not res!147948) (not e!181043))))

(declare-fun b!285651 () Bool)

(assert (=> b!285651 (= e!181043 call!25560)))

(declare-fun bm!25557 () Bool)

(assert (=> bm!25557 (= call!25560 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868))))

(declare-fun b!285650 () Bool)

(declare-fun e!181041 () Bool)

(assert (=> b!285650 (= e!181041 e!181042)))

(declare-fun c!46404 () Bool)

(assert (=> b!285650 (= c!46404 (validKeyInArray!0 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26)))))

(declare-fun d!65875 () Bool)

(declare-fun res!147949 () Bool)

(assert (=> d!65875 (=> res!147949 e!181041)))

(assert (=> d!65875 (= res!147949 (bvsge startIndex!26 (size!7115 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)))))))

(assert (=> d!65875 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868) e!181041)))

(assert (= (and d!65875 (not res!147949)) b!285650))

(assert (= (and b!285650 c!46404) b!285649))

(assert (= (and b!285650 (not c!46404)) b!285648))

(assert (= (and b!285649 res!147948) b!285651))

(assert (= (or b!285651 b!285648) bm!25557))

(declare-fun m!300603 () Bool)

(assert (=> b!285649 m!300603))

(declare-fun m!300605 () Bool)

(assert (=> b!285649 m!300605))

(declare-fun m!300607 () Bool)

(assert (=> b!285649 m!300607))

(assert (=> b!285649 m!300603))

(declare-fun m!300609 () Bool)

(assert (=> b!285649 m!300609))

(declare-fun m!300611 () Bool)

(assert (=> bm!25557 m!300611))

(assert (=> b!285650 m!300603))

(assert (=> b!285650 m!300603))

(declare-fun m!300613 () Bool)

(assert (=> b!285650 m!300613))

(assert (=> b!285460 d!65875))

(check-sat (not b!285643) (not bm!25546) (not b!285529) (not b!285542) (not bm!25556) (not b!285540) (not b!285644) (not b!285587) (not bm!25557) (not b!285650) (not d!65853) (not b!285541) (not b!285649))
(check-sat)
(get-model)

(declare-fun b!285754 () Bool)

(declare-fun e!181113 () Bool)

(declare-fun lt!140962 () SeekEntryResult!1886)

(assert (=> b!285754 (= e!181113 (bvsge (x!28021 lt!140962) #b01111111111111111111111111111110))))

(declare-fun b!285755 () Bool)

(assert (=> b!285755 (and (bvsge (index!9716 lt!140962) #b00000000000000000000000000000000) (bvslt (index!9716 lt!140962) (size!7115 a!3325)))))

(declare-fun res!147990 () Bool)

(assert (=> b!285755 (= res!147990 (= (select (arr!6763 a!3325) (index!9716 lt!140962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181115 () Bool)

(assert (=> b!285755 (=> res!147990 e!181115)))

(declare-fun b!285757 () Bool)

(assert (=> b!285757 (and (bvsge (index!9716 lt!140962) #b00000000000000000000000000000000) (bvslt (index!9716 lt!140962) (size!7115 a!3325)))))

(assert (=> b!285757 (= e!181115 (= (select (arr!6763 a!3325) (index!9716 lt!140962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!285758 () Bool)

(declare-fun e!181116 () Bool)

(assert (=> b!285758 (= e!181113 e!181116)))

(declare-fun res!147992 () Bool)

(assert (=> b!285758 (= res!147992 (and ((_ is Intermediate!1886) lt!140962) (not (undefined!2698 lt!140962)) (bvslt (x!28021 lt!140962) #b01111111111111111111111111111110) (bvsge (x!28021 lt!140962) #b00000000000000000000000000000000) (bvsge (x!28021 lt!140962) #b00000000000000000000000000000000)))))

(assert (=> b!285758 (=> (not res!147992) (not e!181116))))

(declare-fun b!285759 () Bool)

(declare-fun e!181117 () SeekEntryResult!1886)

(assert (=> b!285759 (= e!181117 (Intermediate!1886 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!285760 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!285760 (= e!181117 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3868) k0!2581 a!3325 mask!3868))))

(declare-fun b!285756 () Bool)

(declare-fun e!181114 () SeekEntryResult!1886)

(assert (=> b!285756 (= e!181114 (Intermediate!1886 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun d!65889 () Bool)

(assert (=> d!65889 e!181113))

(declare-fun c!46436 () Bool)

(assert (=> d!65889 (= c!46436 (and ((_ is Intermediate!1886) lt!140962) (undefined!2698 lt!140962)))))

(assert (=> d!65889 (= lt!140962 e!181114)))

(declare-fun c!46437 () Bool)

(assert (=> d!65889 (= c!46437 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!140961 () (_ BitVec 64))

(assert (=> d!65889 (= lt!140961 (select (arr!6763 a!3325) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!65889 (validMask!0 mask!3868)))

(assert (=> d!65889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868) lt!140962)))

(declare-fun b!285761 () Bool)

(assert (=> b!285761 (= e!181114 e!181117)))

(declare-fun c!46438 () Bool)

(assert (=> b!285761 (= c!46438 (or (= lt!140961 k0!2581) (= (bvadd lt!140961 lt!140961) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!285762 () Bool)

(assert (=> b!285762 (and (bvsge (index!9716 lt!140962) #b00000000000000000000000000000000) (bvslt (index!9716 lt!140962) (size!7115 a!3325)))))

(declare-fun res!147991 () Bool)

(assert (=> b!285762 (= res!147991 (= (select (arr!6763 a!3325) (index!9716 lt!140962)) k0!2581))))

(assert (=> b!285762 (=> res!147991 e!181115)))

(assert (=> b!285762 (= e!181116 e!181115)))

(assert (= (and d!65889 c!46437) b!285756))

(assert (= (and d!65889 (not c!46437)) b!285761))

(assert (= (and b!285761 c!46438) b!285759))

(assert (= (and b!285761 (not c!46438)) b!285760))

(assert (= (and d!65889 c!46436) b!285754))

(assert (= (and d!65889 (not c!46436)) b!285758))

(assert (= (and b!285758 res!147992) b!285762))

(assert (= (and b!285762 (not res!147991)) b!285755))

(assert (= (and b!285755 (not res!147990)) b!285757))

(declare-fun m!300717 () Bool)

(assert (=> b!285757 m!300717))

(assert (=> b!285755 m!300717))

(assert (=> d!65889 m!300541))

(declare-fun m!300719 () Bool)

(assert (=> d!65889 m!300719))

(assert (=> d!65889 m!300455))

(assert (=> b!285762 m!300717))

(assert (=> b!285760 m!300541))

(declare-fun m!300721 () Bool)

(assert (=> b!285760 m!300721))

(assert (=> b!285760 m!300721))

(declare-fun m!300723 () Bool)

(assert (=> b!285760 m!300723))

(assert (=> d!65853 d!65889))

(declare-fun d!65915 () Bool)

(declare-fun lt!140968 () (_ BitVec 32))

(declare-fun lt!140967 () (_ BitVec 32))

(assert (=> d!65915 (= lt!140968 (bvmul (bvxor lt!140967 (bvlshr lt!140967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65915 (= lt!140967 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65915 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!147995 (let ((h!5156 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28026 (bvmul (bvxor h!5156 (bvlshr h!5156 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28026 (bvlshr x!28026 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!147995 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!147995 #b00000000000000000000000000000000))))))

(assert (=> d!65915 (= (toIndex!0 k0!2581 mask!3868) (bvand (bvxor lt!140968 (bvlshr lt!140968 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65853 d!65915))

(assert (=> d!65853 d!65843))

(declare-fun d!65917 () Bool)

(assert (=> d!65917 (= (validKeyInArray!0 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26)) (and (not (= (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285650 d!65917))

(declare-fun b!285765 () Bool)

(declare-fun e!181121 () Bool)

(declare-fun call!25571 () Bool)

(assert (=> b!285765 (= e!181121 call!25571)))

(declare-fun b!285766 () Bool)

(declare-fun e!181122 () Bool)

(assert (=> b!285766 (= e!181121 e!181122)))

(declare-fun lt!140969 () (_ BitVec 64))

(assert (=> b!285766 (= lt!140969 (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140971 () Unit!9020)

(assert (=> b!285766 (= lt!140971 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140969 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!285766 (arrayContainsKey!0 a!3325 lt!140969 #b00000000000000000000000000000000)))

(declare-fun lt!140970 () Unit!9020)

(assert (=> b!285766 (= lt!140970 lt!140971)))

(declare-fun res!147996 () Bool)

(assert (=> b!285766 (= res!147996 (= (seekEntryOrOpen!0 (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1886 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!285766 (=> (not res!147996) (not e!181122))))

(declare-fun b!285768 () Bool)

(assert (=> b!285768 (= e!181122 call!25571)))

(declare-fun bm!25568 () Bool)

(assert (=> bm!25568 (= call!25571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!285767 () Bool)

(declare-fun e!181120 () Bool)

(assert (=> b!285767 (= e!181120 e!181121)))

(declare-fun c!46439 () Bool)

(assert (=> b!285767 (= c!46439 (validKeyInArray!0 (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!65919 () Bool)

(declare-fun res!147997 () Bool)

(assert (=> d!65919 (=> res!147997 e!181120)))

(assert (=> d!65919 (= res!147997 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7115 a!3325)))))

(assert (=> d!65919 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!181120)))

(assert (= (and d!65919 (not res!147997)) b!285767))

(assert (= (and b!285767 c!46439) b!285766))

(assert (= (and b!285767 (not c!46439)) b!285765))

(assert (= (and b!285766 res!147996) b!285768))

(assert (= (or b!285768 b!285765) bm!25568))

(declare-fun m!300725 () Bool)

(assert (=> b!285766 m!300725))

(declare-fun m!300727 () Bool)

(assert (=> b!285766 m!300727))

(declare-fun m!300729 () Bool)

(assert (=> b!285766 m!300729))

(assert (=> b!285766 m!300725))

(declare-fun m!300731 () Bool)

(assert (=> b!285766 m!300731))

(declare-fun m!300733 () Bool)

(assert (=> bm!25568 m!300733))

(assert (=> b!285767 m!300725))

(assert (=> b!285767 m!300725))

(declare-fun m!300735 () Bool)

(assert (=> b!285767 m!300735))

(assert (=> bm!25556 d!65919))

(declare-fun d!65921 () Bool)

(assert (=> d!65921 (arrayContainsKey!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!140920 #b00000000000000000000000000000000)))

(declare-fun lt!140974 () Unit!9020)

(declare-fun choose!13 (array!14252 (_ BitVec 64) (_ BitVec 32)) Unit!9020)

(assert (=> d!65921 (= lt!140974 (choose!13 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!140920 startIndex!26))))

(assert (=> d!65921 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65921 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!140920 startIndex!26) lt!140974)))

(declare-fun bs!10164 () Bool)

(assert (= bs!10164 d!65921))

(assert (=> bs!10164 m!300607))

(declare-fun m!300737 () Bool)

(assert (=> bs!10164 m!300737))

(assert (=> b!285649 d!65921))

(declare-fun d!65923 () Bool)

(declare-fun res!147998 () Bool)

(declare-fun e!181123 () Bool)

(assert (=> d!65923 (=> res!147998 e!181123)))

(assert (=> d!65923 (= res!147998 (= (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) #b00000000000000000000000000000000) lt!140920))))

(assert (=> d!65923 (= (arrayContainsKey!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!140920 #b00000000000000000000000000000000) e!181123)))

(declare-fun b!285769 () Bool)

(declare-fun e!181124 () Bool)

(assert (=> b!285769 (= e!181123 e!181124)))

(declare-fun res!147999 () Bool)

(assert (=> b!285769 (=> (not res!147999) (not e!181124))))

(assert (=> b!285769 (= res!147999 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7115 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)))))))

(declare-fun b!285770 () Bool)

(assert (=> b!285770 (= e!181124 (arrayContainsKey!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!140920 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65923 (not res!147998)) b!285769))

(assert (= (and b!285769 res!147999) b!285770))

(declare-fun m!300739 () Bool)

(assert (=> d!65923 m!300739))

(declare-fun m!300741 () Bool)

(assert (=> b!285770 m!300741))

(assert (=> b!285649 d!65923))

(declare-fun b!285771 () Bool)

(declare-fun e!181126 () SeekEntryResult!1886)

(assert (=> b!285771 (= e!181126 Undefined!1886)))

(declare-fun b!285772 () Bool)

(declare-fun c!46441 () Bool)

(declare-fun lt!140976 () (_ BitVec 64))

(assert (=> b!285772 (= c!46441 (= lt!140976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181125 () SeekEntryResult!1886)

(declare-fun e!181127 () SeekEntryResult!1886)

(assert (=> b!285772 (= e!181125 e!181127)))

(declare-fun b!285773 () Bool)

(declare-fun lt!140977 () SeekEntryResult!1886)

(assert (=> b!285773 (= e!181127 (MissingZero!1886 (index!9716 lt!140977)))))

(declare-fun d!65925 () Bool)

(declare-fun lt!140975 () SeekEntryResult!1886)

(assert (=> d!65925 (and (or ((_ is Undefined!1886) lt!140975) (not ((_ is Found!1886) lt!140975)) (and (bvsge (index!9715 lt!140975) #b00000000000000000000000000000000) (bvslt (index!9715 lt!140975) (size!7115 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)))))) (or ((_ is Undefined!1886) lt!140975) ((_ is Found!1886) lt!140975) (not ((_ is MissingZero!1886) lt!140975)) (and (bvsge (index!9714 lt!140975) #b00000000000000000000000000000000) (bvslt (index!9714 lt!140975) (size!7115 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)))))) (or ((_ is Undefined!1886) lt!140975) ((_ is Found!1886) lt!140975) ((_ is MissingZero!1886) lt!140975) (not ((_ is MissingVacant!1886) lt!140975)) (and (bvsge (index!9717 lt!140975) #b00000000000000000000000000000000) (bvslt (index!9717 lt!140975) (size!7115 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)))))) (or ((_ is Undefined!1886) lt!140975) (ite ((_ is Found!1886) lt!140975) (= (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) (index!9715 lt!140975)) (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26)) (ite ((_ is MissingZero!1886) lt!140975) (= (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) (index!9714 lt!140975)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1886) lt!140975) (= (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) (index!9717 lt!140975)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65925 (= lt!140975 e!181126)))

(declare-fun c!46440 () Bool)

(assert (=> d!65925 (= c!46440 (and ((_ is Intermediate!1886) lt!140977) (undefined!2698 lt!140977)))))

(assert (=> d!65925 (= lt!140977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26) mask!3868) (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868))))

(assert (=> d!65925 (validMask!0 mask!3868)))

(assert (=> d!65925 (= (seekEntryOrOpen!0 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868) lt!140975)))

(declare-fun b!285774 () Bool)

(assert (=> b!285774 (= e!181127 (seekKeyOrZeroReturnVacant!0 (x!28021 lt!140977) (index!9716 lt!140977) (index!9716 lt!140977) (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868))))

(declare-fun b!285775 () Bool)

(assert (=> b!285775 (= e!181126 e!181125)))

(assert (=> b!285775 (= lt!140976 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) (index!9716 lt!140977)))))

(declare-fun c!46442 () Bool)

(assert (=> b!285775 (= c!46442 (= lt!140976 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) startIndex!26)))))

(declare-fun b!285776 () Bool)

(assert (=> b!285776 (= e!181125 (Found!1886 (index!9716 lt!140977)))))

(assert (= (and d!65925 c!46440) b!285771))

(assert (= (and d!65925 (not c!46440)) b!285775))

(assert (= (and b!285775 c!46442) b!285776))

(assert (= (and b!285775 (not c!46442)) b!285772))

(assert (= (and b!285772 c!46441) b!285773))

(assert (= (and b!285772 (not c!46441)) b!285774))

(assert (=> d!65925 m!300455))

(declare-fun m!300743 () Bool)

(assert (=> d!65925 m!300743))

(assert (=> d!65925 m!300603))

(declare-fun m!300745 () Bool)

(assert (=> d!65925 m!300745))

(declare-fun m!300747 () Bool)

(assert (=> d!65925 m!300747))

(assert (=> d!65925 m!300745))

(assert (=> d!65925 m!300603))

(declare-fun m!300749 () Bool)

(assert (=> d!65925 m!300749))

(declare-fun m!300751 () Bool)

(assert (=> d!65925 m!300751))

(assert (=> b!285774 m!300603))

(declare-fun m!300753 () Bool)

(assert (=> b!285774 m!300753))

(declare-fun m!300755 () Bool)

(assert (=> b!285775 m!300755))

(assert (=> b!285649 d!65925))

(declare-fun d!65927 () Bool)

(assert (=> d!65927 (= (validKeyInArray!0 (select (arr!6763 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6763 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6763 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285644 d!65927))

(declare-fun b!285777 () Bool)

(declare-fun e!181129 () Bool)

(declare-fun e!181130 () Bool)

(assert (=> b!285777 (= e!181129 e!181130)))

(declare-fun c!46443 () Bool)

(assert (=> b!285777 (= c!46443 (validKeyInArray!0 (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!285778 () Bool)

(declare-fun e!181131 () Bool)

(assert (=> b!285778 (= e!181131 (contains!1972 (ite c!46366 (Cons!4480 (select (arr!6763 a!3325) #b00000000000000000000000000000000) Nil!4481) Nil!4481) (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!285779 () Bool)

(declare-fun e!181128 () Bool)

(assert (=> b!285779 (= e!181128 e!181129)))

(declare-fun res!148000 () Bool)

(assert (=> b!285779 (=> (not res!148000) (not e!181129))))

(assert (=> b!285779 (= res!148000 (not e!181131))))

(declare-fun res!148002 () Bool)

(assert (=> b!285779 (=> (not res!148002) (not e!181131))))

(assert (=> b!285779 (= res!148002 (validKeyInArray!0 (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!25572 () Bool)

(declare-fun bm!25569 () Bool)

(assert (=> bm!25569 (= call!25572 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46443 (Cons!4480 (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46366 (Cons!4480 (select (arr!6763 a!3325) #b00000000000000000000000000000000) Nil!4481) Nil!4481)) (ite c!46366 (Cons!4480 (select (arr!6763 a!3325) #b00000000000000000000000000000000) Nil!4481) Nil!4481))))))

(declare-fun d!65929 () Bool)

(declare-fun res!148001 () Bool)

(assert (=> d!65929 (=> res!148001 e!181128)))

(assert (=> d!65929 (= res!148001 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7115 a!3325)))))

(assert (=> d!65929 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46366 (Cons!4480 (select (arr!6763 a!3325) #b00000000000000000000000000000000) Nil!4481) Nil!4481)) e!181128)))

(declare-fun b!285780 () Bool)

(assert (=> b!285780 (= e!181130 call!25572)))

(declare-fun b!285781 () Bool)

(assert (=> b!285781 (= e!181130 call!25572)))

(assert (= (and d!65929 (not res!148001)) b!285779))

(assert (= (and b!285779 res!148002) b!285778))

(assert (= (and b!285779 res!148000) b!285777))

(assert (= (and b!285777 c!46443) b!285781))

(assert (= (and b!285777 (not c!46443)) b!285780))

(assert (= (or b!285781 b!285780) bm!25569))

(assert (=> b!285777 m!300725))

(assert (=> b!285777 m!300725))

(assert (=> b!285777 m!300735))

(assert (=> b!285778 m!300725))

(assert (=> b!285778 m!300725))

(declare-fun m!300757 () Bool)

(assert (=> b!285778 m!300757))

(assert (=> b!285779 m!300725))

(assert (=> b!285779 m!300725))

(assert (=> b!285779 m!300735))

(assert (=> bm!25569 m!300725))

(declare-fun m!300759 () Bool)

(assert (=> bm!25569 m!300759))

(assert (=> bm!25546 d!65929))

(declare-fun d!65931 () Bool)

(declare-fun res!148003 () Bool)

(declare-fun e!181132 () Bool)

(assert (=> d!65931 (=> res!148003 e!181132)))

(assert (=> d!65931 (= res!148003 (= (select (arr!6763 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2581))))

(assert (=> d!65931 (= (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!181132)))

(declare-fun b!285782 () Bool)

(declare-fun e!181133 () Bool)

(assert (=> b!285782 (= e!181132 e!181133)))

(declare-fun res!148004 () Bool)

(assert (=> b!285782 (=> (not res!148004) (not e!181133))))

(assert (=> b!285782 (= res!148004 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7115 a!3325)))))

(declare-fun b!285783 () Bool)

(assert (=> b!285783 (= e!181133 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65931 (not res!148003)) b!285782))

(assert (= (and b!285782 res!148004) b!285783))

(assert (=> d!65931 m!300725))

(declare-fun m!300761 () Bool)

(assert (=> b!285783 m!300761))

(assert (=> b!285529 d!65931))

(declare-fun d!65933 () Bool)

(assert (=> d!65933 (arrayContainsKey!0 a!3325 lt!140917 #b00000000000000000000000000000000)))

(declare-fun lt!140978 () Unit!9020)

(assert (=> d!65933 (= lt!140978 (choose!13 a!3325 lt!140917 #b00000000000000000000000000000000))))

(assert (=> d!65933 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!65933 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140917 #b00000000000000000000000000000000) lt!140978)))

(declare-fun bs!10165 () Bool)

(assert (= bs!10165 d!65933))

(assert (=> bs!10165 m!300597))

(declare-fun m!300763 () Bool)

(assert (=> bs!10165 m!300763))

(assert (=> b!285643 d!65933))

(declare-fun d!65935 () Bool)

(declare-fun res!148005 () Bool)

(declare-fun e!181134 () Bool)

(assert (=> d!65935 (=> res!148005 e!181134)))

(assert (=> d!65935 (= res!148005 (= (select (arr!6763 a!3325) #b00000000000000000000000000000000) lt!140917))))

(assert (=> d!65935 (= (arrayContainsKey!0 a!3325 lt!140917 #b00000000000000000000000000000000) e!181134)))

(declare-fun b!285784 () Bool)

(declare-fun e!181135 () Bool)

(assert (=> b!285784 (= e!181134 e!181135)))

(declare-fun res!148006 () Bool)

(assert (=> b!285784 (=> (not res!148006) (not e!181135))))

(assert (=> b!285784 (= res!148006 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7115 a!3325)))))

(declare-fun b!285785 () Bool)

(assert (=> b!285785 (= e!181135 (arrayContainsKey!0 a!3325 lt!140917 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65935 (not res!148005)) b!285784))

(assert (= (and b!285784 res!148006) b!285785))

(assert (=> d!65935 m!300509))

(declare-fun m!300765 () Bool)

(assert (=> b!285785 m!300765))

(assert (=> b!285643 d!65935))

(declare-fun b!285786 () Bool)

(declare-fun e!181137 () SeekEntryResult!1886)

(assert (=> b!285786 (= e!181137 Undefined!1886)))

(declare-fun b!285787 () Bool)

(declare-fun c!46445 () Bool)

(declare-fun lt!140980 () (_ BitVec 64))

(assert (=> b!285787 (= c!46445 (= lt!140980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181136 () SeekEntryResult!1886)

(declare-fun e!181138 () SeekEntryResult!1886)

(assert (=> b!285787 (= e!181136 e!181138)))

(declare-fun b!285788 () Bool)

(declare-fun lt!140981 () SeekEntryResult!1886)

(assert (=> b!285788 (= e!181138 (MissingZero!1886 (index!9716 lt!140981)))))

(declare-fun d!65937 () Bool)

(declare-fun lt!140979 () SeekEntryResult!1886)

(assert (=> d!65937 (and (or ((_ is Undefined!1886) lt!140979) (not ((_ is Found!1886) lt!140979)) (and (bvsge (index!9715 lt!140979) #b00000000000000000000000000000000) (bvslt (index!9715 lt!140979) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!140979) ((_ is Found!1886) lt!140979) (not ((_ is MissingZero!1886) lt!140979)) (and (bvsge (index!9714 lt!140979) #b00000000000000000000000000000000) (bvslt (index!9714 lt!140979) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!140979) ((_ is Found!1886) lt!140979) ((_ is MissingZero!1886) lt!140979) (not ((_ is MissingVacant!1886) lt!140979)) (and (bvsge (index!9717 lt!140979) #b00000000000000000000000000000000) (bvslt (index!9717 lt!140979) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!140979) (ite ((_ is Found!1886) lt!140979) (= (select (arr!6763 a!3325) (index!9715 lt!140979)) (select (arr!6763 a!3325) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1886) lt!140979) (= (select (arr!6763 a!3325) (index!9714 lt!140979)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1886) lt!140979) (= (select (arr!6763 a!3325) (index!9717 lt!140979)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65937 (= lt!140979 e!181137)))

(declare-fun c!46444 () Bool)

(assert (=> d!65937 (= c!46444 (and ((_ is Intermediate!1886) lt!140981) (undefined!2698 lt!140981)))))

(assert (=> d!65937 (= lt!140981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6763 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6763 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!65937 (validMask!0 mask!3868)))

(assert (=> d!65937 (= (seekEntryOrOpen!0 (select (arr!6763 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!140979)))

(declare-fun b!285789 () Bool)

(assert (=> b!285789 (= e!181138 (seekKeyOrZeroReturnVacant!0 (x!28021 lt!140981) (index!9716 lt!140981) (index!9716 lt!140981) (select (arr!6763 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun b!285790 () Bool)

(assert (=> b!285790 (= e!181137 e!181136)))

(assert (=> b!285790 (= lt!140980 (select (arr!6763 a!3325) (index!9716 lt!140981)))))

(declare-fun c!46446 () Bool)

(assert (=> b!285790 (= c!46446 (= lt!140980 (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285791 () Bool)

(assert (=> b!285791 (= e!181136 (Found!1886 (index!9716 lt!140981)))))

(assert (= (and d!65937 c!46444) b!285786))

(assert (= (and d!65937 (not c!46444)) b!285790))

(assert (= (and b!285790 c!46446) b!285791))

(assert (= (and b!285790 (not c!46446)) b!285787))

(assert (= (and b!285787 c!46445) b!285788))

(assert (= (and b!285787 (not c!46445)) b!285789))

(assert (=> d!65937 m!300455))

(declare-fun m!300767 () Bool)

(assert (=> d!65937 m!300767))

(assert (=> d!65937 m!300509))

(declare-fun m!300769 () Bool)

(assert (=> d!65937 m!300769))

(declare-fun m!300771 () Bool)

(assert (=> d!65937 m!300771))

(assert (=> d!65937 m!300769))

(assert (=> d!65937 m!300509))

(declare-fun m!300773 () Bool)

(assert (=> d!65937 m!300773))

(declare-fun m!300775 () Bool)

(assert (=> d!65937 m!300775))

(assert (=> b!285789 m!300509))

(declare-fun m!300777 () Bool)

(assert (=> b!285789 m!300777))

(declare-fun m!300779 () Bool)

(assert (=> b!285790 m!300779))

(assert (=> b!285643 d!65937))

(declare-fun b!285837 () Bool)

(declare-fun e!181166 () SeekEntryResult!1886)

(assert (=> b!285837 (= e!181166 (MissingVacant!1886 (index!9716 lt!140889)))))

(declare-fun lt!141001 () SeekEntryResult!1886)

(declare-fun d!65939 () Bool)

(assert (=> d!65939 (and (or ((_ is Undefined!1886) lt!141001) (not ((_ is Found!1886) lt!141001)) (and (bvsge (index!9715 lt!141001) #b00000000000000000000000000000000) (bvslt (index!9715 lt!141001) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!141001) ((_ is Found!1886) lt!141001) (not ((_ is MissingVacant!1886) lt!141001)) (not (= (index!9717 lt!141001) (index!9716 lt!140889))) (and (bvsge (index!9717 lt!141001) #b00000000000000000000000000000000) (bvslt (index!9717 lt!141001) (size!7115 a!3325)))) (or ((_ is Undefined!1886) lt!141001) (ite ((_ is Found!1886) lt!141001) (= (select (arr!6763 a!3325) (index!9715 lt!141001)) k0!2581) (and ((_ is MissingVacant!1886) lt!141001) (= (index!9717 lt!141001) (index!9716 lt!140889)) (= (select (arr!6763 a!3325) (index!9717 lt!141001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!181168 () SeekEntryResult!1886)

(assert (=> d!65939 (= lt!141001 e!181168)))

(declare-fun c!46464 () Bool)

(assert (=> d!65939 (= c!46464 (bvsge (x!28021 lt!140889) #b01111111111111111111111111111110))))

(declare-fun lt!141002 () (_ BitVec 64))

(assert (=> d!65939 (= lt!141002 (select (arr!6763 a!3325) (index!9716 lt!140889)))))

(assert (=> d!65939 (validMask!0 mask!3868)))

(assert (=> d!65939 (= (seekKeyOrZeroReturnVacant!0 (x!28021 lt!140889) (index!9716 lt!140889) (index!9716 lt!140889) k0!2581 a!3325 mask!3868) lt!141001)))

(declare-fun b!285838 () Bool)

(declare-fun e!181167 () SeekEntryResult!1886)

(assert (=> b!285838 (= e!181168 e!181167)))

(declare-fun c!46463 () Bool)

(assert (=> b!285838 (= c!46463 (= lt!141002 k0!2581))))

(declare-fun b!285839 () Bool)

(declare-fun c!46462 () Bool)

(assert (=> b!285839 (= c!46462 (= lt!141002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!285839 (= e!181167 e!181166)))

(declare-fun b!285840 () Bool)

(assert (=> b!285840 (= e!181166 (seekKeyOrZeroReturnVacant!0 (bvadd (x!28021 lt!140889) #b00000000000000000000000000000001) (nextIndex!0 (index!9716 lt!140889) (bvadd (x!28021 lt!140889) #b00000000000000000000000000000001) mask!3868) (index!9716 lt!140889) k0!2581 a!3325 mask!3868))))

(declare-fun b!285841 () Bool)

(assert (=> b!285841 (= e!181167 (Found!1886 (index!9716 lt!140889)))))

(declare-fun b!285842 () Bool)

(assert (=> b!285842 (= e!181168 Undefined!1886)))

(assert (= (and d!65939 c!46464) b!285842))

(assert (= (and d!65939 (not c!46464)) b!285838))

(assert (= (and b!285838 c!46463) b!285841))

(assert (= (and b!285838 (not c!46463)) b!285839))

(assert (= (and b!285839 c!46462) b!285837))

(assert (= (and b!285839 (not c!46462)) b!285840))

(declare-fun m!300795 () Bool)

(assert (=> d!65939 m!300795))

(declare-fun m!300797 () Bool)

(assert (=> d!65939 m!300797))

(assert (=> d!65939 m!300551))

(assert (=> d!65939 m!300455))

(declare-fun m!300799 () Bool)

(assert (=> b!285840 m!300799))

(assert (=> b!285840 m!300799))

(declare-fun m!300801 () Bool)

(assert (=> b!285840 m!300801))

(assert (=> b!285587 d!65939))

(assert (=> b!285542 d!65927))

(declare-fun d!65945 () Bool)

(declare-fun lt!141005 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!195 (List!4484) (InoxSet (_ BitVec 64)))

(assert (=> d!65945 (= lt!141005 (select (content!195 Nil!4481) (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(declare-fun e!181173 () Bool)

(assert (=> d!65945 (= lt!141005 e!181173)))

(declare-fun res!148027 () Bool)

(assert (=> d!65945 (=> (not res!148027) (not e!181173))))

(assert (=> d!65945 (= res!148027 ((_ is Cons!4480) Nil!4481))))

(assert (=> d!65945 (= (contains!1972 Nil!4481 (select (arr!6763 a!3325) #b00000000000000000000000000000000)) lt!141005)))

(declare-fun b!285847 () Bool)

(declare-fun e!181174 () Bool)

(assert (=> b!285847 (= e!181173 e!181174)))

(declare-fun res!148028 () Bool)

(assert (=> b!285847 (=> res!148028 e!181174)))

(assert (=> b!285847 (= res!148028 (= (h!5153 Nil!4481) (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285848 () Bool)

(assert (=> b!285848 (= e!181174 (contains!1972 (t!9558 Nil!4481) (select (arr!6763 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65945 res!148027) b!285847))

(assert (= (and b!285847 (not res!148028)) b!285848))

(declare-fun m!300803 () Bool)

(assert (=> d!65945 m!300803))

(assert (=> d!65945 m!300509))

(declare-fun m!300805 () Bool)

(assert (=> d!65945 m!300805))

(assert (=> b!285848 m!300509))

(declare-fun m!300807 () Bool)

(assert (=> b!285848 m!300807))

(assert (=> b!285541 d!65945))

(declare-fun b!285849 () Bool)

(declare-fun e!181176 () Bool)

(declare-fun call!25573 () Bool)

(assert (=> b!285849 (= e!181176 call!25573)))

(declare-fun b!285850 () Bool)

(declare-fun e!181177 () Bool)

(assert (=> b!285850 (= e!181176 e!181177)))

(declare-fun lt!141006 () (_ BitVec 64))

(assert (=> b!285850 (= lt!141006 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!141008 () Unit!9020)

(assert (=> b!285850 (= lt!141008 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!141006 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!285850 (arrayContainsKey!0 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) lt!141006 #b00000000000000000000000000000000)))

(declare-fun lt!141007 () Unit!9020)

(assert (=> b!285850 (= lt!141007 lt!141008)))

(declare-fun res!148029 () Bool)

(assert (=> b!285850 (= res!148029 (= (seekEntryOrOpen!0 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) (bvadd startIndex!26 #b00000000000000000000000000000001)) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868) (Found!1886 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!285850 (=> (not res!148029) (not e!181177))))

(declare-fun b!285852 () Bool)

(assert (=> b!285852 (= e!181177 call!25573)))

(declare-fun bm!25570 () Bool)

(assert (=> bm!25570 (= call!25573 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868))))

(declare-fun b!285851 () Bool)

(declare-fun e!181175 () Bool)

(assert (=> b!285851 (= e!181175 e!181176)))

(declare-fun c!46465 () Bool)

(assert (=> b!285851 (= c!46465 (validKeyInArray!0 (select (arr!6763 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325))) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun d!65947 () Bool)

(declare-fun res!148030 () Bool)

(assert (=> d!65947 (=> res!148030 e!181175)))

(assert (=> d!65947 (= res!148030 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7115 (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)))))))

(assert (=> d!65947 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) (array!14253 (store (arr!6763 a!3325) i!1267 k0!2581) (size!7115 a!3325)) mask!3868) e!181175)))

(assert (= (and d!65947 (not res!148030)) b!285851))

(assert (= (and b!285851 c!46465) b!285850))

(assert (= (and b!285851 (not c!46465)) b!285849))

(assert (= (and b!285850 res!148029) b!285852))

(assert (= (or b!285852 b!285849) bm!25570))

(declare-fun m!300809 () Bool)

(assert (=> b!285850 m!300809))

(declare-fun m!300811 () Bool)

(assert (=> b!285850 m!300811))

(declare-fun m!300813 () Bool)

(assert (=> b!285850 m!300813))

(assert (=> b!285850 m!300809))

(declare-fun m!300815 () Bool)

(assert (=> b!285850 m!300815))

(declare-fun m!300817 () Bool)

(assert (=> bm!25570 m!300817))

(assert (=> b!285851 m!300809))

(assert (=> b!285851 m!300809))

(declare-fun m!300819 () Bool)

(assert (=> b!285851 m!300819))

(assert (=> bm!25557 d!65947))

(assert (=> b!285540 d!65927))

(check-sat (not b!285840) (not d!65939) (not b!285779) (not b!285851) (not bm!25569) (not b!285770) (not b!285848) (not b!285789) (not b!285766) (not b!285760) (not b!285777) (not b!285778) (not d!65921) (not bm!25570) (not b!285783) (not b!285767) (not b!285774) (not b!285850) (not bm!25568) (not d!65937) (not d!65933) (not d!65925) (not d!65945) (not b!285785) (not d!65889))
(check-sat)
