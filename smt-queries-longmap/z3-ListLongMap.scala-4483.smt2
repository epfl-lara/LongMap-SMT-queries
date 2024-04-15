; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62354 () Bool)

(assert start!62354)

(declare-fun res!462199 () Bool)

(declare-fun e!396893 () Bool)

(assert (=> start!62354 (=> (not res!462199) (not e!396893))))

(declare-datatypes ((array!40044 0))(
  ( (array!40045 (arr!19178 (Array (_ BitVec 32) (_ BitVec 64))) (size!19560 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40044)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62354 (= res!462199 (and (bvslt (size!19560 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19560 a!3591))))))

(assert (=> start!62354 e!396893))

(assert (=> start!62354 true))

(declare-fun array_inv!15061 (array!40044) Bool)

(assert (=> start!62354 (array_inv!15061 a!3591)))

(declare-fun b!698224 () Bool)

(declare-fun res!462197 () Bool)

(assert (=> b!698224 (=> (not res!462197) (not e!396893))))

(declare-datatypes ((List!13258 0))(
  ( (Nil!13255) (Cons!13254 (h!14299 (_ BitVec 64)) (t!19531 List!13258)) )
))
(declare-fun acc!652 () List!13258)

(declare-fun contains!3780 (List!13258 (_ BitVec 64)) Bool)

(assert (=> b!698224 (= res!462197 (not (contains!3780 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698225 () Bool)

(declare-fun res!462196 () Bool)

(assert (=> b!698225 (=> (not res!462196) (not e!396893))))

(assert (=> b!698225 (= res!462196 (not (contains!3780 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698226 () Bool)

(assert (=> b!698226 (= e!396893 false)))

(declare-fun lt!317025 () Bool)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!698226 (= lt!317025 (contains!3780 acc!652 k0!2824))))

(declare-fun b!698227 () Bool)

(declare-fun res!462194 () Bool)

(assert (=> b!698227 (=> (not res!462194) (not e!396893))))

(declare-fun newAcc!49 () List!13258)

(declare-fun noDuplicate!1049 (List!13258) Bool)

(assert (=> b!698227 (= res!462194 (noDuplicate!1049 newAcc!49))))

(declare-fun b!698228 () Bool)

(declare-fun res!462195 () Bool)

(assert (=> b!698228 (=> (not res!462195) (not e!396893))))

(assert (=> b!698228 (= res!462195 (noDuplicate!1049 acc!652))))

(declare-fun b!698229 () Bool)

(declare-fun res!462198 () Bool)

(assert (=> b!698229 (=> (not res!462198) (not e!396893))))

(declare-fun arrayContainsKey!0 (array!40044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698229 (= res!462198 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62354 res!462199) b!698228))

(assert (= (and b!698228 res!462195) b!698227))

(assert (= (and b!698227 res!462194) b!698225))

(assert (= (and b!698225 res!462196) b!698224))

(assert (= (and b!698224 res!462197) b!698229))

(assert (= (and b!698229 res!462198) b!698226))

(declare-fun m!657993 () Bool)

(assert (=> b!698226 m!657993))

(declare-fun m!657995 () Bool)

(assert (=> b!698229 m!657995))

(declare-fun m!657997 () Bool)

(assert (=> b!698225 m!657997))

(declare-fun m!657999 () Bool)

(assert (=> b!698228 m!657999))

(declare-fun m!658001 () Bool)

(assert (=> b!698224 m!658001))

(declare-fun m!658003 () Bool)

(assert (=> start!62354 m!658003))

(declare-fun m!658005 () Bool)

(assert (=> b!698227 m!658005))

(check-sat (not b!698227) (not b!698225) (not b!698228) (not b!698226) (not b!698229) (not b!698224) (not start!62354))
(check-sat)
