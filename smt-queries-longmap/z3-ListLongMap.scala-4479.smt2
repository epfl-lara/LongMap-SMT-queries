; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62344 () Bool)

(assert start!62344)

(declare-fun res!462117 () Bool)

(declare-fun e!397009 () Bool)

(assert (=> start!62344 (=> (not res!462117) (not e!397009))))

(declare-datatypes ((array!40023 0))(
  ( (array!40024 (arr!19168 (Array (_ BitVec 32) (_ BitVec 64))) (size!19553 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40023)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62344 (= res!462117 (and (bvslt (size!19553 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19553 a!3591))))))

(assert (=> start!62344 e!397009))

(declare-fun array_inv!14964 (array!40023) Bool)

(assert (=> start!62344 (array_inv!14964 a!3591)))

(assert (=> start!62344 true))

(declare-fun b!698306 () Bool)

(declare-fun res!462114 () Bool)

(assert (=> b!698306 (=> (not res!462114) (not e!397009))))

(declare-datatypes ((List!13209 0))(
  ( (Nil!13206) (Cons!13205 (h!14250 (_ BitVec 64)) (t!19491 List!13209)) )
))
(declare-fun acc!652 () List!13209)

(declare-fun contains!3786 (List!13209 (_ BitVec 64)) Bool)

(assert (=> b!698306 (= res!462114 (not (contains!3786 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698307 () Bool)

(assert (=> b!698307 (= e!397009 false)))

(declare-fun lt!317253 () Bool)

(assert (=> b!698307 (= lt!317253 (contains!3786 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698304 () Bool)

(declare-fun res!462116 () Bool)

(assert (=> b!698304 (=> (not res!462116) (not e!397009))))

(declare-fun noDuplicate!1033 (List!13209) Bool)

(assert (=> b!698304 (= res!462116 (noDuplicate!1033 acc!652))))

(declare-fun b!698305 () Bool)

(declare-fun res!462115 () Bool)

(assert (=> b!698305 (=> (not res!462115) (not e!397009))))

(declare-fun newAcc!49 () List!13209)

(assert (=> b!698305 (= res!462115 (noDuplicate!1033 newAcc!49))))

(assert (= (and start!62344 res!462117) b!698304))

(assert (= (and b!698304 res!462116) b!698305))

(assert (= (and b!698305 res!462115) b!698306))

(assert (= (and b!698306 res!462114) b!698307))

(declare-fun m!658601 () Bool)

(assert (=> start!62344 m!658601))

(declare-fun m!658603 () Bool)

(assert (=> b!698306 m!658603))

(declare-fun m!658605 () Bool)

(assert (=> b!698307 m!658605))

(declare-fun m!658607 () Bool)

(assert (=> b!698305 m!658607))

(declare-fun m!658609 () Bool)

(assert (=> b!698304 m!658609))

(check-sat (not start!62344) (not b!698307) (not b!698305) (not b!698306) (not b!698304))
(check-sat)
