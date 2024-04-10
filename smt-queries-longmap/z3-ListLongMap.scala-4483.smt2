; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62368 () Bool)

(assert start!62368)

(declare-fun res!462344 () Bool)

(declare-fun e!397081 () Bool)

(assert (=> start!62368 (=> (not res!462344) (not e!397081))))

(declare-datatypes ((array!40047 0))(
  ( (array!40048 (arr!19180 (Array (_ BitVec 32) (_ BitVec 64))) (size!19565 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40047)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62368 (= res!462344 (and (bvslt (size!19565 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19565 a!3591))))))

(assert (=> start!62368 e!397081))

(assert (=> start!62368 true))

(declare-fun array_inv!14976 (array!40047) Bool)

(assert (=> start!62368 (array_inv!14976 a!3591)))

(declare-fun b!698530 () Bool)

(declare-fun res!462345 () Bool)

(assert (=> b!698530 (=> (not res!462345) (not e!397081))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698530 (= res!462345 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!698531 () Bool)

(declare-fun res!462340 () Bool)

(assert (=> b!698531 (=> (not res!462340) (not e!397081))))

(declare-datatypes ((List!13221 0))(
  ( (Nil!13218) (Cons!13217 (h!14262 (_ BitVec 64)) (t!19503 List!13221)) )
))
(declare-fun acc!652 () List!13221)

(declare-fun contains!3798 (List!13221 (_ BitVec 64)) Bool)

(assert (=> b!698531 (= res!462340 (not (contains!3798 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698532 () Bool)

(assert (=> b!698532 (= e!397081 false)))

(declare-fun lt!317280 () Bool)

(assert (=> b!698532 (= lt!317280 (contains!3798 acc!652 k0!2824))))

(declare-fun b!698533 () Bool)

(declare-fun res!462341 () Bool)

(assert (=> b!698533 (=> (not res!462341) (not e!397081))))

(declare-fun noDuplicate!1045 (List!13221) Bool)

(assert (=> b!698533 (= res!462341 (noDuplicate!1045 acc!652))))

(declare-fun b!698534 () Bool)

(declare-fun res!462343 () Bool)

(assert (=> b!698534 (=> (not res!462343) (not e!397081))))

(assert (=> b!698534 (= res!462343 (not (contains!3798 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698535 () Bool)

(declare-fun res!462342 () Bool)

(assert (=> b!698535 (=> (not res!462342) (not e!397081))))

(declare-fun newAcc!49 () List!13221)

(assert (=> b!698535 (= res!462342 (noDuplicate!1045 newAcc!49))))

(assert (= (and start!62368 res!462344) b!698533))

(assert (= (and b!698533 res!462341) b!698535))

(assert (= (and b!698535 res!462342) b!698531))

(assert (= (and b!698531 res!462340) b!698534))

(assert (= (and b!698534 res!462343) b!698530))

(assert (= (and b!698530 res!462345) b!698532))

(declare-fun m!658767 () Bool)

(assert (=> start!62368 m!658767))

(declare-fun m!658769 () Bool)

(assert (=> b!698534 m!658769))

(declare-fun m!658771 () Bool)

(assert (=> b!698532 m!658771))

(declare-fun m!658773 () Bool)

(assert (=> b!698533 m!658773))

(declare-fun m!658775 () Bool)

(assert (=> b!698531 m!658775))

(declare-fun m!658777 () Bool)

(assert (=> b!698535 m!658777))

(declare-fun m!658779 () Bool)

(assert (=> b!698530 m!658779))

(check-sat (not b!698531) (not start!62368) (not b!698535) (not b!698533) (not b!698530) (not b!698532) (not b!698534))
(check-sat)
