; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59958 () Bool)

(assert start!59958)

(declare-fun b!663388 () Bool)

(declare-fun res!431228 () Bool)

(declare-fun e!380708 () Bool)

(assert (=> b!663388 (=> (not res!431228) (not e!380708))))

(declare-datatypes ((List!12609 0))(
  ( (Nil!12606) (Cons!12605 (h!13653 (_ BitVec 64)) (t!18829 List!12609)) )
))
(declare-fun acc!681 () List!12609)

(declare-fun contains!3261 (List!12609 (_ BitVec 64)) Bool)

(assert (=> b!663388 (= res!431228 (not (contains!3261 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663389 () Bool)

(declare-datatypes ((Unit!23037 0))(
  ( (Unit!23038) )
))
(declare-fun e!380710 () Unit!23037)

(declare-fun Unit!23039 () Unit!23037)

(assert (=> b!663389 (= e!380710 Unit!23039)))

(declare-fun b!663390 () Bool)

(declare-fun Unit!23040 () Unit!23037)

(assert (=> b!663390 (= e!380710 Unit!23040)))

(declare-fun lt!309312 () Unit!23037)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!38943 0))(
  ( (array!38944 (arr!18661 (Array (_ BitVec 32) (_ BitVec 64))) (size!19025 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38943)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38943 (_ BitVec 64) (_ BitVec 32)) Unit!23037)

(assert (=> b!663390 (= lt!309312 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663390 false))

(declare-fun b!663391 () Bool)

(declare-fun res!431220 () Bool)

(assert (=> b!663391 (=> (not res!431220) (not e!380708))))

(declare-fun noDuplicate!535 (List!12609) Bool)

(assert (=> b!663391 (= res!431220 (noDuplicate!535 acc!681))))

(declare-fun b!663392 () Bool)

(declare-fun res!431227 () Bool)

(assert (=> b!663392 (=> (not res!431227) (not e!380708))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663392 (= res!431227 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19025 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663393 () Bool)

(declare-fun res!431223 () Bool)

(assert (=> b!663393 (=> (not res!431223) (not e!380708))))

(assert (=> b!663393 (= res!431223 (not (contains!3261 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663395 () Bool)

(declare-fun res!431229 () Bool)

(assert (=> b!663395 (=> (not res!431229) (not e!380708))))

(declare-fun arrayNoDuplicates!0 (array!38943 (_ BitVec 32) List!12609) Bool)

(assert (=> b!663395 (= res!431229 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663396 () Bool)

(declare-fun e!380715 () Bool)

(assert (=> b!663396 (= e!380715 (not (contains!3261 acc!681 k0!2843)))))

(declare-fun b!663397 () Bool)

(declare-fun res!431230 () Bool)

(assert (=> b!663397 (=> (not res!431230) (not e!380708))))

(declare-fun arrayContainsKey!0 (array!38943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663397 (= res!431230 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663398 () Bool)

(declare-fun res!431216 () Bool)

(declare-fun e!380709 () Bool)

(assert (=> b!663398 (=> res!431216 e!380709)))

(declare-fun lt!309311 () List!12609)

(declare-fun subseq!23 (List!12609 List!12609) Bool)

(assert (=> b!663398 (= res!431216 (not (subseq!23 acc!681 lt!309311)))))

(declare-fun b!663399 () Bool)

(assert (=> b!663399 (= e!380709 true)))

(declare-fun lt!309314 () Bool)

(assert (=> b!663399 (= lt!309314 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309311))))

(declare-fun lt!309316 () Unit!23037)

(declare-fun noDuplicateSubseq!23 (List!12609 List!12609) Unit!23037)

(assert (=> b!663399 (= lt!309316 (noDuplicateSubseq!23 acc!681 lt!309311))))

(declare-fun b!663400 () Bool)

(declare-fun e!380711 () Bool)

(assert (=> b!663400 (= e!380711 e!380715)))

(declare-fun res!431217 () Bool)

(assert (=> b!663400 (=> (not res!431217) (not e!380715))))

(assert (=> b!663400 (= res!431217 (bvsle from!3004 i!1382))))

(declare-fun b!663401 () Bool)

(declare-fun res!431215 () Bool)

(assert (=> b!663401 (=> (not res!431215) (not e!380708))))

(assert (=> b!663401 (= res!431215 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19025 a!3626))))))

(declare-fun b!663402 () Bool)

(declare-fun res!431211 () Bool)

(assert (=> b!663402 (=> (not res!431211) (not e!380708))))

(assert (=> b!663402 (= res!431211 e!380711)))

(declare-fun res!431221 () Bool)

(assert (=> b!663402 (=> res!431221 e!380711)))

(declare-fun e!380714 () Bool)

(assert (=> b!663402 (= res!431221 e!380714)))

(declare-fun res!431212 () Bool)

(assert (=> b!663402 (=> (not res!431212) (not e!380714))))

(assert (=> b!663402 (= res!431212 (bvsgt from!3004 i!1382))))

(declare-fun b!663403 () Bool)

(declare-fun res!431213 () Bool)

(assert (=> b!663403 (=> res!431213 e!380709)))

(assert (=> b!663403 (= res!431213 (not (noDuplicate!535 lt!309311)))))

(declare-fun res!431218 () Bool)

(assert (=> start!59958 (=> (not res!431218) (not e!380708))))

(assert (=> start!59958 (= res!431218 (and (bvslt (size!19025 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19025 a!3626))))))

(assert (=> start!59958 e!380708))

(assert (=> start!59958 true))

(declare-fun array_inv!14520 (array!38943) Bool)

(assert (=> start!59958 (array_inv!14520 a!3626)))

(declare-fun b!663394 () Bool)

(declare-fun res!431225 () Bool)

(assert (=> b!663394 (=> (not res!431225) (not e!380708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663394 (= res!431225 (validKeyInArray!0 k0!2843))))

(declare-fun b!663404 () Bool)

(declare-fun e!380713 () Bool)

(assert (=> b!663404 (= e!380713 e!380709)))

(declare-fun res!431224 () Bool)

(assert (=> b!663404 (=> res!431224 e!380709)))

(assert (=> b!663404 (= res!431224 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!152 (List!12609 (_ BitVec 64)) List!12609)

(assert (=> b!663404 (= lt!309311 ($colon$colon!152 acc!681 (select (arr!18661 a!3626) from!3004)))))

(assert (=> b!663404 (subseq!23 acc!681 acc!681)))

(declare-fun lt!309315 () Unit!23037)

(declare-fun lemmaListSubSeqRefl!0 (List!12609) Unit!23037)

(assert (=> b!663404 (= lt!309315 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!663405 () Bool)

(declare-fun res!431226 () Bool)

(assert (=> b!663405 (=> res!431226 e!380709)))

(assert (=> b!663405 (= res!431226 (contains!3261 lt!309311 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663406 () Bool)

(declare-fun res!431219 () Bool)

(assert (=> b!663406 (=> res!431219 e!380709)))

(assert (=> b!663406 (= res!431219 (contains!3261 lt!309311 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663407 () Bool)

(declare-fun res!431214 () Bool)

(assert (=> b!663407 (=> (not res!431214) (not e!380708))))

(assert (=> b!663407 (= res!431214 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12606))))

(declare-fun b!663408 () Bool)

(assert (=> b!663408 (= e!380714 (contains!3261 acc!681 k0!2843))))

(declare-fun b!663409 () Bool)

(assert (=> b!663409 (= e!380708 (not e!380713))))

(declare-fun res!431222 () Bool)

(assert (=> b!663409 (=> res!431222 e!380713)))

(assert (=> b!663409 (= res!431222 (not (validKeyInArray!0 (select (arr!18661 a!3626) from!3004))))))

(declare-fun lt!309313 () Unit!23037)

(assert (=> b!663409 (= lt!309313 e!380710)))

(declare-fun c!76457 () Bool)

(assert (=> b!663409 (= c!76457 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663409 (arrayContainsKey!0 (array!38944 (store (arr!18661 a!3626) i!1382 k0!2843) (size!19025 a!3626)) k0!2843 from!3004)))

(assert (= (and start!59958 res!431218) b!663391))

(assert (= (and b!663391 res!431220) b!663393))

(assert (= (and b!663393 res!431223) b!663388))

(assert (= (and b!663388 res!431228) b!663402))

(assert (= (and b!663402 res!431212) b!663408))

(assert (= (and b!663402 (not res!431221)) b!663400))

(assert (= (and b!663400 res!431217) b!663396))

(assert (= (and b!663402 res!431211) b!663407))

(assert (= (and b!663407 res!431214) b!663395))

(assert (= (and b!663395 res!431229) b!663401))

(assert (= (and b!663401 res!431215) b!663394))

(assert (= (and b!663394 res!431225) b!663397))

(assert (= (and b!663397 res!431230) b!663392))

(assert (= (and b!663392 res!431227) b!663409))

(assert (= (and b!663409 c!76457) b!663390))

(assert (= (and b!663409 (not c!76457)) b!663389))

(assert (= (and b!663409 (not res!431222)) b!663404))

(assert (= (and b!663404 (not res!431224)) b!663403))

(assert (= (and b!663403 (not res!431213)) b!663405))

(assert (= (and b!663405 (not res!431226)) b!663406))

(assert (= (and b!663406 (not res!431219)) b!663398))

(assert (= (and b!663398 (not res!431216)) b!663399))

(declare-fun m!635503 () Bool)

(assert (=> b!663404 m!635503))

(assert (=> b!663404 m!635503))

(declare-fun m!635505 () Bool)

(assert (=> b!663404 m!635505))

(declare-fun m!635507 () Bool)

(assert (=> b!663404 m!635507))

(declare-fun m!635509 () Bool)

(assert (=> b!663404 m!635509))

(declare-fun m!635511 () Bool)

(assert (=> b!663408 m!635511))

(declare-fun m!635513 () Bool)

(assert (=> start!59958 m!635513))

(assert (=> b!663396 m!635511))

(declare-fun m!635515 () Bool)

(assert (=> b!663394 m!635515))

(declare-fun m!635517 () Bool)

(assert (=> b!663391 m!635517))

(declare-fun m!635519 () Bool)

(assert (=> b!663405 m!635519))

(declare-fun m!635521 () Bool)

(assert (=> b!663403 m!635521))

(declare-fun m!635523 () Bool)

(assert (=> b!663398 m!635523))

(declare-fun m!635525 () Bool)

(assert (=> b!663397 m!635525))

(assert (=> b!663409 m!635503))

(declare-fun m!635527 () Bool)

(assert (=> b!663409 m!635527))

(declare-fun m!635529 () Bool)

(assert (=> b!663409 m!635529))

(assert (=> b!663409 m!635503))

(declare-fun m!635531 () Bool)

(assert (=> b!663409 m!635531))

(declare-fun m!635533 () Bool)

(assert (=> b!663409 m!635533))

(declare-fun m!635535 () Bool)

(assert (=> b!663388 m!635535))

(declare-fun m!635537 () Bool)

(assert (=> b!663406 m!635537))

(declare-fun m!635539 () Bool)

(assert (=> b!663395 m!635539))

(declare-fun m!635541 () Bool)

(assert (=> b!663390 m!635541))

(declare-fun m!635543 () Bool)

(assert (=> b!663407 m!635543))

(declare-fun m!635545 () Bool)

(assert (=> b!663399 m!635545))

(declare-fun m!635547 () Bool)

(assert (=> b!663399 m!635547))

(declare-fun m!635549 () Bool)

(assert (=> b!663393 m!635549))

(check-sat (not b!663403) (not b!663409) (not b!663405) (not b!663393) (not b!663404) (not start!59958) (not b!663396) (not b!663406) (not b!663395) (not b!663397) (not b!663407) (not b!663399) (not b!663408) (not b!663391) (not b!663390) (not b!663398) (not b!663388) (not b!663394))
(check-sat)
