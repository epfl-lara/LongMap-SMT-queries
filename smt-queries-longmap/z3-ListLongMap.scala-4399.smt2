; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60552 () Bool)

(assert start!60552)

(declare-fun b!680106 () Bool)

(declare-fun res!446315 () Bool)

(declare-fun e!387451 () Bool)

(assert (=> b!680106 (=> (not res!446315) (not e!387451))))

(declare-fun e!387448 () Bool)

(assert (=> b!680106 (= res!446315 e!387448)))

(declare-fun res!446327 () Bool)

(assert (=> b!680106 (=> res!446327 e!387448)))

(declare-fun e!387450 () Bool)

(assert (=> b!680106 (= res!446327 e!387450)))

(declare-fun res!446329 () Bool)

(assert (=> b!680106 (=> (not res!446329) (not e!387450))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680106 (= res!446329 (bvsgt from!3004 i!1382))))

(declare-fun b!680107 () Bool)

(declare-fun res!446316 () Bool)

(assert (=> b!680107 (=> (not res!446316) (not e!387451))))

(declare-datatypes ((array!39471 0))(
  ( (array!39472 (arr!18922 (Array (_ BitVec 32) (_ BitVec 64))) (size!19286 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39471)

(assert (=> b!680107 (= res!446316 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19286 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680108 () Bool)

(declare-datatypes ((Unit!23805 0))(
  ( (Unit!23806) )
))
(declare-fun e!387453 () Unit!23805)

(declare-fun Unit!23807 () Unit!23805)

(assert (=> b!680108 (= e!387453 Unit!23807)))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lt!313088 () Unit!23805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39471 (_ BitVec 64) (_ BitVec 32)) Unit!23805)

(assert (=> b!680108 (= lt!313088 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680108 false))

(declare-fun res!446324 () Bool)

(assert (=> start!60552 (=> (not res!446324) (not e!387451))))

(assert (=> start!60552 (= res!446324 (and (bvslt (size!19286 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19286 a!3626))))))

(assert (=> start!60552 e!387451))

(assert (=> start!60552 true))

(declare-fun array_inv!14781 (array!39471) Bool)

(assert (=> start!60552 (array_inv!14781 a!3626)))

(declare-fun b!680109 () Bool)

(declare-fun res!446322 () Bool)

(assert (=> b!680109 (=> (not res!446322) (not e!387451))))

(assert (=> b!680109 (= res!446322 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19286 a!3626))))))

(declare-fun b!680110 () Bool)

(declare-datatypes ((List!12870 0))(
  ( (Nil!12867) (Cons!12866 (h!13914 (_ BitVec 64)) (t!19090 List!12870)) )
))
(declare-fun acc!681 () List!12870)

(declare-fun contains!3522 (List!12870 (_ BitVec 64)) Bool)

(assert (=> b!680110 (= e!387450 (contains!3522 acc!681 k0!2843))))

(declare-fun b!680111 () Bool)

(declare-fun res!446328 () Bool)

(assert (=> b!680111 (=> (not res!446328) (not e!387451))))

(assert (=> b!680111 (= res!446328 (not (contains!3522 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680112 () Bool)

(declare-fun res!446320 () Bool)

(assert (=> b!680112 (=> (not res!446320) (not e!387451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680112 (= res!446320 (validKeyInArray!0 k0!2843))))

(declare-fun b!680113 () Bool)

(declare-fun res!446325 () Bool)

(assert (=> b!680113 (=> (not res!446325) (not e!387451))))

(declare-fun arrayContainsKey!0 (array!39471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680113 (= res!446325 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680114 () Bool)

(declare-fun res!446319 () Bool)

(assert (=> b!680114 (=> (not res!446319) (not e!387451))))

(declare-fun arrayNoDuplicates!0 (array!39471 (_ BitVec 32) List!12870) Bool)

(assert (=> b!680114 (= res!446319 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12867))))

(declare-fun b!680115 () Bool)

(declare-fun Unit!23808 () Unit!23805)

(assert (=> b!680115 (= e!387453 Unit!23808)))

(declare-fun b!680116 () Bool)

(declare-fun res!446317 () Bool)

(assert (=> b!680116 (=> (not res!446317) (not e!387451))))

(assert (=> b!680116 (= res!446317 (not (contains!3522 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680117 () Bool)

(declare-fun e!387449 () Bool)

(assert (=> b!680117 (= e!387448 e!387449)))

(declare-fun res!446326 () Bool)

(assert (=> b!680117 (=> (not res!446326) (not e!387449))))

(assert (=> b!680117 (= res!446326 (bvsle from!3004 i!1382))))

(declare-fun b!680118 () Bool)

(declare-fun e!387452 () Bool)

(assert (=> b!680118 (= e!387452 true)))

(declare-fun subseq!131 (List!12870 List!12870) Bool)

(assert (=> b!680118 (subseq!131 acc!681 acc!681)))

(declare-fun lt!313090 () Unit!23805)

(declare-fun lemmaListSubSeqRefl!0 (List!12870) Unit!23805)

(assert (=> b!680118 (= lt!313090 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680119 () Bool)

(assert (=> b!680119 (= e!387449 (not (contains!3522 acc!681 k0!2843)))))

(declare-fun b!680120 () Bool)

(declare-fun res!446318 () Bool)

(assert (=> b!680120 (=> (not res!446318) (not e!387451))))

(assert (=> b!680120 (= res!446318 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680121 () Bool)

(assert (=> b!680121 (= e!387451 (not e!387452))))

(declare-fun res!446321 () Bool)

(assert (=> b!680121 (=> res!446321 e!387452)))

(assert (=> b!680121 (= res!446321 (not (validKeyInArray!0 (select (arr!18922 a!3626) from!3004))))))

(declare-fun lt!313089 () Unit!23805)

(assert (=> b!680121 (= lt!313089 e!387453)))

(declare-fun c!77264 () Bool)

(assert (=> b!680121 (= c!77264 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680121 (arrayContainsKey!0 (array!39472 (store (arr!18922 a!3626) i!1382 k0!2843) (size!19286 a!3626)) k0!2843 from!3004)))

(declare-fun b!680122 () Bool)

(declare-fun res!446323 () Bool)

(assert (=> b!680122 (=> (not res!446323) (not e!387451))))

(declare-fun noDuplicate!796 (List!12870) Bool)

(assert (=> b!680122 (= res!446323 (noDuplicate!796 acc!681))))

(assert (= (and start!60552 res!446324) b!680122))

(assert (= (and b!680122 res!446323) b!680111))

(assert (= (and b!680111 res!446328) b!680116))

(assert (= (and b!680116 res!446317) b!680106))

(assert (= (and b!680106 res!446329) b!680110))

(assert (= (and b!680106 (not res!446327)) b!680117))

(assert (= (and b!680117 res!446326) b!680119))

(assert (= (and b!680106 res!446315) b!680114))

(assert (= (and b!680114 res!446319) b!680120))

(assert (= (and b!680120 res!446318) b!680109))

(assert (= (and b!680109 res!446322) b!680112))

(assert (= (and b!680112 res!446320) b!680113))

(assert (= (and b!680113 res!446325) b!680107))

(assert (= (and b!680107 res!446316) b!680121))

(assert (= (and b!680121 c!77264) b!680108))

(assert (= (and b!680121 (not c!77264)) b!680115))

(assert (= (and b!680121 (not res!446321)) b!680118))

(declare-fun m!645817 () Bool)

(assert (=> b!680114 m!645817))

(declare-fun m!645819 () Bool)

(assert (=> b!680113 m!645819))

(declare-fun m!645821 () Bool)

(assert (=> b!680120 m!645821))

(declare-fun m!645823 () Bool)

(assert (=> b!680111 m!645823))

(declare-fun m!645825 () Bool)

(assert (=> b!680116 m!645825))

(declare-fun m!645827 () Bool)

(assert (=> b!680122 m!645827))

(declare-fun m!645829 () Bool)

(assert (=> b!680118 m!645829))

(declare-fun m!645831 () Bool)

(assert (=> b!680118 m!645831))

(declare-fun m!645833 () Bool)

(assert (=> b!680112 m!645833))

(declare-fun m!645835 () Bool)

(assert (=> b!680110 m!645835))

(declare-fun m!645837 () Bool)

(assert (=> start!60552 m!645837))

(declare-fun m!645839 () Bool)

(assert (=> b!680108 m!645839))

(declare-fun m!645841 () Bool)

(assert (=> b!680121 m!645841))

(declare-fun m!645843 () Bool)

(assert (=> b!680121 m!645843))

(declare-fun m!645845 () Bool)

(assert (=> b!680121 m!645845))

(assert (=> b!680121 m!645841))

(declare-fun m!645847 () Bool)

(assert (=> b!680121 m!645847))

(declare-fun m!645849 () Bool)

(assert (=> b!680121 m!645849))

(assert (=> b!680119 m!645835))

(check-sat (not b!680110) (not b!680118) (not start!60552) (not b!680111) (not b!680122) (not b!680116) (not b!680113) (not b!680121) (not b!680119) (not b!680108) (not b!680112) (not b!680114) (not b!680120))
(check-sat)
