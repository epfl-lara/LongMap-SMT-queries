; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116132 () Bool)

(assert start!116132)

(declare-fun b!1371646 () Bool)

(declare-fun res!915020 () Bool)

(declare-fun e!777042 () Bool)

(assert (=> b!1371646 (=> (not res!915020) (not e!777042))))

(declare-datatypes ((List!32007 0))(
  ( (Nil!32004) (Cons!32003 (h!33212 (_ BitVec 64)) (t!46701 List!32007)) )
))
(declare-fun lt!602695 () List!32007)

(declare-fun contains!9689 (List!32007 (_ BitVec 64)) Bool)

(assert (=> b!1371646 (= res!915020 (not (contains!9689 lt!602695 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371647 () Bool)

(declare-fun res!915016 () Bool)

(assert (=> b!1371647 (=> (not res!915016) (not e!777042))))

(assert (=> b!1371647 (= res!915016 (not (contains!9689 lt!602695 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371648 () Bool)

(declare-fun e!777046 () Bool)

(assert (=> b!1371648 (= e!777046 e!777042)))

(declare-fun res!915021 () Bool)

(assert (=> b!1371648 (=> (not res!915021) (not e!777042))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1371648 (= res!915021 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!93051 0))(
  ( (array!93052 (arr!44939 (Array (_ BitVec 32) (_ BitVec 64))) (size!45489 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93051)

(declare-fun lt!602697 () List!32007)

(declare-fun newAcc!98 () List!32007)

(assert (=> b!1371648 (= lt!602697 (Cons!32003 (select (arr!44939 a!3861) from!3239) newAcc!98))))

(declare-fun acc!866 () List!32007)

(assert (=> b!1371648 (= lt!602695 (Cons!32003 (select (arr!44939 a!3861) from!3239) acc!866))))

(declare-fun b!1371649 () Bool)

(declare-fun res!915015 () Bool)

(assert (=> b!1371649 (=> (not res!915015) (not e!777046))))

(assert (=> b!1371649 (= res!915015 (bvslt from!3239 (size!45489 a!3861)))))

(declare-fun b!1371650 () Bool)

(declare-fun res!915026 () Bool)

(assert (=> b!1371650 (=> (not res!915026) (not e!777042))))

(assert (=> b!1371650 (= res!915026 (not (contains!9689 lt!602697 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371651 () Bool)

(declare-fun res!915012 () Bool)

(assert (=> b!1371651 (=> (not res!915012) (not e!777046))))

(assert (=> b!1371651 (= res!915012 (not (contains!9689 acc!866 (select (arr!44939 a!3861) from!3239))))))

(declare-fun b!1371652 () Bool)

(declare-fun res!915023 () Bool)

(declare-fun e!777045 () Bool)

(assert (=> b!1371652 (=> (not res!915023) (not e!777045))))

(assert (=> b!1371652 (= res!915023 (not (contains!9689 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371653 () Bool)

(declare-fun res!915027 () Bool)

(assert (=> b!1371653 (=> (not res!915027) (not e!777042))))

(assert (=> b!1371653 (= res!915027 (not (contains!9689 lt!602697 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371654 () Bool)

(declare-fun res!915019 () Bool)

(assert (=> b!1371654 (=> (not res!915019) (not e!777045))))

(assert (=> b!1371654 (= res!915019 (not (contains!9689 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371655 () Bool)

(assert (=> b!1371655 (= e!777045 e!777046)))

(declare-fun res!915014 () Bool)

(assert (=> b!1371655 (=> (not res!915014) (not e!777046))))

(declare-fun arrayNoDuplicates!0 (array!93051 (_ BitVec 32) List!32007) Bool)

(assert (=> b!1371655 (= res!915014 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45315 0))(
  ( (Unit!45316) )
))
(declare-fun lt!602696 () Unit!45315)

(declare-fun noDuplicateSubseq!278 (List!32007 List!32007) Unit!45315)

(assert (=> b!1371655 (= lt!602696 (noDuplicateSubseq!278 newAcc!98 acc!866))))

(declare-fun b!1371656 () Bool)

(declare-fun e!777043 () Bool)

(assert (=> b!1371656 (= e!777043 (bvsge (bvsub (size!45489 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45489 a!3861) from!3239)))))

(declare-fun b!1371657 () Bool)

(declare-fun res!915025 () Bool)

(assert (=> b!1371657 (=> (not res!915025) (not e!777045))))

(declare-fun noDuplicate!2546 (List!32007) Bool)

(assert (=> b!1371657 (= res!915025 (noDuplicate!2546 acc!866))))

(declare-fun b!1371658 () Bool)

(declare-fun res!915022 () Bool)

(assert (=> b!1371658 (=> (not res!915022) (not e!777045))))

(assert (=> b!1371658 (= res!915022 (not (contains!9689 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371659 () Bool)

(assert (=> b!1371659 (= e!777042 e!777043)))

(declare-fun res!915017 () Bool)

(assert (=> b!1371659 (=> (not res!915017) (not e!777043))))

(assert (=> b!1371659 (= res!915017 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602695))))

(declare-fun lt!602698 () Unit!45315)

(assert (=> b!1371659 (= lt!602698 (noDuplicateSubseq!278 lt!602697 lt!602695))))

(declare-fun b!1371660 () Bool)

(declare-fun res!915010 () Bool)

(assert (=> b!1371660 (=> (not res!915010) (not e!777045))))

(declare-fun subseq!1091 (List!32007 List!32007) Bool)

(assert (=> b!1371660 (= res!915010 (subseq!1091 newAcc!98 acc!866))))

(declare-fun res!915028 () Bool)

(assert (=> start!116132 (=> (not res!915028) (not e!777045))))

(assert (=> start!116132 (= res!915028 (and (bvslt (size!45489 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45489 a!3861))))))

(assert (=> start!116132 e!777045))

(declare-fun array_inv!33967 (array!93051) Bool)

(assert (=> start!116132 (array_inv!33967 a!3861)))

(assert (=> start!116132 true))

(declare-fun b!1371661 () Bool)

(declare-fun res!915011 () Bool)

(assert (=> b!1371661 (=> (not res!915011) (not e!777045))))

(assert (=> b!1371661 (= res!915011 (not (contains!9689 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371662 () Bool)

(declare-fun res!915018 () Bool)

(assert (=> b!1371662 (=> (not res!915018) (not e!777042))))

(assert (=> b!1371662 (= res!915018 (subseq!1091 lt!602697 lt!602695))))

(declare-fun b!1371663 () Bool)

(declare-fun res!915024 () Bool)

(assert (=> b!1371663 (=> (not res!915024) (not e!777046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371663 (= res!915024 (validKeyInArray!0 (select (arr!44939 a!3861) from!3239)))))

(declare-fun b!1371664 () Bool)

(declare-fun res!915013 () Bool)

(assert (=> b!1371664 (=> (not res!915013) (not e!777042))))

(assert (=> b!1371664 (= res!915013 (noDuplicate!2546 lt!602695))))

(assert (= (and start!116132 res!915028) b!1371657))

(assert (= (and b!1371657 res!915025) b!1371658))

(assert (= (and b!1371658 res!915022) b!1371652))

(assert (= (and b!1371652 res!915023) b!1371661))

(assert (= (and b!1371661 res!915011) b!1371654))

(assert (= (and b!1371654 res!915019) b!1371660))

(assert (= (and b!1371660 res!915010) b!1371655))

(assert (= (and b!1371655 res!915014) b!1371649))

(assert (= (and b!1371649 res!915015) b!1371663))

(assert (= (and b!1371663 res!915024) b!1371651))

(assert (= (and b!1371651 res!915012) b!1371648))

(assert (= (and b!1371648 res!915021) b!1371664))

(assert (= (and b!1371664 res!915013) b!1371646))

(assert (= (and b!1371646 res!915020) b!1371647))

(assert (= (and b!1371647 res!915016) b!1371653))

(assert (= (and b!1371653 res!915027) b!1371650))

(assert (= (and b!1371650 res!915026) b!1371662))

(assert (= (and b!1371662 res!915018) b!1371659))

(assert (= (and b!1371659 res!915017) b!1371656))

(declare-fun m!1255087 () Bool)

(assert (=> b!1371660 m!1255087))

(declare-fun m!1255089 () Bool)

(assert (=> b!1371663 m!1255089))

(assert (=> b!1371663 m!1255089))

(declare-fun m!1255091 () Bool)

(assert (=> b!1371663 m!1255091))

(declare-fun m!1255093 () Bool)

(assert (=> b!1371657 m!1255093))

(declare-fun m!1255095 () Bool)

(assert (=> b!1371654 m!1255095))

(assert (=> b!1371651 m!1255089))

(assert (=> b!1371651 m!1255089))

(declare-fun m!1255097 () Bool)

(assert (=> b!1371651 m!1255097))

(declare-fun m!1255099 () Bool)

(assert (=> b!1371647 m!1255099))

(assert (=> b!1371648 m!1255089))

(declare-fun m!1255101 () Bool)

(assert (=> start!116132 m!1255101))

(declare-fun m!1255103 () Bool)

(assert (=> b!1371655 m!1255103))

(declare-fun m!1255105 () Bool)

(assert (=> b!1371655 m!1255105))

(declare-fun m!1255107 () Bool)

(assert (=> b!1371664 m!1255107))

(declare-fun m!1255109 () Bool)

(assert (=> b!1371652 m!1255109))

(declare-fun m!1255111 () Bool)

(assert (=> b!1371653 m!1255111))

(declare-fun m!1255113 () Bool)

(assert (=> b!1371662 m!1255113))

(declare-fun m!1255115 () Bool)

(assert (=> b!1371661 m!1255115))

(declare-fun m!1255117 () Bool)

(assert (=> b!1371646 m!1255117))

(declare-fun m!1255119 () Bool)

(assert (=> b!1371659 m!1255119))

(declare-fun m!1255121 () Bool)

(assert (=> b!1371659 m!1255121))

(declare-fun m!1255123 () Bool)

(assert (=> b!1371650 m!1255123))

(declare-fun m!1255125 () Bool)

(assert (=> b!1371658 m!1255125))

(push 1)

(assert (not b!1371655))

(assert (not b!1371652))

(assert (not b!1371654))

(assert (not b!1371646))

(assert (not b!1371657))

(assert (not b!1371659))

(assert (not b!1371664))

(assert (not b!1371653))

(assert (not start!116132))

(assert (not b!1371647))

(assert (not b!1371663))

(assert (not b!1371661))

(assert (not b!1371658))

(assert (not b!1371650))

(assert (not b!1371660))

(assert (not b!1371651))

(assert (not b!1371662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

