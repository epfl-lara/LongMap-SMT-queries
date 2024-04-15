; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62378 () Bool)

(assert start!62378)

(declare-fun b!699079 () Bool)

(declare-fun res!463048 () Bool)

(declare-fun e!396995 () Bool)

(assert (=> b!699079 (=> (not res!463048) (not e!396995))))

(declare-datatypes ((array!40068 0))(
  ( (array!40069 (arr!19190 (Array (_ BitVec 32) (_ BitVec 64))) (size!19572 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40068)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13270 0))(
  ( (Nil!13267) (Cons!13266 (h!14311 (_ BitVec 64)) (t!19543 List!13270)) )
))
(declare-fun lt!317121 () List!13270)

(declare-fun arrayNoDuplicates!0 (array!40068 (_ BitVec 32) List!13270) Bool)

(assert (=> b!699079 (= res!463048 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317121))))

(declare-fun b!699080 () Bool)

(declare-fun res!463058 () Bool)

(assert (=> b!699080 (=> (not res!463058) (not e!396995))))

(declare-fun noDuplicate!1061 (List!13270) Bool)

(assert (=> b!699080 (= res!463058 (noDuplicate!1061 lt!317121))))

(declare-fun b!699081 () Bool)

(declare-fun res!463054 () Bool)

(declare-fun e!396994 () Bool)

(assert (=> b!699081 (=> (not res!463054) (not e!396994))))

(declare-fun newAcc!49 () List!13270)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13270)

(declare-fun -!219 (List!13270 (_ BitVec 64)) List!13270)

(assert (=> b!699081 (= res!463054 (= (-!219 newAcc!49 k0!2824) acc!652))))

(declare-fun b!699082 () Bool)

(declare-fun res!463053 () Bool)

(assert (=> b!699082 (=> (not res!463053) (not e!396994))))

(declare-fun contains!3792 (List!13270 (_ BitVec 64)) Bool)

(assert (=> b!699082 (= res!463053 (not (contains!3792 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699083 () Bool)

(declare-fun res!463061 () Bool)

(assert (=> b!699083 (=> (not res!463061) (not e!396995))))

(declare-fun arrayContainsKey!0 (array!40068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!699083 (= res!463061 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!699084 () Bool)

(declare-fun res!463050 () Bool)

(assert (=> b!699084 (=> (not res!463050) (not e!396994))))

(assert (=> b!699084 (= res!463050 (contains!3792 newAcc!49 k0!2824))))

(declare-fun b!699085 () Bool)

(declare-fun res!463056 () Bool)

(assert (=> b!699085 (=> (not res!463056) (not e!396995))))

(assert (=> b!699085 (= res!463056 (not (contains!3792 lt!317121 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699086 () Bool)

(declare-fun res!463051 () Bool)

(assert (=> b!699086 (=> (not res!463051) (not e!396994))))

(declare-fun subseq!254 (List!13270 List!13270) Bool)

(assert (=> b!699086 (= res!463051 (subseq!254 acc!652 newAcc!49))))

(declare-fun b!699087 () Bool)

(declare-fun res!463071 () Bool)

(assert (=> b!699087 (=> (not res!463071) (not e!396995))))

(assert (=> b!699087 (= res!463071 (not (contains!3792 lt!317121 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699088 () Bool)

(declare-fun res!463057 () Bool)

(assert (=> b!699088 (=> (not res!463057) (not e!396994))))

(assert (=> b!699088 (= res!463057 (not (contains!3792 acc!652 k0!2824)))))

(declare-fun b!699089 () Bool)

(declare-fun res!463066 () Bool)

(assert (=> b!699089 (=> (not res!463066) (not e!396995))))

(declare-fun lt!317120 () List!13270)

(assert (=> b!699089 (= res!463066 (contains!3792 lt!317120 k0!2824))))

(declare-fun b!699090 () Bool)

(declare-fun res!463072 () Bool)

(assert (=> b!699090 (=> (not res!463072) (not e!396994))))

(assert (=> b!699090 (= res!463072 (not (contains!3792 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699091 () Bool)

(assert (=> b!699091 (= e!396995 false)))

(declare-fun lt!317119 () Bool)

(assert (=> b!699091 (= lt!317119 (contains!3792 lt!317120 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!699092 () Bool)

(declare-fun res!463069 () Bool)

(assert (=> b!699092 (=> (not res!463069) (not e!396994))))

(assert (=> b!699092 (= res!463069 (not (contains!3792 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699093 () Bool)

(declare-fun res!463064 () Bool)

(assert (=> b!699093 (=> (not res!463064) (not e!396994))))

(assert (=> b!699093 (= res!463064 (noDuplicate!1061 newAcc!49))))

(declare-fun b!699094 () Bool)

(declare-fun res!463049 () Bool)

(assert (=> b!699094 (=> (not res!463049) (not e!396995))))

(assert (=> b!699094 (= res!463049 (= (-!219 lt!317120 k0!2824) lt!317121))))

(declare-fun b!699078 () Bool)

(declare-fun res!463075 () Bool)

(assert (=> b!699078 (=> (not res!463075) (not e!396994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!699078 (= res!463075 (validKeyInArray!0 k0!2824))))

(declare-fun res!463068 () Bool)

(assert (=> start!62378 (=> (not res!463068) (not e!396994))))

(assert (=> start!62378 (= res!463068 (and (bvslt (size!19572 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19572 a!3591))))))

(assert (=> start!62378 e!396994))

(assert (=> start!62378 true))

(declare-fun array_inv!15073 (array!40068) Bool)

(assert (=> start!62378 (array_inv!15073 a!3591)))

(declare-fun b!699095 () Bool)

(declare-fun res!463070 () Bool)

(assert (=> b!699095 (=> (not res!463070) (not e!396995))))

(assert (=> b!699095 (= res!463070 (not (contains!3792 lt!317120 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699096 () Bool)

(declare-fun res!463055 () Bool)

(assert (=> b!699096 (=> (not res!463055) (not e!396994))))

(assert (=> b!699096 (= res!463055 (validKeyInArray!0 (select (arr!19190 a!3591) from!2969)))))

(declare-fun b!699097 () Bool)

(declare-fun res!463059 () Bool)

(assert (=> b!699097 (=> (not res!463059) (not e!396994))))

(assert (=> b!699097 (= res!463059 (not (contains!3792 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699098 () Bool)

(declare-fun res!463063 () Bool)

(assert (=> b!699098 (=> (not res!463063) (not e!396995))))

(assert (=> b!699098 (= res!463063 (noDuplicate!1061 lt!317120))))

(declare-fun b!699099 () Bool)

(declare-fun res!463062 () Bool)

(assert (=> b!699099 (=> (not res!463062) (not e!396995))))

(assert (=> b!699099 (= res!463062 (not (contains!3792 lt!317121 k0!2824)))))

(declare-fun b!699100 () Bool)

(declare-fun res!463073 () Bool)

(assert (=> b!699100 (=> (not res!463073) (not e!396994))))

(assert (=> b!699100 (= res!463073 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19572 a!3591)))))

(declare-fun b!699101 () Bool)

(declare-fun res!463074 () Bool)

(assert (=> b!699101 (=> (not res!463074) (not e!396995))))

(assert (=> b!699101 (= res!463074 (subseq!254 lt!317121 lt!317120))))

(declare-fun b!699102 () Bool)

(declare-fun res!463067 () Bool)

(assert (=> b!699102 (=> (not res!463067) (not e!396994))))

(assert (=> b!699102 (= res!463067 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!699103 () Bool)

(declare-fun res!463052 () Bool)

(assert (=> b!699103 (=> (not res!463052) (not e!396994))))

(assert (=> b!699103 (= res!463052 (noDuplicate!1061 acc!652))))

(declare-fun b!699104 () Bool)

(declare-fun res!463065 () Bool)

(assert (=> b!699104 (=> (not res!463065) (not e!396994))))

(assert (=> b!699104 (= res!463065 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!699105 () Bool)

(assert (=> b!699105 (= e!396994 e!396995)))

(declare-fun res!463060 () Bool)

(assert (=> b!699105 (=> (not res!463060) (not e!396995))))

(assert (=> b!699105 (= res!463060 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!451 (List!13270 (_ BitVec 64)) List!13270)

(assert (=> b!699105 (= lt!317120 ($colon$colon!451 newAcc!49 (select (arr!19190 a!3591) from!2969)))))

(assert (=> b!699105 (= lt!317121 ($colon$colon!451 acc!652 (select (arr!19190 a!3591) from!2969)))))

(assert (= (and start!62378 res!463068) b!699103))

(assert (= (and b!699103 res!463052) b!699093))

(assert (= (and b!699093 res!463064) b!699090))

(assert (= (and b!699090 res!463072) b!699092))

(assert (= (and b!699092 res!463069) b!699104))

(assert (= (and b!699104 res!463065) b!699088))

(assert (= (and b!699088 res!463057) b!699078))

(assert (= (and b!699078 res!463075) b!699102))

(assert (= (and b!699102 res!463067) b!699086))

(assert (= (and b!699086 res!463051) b!699084))

(assert (= (and b!699084 res!463050) b!699081))

(assert (= (and b!699081 res!463054) b!699082))

(assert (= (and b!699082 res!463053) b!699097))

(assert (= (and b!699097 res!463059) b!699100))

(assert (= (and b!699100 res!463073) b!699096))

(assert (= (and b!699096 res!463055) b!699105))

(assert (= (and b!699105 res!463060) b!699080))

(assert (= (and b!699080 res!463058) b!699098))

(assert (= (and b!699098 res!463063) b!699087))

(assert (= (and b!699087 res!463071) b!699085))

(assert (= (and b!699085 res!463056) b!699083))

(assert (= (and b!699083 res!463061) b!699099))

(assert (= (and b!699099 res!463062) b!699079))

(assert (= (and b!699079 res!463048) b!699101))

(assert (= (and b!699101 res!463074) b!699089))

(assert (= (and b!699089 res!463066) b!699094))

(assert (= (and b!699094 res!463049) b!699095))

(assert (= (and b!699095 res!463070) b!699091))

(declare-fun m!658575 () Bool)

(assert (=> b!699090 m!658575))

(declare-fun m!658577 () Bool)

(assert (=> b!699082 m!658577))

(declare-fun m!658579 () Bool)

(assert (=> b!699098 m!658579))

(declare-fun m!658581 () Bool)

(assert (=> b!699088 m!658581))

(declare-fun m!658583 () Bool)

(assert (=> b!699078 m!658583))

(declare-fun m!658585 () Bool)

(assert (=> b!699091 m!658585))

(declare-fun m!658587 () Bool)

(assert (=> b!699096 m!658587))

(assert (=> b!699096 m!658587))

(declare-fun m!658589 () Bool)

(assert (=> b!699096 m!658589))

(declare-fun m!658591 () Bool)

(assert (=> b!699089 m!658591))

(declare-fun m!658593 () Bool)

(assert (=> b!699092 m!658593))

(declare-fun m!658595 () Bool)

(assert (=> b!699084 m!658595))

(declare-fun m!658597 () Bool)

(assert (=> b!699103 m!658597))

(declare-fun m!658599 () Bool)

(assert (=> b!699081 m!658599))

(declare-fun m!658601 () Bool)

(assert (=> b!699104 m!658601))

(declare-fun m!658603 () Bool)

(assert (=> b!699083 m!658603))

(declare-fun m!658605 () Bool)

(assert (=> b!699094 m!658605))

(declare-fun m!658607 () Bool)

(assert (=> b!699097 m!658607))

(declare-fun m!658609 () Bool)

(assert (=> b!699086 m!658609))

(declare-fun m!658611 () Bool)

(assert (=> b!699101 m!658611))

(declare-fun m!658613 () Bool)

(assert (=> b!699087 m!658613))

(declare-fun m!658615 () Bool)

(assert (=> b!699080 m!658615))

(declare-fun m!658617 () Bool)

(assert (=> b!699099 m!658617))

(declare-fun m!658619 () Bool)

(assert (=> b!699085 m!658619))

(declare-fun m!658621 () Bool)

(assert (=> start!62378 m!658621))

(assert (=> b!699105 m!658587))

(assert (=> b!699105 m!658587))

(declare-fun m!658623 () Bool)

(assert (=> b!699105 m!658623))

(assert (=> b!699105 m!658587))

(declare-fun m!658625 () Bool)

(assert (=> b!699105 m!658625))

(declare-fun m!658627 () Bool)

(assert (=> b!699102 m!658627))

(declare-fun m!658629 () Bool)

(assert (=> b!699093 m!658629))

(declare-fun m!658631 () Bool)

(assert (=> b!699095 m!658631))

(declare-fun m!658633 () Bool)

(assert (=> b!699079 m!658633))

(check-sat (not b!699081) (not b!699086) (not b!699098) (not b!699099) (not b!699078) (not b!699102) (not b!699080) (not b!699094) (not b!699095) (not b!699092) (not b!699082) (not b!699084) (not b!699105) (not b!699083) (not b!699104) (not b!699101) (not b!699087) (not b!699079) (not b!699091) (not b!699090) (not start!62378) (not b!699096) (not b!699103) (not b!699093) (not b!699089) (not b!699088) (not b!699097) (not b!699085))
(check-sat)
