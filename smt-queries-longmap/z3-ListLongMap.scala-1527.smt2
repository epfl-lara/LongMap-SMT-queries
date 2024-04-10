; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28790 () Bool)

(assert start!28790)

(declare-fun b!293703 () Bool)

(declare-fun res!154480 () Bool)

(declare-fun e!185705 () Bool)

(assert (=> b!293703 (=> (not res!154480) (not e!185705))))

(declare-datatypes ((array!14879 0))(
  ( (array!14880 (arr!7059 (Array (_ BitVec 32) (_ BitVec 64))) (size!7411 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14879)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293703 (= res!154480 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293704 () Bool)

(declare-fun e!185704 () Bool)

(assert (=> b!293704 (= e!185705 e!185704)))

(declare-fun res!154481 () Bool)

(assert (=> b!293704 (=> (not res!154481) (not e!185704))))

(declare-fun lt!145596 () Bool)

(declare-datatypes ((SeekEntryResult!2208 0))(
  ( (MissingZero!2208 (index!11002 (_ BitVec 32))) (Found!2208 (index!11003 (_ BitVec 32))) (Intermediate!2208 (undefined!3020 Bool) (index!11004 (_ BitVec 32)) (x!29187 (_ BitVec 32))) (Undefined!2208) (MissingVacant!2208 (index!11005 (_ BitVec 32))) )
))
(declare-fun lt!145597 () SeekEntryResult!2208)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293704 (= res!154481 (or lt!145596 (= lt!145597 (MissingVacant!2208 i!1256))))))

(assert (=> b!293704 (= lt!145596 (= lt!145597 (MissingZero!2208 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14879 (_ BitVec 32)) SeekEntryResult!2208)

(assert (=> b!293704 (= lt!145597 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!154482 () Bool)

(assert (=> start!28790 (=> (not res!154482) (not e!185705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28790 (= res!154482 (validMask!0 mask!3809))))

(assert (=> start!28790 e!185705))

(assert (=> start!28790 true))

(declare-fun array_inv!5022 (array!14879) Bool)

(assert (=> start!28790 (array_inv!5022 a!3312)))

(declare-fun b!293705 () Bool)

(declare-fun res!154477 () Bool)

(assert (=> b!293705 (=> (not res!154477) (not e!185705))))

(assert (=> b!293705 (= res!154477 (and (= (size!7411 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7411 a!3312))))))

(declare-fun b!293706 () Bool)

(declare-fun res!154478 () Bool)

(assert (=> b!293706 (=> (not res!154478) (not e!185704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14879 (_ BitVec 32)) Bool)

(assert (=> b!293706 (= res!154478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293707 () Bool)

(declare-fun res!154479 () Bool)

(assert (=> b!293707 (=> (not res!154479) (not e!185705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293707 (= res!154479 (validKeyInArray!0 k0!2524))))

(declare-fun lt!145593 () SeekEntryResult!2208)

(declare-fun b!293708 () Bool)

(get-info :version)

(assert (=> b!293708 (= e!185704 (and lt!145596 (let ((bdg!6223 (not ((_ is Intermediate!2208) lt!145593)))) (and (or bdg!6223 (not (undefined!3020 lt!145593))) (not bdg!6223) (= (select (arr!7059 a!3312) (index!11004 lt!145593)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!145595 () (_ BitVec 32))

(declare-fun lt!145594 () SeekEntryResult!2208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14879 (_ BitVec 32)) SeekEntryResult!2208)

(assert (=> b!293708 (= lt!145594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145595 k0!2524 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312)) mask!3809))))

(assert (=> b!293708 (= lt!145593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145595 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293708 (= lt!145595 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28790 res!154482) b!293705))

(assert (= (and b!293705 res!154477) b!293707))

(assert (= (and b!293707 res!154479) b!293703))

(assert (= (and b!293703 res!154480) b!293704))

(assert (= (and b!293704 res!154481) b!293706))

(assert (= (and b!293706 res!154478) b!293708))

(declare-fun m!307327 () Bool)

(assert (=> start!28790 m!307327))

(declare-fun m!307329 () Bool)

(assert (=> start!28790 m!307329))

(declare-fun m!307331 () Bool)

(assert (=> b!293708 m!307331))

(declare-fun m!307333 () Bool)

(assert (=> b!293708 m!307333))

(declare-fun m!307335 () Bool)

(assert (=> b!293708 m!307335))

(declare-fun m!307337 () Bool)

(assert (=> b!293708 m!307337))

(declare-fun m!307339 () Bool)

(assert (=> b!293708 m!307339))

(declare-fun m!307341 () Bool)

(assert (=> b!293707 m!307341))

(declare-fun m!307343 () Bool)

(assert (=> b!293704 m!307343))

(declare-fun m!307345 () Bool)

(assert (=> b!293703 m!307345))

(declare-fun m!307347 () Bool)

(assert (=> b!293706 m!307347))

(check-sat (not b!293703) (not b!293708) (not b!293704) (not start!28790) (not b!293707) (not b!293706))
(check-sat)
(get-model)

(declare-fun d!66623 () Bool)

(assert (=> d!66623 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28790 d!66623))

(declare-fun d!66625 () Bool)

(assert (=> d!66625 (= (array_inv!5022 a!3312) (bvsge (size!7411 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28790 d!66625))

(declare-fun b!293735 () Bool)

(declare-fun e!185721 () Bool)

(declare-fun call!25681 () Bool)

(assert (=> b!293735 (= e!185721 call!25681)))

(declare-fun b!293736 () Bool)

(declare-fun e!185723 () Bool)

(declare-fun e!185722 () Bool)

(assert (=> b!293736 (= e!185723 e!185722)))

(declare-fun c!47184 () Bool)

(assert (=> b!293736 (= c!47184 (validKeyInArray!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66627 () Bool)

(declare-fun res!154505 () Bool)

(assert (=> d!66627 (=> res!154505 e!185723)))

(assert (=> d!66627 (= res!154505 (bvsge #b00000000000000000000000000000000 (size!7411 a!3312)))))

(assert (=> d!66627 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185723)))

(declare-fun bm!25678 () Bool)

(assert (=> bm!25678 (= call!25681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293737 () Bool)

(assert (=> b!293737 (= e!185722 e!185721)))

(declare-fun lt!145620 () (_ BitVec 64))

(assert (=> b!293737 (= lt!145620 (select (arr!7059 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9190 0))(
  ( (Unit!9191) )
))
(declare-fun lt!145621 () Unit!9190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14879 (_ BitVec 64) (_ BitVec 32)) Unit!9190)

(assert (=> b!293737 (= lt!145621 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145620 #b00000000000000000000000000000000))))

(assert (=> b!293737 (arrayContainsKey!0 a!3312 lt!145620 #b00000000000000000000000000000000)))

(declare-fun lt!145619 () Unit!9190)

(assert (=> b!293737 (= lt!145619 lt!145621)))

(declare-fun res!154506 () Bool)

(assert (=> b!293737 (= res!154506 (= (seekEntryOrOpen!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2208 #b00000000000000000000000000000000)))))

(assert (=> b!293737 (=> (not res!154506) (not e!185721))))

(declare-fun b!293738 () Bool)

(assert (=> b!293738 (= e!185722 call!25681)))

(assert (= (and d!66627 (not res!154505)) b!293736))

(assert (= (and b!293736 c!47184) b!293737))

(assert (= (and b!293736 (not c!47184)) b!293738))

(assert (= (and b!293737 res!154506) b!293735))

(assert (= (or b!293735 b!293738) bm!25678))

(declare-fun m!307371 () Bool)

(assert (=> b!293736 m!307371))

(assert (=> b!293736 m!307371))

(declare-fun m!307373 () Bool)

(assert (=> b!293736 m!307373))

(declare-fun m!307375 () Bool)

(assert (=> bm!25678 m!307375))

(assert (=> b!293737 m!307371))

(declare-fun m!307377 () Bool)

(assert (=> b!293737 m!307377))

(declare-fun m!307379 () Bool)

(assert (=> b!293737 m!307379))

(assert (=> b!293737 m!307371))

(declare-fun m!307381 () Bool)

(assert (=> b!293737 m!307381))

(assert (=> b!293706 d!66627))

(declare-fun b!293775 () Bool)

(declare-fun e!185750 () SeekEntryResult!2208)

(assert (=> b!293775 (= e!185750 (Intermediate!2208 false lt!145595 #b00000000000000000000000000000000))))

(declare-fun d!66629 () Bool)

(declare-fun e!185752 () Bool)

(assert (=> d!66629 e!185752))

(declare-fun c!47194 () Bool)

(declare-fun lt!145635 () SeekEntryResult!2208)

(assert (=> d!66629 (= c!47194 (and ((_ is Intermediate!2208) lt!145635) (undefined!3020 lt!145635)))))

(declare-fun e!185753 () SeekEntryResult!2208)

(assert (=> d!66629 (= lt!145635 e!185753)))

(declare-fun c!47195 () Bool)

(assert (=> d!66629 (= c!47195 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145636 () (_ BitVec 64))

(assert (=> d!66629 (= lt!145636 (select (arr!7059 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312))) lt!145595))))

(assert (=> d!66629 (validMask!0 mask!3809)))

(assert (=> d!66629 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145595 k0!2524 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312)) mask!3809) lt!145635)))

(declare-fun b!293776 () Bool)

(assert (=> b!293776 (= e!185753 (Intermediate!2208 true lt!145595 #b00000000000000000000000000000000))))

(declare-fun b!293777 () Bool)

(declare-fun e!185749 () Bool)

(assert (=> b!293777 (= e!185752 e!185749)))

(declare-fun res!154525 () Bool)

(assert (=> b!293777 (= res!154525 (and ((_ is Intermediate!2208) lt!145635) (not (undefined!3020 lt!145635)) (bvslt (x!29187 lt!145635) #b01111111111111111111111111111110) (bvsge (x!29187 lt!145635) #b00000000000000000000000000000000) (bvsge (x!29187 lt!145635) #b00000000000000000000000000000000)))))

(assert (=> b!293777 (=> (not res!154525) (not e!185749))))

(declare-fun b!293778 () Bool)

(assert (=> b!293778 (and (bvsge (index!11004 lt!145635) #b00000000000000000000000000000000) (bvslt (index!11004 lt!145635) (size!7411 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312)))))))

(declare-fun e!185751 () Bool)

(assert (=> b!293778 (= e!185751 (= (select (arr!7059 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312))) (index!11004 lt!145635)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293779 () Bool)

(assert (=> b!293779 (and (bvsge (index!11004 lt!145635) #b00000000000000000000000000000000) (bvslt (index!11004 lt!145635) (size!7411 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312)))))))

(declare-fun res!154527 () Bool)

(assert (=> b!293779 (= res!154527 (= (select (arr!7059 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312))) (index!11004 lt!145635)) k0!2524))))

(assert (=> b!293779 (=> res!154527 e!185751)))

(assert (=> b!293779 (= e!185749 e!185751)))

(declare-fun b!293780 () Bool)

(assert (=> b!293780 (= e!185753 e!185750)))

(declare-fun c!47196 () Bool)

(assert (=> b!293780 (= c!47196 (or (= lt!145636 k0!2524) (= (bvadd lt!145636 lt!145636) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293781 () Bool)

(assert (=> b!293781 (and (bvsge (index!11004 lt!145635) #b00000000000000000000000000000000) (bvslt (index!11004 lt!145635) (size!7411 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312)))))))

(declare-fun res!154526 () Bool)

(assert (=> b!293781 (= res!154526 (= (select (arr!7059 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312))) (index!11004 lt!145635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293781 (=> res!154526 e!185751)))

(declare-fun b!293782 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293782 (= e!185750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145595 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14880 (store (arr!7059 a!3312) i!1256 k0!2524) (size!7411 a!3312)) mask!3809))))

(declare-fun b!293783 () Bool)

(assert (=> b!293783 (= e!185752 (bvsge (x!29187 lt!145635) #b01111111111111111111111111111110))))

(assert (= (and d!66629 c!47195) b!293776))

(assert (= (and d!66629 (not c!47195)) b!293780))

(assert (= (and b!293780 c!47196) b!293775))

(assert (= (and b!293780 (not c!47196)) b!293782))

(assert (= (and d!66629 c!47194) b!293783))

(assert (= (and d!66629 (not c!47194)) b!293777))

(assert (= (and b!293777 res!154525) b!293779))

(assert (= (and b!293779 (not res!154527)) b!293781))

(assert (= (and b!293781 (not res!154526)) b!293778))

(declare-fun m!307397 () Bool)

(assert (=> b!293782 m!307397))

(assert (=> b!293782 m!307397))

(declare-fun m!307399 () Bool)

(assert (=> b!293782 m!307399))

(declare-fun m!307401 () Bool)

(assert (=> d!66629 m!307401))

(assert (=> d!66629 m!307327))

(declare-fun m!307403 () Bool)

(assert (=> b!293781 m!307403))

(assert (=> b!293778 m!307403))

(assert (=> b!293779 m!307403))

(assert (=> b!293708 d!66629))

(declare-fun b!293784 () Bool)

(declare-fun e!185755 () SeekEntryResult!2208)

(assert (=> b!293784 (= e!185755 (Intermediate!2208 false lt!145595 #b00000000000000000000000000000000))))

(declare-fun d!66647 () Bool)

(declare-fun e!185757 () Bool)

(assert (=> d!66647 e!185757))

(declare-fun c!47197 () Bool)

(declare-fun lt!145637 () SeekEntryResult!2208)

(assert (=> d!66647 (= c!47197 (and ((_ is Intermediate!2208) lt!145637) (undefined!3020 lt!145637)))))

(declare-fun e!185758 () SeekEntryResult!2208)

(assert (=> d!66647 (= lt!145637 e!185758)))

(declare-fun c!47198 () Bool)

(assert (=> d!66647 (= c!47198 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145638 () (_ BitVec 64))

(assert (=> d!66647 (= lt!145638 (select (arr!7059 a!3312) lt!145595))))

(assert (=> d!66647 (validMask!0 mask!3809)))

(assert (=> d!66647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145595 k0!2524 a!3312 mask!3809) lt!145637)))

(declare-fun b!293785 () Bool)

(assert (=> b!293785 (= e!185758 (Intermediate!2208 true lt!145595 #b00000000000000000000000000000000))))

(declare-fun b!293786 () Bool)

(declare-fun e!185754 () Bool)

(assert (=> b!293786 (= e!185757 e!185754)))

(declare-fun res!154528 () Bool)

(assert (=> b!293786 (= res!154528 (and ((_ is Intermediate!2208) lt!145637) (not (undefined!3020 lt!145637)) (bvslt (x!29187 lt!145637) #b01111111111111111111111111111110) (bvsge (x!29187 lt!145637) #b00000000000000000000000000000000) (bvsge (x!29187 lt!145637) #b00000000000000000000000000000000)))))

(assert (=> b!293786 (=> (not res!154528) (not e!185754))))

(declare-fun b!293787 () Bool)

(assert (=> b!293787 (and (bvsge (index!11004 lt!145637) #b00000000000000000000000000000000) (bvslt (index!11004 lt!145637) (size!7411 a!3312)))))

(declare-fun e!185756 () Bool)

(assert (=> b!293787 (= e!185756 (= (select (arr!7059 a!3312) (index!11004 lt!145637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293788 () Bool)

(assert (=> b!293788 (and (bvsge (index!11004 lt!145637) #b00000000000000000000000000000000) (bvslt (index!11004 lt!145637) (size!7411 a!3312)))))

(declare-fun res!154530 () Bool)

(assert (=> b!293788 (= res!154530 (= (select (arr!7059 a!3312) (index!11004 lt!145637)) k0!2524))))

(assert (=> b!293788 (=> res!154530 e!185756)))

(assert (=> b!293788 (= e!185754 e!185756)))

(declare-fun b!293789 () Bool)

(assert (=> b!293789 (= e!185758 e!185755)))

(declare-fun c!47199 () Bool)

(assert (=> b!293789 (= c!47199 (or (= lt!145638 k0!2524) (= (bvadd lt!145638 lt!145638) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293790 () Bool)

(assert (=> b!293790 (and (bvsge (index!11004 lt!145637) #b00000000000000000000000000000000) (bvslt (index!11004 lt!145637) (size!7411 a!3312)))))

(declare-fun res!154529 () Bool)

(assert (=> b!293790 (= res!154529 (= (select (arr!7059 a!3312) (index!11004 lt!145637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293790 (=> res!154529 e!185756)))

(declare-fun b!293791 () Bool)

(assert (=> b!293791 (= e!185755 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145595 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!293792 () Bool)

(assert (=> b!293792 (= e!185757 (bvsge (x!29187 lt!145637) #b01111111111111111111111111111110))))

(assert (= (and d!66647 c!47198) b!293785))

(assert (= (and d!66647 (not c!47198)) b!293789))

(assert (= (and b!293789 c!47199) b!293784))

(assert (= (and b!293789 (not c!47199)) b!293791))

(assert (= (and d!66647 c!47197) b!293792))

(assert (= (and d!66647 (not c!47197)) b!293786))

(assert (= (and b!293786 res!154528) b!293788))

(assert (= (and b!293788 (not res!154530)) b!293790))

(assert (= (and b!293790 (not res!154529)) b!293787))

(assert (=> b!293791 m!307397))

(assert (=> b!293791 m!307397))

(declare-fun m!307405 () Bool)

(assert (=> b!293791 m!307405))

(declare-fun m!307407 () Bool)

(assert (=> d!66647 m!307407))

(assert (=> d!66647 m!307327))

(declare-fun m!307409 () Bool)

(assert (=> b!293790 m!307409))

(assert (=> b!293787 m!307409))

(assert (=> b!293788 m!307409))

(assert (=> b!293708 d!66647))

(declare-fun d!66649 () Bool)

(declare-fun lt!145644 () (_ BitVec 32))

(declare-fun lt!145643 () (_ BitVec 32))

(assert (=> d!66649 (= lt!145644 (bvmul (bvxor lt!145643 (bvlshr lt!145643 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66649 (= lt!145643 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66649 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154531 (let ((h!5274 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29190 (bvmul (bvxor h!5274 (bvlshr h!5274 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29190 (bvlshr x!29190 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154531 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154531 #b00000000000000000000000000000000))))))

(assert (=> d!66649 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145644 (bvlshr lt!145644 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293708 d!66649))

(declare-fun d!66655 () Bool)

(assert (=> d!66655 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293707 d!66655))

(declare-fun d!66657 () Bool)

(declare-fun lt!145669 () SeekEntryResult!2208)

(assert (=> d!66657 (and (or ((_ is Undefined!2208) lt!145669) (not ((_ is Found!2208) lt!145669)) (and (bvsge (index!11003 lt!145669) #b00000000000000000000000000000000) (bvslt (index!11003 lt!145669) (size!7411 a!3312)))) (or ((_ is Undefined!2208) lt!145669) ((_ is Found!2208) lt!145669) (not ((_ is MissingZero!2208) lt!145669)) (and (bvsge (index!11002 lt!145669) #b00000000000000000000000000000000) (bvslt (index!11002 lt!145669) (size!7411 a!3312)))) (or ((_ is Undefined!2208) lt!145669) ((_ is Found!2208) lt!145669) ((_ is MissingZero!2208) lt!145669) (not ((_ is MissingVacant!2208) lt!145669)) (and (bvsge (index!11005 lt!145669) #b00000000000000000000000000000000) (bvslt (index!11005 lt!145669) (size!7411 a!3312)))) (or ((_ is Undefined!2208) lt!145669) (ite ((_ is Found!2208) lt!145669) (= (select (arr!7059 a!3312) (index!11003 lt!145669)) k0!2524) (ite ((_ is MissingZero!2208) lt!145669) (= (select (arr!7059 a!3312) (index!11002 lt!145669)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2208) lt!145669) (= (select (arr!7059 a!3312) (index!11005 lt!145669)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!185783 () SeekEntryResult!2208)

(assert (=> d!66657 (= lt!145669 e!185783)))

(declare-fun c!47225 () Bool)

(declare-fun lt!145670 () SeekEntryResult!2208)

(assert (=> d!66657 (= c!47225 (and ((_ is Intermediate!2208) lt!145670) (undefined!3020 lt!145670)))))

(assert (=> d!66657 (= lt!145670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66657 (validMask!0 mask!3809)))

(assert (=> d!66657 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145669)))

(declare-fun b!293841 () Bool)

(assert (=> b!293841 (= e!185783 Undefined!2208)))

(declare-fun b!293842 () Bool)

(declare-fun e!185785 () SeekEntryResult!2208)

(assert (=> b!293842 (= e!185783 e!185785)))

(declare-fun lt!145671 () (_ BitVec 64))

(assert (=> b!293842 (= lt!145671 (select (arr!7059 a!3312) (index!11004 lt!145670)))))

(declare-fun c!47224 () Bool)

(assert (=> b!293842 (= c!47224 (= lt!145671 k0!2524))))

(declare-fun b!293843 () Bool)

(assert (=> b!293843 (= e!185785 (Found!2208 (index!11004 lt!145670)))))

(declare-fun b!293844 () Bool)

(declare-fun c!47226 () Bool)

(assert (=> b!293844 (= c!47226 (= lt!145671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185784 () SeekEntryResult!2208)

(assert (=> b!293844 (= e!185785 e!185784)))

(declare-fun b!293845 () Bool)

(assert (=> b!293845 (= e!185784 (MissingZero!2208 (index!11004 lt!145670)))))

(declare-fun b!293846 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14879 (_ BitVec 32)) SeekEntryResult!2208)

(assert (=> b!293846 (= e!185784 (seekKeyOrZeroReturnVacant!0 (x!29187 lt!145670) (index!11004 lt!145670) (index!11004 lt!145670) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66657 c!47225) b!293841))

(assert (= (and d!66657 (not c!47225)) b!293842))

(assert (= (and b!293842 c!47224) b!293843))

(assert (= (and b!293842 (not c!47224)) b!293844))

(assert (= (and b!293844 c!47226) b!293845))

(assert (= (and b!293844 (not c!47226)) b!293846))

(assert (=> d!66657 m!307339))

(declare-fun m!307435 () Bool)

(assert (=> d!66657 m!307435))

(assert (=> d!66657 m!307339))

(declare-fun m!307437 () Bool)

(assert (=> d!66657 m!307437))

(declare-fun m!307439 () Bool)

(assert (=> d!66657 m!307439))

(assert (=> d!66657 m!307327))

(declare-fun m!307441 () Bool)

(assert (=> d!66657 m!307441))

(declare-fun m!307443 () Bool)

(assert (=> b!293842 m!307443))

(declare-fun m!307445 () Bool)

(assert (=> b!293846 m!307445))

(assert (=> b!293704 d!66657))

(declare-fun d!66663 () Bool)

(declare-fun res!154540 () Bool)

(declare-fun e!185800 () Bool)

(assert (=> d!66663 (=> res!154540 e!185800)))

(assert (=> d!66663 (= res!154540 (= (select (arr!7059 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66663 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185800)))

(declare-fun b!293865 () Bool)

(declare-fun e!185801 () Bool)

(assert (=> b!293865 (= e!185800 e!185801)))

(declare-fun res!154541 () Bool)

(assert (=> b!293865 (=> (not res!154541) (not e!185801))))

(assert (=> b!293865 (= res!154541 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7411 a!3312)))))

(declare-fun b!293866 () Bool)

(assert (=> b!293866 (= e!185801 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66663 (not res!154540)) b!293865))

(assert (= (and b!293865 res!154541) b!293866))

(assert (=> d!66663 m!307371))

(declare-fun m!307447 () Bool)

(assert (=> b!293866 m!307447))

(assert (=> b!293703 d!66663))

(check-sat (not d!66657) (not b!293791) (not b!293736) (not b!293846) (not b!293737) (not b!293866) (not b!293782) (not bm!25678) (not d!66629) (not d!66647))
(check-sat)
(get-model)

