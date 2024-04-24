; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62650 () Bool)

(assert start!62650)

(declare-fun b!706423 () Bool)

(declare-fun res!470135 () Bool)

(declare-fun e!398037 () Bool)

(assert (=> b!706423 (=> (not res!470135) (not e!398037))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706423 (= res!470135 (validKeyInArray!0 k0!2824))))

(declare-fun b!706424 () Bool)

(declare-fun res!470134 () Bool)

(assert (=> b!706424 (=> (not res!470134) (not e!398037))))

(declare-datatypes ((List!13236 0))(
  ( (Nil!13233) (Cons!13232 (h!14280 (_ BitVec 64)) (t!19510 List!13236)) )
))
(declare-fun acc!652 () List!13236)

(declare-fun newAcc!49 () List!13236)

(declare-fun subseq!356 (List!13236 List!13236) Bool)

(assert (=> b!706424 (= res!470134 (subseq!356 acc!652 newAcc!49))))

(declare-fun b!706425 () Bool)

(declare-fun res!470138 () Bool)

(assert (=> b!706425 (=> (not res!470138) (not e!398037))))

(declare-datatypes ((array!40269 0))(
  ( (array!40270 (arr!19288 (Array (_ BitVec 32) (_ BitVec 64))) (size!19671 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40269)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40269 (_ BitVec 32) List!13236) Bool)

(assert (=> b!706425 (= res!470138 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!470140 () Bool)

(assert (=> start!62650 (=> (not res!470140) (not e!398037))))

(assert (=> start!62650 (= res!470140 (and (bvslt (size!19671 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19671 a!3591))))))

(assert (=> start!62650 e!398037))

(assert (=> start!62650 true))

(declare-fun array_inv!15147 (array!40269) Bool)

(assert (=> start!62650 (array_inv!15147 a!3591)))

(declare-fun b!706426 () Bool)

(declare-fun res!470137 () Bool)

(assert (=> b!706426 (=> (not res!470137) (not e!398037))))

(declare-fun noDuplicate!1162 (List!13236) Bool)

(assert (=> b!706426 (= res!470137 (noDuplicate!1162 acc!652))))

(declare-fun b!706427 () Bool)

(declare-fun res!470146 () Bool)

(assert (=> b!706427 (=> (not res!470146) (not e!398037))))

(declare-fun contains!3888 (List!13236 (_ BitVec 64)) Bool)

(assert (=> b!706427 (= res!470146 (not (contains!3888 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706428 () Bool)

(declare-fun res!470145 () Bool)

(assert (=> b!706428 (=> (not res!470145) (not e!398037))))

(declare-fun arrayContainsKey!0 (array!40269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706428 (= res!470145 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706429 () Bool)

(declare-fun res!470141 () Bool)

(assert (=> b!706429 (=> (not res!470141) (not e!398037))))

(assert (=> b!706429 (= res!470141 (not (contains!3888 acc!652 k0!2824)))))

(declare-fun b!706430 () Bool)

(declare-fun res!470143 () Bool)

(assert (=> b!706430 (=> (not res!470143) (not e!398037))))

(assert (=> b!706430 (= res!470143 (contains!3888 newAcc!49 k0!2824))))

(declare-fun b!706431 () Bool)

(declare-fun res!470144 () Bool)

(assert (=> b!706431 (=> (not res!470144) (not e!398037))))

(assert (=> b!706431 (= res!470144 (noDuplicate!1162 newAcc!49))))

(declare-fun b!706432 () Bool)

(declare-fun res!470136 () Bool)

(assert (=> b!706432 (=> (not res!470136) (not e!398037))))

(declare-fun -!320 (List!13236 (_ BitVec 64)) List!13236)

(assert (=> b!706432 (= res!470136 (= (-!320 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706433 () Bool)

(declare-fun res!470142 () Bool)

(assert (=> b!706433 (=> (not res!470142) (not e!398037))))

(assert (=> b!706433 (= res!470142 (not (contains!3888 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706434 () Bool)

(declare-fun res!470139 () Bool)

(assert (=> b!706434 (=> (not res!470139) (not e!398037))))

(assert (=> b!706434 (= res!470139 (not (contains!3888 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706435 () Bool)

(assert (=> b!706435 (= e!398037 false)))

(declare-fun lt!318033 () Bool)

(assert (=> b!706435 (= lt!318033 (contains!3888 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!62650 res!470140) b!706426))

(assert (= (and b!706426 res!470137) b!706431))

(assert (= (and b!706431 res!470144) b!706434))

(assert (= (and b!706434 res!470139) b!706433))

(assert (= (and b!706433 res!470142) b!706428))

(assert (= (and b!706428 res!470145) b!706429))

(assert (= (and b!706429 res!470141) b!706423))

(assert (= (and b!706423 res!470135) b!706425))

(assert (= (and b!706425 res!470138) b!706424))

(assert (= (and b!706424 res!470134) b!706430))

(assert (= (and b!706430 res!470143) b!706432))

(assert (= (and b!706432 res!470136) b!706427))

(assert (= (and b!706427 res!470146) b!706435))

(declare-fun m!664815 () Bool)

(assert (=> b!706426 m!664815))

(declare-fun m!664817 () Bool)

(assert (=> b!706428 m!664817))

(declare-fun m!664819 () Bool)

(assert (=> b!706434 m!664819))

(declare-fun m!664821 () Bool)

(assert (=> b!706424 m!664821))

(declare-fun m!664823 () Bool)

(assert (=> b!706430 m!664823))

(declare-fun m!664825 () Bool)

(assert (=> b!706433 m!664825))

(declare-fun m!664827 () Bool)

(assert (=> b!706423 m!664827))

(declare-fun m!664829 () Bool)

(assert (=> b!706435 m!664829))

(declare-fun m!664831 () Bool)

(assert (=> start!62650 m!664831))

(declare-fun m!664833 () Bool)

(assert (=> b!706425 m!664833))

(declare-fun m!664835 () Bool)

(assert (=> b!706431 m!664835))

(declare-fun m!664837 () Bool)

(assert (=> b!706429 m!664837))

(declare-fun m!664839 () Bool)

(assert (=> b!706427 m!664839))

(declare-fun m!664841 () Bool)

(assert (=> b!706432 m!664841))

(check-sat (not b!706426) (not b!706424) (not b!706430) (not b!706425) (not b!706428) (not start!62650) (not b!706432) (not b!706431) (not b!706434) (not b!706435) (not b!706433) (not b!706429) (not b!706423) (not b!706427))
(check-sat)
