; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101996 () Bool)

(assert start!101996)

(declare-fun b!1228105 () Bool)

(declare-fun res!816728 () Bool)

(declare-fun e!697139 () Bool)

(assert (=> b!1228105 (=> (not res!816728) (not e!697139))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79269 0))(
  ( (array!79270 (arr!38257 (Array (_ BitVec 32) (_ BitVec 64))) (size!38793 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79269)

(assert (=> b!1228105 (= res!816728 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38793 a!3806)) (bvslt from!3184 (size!38793 a!3806))))))

(declare-fun b!1228106 () Bool)

(declare-fun res!816718 () Bool)

(assert (=> b!1228106 (=> (not res!816718) (not e!697139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228106 (= res!816718 (validKeyInArray!0 (select (arr!38257 a!3806) from!3184)))))

(declare-fun b!1228107 () Bool)

(declare-fun e!697137 () Bool)

(assert (=> b!1228107 (= e!697139 (not e!697137))))

(declare-fun res!816727 () Bool)

(assert (=> b!1228107 (=> res!816727 e!697137)))

(assert (=> b!1228107 (= res!816727 (bvsgt from!3184 (size!38793 a!3806)))))

(declare-datatypes ((List!27030 0))(
  ( (Nil!27027) (Cons!27026 (h!28235 (_ BitVec 64)) (t!40493 List!27030)) )
))
(declare-fun acc!823 () List!27030)

(declare-fun arrayNoDuplicates!0 (array!79269 (_ BitVec 32) List!27030) Bool)

(assert (=> b!1228107 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27026 (select (arr!38257 a!3806) from!3184) acc!823))))

(declare-fun b!1228108 () Bool)

(declare-fun res!816729 () Bool)

(assert (=> b!1228108 (=> (not res!816729) (not e!697139))))

(declare-fun contains!7092 (List!27030 (_ BitVec 64)) Bool)

(assert (=> b!1228108 (= res!816729 (not (contains!7092 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228109 () Bool)

(declare-fun res!816721 () Bool)

(assert (=> b!1228109 (=> res!816721 e!697137)))

(assert (=> b!1228109 (= res!816721 (contains!7092 Nil!27027 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228110 () Bool)

(declare-fun res!816724 () Bool)

(assert (=> b!1228110 (=> (not res!816724) (not e!697139))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1228110 (= res!816724 (validKeyInArray!0 k!2913))))

(declare-fun b!1228111 () Bool)

(assert (=> b!1228111 (= e!697137 true)))

(declare-datatypes ((Unit!40680 0))(
  ( (Unit!40681) )
))
(declare-fun lt!558966 () Unit!40680)

(declare-fun noDuplicateSubseq!49 (List!27030 List!27030) Unit!40680)

(assert (=> b!1228111 (= lt!558966 (noDuplicateSubseq!49 Nil!27027 acc!823))))

(declare-fun res!816723 () Bool)

(assert (=> start!101996 (=> (not res!816723) (not e!697139))))

(assert (=> start!101996 (= res!816723 (bvslt (size!38793 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101996 e!697139))

(declare-fun array_inv!29105 (array!79269) Bool)

(assert (=> start!101996 (array_inv!29105 a!3806)))

(assert (=> start!101996 true))

(declare-fun b!1228112 () Bool)

(declare-fun res!816725 () Bool)

(assert (=> b!1228112 (=> (not res!816725) (not e!697139))))

(declare-fun noDuplicate!1689 (List!27030) Bool)

(assert (=> b!1228112 (= res!816725 (noDuplicate!1689 acc!823))))

(declare-fun b!1228113 () Bool)

(declare-fun res!816726 () Bool)

(assert (=> b!1228113 (=> (not res!816726) (not e!697139))))

(declare-fun arrayContainsKey!0 (array!79269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228113 (= res!816726 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228114 () Bool)

(declare-fun res!816719 () Bool)

(assert (=> b!1228114 (=> res!816719 e!697137)))

(declare-fun subseq!496 (List!27030 List!27030) Bool)

(assert (=> b!1228114 (= res!816719 (not (subseq!496 Nil!27027 acc!823)))))

(declare-fun b!1228115 () Bool)

(declare-fun res!816722 () Bool)

(assert (=> b!1228115 (=> (not res!816722) (not e!697139))))

(assert (=> b!1228115 (= res!816722 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228116 () Bool)

(declare-fun res!816717 () Bool)

(assert (=> b!1228116 (=> res!816717 e!697137)))

(assert (=> b!1228116 (= res!816717 (contains!7092 Nil!27027 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228117 () Bool)

(declare-fun res!816720 () Bool)

(assert (=> b!1228117 (=> (not res!816720) (not e!697139))))

(assert (=> b!1228117 (= res!816720 (not (contains!7092 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101996 res!816723) b!1228110))

(assert (= (and b!1228110 res!816724) b!1228105))

(assert (= (and b!1228105 res!816728) b!1228112))

(assert (= (and b!1228112 res!816725) b!1228108))

(assert (= (and b!1228108 res!816729) b!1228117))

(assert (= (and b!1228117 res!816720) b!1228113))

(assert (= (and b!1228113 res!816726) b!1228115))

(assert (= (and b!1228115 res!816722) b!1228106))

(assert (= (and b!1228106 res!816718) b!1228107))

(assert (= (and b!1228107 (not res!816727)) b!1228116))

(assert (= (and b!1228116 (not res!816717)) b!1228109))

(assert (= (and b!1228109 (not res!816721)) b!1228114))

(assert (= (and b!1228114 (not res!816719)) b!1228111))

(declare-fun m!1132703 () Bool)

(assert (=> b!1228106 m!1132703))

(assert (=> b!1228106 m!1132703))

(declare-fun m!1132705 () Bool)

(assert (=> b!1228106 m!1132705))

(declare-fun m!1132707 () Bool)

(assert (=> b!1228110 m!1132707))

(declare-fun m!1132709 () Bool)

(assert (=> b!1228113 m!1132709))

(declare-fun m!1132711 () Bool)

(assert (=> b!1228115 m!1132711))

(declare-fun m!1132713 () Bool)

(assert (=> b!1228112 m!1132713))

(declare-fun m!1132715 () Bool)

(assert (=> b!1228116 m!1132715))

(declare-fun m!1132717 () Bool)

(assert (=> b!1228111 m!1132717))

(declare-fun m!1132719 () Bool)

(assert (=> start!101996 m!1132719))

(declare-fun m!1132721 () Bool)

(assert (=> b!1228114 m!1132721))

(declare-fun m!1132723 () Bool)

(assert (=> b!1228117 m!1132723))

(declare-fun m!1132725 () Bool)

(assert (=> b!1228108 m!1132725))

(declare-fun m!1132727 () Bool)

(assert (=> b!1228109 m!1132727))

(assert (=> b!1228107 m!1132703))

(declare-fun m!1132729 () Bool)

(assert (=> b!1228107 m!1132729))

(push 1)

(assert (not b!1228106))

(assert (not b!1228110))

(assert (not b!1228107))

(assert (not b!1228115))

(assert (not b!1228117))

(assert (not b!1228112))

(assert (not b!1228114))

(assert (not b!1228113))

(assert (not start!101996))

(assert (not b!1228111))

(assert (not b!1228109))

(assert (not b!1228116))

(assert (not b!1228108))

(check-sat)

