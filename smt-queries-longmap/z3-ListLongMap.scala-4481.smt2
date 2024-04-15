; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62342 () Bool)

(assert start!62342)

(declare-fun b!698116 () Bool)

(declare-fun res!462086 () Bool)

(declare-fun e!396856 () Bool)

(assert (=> b!698116 (=> (not res!462086) (not e!396856))))

(declare-datatypes ((List!13252 0))(
  ( (Nil!13249) (Cons!13248 (h!14293 (_ BitVec 64)) (t!19525 List!13252)) )
))
(declare-fun acc!652 () List!13252)

(declare-fun noDuplicate!1043 (List!13252) Bool)

(assert (=> b!698116 (= res!462086 (noDuplicate!1043 acc!652))))

(declare-fun b!698117 () Bool)

(declare-fun res!462088 () Bool)

(assert (=> b!698117 (=> (not res!462088) (not e!396856))))

(declare-fun newAcc!49 () List!13252)

(assert (=> b!698117 (= res!462088 (noDuplicate!1043 newAcc!49))))

(declare-fun b!698118 () Bool)

(declare-fun res!462089 () Bool)

(assert (=> b!698118 (=> (not res!462089) (not e!396856))))

(declare-datatypes ((array!40032 0))(
  ( (array!40033 (arr!19172 (Array (_ BitVec 32) (_ BitVec 64))) (size!19554 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40032)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698118 (= res!462089 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!462091 () Bool)

(assert (=> start!62342 (=> (not res!462091) (not e!396856))))

(assert (=> start!62342 (= res!462091 (and (bvslt (size!19554 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19554 a!3591))))))

(assert (=> start!62342 e!396856))

(assert (=> start!62342 true))

(declare-fun array_inv!15055 (array!40032) Bool)

(assert (=> start!62342 (array_inv!15055 a!3591)))

(declare-fun b!698119 () Bool)

(declare-fun res!462087 () Bool)

(assert (=> b!698119 (=> (not res!462087) (not e!396856))))

(declare-fun contains!3774 (List!13252 (_ BitVec 64)) Bool)

(assert (=> b!698119 (= res!462087 (not (contains!3774 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698120 () Bool)

(declare-fun res!462090 () Bool)

(assert (=> b!698120 (=> (not res!462090) (not e!396856))))

(assert (=> b!698120 (= res!462090 (not (contains!3774 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698121 () Bool)

(assert (=> b!698121 (= e!396856 false)))

(declare-fun lt!317007 () Bool)

(assert (=> b!698121 (= lt!317007 (contains!3774 acc!652 k0!2824))))

(assert (= (and start!62342 res!462091) b!698116))

(assert (= (and b!698116 res!462086) b!698117))

(assert (= (and b!698117 res!462088) b!698120))

(assert (= (and b!698120 res!462090) b!698119))

(assert (= (and b!698119 res!462087) b!698118))

(assert (= (and b!698118 res!462089) b!698121))

(declare-fun m!657909 () Bool)

(assert (=> b!698119 m!657909))

(declare-fun m!657911 () Bool)

(assert (=> b!698121 m!657911))

(declare-fun m!657913 () Bool)

(assert (=> b!698118 m!657913))

(declare-fun m!657915 () Bool)

(assert (=> b!698117 m!657915))

(declare-fun m!657917 () Bool)

(assert (=> b!698116 m!657917))

(declare-fun m!657919 () Bool)

(assert (=> b!698120 m!657919))

(declare-fun m!657921 () Bool)

(assert (=> start!62342 m!657921))

(check-sat (not b!698121) (not b!698119) (not b!698120) (not b!698118) (not start!62342) (not b!698116) (not b!698117))
(check-sat)
