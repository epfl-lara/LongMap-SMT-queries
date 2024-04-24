; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62402 () Bool)

(assert start!62402)

(declare-fun b!698511 () Bool)

(declare-fun res!462221 () Bool)

(declare-fun e!397131 () Bool)

(assert (=> b!698511 (=> (not res!462221) (not e!397131))))

(declare-datatypes ((List!13112 0))(
  ( (Nil!13109) (Cons!13108 (h!14156 (_ BitVec 64)) (t!19386 List!13112)) )
))
(declare-fun acc!652 () List!13112)

(declare-fun contains!3764 (List!13112 (_ BitVec 64)) Bool)

(assert (=> b!698511 (= res!462221 (not (contains!3764 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462222 () Bool)

(assert (=> start!62402 (=> (not res!462222) (not e!397131))))

(declare-datatypes ((array!40021 0))(
  ( (array!40022 (arr!19164 (Array (_ BitVec 32) (_ BitVec 64))) (size!19547 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40021)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62402 (= res!462222 (and (bvslt (size!19547 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19547 a!3591))))))

(assert (=> start!62402 e!397131))

(declare-fun array_inv!15023 (array!40021) Bool)

(assert (=> start!62402 (array_inv!15023 a!3591)))

(assert (=> start!62402 true))

(declare-fun b!698512 () Bool)

(assert (=> b!698512 (= e!397131 false)))

(declare-fun lt!317355 () Bool)

(assert (=> b!698512 (= lt!317355 (contains!3764 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698509 () Bool)

(declare-fun res!462220 () Bool)

(assert (=> b!698509 (=> (not res!462220) (not e!397131))))

(declare-fun noDuplicate!1038 (List!13112) Bool)

(assert (=> b!698509 (= res!462220 (noDuplicate!1038 acc!652))))

(declare-fun b!698510 () Bool)

(declare-fun res!462223 () Bool)

(assert (=> b!698510 (=> (not res!462223) (not e!397131))))

(declare-fun newAcc!49 () List!13112)

(assert (=> b!698510 (= res!462223 (noDuplicate!1038 newAcc!49))))

(assert (= (and start!62402 res!462222) b!698509))

(assert (= (and b!698509 res!462220) b!698510))

(assert (= (and b!698510 res!462223) b!698511))

(assert (= (and b!698511 res!462221) b!698512))

(declare-fun m!659267 () Bool)

(assert (=> b!698510 m!659267))

(declare-fun m!659269 () Bool)

(assert (=> b!698509 m!659269))

(declare-fun m!659271 () Bool)

(assert (=> start!62402 m!659271))

(declare-fun m!659273 () Bool)

(assert (=> b!698511 m!659273))

(declare-fun m!659275 () Bool)

(assert (=> b!698512 m!659275))

(push 1)

(assert (not b!698510))

(assert (not b!698512))

(assert (not b!698509))

(assert (not start!62402))

(assert (not b!698511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

