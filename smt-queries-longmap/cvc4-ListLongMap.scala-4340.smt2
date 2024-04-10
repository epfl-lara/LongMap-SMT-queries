; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60072 () Bool)

(assert start!60072)

(declare-fun b!669278 () Bool)

(declare-datatypes ((Unit!23485 0))(
  ( (Unit!23486) )
))
(declare-fun e!382835 () Unit!23485)

(declare-fun Unit!23487 () Unit!23485)

(assert (=> b!669278 (= e!382835 Unit!23487)))

(declare-fun b!669279 () Bool)

(declare-fun res!436203 () Bool)

(declare-fun e!382827 () Bool)

(assert (=> b!669279 (=> (not res!436203) (not e!382827))))

(declare-datatypes ((List!12793 0))(
  ( (Nil!12790) (Cons!12789 (h!13834 (_ BitVec 64)) (t!19021 List!12793)) )
))
(declare-fun acc!681 () List!12793)

(declare-fun noDuplicate!617 (List!12793) Bool)

(assert (=> b!669279 (= res!436203 (noDuplicate!617 acc!681))))

(declare-fun b!669280 () Bool)

(declare-fun e!382828 () Bool)

(assert (=> b!669280 (= e!382827 (not e!382828))))

(declare-fun res!436202 () Bool)

(assert (=> b!669280 (=> res!436202 e!382828)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669280 (= res!436202 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39119 0))(
  ( (array!39120 (arr!18752 (Array (_ BitVec 32) (_ BitVec 64))) (size!19116 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39119)

(declare-fun lt!311560 () List!12793)

(declare-fun arrayNoDuplicates!0 (array!39119 (_ BitVec 32) List!12793) Bool)

(assert (=> b!669280 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311560)))

(declare-fun lt!311559 () Unit!23485)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39119 (_ BitVec 64) (_ BitVec 32) List!12793 List!12793) Unit!23485)

(assert (=> b!669280 (= lt!311559 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311560))))

(declare-fun -!107 (List!12793 (_ BitVec 64)) List!12793)

(assert (=> b!669280 (= (-!107 lt!311560 k!2843) acc!681)))

(declare-fun $colon$colon!241 (List!12793 (_ BitVec 64)) List!12793)

(assert (=> b!669280 (= lt!311560 ($colon$colon!241 acc!681 k!2843))))

(declare-fun lt!311563 () Unit!23485)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12793) Unit!23485)

(assert (=> b!669280 (= lt!311563 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!109 (List!12793 List!12793) Bool)

(assert (=> b!669280 (subseq!109 acc!681 acc!681)))

(declare-fun lt!311558 () Unit!23485)

(declare-fun lemmaListSubSeqRefl!0 (List!12793) Unit!23485)

(assert (=> b!669280 (= lt!311558 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669280 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311557 () Unit!23485)

(declare-fun e!382830 () Unit!23485)

(assert (=> b!669280 (= lt!311557 e!382830)))

(declare-fun c!76909 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669280 (= c!76909 (validKeyInArray!0 (select (arr!18752 a!3626) from!3004)))))

(declare-fun lt!311554 () Unit!23485)

(assert (=> b!669280 (= lt!311554 e!382835)))

(declare-fun c!76910 () Bool)

(declare-fun arrayContainsKey!0 (array!39119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669280 (= c!76910 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669280 (arrayContainsKey!0 (array!39120 (store (arr!18752 a!3626) i!1382 k!2843) (size!19116 a!3626)) k!2843 from!3004)))

(declare-fun b!669281 () Bool)

(declare-fun res!436208 () Bool)

(assert (=> b!669281 (=> (not res!436208) (not e!382827))))

(declare-fun e!382833 () Bool)

(assert (=> b!669281 (= res!436208 e!382833)))

(declare-fun res!436195 () Bool)

(assert (=> b!669281 (=> res!436195 e!382833)))

(declare-fun e!382836 () Bool)

(assert (=> b!669281 (= res!436195 e!382836)))

(declare-fun res!436206 () Bool)

(assert (=> b!669281 (=> (not res!436206) (not e!382836))))

(assert (=> b!669281 (= res!436206 (bvsgt from!3004 i!1382))))

(declare-fun b!669282 () Bool)

(assert (=> b!669282 (= e!382828 true)))

(declare-fun lt!311562 () Bool)

(declare-fun e!382834 () Bool)

(assert (=> b!669282 (= lt!311562 e!382834)))

(declare-fun res!436196 () Bool)

(assert (=> b!669282 (=> res!436196 e!382834)))

(declare-fun e!382826 () Bool)

(assert (=> b!669282 (= res!436196 e!382826)))

(declare-fun res!436194 () Bool)

(assert (=> b!669282 (=> (not res!436194) (not e!382826))))

(assert (=> b!669282 (= res!436194 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669283 () Bool)

(declare-fun e!382829 () Bool)

(declare-fun contains!3370 (List!12793 (_ BitVec 64)) Bool)

(assert (=> b!669283 (= e!382829 (not (contains!3370 lt!311560 k!2843)))))

(declare-fun b!669284 () Bool)

(declare-fun res!436200 () Bool)

(assert (=> b!669284 (=> (not res!436200) (not e!382827))))

(assert (=> b!669284 (= res!436200 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19116 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669285 () Bool)

(declare-fun res!436213 () Bool)

(assert (=> b!669285 (=> (not res!436213) (not e!382827))))

(assert (=> b!669285 (= res!436213 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669286 () Bool)

(declare-fun Unit!23488 () Unit!23485)

(assert (=> b!669286 (= e!382835 Unit!23488)))

(declare-fun lt!311555 () Unit!23485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39119 (_ BitVec 64) (_ BitVec 32)) Unit!23485)

(assert (=> b!669286 (= lt!311555 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669286 false))

(declare-fun b!669287 () Bool)

(declare-fun res!436205 () Bool)

(assert (=> b!669287 (=> (not res!436205) (not e!382827))))

(assert (=> b!669287 (= res!436205 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12790))))

(declare-fun b!669288 () Bool)

(declare-fun res!436214 () Bool)

(assert (=> b!669288 (=> (not res!436214) (not e!382827))))

(assert (=> b!669288 (= res!436214 (validKeyInArray!0 k!2843))))

(declare-fun b!669289 () Bool)

(declare-fun res!436210 () Bool)

(assert (=> b!669289 (=> res!436210 e!382828)))

(assert (=> b!669289 (= res!436210 (not (noDuplicate!617 lt!311560)))))

(declare-fun b!669290 () Bool)

(assert (=> b!669290 (= e!382836 (contains!3370 acc!681 k!2843))))

(declare-fun b!669291 () Bool)

(declare-fun res!436212 () Bool)

(assert (=> b!669291 (=> res!436212 e!382828)))

(assert (=> b!669291 (= res!436212 (contains!3370 lt!311560 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669292 () Bool)

(declare-fun lt!311561 () Unit!23485)

(assert (=> b!669292 (= e!382830 lt!311561)))

(declare-fun lt!311556 () Unit!23485)

(assert (=> b!669292 (= lt!311556 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669292 (subseq!109 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39119 List!12793 List!12793 (_ BitVec 32)) Unit!23485)

(assert (=> b!669292 (= lt!311561 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!241 acc!681 (select (arr!18752 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669292 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!436211 () Bool)

(assert (=> start!60072 (=> (not res!436211) (not e!382827))))

(assert (=> start!60072 (= res!436211 (and (bvslt (size!19116 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19116 a!3626))))))

(assert (=> start!60072 e!382827))

(assert (=> start!60072 true))

(declare-fun array_inv!14548 (array!39119) Bool)

(assert (=> start!60072 (array_inv!14548 a!3626)))

(declare-fun b!669293 () Bool)

(declare-fun Unit!23489 () Unit!23485)

(assert (=> b!669293 (= e!382830 Unit!23489)))

(declare-fun b!669294 () Bool)

(declare-fun res!436199 () Bool)

(assert (=> b!669294 (=> (not res!436199) (not e!382827))))

(assert (=> b!669294 (= res!436199 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669295 () Bool)

(declare-fun e!382832 () Bool)

(assert (=> b!669295 (= e!382833 e!382832)))

(declare-fun res!436198 () Bool)

(assert (=> b!669295 (=> (not res!436198) (not e!382832))))

(assert (=> b!669295 (= res!436198 (bvsle from!3004 i!1382))))

(declare-fun b!669296 () Bool)

(assert (=> b!669296 (= e!382834 e!382829)))

(declare-fun res!436204 () Bool)

(assert (=> b!669296 (=> (not res!436204) (not e!382829))))

(assert (=> b!669296 (= res!436204 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669297 () Bool)

(declare-fun res!436201 () Bool)

(assert (=> b!669297 (=> (not res!436201) (not e!382827))))

(assert (=> b!669297 (= res!436201 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19116 a!3626))))))

(declare-fun b!669298 () Bool)

(declare-fun res!436207 () Bool)

(assert (=> b!669298 (=> (not res!436207) (not e!382827))))

(assert (=> b!669298 (= res!436207 (not (contains!3370 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669299 () Bool)

(assert (=> b!669299 (= e!382826 (contains!3370 lt!311560 k!2843))))

(declare-fun b!669300 () Bool)

(declare-fun res!436209 () Bool)

(assert (=> b!669300 (=> (not res!436209) (not e!382827))))

(assert (=> b!669300 (= res!436209 (not (contains!3370 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669301 () Bool)

(declare-fun res!436197 () Bool)

(assert (=> b!669301 (=> res!436197 e!382828)))

(assert (=> b!669301 (= res!436197 (contains!3370 lt!311560 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669302 () Bool)

(assert (=> b!669302 (= e!382832 (not (contains!3370 acc!681 k!2843)))))

(assert (= (and start!60072 res!436211) b!669279))

(assert (= (and b!669279 res!436203) b!669300))

(assert (= (and b!669300 res!436209) b!669298))

(assert (= (and b!669298 res!436207) b!669281))

(assert (= (and b!669281 res!436206) b!669290))

(assert (= (and b!669281 (not res!436195)) b!669295))

(assert (= (and b!669295 res!436198) b!669302))

(assert (= (and b!669281 res!436208) b!669287))

(assert (= (and b!669287 res!436205) b!669285))

(assert (= (and b!669285 res!436213) b!669297))

(assert (= (and b!669297 res!436201) b!669288))

(assert (= (and b!669288 res!436214) b!669294))

(assert (= (and b!669294 res!436199) b!669284))

(assert (= (and b!669284 res!436200) b!669280))

(assert (= (and b!669280 c!76910) b!669286))

(assert (= (and b!669280 (not c!76910)) b!669278))

(assert (= (and b!669280 c!76909) b!669292))

(assert (= (and b!669280 (not c!76909)) b!669293))

(assert (= (and b!669280 (not res!436202)) b!669289))

(assert (= (and b!669289 (not res!436210)) b!669301))

(assert (= (and b!669301 (not res!436197)) b!669291))

(assert (= (and b!669291 (not res!436212)) b!669282))

(assert (= (and b!669282 res!436194) b!669299))

(assert (= (and b!669282 (not res!436196)) b!669296))

(assert (= (and b!669296 res!436204) b!669283))

(declare-fun m!639409 () Bool)

(assert (=> b!669289 m!639409))

(declare-fun m!639411 () Bool)

(assert (=> b!669301 m!639411))

(declare-fun m!639413 () Bool)

(assert (=> b!669302 m!639413))

(declare-fun m!639415 () Bool)

(assert (=> b!669292 m!639415))

(declare-fun m!639417 () Bool)

(assert (=> b!669292 m!639417))

(declare-fun m!639419 () Bool)

(assert (=> b!669292 m!639419))

(declare-fun m!639421 () Bool)

(assert (=> b!669292 m!639421))

(assert (=> b!669292 m!639417))

(assert (=> b!669292 m!639419))

(declare-fun m!639423 () Bool)

(assert (=> b!669292 m!639423))

(declare-fun m!639425 () Bool)

(assert (=> b!669292 m!639425))

(declare-fun m!639427 () Bool)

(assert (=> b!669279 m!639427))

(declare-fun m!639429 () Bool)

(assert (=> b!669287 m!639429))

(declare-fun m!639431 () Bool)

(assert (=> b!669280 m!639431))

(declare-fun m!639433 () Bool)

(assert (=> b!669280 m!639433))

(assert (=> b!669280 m!639415))

(assert (=> b!669280 m!639417))

(declare-fun m!639435 () Bool)

(assert (=> b!669280 m!639435))

(assert (=> b!669280 m!639423))

(declare-fun m!639437 () Bool)

(assert (=> b!669280 m!639437))

(declare-fun m!639439 () Bool)

(assert (=> b!669280 m!639439))

(assert (=> b!669280 m!639417))

(declare-fun m!639441 () Bool)

(assert (=> b!669280 m!639441))

(declare-fun m!639443 () Bool)

(assert (=> b!669280 m!639443))

(declare-fun m!639445 () Bool)

(assert (=> b!669280 m!639445))

(declare-fun m!639447 () Bool)

(assert (=> b!669280 m!639447))

(assert (=> b!669280 m!639425))

(declare-fun m!639449 () Bool)

(assert (=> b!669288 m!639449))

(declare-fun m!639451 () Bool)

(assert (=> b!669291 m!639451))

(declare-fun m!639453 () Bool)

(assert (=> b!669294 m!639453))

(declare-fun m!639455 () Bool)

(assert (=> start!60072 m!639455))

(assert (=> b!669290 m!639413))

(declare-fun m!639457 () Bool)

(assert (=> b!669298 m!639457))

(declare-fun m!639459 () Bool)

(assert (=> b!669285 m!639459))

(declare-fun m!639461 () Bool)

(assert (=> b!669283 m!639461))

(declare-fun m!639463 () Bool)

(assert (=> b!669300 m!639463))

(assert (=> b!669299 m!639461))

(declare-fun m!639465 () Bool)

(assert (=> b!669286 m!639465))

(push 1)

(assert (not b!669291))

(assert (not b!669294))

(assert (not b!669283))

(assert (not b!669298))

(assert (not start!60072))

(assert (not b!669285))

(assert (not b!669300))

(assert (not b!669289))

