; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28332 () Bool)

(assert start!28332)

(declare-fun b!290305 () Bool)

(declare-fun res!151790 () Bool)

(declare-fun e!183709 () Bool)

(assert (=> b!290305 (=> (not res!151790) (not e!183709))))

(declare-datatypes ((array!14646 0))(
  ( (array!14647 (arr!6950 (Array (_ BitVec 32) (_ BitVec 64))) (size!7302 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14646)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14646 (_ BitVec 32)) Bool)

(assert (=> b!290305 (= res!151790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290306 () Bool)

(declare-fun e!183708 () Bool)

(assert (=> b!290306 (= e!183708 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(declare-datatypes ((SeekEntryResult!2099 0))(
  ( (MissingZero!2099 (index!10566 (_ BitVec 32))) (Found!2099 (index!10567 (_ BitVec 32))) (Intermediate!2099 (undefined!2911 Bool) (index!10568 (_ BitVec 32)) (x!28760 (_ BitVec 32))) (Undefined!2099) (MissingVacant!2099 (index!10569 (_ BitVec 32))) )
))
(declare-fun lt!143413 () SeekEntryResult!2099)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290306 (= (index!10568 lt!143413) i!1256)))

(declare-fun b!290307 () Bool)

(declare-fun res!151785 () Bool)

(declare-fun e!183706 () Bool)

(assert (=> b!290307 (=> (not res!151785) (not e!183706))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290307 (= res!151785 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290308 () Bool)

(declare-fun res!151791 () Bool)

(assert (=> b!290308 (=> (not res!151791) (not e!183706))))

(assert (=> b!290308 (= res!151791 (and (= (size!7302 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7302 a!3312))))))

(declare-fun b!290309 () Bool)

(declare-fun e!183710 () Bool)

(assert (=> b!290309 (= e!183709 e!183710)))

(declare-fun res!151787 () Bool)

(assert (=> b!290309 (=> (not res!151787) (not e!183710))))

(declare-fun lt!143412 () SeekEntryResult!2099)

(declare-fun lt!143409 () Bool)

(assert (=> b!290309 (= res!151787 (and (not lt!143409) (= lt!143412 (MissingVacant!2099 i!1256))))))

(declare-fun lt!143410 () SeekEntryResult!2099)

(declare-fun lt!143411 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14646 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!290309 (= lt!143410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143411 k!2524 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312)) mask!3809))))

(assert (=> b!290309 (= lt!143413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143411 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290309 (= lt!143411 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290310 () Bool)

(assert (=> b!290310 (= e!183706 e!183709)))

(declare-fun res!151784 () Bool)

(assert (=> b!290310 (=> (not res!151784) (not e!183709))))

(assert (=> b!290310 (= res!151784 (or lt!143409 (= lt!143412 (MissingVacant!2099 i!1256))))))

(assert (=> b!290310 (= lt!143409 (= lt!143412 (MissingZero!2099 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14646 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!290310 (= lt!143412 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290311 () Bool)

(assert (=> b!290311 (= e!183710 e!183708)))

(declare-fun res!151786 () Bool)

(assert (=> b!290311 (=> (not res!151786) (not e!183708))))

(declare-fun lt!143408 () Bool)

(assert (=> b!290311 (= res!151786 (and (or lt!143408 (not (undefined!2911 lt!143413))) (not lt!143408) (= (select (arr!6950 a!3312) (index!10568 lt!143413)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290311 (= lt!143408 (not (is-Intermediate!2099 lt!143413)))))

(declare-fun b!290312 () Bool)

(declare-fun res!151788 () Bool)

(assert (=> b!290312 (=> (not res!151788) (not e!183706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290312 (= res!151788 (validKeyInArray!0 k!2524))))

(declare-fun res!151789 () Bool)

(assert (=> start!28332 (=> (not res!151789) (not e!183706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28332 (= res!151789 (validMask!0 mask!3809))))

(assert (=> start!28332 e!183706))

(assert (=> start!28332 true))

(declare-fun array_inv!4913 (array!14646) Bool)

(assert (=> start!28332 (array_inv!4913 a!3312)))

(assert (= (and start!28332 res!151789) b!290308))

(assert (= (and b!290308 res!151791) b!290312))

(assert (= (and b!290312 res!151788) b!290307))

(assert (= (and b!290307 res!151785) b!290310))

(assert (= (and b!290310 res!151784) b!290305))

(assert (= (and b!290305 res!151790) b!290309))

(assert (= (and b!290309 res!151787) b!290311))

(assert (= (and b!290311 res!151786) b!290306))

(declare-fun m!304413 () Bool)

(assert (=> b!290307 m!304413))

(declare-fun m!304415 () Bool)

(assert (=> b!290310 m!304415))

(declare-fun m!304417 () Bool)

(assert (=> b!290309 m!304417))

(declare-fun m!304419 () Bool)

(assert (=> b!290309 m!304419))

(declare-fun m!304421 () Bool)

(assert (=> b!290309 m!304421))

(declare-fun m!304423 () Bool)

(assert (=> b!290309 m!304423))

(declare-fun m!304425 () Bool)

(assert (=> start!28332 m!304425))

(declare-fun m!304427 () Bool)

(assert (=> start!28332 m!304427))

(declare-fun m!304429 () Bool)

(assert (=> b!290311 m!304429))

(declare-fun m!304431 () Bool)

(assert (=> b!290305 m!304431))

(declare-fun m!304433 () Bool)

(assert (=> b!290312 m!304433))

(push 1)

(assert (not b!290310))

(assert (not b!290309))

(assert (not start!28332))

(assert (not b!290307))

(assert (not b!290305))

(assert (not b!290312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66285 () Bool)

(declare-fun lt!143467 () SeekEntryResult!2099)

(assert (=> d!66285 (and (or (is-Undefined!2099 lt!143467) (not (is-Found!2099 lt!143467)) (and (bvsge (index!10567 lt!143467) #b00000000000000000000000000000000) (bvslt (index!10567 lt!143467) (size!7302 a!3312)))) (or (is-Undefined!2099 lt!143467) (is-Found!2099 lt!143467) (not (is-MissingZero!2099 lt!143467)) (and (bvsge (index!10566 lt!143467) #b00000000000000000000000000000000) (bvslt (index!10566 lt!143467) (size!7302 a!3312)))) (or (is-Undefined!2099 lt!143467) (is-Found!2099 lt!143467) (is-MissingZero!2099 lt!143467) (not (is-MissingVacant!2099 lt!143467)) (and (bvsge (index!10569 lt!143467) #b00000000000000000000000000000000) (bvslt (index!10569 lt!143467) (size!7302 a!3312)))) (or (is-Undefined!2099 lt!143467) (ite (is-Found!2099 lt!143467) (= (select (arr!6950 a!3312) (index!10567 lt!143467)) k!2524) (ite (is-MissingZero!2099 lt!143467) (= (select (arr!6950 a!3312) (index!10566 lt!143467)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2099 lt!143467) (= (select (arr!6950 a!3312) (index!10569 lt!143467)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!183756 () SeekEntryResult!2099)

(assert (=> d!66285 (= lt!143467 e!183756)))

(declare-fun c!46831 () Bool)

(declare-fun lt!143466 () SeekEntryResult!2099)

(assert (=> d!66285 (= c!46831 (and (is-Intermediate!2099 lt!143466) (undefined!2911 lt!143466)))))

(assert (=> d!66285 (= lt!143466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66285 (validMask!0 mask!3809)))

(assert (=> d!66285 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!143467)))

(declare-fun b!290385 () Bool)

(declare-fun c!46832 () Bool)

(declare-fun lt!143465 () (_ BitVec 64))

(assert (=> b!290385 (= c!46832 (= lt!143465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!183758 () SeekEntryResult!2099)

(declare-fun e!183757 () SeekEntryResult!2099)

(assert (=> b!290385 (= e!183758 e!183757)))

(declare-fun b!290386 () Bool)

(assert (=> b!290386 (= e!183757 (MissingZero!2099 (index!10568 lt!143466)))))

(declare-fun b!290387 () Bool)

(assert (=> b!290387 (= e!183756 e!183758)))

(assert (=> b!290387 (= lt!143465 (select (arr!6950 a!3312) (index!10568 lt!143466)))))

(declare-fun c!46833 () Bool)

(assert (=> b!290387 (= c!46833 (= lt!143465 k!2524))))

(declare-fun b!290388 () Bool)

(assert (=> b!290388 (= e!183758 (Found!2099 (index!10568 lt!143466)))))

(declare-fun b!290389 () Bool)

(assert (=> b!290389 (= e!183756 Undefined!2099)))

(declare-fun b!290390 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14646 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!290390 (= e!183757 (seekKeyOrZeroReturnVacant!0 (x!28760 lt!143466) (index!10568 lt!143466) (index!10568 lt!143466) k!2524 a!3312 mask!3809))))

(assert (= (and d!66285 c!46831) b!290389))

(assert (= (and d!66285 (not c!46831)) b!290387))

(assert (= (and b!290387 c!46833) b!290388))

(assert (= (and b!290387 (not c!46833)) b!290385))

(assert (= (and b!290385 c!46832) b!290386))

(assert (= (and b!290385 (not c!46832)) b!290390))

(declare-fun m!304491 () Bool)

(assert (=> d!66285 m!304491))

(assert (=> d!66285 m!304425))

(assert (=> d!66285 m!304423))

(declare-fun m!304493 () Bool)

(assert (=> d!66285 m!304493))

(assert (=> d!66285 m!304423))

(declare-fun m!304495 () Bool)

(assert (=> d!66285 m!304495))

(declare-fun m!304497 () Bool)

(assert (=> d!66285 m!304497))

(declare-fun m!304499 () Bool)

(assert (=> b!290387 m!304499))

(declare-fun m!304501 () Bool)

(assert (=> b!290390 m!304501))

(assert (=> b!290310 d!66285))

(declare-fun d!66297 () Bool)

(declare-fun res!151856 () Bool)

(declare-fun e!183781 () Bool)

(assert (=> d!66297 (=> res!151856 e!183781)))

(assert (=> d!66297 (= res!151856 (bvsge #b00000000000000000000000000000000 (size!7302 a!3312)))))

(assert (=> d!66297 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!183781)))

(declare-fun b!290429 () Bool)

(declare-fun e!183782 () Bool)

(declare-fun e!183783 () Bool)

(assert (=> b!290429 (= e!183782 e!183783)))

(declare-fun lt!143486 () (_ BitVec 64))

(assert (=> b!290429 (= lt!143486 (select (arr!6950 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9142 0))(
  ( (Unit!9143) )
))
(declare-fun lt!143484 () Unit!9142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14646 (_ BitVec 64) (_ BitVec 32)) Unit!9142)

(assert (=> b!290429 (= lt!143484 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!143486 #b00000000000000000000000000000000))))

(assert (=> b!290429 (arrayContainsKey!0 a!3312 lt!143486 #b00000000000000000000000000000000)))

(declare-fun lt!143485 () Unit!9142)

(assert (=> b!290429 (= lt!143485 lt!143484)))

(declare-fun res!151857 () Bool)

(assert (=> b!290429 (= res!151857 (= (seekEntryOrOpen!0 (select (arr!6950 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2099 #b00000000000000000000000000000000)))))

(assert (=> b!290429 (=> (not res!151857) (not e!183783))))

(declare-fun bm!25636 () Bool)

(declare-fun call!25639 () Bool)

(assert (=> bm!25636 (= call!25639 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!290430 () Bool)

(assert (=> b!290430 (= e!183781 e!183782)))

(declare-fun c!46848 () Bool)

(assert (=> b!290430 (= c!46848 (validKeyInArray!0 (select (arr!6950 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!290431 () Bool)

(assert (=> b!290431 (= e!183782 call!25639)))

(declare-fun b!290432 () Bool)

(assert (=> b!290432 (= e!183783 call!25639)))

(assert (= (and d!66297 (not res!151856)) b!290430))

(assert (= (and b!290430 c!46848) b!290429))

(assert (= (and b!290430 (not c!46848)) b!290431))

(assert (= (and b!290429 res!151857) b!290432))

(assert (= (or b!290432 b!290431) bm!25636))

(declare-fun m!304503 () Bool)

(assert (=> b!290429 m!304503))

(declare-fun m!304505 () Bool)

(assert (=> b!290429 m!304505))

(declare-fun m!304507 () Bool)

(assert (=> b!290429 m!304507))

(assert (=> b!290429 m!304503))

(declare-fun m!304509 () Bool)

(assert (=> b!290429 m!304509))

(declare-fun m!304511 () Bool)

(assert (=> bm!25636 m!304511))

(assert (=> b!290430 m!304503))

(assert (=> b!290430 m!304503))

(declare-fun m!304513 () Bool)

(assert (=> b!290430 m!304513))

(assert (=> b!290305 d!66297))

(declare-fun b!290494 () Bool)

(declare-fun e!183819 () Bool)

(declare-fun e!183818 () Bool)

(assert (=> b!290494 (= e!183819 e!183818)))

(declare-fun res!151879 () Bool)

(declare-fun lt!143508 () SeekEntryResult!2099)

(assert (=> b!290494 (= res!151879 (and (is-Intermediate!2099 lt!143508) (not (undefined!2911 lt!143508)) (bvslt (x!28760 lt!143508) #b01111111111111111111111111111110) (bvsge (x!28760 lt!143508) #b00000000000000000000000000000000) (bvsge (x!28760 lt!143508) #b00000000000000000000000000000000)))))

(assert (=> b!290494 (=> (not res!151879) (not e!183818))))

(declare-fun b!290495 () Bool)

(assert (=> b!290495 (and (bvsge (index!10568 lt!143508) #b00000000000000000000000000000000) (bvslt (index!10568 lt!143508) (size!7302 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312)))))))

(declare-fun e!183817 () Bool)

(assert (=> b!290495 (= e!183817 (= (select (arr!6950 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312))) (index!10568 lt!143508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290496 () Bool)

(assert (=> b!290496 (and (bvsge (index!10568 lt!143508) #b00000000000000000000000000000000) (bvslt (index!10568 lt!143508) (size!7302 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312)))))))

(declare-fun res!151878 () Bool)

(assert (=> b!290496 (= res!151878 (= (select (arr!6950 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312))) (index!10568 lt!143508)) k!2524))))

(assert (=> b!290496 (=> res!151878 e!183817)))

(assert (=> b!290496 (= e!183818 e!183817)))

(declare-fun e!183820 () SeekEntryResult!2099)

(declare-fun b!290497 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290497 (= e!183820 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143411 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312)) mask!3809))))

(declare-fun b!290498 () Bool)

(declare-fun e!183821 () SeekEntryResult!2099)

(assert (=> b!290498 (= e!183821 e!183820)))

(declare-fun c!46871 () Bool)

(declare-fun lt!143509 () (_ BitVec 64))

(assert (=> b!290498 (= c!46871 (or (= lt!143509 k!2524) (= (bvadd lt!143509 lt!143509) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!290499 () Bool)

(assert (=> b!290499 (= e!183821 (Intermediate!2099 true lt!143411 #b00000000000000000000000000000000))))

(declare-fun d!66299 () Bool)

(assert (=> d!66299 e!183819))

(declare-fun c!46870 () Bool)

(assert (=> d!66299 (= c!46870 (and (is-Intermediate!2099 lt!143508) (undefined!2911 lt!143508)))))

(assert (=> d!66299 (= lt!143508 e!183821)))

(declare-fun c!46872 () Bool)

(assert (=> d!66299 (= c!46872 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66299 (= lt!143509 (select (arr!6950 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312))) lt!143411))))

(assert (=> d!66299 (validMask!0 mask!3809)))

(assert (=> d!66299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143411 k!2524 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312)) mask!3809) lt!143508)))

(declare-fun b!290493 () Bool)

(assert (=> b!290493 (= e!183819 (bvsge (x!28760 lt!143508) #b01111111111111111111111111111110))))

(declare-fun b!290500 () Bool)

(assert (=> b!290500 (= e!183820 (Intermediate!2099 false lt!143411 #b00000000000000000000000000000000))))

(declare-fun b!290501 () Bool)

(assert (=> b!290501 (and (bvsge (index!10568 lt!143508) #b00000000000000000000000000000000) (bvslt (index!10568 lt!143508) (size!7302 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312)))))))

(declare-fun res!151877 () Bool)

(assert (=> b!290501 (= res!151877 (= (select (arr!6950 (array!14647 (store (arr!6950 a!3312) i!1256 k!2524) (size!7302 a!3312))) (index!10568 lt!143508)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!290501 (=> res!151877 e!183817)))

(assert (= (and d!66299 c!46872) b!290499))

(assert (= (and d!66299 (not c!46872)) b!290498))

(assert (= (and b!290498 c!46871) b!290500))

(assert (= (and b!290498 (not c!46871)) b!290497))

(assert (= (and d!66299 c!46870) b!290493))

(assert (= (and d!66299 (not c!46870)) b!290494))

(assert (= (and b!290494 res!151879) b!290496))

(assert (= (and b!290496 (not res!151878)) b!290501))

(assert (= (and b!290501 (not res!151877)) b!290495))

(declare-fun m!304541 () Bool)

(assert (=> d!66299 m!304541))

(assert (=> d!66299 m!304425))

(declare-fun m!304543 () Bool)

(assert (=> b!290495 m!304543))

(assert (=> b!290496 m!304543))

(declare-fun m!304545 () Bool)

(assert (=> b!290497 m!304545))

(assert (=> b!290497 m!304545))

(declare-fun m!304547 () Bool)

(assert (=> b!290497 m!304547))

(assert (=> b!290501 m!304543))

(assert (=> b!290309 d!66299))

(declare-fun b!290512 () Bool)

(declare-fun e!183829 () Bool)

(declare-fun e!183828 () Bool)

(assert (=> b!290512 (= e!183829 e!183828)))

(declare-fun res!151885 () Bool)

(declare-fun lt!143512 () SeekEntryResult!2099)

(assert (=> b!290512 (= res!151885 (and (is-Intermediate!2099 lt!143512) (not (undefined!2911 lt!143512)) (bvslt (x!28760 lt!143512) #b01111111111111111111111111111110) (bvsge (x!28760 lt!143512) #b00000000000000000000000000000000) (bvsge (x!28760 lt!143512) #b00000000000000000000000000000000)))))

(assert (=> b!290512 (=> (not res!151885) (not e!183828))))

(declare-fun b!290513 () Bool)

(assert (=> b!290513 (and (bvsge (index!10568 lt!143512) #b00000000000000000000000000000000) (bvslt (index!10568 lt!143512) (size!7302 a!3312)))))

(declare-fun e!183827 () Bool)

(assert (=> b!290513 (= e!183827 (= (select (arr!6950 a!3312) (index!10568 lt!143512)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290514 () Bool)

(assert (=> b!290514 (and (bvsge (index!10568 lt!143512) #b00000000000000000000000000000000) (bvslt (index!10568 lt!143512) (size!7302 a!3312)))))

(declare-fun res!151884 () Bool)

(assert (=> b!290514 (= res!151884 (= (select (arr!6950 a!3312) (index!10568 lt!143512)) k!2524))))

(assert (=> b!290514 (=> res!151884 e!183827)))

(assert (=> b!290514 (= e!183828 e!183827)))

(declare-fun e!183830 () SeekEntryResult!2099)

(declare-fun b!290515 () Bool)

(assert (=> b!290515 (= e!183830 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143411 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!290516 () Bool)

(declare-fun e!183831 () SeekEntryResult!2099)

(assert (=> b!290516 (= e!183831 e!183830)))

(declare-fun c!46877 () Bool)

(declare-fun lt!143513 () (_ BitVec 64))

(assert (=> b!290516 (= c!46877 (or (= lt!143513 k!2524) (= (bvadd lt!143513 lt!143513) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!290517 () Bool)

(assert (=> b!290517 (= e!183831 (Intermediate!2099 true lt!143411 #b00000000000000000000000000000000))))

(declare-fun d!66313 () Bool)

(assert (=> d!66313 e!183829))

(declare-fun c!46876 () Bool)

(assert (=> d!66313 (= c!46876 (and (is-Intermediate!2099 lt!143512) (undefined!2911 lt!143512)))))

(assert (=> d!66313 (= lt!143512 e!183831)))

(declare-fun c!46878 () Bool)

(assert (=> d!66313 (= c!46878 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66313 (= lt!143513 (select (arr!6950 a!3312) lt!143411))))

(assert (=> d!66313 (validMask!0 mask!3809)))

(assert (=> d!66313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143411 k!2524 a!3312 mask!3809) lt!143512)))

(declare-fun b!290511 () Bool)

(assert (=> b!290511 (= e!183829 (bvsge (x!28760 lt!143512) #b01111111111111111111111111111110))))

(declare-fun b!290518 () Bool)

(assert (=> b!290518 (= e!183830 (Intermediate!2099 false lt!143411 #b00000000000000000000000000000000))))

(declare-fun b!290519 () Bool)

(assert (=> b!290519 (and (bvsge (index!10568 lt!143512) #b00000000000000000000000000000000) (bvslt (index!10568 lt!143512) (size!7302 a!3312)))))

(declare-fun res!151883 () Bool)

(assert (=> b!290519 (= res!151883 (= (select (arr!6950 a!3312) (index!10568 lt!143512)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!290519 (=> res!151883 e!183827)))

(assert (= (and d!66313 c!46878) b!290517))

(assert (= (and d!66313 (not c!46878)) b!290516))

(assert (= (and b!290516 c!46877) b!290518))

(assert (= (and b!290516 (not c!46877)) b!290515))

(assert (= (and d!66313 c!46876) b!290511))

(assert (= (and d!66313 (not c!46876)) b!290512))

(assert (= (and b!290512 res!151885) b!290514))

(assert (= (and b!290514 (not res!151884)) b!290519))

(assert (= (and b!290519 (not res!151883)) b!290513))

(declare-fun m!304551 () Bool)

(assert (=> d!66313 m!304551))

(assert (=> d!66313 m!304425))

(declare-fun m!304555 () Bool)

(assert (=> b!290513 m!304555))

(assert (=> b!290514 m!304555))

(assert (=> b!290515 m!304545))

(assert (=> b!290515 m!304545))

(declare-fun m!304561 () Bool)

(assert (=> b!290515 m!304561))

(assert (=> b!290519 m!304555))

(assert (=> b!290309 d!66313))

(declare-fun d!66315 () Bool)

(declare-fun lt!143521 () (_ BitVec 32))

(declare-fun lt!143520 () (_ BitVec 32))

(assert (=> d!66315 (= lt!143521 (bvmul (bvxor lt!143520 (bvlshr lt!143520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66315 (= lt!143520 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66315 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!151889 (let ((h!5260 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28767 (bvmul (bvxor h!5260 (bvlshr h!5260 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28767 (bvlshr x!28767 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!151889 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!151889 #b00000000000000000000000000000000))))))

(assert (=> d!66315 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!143521 (bvlshr lt!143521 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!290309 d!66315))

(declare-fun d!66321 () Bool)

(assert (=> d!66321 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!290312 d!66321))

(declare-fun d!66323 () Bool)

(declare-fun res!151899 () Bool)

(declare-fun e!183845 () Bool)

(assert (=> d!66323 (=> res!151899 e!183845)))

(assert (=> d!66323 (= res!151899 (= (select (arr!6950 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66323 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!183845)))

(declare-fun b!290537 () Bool)

(declare-fun e!183846 () Bool)

(assert (=> b!290537 (= e!183845 e!183846)))

(declare-fun res!151900 () Bool)

(assert (=> b!290537 (=> (not res!151900) (not e!183846))))

(assert (=> b!290537 (= res!151900 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7302 a!3312)))))

(declare-fun b!290538 () Bool)

(assert (=> b!290538 (= e!183846 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66323 (not res!151899)) b!290537))

(assert (= (and b!290537 res!151900) b!290538))

(assert (=> d!66323 m!304503))

(declare-fun m!304569 () Bool)

(assert (=> b!290538 m!304569))

(assert (=> b!290307 d!66323))

(declare-fun d!66327 () Bool)

(assert (=> d!66327 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28332 d!66327))

(declare-fun d!66331 () Bool)

(assert (=> d!66331 (= (array_inv!4913 a!3312) (bvsge (size!7302 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28332 d!66331))

(push 1)

