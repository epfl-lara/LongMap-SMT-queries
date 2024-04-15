; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60488 () Bool)

(assert start!60488)

(declare-fun b!679739 () Bool)

(declare-fun res!446203 () Bool)

(declare-fun e!387180 () Bool)

(assert (=> b!679739 (=> (not res!446203) (not e!387180))))

(declare-datatypes ((List!13009 0))(
  ( (Nil!13006) (Cons!13005 (h!14050 (_ BitVec 64)) (t!19228 List!13009)) )
))
(declare-fun acc!681 () List!13009)

(declare-fun noDuplicate!800 (List!13009) Bool)

(assert (=> b!679739 (= res!446203 (noDuplicate!800 acc!681))))

(declare-fun b!679740 () Bool)

(declare-datatypes ((Unit!23816 0))(
  ( (Unit!23817) )
))
(declare-fun e!387184 () Unit!23816)

(declare-fun Unit!23818 () Unit!23816)

(assert (=> b!679740 (= e!387184 Unit!23818)))

(declare-fun b!679741 () Bool)

(declare-fun res!446202 () Bool)

(assert (=> b!679741 (=> (not res!446202) (not e!387180))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39480 0))(
  ( (array!39481 (arr!18929 (Array (_ BitVec 32) (_ BitVec 64))) (size!19294 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39480)

(assert (=> b!679741 (= res!446202 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19294 a!3626))))))

(declare-fun b!679742 () Bool)

(declare-fun e!387179 () Bool)

(assert (=> b!679742 (= e!387180 (not e!387179))))

(declare-fun res!446211 () Bool)

(assert (=> b!679742 (=> res!446211 e!387179)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679742 (= res!446211 (not (validKeyInArray!0 (select (arr!18929 a!3626) from!3004))))))

(declare-fun lt!312758 () Unit!23816)

(assert (=> b!679742 (= lt!312758 e!387184)))

(declare-fun c!77136 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679742 (= c!77136 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679742 (arrayContainsKey!0 (array!39481 (store (arr!18929 a!3626) i!1382 k0!2843) (size!19294 a!3626)) k0!2843 from!3004)))

(declare-fun res!446209 () Bool)

(assert (=> start!60488 (=> (not res!446209) (not e!387180))))

(assert (=> start!60488 (= res!446209 (and (bvslt (size!19294 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19294 a!3626))))))

(assert (=> start!60488 e!387180))

(assert (=> start!60488 true))

(declare-fun array_inv!14812 (array!39480) Bool)

(assert (=> start!60488 (array_inv!14812 a!3626)))

(declare-fun b!679743 () Bool)

(declare-fun e!387185 () Bool)

(declare-fun e!387182 () Bool)

(assert (=> b!679743 (= e!387185 e!387182)))

(declare-fun res!446210 () Bool)

(assert (=> b!679743 (=> (not res!446210) (not e!387182))))

(assert (=> b!679743 (= res!446210 (bvsle from!3004 i!1382))))

(declare-fun b!679744 () Bool)

(declare-fun res!446206 () Bool)

(assert (=> b!679744 (=> (not res!446206) (not e!387180))))

(assert (=> b!679744 (= res!446206 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19294 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679745 () Bool)

(declare-fun res!446214 () Bool)

(assert (=> b!679745 (=> (not res!446214) (not e!387180))))

(assert (=> b!679745 (= res!446214 (validKeyInArray!0 k0!2843))))

(declare-fun b!679746 () Bool)

(declare-fun res!446208 () Bool)

(assert (=> b!679746 (=> (not res!446208) (not e!387180))))

(assert (=> b!679746 (= res!446208 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679747 () Bool)

(declare-fun res!446205 () Bool)

(assert (=> b!679747 (=> (not res!446205) (not e!387180))))

(assert (=> b!679747 (= res!446205 e!387185)))

(declare-fun res!446201 () Bool)

(assert (=> b!679747 (=> res!446201 e!387185)))

(declare-fun e!387181 () Bool)

(assert (=> b!679747 (= res!446201 e!387181)))

(declare-fun res!446215 () Bool)

(assert (=> b!679747 (=> (not res!446215) (not e!387181))))

(assert (=> b!679747 (= res!446215 (bvsgt from!3004 i!1382))))

(declare-fun b!679748 () Bool)

(declare-fun Unit!23819 () Unit!23816)

(assert (=> b!679748 (= e!387184 Unit!23819)))

(declare-fun lt!312757 () Unit!23816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39480 (_ BitVec 64) (_ BitVec 32)) Unit!23816)

(assert (=> b!679748 (= lt!312757 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!679748 false))

(declare-fun b!679749 () Bool)

(declare-fun contains!3531 (List!13009 (_ BitVec 64)) Bool)

(assert (=> b!679749 (= e!387182 (not (contains!3531 acc!681 k0!2843)))))

(declare-fun b!679750 () Bool)

(assert (=> b!679750 (= e!387181 (contains!3531 acc!681 k0!2843))))

(declare-fun b!679751 () Bool)

(declare-fun res!446207 () Bool)

(assert (=> b!679751 (=> (not res!446207) (not e!387180))))

(assert (=> b!679751 (= res!446207 (not (contains!3531 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679752 () Bool)

(declare-fun res!446212 () Bool)

(assert (=> b!679752 (=> (not res!446212) (not e!387180))))

(declare-fun arrayNoDuplicates!0 (array!39480 (_ BitVec 32) List!13009) Bool)

(assert (=> b!679752 (= res!446212 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13006))))

(declare-fun b!679753 () Bool)

(declare-fun res!446204 () Bool)

(assert (=> b!679753 (=> (not res!446204) (not e!387180))))

(assert (=> b!679753 (= res!446204 (not (contains!3531 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679754 () Bool)

(assert (=> b!679754 (= e!387179 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!134 (List!13009 List!13009) Bool)

(assert (=> b!679754 (subseq!134 acc!681 acc!681)))

(declare-fun lt!312759 () Unit!23816)

(declare-fun lemmaListSubSeqRefl!0 (List!13009) Unit!23816)

(assert (=> b!679754 (= lt!312759 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679755 () Bool)

(declare-fun res!446213 () Bool)

(assert (=> b!679755 (=> (not res!446213) (not e!387180))))

(assert (=> b!679755 (= res!446213 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60488 res!446209) b!679739))

(assert (= (and b!679739 res!446203) b!679753))

(assert (= (and b!679753 res!446204) b!679751))

(assert (= (and b!679751 res!446207) b!679747))

(assert (= (and b!679747 res!446215) b!679750))

(assert (= (and b!679747 (not res!446201)) b!679743))

(assert (= (and b!679743 res!446210) b!679749))

(assert (= (and b!679747 res!446205) b!679752))

(assert (= (and b!679752 res!446212) b!679755))

(assert (= (and b!679755 res!446213) b!679741))

(assert (= (and b!679741 res!446202) b!679745))

(assert (= (and b!679745 res!446214) b!679746))

(assert (= (and b!679746 res!446208) b!679744))

(assert (= (and b!679744 res!446206) b!679742))

(assert (= (and b!679742 c!77136) b!679748))

(assert (= (and b!679742 (not c!77136)) b!679740))

(assert (= (and b!679742 (not res!446211)) b!679754))

(declare-fun m!644439 () Bool)

(assert (=> b!679742 m!644439))

(declare-fun m!644441 () Bool)

(assert (=> b!679742 m!644441))

(declare-fun m!644443 () Bool)

(assert (=> b!679742 m!644443))

(assert (=> b!679742 m!644439))

(declare-fun m!644445 () Bool)

(assert (=> b!679742 m!644445))

(declare-fun m!644447 () Bool)

(assert (=> b!679742 m!644447))

(declare-fun m!644449 () Bool)

(assert (=> b!679750 m!644449))

(declare-fun m!644451 () Bool)

(assert (=> b!679751 m!644451))

(declare-fun m!644453 () Bool)

(assert (=> b!679755 m!644453))

(declare-fun m!644455 () Bool)

(assert (=> b!679746 m!644455))

(declare-fun m!644457 () Bool)

(assert (=> b!679752 m!644457))

(assert (=> b!679749 m!644449))

(declare-fun m!644459 () Bool)

(assert (=> b!679739 m!644459))

(declare-fun m!644461 () Bool)

(assert (=> start!60488 m!644461))

(declare-fun m!644463 () Bool)

(assert (=> b!679745 m!644463))

(declare-fun m!644465 () Bool)

(assert (=> b!679754 m!644465))

(declare-fun m!644467 () Bool)

(assert (=> b!679754 m!644467))

(declare-fun m!644469 () Bool)

(assert (=> b!679748 m!644469))

(declare-fun m!644471 () Bool)

(assert (=> b!679753 m!644471))

(check-sat (not b!679749) (not b!679739) (not b!679754) (not b!679750) (not b!679748) (not b!679755) (not b!679751) (not start!60488) (not b!679753) (not b!679746) (not b!679742) (not b!679745) (not b!679752))
(check-sat)
