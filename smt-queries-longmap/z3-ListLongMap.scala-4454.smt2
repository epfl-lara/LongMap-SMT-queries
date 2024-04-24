; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62028 () Bool)

(assert start!62028)

(declare-fun b!693576 () Bool)

(declare-fun e!394634 () Bool)

(declare-datatypes ((List!13035 0))(
  ( (Nil!13032) (Cons!13031 (h!14079 (_ BitVec 64)) (t!19303 List!13035)) )
))
(declare-fun lt!316843 () List!13035)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3687 (List!13035 (_ BitVec 64)) Bool)

(assert (=> b!693576 (= e!394634 (not (contains!3687 lt!316843 k0!2843)))))

(declare-fun e!394638 () Bool)

(declare-datatypes ((array!39852 0))(
  ( (array!39853 (arr!19087 (Array (_ BitVec 32) (_ BitVec 64))) (size!19470 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39852)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun b!693577 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39852 (_ BitVec 32) List!13035) Bool)

(assert (=> b!693577 (= e!394638 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316843)))))

(declare-fun b!693578 () Bool)

(declare-fun e!394633 () Bool)

(declare-fun acc!681 () List!13035)

(assert (=> b!693578 (= e!394633 (contains!3687 acc!681 k0!2843))))

(declare-fun b!693579 () Bool)

(declare-fun e!394635 () Bool)

(assert (=> b!693579 (= e!394635 e!394634)))

(declare-fun res!457615 () Bool)

(assert (=> b!693579 (=> (not res!457615) (not e!394634))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693579 (= res!457615 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693580 () Bool)

(declare-fun res!457608 () Bool)

(declare-fun e!394632 () Bool)

(assert (=> b!693580 (=> (not res!457608) (not e!394632))))

(declare-fun noDuplicate!961 (List!13035) Bool)

(assert (=> b!693580 (= res!457608 (noDuplicate!961 acc!681))))

(declare-fun b!693581 () Bool)

(declare-fun e!394641 () Bool)

(assert (=> b!693581 (= e!394641 (not (contains!3687 acc!681 k0!2843)))))

(declare-fun b!693582 () Bool)

(declare-fun res!457630 () Bool)

(assert (=> b!693582 (=> (not res!457630) (not e!394638))))

(assert (=> b!693582 (= res!457630 e!394635)))

(declare-fun res!457618 () Bool)

(assert (=> b!693582 (=> res!457618 e!394635)))

(declare-fun e!394636 () Bool)

(assert (=> b!693582 (= res!457618 e!394636)))

(declare-fun res!457612 () Bool)

(assert (=> b!693582 (=> (not res!457612) (not e!394636))))

(assert (=> b!693582 (= res!457612 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693583 () Bool)

(declare-datatypes ((Unit!24465 0))(
  ( (Unit!24466) )
))
(declare-fun e!394639 () Unit!24465)

(declare-fun Unit!24467 () Unit!24465)

(assert (=> b!693583 (= e!394639 Unit!24467)))

(declare-fun b!693584 () Bool)

(declare-fun res!457616 () Bool)

(assert (=> b!693584 (=> (not res!457616) (not e!394632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693584 (= res!457616 (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)))))

(declare-fun b!693585 () Bool)

(declare-fun res!457628 () Bool)

(assert (=> b!693585 (=> (not res!457628) (not e!394638))))

(assert (=> b!693585 (= res!457628 (not (contains!3687 lt!316843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693586 () Bool)

(declare-fun res!457624 () Bool)

(assert (=> b!693586 (=> (not res!457624) (not e!394632))))

(declare-fun arrayContainsKey!0 (array!39852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693586 (= res!457624 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693587 () Bool)

(assert (=> b!693587 (= e!394636 (contains!3687 lt!316843 k0!2843))))

(declare-fun b!693588 () Bool)

(declare-fun res!457619 () Bool)

(assert (=> b!693588 (=> (not res!457619) (not e!394632))))

(assert (=> b!693588 (= res!457619 (validKeyInArray!0 k0!2843))))

(declare-fun b!693589 () Bool)

(declare-fun res!457617 () Bool)

(assert (=> b!693589 (=> (not res!457617) (not e!394632))))

(assert (=> b!693589 (= res!457617 (not (contains!3687 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693590 () Bool)

(declare-fun res!457625 () Bool)

(assert (=> b!693590 (=> (not res!457625) (not e!394632))))

(assert (=> b!693590 (= res!457625 (not (contains!3687 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693591 () Bool)

(declare-fun res!457621 () Bool)

(assert (=> b!693591 (=> (not res!457621) (not e!394632))))

(assert (=> b!693591 (= res!457621 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!457607 () Bool)

(assert (=> start!62028 (=> (not res!457607) (not e!394632))))

(assert (=> start!62028 (= res!457607 (and (bvslt (size!19470 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19470 a!3626))))))

(assert (=> start!62028 e!394632))

(assert (=> start!62028 true))

(declare-fun array_inv!14946 (array!39852) Bool)

(assert (=> start!62028 (array_inv!14946 a!3626)))

(declare-fun b!693592 () Bool)

(declare-fun e!394637 () Bool)

(assert (=> b!693592 (= e!394632 e!394637)))

(declare-fun res!457629 () Bool)

(assert (=> b!693592 (=> (not res!457629) (not e!394637))))

(assert (=> b!693592 (= res!457629 (not (= (select (arr!19087 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316842 () Unit!24465)

(assert (=> b!693592 (= lt!316842 e!394639)))

(declare-fun c!78353 () Bool)

(assert (=> b!693592 (= c!78353 (= (select (arr!19087 a!3626) from!3004) k0!2843))))

(declare-fun b!693593 () Bool)

(declare-fun e!394631 () Bool)

(assert (=> b!693593 (= e!394631 e!394641)))

(declare-fun res!457609 () Bool)

(assert (=> b!693593 (=> (not res!457609) (not e!394641))))

(assert (=> b!693593 (= res!457609 (bvsle from!3004 i!1382))))

(declare-fun b!693594 () Bool)

(declare-fun res!457627 () Bool)

(assert (=> b!693594 (=> (not res!457627) (not e!394638))))

(assert (=> b!693594 (= res!457627 (not (contains!3687 lt!316843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693595 () Bool)

(declare-fun res!457622 () Bool)

(assert (=> b!693595 (=> (not res!457622) (not e!394632))))

(assert (=> b!693595 (= res!457622 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19470 a!3626))))))

(declare-fun b!693596 () Bool)

(declare-fun res!457623 () Bool)

(assert (=> b!693596 (=> (not res!457623) (not e!394638))))

(assert (=> b!693596 (= res!457623 (noDuplicate!961 lt!316843))))

(declare-fun b!693597 () Bool)

(assert (=> b!693597 (= e!394637 e!394638)))

(declare-fun res!457610 () Bool)

(assert (=> b!693597 (=> (not res!457610) (not e!394638))))

(assert (=> b!693597 (= res!457610 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!419 (List!13035 (_ BitVec 64)) List!13035)

(assert (=> b!693597 (= lt!316843 ($colon$colon!419 acc!681 (select (arr!19087 a!3626) from!3004)))))

(declare-fun b!693598 () Bool)

(declare-fun res!457614 () Bool)

(assert (=> b!693598 (=> (not res!457614) (not e!394632))))

(assert (=> b!693598 (= res!457614 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19470 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693599 () Bool)

(declare-fun Unit!24468 () Unit!24465)

(assert (=> b!693599 (= e!394639 Unit!24468)))

(assert (=> b!693599 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316841 () Unit!24465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39852 (_ BitVec 64) (_ BitVec 32)) Unit!24465)

(assert (=> b!693599 (= lt!316841 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693599 false))

(declare-fun b!693600 () Bool)

(declare-fun res!457611 () Bool)

(assert (=> b!693600 (=> (not res!457611) (not e!394632))))

(assert (=> b!693600 (= res!457611 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13032))))

(declare-fun b!693601 () Bool)

(declare-fun res!457626 () Bool)

(assert (=> b!693601 (=> (not res!457626) (not e!394632))))

(assert (=> b!693601 (= res!457626 e!394631)))

(declare-fun res!457613 () Bool)

(assert (=> b!693601 (=> res!457613 e!394631)))

(assert (=> b!693601 (= res!457613 e!394633)))

(declare-fun res!457620 () Bool)

(assert (=> b!693601 (=> (not res!457620) (not e!394633))))

(assert (=> b!693601 (= res!457620 (bvsgt from!3004 i!1382))))

(assert (= (and start!62028 res!457607) b!693580))

(assert (= (and b!693580 res!457608) b!693590))

(assert (= (and b!693590 res!457625) b!693589))

(assert (= (and b!693589 res!457617) b!693601))

(assert (= (and b!693601 res!457620) b!693578))

(assert (= (and b!693601 (not res!457613)) b!693593))

(assert (= (and b!693593 res!457609) b!693581))

(assert (= (and b!693601 res!457626) b!693600))

(assert (= (and b!693600 res!457611) b!693591))

(assert (= (and b!693591 res!457621) b!693595))

(assert (= (and b!693595 res!457622) b!693588))

(assert (= (and b!693588 res!457619) b!693586))

(assert (= (and b!693586 res!457624) b!693598))

(assert (= (and b!693598 res!457614) b!693584))

(assert (= (and b!693584 res!457616) b!693592))

(assert (= (and b!693592 c!78353) b!693599))

(assert (= (and b!693592 (not c!78353)) b!693583))

(assert (= (and b!693592 res!457629) b!693597))

(assert (= (and b!693597 res!457610) b!693596))

(assert (= (and b!693596 res!457623) b!693594))

(assert (= (and b!693594 res!457627) b!693585))

(assert (= (and b!693585 res!457628) b!693582))

(assert (= (and b!693582 res!457612) b!693587))

(assert (= (and b!693582 (not res!457618)) b!693579))

(assert (= (and b!693579 res!457615) b!693576))

(assert (= (and b!693582 res!457630) b!693577))

(declare-fun m!656335 () Bool)

(assert (=> start!62028 m!656335))

(declare-fun m!656337 () Bool)

(assert (=> b!693585 m!656337))

(declare-fun m!656339 () Bool)

(assert (=> b!693591 m!656339))

(declare-fun m!656341 () Bool)

(assert (=> b!693590 m!656341))

(declare-fun m!656343 () Bool)

(assert (=> b!693576 m!656343))

(declare-fun m!656345 () Bool)

(assert (=> b!693592 m!656345))

(declare-fun m!656347 () Bool)

(assert (=> b!693578 m!656347))

(declare-fun m!656349 () Bool)

(assert (=> b!693599 m!656349))

(declare-fun m!656351 () Bool)

(assert (=> b!693599 m!656351))

(assert (=> b!693584 m!656345))

(assert (=> b!693584 m!656345))

(declare-fun m!656353 () Bool)

(assert (=> b!693584 m!656353))

(declare-fun m!656355 () Bool)

(assert (=> b!693588 m!656355))

(declare-fun m!656357 () Bool)

(assert (=> b!693596 m!656357))

(assert (=> b!693587 m!656343))

(declare-fun m!656359 () Bool)

(assert (=> b!693589 m!656359))

(declare-fun m!656361 () Bool)

(assert (=> b!693577 m!656361))

(assert (=> b!693597 m!656345))

(assert (=> b!693597 m!656345))

(declare-fun m!656363 () Bool)

(assert (=> b!693597 m!656363))

(declare-fun m!656365 () Bool)

(assert (=> b!693580 m!656365))

(declare-fun m!656367 () Bool)

(assert (=> b!693600 m!656367))

(declare-fun m!656369 () Bool)

(assert (=> b!693594 m!656369))

(assert (=> b!693581 m!656347))

(declare-fun m!656371 () Bool)

(assert (=> b!693586 m!656371))

(check-sat (not start!62028) (not b!693584) (not b!693588) (not b!693576) (not b!693597) (not b!693589) (not b!693591) (not b!693594) (not b!693580) (not b!693596) (not b!693590) (not b!693585) (not b!693581) (not b!693578) (not b!693599) (not b!693586) (not b!693600) (not b!693577) (not b!693587))
(check-sat)
(get-model)

(declare-fun d!95935 () Bool)

(declare-fun res!457779 () Bool)

(declare-fun e!394712 () Bool)

(assert (=> d!95935 (=> res!457779 e!394712)))

(get-info :version)

(assert (=> d!95935 (= res!457779 ((_ is Nil!13032) acc!681))))

(assert (=> d!95935 (= (noDuplicate!961 acc!681) e!394712)))

(declare-fun b!693762 () Bool)

(declare-fun e!394713 () Bool)

(assert (=> b!693762 (= e!394712 e!394713)))

(declare-fun res!457780 () Bool)

(assert (=> b!693762 (=> (not res!457780) (not e!394713))))

(assert (=> b!693762 (= res!457780 (not (contains!3687 (t!19303 acc!681) (h!14079 acc!681))))))

(declare-fun b!693763 () Bool)

(assert (=> b!693763 (= e!394713 (noDuplicate!961 (t!19303 acc!681)))))

(assert (= (and d!95935 (not res!457779)) b!693762))

(assert (= (and b!693762 res!457780) b!693763))

(declare-fun m!656449 () Bool)

(assert (=> b!693762 m!656449))

(declare-fun m!656451 () Bool)

(assert (=> b!693763 m!656451))

(assert (=> b!693580 d!95935))

(declare-fun d!95937 () Bool)

(declare-fun res!457788 () Bool)

(declare-fun e!394725 () Bool)

(assert (=> d!95937 (=> res!457788 e!394725)))

(assert (=> d!95937 (= res!457788 (bvsge from!3004 (size!19470 a!3626)))))

(assert (=> d!95937 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394725)))

(declare-fun b!693774 () Bool)

(declare-fun e!394724 () Bool)

(declare-fun call!34272 () Bool)

(assert (=> b!693774 (= e!394724 call!34272)))

(declare-fun bm!34269 () Bool)

(declare-fun c!78362 () Bool)

(assert (=> bm!34269 (= call!34272 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78362 (Cons!13031 (select (arr!19087 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!693775 () Bool)

(declare-fun e!394722 () Bool)

(assert (=> b!693775 (= e!394722 e!394724)))

(assert (=> b!693775 (= c!78362 (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)))))

(declare-fun e!394723 () Bool)

(declare-fun b!693776 () Bool)

(assert (=> b!693776 (= e!394723 (contains!3687 acc!681 (select (arr!19087 a!3626) from!3004)))))

(declare-fun b!693777 () Bool)

(assert (=> b!693777 (= e!394724 call!34272)))

(declare-fun b!693778 () Bool)

(assert (=> b!693778 (= e!394725 e!394722)))

(declare-fun res!457787 () Bool)

(assert (=> b!693778 (=> (not res!457787) (not e!394722))))

(assert (=> b!693778 (= res!457787 (not e!394723))))

(declare-fun res!457789 () Bool)

(assert (=> b!693778 (=> (not res!457789) (not e!394723))))

(assert (=> b!693778 (= res!457789 (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)))))

(assert (= (and d!95937 (not res!457788)) b!693778))

(assert (= (and b!693778 res!457789) b!693776))

(assert (= (and b!693778 res!457787) b!693775))

(assert (= (and b!693775 c!78362) b!693774))

(assert (= (and b!693775 (not c!78362)) b!693777))

(assert (= (or b!693774 b!693777) bm!34269))

(assert (=> bm!34269 m!656345))

(declare-fun m!656453 () Bool)

(assert (=> bm!34269 m!656453))

(assert (=> b!693775 m!656345))

(assert (=> b!693775 m!656345))

(assert (=> b!693775 m!656353))

(assert (=> b!693776 m!656345))

(assert (=> b!693776 m!656345))

(declare-fun m!656455 () Bool)

(assert (=> b!693776 m!656455))

(assert (=> b!693778 m!656345))

(assert (=> b!693778 m!656345))

(assert (=> b!693778 m!656353))

(assert (=> b!693591 d!95937))

(declare-fun d!95939 () Bool)

(declare-fun res!457791 () Bool)

(declare-fun e!394729 () Bool)

(assert (=> d!95939 (=> res!457791 e!394729)))

(assert (=> d!95939 (= res!457791 (bvsge #b00000000000000000000000000000000 (size!19470 a!3626)))))

(assert (=> d!95939 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13032) e!394729)))

(declare-fun b!693779 () Bool)

(declare-fun e!394728 () Bool)

(declare-fun call!34273 () Bool)

(assert (=> b!693779 (= e!394728 call!34273)))

(declare-fun bm!34270 () Bool)

(declare-fun c!78363 () Bool)

(assert (=> bm!34270 (= call!34273 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78363 (Cons!13031 (select (arr!19087 a!3626) #b00000000000000000000000000000000) Nil!13032) Nil!13032)))))

(declare-fun b!693780 () Bool)

(declare-fun e!394726 () Bool)

(assert (=> b!693780 (= e!394726 e!394728)))

(assert (=> b!693780 (= c!78363 (validKeyInArray!0 (select (arr!19087 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!693781 () Bool)

(declare-fun e!394727 () Bool)

(assert (=> b!693781 (= e!394727 (contains!3687 Nil!13032 (select (arr!19087 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!693782 () Bool)

(assert (=> b!693782 (= e!394728 call!34273)))

(declare-fun b!693783 () Bool)

(assert (=> b!693783 (= e!394729 e!394726)))

(declare-fun res!457790 () Bool)

(assert (=> b!693783 (=> (not res!457790) (not e!394726))))

(assert (=> b!693783 (= res!457790 (not e!394727))))

(declare-fun res!457792 () Bool)

(assert (=> b!693783 (=> (not res!457792) (not e!394727))))

(assert (=> b!693783 (= res!457792 (validKeyInArray!0 (select (arr!19087 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95939 (not res!457791)) b!693783))

(assert (= (and b!693783 res!457792) b!693781))

(assert (= (and b!693783 res!457790) b!693780))

(assert (= (and b!693780 c!78363) b!693779))

(assert (= (and b!693780 (not c!78363)) b!693782))

(assert (= (or b!693779 b!693782) bm!34270))

(declare-fun m!656457 () Bool)

(assert (=> bm!34270 m!656457))

(declare-fun m!656459 () Bool)

(assert (=> bm!34270 m!656459))

(assert (=> b!693780 m!656457))

(assert (=> b!693780 m!656457))

(declare-fun m!656461 () Bool)

(assert (=> b!693780 m!656461))

(assert (=> b!693781 m!656457))

(assert (=> b!693781 m!656457))

(declare-fun m!656463 () Bool)

(assert (=> b!693781 m!656463))

(assert (=> b!693783 m!656457))

(assert (=> b!693783 m!656457))

(assert (=> b!693783 m!656461))

(assert (=> b!693600 d!95939))

(declare-fun d!95941 () Bool)

(declare-fun lt!316864 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!318 (List!13035) (InoxSet (_ BitVec 64)))

(assert (=> d!95941 (= lt!316864 (select (content!318 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394734 () Bool)

(assert (=> d!95941 (= lt!316864 e!394734)))

(declare-fun res!457797 () Bool)

(assert (=> d!95941 (=> (not res!457797) (not e!394734))))

(assert (=> d!95941 (= res!457797 ((_ is Cons!13031) acc!681))))

(assert (=> d!95941 (= (contains!3687 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316864)))

(declare-fun b!693788 () Bool)

(declare-fun e!394735 () Bool)

(assert (=> b!693788 (= e!394734 e!394735)))

(declare-fun res!457798 () Bool)

(assert (=> b!693788 (=> res!457798 e!394735)))

(assert (=> b!693788 (= res!457798 (= (h!14079 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693789 () Bool)

(assert (=> b!693789 (= e!394735 (contains!3687 (t!19303 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95941 res!457797) b!693788))

(assert (= (and b!693788 (not res!457798)) b!693789))

(declare-fun m!656465 () Bool)

(assert (=> d!95941 m!656465))

(declare-fun m!656467 () Bool)

(assert (=> d!95941 m!656467))

(declare-fun m!656469 () Bool)

(assert (=> b!693789 m!656469))

(assert (=> b!693589 d!95941))

(declare-fun d!95943 () Bool)

(declare-fun lt!316865 () Bool)

(assert (=> d!95943 (= lt!316865 (select (content!318 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394736 () Bool)

(assert (=> d!95943 (= lt!316865 e!394736)))

(declare-fun res!457799 () Bool)

(assert (=> d!95943 (=> (not res!457799) (not e!394736))))

(assert (=> d!95943 (= res!457799 ((_ is Cons!13031) acc!681))))

(assert (=> d!95943 (= (contains!3687 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316865)))

(declare-fun b!693790 () Bool)

(declare-fun e!394737 () Bool)

(assert (=> b!693790 (= e!394736 e!394737)))

(declare-fun res!457800 () Bool)

(assert (=> b!693790 (=> res!457800 e!394737)))

(assert (=> b!693790 (= res!457800 (= (h!14079 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693791 () Bool)

(assert (=> b!693791 (= e!394737 (contains!3687 (t!19303 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95943 res!457799) b!693790))

(assert (= (and b!693790 (not res!457800)) b!693791))

(assert (=> d!95943 m!656465))

(declare-fun m!656471 () Bool)

(assert (=> d!95943 m!656471))

(declare-fun m!656473 () Bool)

(assert (=> b!693791 m!656473))

(assert (=> b!693590 d!95943))

(declare-fun d!95945 () Bool)

(assert (=> d!95945 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!693588 d!95945))

(declare-fun d!95947 () Bool)

(declare-fun res!457802 () Bool)

(declare-fun e!394741 () Bool)

(assert (=> d!95947 (=> res!457802 e!394741)))

(assert (=> d!95947 (= res!457802 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19470 a!3626)))))

(assert (=> d!95947 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316843) e!394741)))

(declare-fun b!693792 () Bool)

(declare-fun e!394740 () Bool)

(declare-fun call!34274 () Bool)

(assert (=> b!693792 (= e!394740 call!34274)))

(declare-fun c!78364 () Bool)

(declare-fun bm!34271 () Bool)

(assert (=> bm!34271 (= call!34274 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78364 (Cons!13031 (select (arr!19087 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316843) lt!316843)))))

(declare-fun b!693793 () Bool)

(declare-fun e!394738 () Bool)

(assert (=> b!693793 (= e!394738 e!394740)))

(assert (=> b!693793 (= c!78364 (validKeyInArray!0 (select (arr!19087 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun e!394739 () Bool)

(declare-fun b!693794 () Bool)

(assert (=> b!693794 (= e!394739 (contains!3687 lt!316843 (select (arr!19087 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!693795 () Bool)

(assert (=> b!693795 (= e!394740 call!34274)))

(declare-fun b!693796 () Bool)

(assert (=> b!693796 (= e!394741 e!394738)))

(declare-fun res!457801 () Bool)

(assert (=> b!693796 (=> (not res!457801) (not e!394738))))

(assert (=> b!693796 (= res!457801 (not e!394739))))

(declare-fun res!457803 () Bool)

(assert (=> b!693796 (=> (not res!457803) (not e!394739))))

(assert (=> b!693796 (= res!457803 (validKeyInArray!0 (select (arr!19087 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95947 (not res!457802)) b!693796))

(assert (= (and b!693796 res!457803) b!693794))

(assert (= (and b!693796 res!457801) b!693793))

(assert (= (and b!693793 c!78364) b!693792))

(assert (= (and b!693793 (not c!78364)) b!693795))

(assert (= (or b!693792 b!693795) bm!34271))

(declare-fun m!656475 () Bool)

(assert (=> bm!34271 m!656475))

(declare-fun m!656477 () Bool)

(assert (=> bm!34271 m!656477))

(assert (=> b!693793 m!656475))

(assert (=> b!693793 m!656475))

(declare-fun m!656479 () Bool)

(assert (=> b!693793 m!656479))

(assert (=> b!693794 m!656475))

(assert (=> b!693794 m!656475))

(declare-fun m!656481 () Bool)

(assert (=> b!693794 m!656481))

(assert (=> b!693796 m!656475))

(assert (=> b!693796 m!656475))

(assert (=> b!693796 m!656479))

(assert (=> b!693577 d!95947))

(declare-fun d!95949 () Bool)

(declare-fun lt!316866 () Bool)

(assert (=> d!95949 (= lt!316866 (select (content!318 acc!681) k0!2843))))

(declare-fun e!394742 () Bool)

(assert (=> d!95949 (= lt!316866 e!394742)))

(declare-fun res!457804 () Bool)

(assert (=> d!95949 (=> (not res!457804) (not e!394742))))

(assert (=> d!95949 (= res!457804 ((_ is Cons!13031) acc!681))))

(assert (=> d!95949 (= (contains!3687 acc!681 k0!2843) lt!316866)))

(declare-fun b!693797 () Bool)

(declare-fun e!394743 () Bool)

(assert (=> b!693797 (= e!394742 e!394743)))

(declare-fun res!457805 () Bool)

(assert (=> b!693797 (=> res!457805 e!394743)))

(assert (=> b!693797 (= res!457805 (= (h!14079 acc!681) k0!2843))))

(declare-fun b!693798 () Bool)

(assert (=> b!693798 (= e!394743 (contains!3687 (t!19303 acc!681) k0!2843))))

(assert (= (and d!95949 res!457804) b!693797))

(assert (= (and b!693797 (not res!457805)) b!693798))

(assert (=> d!95949 m!656465))

(declare-fun m!656483 () Bool)

(assert (=> d!95949 m!656483))

(declare-fun m!656485 () Bool)

(assert (=> b!693798 m!656485))

(assert (=> b!693578 d!95949))

(declare-fun d!95951 () Bool)

(declare-fun res!457810 () Bool)

(declare-fun e!394748 () Bool)

(assert (=> d!95951 (=> res!457810 e!394748)))

(assert (=> d!95951 (= res!457810 (= (select (arr!19087 a!3626) from!3004) k0!2843))))

(assert (=> d!95951 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!394748)))

(declare-fun b!693803 () Bool)

(declare-fun e!394749 () Bool)

(assert (=> b!693803 (= e!394748 e!394749)))

(declare-fun res!457811 () Bool)

(assert (=> b!693803 (=> (not res!457811) (not e!394749))))

(assert (=> b!693803 (= res!457811 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19470 a!3626)))))

(declare-fun b!693804 () Bool)

(assert (=> b!693804 (= e!394749 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95951 (not res!457810)) b!693803))

(assert (= (and b!693803 res!457811) b!693804))

(assert (=> d!95951 m!656345))

(declare-fun m!656487 () Bool)

(assert (=> b!693804 m!656487))

(assert (=> b!693599 d!95951))

(declare-fun d!95955 () Bool)

(assert (=> d!95955 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316871 () Unit!24465)

(declare-fun choose!13 (array!39852 (_ BitVec 64) (_ BitVec 32)) Unit!24465)

(assert (=> d!95955 (= lt!316871 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95955 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95955 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316871)))

(declare-fun bs!20303 () Bool)

(assert (= bs!20303 d!95955))

(assert (=> bs!20303 m!656371))

(declare-fun m!656489 () Bool)

(assert (=> bs!20303 m!656489))

(assert (=> b!693599 d!95955))

(declare-fun d!95957 () Bool)

(declare-fun lt!316872 () Bool)

(assert (=> d!95957 (= lt!316872 (select (content!318 lt!316843) k0!2843))))

(declare-fun e!394754 () Bool)

(assert (=> d!95957 (= lt!316872 e!394754)))

(declare-fun res!457816 () Bool)

(assert (=> d!95957 (=> (not res!457816) (not e!394754))))

(assert (=> d!95957 (= res!457816 ((_ is Cons!13031) lt!316843))))

(assert (=> d!95957 (= (contains!3687 lt!316843 k0!2843) lt!316872)))

(declare-fun b!693809 () Bool)

(declare-fun e!394755 () Bool)

(assert (=> b!693809 (= e!394754 e!394755)))

(declare-fun res!457817 () Bool)

(assert (=> b!693809 (=> res!457817 e!394755)))

(assert (=> b!693809 (= res!457817 (= (h!14079 lt!316843) k0!2843))))

(declare-fun b!693810 () Bool)

(assert (=> b!693810 (= e!394755 (contains!3687 (t!19303 lt!316843) k0!2843))))

(assert (= (and d!95957 res!457816) b!693809))

(assert (= (and b!693809 (not res!457817)) b!693810))

(declare-fun m!656491 () Bool)

(assert (=> d!95957 m!656491))

(declare-fun m!656493 () Bool)

(assert (=> d!95957 m!656493))

(declare-fun m!656495 () Bool)

(assert (=> b!693810 m!656495))

(assert (=> b!693576 d!95957))

(declare-fun d!95959 () Bool)

(assert (=> d!95959 (= ($colon$colon!419 acc!681 (select (arr!19087 a!3626) from!3004)) (Cons!13031 (select (arr!19087 a!3626) from!3004) acc!681))))

(assert (=> b!693597 d!95959))

(declare-fun d!95963 () Bool)

(assert (=> d!95963 (= (array_inv!14946 a!3626) (bvsge (size!19470 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62028 d!95963))

(assert (=> b!693587 d!95957))

(declare-fun d!95965 () Bool)

(declare-fun res!457820 () Bool)

(declare-fun e!394758 () Bool)

(assert (=> d!95965 (=> res!457820 e!394758)))

(assert (=> d!95965 (= res!457820 ((_ is Nil!13032) lt!316843))))

(assert (=> d!95965 (= (noDuplicate!961 lt!316843) e!394758)))

(declare-fun b!693813 () Bool)

(declare-fun e!394759 () Bool)

(assert (=> b!693813 (= e!394758 e!394759)))

(declare-fun res!457821 () Bool)

(assert (=> b!693813 (=> (not res!457821) (not e!394759))))

(assert (=> b!693813 (= res!457821 (not (contains!3687 (t!19303 lt!316843) (h!14079 lt!316843))))))

(declare-fun b!693814 () Bool)

(assert (=> b!693814 (= e!394759 (noDuplicate!961 (t!19303 lt!316843)))))

(assert (= (and d!95965 (not res!457820)) b!693813))

(assert (= (and b!693813 res!457821) b!693814))

(declare-fun m!656503 () Bool)

(assert (=> b!693813 m!656503))

(declare-fun m!656505 () Bool)

(assert (=> b!693814 m!656505))

(assert (=> b!693596 d!95965))

(declare-fun d!95967 () Bool)

(declare-fun lt!316874 () Bool)

(assert (=> d!95967 (= lt!316874 (select (content!318 lt!316843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394760 () Bool)

(assert (=> d!95967 (= lt!316874 e!394760)))

(declare-fun res!457822 () Bool)

(assert (=> d!95967 (=> (not res!457822) (not e!394760))))

(assert (=> d!95967 (= res!457822 ((_ is Cons!13031) lt!316843))))

(assert (=> d!95967 (= (contains!3687 lt!316843 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316874)))

(declare-fun b!693815 () Bool)

(declare-fun e!394761 () Bool)

(assert (=> b!693815 (= e!394760 e!394761)))

(declare-fun res!457823 () Bool)

(assert (=> b!693815 (=> res!457823 e!394761)))

(assert (=> b!693815 (= res!457823 (= (h!14079 lt!316843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693816 () Bool)

(assert (=> b!693816 (= e!394761 (contains!3687 (t!19303 lt!316843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95967 res!457822) b!693815))

(assert (= (and b!693815 (not res!457823)) b!693816))

(assert (=> d!95967 m!656491))

(declare-fun m!656507 () Bool)

(assert (=> d!95967 m!656507))

(declare-fun m!656509 () Bool)

(assert (=> b!693816 m!656509))

(assert (=> b!693585 d!95967))

(declare-fun d!95969 () Bool)

(declare-fun res!457824 () Bool)

(declare-fun e!394762 () Bool)

(assert (=> d!95969 (=> res!457824 e!394762)))

(assert (=> d!95969 (= res!457824 (= (select (arr!19087 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95969 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!394762)))

(declare-fun b!693817 () Bool)

(declare-fun e!394763 () Bool)

(assert (=> b!693817 (= e!394762 e!394763)))

(declare-fun res!457825 () Bool)

(assert (=> b!693817 (=> (not res!457825) (not e!394763))))

(assert (=> b!693817 (= res!457825 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19470 a!3626)))))

(declare-fun b!693818 () Bool)

(assert (=> b!693818 (= e!394763 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95969 (not res!457824)) b!693817))

(assert (= (and b!693817 res!457825) b!693818))

(assert (=> d!95969 m!656457))

(declare-fun m!656511 () Bool)

(assert (=> b!693818 m!656511))

(assert (=> b!693586 d!95969))

(declare-fun d!95971 () Bool)

(assert (=> d!95971 (= (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)) (and (not (= (select (arr!19087 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19087 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!693584 d!95971))

(declare-fun d!95973 () Bool)

(declare-fun lt!316875 () Bool)

(assert (=> d!95973 (= lt!316875 (select (content!318 lt!316843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394764 () Bool)

(assert (=> d!95973 (= lt!316875 e!394764)))

(declare-fun res!457826 () Bool)

(assert (=> d!95973 (=> (not res!457826) (not e!394764))))

(assert (=> d!95973 (= res!457826 ((_ is Cons!13031) lt!316843))))

(assert (=> d!95973 (= (contains!3687 lt!316843 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316875)))

(declare-fun b!693819 () Bool)

(declare-fun e!394765 () Bool)

(assert (=> b!693819 (= e!394764 e!394765)))

(declare-fun res!457827 () Bool)

(assert (=> b!693819 (=> res!457827 e!394765)))

(assert (=> b!693819 (= res!457827 (= (h!14079 lt!316843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693820 () Bool)

(assert (=> b!693820 (= e!394765 (contains!3687 (t!19303 lt!316843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95973 res!457826) b!693819))

(assert (= (and b!693819 (not res!457827)) b!693820))

(assert (=> d!95973 m!656491))

(declare-fun m!656513 () Bool)

(assert (=> d!95973 m!656513))

(declare-fun m!656515 () Bool)

(assert (=> b!693820 m!656515))

(assert (=> b!693594 d!95973))

(assert (=> b!693581 d!95949))

(check-sat (not b!693804) (not b!693794) (not d!95957) (not d!95949) (not bm!34269) (not b!693762) (not b!693776) (not b!693789) (not b!693778) (not d!95967) (not d!95941) (not d!95943) (not b!693818) (not b!693780) (not b!693783) (not b!693813) (not bm!34270) (not b!693763) (not b!693791) (not b!693816) (not b!693814) (not bm!34271) (not b!693793) (not d!95955) (not b!693796) (not b!693820) (not b!693781) (not b!693798) (not b!693775) (not b!693810) (not d!95973))
(check-sat)
