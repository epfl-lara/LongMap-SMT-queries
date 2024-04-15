; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52454 () Bool)

(assert start!52454)

(declare-fun res!362429 () Bool)

(declare-fun e!329481 () Bool)

(assert (=> start!52454 (=> (not res!362429) (not e!329481))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52454 (= res!362429 (validMask!0 mask!3119))))

(assert (=> start!52454 e!329481))

(assert (=> start!52454 true))

(declare-datatypes ((array!35860 0))(
  ( (array!35861 (arr!17219 (Array (_ BitVec 32) (_ BitVec 64))) (size!17584 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35860)

(declare-fun array_inv!13102 (array!35860) Bool)

(assert (=> start!52454 (array_inv!13102 a!3118)))

(declare-fun b!572779 () Bool)

(declare-fun res!362435 () Bool)

(declare-fun e!329480 () Bool)

(assert (=> b!572779 (=> (not res!362435) (not e!329480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35860 (_ BitVec 32)) Bool)

(assert (=> b!572779 (= res!362435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572780 () Bool)

(declare-fun res!362438 () Bool)

(assert (=> b!572780 (=> (not res!362438) (not e!329481))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572780 (= res!362438 (and (= (size!17584 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17584 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17584 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572781 () Bool)

(declare-fun e!329483 () Bool)

(assert (=> b!572781 (= e!329480 e!329483)))

(declare-fun res!362436 () Bool)

(assert (=> b!572781 (=> (not res!362436) (not e!329483))))

(declare-fun lt!261429 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5665 0))(
  ( (MissingZero!5665 (index!24887 (_ BitVec 32))) (Found!5665 (index!24888 (_ BitVec 32))) (Intermediate!5665 (undefined!6477 Bool) (index!24889 (_ BitVec 32)) (x!53761 (_ BitVec 32))) (Undefined!5665) (MissingVacant!5665 (index!24890 (_ BitVec 32))) )
))
(declare-fun lt!261431 () SeekEntryResult!5665)

(declare-fun lt!261430 () (_ BitVec 32))

(declare-fun lt!261425 () array!35860)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35860 (_ BitVec 32)) SeekEntryResult!5665)

(assert (=> b!572781 (= res!362436 (= lt!261431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261430 lt!261429 lt!261425 mask!3119)))))

(declare-fun lt!261428 () (_ BitVec 32))

(assert (=> b!572781 (= lt!261431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261428 (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572781 (= lt!261430 (toIndex!0 lt!261429 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!572781 (= lt!261429 (select (store (arr!17219 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572781 (= lt!261428 (toIndex!0 (select (arr!17219 a!3118) j!142) mask!3119))))

(assert (=> b!572781 (= lt!261425 (array!35861 (store (arr!17219 a!3118) i!1132 k0!1914) (size!17584 a!3118)))))

(declare-fun b!572782 () Bool)

(declare-fun res!362434 () Bool)

(assert (=> b!572782 (=> (not res!362434) (not e!329480))))

(declare-datatypes ((List!11338 0))(
  ( (Nil!11335) (Cons!11334 (h!12361 (_ BitVec 64)) (t!17557 List!11338)) )
))
(declare-fun arrayNoDuplicates!0 (array!35860 (_ BitVec 32) List!11338) Bool)

(assert (=> b!572782 (= res!362434 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11335))))

(declare-fun b!572783 () Bool)

(declare-fun e!329479 () Bool)

(declare-fun e!329477 () Bool)

(assert (=> b!572783 (= e!329479 e!329477)))

(declare-fun res!362431 () Bool)

(assert (=> b!572783 (=> res!362431 e!329477)))

(get-info :version)

(assert (=> b!572783 (= res!362431 (or (undefined!6477 lt!261431) (not ((_ is Intermediate!5665) lt!261431))))))

(declare-fun b!572784 () Bool)

(declare-fun res!362441 () Bool)

(assert (=> b!572784 (=> (not res!362441) (not e!329481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572784 (= res!362441 (validKeyInArray!0 (select (arr!17219 a!3118) j!142)))))

(declare-fun b!572785 () Bool)

(declare-fun res!362432 () Bool)

(assert (=> b!572785 (=> (not res!362432) (not e!329481))))

(declare-fun arrayContainsKey!0 (array!35860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572785 (= res!362432 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572786 () Bool)

(declare-fun res!362430 () Bool)

(assert (=> b!572786 (=> (not res!362430) (not e!329481))))

(assert (=> b!572786 (= res!362430 (validKeyInArray!0 k0!1914))))

(declare-fun b!572787 () Bool)

(assert (=> b!572787 (= e!329481 e!329480)))

(declare-fun res!362439 () Bool)

(assert (=> b!572787 (=> (not res!362439) (not e!329480))))

(declare-fun lt!261426 () SeekEntryResult!5665)

(assert (=> b!572787 (= res!362439 (or (= lt!261426 (MissingZero!5665 i!1132)) (= lt!261426 (MissingVacant!5665 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35860 (_ BitVec 32)) SeekEntryResult!5665)

(assert (=> b!572787 (= lt!261426 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572788 () Bool)

(declare-fun e!329482 () Bool)

(assert (=> b!572788 (= e!329477 e!329482)))

(declare-fun res!362437 () Bool)

(assert (=> b!572788 (=> res!362437 e!329482)))

(declare-fun lt!261433 () (_ BitVec 64))

(assert (=> b!572788 (= res!362437 (or (= lt!261433 (select (arr!17219 a!3118) j!142)) (= lt!261433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572788 (= lt!261433 (select (arr!17219 a!3118) (index!24889 lt!261431)))))

(declare-fun b!572789 () Bool)

(assert (=> b!572789 (= e!329483 (not (or (undefined!6477 lt!261431) (not ((_ is Intermediate!5665) lt!261431)) (let ((bdg!17961 (select (arr!17219 a!3118) (index!24889 lt!261431)))) (or (= bdg!17961 (select (arr!17219 a!3118) j!142)) (= bdg!17961 #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!24889 lt!261431) #b00000000000000000000000000000000) (bvslt (index!24889 lt!261431) (bvadd #b00000000000000000000000000000001 mask!3119))))))))))

(assert (=> b!572789 e!329479))

(declare-fun res!362440 () Bool)

(assert (=> b!572789 (=> (not res!362440) (not e!329479))))

(declare-fun lt!261427 () SeekEntryResult!5665)

(assert (=> b!572789 (= res!362440 (= lt!261427 (Found!5665 j!142)))))

(assert (=> b!572789 (= lt!261427 (seekEntryOrOpen!0 (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572789 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18018 0))(
  ( (Unit!18019) )
))
(declare-fun lt!261432 () Unit!18018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18018)

(assert (=> b!572789 (= lt!261432 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572790 () Bool)

(declare-fun e!329478 () Bool)

(assert (=> b!572790 (= e!329482 e!329478)))

(declare-fun res!362433 () Bool)

(assert (=> b!572790 (=> (not res!362433) (not e!329478))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35860 (_ BitVec 32)) SeekEntryResult!5665)

(assert (=> b!572790 (= res!362433 (= lt!261427 (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261431) (index!24889 lt!261431) (index!24889 lt!261431) (select (arr!17219 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572791 () Bool)

(assert (=> b!572791 (= e!329478 (= (seekEntryOrOpen!0 lt!261429 lt!261425 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261431) (index!24889 lt!261431) (index!24889 lt!261431) lt!261429 lt!261425 mask!3119)))))

(assert (= (and start!52454 res!362429) b!572780))

(assert (= (and b!572780 res!362438) b!572784))

(assert (= (and b!572784 res!362441) b!572786))

(assert (= (and b!572786 res!362430) b!572785))

(assert (= (and b!572785 res!362432) b!572787))

(assert (= (and b!572787 res!362439) b!572779))

(assert (= (and b!572779 res!362435) b!572782))

(assert (= (and b!572782 res!362434) b!572781))

(assert (= (and b!572781 res!362436) b!572789))

(assert (= (and b!572789 res!362440) b!572783))

(assert (= (and b!572783 (not res!362431)) b!572788))

(assert (= (and b!572788 (not res!362437)) b!572790))

(assert (= (and b!572790 res!362433) b!572791))

(declare-fun m!551333 () Bool)

(assert (=> b!572788 m!551333))

(declare-fun m!551335 () Bool)

(assert (=> b!572788 m!551335))

(assert (=> b!572784 m!551333))

(assert (=> b!572784 m!551333))

(declare-fun m!551337 () Bool)

(assert (=> b!572784 m!551337))

(declare-fun m!551339 () Bool)

(assert (=> b!572787 m!551339))

(assert (=> b!572790 m!551333))

(assert (=> b!572790 m!551333))

(declare-fun m!551341 () Bool)

(assert (=> b!572790 m!551341))

(declare-fun m!551343 () Bool)

(assert (=> b!572791 m!551343))

(declare-fun m!551345 () Bool)

(assert (=> b!572791 m!551345))

(declare-fun m!551347 () Bool)

(assert (=> start!52454 m!551347))

(declare-fun m!551349 () Bool)

(assert (=> start!52454 m!551349))

(declare-fun m!551351 () Bool)

(assert (=> b!572785 m!551351))

(declare-fun m!551353 () Bool)

(assert (=> b!572786 m!551353))

(assert (=> b!572789 m!551333))

(declare-fun m!551355 () Bool)

(assert (=> b!572789 m!551355))

(declare-fun m!551357 () Bool)

(assert (=> b!572789 m!551357))

(assert (=> b!572789 m!551335))

(assert (=> b!572789 m!551333))

(declare-fun m!551359 () Bool)

(assert (=> b!572789 m!551359))

(assert (=> b!572781 m!551333))

(declare-fun m!551361 () Bool)

(assert (=> b!572781 m!551361))

(declare-fun m!551363 () Bool)

(assert (=> b!572781 m!551363))

(assert (=> b!572781 m!551333))

(declare-fun m!551365 () Bool)

(assert (=> b!572781 m!551365))

(assert (=> b!572781 m!551333))

(declare-fun m!551367 () Bool)

(assert (=> b!572781 m!551367))

(declare-fun m!551369 () Bool)

(assert (=> b!572781 m!551369))

(declare-fun m!551371 () Bool)

(assert (=> b!572781 m!551371))

(declare-fun m!551373 () Bool)

(assert (=> b!572779 m!551373))

(declare-fun m!551375 () Bool)

(assert (=> b!572782 m!551375))

(check-sat (not b!572789) (not b!572782) (not b!572790) (not b!572787) (not b!572779) (not start!52454) (not b!572791) (not b!572781) (not b!572786) (not b!572785) (not b!572784))
(check-sat)
(get-model)

(declare-fun d!84641 () Bool)

(assert (=> d!84641 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52454 d!84641))

(declare-fun d!84643 () Bool)

(assert (=> d!84643 (= (array_inv!13102 a!3118) (bvsge (size!17584 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52454 d!84643))

(declare-fun b!572880 () Bool)

(declare-fun e!329543 () Bool)

(declare-fun call!32602 () Bool)

(assert (=> b!572880 (= e!329543 call!32602)))

(declare-fun bm!32599 () Bool)

(declare-fun c!65535 () Bool)

(assert (=> bm!32599 (= call!32602 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65535 (Cons!11334 (select (arr!17219 a!3118) #b00000000000000000000000000000000) Nil!11335) Nil!11335)))))

(declare-fun b!572882 () Bool)

(assert (=> b!572882 (= e!329543 call!32602)))

(declare-fun b!572883 () Bool)

(declare-fun e!329544 () Bool)

(assert (=> b!572883 (= e!329544 e!329543)))

(assert (=> b!572883 (= c!65535 (validKeyInArray!0 (select (arr!17219 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!572884 () Bool)

(declare-fun e!329541 () Bool)

(assert (=> b!572884 (= e!329541 e!329544)))

(declare-fun res!362527 () Bool)

(assert (=> b!572884 (=> (not res!362527) (not e!329544))))

(declare-fun e!329542 () Bool)

(assert (=> b!572884 (= res!362527 (not e!329542))))

(declare-fun res!362526 () Bool)

(assert (=> b!572884 (=> (not res!362526) (not e!329542))))

(assert (=> b!572884 (= res!362526 (validKeyInArray!0 (select (arr!17219 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84645 () Bool)

(declare-fun res!362528 () Bool)

(assert (=> d!84645 (=> res!362528 e!329541)))

(assert (=> d!84645 (= res!362528 (bvsge #b00000000000000000000000000000000 (size!17584 a!3118)))))

(assert (=> d!84645 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11335) e!329541)))

(declare-fun b!572881 () Bool)

(declare-fun contains!2864 (List!11338 (_ BitVec 64)) Bool)

(assert (=> b!572881 (= e!329542 (contains!2864 Nil!11335 (select (arr!17219 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84645 (not res!362528)) b!572884))

(assert (= (and b!572884 res!362526) b!572881))

(assert (= (and b!572884 res!362527) b!572883))

(assert (= (and b!572883 c!65535) b!572882))

(assert (= (and b!572883 (not c!65535)) b!572880))

(assert (= (or b!572882 b!572880) bm!32599))

(declare-fun m!551465 () Bool)

(assert (=> bm!32599 m!551465))

(declare-fun m!551467 () Bool)

(assert (=> bm!32599 m!551467))

(assert (=> b!572883 m!551465))

(assert (=> b!572883 m!551465))

(declare-fun m!551469 () Bool)

(assert (=> b!572883 m!551469))

(assert (=> b!572884 m!551465))

(assert (=> b!572884 m!551465))

(assert (=> b!572884 m!551469))

(assert (=> b!572881 m!551465))

(assert (=> b!572881 m!551465))

(declare-fun m!551471 () Bool)

(assert (=> b!572881 m!551471))

(assert (=> b!572782 d!84645))

(declare-fun b!572918 () Bool)

(declare-fun e!329569 () SeekEntryResult!5665)

(declare-fun lt!261495 () SeekEntryResult!5665)

(assert (=> b!572918 (= e!329569 (MissingZero!5665 (index!24889 lt!261495)))))

(declare-fun b!572920 () Bool)

(declare-fun e!329571 () SeekEntryResult!5665)

(declare-fun e!329570 () SeekEntryResult!5665)

(assert (=> b!572920 (= e!329571 e!329570)))

(declare-fun lt!261496 () (_ BitVec 64))

(assert (=> b!572920 (= lt!261496 (select (arr!17219 a!3118) (index!24889 lt!261495)))))

(declare-fun c!65546 () Bool)

(assert (=> b!572920 (= c!65546 (= lt!261496 k0!1914))))

(declare-fun b!572921 () Bool)

(assert (=> b!572921 (= e!329570 (Found!5665 (index!24889 lt!261495)))))

(declare-fun b!572922 () Bool)

(assert (=> b!572922 (= e!329569 (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261495) (index!24889 lt!261495) (index!24889 lt!261495) k0!1914 a!3118 mask!3119))))

(declare-fun b!572923 () Bool)

(assert (=> b!572923 (= e!329571 Undefined!5665)))

(declare-fun b!572919 () Bool)

(declare-fun c!65545 () Bool)

(assert (=> b!572919 (= c!65545 (= lt!261496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!572919 (= e!329570 e!329569)))

(declare-fun d!84647 () Bool)

(declare-fun lt!261494 () SeekEntryResult!5665)

(assert (=> d!84647 (and (or ((_ is Undefined!5665) lt!261494) (not ((_ is Found!5665) lt!261494)) (and (bvsge (index!24888 lt!261494) #b00000000000000000000000000000000) (bvslt (index!24888 lt!261494) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261494) ((_ is Found!5665) lt!261494) (not ((_ is MissingZero!5665) lt!261494)) (and (bvsge (index!24887 lt!261494) #b00000000000000000000000000000000) (bvslt (index!24887 lt!261494) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261494) ((_ is Found!5665) lt!261494) ((_ is MissingZero!5665) lt!261494) (not ((_ is MissingVacant!5665) lt!261494)) (and (bvsge (index!24890 lt!261494) #b00000000000000000000000000000000) (bvslt (index!24890 lt!261494) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261494) (ite ((_ is Found!5665) lt!261494) (= (select (arr!17219 a!3118) (index!24888 lt!261494)) k0!1914) (ite ((_ is MissingZero!5665) lt!261494) (= (select (arr!17219 a!3118) (index!24887 lt!261494)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5665) lt!261494) (= (select (arr!17219 a!3118) (index!24890 lt!261494)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84647 (= lt!261494 e!329571)))

(declare-fun c!65547 () Bool)

(assert (=> d!84647 (= c!65547 (and ((_ is Intermediate!5665) lt!261495) (undefined!6477 lt!261495)))))

(assert (=> d!84647 (= lt!261495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84647 (validMask!0 mask!3119)))

(assert (=> d!84647 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!261494)))

(assert (= (and d!84647 c!65547) b!572923))

(assert (= (and d!84647 (not c!65547)) b!572920))

(assert (= (and b!572920 c!65546) b!572921))

(assert (= (and b!572920 (not c!65546)) b!572919))

(assert (= (and b!572919 c!65545) b!572918))

(assert (= (and b!572919 (not c!65545)) b!572922))

(declare-fun m!551483 () Bool)

(assert (=> b!572920 m!551483))

(declare-fun m!551485 () Bool)

(assert (=> b!572922 m!551485))

(assert (=> d!84647 m!551347))

(declare-fun m!551487 () Bool)

(assert (=> d!84647 m!551487))

(declare-fun m!551489 () Bool)

(assert (=> d!84647 m!551489))

(assert (=> d!84647 m!551487))

(declare-fun m!551491 () Bool)

(assert (=> d!84647 m!551491))

(declare-fun m!551493 () Bool)

(assert (=> d!84647 m!551493))

(declare-fun m!551495 () Bool)

(assert (=> d!84647 m!551495))

(assert (=> b!572787 d!84647))

(declare-fun b!572972 () Bool)

(declare-fun lt!261515 () SeekEntryResult!5665)

(assert (=> b!572972 (and (bvsge (index!24889 lt!261515) #b00000000000000000000000000000000) (bvslt (index!24889 lt!261515) (size!17584 lt!261425)))))

(declare-fun res!362550 () Bool)

(assert (=> b!572972 (= res!362550 (= (select (arr!17219 lt!261425) (index!24889 lt!261515)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329600 () Bool)

(assert (=> b!572972 (=> res!362550 e!329600)))

(declare-fun b!572973 () Bool)

(assert (=> b!572973 (and (bvsge (index!24889 lt!261515) #b00000000000000000000000000000000) (bvslt (index!24889 lt!261515) (size!17584 lt!261425)))))

(assert (=> b!572973 (= e!329600 (= (select (arr!17219 lt!261425) (index!24889 lt!261515)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!572974 () Bool)

(declare-fun e!329601 () Bool)

(declare-fun e!329597 () Bool)

(assert (=> b!572974 (= e!329601 e!329597)))

(declare-fun res!362552 () Bool)

(assert (=> b!572974 (= res!362552 (and ((_ is Intermediate!5665) lt!261515) (not (undefined!6477 lt!261515)) (bvslt (x!53761 lt!261515) #b01111111111111111111111111111110) (bvsge (x!53761 lt!261515) #b00000000000000000000000000000000) (bvsge (x!53761 lt!261515) #b00000000000000000000000000000000)))))

(assert (=> b!572974 (=> (not res!362552) (not e!329597))))

(declare-fun b!572975 () Bool)

(declare-fun e!329599 () SeekEntryResult!5665)

(declare-fun e!329598 () SeekEntryResult!5665)

(assert (=> b!572975 (= e!329599 e!329598)))

(declare-fun c!65569 () Bool)

(declare-fun lt!261514 () (_ BitVec 64))

(assert (=> b!572975 (= c!65569 (or (= lt!261514 lt!261429) (= (bvadd lt!261514 lt!261514) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!572976 () Bool)

(assert (=> b!572976 (and (bvsge (index!24889 lt!261515) #b00000000000000000000000000000000) (bvslt (index!24889 lt!261515) (size!17584 lt!261425)))))

(declare-fun res!362551 () Bool)

(assert (=> b!572976 (= res!362551 (= (select (arr!17219 lt!261425) (index!24889 lt!261515)) lt!261429))))

(assert (=> b!572976 (=> res!362551 e!329600)))

(assert (=> b!572976 (= e!329597 e!329600)))

(declare-fun d!84659 () Bool)

(assert (=> d!84659 e!329601))

(declare-fun c!65570 () Bool)

(assert (=> d!84659 (= c!65570 (and ((_ is Intermediate!5665) lt!261515) (undefined!6477 lt!261515)))))

(assert (=> d!84659 (= lt!261515 e!329599)))

(declare-fun c!65571 () Bool)

(assert (=> d!84659 (= c!65571 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84659 (= lt!261514 (select (arr!17219 lt!261425) lt!261430))))

(assert (=> d!84659 (validMask!0 mask!3119)))

(assert (=> d!84659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261430 lt!261429 lt!261425 mask!3119) lt!261515)))

(declare-fun b!572977 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572977 (= e!329598 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261430 #b00000000000000000000000000000000 mask!3119) lt!261429 lt!261425 mask!3119))))

(declare-fun b!572978 () Bool)

(assert (=> b!572978 (= e!329599 (Intermediate!5665 true lt!261430 #b00000000000000000000000000000000))))

(declare-fun b!572979 () Bool)

(assert (=> b!572979 (= e!329598 (Intermediate!5665 false lt!261430 #b00000000000000000000000000000000))))

(declare-fun b!572980 () Bool)

(assert (=> b!572980 (= e!329601 (bvsge (x!53761 lt!261515) #b01111111111111111111111111111110))))

(assert (= (and d!84659 c!65571) b!572978))

(assert (= (and d!84659 (not c!65571)) b!572975))

(assert (= (and b!572975 c!65569) b!572979))

(assert (= (and b!572975 (not c!65569)) b!572977))

(assert (= (and d!84659 c!65570) b!572980))

(assert (= (and d!84659 (not c!65570)) b!572974))

(assert (= (and b!572974 res!362552) b!572976))

(assert (= (and b!572976 (not res!362551)) b!572972))

(assert (= (and b!572972 (not res!362550)) b!572973))

(declare-fun m!551509 () Bool)

(assert (=> b!572976 m!551509))

(assert (=> b!572973 m!551509))

(assert (=> b!572972 m!551509))

(declare-fun m!551511 () Bool)

(assert (=> b!572977 m!551511))

(assert (=> b!572977 m!551511))

(declare-fun m!551513 () Bool)

(assert (=> b!572977 m!551513))

(declare-fun m!551515 () Bool)

(assert (=> d!84659 m!551515))

(assert (=> d!84659 m!551347))

(assert (=> b!572781 d!84659))

(declare-fun b!572987 () Bool)

(declare-fun lt!261519 () SeekEntryResult!5665)

(assert (=> b!572987 (and (bvsge (index!24889 lt!261519) #b00000000000000000000000000000000) (bvslt (index!24889 lt!261519) (size!17584 a!3118)))))

(declare-fun res!362553 () Bool)

(assert (=> b!572987 (= res!362553 (= (select (arr!17219 a!3118) (index!24889 lt!261519)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329608 () Bool)

(assert (=> b!572987 (=> res!362553 e!329608)))

(declare-fun b!572988 () Bool)

(assert (=> b!572988 (and (bvsge (index!24889 lt!261519) #b00000000000000000000000000000000) (bvslt (index!24889 lt!261519) (size!17584 a!3118)))))

(assert (=> b!572988 (= e!329608 (= (select (arr!17219 a!3118) (index!24889 lt!261519)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!572989 () Bool)

(declare-fun e!329609 () Bool)

(declare-fun e!329605 () Bool)

(assert (=> b!572989 (= e!329609 e!329605)))

(declare-fun res!362555 () Bool)

(assert (=> b!572989 (= res!362555 (and ((_ is Intermediate!5665) lt!261519) (not (undefined!6477 lt!261519)) (bvslt (x!53761 lt!261519) #b01111111111111111111111111111110) (bvsge (x!53761 lt!261519) #b00000000000000000000000000000000) (bvsge (x!53761 lt!261519) #b00000000000000000000000000000000)))))

(assert (=> b!572989 (=> (not res!362555) (not e!329605))))

(declare-fun b!572990 () Bool)

(declare-fun e!329607 () SeekEntryResult!5665)

(declare-fun e!329606 () SeekEntryResult!5665)

(assert (=> b!572990 (= e!329607 e!329606)))

(declare-fun lt!261518 () (_ BitVec 64))

(declare-fun c!65575 () Bool)

(assert (=> b!572990 (= c!65575 (or (= lt!261518 (select (arr!17219 a!3118) j!142)) (= (bvadd lt!261518 lt!261518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!572991 () Bool)

(assert (=> b!572991 (and (bvsge (index!24889 lt!261519) #b00000000000000000000000000000000) (bvslt (index!24889 lt!261519) (size!17584 a!3118)))))

(declare-fun res!362554 () Bool)

(assert (=> b!572991 (= res!362554 (= (select (arr!17219 a!3118) (index!24889 lt!261519)) (select (arr!17219 a!3118) j!142)))))

(assert (=> b!572991 (=> res!362554 e!329608)))

(assert (=> b!572991 (= e!329605 e!329608)))

(declare-fun d!84663 () Bool)

(assert (=> d!84663 e!329609))

(declare-fun c!65576 () Bool)

(assert (=> d!84663 (= c!65576 (and ((_ is Intermediate!5665) lt!261519) (undefined!6477 lt!261519)))))

(assert (=> d!84663 (= lt!261519 e!329607)))

(declare-fun c!65577 () Bool)

(assert (=> d!84663 (= c!65577 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84663 (= lt!261518 (select (arr!17219 a!3118) lt!261428))))

(assert (=> d!84663 (validMask!0 mask!3119)))

(assert (=> d!84663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261428 (select (arr!17219 a!3118) j!142) a!3118 mask!3119) lt!261519)))

(declare-fun b!572992 () Bool)

(assert (=> b!572992 (= e!329606 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261428 #b00000000000000000000000000000000 mask!3119) (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!572993 () Bool)

(assert (=> b!572993 (= e!329607 (Intermediate!5665 true lt!261428 #b00000000000000000000000000000000))))

(declare-fun b!572994 () Bool)

(assert (=> b!572994 (= e!329606 (Intermediate!5665 false lt!261428 #b00000000000000000000000000000000))))

(declare-fun b!572995 () Bool)

(assert (=> b!572995 (= e!329609 (bvsge (x!53761 lt!261519) #b01111111111111111111111111111110))))

(assert (= (and d!84663 c!65577) b!572993))

(assert (= (and d!84663 (not c!65577)) b!572990))

(assert (= (and b!572990 c!65575) b!572994))

(assert (= (and b!572990 (not c!65575)) b!572992))

(assert (= (and d!84663 c!65576) b!572995))

(assert (= (and d!84663 (not c!65576)) b!572989))

(assert (= (and b!572989 res!362555) b!572991))

(assert (= (and b!572991 (not res!362554)) b!572987))

(assert (= (and b!572987 (not res!362553)) b!572988))

(declare-fun m!551519 () Bool)

(assert (=> b!572991 m!551519))

(assert (=> b!572988 m!551519))

(assert (=> b!572987 m!551519))

(declare-fun m!551525 () Bool)

(assert (=> b!572992 m!551525))

(assert (=> b!572992 m!551525))

(assert (=> b!572992 m!551333))

(declare-fun m!551529 () Bool)

(assert (=> b!572992 m!551529))

(declare-fun m!551531 () Bool)

(assert (=> d!84663 m!551531))

(assert (=> d!84663 m!551347))

(assert (=> b!572781 d!84663))

(declare-fun d!84667 () Bool)

(declare-fun lt!261525 () (_ BitVec 32))

(declare-fun lt!261524 () (_ BitVec 32))

(assert (=> d!84667 (= lt!261525 (bvmul (bvxor lt!261524 (bvlshr lt!261524 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84667 (= lt!261524 ((_ extract 31 0) (bvand (bvxor lt!261429 (bvlshr lt!261429 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84667 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362556 (let ((h!12364 ((_ extract 31 0) (bvand (bvxor lt!261429 (bvlshr lt!261429 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53766 (bvmul (bvxor h!12364 (bvlshr h!12364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53766 (bvlshr x!53766 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362556 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362556 #b00000000000000000000000000000000))))))

(assert (=> d!84667 (= (toIndex!0 lt!261429 mask!3119) (bvand (bvxor lt!261525 (bvlshr lt!261525 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!572781 d!84667))

(declare-fun d!84671 () Bool)

(declare-fun lt!261527 () (_ BitVec 32))

(declare-fun lt!261526 () (_ BitVec 32))

(assert (=> d!84671 (= lt!261527 (bvmul (bvxor lt!261526 (bvlshr lt!261526 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84671 (= lt!261526 ((_ extract 31 0) (bvand (bvxor (select (arr!17219 a!3118) j!142) (bvlshr (select (arr!17219 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84671 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362556 (let ((h!12364 ((_ extract 31 0) (bvand (bvxor (select (arr!17219 a!3118) j!142) (bvlshr (select (arr!17219 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53766 (bvmul (bvxor h!12364 (bvlshr h!12364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53766 (bvlshr x!53766 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362556 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362556 #b00000000000000000000000000000000))))))

(assert (=> d!84671 (= (toIndex!0 (select (arr!17219 a!3118) j!142) mask!3119) (bvand (bvxor lt!261527 (bvlshr lt!261527 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!572781 d!84671))

(declare-fun d!84673 () Bool)

(assert (=> d!84673 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!572786 d!84673))

(declare-fun b!572998 () Bool)

(declare-fun e!329610 () SeekEntryResult!5665)

(declare-fun lt!261533 () SeekEntryResult!5665)

(assert (=> b!572998 (= e!329610 (MissingZero!5665 (index!24889 lt!261533)))))

(declare-fun b!573000 () Bool)

(declare-fun e!329612 () SeekEntryResult!5665)

(declare-fun e!329611 () SeekEntryResult!5665)

(assert (=> b!573000 (= e!329612 e!329611)))

(declare-fun lt!261534 () (_ BitVec 64))

(assert (=> b!573000 (= lt!261534 (select (arr!17219 lt!261425) (index!24889 lt!261533)))))

(declare-fun c!65579 () Bool)

(assert (=> b!573000 (= c!65579 (= lt!261534 lt!261429))))

(declare-fun b!573001 () Bool)

(assert (=> b!573001 (= e!329611 (Found!5665 (index!24889 lt!261533)))))

(declare-fun b!573002 () Bool)

(assert (=> b!573002 (= e!329610 (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261533) (index!24889 lt!261533) (index!24889 lt!261533) lt!261429 lt!261425 mask!3119))))

(declare-fun b!573003 () Bool)

(assert (=> b!573003 (= e!329612 Undefined!5665)))

(declare-fun b!572999 () Bool)

(declare-fun c!65578 () Bool)

(assert (=> b!572999 (= c!65578 (= lt!261534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!572999 (= e!329611 e!329610)))

(declare-fun d!84675 () Bool)

(declare-fun lt!261532 () SeekEntryResult!5665)

(assert (=> d!84675 (and (or ((_ is Undefined!5665) lt!261532) (not ((_ is Found!5665) lt!261532)) (and (bvsge (index!24888 lt!261532) #b00000000000000000000000000000000) (bvslt (index!24888 lt!261532) (size!17584 lt!261425)))) (or ((_ is Undefined!5665) lt!261532) ((_ is Found!5665) lt!261532) (not ((_ is MissingZero!5665) lt!261532)) (and (bvsge (index!24887 lt!261532) #b00000000000000000000000000000000) (bvslt (index!24887 lt!261532) (size!17584 lt!261425)))) (or ((_ is Undefined!5665) lt!261532) ((_ is Found!5665) lt!261532) ((_ is MissingZero!5665) lt!261532) (not ((_ is MissingVacant!5665) lt!261532)) (and (bvsge (index!24890 lt!261532) #b00000000000000000000000000000000) (bvslt (index!24890 lt!261532) (size!17584 lt!261425)))) (or ((_ is Undefined!5665) lt!261532) (ite ((_ is Found!5665) lt!261532) (= (select (arr!17219 lt!261425) (index!24888 lt!261532)) lt!261429) (ite ((_ is MissingZero!5665) lt!261532) (= (select (arr!17219 lt!261425) (index!24887 lt!261532)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5665) lt!261532) (= (select (arr!17219 lt!261425) (index!24890 lt!261532)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84675 (= lt!261532 e!329612)))

(declare-fun c!65580 () Bool)

(assert (=> d!84675 (= c!65580 (and ((_ is Intermediate!5665) lt!261533) (undefined!6477 lt!261533)))))

(assert (=> d!84675 (= lt!261533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261429 mask!3119) lt!261429 lt!261425 mask!3119))))

(assert (=> d!84675 (validMask!0 mask!3119)))

(assert (=> d!84675 (= (seekEntryOrOpen!0 lt!261429 lt!261425 mask!3119) lt!261532)))

(assert (= (and d!84675 c!65580) b!573003))

(assert (= (and d!84675 (not c!65580)) b!573000))

(assert (= (and b!573000 c!65579) b!573001))

(assert (= (and b!573000 (not c!65579)) b!572999))

(assert (= (and b!572999 c!65578) b!572998))

(assert (= (and b!572999 (not c!65578)) b!573002))

(declare-fun m!551533 () Bool)

(assert (=> b!573000 m!551533))

(declare-fun m!551535 () Bool)

(assert (=> b!573002 m!551535))

(assert (=> d!84675 m!551347))

(assert (=> d!84675 m!551367))

(declare-fun m!551537 () Bool)

(assert (=> d!84675 m!551537))

(assert (=> d!84675 m!551367))

(declare-fun m!551539 () Bool)

(assert (=> d!84675 m!551539))

(declare-fun m!551541 () Bool)

(assert (=> d!84675 m!551541))

(declare-fun m!551543 () Bool)

(assert (=> d!84675 m!551543))

(assert (=> b!572791 d!84675))

(declare-fun e!329641 () SeekEntryResult!5665)

(declare-fun b!573050 () Bool)

(assert (=> b!573050 (= e!329641 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53761 lt!261431) #b00000000000000000000000000000001) (nextIndex!0 (index!24889 lt!261431) (x!53761 lt!261431) mask!3119) (index!24889 lt!261431) lt!261429 lt!261425 mask!3119))))

(declare-fun b!573051 () Bool)

(declare-fun e!329642 () SeekEntryResult!5665)

(declare-fun e!329640 () SeekEntryResult!5665)

(assert (=> b!573051 (= e!329642 e!329640)))

(declare-fun c!65602 () Bool)

(declare-fun lt!261552 () (_ BitVec 64))

(assert (=> b!573051 (= c!65602 (= lt!261552 lt!261429))))

(declare-fun b!573052 () Bool)

(assert (=> b!573052 (= e!329641 (MissingVacant!5665 (index!24889 lt!261431)))))

(declare-fun lt!261553 () SeekEntryResult!5665)

(declare-fun d!84677 () Bool)

(assert (=> d!84677 (and (or ((_ is Undefined!5665) lt!261553) (not ((_ is Found!5665) lt!261553)) (and (bvsge (index!24888 lt!261553) #b00000000000000000000000000000000) (bvslt (index!24888 lt!261553) (size!17584 lt!261425)))) (or ((_ is Undefined!5665) lt!261553) ((_ is Found!5665) lt!261553) (not ((_ is MissingVacant!5665) lt!261553)) (not (= (index!24890 lt!261553) (index!24889 lt!261431))) (and (bvsge (index!24890 lt!261553) #b00000000000000000000000000000000) (bvslt (index!24890 lt!261553) (size!17584 lt!261425)))) (or ((_ is Undefined!5665) lt!261553) (ite ((_ is Found!5665) lt!261553) (= (select (arr!17219 lt!261425) (index!24888 lt!261553)) lt!261429) (and ((_ is MissingVacant!5665) lt!261553) (= (index!24890 lt!261553) (index!24889 lt!261431)) (= (select (arr!17219 lt!261425) (index!24890 lt!261553)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84677 (= lt!261553 e!329642)))

(declare-fun c!65603 () Bool)

(assert (=> d!84677 (= c!65603 (bvsge (x!53761 lt!261431) #b01111111111111111111111111111110))))

(assert (=> d!84677 (= lt!261552 (select (arr!17219 lt!261425) (index!24889 lt!261431)))))

(assert (=> d!84677 (validMask!0 mask!3119)))

(assert (=> d!84677 (= (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261431) (index!24889 lt!261431) (index!24889 lt!261431) lt!261429 lt!261425 mask!3119) lt!261553)))

(declare-fun b!573053 () Bool)

(declare-fun c!65604 () Bool)

(assert (=> b!573053 (= c!65604 (= lt!261552 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573053 (= e!329640 e!329641)))

(declare-fun b!573054 () Bool)

(assert (=> b!573054 (= e!329640 (Found!5665 (index!24889 lt!261431)))))

(declare-fun b!573055 () Bool)

(assert (=> b!573055 (= e!329642 Undefined!5665)))

(assert (= (and d!84677 c!65603) b!573055))

(assert (= (and d!84677 (not c!65603)) b!573051))

(assert (= (and b!573051 c!65602) b!573054))

(assert (= (and b!573051 (not c!65602)) b!573053))

(assert (= (and b!573053 c!65604) b!573052))

(assert (= (and b!573053 (not c!65604)) b!573050))

(declare-fun m!551573 () Bool)

(assert (=> b!573050 m!551573))

(assert (=> b!573050 m!551573))

(declare-fun m!551575 () Bool)

(assert (=> b!573050 m!551575))

(declare-fun m!551577 () Bool)

(assert (=> d!84677 m!551577))

(declare-fun m!551579 () Bool)

(assert (=> d!84677 m!551579))

(declare-fun m!551581 () Bool)

(assert (=> d!84677 m!551581))

(assert (=> d!84677 m!551347))

(assert (=> b!572791 d!84677))

(declare-fun d!84687 () Bool)

(declare-fun res!362567 () Bool)

(declare-fun e!329647 () Bool)

(assert (=> d!84687 (=> res!362567 e!329647)))

(assert (=> d!84687 (= res!362567 (= (select (arr!17219 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84687 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!329647)))

(declare-fun b!573060 () Bool)

(declare-fun e!329648 () Bool)

(assert (=> b!573060 (= e!329647 e!329648)))

(declare-fun res!362568 () Bool)

(assert (=> b!573060 (=> (not res!362568) (not e!329648))))

(assert (=> b!573060 (= res!362568 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17584 a!3118)))))

(declare-fun b!573061 () Bool)

(assert (=> b!573061 (= e!329648 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84687 (not res!362567)) b!573060))

(assert (= (and b!573060 res!362568) b!573061))

(assert (=> d!84687 m!551465))

(declare-fun m!551583 () Bool)

(assert (=> b!573061 m!551583))

(assert (=> b!572785 d!84687))

(declare-fun b!573062 () Bool)

(declare-fun e!329650 () SeekEntryResult!5665)

(assert (=> b!573062 (= e!329650 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53761 lt!261431) #b00000000000000000000000000000001) (nextIndex!0 (index!24889 lt!261431) (x!53761 lt!261431) mask!3119) (index!24889 lt!261431) (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573063 () Bool)

(declare-fun e!329651 () SeekEntryResult!5665)

(declare-fun e!329649 () SeekEntryResult!5665)

(assert (=> b!573063 (= e!329651 e!329649)))

(declare-fun c!65605 () Bool)

(declare-fun lt!261554 () (_ BitVec 64))

(assert (=> b!573063 (= c!65605 (= lt!261554 (select (arr!17219 a!3118) j!142)))))

(declare-fun b!573064 () Bool)

(assert (=> b!573064 (= e!329650 (MissingVacant!5665 (index!24889 lt!261431)))))

(declare-fun d!84693 () Bool)

(declare-fun lt!261555 () SeekEntryResult!5665)

(assert (=> d!84693 (and (or ((_ is Undefined!5665) lt!261555) (not ((_ is Found!5665) lt!261555)) (and (bvsge (index!24888 lt!261555) #b00000000000000000000000000000000) (bvslt (index!24888 lt!261555) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261555) ((_ is Found!5665) lt!261555) (not ((_ is MissingVacant!5665) lt!261555)) (not (= (index!24890 lt!261555) (index!24889 lt!261431))) (and (bvsge (index!24890 lt!261555) #b00000000000000000000000000000000) (bvslt (index!24890 lt!261555) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261555) (ite ((_ is Found!5665) lt!261555) (= (select (arr!17219 a!3118) (index!24888 lt!261555)) (select (arr!17219 a!3118) j!142)) (and ((_ is MissingVacant!5665) lt!261555) (= (index!24890 lt!261555) (index!24889 lt!261431)) (= (select (arr!17219 a!3118) (index!24890 lt!261555)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84693 (= lt!261555 e!329651)))

(declare-fun c!65606 () Bool)

(assert (=> d!84693 (= c!65606 (bvsge (x!53761 lt!261431) #b01111111111111111111111111111110))))

(assert (=> d!84693 (= lt!261554 (select (arr!17219 a!3118) (index!24889 lt!261431)))))

(assert (=> d!84693 (validMask!0 mask!3119)))

(assert (=> d!84693 (= (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261431) (index!24889 lt!261431) (index!24889 lt!261431) (select (arr!17219 a!3118) j!142) a!3118 mask!3119) lt!261555)))

(declare-fun b!573065 () Bool)

(declare-fun c!65607 () Bool)

(assert (=> b!573065 (= c!65607 (= lt!261554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573065 (= e!329649 e!329650)))

(declare-fun b!573066 () Bool)

(assert (=> b!573066 (= e!329649 (Found!5665 (index!24889 lt!261431)))))

(declare-fun b!573067 () Bool)

(assert (=> b!573067 (= e!329651 Undefined!5665)))

(assert (= (and d!84693 c!65606) b!573067))

(assert (= (and d!84693 (not c!65606)) b!573063))

(assert (= (and b!573063 c!65605) b!573066))

(assert (= (and b!573063 (not c!65605)) b!573065))

(assert (= (and b!573065 c!65607) b!573064))

(assert (= (and b!573065 (not c!65607)) b!573062))

(assert (=> b!573062 m!551573))

(assert (=> b!573062 m!551573))

(assert (=> b!573062 m!551333))

(declare-fun m!551585 () Bool)

(assert (=> b!573062 m!551585))

(declare-fun m!551587 () Bool)

(assert (=> d!84693 m!551587))

(declare-fun m!551589 () Bool)

(assert (=> d!84693 m!551589))

(assert (=> d!84693 m!551335))

(assert (=> d!84693 m!551347))

(assert (=> b!572790 d!84693))

(declare-fun b!573094 () Bool)

(declare-fun e!329670 () Bool)

(declare-fun e!329672 () Bool)

(assert (=> b!573094 (= e!329670 e!329672)))

(declare-fun lt!261574 () (_ BitVec 64))

(assert (=> b!573094 (= lt!261574 (select (arr!17219 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!261576 () Unit!18018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35860 (_ BitVec 64) (_ BitVec 32)) Unit!18018)

(assert (=> b!573094 (= lt!261576 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261574 #b00000000000000000000000000000000))))

(assert (=> b!573094 (arrayContainsKey!0 a!3118 lt!261574 #b00000000000000000000000000000000)))

(declare-fun lt!261575 () Unit!18018)

(assert (=> b!573094 (= lt!261575 lt!261576)))

(declare-fun res!362579 () Bool)

(assert (=> b!573094 (= res!362579 (= (seekEntryOrOpen!0 (select (arr!17219 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5665 #b00000000000000000000000000000000)))))

(assert (=> b!573094 (=> (not res!362579) (not e!329672))))

(declare-fun d!84697 () Bool)

(declare-fun res!362580 () Bool)

(declare-fun e!329671 () Bool)

(assert (=> d!84697 (=> res!362580 e!329671)))

(assert (=> d!84697 (= res!362580 (bvsge #b00000000000000000000000000000000 (size!17584 a!3118)))))

(assert (=> d!84697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!329671)))

(declare-fun b!573095 () Bool)

(assert (=> b!573095 (= e!329671 e!329670)))

(declare-fun c!65616 () Bool)

(assert (=> b!573095 (= c!65616 (validKeyInArray!0 (select (arr!17219 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32611 () Bool)

(declare-fun call!32614 () Bool)

(assert (=> bm!32611 (= call!32614 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573096 () Bool)

(assert (=> b!573096 (= e!329672 call!32614)))

(declare-fun b!573097 () Bool)

(assert (=> b!573097 (= e!329670 call!32614)))

(assert (= (and d!84697 (not res!362580)) b!573095))

(assert (= (and b!573095 c!65616) b!573094))

(assert (= (and b!573095 (not c!65616)) b!573097))

(assert (= (and b!573094 res!362579) b!573096))

(assert (= (or b!573096 b!573097) bm!32611))

(assert (=> b!573094 m!551465))

(declare-fun m!551613 () Bool)

(assert (=> b!573094 m!551613))

(declare-fun m!551615 () Bool)

(assert (=> b!573094 m!551615))

(assert (=> b!573094 m!551465))

(declare-fun m!551617 () Bool)

(assert (=> b!573094 m!551617))

(assert (=> b!573095 m!551465))

(assert (=> b!573095 m!551465))

(assert (=> b!573095 m!551469))

(declare-fun m!551619 () Bool)

(assert (=> bm!32611 m!551619))

(assert (=> b!572779 d!84697))

(declare-fun d!84705 () Bool)

(assert (=> d!84705 (= (validKeyInArray!0 (select (arr!17219 a!3118) j!142)) (and (not (= (select (arr!17219 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17219 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!572784 d!84705))

(declare-fun b!573098 () Bool)

(declare-fun e!329673 () SeekEntryResult!5665)

(declare-fun lt!261578 () SeekEntryResult!5665)

(assert (=> b!573098 (= e!329673 (MissingZero!5665 (index!24889 lt!261578)))))

(declare-fun b!573100 () Bool)

(declare-fun e!329675 () SeekEntryResult!5665)

(declare-fun e!329674 () SeekEntryResult!5665)

(assert (=> b!573100 (= e!329675 e!329674)))

(declare-fun lt!261579 () (_ BitVec 64))

(assert (=> b!573100 (= lt!261579 (select (arr!17219 a!3118) (index!24889 lt!261578)))))

(declare-fun c!65618 () Bool)

(assert (=> b!573100 (= c!65618 (= lt!261579 (select (arr!17219 a!3118) j!142)))))

(declare-fun b!573101 () Bool)

(assert (=> b!573101 (= e!329674 (Found!5665 (index!24889 lt!261578)))))

(declare-fun b!573102 () Bool)

(assert (=> b!573102 (= e!329673 (seekKeyOrZeroReturnVacant!0 (x!53761 lt!261578) (index!24889 lt!261578) (index!24889 lt!261578) (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573103 () Bool)

(assert (=> b!573103 (= e!329675 Undefined!5665)))

(declare-fun b!573099 () Bool)

(declare-fun c!65617 () Bool)

(assert (=> b!573099 (= c!65617 (= lt!261579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573099 (= e!329674 e!329673)))

(declare-fun d!84707 () Bool)

(declare-fun lt!261577 () SeekEntryResult!5665)

(assert (=> d!84707 (and (or ((_ is Undefined!5665) lt!261577) (not ((_ is Found!5665) lt!261577)) (and (bvsge (index!24888 lt!261577) #b00000000000000000000000000000000) (bvslt (index!24888 lt!261577) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261577) ((_ is Found!5665) lt!261577) (not ((_ is MissingZero!5665) lt!261577)) (and (bvsge (index!24887 lt!261577) #b00000000000000000000000000000000) (bvslt (index!24887 lt!261577) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261577) ((_ is Found!5665) lt!261577) ((_ is MissingZero!5665) lt!261577) (not ((_ is MissingVacant!5665) lt!261577)) (and (bvsge (index!24890 lt!261577) #b00000000000000000000000000000000) (bvslt (index!24890 lt!261577) (size!17584 a!3118)))) (or ((_ is Undefined!5665) lt!261577) (ite ((_ is Found!5665) lt!261577) (= (select (arr!17219 a!3118) (index!24888 lt!261577)) (select (arr!17219 a!3118) j!142)) (ite ((_ is MissingZero!5665) lt!261577) (= (select (arr!17219 a!3118) (index!24887 lt!261577)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5665) lt!261577) (= (select (arr!17219 a!3118) (index!24890 lt!261577)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84707 (= lt!261577 e!329675)))

(declare-fun c!65619 () Bool)

(assert (=> d!84707 (= c!65619 (and ((_ is Intermediate!5665) lt!261578) (undefined!6477 lt!261578)))))

(assert (=> d!84707 (= lt!261578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17219 a!3118) j!142) mask!3119) (select (arr!17219 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84707 (validMask!0 mask!3119)))

(assert (=> d!84707 (= (seekEntryOrOpen!0 (select (arr!17219 a!3118) j!142) a!3118 mask!3119) lt!261577)))

(assert (= (and d!84707 c!65619) b!573103))

(assert (= (and d!84707 (not c!65619)) b!573100))

(assert (= (and b!573100 c!65618) b!573101))

(assert (= (and b!573100 (not c!65618)) b!573099))

(assert (= (and b!573099 c!65617) b!573098))

(assert (= (and b!573099 (not c!65617)) b!573102))

(declare-fun m!551621 () Bool)

(assert (=> b!573100 m!551621))

(assert (=> b!573102 m!551333))

(declare-fun m!551623 () Bool)

(assert (=> b!573102 m!551623))

(assert (=> d!84707 m!551347))

(assert (=> d!84707 m!551333))

(assert (=> d!84707 m!551361))

(declare-fun m!551625 () Bool)

(assert (=> d!84707 m!551625))

(assert (=> d!84707 m!551361))

(assert (=> d!84707 m!551333))

(declare-fun m!551627 () Bool)

(assert (=> d!84707 m!551627))

(declare-fun m!551629 () Bool)

(assert (=> d!84707 m!551629))

(declare-fun m!551631 () Bool)

(assert (=> d!84707 m!551631))

(assert (=> b!572789 d!84707))

(declare-fun b!573104 () Bool)

(declare-fun e!329676 () Bool)

(declare-fun e!329678 () Bool)

(assert (=> b!573104 (= e!329676 e!329678)))

(declare-fun lt!261580 () (_ BitVec 64))

(assert (=> b!573104 (= lt!261580 (select (arr!17219 a!3118) j!142))))

(declare-fun lt!261582 () Unit!18018)

(assert (=> b!573104 (= lt!261582 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261580 j!142))))

(assert (=> b!573104 (arrayContainsKey!0 a!3118 lt!261580 #b00000000000000000000000000000000)))

(declare-fun lt!261581 () Unit!18018)

(assert (=> b!573104 (= lt!261581 lt!261582)))

(declare-fun res!362581 () Bool)

(assert (=> b!573104 (= res!362581 (= (seekEntryOrOpen!0 (select (arr!17219 a!3118) j!142) a!3118 mask!3119) (Found!5665 j!142)))))

(assert (=> b!573104 (=> (not res!362581) (not e!329678))))

(declare-fun d!84709 () Bool)

(declare-fun res!362582 () Bool)

(declare-fun e!329677 () Bool)

(assert (=> d!84709 (=> res!362582 e!329677)))

(assert (=> d!84709 (= res!362582 (bvsge j!142 (size!17584 a!3118)))))

(assert (=> d!84709 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!329677)))

(declare-fun b!573105 () Bool)

(assert (=> b!573105 (= e!329677 e!329676)))

(declare-fun c!65620 () Bool)

(assert (=> b!573105 (= c!65620 (validKeyInArray!0 (select (arr!17219 a!3118) j!142)))))

(declare-fun bm!32612 () Bool)

(declare-fun call!32615 () Bool)

(assert (=> bm!32612 (= call!32615 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573106 () Bool)

(assert (=> b!573106 (= e!329678 call!32615)))

(declare-fun b!573107 () Bool)

(assert (=> b!573107 (= e!329676 call!32615)))

(assert (= (and d!84709 (not res!362582)) b!573105))

(assert (= (and b!573105 c!65620) b!573104))

(assert (= (and b!573105 (not c!65620)) b!573107))

(assert (= (and b!573104 res!362581) b!573106))

(assert (= (or b!573106 b!573107) bm!32612))

(assert (=> b!573104 m!551333))

(declare-fun m!551633 () Bool)

(assert (=> b!573104 m!551633))

(declare-fun m!551635 () Bool)

(assert (=> b!573104 m!551635))

(assert (=> b!573104 m!551333))

(assert (=> b!573104 m!551359))

(assert (=> b!573105 m!551333))

(assert (=> b!573105 m!551333))

(assert (=> b!573105 m!551337))

(declare-fun m!551637 () Bool)

(assert (=> bm!32612 m!551637))

(assert (=> b!572789 d!84709))

(declare-fun d!84711 () Bool)

(assert (=> d!84711 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!261585 () Unit!18018)

(declare-fun choose!38 (array!35860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18018)

(assert (=> d!84711 (= lt!261585 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84711 (validMask!0 mask!3119)))

(assert (=> d!84711 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!261585)))

(declare-fun bs!17725 () Bool)

(assert (= bs!17725 d!84711))

(assert (=> bs!17725 m!551355))

(declare-fun m!551639 () Bool)

(assert (=> bs!17725 m!551639))

(assert (=> bs!17725 m!551347))

(assert (=> b!572789 d!84711))

(check-sat (not b!572881) (not d!84647) (not b!573061) (not d!84663) (not d!84675) (not b!573050) (not d!84707) (not b!573094) (not b!573095) (not b!572992) (not bm!32611) (not b!572922) (not d!84693) (not bm!32599) (not b!572884) (not b!573062) (not d!84677) (not d!84659) (not b!573102) (not b!572883) (not b!573002) (not b!573105) (not d!84711) (not b!572977) (not bm!32612) (not b!573104))
(check-sat)
