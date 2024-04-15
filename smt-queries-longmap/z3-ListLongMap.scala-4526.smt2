; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62612 () Bool)

(assert start!62612)

(declare-fun b!706536 () Bool)

(declare-fun res!470516 () Bool)

(declare-fun e!397829 () Bool)

(assert (=> b!706536 (=> (not res!470516) (not e!397829))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706536 (= res!470516 (validKeyInArray!0 k0!2824))))

(declare-fun b!706537 () Bool)

(declare-fun res!470508 () Bool)

(assert (=> b!706537 (=> (not res!470508) (not e!397829))))

(declare-datatypes ((List!13387 0))(
  ( (Nil!13384) (Cons!13383 (h!14428 (_ BitVec 64)) (t!19660 List!13387)) )
))
(declare-fun newAcc!49 () List!13387)

(declare-fun contains!3909 (List!13387 (_ BitVec 64)) Bool)

(assert (=> b!706537 (= res!470508 (contains!3909 newAcc!49 k0!2824))))

(declare-fun b!706538 () Bool)

(declare-fun res!470513 () Bool)

(assert (=> b!706538 (=> (not res!470513) (not e!397829))))

(declare-fun acc!652 () List!13387)

(declare-fun noDuplicate!1178 (List!13387) Bool)

(assert (=> b!706538 (= res!470513 (noDuplicate!1178 acc!652))))

(declare-fun b!706539 () Bool)

(declare-fun res!470509 () Bool)

(assert (=> b!706539 (=> (not res!470509) (not e!397829))))

(assert (=> b!706539 (= res!470509 (not (contains!3909 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706540 () Bool)

(declare-fun res!470510 () Bool)

(assert (=> b!706540 (=> (not res!470510) (not e!397829))))

(declare-fun subseq!371 (List!13387 List!13387) Bool)

(assert (=> b!706540 (= res!470510 (subseq!371 acc!652 newAcc!49))))

(declare-fun b!706541 () Bool)

(declare-fun res!470511 () Bool)

(assert (=> b!706541 (=> (not res!470511) (not e!397829))))

(assert (=> b!706541 (= res!470511 (not (contains!3909 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706542 () Bool)

(declare-fun res!470515 () Bool)

(assert (=> b!706542 (=> (not res!470515) (not e!397829))))

(declare-fun -!336 (List!13387 (_ BitVec 64)) List!13387)

(assert (=> b!706542 (= res!470515 (= (-!336 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706543 () Bool)

(assert (=> b!706543 (= e!397829 false)))

(declare-fun lt!317718 () Bool)

(assert (=> b!706543 (= lt!317718 (contains!3909 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706544 () Bool)

(declare-fun res!470514 () Bool)

(assert (=> b!706544 (=> (not res!470514) (not e!397829))))

(assert (=> b!706544 (= res!470514 (not (contains!3909 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706545 () Bool)

(declare-fun res!470517 () Bool)

(assert (=> b!706545 (=> (not res!470517) (not e!397829))))

(assert (=> b!706545 (= res!470517 (not (contains!3909 acc!652 k0!2824)))))

(declare-fun b!706546 () Bool)

(declare-fun res!470506 () Bool)

(assert (=> b!706546 (=> (not res!470506) (not e!397829))))

(assert (=> b!706546 (= res!470506 (noDuplicate!1178 newAcc!49))))

(declare-fun res!470518 () Bool)

(assert (=> start!62612 (=> (not res!470518) (not e!397829))))

(declare-datatypes ((array!40302 0))(
  ( (array!40303 (arr!19307 (Array (_ BitVec 32) (_ BitVec 64))) (size!19689 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40302)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62612 (= res!470518 (and (bvslt (size!19689 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19689 a!3591))))))

(assert (=> start!62612 e!397829))

(assert (=> start!62612 true))

(declare-fun array_inv!15190 (array!40302) Bool)

(assert (=> start!62612 (array_inv!15190 a!3591)))

(declare-fun b!706547 () Bool)

(declare-fun res!470512 () Bool)

(assert (=> b!706547 (=> (not res!470512) (not e!397829))))

(declare-fun arrayNoDuplicates!0 (array!40302 (_ BitVec 32) List!13387) Bool)

(assert (=> b!706547 (= res!470512 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706548 () Bool)

(declare-fun res!470507 () Bool)

(assert (=> b!706548 (=> (not res!470507) (not e!397829))))

(declare-fun arrayContainsKey!0 (array!40302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706548 (= res!470507 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62612 res!470518) b!706538))

(assert (= (and b!706538 res!470513) b!706546))

(assert (= (and b!706546 res!470506) b!706541))

(assert (= (and b!706541 res!470511) b!706544))

(assert (= (and b!706544 res!470514) b!706548))

(assert (= (and b!706548 res!470507) b!706545))

(assert (= (and b!706545 res!470517) b!706536))

(assert (= (and b!706536 res!470516) b!706547))

(assert (= (and b!706547 res!470512) b!706540))

(assert (= (and b!706540 res!470510) b!706537))

(assert (= (and b!706537 res!470508) b!706542))

(assert (= (and b!706542 res!470515) b!706539))

(assert (= (and b!706539 res!470509) b!706543))

(declare-fun m!663819 () Bool)

(assert (=> b!706543 m!663819))

(declare-fun m!663821 () Bool)

(assert (=> b!706542 m!663821))

(declare-fun m!663823 () Bool)

(assert (=> b!706540 m!663823))

(declare-fun m!663825 () Bool)

(assert (=> start!62612 m!663825))

(declare-fun m!663827 () Bool)

(assert (=> b!706539 m!663827))

(declare-fun m!663829 () Bool)

(assert (=> b!706546 m!663829))

(declare-fun m!663831 () Bool)

(assert (=> b!706548 m!663831))

(declare-fun m!663833 () Bool)

(assert (=> b!706538 m!663833))

(declare-fun m!663835 () Bool)

(assert (=> b!706545 m!663835))

(declare-fun m!663837 () Bool)

(assert (=> b!706547 m!663837))

(declare-fun m!663839 () Bool)

(assert (=> b!706536 m!663839))

(declare-fun m!663841 () Bool)

(assert (=> b!706537 m!663841))

(declare-fun m!663843 () Bool)

(assert (=> b!706541 m!663843))

(declare-fun m!663845 () Bool)

(assert (=> b!706544 m!663845))

(check-sat (not b!706546) (not b!706547) (not b!706536) (not b!706543) (not b!706548) (not b!706540) (not start!62612) (not b!706544) (not b!706545) (not b!706539) (not b!706538) (not b!706537) (not b!706541) (not b!706542))
(check-sat)
