; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61786 () Bool)

(assert start!61786)

(declare-fun b!691681 () Bool)

(declare-fun res!456019 () Bool)

(declare-fun e!393599 () Bool)

(assert (=> b!691681 (=> (not res!456019) (not e!393599))))

(declare-datatypes ((array!39807 0))(
  ( (array!39808 (arr!19072 (Array (_ BitVec 32) (_ BitVec 64))) (size!19457 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39807)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691681 (= res!456019 (validKeyInArray!0 (select (arr!19072 a!3626) from!3004)))))

(declare-fun b!691682 () Bool)

(declare-fun e!393597 () Bool)

(declare-fun e!393600 () Bool)

(assert (=> b!691682 (= e!393597 e!393600)))

(declare-fun res!456029 () Bool)

(assert (=> b!691682 (=> (not res!456029) (not e!393600))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691682 (= res!456029 (bvsle from!3004 i!1382))))

(declare-fun b!691683 () Bool)

(declare-fun res!456017 () Bool)

(assert (=> b!691683 (=> (not res!456017) (not e!393599))))

(declare-datatypes ((List!13113 0))(
  ( (Nil!13110) (Cons!13109 (h!14154 (_ BitVec 64)) (t!19380 List!13113)) )
))
(declare-fun acc!681 () List!13113)

(declare-fun arrayNoDuplicates!0 (array!39807 (_ BitVec 32) List!13113) Bool)

(assert (=> b!691683 (= res!456017 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691684 () Bool)

(declare-fun res!456028 () Bool)

(assert (=> b!691684 (=> (not res!456028) (not e!393599))))

(declare-fun noDuplicate!937 (List!13113) Bool)

(assert (=> b!691684 (= res!456028 (noDuplicate!937 acc!681))))

(declare-fun res!456015 () Bool)

(assert (=> start!61786 (=> (not res!456015) (not e!393599))))

(assert (=> start!61786 (= res!456015 (and (bvslt (size!19457 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19457 a!3626))))))

(assert (=> start!61786 e!393599))

(assert (=> start!61786 true))

(declare-fun array_inv!14868 (array!39807) Bool)

(assert (=> start!61786 (array_inv!14868 a!3626)))

(declare-fun b!691685 () Bool)

(declare-fun res!456023 () Bool)

(assert (=> b!691685 (=> (not res!456023) (not e!393599))))

(assert (=> b!691685 (= res!456023 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13110))))

(declare-fun b!691686 () Bool)

(declare-fun res!456021 () Bool)

(assert (=> b!691686 (=> (not res!456021) (not e!393599))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!691686 (= res!456021 (validKeyInArray!0 k0!2843))))

(declare-fun b!691687 () Bool)

(declare-fun res!456018 () Bool)

(assert (=> b!691687 (=> (not res!456018) (not e!393599))))

(declare-fun arrayContainsKey!0 (array!39807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691687 (= res!456018 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691688 () Bool)

(declare-fun e!393596 () Bool)

(declare-fun contains!3690 (List!13113 (_ BitVec 64)) Bool)

(assert (=> b!691688 (= e!393596 (contains!3690 acc!681 k0!2843))))

(declare-fun b!691689 () Bool)

(declare-fun res!456022 () Bool)

(assert (=> b!691689 (=> (not res!456022) (not e!393599))))

(assert (=> b!691689 (= res!456022 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19457 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691690 () Bool)

(declare-datatypes ((Unit!24406 0))(
  ( (Unit!24407) )
))
(declare-fun e!393598 () Unit!24406)

(declare-fun Unit!24408 () Unit!24406)

(assert (=> b!691690 (= e!393598 Unit!24408)))

(assert (=> b!691690 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316494 () Unit!24406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39807 (_ BitVec 64) (_ BitVec 32)) Unit!24406)

(assert (=> b!691690 (= lt!316494 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691690 false))

(declare-fun b!691691 () Bool)

(declare-fun res!456016 () Bool)

(assert (=> b!691691 (=> (not res!456016) (not e!393599))))

(assert (=> b!691691 (= res!456016 (not (contains!3690 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691692 () Bool)

(declare-fun Unit!24409 () Unit!24406)

(assert (=> b!691692 (= e!393598 Unit!24409)))

(declare-fun b!691693 () Bool)

(declare-fun res!456025 () Bool)

(assert (=> b!691693 (=> (not res!456025) (not e!393599))))

(assert (=> b!691693 (= res!456025 e!393597)))

(declare-fun res!456024 () Bool)

(assert (=> b!691693 (=> res!456024 e!393597)))

(assert (=> b!691693 (= res!456024 e!393596)))

(declare-fun res!456027 () Bool)

(assert (=> b!691693 (=> (not res!456027) (not e!393596))))

(assert (=> b!691693 (= res!456027 (bvsgt from!3004 i!1382))))

(declare-fun b!691694 () Bool)

(declare-fun res!456026 () Bool)

(assert (=> b!691694 (=> (not res!456026) (not e!393599))))

(assert (=> b!691694 (= res!456026 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19457 a!3626))))))

(declare-fun b!691695 () Bool)

(assert (=> b!691695 (= e!393600 (not (contains!3690 acc!681 k0!2843)))))

(declare-fun b!691696 () Bool)

(declare-fun res!456020 () Bool)

(assert (=> b!691696 (=> (not res!456020) (not e!393599))))

(assert (=> b!691696 (= res!456020 (not (contains!3690 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691697 () Bool)

(assert (=> b!691697 (= e!393599 false)))

(declare-fun lt!316495 () Unit!24406)

(assert (=> b!691697 (= lt!316495 e!393598)))

(declare-fun c!78200 () Bool)

(assert (=> b!691697 (= c!78200 (= (select (arr!19072 a!3626) from!3004) k0!2843))))

(assert (= (and start!61786 res!456015) b!691684))

(assert (= (and b!691684 res!456028) b!691696))

(assert (= (and b!691696 res!456020) b!691691))

(assert (= (and b!691691 res!456016) b!691693))

(assert (= (and b!691693 res!456027) b!691688))

(assert (= (and b!691693 (not res!456024)) b!691682))

(assert (= (and b!691682 res!456029) b!691695))

(assert (= (and b!691693 res!456025) b!691685))

(assert (= (and b!691685 res!456023) b!691683))

(assert (= (and b!691683 res!456017) b!691694))

(assert (= (and b!691694 res!456026) b!691686))

(assert (= (and b!691686 res!456021) b!691687))

(assert (= (and b!691687 res!456018) b!691689))

(assert (= (and b!691689 res!456022) b!691681))

(assert (= (and b!691681 res!456019) b!691697))

(assert (= (and b!691697 c!78200) b!691690))

(assert (= (and b!691697 (not c!78200)) b!691692))

(declare-fun m!654589 () Bool)

(assert (=> b!691690 m!654589))

(declare-fun m!654591 () Bool)

(assert (=> b!691690 m!654591))

(declare-fun m!654593 () Bool)

(assert (=> b!691697 m!654593))

(declare-fun m!654595 () Bool)

(assert (=> b!691696 m!654595))

(declare-fun m!654597 () Bool)

(assert (=> b!691695 m!654597))

(declare-fun m!654599 () Bool)

(assert (=> b!691683 m!654599))

(assert (=> b!691681 m!654593))

(assert (=> b!691681 m!654593))

(declare-fun m!654601 () Bool)

(assert (=> b!691681 m!654601))

(declare-fun m!654603 () Bool)

(assert (=> b!691685 m!654603))

(declare-fun m!654605 () Bool)

(assert (=> start!61786 m!654605))

(declare-fun m!654607 () Bool)

(assert (=> b!691686 m!654607))

(assert (=> b!691688 m!654597))

(declare-fun m!654609 () Bool)

(assert (=> b!691691 m!654609))

(declare-fun m!654611 () Bool)

(assert (=> b!691687 m!654611))

(declare-fun m!654613 () Bool)

(assert (=> b!691684 m!654613))

(check-sat (not b!691688) (not b!691695) (not b!691685) (not b!691683) (not start!61786) (not b!691687) (not b!691681) (not b!691684) (not b!691691) (not b!691690) (not b!691696) (not b!691686))
