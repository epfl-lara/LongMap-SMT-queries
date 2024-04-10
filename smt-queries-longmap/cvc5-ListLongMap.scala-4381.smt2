; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60314 () Bool)

(assert start!60314)

(declare-fun b!677265 () Bool)

(declare-fun res!443702 () Bool)

(declare-fun e!386114 () Bool)

(assert (=> b!677265 (=> (not res!443702) (not e!386114))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677265 (= res!443702 (validKeyInArray!0 k!2843))))

(declare-fun b!677266 () Bool)

(declare-fun e!386111 () Bool)

(declare-datatypes ((List!12914 0))(
  ( (Nil!12911) (Cons!12910 (h!13955 (_ BitVec 64)) (t!19142 List!12914)) )
))
(declare-fun acc!681 () List!12914)

(declare-fun contains!3491 (List!12914 (_ BitVec 64)) Bool)

(assert (=> b!677266 (= e!386111 (not (contains!3491 acc!681 k!2843)))))

(declare-fun b!677267 () Bool)

(declare-fun res!443711 () Bool)

(assert (=> b!677267 (=> (not res!443711) (not e!386114))))

(declare-datatypes ((array!39361 0))(
  ( (array!39362 (arr!18873 (Array (_ BitVec 32) (_ BitVec 64))) (size!19237 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39361)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39361 (_ BitVec 32) List!12914) Bool)

(assert (=> b!677267 (= res!443711 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677268 () Bool)

(declare-fun res!443695 () Bool)

(assert (=> b!677268 (=> (not res!443695) (not e!386114))))

(declare-fun e!386112 () Bool)

(assert (=> b!677268 (= res!443695 e!386112)))

(declare-fun res!443691 () Bool)

(assert (=> b!677268 (=> res!443691 e!386112)))

(declare-fun e!386117 () Bool)

(assert (=> b!677268 (= res!443691 e!386117)))

(declare-fun res!443710 () Bool)

(assert (=> b!677268 (=> (not res!443710) (not e!386117))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677268 (= res!443710 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677269 () Bool)

(declare-fun e!386115 () Bool)

(assert (=> b!677269 (= e!386115 e!386111)))

(declare-fun res!443708 () Bool)

(assert (=> b!677269 (=> (not res!443708) (not e!386111))))

(assert (=> b!677269 (= res!443708 (bvsle from!3004 i!1382))))

(declare-fun b!677270 () Bool)

(declare-fun res!443705 () Bool)

(assert (=> b!677270 (=> (not res!443705) (not e!386114))))

(assert (=> b!677270 (= res!443705 (not (contains!3491 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677271 () Bool)

(declare-fun e!386113 () Bool)

(assert (=> b!677271 (= e!386112 e!386113)))

(declare-fun res!443700 () Bool)

(assert (=> b!677271 (=> (not res!443700) (not e!386113))))

(assert (=> b!677271 (= res!443700 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!443709 () Bool)

(assert (=> start!60314 (=> (not res!443709) (not e!386114))))

(assert (=> start!60314 (= res!443709 (and (bvslt (size!19237 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19237 a!3626))))))

(assert (=> start!60314 e!386114))

(assert (=> start!60314 true))

(declare-fun array_inv!14669 (array!39361) Bool)

(assert (=> start!60314 (array_inv!14669 a!3626)))

(declare-fun b!677272 () Bool)

(assert (=> b!677272 (= e!386117 (contains!3491 acc!681 k!2843))))

(declare-fun b!677273 () Bool)

(declare-fun res!443698 () Bool)

(assert (=> b!677273 (=> (not res!443698) (not e!386114))))

(assert (=> b!677273 (= res!443698 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19237 a!3626))))))

(declare-fun b!677274 () Bool)

(declare-fun res!443703 () Bool)

(assert (=> b!677274 (=> (not res!443703) (not e!386114))))

(assert (=> b!677274 (= res!443703 (not (contains!3491 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677275 () Bool)

(declare-fun res!443706 () Bool)

(assert (=> b!677275 (=> (not res!443706) (not e!386114))))

(declare-fun arrayContainsKey!0 (array!39361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677275 (= res!443706 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677276 () Bool)

(declare-fun res!443693 () Bool)

(assert (=> b!677276 (=> (not res!443693) (not e!386114))))

(assert (=> b!677276 (= res!443693 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677277 () Bool)

(assert (=> b!677277 (= e!386114 (not true))))

(assert (=> b!677277 (arrayNoDuplicates!0 (array!39362 (store (arr!18873 a!3626) i!1382 k!2843) (size!19237 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23766 0))(
  ( (Unit!23767) )
))
(declare-fun lt!312817 () Unit!23766)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12914) Unit!23766)

(assert (=> b!677277 (= lt!312817 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677278 () Bool)

(declare-fun res!443694 () Bool)

(assert (=> b!677278 (=> (not res!443694) (not e!386114))))

(assert (=> b!677278 (= res!443694 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19237 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677279 () Bool)

(assert (=> b!677279 (= e!386113 (not (contains!3491 acc!681 k!2843)))))

(declare-fun b!677280 () Bool)

(declare-fun e!386116 () Bool)

(assert (=> b!677280 (= e!386116 (contains!3491 acc!681 k!2843))))

(declare-fun b!677281 () Bool)

(declare-fun res!443697 () Bool)

(assert (=> b!677281 (=> (not res!443697) (not e!386114))))

(assert (=> b!677281 (= res!443697 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12911))))

(declare-fun b!677282 () Bool)

(declare-fun res!443701 () Bool)

(assert (=> b!677282 (=> (not res!443701) (not e!386114))))

(assert (=> b!677282 (= res!443701 (not (validKeyInArray!0 (select (arr!18873 a!3626) from!3004))))))

(declare-fun b!677283 () Bool)

(declare-fun res!443699 () Bool)

(assert (=> b!677283 (=> (not res!443699) (not e!386114))))

(assert (=> b!677283 (= res!443699 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677284 () Bool)

(declare-fun res!443707 () Bool)

(assert (=> b!677284 (=> (not res!443707) (not e!386114))))

(assert (=> b!677284 (= res!443707 e!386115)))

(declare-fun res!443704 () Bool)

(assert (=> b!677284 (=> res!443704 e!386115)))

(assert (=> b!677284 (= res!443704 e!386116)))

(declare-fun res!443696 () Bool)

(assert (=> b!677284 (=> (not res!443696) (not e!386116))))

(assert (=> b!677284 (= res!443696 (bvsgt from!3004 i!1382))))

(declare-fun b!677285 () Bool)

(declare-fun res!443692 () Bool)

(assert (=> b!677285 (=> (not res!443692) (not e!386114))))

(declare-fun noDuplicate!738 (List!12914) Bool)

(assert (=> b!677285 (= res!443692 (noDuplicate!738 acc!681))))

(assert (= (and start!60314 res!443709) b!677285))

(assert (= (and b!677285 res!443692) b!677274))

(assert (= (and b!677274 res!443703) b!677270))

(assert (= (and b!677270 res!443705) b!677284))

(assert (= (and b!677284 res!443696) b!677280))

(assert (= (and b!677284 (not res!443704)) b!677269))

(assert (= (and b!677269 res!443708) b!677266))

(assert (= (and b!677284 res!443707) b!677281))

(assert (= (and b!677281 res!443697) b!677267))

(assert (= (and b!677267 res!443711) b!677273))

(assert (= (and b!677273 res!443698) b!677265))

(assert (= (and b!677265 res!443702) b!677275))

(assert (= (and b!677275 res!443706) b!677278))

(assert (= (and b!677278 res!443694) b!677282))

(assert (= (and b!677282 res!443701) b!677276))

(assert (= (and b!677276 res!443693) b!677268))

(assert (= (and b!677268 res!443710) b!677272))

(assert (= (and b!677268 (not res!443691)) b!677271))

(assert (= (and b!677271 res!443700) b!677279))

(assert (= (and b!677268 res!443695) b!677283))

(assert (= (and b!677283 res!443699) b!677277))

(declare-fun m!643637 () Bool)

(assert (=> b!677280 m!643637))

(declare-fun m!643639 () Bool)

(assert (=> b!677282 m!643639))

(assert (=> b!677282 m!643639))

(declare-fun m!643641 () Bool)

(assert (=> b!677282 m!643641))

(declare-fun m!643643 () Bool)

(assert (=> b!677270 m!643643))

(assert (=> b!677272 m!643637))

(declare-fun m!643645 () Bool)

(assert (=> b!677277 m!643645))

(declare-fun m!643647 () Bool)

(assert (=> b!677277 m!643647))

(declare-fun m!643649 () Bool)

(assert (=> b!677277 m!643649))

(declare-fun m!643651 () Bool)

(assert (=> b!677283 m!643651))

(assert (=> b!677266 m!643637))

(assert (=> b!677279 m!643637))

(declare-fun m!643653 () Bool)

(assert (=> b!677281 m!643653))

(declare-fun m!643655 () Bool)

(assert (=> b!677275 m!643655))

(declare-fun m!643657 () Bool)

(assert (=> b!677274 m!643657))

(declare-fun m!643659 () Bool)

(assert (=> start!60314 m!643659))

(declare-fun m!643661 () Bool)

(assert (=> b!677285 m!643661))

(declare-fun m!643663 () Bool)

(assert (=> b!677265 m!643663))

(declare-fun m!643665 () Bool)

(assert (=> b!677267 m!643665))

(push 1)

(assert (not b!677265))

(assert (not b!677267))

(assert (not b!677281))

(assert (not b!677283))

(assert (not b!677277))

(assert (not b!677272))

(assert (not b!677266))

(assert (not b!677280))

(assert (not b!677270))

(assert (not start!60314))

(assert (not b!677285))

(assert (not b!677279))

(assert (not b!677282))

(assert (not b!677275))

(assert (not b!677274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

