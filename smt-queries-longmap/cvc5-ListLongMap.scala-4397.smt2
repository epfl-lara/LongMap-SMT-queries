; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60474 () Bool)

(assert start!60474)

(declare-fun b!679383 () Bool)

(declare-fun e!387034 () Bool)

(declare-fun e!387033 () Bool)

(assert (=> b!679383 (= e!387034 e!387033)))

(declare-fun res!445898 () Bool)

(assert (=> b!679383 (=> (not res!445898) (not e!387033))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679383 (= res!445898 (bvsle from!3004 i!1382))))

(declare-fun res!445896 () Bool)

(declare-fun e!387038 () Bool)

(assert (=> start!60474 (=> (not res!445896) (not e!387038))))

(declare-datatypes ((array!39466 0))(
  ( (array!39467 (arr!18922 (Array (_ BitVec 32) (_ BitVec 64))) (size!19287 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39466)

(assert (=> start!60474 (= res!445896 (and (bvslt (size!19287 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19287 a!3626))))))

(assert (=> start!60474 e!387038))

(assert (=> start!60474 true))

(declare-fun array_inv!14805 (array!39466) Bool)

(assert (=> start!60474 (array_inv!14805 a!3626)))

(declare-fun b!679384 () Bool)

(declare-datatypes ((Unit!23788 0))(
  ( (Unit!23789) )
))
(declare-fun e!387036 () Unit!23788)

(declare-fun Unit!23790 () Unit!23788)

(assert (=> b!679384 (= e!387036 Unit!23790)))

(declare-fun b!679385 () Bool)

(declare-fun res!445897 () Bool)

(assert (=> b!679385 (=> (not res!445897) (not e!387038))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679385 (= res!445897 (validKeyInArray!0 k!2843))))

(declare-fun b!679386 () Bool)

(declare-fun res!445890 () Bool)

(assert (=> b!679386 (=> (not res!445890) (not e!387038))))

(assert (=> b!679386 (= res!445890 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19287 a!3626))))))

(declare-fun b!679387 () Bool)

(declare-fun res!445891 () Bool)

(assert (=> b!679387 (=> (not res!445891) (not e!387038))))

(assert (=> b!679387 (= res!445891 e!387034)))

(declare-fun res!445894 () Bool)

(assert (=> b!679387 (=> res!445894 e!387034)))

(declare-fun e!387037 () Bool)

(assert (=> b!679387 (= res!445894 e!387037)))

(declare-fun res!445888 () Bool)

(assert (=> b!679387 (=> (not res!445888) (not e!387037))))

(assert (=> b!679387 (= res!445888 (bvsgt from!3004 i!1382))))

(declare-fun b!679388 () Bool)

(declare-fun res!445892 () Bool)

(assert (=> b!679388 (=> (not res!445892) (not e!387038))))

(declare-datatypes ((List!13002 0))(
  ( (Nil!12999) (Cons!12998 (h!14043 (_ BitVec 64)) (t!19221 List!13002)) )
))
(declare-fun arrayNoDuplicates!0 (array!39466 (_ BitVec 32) List!13002) Bool)

(assert (=> b!679388 (= res!445892 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12999))))

(declare-fun b!679389 () Bool)

(declare-fun res!445893 () Bool)

(assert (=> b!679389 (=> (not res!445893) (not e!387038))))

(declare-fun acc!681 () List!13002)

(declare-fun contains!3524 (List!13002 (_ BitVec 64)) Bool)

(assert (=> b!679389 (= res!445893 (not (contains!3524 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679390 () Bool)

(assert (=> b!679390 (= e!387038 (not true))))

(declare-fun lt!312695 () Unit!23788)

(assert (=> b!679390 (= lt!312695 e!387036)))

(declare-fun c!77115 () Bool)

(declare-fun arrayContainsKey!0 (array!39466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679390 (= c!77115 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679390 (arrayContainsKey!0 (array!39467 (store (arr!18922 a!3626) i!1382 k!2843) (size!19287 a!3626)) k!2843 from!3004)))

(declare-fun b!679391 () Bool)

(declare-fun res!445887 () Bool)

(assert (=> b!679391 (=> (not res!445887) (not e!387038))))

(assert (=> b!679391 (= res!445887 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679392 () Bool)

(declare-fun Unit!23791 () Unit!23788)

(assert (=> b!679392 (= e!387036 Unit!23791)))

(declare-fun lt!312696 () Unit!23788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39466 (_ BitVec 64) (_ BitVec 32)) Unit!23788)

(assert (=> b!679392 (= lt!312696 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!679392 false))

(declare-fun b!679393 () Bool)

(declare-fun res!445895 () Bool)

(assert (=> b!679393 (=> (not res!445895) (not e!387038))))

(assert (=> b!679393 (= res!445895 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19287 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679394 () Bool)

(declare-fun res!445899 () Bool)

(assert (=> b!679394 (=> (not res!445899) (not e!387038))))

(assert (=> b!679394 (= res!445899 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679395 () Bool)

(declare-fun res!445889 () Bool)

(assert (=> b!679395 (=> (not res!445889) (not e!387038))))

(assert (=> b!679395 (= res!445889 (not (contains!3524 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679396 () Bool)

(assert (=> b!679396 (= e!387037 (contains!3524 acc!681 k!2843))))

(declare-fun b!679397 () Bool)

(declare-fun res!445900 () Bool)

(assert (=> b!679397 (=> (not res!445900) (not e!387038))))

(declare-fun noDuplicate!793 (List!13002) Bool)

(assert (=> b!679397 (= res!445900 (noDuplicate!793 acc!681))))

(declare-fun b!679398 () Bool)

(assert (=> b!679398 (= e!387033 (not (contains!3524 acc!681 k!2843)))))

(assert (= (and start!60474 res!445896) b!679397))

(assert (= (and b!679397 res!445900) b!679395))

(assert (= (and b!679395 res!445889) b!679389))

(assert (= (and b!679389 res!445893) b!679387))

(assert (= (and b!679387 res!445888) b!679396))

(assert (= (and b!679387 (not res!445894)) b!679383))

(assert (= (and b!679383 res!445898) b!679398))

(assert (= (and b!679387 res!445891) b!679388))

(assert (= (and b!679388 res!445892) b!679394))

(assert (= (and b!679394 res!445899) b!679386))

(assert (= (and b!679386 res!445890) b!679385))

(assert (= (and b!679385 res!445897) b!679391))

(assert (= (and b!679391 res!445887) b!679393))

(assert (= (and b!679393 res!445895) b!679390))

(assert (= (and b!679390 c!77115) b!679392))

(assert (= (and b!679390 (not c!77115)) b!679384))

(declare-fun m!644209 () Bool)

(assert (=> b!679390 m!644209))

(declare-fun m!644211 () Bool)

(assert (=> b!679390 m!644211))

(declare-fun m!644213 () Bool)

(assert (=> b!679390 m!644213))

(declare-fun m!644215 () Bool)

(assert (=> b!679398 m!644215))

(declare-fun m!644217 () Bool)

(assert (=> b!679394 m!644217))

(declare-fun m!644219 () Bool)

(assert (=> b!679392 m!644219))

(declare-fun m!644221 () Bool)

(assert (=> b!679389 m!644221))

(declare-fun m!644223 () Bool)

(assert (=> b!679388 m!644223))

(declare-fun m!644225 () Bool)

(assert (=> b!679385 m!644225))

(declare-fun m!644227 () Bool)

(assert (=> start!60474 m!644227))

(declare-fun m!644229 () Bool)

(assert (=> b!679395 m!644229))

(declare-fun m!644231 () Bool)

(assert (=> b!679397 m!644231))

(declare-fun m!644233 () Bool)

(assert (=> b!679391 m!644233))

(assert (=> b!679396 m!644215))

(push 1)

(assert (not b!679391))

(assert (not b!679397))

(assert (not b!679398))

(assert (not b!679392))

(assert (not b!679395))

(assert (not b!679396))

(assert (not b!679385))

(assert (not b!679388))

(assert (not b!679390))

(assert (not start!60474))

(assert (not b!679389))

(assert (not b!679394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

