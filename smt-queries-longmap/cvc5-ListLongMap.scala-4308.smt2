; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59876 () Bool)

(assert start!59876)

(declare-fun b!662372 () Bool)

(declare-fun e!380282 () Bool)

(assert (=> b!662372 (= e!380282 true)))

(declare-datatypes ((List!12695 0))(
  ( (Nil!12692) (Cons!12691 (h!13736 (_ BitVec 64)) (t!18923 List!12695)) )
))
(declare-fun lt!308993 () List!12695)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!308994 () Bool)

(declare-datatypes ((array!38923 0))(
  ( (array!38924 (arr!18654 (Array (_ BitVec 32) (_ BitVec 64))) (size!19018 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38923)

(declare-fun arrayNoDuplicates!0 (array!38923 (_ BitVec 32) List!12695) Bool)

(assert (=> b!662372 (= lt!308994 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308993))))

(declare-datatypes ((Unit!23010 0))(
  ( (Unit!23011) )
))
(declare-fun lt!308997 () Unit!23010)

(declare-fun acc!681 () List!12695)

(declare-fun noDuplicateSubseq!11 (List!12695 List!12695) Unit!23010)

(assert (=> b!662372 (= lt!308997 (noDuplicateSubseq!11 acc!681 lt!308993))))

(declare-fun b!662373 () Bool)

(declare-fun res!430395 () Bool)

(assert (=> b!662373 (=> res!430395 e!380282)))

(declare-fun noDuplicate!519 (List!12695) Bool)

(assert (=> b!662373 (= res!430395 (not (noDuplicate!519 lt!308993)))))

(declare-fun b!662374 () Bool)

(declare-fun e!380281 () Unit!23010)

(declare-fun Unit!23012 () Unit!23010)

(assert (=> b!662374 (= e!380281 Unit!23012)))

(declare-fun lt!308996 () Unit!23010)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38923 (_ BitVec 64) (_ BitVec 32)) Unit!23010)

(assert (=> b!662374 (= lt!308996 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662374 false))

(declare-fun b!662375 () Bool)

(declare-fun e!380284 () Bool)

(assert (=> b!662375 (= e!380284 e!380282)))

(declare-fun res!430394 () Bool)

(assert (=> b!662375 (=> res!430394 e!380282)))

(assert (=> b!662375 (= res!430394 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!143 (List!12695 (_ BitVec 64)) List!12695)

(assert (=> b!662375 (= lt!308993 ($colon$colon!143 acc!681 (select (arr!18654 a!3626) from!3004)))))

(declare-fun subseq!11 (List!12695 List!12695) Bool)

(assert (=> b!662375 (subseq!11 acc!681 acc!681)))

(declare-fun lt!308998 () Unit!23010)

(declare-fun lemmaListSubSeqRefl!0 (List!12695) Unit!23010)

(assert (=> b!662375 (= lt!308998 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662376 () Bool)

(declare-fun res!430389 () Bool)

(declare-fun e!380285 () Bool)

(assert (=> b!662376 (=> (not res!430389) (not e!380285))))

(assert (=> b!662376 (= res!430389 (noDuplicate!519 acc!681))))

(declare-fun b!662377 () Bool)

(declare-fun res!430397 () Bool)

(assert (=> b!662377 (=> (not res!430397) (not e!380285))))

(declare-fun contains!3272 (List!12695 (_ BitVec 64)) Bool)

(assert (=> b!662377 (= res!430397 (not (contains!3272 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662378 () Bool)

(declare-fun res!430390 () Bool)

(assert (=> b!662378 (=> (not res!430390) (not e!380285))))

(declare-fun arrayContainsKey!0 (array!38923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662378 (= res!430390 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!430396 () Bool)

(assert (=> start!59876 (=> (not res!430396) (not e!380285))))

(assert (=> start!59876 (= res!430396 (and (bvslt (size!19018 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19018 a!3626))))))

(assert (=> start!59876 e!380285))

(assert (=> start!59876 true))

(declare-fun array_inv!14450 (array!38923) Bool)

(assert (=> start!59876 (array_inv!14450 a!3626)))

(declare-fun b!662379 () Bool)

(assert (=> b!662379 (= e!380285 (not e!380284))))

(declare-fun res!430380 () Bool)

(assert (=> b!662379 (=> res!430380 e!380284)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662379 (= res!430380 (not (validKeyInArray!0 (select (arr!18654 a!3626) from!3004))))))

(declare-fun lt!308995 () Unit!23010)

(assert (=> b!662379 (= lt!308995 e!380281)))

(declare-fun c!76364 () Bool)

(assert (=> b!662379 (= c!76364 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662379 (arrayContainsKey!0 (array!38924 (store (arr!18654 a!3626) i!1382 k!2843) (size!19018 a!3626)) k!2843 from!3004)))

(declare-fun b!662380 () Bool)

(declare-fun res!430393 () Bool)

(assert (=> b!662380 (=> (not res!430393) (not e!380285))))

(assert (=> b!662380 (= res!430393 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19018 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662381 () Bool)

(declare-fun res!430382 () Bool)

(assert (=> b!662381 (=> (not res!430382) (not e!380285))))

(assert (=> b!662381 (= res!430382 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12692))))

(declare-fun b!662382 () Bool)

(declare-fun res!430392 () Bool)

(assert (=> b!662382 (=> (not res!430392) (not e!380285))))

(assert (=> b!662382 (= res!430392 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662383 () Bool)

(declare-fun e!380286 () Bool)

(declare-fun e!380283 () Bool)

(assert (=> b!662383 (= e!380286 e!380283)))

(declare-fun res!430387 () Bool)

(assert (=> b!662383 (=> (not res!430387) (not e!380283))))

(assert (=> b!662383 (= res!430387 (bvsle from!3004 i!1382))))

(declare-fun b!662384 () Bool)

(declare-fun e!380279 () Bool)

(assert (=> b!662384 (= e!380279 (contains!3272 acc!681 k!2843))))

(declare-fun b!662385 () Bool)

(declare-fun res!430386 () Bool)

(assert (=> b!662385 (=> res!430386 e!380282)))

(assert (=> b!662385 (= res!430386 (contains!3272 lt!308993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662386 () Bool)

(declare-fun res!430379 () Bool)

(assert (=> b!662386 (=> (not res!430379) (not e!380285))))

(assert (=> b!662386 (= res!430379 (validKeyInArray!0 k!2843))))

(declare-fun b!662387 () Bool)

(declare-fun res!430391 () Bool)

(assert (=> b!662387 (=> res!430391 e!380282)))

(assert (=> b!662387 (= res!430391 (contains!3272 lt!308993 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662388 () Bool)

(declare-fun Unit!23013 () Unit!23010)

(assert (=> b!662388 (= e!380281 Unit!23013)))

(declare-fun b!662389 () Bool)

(declare-fun res!430381 () Bool)

(assert (=> b!662389 (=> (not res!430381) (not e!380285))))

(assert (=> b!662389 (= res!430381 (not (contains!3272 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662390 () Bool)

(declare-fun res!430378 () Bool)

(assert (=> b!662390 (=> (not res!430378) (not e!380285))))

(assert (=> b!662390 (= res!430378 e!380286)))

(declare-fun res!430388 () Bool)

(assert (=> b!662390 (=> res!430388 e!380286)))

(assert (=> b!662390 (= res!430388 e!380279)))

(declare-fun res!430384 () Bool)

(assert (=> b!662390 (=> (not res!430384) (not e!380279))))

(assert (=> b!662390 (= res!430384 (bvsgt from!3004 i!1382))))

(declare-fun b!662391 () Bool)

(declare-fun res!430383 () Bool)

(assert (=> b!662391 (=> res!430383 e!380282)))

(assert (=> b!662391 (= res!430383 (not (subseq!11 acc!681 lt!308993)))))

(declare-fun b!662392 () Bool)

(declare-fun res!430385 () Bool)

(assert (=> b!662392 (=> (not res!430385) (not e!380285))))

(assert (=> b!662392 (= res!430385 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19018 a!3626))))))

(declare-fun b!662393 () Bool)

(assert (=> b!662393 (= e!380283 (not (contains!3272 acc!681 k!2843)))))

(assert (= (and start!59876 res!430396) b!662376))

(assert (= (and b!662376 res!430389) b!662377))

(assert (= (and b!662377 res!430397) b!662389))

(assert (= (and b!662389 res!430381) b!662390))

(assert (= (and b!662390 res!430384) b!662384))

(assert (= (and b!662390 (not res!430388)) b!662383))

(assert (= (and b!662383 res!430387) b!662393))

(assert (= (and b!662390 res!430378) b!662381))

(assert (= (and b!662381 res!430382) b!662382))

(assert (= (and b!662382 res!430392) b!662392))

(assert (= (and b!662392 res!430385) b!662386))

(assert (= (and b!662386 res!430379) b!662378))

(assert (= (and b!662378 res!430390) b!662380))

(assert (= (and b!662380 res!430393) b!662379))

(assert (= (and b!662379 c!76364) b!662374))

(assert (= (and b!662379 (not c!76364)) b!662388))

(assert (= (and b!662379 (not res!430380)) b!662375))

(assert (= (and b!662375 (not res!430394)) b!662373))

(assert (= (and b!662373 (not res!430395)) b!662385))

(assert (= (and b!662385 (not res!430386)) b!662387))

(assert (= (and b!662387 (not res!430391)) b!662391))

(assert (= (and b!662391 (not res!430383)) b!662372))

(declare-fun m!634229 () Bool)

(assert (=> start!59876 m!634229))

(declare-fun m!634231 () Bool)

(assert (=> b!662386 m!634231))

(declare-fun m!634233 () Bool)

(assert (=> b!662378 m!634233))

(declare-fun m!634235 () Bool)

(assert (=> b!662393 m!634235))

(assert (=> b!662384 m!634235))

(declare-fun m!634237 () Bool)

(assert (=> b!662379 m!634237))

(declare-fun m!634239 () Bool)

(assert (=> b!662379 m!634239))

(declare-fun m!634241 () Bool)

(assert (=> b!662379 m!634241))

(assert (=> b!662379 m!634237))

(declare-fun m!634243 () Bool)

(assert (=> b!662379 m!634243))

(declare-fun m!634245 () Bool)

(assert (=> b!662379 m!634245))

(assert (=> b!662375 m!634237))

(assert (=> b!662375 m!634237))

(declare-fun m!634247 () Bool)

(assert (=> b!662375 m!634247))

(declare-fun m!634249 () Bool)

(assert (=> b!662375 m!634249))

(declare-fun m!634251 () Bool)

(assert (=> b!662375 m!634251))

(declare-fun m!634253 () Bool)

(assert (=> b!662373 m!634253))

(declare-fun m!634255 () Bool)

(assert (=> b!662389 m!634255))

(declare-fun m!634257 () Bool)

(assert (=> b!662382 m!634257))

(declare-fun m!634259 () Bool)

(assert (=> b!662372 m!634259))

(declare-fun m!634261 () Bool)

(assert (=> b!662372 m!634261))

(declare-fun m!634263 () Bool)

(assert (=> b!662381 m!634263))

(declare-fun m!634265 () Bool)

(assert (=> b!662391 m!634265))

(declare-fun m!634267 () Bool)

(assert (=> b!662377 m!634267))

(declare-fun m!634269 () Bool)

(assert (=> b!662376 m!634269))

(declare-fun m!634271 () Bool)

(assert (=> b!662385 m!634271))

(declare-fun m!634273 () Bool)

(assert (=> b!662374 m!634273))

(declare-fun m!634275 () Bool)

(assert (=> b!662387 m!634275))

(push 1)

