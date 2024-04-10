; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102586 () Bool)

(assert start!102586)

(declare-fun b!1233457 () Bool)

(declare-fun res!821673 () Bool)

(declare-fun e!699673 () Bool)

(assert (=> b!1233457 (=> (not res!821673) (not e!699673))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233457 (= res!821673 (validKeyInArray!0 k!2913))))

(declare-fun b!1233458 () Bool)

(declare-datatypes ((array!79515 0))(
  ( (array!79516 (arr!38368 (Array (_ BitVec 32) (_ BitVec 64))) (size!38904 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79515)

(declare-datatypes ((List!27141 0))(
  ( (Nil!27138) (Cons!27137 (h!28346 (_ BitVec 64)) (t!40604 List!27141)) )
))
(declare-fun lt!559684 () List!27141)

(declare-fun e!699675 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun contains!7203 (List!27141 (_ BitVec 64)) Bool)

(assert (=> b!1233458 (= e!699675 (contains!7203 lt!559684 (select (arr!38368 a!3806) from!3184)))))

(declare-fun b!1233459 () Bool)

(declare-fun res!821685 () Bool)

(assert (=> b!1233459 (=> (not res!821685) (not e!699673))))

(declare-fun acc!823 () List!27141)

(assert (=> b!1233459 (= res!821685 (not (contains!7203 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233460 () Bool)

(declare-fun e!699674 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79515 (_ BitVec 32) List!27141) Bool)

(assert (=> b!1233460 (= e!699674 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27137 (select (arr!38368 a!3806) from!3184) Nil!27138)))))

(declare-fun res!821684 () Bool)

(assert (=> start!102586 (=> (not res!821684) (not e!699673))))

(assert (=> start!102586 (= res!821684 (bvslt (size!38904 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102586 e!699673))

(declare-fun array_inv!29216 (array!79515) Bool)

(assert (=> start!102586 (array_inv!29216 a!3806)))

(assert (=> start!102586 true))

(declare-fun b!1233461 () Bool)

(declare-fun res!821678 () Bool)

(assert (=> b!1233461 (=> (not res!821678) (not e!699673))))

(assert (=> b!1233461 (= res!821678 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233462 () Bool)

(declare-fun res!821677 () Bool)

(assert (=> b!1233462 (=> (not res!821677) (not e!699673))))

(declare-fun noDuplicate!1800 (List!27141) Bool)

(assert (=> b!1233462 (= res!821677 (noDuplicate!1800 acc!823))))

(declare-fun b!1233463 () Bool)

(declare-fun res!821675 () Bool)

(assert (=> b!1233463 (=> (not res!821675) (not e!699673))))

(assert (=> b!1233463 (= res!821675 (not (contains!7203 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233464 () Bool)

(declare-fun res!821681 () Bool)

(assert (=> b!1233464 (=> (not res!821681) (not e!699673))))

(declare-fun arrayContainsKey!0 (array!79515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233464 (= res!821681 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233465 () Bool)

(assert (=> b!1233465 (= e!699673 (not e!699675))))

(declare-fun res!821686 () Bool)

(assert (=> b!1233465 (=> res!821686 e!699675)))

(assert (=> b!1233465 (= res!821686 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1233465 (= lt!559684 (Cons!27137 (select (arr!38368 a!3806) from!3184) Nil!27138))))

(assert (=> b!1233465 e!699674))

(declare-fun res!821674 () Bool)

(assert (=> b!1233465 (=> (not res!821674) (not e!699674))))

(assert (=> b!1233465 (= res!821674 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27138))))

(declare-datatypes ((Unit!40842 0))(
  ( (Unit!40843) )
))
(declare-fun lt!559685 () Unit!40842)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79515 List!27141 List!27141 (_ BitVec 32)) Unit!40842)

(assert (=> b!1233465 (= lt!559685 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27138 from!3184))))

(assert (=> b!1233465 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27137 (select (arr!38368 a!3806) from!3184) acc!823))))

(declare-fun b!1233466 () Bool)

(declare-fun res!821680 () Bool)

(assert (=> b!1233466 (=> res!821680 e!699675)))

(assert (=> b!1233466 (= res!821680 (contains!7203 lt!559684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233467 () Bool)

(declare-fun res!821683 () Bool)

(assert (=> b!1233467 (=> (not res!821683) (not e!699673))))

(assert (=> b!1233467 (= res!821683 (validKeyInArray!0 (select (arr!38368 a!3806) from!3184)))))

(declare-fun b!1233468 () Bool)

(declare-fun res!821682 () Bool)

(assert (=> b!1233468 (=> res!821682 e!699675)))

(assert (=> b!1233468 (= res!821682 (contains!7203 lt!559684 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233469 () Bool)

(declare-fun res!821679 () Bool)

(assert (=> b!1233469 (=> (not res!821679) (not e!699673))))

(assert (=> b!1233469 (= res!821679 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38904 a!3806)) (bvslt from!3184 (size!38904 a!3806))))))

(declare-fun b!1233470 () Bool)

(declare-fun res!821676 () Bool)

(assert (=> b!1233470 (=> res!821676 e!699675)))

(assert (=> b!1233470 (= res!821676 (not (noDuplicate!1800 lt!559684)))))

(assert (= (and start!102586 res!821684) b!1233457))

(assert (= (and b!1233457 res!821673) b!1233469))

(assert (= (and b!1233469 res!821679) b!1233462))

(assert (= (and b!1233462 res!821677) b!1233459))

(assert (= (and b!1233459 res!821685) b!1233463))

(assert (= (and b!1233463 res!821675) b!1233464))

(assert (= (and b!1233464 res!821681) b!1233461))

(assert (= (and b!1233461 res!821678) b!1233467))

(assert (= (and b!1233467 res!821683) b!1233465))

(assert (= (and b!1233465 res!821674) b!1233460))

(assert (= (and b!1233465 (not res!821686)) b!1233470))

(assert (= (and b!1233470 (not res!821676)) b!1233466))

(assert (= (and b!1233466 (not res!821680)) b!1233468))

(assert (= (and b!1233468 (not res!821682)) b!1233458))

(declare-fun m!1137519 () Bool)

(assert (=> b!1233468 m!1137519))

(declare-fun m!1137521 () Bool)

(assert (=> b!1233464 m!1137521))

(declare-fun m!1137523 () Bool)

(assert (=> b!1233458 m!1137523))

(assert (=> b!1233458 m!1137523))

(declare-fun m!1137525 () Bool)

(assert (=> b!1233458 m!1137525))

(assert (=> b!1233460 m!1137523))

(declare-fun m!1137527 () Bool)

(assert (=> b!1233460 m!1137527))

(declare-fun m!1137529 () Bool)

(assert (=> b!1233463 m!1137529))

(assert (=> b!1233465 m!1137523))

(declare-fun m!1137531 () Bool)

(assert (=> b!1233465 m!1137531))

(declare-fun m!1137533 () Bool)

(assert (=> b!1233465 m!1137533))

(declare-fun m!1137535 () Bool)

(assert (=> b!1233465 m!1137535))

(declare-fun m!1137537 () Bool)

(assert (=> start!102586 m!1137537))

(declare-fun m!1137539 () Bool)

(assert (=> b!1233461 m!1137539))

(declare-fun m!1137541 () Bool)

(assert (=> b!1233462 m!1137541))

(declare-fun m!1137543 () Bool)

(assert (=> b!1233459 m!1137543))

(declare-fun m!1137545 () Bool)

(assert (=> b!1233470 m!1137545))

(assert (=> b!1233467 m!1137523))

(assert (=> b!1233467 m!1137523))

(declare-fun m!1137547 () Bool)

(assert (=> b!1233467 m!1137547))

(declare-fun m!1137549 () Bool)

(assert (=> b!1233457 m!1137549))

(declare-fun m!1137551 () Bool)

(assert (=> b!1233466 m!1137551))

(push 1)

(assert (not b!1233470))

(assert (not b!1233460))

(assert (not b!1233466))

(assert (not b!1233459))

(assert (not b!1233461))

(assert (not b!1233467))

(assert (not b!1233458))

(assert (not start!102586))

(assert (not b!1233465))

(assert (not b!1233463))

(assert (not b!1233468))

(assert (not b!1233464))

(assert (not b!1233457))

(assert (not b!1233462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135275 () Bool)

(assert (=> d!135275 (= (array_inv!29216 a!3806) (bvsge (size!38904 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102586 d!135275))

(declare-fun d!135277 () Bool)

(declare-fun lt!559694 () Bool)

(declare-fun content!577 (List!27141) (Set (_ BitVec 64)))

(assert (=> d!135277 (= lt!559694 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!577 acc!823)))))

(declare-fun e!699705 () Bool)

(assert (=> d!135277 (= lt!559694 e!699705)))

(declare-fun res!821712 () Bool)

(assert (=> d!135277 (=> (not res!821712) (not e!699705))))

(assert (=> d!135277 (= res!821712 (is-Cons!27137 acc!823))))

(assert (=> d!135277 (= (contains!7203 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559694)))

(declare-fun b!1233502 () Bool)

(declare-fun e!699704 () Bool)

(assert (=> b!1233502 (= e!699705 e!699704)))

(declare-fun res!821713 () Bool)

(assert (=> b!1233502 (=> res!821713 e!699704)))

(assert (=> b!1233502 (= res!821713 (= (h!28346 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233503 () Bool)

(assert (=> b!1233503 (= e!699704 (contains!7203 (t!40604 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135277 res!821712) b!1233502))

(assert (= (and b!1233502 (not res!821713)) b!1233503))

(declare-fun m!1137569 () Bool)

(assert (=> d!135277 m!1137569))

(declare-fun m!1137571 () Bool)

(assert (=> d!135277 m!1137571))

(declare-fun m!1137573 () Bool)

(assert (=> b!1233503 m!1137573))

(assert (=> b!1233463 d!135277))

(declare-fun d!135283 () Bool)

(declare-fun res!821724 () Bool)

(declare-fun e!699716 () Bool)

(assert (=> d!135283 (=> res!821724 e!699716)))

(assert (=> d!135283 (= res!821724 (is-Nil!27138 acc!823))))

(assert (=> d!135283 (= (noDuplicate!1800 acc!823) e!699716)))

(declare-fun b!1233516 () Bool)

(declare-fun e!699717 () Bool)

(assert (=> b!1233516 (= e!699716 e!699717)))

(declare-fun res!821725 () Bool)

(assert (=> b!1233516 (=> (not res!821725) (not e!699717))))

(assert (=> b!1233516 (= res!821725 (not (contains!7203 (t!40604 acc!823) (h!28346 acc!823))))))

(declare-fun b!1233517 () Bool)

(assert (=> b!1233517 (= e!699717 (noDuplicate!1800 (t!40604 acc!823)))))

(assert (= (and d!135283 (not res!821724)) b!1233516))

(assert (= (and b!1233516 res!821725) b!1233517))

(declare-fun m!1137577 () Bool)

(assert (=> b!1233516 m!1137577))

(declare-fun m!1137579 () Bool)

(assert (=> b!1233517 m!1137579))

(assert (=> b!1233462 d!135283))

(declare-fun d!135287 () Bool)

(declare-fun res!821755 () Bool)

(declare-fun e!699753 () Bool)

(assert (=> d!135287 (=> res!821755 e!699753)))

(assert (=> d!135287 (= res!821755 (bvsge from!3184 (size!38904 a!3806)))))

(assert (=> d!135287 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699753)))

(declare-fun b!1233557 () Bool)

(declare-fun e!699752 () Bool)

(assert (=> b!1233557 (= e!699753 e!699752)))

(declare-fun res!821753 () Bool)

(assert (=> b!1233557 (=> (not res!821753) (not e!699752))))

(declare-fun e!699754 () Bool)

(assert (=> b!1233557 (= res!821753 (not e!699754))))

(declare-fun res!821754 () Bool)

(assert (=> b!1233557 (=> (not res!821754) (not e!699754))))

(assert (=> b!1233557 (= res!821754 (validKeyInArray!0 (select (arr!38368 a!3806) from!3184)))))

(declare-fun b!1233558 () Bool)

(declare-fun e!699755 () Bool)

(declare-fun call!60978 () Bool)

(assert (=> b!1233558 (= e!699755 call!60978)))

(declare-fun b!1233559 () Bool)

(assert (=> b!1233559 (= e!699755 call!60978)))

(declare-fun b!1233560 () Bool)

(assert (=> b!1233560 (= e!699752 e!699755)))

(declare-fun c!120762 () Bool)

(assert (=> b!1233560 (= c!120762 (validKeyInArray!0 (select (arr!38368 a!3806) from!3184)))))

(declare-fun b!1233561 () Bool)

(assert (=> b!1233561 (= e!699754 (contains!7203 acc!823 (select (arr!38368 a!3806) from!3184)))))

(declare-fun bm!60975 () Bool)

(assert (=> bm!60975 (= call!60978 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120762 (Cons!27137 (select (arr!38368 a!3806) from!3184) acc!823) acc!823)))))

(assert (= (and d!135287 (not res!821755)) b!1233557))

(assert (= (and b!1233557 res!821754) b!1233561))

(assert (= (and b!1233557 res!821753) b!1233560))

(assert (= (and b!1233560 c!120762) b!1233559))

(assert (= (and b!1233560 (not c!120762)) b!1233558))

(assert (= (or b!1233559 b!1233558) bm!60975))

(assert (=> b!1233557 m!1137523))

(assert (=> b!1233557 m!1137523))

(assert (=> b!1233557 m!1137547))

(assert (=> b!1233560 m!1137523))

(assert (=> b!1233560 m!1137523))

(assert (=> b!1233560 m!1137547))

(assert (=> b!1233561 m!1137523))

(assert (=> b!1233561 m!1137523))

(declare-fun m!1137613 () Bool)

(assert (=> b!1233561 m!1137613))

(assert (=> bm!60975 m!1137523))

(declare-fun m!1137615 () Bool)

(assert (=> bm!60975 m!1137615))

(assert (=> b!1233461 d!135287))

(declare-fun d!135305 () Bool)

(declare-fun res!821766 () Bool)

(declare-fun e!699765 () Bool)

(assert (=> d!135305 (=> res!821766 e!699765)))

(assert (=> d!135305 (= res!821766 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38904 a!3806)))))

(assert (=> d!135305 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27137 (select (arr!38368 a!3806) from!3184) Nil!27138)) e!699765)))

(declare-fun b!1233570 () Bool)

(declare-fun e!699764 () Bool)

(assert (=> b!1233570 (= e!699765 e!699764)))

(declare-fun res!821764 () Bool)

(assert (=> b!1233570 (=> (not res!821764) (not e!699764))))

(declare-fun e!699766 () Bool)

(assert (=> b!1233570 (= res!821764 (not e!699766))))

(declare-fun res!821765 () Bool)

(assert (=> b!1233570 (=> (not res!821765) (not e!699766))))

(assert (=> b!1233570 (= res!821765 (validKeyInArray!0 (select (arr!38368 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233571 () Bool)

(declare-fun e!699767 () Bool)

(declare-fun call!60979 () Bool)

(assert (=> b!1233571 (= e!699767 call!60979)))

(declare-fun b!1233572 () Bool)

(assert (=> b!1233572 (= e!699767 call!60979)))

(declare-fun b!1233573 () Bool)

(assert (=> b!1233573 (= e!699764 e!699767)))

(declare-fun c!120763 () Bool)

(assert (=> b!1233573 (= c!120763 (validKeyInArray!0 (select (arr!38368 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233574 () Bool)

(assert (=> b!1233574 (= e!699766 (contains!7203 (Cons!27137 (select (arr!38368 a!3806) from!3184) Nil!27138) (select (arr!38368 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60976 () Bool)

(assert (=> bm!60976 (= call!60979 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120763 (Cons!27137 (select (arr!38368 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27137 (select (arr!38368 a!3806) from!3184) Nil!27138)) (Cons!27137 (select (arr!38368 a!3806) from!3184) Nil!27138))))))

(assert (= (and d!135305 (not res!821766)) b!1233570))

(assert (= (and b!1233570 res!821765) b!1233574))

(assert (= (and b!1233570 res!821764) b!1233573))

(assert (= (and b!1233573 c!120763) b!1233572))

(assert (= (and b!1233573 (not c!120763)) b!1233571))

(assert (= (or b!1233572 b!1233571) bm!60976))

(declare-fun m!1137623 () Bool)

(assert (=> b!1233570 m!1137623))

(assert (=> b!1233570 m!1137623))

(declare-fun m!1137625 () Bool)

(assert (=> b!1233570 m!1137625))

(assert (=> b!1233573 m!1137623))

(assert (=> b!1233573 m!1137623))

(assert (=> b!1233573 m!1137625))

(assert (=> b!1233574 m!1137623))

(assert (=> b!1233574 m!1137623))

(declare-fun m!1137627 () Bool)

(assert (=> b!1233574 m!1137627))

(assert (=> bm!60976 m!1137623))

(declare-fun m!1137633 () Bool)

(assert (=> bm!60976 m!1137633))

(assert (=> b!1233460 d!135305))

(declare-fun d!135315 () Bool)

(declare-fun res!821773 () Bool)

(declare-fun e!699774 () Bool)

(assert (=> d!135315 (=> res!821773 e!699774)))

(assert (=> d!135315 (= res!821773 (is-Nil!27138 lt!559684))))

(assert (=> d!135315 (= (noDuplicate!1800 lt!559684) e!699774)))

(declare-fun b!1233581 () Bool)

(declare-fun e!699775 () Bool)

(assert (=> b!1233581 (= e!699774 e!699775)))

(declare-fun res!821774 () Bool)

(assert (=> b!1233581 (=> (not res!821774) (not e!699775))))

(assert (=> b!1233581 (= res!821774 (not (contains!7203 (t!40604 lt!559684) (h!28346 lt!559684))))))

(declare-fun b!1233582 () Bool)

(assert (=> b!1233582 (= e!699775 (noDuplicate!1800 (t!40604 lt!559684)))))

(assert (= (and d!135315 (not res!821773)) b!1233581))

(assert (= (and b!1233581 res!821774) b!1233582))

(declare-fun m!1137639 () Bool)

(assert (=> b!1233581 m!1137639))

(declare-fun m!1137642 () Bool)

(assert (=> b!1233582 m!1137642))

(assert (=> b!1233470 d!135315))

(declare-fun d!135319 () Bool)

(declare-fun lt!559702 () Bool)

(assert (=> d!135319 (= lt!559702 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!577 acc!823)))))

(declare-fun e!699781 () Bool)

(assert (=> d!135319 (= lt!559702 e!699781)))

(declare-fun res!821778 () Bool)

(assert (=> d!135319 (=> (not res!821778) (not e!699781))))

(assert (=> d!135319 (= res!821778 (is-Cons!27137 acc!823))))

(assert (=> d!135319 (= (contains!7203 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559702)))

(declare-fun b!1233588 () Bool)

(declare-fun e!699780 () Bool)

(assert (=> b!1233588 (= e!699781 e!699780)))

(declare-fun res!821779 () Bool)

(assert (=> b!1233588 (=> res!821779 e!699780)))

(assert (=> b!1233588 (= res!821779 (= (h!28346 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233589 () Bool)

(assert (=> b!1233589 (= e!699780 (contains!7203 (t!40604 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135319 res!821778) b!1233588))

(assert (= (and b!1233588 (not res!821779)) b!1233589))

(assert (=> d!135319 m!1137569))

(declare-fun m!1137647 () Bool)

(assert (=> d!135319 m!1137647))

(declare-fun m!1137649 () Bool)

(assert (=> b!1233589 m!1137649))

(assert (=> b!1233459 d!135319))

(declare-fun d!135323 () Bool)

(declare-fun lt!559704 () Bool)

(assert (=> d!135323 (= lt!559704 (member (select (arr!38368 a!3806) from!3184) (content!577 lt!559684)))))

(declare-fun e!699785 () Bool)

(assert (=> d!135323 (= lt!559704 e!699785)))

(declare-fun res!821782 () Bool)

(assert (=> d!135323 (=> (not res!821782) (not e!699785))))

(assert (=> d!135323 (= res!821782 (is-Cons!27137 lt!559684))))

(assert (=> d!135323 (= (contains!7203 lt!559684 (select (arr!38368 a!3806) from!3184)) lt!559704)))

(declare-fun b!1233592 () Bool)

(declare-fun e!699784 () Bool)

(assert (=> b!1233592 (= e!699785 e!699784)))

(declare-fun res!821783 () Bool)

(assert (=> b!1233592 (=> res!821783 e!699784)))

(assert (=> b!1233592 (= res!821783 (= (h!28346 lt!559684) (select (arr!38368 a!3806) from!3184)))))

(declare-fun b!1233593 () Bool)

(assert (=> b!1233593 (= e!699784 (contains!7203 (t!40604 lt!559684) (select (arr!38368 a!3806) from!3184)))))

(assert (= (and d!135323 res!821782) b!1233592))

(assert (= (and b!1233592 (not res!821783)) b!1233593))

(declare-fun m!1137659 () Bool)

(assert (=> d!135323 m!1137659))

(assert (=> d!135323 m!1137523))

(declare-fun m!1137661 () Bool)

(assert (=> d!135323 m!1137661))

(assert (=> b!1233593 m!1137523))

(declare-fun m!1137663 () Bool)

(assert (=> b!1233593 m!1137663))

(assert (=> b!1233458 d!135323))

(declare-fun d!135327 () Bool)

(declare-fun lt!559705 () Bool)

(assert (=> d!135327 (= lt!559705 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!577 lt!559684)))))

(declare-fun e!699787 () Bool)

(assert (=> d!135327 (= lt!559705 e!699787)))

(declare-fun res!821784 () Bool)

(assert (=> d!135327 (=> (not res!821784) (not e!699787))))

(assert (=> d!135327 (= res!821784 (is-Cons!27137 lt!559684))))

(assert (=> d!135327 (= (contains!7203 lt!559684 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559705)))

(declare-fun b!1233594 () Bool)

(declare-fun e!699786 () Bool)

(assert (=> b!1233594 (= e!699787 e!699786)))

(declare-fun res!821785 () Bool)

(assert (=> b!1233594 (=> res!821785 e!699786)))

(assert (=> b!1233594 (= res!821785 (= (h!28346 lt!559684) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233595 () Bool)

(assert (=> b!1233595 (= e!699786 (contains!7203 (t!40604 lt!559684) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135327 res!821784) b!1233594))

(assert (= (and b!1233594 (not res!821785)) b!1233595))

(assert (=> d!135327 m!1137659))

(declare-fun m!1137667 () Bool)

(assert (=> d!135327 m!1137667))

(declare-fun m!1137671 () Bool)

(assert (=> b!1233595 m!1137671))

(assert (=> b!1233468 d!135327))

(declare-fun d!135333 () Bool)

(assert (=> d!135333 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233457 d!135333))

(declare-fun d!135341 () Bool)

(assert (=> d!135341 (= (validKeyInArray!0 (select (arr!38368 a!3806) from!3184)) (and (not (= (select (arr!38368 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38368 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233467 d!135341))

(declare-fun d!135343 () Bool)

(declare-fun lt!559708 () Bool)

(assert (=> d!135343 (= lt!559708 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!577 lt!559684)))))

(declare-fun e!699799 () Bool)

(assert (=> d!135343 (= lt!559708 e!699799)))

(declare-fun res!821795 () Bool)

(assert (=> d!135343 (=> (not res!821795) (not e!699799))))

(assert (=> d!135343 (= res!821795 (is-Cons!27137 lt!559684))))

(assert (=> d!135343 (= (contains!7203 lt!559684 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559708)))

(declare-fun b!1233607 () Bool)

(declare-fun e!699798 () Bool)

(assert (=> b!1233607 (= e!699799 e!699798)))

(declare-fun res!821796 () Bool)

(assert (=> b!1233607 (=> res!821796 e!699798)))

(assert (=> b!1233607 (= res!821796 (= (h!28346 lt!559684) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233608 () Bool)

(assert (=> b!1233608 (= e!699798 (contains!7203 (t!40604 lt!559684) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135343 res!821795) b!1233607))

(assert (= (and b!1233607 (not res!821796)) b!1233608))

(assert (=> d!135343 m!1137659))

(declare-fun m!1137681 () Bool)

(assert (=> d!135343 m!1137681))

(declare-fun m!1137685 () Bool)

(assert (=> b!1233608 m!1137685))

(assert (=> b!1233466 d!135343))

(declare-fun d!135345 () Bool)

(declare-fun res!821799 () Bool)

(declare-fun e!699801 () Bool)

(assert (=> d!135345 (=> res!821799 e!699801)))

(assert (=> d!135345 (= res!821799 (bvsge from!3184 (size!38904 a!3806)))))

(assert (=> d!135345 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27138) e!699801)))

(declare-fun b!1233609 () Bool)

(declare-fun e!699800 () Bool)

(assert (=> b!1233609 (= e!699801 e!699800)))

(declare-fun res!821797 () Bool)

(assert (=> b!1233609 (=> (not res!821797) (not e!699800))))

(declare-fun e!699802 () Bool)

(assert (=> b!1233609 (= res!821797 (not e!699802))))

(declare-fun res!821798 () Bool)

(assert (=> b!1233609 (=> (not res!821798) (not e!699802))))

(assert (=> b!1233609 (= res!821798 (validKeyInArray!0 (select (arr!38368 a!3806) from!3184)))))

(declare-fun b!1233610 () Bool)

(declare-fun e!699803 () Bool)

(declare-fun call!60982 () Bool)

(assert (=> b!1233610 (= e!699803 call!60982)))

(declare-fun b!1233611 () Bool)

(assert (=> b!1233611 (= e!699803 call!60982)))

(declare-fun b!1233612 () Bool)

(assert (=> b!1233612 (= e!699800 e!699803)))

