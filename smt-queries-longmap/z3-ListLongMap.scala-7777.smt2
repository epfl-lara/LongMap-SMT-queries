; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97642 () Bool)

(assert start!97642)

(declare-fun b_free!23377 () Bool)

(declare-fun b_next!23377 () Bool)

(assert (=> start!97642 (= b_free!23377 (not b_next!23377))))

(declare-fun tp!82429 () Bool)

(declare-fun b_and!37597 () Bool)

(assert (=> start!97642 (= tp!82429 b_and!37597)))

(declare-fun b!1112134 () Bool)

(declare-fun e!634322 () Bool)

(declare-fun tp_is_empty!27637 () Bool)

(assert (=> b!1112134 (= e!634322 tp_is_empty!27637)))

(declare-fun b!1112135 () Bool)

(declare-fun e!634326 () Bool)

(assert (=> b!1112135 (= e!634326 true)))

(declare-fun e!634321 () Bool)

(assert (=> b!1112135 e!634321))

(declare-fun c!109661 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112135 (= c!109661 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41977 0))(
  ( (V!41978 (val!13875 Int)) )
))
(declare-fun zeroValue!944 () V!41977)

(declare-datatypes ((array!72225 0))(
  ( (array!72226 (arr!34759 (Array (_ BitVec 32) (_ BitVec 64))) (size!35296 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72225)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13109 0))(
  ( (ValueCellFull!13109 (v!16504 V!41977)) (EmptyCell!13109) )
))
(declare-datatypes ((array!72227 0))(
  ( (array!72228 (arr!34760 (Array (_ BitVec 32) ValueCell!13109)) (size!35297 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72227)

(declare-fun minValue!944 () V!41977)

(declare-datatypes ((Unit!36429 0))(
  ( (Unit!36430) )
))
(declare-fun lt!496748 () Unit!36429)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!306 (array!72225 array!72227 (_ BitVec 32) (_ BitVec 32) V!41977 V!41977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36429)

(assert (=> b!1112135 (= lt!496748 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!306 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43273 () Bool)

(declare-fun mapRes!43273 () Bool)

(declare-fun tp!82430 () Bool)

(assert (=> mapNonEmpty!43273 (= mapRes!43273 (and tp!82430 e!634322))))

(declare-fun mapValue!43273 () ValueCell!13109)

(declare-fun mapKey!43273 () (_ BitVec 32))

(declare-fun mapRest!43273 () (Array (_ BitVec 32) ValueCell!13109))

(assert (=> mapNonEmpty!43273 (= (arr!34760 _values!996) (store mapRest!43273 mapKey!43273 mapValue!43273))))

(declare-datatypes ((tuple2!17570 0))(
  ( (tuple2!17571 (_1!8796 (_ BitVec 64)) (_2!8796 V!41977)) )
))
(declare-datatypes ((List!24252 0))(
  ( (Nil!24249) (Cons!24248 (h!25466 tuple2!17570) (t!34667 List!24252)) )
))
(declare-datatypes ((ListLongMap!15547 0))(
  ( (ListLongMap!15548 (toList!7789 List!24252)) )
))
(declare-fun call!46895 () ListLongMap!15547)

(declare-fun bm!46891 () Bool)

(declare-fun lt!496749 () array!72225)

(declare-fun getCurrentListMapNoExtraKeys!4321 (array!72225 array!72227 (_ BitVec 32) (_ BitVec 32) V!41977 V!41977 (_ BitVec 32) Int) ListLongMap!15547)

(declare-fun dynLambda!2433 (Int (_ BitVec 64)) V!41977)

(assert (=> bm!46891 (= call!46895 (getCurrentListMapNoExtraKeys!4321 lt!496749 (array!72228 (store (arr!34760 _values!996) i!673 (ValueCellFull!13109 (dynLambda!2433 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35297 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112136 () Bool)

(declare-fun res!741808 () Bool)

(declare-fun e!634319 () Bool)

(assert (=> b!1112136 (=> (not res!741808) (not e!634319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112136 (= res!741808 (validMask!0 mask!1564))))

(declare-fun b!1112137 () Bool)

(declare-fun res!741817 () Bool)

(assert (=> b!1112137 (=> (not res!741817) (not e!634319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112137 (= res!741817 (validKeyInArray!0 k0!934))))

(declare-fun b!1112138 () Bool)

(declare-fun e!634320 () Bool)

(declare-fun e!634324 () Bool)

(assert (=> b!1112138 (= e!634320 (and e!634324 mapRes!43273))))

(declare-fun condMapEmpty!43273 () Bool)

(declare-fun mapDefault!43273 () ValueCell!13109)

(assert (=> b!1112138 (= condMapEmpty!43273 (= (arr!34760 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13109)) mapDefault!43273)))))

(declare-fun b!1112139 () Bool)

(declare-fun res!741813 () Bool)

(assert (=> b!1112139 (=> (not res!741813) (not e!634319))))

(declare-datatypes ((List!24253 0))(
  ( (Nil!24250) (Cons!24249 (h!25467 (_ BitVec 64)) (t!34668 List!24253)) )
))
(declare-fun arrayNoDuplicates!0 (array!72225 (_ BitVec 32) List!24253) Bool)

(assert (=> b!1112139 (= res!741813 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24250))))

(declare-fun b!1112140 () Bool)

(declare-fun res!741811 () Bool)

(assert (=> b!1112140 (=> (not res!741811) (not e!634319))))

(assert (=> b!1112140 (= res!741811 (and (= (size!35297 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35296 _keys!1208) (size!35297 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46892 () Bool)

(declare-fun call!46894 () ListLongMap!15547)

(assert (=> bm!46892 (= call!46894 (getCurrentListMapNoExtraKeys!4321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112141 () Bool)

(declare-fun e!634323 () Bool)

(assert (=> b!1112141 (= e!634323 (not e!634326))))

(declare-fun res!741807 () Bool)

(assert (=> b!1112141 (=> res!741807 e!634326)))

(assert (=> b!1112141 (= res!741807 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35296 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112141 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496750 () Unit!36429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72225 (_ BitVec 64) (_ BitVec 32)) Unit!36429)

(assert (=> b!1112141 (= lt!496750 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112142 () Bool)

(declare-fun res!741815 () Bool)

(assert (=> b!1112142 (=> (not res!741815) (not e!634319))))

(assert (=> b!1112142 (= res!741815 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35296 _keys!1208))))))

(declare-fun b!1112143 () Bool)

(declare-fun res!741810 () Bool)

(assert (=> b!1112143 (=> (not res!741810) (not e!634323))))

(assert (=> b!1112143 (= res!741810 (arrayNoDuplicates!0 lt!496749 #b00000000000000000000000000000000 Nil!24250))))

(declare-fun mapIsEmpty!43273 () Bool)

(assert (=> mapIsEmpty!43273 mapRes!43273))

(declare-fun b!1112144 () Bool)

(assert (=> b!1112144 (= e!634324 tp_is_empty!27637)))

(declare-fun b!1112145 () Bool)

(assert (=> b!1112145 (= e!634321 (= call!46895 call!46894))))

(declare-fun b!1112146 () Bool)

(assert (=> b!1112146 (= e!634319 e!634323)))

(declare-fun res!741812 () Bool)

(assert (=> b!1112146 (=> (not res!741812) (not e!634323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72225 (_ BitVec 32)) Bool)

(assert (=> b!1112146 (= res!741812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496749 mask!1564))))

(assert (=> b!1112146 (= lt!496749 (array!72226 (store (arr!34759 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35296 _keys!1208)))))

(declare-fun b!1112147 () Bool)

(declare-fun res!741816 () Bool)

(assert (=> b!1112147 (=> (not res!741816) (not e!634319))))

(assert (=> b!1112147 (= res!741816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!741809 () Bool)

(assert (=> start!97642 (=> (not res!741809) (not e!634319))))

(assert (=> start!97642 (= res!741809 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35296 _keys!1208))))))

(assert (=> start!97642 e!634319))

(assert (=> start!97642 tp_is_empty!27637))

(declare-fun array_inv!26786 (array!72225) Bool)

(assert (=> start!97642 (array_inv!26786 _keys!1208)))

(assert (=> start!97642 true))

(assert (=> start!97642 tp!82429))

(declare-fun array_inv!26787 (array!72227) Bool)

(assert (=> start!97642 (and (array_inv!26787 _values!996) e!634320)))

(declare-fun b!1112148 () Bool)

(declare-fun res!741814 () Bool)

(assert (=> b!1112148 (=> (not res!741814) (not e!634319))))

(assert (=> b!1112148 (= res!741814 (= (select (arr!34759 _keys!1208) i!673) k0!934))))

(declare-fun b!1112149 () Bool)

(declare-fun -!1040 (ListLongMap!15547 (_ BitVec 64)) ListLongMap!15547)

(assert (=> b!1112149 (= e!634321 (= call!46895 (-!1040 call!46894 k0!934)))))

(assert (= (and start!97642 res!741809) b!1112136))

(assert (= (and b!1112136 res!741808) b!1112140))

(assert (= (and b!1112140 res!741811) b!1112147))

(assert (= (and b!1112147 res!741816) b!1112139))

(assert (= (and b!1112139 res!741813) b!1112142))

(assert (= (and b!1112142 res!741815) b!1112137))

(assert (= (and b!1112137 res!741817) b!1112148))

(assert (= (and b!1112148 res!741814) b!1112146))

(assert (= (and b!1112146 res!741812) b!1112143))

(assert (= (and b!1112143 res!741810) b!1112141))

(assert (= (and b!1112141 (not res!741807)) b!1112135))

(assert (= (and b!1112135 c!109661) b!1112149))

(assert (= (and b!1112135 (not c!109661)) b!1112145))

(assert (= (or b!1112149 b!1112145) bm!46891))

(assert (= (or b!1112149 b!1112145) bm!46892))

(assert (= (and b!1112138 condMapEmpty!43273) mapIsEmpty!43273))

(assert (= (and b!1112138 (not condMapEmpty!43273)) mapNonEmpty!43273))

(get-info :version)

(assert (= (and mapNonEmpty!43273 ((_ is ValueCellFull!13109) mapValue!43273)) b!1112134))

(assert (= (and b!1112138 ((_ is ValueCellFull!13109) mapDefault!43273)) b!1112144))

(assert (= start!97642 b!1112138))

(declare-fun b_lambda!18407 () Bool)

(assert (=> (not b_lambda!18407) (not bm!46891)))

(declare-fun t!34666 () Bool)

(declare-fun tb!8235 () Bool)

(assert (=> (and start!97642 (= defaultEntry!1004 defaultEntry!1004) t!34666) tb!8235))

(declare-fun result!17039 () Bool)

(assert (=> tb!8235 (= result!17039 tp_is_empty!27637)))

(assert (=> bm!46891 t!34666))

(declare-fun b_and!37599 () Bool)

(assert (= b_and!37597 (and (=> t!34666 result!17039) b_and!37599)))

(declare-fun m!1030437 () Bool)

(assert (=> b!1112149 m!1030437))

(declare-fun m!1030439 () Bool)

(assert (=> b!1112141 m!1030439))

(declare-fun m!1030441 () Bool)

(assert (=> b!1112141 m!1030441))

(declare-fun m!1030443 () Bool)

(assert (=> b!1112146 m!1030443))

(declare-fun m!1030445 () Bool)

(assert (=> b!1112146 m!1030445))

(declare-fun m!1030447 () Bool)

(assert (=> start!97642 m!1030447))

(declare-fun m!1030449 () Bool)

(assert (=> start!97642 m!1030449))

(declare-fun m!1030451 () Bool)

(assert (=> b!1112143 m!1030451))

(declare-fun m!1030453 () Bool)

(assert (=> mapNonEmpty!43273 m!1030453))

(declare-fun m!1030455 () Bool)

(assert (=> b!1112135 m!1030455))

(declare-fun m!1030457 () Bool)

(assert (=> bm!46891 m!1030457))

(declare-fun m!1030459 () Bool)

(assert (=> bm!46891 m!1030459))

(declare-fun m!1030461 () Bool)

(assert (=> bm!46891 m!1030461))

(declare-fun m!1030463 () Bool)

(assert (=> bm!46892 m!1030463))

(declare-fun m!1030465 () Bool)

(assert (=> b!1112139 m!1030465))

(declare-fun m!1030467 () Bool)

(assert (=> b!1112137 m!1030467))

(declare-fun m!1030469 () Bool)

(assert (=> b!1112136 m!1030469))

(declare-fun m!1030471 () Bool)

(assert (=> b!1112147 m!1030471))

(declare-fun m!1030473 () Bool)

(assert (=> b!1112148 m!1030473))

(check-sat (not b!1112143) b_and!37599 (not b!1112141) (not b_lambda!18407) (not b!1112149) (not mapNonEmpty!43273) (not b!1112135) (not b!1112146) (not b!1112147) (not b!1112139) (not bm!46891) (not b!1112137) (not start!97642) (not b_next!23377) (not bm!46892) tp_is_empty!27637 (not b!1112136))
(check-sat b_and!37599 (not b_next!23377))
