; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60376 () Bool)

(assert start!60376)

(declare-fun b!677615 () Bool)

(declare-fun res!443938 () Bool)

(declare-fun e!386306 () Bool)

(assert (=> b!677615 (=> (not res!443938) (not e!386306))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39361 0))(
  ( (array!39362 (arr!18870 (Array (_ BitVec 32) (_ BitVec 64))) (size!19234 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39361)

(assert (=> b!677615 (= res!443938 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19234 a!3626))))))

(declare-fun b!677616 () Bool)

(declare-fun res!443947 () Bool)

(assert (=> b!677616 (=> (not res!443947) (not e!386306))))

(declare-datatypes ((List!12818 0))(
  ( (Nil!12815) (Cons!12814 (h!13862 (_ BitVec 64)) (t!19038 List!12818)) )
))
(declare-fun acc!681 () List!12818)

(declare-fun noDuplicate!744 (List!12818) Bool)

(assert (=> b!677616 (= res!443947 (noDuplicate!744 acc!681))))

(declare-fun b!677617 () Bool)

(declare-fun res!443939 () Bool)

(assert (=> b!677617 (=> (not res!443939) (not e!386306))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677617 (= res!443939 (not (validKeyInArray!0 (select (arr!18870 a!3626) from!3004))))))

(declare-fun b!677618 () Bool)

(declare-fun res!443937 () Bool)

(assert (=> b!677618 (=> (not res!443937) (not e!386306))))

(declare-fun arrayNoDuplicates!0 (array!39361 (_ BitVec 32) List!12818) Bool)

(assert (=> b!677618 (= res!443937 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677619 () Bool)

(declare-fun res!443941 () Bool)

(assert (=> b!677619 (=> (not res!443941) (not e!386306))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677619 (= res!443941 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677620 () Bool)

(declare-fun e!386301 () Bool)

(declare-fun contains!3470 (List!12818 (_ BitVec 64)) Bool)

(assert (=> b!677620 (= e!386301 (contains!3470 acc!681 k!2843))))

(declare-fun b!677621 () Bool)

(declare-fun e!386305 () Bool)

(assert (=> b!677621 (= e!386305 (not (contains!3470 acc!681 k!2843)))))

(declare-fun b!677622 () Bool)

(declare-fun res!443944 () Bool)

(assert (=> b!677622 (=> (not res!443944) (not e!386306))))

(declare-fun e!386303 () Bool)

(assert (=> b!677622 (= res!443944 e!386303)))

(declare-fun res!443945 () Bool)

(assert (=> b!677622 (=> res!443945 e!386303)))

(declare-fun e!386304 () Bool)

(assert (=> b!677622 (= res!443945 e!386304)))

(declare-fun res!443934 () Bool)

(assert (=> b!677622 (=> (not res!443934) (not e!386304))))

(assert (=> b!677622 (= res!443934 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677623 () Bool)

(declare-fun res!443946 () Bool)

(assert (=> b!677623 (=> (not res!443946) (not e!386306))))

(assert (=> b!677623 (= res!443946 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!443932 () Bool)

(assert (=> start!60376 (=> (not res!443932) (not e!386306))))

(assert (=> start!60376 (= res!443932 (and (bvslt (size!19234 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19234 a!3626))))))

(assert (=> start!60376 e!386306))

(assert (=> start!60376 true))

(declare-fun array_inv!14729 (array!39361) Bool)

(assert (=> start!60376 (array_inv!14729 a!3626)))

(declare-fun b!677624 () Bool)

(declare-fun res!443935 () Bool)

(assert (=> b!677624 (=> (not res!443935) (not e!386306))))

(declare-fun e!386300 () Bool)

(assert (=> b!677624 (= res!443935 e!386300)))

(declare-fun res!443943 () Bool)

(assert (=> b!677624 (=> res!443943 e!386300)))

(assert (=> b!677624 (= res!443943 e!386301)))

(declare-fun res!443950 () Bool)

(assert (=> b!677624 (=> (not res!443950) (not e!386301))))

(assert (=> b!677624 (= res!443950 (bvsgt from!3004 i!1382))))

(declare-fun b!677625 () Bool)

(assert (=> b!677625 (= e!386304 (contains!3470 acc!681 k!2843))))

(declare-fun b!677626 () Bool)

(declare-fun res!443930 () Bool)

(assert (=> b!677626 (=> (not res!443930) (not e!386306))))

(assert (=> b!677626 (= res!443930 (not (contains!3470 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677627 () Bool)

(assert (=> b!677627 (= e!386300 e!386305)))

(declare-fun res!443933 () Bool)

(assert (=> b!677627 (=> (not res!443933) (not e!386305))))

(assert (=> b!677627 (= res!443933 (bvsle from!3004 i!1382))))

(declare-fun b!677628 () Bool)

(declare-fun e!386307 () Bool)

(assert (=> b!677628 (= e!386303 e!386307)))

(declare-fun res!443940 () Bool)

(assert (=> b!677628 (=> (not res!443940) (not e!386307))))

(assert (=> b!677628 (= res!443940 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677629 () Bool)

(assert (=> b!677629 (= e!386306 (not true))))

(assert (=> b!677629 (arrayNoDuplicates!0 (array!39362 (store (arr!18870 a!3626) i!1382 k!2843) (size!19234 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23749 0))(
  ( (Unit!23750) )
))
(declare-fun lt!312925 () Unit!23749)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12818) Unit!23749)

(assert (=> b!677629 (= lt!312925 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677630 () Bool)

(assert (=> b!677630 (= e!386307 (not (contains!3470 acc!681 k!2843)))))

(declare-fun b!677631 () Bool)

(declare-fun res!443931 () Bool)

(assert (=> b!677631 (=> (not res!443931) (not e!386306))))

(assert (=> b!677631 (= res!443931 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677632 () Bool)

(declare-fun res!443948 () Bool)

(assert (=> b!677632 (=> (not res!443948) (not e!386306))))

(assert (=> b!677632 (= res!443948 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12815))))

(declare-fun b!677633 () Bool)

(declare-fun res!443936 () Bool)

(assert (=> b!677633 (=> (not res!443936) (not e!386306))))

(assert (=> b!677633 (= res!443936 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19234 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677634 () Bool)

(declare-fun res!443949 () Bool)

(assert (=> b!677634 (=> (not res!443949) (not e!386306))))

(assert (=> b!677634 (= res!443949 (validKeyInArray!0 k!2843))))

(declare-fun b!677635 () Bool)

(declare-fun res!443942 () Bool)

(assert (=> b!677635 (=> (not res!443942) (not e!386306))))

(assert (=> b!677635 (= res!443942 (not (contains!3470 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60376 res!443932) b!677616))

(assert (= (and b!677616 res!443947) b!677626))

(assert (= (and b!677626 res!443930) b!677635))

(assert (= (and b!677635 res!443942) b!677624))

(assert (= (and b!677624 res!443950) b!677620))

(assert (= (and b!677624 (not res!443943)) b!677627))

(assert (= (and b!677627 res!443933) b!677621))

(assert (= (and b!677624 res!443935) b!677632))

(assert (= (and b!677632 res!443948) b!677623))

(assert (= (and b!677623 res!443946) b!677615))

(assert (= (and b!677615 res!443938) b!677634))

(assert (= (and b!677634 res!443949) b!677619))

(assert (= (and b!677619 res!443941) b!677633))

(assert (= (and b!677633 res!443936) b!677617))

(assert (= (and b!677617 res!443939) b!677631))

(assert (= (and b!677631 res!443931) b!677622))

(assert (= (and b!677622 res!443934) b!677625))

(assert (= (and b!677622 (not res!443945)) b!677628))

(assert (= (and b!677628 res!443940) b!677630))

(assert (= (and b!677622 res!443944) b!677618))

(assert (= (and b!677618 res!443937) b!677629))

(declare-fun m!644395 () Bool)

(assert (=> b!677616 m!644395))

(declare-fun m!644397 () Bool)

(assert (=> b!677617 m!644397))

(assert (=> b!677617 m!644397))

(declare-fun m!644399 () Bool)

(assert (=> b!677617 m!644399))

(declare-fun m!644401 () Bool)

(assert (=> b!677623 m!644401))

(declare-fun m!644403 () Bool)

(assert (=> b!677618 m!644403))

(declare-fun m!644405 () Bool)

(assert (=> b!677635 m!644405))

(declare-fun m!644407 () Bool)

(assert (=> b!677630 m!644407))

(assert (=> b!677620 m!644407))

(declare-fun m!644409 () Bool)

(assert (=> b!677634 m!644409))

(declare-fun m!644411 () Bool)

(assert (=> b!677619 m!644411))

(declare-fun m!644413 () Bool)

(assert (=> start!60376 m!644413))

(declare-fun m!644415 () Bool)

(assert (=> b!677632 m!644415))

(assert (=> b!677621 m!644407))

(declare-fun m!644417 () Bool)

(assert (=> b!677629 m!644417))

(declare-fun m!644419 () Bool)

(assert (=> b!677629 m!644419))

(declare-fun m!644421 () Bool)

(assert (=> b!677629 m!644421))

(assert (=> b!677625 m!644407))

(declare-fun m!644423 () Bool)

(assert (=> b!677626 m!644423))

(push 1)

(assert (not b!677635))

(assert (not b!677618))

(assert (not start!60376))

(assert (not b!677630))

(assert (not b!677617))

(assert (not b!677616))

(assert (not b!677625))

(assert (not b!677626))

(assert (not b!677632))

(assert (not b!677619))

(assert (not b!677621))

(assert (not b!677629))

(assert (not b!677634))

(assert (not b!677620))

(assert (not b!677623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

