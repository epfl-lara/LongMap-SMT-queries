; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62404 () Bool)

(assert start!62404)

(declare-fun b!698529 () Bool)

(declare-fun res!462247 () Bool)

(declare-fun e!397137 () Bool)

(assert (=> b!698529 (=> (not res!462247) (not e!397137))))

(declare-datatypes ((List!13113 0))(
  ( (Nil!13110) (Cons!13109 (h!14157 (_ BitVec 64)) (t!19387 List!13113)) )
))
(declare-fun newAcc!49 () List!13113)

(declare-fun noDuplicate!1039 (List!13113) Bool)

(assert (=> b!698529 (= res!462247 (noDuplicate!1039 newAcc!49))))

(declare-fun res!462241 () Bool)

(assert (=> start!62404 (=> (not res!462241) (not e!397137))))

(declare-datatypes ((array!40023 0))(
  ( (array!40024 (arr!19165 (Array (_ BitVec 32) (_ BitVec 64))) (size!19548 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40023)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62404 (= res!462241 (and (bvslt (size!19548 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19548 a!3591))))))

(assert (=> start!62404 e!397137))

(assert (=> start!62404 true))

(declare-fun array_inv!15024 (array!40023) Bool)

(assert (=> start!62404 (array_inv!15024 a!3591)))

(declare-fun b!698530 () Bool)

(declare-fun res!462244 () Bool)

(assert (=> b!698530 (=> (not res!462244) (not e!397137))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698530 (= res!462244 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!698531 () Bool)

(declare-fun res!462240 () Bool)

(assert (=> b!698531 (=> (not res!462240) (not e!397137))))

(declare-fun acc!652 () List!13113)

(declare-fun contains!3765 (List!13113 (_ BitVec 64)) Bool)

(assert (=> b!698531 (= res!462240 (not (contains!3765 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698532 () Bool)

(assert (=> b!698532 (= e!397137 (bvsgt from!2969 (size!19548 a!3591)))))

(declare-fun b!698533 () Bool)

(declare-fun res!462246 () Bool)

(assert (=> b!698533 (=> (not res!462246) (not e!397137))))

(assert (=> b!698533 (= res!462246 (not (contains!3765 acc!652 k0!2824)))))

(declare-fun b!698534 () Bool)

(declare-fun res!462243 () Bool)

(assert (=> b!698534 (=> (not res!462243) (not e!397137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!698534 (= res!462243 (validKeyInArray!0 k0!2824))))

(declare-fun b!698535 () Bool)

(declare-fun res!462245 () Bool)

(assert (=> b!698535 (=> (not res!462245) (not e!397137))))

(assert (=> b!698535 (= res!462245 (not (contains!3765 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698536 () Bool)

(declare-fun res!462242 () Bool)

(assert (=> b!698536 (=> (not res!462242) (not e!397137))))

(assert (=> b!698536 (= res!462242 (noDuplicate!1039 acc!652))))

(assert (= (and start!62404 res!462241) b!698536))

(assert (= (and b!698536 res!462242) b!698529))

(assert (= (and b!698529 res!462247) b!698531))

(assert (= (and b!698531 res!462240) b!698535))

(assert (= (and b!698535 res!462245) b!698530))

(assert (= (and b!698530 res!462244) b!698533))

(assert (= (and b!698533 res!462246) b!698534))

(assert (= (and b!698534 res!462243) b!698532))

(declare-fun m!659277 () Bool)

(assert (=> b!698536 m!659277))

(declare-fun m!659279 () Bool)

(assert (=> start!62404 m!659279))

(declare-fun m!659281 () Bool)

(assert (=> b!698535 m!659281))

(declare-fun m!659283 () Bool)

(assert (=> b!698529 m!659283))

(declare-fun m!659285 () Bool)

(assert (=> b!698533 m!659285))

(declare-fun m!659287 () Bool)

(assert (=> b!698534 m!659287))

(declare-fun m!659289 () Bool)

(assert (=> b!698531 m!659289))

(declare-fun m!659291 () Bool)

(assert (=> b!698530 m!659291))

(check-sat (not b!698533) (not b!698529) (not b!698530) (not b!698536) (not start!62404) (not b!698531) (not b!698535) (not b!698534))
(check-sat)
