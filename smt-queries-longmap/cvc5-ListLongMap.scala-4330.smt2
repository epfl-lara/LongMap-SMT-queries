; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60070 () Bool)

(assert start!60070)

(declare-fun b!667252 () Bool)

(declare-fun e!382013 () Bool)

(declare-fun e!382011 () Bool)

(assert (=> b!667252 (= e!382013 e!382011)))

(declare-fun res!434432 () Bool)

(assert (=> b!667252 (=> (not res!434432) (not e!382011))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667252 (= res!434432 (bvsle from!3004 i!1382))))

(declare-fun b!667253 () Bool)

(declare-datatypes ((Unit!23314 0))(
  ( (Unit!23315) )
))
(declare-fun e!382012 () Unit!23314)

(declare-fun Unit!23316 () Unit!23314)

(assert (=> b!667253 (= e!382012 Unit!23316)))

(declare-fun res!434435 () Bool)

(declare-fun e!382009 () Bool)

(assert (=> start!60070 (=> (not res!434435) (not e!382009))))

(declare-datatypes ((array!39055 0))(
  ( (array!39056 (arr!18717 (Array (_ BitVec 32) (_ BitVec 64))) (size!19081 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39055)

(assert (=> start!60070 (= res!434435 (and (bvslt (size!19081 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19081 a!3626))))))

(assert (=> start!60070 e!382009))

(assert (=> start!60070 true))

(declare-fun array_inv!14576 (array!39055) Bool)

(assert (=> start!60070 (array_inv!14576 a!3626)))

(declare-fun b!667254 () Bool)

(declare-fun res!434426 () Bool)

(assert (=> b!667254 (=> (not res!434426) (not e!382009))))

(assert (=> b!667254 (= res!434426 e!382013)))

(declare-fun res!434427 () Bool)

(assert (=> b!667254 (=> res!434427 e!382013)))

(declare-fun e!382010 () Bool)

(assert (=> b!667254 (= res!434427 e!382010)))

(declare-fun res!434428 () Bool)

(assert (=> b!667254 (=> (not res!434428) (not e!382010))))

(assert (=> b!667254 (= res!434428 (bvsgt from!3004 i!1382))))

(declare-fun b!667255 () Bool)

(declare-fun res!434433 () Bool)

(declare-fun e!382008 () Bool)

(assert (=> b!667255 (=> res!434433 e!382008)))

(declare-datatypes ((List!12665 0))(
  ( (Nil!12662) (Cons!12661 (h!13709 (_ BitVec 64)) (t!18885 List!12665)) )
))
(declare-fun acc!681 () List!12665)

(declare-fun lt!310759 () List!12665)

(declare-fun subseq!79 (List!12665 List!12665) Bool)

(assert (=> b!667255 (= res!434433 (not (subseq!79 acc!681 lt!310759)))))

(declare-fun b!667256 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3317 (List!12665 (_ BitVec 64)) Bool)

(assert (=> b!667256 (= e!382010 (contains!3317 acc!681 k!2843))))

(declare-fun b!667257 () Bool)

(declare-fun res!434424 () Bool)

(assert (=> b!667257 (=> (not res!434424) (not e!382009))))

(assert (=> b!667257 (= res!434424 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19081 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667258 () Bool)

(declare-fun Unit!23317 () Unit!23314)

(assert (=> b!667258 (= e!382012 Unit!23317)))

(declare-fun lt!310764 () Unit!23314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39055 (_ BitVec 64) (_ BitVec 32)) Unit!23314)

(assert (=> b!667258 (= lt!310764 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667258 false))

(declare-fun b!667259 () Bool)

(assert (=> b!667259 (= e!382011 (not (contains!3317 acc!681 k!2843)))))

(declare-fun b!667260 () Bool)

(declare-fun res!434423 () Bool)

(assert (=> b!667260 (=> (not res!434423) (not e!382009))))

(declare-fun arrayNoDuplicates!0 (array!39055 (_ BitVec 32) List!12665) Bool)

(assert (=> b!667260 (= res!434423 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667261 () Bool)

(declare-fun e!382014 () Unit!23314)

(declare-fun lt!310758 () Unit!23314)

(assert (=> b!667261 (= e!382014 lt!310758)))

(declare-fun lt!310765 () Unit!23314)

(declare-fun lemmaListSubSeqRefl!0 (List!12665) Unit!23314)

(assert (=> b!667261 (= lt!310765 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667261 (subseq!79 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39055 List!12665 List!12665 (_ BitVec 32)) Unit!23314)

(declare-fun $colon$colon!208 (List!12665 (_ BitVec 64)) List!12665)

(assert (=> b!667261 (= lt!310758 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!208 acc!681 (select (arr!18717 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667261 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667262 () Bool)

(declare-fun res!434421 () Bool)

(assert (=> b!667262 (=> res!434421 e!382008)))

(declare-fun noDuplicate!591 (List!12665) Bool)

(assert (=> b!667262 (= res!434421 (not (noDuplicate!591 lt!310759)))))

(declare-fun b!667263 () Bool)

(declare-fun res!434425 () Bool)

(assert (=> b!667263 (=> (not res!434425) (not e!382009))))

(assert (=> b!667263 (= res!434425 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12662))))

(declare-fun b!667264 () Bool)

(declare-fun res!434431 () Bool)

(assert (=> b!667264 (=> (not res!434431) (not e!382009))))

(assert (=> b!667264 (= res!434431 (noDuplicate!591 acc!681))))

(declare-fun b!667265 () Bool)

(declare-fun res!434420 () Bool)

(assert (=> b!667265 (=> (not res!434420) (not e!382009))))

(assert (=> b!667265 (= res!434420 (not (contains!3317 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667266 () Bool)

(declare-fun res!434419 () Bool)

(assert (=> b!667266 (=> (not res!434419) (not e!382009))))

(assert (=> b!667266 (= res!434419 (not (contains!3317 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667267 () Bool)

(declare-fun res!434436 () Bool)

(assert (=> b!667267 (=> (not res!434436) (not e!382009))))

(declare-fun arrayContainsKey!0 (array!39055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667267 (= res!434436 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667268 () Bool)

(declare-fun res!434437 () Bool)

(assert (=> b!667268 (=> res!434437 e!382008)))

(assert (=> b!667268 (= res!434437 (not (contains!3317 lt!310759 k!2843)))))

(declare-fun b!667269 () Bool)

(declare-fun res!434429 () Bool)

(assert (=> b!667269 (=> res!434429 e!382008)))

(declare-fun lt!310762 () Bool)

(assert (=> b!667269 (= res!434429 lt!310762)))

(declare-fun b!667270 () Bool)

(declare-fun res!434417 () Bool)

(assert (=> b!667270 (=> (not res!434417) (not e!382009))))

(assert (=> b!667270 (= res!434417 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19081 a!3626))))))

(declare-fun b!667271 () Bool)

(declare-fun res!434422 () Bool)

(assert (=> b!667271 (=> res!434422 e!382008)))

(assert (=> b!667271 (= res!434422 (contains!3317 lt!310759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667272 () Bool)

(declare-fun Unit!23318 () Unit!23314)

(assert (=> b!667272 (= e!382014 Unit!23318)))

(declare-fun b!667273 () Bool)

(assert (=> b!667273 (= e!382009 (not e!382008))))

(declare-fun res!434418 () Bool)

(assert (=> b!667273 (=> res!434418 e!382008)))

(assert (=> b!667273 (= res!434418 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!76 (List!12665 (_ BitVec 64)) List!12665)

(assert (=> b!667273 (= (-!76 lt!310759 k!2843) acc!681)))

(assert (=> b!667273 (= lt!310759 ($colon$colon!208 acc!681 k!2843))))

(declare-fun lt!310756 () Unit!23314)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12665) Unit!23314)

(assert (=> b!667273 (= lt!310756 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667273 (subseq!79 acc!681 acc!681)))

(declare-fun lt!310757 () Unit!23314)

(assert (=> b!667273 (= lt!310757 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667273 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310760 () Unit!23314)

(assert (=> b!667273 (= lt!310760 e!382014)))

(declare-fun c!76786 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667273 (= c!76786 (validKeyInArray!0 (select (arr!18717 a!3626) from!3004)))))

(declare-fun lt!310763 () Unit!23314)

(assert (=> b!667273 (= lt!310763 e!382012)))

(declare-fun c!76787 () Bool)

(assert (=> b!667273 (= c!76787 lt!310762)))

(assert (=> b!667273 (= lt!310762 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667273 (arrayContainsKey!0 (array!39056 (store (arr!18717 a!3626) i!1382 k!2843) (size!19081 a!3626)) k!2843 from!3004)))

(declare-fun b!667274 () Bool)

(assert (=> b!667274 (= e!382008 true)))

(declare-fun lt!310761 () Bool)

(assert (=> b!667274 (= lt!310761 (contains!3317 lt!310759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667275 () Bool)

(declare-fun res!434430 () Bool)

(assert (=> b!667275 (=> (not res!434430) (not e!382009))))

(assert (=> b!667275 (= res!434430 (validKeyInArray!0 k!2843))))

(declare-fun b!667276 () Bool)

(declare-fun res!434434 () Bool)

(assert (=> b!667276 (=> res!434434 e!382008)))

(assert (=> b!667276 (= res!434434 (contains!3317 acc!681 k!2843))))

(assert (= (and start!60070 res!434435) b!667264))

(assert (= (and b!667264 res!434431) b!667265))

(assert (= (and b!667265 res!434420) b!667266))

(assert (= (and b!667266 res!434419) b!667254))

(assert (= (and b!667254 res!434428) b!667256))

(assert (= (and b!667254 (not res!434427)) b!667252))

(assert (= (and b!667252 res!434432) b!667259))

(assert (= (and b!667254 res!434426) b!667263))

(assert (= (and b!667263 res!434425) b!667260))

(assert (= (and b!667260 res!434423) b!667270))

(assert (= (and b!667270 res!434417) b!667275))

(assert (= (and b!667275 res!434430) b!667267))

(assert (= (and b!667267 res!434436) b!667257))

(assert (= (and b!667257 res!434424) b!667273))

(assert (= (and b!667273 c!76787) b!667258))

(assert (= (and b!667273 (not c!76787)) b!667253))

(assert (= (and b!667273 c!76786) b!667261))

(assert (= (and b!667273 (not c!76786)) b!667272))

(assert (= (and b!667273 (not res!434418)) b!667262))

(assert (= (and b!667262 (not res!434421)) b!667269))

(assert (= (and b!667269 (not res!434429)) b!667276))

(assert (= (and b!667276 (not res!434434)) b!667255))

(assert (= (and b!667255 (not res!434433)) b!667268))

(assert (= (and b!667268 (not res!434437)) b!667271))

(assert (= (and b!667271 (not res!434422)) b!667274))

(declare-fun m!638375 () Bool)

(assert (=> b!667261 m!638375))

(declare-fun m!638377 () Bool)

(assert (=> b!667261 m!638377))

(declare-fun m!638379 () Bool)

(assert (=> b!667261 m!638379))

(declare-fun m!638381 () Bool)

(assert (=> b!667261 m!638381))

(assert (=> b!667261 m!638377))

(assert (=> b!667261 m!638379))

(declare-fun m!638383 () Bool)

(assert (=> b!667261 m!638383))

(declare-fun m!638385 () Bool)

(assert (=> b!667261 m!638385))

(declare-fun m!638387 () Bool)

(assert (=> b!667260 m!638387))

(declare-fun m!638389 () Bool)

(assert (=> b!667271 m!638389))

(declare-fun m!638391 () Bool)

(assert (=> b!667265 m!638391))

(declare-fun m!638393 () Bool)

(assert (=> start!60070 m!638393))

(declare-fun m!638395 () Bool)

(assert (=> b!667276 m!638395))

(declare-fun m!638397 () Bool)

(assert (=> b!667264 m!638397))

(declare-fun m!638399 () Bool)

(assert (=> b!667274 m!638399))

(declare-fun m!638401 () Bool)

(assert (=> b!667262 m!638401))

(declare-fun m!638403 () Bool)

(assert (=> b!667266 m!638403))

(declare-fun m!638405 () Bool)

(assert (=> b!667275 m!638405))

(assert (=> b!667256 m!638395))

(declare-fun m!638407 () Bool)

(assert (=> b!667267 m!638407))

(declare-fun m!638409 () Bool)

(assert (=> b!667263 m!638409))

(assert (=> b!667259 m!638395))

(declare-fun m!638411 () Bool)

(assert (=> b!667268 m!638411))

(declare-fun m!638413 () Bool)

(assert (=> b!667255 m!638413))

(declare-fun m!638415 () Bool)

(assert (=> b!667258 m!638415))

(assert (=> b!667273 m!638375))

(assert (=> b!667273 m!638377))

(declare-fun m!638417 () Bool)

(assert (=> b!667273 m!638417))

(declare-fun m!638419 () Bool)

(assert (=> b!667273 m!638419))

(declare-fun m!638421 () Bool)

(assert (=> b!667273 m!638421))

(assert (=> b!667273 m!638383))

(declare-fun m!638423 () Bool)

(assert (=> b!667273 m!638423))

(declare-fun m!638425 () Bool)

(assert (=> b!667273 m!638425))

(assert (=> b!667273 m!638377))

(declare-fun m!638427 () Bool)

(assert (=> b!667273 m!638427))

(declare-fun m!638429 () Bool)

(assert (=> b!667273 m!638429))

(assert (=> b!667273 m!638385))

(push 1)

(assert (not b!667259))

(assert (not b!667274))

(assert (not b!667255))

(assert (not b!667271))

(assert (not b!667261))

(assert (not b!667273))

(assert (not b!667275))

(assert (not start!60070))

(assert (not b!667268))

(assert (not b!667264))

(assert (not b!667256))

(assert (not b!667263))

(assert (not b!667265))

(assert (not b!667258))

(assert (not b!667276))

(assert (not b!667260))

(assert (not b!667267))

(assert (not b!667262))

(assert (not b!667266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

