; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62362 () Bool)

(assert start!62362)

(declare-fun b!698476 () Bool)

(declare-fun res!462290 () Bool)

(declare-fun e!397062 () Bool)

(assert (=> b!698476 (=> (not res!462290) (not e!397062))))

(declare-datatypes ((List!13218 0))(
  ( (Nil!13215) (Cons!13214 (h!14259 (_ BitVec 64)) (t!19500 List!13218)) )
))
(declare-fun newAcc!49 () List!13218)

(declare-fun noDuplicate!1042 (List!13218) Bool)

(assert (=> b!698476 (= res!462290 (noDuplicate!1042 newAcc!49))))

(declare-fun b!698478 () Bool)

(declare-fun res!462286 () Bool)

(assert (=> b!698478 (=> (not res!462286) (not e!397062))))

(declare-datatypes ((array!40041 0))(
  ( (array!40042 (arr!19177 (Array (_ BitVec 32) (_ BitVec 64))) (size!19562 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40041)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698478 (= res!462286 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!698479 () Bool)

(declare-fun res!462287 () Bool)

(assert (=> b!698479 (=> (not res!462287) (not e!397062))))

(declare-fun acc!652 () List!13218)

(assert (=> b!698479 (= res!462287 (noDuplicate!1042 acc!652))))

(declare-fun b!698480 () Bool)

(declare-fun res!462289 () Bool)

(assert (=> b!698480 (=> (not res!462289) (not e!397062))))

(declare-fun contains!3795 (List!13218 (_ BitVec 64)) Bool)

(assert (=> b!698480 (= res!462289 (not (contains!3795 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698481 () Bool)

(assert (=> b!698481 (= e!397062 false)))

(declare-fun lt!317271 () Bool)

(assert (=> b!698481 (= lt!317271 (contains!3795 acc!652 k0!2824))))

(declare-fun b!698477 () Bool)

(declare-fun res!462291 () Bool)

(assert (=> b!698477 (=> (not res!462291) (not e!397062))))

(assert (=> b!698477 (= res!462291 (not (contains!3795 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462288 () Bool)

(assert (=> start!62362 (=> (not res!462288) (not e!397062))))

(assert (=> start!62362 (= res!462288 (and (bvslt (size!19562 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19562 a!3591))))))

(assert (=> start!62362 e!397062))

(assert (=> start!62362 true))

(declare-fun array_inv!14973 (array!40041) Bool)

(assert (=> start!62362 (array_inv!14973 a!3591)))

(assert (= (and start!62362 res!462288) b!698479))

(assert (= (and b!698479 res!462287) b!698476))

(assert (= (and b!698476 res!462290) b!698477))

(assert (= (and b!698477 res!462291) b!698480))

(assert (= (and b!698480 res!462289) b!698478))

(assert (= (and b!698478 res!462286) b!698481))

(declare-fun m!658725 () Bool)

(assert (=> b!698477 m!658725))

(declare-fun m!658727 () Bool)

(assert (=> b!698481 m!658727))

(declare-fun m!658729 () Bool)

(assert (=> b!698476 m!658729))

(declare-fun m!658731 () Bool)

(assert (=> b!698478 m!658731))

(declare-fun m!658733 () Bool)

(assert (=> b!698479 m!658733))

(declare-fun m!658735 () Bool)

(assert (=> b!698480 m!658735))

(declare-fun m!658737 () Bool)

(assert (=> start!62362 m!658737))

(check-sat (not b!698478) (not b!698477) (not b!698479) (not start!62362) (not b!698480) (not b!698481) (not b!698476))
(check-sat)
