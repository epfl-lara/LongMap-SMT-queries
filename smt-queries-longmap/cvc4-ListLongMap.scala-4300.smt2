; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59832 () Bool)

(assert start!59832)

(declare-fun b!661216 () Bool)

(declare-fun res!429280 () Bool)

(declare-fun e!379863 () Bool)

(assert (=> b!661216 (=> (not res!429280) (not e!379863))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661216 (= res!429280 (validKeyInArray!0 k!2843))))

(declare-fun b!661217 () Bool)

(declare-fun res!429284 () Bool)

(assert (=> b!661217 (=> (not res!429284) (not e!379863))))

(declare-datatypes ((array!38879 0))(
  ( (array!38880 (arr!18632 (Array (_ BitVec 32) (_ BitVec 64))) (size!18996 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38879)

(declare-fun arrayContainsKey!0 (array!38879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661217 (= res!429284 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661218 () Bool)

(declare-fun res!429293 () Bool)

(assert (=> b!661218 (=> (not res!429293) (not e!379863))))

(declare-datatypes ((List!12673 0))(
  ( (Nil!12670) (Cons!12669 (h!13714 (_ BitVec 64)) (t!18901 List!12673)) )
))
(declare-fun acc!681 () List!12673)

(declare-fun contains!3250 (List!12673 (_ BitVec 64)) Bool)

(assert (=> b!661218 (= res!429293 (not (contains!3250 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661219 () Bool)

(declare-fun res!429285 () Bool)

(assert (=> b!661219 (=> (not res!429285) (not e!379863))))

(declare-fun noDuplicate!497 (List!12673) Bool)

(assert (=> b!661219 (= res!429285 (noDuplicate!497 acc!681))))

(declare-fun b!661220 () Bool)

(assert (=> b!661220 (= e!379863 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661220 (arrayContainsKey!0 (array!38880 (store (arr!18632 a!3626) i!1382 k!2843) (size!18996 a!3626)) k!2843 from!3004)))

(declare-fun b!661222 () Bool)

(declare-fun res!429282 () Bool)

(assert (=> b!661222 (=> (not res!429282) (not e!379863))))

(assert (=> b!661222 (= res!429282 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18996 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661223 () Bool)

(declare-fun e!379866 () Bool)

(assert (=> b!661223 (= e!379866 (not (contains!3250 acc!681 k!2843)))))

(declare-fun b!661224 () Bool)

(declare-fun res!429288 () Bool)

(assert (=> b!661224 (=> (not res!429288) (not e!379863))))

(assert (=> b!661224 (= res!429288 (not (contains!3250 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661225 () Bool)

(declare-fun res!429281 () Bool)

(assert (=> b!661225 (=> (not res!429281) (not e!379863))))

(assert (=> b!661225 (= res!429281 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18996 a!3626))))))

(declare-fun b!661226 () Bool)

(declare-fun res!429291 () Bool)

(assert (=> b!661226 (=> (not res!429291) (not e!379863))))

(declare-fun arrayNoDuplicates!0 (array!38879 (_ BitVec 32) List!12673) Bool)

(assert (=> b!661226 (= res!429291 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661227 () Bool)

(declare-fun res!429289 () Bool)

(assert (=> b!661227 (=> (not res!429289) (not e!379863))))

(declare-fun e!379862 () Bool)

(assert (=> b!661227 (= res!429289 e!379862)))

(declare-fun res!429290 () Bool)

(assert (=> b!661227 (=> res!429290 e!379862)))

(declare-fun e!379865 () Bool)

(assert (=> b!661227 (= res!429290 e!379865)))

(declare-fun res!429286 () Bool)

(assert (=> b!661227 (=> (not res!429286) (not e!379865))))

(assert (=> b!661227 (= res!429286 (bvsgt from!3004 i!1382))))

(declare-fun b!661228 () Bool)

(assert (=> b!661228 (= e!379865 (contains!3250 acc!681 k!2843))))

(declare-fun b!661229 () Bool)

(assert (=> b!661229 (= e!379862 e!379866)))

(declare-fun res!429287 () Bool)

(assert (=> b!661229 (=> (not res!429287) (not e!379866))))

(assert (=> b!661229 (= res!429287 (bvsle from!3004 i!1382))))

(declare-fun res!429283 () Bool)

(assert (=> start!59832 (=> (not res!429283) (not e!379863))))

(assert (=> start!59832 (= res!429283 (and (bvslt (size!18996 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18996 a!3626))))))

(assert (=> start!59832 e!379863))

(assert (=> start!59832 true))

(declare-fun array_inv!14428 (array!38879) Bool)

(assert (=> start!59832 (array_inv!14428 a!3626)))

(declare-fun b!661221 () Bool)

(declare-fun res!429292 () Bool)

(assert (=> b!661221 (=> (not res!429292) (not e!379863))))

(assert (=> b!661221 (= res!429292 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12670))))

(assert (= (and start!59832 res!429283) b!661219))

(assert (= (and b!661219 res!429285) b!661218))

(assert (= (and b!661218 res!429293) b!661224))

(assert (= (and b!661224 res!429288) b!661227))

(assert (= (and b!661227 res!429286) b!661228))

(assert (= (and b!661227 (not res!429290)) b!661229))

(assert (= (and b!661229 res!429287) b!661223))

(assert (= (and b!661227 res!429289) b!661221))

(assert (= (and b!661221 res!429292) b!661226))

(assert (= (and b!661226 res!429291) b!661225))

(assert (= (and b!661225 res!429281) b!661216))

(assert (= (and b!661216 res!429280) b!661217))

(assert (= (and b!661217 res!429284) b!661222))

(assert (= (and b!661222 res!429282) b!661220))

(declare-fun m!633511 () Bool)

(assert (=> start!59832 m!633511))

(declare-fun m!633513 () Bool)

(assert (=> b!661224 m!633513))

(declare-fun m!633515 () Bool)

(assert (=> b!661218 m!633515))

(declare-fun m!633517 () Bool)

(assert (=> b!661228 m!633517))

(declare-fun m!633519 () Bool)

(assert (=> b!661219 m!633519))

(assert (=> b!661223 m!633517))

(declare-fun m!633521 () Bool)

(assert (=> b!661226 m!633521))

(declare-fun m!633523 () Bool)

(assert (=> b!661220 m!633523))

(declare-fun m!633525 () Bool)

(assert (=> b!661220 m!633525))

(declare-fun m!633527 () Bool)

(assert (=> b!661221 m!633527))

(declare-fun m!633529 () Bool)

(assert (=> b!661216 m!633529))

(declare-fun m!633531 () Bool)

(assert (=> b!661217 m!633531))

(push 1)

(assert (not b!661228))

(assert (not b!661220))

(assert (not b!661224))

(assert (not b!661216))

(assert (not start!59832))

(assert (not b!661226))

(assert (not b!661219))

(assert (not b!661221))

(assert (not b!661223))

(assert (not b!661218))

(assert (not b!661217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

