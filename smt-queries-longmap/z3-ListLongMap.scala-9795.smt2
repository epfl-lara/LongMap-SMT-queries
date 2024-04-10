; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116296 () Bool)

(assert start!116296)

(declare-fun b!1372942 () Bool)

(declare-fun res!916214 () Bool)

(declare-fun e!777735 () Bool)

(assert (=> b!1372942 (=> (not res!916214) (not e!777735))))

(declare-datatypes ((List!32035 0))(
  ( (Nil!32032) (Cons!32031 (h!33240 (_ BitVec 64)) (t!46729 List!32035)) )
))
(declare-fun acc!866 () List!32035)

(declare-fun noDuplicate!2574 (List!32035) Bool)

(assert (=> b!1372942 (= res!916214 (noDuplicate!2574 acc!866))))

(declare-fun res!916211 () Bool)

(assert (=> start!116296 (=> (not res!916211) (not e!777735))))

(declare-datatypes ((array!93113 0))(
  ( (array!93114 (arr!44967 (Array (_ BitVec 32) (_ BitVec 64))) (size!45517 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93113)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116296 (= res!916211 (and (bvslt (size!45517 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45517 a!3861))))))

(assert (=> start!116296 e!777735))

(declare-fun array_inv!33995 (array!93113) Bool)

(assert (=> start!116296 (array_inv!33995 a!3861)))

(assert (=> start!116296 true))

(declare-fun b!1372943 () Bool)

(declare-fun res!916213 () Bool)

(assert (=> b!1372943 (=> (not res!916213) (not e!777735))))

(declare-fun newAcc!98 () List!32035)

(declare-fun contains!9717 (List!32035 (_ BitVec 64)) Bool)

(assert (=> b!1372943 (= res!916213 (not (contains!9717 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372944 () Bool)

(assert (=> b!1372944 (= e!777735 false)))

(declare-fun lt!602982 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93113 (_ BitVec 32) List!32035) Bool)

(assert (=> b!1372944 (= lt!602982 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45371 0))(
  ( (Unit!45372) )
))
(declare-fun lt!602983 () Unit!45371)

(declare-fun noDuplicateSubseq!306 (List!32035 List!32035) Unit!45371)

(assert (=> b!1372944 (= lt!602983 (noDuplicateSubseq!306 newAcc!98 acc!866))))

(declare-fun b!1372945 () Bool)

(declare-fun res!916215 () Bool)

(assert (=> b!1372945 (=> (not res!916215) (not e!777735))))

(assert (=> b!1372945 (= res!916215 (not (contains!9717 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372946 () Bool)

(declare-fun res!916212 () Bool)

(assert (=> b!1372946 (=> (not res!916212) (not e!777735))))

(assert (=> b!1372946 (= res!916212 (not (contains!9717 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372947 () Bool)

(declare-fun res!916216 () Bool)

(assert (=> b!1372947 (=> (not res!916216) (not e!777735))))

(declare-fun subseq!1119 (List!32035 List!32035) Bool)

(assert (=> b!1372947 (= res!916216 (subseq!1119 newAcc!98 acc!866))))

(declare-fun b!1372948 () Bool)

(declare-fun res!916210 () Bool)

(assert (=> b!1372948 (=> (not res!916210) (not e!777735))))

(assert (=> b!1372948 (= res!916210 (not (contains!9717 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116296 res!916211) b!1372942))

(assert (= (and b!1372942 res!916214) b!1372945))

(assert (= (and b!1372945 res!916215) b!1372948))

(assert (= (and b!1372948 res!916210) b!1372946))

(assert (= (and b!1372946 res!916212) b!1372943))

(assert (= (and b!1372943 res!916213) b!1372947))

(assert (= (and b!1372947 res!916216) b!1372944))

(declare-fun m!1256305 () Bool)

(assert (=> b!1372943 m!1256305))

(declare-fun m!1256307 () Bool)

(assert (=> b!1372944 m!1256307))

(declare-fun m!1256309 () Bool)

(assert (=> b!1372944 m!1256309))

(declare-fun m!1256311 () Bool)

(assert (=> b!1372945 m!1256311))

(declare-fun m!1256313 () Bool)

(assert (=> b!1372948 m!1256313))

(declare-fun m!1256315 () Bool)

(assert (=> b!1372947 m!1256315))

(declare-fun m!1256317 () Bool)

(assert (=> b!1372946 m!1256317))

(declare-fun m!1256319 () Bool)

(assert (=> b!1372942 m!1256319))

(declare-fun m!1256321 () Bool)

(assert (=> start!116296 m!1256321))

(check-sat (not b!1372945) (not b!1372944) (not start!116296) (not b!1372946) (not b!1372943) (not b!1372942) (not b!1372948) (not b!1372947))
(check-sat)
