; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62352 () Bool)

(assert start!62352)

(declare-fun b!698384 () Bool)

(declare-fun res!462200 () Bool)

(declare-fun e!397032 () Bool)

(assert (=> b!698384 (=> (not res!462200) (not e!397032))))

(declare-datatypes ((List!13213 0))(
  ( (Nil!13210) (Cons!13209 (h!14254 (_ BitVec 64)) (t!19495 List!13213)) )
))
(declare-fun acc!652 () List!13213)

(declare-fun contains!3790 (List!13213 (_ BitVec 64)) Bool)

(assert (=> b!698384 (= res!462200 (not (contains!3790 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698385 () Bool)

(declare-fun res!462198 () Bool)

(assert (=> b!698385 (=> (not res!462198) (not e!397032))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!698385 (= res!462198 (validKeyInArray!0 k!2824))))

(declare-fun b!698386 () Bool)

(declare-fun res!462195 () Bool)

(assert (=> b!698386 (=> (not res!462195) (not e!397032))))

(declare-datatypes ((array!40031 0))(
  ( (array!40032 (arr!19172 (Array (_ BitVec 32) (_ BitVec 64))) (size!19557 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40031)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698386 (= res!462195 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698387 () Bool)

(declare-fun res!462196 () Bool)

(assert (=> b!698387 (=> (not res!462196) (not e!397032))))

(declare-fun noDuplicate!1037 (List!13213) Bool)

(assert (=> b!698387 (= res!462196 (noDuplicate!1037 acc!652))))

(declare-fun b!698388 () Bool)

(declare-fun res!462197 () Bool)

(assert (=> b!698388 (=> (not res!462197) (not e!397032))))

(assert (=> b!698388 (= res!462197 (not (contains!3790 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698390 () Bool)

(declare-fun res!462194 () Bool)

(assert (=> b!698390 (=> (not res!462194) (not e!397032))))

(assert (=> b!698390 (= res!462194 (not (contains!3790 acc!652 k!2824)))))

(declare-fun b!698391 () Bool)

(assert (=> b!698391 (= e!397032 (bvsgt from!2969 (size!19557 a!3591)))))

(declare-fun b!698389 () Bool)

(declare-fun res!462199 () Bool)

(assert (=> b!698389 (=> (not res!462199) (not e!397032))))

(declare-fun newAcc!49 () List!13213)

(assert (=> b!698389 (= res!462199 (noDuplicate!1037 newAcc!49))))

(declare-fun res!462201 () Bool)

(assert (=> start!62352 (=> (not res!462201) (not e!397032))))

(assert (=> start!62352 (= res!462201 (and (bvslt (size!19557 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19557 a!3591))))))

(assert (=> start!62352 e!397032))

(assert (=> start!62352 true))

(declare-fun array_inv!14968 (array!40031) Bool)

(assert (=> start!62352 (array_inv!14968 a!3591)))

(assert (= (and start!62352 res!462201) b!698387))

(assert (= (and b!698387 res!462196) b!698389))

(assert (= (and b!698389 res!462199) b!698388))

(assert (= (and b!698388 res!462197) b!698384))

(assert (= (and b!698384 res!462200) b!698386))

(assert (= (and b!698386 res!462195) b!698390))

(assert (= (and b!698390 res!462194) b!698385))

(assert (= (and b!698385 res!462198) b!698391))

(declare-fun m!658653 () Bool)

(assert (=> b!698388 m!658653))

(declare-fun m!658655 () Bool)

(assert (=> b!698390 m!658655))

(declare-fun m!658657 () Bool)

(assert (=> b!698386 m!658657))

(declare-fun m!658659 () Bool)

(assert (=> b!698384 m!658659))

(declare-fun m!658661 () Bool)

(assert (=> b!698389 m!658661))

(declare-fun m!658663 () Bool)

(assert (=> b!698387 m!658663))

(declare-fun m!658665 () Bool)

(assert (=> b!698385 m!658665))

(declare-fun m!658667 () Bool)

(assert (=> start!62352 m!658667))

(push 1)

(assert (not b!698387))

(assert (not b!698389))

(assert (not start!62352))

(assert (not b!698384))

(assert (not b!698390))

(assert (not b!698386))

(assert (not b!698385))

(assert (not b!698388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

