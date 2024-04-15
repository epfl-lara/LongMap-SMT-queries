; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103904 () Bool)

(assert start!103904)

(declare-fun b!1243671 () Bool)

(declare-fun res!829491 () Bool)

(declare-fun e!704974 () Bool)

(assert (=> b!1243671 (=> (not res!829491) (not e!704974))))

(declare-datatypes ((List!27459 0))(
  ( (Nil!27456) (Cons!27455 (h!28664 (_ BitVec 64)) (t!40919 List!27459)) )
))
(declare-fun lt!562296 () List!27459)

(declare-fun contains!7389 (List!27459 (_ BitVec 64)) Bool)

(assert (=> b!1243671 (= res!829491 (not (contains!7389 lt!562296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243672 () Bool)

(declare-fun res!829495 () Bool)

(declare-fun e!704976 () Bool)

(assert (=> b!1243672 (=> (not res!829495) (not e!704976))))

(declare-datatypes ((array!79922 0))(
  ( (array!79923 (arr!38555 (Array (_ BitVec 32) (_ BitVec 64))) (size!39093 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79922)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243672 (= res!829495 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39093 a!3892)) (not (= newFrom!287 (size!39093 a!3892)))))))

(declare-fun b!1243673 () Bool)

(declare-fun res!829497 () Bool)

(assert (=> b!1243673 (=> (not res!829497) (not e!704974))))

(assert (=> b!1243673 (= res!829497 (not (contains!7389 Nil!27456 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243674 () Bool)

(declare-fun res!829493 () Bool)

(assert (=> b!1243674 (=> (not res!829493) (not e!704974))))

(declare-fun noDuplicate!2014 (List!27459) Bool)

(assert (=> b!1243674 (= res!829493 (noDuplicate!2014 lt!562296))))

(declare-fun b!1243676 () Bool)

(assert (=> b!1243676 (= e!704976 e!704974)))

(declare-fun res!829490 () Bool)

(assert (=> b!1243676 (=> (not res!829490) (not e!704974))))

(assert (=> b!1243676 (= res!829490 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243676 (= lt!562296 (Cons!27455 (select (arr!38555 a!3892) from!3270) Nil!27456))))

(declare-fun b!1243677 () Bool)

(assert (=> b!1243677 (= e!704974 false)))

(declare-fun lt!562295 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79922 (_ BitVec 32) List!27459) Bool)

(assert (=> b!1243677 (= lt!562295 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562296))))

(declare-datatypes ((Unit!41142 0))(
  ( (Unit!41143) )
))
(declare-fun lt!562294 () Unit!41142)

(declare-fun noDuplicateSubseq!98 (List!27459 List!27459) Unit!41142)

(assert (=> b!1243677 (= lt!562294 (noDuplicateSubseq!98 Nil!27456 lt!562296))))

(declare-fun b!1243678 () Bool)

(declare-fun res!829500 () Bool)

(assert (=> b!1243678 (=> (not res!829500) (not e!704976))))

(assert (=> b!1243678 (= res!829500 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27456))))

(declare-fun b!1243679 () Bool)

(declare-fun res!829492 () Bool)

(assert (=> b!1243679 (=> (not res!829492) (not e!704974))))

(assert (=> b!1243679 (= res!829492 (not (contains!7389 Nil!27456 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243680 () Bool)

(declare-fun res!829499 () Bool)

(assert (=> b!1243680 (=> (not res!829499) (not e!704974))))

(assert (=> b!1243680 (= res!829499 (not (contains!7389 lt!562296 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243681 () Bool)

(declare-fun res!829498 () Bool)

(assert (=> b!1243681 (=> (not res!829498) (not e!704974))))

(declare-fun subseq!644 (List!27459 List!27459) Bool)

(assert (=> b!1243681 (= res!829498 (subseq!644 Nil!27456 lt!562296))))

(declare-fun b!1243675 () Bool)

(declare-fun res!829494 () Bool)

(assert (=> b!1243675 (=> (not res!829494) (not e!704976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243675 (= res!829494 (validKeyInArray!0 (select (arr!38555 a!3892) from!3270)))))

(declare-fun res!829496 () Bool)

(assert (=> start!103904 (=> (not res!829496) (not e!704976))))

(assert (=> start!103904 (= res!829496 (and (bvslt (size!39093 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39093 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39093 a!3892))))))

(assert (=> start!103904 e!704976))

(declare-fun array_inv!29538 (array!79922) Bool)

(assert (=> start!103904 (array_inv!29538 a!3892)))

(assert (=> start!103904 true))

(assert (= (and start!103904 res!829496) b!1243678))

(assert (= (and b!1243678 res!829500) b!1243672))

(assert (= (and b!1243672 res!829495) b!1243675))

(assert (= (and b!1243675 res!829494) b!1243676))

(assert (= (and b!1243676 res!829490) b!1243674))

(assert (= (and b!1243674 res!829493) b!1243671))

(assert (= (and b!1243671 res!829491) b!1243680))

(assert (= (and b!1243680 res!829499) b!1243679))

(assert (= (and b!1243679 res!829492) b!1243673))

(assert (= (and b!1243673 res!829497) b!1243681))

(assert (= (and b!1243681 res!829498) b!1243677))

(declare-fun m!1145697 () Bool)

(assert (=> b!1243681 m!1145697))

(declare-fun m!1145699 () Bool)

(assert (=> b!1243677 m!1145699))

(declare-fun m!1145701 () Bool)

(assert (=> b!1243677 m!1145701))

(declare-fun m!1145703 () Bool)

(assert (=> b!1243679 m!1145703))

(declare-fun m!1145705 () Bool)

(assert (=> b!1243671 m!1145705))

(declare-fun m!1145707 () Bool)

(assert (=> b!1243676 m!1145707))

(declare-fun m!1145709 () Bool)

(assert (=> b!1243673 m!1145709))

(declare-fun m!1145711 () Bool)

(assert (=> b!1243674 m!1145711))

(declare-fun m!1145713 () Bool)

(assert (=> b!1243680 m!1145713))

(declare-fun m!1145715 () Bool)

(assert (=> start!103904 m!1145715))

(assert (=> b!1243675 m!1145707))

(assert (=> b!1243675 m!1145707))

(declare-fun m!1145717 () Bool)

(assert (=> b!1243675 m!1145717))

(declare-fun m!1145719 () Bool)

(assert (=> b!1243678 m!1145719))

(check-sat (not b!1243674) (not b!1243678) (not b!1243675) (not b!1243679) (not b!1243681) (not b!1243677) (not start!103904) (not b!1243673) (not b!1243671) (not b!1243680))
(check-sat)
