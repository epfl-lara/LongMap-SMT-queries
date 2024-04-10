; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28516 () Bool)

(assert start!28516)

(declare-fun b!291793 () Bool)

(declare-fun e!184630 () Bool)

(declare-fun e!184631 () Bool)

(assert (=> b!291793 (= e!184630 e!184631)))

(declare-fun res!152997 () Bool)

(assert (=> b!291793 (=> (not res!152997) (not e!184631))))

(declare-fun lt!144397 () Bool)

(declare-datatypes ((SeekEntryResult!2143 0))(
  ( (MissingZero!2143 (index!10742 (_ BitVec 32))) (Found!2143 (index!10743 (_ BitVec 32))) (Intermediate!2143 (undefined!2955 Bool) (index!10744 (_ BitVec 32)) (x!28928 (_ BitVec 32))) (Undefined!2143) (MissingVacant!2143 (index!10745 (_ BitVec 32))) )
))
(declare-fun lt!144393 () SeekEntryResult!2143)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291793 (= res!152997 (or lt!144397 (= lt!144393 (MissingVacant!2143 i!1256))))))

(assert (=> b!291793 (= lt!144397 (= lt!144393 (MissingZero!2143 i!1256)))))

(declare-datatypes ((array!14740 0))(
  ( (array!14741 (arr!6994 (Array (_ BitVec 32) (_ BitVec 64))) (size!7346 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14740)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14740 (_ BitVec 32)) SeekEntryResult!2143)

(assert (=> b!291793 (= lt!144393 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun lt!144395 () SeekEntryResult!2143)

(declare-fun b!291794 () Bool)

(declare-fun lt!144396 () (_ BitVec 32))

(declare-fun e!184634 () Bool)

(assert (=> b!291794 (= e!184634 (not (or (not (= lt!144395 (Intermediate!2143 false (index!10744 lt!144395) (x!28928 lt!144395)))) (bvsgt #b00000000000000000000000000000000 (x!28928 lt!144395)) (and (bvsge lt!144396 #b00000000000000000000000000000000) (bvslt lt!144396 (size!7346 a!3312))))))))

(assert (=> b!291794 (= (index!10744 lt!144395) i!1256)))

(declare-fun b!291795 () Bool)

(declare-fun res!152993 () Bool)

(assert (=> b!291795 (=> (not res!152993) (not e!184630))))

(declare-fun arrayContainsKey!0 (array!14740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291795 (= res!152993 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291796 () Bool)

(declare-fun res!152990 () Bool)

(assert (=> b!291796 (=> (not res!152990) (not e!184630))))

(assert (=> b!291796 (= res!152990 (and (= (size!7346 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7346 a!3312))))))

(declare-fun b!291797 () Bool)

(declare-fun res!152995 () Bool)

(assert (=> b!291797 (=> (not res!152995) (not e!184631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14740 (_ BitVec 32)) Bool)

(assert (=> b!291797 (= res!152995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291798 () Bool)

(declare-fun e!184632 () Bool)

(assert (=> b!291798 (= e!184632 e!184634)))

(declare-fun res!152992 () Bool)

(assert (=> b!291798 (=> (not res!152992) (not e!184634))))

(declare-fun lt!144394 () Bool)

(assert (=> b!291798 (= res!152992 (and (or lt!144394 (not (undefined!2955 lt!144395))) (not lt!144394) (= (select (arr!6994 a!3312) (index!10744 lt!144395)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291798 (= lt!144394 (not (is-Intermediate!2143 lt!144395)))))

(declare-fun b!291799 () Bool)

(declare-fun res!152996 () Bool)

(assert (=> b!291799 (=> (not res!152996) (not e!184630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291799 (= res!152996 (validKeyInArray!0 k!2524))))

(declare-fun b!291800 () Bool)

(assert (=> b!291800 (= e!184631 e!184632)))

(declare-fun res!152991 () Bool)

(assert (=> b!291800 (=> (not res!152991) (not e!184632))))

(assert (=> b!291800 (= res!152991 (and (not lt!144397) (= lt!144393 (MissingVacant!2143 i!1256))))))

(declare-fun lt!144392 () SeekEntryResult!2143)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14740 (_ BitVec 32)) SeekEntryResult!2143)

(assert (=> b!291800 (= lt!144392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144396 k!2524 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312)) mask!3809))))

(assert (=> b!291800 (= lt!144395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144396 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291800 (= lt!144396 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!152994 () Bool)

(assert (=> start!28516 (=> (not res!152994) (not e!184630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28516 (= res!152994 (validMask!0 mask!3809))))

(assert (=> start!28516 e!184630))

(assert (=> start!28516 true))

(declare-fun array_inv!4957 (array!14740) Bool)

(assert (=> start!28516 (array_inv!4957 a!3312)))

(assert (= (and start!28516 res!152994) b!291796))

(assert (= (and b!291796 res!152990) b!291799))

(assert (= (and b!291799 res!152996) b!291795))

(assert (= (and b!291795 res!152993) b!291793))

(assert (= (and b!291793 res!152997) b!291797))

(assert (= (and b!291797 res!152995) b!291800))

(assert (= (and b!291800 res!152991) b!291798))

(assert (= (and b!291798 res!152992) b!291794))

(declare-fun m!305621 () Bool)

(assert (=> b!291793 m!305621))

(declare-fun m!305623 () Bool)

(assert (=> b!291799 m!305623))

(declare-fun m!305625 () Bool)

(assert (=> start!28516 m!305625))

(declare-fun m!305627 () Bool)

(assert (=> start!28516 m!305627))

(declare-fun m!305629 () Bool)

(assert (=> b!291798 m!305629))

(declare-fun m!305631 () Bool)

(assert (=> b!291800 m!305631))

(declare-fun m!305633 () Bool)

(assert (=> b!291800 m!305633))

(declare-fun m!305635 () Bool)

(assert (=> b!291800 m!305635))

(declare-fun m!305637 () Bool)

(assert (=> b!291800 m!305637))

(declare-fun m!305639 () Bool)

(assert (=> b!291795 m!305639))

(declare-fun m!305641 () Bool)

(assert (=> b!291797 m!305641))

(push 1)

(assert (not b!291793))

(assert (not b!291795))

(assert (not b!291799))

(assert (not start!28516))

(assert (not b!291800))

(assert (not b!291797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!291851 () Bool)

(declare-fun e!184668 () Bool)

(declare-fun e!184669 () Bool)

(assert (=> b!291851 (= e!184668 e!184669)))

(declare-fun c!46980 () Bool)

(assert (=> b!291851 (= c!46980 (validKeyInArray!0 (select (arr!6994 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!291852 () Bool)

(declare-fun call!25654 () Bool)

(assert (=> b!291852 (= e!184669 call!25654)))

(declare-fun d!66423 () Bool)

(declare-fun res!153022 () Bool)

(assert (=> d!66423 (=> res!153022 e!184668)))

(assert (=> d!66423 (= res!153022 (bvsge #b00000000000000000000000000000000 (size!7346 a!3312)))))

(assert (=> d!66423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184668)))

(declare-fun b!291853 () Bool)

(declare-fun e!184667 () Bool)

(assert (=> b!291853 (= e!184667 call!25654)))

(declare-fun b!291854 () Bool)

(assert (=> b!291854 (= e!184669 e!184667)))

(declare-fun lt!144419 () (_ BitVec 64))

(assert (=> b!291854 (= lt!144419 (select (arr!6994 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9150 0))(
  ( (Unit!9151) )
))
(declare-fun lt!144418 () Unit!9150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14740 (_ BitVec 64) (_ BitVec 32)) Unit!9150)

(assert (=> b!291854 (= lt!144418 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144419 #b00000000000000000000000000000000))))

(assert (=> b!291854 (arrayContainsKey!0 a!3312 lt!144419 #b00000000000000000000000000000000)))

(declare-fun lt!144420 () Unit!9150)

(assert (=> b!291854 (= lt!144420 lt!144418)))

(declare-fun res!153021 () Bool)

(assert (=> b!291854 (= res!153021 (= (seekEntryOrOpen!0 (select (arr!6994 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2143 #b00000000000000000000000000000000)))))

(assert (=> b!291854 (=> (not res!153021) (not e!184667))))

(declare-fun bm!25651 () Bool)

(assert (=> bm!25651 (= call!25654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66423 (not res!153022)) b!291851))

(assert (= (and b!291851 c!46980) b!291854))

(assert (= (and b!291851 (not c!46980)) b!291852))

(assert (= (and b!291854 res!153021) b!291853))

(assert (= (or b!291853 b!291852) bm!25651))

(declare-fun m!305661 () Bool)

(assert (=> b!291851 m!305661))

(assert (=> b!291851 m!305661))

(declare-fun m!305663 () Bool)

(assert (=> b!291851 m!305663))

(assert (=> b!291854 m!305661))

(declare-fun m!305665 () Bool)

(assert (=> b!291854 m!305665))

(declare-fun m!305667 () Bool)

(assert (=> b!291854 m!305667))

(assert (=> b!291854 m!305661))

(declare-fun m!305669 () Bool)

(assert (=> b!291854 m!305669))

(declare-fun m!305671 () Bool)

(assert (=> bm!25651 m!305671))

(assert (=> b!291797 d!66423))

(declare-fun d!66433 () Bool)

(declare-fun res!153027 () Bool)

(declare-fun e!184680 () Bool)

(assert (=> d!66433 (=> res!153027 e!184680)))

(assert (=> d!66433 (= res!153027 (= (select (arr!6994 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66433 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!184680)))

(declare-fun b!291871 () Bool)

(declare-fun e!184681 () Bool)

(assert (=> b!291871 (= e!184680 e!184681)))

(declare-fun res!153028 () Bool)

(assert (=> b!291871 (=> (not res!153028) (not e!184681))))

(assert (=> b!291871 (= res!153028 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7346 a!3312)))))

(declare-fun b!291872 () Bool)

(assert (=> b!291872 (= e!184681 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66433 (not res!153027)) b!291871))

(assert (= (and b!291871 res!153028) b!291872))

(assert (=> d!66433 m!305661))

(declare-fun m!305673 () Bool)

(assert (=> b!291872 m!305673))

(assert (=> b!291795 d!66433))

(declare-fun d!66435 () Bool)

(declare-fun e!184703 () Bool)

(assert (=> d!66435 e!184703))

(declare-fun c!46999 () Bool)

(declare-fun lt!144438 () SeekEntryResult!2143)

(assert (=> d!66435 (= c!46999 (and (is-Intermediate!2143 lt!144438) (undefined!2955 lt!144438)))))

(declare-fun e!184707 () SeekEntryResult!2143)

(assert (=> d!66435 (= lt!144438 e!184707)))

(declare-fun c!46998 () Bool)

(assert (=> d!66435 (= c!46998 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144439 () (_ BitVec 64))

(assert (=> d!66435 (= lt!144439 (select (arr!6994 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312))) lt!144396))))

(assert (=> d!66435 (validMask!0 mask!3809)))

(assert (=> d!66435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144396 k!2524 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312)) mask!3809) lt!144438)))

(declare-fun b!291907 () Bool)

(assert (=> b!291907 (= e!184707 (Intermediate!2143 true lt!144396 #b00000000000000000000000000000000))))

(declare-fun b!291908 () Bool)

(assert (=> b!291908 (and (bvsge (index!10744 lt!144438) #b00000000000000000000000000000000) (bvslt (index!10744 lt!144438) (size!7346 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312)))))))

(declare-fun res!153043 () Bool)

(assert (=> b!291908 (= res!153043 (= (select (arr!6994 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312))) (index!10744 lt!144438)) k!2524))))

(declare-fun e!184705 () Bool)

(assert (=> b!291908 (=> res!153043 e!184705)))

(declare-fun e!184706 () Bool)

(assert (=> b!291908 (= e!184706 e!184705)))

(declare-fun b!291909 () Bool)

(assert (=> b!291909 (and (bvsge (index!10744 lt!144438) #b00000000000000000000000000000000) (bvslt (index!10744 lt!144438) (size!7346 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312)))))))

(declare-fun res!153041 () Bool)

(assert (=> b!291909 (= res!153041 (= (select (arr!6994 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312))) (index!10744 lt!144438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291909 (=> res!153041 e!184705)))

(declare-fun b!291910 () Bool)

(assert (=> b!291910 (= e!184703 (bvsge (x!28928 lt!144438) #b01111111111111111111111111111110))))

(declare-fun b!291911 () Bool)

(declare-fun e!184704 () SeekEntryResult!2143)

(assert (=> b!291911 (= e!184707 e!184704)))

(declare-fun c!47000 () Bool)

(assert (=> b!291911 (= c!47000 (or (= lt!144439 k!2524) (= (bvadd lt!144439 lt!144439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291912 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291912 (= e!184704 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144396 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312)) mask!3809))))

(declare-fun b!291913 () Bool)

(assert (=> b!291913 (= e!184703 e!184706)))

(declare-fun res!153042 () Bool)

(assert (=> b!291913 (= res!153042 (and (is-Intermediate!2143 lt!144438) (not (undefined!2955 lt!144438)) (bvslt (x!28928 lt!144438) #b01111111111111111111111111111110) (bvsge (x!28928 lt!144438) #b00000000000000000000000000000000) (bvsge (x!28928 lt!144438) #b00000000000000000000000000000000)))))

(assert (=> b!291913 (=> (not res!153042) (not e!184706))))

(declare-fun b!291914 () Bool)

(assert (=> b!291914 (= e!184704 (Intermediate!2143 false lt!144396 #b00000000000000000000000000000000))))

(declare-fun b!291915 () Bool)

(assert (=> b!291915 (and (bvsge (index!10744 lt!144438) #b00000000000000000000000000000000) (bvslt (index!10744 lt!144438) (size!7346 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312)))))))

(assert (=> b!291915 (= e!184705 (= (select (arr!6994 (array!14741 (store (arr!6994 a!3312) i!1256 k!2524) (size!7346 a!3312))) (index!10744 lt!144438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66435 c!46998) b!291907))

(assert (= (and d!66435 (not c!46998)) b!291911))

(assert (= (and b!291911 c!47000) b!291914))

(assert (= (and b!291911 (not c!47000)) b!291912))

(assert (= (and d!66435 c!46999) b!291910))

(assert (= (and d!66435 (not c!46999)) b!291913))

(assert (= (and b!291913 res!153042) b!291908))

(assert (= (and b!291908 (not res!153043)) b!291909))

(assert (= (and b!291909 (not res!153041)) b!291915))

(declare-fun m!305691 () Bool)

(assert (=> d!66435 m!305691))

(assert (=> d!66435 m!305625))

(declare-fun m!305693 () Bool)

(assert (=> b!291915 m!305693))

(assert (=> b!291909 m!305693))

(declare-fun m!305695 () Bool)

(assert (=> b!291912 m!305695))

(assert (=> b!291912 m!305695))

(declare-fun m!305697 () Bool)

(assert (=> b!291912 m!305697))

(assert (=> b!291908 m!305693))

(assert (=> b!291800 d!66435))

(declare-fun d!66451 () Bool)

(declare-fun e!184712 () Bool)

(assert (=> d!66451 e!184712))

(declare-fun c!47006 () Bool)

(declare-fun lt!144442 () SeekEntryResult!2143)

(assert (=> d!66451 (= c!47006 (and (is-Intermediate!2143 lt!144442) (undefined!2955 lt!144442)))))

(declare-fun e!184716 () SeekEntryResult!2143)

(assert (=> d!66451 (= lt!144442 e!184716)))

(declare-fun c!47005 () Bool)

(assert (=> d!66451 (= c!47005 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144443 () (_ BitVec 64))

(assert (=> d!66451 (= lt!144443 (select (arr!6994 a!3312) lt!144396))))

(assert (=> d!66451 (validMask!0 mask!3809)))

(assert (=> d!66451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144396 k!2524 a!3312 mask!3809) lt!144442)))

(declare-fun b!291924 () Bool)

(assert (=> b!291924 (= e!184716 (Intermediate!2143 true lt!144396 #b00000000000000000000000000000000))))

(declare-fun b!291925 () Bool)

(assert (=> b!291925 (and (bvsge (index!10744 lt!144442) #b00000000000000000000000000000000) (bvslt (index!10744 lt!144442) (size!7346 a!3312)))))

(declare-fun res!153046 () Bool)

(assert (=> b!291925 (= res!153046 (= (select (arr!6994 a!3312) (index!10744 lt!144442)) k!2524))))

(declare-fun e!184714 () Bool)

(assert (=> b!291925 (=> res!153046 e!184714)))

(declare-fun e!184715 () Bool)

(assert (=> b!291925 (= e!184715 e!184714)))

(declare-fun b!291926 () Bool)

(assert (=> b!291926 (and (bvsge (index!10744 lt!144442) #b00000000000000000000000000000000) (bvslt (index!10744 lt!144442) (size!7346 a!3312)))))

(declare-fun res!153044 () Bool)

(assert (=> b!291926 (= res!153044 (= (select (arr!6994 a!3312) (index!10744 lt!144442)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291926 (=> res!153044 e!184714)))

(declare-fun b!291927 () Bool)

(assert (=> b!291927 (= e!184712 (bvsge (x!28928 lt!144442) #b01111111111111111111111111111110))))

(declare-fun b!291928 () Bool)

(declare-fun e!184713 () SeekEntryResult!2143)

(assert (=> b!291928 (= e!184716 e!184713)))

(declare-fun c!47007 () Bool)

(assert (=> b!291928 (= c!47007 (or (= lt!144443 k!2524) (= (bvadd lt!144443 lt!144443) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291929 () Bool)

(assert (=> b!291929 (= e!184713 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144396 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!291930 () Bool)

(assert (=> b!291930 (= e!184712 e!184715)))

(declare-fun res!153045 () Bool)

(assert (=> b!291930 (= res!153045 (and (is-Intermediate!2143 lt!144442) (not (undefined!2955 lt!144442)) (bvslt (x!28928 lt!144442) #b01111111111111111111111111111110) (bvsge (x!28928 lt!144442) #b00000000000000000000000000000000) (bvsge (x!28928 lt!144442) #b00000000000000000000000000000000)))))

(assert (=> b!291930 (=> (not res!153045) (not e!184715))))

(declare-fun b!291931 () Bool)

(assert (=> b!291931 (= e!184713 (Intermediate!2143 false lt!144396 #b00000000000000000000000000000000))))

(declare-fun b!291932 () Bool)

(assert (=> b!291932 (and (bvsge (index!10744 lt!144442) #b00000000000000000000000000000000) (bvslt (index!10744 lt!144442) (size!7346 a!3312)))))

(assert (=> b!291932 (= e!184714 (= (select (arr!6994 a!3312) (index!10744 lt!144442)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66451 c!47005) b!291924))

(assert (= (and d!66451 (not c!47005)) b!291928))

(assert (= (and b!291928 c!47007) b!291931))

(assert (= (and b!291928 (not c!47007)) b!291929))

(assert (= (and d!66451 c!47006) b!291927))

(assert (= (and d!66451 (not c!47006)) b!291930))

(assert (= (and b!291930 res!153045) b!291925))

(assert (= (and b!291925 (not res!153046)) b!291926))

(assert (= (and b!291926 (not res!153044)) b!291932))

(declare-fun m!305699 () Bool)

(assert (=> d!66451 m!305699))

(assert (=> d!66451 m!305625))

(declare-fun m!305701 () Bool)

(assert (=> b!291932 m!305701))

(assert (=> b!291926 m!305701))

(assert (=> b!291929 m!305695))

(assert (=> b!291929 m!305695))

(declare-fun m!305703 () Bool)

(assert (=> b!291929 m!305703))

(assert (=> b!291925 m!305701))

(assert (=> b!291800 d!66451))

(declare-fun d!66453 () Bool)

(declare-fun lt!144452 () (_ BitVec 32))

(declare-fun lt!144451 () (_ BitVec 32))

(assert (=> d!66453 (= lt!144452 (bvmul (bvxor lt!144451 (bvlshr lt!144451 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66453 (= lt!144451 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66453 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!153047 (let ((h!5266 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28932 (bvmul (bvxor h!5266 (bvlshr h!5266 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28932 (bvlshr x!28932 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!153047 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!153047 #b00000000000000000000000000000000))))))

(assert (=> d!66453 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!144452 (bvlshr lt!144452 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291800 d!66453))

(declare-fun d!66457 () Bool)

(assert (=> d!66457 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28516 d!66457))

(declare-fun d!66459 () Bool)

(assert (=> d!66459 (= (array_inv!4957 a!3312) (bvsge (size!7346 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28516 d!66459))

(declare-fun d!66461 () Bool)

(assert (=> d!66461 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291799 d!66461))

(declare-fun b!292011 () Bool)

(declare-fun e!184765 () SeekEntryResult!2143)

(declare-fun lt!144493 () SeekEntryResult!2143)

(assert (=> b!292011 (= e!184765 (Found!2143 (index!10744 lt!144493)))))

(declare-fun b!292012 () Bool)

(declare-fun e!184766 () SeekEntryResult!2143)

(assert (=> b!292012 (= e!184766 (MissingZero!2143 (index!10744 lt!144493)))))

(declare-fun b!292013 () Bool)

(declare-fun e!184764 () SeekEntryResult!2143)

(assert (=> b!292013 (= e!184764 e!184765)))

(declare-fun lt!144491 () (_ BitVec 64))

(assert (=> b!292013 (= lt!144491 (select (arr!6994 a!3312) (index!10744 lt!144493)))))

(declare-fun c!47035 () Bool)

(assert (=> b!292013 (= c!47035 (= lt!144491 k!2524))))

(declare-fun b!292014 () Bool)

(declare-fun c!47036 () Bool)

(assert (=> b!292014 (= c!47036 (= lt!144491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!292014 (= e!184765 e!184766)))

(declare-fun b!292015 () Bool)

(assert (=> b!292015 (= e!184764 Undefined!2143)))

(declare-fun b!292016 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14740 (_ BitVec 32)) SeekEntryResult!2143)

(assert (=> b!292016 (= e!184766 (seekKeyOrZeroReturnVacant!0 (x!28928 lt!144493) (index!10744 lt!144493) (index!10744 lt!144493) k!2524 a!3312 mask!3809))))

(declare-fun d!66463 () Bool)

(declare-fun lt!144492 () SeekEntryResult!2143)

(assert (=> d!66463 (and (or (is-Undefined!2143 lt!144492) (not (is-Found!2143 lt!144492)) (and (bvsge (index!10743 lt!144492) #b00000000000000000000000000000000) (bvslt (index!10743 lt!144492) (size!7346 a!3312)))) (or (is-Undefined!2143 lt!144492) (is-Found!2143 lt!144492) (not (is-MissingZero!2143 lt!144492)) (and (bvsge (index!10742 lt!144492) #b00000000000000000000000000000000) (bvslt (index!10742 lt!144492) (size!7346 a!3312)))) (or (is-Undefined!2143 lt!144492) (is-Found!2143 lt!144492) (is-MissingZero!2143 lt!144492) (not (is-MissingVacant!2143 lt!144492)) (and (bvsge (index!10745 lt!144492) #b00000000000000000000000000000000) (bvslt (index!10745 lt!144492) (size!7346 a!3312)))) (or (is-Undefined!2143 lt!144492) (ite (is-Found!2143 lt!144492) (= (select (arr!6994 a!3312) (index!10743 lt!144492)) k!2524) (ite (is-MissingZero!2143 lt!144492) (= (select (arr!6994 a!3312) (index!10742 lt!144492)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2143 lt!144492) (= (select (arr!6994 a!3312) (index!10745 lt!144492)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66463 (= lt!144492 e!184764)))

(declare-fun c!47037 () Bool)

(assert (=> d!66463 (= c!47037 (and (is-Intermediate!2143 lt!144493) (undefined!2955 lt!144493)))))

(assert (=> d!66463 (= lt!144493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66463 (validMask!0 mask!3809)))

(assert (=> d!66463 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!144492)))

(assert (= (and d!66463 c!47037) b!292015))

(assert (= (and d!66463 (not c!47037)) b!292013))

(assert (= (and b!292013 c!47035) b!292011))

(assert (= (and b!292013 (not c!47035)) b!292014))

(assert (= (and b!292014 c!47036) b!292012))

(assert (= (and b!292014 (not c!47036)) b!292016))

(declare-fun m!305751 () Bool)

(assert (=> b!292013 m!305751))

(declare-fun m!305753 () Bool)

(assert (=> b!292016 m!305753))

(assert (=> d!66463 m!305637))

(declare-fun m!305755 () Bool)

(assert (=> d!66463 m!305755))

(assert (=> d!66463 m!305625))

(declare-fun m!305757 () Bool)

(assert (=> d!66463 m!305757))

(assert (=> d!66463 m!305637))

(declare-fun m!305759 () Bool)

(assert (=> d!66463 m!305759))

(declare-fun m!305761 () Bool)

(assert (=> d!66463 m!305761))

(assert (=> b!291793 d!66463))

(push 1)

