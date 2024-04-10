; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62358 () Bool)

(assert start!62358)

(declare-fun b!698440 () Bool)

(declare-fun res!462253 () Bool)

(declare-fun e!397050 () Bool)

(assert (=> b!698440 (=> (not res!462253) (not e!397050))))

(declare-datatypes ((List!13216 0))(
  ( (Nil!13213) (Cons!13212 (h!14257 (_ BitVec 64)) (t!19498 List!13216)) )
))
(declare-fun acc!652 () List!13216)

(declare-fun contains!3793 (List!13216 (_ BitVec 64)) Bool)

(assert (=> b!698440 (= res!462253 (not (contains!3793 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698441 () Bool)

(declare-fun res!462250 () Bool)

(assert (=> b!698441 (=> (not res!462250) (not e!397050))))

(assert (=> b!698441 (= res!462250 (not (contains!3793 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698442 () Bool)

(declare-fun res!462255 () Bool)

(assert (=> b!698442 (=> (not res!462255) (not e!397050))))

(declare-fun noDuplicate!1040 (List!13216) Bool)

(assert (=> b!698442 (= res!462255 (noDuplicate!1040 acc!652))))

(declare-fun res!462251 () Bool)

(assert (=> start!62358 (=> (not res!462251) (not e!397050))))

(declare-datatypes ((array!40037 0))(
  ( (array!40038 (arr!19175 (Array (_ BitVec 32) (_ BitVec 64))) (size!19560 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40037)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62358 (= res!462251 (and (bvslt (size!19560 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19560 a!3591))))))

(assert (=> start!62358 e!397050))

(assert (=> start!62358 true))

(declare-fun array_inv!14971 (array!40037) Bool)

(assert (=> start!62358 (array_inv!14971 a!3591)))

(declare-fun b!698443 () Bool)

(declare-fun res!462252 () Bool)

(assert (=> b!698443 (=> (not res!462252) (not e!397050))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698443 (= res!462252 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698444 () Bool)

(declare-fun res!462254 () Bool)

(assert (=> b!698444 (=> (not res!462254) (not e!397050))))

(declare-fun newAcc!49 () List!13216)

(assert (=> b!698444 (= res!462254 (noDuplicate!1040 newAcc!49))))

(declare-fun b!698445 () Bool)

(assert (=> b!698445 (= e!397050 false)))

(declare-fun lt!317265 () Bool)

(assert (=> b!698445 (= lt!317265 (contains!3793 acc!652 k!2824))))

(assert (= (and start!62358 res!462251) b!698442))

(assert (= (and b!698442 res!462255) b!698444))

(assert (= (and b!698444 res!462254) b!698440))

(assert (= (and b!698440 res!462253) b!698441))

(assert (= (and b!698441 res!462250) b!698443))

(assert (= (and b!698443 res!462252) b!698445))

(declare-fun m!658697 () Bool)

(assert (=> b!698443 m!658697))

(declare-fun m!658699 () Bool)

(assert (=> start!62358 m!658699))

(declare-fun m!658701 () Bool)

(assert (=> b!698444 m!658701))

(declare-fun m!658703 () Bool)

(assert (=> b!698441 m!658703))

(declare-fun m!658705 () Bool)

(assert (=> b!698445 m!658705))

(declare-fun m!658707 () Bool)

(assert (=> b!698440 m!658707))

(declare-fun m!658709 () Bool)

(assert (=> b!698442 m!658709))

(push 1)

(assert (not b!698444))

(assert (not b!698441))

(assert (not b!698443))

(assert (not b!698440))

(assert (not start!62358))

(assert (not b!698445))

(assert (not b!698442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

