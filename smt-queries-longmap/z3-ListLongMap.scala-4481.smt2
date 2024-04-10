; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62356 () Bool)

(assert start!62356)

(declare-fun b!698422 () Bool)

(declare-fun res!462234 () Bool)

(declare-fun e!397045 () Bool)

(assert (=> b!698422 (=> (not res!462234) (not e!397045))))

(declare-datatypes ((List!13215 0))(
  ( (Nil!13212) (Cons!13211 (h!14256 (_ BitVec 64)) (t!19497 List!13215)) )
))
(declare-fun acc!652 () List!13215)

(declare-fun noDuplicate!1039 (List!13215) Bool)

(assert (=> b!698422 (= res!462234 (noDuplicate!1039 acc!652))))

(declare-fun b!698423 () Bool)

(declare-fun res!462235 () Bool)

(assert (=> b!698423 (=> (not res!462235) (not e!397045))))

(declare-fun contains!3792 (List!13215 (_ BitVec 64)) Bool)

(assert (=> b!698423 (= res!462235 (not (contains!3792 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698424 () Bool)

(declare-fun res!462232 () Bool)

(assert (=> b!698424 (=> (not res!462232) (not e!397045))))

(declare-fun newAcc!49 () List!13215)

(assert (=> b!698424 (= res!462232 (noDuplicate!1039 newAcc!49))))

(declare-fun b!698425 () Bool)

(declare-fun res!462236 () Bool)

(assert (=> b!698425 (=> (not res!462236) (not e!397045))))

(assert (=> b!698425 (= res!462236 (not (contains!3792 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698426 () Bool)

(declare-fun res!462233 () Bool)

(assert (=> b!698426 (=> (not res!462233) (not e!397045))))

(declare-datatypes ((array!40035 0))(
  ( (array!40036 (arr!19174 (Array (_ BitVec 32) (_ BitVec 64))) (size!19559 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40035)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698426 (= res!462233 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!462237 () Bool)

(assert (=> start!62356 (=> (not res!462237) (not e!397045))))

(assert (=> start!62356 (= res!462237 (and (bvslt (size!19559 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19559 a!3591))))))

(assert (=> start!62356 e!397045))

(assert (=> start!62356 true))

(declare-fun array_inv!14970 (array!40035) Bool)

(assert (=> start!62356 (array_inv!14970 a!3591)))

(declare-fun b!698427 () Bool)

(assert (=> b!698427 (= e!397045 false)))

(declare-fun lt!317262 () Bool)

(assert (=> b!698427 (= lt!317262 (contains!3792 acc!652 k0!2824))))

(assert (= (and start!62356 res!462237) b!698422))

(assert (= (and b!698422 res!462234) b!698424))

(assert (= (and b!698424 res!462232) b!698425))

(assert (= (and b!698425 res!462236) b!698423))

(assert (= (and b!698423 res!462235) b!698426))

(assert (= (and b!698426 res!462233) b!698427))

(declare-fun m!658683 () Bool)

(assert (=> b!698422 m!658683))

(declare-fun m!658685 () Bool)

(assert (=> b!698425 m!658685))

(declare-fun m!658687 () Bool)

(assert (=> b!698427 m!658687))

(declare-fun m!658689 () Bool)

(assert (=> b!698426 m!658689))

(declare-fun m!658691 () Bool)

(assert (=> b!698423 m!658691))

(declare-fun m!658693 () Bool)

(assert (=> b!698424 m!658693))

(declare-fun m!658695 () Bool)

(assert (=> start!62356 m!658695))

(check-sat (not b!698424) (not b!698426) (not start!62356) (not b!698423) (not b!698422) (not b!698427) (not b!698425))
(check-sat)
