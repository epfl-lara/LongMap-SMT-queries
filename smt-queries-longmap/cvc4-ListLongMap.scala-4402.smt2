; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60516 () Bool)

(assert start!60516)

(declare-fun b!680451 () Bool)

(declare-datatypes ((Unit!23870 0))(
  ( (Unit!23871) )
))
(declare-fun e!387548 () Unit!23870)

(declare-fun Unit!23872 () Unit!23870)

(assert (=> b!680451 (= e!387548 Unit!23872)))

(declare-fun lt!313087 () Unit!23870)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39497 0))(
  ( (array!39498 (arr!18938 (Array (_ BitVec 32) (_ BitVec 64))) (size!19302 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39497)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39497 (_ BitVec 64) (_ BitVec 32)) Unit!23870)

(assert (=> b!680451 (= lt!313087 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680451 false))

(declare-fun b!680452 () Bool)

(declare-fun res!446717 () Bool)

(declare-fun e!387546 () Bool)

(assert (=> b!680452 (=> (not res!446717) (not e!387546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680452 (= res!446717 (validKeyInArray!0 k!2843))))

(declare-fun b!680453 () Bool)

(declare-fun res!446719 () Bool)

(assert (=> b!680453 (=> (not res!446719) (not e!387546))))

(declare-fun arrayContainsKey!0 (array!39497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680453 (= res!446719 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680454 () Bool)

(declare-fun Unit!23873 () Unit!23870)

(assert (=> b!680454 (= e!387548 Unit!23873)))

(declare-fun b!680455 () Bool)

(declare-fun e!387550 () Bool)

(declare-fun e!387549 () Bool)

(assert (=> b!680455 (= e!387550 e!387549)))

(declare-fun res!446716 () Bool)

(assert (=> b!680455 (=> res!446716 e!387549)))

(assert (=> b!680455 (= res!446716 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12979 0))(
  ( (Nil!12976) (Cons!12975 (h!14020 (_ BitVec 64)) (t!19207 List!12979)) )
))
(declare-fun acc!681 () List!12979)

(declare-fun subseq!142 (List!12979 List!12979) Bool)

(assert (=> b!680455 (subseq!142 acc!681 acc!681)))

(declare-fun lt!313086 () Unit!23870)

(declare-fun lemmaListSubSeqRefl!0 (List!12979) Unit!23870)

(assert (=> b!680455 (= lt!313086 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680456 () Bool)

(declare-fun res!446710 () Bool)

(assert (=> b!680456 (=> (not res!446710) (not e!387546))))

(declare-fun e!387545 () Bool)

(assert (=> b!680456 (= res!446710 e!387545)))

(declare-fun res!446718 () Bool)

(assert (=> b!680456 (=> res!446718 e!387545)))

(declare-fun e!387547 () Bool)

(assert (=> b!680456 (= res!446718 e!387547)))

(declare-fun res!446712 () Bool)

(assert (=> b!680456 (=> (not res!446712) (not e!387547))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680456 (= res!446712 (bvsgt from!3004 i!1382))))

(declare-fun b!680458 () Bool)

(declare-fun res!446711 () Bool)

(assert (=> b!680458 (=> (not res!446711) (not e!387546))))

(assert (=> b!680458 (= res!446711 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19302 a!3626))))))

(declare-fun b!680459 () Bool)

(declare-fun res!446715 () Bool)

(assert (=> b!680459 (=> (not res!446715) (not e!387546))))

(declare-fun arrayNoDuplicates!0 (array!39497 (_ BitVec 32) List!12979) Bool)

(assert (=> b!680459 (= res!446715 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680460 () Bool)

(assert (=> b!680460 (= e!387546 (not e!387550))))

(declare-fun res!446709 () Bool)

(assert (=> b!680460 (=> res!446709 e!387550)))

(assert (=> b!680460 (= res!446709 (not (validKeyInArray!0 (select (arr!18938 a!3626) from!3004))))))

(declare-fun lt!313085 () Unit!23870)

(assert (=> b!680460 (= lt!313085 e!387548)))

(declare-fun c!77240 () Bool)

(assert (=> b!680460 (= c!77240 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680460 (arrayContainsKey!0 (array!39498 (store (arr!18938 a!3626) i!1382 k!2843) (size!19302 a!3626)) k!2843 from!3004)))

(declare-fun b!680461 () Bool)

(declare-fun noDuplicate!803 (List!12979) Bool)

(declare-fun $colon$colon!307 (List!12979 (_ BitVec 64)) List!12979)

(assert (=> b!680461 (= e!387549 (noDuplicate!803 ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004))))))

(declare-fun b!680462 () Bool)

(declare-fun e!387552 () Bool)

(declare-fun contains!3556 (List!12979 (_ BitVec 64)) Bool)

(assert (=> b!680462 (= e!387552 (not (contains!3556 acc!681 k!2843)))))

(declare-fun b!680463 () Bool)

(declare-fun res!446714 () Bool)

(assert (=> b!680463 (=> (not res!446714) (not e!387546))))

(assert (=> b!680463 (= res!446714 (not (contains!3556 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680464 () Bool)

(declare-fun res!446720 () Bool)

(assert (=> b!680464 (=> (not res!446720) (not e!387546))))

(assert (=> b!680464 (= res!446720 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12976))))

(declare-fun b!680465 () Bool)

(declare-fun res!446713 () Bool)

(assert (=> b!680465 (=> (not res!446713) (not e!387546))))

(assert (=> b!680465 (= res!446713 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19302 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680466 () Bool)

(assert (=> b!680466 (= e!387545 e!387552)))

(declare-fun res!446707 () Bool)

(assert (=> b!680466 (=> (not res!446707) (not e!387552))))

(assert (=> b!680466 (= res!446707 (bvsle from!3004 i!1382))))

(declare-fun b!680467 () Bool)

(declare-fun res!446706 () Bool)

(assert (=> b!680467 (=> (not res!446706) (not e!387546))))

(assert (=> b!680467 (= res!446706 (noDuplicate!803 acc!681))))

(declare-fun b!680468 () Bool)

(declare-fun res!446705 () Bool)

(assert (=> b!680468 (=> (not res!446705) (not e!387546))))

(assert (=> b!680468 (= res!446705 (not (contains!3556 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680457 () Bool)

(assert (=> b!680457 (= e!387547 (contains!3556 acc!681 k!2843))))

(declare-fun res!446708 () Bool)

(assert (=> start!60516 (=> (not res!446708) (not e!387546))))

(assert (=> start!60516 (= res!446708 (and (bvslt (size!19302 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19302 a!3626))))))

(assert (=> start!60516 e!387546))

(assert (=> start!60516 true))

(declare-fun array_inv!14734 (array!39497) Bool)

(assert (=> start!60516 (array_inv!14734 a!3626)))

(assert (= (and start!60516 res!446708) b!680467))

(assert (= (and b!680467 res!446706) b!680468))

(assert (= (and b!680468 res!446705) b!680463))

(assert (= (and b!680463 res!446714) b!680456))

(assert (= (and b!680456 res!446712) b!680457))

(assert (= (and b!680456 (not res!446718)) b!680466))

(assert (= (and b!680466 res!446707) b!680462))

(assert (= (and b!680456 res!446710) b!680464))

(assert (= (and b!680464 res!446720) b!680459))

(assert (= (and b!680459 res!446715) b!680458))

(assert (= (and b!680458 res!446711) b!680452))

(assert (= (and b!680452 res!446717) b!680453))

(assert (= (and b!680453 res!446719) b!680465))

(assert (= (and b!680465 res!446713) b!680460))

(assert (= (and b!680460 c!77240) b!680451))

(assert (= (and b!680460 (not c!77240)) b!680454))

(assert (= (and b!680460 (not res!446709)) b!680455))

(assert (= (and b!680455 (not res!446716)) b!680461))

(declare-fun m!645501 () Bool)

(assert (=> b!680468 m!645501))

(declare-fun m!645503 () Bool)

(assert (=> start!60516 m!645503))

(declare-fun m!645505 () Bool)

(assert (=> b!680460 m!645505))

(declare-fun m!645507 () Bool)

(assert (=> b!680460 m!645507))

(declare-fun m!645509 () Bool)

(assert (=> b!680460 m!645509))

(assert (=> b!680460 m!645505))

(declare-fun m!645511 () Bool)

(assert (=> b!680460 m!645511))

(declare-fun m!645513 () Bool)

(assert (=> b!680460 m!645513))

(declare-fun m!645515 () Bool)

(assert (=> b!680463 m!645515))

(declare-fun m!645517 () Bool)

(assert (=> b!680464 m!645517))

(declare-fun m!645519 () Bool)

(assert (=> b!680457 m!645519))

(declare-fun m!645521 () Bool)

(assert (=> b!680455 m!645521))

(declare-fun m!645523 () Bool)

(assert (=> b!680455 m!645523))

(declare-fun m!645525 () Bool)

(assert (=> b!680459 m!645525))

(assert (=> b!680462 m!645519))

(declare-fun m!645527 () Bool)

(assert (=> b!680452 m!645527))

(declare-fun m!645529 () Bool)

(assert (=> b!680467 m!645529))

(declare-fun m!645531 () Bool)

(assert (=> b!680451 m!645531))

(declare-fun m!645533 () Bool)

(assert (=> b!680453 m!645533))

(assert (=> b!680461 m!645505))

(assert (=> b!680461 m!645505))

(declare-fun m!645535 () Bool)

(assert (=> b!680461 m!645535))

(assert (=> b!680461 m!645535))

(declare-fun m!645537 () Bool)

(assert (=> b!680461 m!645537))

(push 1)

(assert (not b!680453))

(assert (not b!680460))

(assert (not b!680467))

(assert (not b!680455))

(assert (not b!680457))

(assert (not b!680464))

(assert (not start!60516))

(assert (not b!680461))

(assert (not b!680463))

(assert (not b!680468))

(assert (not b!680462))

(assert (not b!680451))

(assert (not b!680459))

(assert (not b!680452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!680516 () Bool)

(declare-fun e!387595 () Bool)

(declare-fun call!33944 () Bool)

(assert (=> b!680516 (= e!387595 call!33944)))

(declare-fun b!680517 () Bool)

(assert (=> b!680517 (= e!387595 call!33944)))

(declare-fun b!680518 () Bool)

(declare-fun e!387598 () Bool)

(assert (=> b!680518 (= e!387598 e!387595)))

(declare-fun c!77246 () Bool)

(assert (=> b!680518 (= c!77246 (validKeyInArray!0 (select (arr!18938 a!3626) from!3004)))))

(declare-fun b!680519 () Bool)

(declare-fun e!387596 () Bool)

(assert (=> b!680519 (= e!387596 (contains!3556 acc!681 (select (arr!18938 a!3626) from!3004)))))

(declare-fun d!93581 () Bool)

(declare-fun res!446759 () Bool)

(declare-fun e!387597 () Bool)

(assert (=> d!93581 (=> res!446759 e!387597)))

(assert (=> d!93581 (= res!446759 (bvsge from!3004 (size!19302 a!3626)))))

(assert (=> d!93581 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387597)))

(declare-fun bm!33941 () Bool)

(assert (=> bm!33941 (= call!33944 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77246 (Cons!12975 (select (arr!18938 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!680520 () Bool)

(assert (=> b!680520 (= e!387597 e!387598)))

(declare-fun res!446758 () Bool)

(assert (=> b!680520 (=> (not res!446758) (not e!387598))))

(assert (=> b!680520 (= res!446758 (not e!387596))))

(declare-fun res!446760 () Bool)

(assert (=> b!680520 (=> (not res!446760) (not e!387596))))

(assert (=> b!680520 (= res!446760 (validKeyInArray!0 (select (arr!18938 a!3626) from!3004)))))

(assert (= (and d!93581 (not res!446759)) b!680520))

(assert (= (and b!680520 res!446760) b!680519))

(assert (= (and b!680520 res!446758) b!680518))

(assert (= (and b!680518 c!77246) b!680516))

(assert (= (and b!680518 (not c!77246)) b!680517))

(assert (= (or b!680516 b!680517) bm!33941))

(assert (=> b!680518 m!645505))

(assert (=> b!680518 m!645505))

(assert (=> b!680518 m!645511))

(assert (=> b!680519 m!645505))

(assert (=> b!680519 m!645505))

(declare-fun m!645559 () Bool)

(assert (=> b!680519 m!645559))

(assert (=> bm!33941 m!645505))

(declare-fun m!645561 () Bool)

(assert (=> bm!33941 m!645561))

(assert (=> b!680520 m!645505))

(assert (=> b!680520 m!645505))

(assert (=> b!680520 m!645511))

(assert (=> b!680459 d!93581))

(declare-fun d!93589 () Bool)

(assert (=> d!93589 (= (array_inv!14734 a!3626) (bvsge (size!19302 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60516 d!93589))

(declare-fun d!93593 () Bool)

(declare-fun lt!313097 () Bool)

(declare-fun content!268 (List!12979) (Set (_ BitVec 64)))

(assert (=> d!93593 (= lt!313097 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!268 acc!681)))))

(declare-fun e!387628 () Bool)

(assert (=> d!93593 (= lt!313097 e!387628)))

(declare-fun res!446789 () Bool)

(assert (=> d!93593 (=> (not res!446789) (not e!387628))))

(assert (=> d!93593 (= res!446789 (is-Cons!12975 acc!681))))

(assert (=> d!93593 (= (contains!3556 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313097)))

(declare-fun b!680549 () Bool)

(declare-fun e!387627 () Bool)

(assert (=> b!680549 (= e!387628 e!387627)))

(declare-fun res!446790 () Bool)

(assert (=> b!680549 (=> res!446790 e!387627)))

(assert (=> b!680549 (= res!446790 (= (h!14020 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680550 () Bool)

(assert (=> b!680550 (= e!387627 (contains!3556 (t!19207 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93593 res!446789) b!680549))

(assert (= (and b!680549 (not res!446790)) b!680550))

(declare-fun m!645583 () Bool)

(assert (=> d!93593 m!645583))

(declare-fun m!645585 () Bool)

(assert (=> d!93593 m!645585))

(declare-fun m!645587 () Bool)

(assert (=> b!680550 m!645587))

(assert (=> b!680468 d!93593))

(declare-fun d!93603 () Bool)

(declare-fun lt!313100 () Bool)

(assert (=> d!93603 (= lt!313100 (member k!2843 (content!268 acc!681)))))

(declare-fun e!387630 () Bool)

(assert (=> d!93603 (= lt!313100 e!387630)))

(declare-fun res!446791 () Bool)

(assert (=> d!93603 (=> (not res!446791) (not e!387630))))

(assert (=> d!93603 (= res!446791 (is-Cons!12975 acc!681))))

(assert (=> d!93603 (= (contains!3556 acc!681 k!2843) lt!313100)))

(declare-fun b!680551 () Bool)

(declare-fun e!387629 () Bool)

(assert (=> b!680551 (= e!387630 e!387629)))

(declare-fun res!446792 () Bool)

(assert (=> b!680551 (=> res!446792 e!387629)))

(assert (=> b!680551 (= res!446792 (= (h!14020 acc!681) k!2843))))

(declare-fun b!680552 () Bool)

(assert (=> b!680552 (= e!387629 (contains!3556 (t!19207 acc!681) k!2843))))

(assert (= (and d!93603 res!446791) b!680551))

(assert (= (and b!680551 (not res!446792)) b!680552))

(assert (=> d!93603 m!645583))

(declare-fun m!645589 () Bool)

(assert (=> d!93603 m!645589))

(declare-fun m!645591 () Bool)

(assert (=> b!680552 m!645591))

(assert (=> b!680462 d!93603))

(declare-fun d!93607 () Bool)

(assert (=> d!93607 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313104 () Unit!23870)

(declare-fun choose!13 (array!39497 (_ BitVec 64) (_ BitVec 32)) Unit!23870)

(assert (=> d!93607 (= lt!313104 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!93607 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93607 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313104)))

(declare-fun bs!19980 () Bool)

(assert (= bs!19980 d!93607))

(assert (=> bs!19980 m!645533))

(declare-fun m!645595 () Bool)

(assert (=> bs!19980 m!645595))

(assert (=> b!680451 d!93607))

(declare-fun d!93617 () Bool)

(declare-fun res!446807 () Bool)

(declare-fun e!387645 () Bool)

(assert (=> d!93617 (=> res!446807 e!387645)))

(assert (=> d!93617 (= res!446807 (is-Nil!12976 ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004))))))

(assert (=> d!93617 (= (noDuplicate!803 ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004))) e!387645)))

(declare-fun b!680567 () Bool)

(declare-fun e!387646 () Bool)

(assert (=> b!680567 (= e!387645 e!387646)))

(declare-fun res!446808 () Bool)

(assert (=> b!680567 (=> (not res!446808) (not e!387646))))

(assert (=> b!680567 (= res!446808 (not (contains!3556 (t!19207 ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004))) (h!14020 ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004))))))))

(declare-fun b!680568 () Bool)

(assert (=> b!680568 (= e!387646 (noDuplicate!803 (t!19207 ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004)))))))

(assert (= (and d!93617 (not res!446807)) b!680567))

(assert (= (and b!680567 res!446808) b!680568))

(declare-fun m!645607 () Bool)

(assert (=> b!680567 m!645607))

(declare-fun m!645609 () Bool)

(assert (=> b!680568 m!645609))

(assert (=> b!680461 d!93617))

(declare-fun d!93625 () Bool)

(assert (=> d!93625 (= ($colon$colon!307 acc!681 (select (arr!18938 a!3626) from!3004)) (Cons!12975 (select (arr!18938 a!3626) from!3004) acc!681))))

(assert (=> b!680461 d!93625))

(declare-fun d!93627 () Bool)

(assert (=> d!93627 (= (validKeyInArray!0 (select (arr!18938 a!3626) from!3004)) (and (not (= (select (arr!18938 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18938 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680460 d!93627))

(declare-fun d!93631 () Bool)

(declare-fun res!446824 () Bool)

(declare-fun e!387665 () Bool)

(assert (=> d!93631 (=> res!446824 e!387665)))

(assert (=> d!93631 (= res!446824 (= (select (arr!18938 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93631 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387665)))

(declare-fun b!680590 () Bool)

(declare-fun e!387668 () Bool)

(assert (=> b!680590 (= e!387665 e!387668)))

(declare-fun res!446826 () Bool)

(assert (=> b!680590 (=> (not res!446826) (not e!387668))))

(assert (=> b!680590 (= res!446826 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19302 a!3626)))))

(declare-fun b!680591 () Bool)

(assert (=> b!680591 (= e!387668 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93631 (not res!446824)) b!680590))

(assert (= (and b!680590 res!446826) b!680591))

(declare-fun m!645619 () Bool)

(assert (=> d!93631 m!645619))

(declare-fun m!645621 () Bool)

(assert (=> b!680591 m!645621))

(assert (=> b!680460 d!93631))

(declare-fun d!93637 () Bool)

(declare-fun res!446828 () Bool)

(declare-fun e!387669 () Bool)

(assert (=> d!93637 (=> res!446828 e!387669)))

(assert (=> d!93637 (= res!446828 (= (select (arr!18938 (array!39498 (store (arr!18938 a!3626) i!1382 k!2843) (size!19302 a!3626))) from!3004) k!2843))))

(assert (=> d!93637 (= (arrayContainsKey!0 (array!39498 (store (arr!18938 a!3626) i!1382 k!2843) (size!19302 a!3626)) k!2843 from!3004) e!387669)))

