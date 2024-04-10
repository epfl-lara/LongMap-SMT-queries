; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62332 () Bool)

(assert start!62332)

(declare-fun b!698234 () Bool)

(declare-fun res!462042 () Bool)

(declare-fun e!396972 () Bool)

(assert (=> b!698234 (=> (not res!462042) (not e!396972))))

(declare-datatypes ((List!13203 0))(
  ( (Nil!13200) (Cons!13199 (h!14244 (_ BitVec 64)) (t!19485 List!13203)) )
))
(declare-fun acc!652 () List!13203)

(declare-fun contains!3780 (List!13203 (_ BitVec 64)) Bool)

(assert (=> b!698234 (= res!462042 (not (contains!3780 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462044 () Bool)

(assert (=> start!62332 (=> (not res!462044) (not e!396972))))

(declare-datatypes ((array!40011 0))(
  ( (array!40012 (arr!19162 (Array (_ BitVec 32) (_ BitVec 64))) (size!19547 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40011)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62332 (= res!462044 (and (bvslt (size!19547 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19547 a!3591))))))

(assert (=> start!62332 e!396972))

(declare-fun array_inv!14958 (array!40011) Bool)

(assert (=> start!62332 (array_inv!14958 a!3591)))

(assert (=> start!62332 true))

(declare-fun b!698235 () Bool)

(assert (=> b!698235 (= e!396972 false)))

(declare-fun lt!317235 () Bool)

(assert (=> b!698235 (= lt!317235 (contains!3780 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698232 () Bool)

(declare-fun res!462045 () Bool)

(assert (=> b!698232 (=> (not res!462045) (not e!396972))))

(declare-fun noDuplicate!1027 (List!13203) Bool)

(assert (=> b!698232 (= res!462045 (noDuplicate!1027 acc!652))))

(declare-fun b!698233 () Bool)

(declare-fun res!462043 () Bool)

(assert (=> b!698233 (=> (not res!462043) (not e!396972))))

(declare-fun newAcc!49 () List!13203)

(assert (=> b!698233 (= res!462043 (noDuplicate!1027 newAcc!49))))

(assert (= (and start!62332 res!462044) b!698232))

(assert (= (and b!698232 res!462045) b!698233))

(assert (= (and b!698233 res!462043) b!698234))

(assert (= (and b!698234 res!462042) b!698235))

(declare-fun m!658541 () Bool)

(assert (=> b!698232 m!658541))

(declare-fun m!658543 () Bool)

(assert (=> b!698234 m!658543))

(declare-fun m!658545 () Bool)

(assert (=> b!698233 m!658545))

(declare-fun m!658547 () Bool)

(assert (=> b!698235 m!658547))

(declare-fun m!658549 () Bool)

(assert (=> start!62332 m!658549))

(check-sat (not b!698233) (not start!62332) (not b!698232) (not b!698234) (not b!698235))
