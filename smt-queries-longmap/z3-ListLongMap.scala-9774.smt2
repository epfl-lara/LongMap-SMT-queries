; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115804 () Bool)

(assert start!115804)

(declare-fun res!912767 () Bool)

(declare-fun e!775646 () Bool)

(assert (=> start!115804 (=> (not res!912767) (not e!775646))))

(declare-datatypes ((array!92910 0))(
  ( (array!92911 (arr!44878 (Array (_ BitVec 32) (_ BitVec 64))) (size!45430 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92910)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115804 (= res!912767 (and (bvslt (size!45430 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45430 a!3861))))))

(assert (=> start!115804 e!775646))

(declare-fun array_inv!34111 (array!92910) Bool)

(assert (=> start!115804 (array_inv!34111 a!3861)))

(assert (=> start!115804 true))

(declare-fun b!1369238 () Bool)

(declare-fun res!912766 () Bool)

(assert (=> b!1369238 (=> (not res!912766) (not e!775646))))

(declare-datatypes ((List!32024 0))(
  ( (Nil!32021) (Cons!32020 (h!33229 (_ BitVec 64)) (t!46710 List!32024)) )
))
(declare-fun newAcc!98 () List!32024)

(declare-fun contains!9617 (List!32024 (_ BitVec 64)) Bool)

(assert (=> b!1369238 (= res!912766 (not (contains!9617 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369239 () Bool)

(declare-fun e!775645 () Bool)

(assert (=> b!1369239 (= e!775646 e!775645)))

(declare-fun res!912760 () Bool)

(assert (=> b!1369239 (=> (not res!912760) (not e!775645))))

(declare-fun acc!866 () List!32024)

(declare-fun arrayNoDuplicates!0 (array!92910 (_ BitVec 32) List!32024) Bool)

(assert (=> b!1369239 (= res!912760 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45084 0))(
  ( (Unit!45085) )
))
(declare-fun lt!602055 () Unit!45084)

(declare-fun noDuplicateSubseq!242 (List!32024 List!32024) Unit!45084)

(assert (=> b!1369239 (= lt!602055 (noDuplicateSubseq!242 newAcc!98 acc!866))))

(declare-fun b!1369240 () Bool)

(declare-fun res!912759 () Bool)

(assert (=> b!1369240 (=> (not res!912759) (not e!775646))))

(declare-fun subseq!1055 (List!32024 List!32024) Bool)

(assert (=> b!1369240 (= res!912759 (subseq!1055 newAcc!98 acc!866))))

(declare-fun b!1369241 () Bool)

(declare-fun res!912761 () Bool)

(assert (=> b!1369241 (=> (not res!912761) (not e!775646))))

(assert (=> b!1369241 (= res!912761 (not (contains!9617 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369242 () Bool)

(declare-fun res!912765 () Bool)

(assert (=> b!1369242 (=> (not res!912765) (not e!775646))))

(assert (=> b!1369242 (= res!912765 (not (contains!9617 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369243 () Bool)

(declare-fun noDuplicate!2532 (List!32024) Bool)

(assert (=> b!1369243 (= e!775645 (not (noDuplicate!2532 newAcc!98)))))

(declare-fun b!1369244 () Bool)

(declare-fun res!912764 () Bool)

(assert (=> b!1369244 (=> (not res!912764) (not e!775646))))

(assert (=> b!1369244 (= res!912764 (noDuplicate!2532 acc!866))))

(declare-fun b!1369245 () Bool)

(declare-fun res!912762 () Bool)

(assert (=> b!1369245 (=> (not res!912762) (not e!775646))))

(assert (=> b!1369245 (= res!912762 (not (contains!9617 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369246 () Bool)

(declare-fun res!912763 () Bool)

(assert (=> b!1369246 (=> (not res!912763) (not e!775645))))

(assert (=> b!1369246 (= res!912763 (bvsge from!3239 (size!45430 a!3861)))))

(assert (= (and start!115804 res!912767) b!1369244))

(assert (= (and b!1369244 res!912764) b!1369245))

(assert (= (and b!1369245 res!912762) b!1369242))

(assert (= (and b!1369242 res!912765) b!1369241))

(assert (= (and b!1369241 res!912761) b!1369238))

(assert (= (and b!1369238 res!912766) b!1369240))

(assert (= (and b!1369240 res!912759) b!1369239))

(assert (= (and b!1369239 res!912760) b!1369246))

(assert (= (and b!1369246 res!912763) b!1369243))

(declare-fun m!1252593 () Bool)

(assert (=> b!1369242 m!1252593))

(declare-fun m!1252595 () Bool)

(assert (=> b!1369244 m!1252595))

(declare-fun m!1252597 () Bool)

(assert (=> start!115804 m!1252597))

(declare-fun m!1252599 () Bool)

(assert (=> b!1369245 m!1252599))

(declare-fun m!1252601 () Bool)

(assert (=> b!1369241 m!1252601))

(declare-fun m!1252603 () Bool)

(assert (=> b!1369240 m!1252603))

(declare-fun m!1252605 () Bool)

(assert (=> b!1369239 m!1252605))

(declare-fun m!1252607 () Bool)

(assert (=> b!1369239 m!1252607))

(declare-fun m!1252609 () Bool)

(assert (=> b!1369243 m!1252609))

(declare-fun m!1252611 () Bool)

(assert (=> b!1369238 m!1252611))

(check-sat (not b!1369239) (not b!1369243) (not b!1369241) (not b!1369238) (not b!1369240) (not b!1369245) (not b!1369244) (not start!115804) (not b!1369242))
(check-sat)
(get-model)

(declare-fun d!146879 () Bool)

(declare-fun lt!602064 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!719 (List!32024) (InoxSet (_ BitVec 64)))

(assert (=> d!146879 (= lt!602064 (select (content!719 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775671 () Bool)

(assert (=> d!146879 (= lt!602064 e!775671)))

(declare-fun res!912826 () Bool)

(assert (=> d!146879 (=> (not res!912826) (not e!775671))))

(get-info :version)

(assert (=> d!146879 (= res!912826 ((_ is Cons!32020) acc!866))))

(assert (=> d!146879 (= (contains!9617 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602064)))

(declare-fun b!1369305 () Bool)

(declare-fun e!775670 () Bool)

(assert (=> b!1369305 (= e!775671 e!775670)))

(declare-fun res!912827 () Bool)

(assert (=> b!1369305 (=> res!912827 e!775670)))

(assert (=> b!1369305 (= res!912827 (= (h!33229 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369306 () Bool)

(assert (=> b!1369306 (= e!775670 (contains!9617 (t!46710 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146879 res!912826) b!1369305))

(assert (= (and b!1369305 (not res!912827)) b!1369306))

(declare-fun m!1252653 () Bool)

(assert (=> d!146879 m!1252653))

(declare-fun m!1252655 () Bool)

(assert (=> d!146879 m!1252655))

(declare-fun m!1252657 () Bool)

(assert (=> b!1369306 m!1252657))

(assert (=> b!1369245 d!146879))

(declare-fun b!1369332 () Bool)

(declare-fun e!775694 () Bool)

(assert (=> b!1369332 (= e!775694 (subseq!1055 newAcc!98 (t!46710 acc!866)))))

(declare-fun b!1369331 () Bool)

(declare-fun e!775697 () Bool)

(assert (=> b!1369331 (= e!775697 (subseq!1055 (t!46710 newAcc!98) (t!46710 acc!866)))))

(declare-fun b!1369329 () Bool)

(declare-fun e!775695 () Bool)

(declare-fun e!775696 () Bool)

(assert (=> b!1369329 (= e!775695 e!775696)))

(declare-fun res!912852 () Bool)

(assert (=> b!1369329 (=> (not res!912852) (not e!775696))))

(assert (=> b!1369329 (= res!912852 ((_ is Cons!32020) acc!866))))

(declare-fun d!146883 () Bool)

(declare-fun res!912853 () Bool)

(assert (=> d!146883 (=> res!912853 e!775695)))

(assert (=> d!146883 (= res!912853 ((_ is Nil!32021) newAcc!98))))

(assert (=> d!146883 (= (subseq!1055 newAcc!98 acc!866) e!775695)))

(declare-fun b!1369330 () Bool)

(assert (=> b!1369330 (= e!775696 e!775694)))

(declare-fun res!912851 () Bool)

(assert (=> b!1369330 (=> res!912851 e!775694)))

(assert (=> b!1369330 (= res!912851 e!775697)))

(declare-fun res!912850 () Bool)

(assert (=> b!1369330 (=> (not res!912850) (not e!775697))))

(assert (=> b!1369330 (= res!912850 (= (h!33229 newAcc!98) (h!33229 acc!866)))))

(assert (= (and d!146883 (not res!912853)) b!1369329))

(assert (= (and b!1369329 res!912852) b!1369330))

(assert (= (and b!1369330 res!912850) b!1369331))

(assert (= (and b!1369330 (not res!912851)) b!1369332))

(declare-fun m!1252675 () Bool)

(assert (=> b!1369332 m!1252675))

(declare-fun m!1252677 () Bool)

(assert (=> b!1369331 m!1252677))

(assert (=> b!1369240 d!146883))

(declare-fun d!146893 () Bool)

(declare-fun lt!602069 () Bool)

(assert (=> d!146893 (= lt!602069 (select (content!719 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775699 () Bool)

(assert (=> d!146893 (= lt!602069 e!775699)))

(declare-fun res!912854 () Bool)

(assert (=> d!146893 (=> (not res!912854) (not e!775699))))

(assert (=> d!146893 (= res!912854 ((_ is Cons!32020) newAcc!98))))

(assert (=> d!146893 (= (contains!9617 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602069)))

(declare-fun b!1369333 () Bool)

(declare-fun e!775698 () Bool)

(assert (=> b!1369333 (= e!775699 e!775698)))

(declare-fun res!912855 () Bool)

(assert (=> b!1369333 (=> res!912855 e!775698)))

(assert (=> b!1369333 (= res!912855 (= (h!33229 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369334 () Bool)

(assert (=> b!1369334 (= e!775698 (contains!9617 (t!46710 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146893 res!912854) b!1369333))

(assert (= (and b!1369333 (not res!912855)) b!1369334))

(declare-fun m!1252679 () Bool)

(assert (=> d!146893 m!1252679))

(declare-fun m!1252681 () Bool)

(assert (=> d!146893 m!1252681))

(declare-fun m!1252683 () Bool)

(assert (=> b!1369334 m!1252683))

(assert (=> b!1369238 d!146893))

(declare-fun d!146895 () Bool)

(assert (=> d!146895 (= (array_inv!34111 a!3861) (bvsge (size!45430 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115804 d!146895))

(declare-fun d!146897 () Bool)

(declare-fun res!912884 () Bool)

(declare-fun e!775728 () Bool)

(assert (=> d!146897 (=> res!912884 e!775728)))

(assert (=> d!146897 (= res!912884 ((_ is Nil!32021) acc!866))))

(assert (=> d!146897 (= (noDuplicate!2532 acc!866) e!775728)))

(declare-fun b!1369363 () Bool)

(declare-fun e!775729 () Bool)

(assert (=> b!1369363 (= e!775728 e!775729)))

(declare-fun res!912885 () Bool)

(assert (=> b!1369363 (=> (not res!912885) (not e!775729))))

(assert (=> b!1369363 (= res!912885 (not (contains!9617 (t!46710 acc!866) (h!33229 acc!866))))))

(declare-fun b!1369364 () Bool)

(assert (=> b!1369364 (= e!775729 (noDuplicate!2532 (t!46710 acc!866)))))

(assert (= (and d!146897 (not res!912884)) b!1369363))

(assert (= (and b!1369363 res!912885) b!1369364))

(declare-fun m!1252693 () Bool)

(assert (=> b!1369363 m!1252693))

(declare-fun m!1252695 () Bool)

(assert (=> b!1369364 m!1252695))

(assert (=> b!1369244 d!146897))

(declare-fun d!146903 () Bool)

(declare-fun res!912910 () Bool)

(declare-fun e!775761 () Bool)

(assert (=> d!146903 (=> res!912910 e!775761)))

(assert (=> d!146903 (= res!912910 (bvsge from!3239 (size!45430 a!3861)))))

(assert (=> d!146903 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775761)))

(declare-fun b!1369393 () Bool)

(declare-fun e!775756 () Bool)

(assert (=> b!1369393 (= e!775761 e!775756)))

(declare-fun res!912913 () Bool)

(assert (=> b!1369393 (=> (not res!912913) (not e!775756))))

(declare-fun e!775760 () Bool)

(assert (=> b!1369393 (= res!912913 (not e!775760))))

(declare-fun res!912914 () Bool)

(assert (=> b!1369393 (=> (not res!912914) (not e!775760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369393 (= res!912914 (validKeyInArray!0 (select (arr!44878 a!3861) from!3239)))))

(declare-fun b!1369394 () Bool)

(declare-fun e!775758 () Bool)

(declare-fun call!65491 () Bool)

(assert (=> b!1369394 (= e!775758 call!65491)))

(declare-fun b!1369395 () Bool)

(assert (=> b!1369395 (= e!775756 e!775758)))

(declare-fun c!127684 () Bool)

(assert (=> b!1369395 (= c!127684 (validKeyInArray!0 (select (arr!44878 a!3861) from!3239)))))

(declare-fun b!1369396 () Bool)

(assert (=> b!1369396 (= e!775758 call!65491)))

(declare-fun b!1369397 () Bool)

(assert (=> b!1369397 (= e!775760 (contains!9617 acc!866 (select (arr!44878 a!3861) from!3239)))))

(declare-fun bm!65488 () Bool)

(assert (=> bm!65488 (= call!65491 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127684 (Cons!32020 (select (arr!44878 a!3861) from!3239) acc!866) acc!866)))))

(assert (= (and d!146903 (not res!912910)) b!1369393))

(assert (= (and b!1369393 res!912914) b!1369397))

(assert (= (and b!1369393 res!912913) b!1369395))

(assert (= (and b!1369395 c!127684) b!1369394))

(assert (= (and b!1369395 (not c!127684)) b!1369396))

(assert (= (or b!1369394 b!1369396) bm!65488))

(declare-fun m!1252719 () Bool)

(assert (=> b!1369393 m!1252719))

(assert (=> b!1369393 m!1252719))

(declare-fun m!1252721 () Bool)

(assert (=> b!1369393 m!1252721))

(assert (=> b!1369395 m!1252719))

(assert (=> b!1369395 m!1252719))

(assert (=> b!1369395 m!1252721))

(assert (=> b!1369397 m!1252719))

(assert (=> b!1369397 m!1252719))

(declare-fun m!1252723 () Bool)

(assert (=> b!1369397 m!1252723))

(assert (=> bm!65488 m!1252719))

(declare-fun m!1252725 () Bool)

(assert (=> bm!65488 m!1252725))

(assert (=> b!1369239 d!146903))

(declare-fun d!146917 () Bool)

(assert (=> d!146917 (noDuplicate!2532 newAcc!98)))

(declare-fun lt!602077 () Unit!45084)

(declare-fun choose!2010 (List!32024 List!32024) Unit!45084)

(assert (=> d!146917 (= lt!602077 (choose!2010 newAcc!98 acc!866))))

(declare-fun e!775786 () Bool)

(assert (=> d!146917 e!775786))

(declare-fun res!912933 () Bool)

(assert (=> d!146917 (=> (not res!912933) (not e!775786))))

(assert (=> d!146917 (= res!912933 (subseq!1055 newAcc!98 acc!866))))

(assert (=> d!146917 (= (noDuplicateSubseq!242 newAcc!98 acc!866) lt!602077)))

(declare-fun b!1369430 () Bool)

(assert (=> b!1369430 (= e!775786 (noDuplicate!2532 acc!866))))

(assert (= (and d!146917 res!912933) b!1369430))

(assert (=> d!146917 m!1252609))

(declare-fun m!1252735 () Bool)

(assert (=> d!146917 m!1252735))

(assert (=> d!146917 m!1252603))

(assert (=> b!1369430 m!1252595))

(assert (=> b!1369239 d!146917))

(declare-fun d!146921 () Bool)

(declare-fun lt!602078 () Bool)

(assert (=> d!146921 (= lt!602078 (select (content!719 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775788 () Bool)

(assert (=> d!146921 (= lt!602078 e!775788)))

(declare-fun res!912934 () Bool)

(assert (=> d!146921 (=> (not res!912934) (not e!775788))))

(assert (=> d!146921 (= res!912934 ((_ is Cons!32020) acc!866))))

(assert (=> d!146921 (= (contains!9617 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602078)))

(declare-fun b!1369431 () Bool)

(declare-fun e!775787 () Bool)

(assert (=> b!1369431 (= e!775788 e!775787)))

(declare-fun res!912935 () Bool)

(assert (=> b!1369431 (=> res!912935 e!775787)))

(assert (=> b!1369431 (= res!912935 (= (h!33229 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369432 () Bool)

(assert (=> b!1369432 (= e!775787 (contains!9617 (t!46710 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146921 res!912934) b!1369431))

(assert (= (and b!1369431 (not res!912935)) b!1369432))

(assert (=> d!146921 m!1252653))

(declare-fun m!1252743 () Bool)

(assert (=> d!146921 m!1252743))

(declare-fun m!1252747 () Bool)

(assert (=> b!1369432 m!1252747))

(assert (=> b!1369242 d!146921))

(declare-fun d!146923 () Bool)

(declare-fun res!912936 () Bool)

(declare-fun e!775789 () Bool)

(assert (=> d!146923 (=> res!912936 e!775789)))

(assert (=> d!146923 (= res!912936 ((_ is Nil!32021) newAcc!98))))

(assert (=> d!146923 (= (noDuplicate!2532 newAcc!98) e!775789)))

(declare-fun b!1369433 () Bool)

(declare-fun e!775790 () Bool)

(assert (=> b!1369433 (= e!775789 e!775790)))

(declare-fun res!912937 () Bool)

(assert (=> b!1369433 (=> (not res!912937) (not e!775790))))

(assert (=> b!1369433 (= res!912937 (not (contains!9617 (t!46710 newAcc!98) (h!33229 newAcc!98))))))

(declare-fun b!1369434 () Bool)

(assert (=> b!1369434 (= e!775790 (noDuplicate!2532 (t!46710 newAcc!98)))))

(assert (= (and d!146923 (not res!912936)) b!1369433))

(assert (= (and b!1369433 res!912937) b!1369434))

(declare-fun m!1252749 () Bool)

(assert (=> b!1369433 m!1252749))

(declare-fun m!1252751 () Bool)

(assert (=> b!1369434 m!1252751))

(assert (=> b!1369243 d!146923))

(declare-fun d!146927 () Bool)

(declare-fun lt!602079 () Bool)

(assert (=> d!146927 (= lt!602079 (select (content!719 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775792 () Bool)

(assert (=> d!146927 (= lt!602079 e!775792)))

(declare-fun res!912938 () Bool)

(assert (=> d!146927 (=> (not res!912938) (not e!775792))))

(assert (=> d!146927 (= res!912938 ((_ is Cons!32020) newAcc!98))))

(assert (=> d!146927 (= (contains!9617 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602079)))

(declare-fun b!1369435 () Bool)

(declare-fun e!775791 () Bool)

(assert (=> b!1369435 (= e!775792 e!775791)))

(declare-fun res!912939 () Bool)

(assert (=> b!1369435 (=> res!912939 e!775791)))

(assert (=> b!1369435 (= res!912939 (= (h!33229 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1369436 () Bool)

(assert (=> b!1369436 (= e!775791 (contains!9617 (t!46710 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146927 res!912938) b!1369435))

(assert (= (and b!1369435 (not res!912939)) b!1369436))

(assert (=> d!146927 m!1252679))

(declare-fun m!1252753 () Bool)

(assert (=> d!146927 m!1252753))

(declare-fun m!1252755 () Bool)

(assert (=> b!1369436 m!1252755))

(assert (=> b!1369241 d!146927))

(check-sat (not b!1369432) (not b!1369334) (not b!1369332) (not bm!65488) (not d!146879) (not b!1369434) (not b!1369331) (not d!146893) (not b!1369363) (not b!1369433) (not b!1369430) (not d!146917) (not b!1369306) (not b!1369393) (not b!1369395) (not d!146921) (not b!1369397) (not b!1369364) (not b!1369436) (not d!146927))
(check-sat)
