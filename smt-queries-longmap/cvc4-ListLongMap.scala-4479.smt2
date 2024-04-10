; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62346 () Bool)

(assert start!62346)

(declare-fun b!698317 () Bool)

(declare-fun res!462129 () Bool)

(declare-fun e!397015 () Bool)

(assert (=> b!698317 (=> (not res!462129) (not e!397015))))

(declare-datatypes ((List!13210 0))(
  ( (Nil!13207) (Cons!13206 (h!14251 (_ BitVec 64)) (t!19492 List!13210)) )
))
(declare-fun newAcc!49 () List!13210)

(declare-fun noDuplicate!1034 (List!13210) Bool)

(assert (=> b!698317 (= res!462129 (noDuplicate!1034 newAcc!49))))

(declare-fun b!698318 () Bool)

(declare-fun res!462128 () Bool)

(assert (=> b!698318 (=> (not res!462128) (not e!397015))))

(declare-fun acc!652 () List!13210)

(declare-fun contains!3787 (List!13210 (_ BitVec 64)) Bool)

(assert (=> b!698318 (= res!462128 (not (contains!3787 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462126 () Bool)

(assert (=> start!62346 (=> (not res!462126) (not e!397015))))

(declare-datatypes ((array!40025 0))(
  ( (array!40026 (arr!19169 (Array (_ BitVec 32) (_ BitVec 64))) (size!19554 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40025)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62346 (= res!462126 (and (bvslt (size!19554 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19554 a!3591))))))

(assert (=> start!62346 e!397015))

(declare-fun array_inv!14965 (array!40025) Bool)

(assert (=> start!62346 (array_inv!14965 a!3591)))

(assert (=> start!62346 true))

(declare-fun b!698316 () Bool)

(declare-fun res!462127 () Bool)

(assert (=> b!698316 (=> (not res!462127) (not e!397015))))

(assert (=> b!698316 (= res!462127 (noDuplicate!1034 acc!652))))

(declare-fun b!698319 () Bool)

(assert (=> b!698319 (= e!397015 false)))

(declare-fun lt!317256 () Bool)

(assert (=> b!698319 (= lt!317256 (contains!3787 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!62346 res!462126) b!698316))

(assert (= (and b!698316 res!462127) b!698317))

(assert (= (and b!698317 res!462129) b!698318))

(assert (= (and b!698318 res!462128) b!698319))

(declare-fun m!658611 () Bool)

(assert (=> b!698316 m!658611))

(declare-fun m!658613 () Bool)

(assert (=> b!698319 m!658613))

(declare-fun m!658615 () Bool)

(assert (=> b!698318 m!658615))

(declare-fun m!658617 () Bool)

(assert (=> b!698317 m!658617))

(declare-fun m!658619 () Bool)

(assert (=> start!62346 m!658619))

(push 1)

(assert (not b!698316))

(assert (not b!698319))

(assert (not start!62346))

(assert (not b!698317))

(assert (not b!698318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

