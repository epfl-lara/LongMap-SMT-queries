; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100488 () Bool)

(assert start!100488)

(declare-fun b!1197077 () Bool)

(declare-fun e!680299 () Bool)

(declare-fun tp_is_empty!30319 () Bool)

(assert (=> b!1197077 (= e!680299 tp_is_empty!30319)))

(declare-fun b!1197078 () Bool)

(declare-fun res!796238 () Bool)

(declare-fun e!680300 () Bool)

(assert (=> b!1197078 (=> (not res!796238) (not e!680300))))

(declare-datatypes ((array!77459 0))(
  ( (array!77460 (arr!37370 (Array (_ BitVec 32) (_ BitVec 64))) (size!37907 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77459)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77459 (_ BitVec 32)) Bool)

(assert (=> b!1197078 (= res!796238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197079 () Bool)

(declare-fun e!680298 () Bool)

(assert (=> b!1197079 (= e!680298 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197079 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39623 0))(
  ( (Unit!39624) )
))
(declare-fun lt!543465 () Unit!39623)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77459 (_ BitVec 64) (_ BitVec 32)) Unit!39623)

(assert (=> b!1197079 (= lt!543465 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197080 () Bool)

(declare-fun res!796236 () Bool)

(assert (=> b!1197080 (=> (not res!796236) (not e!680298))))

(declare-fun lt!543466 () array!77459)

(declare-datatypes ((List!26320 0))(
  ( (Nil!26317) (Cons!26316 (h!27534 (_ BitVec 64)) (t!38983 List!26320)) )
))
(declare-fun arrayNoDuplicates!0 (array!77459 (_ BitVec 32) List!26320) Bool)

(assert (=> b!1197080 (= res!796236 (arrayNoDuplicates!0 lt!543466 #b00000000000000000000000000000000 Nil!26317))))

(declare-fun b!1197081 () Bool)

(declare-fun res!796237 () Bool)

(assert (=> b!1197081 (=> (not res!796237) (not e!680300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197081 (= res!796237 (validMask!0 mask!1564))))

(declare-fun res!796243 () Bool)

(assert (=> start!100488 (=> (not res!796243) (not e!680300))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100488 (= res!796243 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37907 _keys!1208))))))

(assert (=> start!100488 e!680300))

(declare-fun array_inv!28560 (array!77459) Bool)

(assert (=> start!100488 (array_inv!28560 _keys!1208)))

(assert (=> start!100488 true))

(declare-datatypes ((V!45553 0))(
  ( (V!45554 (val!15216 Int)) )
))
(declare-datatypes ((ValueCell!14450 0))(
  ( (ValueCellFull!14450 (v!17850 V!45553)) (EmptyCell!14450) )
))
(declare-datatypes ((array!77461 0))(
  ( (array!77462 (arr!37371 (Array (_ BitVec 32) ValueCell!14450)) (size!37908 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77461)

(declare-fun e!680303 () Bool)

(declare-fun array_inv!28561 (array!77461) Bool)

(assert (=> start!100488 (and (array_inv!28561 _values!996) e!680303)))

(declare-fun b!1197082 () Bool)

(declare-fun res!796235 () Bool)

(assert (=> b!1197082 (=> (not res!796235) (not e!680300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197082 (= res!796235 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47315 () Bool)

(declare-fun mapRes!47315 () Bool)

(declare-fun tp!89925 () Bool)

(assert (=> mapNonEmpty!47315 (= mapRes!47315 (and tp!89925 e!680299))))

(declare-fun mapRest!47315 () (Array (_ BitVec 32) ValueCell!14450))

(declare-fun mapKey!47315 () (_ BitVec 32))

(declare-fun mapValue!47315 () ValueCell!14450)

(assert (=> mapNonEmpty!47315 (= (arr!37371 _values!996) (store mapRest!47315 mapKey!47315 mapValue!47315))))

(declare-fun b!1197083 () Bool)

(assert (=> b!1197083 (= e!680300 e!680298)))

(declare-fun res!796239 () Bool)

(assert (=> b!1197083 (=> (not res!796239) (not e!680298))))

(assert (=> b!1197083 (= res!796239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543466 mask!1564))))

(assert (=> b!1197083 (= lt!543466 (array!77460 (store (arr!37370 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37907 _keys!1208)))))

(declare-fun b!1197084 () Bool)

(declare-fun res!796244 () Bool)

(assert (=> b!1197084 (=> (not res!796244) (not e!680300))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197084 (= res!796244 (and (= (size!37908 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37907 _keys!1208) (size!37908 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47315 () Bool)

(assert (=> mapIsEmpty!47315 mapRes!47315))

(declare-fun b!1197085 () Bool)

(declare-fun e!680301 () Bool)

(assert (=> b!1197085 (= e!680303 (and e!680301 mapRes!47315))))

(declare-fun condMapEmpty!47315 () Bool)

(declare-fun mapDefault!47315 () ValueCell!14450)

(assert (=> b!1197085 (= condMapEmpty!47315 (= (arr!37371 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14450)) mapDefault!47315)))))

(declare-fun b!1197086 () Bool)

(declare-fun res!796242 () Bool)

(assert (=> b!1197086 (=> (not res!796242) (not e!680300))))

(assert (=> b!1197086 (= res!796242 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26317))))

(declare-fun b!1197087 () Bool)

(assert (=> b!1197087 (= e!680301 tp_is_empty!30319)))

(declare-fun b!1197088 () Bool)

(declare-fun res!796241 () Bool)

(assert (=> b!1197088 (=> (not res!796241) (not e!680300))))

(assert (=> b!1197088 (= res!796241 (= (select (arr!37370 _keys!1208) i!673) k0!934))))

(declare-fun b!1197089 () Bool)

(declare-fun res!796240 () Bool)

(assert (=> b!1197089 (=> (not res!796240) (not e!680300))))

(assert (=> b!1197089 (= res!796240 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37907 _keys!1208))))))

(assert (= (and start!100488 res!796243) b!1197081))

(assert (= (and b!1197081 res!796237) b!1197084))

(assert (= (and b!1197084 res!796244) b!1197078))

(assert (= (and b!1197078 res!796238) b!1197086))

(assert (= (and b!1197086 res!796242) b!1197089))

(assert (= (and b!1197089 res!796240) b!1197082))

(assert (= (and b!1197082 res!796235) b!1197088))

(assert (= (and b!1197088 res!796241) b!1197083))

(assert (= (and b!1197083 res!796239) b!1197080))

(assert (= (and b!1197080 res!796236) b!1197079))

(assert (= (and b!1197085 condMapEmpty!47315) mapIsEmpty!47315))

(assert (= (and b!1197085 (not condMapEmpty!47315)) mapNonEmpty!47315))

(get-info :version)

(assert (= (and mapNonEmpty!47315 ((_ is ValueCellFull!14450) mapValue!47315)) b!1197077))

(assert (= (and b!1197085 ((_ is ValueCellFull!14450) mapDefault!47315)) b!1197087))

(assert (= start!100488 b!1197085))

(declare-fun m!1104813 () Bool)

(assert (=> b!1197081 m!1104813))

(declare-fun m!1104815 () Bool)

(assert (=> b!1197078 m!1104815))

(declare-fun m!1104817 () Bool)

(assert (=> mapNonEmpty!47315 m!1104817))

(declare-fun m!1104819 () Bool)

(assert (=> b!1197088 m!1104819))

(declare-fun m!1104821 () Bool)

(assert (=> b!1197080 m!1104821))

(declare-fun m!1104823 () Bool)

(assert (=> start!100488 m!1104823))

(declare-fun m!1104825 () Bool)

(assert (=> start!100488 m!1104825))

(declare-fun m!1104827 () Bool)

(assert (=> b!1197086 m!1104827))

(declare-fun m!1104829 () Bool)

(assert (=> b!1197083 m!1104829))

(declare-fun m!1104831 () Bool)

(assert (=> b!1197083 m!1104831))

(declare-fun m!1104833 () Bool)

(assert (=> b!1197082 m!1104833))

(declare-fun m!1104835 () Bool)

(assert (=> b!1197079 m!1104835))

(declare-fun m!1104837 () Bool)

(assert (=> b!1197079 m!1104837))

(check-sat (not b!1197081) (not b!1197083) (not b!1197078) (not start!100488) (not b!1197086) (not b!1197082) tp_is_empty!30319 (not mapNonEmpty!47315) (not b!1197079) (not b!1197080))
(check-sat)
