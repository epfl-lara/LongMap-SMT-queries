; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63496 () Bool)

(assert start!63496)

(declare-fun b!715047 () Bool)

(declare-fun res!478195 () Bool)

(declare-fun e!401658 () Bool)

(assert (=> b!715047 (=> (not res!478195) (not e!401658))))

(declare-datatypes ((List!13477 0))(
  ( (Nil!13474) (Cons!13473 (h!14518 (_ BitVec 64)) (t!19783 List!13477)) )
))
(declare-fun newAcc!49 () List!13477)

(declare-fun noDuplicate!1268 (List!13477) Bool)

(assert (=> b!715047 (= res!478195 (noDuplicate!1268 newAcc!49))))

(declare-fun b!715048 () Bool)

(declare-fun res!478192 () Bool)

(assert (=> b!715048 (=> (not res!478192) (not e!401658))))

(declare-datatypes ((array!40521 0))(
  ( (array!40522 (arr!19397 (Array (_ BitVec 32) (_ BitVec 64))) (size!19812 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40521)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715048 (= res!478192 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715049 () Bool)

(declare-fun res!478194 () Bool)

(assert (=> b!715049 (=> (not res!478194) (not e!401658))))

(declare-fun acc!652 () List!13477)

(declare-fun subseq!461 (List!13477 List!13477) Bool)

(assert (=> b!715049 (= res!478194 (subseq!461 acc!652 newAcc!49))))

(declare-fun b!715050 () Bool)

(declare-fun res!478196 () Bool)

(assert (=> b!715050 (=> (not res!478196) (not e!401658))))

(declare-fun contains!3999 (List!13477 (_ BitVec 64)) Bool)

(assert (=> b!715050 (= res!478196 (not (contains!3999 acc!652 k0!2824)))))

(declare-fun b!715051 () Bool)

(declare-fun res!478184 () Bool)

(assert (=> b!715051 (=> (not res!478184) (not e!401658))))

(assert (=> b!715051 (= res!478184 (noDuplicate!1268 acc!652))))

(declare-fun b!715052 () Bool)

(assert (=> b!715052 (= e!401658 false)))

(declare-fun lt!318581 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40521 (_ BitVec 32) List!13477) Bool)

(assert (=> b!715052 (= lt!318581 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715053 () Bool)

(declare-fun res!478198 () Bool)

(assert (=> b!715053 (=> (not res!478198) (not e!401658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715053 (= res!478198 (not (validKeyInArray!0 (select (arr!19397 a!3591) from!2969))))))

(declare-fun b!715054 () Bool)

(declare-fun res!478185 () Bool)

(assert (=> b!715054 (=> (not res!478185) (not e!401658))))

(declare-fun -!426 (List!13477 (_ BitVec 64)) List!13477)

(assert (=> b!715054 (= res!478185 (= (-!426 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715055 () Bool)

(declare-fun res!478186 () Bool)

(assert (=> b!715055 (=> (not res!478186) (not e!401658))))

(assert (=> b!715055 (= res!478186 (not (contains!3999 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!478189 () Bool)

(assert (=> start!63496 (=> (not res!478189) (not e!401658))))

(assert (=> start!63496 (= res!478189 (and (bvslt (size!19812 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19812 a!3591))))))

(assert (=> start!63496 e!401658))

(assert (=> start!63496 true))

(declare-fun array_inv!15280 (array!40521) Bool)

(assert (=> start!63496 (array_inv!15280 a!3591)))

(declare-fun b!715056 () Bool)

(declare-fun res!478197 () Bool)

(assert (=> b!715056 (=> (not res!478197) (not e!401658))))

(assert (=> b!715056 (= res!478197 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715057 () Bool)

(declare-fun res!478187 () Bool)

(assert (=> b!715057 (=> (not res!478187) (not e!401658))))

(assert (=> b!715057 (= res!478187 (contains!3999 newAcc!49 k0!2824))))

(declare-fun b!715058 () Bool)

(declare-fun res!478200 () Bool)

(assert (=> b!715058 (=> (not res!478200) (not e!401658))))

(assert (=> b!715058 (= res!478200 (not (contains!3999 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715059 () Bool)

(declare-fun res!478191 () Bool)

(assert (=> b!715059 (=> (not res!478191) (not e!401658))))

(assert (=> b!715059 (= res!478191 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715060 () Bool)

(declare-fun res!478188 () Bool)

(assert (=> b!715060 (=> (not res!478188) (not e!401658))))

(assert (=> b!715060 (= res!478188 (not (contains!3999 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715061 () Bool)

(declare-fun res!478193 () Bool)

(assert (=> b!715061 (=> (not res!478193) (not e!401658))))

(assert (=> b!715061 (= res!478193 (not (contains!3999 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715062 () Bool)

(declare-fun res!478199 () Bool)

(assert (=> b!715062 (=> (not res!478199) (not e!401658))))

(assert (=> b!715062 (= res!478199 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715063 () Bool)

(declare-fun res!478183 () Bool)

(assert (=> b!715063 (=> (not res!478183) (not e!401658))))

(assert (=> b!715063 (= res!478183 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19812 a!3591)))))

(declare-fun b!715064 () Bool)

(declare-fun res!478190 () Bool)

(assert (=> b!715064 (=> (not res!478190) (not e!401658))))

(assert (=> b!715064 (= res!478190 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63496 res!478189) b!715051))

(assert (= (and b!715051 res!478184) b!715047))

(assert (= (and b!715047 res!478195) b!715058))

(assert (= (and b!715058 res!478200) b!715060))

(assert (= (and b!715060 res!478188) b!715059))

(assert (= (and b!715059 res!478191) b!715050))

(assert (= (and b!715050 res!478196) b!715064))

(assert (= (and b!715064 res!478190) b!715062))

(assert (= (and b!715062 res!478199) b!715049))

(assert (= (and b!715049 res!478194) b!715057))

(assert (= (and b!715057 res!478187) b!715054))

(assert (= (and b!715054 res!478185) b!715055))

(assert (= (and b!715055 res!478186) b!715061))

(assert (= (and b!715061 res!478193) b!715063))

(assert (= (and b!715063 res!478183) b!715053))

(assert (= (and b!715053 res!478198) b!715056))

(assert (= (and b!715056 res!478197) b!715048))

(assert (= (and b!715048 res!478192) b!715052))

(declare-fun m!670833 () Bool)

(assert (=> b!715059 m!670833))

(declare-fun m!670835 () Bool)

(assert (=> b!715052 m!670835))

(declare-fun m!670837 () Bool)

(assert (=> b!715061 m!670837))

(declare-fun m!670839 () Bool)

(assert (=> b!715055 m!670839))

(declare-fun m!670841 () Bool)

(assert (=> b!715060 m!670841))

(declare-fun m!670843 () Bool)

(assert (=> b!715064 m!670843))

(declare-fun m!670845 () Bool)

(assert (=> b!715053 m!670845))

(assert (=> b!715053 m!670845))

(declare-fun m!670847 () Bool)

(assert (=> b!715053 m!670847))

(declare-fun m!670849 () Bool)

(assert (=> b!715047 m!670849))

(declare-fun m!670851 () Bool)

(assert (=> b!715048 m!670851))

(declare-fun m!670853 () Bool)

(assert (=> b!715057 m!670853))

(declare-fun m!670855 () Bool)

(assert (=> b!715049 m!670855))

(declare-fun m!670857 () Bool)

(assert (=> b!715058 m!670857))

(declare-fun m!670859 () Bool)

(assert (=> b!715050 m!670859))

(declare-fun m!670861 () Bool)

(assert (=> b!715062 m!670861))

(declare-fun m!670863 () Bool)

(assert (=> start!63496 m!670863))

(declare-fun m!670865 () Bool)

(assert (=> b!715054 m!670865))

(declare-fun m!670867 () Bool)

(assert (=> b!715051 m!670867))

(check-sat (not b!715059) (not b!715047) (not b!715053) (not b!715055) (not b!715061) (not b!715049) (not b!715060) (not b!715064) (not b!715048) (not b!715057) (not b!715052) (not b!715058) (not start!63496) (not b!715051) (not b!715050) (not b!715054) (not b!715062))
(check-sat)
