; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63032 () Bool)

(assert start!63032)

(declare-fun b!710480 () Bool)

(declare-fun res!473915 () Bool)

(declare-fun e!399720 () Bool)

(assert (=> b!710480 (=> (not res!473915) (not e!399720))))

(declare-datatypes ((List!13387 0))(
  ( (Nil!13384) (Cons!13383 (h!14428 (_ BitVec 64)) (t!19687 List!13387)) )
))
(declare-fun lt!318335 () List!13387)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3964 (List!13387 (_ BitVec 64)) Bool)

(assert (=> b!710480 (= res!473915 (not (contains!3964 lt!318335 k!2824)))))

(declare-fun b!710481 () Bool)

(declare-fun res!473932 () Bool)

(assert (=> b!710481 (=> (not res!473932) (not e!399720))))

(declare-datatypes ((array!40397 0))(
  ( (array!40398 (arr!19346 (Array (_ BitVec 32) (_ BitVec 64))) (size!19744 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40397)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40397 (_ BitVec 32) List!13387) Bool)

(assert (=> b!710481 (= res!473932 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318335))))

(declare-fun b!710482 () Bool)

(declare-fun res!473926 () Bool)

(declare-fun e!399721 () Bool)

(assert (=> b!710482 (=> (not res!473926) (not e!399721))))

(declare-fun acc!652 () List!13387)

(declare-fun newAcc!49 () List!13387)

(declare-fun subseq!409 (List!13387 List!13387) Bool)

(assert (=> b!710482 (= res!473926 (subseq!409 acc!652 newAcc!49))))

(declare-fun b!710483 () Bool)

(declare-fun res!473912 () Bool)

(assert (=> b!710483 (=> (not res!473912) (not e!399721))))

(assert (=> b!710483 (= res!473912 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!710484 () Bool)

(declare-fun res!473925 () Bool)

(assert (=> b!710484 (=> (not res!473925) (not e!399721))))

(assert (=> b!710484 (= res!473925 (not (contains!3964 acc!652 k!2824)))))

(declare-fun b!710485 () Bool)

(declare-fun res!473930 () Bool)

(assert (=> b!710485 (=> (not res!473930) (not e!399721))))

(assert (=> b!710485 (= res!473930 (not (contains!3964 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710486 () Bool)

(declare-fun res!473934 () Bool)

(assert (=> b!710486 (=> (not res!473934) (not e!399721))))

(assert (=> b!710486 (= res!473934 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19744 a!3591)))))

(declare-fun b!710487 () Bool)

(declare-fun res!473920 () Bool)

(assert (=> b!710487 (=> (not res!473920) (not e!399720))))

(assert (=> b!710487 (= res!473920 (not (contains!3964 lt!318335 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710488 () Bool)

(declare-fun res!473923 () Bool)

(assert (=> b!710488 (=> (not res!473923) (not e!399721))))

(assert (=> b!710488 (= res!473923 (not (contains!3964 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710489 () Bool)

(declare-fun res!473935 () Bool)

(assert (=> b!710489 (=> (not res!473935) (not e!399720))))

(declare-fun arrayContainsKey!0 (array!40397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!710489 (= res!473935 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710491 () Bool)

(declare-fun res!473928 () Bool)

(assert (=> b!710491 (=> (not res!473928) (not e!399721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!710491 (= res!473928 (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)))))

(declare-fun b!710492 () Bool)

(assert (=> b!710492 (= e!399721 e!399720)))

(declare-fun res!473921 () Bool)

(assert (=> b!710492 (=> (not res!473921) (not e!399720))))

(assert (=> b!710492 (= res!473921 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun lt!318334 () List!13387)

(declare-fun $colon$colon!520 (List!13387 (_ BitVec 64)) List!13387)

(assert (=> b!710492 (= lt!318334 ($colon$colon!520 newAcc!49 (select (arr!19346 a!3591) from!2969)))))

(assert (=> b!710492 (= lt!318335 ($colon$colon!520 acc!652 (select (arr!19346 a!3591) from!2969)))))

(declare-fun b!710493 () Bool)

(declare-fun res!473917 () Bool)

(assert (=> b!710493 (=> (not res!473917) (not e!399721))))

(assert (=> b!710493 (= res!473917 (not (contains!3964 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710494 () Bool)

(declare-fun res!473914 () Bool)

(assert (=> b!710494 (=> (not res!473914) (not e!399720))))

(declare-fun noDuplicate!1211 (List!13387) Bool)

(assert (=> b!710494 (= res!473914 (noDuplicate!1211 lt!318335))))

(declare-fun b!710495 () Bool)

(declare-fun res!473916 () Bool)

(assert (=> b!710495 (=> (not res!473916) (not e!399721))))

(assert (=> b!710495 (= res!473916 (noDuplicate!1211 newAcc!49))))

(declare-fun b!710496 () Bool)

(declare-fun res!473927 () Bool)

(assert (=> b!710496 (=> (not res!473927) (not e!399720))))

(assert (=> b!710496 (= res!473927 (noDuplicate!1211 lt!318334))))

(declare-fun b!710497 () Bool)

(declare-fun res!473933 () Bool)

(assert (=> b!710497 (=> (not res!473933) (not e!399721))))

(assert (=> b!710497 (= res!473933 (validKeyInArray!0 k!2824))))

(declare-fun b!710498 () Bool)

(declare-fun res!473924 () Bool)

(assert (=> b!710498 (=> (not res!473924) (not e!399721))))

(declare-fun -!374 (List!13387 (_ BitVec 64)) List!13387)

(assert (=> b!710498 (= res!473924 (= (-!374 newAcc!49 k!2824) acc!652))))

(declare-fun b!710499 () Bool)

(declare-fun res!473931 () Bool)

(assert (=> b!710499 (=> (not res!473931) (not e!399720))))

(assert (=> b!710499 (= res!473931 (not (contains!3964 lt!318335 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710500 () Bool)

(declare-fun res!473929 () Bool)

(assert (=> b!710500 (=> (not res!473929) (not e!399721))))

(assert (=> b!710500 (= res!473929 (noDuplicate!1211 acc!652))))

(declare-fun b!710501 () Bool)

(declare-fun res!473918 () Bool)

(assert (=> b!710501 (=> (not res!473918) (not e!399721))))

(assert (=> b!710501 (= res!473918 (contains!3964 newAcc!49 k!2824))))

(declare-fun b!710502 () Bool)

(declare-fun res!473922 () Bool)

(assert (=> b!710502 (=> (not res!473922) (not e!399721))))

(assert (=> b!710502 (= res!473922 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!710503 () Bool)

(assert (=> b!710503 (= e!399720 (not (subseq!409 lt!318335 lt!318334)))))

(declare-fun b!710490 () Bool)

(declare-fun res!473919 () Bool)

(assert (=> b!710490 (=> (not res!473919) (not e!399721))))

(assert (=> b!710490 (= res!473919 (not (contains!3964 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!473913 () Bool)

(assert (=> start!63032 (=> (not res!473913) (not e!399721))))

(assert (=> start!63032 (= res!473913 (and (bvslt (size!19744 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19744 a!3591))))))

(assert (=> start!63032 e!399721))

(assert (=> start!63032 true))

(declare-fun array_inv!15142 (array!40397) Bool)

(assert (=> start!63032 (array_inv!15142 a!3591)))

(assert (= (and start!63032 res!473913) b!710500))

(assert (= (and b!710500 res!473929) b!710495))

(assert (= (and b!710495 res!473916) b!710485))

(assert (= (and b!710485 res!473930) b!710493))

(assert (= (and b!710493 res!473917) b!710502))

(assert (= (and b!710502 res!473922) b!710484))

(assert (= (and b!710484 res!473925) b!710497))

(assert (= (and b!710497 res!473933) b!710483))

(assert (= (and b!710483 res!473912) b!710482))

(assert (= (and b!710482 res!473926) b!710501))

(assert (= (and b!710501 res!473918) b!710498))

(assert (= (and b!710498 res!473924) b!710490))

(assert (= (and b!710490 res!473919) b!710488))

(assert (= (and b!710488 res!473923) b!710486))

(assert (= (and b!710486 res!473934) b!710491))

(assert (= (and b!710491 res!473928) b!710492))

(assert (= (and b!710492 res!473921) b!710494))

(assert (= (and b!710494 res!473914) b!710496))

(assert (= (and b!710496 res!473927) b!710487))

(assert (= (and b!710487 res!473920) b!710499))

(assert (= (and b!710499 res!473931) b!710489))

(assert (= (and b!710489 res!473935) b!710480))

(assert (= (and b!710480 res!473915) b!710481))

(assert (= (and b!710481 res!473932) b!710503))

(declare-fun m!667593 () Bool)

(assert (=> b!710494 m!667593))

(declare-fun m!667595 () Bool)

(assert (=> b!710493 m!667595))

(declare-fun m!667597 () Bool)

(assert (=> b!710484 m!667597))

(declare-fun m!667599 () Bool)

(assert (=> b!710495 m!667599))

(declare-fun m!667601 () Bool)

(assert (=> start!63032 m!667601))

(declare-fun m!667603 () Bool)

(assert (=> b!710501 m!667603))

(declare-fun m!667605 () Bool)

(assert (=> b!710488 m!667605))

(declare-fun m!667607 () Bool)

(assert (=> b!710503 m!667607))

(declare-fun m!667609 () Bool)

(assert (=> b!710496 m!667609))

(declare-fun m!667611 () Bool)

(assert (=> b!710483 m!667611))

(declare-fun m!667613 () Bool)

(assert (=> b!710482 m!667613))

(declare-fun m!667615 () Bool)

(assert (=> b!710480 m!667615))

(declare-fun m!667617 () Bool)

(assert (=> b!710498 m!667617))

(declare-fun m!667619 () Bool)

(assert (=> b!710490 m!667619))

(declare-fun m!667621 () Bool)

(assert (=> b!710499 m!667621))

(declare-fun m!667623 () Bool)

(assert (=> b!710491 m!667623))

(assert (=> b!710491 m!667623))

(declare-fun m!667625 () Bool)

(assert (=> b!710491 m!667625))

(declare-fun m!667627 () Bool)

(assert (=> b!710500 m!667627))

(declare-fun m!667629 () Bool)

(assert (=> b!710489 m!667629))

(assert (=> b!710492 m!667623))

(assert (=> b!710492 m!667623))

(declare-fun m!667631 () Bool)

(assert (=> b!710492 m!667631))

(assert (=> b!710492 m!667623))

(declare-fun m!667633 () Bool)

(assert (=> b!710492 m!667633))

(declare-fun m!667635 () Bool)

(assert (=> b!710497 m!667635))

(declare-fun m!667637 () Bool)

(assert (=> b!710481 m!667637))

(declare-fun m!667639 () Bool)

(assert (=> b!710487 m!667639))

(declare-fun m!667641 () Bool)

(assert (=> b!710485 m!667641))

(declare-fun m!667643 () Bool)

(assert (=> b!710502 m!667643))

(push 1)

(assert (not b!710492))

(assert (not b!710497))

(assert (not b!710488))

(assert (not b!710494))

(assert (not b!710491))

(assert (not b!710498))

(assert (not b!710501))

(assert (not b!710502))

(assert (not b!710484))

(assert (not b!710500))

(assert (not b!710487))

(assert (not b!710495))

(assert (not b!710481))

(assert (not b!710482))

(assert (not b!710503))

(assert (not b!710490))

(assert (not start!63032))

(assert (not b!710483))

(assert (not b!710499))

(assert (not b!710496))

(assert (not b!710489))

(assert (not b!710480))

(assert (not b!710493))

(assert (not b!710485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97379 () Bool)

(declare-fun lt!318346 () Bool)

(declare-fun content!351 (List!13387) (Set (_ BitVec 64)))

(assert (=> d!97379 (= lt!318346 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!351 newAcc!49)))))

(declare-fun e!399766 () Bool)

(assert (=> d!97379 (= lt!318346 e!399766)))

(declare-fun res!473979 () Bool)

(assert (=> d!97379 (=> (not res!473979) (not e!399766))))

(assert (=> d!97379 (= res!473979 (is-Cons!13383 newAcc!49))))

(assert (=> d!97379 (= (contains!3964 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318346)))

(declare-fun b!710546 () Bool)

(declare-fun e!399765 () Bool)

(assert (=> b!710546 (= e!399766 e!399765)))

(declare-fun res!473978 () Bool)

(assert (=> b!710546 (=> res!473978 e!399765)))

(assert (=> b!710546 (= res!473978 (= (h!14428 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710547 () Bool)

(assert (=> b!710547 (= e!399765 (contains!3964 (t!19687 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97379 res!473979) b!710546))

(assert (= (and b!710546 (not res!473978)) b!710547))

(declare-fun m!667679 () Bool)

(assert (=> d!97379 m!667679))

(declare-fun m!667681 () Bool)

(assert (=> d!97379 m!667681))

(declare-fun m!667683 () Bool)

(assert (=> b!710547 m!667683))

(assert (=> b!710488 d!97379))

(declare-fun d!97393 () Bool)

(declare-fun lt!318347 () Bool)

(assert (=> d!97393 (= lt!318347 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!351 newAcc!49)))))

(declare-fun e!399768 () Bool)

(assert (=> d!97393 (= lt!318347 e!399768)))

(declare-fun res!473981 () Bool)

(assert (=> d!97393 (=> (not res!473981) (not e!399768))))

(assert (=> d!97393 (= res!473981 (is-Cons!13383 newAcc!49))))

(assert (=> d!97393 (= (contains!3964 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318347)))

(declare-fun b!710548 () Bool)

(declare-fun e!399767 () Bool)

(assert (=> b!710548 (= e!399768 e!399767)))

(declare-fun res!473980 () Bool)

(assert (=> b!710548 (=> res!473980 e!399767)))

(assert (=> b!710548 (= res!473980 (= (h!14428 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710549 () Bool)

(assert (=> b!710549 (= e!399767 (contains!3964 (t!19687 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97393 res!473981) b!710548))

(assert (= (and b!710548 (not res!473980)) b!710549))

(assert (=> d!97393 m!667679))

(declare-fun m!667685 () Bool)

(assert (=> d!97393 m!667685))

(declare-fun m!667687 () Bool)

(assert (=> b!710549 m!667687))

(assert (=> b!710490 d!97393))

(declare-fun d!97395 () Bool)

(declare-fun res!474008 () Bool)

(declare-fun e!399797 () Bool)

(assert (=> d!97395 (=> res!474008 e!399797)))

(assert (=> d!97395 (= res!474008 (= (select (arr!19346 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97395 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399797)))

(declare-fun b!710580 () Bool)

(declare-fun e!399798 () Bool)

(assert (=> b!710580 (= e!399797 e!399798)))

(declare-fun res!474009 () Bool)

(assert (=> b!710580 (=> (not res!474009) (not e!399798))))

(assert (=> b!710580 (= res!474009 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19744 a!3591)))))

(declare-fun b!710581 () Bool)

(assert (=> b!710581 (= e!399798 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97395 (not res!474008)) b!710580))

(assert (= (and b!710580 res!474009) b!710581))

(declare-fun m!667697 () Bool)

(assert (=> d!97395 m!667697))

(declare-fun m!667699 () Bool)

(assert (=> b!710581 m!667699))

(assert (=> b!710489 d!97395))

(declare-fun d!97401 () Bool)

(declare-fun lt!318348 () Bool)

(assert (=> d!97401 (= lt!318348 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!351 acc!652)))))

(declare-fun e!399804 () Bool)

(assert (=> d!97401 (= lt!318348 e!399804)))

(declare-fun res!474015 () Bool)

(assert (=> d!97401 (=> (not res!474015) (not e!399804))))

(assert (=> d!97401 (= res!474015 (is-Cons!13383 acc!652))))

(assert (=> d!97401 (= (contains!3964 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318348)))

(declare-fun b!710586 () Bool)

(declare-fun e!399803 () Bool)

(assert (=> b!710586 (= e!399804 e!399803)))

(declare-fun res!474014 () Bool)

(assert (=> b!710586 (=> res!474014 e!399803)))

(assert (=> b!710586 (= res!474014 (= (h!14428 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710587 () Bool)

(assert (=> b!710587 (= e!399803 (contains!3964 (t!19687 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97401 res!474015) b!710586))

(assert (= (and b!710586 (not res!474014)) b!710587))

(declare-fun m!667701 () Bool)

(assert (=> d!97401 m!667701))

(declare-fun m!667703 () Bool)

(assert (=> d!97401 m!667703))

(declare-fun m!667705 () Bool)

(assert (=> b!710587 m!667705))

(assert (=> b!710485 d!97401))

(declare-fun d!97403 () Bool)

(declare-fun lt!318349 () Bool)

(assert (=> d!97403 (= lt!318349 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!351 lt!318335)))))

(declare-fun e!399806 () Bool)

(assert (=> d!97403 (= lt!318349 e!399806)))

(declare-fun res!474017 () Bool)

(assert (=> d!97403 (=> (not res!474017) (not e!399806))))

(assert (=> d!97403 (= res!474017 (is-Cons!13383 lt!318335))))

(assert (=> d!97403 (= (contains!3964 lt!318335 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318349)))

(declare-fun b!710588 () Bool)

(declare-fun e!399805 () Bool)

(assert (=> b!710588 (= e!399806 e!399805)))

(declare-fun res!474016 () Bool)

(assert (=> b!710588 (=> res!474016 e!399805)))

(assert (=> b!710588 (= res!474016 (= (h!14428 lt!318335) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710589 () Bool)

(assert (=> b!710589 (= e!399805 (contains!3964 (t!19687 lt!318335) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97403 res!474017) b!710588))

(assert (= (and b!710588 (not res!474016)) b!710589))

(declare-fun m!667707 () Bool)

(assert (=> d!97403 m!667707))

(declare-fun m!667709 () Bool)

(assert (=> d!97403 m!667709))

(declare-fun m!667711 () Bool)

(assert (=> b!710589 m!667711))

(assert (=> b!710487 d!97403))

(declare-fun d!97405 () Bool)

(declare-fun res!474040 () Bool)

(declare-fun e!399831 () Bool)

(assert (=> d!97405 (=> res!474040 e!399831)))

(assert (=> d!97405 (= res!474040 (is-Nil!13384 lt!318335))))

(assert (=> d!97405 (= (noDuplicate!1211 lt!318335) e!399831)))

(declare-fun b!710616 () Bool)

(declare-fun e!399832 () Bool)

(assert (=> b!710616 (= e!399831 e!399832)))

(declare-fun res!474041 () Bool)

(assert (=> b!710616 (=> (not res!474041) (not e!399832))))

(assert (=> b!710616 (= res!474041 (not (contains!3964 (t!19687 lt!318335) (h!14428 lt!318335))))))

(declare-fun b!710617 () Bool)

(assert (=> b!710617 (= e!399832 (noDuplicate!1211 (t!19687 lt!318335)))))

(assert (= (and d!97405 (not res!474040)) b!710616))

(assert (= (and b!710616 res!474041) b!710617))

(declare-fun m!667737 () Bool)

(assert (=> b!710616 m!667737))

(declare-fun m!667741 () Bool)

(assert (=> b!710617 m!667741))

(assert (=> b!710494 d!97405))

(declare-fun d!97419 () Bool)

(declare-fun lt!318353 () Bool)

(assert (=> d!97419 (= lt!318353 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!351 acc!652)))))

(declare-fun e!399838 () Bool)

(assert (=> d!97419 (= lt!318353 e!399838)))

(declare-fun res!474047 () Bool)

(assert (=> d!97419 (=> (not res!474047) (not e!399838))))

(assert (=> d!97419 (= res!474047 (is-Cons!13383 acc!652))))

(assert (=> d!97419 (= (contains!3964 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318353)))

(declare-fun b!710622 () Bool)

(declare-fun e!399837 () Bool)

(assert (=> b!710622 (= e!399838 e!399837)))

(declare-fun res!474045 () Bool)

(assert (=> b!710622 (=> res!474045 e!399837)))

(assert (=> b!710622 (= res!474045 (= (h!14428 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710623 () Bool)

(assert (=> b!710623 (= e!399837 (contains!3964 (t!19687 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97419 res!474047) b!710622))

(assert (= (and b!710622 (not res!474045)) b!710623))

(assert (=> d!97419 m!667701))

(declare-fun m!667755 () Bool)

(assert (=> d!97419 m!667755))

(declare-fun m!667757 () Bool)

(assert (=> b!710623 m!667757))

(assert (=> b!710493 d!97419))

(declare-fun d!97427 () Bool)

(assert (=> d!97427 (= (array_inv!15142 a!3591) (bvsge (size!19744 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63032 d!97427))

(declare-fun d!97433 () Bool)

(declare-fun res!474054 () Bool)

(declare-fun e!399845 () Bool)

(assert (=> d!97433 (=> res!474054 e!399845)))

(assert (=> d!97433 (= res!474054 (is-Nil!13384 newAcc!49))))

(assert (=> d!97433 (= (noDuplicate!1211 newAcc!49) e!399845)))

(declare-fun b!710630 () Bool)

(declare-fun e!399846 () Bool)

(assert (=> b!710630 (= e!399845 e!399846)))

(declare-fun res!474055 () Bool)

(assert (=> b!710630 (=> (not res!474055) (not e!399846))))

(assert (=> b!710630 (= res!474055 (not (contains!3964 (t!19687 newAcc!49) (h!14428 newAcc!49))))))

(declare-fun b!710631 () Bool)

(assert (=> b!710631 (= e!399846 (noDuplicate!1211 (t!19687 newAcc!49)))))

(assert (= (and d!97433 (not res!474054)) b!710630))

(assert (= (and b!710630 res!474055) b!710631))

(declare-fun m!667773 () Bool)

(assert (=> b!710630 m!667773))

(declare-fun m!667777 () Bool)

(assert (=> b!710631 m!667777))

(assert (=> b!710495 d!97433))

(declare-fun d!97439 () Bool)

(assert (=> d!97439 (= (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)) (and (not (= (select (arr!19346 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19346 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710491 d!97439))

(declare-fun d!97441 () Bool)

(assert (=> d!97441 (= ($colon$colon!520 newAcc!49 (select (arr!19346 a!3591) from!2969)) (Cons!13383 (select (arr!19346 a!3591) from!2969) newAcc!49))))

(assert (=> b!710492 d!97441))

(declare-fun d!97443 () Bool)

(assert (=> d!97443 (= ($colon$colon!520 acc!652 (select (arr!19346 a!3591) from!2969)) (Cons!13383 (select (arr!19346 a!3591) from!2969) acc!652))))

(assert (=> b!710492 d!97443))

(declare-fun d!97445 () Bool)

(declare-fun lt!318359 () Bool)

(assert (=> d!97445 (= lt!318359 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!351 lt!318335)))))

(declare-fun e!399856 () Bool)

(assert (=> d!97445 (= lt!318359 e!399856)))

(declare-fun res!474065 () Bool)

(assert (=> d!97445 (=> (not res!474065) (not e!399856))))

(assert (=> d!97445 (= res!474065 (is-Cons!13383 lt!318335))))

(assert (=> d!97445 (= (contains!3964 lt!318335 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318359)))

(declare-fun b!710640 () Bool)

(declare-fun e!399855 () Bool)

(assert (=> b!710640 (= e!399856 e!399855)))

(declare-fun res!474064 () Bool)

(assert (=> b!710640 (=> res!474064 e!399855)))

(assert (=> b!710640 (= res!474064 (= (h!14428 lt!318335) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710641 () Bool)

(assert (=> b!710641 (= e!399855 (contains!3964 (t!19687 lt!318335) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97445 res!474065) b!710640))

(assert (= (and b!710640 (not res!474064)) b!710641))

(assert (=> d!97445 m!667707))

(declare-fun m!667787 () Bool)

(assert (=> d!97445 m!667787))

(declare-fun m!667790 () Bool)

(assert (=> b!710641 m!667790))

(assert (=> b!710499 d!97445))

(declare-fun d!97450 () Bool)

(declare-fun res!474070 () Bool)

(declare-fun e!399861 () Bool)

(assert (=> d!97450 (=> res!474070 e!399861)))

(assert (=> d!97450 (= res!474070 (is-Nil!13384 acc!652))))

(assert (=> d!97450 (= (noDuplicate!1211 acc!652) e!399861)))

(declare-fun b!710646 () Bool)

(declare-fun e!399862 () Bool)

(assert (=> b!710646 (= e!399861 e!399862)))

(declare-fun res!474071 () Bool)

(assert (=> b!710646 (=> (not res!474071) (not e!399862))))

(assert (=> b!710646 (= res!474071 (not (contains!3964 (t!19687 acc!652) (h!14428 acc!652))))))

(declare-fun b!710647 () Bool)

(assert (=> b!710647 (= e!399862 (noDuplicate!1211 (t!19687 acc!652)))))

(assert (= (and d!97450 (not res!474070)) b!710646))

(assert (= (and b!710646 res!474071) b!710647))

(declare-fun m!667793 () Bool)

(assert (=> b!710646 m!667793))

(declare-fun m!667795 () Bool)

(assert (=> b!710647 m!667795))

(assert (=> b!710500 d!97450))

(declare-fun d!97453 () Bool)

(declare-fun res!474076 () Bool)

(declare-fun e!399869 () Bool)

(assert (=> d!97453 (=> res!474076 e!399869)))

(assert (=> d!97453 (= res!474076 (is-Nil!13384 lt!318334))))

(assert (=> d!97453 (= (noDuplicate!1211 lt!318334) e!399869)))

(declare-fun b!710656 () Bool)

(declare-fun e!399870 () Bool)

(assert (=> b!710656 (= e!399869 e!399870)))

(declare-fun res!474077 () Bool)

(assert (=> b!710656 (=> (not res!474077) (not e!399870))))

(assert (=> b!710656 (= res!474077 (not (contains!3964 (t!19687 lt!318334) (h!14428 lt!318334))))))

(declare-fun b!710657 () Bool)

(assert (=> b!710657 (= e!399870 (noDuplicate!1211 (t!19687 lt!318334)))))

(assert (= (and d!97453 (not res!474076)) b!710656))

(assert (= (and b!710656 res!474077) b!710657))

(declare-fun m!667797 () Bool)

(assert (=> b!710656 m!667797))

(declare-fun m!667799 () Bool)

(assert (=> b!710657 m!667799))

(assert (=> b!710496 d!97453))

(declare-fun b!710695 () Bool)

(declare-fun e!399899 () List!13387)

(declare-fun e!399898 () List!13387)

(assert (=> b!710695 (= e!399899 e!399898)))

(declare-fun c!78670 () Bool)

(assert (=> b!710695 (= c!78670 (= k!2824 (h!14428 newAcc!49)))))

(declare-fun b!710697 () Bool)

(declare-fun call!34487 () List!13387)

(assert (=> b!710697 (= e!399898 call!34487)))

(declare-fun b!710699 () Bool)

(declare-fun e!399900 () Bool)

(declare-fun lt!318367 () List!13387)

(assert (=> b!710699 (= e!399900 (= (content!351 lt!318367) (setminus (content!351 newAcc!49) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!710703 () Bool)

(assert (=> b!710703 (= e!399899 Nil!13384)))

(declare-fun bm!34485 () Bool)

(assert (=> bm!34485 (= call!34487 (-!374 (t!19687 newAcc!49) k!2824))))

(declare-fun d!97455 () Bool)

(assert (=> d!97455 e!399900))

(declare-fun res!474090 () Bool)

(assert (=> d!97455 (=> (not res!474090) (not e!399900))))

(declare-fun size!19747 (List!13387) Int)

(assert (=> d!97455 (= res!474090 (<= (size!19747 lt!318367) (size!19747 newAcc!49)))))

(assert (=> d!97455 (= lt!318367 e!399899)))

(declare-fun c!78672 () Bool)

(assert (=> d!97455 (= c!78672 (is-Cons!13383 newAcc!49))))

(assert (=> d!97455 (= (-!374 newAcc!49 k!2824) lt!318367)))

(declare-fun b!710701 () Bool)

(assert (=> b!710701 (= e!399898 (Cons!13383 (h!14428 newAcc!49) call!34487))))

(assert (= (and d!97455 c!78672) b!710695))

(assert (= (and d!97455 (not c!78672)) b!710703))

(assert (= (and b!710695 c!78670) b!710697))

(assert (= (and b!710695 (not c!78670)) b!710701))

(assert (= (or b!710697 b!710701) bm!34485))

(assert (= (and d!97455 res!474090) b!710699))

(declare-fun m!667812 () Bool)

(assert (=> b!710699 m!667812))

(assert (=> b!710699 m!667679))

(declare-fun m!667819 () Bool)

(assert (=> b!710699 m!667819))

(declare-fun m!667821 () Bool)

(assert (=> bm!34485 m!667821))

(declare-fun m!667825 () Bool)

(assert (=> d!97455 m!667825))

(declare-fun m!667829 () Bool)

(assert (=> d!97455 m!667829))

(assert (=> b!710498 d!97455))

(declare-fun d!97463 () Bool)

(assert (=> d!97463 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710497 d!97463))

(declare-fun d!97465 () Bool)

(declare-fun res!474126 () Bool)

(declare-fun e!399944 () Bool)

(assert (=> d!97465 (=> res!474126 e!399944)))

(assert (=> d!97465 (= res!474126 (bvsge from!2969 (size!19744 a!3591)))))

(assert (=> d!97465 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399944)))

(declare-fun call!34493 () Bool)

(declare-fun c!78679 () Bool)

(declare-fun bm!34490 () Bool)

(assert (=> bm!34490 (= call!34493 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78679 (Cons!13383 (select (arr!19346 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!710749 () Bool)

(declare-fun e!399943 () Bool)

(assert (=> b!710749 (= e!399943 call!34493)))

(declare-fun b!710750 () Bool)

(assert (=> b!710750 (= e!399943 call!34493)))

(declare-fun b!710751 () Bool)

(declare-fun e!399946 () Bool)

(assert (=> b!710751 (= e!399946 e!399943)))

(assert (=> b!710751 (= c!78679 (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)))))

(declare-fun e!399945 () Bool)

(declare-fun b!710752 () Bool)

(assert (=> b!710752 (= e!399945 (contains!3964 acc!652 (select (arr!19346 a!3591) from!2969)))))

(declare-fun b!710753 () Bool)

(assert (=> b!710753 (= e!399944 e!399946)))

(declare-fun res!474125 () Bool)

(assert (=> b!710753 (=> (not res!474125) (not e!399946))))

(assert (=> b!710753 (= res!474125 (not e!399945))))

(declare-fun res!474127 () Bool)

(assert (=> b!710753 (=> (not res!474127) (not e!399945))))

(assert (=> b!710753 (= res!474127 (validKeyInArray!0 (select (arr!19346 a!3591) from!2969)))))

(assert (= (and d!97465 (not res!474126)) b!710753))

(assert (= (and b!710753 res!474127) b!710752))

(assert (= (and b!710753 res!474125) b!710751))

(assert (= (and b!710751 c!78679) b!710750))

(assert (= (and b!710751 (not c!78679)) b!710749))

(assert (= (or b!710750 b!710749) bm!34490))

(assert (=> bm!34490 m!667623))

(declare-fun m!667889 () Bool)

(assert (=> bm!34490 m!667889))

(assert (=> b!710751 m!667623))

(assert (=> b!710751 m!667623))

(assert (=> b!710751 m!667625))

(assert (=> b!710752 m!667623))

(assert (=> b!710752 m!667623))

(declare-fun m!667891 () Bool)

(assert (=> b!710752 m!667891))

(assert (=> b!710753 m!667623))

(assert (=> b!710753 m!667623))

(assert (=> b!710753 m!667625))

(assert (=> b!710483 d!97465))

(declare-fun d!97505 () Bool)

(declare-fun lt!318375 () Bool)

(assert (=> d!97505 (= lt!318375 (member k!2824 (content!351 acc!652)))))

(declare-fun e!399948 () Bool)

(assert (=> d!97505 (= lt!318375 e!399948)))

(declare-fun res!474129 () Bool)

(assert (=> d!97505 (=> (not res!474129) (not e!399948))))

(assert (=> d!97505 (= res!474129 (is-Cons!13383 acc!652))))

(assert (=> d!97505 (= (contains!3964 acc!652 k!2824) lt!318375)))

(declare-fun b!710754 () Bool)

(declare-fun e!399947 () Bool)

(assert (=> b!710754 (= e!399948 e!399947)))

(declare-fun res!474128 () Bool)

