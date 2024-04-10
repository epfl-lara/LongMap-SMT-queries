; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62490 () Bool)

(assert start!62490)

(declare-fun b!703432 () Bool)

(declare-fun res!467258 () Bool)

(declare-fun e!397609 () Bool)

(assert (=> b!703432 (=> (not res!467258) (not e!397609))))

(declare-datatypes ((array!40169 0))(
  ( (array!40170 (arr!19241 (Array (_ BitVec 32) (_ BitVec 64))) (size!19626 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40169)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703432 (= res!467258 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703433 () Bool)

(declare-fun res!467246 () Bool)

(assert (=> b!703433 (=> (not res!467246) (not e!397609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703433 (= res!467246 (validKeyInArray!0 k!2824))))

(declare-fun res!467248 () Bool)

(assert (=> start!62490 (=> (not res!467248) (not e!397609))))

(assert (=> start!62490 (= res!467248 (and (bvslt (size!19626 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19626 a!3591))))))

(assert (=> start!62490 e!397609))

(assert (=> start!62490 true))

(declare-fun array_inv!15037 (array!40169) Bool)

(assert (=> start!62490 (array_inv!15037 a!3591)))

(declare-fun b!703434 () Bool)

(declare-fun res!467244 () Bool)

(assert (=> b!703434 (=> (not res!467244) (not e!397609))))

(declare-datatypes ((List!13282 0))(
  ( (Nil!13279) (Cons!13278 (h!14323 (_ BitVec 64)) (t!19564 List!13282)) )
))
(declare-fun acc!652 () List!13282)

(declare-fun contains!3859 (List!13282 (_ BitVec 64)) Bool)

(assert (=> b!703434 (= res!467244 (not (contains!3859 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703435 () Bool)

(declare-fun res!467252 () Bool)

(assert (=> b!703435 (=> (not res!467252) (not e!397609))))

(declare-fun newAcc!49 () List!13282)

(declare-fun noDuplicate!1106 (List!13282) Bool)

(assert (=> b!703435 (= res!467252 (noDuplicate!1106 newAcc!49))))

(declare-fun b!703436 () Bool)

(declare-fun res!467254 () Bool)

(assert (=> b!703436 (=> (not res!467254) (not e!397609))))

(assert (=> b!703436 (= res!467254 (not (contains!3859 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703437 () Bool)

(declare-fun res!467251 () Bool)

(assert (=> b!703437 (=> (not res!467251) (not e!397609))))

(assert (=> b!703437 (= res!467251 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703438 () Bool)

(declare-fun res!467259 () Bool)

(assert (=> b!703438 (=> (not res!467259) (not e!397609))))

(assert (=> b!703438 (= res!467259 (not (contains!3859 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703439 () Bool)

(declare-fun res!467253 () Bool)

(assert (=> b!703439 (=> (not res!467253) (not e!397609))))

(assert (=> b!703439 (= res!467253 (not (contains!3859 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703440 () Bool)

(declare-fun res!467245 () Bool)

(assert (=> b!703440 (=> (not res!467245) (not e!397609))))

(assert (=> b!703440 (= res!467245 (not (validKeyInArray!0 (select (arr!19241 a!3591) from!2969))))))

(declare-fun b!703441 () Bool)

(assert (=> b!703441 (= e!397609 false)))

(declare-fun lt!317787 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40169 (_ BitVec 32) List!13282) Bool)

(assert (=> b!703441 (= lt!317787 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703442 () Bool)

(declare-fun res!467250 () Bool)

(assert (=> b!703442 (=> (not res!467250) (not e!397609))))

(assert (=> b!703442 (= res!467250 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703443 () Bool)

(declare-fun res!467255 () Bool)

(assert (=> b!703443 (=> (not res!467255) (not e!397609))))

(assert (=> b!703443 (= res!467255 (not (contains!3859 acc!652 k!2824)))))

(declare-fun b!703444 () Bool)

(declare-fun res!467247 () Bool)

(assert (=> b!703444 (=> (not res!467247) (not e!397609))))

(declare-fun subseq!304 (List!13282 List!13282) Bool)

(assert (=> b!703444 (= res!467247 (subseq!304 acc!652 newAcc!49))))

(declare-fun b!703445 () Bool)

(declare-fun res!467257 () Bool)

(assert (=> b!703445 (=> (not res!467257) (not e!397609))))

(assert (=> b!703445 (= res!467257 (noDuplicate!1106 acc!652))))

(declare-fun b!703446 () Bool)

(declare-fun res!467242 () Bool)

(assert (=> b!703446 (=> (not res!467242) (not e!397609))))

(declare-fun -!269 (List!13282 (_ BitVec 64)) List!13282)

(assert (=> b!703446 (= res!467242 (= (-!269 newAcc!49 k!2824) acc!652))))

(declare-fun b!703447 () Bool)

(declare-fun res!467256 () Bool)

(assert (=> b!703447 (=> (not res!467256) (not e!397609))))

(assert (=> b!703447 (= res!467256 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19626 a!3591)))))

(declare-fun b!703448 () Bool)

(declare-fun res!467249 () Bool)

(assert (=> b!703448 (=> (not res!467249) (not e!397609))))

(assert (=> b!703448 (= res!467249 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703449 () Bool)

(declare-fun res!467243 () Bool)

(assert (=> b!703449 (=> (not res!467243) (not e!397609))))

(assert (=> b!703449 (= res!467243 (contains!3859 newAcc!49 k!2824))))

(assert (= (and start!62490 res!467248) b!703445))

(assert (= (and b!703445 res!467257) b!703435))

(assert (= (and b!703435 res!467252) b!703434))

(assert (= (and b!703434 res!467244) b!703436))

(assert (= (and b!703436 res!467254) b!703437))

(assert (= (and b!703437 res!467251) b!703443))

(assert (= (and b!703443 res!467255) b!703433))

(assert (= (and b!703433 res!467246) b!703448))

(assert (= (and b!703448 res!467249) b!703444))

(assert (= (and b!703444 res!467247) b!703449))

(assert (= (and b!703449 res!467243) b!703446))

(assert (= (and b!703446 res!467242) b!703438))

(assert (= (and b!703438 res!467259) b!703439))

(assert (= (and b!703439 res!467253) b!703447))

(assert (= (and b!703447 res!467256) b!703440))

(assert (= (and b!703440 res!467245) b!703442))

(assert (= (and b!703442 res!467250) b!703432))

(assert (= (and b!703432 res!467258) b!703441))

(declare-fun m!662263 () Bool)

(assert (=> start!62490 m!662263))

(declare-fun m!662265 () Bool)

(assert (=> b!703443 m!662265))

(declare-fun m!662267 () Bool)

(assert (=> b!703435 m!662267))

(declare-fun m!662269 () Bool)

(assert (=> b!703446 m!662269))

(declare-fun m!662271 () Bool)

(assert (=> b!703434 m!662271))

(declare-fun m!662273 () Bool)

(assert (=> b!703444 m!662273))

(declare-fun m!662275 () Bool)

(assert (=> b!703448 m!662275))

(declare-fun m!662277 () Bool)

(assert (=> b!703440 m!662277))

(assert (=> b!703440 m!662277))

(declare-fun m!662279 () Bool)

(assert (=> b!703440 m!662279))

(declare-fun m!662281 () Bool)

(assert (=> b!703432 m!662281))

(declare-fun m!662283 () Bool)

(assert (=> b!703436 m!662283))

(declare-fun m!662285 () Bool)

(assert (=> b!703449 m!662285))

(declare-fun m!662287 () Bool)

(assert (=> b!703437 m!662287))

(declare-fun m!662289 () Bool)

(assert (=> b!703438 m!662289))

(declare-fun m!662291 () Bool)

(assert (=> b!703445 m!662291))

(declare-fun m!662293 () Bool)

(assert (=> b!703441 m!662293))

(declare-fun m!662295 () Bool)

(assert (=> b!703439 m!662295))

(declare-fun m!662297 () Bool)

(assert (=> b!703433 m!662297))

(push 1)

(assert (not b!703449))

(assert (not b!703443))

(assert (not b!703432))

(assert (not b!703437))

(assert (not b!703436))

(assert (not b!703434))

(assert (not b!703435))

(assert (not b!703433))

(assert (not b!703446))

(assert (not start!62490))

(assert (not b!703445))

(assert (not b!703438))

(assert (not b!703441))

(assert (not b!703444))

(assert (not b!703439))

(assert (not b!703448))

(assert (not b!703440))

(check-sat)

