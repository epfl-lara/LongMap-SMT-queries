; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32538 () Bool)

(assert start!32538)

(declare-datatypes ((array!16677 0))(
  ( (array!16678 (arr!7896 (Array (_ BitVec 32) (_ BitVec 64))) (size!8248 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16677)

(declare-fun b!325523 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun e!200604 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!157019 () (_ BitVec 32))

(assert (=> b!325523 (= e!200604 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (or (bvslt lt!157019 #b00000000000000000000000000000000) (bvsge lt!157019 (size!8248 a!3305)))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325523 (= lt!157019 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325524 () Bool)

(declare-fun e!200605 () Bool)

(assert (=> b!325524 (= e!200605 e!200604)))

(declare-fun res!178857 () Bool)

(assert (=> b!325524 (=> (not res!178857) (not e!200604))))

(declare-datatypes ((SeekEntryResult!3027 0))(
  ( (MissingZero!3027 (index!14284 (_ BitVec 32))) (Found!3027 (index!14285 (_ BitVec 32))) (Intermediate!3027 (undefined!3839 Bool) (index!14286 (_ BitVec 32)) (x!32519 (_ BitVec 32))) (Undefined!3027) (MissingVacant!3027 (index!14287 (_ BitVec 32))) )
))
(declare-fun lt!157020 () SeekEntryResult!3027)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16677 (_ BitVec 32)) SeekEntryResult!3027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325524 (= res!178857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157020))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325524 (= lt!157020 (Intermediate!3027 false resIndex!58 resX!58))))

(declare-fun b!325525 () Bool)

(declare-fun res!178854 () Bool)

(assert (=> b!325525 (=> (not res!178854) (not e!200605))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325525 (= res!178854 (and (= (size!8248 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8248 a!3305))))))

(declare-fun res!178855 () Bool)

(assert (=> start!32538 (=> (not res!178855) (not e!200605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32538 (= res!178855 (validMask!0 mask!3777))))

(assert (=> start!32538 e!200605))

(declare-fun array_inv!5859 (array!16677) Bool)

(assert (=> start!32538 (array_inv!5859 a!3305)))

(assert (=> start!32538 true))

(declare-fun b!325526 () Bool)

(declare-fun res!178863 () Bool)

(assert (=> b!325526 (=> (not res!178863) (not e!200604))))

(assert (=> b!325526 (= res!178863 (and (= (select (arr!7896 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8248 a!3305))))))

(declare-fun b!325527 () Bool)

(declare-fun res!178859 () Bool)

(assert (=> b!325527 (=> (not res!178859) (not e!200605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16677 (_ BitVec 32)) Bool)

(assert (=> b!325527 (= res!178859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325528 () Bool)

(declare-fun res!178862 () Bool)

(assert (=> b!325528 (=> (not res!178862) (not e!200605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325528 (= res!178862 (validKeyInArray!0 k0!2497))))

(declare-fun b!325529 () Bool)

(declare-fun res!178860 () Bool)

(assert (=> b!325529 (=> (not res!178860) (not e!200604))))

(assert (=> b!325529 (= res!178860 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157020))))

(declare-fun b!325530 () Bool)

(declare-fun res!178858 () Bool)

(assert (=> b!325530 (=> (not res!178858) (not e!200604))))

(assert (=> b!325530 (= res!178858 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7896 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325531 () Bool)

(declare-fun res!178861 () Bool)

(assert (=> b!325531 (=> (not res!178861) (not e!200605))))

(declare-fun arrayContainsKey!0 (array!16677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325531 (= res!178861 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325532 () Bool)

(declare-fun res!178856 () Bool)

(assert (=> b!325532 (=> (not res!178856) (not e!200605))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16677 (_ BitVec 32)) SeekEntryResult!3027)

(assert (=> b!325532 (= res!178856 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3027 i!1250)))))

(assert (= (and start!32538 res!178855) b!325525))

(assert (= (and b!325525 res!178854) b!325528))

(assert (= (and b!325528 res!178862) b!325531))

(assert (= (and b!325531 res!178861) b!325532))

(assert (= (and b!325532 res!178856) b!325527))

(assert (= (and b!325527 res!178859) b!325524))

(assert (= (and b!325524 res!178857) b!325526))

(assert (= (and b!325526 res!178863) b!325529))

(assert (= (and b!325529 res!178860) b!325530))

(assert (= (and b!325530 res!178858) b!325523))

(declare-fun m!332351 () Bool)

(assert (=> start!32538 m!332351))

(declare-fun m!332353 () Bool)

(assert (=> start!32538 m!332353))

(declare-fun m!332355 () Bool)

(assert (=> b!325531 m!332355))

(declare-fun m!332357 () Bool)

(assert (=> b!325523 m!332357))

(declare-fun m!332359 () Bool)

(assert (=> b!325530 m!332359))

(declare-fun m!332361 () Bool)

(assert (=> b!325527 m!332361))

(declare-fun m!332363 () Bool)

(assert (=> b!325528 m!332363))

(declare-fun m!332365 () Bool)

(assert (=> b!325529 m!332365))

(declare-fun m!332367 () Bool)

(assert (=> b!325526 m!332367))

(declare-fun m!332369 () Bool)

(assert (=> b!325524 m!332369))

(assert (=> b!325524 m!332369))

(declare-fun m!332371 () Bool)

(assert (=> b!325524 m!332371))

(declare-fun m!332373 () Bool)

(assert (=> b!325532 m!332373))

(check-sat (not b!325524) (not b!325529) (not b!325531) (not b!325532) (not b!325528) (not b!325527) (not start!32538) (not b!325523))
(check-sat)
(get-model)

(declare-fun bm!26071 () Bool)

(declare-fun call!26074 () Bool)

(assert (=> bm!26071 (= call!26074 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!325571 () Bool)

(declare-fun e!200621 () Bool)

(assert (=> b!325571 (= e!200621 call!26074)))

(declare-fun b!325572 () Bool)

(declare-fun e!200623 () Bool)

(assert (=> b!325572 (= e!200623 e!200621)))

(declare-fun lt!157035 () (_ BitVec 64))

(assert (=> b!325572 (= lt!157035 (select (arr!7896 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10088 0))(
  ( (Unit!10089) )
))
(declare-fun lt!157033 () Unit!10088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16677 (_ BitVec 64) (_ BitVec 32)) Unit!10088)

(assert (=> b!325572 (= lt!157033 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157035 #b00000000000000000000000000000000))))

(assert (=> b!325572 (arrayContainsKey!0 a!3305 lt!157035 #b00000000000000000000000000000000)))

(declare-fun lt!157034 () Unit!10088)

(assert (=> b!325572 (= lt!157034 lt!157033)))

(declare-fun res!178898 () Bool)

(assert (=> b!325572 (= res!178898 (= (seekEntryOrOpen!0 (select (arr!7896 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3027 #b00000000000000000000000000000000)))))

(assert (=> b!325572 (=> (not res!178898) (not e!200621))))

(declare-fun b!325573 () Bool)

(assert (=> b!325573 (= e!200623 call!26074)))

(declare-fun d!69647 () Bool)

(declare-fun res!178899 () Bool)

(declare-fun e!200622 () Bool)

(assert (=> d!69647 (=> res!178899 e!200622)))

(assert (=> d!69647 (= res!178899 (bvsge #b00000000000000000000000000000000 (size!8248 a!3305)))))

(assert (=> d!69647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200622)))

(declare-fun b!325574 () Bool)

(assert (=> b!325574 (= e!200622 e!200623)))

(declare-fun c!50964 () Bool)

(assert (=> b!325574 (= c!50964 (validKeyInArray!0 (select (arr!7896 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!69647 (not res!178899)) b!325574))

(assert (= (and b!325574 c!50964) b!325572))

(assert (= (and b!325574 (not c!50964)) b!325573))

(assert (= (and b!325572 res!178898) b!325571))

(assert (= (or b!325571 b!325573) bm!26071))

(declare-fun m!332399 () Bool)

(assert (=> bm!26071 m!332399))

(declare-fun m!332401 () Bool)

(assert (=> b!325572 m!332401))

(declare-fun m!332403 () Bool)

(assert (=> b!325572 m!332403))

(declare-fun m!332405 () Bool)

(assert (=> b!325572 m!332405))

(assert (=> b!325572 m!332401))

(declare-fun m!332407 () Bool)

(assert (=> b!325572 m!332407))

(assert (=> b!325574 m!332401))

(assert (=> b!325574 m!332401))

(declare-fun m!332409 () Bool)

(assert (=> b!325574 m!332409))

(assert (=> b!325527 d!69647))

(declare-fun d!69649 () Bool)

(assert (=> d!69649 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32538 d!69649))

(declare-fun d!69653 () Bool)

(assert (=> d!69653 (= (array_inv!5859 a!3305) (bvsge (size!8248 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32538 d!69653))

(declare-fun d!69655 () Bool)

(declare-fun lt!157048 () SeekEntryResult!3027)

(get-info :version)

(assert (=> d!69655 (and (or ((_ is Undefined!3027) lt!157048) (not ((_ is Found!3027) lt!157048)) (and (bvsge (index!14285 lt!157048) #b00000000000000000000000000000000) (bvslt (index!14285 lt!157048) (size!8248 a!3305)))) (or ((_ is Undefined!3027) lt!157048) ((_ is Found!3027) lt!157048) (not ((_ is MissingZero!3027) lt!157048)) (and (bvsge (index!14284 lt!157048) #b00000000000000000000000000000000) (bvslt (index!14284 lt!157048) (size!8248 a!3305)))) (or ((_ is Undefined!3027) lt!157048) ((_ is Found!3027) lt!157048) ((_ is MissingZero!3027) lt!157048) (not ((_ is MissingVacant!3027) lt!157048)) (and (bvsge (index!14287 lt!157048) #b00000000000000000000000000000000) (bvslt (index!14287 lt!157048) (size!8248 a!3305)))) (or ((_ is Undefined!3027) lt!157048) (ite ((_ is Found!3027) lt!157048) (= (select (arr!7896 a!3305) (index!14285 lt!157048)) k0!2497) (ite ((_ is MissingZero!3027) lt!157048) (= (select (arr!7896 a!3305) (index!14284 lt!157048)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3027) lt!157048) (= (select (arr!7896 a!3305) (index!14287 lt!157048)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!200645 () SeekEntryResult!3027)

(assert (=> d!69655 (= lt!157048 e!200645)))

(declare-fun c!50980 () Bool)

(declare-fun lt!157049 () SeekEntryResult!3027)

(assert (=> d!69655 (= c!50980 (and ((_ is Intermediate!3027) lt!157049) (undefined!3839 lt!157049)))))

(assert (=> d!69655 (= lt!157049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69655 (validMask!0 mask!3777)))

(assert (=> d!69655 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157048)))

(declare-fun b!325614 () Bool)

(assert (=> b!325614 (= e!200645 Undefined!3027)))

(declare-fun b!325615 () Bool)

(declare-fun e!200647 () SeekEntryResult!3027)

(assert (=> b!325615 (= e!200647 (Found!3027 (index!14286 lt!157049)))))

(declare-fun b!325616 () Bool)

(declare-fun e!200646 () SeekEntryResult!3027)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16677 (_ BitVec 32)) SeekEntryResult!3027)

(assert (=> b!325616 (= e!200646 (seekKeyOrZeroReturnVacant!0 (x!32519 lt!157049) (index!14286 lt!157049) (index!14286 lt!157049) k0!2497 a!3305 mask!3777))))

(declare-fun b!325617 () Bool)

(declare-fun c!50981 () Bool)

(declare-fun lt!157050 () (_ BitVec 64))

(assert (=> b!325617 (= c!50981 (= lt!157050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325617 (= e!200647 e!200646)))

(declare-fun b!325618 () Bool)

(assert (=> b!325618 (= e!200646 (MissingZero!3027 (index!14286 lt!157049)))))

(declare-fun b!325619 () Bool)

(assert (=> b!325619 (= e!200645 e!200647)))

(assert (=> b!325619 (= lt!157050 (select (arr!7896 a!3305) (index!14286 lt!157049)))))

(declare-fun c!50982 () Bool)

(assert (=> b!325619 (= c!50982 (= lt!157050 k0!2497))))

(assert (= (and d!69655 c!50980) b!325614))

(assert (= (and d!69655 (not c!50980)) b!325619))

(assert (= (and b!325619 c!50982) b!325615))

(assert (= (and b!325619 (not c!50982)) b!325617))

(assert (= (and b!325617 c!50981) b!325618))

(assert (= (and b!325617 (not c!50981)) b!325616))

(declare-fun m!332415 () Bool)

(assert (=> d!69655 m!332415))

(assert (=> d!69655 m!332369))

(assert (=> d!69655 m!332371))

(assert (=> d!69655 m!332351))

(assert (=> d!69655 m!332369))

(declare-fun m!332417 () Bool)

(assert (=> d!69655 m!332417))

(declare-fun m!332419 () Bool)

(assert (=> d!69655 m!332419))

(declare-fun m!332421 () Bool)

(assert (=> b!325616 m!332421))

(declare-fun m!332423 () Bool)

(assert (=> b!325619 m!332423))

(assert (=> b!325532 d!69655))

(declare-fun d!69661 () Bool)

(declare-fun res!178913 () Bool)

(declare-fun e!200652 () Bool)

(assert (=> d!69661 (=> res!178913 e!200652)))

(assert (=> d!69661 (= res!178913 (= (select (arr!7896 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69661 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!200652)))

(declare-fun b!325624 () Bool)

(declare-fun e!200653 () Bool)

(assert (=> b!325624 (= e!200652 e!200653)))

(declare-fun res!178914 () Bool)

(assert (=> b!325624 (=> (not res!178914) (not e!200653))))

(assert (=> b!325624 (= res!178914 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8248 a!3305)))))

(declare-fun b!325625 () Bool)

(assert (=> b!325625 (= e!200653 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69661 (not res!178913)) b!325624))

(assert (= (and b!325624 res!178914) b!325625))

(assert (=> d!69661 m!332401))

(declare-fun m!332425 () Bool)

(assert (=> b!325625 m!332425))

(assert (=> b!325531 d!69661))

(declare-fun b!325662 () Bool)

(declare-fun lt!157068 () SeekEntryResult!3027)

(assert (=> b!325662 (and (bvsge (index!14286 lt!157068) #b00000000000000000000000000000000) (bvslt (index!14286 lt!157068) (size!8248 a!3305)))))

(declare-fun res!178934 () Bool)

(assert (=> b!325662 (= res!178934 (= (select (arr!7896 a!3305) (index!14286 lt!157068)) k0!2497))))

(declare-fun e!200683 () Bool)

(assert (=> b!325662 (=> res!178934 e!200683)))

(declare-fun e!200682 () Bool)

(assert (=> b!325662 (= e!200682 e!200683)))

(declare-fun b!325663 () Bool)

(declare-fun e!200680 () Bool)

(assert (=> b!325663 (= e!200680 (bvsge (x!32519 lt!157068) #b01111111111111111111111111111110))))

(declare-fun d!69663 () Bool)

(assert (=> d!69663 e!200680))

(declare-fun c!50994 () Bool)

(assert (=> d!69663 (= c!50994 (and ((_ is Intermediate!3027) lt!157068) (undefined!3839 lt!157068)))))

(declare-fun e!200681 () SeekEntryResult!3027)

(assert (=> d!69663 (= lt!157068 e!200681)))

(declare-fun c!50992 () Bool)

(assert (=> d!69663 (= c!50992 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157067 () (_ BitVec 64))

(assert (=> d!69663 (= lt!157067 (select (arr!7896 a!3305) index!1840))))

(assert (=> d!69663 (validMask!0 mask!3777)))

(assert (=> d!69663 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157068)))

(declare-fun b!325664 () Bool)

(assert (=> b!325664 (= e!200681 (Intermediate!3027 true index!1840 x!1490))))

(declare-fun b!325665 () Bool)

(declare-fun e!200679 () SeekEntryResult!3027)

(assert (=> b!325665 (= e!200679 (Intermediate!3027 false index!1840 x!1490))))

(declare-fun b!325666 () Bool)

(assert (=> b!325666 (= e!200679 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325667 () Bool)

(assert (=> b!325667 (and (bvsge (index!14286 lt!157068) #b00000000000000000000000000000000) (bvslt (index!14286 lt!157068) (size!8248 a!3305)))))

(assert (=> b!325667 (= e!200683 (= (select (arr!7896 a!3305) (index!14286 lt!157068)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325668 () Bool)

(assert (=> b!325668 (= e!200681 e!200679)))

(declare-fun c!50993 () Bool)

(assert (=> b!325668 (= c!50993 (or (= lt!157067 k0!2497) (= (bvadd lt!157067 lt!157067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325669 () Bool)

(assert (=> b!325669 (= e!200680 e!200682)))

(declare-fun res!178933 () Bool)

(assert (=> b!325669 (= res!178933 (and ((_ is Intermediate!3027) lt!157068) (not (undefined!3839 lt!157068)) (bvslt (x!32519 lt!157068) #b01111111111111111111111111111110) (bvsge (x!32519 lt!157068) #b00000000000000000000000000000000) (bvsge (x!32519 lt!157068) x!1490)))))

(assert (=> b!325669 (=> (not res!178933) (not e!200682))))

(declare-fun b!325670 () Bool)

(assert (=> b!325670 (and (bvsge (index!14286 lt!157068) #b00000000000000000000000000000000) (bvslt (index!14286 lt!157068) (size!8248 a!3305)))))

(declare-fun res!178935 () Bool)

(assert (=> b!325670 (= res!178935 (= (select (arr!7896 a!3305) (index!14286 lt!157068)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325670 (=> res!178935 e!200683)))

(assert (= (and d!69663 c!50992) b!325664))

(assert (= (and d!69663 (not c!50992)) b!325668))

(assert (= (and b!325668 c!50993) b!325665))

(assert (= (and b!325668 (not c!50993)) b!325666))

(assert (= (and d!69663 c!50994) b!325663))

(assert (= (and d!69663 (not c!50994)) b!325669))

(assert (= (and b!325669 res!178933) b!325662))

(assert (= (and b!325662 (not res!178934)) b!325670))

(assert (= (and b!325670 (not res!178935)) b!325667))

(assert (=> b!325666 m!332357))

(assert (=> b!325666 m!332357))

(declare-fun m!332443 () Bool)

(assert (=> b!325666 m!332443))

(declare-fun m!332445 () Bool)

(assert (=> b!325667 m!332445))

(assert (=> b!325662 m!332445))

(assert (=> b!325670 m!332445))

(assert (=> d!69663 m!332359))

(assert (=> d!69663 m!332351))

(assert (=> b!325529 d!69663))

(declare-fun b!325671 () Bool)

(declare-fun lt!157070 () SeekEntryResult!3027)

(assert (=> b!325671 (and (bvsge (index!14286 lt!157070) #b00000000000000000000000000000000) (bvslt (index!14286 lt!157070) (size!8248 a!3305)))))

(declare-fun res!178937 () Bool)

(assert (=> b!325671 (= res!178937 (= (select (arr!7896 a!3305) (index!14286 lt!157070)) k0!2497))))

(declare-fun e!200688 () Bool)

(assert (=> b!325671 (=> res!178937 e!200688)))

(declare-fun e!200687 () Bool)

(assert (=> b!325671 (= e!200687 e!200688)))

(declare-fun b!325672 () Bool)

(declare-fun e!200685 () Bool)

(assert (=> b!325672 (= e!200685 (bvsge (x!32519 lt!157070) #b01111111111111111111111111111110))))

(declare-fun d!69683 () Bool)

(assert (=> d!69683 e!200685))

(declare-fun c!50997 () Bool)

(assert (=> d!69683 (= c!50997 (and ((_ is Intermediate!3027) lt!157070) (undefined!3839 lt!157070)))))

(declare-fun e!200686 () SeekEntryResult!3027)

(assert (=> d!69683 (= lt!157070 e!200686)))

(declare-fun c!50995 () Bool)

(assert (=> d!69683 (= c!50995 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157069 () (_ BitVec 64))

(assert (=> d!69683 (= lt!157069 (select (arr!7896 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69683 (validMask!0 mask!3777)))

(assert (=> d!69683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157070)))

(declare-fun b!325673 () Bool)

(assert (=> b!325673 (= e!200686 (Intermediate!3027 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325674 () Bool)

(declare-fun e!200684 () SeekEntryResult!3027)

(assert (=> b!325674 (= e!200684 (Intermediate!3027 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!325675 () Bool)

(assert (=> b!325675 (= e!200684 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!325676 () Bool)

(assert (=> b!325676 (and (bvsge (index!14286 lt!157070) #b00000000000000000000000000000000) (bvslt (index!14286 lt!157070) (size!8248 a!3305)))))

(assert (=> b!325676 (= e!200688 (= (select (arr!7896 a!3305) (index!14286 lt!157070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325677 () Bool)

(assert (=> b!325677 (= e!200686 e!200684)))

(declare-fun c!50996 () Bool)

(assert (=> b!325677 (= c!50996 (or (= lt!157069 k0!2497) (= (bvadd lt!157069 lt!157069) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!325678 () Bool)

(assert (=> b!325678 (= e!200685 e!200687)))

(declare-fun res!178936 () Bool)

(assert (=> b!325678 (= res!178936 (and ((_ is Intermediate!3027) lt!157070) (not (undefined!3839 lt!157070)) (bvslt (x!32519 lt!157070) #b01111111111111111111111111111110) (bvsge (x!32519 lt!157070) #b00000000000000000000000000000000) (bvsge (x!32519 lt!157070) #b00000000000000000000000000000000)))))

(assert (=> b!325678 (=> (not res!178936) (not e!200687))))

(declare-fun b!325679 () Bool)

(assert (=> b!325679 (and (bvsge (index!14286 lt!157070) #b00000000000000000000000000000000) (bvslt (index!14286 lt!157070) (size!8248 a!3305)))))

(declare-fun res!178938 () Bool)

(assert (=> b!325679 (= res!178938 (= (select (arr!7896 a!3305) (index!14286 lt!157070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325679 (=> res!178938 e!200688)))

(assert (= (and d!69683 c!50995) b!325673))

(assert (= (and d!69683 (not c!50995)) b!325677))

(assert (= (and b!325677 c!50996) b!325674))

(assert (= (and b!325677 (not c!50996)) b!325675))

(assert (= (and d!69683 c!50997) b!325672))

(assert (= (and d!69683 (not c!50997)) b!325678))

(assert (= (and b!325678 res!178936) b!325671))

(assert (= (and b!325671 (not res!178937)) b!325679))

(assert (= (and b!325679 (not res!178938)) b!325676))

(assert (=> b!325675 m!332369))

(declare-fun m!332447 () Bool)

(assert (=> b!325675 m!332447))

(assert (=> b!325675 m!332447))

(declare-fun m!332449 () Bool)

(assert (=> b!325675 m!332449))

(declare-fun m!332451 () Bool)

(assert (=> b!325676 m!332451))

(assert (=> b!325671 m!332451))

(assert (=> b!325679 m!332451))

(assert (=> d!69683 m!332369))

(declare-fun m!332453 () Bool)

(assert (=> d!69683 m!332453))

(assert (=> d!69683 m!332351))

(assert (=> b!325524 d!69683))

(declare-fun d!69685 () Bool)

(declare-fun lt!157076 () (_ BitVec 32))

(declare-fun lt!157075 () (_ BitVec 32))

(assert (=> d!69685 (= lt!157076 (bvmul (bvxor lt!157075 (bvlshr lt!157075 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69685 (= lt!157075 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69685 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!178939 (let ((h!5391 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32524 (bvmul (bvxor h!5391 (bvlshr h!5391 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32524 (bvlshr x!32524 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!178939 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!178939 #b00000000000000000000000000000000))))))

(assert (=> d!69685 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157076 (bvlshr lt!157076 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325524 d!69685))

(declare-fun d!69687 () Bool)

(declare-fun lt!157079 () (_ BitVec 32))

(assert (=> d!69687 (and (bvsge lt!157079 #b00000000000000000000000000000000) (bvslt lt!157079 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69687 (= lt!157079 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69687 (validMask!0 mask!3777)))

(assert (=> d!69687 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157079)))

(declare-fun bs!11328 () Bool)

(assert (= bs!11328 d!69687))

(declare-fun m!332455 () Bool)

(assert (=> bs!11328 m!332455))

(assert (=> bs!11328 m!332351))

(assert (=> b!325523 d!69687))

(declare-fun d!69689 () Bool)

(assert (=> d!69689 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325528 d!69689))

(check-sat (not bm!26071) (not d!69683) (not b!325572) (not d!69663) (not b!325625) (not b!325616) (not b!325666) (not d!69655) (not b!325574) (not d!69687) (not b!325675))
(check-sat)
