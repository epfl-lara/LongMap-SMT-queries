; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100218 () Bool)

(assert start!100218)

(declare-fun b!1195125 () Bool)

(declare-fun res!795225 () Bool)

(declare-fun e!679165 () Bool)

(assert (=> b!1195125 (=> (not res!795225) (not e!679165))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77351 0))(
  ( (array!77352 (arr!37322 (Array (_ BitVec 32) (_ BitVec 64))) (size!37858 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77351)

(assert (=> b!1195125 (= res!795225 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37858 _keys!1208))))))

(declare-fun b!1195126 () Bool)

(declare-fun res!795222 () Bool)

(assert (=> b!1195126 (=> (not res!795222) (not e!679165))))

(declare-datatypes ((List!26272 0))(
  ( (Nil!26269) (Cons!26268 (h!27477 (_ BitVec 64)) (t!38943 List!26272)) )
))
(declare-fun arrayNoDuplicates!0 (array!77351 (_ BitVec 32) List!26272) Bool)

(assert (=> b!1195126 (= res!795222 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26269))))

(declare-fun res!795217 () Bool)

(assert (=> start!100218 (=> (not res!795217) (not e!679165))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100218 (= res!795217 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37858 _keys!1208))))))

(assert (=> start!100218 e!679165))

(declare-fun array_inv!28448 (array!77351) Bool)

(assert (=> start!100218 (array_inv!28448 _keys!1208)))

(assert (=> start!100218 true))

(declare-datatypes ((V!45507 0))(
  ( (V!45508 (val!15199 Int)) )
))
(declare-datatypes ((ValueCell!14433 0))(
  ( (ValueCellFull!14433 (v!17837 V!45507)) (EmptyCell!14433) )
))
(declare-datatypes ((array!77353 0))(
  ( (array!77354 (arr!37323 (Array (_ BitVec 32) ValueCell!14433)) (size!37859 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77353)

(declare-fun e!679162 () Bool)

(declare-fun array_inv!28449 (array!77353) Bool)

(assert (=> start!100218 (and (array_inv!28449 _values!996) e!679162)))

(declare-fun b!1195127 () Bool)

(declare-fun res!795218 () Bool)

(assert (=> b!1195127 (=> (not res!795218) (not e!679165))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195127 (= res!795218 (validMask!0 mask!1564))))

(declare-fun b!1195128 () Bool)

(declare-fun res!795224 () Bool)

(assert (=> b!1195128 (=> (not res!795224) (not e!679165))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1195128 (= res!795224 (= (select (arr!37322 _keys!1208) i!673) k0!934))))

(declare-fun b!1195129 () Bool)

(declare-fun e!679160 () Bool)

(assert (=> b!1195129 (= e!679165 e!679160)))

(declare-fun res!795219 () Bool)

(assert (=> b!1195129 (=> (not res!795219) (not e!679160))))

(declare-fun lt!542879 () array!77351)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77351 (_ BitVec 32)) Bool)

(assert (=> b!1195129 (= res!795219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542879 mask!1564))))

(assert (=> b!1195129 (= lt!542879 (array!77352 (store (arr!37322 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37858 _keys!1208)))))

(declare-fun b!1195130 () Bool)

(declare-fun res!795223 () Bool)

(assert (=> b!1195130 (=> (not res!795223) (not e!679160))))

(assert (=> b!1195130 (= res!795223 (arrayNoDuplicates!0 lt!542879 #b00000000000000000000000000000000 Nil!26269))))

(declare-fun b!1195131 () Bool)

(declare-fun res!795226 () Bool)

(assert (=> b!1195131 (=> (not res!795226) (not e!679165))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195131 (= res!795226 (and (= (size!37859 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37858 _keys!1208) (size!37859 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195132 () Bool)

(declare-fun res!795220 () Bool)

(assert (=> b!1195132 (=> (not res!795220) (not e!679165))))

(assert (=> b!1195132 (= res!795220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195133 () Bool)

(declare-fun e!679161 () Bool)

(declare-fun tp_is_empty!30285 () Bool)

(assert (=> b!1195133 (= e!679161 tp_is_empty!30285)))

(declare-fun b!1195134 () Bool)

(assert (=> b!1195134 (= e!679160 (not true))))

(declare-fun arrayContainsKey!0 (array!77351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195134 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39620 0))(
  ( (Unit!39621) )
))
(declare-fun lt!542880 () Unit!39620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77351 (_ BitVec 64) (_ BitVec 32)) Unit!39620)

(assert (=> b!1195134 (= lt!542880 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195135 () Bool)

(declare-fun e!679164 () Bool)

(declare-fun mapRes!47264 () Bool)

(assert (=> b!1195135 (= e!679162 (and e!679164 mapRes!47264))))

(declare-fun condMapEmpty!47264 () Bool)

(declare-fun mapDefault!47264 () ValueCell!14433)

(assert (=> b!1195135 (= condMapEmpty!47264 (= (arr!37323 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14433)) mapDefault!47264)))))

(declare-fun b!1195136 () Bool)

(assert (=> b!1195136 (= e!679164 tp_is_empty!30285)))

(declare-fun b!1195137 () Bool)

(declare-fun res!795221 () Bool)

(assert (=> b!1195137 (=> (not res!795221) (not e!679165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195137 (= res!795221 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47264 () Bool)

(assert (=> mapIsEmpty!47264 mapRes!47264))

(declare-fun mapNonEmpty!47264 () Bool)

(declare-fun tp!89874 () Bool)

(assert (=> mapNonEmpty!47264 (= mapRes!47264 (and tp!89874 e!679161))))

(declare-fun mapRest!47264 () (Array (_ BitVec 32) ValueCell!14433))

(declare-fun mapValue!47264 () ValueCell!14433)

(declare-fun mapKey!47264 () (_ BitVec 32))

(assert (=> mapNonEmpty!47264 (= (arr!37323 _values!996) (store mapRest!47264 mapKey!47264 mapValue!47264))))

(assert (= (and start!100218 res!795217) b!1195127))

(assert (= (and b!1195127 res!795218) b!1195131))

(assert (= (and b!1195131 res!795226) b!1195132))

(assert (= (and b!1195132 res!795220) b!1195126))

(assert (= (and b!1195126 res!795222) b!1195125))

(assert (= (and b!1195125 res!795225) b!1195137))

(assert (= (and b!1195137 res!795221) b!1195128))

(assert (= (and b!1195128 res!795224) b!1195129))

(assert (= (and b!1195129 res!795219) b!1195130))

(assert (= (and b!1195130 res!795223) b!1195134))

(assert (= (and b!1195135 condMapEmpty!47264) mapIsEmpty!47264))

(assert (= (and b!1195135 (not condMapEmpty!47264)) mapNonEmpty!47264))

(get-info :version)

(assert (= (and mapNonEmpty!47264 ((_ is ValueCellFull!14433) mapValue!47264)) b!1195133))

(assert (= (and b!1195135 ((_ is ValueCellFull!14433) mapDefault!47264)) b!1195136))

(assert (= start!100218 b!1195135))

(declare-fun m!1102799 () Bool)

(assert (=> mapNonEmpty!47264 m!1102799))

(declare-fun m!1102801 () Bool)

(assert (=> b!1195137 m!1102801))

(declare-fun m!1102803 () Bool)

(assert (=> b!1195129 m!1102803))

(declare-fun m!1102805 () Bool)

(assert (=> b!1195129 m!1102805))

(declare-fun m!1102807 () Bool)

(assert (=> b!1195128 m!1102807))

(declare-fun m!1102809 () Bool)

(assert (=> b!1195134 m!1102809))

(declare-fun m!1102811 () Bool)

(assert (=> b!1195134 m!1102811))

(declare-fun m!1102813 () Bool)

(assert (=> start!100218 m!1102813))

(declare-fun m!1102815 () Bool)

(assert (=> start!100218 m!1102815))

(declare-fun m!1102817 () Bool)

(assert (=> b!1195127 m!1102817))

(declare-fun m!1102819 () Bool)

(assert (=> b!1195130 m!1102819))

(declare-fun m!1102821 () Bool)

(assert (=> b!1195126 m!1102821))

(declare-fun m!1102823 () Bool)

(assert (=> b!1195132 m!1102823))

(check-sat tp_is_empty!30285 (not mapNonEmpty!47264) (not b!1195132) (not b!1195127) (not b!1195137) (not b!1195130) (not start!100218) (not b!1195134) (not b!1195129) (not b!1195126))
(check-sat)
