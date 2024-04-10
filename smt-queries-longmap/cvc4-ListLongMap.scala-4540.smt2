; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63152 () Bool)

(assert start!63152)

(declare-fun b!711501 () Bool)

(declare-fun res!474826 () Bool)

(declare-fun e!400286 () Bool)

(assert (=> b!711501 (=> (not res!474826) (not e!400286))))

(declare-datatypes ((List!13393 0))(
  ( (Nil!13390) (Cons!13389 (h!14434 (_ BitVec 64)) (t!19699 List!13393)) )
))
(declare-fun newAcc!49 () List!13393)

(declare-fun contains!3970 (List!13393 (_ BitVec 64)) Bool)

(assert (=> b!711501 (= res!474826 (not (contains!3970 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!474829 () Bool)

(assert (=> start!63152 (=> (not res!474829) (not e!400286))))

(declare-datatypes ((array!40415 0))(
  ( (array!40416 (arr!19352 (Array (_ BitVec 32) (_ BitVec 64))) (size!19754 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40415)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63152 (= res!474829 (and (bvslt (size!19754 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19754 a!3591))))))

(assert (=> start!63152 e!400286))

(assert (=> start!63152 true))

(declare-fun array_inv!15148 (array!40415) Bool)

(assert (=> start!63152 (array_inv!15148 a!3591)))

(declare-fun b!711502 () Bool)

(declare-fun res!474833 () Bool)

(assert (=> b!711502 (=> (not res!474833) (not e!400286))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!711502 (= res!474833 (contains!3970 newAcc!49 k!2824))))

(declare-fun b!711503 () Bool)

(declare-fun res!474830 () Bool)

(declare-fun e!400284 () Bool)

(assert (=> b!711503 (=> (not res!474830) (not e!400284))))

(declare-fun lt!318458 () List!13393)

(declare-fun noDuplicate!1217 (List!13393) Bool)

(assert (=> b!711503 (= res!474830 (noDuplicate!1217 lt!318458))))

(declare-fun b!711504 () Bool)

(declare-fun res!474823 () Bool)

(assert (=> b!711504 (=> (not res!474823) (not e!400286))))

(declare-fun acc!652 () List!13393)

(assert (=> b!711504 (= res!474823 (not (contains!3970 acc!652 k!2824)))))

(declare-fun b!711505 () Bool)

(declare-fun res!474831 () Bool)

(assert (=> b!711505 (=> (not res!474831) (not e!400284))))

(assert (=> b!711505 (= res!474831 (not (contains!3970 lt!318458 k!2824)))))

(declare-fun b!711506 () Bool)

(declare-fun res!474825 () Bool)

(assert (=> b!711506 (=> (not res!474825) (not e!400286))))

(declare-fun arrayContainsKey!0 (array!40415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!711506 (= res!474825 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!711507 () Bool)

(declare-fun res!474824 () Bool)

(assert (=> b!711507 (=> (not res!474824) (not e!400286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!711507 (= res!474824 (validKeyInArray!0 (select (arr!19352 a!3591) from!2969)))))

(declare-fun b!711508 () Bool)

(assert (=> b!711508 (= e!400286 e!400284)))

(declare-fun res!474814 () Bool)

(assert (=> b!711508 (=> (not res!474814) (not e!400284))))

(assert (=> b!711508 (= res!474814 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun lt!318457 () List!13393)

(declare-fun $colon$colon!526 (List!13393 (_ BitVec 64)) List!13393)

(assert (=> b!711508 (= lt!318457 ($colon$colon!526 newAcc!49 (select (arr!19352 a!3591) from!2969)))))

(assert (=> b!711508 (= lt!318458 ($colon$colon!526 acc!652 (select (arr!19352 a!3591) from!2969)))))

(declare-fun b!711509 () Bool)

(declare-fun res!474832 () Bool)

(assert (=> b!711509 (=> (not res!474832) (not e!400284))))

(assert (=> b!711509 (= res!474832 (not (contains!3970 lt!318458 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711510 () Bool)

(declare-fun res!474822 () Bool)

(assert (=> b!711510 (=> (not res!474822) (not e!400286))))

(assert (=> b!711510 (= res!474822 (not (contains!3970 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711511 () Bool)

(declare-fun res!474834 () Bool)

(assert (=> b!711511 (=> (not res!474834) (not e!400284))))

(assert (=> b!711511 (= res!474834 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711512 () Bool)

(declare-fun res!474819 () Bool)

(assert (=> b!711512 (=> (not res!474819) (not e!400286))))

(assert (=> b!711512 (= res!474819 (not (contains!3970 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711513 () Bool)

(declare-fun res!474816 () Bool)

(assert (=> b!711513 (=> (not res!474816) (not e!400284))))

(assert (=> b!711513 (= res!474816 (contains!3970 lt!318457 k!2824))))

(declare-fun b!711514 () Bool)

(declare-fun res!474821 () Bool)

(assert (=> b!711514 (=> (not res!474821) (not e!400284))))

(assert (=> b!711514 (= res!474821 (not (contains!3970 lt!318458 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711515 () Bool)

(declare-fun res!474820 () Bool)

(assert (=> b!711515 (=> (not res!474820) (not e!400286))))

(declare-fun subseq!415 (List!13393 List!13393) Bool)

(assert (=> b!711515 (= res!474820 (subseq!415 acc!652 newAcc!49))))

(declare-fun b!711516 () Bool)

(declare-fun res!474813 () Bool)

(assert (=> b!711516 (=> (not res!474813) (not e!400284))))

(assert (=> b!711516 (= res!474813 (noDuplicate!1217 lt!318457))))

(declare-fun b!711517 () Bool)

(declare-fun res!474827 () Bool)

(assert (=> b!711517 (=> (not res!474827) (not e!400286))))

(assert (=> b!711517 (= res!474827 (noDuplicate!1217 acc!652))))

(declare-fun b!711518 () Bool)

(declare-fun res!474838 () Bool)

(assert (=> b!711518 (=> (not res!474838) (not e!400286))))

(assert (=> b!711518 (= res!474838 (noDuplicate!1217 newAcc!49))))

(declare-fun b!711519 () Bool)

(declare-fun res!474835 () Bool)

(assert (=> b!711519 (=> (not res!474835) (not e!400286))))

(assert (=> b!711519 (= res!474835 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19754 a!3591)))))

(declare-fun b!711520 () Bool)

(declare-fun -!380 (List!13393 (_ BitVec 64)) List!13393)

(assert (=> b!711520 (= e!400284 (not (= (-!380 lt!318457 k!2824) lt!318458)))))

(declare-fun b!711521 () Bool)

(declare-fun res!474837 () Bool)

(assert (=> b!711521 (=> (not res!474837) (not e!400286))))

(assert (=> b!711521 (= res!474837 (validKeyInArray!0 k!2824))))

(declare-fun b!711522 () Bool)

(declare-fun res!474818 () Bool)

(assert (=> b!711522 (=> (not res!474818) (not e!400286))))

(declare-fun arrayNoDuplicates!0 (array!40415 (_ BitVec 32) List!13393) Bool)

(assert (=> b!711522 (= res!474818 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!711523 () Bool)

(declare-fun res!474817 () Bool)

(assert (=> b!711523 (=> (not res!474817) (not e!400284))))

(assert (=> b!711523 (= res!474817 (subseq!415 lt!318458 lt!318457))))

(declare-fun b!711524 () Bool)

(declare-fun res!474828 () Bool)

(assert (=> b!711524 (=> (not res!474828) (not e!400286))))

(assert (=> b!711524 (= res!474828 (not (contains!3970 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711525 () Bool)

(declare-fun res!474815 () Bool)

(assert (=> b!711525 (=> (not res!474815) (not e!400284))))

(assert (=> b!711525 (= res!474815 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318458))))

(declare-fun b!711526 () Bool)

(declare-fun res!474836 () Bool)

(assert (=> b!711526 (=> (not res!474836) (not e!400286))))

(assert (=> b!711526 (= res!474836 (= (-!380 newAcc!49 k!2824) acc!652))))

(assert (= (and start!63152 res!474829) b!711517))

(assert (= (and b!711517 res!474827) b!711518))

(assert (= (and b!711518 res!474838) b!711524))

(assert (= (and b!711524 res!474828) b!711510))

(assert (= (and b!711510 res!474822) b!711506))

(assert (= (and b!711506 res!474825) b!711504))

(assert (= (and b!711504 res!474823) b!711521))

(assert (= (and b!711521 res!474837) b!711522))

(assert (= (and b!711522 res!474818) b!711515))

(assert (= (and b!711515 res!474820) b!711502))

(assert (= (and b!711502 res!474833) b!711526))

(assert (= (and b!711526 res!474836) b!711512))

(assert (= (and b!711512 res!474819) b!711501))

(assert (= (and b!711501 res!474826) b!711519))

(assert (= (and b!711519 res!474835) b!711507))

(assert (= (and b!711507 res!474824) b!711508))

(assert (= (and b!711508 res!474814) b!711503))

(assert (= (and b!711503 res!474830) b!711516))

(assert (= (and b!711516 res!474813) b!711509))

(assert (= (and b!711509 res!474832) b!711514))

(assert (= (and b!711514 res!474821) b!711511))

(assert (= (and b!711511 res!474834) b!711505))

(assert (= (and b!711505 res!474831) b!711525))

(assert (= (and b!711525 res!474815) b!711523))

(assert (= (and b!711523 res!474817) b!711513))

(assert (= (and b!711513 res!474816) b!711520))

(declare-fun m!668489 () Bool)

(assert (=> b!711514 m!668489))

(declare-fun m!668491 () Bool)

(assert (=> b!711523 m!668491))

(declare-fun m!668493 () Bool)

(assert (=> b!711508 m!668493))

(assert (=> b!711508 m!668493))

(declare-fun m!668495 () Bool)

(assert (=> b!711508 m!668495))

(assert (=> b!711508 m!668493))

(declare-fun m!668497 () Bool)

(assert (=> b!711508 m!668497))

(declare-fun m!668499 () Bool)

(assert (=> b!711522 m!668499))

(declare-fun m!668501 () Bool)

(assert (=> b!711516 m!668501))

(declare-fun m!668503 () Bool)

(assert (=> b!711513 m!668503))

(declare-fun m!668505 () Bool)

(assert (=> b!711509 m!668505))

(declare-fun m!668507 () Bool)

(assert (=> b!711510 m!668507))

(declare-fun m!668509 () Bool)

(assert (=> b!711520 m!668509))

(declare-fun m!668511 () Bool)

(assert (=> b!711517 m!668511))

(assert (=> b!711507 m!668493))

(assert (=> b!711507 m!668493))

(declare-fun m!668513 () Bool)

(assert (=> b!711507 m!668513))

(declare-fun m!668515 () Bool)

(assert (=> b!711524 m!668515))

(declare-fun m!668517 () Bool)

(assert (=> b!711515 m!668517))

(declare-fun m!668519 () Bool)

(assert (=> b!711512 m!668519))

(declare-fun m!668521 () Bool)

(assert (=> b!711501 m!668521))

(declare-fun m!668523 () Bool)

(assert (=> b!711518 m!668523))

(declare-fun m!668525 () Bool)

(assert (=> b!711511 m!668525))

(declare-fun m!668527 () Bool)

(assert (=> b!711505 m!668527))

(declare-fun m!668529 () Bool)

(assert (=> b!711504 m!668529))

(declare-fun m!668531 () Bool)

(assert (=> start!63152 m!668531))

(declare-fun m!668533 () Bool)

(assert (=> b!711525 m!668533))

(declare-fun m!668535 () Bool)

(assert (=> b!711526 m!668535))

(declare-fun m!668537 () Bool)

(assert (=> b!711503 m!668537))

(declare-fun m!668539 () Bool)

(assert (=> b!711506 m!668539))

(declare-fun m!668541 () Bool)

(assert (=> b!711521 m!668541))

(declare-fun m!668543 () Bool)

(assert (=> b!711502 m!668543))

(push 1)

(assert (not b!711526))

(assert (not b!711523))

(assert (not b!711521))

(assert (not b!711501))

(assert (not b!711518))

(assert (not b!711502))

(assert (not b!711513))

(assert (not b!711514))

(assert (not b!711505))

(assert (not b!711517))

(assert (not b!711515))

(assert (not start!63152))

(assert (not b!711525))

(assert (not b!711503))

(assert (not b!711509))

(assert (not b!711520))

(assert (not b!711510))

(assert (not b!711506))

(assert (not b!711511))

(assert (not b!711508))

(assert (not b!711524))

(assert (not b!711522))

(assert (not b!711504))

(assert (not b!711507))

(assert (not b!711516))

(assert (not b!711512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!400335 () Bool)

(declare-fun b!711580 () Bool)

(declare-fun lt!318467 () List!13393)

(declare-fun content!356 (List!13393) (Set (_ BitVec 64)))

(assert (=> b!711580 (= e!400335 (= (content!356 lt!318467) (setminus (content!356 lt!318457) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun bm!34518 () Bool)

(declare-fun call!34521 () List!13393)

(assert (=> bm!34518 (= call!34521 (-!380 (t!19699 lt!318457) k!2824))))

(declare-fun b!711581 () Bool)

(declare-fun e!400334 () List!13393)

(declare-fun e!400336 () List!13393)

(assert (=> b!711581 (= e!400334 e!400336)))

(declare-fun c!78718 () Bool)

(assert (=> b!711581 (= c!78718 (= k!2824 (h!14434 lt!318457)))))

(declare-fun b!711583 () Bool)

(assert (=> b!711583 (= e!400334 Nil!13390)))

(declare-fun b!711584 () Bool)

(assert (=> b!711584 (= e!400336 call!34521)))

(declare-fun d!97685 () Bool)

(assert (=> d!97685 e!400335))

(declare-fun res!474878 () Bool)

(assert (=> d!97685 (=> (not res!474878) (not e!400335))))

(declare-fun size!19755 (List!13393) Int)

(assert (=> d!97685 (= res!474878 (<= (size!19755 lt!318467) (size!19755 lt!318457)))))

(assert (=> d!97685 (= lt!318467 e!400334)))

(declare-fun c!78719 () Bool)

(assert (=> d!97685 (= c!78719 (is-Cons!13389 lt!318457))))

(assert (=> d!97685 (= (-!380 lt!318457 k!2824) lt!318467)))

(declare-fun b!711582 () Bool)

(assert (=> b!711582 (= e!400336 (Cons!13389 (h!14434 lt!318457) call!34521))))

(assert (= (and d!97685 c!78719) b!711581))

(assert (= (and d!97685 (not c!78719)) b!711583))

(assert (= (and b!711581 c!78718) b!711584))

(assert (= (and b!711581 (not c!78718)) b!711582))

(assert (= (or b!711584 b!711582) bm!34518))

(assert (= (and d!97685 res!474878) b!711580))

(declare-fun m!668579 () Bool)

(assert (=> b!711580 m!668579))

(declare-fun m!668581 () Bool)

(assert (=> b!711580 m!668581))

(declare-fun m!668583 () Bool)

(assert (=> b!711580 m!668583))

(declare-fun m!668585 () Bool)

(assert (=> bm!34518 m!668585))

(declare-fun m!668587 () Bool)

(assert (=> d!97685 m!668587))

(declare-fun m!668589 () Bool)

(assert (=> d!97685 m!668589))

(assert (=> b!711520 d!97685))

(declare-fun b!711611 () Bool)

(declare-fun e!400364 () Bool)

(declare-fun e!400366 () Bool)

(assert (=> b!711611 (= e!400364 e!400366)))

(declare-fun res!474906 () Bool)

(assert (=> b!711611 (=> (not res!474906) (not e!400366))))

(assert (=> b!711611 (= res!474906 (is-Cons!13389 lt!318457))))

(declare-fun b!711612 () Bool)

(declare-fun e!400363 () Bool)

(assert (=> b!711612 (= e!400366 e!400363)))

(declare-fun res!474905 () Bool)

(assert (=> b!711612 (=> res!474905 e!400363)))

(declare-fun e!400365 () Bool)

(assert (=> b!711612 (= res!474905 e!400365)))

(declare-fun res!474908 () Bool)

(assert (=> b!711612 (=> (not res!474908) (not e!400365))))

(assert (=> b!711612 (= res!474908 (= (h!14434 lt!318458) (h!14434 lt!318457)))))

(declare-fun b!711613 () Bool)

(assert (=> b!711613 (= e!400365 (subseq!415 (t!19699 lt!318458) (t!19699 lt!318457)))))

(declare-fun b!711614 () Bool)

(assert (=> b!711614 (= e!400363 (subseq!415 lt!318458 (t!19699 lt!318457)))))

(declare-fun d!97701 () Bool)

(declare-fun res!474907 () Bool)

(assert (=> d!97701 (=> res!474907 e!400364)))

(assert (=> d!97701 (= res!474907 (is-Nil!13390 lt!318458))))

(assert (=> d!97701 (= (subseq!415 lt!318458 lt!318457) e!400364)))

(assert (= (and d!97701 (not res!474907)) b!711611))

(assert (= (and b!711611 res!474906) b!711612))

(assert (= (and b!711612 res!474908) b!711613))

(assert (= (and b!711612 (not res!474905)) b!711614))

(declare-fun m!668605 () Bool)

(assert (=> b!711613 m!668605))

(declare-fun m!668607 () Bool)

(assert (=> b!711614 m!668607))

(assert (=> b!711523 d!97701))

(declare-fun d!97709 () Bool)

(declare-fun lt!318475 () Bool)

(assert (=> d!97709 (= lt!318475 (member k!2824 (content!356 newAcc!49)))))

(declare-fun e!400388 () Bool)

(assert (=> d!97709 (= lt!318475 e!400388)))

(declare-fun res!474928 () Bool)

(assert (=> d!97709 (=> (not res!474928) (not e!400388))))

(assert (=> d!97709 (= res!474928 (is-Cons!13389 newAcc!49))))

(assert (=> d!97709 (= (contains!3970 newAcc!49 k!2824) lt!318475)))

(declare-fun b!711637 () Bool)

(declare-fun e!400387 () Bool)

(assert (=> b!711637 (= e!400388 e!400387)))

(declare-fun res!474927 () Bool)

(assert (=> b!711637 (=> res!474927 e!400387)))

(assert (=> b!711637 (= res!474927 (= (h!14434 newAcc!49) k!2824))))

(declare-fun b!711638 () Bool)

(assert (=> b!711638 (= e!400387 (contains!3970 (t!19699 newAcc!49) k!2824))))

(assert (= (and d!97709 res!474928) b!711637))

(assert (= (and b!711637 (not res!474927)) b!711638))

(declare-fun m!668623 () Bool)

(assert (=> d!97709 m!668623))

(declare-fun m!668625 () Bool)

(assert (=> d!97709 m!668625))

(declare-fun m!668627 () Bool)

(assert (=> b!711638 m!668627))

(assert (=> b!711502 d!97709))

(declare-fun d!97717 () Bool)

(declare-fun lt!318476 () Bool)

(assert (=> d!97717 (= lt!318476 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!356 newAcc!49)))))

(declare-fun e!400390 () Bool)

(assert (=> d!97717 (= lt!318476 e!400390)))

(declare-fun res!474930 () Bool)

(assert (=> d!97717 (=> (not res!474930) (not e!400390))))

(assert (=> d!97717 (= res!474930 (is-Cons!13389 newAcc!49))))

(assert (=> d!97717 (= (contains!3970 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318476)))

(declare-fun b!711639 () Bool)

(declare-fun e!400389 () Bool)

(assert (=> b!711639 (= e!400390 e!400389)))

(declare-fun res!474929 () Bool)

(assert (=> b!711639 (=> res!474929 e!400389)))

(assert (=> b!711639 (= res!474929 (= (h!14434 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711640 () Bool)

(assert (=> b!711640 (= e!400389 (contains!3970 (t!19699 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97717 res!474930) b!711639))

(assert (= (and b!711639 (not res!474929)) b!711640))

(assert (=> d!97717 m!668623))

(declare-fun m!668629 () Bool)

(assert (=> d!97717 m!668629))

(declare-fun m!668631 () Bool)

(assert (=> b!711640 m!668631))

(assert (=> b!711501 d!97717))

(declare-fun b!711681 () Bool)

(declare-fun e!400423 () Bool)

(declare-fun call!34530 () Bool)

(assert (=> b!711681 (= e!400423 call!34530)))

(declare-fun b!711682 () Bool)

(declare-fun e!400426 () Bool)

(declare-fun e!400425 () Bool)

(assert (=> b!711682 (= e!400426 e!400425)))

(declare-fun res!474953 () Bool)

(assert (=> b!711682 (=> (not res!474953) (not e!400425))))

(declare-fun e!400424 () Bool)

(assert (=> b!711682 (= res!474953 (not e!400424))))

(declare-fun res!474955 () Bool)

(assert (=> b!711682 (=> (not res!474955) (not e!400424))))

(assert (=> b!711682 (= res!474955 (validKeyInArray!0 (select (arr!19352 a!3591) from!2969)))))

(declare-fun d!97719 () Bool)

(declare-fun res!474954 () Bool)

(assert (=> d!97719 (=> res!474954 e!400426)))

(assert (=> d!97719 (= res!474954 (bvsge from!2969 (size!19754 a!3591)))))

(assert (=> d!97719 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400426)))

(declare-fun b!711683 () Bool)

(assert (=> b!711683 (= e!400424 (contains!3970 acc!652 (select (arr!19352 a!3591) from!2969)))))

(declare-fun b!711684 () Bool)

(assert (=> b!711684 (= e!400425 e!400423)))

(declare-fun c!78731 () Bool)

(assert (=> b!711684 (= c!78731 (validKeyInArray!0 (select (arr!19352 a!3591) from!2969)))))

(declare-fun b!711685 () Bool)

(assert (=> b!711685 (= e!400423 call!34530)))

(declare-fun bm!34527 () Bool)

(assert (=> bm!34527 (= call!34530 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78731 (Cons!13389 (select (arr!19352 a!3591) from!2969) acc!652) acc!652)))))

(assert (= (and d!97719 (not res!474954)) b!711682))

(assert (= (and b!711682 res!474955) b!711683))

(assert (= (and b!711682 res!474953) b!711684))

(assert (= (and b!711684 c!78731) b!711681))

(assert (= (and b!711684 (not c!78731)) b!711685))

(assert (= (or b!711681 b!711685) bm!34527))

(assert (=> b!711682 m!668493))

(assert (=> b!711682 m!668493))

(assert (=> b!711682 m!668513))

(assert (=> b!711683 m!668493))

(assert (=> b!711683 m!668493))

(declare-fun m!668673 () Bool)

(assert (=> b!711683 m!668673))

(assert (=> b!711684 m!668493))

(assert (=> b!711684 m!668493))

(assert (=> b!711684 m!668513))

(assert (=> bm!34527 m!668493))

(declare-fun m!668675 () Bool)

(assert (=> bm!34527 m!668675))

(assert (=> b!711522 d!97719))

(declare-fun d!97743 () Bool)

(assert (=> d!97743 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711521 d!97743))

(declare-fun d!97751 () Bool)

(assert (=> d!97751 (= (array_inv!15148 a!3591) (bvsge (size!19754 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63152 d!97751))

(declare-fun b!711707 () Bool)

(declare-fun e!400447 () Bool)

(declare-fun lt!318487 () List!13393)

(assert (=> b!711707 (= e!400447 (= (content!356 lt!318487) (setminus (content!356 newAcc!49) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun bm!34529 () Bool)

(declare-fun call!34532 () List!13393)

(assert (=> bm!34529 (= call!34532 (-!380 (t!19699 newAcc!49) k!2824))))

(declare-fun b!711708 () Bool)

(declare-fun e!400446 () List!13393)

(declare-fun e!400448 () List!13393)

(assert (=> b!711708 (= e!400446 e!400448)))

(declare-fun c!78734 () Bool)

(assert (=> b!711708 (= c!78734 (= k!2824 (h!14434 newAcc!49)))))

(declare-fun b!711710 () Bool)

(assert (=> b!711710 (= e!400446 Nil!13390)))

(declare-fun b!711711 () Bool)

(assert (=> b!711711 (= e!400448 call!34532)))

(declare-fun d!97753 () Bool)

(assert (=> d!97753 e!400447))

(declare-fun res!474973 () Bool)

(assert (=> d!97753 (=> (not res!474973) (not e!400447))))

(assert (=> d!97753 (= res!474973 (<= (size!19755 lt!318487) (size!19755 newAcc!49)))))

(assert (=> d!97753 (= lt!318487 e!400446)))

(declare-fun c!78735 () Bool)

(assert (=> d!97753 (= c!78735 (is-Cons!13389 newAcc!49))))

(assert (=> d!97753 (= (-!380 newAcc!49 k!2824) lt!318487)))

(declare-fun b!711709 () Bool)

(assert (=> b!711709 (= e!400448 (Cons!13389 (h!14434 newAcc!49) call!34532))))

(assert (= (and d!97753 c!78735) b!711708))

(assert (= (and d!97753 (not c!78735)) b!711710))

(assert (= (and b!711708 c!78734) b!711711))

(assert (= (and b!711708 (not c!78734)) b!711709))

(assert (= (or b!711711 b!711709) bm!34529))

(assert (= (and d!97753 res!474973) b!711707))

(declare-fun m!668697 () Bool)

(assert (=> b!711707 m!668697))

(assert (=> b!711707 m!668623))

(assert (=> b!711707 m!668583))

(declare-fun m!668703 () Bool)

(assert (=> bm!34529 m!668703))

(declare-fun m!668705 () Bool)

(assert (=> d!97753 m!668705))

(declare-fun m!668707 () Bool)

(assert (=> d!97753 m!668707))

(assert (=> b!711526 d!97753))

(declare-fun b!711726 () Bool)

(declare-fun e!400461 () Bool)

(declare-fun call!34535 () Bool)

(assert (=> b!711726 (= e!400461 call!34535)))

(declare-fun b!711727 () Bool)

(declare-fun e!400464 () Bool)

(declare-fun e!400463 () Bool)

(assert (=> b!711727 (= e!400464 e!400463)))

(declare-fun res!474984 () Bool)

(assert (=> b!711727 (=> (not res!474984) (not e!400463))))

(declare-fun e!400462 () Bool)

(assert (=> b!711727 (= res!474984 (not e!400462))))

(declare-fun res!474986 () Bool)

(assert (=> b!711727 (=> (not res!474986) (not e!400462))))

(assert (=> b!711727 (= res!474986 (validKeyInArray!0 (select (arr!19352 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97761 () Bool)

(declare-fun res!474985 () Bool)

(assert (=> d!97761 (=> res!474985 e!400464)))

(assert (=> d!97761 (= res!474985 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19754 a!3591)))))

(assert (=> d!97761 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318458) e!400464)))

(declare-fun b!711728 () Bool)

(assert (=> b!711728 (= e!400462 (contains!3970 lt!318458 (select (arr!19352 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711729 () Bool)

(assert (=> b!711729 (= e!400463 e!400461)))

(declare-fun c!78738 () Bool)

(assert (=> b!711729 (= c!78738 (validKeyInArray!0 (select (arr!19352 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711730 () Bool)

(assert (=> b!711730 (= e!400461 call!34535)))

(declare-fun bm!34532 () Bool)

(assert (=> bm!34532 (= call!34535 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78738 (Cons!13389 (select (arr!19352 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318458) lt!318458)))))

(assert (= (and d!97761 (not res!474985)) b!711727))

(assert (= (and b!711727 res!474986) b!711728))

(assert (= (and b!711727 res!474984) b!711729))

(assert (= (and b!711729 c!78738) b!711726))

(assert (= (and b!711729 (not c!78738)) b!711730))

(assert (= (or b!711726 b!711730) bm!34532))

(declare-fun m!668713 () Bool)

(assert (=> b!711727 m!668713))

(assert (=> b!711727 m!668713))

(declare-fun m!668715 () Bool)

(assert (=> b!711727 m!668715))

(assert (=> b!711728 m!668713))

(assert (=> b!711728 m!668713))

(declare-fun m!668719 () Bool)

(assert (=> b!711728 m!668719))

(assert (=> b!711729 m!668713))

(assert (=> b!711729 m!668713))

(assert (=> b!711729 m!668715))

(assert (=> bm!34532 m!668713))

(declare-fun m!668723 () Bool)

(assert (=> bm!34532 m!668723))

(assert (=> b!711525 d!97761))

(declare-fun d!97765 () Bool)

(declare-fun lt!318489 () Bool)

(assert (=> d!97765 (= lt!318489 (member k!2824 (content!356 acc!652)))))

(declare-fun e!400468 () Bool)

(assert (=> d!97765 (= lt!318489 e!400468)))

(declare-fun res!474990 () Bool)

(assert (=> d!97765 (=> (not res!474990) (not e!400468))))

(assert (=> d!97765 (= res!474990 (is-Cons!13389 acc!652))))

(assert (=> d!97765 (= (contains!3970 acc!652 k!2824) lt!318489)))

(declare-fun b!711733 () Bool)

(declare-fun e!400467 () Bool)

(assert (=> b!711733 (= e!400468 e!400467)))

(declare-fun res!474989 () Bool)

(assert (=> b!711733 (=> res!474989 e!400467)))

(assert (=> b!711733 (= res!474989 (= (h!14434 acc!652) k!2824))))

(declare-fun b!711734 () Bool)

(assert (=> b!711734 (= e!400467 (contains!3970 (t!19699 acc!652) k!2824))))

(assert (= (and d!97765 res!474990) b!711733))

(assert (= (and b!711733 (not res!474989)) b!711734))

(declare-fun m!668731 () Bool)

(assert (=> d!97765 m!668731))

(declare-fun m!668733 () Bool)

(assert (=> d!97765 m!668733))

(declare-fun m!668735 () Bool)

(assert (=> b!711734 m!668735))

(assert (=> b!711504 d!97765))

(declare-fun d!97771 () Bool)

(declare-fun res!475001 () Bool)

(declare-fun e!400479 () Bool)

(assert (=> d!97771 (=> res!475001 e!400479)))

(assert (=> d!97771 (= res!475001 (is-Nil!13390 lt!318458))))

(assert (=> d!97771 (= (noDuplicate!1217 lt!318458) e!400479)))

(declare-fun b!711745 () Bool)

(declare-fun e!400480 () Bool)

(assert (=> b!711745 (= e!400479 e!400480)))

(declare-fun res!475002 () Bool)

(assert (=> b!711745 (=> (not res!475002) (not e!400480))))

(assert (=> b!711745 (= res!475002 (not (contains!3970 (t!19699 lt!318458) (h!14434 lt!318458))))))

(declare-fun b!711746 () Bool)

(assert (=> b!711746 (= e!400480 (noDuplicate!1217 (t!19699 lt!318458)))))

(assert (= (and d!97771 (not res!475001)) b!711745))

(assert (= (and b!711745 res!475002) b!711746))

(declare-fun m!668747 () Bool)

(assert (=> b!711745 m!668747))

(declare-fun m!668749 () Bool)

(assert (=> b!711746 m!668749))

(assert (=> b!711503 d!97771))

(declare-fun d!97777 () Bool)

(declare-fun lt!318491 () Bool)

(assert (=> d!97777 (= lt!318491 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!356 acc!652)))))

(declare-fun e!400486 () Bool)

(assert (=> d!97777 (= lt!318491 e!400486)))

(declare-fun res!475008 () Bool)

(assert (=> d!97777 (=> (not res!475008) (not e!400486))))

(assert (=> d!97777 (= res!475008 (is-Cons!13389 acc!652))))

(assert (=> d!97777 (= (contains!3970 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318491)))

(declare-fun b!711751 () Bool)

(declare-fun e!400485 () Bool)

(assert (=> b!711751 (= e!400486 e!400485)))

(declare-fun res!475007 () Bool)

(assert (=> b!711751 (=> res!475007 e!400485)))

(assert (=> b!711751 (= res!475007 (= (h!14434 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711752 () Bool)

(assert (=> b!711752 (= e!400485 (contains!3970 (t!19699 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97777 res!475008) b!711751))

(assert (= (and b!711751 (not res!475007)) b!711752))

(assert (=> d!97777 m!668731))

(declare-fun m!668751 () Bool)

(assert (=> d!97777 m!668751))

(declare-fun m!668753 () Bool)

(assert (=> b!711752 m!668753))

(assert (=> b!711524 d!97777))

(declare-fun d!97779 () Bool)

(assert (=> d!97779 (= (validKeyInArray!0 (select (arr!19352 a!3591) from!2969)) (and (not (= (select (arr!19352 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19352 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711507 d!97779))

(declare-fun d!97781 () Bool)

(declare-fun res!475015 () Bool)

(declare-fun e!400493 () Bool)

(assert (=> d!97781 (=> res!475015 e!400493)))

(assert (=> d!97781 (= res!475015 (= (select (arr!19352 a!3591) from!2969) k!2824))))

(assert (=> d!97781 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!400493)))

(declare-fun b!711759 () Bool)

(declare-fun e!400494 () Bool)

(assert (=> b!711759 (= e!400493 e!400494)))

(declare-fun res!475016 () Bool)

(assert (=> b!711759 (=> (not res!475016) (not e!400494))))

(assert (=> b!711759 (= res!475016 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19754 a!3591)))))

(declare-fun b!711760 () Bool)

(assert (=> b!711760 (= e!400494 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97781 (not res!475015)) b!711759))

(assert (= (and b!711759 res!475016) b!711760))

(assert (=> d!97781 m!668493))

(declare-fun m!668759 () Bool)

(assert (=> b!711760 m!668759))

(assert (=> b!711506 d!97781))

(declare-fun d!97785 () Bool)

(declare-fun lt!318492 () Bool)

(assert (=> d!97785 (= lt!318492 (member k!2824 (content!356 lt!318458)))))

(declare-fun e!400496 () Bool)

(assert (=> d!97785 (= lt!318492 e!400496)))

(declare-fun res!475018 () Bool)

(assert (=> d!97785 (=> (not res!475018) (not e!400496))))

(assert (=> d!97785 (= res!475018 (is-Cons!13389 lt!318458))))

(assert (=> d!97785 (= (contains!3970 lt!318458 k!2824) lt!318492)))

(declare-fun b!711761 () Bool)

(declare-fun e!400495 () Bool)

(assert (=> b!711761 (= e!400496 e!400495)))

(declare-fun res!475017 () Bool)

(assert (=> b!711761 (=> res!475017 e!400495)))

(assert (=> b!711761 (= res!475017 (= (h!14434 lt!318458) k!2824))))

(declare-fun b!711762 () Bool)

(assert (=> b!711762 (= e!400495 (contains!3970 (t!19699 lt!318458) k!2824))))

(assert (= (and d!97785 res!475018) b!711761))

(assert (= (and b!711761 (not res!475017)) b!711762))

(declare-fun m!668761 () Bool)

(assert (=> d!97785 m!668761))

(declare-fun m!668763 () Bool)

(assert (=> d!97785 m!668763))

(declare-fun m!668765 () Bool)

(assert (=> b!711762 m!668765))

(assert (=> b!711505 d!97785))

(declare-fun d!97787 () Bool)

(declare-fun lt!318493 () Bool)

(assert (=> d!97787 (= lt!318493 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!356 acc!652)))))

(declare-fun e!400498 () Bool)

(assert (=> d!97787 (= lt!318493 e!400498)))

(declare-fun res!475020 () Bool)

(assert (=> d!97787 (=> (not res!475020) (not e!400498))))

(assert (=> d!97787 (= res!475020 (is-Cons!13389 acc!652))))

(assert (=> d!97787 (= (contains!3970 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318493)))

(declare-fun b!711763 () Bool)

(declare-fun e!400497 () Bool)

(assert (=> b!711763 (= e!400498 e!400497)))

(declare-fun res!475019 () Bool)

(assert (=> b!711763 (=> res!475019 e!400497)))

(assert (=> b!711763 (= res!475019 (= (h!14434 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711764 () Bool)

(assert (=> b!711764 (= e!400497 (contains!3970 (t!19699 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97787 res!475020) b!711763))

(assert (= (and b!711763 (not res!475019)) b!711764))

(assert (=> d!97787 m!668731))

(declare-fun m!668767 () Bool)

(assert (=> d!97787 m!668767))

(declare-fun m!668769 () Bool)

(assert (=> b!711764 m!668769))

(assert (=> b!711510 d!97787))

(declare-fun d!97789 () Bool)

(declare-fun lt!318494 () Bool)

(assert (=> d!97789 (= lt!318494 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!356 lt!318458)))))

(declare-fun e!400500 () Bool)

(assert (=> d!97789 (= lt!318494 e!400500)))

(declare-fun res!475022 () Bool)

(assert (=> d!97789 (=> (not res!475022) (not e!400500))))

(assert (=> d!97789 (= res!475022 (is-Cons!13389 lt!318458))))

(assert (=> d!97789 (= (contains!3970 lt!318458 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318494)))

(declare-fun b!711765 () Bool)

(declare-fun e!400499 () Bool)

(assert (=> b!711765 (= e!400500 e!400499)))

(declare-fun res!475021 () Bool)

(assert (=> b!711765 (=> res!475021 e!400499)))

(assert (=> b!711765 (= res!475021 (= (h!14434 lt!318458) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711766 () Bool)

(assert (=> b!711766 (= e!400499 (contains!3970 (t!19699 lt!318458) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97789 res!475022) b!711765))

(assert (= (and b!711765 (not res!475021)) b!711766))

(assert (=> d!97789 m!668761))

(declare-fun m!668771 () Bool)

(assert (=> d!97789 m!668771))

(declare-fun m!668773 () Bool)

(assert (=> b!711766 m!668773))

(assert (=> b!711509 d!97789))

(declare-fun d!97791 () Bool)

(assert (=> d!97791 (= ($colon$colon!526 newAcc!49 (select (arr!19352 a!3591) from!2969)) (Cons!13389 (select (arr!19352 a!3591) from!2969) newAcc!49))))

(assert (=> b!711508 d!97791))

(declare-fun d!97793 () Bool)

(assert (=> d!97793 (= ($colon$colon!526 acc!652 (select (arr!19352 a!3591) from!2969)) (Cons!13389 (select (arr!19352 a!3591) from!2969) acc!652))))

(assert (=> b!711508 d!97793))

(declare-fun d!97795 () Bool)

(declare-fun lt!318495 () Bool)

(assert (=> d!97795 (= lt!318495 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!356 newAcc!49)))))

(declare-fun e!400502 () Bool)

(assert (=> d!97795 (= lt!318495 e!400502)))

(declare-fun res!475024 () Bool)

(assert (=> d!97795 (=> (not res!475024) (not e!400502))))

(assert (=> d!97795 (= res!475024 (is-Cons!13389 newAcc!49))))

(assert (=> d!97795 (= (contains!3970 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318495)))

(declare-fun b!711767 () Bool)

(declare-fun e!400501 () Bool)

(assert (=> b!711767 (= e!400502 e!400501)))

(declare-fun res!475023 () Bool)

(assert (=> b!711767 (=> res!475023 e!400501)))

