; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61858 () Bool)

(assert start!61858)

(declare-fun b!692262 () Bool)

(declare-fun res!456452 () Bool)

(declare-fun e!393866 () Bool)

(assert (=> b!692262 (=> (not res!456452) (not e!393866))))

(declare-datatypes ((List!13022 0))(
  ( (Nil!13019) (Cons!13018 (h!14066 (_ BitVec 64)) (t!19281 List!13022)) )
))
(declare-fun acc!681 () List!13022)

(declare-fun contains!3674 (List!13022 (_ BitVec 64)) Bool)

(assert (=> b!692262 (= res!456452 (not (contains!3674 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692263 () Bool)

(declare-fun res!456448 () Bool)

(assert (=> b!692263 (=> (not res!456448) (not e!393866))))

(declare-fun e!393867 () Bool)

(assert (=> b!692263 (= res!456448 e!393867)))

(declare-fun res!456447 () Bool)

(assert (=> b!692263 (=> res!456447 e!393867)))

(declare-fun e!393865 () Bool)

(assert (=> b!692263 (= res!456447 e!393865)))

(declare-fun res!456457 () Bool)

(assert (=> b!692263 (=> (not res!456457) (not e!393865))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692263 (= res!456457 (bvsgt from!3004 i!1382))))

(declare-fun b!692264 () Bool)

(declare-fun res!456456 () Bool)

(assert (=> b!692264 (=> (not res!456456) (not e!393866))))

(declare-fun noDuplicate!948 (List!13022) Bool)

(assert (=> b!692264 (= res!456456 (noDuplicate!948 acc!681))))

(declare-fun b!692265 () Bool)

(declare-fun res!456444 () Bool)

(assert (=> b!692265 (=> (not res!456444) (not e!393866))))

(declare-datatypes ((array!39817 0))(
  ( (array!39818 (arr!19074 (Array (_ BitVec 32) (_ BitVec 64))) (size!19457 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39817)

(declare-fun arrayNoDuplicates!0 (array!39817 (_ BitVec 32) List!13022) Bool)

(assert (=> b!692265 (= res!456444 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!456453 () Bool)

(assert (=> start!61858 (=> (not res!456453) (not e!393866))))

(assert (=> start!61858 (= res!456453 (and (bvslt (size!19457 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19457 a!3626))))))

(assert (=> start!61858 e!393866))

(assert (=> start!61858 true))

(declare-fun array_inv!14933 (array!39817) Bool)

(assert (=> start!61858 (array_inv!14933 a!3626)))

(declare-fun b!692266 () Bool)

(declare-fun res!456451 () Bool)

(assert (=> b!692266 (=> (not res!456451) (not e!393866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692266 (= res!456451 (validKeyInArray!0 (select (arr!19074 a!3626) from!3004)))))

(declare-fun b!692267 () Bool)

(declare-fun res!456443 () Bool)

(assert (=> b!692267 (=> (not res!456443) (not e!393866))))

(assert (=> b!692267 (= res!456443 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19457 a!3626))))))

(declare-fun b!692268 () Bool)

(declare-fun res!456450 () Bool)

(assert (=> b!692268 (=> (not res!456450) (not e!393866))))

(assert (=> b!692268 (= res!456450 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13019))))

(declare-fun b!692269 () Bool)

(declare-fun e!393862 () Bool)

(assert (=> b!692269 (= e!393867 e!393862)))

(declare-fun res!456454 () Bool)

(assert (=> b!692269 (=> (not res!456454) (not e!393862))))

(assert (=> b!692269 (= res!456454 (bvsle from!3004 i!1382))))

(declare-fun b!692270 () Bool)

(assert (=> b!692270 (= e!393866 false)))

(declare-datatypes ((Unit!24413 0))(
  ( (Unit!24414) )
))
(declare-fun lt!316638 () Unit!24413)

(declare-fun e!393863 () Unit!24413)

(assert (=> b!692270 (= lt!316638 e!393863)))

(declare-fun c!78278 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!692270 (= c!78278 (= (select (arr!19074 a!3626) from!3004) k!2843))))

(declare-fun b!692271 () Bool)

(declare-fun res!456449 () Bool)

(assert (=> b!692271 (=> (not res!456449) (not e!393866))))

(declare-fun arrayContainsKey!0 (array!39817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692271 (= res!456449 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692272 () Bool)

(assert (=> b!692272 (= e!393862 (not (contains!3674 acc!681 k!2843)))))

(declare-fun b!692273 () Bool)

(declare-fun Unit!24415 () Unit!24413)

(assert (=> b!692273 (= e!393863 Unit!24415)))

(declare-fun b!692274 () Bool)

(declare-fun res!456446 () Bool)

(assert (=> b!692274 (=> (not res!456446) (not e!393866))))

(assert (=> b!692274 (= res!456446 (not (contains!3674 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692275 () Bool)

(declare-fun Unit!24416 () Unit!24413)

(assert (=> b!692275 (= e!393863 Unit!24416)))

(assert (=> b!692275 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316639 () Unit!24413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39817 (_ BitVec 64) (_ BitVec 32)) Unit!24413)

(assert (=> b!692275 (= lt!316639 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!692275 false))

(declare-fun b!692276 () Bool)

(declare-fun res!456455 () Bool)

(assert (=> b!692276 (=> (not res!456455) (not e!393866))))

(assert (=> b!692276 (= res!456455 (validKeyInArray!0 k!2843))))

(declare-fun b!692277 () Bool)

(declare-fun res!456445 () Bool)

(assert (=> b!692277 (=> (not res!456445) (not e!393866))))

(assert (=> b!692277 (= res!456445 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19457 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692278 () Bool)

(assert (=> b!692278 (= e!393865 (contains!3674 acc!681 k!2843))))

(assert (= (and start!61858 res!456453) b!692264))

(assert (= (and b!692264 res!456456) b!692274))

(assert (= (and b!692274 res!456446) b!692262))

(assert (= (and b!692262 res!456452) b!692263))

(assert (= (and b!692263 res!456457) b!692278))

(assert (= (and b!692263 (not res!456447)) b!692269))

(assert (= (and b!692269 res!456454) b!692272))

(assert (= (and b!692263 res!456448) b!692268))

(assert (= (and b!692268 res!456450) b!692265))

(assert (= (and b!692265 res!456444) b!692267))

(assert (= (and b!692267 res!456443) b!692276))

(assert (= (and b!692276 res!456455) b!692271))

(assert (= (and b!692271 res!456449) b!692277))

(assert (= (and b!692277 res!456445) b!692266))

(assert (= (and b!692266 res!456451) b!692270))

(assert (= (and b!692270 c!78278) b!692275))

(assert (= (and b!692270 (not c!78278)) b!692273))

(declare-fun m!655469 () Bool)

(assert (=> b!692264 m!655469))

(declare-fun m!655471 () Bool)

(assert (=> b!692270 m!655471))

(declare-fun m!655473 () Bool)

(assert (=> b!692278 m!655473))

(assert (=> b!692272 m!655473))

(declare-fun m!655475 () Bool)

(assert (=> b!692274 m!655475))

(declare-fun m!655477 () Bool)

(assert (=> b!692265 m!655477))

(declare-fun m!655479 () Bool)

(assert (=> b!692276 m!655479))

(declare-fun m!655481 () Bool)

(assert (=> b!692262 m!655481))

(declare-fun m!655483 () Bool)

(assert (=> b!692275 m!655483))

(declare-fun m!655485 () Bool)

(assert (=> b!692275 m!655485))

(declare-fun m!655487 () Bool)

(assert (=> b!692271 m!655487))

(declare-fun m!655489 () Bool)

(assert (=> start!61858 m!655489))

(assert (=> b!692266 m!655471))

(assert (=> b!692266 m!655471))

(declare-fun m!655491 () Bool)

(assert (=> b!692266 m!655491))

(declare-fun m!655493 () Bool)

(assert (=> b!692268 m!655493))

(push 1)

(assert (not b!692264))

(assert (not b!692278))

(assert (not b!692268))

(assert (not b!692274))

(assert (not b!692271))

(assert (not b!692266))

(assert (not start!61858))

(assert (not b!692265))

(assert (not b!692262))

(assert (not b!692275))

(assert (not b!692272))

(assert (not b!692276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

