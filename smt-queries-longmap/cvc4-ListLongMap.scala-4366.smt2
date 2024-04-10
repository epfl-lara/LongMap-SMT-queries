; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60228 () Bool)

(assert start!60228)

(declare-fun b!674541 () Bool)

(declare-fun res!441007 () Bool)

(declare-fun e!385028 () Bool)

(assert (=> b!674541 (=> (not res!441007) (not e!385028))))

(declare-datatypes ((List!12871 0))(
  ( (Nil!12868) (Cons!12867 (h!13912 (_ BitVec 64)) (t!19099 List!12871)) )
))
(declare-fun lt!312632 () List!12871)

(declare-fun noDuplicate!695 (List!12871) Bool)

(assert (=> b!674541 (= res!441007 (noDuplicate!695 lt!312632))))

(declare-fun b!674542 () Bool)

(declare-fun e!385027 () Bool)

(declare-fun e!385025 () Bool)

(assert (=> b!674542 (= e!385027 e!385025)))

(declare-fun res!441008 () Bool)

(assert (=> b!674542 (=> (not res!441008) (not e!385025))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674542 (= res!441008 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674543 () Bool)

(declare-fun e!385024 () Bool)

(declare-fun acc!681 () List!12871)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3448 (List!12871 (_ BitVec 64)) Bool)

(assert (=> b!674543 (= e!385024 (not (contains!3448 acc!681 k!2843)))))

(declare-fun b!674544 () Bool)

(assert (=> b!674544 (= e!385025 (not (contains!3448 lt!312632 k!2843)))))

(declare-fun b!674545 () Bool)

(declare-fun e!385029 () Bool)

(assert (=> b!674545 (= e!385029 e!385024)))

(declare-fun res!441026 () Bool)

(assert (=> b!674545 (=> (not res!441026) (not e!385024))))

(assert (=> b!674545 (= res!441026 (bvsle from!3004 i!1382))))

(declare-fun b!674546 () Bool)

(declare-fun e!385022 () Bool)

(assert (=> b!674546 (= e!385022 (contains!3448 lt!312632 k!2843))))

(declare-fun b!674547 () Bool)

(declare-fun res!441015 () Bool)

(declare-fun e!385032 () Bool)

(assert (=> b!674547 (=> (not res!441015) (not e!385032))))

(declare-datatypes ((array!39275 0))(
  ( (array!39276 (arr!18830 (Array (_ BitVec 32) (_ BitVec 64))) (size!19194 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39275)

(declare-fun arrayContainsKey!0 (array!39275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674547 (= res!441015 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674548 () Bool)

(declare-fun res!441018 () Bool)

(assert (=> b!674548 (=> (not res!441018) (not e!385032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674548 (= res!441018 (validKeyInArray!0 k!2843))))

(declare-fun b!674549 () Bool)

(declare-fun e!385030 () Bool)

(assert (=> b!674549 (= e!385030 (contains!3448 acc!681 k!2843))))

(declare-fun b!674550 () Bool)

(declare-fun res!441021 () Bool)

(assert (=> b!674550 (=> (not res!441021) (not e!385032))))

(assert (=> b!674550 (= res!441021 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19194 a!3626))))))

(declare-fun b!674551 () Bool)

(assert (=> b!674551 (= e!385028 (not true))))

(declare-fun arrayNoDuplicates!0 (array!39275 (_ BitVec 32) List!12871) Bool)

(assert (=> b!674551 (arrayNoDuplicates!0 (array!39276 (store (arr!18830 a!3626) i!1382 k!2843) (size!19194 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312632)))

(declare-datatypes ((Unit!23732 0))(
  ( (Unit!23733) )
))
(declare-fun lt!312631 () Unit!23732)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12871) Unit!23732)

(assert (=> b!674551 (= lt!312631 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312632))))

(declare-fun b!674552 () Bool)

(declare-fun res!441019 () Bool)

(assert (=> b!674552 (=> (not res!441019) (not e!385028))))

(assert (=> b!674552 (= res!441019 (not (contains!3448 lt!312632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674553 () Bool)

(declare-fun e!385031 () Unit!23732)

(declare-fun Unit!23734 () Unit!23732)

(assert (=> b!674553 (= e!385031 Unit!23734)))

(assert (=> b!674553 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312634 () Unit!23732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39275 (_ BitVec 64) (_ BitVec 32)) Unit!23732)

(assert (=> b!674553 (= lt!312634 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674553 false))

(declare-fun b!674554 () Bool)

(declare-fun res!441013 () Bool)

(assert (=> b!674554 (=> (not res!441013) (not e!385032))))

(assert (=> b!674554 (= res!441013 (noDuplicate!695 acc!681))))

(declare-fun b!674555 () Bool)

(declare-fun res!441022 () Bool)

(assert (=> b!674555 (=> (not res!441022) (not e!385032))))

(assert (=> b!674555 (= res!441022 (not (contains!3448 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!441028 () Bool)

(assert (=> start!60228 (=> (not res!441028) (not e!385032))))

(assert (=> start!60228 (= res!441028 (and (bvslt (size!19194 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19194 a!3626))))))

(assert (=> start!60228 e!385032))

(assert (=> start!60228 true))

(declare-fun array_inv!14626 (array!39275) Bool)

(assert (=> start!60228 (array_inv!14626 a!3626)))

(declare-fun b!674556 () Bool)

(declare-fun Unit!23735 () Unit!23732)

(assert (=> b!674556 (= e!385031 Unit!23735)))

(declare-fun b!674557 () Bool)

(declare-fun res!441009 () Bool)

(assert (=> b!674557 (=> (not res!441009) (not e!385032))))

(assert (=> b!674557 (= res!441009 e!385029)))

(declare-fun res!441027 () Bool)

(assert (=> b!674557 (=> res!441027 e!385029)))

(assert (=> b!674557 (= res!441027 e!385030)))

(declare-fun res!441005 () Bool)

(assert (=> b!674557 (=> (not res!441005) (not e!385030))))

(assert (=> b!674557 (= res!441005 (bvsgt from!3004 i!1382))))

(declare-fun b!674558 () Bool)

(declare-fun res!441029 () Bool)

(assert (=> b!674558 (=> (not res!441029) (not e!385028))))

(assert (=> b!674558 (= res!441029 e!385027)))

(declare-fun res!441012 () Bool)

(assert (=> b!674558 (=> res!441012 e!385027)))

(assert (=> b!674558 (= res!441012 e!385022)))

(declare-fun res!441020 () Bool)

(assert (=> b!674558 (=> (not res!441020) (not e!385022))))

(assert (=> b!674558 (= res!441020 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674559 () Bool)

(declare-fun res!441006 () Bool)

(assert (=> b!674559 (=> (not res!441006) (not e!385032))))

(assert (=> b!674559 (= res!441006 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19194 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674560 () Bool)

(declare-fun res!441025 () Bool)

(assert (=> b!674560 (=> (not res!441025) (not e!385032))))

(assert (=> b!674560 (= res!441025 (validKeyInArray!0 (select (arr!18830 a!3626) from!3004)))))

(declare-fun b!674561 () Bool)

(declare-fun res!441023 () Bool)

(assert (=> b!674561 (=> (not res!441023) (not e!385032))))

(assert (=> b!674561 (= res!441023 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674562 () Bool)

(declare-fun e!385023 () Bool)

(assert (=> b!674562 (= e!385023 e!385028)))

(declare-fun res!441014 () Bool)

(assert (=> b!674562 (=> (not res!441014) (not e!385028))))

(assert (=> b!674562 (= res!441014 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!298 (List!12871 (_ BitVec 64)) List!12871)

(assert (=> b!674562 (= lt!312632 ($colon$colon!298 acc!681 (select (arr!18830 a!3626) from!3004)))))

(declare-fun b!674563 () Bool)

(declare-fun res!441010 () Bool)

(assert (=> b!674563 (=> (not res!441010) (not e!385028))))

(assert (=> b!674563 (= res!441010 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312632))))

(declare-fun b!674564 () Bool)

(declare-fun res!441011 () Bool)

(assert (=> b!674564 (=> (not res!441011) (not e!385028))))

(assert (=> b!674564 (= res!441011 (not (contains!3448 lt!312632 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674565 () Bool)

(assert (=> b!674565 (= e!385032 e!385023)))

(declare-fun res!441016 () Bool)

(assert (=> b!674565 (=> (not res!441016) (not e!385023))))

(assert (=> b!674565 (= res!441016 (not (= (select (arr!18830 a!3626) from!3004) k!2843)))))

(declare-fun lt!312633 () Unit!23732)

(assert (=> b!674565 (= lt!312633 e!385031)))

(declare-fun c!77135 () Bool)

(assert (=> b!674565 (= c!77135 (= (select (arr!18830 a!3626) from!3004) k!2843))))

(declare-fun b!674566 () Bool)

(declare-fun res!441017 () Bool)

(assert (=> b!674566 (=> (not res!441017) (not e!385032))))

(assert (=> b!674566 (= res!441017 (not (contains!3448 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674567 () Bool)

(declare-fun res!441024 () Bool)

(assert (=> b!674567 (=> (not res!441024) (not e!385032))))

(assert (=> b!674567 (= res!441024 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12868))))

(assert (= (and start!60228 res!441028) b!674554))

(assert (= (and b!674554 res!441013) b!674566))

(assert (= (and b!674566 res!441017) b!674555))

(assert (= (and b!674555 res!441022) b!674557))

(assert (= (and b!674557 res!441005) b!674549))

(assert (= (and b!674557 (not res!441027)) b!674545))

(assert (= (and b!674545 res!441026) b!674543))

(assert (= (and b!674557 res!441009) b!674567))

(assert (= (and b!674567 res!441024) b!674561))

(assert (= (and b!674561 res!441023) b!674550))

(assert (= (and b!674550 res!441021) b!674548))

(assert (= (and b!674548 res!441018) b!674547))

(assert (= (and b!674547 res!441015) b!674559))

(assert (= (and b!674559 res!441006) b!674560))

(assert (= (and b!674560 res!441025) b!674565))

(assert (= (and b!674565 c!77135) b!674553))

(assert (= (and b!674565 (not c!77135)) b!674556))

(assert (= (and b!674565 res!441016) b!674562))

(assert (= (and b!674562 res!441014) b!674541))

(assert (= (and b!674541 res!441007) b!674552))

(assert (= (and b!674552 res!441019) b!674564))

(assert (= (and b!674564 res!441011) b!674558))

(assert (= (and b!674558 res!441020) b!674546))

(assert (= (and b!674558 (not res!441012)) b!674542))

(assert (= (and b!674542 res!441008) b!674544))

(assert (= (and b!674558 res!441029) b!674563))

(assert (= (and b!674563 res!441010) b!674551))

(declare-fun m!642447 () Bool)

(assert (=> b!674562 m!642447))

(assert (=> b!674562 m!642447))

(declare-fun m!642449 () Bool)

(assert (=> b!674562 m!642449))

(declare-fun m!642451 () Bool)

(assert (=> b!674544 m!642451))

(declare-fun m!642453 () Bool)

(assert (=> b!674549 m!642453))

(declare-fun m!642455 () Bool)

(assert (=> b!674561 m!642455))

(declare-fun m!642457 () Bool)

(assert (=> start!60228 m!642457))

(declare-fun m!642459 () Bool)

(assert (=> b!674548 m!642459))

(declare-fun m!642461 () Bool)

(assert (=> b!674553 m!642461))

(declare-fun m!642463 () Bool)

(assert (=> b!674553 m!642463))

(declare-fun m!642465 () Bool)

(assert (=> b!674552 m!642465))

(declare-fun m!642467 () Bool)

(assert (=> b!674563 m!642467))

(declare-fun m!642469 () Bool)

(assert (=> b!674564 m!642469))

(assert (=> b!674565 m!642447))

(declare-fun m!642471 () Bool)

(assert (=> b!674554 m!642471))

(declare-fun m!642473 () Bool)

(assert (=> b!674541 m!642473))

(assert (=> b!674543 m!642453))

(declare-fun m!642475 () Bool)

(assert (=> b!674555 m!642475))

(assert (=> b!674560 m!642447))

(assert (=> b!674560 m!642447))

(declare-fun m!642477 () Bool)

(assert (=> b!674560 m!642477))

(declare-fun m!642479 () Bool)

(assert (=> b!674551 m!642479))

(declare-fun m!642481 () Bool)

(assert (=> b!674551 m!642481))

(declare-fun m!642483 () Bool)

(assert (=> b!674551 m!642483))

(assert (=> b!674546 m!642451))

(declare-fun m!642485 () Bool)

(assert (=> b!674566 m!642485))

(declare-fun m!642487 () Bool)

(assert (=> b!674567 m!642487))

(declare-fun m!642489 () Bool)

(assert (=> b!674547 m!642489))

(push 1)

