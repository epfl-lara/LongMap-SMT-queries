; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60276 () Bool)

(assert start!60276)

(declare-fun b!674360 () Bool)

(declare-fun res!440751 () Bool)

(declare-fun e!384999 () Bool)

(assert (=> b!674360 (=> (not res!440751) (not e!384999))))

(declare-fun e!385001 () Bool)

(assert (=> b!674360 (= res!440751 e!385001)))

(declare-fun res!440764 () Bool)

(assert (=> b!674360 (=> res!440764 e!385001)))

(declare-fun e!385000 () Bool)

(assert (=> b!674360 (= res!440764 e!385000)))

(declare-fun res!440745 () Bool)

(assert (=> b!674360 (=> (not res!440745) (not e!385000))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674360 (= res!440745 (bvsgt from!3004 i!1382))))

(declare-fun b!674361 () Bool)

(declare-fun res!440752 () Bool)

(declare-fun e!385005 () Bool)

(assert (=> b!674361 (=> (not res!440752) (not e!385005))))

(declare-datatypes ((List!12768 0))(
  ( (Nil!12765) (Cons!12764 (h!13812 (_ BitVec 64)) (t!18988 List!12768)) )
))
(declare-fun lt!312673 () List!12768)

(declare-fun noDuplicate!694 (List!12768) Bool)

(assert (=> b!674361 (= res!440752 (noDuplicate!694 lt!312673))))

(declare-fun b!674362 () Bool)

(declare-fun res!440750 () Bool)

(assert (=> b!674362 (=> (not res!440750) (not e!384999))))

(declare-datatypes ((array!39261 0))(
  ( (array!39262 (arr!18820 (Array (_ BitVec 32) (_ BitVec 64))) (size!19184 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39261)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674362 (= res!440750 (validKeyInArray!0 (select (arr!18820 a!3626) from!3004)))))

(declare-fun b!674363 () Bool)

(declare-datatypes ((Unit!23691 0))(
  ( (Unit!23692) )
))
(declare-fun e!385002 () Unit!23691)

(declare-fun Unit!23693 () Unit!23691)

(assert (=> b!674363 (= e!385002 Unit!23693)))

(declare-fun b!674364 () Bool)

(declare-fun e!384998 () Bool)

(assert (=> b!674364 (= e!385001 e!384998)))

(declare-fun res!440756 () Bool)

(assert (=> b!674364 (=> (not res!440756) (not e!384998))))

(assert (=> b!674364 (= res!440756 (bvsle from!3004 i!1382))))

(declare-fun b!674366 () Bool)

(declare-fun res!440763 () Bool)

(assert (=> b!674366 (=> (not res!440763) (not e!384999))))

(declare-fun arrayNoDuplicates!0 (array!39261 (_ BitVec 32) List!12768) Bool)

(assert (=> b!674366 (= res!440763 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12765))))

(declare-fun b!674367 () Bool)

(declare-fun res!440743 () Bool)

(assert (=> b!674367 (=> (not res!440743) (not e!384999))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!674367 (= res!440743 (validKeyInArray!0 k0!2843))))

(declare-fun b!674368 () Bool)

(declare-fun res!440755 () Bool)

(assert (=> b!674368 (=> (not res!440755) (not e!384999))))

(assert (=> b!674368 (= res!440755 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19184 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674369 () Bool)

(declare-fun res!440749 () Bool)

(assert (=> b!674369 (=> (not res!440749) (not e!384999))))

(declare-fun acc!681 () List!12768)

(declare-fun contains!3420 (List!12768 (_ BitVec 64)) Bool)

(assert (=> b!674369 (= res!440749 (not (contains!3420 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674370 () Bool)

(declare-fun e!385006 () Bool)

(declare-fun e!385003 () Bool)

(assert (=> b!674370 (= e!385006 e!385003)))

(declare-fun res!440759 () Bool)

(assert (=> b!674370 (=> (not res!440759) (not e!385003))))

(assert (=> b!674370 (= res!440759 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674371 () Bool)

(declare-fun e!385008 () Bool)

(assert (=> b!674371 (= e!385008 (contains!3420 lt!312673 k0!2843))))

(declare-fun b!674372 () Bool)

(declare-fun res!440765 () Bool)

(assert (=> b!674372 (=> (not res!440765) (not e!384999))))

(assert (=> b!674372 (= res!440765 (noDuplicate!694 acc!681))))

(declare-fun b!674373 () Bool)

(declare-fun res!440748 () Bool)

(assert (=> b!674373 (=> (not res!440748) (not e!385005))))

(assert (=> b!674373 (= res!440748 (not (contains!3420 lt!312673 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674374 () Bool)

(assert (=> b!674374 (= e!385005 (not (bvsle from!3004 (size!19184 a!3626))))))

(assert (=> b!674374 (arrayNoDuplicates!0 (array!39262 (store (arr!18820 a!3626) i!1382 k0!2843) (size!19184 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312673)))

(declare-fun lt!312676 () Unit!23691)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39261 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12768) Unit!23691)

(assert (=> b!674374 (= lt!312676 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312673))))

(declare-fun b!674375 () Bool)

(declare-fun e!385004 () Bool)

(assert (=> b!674375 (= e!385004 e!385005)))

(declare-fun res!440758 () Bool)

(assert (=> b!674375 (=> (not res!440758) (not e!385005))))

(assert (=> b!674375 (= res!440758 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!290 (List!12768 (_ BitVec 64)) List!12768)

(assert (=> b!674375 (= lt!312673 ($colon$colon!290 acc!681 (select (arr!18820 a!3626) from!3004)))))

(declare-fun b!674376 () Bool)

(declare-fun res!440757 () Bool)

(assert (=> b!674376 (=> (not res!440757) (not e!385005))))

(assert (=> b!674376 (= res!440757 e!385006)))

(declare-fun res!440762 () Bool)

(assert (=> b!674376 (=> res!440762 e!385006)))

(assert (=> b!674376 (= res!440762 e!385008)))

(declare-fun res!440760 () Bool)

(assert (=> b!674376 (=> (not res!440760) (not e!385008))))

(assert (=> b!674376 (= res!440760 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674377 () Bool)

(assert (=> b!674377 (= e!385003 (not (contains!3420 lt!312673 k0!2843)))))

(declare-fun b!674378 () Bool)

(declare-fun res!440754 () Bool)

(assert (=> b!674378 (=> (not res!440754) (not e!384999))))

(assert (=> b!674378 (= res!440754 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19184 a!3626))))))

(declare-fun b!674379 () Bool)

(declare-fun res!440761 () Bool)

(assert (=> b!674379 (=> (not res!440761) (not e!384999))))

(assert (=> b!674379 (= res!440761 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674380 () Bool)

(declare-fun res!440766 () Bool)

(assert (=> b!674380 (=> (not res!440766) (not e!384999))))

(declare-fun arrayContainsKey!0 (array!39261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674380 (= res!440766 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!440753 () Bool)

(assert (=> start!60276 (=> (not res!440753) (not e!384999))))

(assert (=> start!60276 (= res!440753 (and (bvslt (size!19184 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19184 a!3626))))))

(assert (=> start!60276 e!384999))

(assert (=> start!60276 true))

(declare-fun array_inv!14679 (array!39261) Bool)

(assert (=> start!60276 (array_inv!14679 a!3626)))

(declare-fun b!674365 () Bool)

(declare-fun res!440746 () Bool)

(assert (=> b!674365 (=> (not res!440746) (not e!385005))))

(assert (=> b!674365 (= res!440746 (not (contains!3420 lt!312673 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674381 () Bool)

(declare-fun Unit!23694 () Unit!23691)

(assert (=> b!674381 (= e!385002 Unit!23694)))

(assert (=> b!674381 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312674 () Unit!23691)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39261 (_ BitVec 64) (_ BitVec 32)) Unit!23691)

(assert (=> b!674381 (= lt!312674 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674381 false))

(declare-fun b!674382 () Bool)

(declare-fun res!440744 () Bool)

(assert (=> b!674382 (=> (not res!440744) (not e!385005))))

(assert (=> b!674382 (= res!440744 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312673))))

(declare-fun b!674383 () Bool)

(assert (=> b!674383 (= e!384999 e!385004)))

(declare-fun res!440767 () Bool)

(assert (=> b!674383 (=> (not res!440767) (not e!385004))))

(assert (=> b!674383 (= res!440767 (not (= (select (arr!18820 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312675 () Unit!23691)

(assert (=> b!674383 (= lt!312675 e!385002)))

(declare-fun c!77177 () Bool)

(assert (=> b!674383 (= c!77177 (= (select (arr!18820 a!3626) from!3004) k0!2843))))

(declare-fun b!674384 () Bool)

(declare-fun res!440747 () Bool)

(assert (=> b!674384 (=> (not res!440747) (not e!384999))))

(assert (=> b!674384 (= res!440747 (not (contains!3420 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674385 () Bool)

(assert (=> b!674385 (= e!385000 (contains!3420 acc!681 k0!2843))))

(declare-fun b!674386 () Bool)

(assert (=> b!674386 (= e!384998 (not (contains!3420 acc!681 k0!2843)))))

(assert (= (and start!60276 res!440753) b!674372))

(assert (= (and b!674372 res!440765) b!674384))

(assert (= (and b!674384 res!440747) b!674369))

(assert (= (and b!674369 res!440749) b!674360))

(assert (= (and b!674360 res!440745) b!674385))

(assert (= (and b!674360 (not res!440764)) b!674364))

(assert (= (and b!674364 res!440756) b!674386))

(assert (= (and b!674360 res!440751) b!674366))

(assert (= (and b!674366 res!440763) b!674379))

(assert (= (and b!674379 res!440761) b!674378))

(assert (= (and b!674378 res!440754) b!674367))

(assert (= (and b!674367 res!440743) b!674380))

(assert (= (and b!674380 res!440766) b!674368))

(assert (= (and b!674368 res!440755) b!674362))

(assert (= (and b!674362 res!440750) b!674383))

(assert (= (and b!674383 c!77177) b!674381))

(assert (= (and b!674383 (not c!77177)) b!674363))

(assert (= (and b!674383 res!440767) b!674375))

(assert (= (and b!674375 res!440758) b!674361))

(assert (= (and b!674361 res!440752) b!674365))

(assert (= (and b!674365 res!440746) b!674373))

(assert (= (and b!674373 res!440748) b!674376))

(assert (= (and b!674376 res!440760) b!674371))

(assert (= (and b!674376 (not res!440762)) b!674370))

(assert (= (and b!674370 res!440759) b!674377))

(assert (= (and b!674376 res!440757) b!674382))

(assert (= (and b!674382 res!440744) b!674374))

(declare-fun m!642925 () Bool)

(assert (=> b!674367 m!642925))

(declare-fun m!642927 () Bool)

(assert (=> b!674385 m!642927))

(declare-fun m!642929 () Bool)

(assert (=> b!674371 m!642929))

(declare-fun m!642931 () Bool)

(assert (=> b!674369 m!642931))

(declare-fun m!642933 () Bool)

(assert (=> b!674379 m!642933))

(assert (=> b!674377 m!642929))

(declare-fun m!642935 () Bool)

(assert (=> b!674361 m!642935))

(declare-fun m!642937 () Bool)

(assert (=> start!60276 m!642937))

(declare-fun m!642939 () Bool)

(assert (=> b!674366 m!642939))

(declare-fun m!642941 () Bool)

(assert (=> b!674372 m!642941))

(declare-fun m!642943 () Bool)

(assert (=> b!674365 m!642943))

(declare-fun m!642945 () Bool)

(assert (=> b!674383 m!642945))

(declare-fun m!642947 () Bool)

(assert (=> b!674384 m!642947))

(declare-fun m!642949 () Bool)

(assert (=> b!674381 m!642949))

(declare-fun m!642951 () Bool)

(assert (=> b!674381 m!642951))

(assert (=> b!674375 m!642945))

(assert (=> b!674375 m!642945))

(declare-fun m!642953 () Bool)

(assert (=> b!674375 m!642953))

(assert (=> b!674362 m!642945))

(assert (=> b!674362 m!642945))

(declare-fun m!642955 () Bool)

(assert (=> b!674362 m!642955))

(assert (=> b!674386 m!642927))

(declare-fun m!642957 () Bool)

(assert (=> b!674380 m!642957))

(declare-fun m!642959 () Bool)

(assert (=> b!674374 m!642959))

(declare-fun m!642961 () Bool)

(assert (=> b!674374 m!642961))

(declare-fun m!642963 () Bool)

(assert (=> b!674374 m!642963))

(declare-fun m!642965 () Bool)

(assert (=> b!674382 m!642965))

(declare-fun m!642967 () Bool)

(assert (=> b!674373 m!642967))

(check-sat (not b!674382) (not b!674386) (not b!674367) (not b!674361) (not b!674372) (not b!674385) (not b!674374) (not b!674375) (not b!674381) (not b!674365) (not b!674379) (not b!674380) (not b!674369) (not b!674371) (not b!674377) (not b!674366) (not b!674373) (not b!674362) (not start!60276) (not b!674384))
(check-sat)
