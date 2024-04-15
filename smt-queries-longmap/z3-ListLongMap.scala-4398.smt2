; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60476 () Bool)

(assert start!60476)

(declare-fun b!679433 () Bool)

(declare-fun res!445943 () Bool)

(declare-fun e!387053 () Bool)

(assert (=> b!679433 (=> (not res!445943) (not e!387053))))

(declare-datatypes ((List!13003 0))(
  ( (Nil!13000) (Cons!12999 (h!14044 (_ BitVec 64)) (t!19222 List!13003)) )
))
(declare-fun acc!681 () List!13003)

(declare-fun noDuplicate!794 (List!13003) Bool)

(assert (=> b!679433 (= res!445943 (noDuplicate!794 acc!681))))

(declare-fun b!679434 () Bool)

(declare-fun res!445938 () Bool)

(assert (=> b!679434 (=> (not res!445938) (not e!387053))))

(declare-fun contains!3525 (List!13003 (_ BitVec 64)) Bool)

(assert (=> b!679434 (= res!445938 (not (contains!3525 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679435 () Bool)

(declare-fun e!387056 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!679435 (= e!387056 (not (contains!3525 acc!681 k0!2843)))))

(declare-fun b!679436 () Bool)

(declare-fun res!445931 () Bool)

(assert (=> b!679436 (=> (not res!445931) (not e!387053))))

(declare-fun e!387055 () Bool)

(assert (=> b!679436 (= res!445931 e!387055)))

(declare-fun res!445942 () Bool)

(assert (=> b!679436 (=> res!445942 e!387055)))

(declare-fun e!387054 () Bool)

(assert (=> b!679436 (= res!445942 e!387054)))

(declare-fun res!445939 () Bool)

(assert (=> b!679436 (=> (not res!445939) (not e!387054))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679436 (= res!445939 (bvsgt from!3004 i!1382))))

(declare-fun b!679437 () Bool)

(assert (=> b!679437 (= e!387054 (contains!3525 acc!681 k0!2843))))

(declare-fun b!679438 () Bool)

(declare-fun e!387059 () Bool)

(assert (=> b!679438 (= e!387059 true)))

(declare-fun subseq!128 (List!13003 List!13003) Bool)

(assert (=> b!679438 (subseq!128 acc!681 acc!681)))

(declare-datatypes ((Unit!23792 0))(
  ( (Unit!23793) )
))
(declare-fun lt!312705 () Unit!23792)

(declare-fun lemmaListSubSeqRefl!0 (List!13003) Unit!23792)

(assert (=> b!679438 (= lt!312705 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679439 () Bool)

(declare-fun res!445940 () Bool)

(assert (=> b!679439 (=> (not res!445940) (not e!387053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679439 (= res!445940 (validKeyInArray!0 k0!2843))))

(declare-fun res!445932 () Bool)

(assert (=> start!60476 (=> (not res!445932) (not e!387053))))

(declare-datatypes ((array!39468 0))(
  ( (array!39469 (arr!18923 (Array (_ BitVec 32) (_ BitVec 64))) (size!19288 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39468)

(assert (=> start!60476 (= res!445932 (and (bvslt (size!19288 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19288 a!3626))))))

(assert (=> start!60476 e!387053))

(assert (=> start!60476 true))

(declare-fun array_inv!14806 (array!39468) Bool)

(assert (=> start!60476 (array_inv!14806 a!3626)))

(declare-fun b!679440 () Bool)

(declare-fun res!445945 () Bool)

(assert (=> b!679440 (=> (not res!445945) (not e!387053))))

(declare-fun arrayNoDuplicates!0 (array!39468 (_ BitVec 32) List!13003) Bool)

(assert (=> b!679440 (= res!445945 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13000))))

(declare-fun b!679441 () Bool)

(declare-fun res!445934 () Bool)

(assert (=> b!679441 (=> (not res!445934) (not e!387053))))

(assert (=> b!679441 (= res!445934 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19288 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679442 () Bool)

(declare-fun res!445944 () Bool)

(assert (=> b!679442 (=> (not res!445944) (not e!387053))))

(assert (=> b!679442 (= res!445944 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19288 a!3626))))))

(declare-fun b!679443 () Bool)

(assert (=> b!679443 (= e!387055 e!387056)))

(declare-fun res!445936 () Bool)

(assert (=> b!679443 (=> (not res!445936) (not e!387056))))

(assert (=> b!679443 (= res!445936 (bvsle from!3004 i!1382))))

(declare-fun b!679444 () Bool)

(declare-fun res!445933 () Bool)

(assert (=> b!679444 (=> (not res!445933) (not e!387053))))

(assert (=> b!679444 (= res!445933 (not (contains!3525 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679445 () Bool)

(declare-fun e!387058 () Unit!23792)

(declare-fun Unit!23794 () Unit!23792)

(assert (=> b!679445 (= e!387058 Unit!23794)))

(declare-fun lt!312703 () Unit!23792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39468 (_ BitVec 64) (_ BitVec 32)) Unit!23792)

(assert (=> b!679445 (= lt!312703 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!679445 false))

(declare-fun b!679446 () Bool)

(declare-fun res!445937 () Bool)

(assert (=> b!679446 (=> (not res!445937) (not e!387053))))

(declare-fun arrayContainsKey!0 (array!39468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679446 (= res!445937 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679447 () Bool)

(declare-fun res!445935 () Bool)

(assert (=> b!679447 (=> (not res!445935) (not e!387053))))

(assert (=> b!679447 (= res!445935 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679448 () Bool)

(assert (=> b!679448 (= e!387053 (not e!387059))))

(declare-fun res!445941 () Bool)

(assert (=> b!679448 (=> res!445941 e!387059)))

(assert (=> b!679448 (= res!445941 (not (validKeyInArray!0 (select (arr!18923 a!3626) from!3004))))))

(declare-fun lt!312704 () Unit!23792)

(assert (=> b!679448 (= lt!312704 e!387058)))

(declare-fun c!77118 () Bool)

(assert (=> b!679448 (= c!77118 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679448 (arrayContainsKey!0 (array!39469 (store (arr!18923 a!3626) i!1382 k0!2843) (size!19288 a!3626)) k0!2843 from!3004)))

(declare-fun b!679449 () Bool)

(declare-fun Unit!23795 () Unit!23792)

(assert (=> b!679449 (= e!387058 Unit!23795)))

(assert (= (and start!60476 res!445932) b!679433))

(assert (= (and b!679433 res!445943) b!679444))

(assert (= (and b!679444 res!445933) b!679434))

(assert (= (and b!679434 res!445938) b!679436))

(assert (= (and b!679436 res!445939) b!679437))

(assert (= (and b!679436 (not res!445942)) b!679443))

(assert (= (and b!679443 res!445936) b!679435))

(assert (= (and b!679436 res!445931) b!679440))

(assert (= (and b!679440 res!445945) b!679447))

(assert (= (and b!679447 res!445935) b!679442))

(assert (= (and b!679442 res!445944) b!679439))

(assert (= (and b!679439 res!445940) b!679446))

(assert (= (and b!679446 res!445937) b!679441))

(assert (= (and b!679441 res!445934) b!679448))

(assert (= (and b!679448 c!77118) b!679445))

(assert (= (and b!679448 (not c!77118)) b!679449))

(assert (= (and b!679448 (not res!445941)) b!679438))

(declare-fun m!644235 () Bool)

(assert (=> b!679439 m!644235))

(declare-fun m!644237 () Bool)

(assert (=> b!679438 m!644237))

(declare-fun m!644239 () Bool)

(assert (=> b!679438 m!644239))

(declare-fun m!644241 () Bool)

(assert (=> start!60476 m!644241))

(declare-fun m!644243 () Bool)

(assert (=> b!679445 m!644243))

(declare-fun m!644245 () Bool)

(assert (=> b!679435 m!644245))

(assert (=> b!679437 m!644245))

(declare-fun m!644247 () Bool)

(assert (=> b!679446 m!644247))

(declare-fun m!644249 () Bool)

(assert (=> b!679448 m!644249))

(declare-fun m!644251 () Bool)

(assert (=> b!679448 m!644251))

(declare-fun m!644253 () Bool)

(assert (=> b!679448 m!644253))

(assert (=> b!679448 m!644249))

(declare-fun m!644255 () Bool)

(assert (=> b!679448 m!644255))

(declare-fun m!644257 () Bool)

(assert (=> b!679448 m!644257))

(declare-fun m!644259 () Bool)

(assert (=> b!679440 m!644259))

(declare-fun m!644261 () Bool)

(assert (=> b!679433 m!644261))

(declare-fun m!644263 () Bool)

(assert (=> b!679434 m!644263))

(declare-fun m!644265 () Bool)

(assert (=> b!679444 m!644265))

(declare-fun m!644267 () Bool)

(assert (=> b!679447 m!644267))

(check-sat (not b!679439) (not b!679434) (not b!679444) (not start!60476) (not b!679445) (not b!679433) (not b!679438) (not b!679440) (not b!679437) (not b!679448) (not b!679446) (not b!679435) (not b!679447))
(check-sat)
