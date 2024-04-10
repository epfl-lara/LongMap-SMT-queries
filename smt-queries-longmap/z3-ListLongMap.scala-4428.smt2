; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61462 () Bool)

(assert start!61462)

(declare-fun b!687620 () Bool)

(declare-fun res!452498 () Bool)

(declare-fun e!391639 () Bool)

(assert (=> b!687620 (=> (not res!452498) (not e!391639))))

(declare-datatypes ((array!39684 0))(
  ( (array!39685 (arr!19015 (Array (_ BitVec 32) (_ BitVec 64))) (size!19394 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39684)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687620 (= res!452498 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687621 () Bool)

(declare-fun e!391634 () Bool)

(declare-datatypes ((List!13056 0))(
  ( (Nil!13053) (Cons!13052 (h!14097 (_ BitVec 64)) (t!19317 List!13056)) )
))
(declare-fun lt!315484 () List!13056)

(declare-fun contains!3633 (List!13056 (_ BitVec 64)) Bool)

(assert (=> b!687621 (= e!391634 (not (contains!3633 lt!315484 k0!2843)))))

(declare-fun b!687622 () Bool)

(declare-fun res!452496 () Bool)

(assert (=> b!687622 (=> (not res!452496) (not e!391639))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!687622 (= res!452496 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19394 a!3626))))))

(declare-fun b!687623 () Bool)

(declare-fun e!391632 () Bool)

(assert (=> b!687623 (= e!391639 (not e!391632))))

(declare-fun res!452490 () Bool)

(assert (=> b!687623 (=> res!452490 e!391632)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!687623 (= res!452490 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39684 (_ BitVec 32) List!13056) Bool)

(assert (=> b!687623 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315484)))

(declare-datatypes ((Unit!24242 0))(
  ( (Unit!24243) )
))
(declare-fun lt!315476 () Unit!24242)

(declare-fun acc!681 () List!13056)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39684 (_ BitVec 64) (_ BitVec 32) List!13056 List!13056) Unit!24242)

(assert (=> b!687623 (= lt!315476 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315484))))

(declare-fun -!184 (List!13056 (_ BitVec 64)) List!13056)

(assert (=> b!687623 (= (-!184 lt!315484 k0!2843) acc!681)))

(declare-fun $colon$colon!384 (List!13056 (_ BitVec 64)) List!13056)

(assert (=> b!687623 (= lt!315484 ($colon$colon!384 acc!681 k0!2843))))

(declare-fun lt!315483 () Unit!24242)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13056) Unit!24242)

(assert (=> b!687623 (= lt!315483 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!219 (List!13056 List!13056) Bool)

(assert (=> b!687623 (subseq!219 acc!681 acc!681)))

(declare-fun lt!315479 () Unit!24242)

(declare-fun lemmaListSubSeqRefl!0 (List!13056) Unit!24242)

(assert (=> b!687623 (= lt!315479 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687623 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315482 () Unit!24242)

(declare-fun e!391637 () Unit!24242)

(assert (=> b!687623 (= lt!315482 e!391637)))

(declare-fun c!77935 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687623 (= c!77935 (validKeyInArray!0 (select (arr!19015 a!3626) from!3004)))))

(declare-fun lt!315480 () Unit!24242)

(declare-fun e!391633 () Unit!24242)

(assert (=> b!687623 (= lt!315480 e!391633)))

(declare-fun c!77936 () Bool)

(assert (=> b!687623 (= c!77936 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687623 (arrayContainsKey!0 (array!39685 (store (arr!19015 a!3626) i!1382 k0!2843) (size!19394 a!3626)) k0!2843 from!3004)))

(declare-fun b!687624 () Bool)

(declare-fun e!391635 () Bool)

(declare-fun e!391636 () Bool)

(assert (=> b!687624 (= e!391635 e!391636)))

(declare-fun res!452492 () Bool)

(assert (=> b!687624 (=> (not res!452492) (not e!391636))))

(assert (=> b!687624 (= res!452492 (bvsle from!3004 i!1382))))

(declare-fun b!687625 () Bool)

(declare-fun res!452495 () Bool)

(assert (=> b!687625 (=> res!452495 e!391632)))

(declare-fun e!391640 () Bool)

(assert (=> b!687625 (= res!452495 e!391640)))

(declare-fun res!452503 () Bool)

(assert (=> b!687625 (=> (not res!452503) (not e!391640))))

(assert (=> b!687625 (= res!452503 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687626 () Bool)

(declare-fun Unit!24244 () Unit!24242)

(assert (=> b!687626 (= e!391633 Unit!24244)))

(declare-fun b!687627 () Bool)

(declare-fun Unit!24245 () Unit!24242)

(assert (=> b!687627 (= e!391633 Unit!24245)))

(declare-fun lt!315478 () Unit!24242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39684 (_ BitVec 64) (_ BitVec 32)) Unit!24242)

(assert (=> b!687627 (= lt!315478 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!687627 false))

(declare-fun b!687628 () Bool)

(declare-fun res!452485 () Bool)

(assert (=> b!687628 (=> (not res!452485) (not e!391639))))

(assert (=> b!687628 (= res!452485 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13053))))

(declare-fun b!687629 () Bool)

(assert (=> b!687629 (= e!391636 (not (contains!3633 acc!681 k0!2843)))))

(declare-fun b!687630 () Bool)

(declare-fun res!452487 () Bool)

(assert (=> b!687630 (=> res!452487 e!391632)))

(assert (=> b!687630 (= res!452487 (contains!3633 lt!315484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687631 () Bool)

(declare-fun res!452488 () Bool)

(assert (=> b!687631 (=> (not res!452488) (not e!391639))))

(assert (=> b!687631 (= res!452488 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687632 () Bool)

(declare-fun e!391638 () Bool)

(assert (=> b!687632 (= e!391638 (contains!3633 acc!681 k0!2843))))

(declare-fun b!687633 () Bool)

(declare-fun res!452497 () Bool)

(assert (=> b!687633 (=> res!452497 e!391632)))

(declare-fun noDuplicate!880 (List!13056) Bool)

(assert (=> b!687633 (= res!452497 (not (noDuplicate!880 lt!315484)))))

(declare-fun b!687634 () Bool)

(declare-fun res!452493 () Bool)

(assert (=> b!687634 (=> (not res!452493) (not e!391639))))

(assert (=> b!687634 (= res!452493 (validKeyInArray!0 k0!2843))))

(declare-fun b!687635 () Bool)

(assert (=> b!687635 (= e!391632 e!391634)))

(declare-fun res!452489 () Bool)

(assert (=> b!687635 (=> (not res!452489) (not e!391634))))

(assert (=> b!687635 (= res!452489 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687636 () Bool)

(declare-fun res!452499 () Bool)

(assert (=> b!687636 (=> (not res!452499) (not e!391639))))

(assert (=> b!687636 (= res!452499 (not (contains!3633 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687637 () Bool)

(declare-fun res!452484 () Bool)

(assert (=> b!687637 (=> res!452484 e!391632)))

(assert (=> b!687637 (= res!452484 (contains!3633 lt!315484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687638 () Bool)

(assert (=> b!687638 (= e!391640 (contains!3633 lt!315484 k0!2843))))

(declare-fun b!687639 () Bool)

(declare-fun res!452494 () Bool)

(assert (=> b!687639 (=> (not res!452494) (not e!391639))))

(assert (=> b!687639 (= res!452494 (noDuplicate!880 acc!681))))

(declare-fun b!687640 () Bool)

(declare-fun res!452502 () Bool)

(assert (=> b!687640 (=> (not res!452502) (not e!391639))))

(assert (=> b!687640 (= res!452502 e!391635)))

(declare-fun res!452491 () Bool)

(assert (=> b!687640 (=> res!452491 e!391635)))

(assert (=> b!687640 (= res!452491 e!391638)))

(declare-fun res!452486 () Bool)

(assert (=> b!687640 (=> (not res!452486) (not e!391638))))

(assert (=> b!687640 (= res!452486 (bvsgt from!3004 i!1382))))

(declare-fun b!687642 () Bool)

(declare-fun res!452501 () Bool)

(assert (=> b!687642 (=> (not res!452501) (not e!391639))))

(assert (=> b!687642 (= res!452501 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19394 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!452500 () Bool)

(assert (=> start!61462 (=> (not res!452500) (not e!391639))))

(assert (=> start!61462 (= res!452500 (and (bvslt (size!19394 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19394 a!3626))))))

(assert (=> start!61462 e!391639))

(assert (=> start!61462 true))

(declare-fun array_inv!14811 (array!39684) Bool)

(assert (=> start!61462 (array_inv!14811 a!3626)))

(declare-fun b!687641 () Bool)

(declare-fun Unit!24246 () Unit!24242)

(assert (=> b!687641 (= e!391637 Unit!24246)))

(declare-fun b!687643 () Bool)

(declare-fun lt!315477 () Unit!24242)

(assert (=> b!687643 (= e!391637 lt!315477)))

(declare-fun lt!315481 () Unit!24242)

(assert (=> b!687643 (= lt!315481 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687643 (subseq!219 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39684 List!13056 List!13056 (_ BitVec 32)) Unit!24242)

(assert (=> b!687643 (= lt!315477 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!384 acc!681 (select (arr!19015 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687643 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687644 () Bool)

(declare-fun res!452504 () Bool)

(assert (=> b!687644 (=> (not res!452504) (not e!391639))))

(assert (=> b!687644 (= res!452504 (not (contains!3633 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61462 res!452500) b!687639))

(assert (= (and b!687639 res!452494) b!687636))

(assert (= (and b!687636 res!452499) b!687644))

(assert (= (and b!687644 res!452504) b!687640))

(assert (= (and b!687640 res!452486) b!687632))

(assert (= (and b!687640 (not res!452491)) b!687624))

(assert (= (and b!687624 res!452492) b!687629))

(assert (= (and b!687640 res!452502) b!687628))

(assert (= (and b!687628 res!452485) b!687631))

(assert (= (and b!687631 res!452488) b!687622))

(assert (= (and b!687622 res!452496) b!687634))

(assert (= (and b!687634 res!452493) b!687620))

(assert (= (and b!687620 res!452498) b!687642))

(assert (= (and b!687642 res!452501) b!687623))

(assert (= (and b!687623 c!77936) b!687627))

(assert (= (and b!687623 (not c!77936)) b!687626))

(assert (= (and b!687623 c!77935) b!687643))

(assert (= (and b!687623 (not c!77935)) b!687641))

(assert (= (and b!687623 (not res!452490)) b!687633))

(assert (= (and b!687633 (not res!452497)) b!687637))

(assert (= (and b!687637 (not res!452484)) b!687630))

(assert (= (and b!687630 (not res!452487)) b!687625))

(assert (= (and b!687625 res!452503) b!687638))

(assert (= (and b!687625 (not res!452495)) b!687635))

(assert (= (and b!687635 res!452489) b!687621))

(declare-fun m!651627 () Bool)

(assert (=> b!687631 m!651627))

(declare-fun m!651629 () Bool)

(assert (=> b!687634 m!651629))

(declare-fun m!651631 () Bool)

(assert (=> b!687627 m!651631))

(declare-fun m!651633 () Bool)

(assert (=> b!687629 m!651633))

(declare-fun m!651635 () Bool)

(assert (=> b!687637 m!651635))

(declare-fun m!651637 () Bool)

(assert (=> b!687630 m!651637))

(declare-fun m!651639 () Bool)

(assert (=> b!687639 m!651639))

(declare-fun m!651641 () Bool)

(assert (=> start!61462 m!651641))

(declare-fun m!651643 () Bool)

(assert (=> b!687638 m!651643))

(declare-fun m!651645 () Bool)

(assert (=> b!687628 m!651645))

(declare-fun m!651647 () Bool)

(assert (=> b!687623 m!651647))

(declare-fun m!651649 () Bool)

(assert (=> b!687623 m!651649))

(declare-fun m!651651 () Bool)

(assert (=> b!687623 m!651651))

(declare-fun m!651653 () Bool)

(assert (=> b!687623 m!651653))

(declare-fun m!651655 () Bool)

(assert (=> b!687623 m!651655))

(declare-fun m!651657 () Bool)

(assert (=> b!687623 m!651657))

(declare-fun m!651659 () Bool)

(assert (=> b!687623 m!651659))

(declare-fun m!651661 () Bool)

(assert (=> b!687623 m!651661))

(assert (=> b!687623 m!651649))

(declare-fun m!651663 () Bool)

(assert (=> b!687623 m!651663))

(declare-fun m!651665 () Bool)

(assert (=> b!687623 m!651665))

(declare-fun m!651667 () Bool)

(assert (=> b!687623 m!651667))

(declare-fun m!651669 () Bool)

(assert (=> b!687623 m!651669))

(declare-fun m!651671 () Bool)

(assert (=> b!687623 m!651671))

(assert (=> b!687632 m!651633))

(assert (=> b!687643 m!651647))

(assert (=> b!687643 m!651649))

(declare-fun m!651673 () Bool)

(assert (=> b!687643 m!651673))

(declare-fun m!651675 () Bool)

(assert (=> b!687643 m!651675))

(assert (=> b!687643 m!651649))

(assert (=> b!687643 m!651673))

(assert (=> b!687643 m!651667))

(assert (=> b!687643 m!651671))

(declare-fun m!651677 () Bool)

(assert (=> b!687633 m!651677))

(declare-fun m!651679 () Bool)

(assert (=> b!687644 m!651679))

(declare-fun m!651681 () Bool)

(assert (=> b!687636 m!651681))

(declare-fun m!651683 () Bool)

(assert (=> b!687620 m!651683))

(assert (=> b!687621 m!651643))

(check-sat (not b!687631) (not b!687643) (not b!687644) (not b!687629) (not b!687628) (not b!687621) (not b!687636) (not b!687633) (not b!687637) (not b!687630) (not b!687620) (not b!687639) (not b!687627) (not start!61462) (not b!687632) (not b!687623) (not b!687638) (not b!687634))
(check-sat)
(get-model)

(declare-fun d!95071 () Bool)

(declare-fun res!452572 () Bool)

(declare-fun e!391676 () Bool)

(assert (=> d!95071 (=> res!452572 e!391676)))

(get-info :version)

(assert (=> d!95071 (= res!452572 ((_ is Nil!13053) acc!681))))

(assert (=> d!95071 (= (noDuplicate!880 acc!681) e!391676)))

(declare-fun b!687724 () Bool)

(declare-fun e!391677 () Bool)

(assert (=> b!687724 (= e!391676 e!391677)))

(declare-fun res!452573 () Bool)

(assert (=> b!687724 (=> (not res!452573) (not e!391677))))

(assert (=> b!687724 (= res!452573 (not (contains!3633 (t!19317 acc!681) (h!14097 acc!681))))))

(declare-fun b!687725 () Bool)

(assert (=> b!687725 (= e!391677 (noDuplicate!880 (t!19317 acc!681)))))

(assert (= (and d!95071 (not res!452572)) b!687724))

(assert (= (and b!687724 res!452573) b!687725))

(declare-fun m!651743 () Bool)

(assert (=> b!687724 m!651743))

(declare-fun m!651745 () Bool)

(assert (=> b!687725 m!651745))

(assert (=> b!687639 d!95071))

(declare-fun d!95075 () Bool)

(declare-fun res!452598 () Bool)

(declare-fun e!391705 () Bool)

(assert (=> d!95075 (=> res!452598 e!391705)))

(assert (=> d!95075 (= res!452598 (bvsge #b00000000000000000000000000000000 (size!19394 a!3626)))))

(assert (=> d!95075 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13053) e!391705)))

(declare-fun b!687754 () Bool)

(declare-fun e!391704 () Bool)

(declare-fun call!34157 () Bool)

(assert (=> b!687754 (= e!391704 call!34157)))

(declare-fun b!687755 () Bool)

(declare-fun e!391706 () Bool)

(assert (=> b!687755 (= e!391706 (contains!3633 Nil!13053 (select (arr!19015 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687756 () Bool)

(declare-fun e!391707 () Bool)

(assert (=> b!687756 (= e!391707 e!391704)))

(declare-fun c!77945 () Bool)

(assert (=> b!687756 (= c!77945 (validKeyInArray!0 (select (arr!19015 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34154 () Bool)

(assert (=> bm!34154 (= call!34157 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77945 (Cons!13052 (select (arr!19015 a!3626) #b00000000000000000000000000000000) Nil!13053) Nil!13053)))))

(declare-fun b!687757 () Bool)

(assert (=> b!687757 (= e!391704 call!34157)))

(declare-fun b!687758 () Bool)

(assert (=> b!687758 (= e!391705 e!391707)))

(declare-fun res!452599 () Bool)

(assert (=> b!687758 (=> (not res!452599) (not e!391707))))

(assert (=> b!687758 (= res!452599 (not e!391706))))

(declare-fun res!452600 () Bool)

(assert (=> b!687758 (=> (not res!452600) (not e!391706))))

(assert (=> b!687758 (= res!452600 (validKeyInArray!0 (select (arr!19015 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95075 (not res!452598)) b!687758))

(assert (= (and b!687758 res!452600) b!687755))

(assert (= (and b!687758 res!452599) b!687756))

(assert (= (and b!687756 c!77945) b!687757))

(assert (= (and b!687756 (not c!77945)) b!687754))

(assert (= (or b!687757 b!687754) bm!34154))

(declare-fun m!651763 () Bool)

(assert (=> b!687755 m!651763))

(assert (=> b!687755 m!651763))

(declare-fun m!651765 () Bool)

(assert (=> b!687755 m!651765))

(assert (=> b!687756 m!651763))

(assert (=> b!687756 m!651763))

(declare-fun m!651767 () Bool)

(assert (=> b!687756 m!651767))

(assert (=> bm!34154 m!651763))

(declare-fun m!651769 () Bool)

(assert (=> bm!34154 m!651769))

(assert (=> b!687758 m!651763))

(assert (=> b!687758 m!651763))

(assert (=> b!687758 m!651767))

(assert (=> b!687628 d!95075))

(declare-fun d!95087 () Bool)

(declare-fun lt!315524 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!302 (List!13056) (InoxSet (_ BitVec 64)))

(assert (=> d!95087 (= lt!315524 (select (content!302 acc!681) k0!2843))))

(declare-fun e!391722 () Bool)

(assert (=> d!95087 (= lt!315524 e!391722)))

(declare-fun res!452614 () Bool)

(assert (=> d!95087 (=> (not res!452614) (not e!391722))))

(assert (=> d!95087 (= res!452614 ((_ is Cons!13052) acc!681))))

(assert (=> d!95087 (= (contains!3633 acc!681 k0!2843) lt!315524)))

(declare-fun b!687775 () Bool)

(declare-fun e!391723 () Bool)

(assert (=> b!687775 (= e!391722 e!391723)))

(declare-fun res!452613 () Bool)

(assert (=> b!687775 (=> res!452613 e!391723)))

(assert (=> b!687775 (= res!452613 (= (h!14097 acc!681) k0!2843))))

(declare-fun b!687776 () Bool)

(assert (=> b!687776 (= e!391723 (contains!3633 (t!19317 acc!681) k0!2843))))

(assert (= (and d!95087 res!452614) b!687775))

(assert (= (and b!687775 (not res!452613)) b!687776))

(declare-fun m!651779 () Bool)

(assert (=> d!95087 m!651779))

(declare-fun m!651781 () Bool)

(assert (=> d!95087 m!651781))

(declare-fun m!651783 () Bool)

(assert (=> b!687776 m!651783))

(assert (=> b!687629 d!95087))

(declare-fun d!95093 () Bool)

(assert (=> d!95093 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315527 () Unit!24242)

(declare-fun choose!13 (array!39684 (_ BitVec 64) (_ BitVec 32)) Unit!24242)

(assert (=> d!95093 (= lt!315527 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95093 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95093 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315527)))

(declare-fun bs!20168 () Bool)

(assert (= bs!20168 d!95093))

(assert (=> bs!20168 m!651683))

(declare-fun m!651793 () Bool)

(assert (=> bs!20168 m!651793))

(assert (=> b!687627 d!95093))

(declare-fun d!95097 () Bool)

(declare-fun lt!315528 () Bool)

(assert (=> d!95097 (= lt!315528 (select (content!302 lt!315484) k0!2843))))

(declare-fun e!391728 () Bool)

(assert (=> d!95097 (= lt!315528 e!391728)))

(declare-fun res!452619 () Bool)

(assert (=> d!95097 (=> (not res!452619) (not e!391728))))

(assert (=> d!95097 (= res!452619 ((_ is Cons!13052) lt!315484))))

(assert (=> d!95097 (= (contains!3633 lt!315484 k0!2843) lt!315528)))

(declare-fun b!687782 () Bool)

(declare-fun e!391729 () Bool)

(assert (=> b!687782 (= e!391728 e!391729)))

(declare-fun res!452618 () Bool)

(assert (=> b!687782 (=> res!452618 e!391729)))

(assert (=> b!687782 (= res!452618 (= (h!14097 lt!315484) k0!2843))))

(declare-fun b!687783 () Bool)

(assert (=> b!687783 (= e!391729 (contains!3633 (t!19317 lt!315484) k0!2843))))

(assert (= (and d!95097 res!452619) b!687782))

(assert (= (and b!687782 (not res!452618)) b!687783))

(declare-fun m!651795 () Bool)

(assert (=> d!95097 m!651795))

(declare-fun m!651797 () Bool)

(assert (=> d!95097 m!651797))

(declare-fun m!651799 () Bool)

(assert (=> b!687783 m!651799))

(assert (=> b!687638 d!95097))

(declare-fun d!95099 () Bool)

(declare-fun res!452620 () Bool)

(declare-fun e!391731 () Bool)

(assert (=> d!95099 (=> res!452620 e!391731)))

(assert (=> d!95099 (= res!452620 (bvsge from!3004 (size!19394 a!3626)))))

(assert (=> d!95099 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391731)))

(declare-fun b!687784 () Bool)

(declare-fun e!391730 () Bool)

(declare-fun call!34161 () Bool)

(assert (=> b!687784 (= e!391730 call!34161)))

(declare-fun b!687785 () Bool)

(declare-fun e!391732 () Bool)

(assert (=> b!687785 (= e!391732 (contains!3633 acc!681 (select (arr!19015 a!3626) from!3004)))))

(declare-fun b!687786 () Bool)

(declare-fun e!391733 () Bool)

(assert (=> b!687786 (= e!391733 e!391730)))

(declare-fun c!77949 () Bool)

(assert (=> b!687786 (= c!77949 (validKeyInArray!0 (select (arr!19015 a!3626) from!3004)))))

(declare-fun bm!34158 () Bool)

(assert (=> bm!34158 (= call!34161 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77949 (Cons!13052 (select (arr!19015 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687787 () Bool)

(assert (=> b!687787 (= e!391730 call!34161)))

(declare-fun b!687788 () Bool)

(assert (=> b!687788 (= e!391731 e!391733)))

(declare-fun res!452621 () Bool)

(assert (=> b!687788 (=> (not res!452621) (not e!391733))))

(assert (=> b!687788 (= res!452621 (not e!391732))))

(declare-fun res!452622 () Bool)

(assert (=> b!687788 (=> (not res!452622) (not e!391732))))

(assert (=> b!687788 (= res!452622 (validKeyInArray!0 (select (arr!19015 a!3626) from!3004)))))

(assert (= (and d!95099 (not res!452620)) b!687788))

(assert (= (and b!687788 res!452622) b!687785))

(assert (= (and b!687788 res!452621) b!687786))

(assert (= (and b!687786 c!77949) b!687787))

(assert (= (and b!687786 (not c!77949)) b!687784))

(assert (= (or b!687787 b!687784) bm!34158))

(assert (=> b!687785 m!651649))

(assert (=> b!687785 m!651649))

(declare-fun m!651801 () Bool)

(assert (=> b!687785 m!651801))

(assert (=> b!687786 m!651649))

(assert (=> b!687786 m!651649))

(assert (=> b!687786 m!651663))

(assert (=> bm!34158 m!651649))

(declare-fun m!651803 () Bool)

(assert (=> bm!34158 m!651803))

(assert (=> b!687788 m!651649))

(assert (=> b!687788 m!651649))

(assert (=> b!687788 m!651663))

(assert (=> b!687631 d!95099))

(declare-fun d!95101 () Bool)

(declare-fun res!452641 () Bool)

(declare-fun e!391757 () Bool)

(assert (=> d!95101 (=> res!452641 e!391757)))

(assert (=> d!95101 (= res!452641 (= (select (arr!19015 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95101 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391757)))

(declare-fun b!687815 () Bool)

(declare-fun e!391758 () Bool)

(assert (=> b!687815 (= e!391757 e!391758)))

(declare-fun res!452642 () Bool)

(assert (=> b!687815 (=> (not res!452642) (not e!391758))))

(assert (=> b!687815 (= res!452642 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19394 a!3626)))))

(declare-fun b!687816 () Bool)

(assert (=> b!687816 (= e!391758 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95101 (not res!452641)) b!687815))

(assert (= (and b!687815 res!452642) b!687816))

(assert (=> d!95101 m!651763))

(declare-fun m!651809 () Bool)

(assert (=> b!687816 m!651809))

(assert (=> b!687620 d!95101))

(assert (=> b!687621 d!95097))

(declare-fun d!95105 () Bool)

(declare-fun lt!315532 () Bool)

(assert (=> d!95105 (= lt!315532 (select (content!302 lt!315484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391762 () Bool)

(assert (=> d!95105 (= lt!315532 e!391762)))

(declare-fun res!452645 () Bool)

(assert (=> d!95105 (=> (not res!452645) (not e!391762))))

(assert (=> d!95105 (= res!452645 ((_ is Cons!13052) lt!315484))))

(assert (=> d!95105 (= (contains!3633 lt!315484 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315532)))

(declare-fun b!687822 () Bool)

(declare-fun e!391763 () Bool)

(assert (=> b!687822 (= e!391762 e!391763)))

(declare-fun res!452644 () Bool)

(assert (=> b!687822 (=> res!452644 e!391763)))

(assert (=> b!687822 (= res!452644 (= (h!14097 lt!315484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687823 () Bool)

(assert (=> b!687823 (= e!391763 (contains!3633 (t!19317 lt!315484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95105 res!452645) b!687822))

(assert (= (and b!687822 (not res!452644)) b!687823))

(assert (=> d!95105 m!651795))

(declare-fun m!651821 () Bool)

(assert (=> d!95105 m!651821))

(declare-fun m!651823 () Bool)

(assert (=> b!687823 m!651823))

(assert (=> b!687630 d!95105))

(declare-fun d!95109 () Bool)

(assert (=> d!95109 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315484)))

(declare-fun lt!315538 () Unit!24242)

(declare-fun choose!66 (array!39684 (_ BitVec 64) (_ BitVec 32) List!13056 List!13056) Unit!24242)

(assert (=> d!95109 (= lt!315538 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315484))))

(assert (=> d!95109 (bvslt (size!19394 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95109 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315484) lt!315538)))

(declare-fun bs!20170 () Bool)

(assert (= bs!20170 d!95109))

(assert (=> bs!20170 m!651665))

(declare-fun m!651827 () Bool)

(assert (=> bs!20170 m!651827))

(assert (=> b!687623 d!95109))

(declare-fun b!687858 () Bool)

(declare-fun e!391795 () List!13056)

(declare-fun call!34167 () List!13056)

(assert (=> b!687858 (= e!391795 call!34167)))

(declare-fun d!95113 () Bool)

(declare-fun e!391797 () Bool)

(assert (=> d!95113 e!391797))

(declare-fun res!452672 () Bool)

(assert (=> d!95113 (=> (not res!452672) (not e!391797))))

(declare-fun lt!315550 () List!13056)

(declare-fun size!19397 (List!13056) Int)

(assert (=> d!95113 (= res!452672 (<= (size!19397 lt!315550) (size!19397 lt!315484)))))

(declare-fun e!391796 () List!13056)

(assert (=> d!95113 (= lt!315550 e!391796)))

(declare-fun c!77960 () Bool)

(assert (=> d!95113 (= c!77960 ((_ is Cons!13052) lt!315484))))

(assert (=> d!95113 (= (-!184 lt!315484 k0!2843) lt!315550)))

(declare-fun b!687859 () Bool)

(assert (=> b!687859 (= e!391795 (Cons!13052 (h!14097 lt!315484) call!34167))))

(declare-fun b!687860 () Bool)

(assert (=> b!687860 (= e!391797 (= (content!302 lt!315550) ((_ map and) (content!302 lt!315484) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!687861 () Bool)

(assert (=> b!687861 (= e!391796 e!391795)))

(declare-fun c!77961 () Bool)

(assert (=> b!687861 (= c!77961 (= k0!2843 (h!14097 lt!315484)))))

(declare-fun bm!34164 () Bool)

(assert (=> bm!34164 (= call!34167 (-!184 (t!19317 lt!315484) k0!2843))))

(declare-fun b!687862 () Bool)

(assert (=> b!687862 (= e!391796 Nil!13053)))

(assert (= (and d!95113 c!77960) b!687861))

(assert (= (and d!95113 (not c!77960)) b!687862))

(assert (= (and b!687861 c!77961) b!687858))

(assert (= (and b!687861 (not c!77961)) b!687859))

(assert (= (or b!687858 b!687859) bm!34164))

(assert (= (and d!95113 res!452672) b!687860))

(declare-fun m!651849 () Bool)

(assert (=> d!95113 m!651849))

(declare-fun m!651851 () Bool)

(assert (=> d!95113 m!651851))

(declare-fun m!651853 () Bool)

(assert (=> b!687860 m!651853))

(assert (=> b!687860 m!651795))

(declare-fun m!651855 () Bool)

(assert (=> b!687860 m!651855))

(declare-fun m!651857 () Bool)

(assert (=> bm!34164 m!651857))

(assert (=> b!687623 d!95113))

(declare-fun b!687893 () Bool)

(declare-fun e!391826 () Bool)

(declare-fun e!391823 () Bool)

(assert (=> b!687893 (= e!391826 e!391823)))

(declare-fun res!452692 () Bool)

(assert (=> b!687893 (=> (not res!452692) (not e!391823))))

(assert (=> b!687893 (= res!452692 ((_ is Cons!13052) acc!681))))

(declare-fun b!687895 () Bool)

(declare-fun e!391824 () Bool)

(assert (=> b!687895 (= e!391824 (subseq!219 (t!19317 acc!681) (t!19317 acc!681)))))

(declare-fun b!687894 () Bool)

(declare-fun e!391825 () Bool)

(assert (=> b!687894 (= e!391823 e!391825)))

(declare-fun res!452693 () Bool)

(assert (=> b!687894 (=> res!452693 e!391825)))

(assert (=> b!687894 (= res!452693 e!391824)))

(declare-fun res!452694 () Bool)

(assert (=> b!687894 (=> (not res!452694) (not e!391824))))

(assert (=> b!687894 (= res!452694 (= (h!14097 acc!681) (h!14097 acc!681)))))

(declare-fun b!687896 () Bool)

(assert (=> b!687896 (= e!391825 (subseq!219 acc!681 (t!19317 acc!681)))))

(declare-fun d!95129 () Bool)

(declare-fun res!452691 () Bool)

(assert (=> d!95129 (=> res!452691 e!391826)))

(assert (=> d!95129 (= res!452691 ((_ is Nil!13053) acc!681))))

(assert (=> d!95129 (= (subseq!219 acc!681 acc!681) e!391826)))

(assert (= (and d!95129 (not res!452691)) b!687893))

(assert (= (and b!687893 res!452692) b!687894))

(assert (= (and b!687894 res!452694) b!687895))

(assert (= (and b!687894 (not res!452693)) b!687896))

(declare-fun m!651863 () Bool)

(assert (=> b!687895 m!651863))

(declare-fun m!651865 () Bool)

(assert (=> b!687896 m!651865))

(assert (=> b!687623 d!95129))

(declare-fun d!95133 () Bool)

(declare-fun res!452696 () Bool)

(declare-fun e!391830 () Bool)

(assert (=> d!95133 (=> res!452696 e!391830)))

(assert (=> d!95133 (= res!452696 (= (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!95133 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391830)))

(declare-fun b!687902 () Bool)

(declare-fun e!391831 () Bool)

(assert (=> b!687902 (= e!391830 e!391831)))

(declare-fun res!452697 () Bool)

(assert (=> b!687902 (=> (not res!452697) (not e!391831))))

(assert (=> b!687902 (= res!452697 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19394 a!3626)))))

(declare-fun b!687903 () Bool)

(assert (=> b!687903 (= e!391831 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95133 (not res!452696)) b!687902))

(assert (= (and b!687902 res!452697) b!687903))

(declare-fun m!651877 () Bool)

(assert (=> d!95133 m!651877))

(declare-fun m!651879 () Bool)

(assert (=> b!687903 m!651879))

(assert (=> b!687623 d!95133))

(declare-fun d!95137 () Bool)

(assert (=> d!95137 (= (-!184 ($colon$colon!384 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315556 () Unit!24242)

(declare-fun choose!16 ((_ BitVec 64) List!13056) Unit!24242)

(assert (=> d!95137 (= lt!315556 (choose!16 k0!2843 acc!681))))

(assert (=> d!95137 (not (contains!3633 acc!681 k0!2843))))

(assert (=> d!95137 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315556)))

(declare-fun bs!20174 () Bool)

(assert (= bs!20174 d!95137))

(assert (=> bs!20174 m!651661))

(assert (=> bs!20174 m!651661))

(declare-fun m!651899 () Bool)

(assert (=> bs!20174 m!651899))

(declare-fun m!651905 () Bool)

(assert (=> bs!20174 m!651905))

(assert (=> bs!20174 m!651633))

(assert (=> b!687623 d!95137))

(declare-fun d!95145 () Bool)

(declare-fun res!452710 () Bool)

(declare-fun e!391849 () Bool)

(assert (=> d!95145 (=> res!452710 e!391849)))

(assert (=> d!95145 (= res!452710 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19394 a!3626)))))

(assert (=> d!95145 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315484) e!391849)))

(declare-fun b!687924 () Bool)

(declare-fun e!391848 () Bool)

(declare-fun call!34177 () Bool)

(assert (=> b!687924 (= e!391848 call!34177)))

(declare-fun b!687925 () Bool)

(declare-fun e!391850 () Bool)

(assert (=> b!687925 (= e!391850 (contains!3633 lt!315484 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687926 () Bool)

(declare-fun e!391851 () Bool)

(assert (=> b!687926 (= e!391851 e!391848)))

(declare-fun c!77974 () Bool)

(assert (=> b!687926 (= c!77974 (validKeyInArray!0 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34174 () Bool)

(assert (=> bm!34174 (= call!34177 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77974 (Cons!13052 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315484) lt!315484)))))

(declare-fun b!687927 () Bool)

(assert (=> b!687927 (= e!391848 call!34177)))

(declare-fun b!687928 () Bool)

(assert (=> b!687928 (= e!391849 e!391851)))

(declare-fun res!452711 () Bool)

(assert (=> b!687928 (=> (not res!452711) (not e!391851))))

(assert (=> b!687928 (= res!452711 (not e!391850))))

(declare-fun res!452712 () Bool)

(assert (=> b!687928 (=> (not res!452712) (not e!391850))))

(assert (=> b!687928 (= res!452712 (validKeyInArray!0 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95145 (not res!452710)) b!687928))

(assert (= (and b!687928 res!452712) b!687925))

(assert (= (and b!687928 res!452711) b!687926))

(assert (= (and b!687926 c!77974) b!687927))

(assert (= (and b!687926 (not c!77974)) b!687924))

(assert (= (or b!687927 b!687924) bm!34174))

(assert (=> b!687925 m!651877))

(assert (=> b!687925 m!651877))

(declare-fun m!651913 () Bool)

(assert (=> b!687925 m!651913))

(assert (=> b!687926 m!651877))

(assert (=> b!687926 m!651877))

(declare-fun m!651915 () Bool)

(assert (=> b!687926 m!651915))

(assert (=> bm!34174 m!651877))

(declare-fun m!651921 () Bool)

(assert (=> bm!34174 m!651921))

(assert (=> b!687928 m!651877))

(assert (=> b!687928 m!651877))

(assert (=> b!687928 m!651915))

(assert (=> b!687623 d!95145))

(declare-fun d!95159 () Bool)

(declare-fun res!452721 () Bool)

(declare-fun e!391860 () Bool)

(assert (=> d!95159 (=> res!452721 e!391860)))

(assert (=> d!95159 (= res!452721 (= (select (arr!19015 (array!39685 (store (arr!19015 a!3626) i!1382 k0!2843) (size!19394 a!3626))) from!3004) k0!2843))))

(assert (=> d!95159 (= (arrayContainsKey!0 (array!39685 (store (arr!19015 a!3626) i!1382 k0!2843) (size!19394 a!3626)) k0!2843 from!3004) e!391860)))

(declare-fun b!687937 () Bool)

(declare-fun e!391861 () Bool)

(assert (=> b!687937 (= e!391860 e!391861)))

(declare-fun res!452722 () Bool)

(assert (=> b!687937 (=> (not res!452722) (not e!391861))))

(assert (=> b!687937 (= res!452722 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19394 (array!39685 (store (arr!19015 a!3626) i!1382 k0!2843) (size!19394 a!3626)))))))

(declare-fun b!687938 () Bool)

(assert (=> b!687938 (= e!391861 (arrayContainsKey!0 (array!39685 (store (arr!19015 a!3626) i!1382 k0!2843) (size!19394 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95159 (not res!452721)) b!687937))

(assert (= (and b!687937 res!452722) b!687938))

(declare-fun m!651927 () Bool)

(assert (=> d!95159 m!651927))

(declare-fun m!651929 () Bool)

(assert (=> b!687938 m!651929))

(assert (=> b!687623 d!95159))

(declare-fun d!95163 () Bool)

(assert (=> d!95163 (subseq!219 acc!681 acc!681)))

(declare-fun lt!315565 () Unit!24242)

(declare-fun choose!36 (List!13056) Unit!24242)

(assert (=> d!95163 (= lt!315565 (choose!36 acc!681))))

(assert (=> d!95163 (= (lemmaListSubSeqRefl!0 acc!681) lt!315565)))

(declare-fun bs!20176 () Bool)

(assert (= bs!20176 d!95163))

(assert (=> bs!20176 m!651671))

(declare-fun m!651941 () Bool)

(assert (=> bs!20176 m!651941))

(assert (=> b!687623 d!95163))

(declare-fun d!95173 () Bool)

(assert (=> d!95173 (= (validKeyInArray!0 (select (arr!19015 a!3626) from!3004)) (and (not (= (select (arr!19015 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19015 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687623 d!95173))

(declare-fun d!95177 () Bool)

(assert (=> d!95177 (= ($colon$colon!384 acc!681 k0!2843) (Cons!13052 k0!2843 acc!681))))

(assert (=> b!687623 d!95177))

(declare-fun d!95181 () Bool)

(declare-fun res!452733 () Bool)

(declare-fun e!391875 () Bool)

(assert (=> d!95181 (=> res!452733 e!391875)))

(assert (=> d!95181 (= res!452733 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19394 a!3626)))))

(assert (=> d!95181 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391875)))

(declare-fun b!687953 () Bool)

(declare-fun e!391874 () Bool)

(declare-fun call!34180 () Bool)

(assert (=> b!687953 (= e!391874 call!34180)))

(declare-fun e!391876 () Bool)

(declare-fun b!687954 () Bool)

(assert (=> b!687954 (= e!391876 (contains!3633 acc!681 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687955 () Bool)

(declare-fun e!391877 () Bool)

(assert (=> b!687955 (= e!391877 e!391874)))

(declare-fun c!77977 () Bool)

(assert (=> b!687955 (= c!77977 (validKeyInArray!0 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34177 () Bool)

(assert (=> bm!34177 (= call!34180 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77977 (Cons!13052 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687956 () Bool)

(assert (=> b!687956 (= e!391874 call!34180)))

(declare-fun b!687957 () Bool)

(assert (=> b!687957 (= e!391875 e!391877)))

(declare-fun res!452734 () Bool)

(assert (=> b!687957 (=> (not res!452734) (not e!391877))))

(assert (=> b!687957 (= res!452734 (not e!391876))))

(declare-fun res!452735 () Bool)

(assert (=> b!687957 (=> (not res!452735) (not e!391876))))

(assert (=> b!687957 (= res!452735 (validKeyInArray!0 (select (arr!19015 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95181 (not res!452733)) b!687957))

(assert (= (and b!687957 res!452735) b!687954))

(assert (= (and b!687957 res!452734) b!687955))

(assert (= (and b!687955 c!77977) b!687956))

(assert (= (and b!687955 (not c!77977)) b!687953))

(assert (= (or b!687956 b!687953) bm!34177))

(assert (=> b!687954 m!651877))

(assert (=> b!687954 m!651877))

(declare-fun m!651949 () Bool)

(assert (=> b!687954 m!651949))

(assert (=> b!687955 m!651877))

(assert (=> b!687955 m!651877))

(assert (=> b!687955 m!651915))

(assert (=> bm!34177 m!651877))

(declare-fun m!651955 () Bool)

(assert (=> bm!34177 m!651955))

(assert (=> b!687957 m!651877))

(assert (=> b!687957 m!651877))

(assert (=> b!687957 m!651915))

(assert (=> b!687623 d!95181))

(declare-fun d!95189 () Bool)

(declare-fun lt!315569 () Bool)

(assert (=> d!95189 (= lt!315569 (select (content!302 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391882 () Bool)

(assert (=> d!95189 (= lt!315569 e!391882)))

(declare-fun res!452740 () Bool)

(assert (=> d!95189 (=> (not res!452740) (not e!391882))))

(assert (=> d!95189 (= res!452740 ((_ is Cons!13052) acc!681))))

(assert (=> d!95189 (= (contains!3633 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315569)))

(declare-fun b!687963 () Bool)

(declare-fun e!391883 () Bool)

(assert (=> b!687963 (= e!391882 e!391883)))

(declare-fun res!452739 () Bool)

(assert (=> b!687963 (=> res!452739 e!391883)))

(assert (=> b!687963 (= res!452739 (= (h!14097 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687964 () Bool)

(assert (=> b!687964 (= e!391883 (contains!3633 (t!19317 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95189 res!452740) b!687963))

(assert (= (and b!687963 (not res!452739)) b!687964))

(assert (=> d!95189 m!651779))

(declare-fun m!651957 () Bool)

(assert (=> d!95189 m!651957))

(declare-fun m!651959 () Bool)

(assert (=> b!687964 m!651959))

(assert (=> b!687644 d!95189))

(declare-fun d!95191 () Bool)

(assert (=> d!95191 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687634 d!95191))

(declare-fun d!95193 () Bool)

(assert (=> d!95193 (= ($colon$colon!384 acc!681 (select (arr!19015 a!3626) from!3004)) (Cons!13052 (select (arr!19015 a!3626) from!3004) acc!681))))

(assert (=> b!687643 d!95193))

(assert (=> b!687643 d!95129))

(declare-fun d!95195 () Bool)

(assert (=> d!95195 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315578 () Unit!24242)

(declare-fun choose!80 (array!39684 List!13056 List!13056 (_ BitVec 32)) Unit!24242)

(assert (=> d!95195 (= lt!315578 (choose!80 a!3626 ($colon$colon!384 acc!681 (select (arr!19015 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95195 (bvslt (size!19394 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95195 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!384 acc!681 (select (arr!19015 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315578)))

(declare-fun bs!20179 () Bool)

(assert (= bs!20179 d!95195))

(assert (=> bs!20179 m!651647))

(assert (=> bs!20179 m!651673))

(declare-fun m!651987 () Bool)

(assert (=> bs!20179 m!651987))

(assert (=> b!687643 d!95195))

(assert (=> b!687643 d!95163))

(assert (=> b!687643 d!95181))

(assert (=> b!687632 d!95087))

(declare-fun d!95213 () Bool)

(declare-fun res!452749 () Bool)

(declare-fun e!391892 () Bool)

(assert (=> d!95213 (=> res!452749 e!391892)))

(assert (=> d!95213 (= res!452749 ((_ is Nil!13053) lt!315484))))

(assert (=> d!95213 (= (noDuplicate!880 lt!315484) e!391892)))

(declare-fun b!687973 () Bool)

(declare-fun e!391893 () Bool)

(assert (=> b!687973 (= e!391892 e!391893)))

(declare-fun res!452750 () Bool)

(assert (=> b!687973 (=> (not res!452750) (not e!391893))))

(assert (=> b!687973 (= res!452750 (not (contains!3633 (t!19317 lt!315484) (h!14097 lt!315484))))))

(declare-fun b!687974 () Bool)

(assert (=> b!687974 (= e!391893 (noDuplicate!880 (t!19317 lt!315484)))))

(assert (= (and d!95213 (not res!452749)) b!687973))

(assert (= (and b!687973 res!452750) b!687974))

(declare-fun m!651989 () Bool)

(assert (=> b!687973 m!651989))

(declare-fun m!651991 () Bool)

(assert (=> b!687974 m!651991))

(assert (=> b!687633 d!95213))

(declare-fun d!95215 () Bool)

(declare-fun lt!315579 () Bool)

(assert (=> d!95215 (= lt!315579 (select (content!302 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391894 () Bool)

(assert (=> d!95215 (= lt!315579 e!391894)))

(declare-fun res!452752 () Bool)

(assert (=> d!95215 (=> (not res!452752) (not e!391894))))

(assert (=> d!95215 (= res!452752 ((_ is Cons!13052) acc!681))))

(assert (=> d!95215 (= (contains!3633 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315579)))

(declare-fun b!687975 () Bool)

(declare-fun e!391895 () Bool)

(assert (=> b!687975 (= e!391894 e!391895)))

(declare-fun res!452751 () Bool)

(assert (=> b!687975 (=> res!452751 e!391895)))

(assert (=> b!687975 (= res!452751 (= (h!14097 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687976 () Bool)

(assert (=> b!687976 (= e!391895 (contains!3633 (t!19317 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95215 res!452752) b!687975))

(assert (= (and b!687975 (not res!452751)) b!687976))

(assert (=> d!95215 m!651779))

(declare-fun m!651993 () Bool)

(assert (=> d!95215 m!651993))

(declare-fun m!651995 () Bool)

(assert (=> b!687976 m!651995))

(assert (=> b!687636 d!95215))

(declare-fun d!95217 () Bool)

(declare-fun lt!315580 () Bool)

(assert (=> d!95217 (= lt!315580 (select (content!302 lt!315484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391896 () Bool)

(assert (=> d!95217 (= lt!315580 e!391896)))

(declare-fun res!452754 () Bool)

(assert (=> d!95217 (=> (not res!452754) (not e!391896))))

(assert (=> d!95217 (= res!452754 ((_ is Cons!13052) lt!315484))))

(assert (=> d!95217 (= (contains!3633 lt!315484 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315580)))

(declare-fun b!687977 () Bool)

(declare-fun e!391897 () Bool)

(assert (=> b!687977 (= e!391896 e!391897)))

(declare-fun res!452753 () Bool)

(assert (=> b!687977 (=> res!452753 e!391897)))

(assert (=> b!687977 (= res!452753 (= (h!14097 lt!315484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687978 () Bool)

(assert (=> b!687978 (= e!391897 (contains!3633 (t!19317 lt!315484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95217 res!452754) b!687977))

(assert (= (and b!687977 (not res!452753)) b!687978))

(assert (=> d!95217 m!651795))

(declare-fun m!651997 () Bool)

(assert (=> d!95217 m!651997))

(declare-fun m!651999 () Bool)

(assert (=> b!687978 m!651999))

(assert (=> b!687637 d!95217))

(declare-fun d!95219 () Bool)

(assert (=> d!95219 (= (array_inv!14811 a!3626) (bvsge (size!19394 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61462 d!95219))

(check-sat (not b!687725) (not d!95189) (not b!687978) (not b!687758) (not b!687785) (not d!95215) (not b!687964) (not b!687955) (not b!687973) (not bm!34177) (not b!687755) (not b!687976) (not b!687974) (not b!687756) (not d!95163) (not b!687860) (not b!687926) (not b!687724) (not d!95097) (not d!95113) (not bm!34154) (not b!687928) (not bm!34158) (not b!687776) (not d!95105) (not b!687925) (not d!95195) (not b!687903) (not b!687816) (not bm!34164) (not bm!34174) (not b!687783) (not b!687786) (not d!95109) (not d!95137) (not d!95087) (not b!687938) (not b!687823) (not b!687895) (not d!95093) (not d!95217) (not b!687788) (not b!687954) (not b!687896) (not b!687957))
(check-sat)
