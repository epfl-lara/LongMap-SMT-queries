; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60510 () Bool)

(assert start!60510)

(declare-fun b!680290 () Bool)

(declare-datatypes ((Unit!23858 0))(
  ( (Unit!23859) )
))
(declare-fun e!387474 () Unit!23858)

(declare-fun Unit!23860 () Unit!23858)

(assert (=> b!680290 (= e!387474 Unit!23860)))

(declare-fun lt!313059 () Unit!23858)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39491 0))(
  ( (array!39492 (arr!18935 (Array (_ BitVec 32) (_ BitVec 64))) (size!19299 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39491)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39491 (_ BitVec 64) (_ BitVec 32)) Unit!23858)

(assert (=> b!680290 (= lt!313059 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680290 false))

(declare-fun b!680291 () Bool)

(declare-fun e!387479 () Bool)

(declare-datatypes ((List!12976 0))(
  ( (Nil!12973) (Cons!12972 (h!14017 (_ BitVec 64)) (t!19204 List!12976)) )
))
(declare-fun acc!681 () List!12976)

(declare-fun contains!3553 (List!12976 (_ BitVec 64)) Bool)

(assert (=> b!680291 (= e!387479 (not (contains!3553 acc!681 k!2843)))))

(declare-fun b!680293 () Bool)

(declare-fun res!446569 () Bool)

(declare-fun e!387480 () Bool)

(assert (=> b!680293 (=> (not res!446569) (not e!387480))))

(assert (=> b!680293 (= res!446569 (not (contains!3553 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680294 () Bool)

(declare-fun res!446572 () Bool)

(assert (=> b!680294 (=> (not res!446572) (not e!387480))))

(declare-fun arrayNoDuplicates!0 (array!39491 (_ BitVec 32) List!12976) Bool)

(assert (=> b!680294 (= res!446572 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680295 () Bool)

(declare-fun res!446566 () Bool)

(assert (=> b!680295 (=> (not res!446566) (not e!387480))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680295 (= res!446566 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19299 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680296 () Bool)

(declare-fun e!387477 () Bool)

(assert (=> b!680296 (= e!387477 true)))

(declare-fun subseq!139 (List!12976 List!12976) Bool)

(assert (=> b!680296 (subseq!139 acc!681 acc!681)))

(declare-fun lt!313058 () Unit!23858)

(declare-fun lemmaListSubSeqRefl!0 (List!12976) Unit!23858)

(assert (=> b!680296 (= lt!313058 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680297 () Bool)

(declare-fun Unit!23861 () Unit!23858)

(assert (=> b!680297 (= e!387474 Unit!23861)))

(declare-fun b!680298 () Bool)

(assert (=> b!680298 (= e!387480 (not e!387477))))

(declare-fun res!446570 () Bool)

(assert (=> b!680298 (=> res!446570 e!387477)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680298 (= res!446570 (not (validKeyInArray!0 (select (arr!18935 a!3626) from!3004))))))

(declare-fun lt!313060 () Unit!23858)

(assert (=> b!680298 (= lt!313060 e!387474)))

(declare-fun c!77231 () Bool)

(declare-fun arrayContainsKey!0 (array!39491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680298 (= c!77231 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680298 (arrayContainsKey!0 (array!39492 (store (arr!18935 a!3626) i!1382 k!2843) (size!19299 a!3626)) k!2843 from!3004)))

(declare-fun b!680299 () Bool)

(declare-fun e!387476 () Bool)

(assert (=> b!680299 (= e!387476 (contains!3553 acc!681 k!2843))))

(declare-fun b!680300 () Bool)

(declare-fun res!446574 () Bool)

(assert (=> b!680300 (=> (not res!446574) (not e!387480))))

(assert (=> b!680300 (= res!446574 (validKeyInArray!0 k!2843))))

(declare-fun b!680301 () Bool)

(declare-fun res!446575 () Bool)

(assert (=> b!680301 (=> (not res!446575) (not e!387480))))

(assert (=> b!680301 (= res!446575 (not (contains!3553 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680302 () Bool)

(declare-fun res!446564 () Bool)

(assert (=> b!680302 (=> (not res!446564) (not e!387480))))

(assert (=> b!680302 (= res!446564 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680292 () Bool)

(declare-fun res!446567 () Bool)

(assert (=> b!680292 (=> (not res!446567) (not e!387480))))

(declare-fun noDuplicate!800 (List!12976) Bool)

(assert (=> b!680292 (= res!446567 (noDuplicate!800 acc!681))))

(declare-fun res!446571 () Bool)

(assert (=> start!60510 (=> (not res!446571) (not e!387480))))

(assert (=> start!60510 (= res!446571 (and (bvslt (size!19299 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19299 a!3626))))))

(assert (=> start!60510 e!387480))

(assert (=> start!60510 true))

(declare-fun array_inv!14731 (array!39491) Bool)

(assert (=> start!60510 (array_inv!14731 a!3626)))

(declare-fun b!680303 () Bool)

(declare-fun e!387478 () Bool)

(assert (=> b!680303 (= e!387478 e!387479)))

(declare-fun res!446576 () Bool)

(assert (=> b!680303 (=> (not res!446576) (not e!387479))))

(assert (=> b!680303 (= res!446576 (bvsle from!3004 i!1382))))

(declare-fun b!680304 () Bool)

(declare-fun res!446568 () Bool)

(assert (=> b!680304 (=> (not res!446568) (not e!387480))))

(assert (=> b!680304 (= res!446568 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12973))))

(declare-fun b!680305 () Bool)

(declare-fun res!446563 () Bool)

(assert (=> b!680305 (=> (not res!446563) (not e!387480))))

(assert (=> b!680305 (= res!446563 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19299 a!3626))))))

(declare-fun b!680306 () Bool)

(declare-fun res!446565 () Bool)

(assert (=> b!680306 (=> (not res!446565) (not e!387480))))

(assert (=> b!680306 (= res!446565 e!387478)))

(declare-fun res!446562 () Bool)

(assert (=> b!680306 (=> res!446562 e!387478)))

(assert (=> b!680306 (= res!446562 e!387476)))

(declare-fun res!446573 () Bool)

(assert (=> b!680306 (=> (not res!446573) (not e!387476))))

(assert (=> b!680306 (= res!446573 (bvsgt from!3004 i!1382))))

(assert (= (and start!60510 res!446571) b!680292))

(assert (= (and b!680292 res!446567) b!680301))

(assert (= (and b!680301 res!446575) b!680293))

(assert (= (and b!680293 res!446569) b!680306))

(assert (= (and b!680306 res!446573) b!680299))

(assert (= (and b!680306 (not res!446562)) b!680303))

(assert (= (and b!680303 res!446576) b!680291))

(assert (= (and b!680306 res!446565) b!680304))

(assert (= (and b!680304 res!446568) b!680294))

(assert (= (and b!680294 res!446572) b!680305))

(assert (= (and b!680305 res!446563) b!680300))

(assert (= (and b!680300 res!446574) b!680302))

(assert (= (and b!680302 res!446564) b!680295))

(assert (= (and b!680295 res!446566) b!680298))

(assert (= (and b!680298 c!77231) b!680290))

(assert (= (and b!680298 (not c!77231)) b!680297))

(assert (= (and b!680298 (not res!446570)) b!680296))

(declare-fun m!645391 () Bool)

(assert (=> b!680299 m!645391))

(declare-fun m!645393 () Bool)

(assert (=> b!680300 m!645393))

(declare-fun m!645395 () Bool)

(assert (=> b!680292 m!645395))

(declare-fun m!645397 () Bool)

(assert (=> b!680293 m!645397))

(assert (=> b!680291 m!645391))

(declare-fun m!645399 () Bool)

(assert (=> b!680296 m!645399))

(declare-fun m!645401 () Bool)

(assert (=> b!680296 m!645401))

(declare-fun m!645403 () Bool)

(assert (=> b!680294 m!645403))

(declare-fun m!645405 () Bool)

(assert (=> b!680301 m!645405))

(declare-fun m!645407 () Bool)

(assert (=> b!680298 m!645407))

(declare-fun m!645409 () Bool)

(assert (=> b!680298 m!645409))

(declare-fun m!645411 () Bool)

(assert (=> b!680298 m!645411))

(assert (=> b!680298 m!645407))

(declare-fun m!645413 () Bool)

(assert (=> b!680298 m!645413))

(declare-fun m!645415 () Bool)

(assert (=> b!680298 m!645415))

(declare-fun m!645417 () Bool)

(assert (=> b!680304 m!645417))

(declare-fun m!645419 () Bool)

(assert (=> b!680302 m!645419))

(declare-fun m!645421 () Bool)

(assert (=> start!60510 m!645421))

(declare-fun m!645423 () Bool)

(assert (=> b!680290 m!645423))

(push 1)

(assert (not b!680291))

(assert (not b!680296))

(assert (not b!680292))

(assert (not b!680304))

(assert (not b!680300))

(assert (not start!60510))

(assert (not b!680302))

(assert (not b!680301))

(assert (not b!680299))

(assert (not b!680293))

(assert (not b!680298))

(assert (not b!680294))

(assert (not b!680290))

(check-sat)

