; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102794 () Bool)

(assert start!102794)

(declare-fun b!1235381 () Bool)

(declare-fun res!823537 () Bool)

(declare-fun e!700423 () Bool)

(assert (=> b!1235381 (=> (not res!823537) (not e!700423))))

(declare-datatypes ((List!27200 0))(
  ( (Nil!27197) (Cons!27196 (h!28405 (_ BitVec 64)) (t!40663 List!27200)) )
))
(declare-fun acc!846 () List!27200)

(declare-fun contains!7262 (List!27200 (_ BitVec 64)) Bool)

(assert (=> b!1235381 (= res!823537 (not (contains!7262 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235382 () Bool)

(declare-fun res!823539 () Bool)

(assert (=> b!1235382 (=> (not res!823539) (not e!700423))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79639 0))(
  ( (array!79640 (arr!38427 (Array (_ BitVec 32) (_ BitVec 64))) (size!38963 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79639)

(assert (=> b!1235382 (= res!823539 (not (= from!3213 (bvsub (size!38963 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235383 () Bool)

(declare-fun e!700422 () Bool)

(assert (=> b!1235383 (= e!700423 e!700422)))

(declare-fun res!823536 () Bool)

(assert (=> b!1235383 (=> (not res!823536) (not e!700422))))

(assert (=> b!1235383 (= res!823536 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38963 a!3835))))))

(declare-datatypes ((Unit!40925 0))(
  ( (Unit!40926) )
))
(declare-fun lt!560257 () Unit!40925)

(declare-fun e!700425 () Unit!40925)

(assert (=> b!1235383 (= lt!560257 e!700425)))

(declare-fun c!120784 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235383 (= c!120784 (validKeyInArray!0 (select (arr!38427 a!3835) from!3213)))))

(declare-fun res!823540 () Bool)

(assert (=> start!102794 (=> (not res!823540) (not e!700423))))

(assert (=> start!102794 (= res!823540 (and (bvslt (size!38963 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38963 a!3835))))))

(assert (=> start!102794 e!700423))

(declare-fun array_inv!29275 (array!79639) Bool)

(assert (=> start!102794 (array_inv!29275 a!3835)))

(assert (=> start!102794 true))

(declare-fun b!1235384 () Bool)

(declare-fun res!823533 () Bool)

(assert (=> b!1235384 (=> (not res!823533) (not e!700423))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235384 (= res!823533 (contains!7262 acc!846 k0!2925))))

(declare-fun b!1235385 () Bool)

(assert (=> b!1235385 (= e!700422 false)))

(declare-fun lt!560260 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79639 (_ BitVec 32) List!27200) Bool)

(assert (=> b!1235385 (= lt!560260 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235386 () Bool)

(declare-fun lt!560259 () Unit!40925)

(assert (=> b!1235386 (= e!700425 lt!560259)))

(declare-fun lt!560261 () List!27200)

(assert (=> b!1235386 (= lt!560261 (Cons!27196 (select (arr!38427 a!3835) from!3213) acc!846))))

(declare-fun lt!560258 () Unit!40925)

(declare-fun lemmaListSubSeqRefl!0 (List!27200) Unit!40925)

(assert (=> b!1235386 (= lt!560258 (lemmaListSubSeqRefl!0 lt!560261))))

(declare-fun subseq!534 (List!27200 List!27200) Bool)

(assert (=> b!1235386 (subseq!534 lt!560261 lt!560261)))

(declare-fun lt!560256 () Unit!40925)

(declare-fun subseqTail!27 (List!27200 List!27200) Unit!40925)

(assert (=> b!1235386 (= lt!560256 (subseqTail!27 lt!560261 lt!560261))))

(assert (=> b!1235386 (subseq!534 acc!846 lt!560261)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79639 List!27200 List!27200 (_ BitVec 32)) Unit!40925)

(assert (=> b!1235386 (= lt!560259 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560261 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235386 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235387 () Bool)

(declare-fun res!823535 () Bool)

(assert (=> b!1235387 (=> (not res!823535) (not e!700423))))

(declare-fun noDuplicate!1859 (List!27200) Bool)

(assert (=> b!1235387 (= res!823535 (noDuplicate!1859 acc!846))))

(declare-fun b!1235388 () Bool)

(declare-fun res!823538 () Bool)

(assert (=> b!1235388 (=> (not res!823538) (not e!700423))))

(assert (=> b!1235388 (= res!823538 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235389 () Bool)

(declare-fun Unit!40927 () Unit!40925)

(assert (=> b!1235389 (= e!700425 Unit!40927)))

(declare-fun b!1235390 () Bool)

(declare-fun res!823534 () Bool)

(assert (=> b!1235390 (=> (not res!823534) (not e!700423))))

(assert (=> b!1235390 (= res!823534 (not (contains!7262 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102794 res!823540) b!1235387))

(assert (= (and b!1235387 res!823535) b!1235381))

(assert (= (and b!1235381 res!823537) b!1235390))

(assert (= (and b!1235390 res!823534) b!1235388))

(assert (= (and b!1235388 res!823538) b!1235384))

(assert (= (and b!1235384 res!823533) b!1235382))

(assert (= (and b!1235382 res!823539) b!1235383))

(assert (= (and b!1235383 c!120784) b!1235386))

(assert (= (and b!1235383 (not c!120784)) b!1235389))

(assert (= (and b!1235383 res!823536) b!1235385))

(declare-fun m!1139267 () Bool)

(assert (=> b!1235383 m!1139267))

(assert (=> b!1235383 m!1139267))

(declare-fun m!1139269 () Bool)

(assert (=> b!1235383 m!1139269))

(declare-fun m!1139271 () Bool)

(assert (=> b!1235386 m!1139271))

(declare-fun m!1139273 () Bool)

(assert (=> b!1235386 m!1139273))

(declare-fun m!1139275 () Bool)

(assert (=> b!1235386 m!1139275))

(declare-fun m!1139277 () Bool)

(assert (=> b!1235386 m!1139277))

(declare-fun m!1139279 () Bool)

(assert (=> b!1235386 m!1139279))

(declare-fun m!1139281 () Bool)

(assert (=> b!1235386 m!1139281))

(assert (=> b!1235386 m!1139267))

(declare-fun m!1139283 () Bool)

(assert (=> b!1235384 m!1139283))

(declare-fun m!1139285 () Bool)

(assert (=> b!1235390 m!1139285))

(declare-fun m!1139287 () Bool)

(assert (=> b!1235381 m!1139287))

(declare-fun m!1139289 () Bool)

(assert (=> b!1235388 m!1139289))

(assert (=> b!1235385 m!1139281))

(declare-fun m!1139291 () Bool)

(assert (=> b!1235387 m!1139291))

(declare-fun m!1139293 () Bool)

(assert (=> start!102794 m!1139293))

(check-sat (not b!1235390) (not b!1235386) (not b!1235385) (not b!1235383) (not b!1235388) (not b!1235384) (not start!102794) (not b!1235387) (not b!1235381))
(check-sat)
