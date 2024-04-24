; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104618 () Bool)

(assert start!104618)

(declare-fun b!1247478 () Bool)

(declare-fun res!832079 () Bool)

(declare-fun e!707577 () Bool)

(assert (=> b!1247478 (=> (not res!832079) (not e!707577))))

(declare-datatypes ((array!80251 0))(
  ( (array!80252 (arr!38699 (Array (_ BitVec 32) (_ BitVec 64))) (size!39236 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80251)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1247478 (= res!832079 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39236 a!3892)) (not (= newFrom!287 (size!39236 a!3892)))))))

(declare-fun b!1247479 () Bool)

(declare-fun res!832085 () Bool)

(declare-fun e!707579 () Bool)

(assert (=> b!1247479 (=> (not res!832085) (not e!707579))))

(declare-datatypes ((List!27515 0))(
  ( (Nil!27512) (Cons!27511 (h!28729 (_ BitVec 64)) (t!40976 List!27515)) )
))
(declare-fun contains!7489 (List!27515 (_ BitVec 64)) Bool)

(assert (=> b!1247479 (= res!832085 (not (contains!7489 Nil!27512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1247480 () Bool)

(declare-fun res!832086 () Bool)

(assert (=> b!1247480 (=> (not res!832086) (not e!707579))))

(declare-fun lt!563512 () List!27515)

(assert (=> b!1247480 (= res!832086 (not (contains!7489 lt!563512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1247481 () Bool)

(declare-fun res!832088 () Bool)

(assert (=> b!1247481 (=> (not res!832088) (not e!707579))))

(assert (=> b!1247481 (= res!832088 (not (contains!7489 lt!563512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!832080 () Bool)

(assert (=> start!104618 (=> (not res!832080) (not e!707577))))

(assert (=> start!104618 (= res!832080 (and (bvslt (size!39236 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39236 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39236 a!3892))))))

(assert (=> start!104618 e!707577))

(declare-fun array_inv!29637 (array!80251) Bool)

(assert (=> start!104618 (array_inv!29637 a!3892)))

(assert (=> start!104618 true))

(declare-fun b!1247482 () Bool)

(assert (=> b!1247482 (= e!707577 e!707579)))

(declare-fun res!832087 () Bool)

(assert (=> b!1247482 (=> (not res!832087) (not e!707579))))

(assert (=> b!1247482 (= res!832087 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1247482 (= lt!563512 (Cons!27511 (select (arr!38699 a!3892) from!3270) Nil!27512))))

(declare-fun b!1247483 () Bool)

(declare-fun res!832078 () Bool)

(assert (=> b!1247483 (=> (not res!832078) (not e!707577))))

(declare-fun arrayNoDuplicates!0 (array!80251 (_ BitVec 32) List!27515) Bool)

(assert (=> b!1247483 (= res!832078 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27512))))

(declare-fun b!1247484 () Bool)

(declare-fun res!832083 () Bool)

(assert (=> b!1247484 (=> (not res!832083) (not e!707579))))

(declare-fun noDuplicate!2053 (List!27515) Bool)

(assert (=> b!1247484 (= res!832083 (noDuplicate!2053 lt!563512))))

(declare-fun b!1247485 () Bool)

(declare-fun res!832084 () Bool)

(assert (=> b!1247485 (=> (not res!832084) (not e!707577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247485 (= res!832084 (validKeyInArray!0 (select (arr!38699 a!3892) from!3270)))))

(declare-fun b!1247486 () Bool)

(declare-fun res!832081 () Bool)

(assert (=> b!1247486 (=> (not res!832081) (not e!707579))))

(declare-fun subseq!656 (List!27515 List!27515) Bool)

(assert (=> b!1247486 (= res!832081 (subseq!656 Nil!27512 lt!563512))))

(declare-fun b!1247487 () Bool)

(declare-fun res!832082 () Bool)

(assert (=> b!1247487 (=> (not res!832082) (not e!707579))))

(assert (=> b!1247487 (= res!832082 (not (contains!7489 Nil!27512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1247488 () Bool)

(assert (=> b!1247488 (= e!707579 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563512)))))

(declare-datatypes ((Unit!41369 0))(
  ( (Unit!41370) )
))
(declare-fun lt!563511 () Unit!41369)

(declare-fun noDuplicateSubseq!107 (List!27515 List!27515) Unit!41369)

(assert (=> b!1247488 (= lt!563511 (noDuplicateSubseq!107 Nil!27512 lt!563512))))

(assert (= (and start!104618 res!832080) b!1247483))

(assert (= (and b!1247483 res!832078) b!1247478))

(assert (= (and b!1247478 res!832079) b!1247485))

(assert (= (and b!1247485 res!832084) b!1247482))

(assert (= (and b!1247482 res!832087) b!1247484))

(assert (= (and b!1247484 res!832083) b!1247480))

(assert (= (and b!1247480 res!832086) b!1247481))

(assert (= (and b!1247481 res!832088) b!1247487))

(assert (= (and b!1247487 res!832082) b!1247479))

(assert (= (and b!1247479 res!832085) b!1247486))

(assert (= (and b!1247486 res!832081) b!1247488))

(declare-fun m!1149673 () Bool)

(assert (=> b!1247485 m!1149673))

(assert (=> b!1247485 m!1149673))

(declare-fun m!1149675 () Bool)

(assert (=> b!1247485 m!1149675))

(declare-fun m!1149677 () Bool)

(assert (=> b!1247486 m!1149677))

(declare-fun m!1149679 () Bool)

(assert (=> b!1247483 m!1149679))

(declare-fun m!1149681 () Bool)

(assert (=> b!1247481 m!1149681))

(declare-fun m!1149683 () Bool)

(assert (=> b!1247484 m!1149683))

(assert (=> b!1247482 m!1149673))

(declare-fun m!1149685 () Bool)

(assert (=> b!1247480 m!1149685))

(declare-fun m!1149687 () Bool)

(assert (=> b!1247487 m!1149687))

(declare-fun m!1149689 () Bool)

(assert (=> b!1247488 m!1149689))

(declare-fun m!1149691 () Bool)

(assert (=> b!1247488 m!1149691))

(declare-fun m!1149693 () Bool)

(assert (=> b!1247479 m!1149693))

(declare-fun m!1149695 () Bool)

(assert (=> start!104618 m!1149695))

(check-sat (not b!1247479) (not b!1247485) (not b!1247480) (not b!1247486) (not b!1247483) (not b!1247488) (not b!1247481) (not b!1247484) (not start!104618) (not b!1247487))
(check-sat)
(get-model)

(declare-fun d!138037 () Bool)

(assert (=> d!138037 (= (validKeyInArray!0 (select (arr!38699 a!3892) from!3270)) (and (not (= (select (arr!38699 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38699 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1247485 d!138037))

(declare-fun d!138039 () Bool)

(declare-fun lt!563527 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!628 (List!27515) (InoxSet (_ BitVec 64)))

(assert (=> d!138039 (= lt!563527 (select (content!628 lt!563512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707603 () Bool)

(assert (=> d!138039 (= lt!563527 e!707603)))

(declare-fun res!832159 () Bool)

(assert (=> d!138039 (=> (not res!832159) (not e!707603))))

(get-info :version)

(assert (=> d!138039 (= res!832159 ((_ is Cons!27511) lt!563512))))

(assert (=> d!138039 (= (contains!7489 lt!563512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563527)))

(declare-fun b!1247559 () Bool)

(declare-fun e!707602 () Bool)

(assert (=> b!1247559 (= e!707603 e!707602)))

(declare-fun res!832160 () Bool)

(assert (=> b!1247559 (=> res!832160 e!707602)))

(assert (=> b!1247559 (= res!832160 (= (h!28729 lt!563512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247560 () Bool)

(assert (=> b!1247560 (= e!707602 (contains!7489 (t!40976 lt!563512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138039 res!832159) b!1247559))

(assert (= (and b!1247559 (not res!832160)) b!1247560))

(declare-fun m!1149745 () Bool)

(assert (=> d!138039 m!1149745))

(declare-fun m!1149747 () Bool)

(assert (=> d!138039 m!1149747))

(declare-fun m!1149749 () Bool)

(assert (=> b!1247560 m!1149749))

(assert (=> b!1247480 d!138039))

(declare-fun d!138041 () Bool)

(declare-fun res!832169 () Bool)

(declare-fun e!707612 () Bool)

(assert (=> d!138041 (=> res!832169 e!707612)))

(assert (=> d!138041 (= res!832169 ((_ is Nil!27512) Nil!27512))))

(assert (=> d!138041 (= (subseq!656 Nil!27512 lt!563512) e!707612)))

(declare-fun b!1247572 () Bool)

(declare-fun e!707614 () Bool)

(assert (=> b!1247572 (= e!707614 (subseq!656 Nil!27512 (t!40976 lt!563512)))))

(declare-fun b!1247570 () Bool)

(declare-fun e!707613 () Bool)

(assert (=> b!1247570 (= e!707613 e!707614)))

(declare-fun res!832170 () Bool)

(assert (=> b!1247570 (=> res!832170 e!707614)))

(declare-fun e!707615 () Bool)

(assert (=> b!1247570 (= res!832170 e!707615)))

(declare-fun res!832171 () Bool)

(assert (=> b!1247570 (=> (not res!832171) (not e!707615))))

(assert (=> b!1247570 (= res!832171 (= (h!28729 Nil!27512) (h!28729 lt!563512)))))

(declare-fun b!1247569 () Bool)

(assert (=> b!1247569 (= e!707612 e!707613)))

(declare-fun res!832172 () Bool)

(assert (=> b!1247569 (=> (not res!832172) (not e!707613))))

(assert (=> b!1247569 (= res!832172 ((_ is Cons!27511) lt!563512))))

(declare-fun b!1247571 () Bool)

(assert (=> b!1247571 (= e!707615 (subseq!656 (t!40976 Nil!27512) (t!40976 lt!563512)))))

(assert (= (and d!138041 (not res!832169)) b!1247569))

(assert (= (and b!1247569 res!832172) b!1247570))

(assert (= (and b!1247570 res!832171) b!1247571))

(assert (= (and b!1247570 (not res!832170)) b!1247572))

(declare-fun m!1149751 () Bool)

(assert (=> b!1247572 m!1149751))

(declare-fun m!1149753 () Bool)

(assert (=> b!1247571 m!1149753))

(assert (=> b!1247486 d!138041))

(declare-fun d!138045 () Bool)

(declare-fun res!832181 () Bool)

(declare-fun e!707624 () Bool)

(assert (=> d!138045 (=> res!832181 e!707624)))

(assert (=> d!138045 (= res!832181 ((_ is Nil!27512) lt!563512))))

(assert (=> d!138045 (= (noDuplicate!2053 lt!563512) e!707624)))

(declare-fun b!1247581 () Bool)

(declare-fun e!707625 () Bool)

(assert (=> b!1247581 (= e!707624 e!707625)))

(declare-fun res!832182 () Bool)

(assert (=> b!1247581 (=> (not res!832182) (not e!707625))))

(assert (=> b!1247581 (= res!832182 (not (contains!7489 (t!40976 lt!563512) (h!28729 lt!563512))))))

(declare-fun b!1247582 () Bool)

(assert (=> b!1247582 (= e!707625 (noDuplicate!2053 (t!40976 lt!563512)))))

(assert (= (and d!138045 (not res!832181)) b!1247581))

(assert (= (and b!1247581 res!832182) b!1247582))

(declare-fun m!1149755 () Bool)

(assert (=> b!1247581 m!1149755))

(declare-fun m!1149757 () Bool)

(assert (=> b!1247582 m!1149757))

(assert (=> b!1247484 d!138045))

(declare-fun d!138049 () Bool)

(declare-fun lt!563530 () Bool)

(assert (=> d!138049 (= lt!563530 (select (content!628 Nil!27512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707627 () Bool)

(assert (=> d!138049 (= lt!563530 e!707627)))

(declare-fun res!832183 () Bool)

(assert (=> d!138049 (=> (not res!832183) (not e!707627))))

(assert (=> d!138049 (= res!832183 ((_ is Cons!27511) Nil!27512))))

(assert (=> d!138049 (= (contains!7489 Nil!27512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563530)))

(declare-fun b!1247583 () Bool)

(declare-fun e!707626 () Bool)

(assert (=> b!1247583 (= e!707627 e!707626)))

(declare-fun res!832184 () Bool)

(assert (=> b!1247583 (=> res!832184 e!707626)))

(assert (=> b!1247583 (= res!832184 (= (h!28729 Nil!27512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247584 () Bool)

(assert (=> b!1247584 (= e!707626 (contains!7489 (t!40976 Nil!27512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138049 res!832183) b!1247583))

(assert (= (and b!1247583 (not res!832184)) b!1247584))

(declare-fun m!1149759 () Bool)

(assert (=> d!138049 m!1149759))

(declare-fun m!1149761 () Bool)

(assert (=> d!138049 m!1149761))

(declare-fun m!1149763 () Bool)

(assert (=> b!1247584 m!1149763))

(assert (=> b!1247479 d!138049))

(declare-fun b!1247630 () Bool)

(declare-fun e!707669 () Bool)

(declare-fun call!61588 () Bool)

(assert (=> b!1247630 (= e!707669 call!61588)))

(declare-fun b!1247631 () Bool)

(declare-fun e!707671 () Bool)

(assert (=> b!1247631 (= e!707671 (contains!7489 lt!563512 (select (arr!38699 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun bm!61585 () Bool)

(declare-fun c!122397 () Bool)

(assert (=> bm!61585 (= call!61588 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!122397 (Cons!27511 (select (arr!38699 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) lt!563512) lt!563512)))))

(declare-fun d!138051 () Bool)

(declare-fun res!832220 () Bool)

(declare-fun e!707668 () Bool)

(assert (=> d!138051 (=> res!832220 e!707668)))

(assert (=> d!138051 (= res!832220 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39236 a!3892)))))

(assert (=> d!138051 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563512) e!707668)))

(declare-fun b!1247632 () Bool)

(assert (=> b!1247632 (= e!707669 call!61588)))

(declare-fun b!1247633 () Bool)

(declare-fun e!707670 () Bool)

(assert (=> b!1247633 (= e!707668 e!707670)))

(declare-fun res!832221 () Bool)

(assert (=> b!1247633 (=> (not res!832221) (not e!707670))))

(assert (=> b!1247633 (= res!832221 (not e!707671))))

(declare-fun res!832222 () Bool)

(assert (=> b!1247633 (=> (not res!832222) (not e!707671))))

(assert (=> b!1247633 (= res!832222 (validKeyInArray!0 (select (arr!38699 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1247634 () Bool)

(assert (=> b!1247634 (= e!707670 e!707669)))

(assert (=> b!1247634 (= c!122397 (validKeyInArray!0 (select (arr!38699 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!138051 (not res!832220)) b!1247633))

(assert (= (and b!1247633 res!832222) b!1247631))

(assert (= (and b!1247633 res!832221) b!1247634))

(assert (= (and b!1247634 c!122397) b!1247632))

(assert (= (and b!1247634 (not c!122397)) b!1247630))

(assert (= (or b!1247632 b!1247630) bm!61585))

(declare-fun m!1149797 () Bool)

(assert (=> b!1247631 m!1149797))

(assert (=> b!1247631 m!1149797))

(declare-fun m!1149799 () Bool)

(assert (=> b!1247631 m!1149799))

(assert (=> bm!61585 m!1149797))

(declare-fun m!1149801 () Bool)

(assert (=> bm!61585 m!1149801))

(assert (=> b!1247633 m!1149797))

(assert (=> b!1247633 m!1149797))

(declare-fun m!1149803 () Bool)

(assert (=> b!1247633 m!1149803))

(assert (=> b!1247634 m!1149797))

(assert (=> b!1247634 m!1149797))

(assert (=> b!1247634 m!1149803))

(assert (=> b!1247488 d!138051))

(declare-fun d!138067 () Bool)

(assert (=> d!138067 (noDuplicate!2053 Nil!27512)))

(declare-fun lt!563540 () Unit!41369)

(declare-fun choose!1847 (List!27515 List!27515) Unit!41369)

(assert (=> d!138067 (= lt!563540 (choose!1847 Nil!27512 lt!563512))))

(declare-fun e!707681 () Bool)

(assert (=> d!138067 e!707681))

(declare-fun res!832231 () Bool)

(assert (=> d!138067 (=> (not res!832231) (not e!707681))))

(assert (=> d!138067 (= res!832231 (subseq!656 Nil!27512 lt!563512))))

(assert (=> d!138067 (= (noDuplicateSubseq!107 Nil!27512 lt!563512) lt!563540)))

(declare-fun b!1247645 () Bool)

(assert (=> b!1247645 (= e!707681 (noDuplicate!2053 lt!563512))))

(assert (= (and d!138067 res!832231) b!1247645))

(declare-fun m!1149813 () Bool)

(assert (=> d!138067 m!1149813))

(declare-fun m!1149815 () Bool)

(assert (=> d!138067 m!1149815))

(assert (=> d!138067 m!1149677))

(assert (=> b!1247645 m!1149683))

(assert (=> b!1247488 d!138067))

(declare-fun b!1247646 () Bool)

(declare-fun e!707683 () Bool)

(declare-fun call!61590 () Bool)

(assert (=> b!1247646 (= e!707683 call!61590)))

(declare-fun b!1247647 () Bool)

(declare-fun e!707685 () Bool)

(assert (=> b!1247647 (= e!707685 (contains!7489 Nil!27512 (select (arr!38699 a!3892) from!3270)))))

(declare-fun c!122399 () Bool)

(declare-fun bm!61587 () Bool)

(assert (=> bm!61587 (= call!61590 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122399 (Cons!27511 (select (arr!38699 a!3892) from!3270) Nil!27512) Nil!27512)))))

(declare-fun d!138075 () Bool)

(declare-fun res!832232 () Bool)

(declare-fun e!707682 () Bool)

(assert (=> d!138075 (=> res!832232 e!707682)))

(assert (=> d!138075 (= res!832232 (bvsge from!3270 (size!39236 a!3892)))))

(assert (=> d!138075 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27512) e!707682)))

(declare-fun b!1247648 () Bool)

(assert (=> b!1247648 (= e!707683 call!61590)))

(declare-fun b!1247649 () Bool)

(declare-fun e!707684 () Bool)

(assert (=> b!1247649 (= e!707682 e!707684)))

(declare-fun res!832233 () Bool)

(assert (=> b!1247649 (=> (not res!832233) (not e!707684))))

(assert (=> b!1247649 (= res!832233 (not e!707685))))

(declare-fun res!832234 () Bool)

(assert (=> b!1247649 (=> (not res!832234) (not e!707685))))

(assert (=> b!1247649 (= res!832234 (validKeyInArray!0 (select (arr!38699 a!3892) from!3270)))))

(declare-fun b!1247650 () Bool)

(assert (=> b!1247650 (= e!707684 e!707683)))

(assert (=> b!1247650 (= c!122399 (validKeyInArray!0 (select (arr!38699 a!3892) from!3270)))))

(assert (= (and d!138075 (not res!832232)) b!1247649))

(assert (= (and b!1247649 res!832234) b!1247647))

(assert (= (and b!1247649 res!832233) b!1247650))

(assert (= (and b!1247650 c!122399) b!1247648))

(assert (= (and b!1247650 (not c!122399)) b!1247646))

(assert (= (or b!1247648 b!1247646) bm!61587))

(assert (=> b!1247647 m!1149673))

(assert (=> b!1247647 m!1149673))

(declare-fun m!1149817 () Bool)

(assert (=> b!1247647 m!1149817))

(assert (=> bm!61587 m!1149673))

(declare-fun m!1149819 () Bool)

(assert (=> bm!61587 m!1149819))

(assert (=> b!1247649 m!1149673))

(assert (=> b!1247649 m!1149673))

(assert (=> b!1247649 m!1149675))

(assert (=> b!1247650 m!1149673))

(assert (=> b!1247650 m!1149673))

(assert (=> b!1247650 m!1149675))

(assert (=> b!1247483 d!138075))

(declare-fun d!138077 () Bool)

(declare-fun lt!563541 () Bool)

(assert (=> d!138077 (= lt!563541 (select (content!628 lt!563512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707695 () Bool)

(assert (=> d!138077 (= lt!563541 e!707695)))

(declare-fun res!832241 () Bool)

(assert (=> d!138077 (=> (not res!832241) (not e!707695))))

(assert (=> d!138077 (= res!832241 ((_ is Cons!27511) lt!563512))))

(assert (=> d!138077 (= (contains!7489 lt!563512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563541)))

(declare-fun b!1247661 () Bool)

(declare-fun e!707694 () Bool)

(assert (=> b!1247661 (= e!707695 e!707694)))

(declare-fun res!832242 () Bool)

(assert (=> b!1247661 (=> res!832242 e!707694)))

(assert (=> b!1247661 (= res!832242 (= (h!28729 lt!563512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247662 () Bool)

(assert (=> b!1247662 (= e!707694 (contains!7489 (t!40976 lt!563512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138077 res!832241) b!1247661))

(assert (= (and b!1247661 (not res!832242)) b!1247662))

(assert (=> d!138077 m!1149745))

(declare-fun m!1149821 () Bool)

(assert (=> d!138077 m!1149821))

(declare-fun m!1149823 () Bool)

(assert (=> b!1247662 m!1149823))

(assert (=> b!1247481 d!138077))

(declare-fun d!138079 () Bool)

(assert (=> d!138079 (= (array_inv!29637 a!3892) (bvsge (size!39236 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104618 d!138079))

(declare-fun d!138081 () Bool)

(declare-fun lt!563544 () Bool)

(assert (=> d!138081 (= lt!563544 (select (content!628 Nil!27512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707701 () Bool)

(assert (=> d!138081 (= lt!563544 e!707701)))

(declare-fun res!832247 () Bool)

(assert (=> d!138081 (=> (not res!832247) (not e!707701))))

(assert (=> d!138081 (= res!832247 ((_ is Cons!27511) Nil!27512))))

(assert (=> d!138081 (= (contains!7489 Nil!27512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563544)))

(declare-fun b!1247667 () Bool)

(declare-fun e!707700 () Bool)

(assert (=> b!1247667 (= e!707701 e!707700)))

(declare-fun res!832248 () Bool)

(assert (=> b!1247667 (=> res!832248 e!707700)))

(assert (=> b!1247667 (= res!832248 (= (h!28729 Nil!27512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247668 () Bool)

(assert (=> b!1247668 (= e!707700 (contains!7489 (t!40976 Nil!27512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138081 res!832247) b!1247667))

(assert (= (and b!1247667 (not res!832248)) b!1247668))

(assert (=> d!138081 m!1149759))

(declare-fun m!1149825 () Bool)

(assert (=> d!138081 m!1149825))

(declare-fun m!1149827 () Bool)

(assert (=> b!1247668 m!1149827))

(assert (=> b!1247487 d!138081))

(check-sat (not b!1247631) (not b!1247560) (not b!1247571) (not d!138081) (not b!1247581) (not b!1247582) (not d!138077) (not bm!61585) (not b!1247668) (not d!138067) (not b!1247572) (not b!1247633) (not b!1247634) (not bm!61587) (not b!1247647) (not b!1247650) (not d!138039) (not b!1247645) (not b!1247662) (not b!1247649) (not d!138049) (not b!1247584))
(check-sat)
