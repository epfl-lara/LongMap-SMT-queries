; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59838 () Bool)

(assert start!59838)

(declare-fun b!661342 () Bool)

(declare-fun res!429411 () Bool)

(declare-fun e!379911 () Bool)

(assert (=> b!661342 (=> (not res!429411) (not e!379911))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661342 (= res!429411 (validKeyInArray!0 k!2843))))

(declare-fun b!661343 () Bool)

(declare-fun res!429418 () Bool)

(assert (=> b!661343 (=> (not res!429418) (not e!379911))))

(declare-datatypes ((array!38885 0))(
  ( (array!38886 (arr!18635 (Array (_ BitVec 32) (_ BitVec 64))) (size!18999 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38885)

(declare-datatypes ((List!12676 0))(
  ( (Nil!12673) (Cons!12672 (h!13717 (_ BitVec 64)) (t!18904 List!12676)) )
))
(declare-fun arrayNoDuplicates!0 (array!38885 (_ BitVec 32) List!12676) Bool)

(assert (=> b!661343 (= res!429418 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12673))))

(declare-fun b!661344 () Bool)

(declare-fun res!429407 () Bool)

(assert (=> b!661344 (=> (not res!429407) (not e!379911))))

(declare-fun acc!681 () List!12676)

(declare-fun noDuplicate!500 (List!12676) Bool)

(assert (=> b!661344 (= res!429407 (noDuplicate!500 acc!681))))

(declare-fun b!661345 () Bool)

(declare-fun e!379907 () Bool)

(declare-fun contains!3253 (List!12676 (_ BitVec 64)) Bool)

(assert (=> b!661345 (= e!379907 (not (contains!3253 acc!681 k!2843)))))

(declare-fun b!661346 () Bool)

(declare-fun e!379908 () Bool)

(assert (=> b!661346 (= e!379908 (contains!3253 acc!681 k!2843))))

(declare-fun b!661347 () Bool)

(declare-fun res!429415 () Bool)

(assert (=> b!661347 (=> (not res!429415) (not e!379911))))

(assert (=> b!661347 (= res!429415 (not (contains!3253 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429416 () Bool)

(assert (=> start!59838 (=> (not res!429416) (not e!379911))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59838 (= res!429416 (and (bvslt (size!18999 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18999 a!3626))))))

(assert (=> start!59838 e!379911))

(assert (=> start!59838 true))

(declare-fun array_inv!14431 (array!38885) Bool)

(assert (=> start!59838 (array_inv!14431 a!3626)))

(declare-fun b!661348 () Bool)

(declare-fun res!429414 () Bool)

(assert (=> b!661348 (=> (not res!429414) (not e!379911))))

(declare-fun arrayContainsKey!0 (array!38885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661348 (= res!429414 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661349 () Bool)

(declare-fun res!429410 () Bool)

(assert (=> b!661349 (=> (not res!429410) (not e!379911))))

(declare-fun e!379909 () Bool)

(assert (=> b!661349 (= res!429410 e!379909)))

(declare-fun res!429406 () Bool)

(assert (=> b!661349 (=> res!429406 e!379909)))

(assert (=> b!661349 (= res!429406 e!379908)))

(declare-fun res!429413 () Bool)

(assert (=> b!661349 (=> (not res!429413) (not e!379908))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661349 (= res!429413 (bvsgt from!3004 i!1382))))

(declare-fun b!661350 () Bool)

(assert (=> b!661350 (= e!379911 (not true))))

(assert (=> b!661350 (arrayContainsKey!0 (array!38886 (store (arr!18635 a!3626) i!1382 k!2843) (size!18999 a!3626)) k!2843 from!3004)))

(declare-fun b!661351 () Bool)

(declare-fun res!429419 () Bool)

(assert (=> b!661351 (=> (not res!429419) (not e!379911))))

(assert (=> b!661351 (= res!429419 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18999 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661352 () Bool)

(declare-fun res!429417 () Bool)

(assert (=> b!661352 (=> (not res!429417) (not e!379911))))

(assert (=> b!661352 (= res!429417 (not (contains!3253 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661353 () Bool)

(assert (=> b!661353 (= e!379909 e!379907)))

(declare-fun res!429408 () Bool)

(assert (=> b!661353 (=> (not res!429408) (not e!379907))))

(assert (=> b!661353 (= res!429408 (bvsle from!3004 i!1382))))

(declare-fun b!661354 () Bool)

(declare-fun res!429409 () Bool)

(assert (=> b!661354 (=> (not res!429409) (not e!379911))))

(assert (=> b!661354 (= res!429409 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18999 a!3626))))))

(declare-fun b!661355 () Bool)

(declare-fun res!429412 () Bool)

(assert (=> b!661355 (=> (not res!429412) (not e!379911))))

(assert (=> b!661355 (= res!429412 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59838 res!429416) b!661344))

(assert (= (and b!661344 res!429407) b!661347))

(assert (= (and b!661347 res!429415) b!661352))

(assert (= (and b!661352 res!429417) b!661349))

(assert (= (and b!661349 res!429413) b!661346))

(assert (= (and b!661349 (not res!429406)) b!661353))

(assert (= (and b!661353 res!429408) b!661345))

(assert (= (and b!661349 res!429410) b!661343))

(assert (= (and b!661343 res!429418) b!661355))

(assert (= (and b!661355 res!429412) b!661354))

(assert (= (and b!661354 res!429409) b!661342))

(assert (= (and b!661342 res!429411) b!661348))

(assert (= (and b!661348 res!429414) b!661351))

(assert (= (and b!661351 res!429419) b!661350))

(declare-fun m!633577 () Bool)

(assert (=> b!661343 m!633577))

(declare-fun m!633579 () Bool)

(assert (=> b!661346 m!633579))

(declare-fun m!633581 () Bool)

(assert (=> b!661352 m!633581))

(declare-fun m!633583 () Bool)

(assert (=> b!661347 m!633583))

(assert (=> b!661345 m!633579))

(declare-fun m!633585 () Bool)

(assert (=> start!59838 m!633585))

(declare-fun m!633587 () Bool)

(assert (=> b!661350 m!633587))

(declare-fun m!633589 () Bool)

(assert (=> b!661350 m!633589))

(declare-fun m!633591 () Bool)

(assert (=> b!661342 m!633591))

(declare-fun m!633593 () Bool)

(assert (=> b!661348 m!633593))

(declare-fun m!633595 () Bool)

(assert (=> b!661344 m!633595))

(declare-fun m!633597 () Bool)

(assert (=> b!661355 m!633597))

(push 1)

(assert (not b!661350))

(assert (not start!59838))

(assert (not b!661348))

(assert (not b!661347))

(assert (not b!661352))

(assert (not b!661344))

(assert (not b!661346))

(assert (not b!661345))

(assert (not b!661343))

(assert (not b!661342))

(assert (not b!661355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

