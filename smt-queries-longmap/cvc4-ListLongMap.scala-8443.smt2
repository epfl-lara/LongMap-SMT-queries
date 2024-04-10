; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102796 () Bool)

(assert start!102796)

(declare-fun b!1235411 () Bool)

(declare-fun res!823557 () Bool)

(declare-fun e!700435 () Bool)

(assert (=> b!1235411 (=> (not res!823557) (not e!700435))))

(declare-datatypes ((List!27201 0))(
  ( (Nil!27198) (Cons!27197 (h!28406 (_ BitVec 64)) (t!40664 List!27201)) )
))
(declare-fun acc!846 () List!27201)

(declare-fun contains!7263 (List!27201 (_ BitVec 64)) Bool)

(assert (=> b!1235411 (= res!823557 (not (contains!7263 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235412 () Bool)

(declare-fun res!823564 () Bool)

(assert (=> b!1235412 (=> (not res!823564) (not e!700435))))

(declare-datatypes ((array!79641 0))(
  ( (array!79642 (arr!38428 (Array (_ BitVec 32) (_ BitVec 64))) (size!38964 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79641)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79641 (_ BitVec 32) List!27201) Bool)

(assert (=> b!1235412 (= res!823564 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823560 () Bool)

(assert (=> start!102796 (=> (not res!823560) (not e!700435))))

(assert (=> start!102796 (= res!823560 (and (bvslt (size!38964 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38964 a!3835))))))

(assert (=> start!102796 e!700435))

(declare-fun array_inv!29276 (array!79641) Bool)

(assert (=> start!102796 (array_inv!29276 a!3835)))

(assert (=> start!102796 true))

(declare-fun b!1235413 () Bool)

(declare-fun res!823562 () Bool)

(assert (=> b!1235413 (=> (not res!823562) (not e!700435))))

(assert (=> b!1235413 (= res!823562 (not (contains!7263 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235414 () Bool)

(declare-fun res!823563 () Bool)

(assert (=> b!1235414 (=> (not res!823563) (not e!700435))))

(assert (=> b!1235414 (= res!823563 (not (= from!3213 (bvsub (size!38964 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235415 () Bool)

(declare-fun res!823561 () Bool)

(assert (=> b!1235415 (=> (not res!823561) (not e!700435))))

(declare-fun noDuplicate!1860 (List!27201) Bool)

(assert (=> b!1235415 (= res!823561 (noDuplicate!1860 acc!846))))

(declare-fun b!1235416 () Bool)

(declare-datatypes ((Unit!40928 0))(
  ( (Unit!40929) )
))
(declare-fun e!700437 () Unit!40928)

(declare-fun lt!560275 () Unit!40928)

(assert (=> b!1235416 (= e!700437 lt!560275)))

(declare-fun lt!560278 () List!27201)

(assert (=> b!1235416 (= lt!560278 (Cons!27197 (select (arr!38428 a!3835) from!3213) acc!846))))

(declare-fun lt!560274 () Unit!40928)

(declare-fun lemmaListSubSeqRefl!0 (List!27201) Unit!40928)

(assert (=> b!1235416 (= lt!560274 (lemmaListSubSeqRefl!0 lt!560278))))

(declare-fun subseq!535 (List!27201 List!27201) Bool)

(assert (=> b!1235416 (subseq!535 lt!560278 lt!560278)))

(declare-fun lt!560277 () Unit!40928)

(declare-fun subseqTail!28 (List!27201 List!27201) Unit!40928)

(assert (=> b!1235416 (= lt!560277 (subseqTail!28 lt!560278 lt!560278))))

(assert (=> b!1235416 (subseq!535 acc!846 lt!560278)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79641 List!27201 List!27201 (_ BitVec 32)) Unit!40928)

(assert (=> b!1235416 (= lt!560275 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560278 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235416 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235417 () Bool)

(declare-fun res!823559 () Bool)

(assert (=> b!1235417 (=> (not res!823559) (not e!700435))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235417 (= res!823559 (contains!7263 acc!846 k!2925))))

(declare-fun b!1235418 () Bool)

(declare-fun e!700436 () Bool)

(assert (=> b!1235418 (= e!700436 false)))

(declare-fun lt!560279 () Bool)

(assert (=> b!1235418 (= lt!560279 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235419 () Bool)

(assert (=> b!1235419 (= e!700435 e!700436)))

(declare-fun res!823558 () Bool)

(assert (=> b!1235419 (=> (not res!823558) (not e!700436))))

(assert (=> b!1235419 (= res!823558 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38964 a!3835))))))

(declare-fun lt!560276 () Unit!40928)

(assert (=> b!1235419 (= lt!560276 e!700437)))

(declare-fun c!120787 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235419 (= c!120787 (validKeyInArray!0 (select (arr!38428 a!3835) from!3213)))))

(declare-fun b!1235420 () Bool)

(declare-fun Unit!40930 () Unit!40928)

(assert (=> b!1235420 (= e!700437 Unit!40930)))

(assert (= (and start!102796 res!823560) b!1235415))

(assert (= (and b!1235415 res!823561) b!1235413))

(assert (= (and b!1235413 res!823562) b!1235411))

(assert (= (and b!1235411 res!823557) b!1235412))

(assert (= (and b!1235412 res!823564) b!1235417))

(assert (= (and b!1235417 res!823559) b!1235414))

(assert (= (and b!1235414 res!823563) b!1235419))

(assert (= (and b!1235419 c!120787) b!1235416))

(assert (= (and b!1235419 (not c!120787)) b!1235420))

(assert (= (and b!1235419 res!823558) b!1235418))

(declare-fun m!1139295 () Bool)

(assert (=> b!1235416 m!1139295))

(declare-fun m!1139297 () Bool)

(assert (=> b!1235416 m!1139297))

(declare-fun m!1139299 () Bool)

(assert (=> b!1235416 m!1139299))

(declare-fun m!1139301 () Bool)

(assert (=> b!1235416 m!1139301))

(declare-fun m!1139303 () Bool)

(assert (=> b!1235416 m!1139303))

(declare-fun m!1139305 () Bool)

(assert (=> b!1235416 m!1139305))

(declare-fun m!1139307 () Bool)

(assert (=> b!1235416 m!1139307))

(declare-fun m!1139309 () Bool)

(assert (=> b!1235413 m!1139309))

(declare-fun m!1139311 () Bool)

(assert (=> b!1235417 m!1139311))

(declare-fun m!1139313 () Bool)

(assert (=> b!1235415 m!1139313))

(declare-fun m!1139315 () Bool)

(assert (=> b!1235412 m!1139315))

(declare-fun m!1139317 () Bool)

(assert (=> b!1235411 m!1139317))

(declare-fun m!1139319 () Bool)

(assert (=> start!102796 m!1139319))

(assert (=> b!1235419 m!1139303))

(assert (=> b!1235419 m!1139303))

(declare-fun m!1139321 () Bool)

(assert (=> b!1235419 m!1139321))

(assert (=> b!1235418 m!1139301))

(push 1)

(assert (not start!102796))

(assert (not b!1235417))

(assert (not b!1235419))

(assert (not b!1235412))

