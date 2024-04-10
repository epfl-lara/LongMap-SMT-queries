; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116288 () Bool)

(assert start!116288)

(declare-fun b!1372858 () Bool)

(declare-fun res!916128 () Bool)

(declare-fun e!777711 () Bool)

(assert (=> b!1372858 (=> (not res!916128) (not e!777711))))

(declare-datatypes ((List!32031 0))(
  ( (Nil!32028) (Cons!32027 (h!33236 (_ BitVec 64)) (t!46725 List!32031)) )
))
(declare-fun newAcc!98 () List!32031)

(declare-fun contains!9713 (List!32031 (_ BitVec 64)) Bool)

(assert (=> b!1372858 (= res!916128 (not (contains!9713 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372859 () Bool)

(declare-fun res!916126 () Bool)

(assert (=> b!1372859 (=> (not res!916126) (not e!777711))))

(declare-fun acc!866 () List!32031)

(declare-fun noDuplicate!2570 (List!32031) Bool)

(assert (=> b!1372859 (= res!916126 (noDuplicate!2570 acc!866))))

(declare-fun b!1372860 () Bool)

(assert (=> b!1372860 (= e!777711 false)))

(declare-datatypes ((array!93105 0))(
  ( (array!93106 (arr!44963 (Array (_ BitVec 32) (_ BitVec 64))) (size!45513 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93105)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602958 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93105 (_ BitVec 32) List!32031) Bool)

(assert (=> b!1372860 (= lt!602958 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45363 0))(
  ( (Unit!45364) )
))
(declare-fun lt!602959 () Unit!45363)

(declare-fun noDuplicateSubseq!302 (List!32031 List!32031) Unit!45363)

(assert (=> b!1372860 (= lt!602959 (noDuplicateSubseq!302 newAcc!98 acc!866))))

(declare-fun b!1372861 () Bool)

(declare-fun res!916132 () Bool)

(assert (=> b!1372861 (=> (not res!916132) (not e!777711))))

(assert (=> b!1372861 (= res!916132 (not (contains!9713 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916129 () Bool)

(assert (=> start!116288 (=> (not res!916129) (not e!777711))))

(assert (=> start!116288 (= res!916129 (and (bvslt (size!45513 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45513 a!3861))))))

(assert (=> start!116288 e!777711))

(declare-fun array_inv!33991 (array!93105) Bool)

(assert (=> start!116288 (array_inv!33991 a!3861)))

(assert (=> start!116288 true))

(declare-fun b!1372862 () Bool)

(declare-fun res!916131 () Bool)

(assert (=> b!1372862 (=> (not res!916131) (not e!777711))))

(assert (=> b!1372862 (= res!916131 (not (contains!9713 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372863 () Bool)

(declare-fun res!916127 () Bool)

(assert (=> b!1372863 (=> (not res!916127) (not e!777711))))

(assert (=> b!1372863 (= res!916127 (not (contains!9713 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372864 () Bool)

(declare-fun res!916130 () Bool)

(assert (=> b!1372864 (=> (not res!916130) (not e!777711))))

(declare-fun subseq!1115 (List!32031 List!32031) Bool)

(assert (=> b!1372864 (= res!916130 (subseq!1115 newAcc!98 acc!866))))

(assert (= (and start!116288 res!916129) b!1372859))

(assert (= (and b!1372859 res!916126) b!1372863))

(assert (= (and b!1372863 res!916127) b!1372862))

(assert (= (and b!1372862 res!916131) b!1372861))

(assert (= (and b!1372861 res!916132) b!1372858))

(assert (= (and b!1372858 res!916128) b!1372864))

(assert (= (and b!1372864 res!916130) b!1372860))

(declare-fun m!1256233 () Bool)

(assert (=> b!1372864 m!1256233))

(declare-fun m!1256235 () Bool)

(assert (=> b!1372860 m!1256235))

(declare-fun m!1256237 () Bool)

(assert (=> b!1372860 m!1256237))

(declare-fun m!1256239 () Bool)

(assert (=> b!1372863 m!1256239))

(declare-fun m!1256241 () Bool)

(assert (=> b!1372859 m!1256241))

(declare-fun m!1256243 () Bool)

(assert (=> b!1372861 m!1256243))

(declare-fun m!1256245 () Bool)

(assert (=> start!116288 m!1256245))

(declare-fun m!1256247 () Bool)

(assert (=> b!1372862 m!1256247))

(declare-fun m!1256249 () Bool)

(assert (=> b!1372858 m!1256249))

(push 1)

(assert (not b!1372862))

(assert (not start!116288))

(assert (not b!1372858))

(assert (not b!1372859))

(assert (not b!1372861))

(assert (not b!1372863))

(assert (not b!1372864))

(assert (not b!1372860))

(check-sat)

(pop 1)

