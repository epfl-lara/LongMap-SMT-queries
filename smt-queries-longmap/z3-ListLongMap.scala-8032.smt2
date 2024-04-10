; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99034 () Bool)

(assert start!99034)

(declare-fun b_free!24639 () Bool)

(declare-fun b_next!24639 () Bool)

(assert (=> start!99034 (= b_free!24639 (not b_next!24639))))

(declare-fun tp!86627 () Bool)

(declare-fun b_and!40127 () Bool)

(assert (=> start!99034 (= tp!86627 b_and!40127)))

(declare-fun b!1164182 () Bool)

(declare-fun res!771998 () Bool)

(declare-fun e!661938 () Bool)

(assert (=> b!1164182 (=> (not res!771998) (not e!661938))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164182 (= res!771998 (validMask!0 mask!1564))))

(declare-fun b!1164183 () Bool)

(declare-fun e!661944 () Bool)

(assert (=> b!1164183 (= e!661944 true)))

(declare-datatypes ((V!44019 0))(
  ( (V!44020 (val!14641 Int)) )
))
(declare-fun zeroValue!944 () V!44019)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18674 0))(
  ( (tuple2!18675 (_1!9348 (_ BitVec 64)) (_2!9348 V!44019)) )
))
(declare-datatypes ((List!25406 0))(
  ( (Nil!25403) (Cons!25402 (h!26611 tuple2!18674) (t!37037 List!25406)) )
))
(declare-datatypes ((ListLongMap!16643 0))(
  ( (ListLongMap!16644 (toList!8337 List!25406)) )
))
(declare-fun lt!524570 () ListLongMap!16643)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13875 0))(
  ( (ValueCellFull!13875 (v!17278 V!44019)) (EmptyCell!13875) )
))
(declare-datatypes ((array!75175 0))(
  ( (array!75176 (arr!36238 (Array (_ BitVec 32) ValueCell!13875)) (size!36774 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75175)

(declare-fun minValue!944 () V!44019)

(declare-datatypes ((array!75177 0))(
  ( (array!75178 (arr!36239 (Array (_ BitVec 32) (_ BitVec 64))) (size!36775 (_ BitVec 32))) )
))
(declare-fun lt!524568 () array!75177)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4801 (array!75177 array!75175 (_ BitVec 32) (_ BitVec 32) V!44019 V!44019 (_ BitVec 32) Int) ListLongMap!16643)

(declare-fun dynLambda!2791 (Int (_ BitVec 64)) V!44019)

(assert (=> b!1164183 (= lt!524570 (getCurrentListMapNoExtraKeys!4801 lt!524568 (array!75176 (store (arr!36238 _values!996) i!673 (ValueCellFull!13875 (dynLambda!2791 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36774 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75177)

(declare-fun lt!524571 () ListLongMap!16643)

(assert (=> b!1164183 (= lt!524571 (getCurrentListMapNoExtraKeys!4801 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164184 () Bool)

(declare-fun e!661942 () Bool)

(declare-fun tp_is_empty!29169 () Bool)

(assert (=> b!1164184 (= e!661942 tp_is_empty!29169)))

(declare-fun b!1164186 () Bool)

(declare-fun res!771992 () Bool)

(declare-fun e!661943 () Bool)

(assert (=> b!1164186 (=> (not res!771992) (not e!661943))))

(declare-datatypes ((List!25407 0))(
  ( (Nil!25404) (Cons!25403 (h!26612 (_ BitVec 64)) (t!37038 List!25407)) )
))
(declare-fun arrayNoDuplicates!0 (array!75177 (_ BitVec 32) List!25407) Bool)

(assert (=> b!1164186 (= res!771992 (arrayNoDuplicates!0 lt!524568 #b00000000000000000000000000000000 Nil!25404))))

(declare-fun b!1164187 () Bool)

(declare-fun e!661939 () Bool)

(assert (=> b!1164187 (= e!661939 tp_is_empty!29169)))

(declare-fun b!1164188 () Bool)

(assert (=> b!1164188 (= e!661943 (not e!661944))))

(declare-fun res!771997 () Bool)

(assert (=> b!1164188 (=> res!771997 e!661944)))

(assert (=> b!1164188 (= res!771997 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164188 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38426 0))(
  ( (Unit!38427) )
))
(declare-fun lt!524569 () Unit!38426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75177 (_ BitVec 64) (_ BitVec 32)) Unit!38426)

(assert (=> b!1164188 (= lt!524569 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45578 () Bool)

(declare-fun mapRes!45578 () Bool)

(assert (=> mapIsEmpty!45578 mapRes!45578))

(declare-fun b!1164189 () Bool)

(declare-fun res!771990 () Bool)

(assert (=> b!1164189 (=> (not res!771990) (not e!661938))))

(assert (=> b!1164189 (= res!771990 (and (= (size!36774 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36775 _keys!1208) (size!36774 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164190 () Bool)

(declare-fun res!771994 () Bool)

(assert (=> b!1164190 (=> (not res!771994) (not e!661938))))

(assert (=> b!1164190 (= res!771994 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36775 _keys!1208))))))

(declare-fun b!1164191 () Bool)

(declare-fun res!771993 () Bool)

(assert (=> b!1164191 (=> (not res!771993) (not e!661938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75177 (_ BitVec 32)) Bool)

(assert (=> b!1164191 (= res!771993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164192 () Bool)

(assert (=> b!1164192 (= e!661938 e!661943)))

(declare-fun res!771991 () Bool)

(assert (=> b!1164192 (=> (not res!771991) (not e!661943))))

(assert (=> b!1164192 (= res!771991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524568 mask!1564))))

(assert (=> b!1164192 (= lt!524568 (array!75178 (store (arr!36239 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36775 _keys!1208)))))

(declare-fun mapNonEmpty!45578 () Bool)

(declare-fun tp!86628 () Bool)

(assert (=> mapNonEmpty!45578 (= mapRes!45578 (and tp!86628 e!661939))))

(declare-fun mapValue!45578 () ValueCell!13875)

(declare-fun mapRest!45578 () (Array (_ BitVec 32) ValueCell!13875))

(declare-fun mapKey!45578 () (_ BitVec 32))

(assert (=> mapNonEmpty!45578 (= (arr!36238 _values!996) (store mapRest!45578 mapKey!45578 mapValue!45578))))

(declare-fun b!1164193 () Bool)

(declare-fun e!661940 () Bool)

(assert (=> b!1164193 (= e!661940 (and e!661942 mapRes!45578))))

(declare-fun condMapEmpty!45578 () Bool)

(declare-fun mapDefault!45578 () ValueCell!13875)

(assert (=> b!1164193 (= condMapEmpty!45578 (= (arr!36238 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13875)) mapDefault!45578)))))

(declare-fun b!1164185 () Bool)

(declare-fun res!771988 () Bool)

(assert (=> b!1164185 (=> (not res!771988) (not e!661938))))

(assert (=> b!1164185 (= res!771988 (= (select (arr!36239 _keys!1208) i!673) k0!934))))

(declare-fun res!771989 () Bool)

(assert (=> start!99034 (=> (not res!771989) (not e!661938))))

(assert (=> start!99034 (= res!771989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36775 _keys!1208))))))

(assert (=> start!99034 e!661938))

(assert (=> start!99034 tp_is_empty!29169))

(declare-fun array_inv!27726 (array!75177) Bool)

(assert (=> start!99034 (array_inv!27726 _keys!1208)))

(assert (=> start!99034 true))

(assert (=> start!99034 tp!86627))

(declare-fun array_inv!27727 (array!75175) Bool)

(assert (=> start!99034 (and (array_inv!27727 _values!996) e!661940)))

(declare-fun b!1164194 () Bool)

(declare-fun res!771996 () Bool)

(assert (=> b!1164194 (=> (not res!771996) (not e!661938))))

(assert (=> b!1164194 (= res!771996 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25404))))

(declare-fun b!1164195 () Bool)

(declare-fun res!771995 () Bool)

(assert (=> b!1164195 (=> (not res!771995) (not e!661938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164195 (= res!771995 (validKeyInArray!0 k0!934))))

(assert (= (and start!99034 res!771989) b!1164182))

(assert (= (and b!1164182 res!771998) b!1164189))

(assert (= (and b!1164189 res!771990) b!1164191))

(assert (= (and b!1164191 res!771993) b!1164194))

(assert (= (and b!1164194 res!771996) b!1164190))

(assert (= (and b!1164190 res!771994) b!1164195))

(assert (= (and b!1164195 res!771995) b!1164185))

(assert (= (and b!1164185 res!771988) b!1164192))

(assert (= (and b!1164192 res!771991) b!1164186))

(assert (= (and b!1164186 res!771992) b!1164188))

(assert (= (and b!1164188 (not res!771997)) b!1164183))

(assert (= (and b!1164193 condMapEmpty!45578) mapIsEmpty!45578))

(assert (= (and b!1164193 (not condMapEmpty!45578)) mapNonEmpty!45578))

(get-info :version)

(assert (= (and mapNonEmpty!45578 ((_ is ValueCellFull!13875) mapValue!45578)) b!1164187))

(assert (= (and b!1164193 ((_ is ValueCellFull!13875) mapDefault!45578)) b!1164184))

(assert (= start!99034 b!1164193))

(declare-fun b_lambda!19745 () Bool)

(assert (=> (not b_lambda!19745) (not b!1164183)))

(declare-fun t!37036 () Bool)

(declare-fun tb!9451 () Bool)

(assert (=> (and start!99034 (= defaultEntry!1004 defaultEntry!1004) t!37036) tb!9451))

(declare-fun result!19467 () Bool)

(assert (=> tb!9451 (= result!19467 tp_is_empty!29169)))

(assert (=> b!1164183 t!37036))

(declare-fun b_and!40129 () Bool)

(assert (= b_and!40127 (and (=> t!37036 result!19467) b_and!40129)))

(declare-fun m!1072665 () Bool)

(assert (=> b!1164185 m!1072665))

(declare-fun m!1072667 () Bool)

(assert (=> b!1164188 m!1072667))

(declare-fun m!1072669 () Bool)

(assert (=> b!1164188 m!1072669))

(declare-fun m!1072671 () Bool)

(assert (=> b!1164183 m!1072671))

(declare-fun m!1072673 () Bool)

(assert (=> b!1164183 m!1072673))

(declare-fun m!1072675 () Bool)

(assert (=> b!1164183 m!1072675))

(declare-fun m!1072677 () Bool)

(assert (=> b!1164183 m!1072677))

(declare-fun m!1072679 () Bool)

(assert (=> b!1164192 m!1072679))

(declare-fun m!1072681 () Bool)

(assert (=> b!1164192 m!1072681))

(declare-fun m!1072683 () Bool)

(assert (=> b!1164194 m!1072683))

(declare-fun m!1072685 () Bool)

(assert (=> b!1164182 m!1072685))

(declare-fun m!1072687 () Bool)

(assert (=> b!1164195 m!1072687))

(declare-fun m!1072689 () Bool)

(assert (=> start!99034 m!1072689))

(declare-fun m!1072691 () Bool)

(assert (=> start!99034 m!1072691))

(declare-fun m!1072693 () Bool)

(assert (=> mapNonEmpty!45578 m!1072693))

(declare-fun m!1072695 () Bool)

(assert (=> b!1164186 m!1072695))

(declare-fun m!1072697 () Bool)

(assert (=> b!1164191 m!1072697))

(check-sat (not b!1164186) (not b!1164194) b_and!40129 (not b!1164183) (not b!1164188) (not b_lambda!19745) (not b!1164192) (not b!1164191) (not b!1164195) tp_is_empty!29169 (not mapNonEmpty!45578) (not b_next!24639) (not b!1164182) (not start!99034))
(check-sat b_and!40129 (not b_next!24639))
