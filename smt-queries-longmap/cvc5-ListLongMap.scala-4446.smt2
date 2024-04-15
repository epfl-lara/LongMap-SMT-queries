; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61770 () Bool)

(assert start!61770)

(declare-fun res!455799 () Bool)

(declare-fun e!393370 () Bool)

(assert (=> start!61770 (=> (not res!455799) (not e!393370))))

(declare-datatypes ((array!39802 0))(
  ( (array!39803 (arr!19069 (Array (_ BitVec 32) (_ BitVec 64))) (size!19451 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39802)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61770 (= res!455799 (and (bvslt (size!19451 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19451 a!3626))))))

(assert (=> start!61770 e!393370))

(assert (=> start!61770 true))

(declare-fun array_inv!14952 (array!39802) Bool)

(assert (=> start!61770 (array_inv!14952 a!3626)))

(declare-fun b!691283 () Bool)

(declare-fun e!393369 () Bool)

(declare-datatypes ((List!13149 0))(
  ( (Nil!13146) (Cons!13145 (h!14190 (_ BitVec 64)) (t!19407 List!13149)) )
))
(declare-fun acc!681 () List!13149)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3671 (List!13149 (_ BitVec 64)) Bool)

(assert (=> b!691283 (= e!393369 (not (contains!3671 acc!681 k!2843)))))

(declare-fun b!691284 () Bool)

(declare-fun res!455798 () Bool)

(assert (=> b!691284 (=> (not res!455798) (not e!393370))))

(declare-fun arrayContainsKey!0 (array!39802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691284 (= res!455798 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691285 () Bool)

(declare-fun res!455793 () Bool)

(assert (=> b!691285 (=> (not res!455793) (not e!393370))))

(assert (=> b!691285 (= res!455793 (not (contains!3671 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691286 () Bool)

(declare-fun res!455797 () Bool)

(assert (=> b!691286 (=> (not res!455797) (not e!393370))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691286 (= res!455797 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19451 a!3626))))))

(declare-fun b!691287 () Bool)

(declare-fun res!455803 () Bool)

(assert (=> b!691287 (=> (not res!455803) (not e!393370))))

(declare-fun arrayNoDuplicates!0 (array!39802 (_ BitVec 32) List!13149) Bool)

(assert (=> b!691287 (= res!455803 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691288 () Bool)

(declare-fun e!393371 () Bool)

(assert (=> b!691288 (= e!393371 (contains!3671 acc!681 k!2843))))

(declare-fun b!691289 () Bool)

(declare-fun res!455800 () Bool)

(assert (=> b!691289 (=> (not res!455800) (not e!393370))))

(assert (=> b!691289 (= res!455800 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19451 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691290 () Bool)

(declare-fun res!455789 () Bool)

(assert (=> b!691290 (=> (not res!455789) (not e!393370))))

(declare-fun noDuplicate!940 (List!13149) Bool)

(assert (=> b!691290 (= res!455789 (noDuplicate!940 acc!681))))

(declare-fun b!691291 () Bool)

(declare-fun res!455791 () Bool)

(assert (=> b!691291 (=> (not res!455791) (not e!393370))))

(assert (=> b!691291 (= res!455791 (not (contains!3671 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691292 () Bool)

(declare-fun res!455796 () Bool)

(assert (=> b!691292 (=> (not res!455796) (not e!393370))))

(assert (=> b!691292 (= res!455796 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13146))))

(declare-fun b!691293 () Bool)

(declare-datatypes ((Unit!24376 0))(
  ( (Unit!24377) )
))
(declare-fun e!393372 () Unit!24376)

(declare-fun Unit!24378 () Unit!24376)

(assert (=> b!691293 (= e!393372 Unit!24378)))

(declare-fun b!691294 () Bool)

(assert (=> b!691294 (= e!393370 false)))

(declare-fun lt!316226 () Unit!24376)

(assert (=> b!691294 (= lt!316226 e!393372)))

(declare-fun c!78114 () Bool)

(assert (=> b!691294 (= c!78114 (= (select (arr!19069 a!3626) from!3004) k!2843))))

(declare-fun b!691295 () Bool)

(declare-fun res!455795 () Bool)

(assert (=> b!691295 (=> (not res!455795) (not e!393370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691295 (= res!455795 (validKeyInArray!0 k!2843))))

(declare-fun b!691296 () Bool)

(declare-fun res!455792 () Bool)

(assert (=> b!691296 (=> (not res!455792) (not e!393370))))

(declare-fun e!393373 () Bool)

(assert (=> b!691296 (= res!455792 e!393373)))

(declare-fun res!455794 () Bool)

(assert (=> b!691296 (=> res!455794 e!393373)))

(assert (=> b!691296 (= res!455794 e!393371)))

(declare-fun res!455790 () Bool)

(assert (=> b!691296 (=> (not res!455790) (not e!393371))))

(assert (=> b!691296 (= res!455790 (bvsgt from!3004 i!1382))))

(declare-fun b!691297 () Bool)

(declare-fun res!455802 () Bool)

(assert (=> b!691297 (=> (not res!455802) (not e!393370))))

(assert (=> b!691297 (= res!455802 (validKeyInArray!0 (select (arr!19069 a!3626) from!3004)))))

(declare-fun b!691298 () Bool)

(declare-fun Unit!24379 () Unit!24376)

(assert (=> b!691298 (= e!393372 Unit!24379)))

(assert (=> b!691298 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316227 () Unit!24376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39802 (_ BitVec 64) (_ BitVec 32)) Unit!24376)

(assert (=> b!691298 (= lt!316227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691298 false))

(declare-fun b!691299 () Bool)

(assert (=> b!691299 (= e!393373 e!393369)))

(declare-fun res!455801 () Bool)

(assert (=> b!691299 (=> (not res!455801) (not e!393369))))

(assert (=> b!691299 (= res!455801 (bvsle from!3004 i!1382))))

(assert (= (and start!61770 res!455799) b!691290))

(assert (= (and b!691290 res!455789) b!691285))

(assert (= (and b!691285 res!455793) b!691291))

(assert (= (and b!691291 res!455791) b!691296))

(assert (= (and b!691296 res!455790) b!691288))

(assert (= (and b!691296 (not res!455794)) b!691299))

(assert (= (and b!691299 res!455801) b!691283))

(assert (= (and b!691296 res!455792) b!691292))

(assert (= (and b!691292 res!455796) b!691287))

(assert (= (and b!691287 res!455803) b!691286))

(assert (= (and b!691286 res!455797) b!691295))

(assert (= (and b!691295 res!455795) b!691284))

(assert (= (and b!691284 res!455798) b!691289))

(assert (= (and b!691289 res!455800) b!691297))

(assert (= (and b!691297 res!455802) b!691294))

(assert (= (and b!691294 c!78114) b!691298))

(assert (= (and b!691294 (not c!78114)) b!691293))

(declare-fun m!653755 () Bool)

(assert (=> b!691294 m!653755))

(assert (=> b!691297 m!653755))

(assert (=> b!691297 m!653755))

(declare-fun m!653757 () Bool)

(assert (=> b!691297 m!653757))

(declare-fun m!653759 () Bool)

(assert (=> b!691283 m!653759))

(declare-fun m!653761 () Bool)

(assert (=> b!691284 m!653761))

(declare-fun m!653763 () Bool)

(assert (=> b!691287 m!653763))

(declare-fun m!653765 () Bool)

(assert (=> b!691292 m!653765))

(declare-fun m!653767 () Bool)

(assert (=> b!691285 m!653767))

(declare-fun m!653769 () Bool)

(assert (=> b!691298 m!653769))

(declare-fun m!653771 () Bool)

(assert (=> b!691298 m!653771))

(declare-fun m!653773 () Bool)

(assert (=> start!61770 m!653773))

(declare-fun m!653775 () Bool)

(assert (=> b!691291 m!653775))

(declare-fun m!653777 () Bool)

(assert (=> b!691295 m!653777))

(assert (=> b!691288 m!653759))

(declare-fun m!653779 () Bool)

(assert (=> b!691290 m!653779))

(push 1)

(assert (not b!691285))

(assert (not b!691297))

(assert (not b!691298))

(assert (not b!691287))

(assert (not b!691291))

(assert (not b!691290))

(assert (not b!691295))

(assert (not start!61770))

(assert (not b!691288))

(assert (not b!691284))

(assert (not b!691283))

(assert (not b!691292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

