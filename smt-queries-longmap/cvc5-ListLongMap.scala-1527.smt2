; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28788 () Bool)

(assert start!28788)

(declare-fun res!154459 () Bool)

(declare-fun e!185694 () Bool)

(assert (=> start!28788 (=> (not res!154459) (not e!185694))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28788 (= res!154459 (validMask!0 mask!3809))))

(assert (=> start!28788 e!185694))

(assert (=> start!28788 true))

(declare-datatypes ((array!14877 0))(
  ( (array!14878 (arr!7058 (Array (_ BitVec 32) (_ BitVec 64))) (size!7410 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14877)

(declare-fun array_inv!5021 (array!14877) Bool)

(assert (=> start!28788 (array_inv!5021 a!3312)))

(declare-fun lt!145580 () Bool)

(declare-fun b!293685 () Bool)

(declare-datatypes ((SeekEntryResult!2207 0))(
  ( (MissingZero!2207 (index!10998 (_ BitVec 32))) (Found!2207 (index!10999 (_ BitVec 32))) (Intermediate!2207 (undefined!3019 Bool) (index!11000 (_ BitVec 32)) (x!29186 (_ BitVec 32))) (Undefined!2207) (MissingVacant!2207 (index!11001 (_ BitVec 32))) )
))
(declare-fun lt!145578 () SeekEntryResult!2207)

(declare-fun e!185696 () Bool)

(assert (=> b!293685 (= e!185696 (and lt!145580 (let ((bdg!6223 (not (is-Intermediate!2207 lt!145578)))) (and (or bdg!6223 (not (undefined!3019 lt!145578))) (not bdg!6223) (= (select (arr!7058 a!3312) (index!11000 lt!145578)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!145582 () SeekEntryResult!2207)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!145581 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14877 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!293685 (= lt!145582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145581 k!2524 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)) mask!3809))))

(assert (=> b!293685 (= lt!145578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145581 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293685 (= lt!145581 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!293686 () Bool)

(declare-fun res!154461 () Bool)

(assert (=> b!293686 (=> (not res!154461) (not e!185694))))

(declare-fun arrayContainsKey!0 (array!14877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293686 (= res!154461 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293687 () Bool)

(declare-fun res!154462 () Bool)

(assert (=> b!293687 (=> (not res!154462) (not e!185694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293687 (= res!154462 (validKeyInArray!0 k!2524))))

(declare-fun b!293688 () Bool)

(declare-fun res!154463 () Bool)

(assert (=> b!293688 (=> (not res!154463) (not e!185696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14877 (_ BitVec 32)) Bool)

(assert (=> b!293688 (= res!154463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293689 () Bool)

(declare-fun res!154464 () Bool)

(assert (=> b!293689 (=> (not res!154464) (not e!185694))))

(assert (=> b!293689 (= res!154464 (and (= (size!7410 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7410 a!3312))))))

(declare-fun b!293690 () Bool)

(assert (=> b!293690 (= e!185694 e!185696)))

(declare-fun res!154460 () Bool)

(assert (=> b!293690 (=> (not res!154460) (not e!185696))))

(declare-fun lt!145579 () SeekEntryResult!2207)

(assert (=> b!293690 (= res!154460 (or lt!145580 (= lt!145579 (MissingVacant!2207 i!1256))))))

(assert (=> b!293690 (= lt!145580 (= lt!145579 (MissingZero!2207 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14877 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!293690 (= lt!145579 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28788 res!154459) b!293689))

(assert (= (and b!293689 res!154464) b!293687))

(assert (= (and b!293687 res!154462) b!293686))

(assert (= (and b!293686 res!154461) b!293690))

(assert (= (and b!293690 res!154460) b!293688))

(assert (= (and b!293688 res!154463) b!293685))

(declare-fun m!307305 () Bool)

(assert (=> b!293685 m!307305))

(declare-fun m!307307 () Bool)

(assert (=> b!293685 m!307307))

(declare-fun m!307309 () Bool)

(assert (=> b!293685 m!307309))

(declare-fun m!307311 () Bool)

(assert (=> b!293685 m!307311))

(declare-fun m!307313 () Bool)

(assert (=> b!293685 m!307313))

(declare-fun m!307315 () Bool)

(assert (=> b!293687 m!307315))

(declare-fun m!307317 () Bool)

(assert (=> b!293690 m!307317))

(declare-fun m!307319 () Bool)

(assert (=> start!28788 m!307319))

(declare-fun m!307321 () Bool)

(assert (=> start!28788 m!307321))

(declare-fun m!307323 () Bool)

(assert (=> b!293688 m!307323))

(declare-fun m!307325 () Bool)

(assert (=> b!293686 m!307325))

(push 1)

(assert (not b!293685))

(assert (not start!28788))

(assert (not b!293686))

(assert (not b!293690))

(assert (not b!293687))

(assert (not b!293688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66631 () Bool)

(assert (=> d!66631 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293687 d!66631))

(declare-fun d!66635 () Bool)

(declare-fun res!154511 () Bool)

(declare-fun e!185728 () Bool)

(assert (=> d!66635 (=> res!154511 e!185728)))

(assert (=> d!66635 (= res!154511 (= (select (arr!7058 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66635 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185728)))

(declare-fun b!293743 () Bool)

(declare-fun e!185729 () Bool)

(assert (=> b!293743 (= e!185728 e!185729)))

(declare-fun res!154512 () Bool)

(assert (=> b!293743 (=> (not res!154512) (not e!185729))))

(assert (=> b!293743 (= res!154512 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7410 a!3312)))))

(declare-fun b!293744 () Bool)

(assert (=> b!293744 (= e!185729 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66635 (not res!154511)) b!293743))

(assert (= (and b!293743 res!154512) b!293744))

(declare-fun m!307383 () Bool)

(assert (=> d!66635 m!307383))

(declare-fun m!307385 () Bool)

(assert (=> b!293744 m!307385))

(assert (=> b!293686 d!66635))

(declare-fun d!66639 () Bool)

(declare-fun res!154518 () Bool)

(declare-fun e!185738 () Bool)

(assert (=> d!66639 (=> res!154518 e!185738)))

(assert (=> d!66639 (= res!154518 (bvsge #b00000000000000000000000000000000 (size!7410 a!3312)))))

(assert (=> d!66639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185738)))

(declare-fun b!293755 () Bool)

(declare-fun e!185737 () Bool)

(declare-fun call!25684 () Bool)

(assert (=> b!293755 (= e!185737 call!25684)))

(declare-fun bm!25681 () Bool)

(assert (=> bm!25681 (= call!25684 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293756 () Bool)

(declare-fun e!185736 () Bool)

(assert (=> b!293756 (= e!185736 e!185737)))

(declare-fun lt!145633 () (_ BitVec 64))

(assert (=> b!293756 (= lt!145633 (select (arr!7058 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9192 0))(
  ( (Unit!9193) )
))
(declare-fun lt!145632 () Unit!9192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14877 (_ BitVec 64) (_ BitVec 32)) Unit!9192)

(assert (=> b!293756 (= lt!145632 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145633 #b00000000000000000000000000000000))))

(assert (=> b!293756 (arrayContainsKey!0 a!3312 lt!145633 #b00000000000000000000000000000000)))

(declare-fun lt!145634 () Unit!9192)

(assert (=> b!293756 (= lt!145634 lt!145632)))

(declare-fun res!154517 () Bool)

(assert (=> b!293756 (= res!154517 (= (seekEntryOrOpen!0 (select (arr!7058 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2207 #b00000000000000000000000000000000)))))

(assert (=> b!293756 (=> (not res!154517) (not e!185737))))

(declare-fun b!293757 () Bool)

(assert (=> b!293757 (= e!185736 call!25684)))

(declare-fun b!293758 () Bool)

(assert (=> b!293758 (= e!185738 e!185736)))

(declare-fun c!47187 () Bool)

(assert (=> b!293758 (= c!47187 (validKeyInArray!0 (select (arr!7058 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66639 (not res!154518)) b!293758))

(assert (= (and b!293758 c!47187) b!293756))

(assert (= (and b!293758 (not c!47187)) b!293757))

(assert (= (and b!293756 res!154517) b!293755))

(assert (= (or b!293755 b!293757) bm!25681))

(declare-fun m!307387 () Bool)

(assert (=> bm!25681 m!307387))

(assert (=> b!293756 m!307383))

(declare-fun m!307389 () Bool)

(assert (=> b!293756 m!307389))

(declare-fun m!307391 () Bool)

(assert (=> b!293756 m!307391))

(assert (=> b!293756 m!307383))

(declare-fun m!307393 () Bool)

(assert (=> b!293756 m!307393))

(assert (=> b!293758 m!307383))

(assert (=> b!293758 m!307383))

(declare-fun m!307395 () Bool)

(assert (=> b!293758 m!307395))

(assert (=> b!293688 d!66639))

(declare-fun d!66645 () Bool)

(assert (=> d!66645 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28788 d!66645))

(declare-fun d!66651 () Bool)

(assert (=> d!66651 (= (array_inv!5021 a!3312) (bvsge (size!7410 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28788 d!66651))

(declare-fun b!293835 () Bool)

(declare-fun e!185782 () SeekEntryResult!2207)

(assert (=> b!293835 (= e!185782 Undefined!2207)))

(declare-fun b!293836 () Bool)

(declare-fun e!185780 () SeekEntryResult!2207)

(declare-fun lt!145668 () SeekEntryResult!2207)

(assert (=> b!293836 (= e!185780 (Found!2207 (index!11000 lt!145668)))))

(declare-fun b!293837 () Bool)

(assert (=> b!293837 (= e!185782 e!185780)))

(declare-fun lt!145667 () (_ BitVec 64))

(assert (=> b!293837 (= lt!145667 (select (arr!7058 a!3312) (index!11000 lt!145668)))))

(declare-fun c!47222 () Bool)

(assert (=> b!293837 (= c!47222 (= lt!145667 k!2524))))

(declare-fun b!293838 () Bool)

(declare-fun c!47223 () Bool)

(assert (=> b!293838 (= c!47223 (= lt!145667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185781 () SeekEntryResult!2207)

(assert (=> b!293838 (= e!185780 e!185781)))

(declare-fun d!66653 () Bool)

(declare-fun lt!145666 () SeekEntryResult!2207)

(assert (=> d!66653 (and (or (is-Undefined!2207 lt!145666) (not (is-Found!2207 lt!145666)) (and (bvsge (index!10999 lt!145666) #b00000000000000000000000000000000) (bvslt (index!10999 lt!145666) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145666) (is-Found!2207 lt!145666) (not (is-MissingZero!2207 lt!145666)) (and (bvsge (index!10998 lt!145666) #b00000000000000000000000000000000) (bvslt (index!10998 lt!145666) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145666) (is-Found!2207 lt!145666) (is-MissingZero!2207 lt!145666) (not (is-MissingVacant!2207 lt!145666)) (and (bvsge (index!11001 lt!145666) #b00000000000000000000000000000000) (bvslt (index!11001 lt!145666) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145666) (ite (is-Found!2207 lt!145666) (= (select (arr!7058 a!3312) (index!10999 lt!145666)) k!2524) (ite (is-MissingZero!2207 lt!145666) (= (select (arr!7058 a!3312) (index!10998 lt!145666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2207 lt!145666) (= (select (arr!7058 a!3312) (index!11001 lt!145666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66653 (= lt!145666 e!185782)))

(declare-fun c!47221 () Bool)

(assert (=> d!66653 (= c!47221 (and (is-Intermediate!2207 lt!145668) (undefined!3019 lt!145668)))))

(assert (=> d!66653 (= lt!145668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66653 (validMask!0 mask!3809)))

(assert (=> d!66653 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145666)))

(declare-fun b!293839 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14877 (_ BitVec 32)) SeekEntryResult!2207)

(assert (=> b!293839 (= e!185781 (seekKeyOrZeroReturnVacant!0 (x!29186 lt!145668) (index!11000 lt!145668) (index!11000 lt!145668) k!2524 a!3312 mask!3809))))

(declare-fun b!293840 () Bool)

(assert (=> b!293840 (= e!185781 (MissingZero!2207 (index!11000 lt!145668)))))

(assert (= (and d!66653 c!47221) b!293835))

(assert (= (and d!66653 (not c!47221)) b!293837))

(assert (= (and b!293837 c!47222) b!293836))

(assert (= (and b!293837 (not c!47222)) b!293838))

(assert (= (and b!293838 c!47223) b!293840))

(assert (= (and b!293838 (not c!47223)) b!293839))

(declare-fun m!307423 () Bool)

(assert (=> b!293837 m!307423))

(assert (=> d!66653 m!307309))

(declare-fun m!307425 () Bool)

(assert (=> d!66653 m!307425))

(assert (=> d!66653 m!307319))

(declare-fun m!307427 () Bool)

(assert (=> d!66653 m!307427))

(declare-fun m!307429 () Bool)

(assert (=> d!66653 m!307429))

(assert (=> d!66653 m!307309))

(declare-fun m!307431 () Bool)

(assert (=> d!66653 m!307431))

(declare-fun m!307433 () Bool)

(assert (=> b!293839 m!307433))

(assert (=> b!293690 d!66653))

(declare-fun b!293913 () Bool)

(declare-fun lt!145690 () SeekEntryResult!2207)

(assert (=> b!293913 (and (bvsge (index!11000 lt!145690) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145690) (size!7410 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)))))))

(declare-fun res!154563 () Bool)

(assert (=> b!293913 (= res!154563 (= (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) (index!11000 lt!145690)) k!2524))))

(declare-fun e!185832 () Bool)

(assert (=> b!293913 (=> res!154563 e!185832)))

(declare-fun e!185830 () Bool)

(assert (=> b!293913 (= e!185830 e!185832)))

(declare-fun e!185831 () SeekEntryResult!2207)

(declare-fun b!293914 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293914 (= e!185831 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)) mask!3809))))

(declare-fun b!293915 () Bool)

(assert (=> b!293915 (= e!185831 (Intermediate!2207 false lt!145581 #b00000000000000000000000000000000))))

(declare-fun b!293916 () Bool)

(declare-fun e!185829 () SeekEntryResult!2207)

(assert (=> b!293916 (= e!185829 e!185831)))

(declare-fun c!47246 () Bool)

(declare-fun lt!145691 () (_ BitVec 64))

(assert (=> b!293916 (= c!47246 (or (= lt!145691 k!2524) (= (bvadd lt!145691 lt!145691) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293917 () Bool)

(assert (=> b!293917 (= e!185829 (Intermediate!2207 true lt!145581 #b00000000000000000000000000000000))))

(declare-fun b!293918 () Bool)

(assert (=> b!293918 (and (bvsge (index!11000 lt!145690) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145690) (size!7410 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)))))))

(declare-fun res!154564 () Bool)

(assert (=> b!293918 (= res!154564 (= (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) (index!11000 lt!145690)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293918 (=> res!154564 e!185832)))

(declare-fun d!66661 () Bool)

(declare-fun e!185828 () Bool)

(assert (=> d!66661 e!185828))

(declare-fun c!47247 () Bool)

(assert (=> d!66661 (= c!47247 (and (is-Intermediate!2207 lt!145690) (undefined!3019 lt!145690)))))

(assert (=> d!66661 (= lt!145690 e!185829)))

(declare-fun c!47245 () Bool)

(assert (=> d!66661 (= c!47245 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66661 (= lt!145691 (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) lt!145581))))

(assert (=> d!66661 (validMask!0 mask!3809)))

(assert (=> d!66661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145581 k!2524 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)) mask!3809) lt!145690)))

(declare-fun b!293919 () Bool)

(assert (=> b!293919 (= e!185828 (bvsge (x!29186 lt!145690) #b01111111111111111111111111111110))))

(declare-fun b!293920 () Bool)

(assert (=> b!293920 (= e!185828 e!185830)))

(declare-fun res!154565 () Bool)

(assert (=> b!293920 (= res!154565 (and (is-Intermediate!2207 lt!145690) (not (undefined!3019 lt!145690)) (bvslt (x!29186 lt!145690) #b01111111111111111111111111111110) (bvsge (x!29186 lt!145690) #b00000000000000000000000000000000) (bvsge (x!29186 lt!145690) #b00000000000000000000000000000000)))))

(assert (=> b!293920 (=> (not res!154565) (not e!185830))))

(declare-fun b!293921 () Bool)

(assert (=> b!293921 (and (bvsge (index!11000 lt!145690) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145690) (size!7410 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)))))))

(assert (=> b!293921 (= e!185832 (= (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) (index!11000 lt!145690)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66661 c!47245) b!293917))

(assert (= (and d!66661 (not c!47245)) b!293916))

(assert (= (and b!293916 c!47246) b!293915))

(assert (= (and b!293916 (not c!47246)) b!293914))

(assert (= (and d!66661 c!47247) b!293919))

(assert (= (and d!66661 (not c!47247)) b!293920))

(assert (= (and b!293920 res!154565) b!293913))

(assert (= (and b!293913 (not res!154563)) b!293918))

(assert (= (and b!293918 (not res!154564)) b!293921))

(declare-fun m!307467 () Bool)

(assert (=> b!293921 m!307467))

(assert (=> b!293913 m!307467))

(declare-fun m!307469 () Bool)

(assert (=> b!293914 m!307469))

(assert (=> b!293914 m!307469))

(declare-fun m!307471 () Bool)

(assert (=> b!293914 m!307471))

(declare-fun m!307473 () Bool)

(assert (=> d!66661 m!307473))

(assert (=> d!66661 m!307319))

(assert (=> b!293918 m!307467))

(assert (=> b!293685 d!66661))

(declare-fun b!293922 () Bool)

(declare-fun lt!145692 () SeekEntryResult!2207)

(assert (=> b!293922 (and (bvsge (index!11000 lt!145692) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145692) (size!7410 a!3312)))))

(declare-fun res!154566 () Bool)

(assert (=> b!293922 (= res!154566 (= (select (arr!7058 a!3312) (index!11000 lt!145692)) k!2524))))

(declare-fun e!185837 () Bool)

(assert (=> b!293922 (=> res!154566 e!185837)))

(declare-fun e!185835 () Bool)

(assert (=> b!293922 (= e!185835 e!185837)))

(declare-fun b!293923 () Bool)

(declare-fun e!185836 () SeekEntryResult!2207)

(assert (=> b!293923 (= e!185836 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293924 () Bool)

(assert (=> b!293924 (= e!185836 (Intermediate!2207 false lt!145581 #b00000000000000000000000000000000))))

(declare-fun b!293925 () Bool)

(declare-fun e!185834 () SeekEntryResult!2207)

(assert (=> b!293925 (= e!185834 e!185836)))

(declare-fun c!47249 () Bool)

(declare-fun lt!145693 () (_ BitVec 64))

(assert (=> b!293925 (= c!47249 (or (= lt!145693 k!2524) (= (bvadd lt!145693 lt!145693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293926 () Bool)

(assert (=> b!293926 (= e!185834 (Intermediate!2207 true lt!145581 #b00000000000000000000000000000000))))

(declare-fun b!293927 () Bool)

(assert (=> b!293927 (and (bvsge (index!11000 lt!145692) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145692) (size!7410 a!3312)))))

(declare-fun res!154567 () Bool)

(assert (=> b!293927 (= res!154567 (= (select (arr!7058 a!3312) (index!11000 lt!145692)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293927 (=> res!154567 e!185837)))

(declare-fun d!66673 () Bool)

(declare-fun e!185833 () Bool)

(assert (=> d!66673 e!185833))

(declare-fun c!47250 () Bool)

(assert (=> d!66673 (= c!47250 (and (is-Intermediate!2207 lt!145692) (undefined!3019 lt!145692)))))

(assert (=> d!66673 (= lt!145692 e!185834)))

(declare-fun c!47248 () Bool)

(assert (=> d!66673 (= c!47248 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66673 (= lt!145693 (select (arr!7058 a!3312) lt!145581))))

(assert (=> d!66673 (validMask!0 mask!3809)))

(assert (=> d!66673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145581 k!2524 a!3312 mask!3809) lt!145692)))

(declare-fun b!293928 () Bool)

(assert (=> b!293928 (= e!185833 (bvsge (x!29186 lt!145692) #b01111111111111111111111111111110))))

(declare-fun b!293929 () Bool)

(assert (=> b!293929 (= e!185833 e!185835)))

(declare-fun res!154568 () Bool)

(assert (=> b!293929 (= res!154568 (and (is-Intermediate!2207 lt!145692) (not (undefined!3019 lt!145692)) (bvslt (x!29186 lt!145692) #b01111111111111111111111111111110) (bvsge (x!29186 lt!145692) #b00000000000000000000000000000000) (bvsge (x!29186 lt!145692) #b00000000000000000000000000000000)))))

(assert (=> b!293929 (=> (not res!154568) (not e!185835))))

(declare-fun b!293930 () Bool)

(assert (=> b!293930 (and (bvsge (index!11000 lt!145692) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145692) (size!7410 a!3312)))))

(assert (=> b!293930 (= e!185837 (= (select (arr!7058 a!3312) (index!11000 lt!145692)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66673 c!47248) b!293926))

(assert (= (and d!66673 (not c!47248)) b!293925))

(assert (= (and b!293925 c!47249) b!293924))

(assert (= (and b!293925 (not c!47249)) b!293923))

(assert (= (and d!66673 c!47250) b!293928))

(assert (= (and d!66673 (not c!47250)) b!293929))

(assert (= (and b!293929 res!154568) b!293922))

(assert (= (and b!293922 (not res!154566)) b!293927))

(assert (= (and b!293927 (not res!154567)) b!293930))

(declare-fun m!307475 () Bool)

(assert (=> b!293930 m!307475))

(assert (=> b!293922 m!307475))

(assert (=> b!293923 m!307469))

(assert (=> b!293923 m!307469))

(declare-fun m!307477 () Bool)

(assert (=> b!293923 m!307477))

(declare-fun m!307479 () Bool)

(assert (=> d!66673 m!307479))

(assert (=> d!66673 m!307319))

(assert (=> b!293927 m!307475))

(assert (=> b!293685 d!66673))

(declare-fun d!66675 () Bool)

(declare-fun lt!145705 () (_ BitVec 32))

(declare-fun lt!145704 () (_ BitVec 32))

(assert (=> d!66675 (= lt!145705 (bvmul (bvxor lt!145704 (bvlshr lt!145704 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66675 (= lt!145704 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66675 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154569 (let ((h!5276 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29194 (bvmul (bvxor h!5276 (bvlshr h!5276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29194 (bvlshr x!29194 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154569 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154569 #b00000000000000000000000000000000))))))

(assert (=> d!66675 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145705 (bvlshr lt!145705 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293685 d!66675))

(push 1)

(assert (not b!293758))

(assert (not d!66673))

(assert (not b!293744))

(assert (not bm!25681))

(assert (not d!66653))

(assert (not b!293756))

(assert (not b!293914))

(assert (not b!293923))

(assert (not d!66661))

(assert (not b!293839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66677 () Bool)

(declare-fun res!154576 () Bool)

(declare-fun e!185847 () Bool)

(assert (=> d!66677 (=> res!154576 e!185847)))

(assert (=> d!66677 (= res!154576 (= (select (arr!7058 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2524))))

(assert (=> d!66677 (= (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!185847)))

(declare-fun b!293943 () Bool)

(declare-fun e!185848 () Bool)

(assert (=> b!293943 (= e!185847 e!185848)))

(declare-fun res!154577 () Bool)

(assert (=> b!293943 (=> (not res!154577) (not e!185848))))

(assert (=> b!293943 (= res!154577 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7410 a!3312)))))

(declare-fun b!293944 () Bool)

(assert (=> b!293944 (= e!185848 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!66677 (not res!154576)) b!293943))

(assert (= (and b!293943 res!154577) b!293944))

(declare-fun m!307491 () Bool)

(assert (=> d!66677 m!307491))

(declare-fun m!307493 () Bool)

(assert (=> b!293944 m!307493))

(assert (=> b!293744 d!66677))

(declare-fun b!293958 () Bool)

(declare-fun e!185857 () SeekEntryResult!2207)

(assert (=> b!293958 (= e!185857 (MissingVacant!2207 (index!11000 lt!145668)))))

(declare-fun b!293959 () Bool)

(declare-fun c!47260 () Bool)

(declare-fun lt!145713 () (_ BitVec 64))

(assert (=> b!293959 (= c!47260 (= lt!145713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185855 () SeekEntryResult!2207)

(assert (=> b!293959 (= e!185855 e!185857)))

(declare-fun b!293960 () Bool)

(assert (=> b!293960 (= e!185855 (Found!2207 (index!11000 lt!145668)))))

(declare-fun b!293961 () Bool)

(assert (=> b!293961 (= e!185857 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29186 lt!145668) #b00000000000000000000000000000001) (nextIndex!0 (index!11000 lt!145668) (x!29186 lt!145668) mask!3809) (index!11000 lt!145668) k!2524 a!3312 mask!3809))))

(declare-fun b!293962 () Bool)

(declare-fun e!185856 () SeekEntryResult!2207)

(assert (=> b!293962 (= e!185856 Undefined!2207)))

(declare-fun d!66679 () Bool)

(declare-fun lt!145714 () SeekEntryResult!2207)

(assert (=> d!66679 (and (or (is-Undefined!2207 lt!145714) (not (is-Found!2207 lt!145714)) (and (bvsge (index!10999 lt!145714) #b00000000000000000000000000000000) (bvslt (index!10999 lt!145714) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145714) (is-Found!2207 lt!145714) (not (is-MissingVacant!2207 lt!145714)) (not (= (index!11001 lt!145714) (index!11000 lt!145668))) (and (bvsge (index!11001 lt!145714) #b00000000000000000000000000000000) (bvslt (index!11001 lt!145714) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145714) (ite (is-Found!2207 lt!145714) (= (select (arr!7058 a!3312) (index!10999 lt!145714)) k!2524) (and (is-MissingVacant!2207 lt!145714) (= (index!11001 lt!145714) (index!11000 lt!145668)) (= (select (arr!7058 a!3312) (index!11001 lt!145714)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!66679 (= lt!145714 e!185856)))

(declare-fun c!47261 () Bool)

(assert (=> d!66679 (= c!47261 (bvsge (x!29186 lt!145668) #b01111111111111111111111111111110))))

(assert (=> d!66679 (= lt!145713 (select (arr!7058 a!3312) (index!11000 lt!145668)))))

(assert (=> d!66679 (validMask!0 mask!3809)))

(assert (=> d!66679 (= (seekKeyOrZeroReturnVacant!0 (x!29186 lt!145668) (index!11000 lt!145668) (index!11000 lt!145668) k!2524 a!3312 mask!3809) lt!145714)))

(declare-fun b!293957 () Bool)

(assert (=> b!293957 (= e!185856 e!185855)))

(declare-fun c!47262 () Bool)

(assert (=> b!293957 (= c!47262 (= lt!145713 k!2524))))

(assert (= (and d!66679 c!47261) b!293962))

(assert (= (and d!66679 (not c!47261)) b!293957))

(assert (= (and b!293957 c!47262) b!293960))

(assert (= (and b!293957 (not c!47262)) b!293959))

(assert (= (and b!293959 c!47260) b!293958))

(assert (= (and b!293959 (not c!47260)) b!293961))

(declare-fun m!307495 () Bool)

(assert (=> b!293961 m!307495))

(assert (=> b!293961 m!307495))

(declare-fun m!307497 () Bool)

(assert (=> b!293961 m!307497))

(declare-fun m!307499 () Bool)

(assert (=> d!66679 m!307499))

(declare-fun m!307501 () Bool)

(assert (=> d!66679 m!307501))

(assert (=> d!66679 m!307423))

(assert (=> d!66679 m!307319))

(assert (=> b!293839 d!66679))

(declare-fun b!293963 () Bool)

(declare-fun lt!145715 () SeekEntryResult!2207)

(assert (=> b!293963 (and (bvsge (index!11000 lt!145715) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145715) (size!7410 a!3312)))))

(declare-fun res!154578 () Bool)

(assert (=> b!293963 (= res!154578 (= (select (arr!7058 a!3312) (index!11000 lt!145715)) k!2524))))

(declare-fun e!185862 () Bool)

(assert (=> b!293963 (=> res!154578 e!185862)))

(declare-fun e!185860 () Bool)

(assert (=> b!293963 (= e!185860 e!185862)))

(declare-fun e!185861 () SeekEntryResult!2207)

(declare-fun b!293964 () Bool)

(assert (=> b!293964 (= e!185861 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293965 () Bool)

(assert (=> b!293965 (= e!185861 (Intermediate!2207 false (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293966 () Bool)

(declare-fun e!185859 () SeekEntryResult!2207)

(assert (=> b!293966 (= e!185859 e!185861)))

(declare-fun c!47264 () Bool)

(declare-fun lt!145716 () (_ BitVec 64))

(assert (=> b!293966 (= c!47264 (or (= lt!145716 k!2524) (= (bvadd lt!145716 lt!145716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293967 () Bool)

(assert (=> b!293967 (= e!185859 (Intermediate!2207 true (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293968 () Bool)

(assert (=> b!293968 (and (bvsge (index!11000 lt!145715) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145715) (size!7410 a!3312)))))

(declare-fun res!154579 () Bool)

(assert (=> b!293968 (= res!154579 (= (select (arr!7058 a!3312) (index!11000 lt!145715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293968 (=> res!154579 e!185862)))

(declare-fun d!66681 () Bool)

(declare-fun e!185858 () Bool)

(assert (=> d!66681 e!185858))

(declare-fun c!47265 () Bool)

(assert (=> d!66681 (= c!47265 (and (is-Intermediate!2207 lt!145715) (undefined!3019 lt!145715)))))

(assert (=> d!66681 (= lt!145715 e!185859)))

(declare-fun c!47263 () Bool)

(assert (=> d!66681 (= c!47263 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!66681 (= lt!145716 (select (arr!7058 a!3312) (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!66681 (validMask!0 mask!3809)))

(assert (=> d!66681 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809) lt!145715)))

(declare-fun b!293969 () Bool)

(assert (=> b!293969 (= e!185858 (bvsge (x!29186 lt!145715) #b01111111111111111111111111111110))))

(declare-fun b!293970 () Bool)

(assert (=> b!293970 (= e!185858 e!185860)))

(declare-fun res!154580 () Bool)

(assert (=> b!293970 (= res!154580 (and (is-Intermediate!2207 lt!145715) (not (undefined!3019 lt!145715)) (bvslt (x!29186 lt!145715) #b01111111111111111111111111111110) (bvsge (x!29186 lt!145715) #b00000000000000000000000000000000) (bvsge (x!29186 lt!145715) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!293970 (=> (not res!154580) (not e!185860))))

(declare-fun b!293971 () Bool)

(assert (=> b!293971 (and (bvsge (index!11000 lt!145715) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145715) (size!7410 a!3312)))))

(assert (=> b!293971 (= e!185862 (= (select (arr!7058 a!3312) (index!11000 lt!145715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66681 c!47263) b!293967))

(assert (= (and d!66681 (not c!47263)) b!293966))

(assert (= (and b!293966 c!47264) b!293965))

(assert (= (and b!293966 (not c!47264)) b!293964))

(assert (= (and d!66681 c!47265) b!293969))

(assert (= (and d!66681 (not c!47265)) b!293970))

(assert (= (and b!293970 res!154580) b!293963))

(assert (= (and b!293963 (not res!154578)) b!293968))

(assert (= (and b!293968 (not res!154579)) b!293971))

(declare-fun m!307503 () Bool)

(assert (=> b!293971 m!307503))

(assert (=> b!293963 m!307503))

(assert (=> b!293964 m!307469))

(declare-fun m!307505 () Bool)

(assert (=> b!293964 m!307505))

(assert (=> b!293964 m!307505))

(declare-fun m!307507 () Bool)

(assert (=> b!293964 m!307507))

(assert (=> d!66681 m!307469))

(declare-fun m!307509 () Bool)

(assert (=> d!66681 m!307509))

(assert (=> d!66681 m!307319))

(assert (=> b!293968 m!307503))

(assert (=> b!293923 d!66681))

(declare-fun d!66683 () Bool)

(declare-fun lt!145719 () (_ BitVec 32))

(assert (=> d!66683 (and (bvsge lt!145719 #b00000000000000000000000000000000) (bvslt lt!145719 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!66683 (= lt!145719 (choose!52 lt!145581 #b00000000000000000000000000000000 mask!3809))))

(assert (=> d!66683 (validMask!0 mask!3809)))

(assert (=> d!66683 (= (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) lt!145719)))

(declare-fun bs!10443 () Bool)

(assert (= bs!10443 d!66683))

(declare-fun m!307511 () Bool)

(assert (=> bs!10443 m!307511))

(assert (=> bs!10443 m!307319))

(assert (=> b!293923 d!66683))

(declare-fun b!293972 () Bool)

(declare-fun lt!145720 () SeekEntryResult!2207)

(assert (=> b!293972 (and (bvsge (index!11000 lt!145720) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145720) (size!7410 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)))))))

(declare-fun res!154581 () Bool)

(assert (=> b!293972 (= res!154581 (= (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) (index!11000 lt!145720)) k!2524))))

(declare-fun e!185867 () Bool)

(assert (=> b!293972 (=> res!154581 e!185867)))

(declare-fun e!185865 () Bool)

(assert (=> b!293972 (= e!185865 e!185867)))

(declare-fun e!185866 () SeekEntryResult!2207)

(declare-fun b!293973 () Bool)

(assert (=> b!293973 (= e!185866 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)) mask!3809))))

(declare-fun b!293974 () Bool)

(assert (=> b!293974 (= e!185866 (Intermediate!2207 false (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293975 () Bool)

(declare-fun e!185864 () SeekEntryResult!2207)

(assert (=> b!293975 (= e!185864 e!185866)))

(declare-fun c!47267 () Bool)

(declare-fun lt!145721 () (_ BitVec 64))

(assert (=> b!293975 (= c!47267 (or (= lt!145721 k!2524) (= (bvadd lt!145721 lt!145721) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293976 () Bool)

(assert (=> b!293976 (= e!185864 (Intermediate!2207 true (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293977 () Bool)

(assert (=> b!293977 (and (bvsge (index!11000 lt!145720) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145720) (size!7410 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)))))))

(declare-fun res!154582 () Bool)

(assert (=> b!293977 (= res!154582 (= (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) (index!11000 lt!145720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293977 (=> res!154582 e!185867)))

(declare-fun d!66685 () Bool)

(declare-fun e!185863 () Bool)

(assert (=> d!66685 e!185863))

(declare-fun c!47268 () Bool)

(assert (=> d!66685 (= c!47268 (and (is-Intermediate!2207 lt!145720) (undefined!3019 lt!145720)))))

(assert (=> d!66685 (= lt!145720 e!185864)))

(declare-fun c!47266 () Bool)

(assert (=> d!66685 (= c!47266 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!66685 (= lt!145721 (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!66685 (validMask!0 mask!3809)))

(assert (=> d!66685 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145581 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)) mask!3809) lt!145720)))

(declare-fun b!293978 () Bool)

(assert (=> b!293978 (= e!185863 (bvsge (x!29186 lt!145720) #b01111111111111111111111111111110))))

(declare-fun b!293979 () Bool)

(assert (=> b!293979 (= e!185863 e!185865)))

(declare-fun res!154583 () Bool)

(assert (=> b!293979 (= res!154583 (and (is-Intermediate!2207 lt!145720) (not (undefined!3019 lt!145720)) (bvslt (x!29186 lt!145720) #b01111111111111111111111111111110) (bvsge (x!29186 lt!145720) #b00000000000000000000000000000000) (bvsge (x!29186 lt!145720) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!293979 (=> (not res!154583) (not e!185865))))

(declare-fun b!293980 () Bool)

(assert (=> b!293980 (and (bvsge (index!11000 lt!145720) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145720) (size!7410 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312)))))))

(assert (=> b!293980 (= e!185867 (= (select (arr!7058 (array!14878 (store (arr!7058 a!3312) i!1256 k!2524) (size!7410 a!3312))) (index!11000 lt!145720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66685 c!47266) b!293976))

(assert (= (and d!66685 (not c!47266)) b!293975))

(assert (= (and b!293975 c!47267) b!293974))

(assert (= (and b!293975 (not c!47267)) b!293973))

(assert (= (and d!66685 c!47268) b!293978))

(assert (= (and d!66685 (not c!47268)) b!293979))

(assert (= (and b!293979 res!154583) b!293972))

(assert (= (and b!293972 (not res!154581)) b!293977))

(assert (= (and b!293977 (not res!154582)) b!293980))

(declare-fun m!307517 () Bool)

(assert (=> b!293980 m!307517))

(assert (=> b!293972 m!307517))

(assert (=> b!293973 m!307469))

(assert (=> b!293973 m!307505))

(assert (=> b!293973 m!307505))

(declare-fun m!307519 () Bool)

(assert (=> b!293973 m!307519))

(assert (=> d!66685 m!307469))

(declare-fun m!307521 () Bool)

(assert (=> d!66685 m!307521))

(assert (=> d!66685 m!307319))

(assert (=> b!293977 m!307517))

(assert (=> b!293914 d!66685))

(assert (=> b!293914 d!66683))

(assert (=> d!66673 d!66645))

(declare-fun d!66691 () Bool)

(declare-fun res!154587 () Bool)

(declare-fun e!185872 () Bool)

(assert (=> d!66691 (=> res!154587 e!185872)))

(assert (=> d!66691 (= res!154587 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7410 a!3312)))))

(assert (=> d!66691 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!185872)))

(declare-fun b!293983 () Bool)

(declare-fun e!185871 () Bool)

(declare-fun call!25688 () Bool)

(assert (=> b!293983 (= e!185871 call!25688)))

(declare-fun bm!25685 () Bool)

(assert (=> bm!25685 (= call!25688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293984 () Bool)

(declare-fun e!185870 () Bool)

(assert (=> b!293984 (= e!185870 e!185871)))

(declare-fun lt!145723 () (_ BitVec 64))

(assert (=> b!293984 (= lt!145723 (select (arr!7058 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!145722 () Unit!9192)

(assert (=> b!293984 (= lt!145722 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145723 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!293984 (arrayContainsKey!0 a!3312 lt!145723 #b00000000000000000000000000000000)))

(declare-fun lt!145724 () Unit!9192)

(assert (=> b!293984 (= lt!145724 lt!145722)))

(declare-fun res!154586 () Bool)

(assert (=> b!293984 (= res!154586 (= (seekEntryOrOpen!0 (select (arr!7058 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2207 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!293984 (=> (not res!154586) (not e!185871))))

(declare-fun b!293985 () Bool)

(assert (=> b!293985 (= e!185870 call!25688)))

(declare-fun b!293986 () Bool)

(assert (=> b!293986 (= e!185872 e!185870)))

(declare-fun c!47269 () Bool)

(assert (=> b!293986 (= c!47269 (validKeyInArray!0 (select (arr!7058 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!66691 (not res!154587)) b!293986))

(assert (= (and b!293986 c!47269) b!293984))

(assert (= (and b!293986 (not c!47269)) b!293985))

(assert (= (and b!293984 res!154586) b!293983))

(assert (= (or b!293983 b!293985) bm!25685))

(declare-fun m!307523 () Bool)

(assert (=> bm!25685 m!307523))

(assert (=> b!293984 m!307491))

(declare-fun m!307525 () Bool)

(assert (=> b!293984 m!307525))

(declare-fun m!307527 () Bool)

(assert (=> b!293984 m!307527))

(assert (=> b!293984 m!307491))

(declare-fun m!307529 () Bool)

(assert (=> b!293984 m!307529))

(assert (=> b!293986 m!307491))

(assert (=> b!293986 m!307491))

(declare-fun m!307531 () Bool)

(assert (=> b!293986 m!307531))

(assert (=> bm!25681 d!66691))

(declare-fun d!66693 () Bool)

(assert (=> d!66693 (arrayContainsKey!0 a!3312 lt!145633 #b00000000000000000000000000000000)))

(declare-fun lt!145733 () Unit!9192)

(declare-fun choose!13 (array!14877 (_ BitVec 64) (_ BitVec 32)) Unit!9192)

(assert (=> d!66693 (= lt!145733 (choose!13 a!3312 lt!145633 #b00000000000000000000000000000000))))

(assert (=> d!66693 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!66693 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145633 #b00000000000000000000000000000000) lt!145733)))

(declare-fun bs!10445 () Bool)

(assert (= bs!10445 d!66693))

(assert (=> bs!10445 m!307391))

(declare-fun m!307539 () Bool)

(assert (=> bs!10445 m!307539))

(assert (=> b!293756 d!66693))

(declare-fun d!66699 () Bool)

(declare-fun res!154590 () Bool)

(declare-fun e!185878 () Bool)

(assert (=> d!66699 (=> res!154590 e!185878)))

(assert (=> d!66699 (= res!154590 (= (select (arr!7058 a!3312) #b00000000000000000000000000000000) lt!145633))))

(assert (=> d!66699 (= (arrayContainsKey!0 a!3312 lt!145633 #b00000000000000000000000000000000) e!185878)))

(declare-fun b!293995 () Bool)

(declare-fun e!185879 () Bool)

(assert (=> b!293995 (= e!185878 e!185879)))

(declare-fun res!154591 () Bool)

(assert (=> b!293995 (=> (not res!154591) (not e!185879))))

(assert (=> b!293995 (= res!154591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7410 a!3312)))))

(declare-fun b!293996 () Bool)

(assert (=> b!293996 (= e!185879 (arrayContainsKey!0 a!3312 lt!145633 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66699 (not res!154590)) b!293995))

(assert (= (and b!293995 res!154591) b!293996))

(assert (=> d!66699 m!307383))

(declare-fun m!307553 () Bool)

(assert (=> b!293996 m!307553))

(assert (=> b!293756 d!66699))

(declare-fun b!293997 () Bool)

(declare-fun e!185882 () SeekEntryResult!2207)

(assert (=> b!293997 (= e!185882 Undefined!2207)))

(declare-fun b!293998 () Bool)

(declare-fun e!185880 () SeekEntryResult!2207)

(declare-fun lt!145736 () SeekEntryResult!2207)

(assert (=> b!293998 (= e!185880 (Found!2207 (index!11000 lt!145736)))))

(declare-fun b!293999 () Bool)

(assert (=> b!293999 (= e!185882 e!185880)))

(declare-fun lt!145735 () (_ BitVec 64))

(assert (=> b!293999 (= lt!145735 (select (arr!7058 a!3312) (index!11000 lt!145736)))))

(declare-fun c!47274 () Bool)

(assert (=> b!293999 (= c!47274 (= lt!145735 (select (arr!7058 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294000 () Bool)

(declare-fun c!47275 () Bool)

(assert (=> b!294000 (= c!47275 (= lt!145735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185881 () SeekEntryResult!2207)

(assert (=> b!294000 (= e!185880 e!185881)))

(declare-fun d!66705 () Bool)

(declare-fun lt!145734 () SeekEntryResult!2207)

(assert (=> d!66705 (and (or (is-Undefined!2207 lt!145734) (not (is-Found!2207 lt!145734)) (and (bvsge (index!10999 lt!145734) #b00000000000000000000000000000000) (bvslt (index!10999 lt!145734) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145734) (is-Found!2207 lt!145734) (not (is-MissingZero!2207 lt!145734)) (and (bvsge (index!10998 lt!145734) #b00000000000000000000000000000000) (bvslt (index!10998 lt!145734) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145734) (is-Found!2207 lt!145734) (is-MissingZero!2207 lt!145734) (not (is-MissingVacant!2207 lt!145734)) (and (bvsge (index!11001 lt!145734) #b00000000000000000000000000000000) (bvslt (index!11001 lt!145734) (size!7410 a!3312)))) (or (is-Undefined!2207 lt!145734) (ite (is-Found!2207 lt!145734) (= (select (arr!7058 a!3312) (index!10999 lt!145734)) (select (arr!7058 a!3312) #b00000000000000000000000000000000)) (ite (is-MissingZero!2207 lt!145734) (= (select (arr!7058 a!3312) (index!10998 lt!145734)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2207 lt!145734) (= (select (arr!7058 a!3312) (index!11001 lt!145734)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66705 (= lt!145734 e!185882)))

(declare-fun c!47273 () Bool)

(assert (=> d!66705 (= c!47273 (and (is-Intermediate!2207 lt!145736) (undefined!3019 lt!145736)))))

(assert (=> d!66705 (= lt!145736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7058 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7058 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!66705 (validMask!0 mask!3809)))

(assert (=> d!66705 (= (seekEntryOrOpen!0 (select (arr!7058 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!145734)))

(declare-fun b!294001 () Bool)

(assert (=> b!294001 (= e!185881 (seekKeyOrZeroReturnVacant!0 (x!29186 lt!145736) (index!11000 lt!145736) (index!11000 lt!145736) (select (arr!7058 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(declare-fun b!294002 () Bool)

(assert (=> b!294002 (= e!185881 (MissingZero!2207 (index!11000 lt!145736)))))

(assert (= (and d!66705 c!47273) b!293997))

(assert (= (and d!66705 (not c!47273)) b!293999))

(assert (= (and b!293999 c!47274) b!293998))

(assert (= (and b!293999 (not c!47274)) b!294000))

(assert (= (and b!294000 c!47275) b!294002))

(assert (= (and b!294000 (not c!47275)) b!294001))

(declare-fun m!307555 () Bool)

(assert (=> b!293999 m!307555))

(declare-fun m!307557 () Bool)

(assert (=> d!66705 m!307557))

(assert (=> d!66705 m!307383))

(declare-fun m!307561 () Bool)

(assert (=> d!66705 m!307561))

(assert (=> d!66705 m!307319))

(declare-fun m!307563 () Bool)

(assert (=> d!66705 m!307563))

(declare-fun m!307567 () Bool)

(assert (=> d!66705 m!307567))

(assert (=> d!66705 m!307383))

(assert (=> d!66705 m!307557))

(declare-fun m!307571 () Bool)

(assert (=> d!66705 m!307571))

(assert (=> b!294001 m!307383))

(declare-fun m!307575 () Bool)

(assert (=> b!294001 m!307575))

(assert (=> b!293756 d!66705))

(assert (=> d!66661 d!66645))

(declare-fun b!294012 () Bool)

(declare-fun lt!145739 () SeekEntryResult!2207)

(assert (=> b!294012 (and (bvsge (index!11000 lt!145739) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145739) (size!7410 a!3312)))))

(declare-fun res!154595 () Bool)

(assert (=> b!294012 (= res!154595 (= (select (arr!7058 a!3312) (index!11000 lt!145739)) k!2524))))

(declare-fun e!185892 () Bool)

(assert (=> b!294012 (=> res!154595 e!185892)))

(declare-fun e!185890 () Bool)

(assert (=> b!294012 (= e!185890 e!185892)))

(declare-fun b!294013 () Bool)

(declare-fun e!185891 () SeekEntryResult!2207)

(assert (=> b!294013 (= e!185891 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294014 () Bool)

(assert (=> b!294014 (= e!185891 (Intermediate!2207 false (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!294015 () Bool)

(declare-fun e!185889 () SeekEntryResult!2207)

(assert (=> b!294015 (= e!185889 e!185891)))

(declare-fun c!47280 () Bool)

(declare-fun lt!145740 () (_ BitVec 64))

(assert (=> b!294015 (= c!47280 (or (= lt!145740 k!2524) (= (bvadd lt!145740 lt!145740) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294016 () Bool)

(assert (=> b!294016 (= e!185889 (Intermediate!2207 true (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!294017 () Bool)

(assert (=> b!294017 (and (bvsge (index!11000 lt!145739) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145739) (size!7410 a!3312)))))

(declare-fun res!154596 () Bool)

(assert (=> b!294017 (= res!154596 (= (select (arr!7058 a!3312) (index!11000 lt!145739)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294017 (=> res!154596 e!185892)))

(declare-fun d!66707 () Bool)

(declare-fun e!185888 () Bool)

(assert (=> d!66707 e!185888))

(declare-fun c!47281 () Bool)

(assert (=> d!66707 (= c!47281 (and (is-Intermediate!2207 lt!145739) (undefined!3019 lt!145739)))))

(assert (=> d!66707 (= lt!145739 e!185889)))

(declare-fun c!47279 () Bool)

(assert (=> d!66707 (= c!47279 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66707 (= lt!145740 (select (arr!7058 a!3312) (toIndex!0 k!2524 mask!3809)))))

(assert (=> d!66707 (validMask!0 mask!3809)))

(assert (=> d!66707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809) lt!145739)))

(declare-fun b!294018 () Bool)

(assert (=> b!294018 (= e!185888 (bvsge (x!29186 lt!145739) #b01111111111111111111111111111110))))

(declare-fun b!294019 () Bool)

(assert (=> b!294019 (= e!185888 e!185890)))

(declare-fun res!154597 () Bool)

(assert (=> b!294019 (= res!154597 (and (is-Intermediate!2207 lt!145739) (not (undefined!3019 lt!145739)) (bvslt (x!29186 lt!145739) #b01111111111111111111111111111110) (bvsge (x!29186 lt!145739) #b00000000000000000000000000000000) (bvsge (x!29186 lt!145739) #b00000000000000000000000000000000)))))

(assert (=> b!294019 (=> (not res!154597) (not e!185890))))

(declare-fun b!294020 () Bool)

(assert (=> b!294020 (and (bvsge (index!11000 lt!145739) #b00000000000000000000000000000000) (bvslt (index!11000 lt!145739) (size!7410 a!3312)))))

(assert (=> b!294020 (= e!185892 (= (select (arr!7058 a!3312) (index!11000 lt!145739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66707 c!47279) b!294016))

(assert (= (and d!66707 (not c!47279)) b!294015))

(assert (= (and b!294015 c!47280) b!294014))

(assert (= (and b!294015 (not c!47280)) b!294013))

(assert (= (and d!66707 c!47281) b!294018))

(assert (= (and d!66707 (not c!47281)) b!294019))

(assert (= (and b!294019 res!154597) b!294012))

(assert (= (and b!294012 (not res!154595)) b!294017))

(assert (= (and b!294017 (not res!154596)) b!294020))

(declare-fun m!307577 () Bool)

(assert (=> b!294020 m!307577))

(assert (=> b!294012 m!307577))

(assert (=> b!294013 m!307309))

(declare-fun m!307579 () Bool)

(assert (=> b!294013 m!307579))

(assert (=> b!294013 m!307579))

(declare-fun m!307581 () Bool)

(assert (=> b!294013 m!307581))

(assert (=> d!66707 m!307309))

(declare-fun m!307585 () Bool)

(assert (=> d!66707 m!307585))

(assert (=> d!66707 m!307319))

(assert (=> b!294017 m!307577))

(assert (=> d!66653 d!66707))

(assert (=> d!66653 d!66675))

(assert (=> d!66653 d!66645))

(declare-fun d!66711 () Bool)

(assert (=> d!66711 (= (validKeyInArray!0 (select (arr!7058 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7058 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7058 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293758 d!66711))

(push 1)

(assert (not d!66679))

(assert (not d!66705))

(assert (not d!66707))

(assert (not d!66685))

(assert (not b!293986))

(assert (not b!294001))

(assert (not d!66693))

(assert (not d!66681))

(assert (not b!294013))

(assert (not bm!25685))

(assert (not b!293961))

(assert (not b!293964))

(assert (not b!293984))

(assert (not b!293973))

(assert (not b!293996))

(assert (not d!66683))

(assert (not b!293944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

