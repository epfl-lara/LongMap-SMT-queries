; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97378 () Bool)

(assert start!97378)

(declare-fun b_free!23349 () Bool)

(declare-fun b_next!23349 () Bool)

(assert (=> start!97378 (= b_free!23349 (not b_next!23349))))

(declare-fun tp!82346 () Bool)

(declare-fun b_and!37533 () Bool)

(assert (=> start!97378 (= tp!82346 b_and!37533)))

(declare-fun mapIsEmpty!43231 () Bool)

(declare-fun mapRes!43231 () Bool)

(assert (=> mapIsEmpty!43231 mapRes!43231))

(declare-fun b!1110119 () Bool)

(declare-fun res!740824 () Bool)

(declare-fun e!633135 () Bool)

(assert (=> b!1110119 (=> (not res!740824) (not e!633135))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110119 (= res!740824 (validMask!0 mask!1564))))

(declare-fun b!1110120 () Bool)

(declare-fun res!740831 () Bool)

(assert (=> b!1110120 (=> (not res!740831) (not e!633135))))

(declare-datatypes ((array!72135 0))(
  ( (array!72136 (arr!34720 (Array (_ BitVec 32) (_ BitVec 64))) (size!35256 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72135)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41939 0))(
  ( (V!41940 (val!13861 Int)) )
))
(declare-datatypes ((ValueCell!13095 0))(
  ( (ValueCellFull!13095 (v!16494 V!41939)) (EmptyCell!13095) )
))
(declare-datatypes ((array!72137 0))(
  ( (array!72138 (arr!34721 (Array (_ BitVec 32) ValueCell!13095)) (size!35257 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72137)

(assert (=> b!1110120 (= res!740831 (and (= (size!35257 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35256 _keys!1208) (size!35257 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110121 () Bool)

(declare-fun res!740827 () Bool)

(assert (=> b!1110121 (=> (not res!740827) (not e!633135))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110121 (= res!740827 (validKeyInArray!0 k0!934))))

(declare-fun b!1110123 () Bool)

(declare-fun res!740825 () Bool)

(assert (=> b!1110123 (=> (not res!740825) (not e!633135))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110123 (= res!740825 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35256 _keys!1208))))))

(declare-fun b!1110124 () Bool)

(declare-fun res!740823 () Bool)

(declare-fun e!633134 () Bool)

(assert (=> b!1110124 (=> (not res!740823) (not e!633134))))

(declare-fun lt!496109 () array!72135)

(declare-datatypes ((List!24210 0))(
  ( (Nil!24207) (Cons!24206 (h!25415 (_ BitVec 64)) (t!34605 List!24210)) )
))
(declare-fun arrayNoDuplicates!0 (array!72135 (_ BitVec 32) List!24210) Bool)

(assert (=> b!1110124 (= res!740823 (arrayNoDuplicates!0 lt!496109 #b00000000000000000000000000000000 Nil!24207))))

(declare-fun b!1110125 () Bool)

(assert (=> b!1110125 (= e!633135 e!633134)))

(declare-fun res!740826 () Bool)

(assert (=> b!1110125 (=> (not res!740826) (not e!633134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72135 (_ BitVec 32)) Bool)

(assert (=> b!1110125 (= res!740826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496109 mask!1564))))

(assert (=> b!1110125 (= lt!496109 (array!72136 (store (arr!34720 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35256 _keys!1208)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41939)

(declare-datatypes ((tuple2!17526 0))(
  ( (tuple2!17527 (_1!8774 (_ BitVec 64)) (_2!8774 V!41939)) )
))
(declare-datatypes ((List!24211 0))(
  ( (Nil!24208) (Cons!24207 (h!25416 tuple2!17526) (t!34606 List!24211)) )
))
(declare-datatypes ((ListLongMap!15495 0))(
  ( (ListLongMap!15496 (toList!7763 List!24211)) )
))
(declare-fun call!46743 () ListLongMap!15495)

(declare-fun zeroValue!944 () V!41939)

(declare-fun bm!46740 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4257 (array!72135 array!72137 (_ BitVec 32) (_ BitVec 32) V!41939 V!41939 (_ BitVec 32) Int) ListLongMap!15495)

(assert (=> bm!46740 (= call!46743 (getCurrentListMapNoExtraKeys!4257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110126 () Bool)

(declare-fun e!633136 () Bool)

(declare-fun tp_is_empty!27609 () Bool)

(assert (=> b!1110126 (= e!633136 tp_is_empty!27609)))

(declare-fun b!1110127 () Bool)

(declare-fun res!740830 () Bool)

(assert (=> b!1110127 (=> (not res!740830) (not e!633135))))

(assert (=> b!1110127 (= res!740830 (= (select (arr!34720 _keys!1208) i!673) k0!934))))

(declare-fun b!1110128 () Bool)

(declare-fun e!633140 () Bool)

(assert (=> b!1110128 (= e!633140 tp_is_empty!27609)))

(declare-fun b!1110129 () Bool)

(declare-fun e!633138 () Bool)

(assert (=> b!1110129 (= e!633138 true)))

(declare-fun e!633137 () Bool)

(assert (=> b!1110129 e!633137))

(declare-fun c!109215 () Bool)

(assert (=> b!1110129 (= c!109215 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36434 0))(
  ( (Unit!36435) )
))
(declare-fun lt!496108 () Unit!36434)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!286 (array!72135 array!72137 (_ BitVec 32) (_ BitVec 32) V!41939 V!41939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36434)

(assert (=> b!1110129 (= lt!496108 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43231 () Bool)

(declare-fun tp!82345 () Bool)

(assert (=> mapNonEmpty!43231 (= mapRes!43231 (and tp!82345 e!633136))))

(declare-fun mapValue!43231 () ValueCell!13095)

(declare-fun mapKey!43231 () (_ BitVec 32))

(declare-fun mapRest!43231 () (Array (_ BitVec 32) ValueCell!13095))

(assert (=> mapNonEmpty!43231 (= (arr!34721 _values!996) (store mapRest!43231 mapKey!43231 mapValue!43231))))

(declare-fun b!1110130 () Bool)

(declare-fun e!633139 () Bool)

(assert (=> b!1110130 (= e!633139 (and e!633140 mapRes!43231))))

(declare-fun condMapEmpty!43231 () Bool)

(declare-fun mapDefault!43231 () ValueCell!13095)

(assert (=> b!1110130 (= condMapEmpty!43231 (= (arr!34721 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13095)) mapDefault!43231)))))

(declare-fun call!46744 () ListLongMap!15495)

(declare-fun b!1110131 () Bool)

(declare-fun -!1036 (ListLongMap!15495 (_ BitVec 64)) ListLongMap!15495)

(assert (=> b!1110131 (= e!633137 (= call!46744 (-!1036 call!46743 k0!934)))))

(declare-fun b!1110132 () Bool)

(declare-fun res!740832 () Bool)

(assert (=> b!1110132 (=> (not res!740832) (not e!633135))))

(assert (=> b!1110132 (= res!740832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110133 () Bool)

(declare-fun res!740829 () Bool)

(assert (=> b!1110133 (=> (not res!740829) (not e!633135))))

(assert (=> b!1110133 (= res!740829 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24207))))

(declare-fun res!740828 () Bool)

(assert (=> start!97378 (=> (not res!740828) (not e!633135))))

(assert (=> start!97378 (= res!740828 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35256 _keys!1208))))))

(assert (=> start!97378 e!633135))

(assert (=> start!97378 tp_is_empty!27609))

(declare-fun array_inv!26716 (array!72135) Bool)

(assert (=> start!97378 (array_inv!26716 _keys!1208)))

(assert (=> start!97378 true))

(assert (=> start!97378 tp!82346))

(declare-fun array_inv!26717 (array!72137) Bool)

(assert (=> start!97378 (and (array_inv!26717 _values!996) e!633139)))

(declare-fun b!1110122 () Bool)

(assert (=> b!1110122 (= e!633137 (= call!46744 call!46743))))

(declare-fun bm!46741 () Bool)

(declare-fun dynLambda!2385 (Int (_ BitVec 64)) V!41939)

(assert (=> bm!46741 (= call!46744 (getCurrentListMapNoExtraKeys!4257 lt!496109 (array!72138 (store (arr!34721 _values!996) i!673 (ValueCellFull!13095 (dynLambda!2385 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35257 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110134 () Bool)

(assert (=> b!1110134 (= e!633134 (not e!633138))))

(declare-fun res!740833 () Bool)

(assert (=> b!1110134 (=> res!740833 e!633138)))

(assert (=> b!1110134 (= res!740833 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35256 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110134 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496107 () Unit!36434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72135 (_ BitVec 64) (_ BitVec 32)) Unit!36434)

(assert (=> b!1110134 (= lt!496107 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97378 res!740828) b!1110119))

(assert (= (and b!1110119 res!740824) b!1110120))

(assert (= (and b!1110120 res!740831) b!1110132))

(assert (= (and b!1110132 res!740832) b!1110133))

(assert (= (and b!1110133 res!740829) b!1110123))

(assert (= (and b!1110123 res!740825) b!1110121))

(assert (= (and b!1110121 res!740827) b!1110127))

(assert (= (and b!1110127 res!740830) b!1110125))

(assert (= (and b!1110125 res!740826) b!1110124))

(assert (= (and b!1110124 res!740823) b!1110134))

(assert (= (and b!1110134 (not res!740833)) b!1110129))

(assert (= (and b!1110129 c!109215) b!1110131))

(assert (= (and b!1110129 (not c!109215)) b!1110122))

(assert (= (or b!1110131 b!1110122) bm!46741))

(assert (= (or b!1110131 b!1110122) bm!46740))

(assert (= (and b!1110130 condMapEmpty!43231) mapIsEmpty!43231))

(assert (= (and b!1110130 (not condMapEmpty!43231)) mapNonEmpty!43231))

(get-info :version)

(assert (= (and mapNonEmpty!43231 ((_ is ValueCellFull!13095) mapValue!43231)) b!1110126))

(assert (= (and b!1110130 ((_ is ValueCellFull!13095) mapDefault!43231)) b!1110128))

(assert (= start!97378 b!1110130))

(declare-fun b_lambda!18371 () Bool)

(assert (=> (not b_lambda!18371) (not bm!46741)))

(declare-fun t!34604 () Bool)

(declare-fun tb!8215 () Bool)

(assert (=> (and start!97378 (= defaultEntry!1004 defaultEntry!1004) t!34604) tb!8215))

(declare-fun result!16991 () Bool)

(assert (=> tb!8215 (= result!16991 tp_is_empty!27609)))

(assert (=> bm!46741 t!34604))

(declare-fun b_and!37535 () Bool)

(assert (= b_and!37533 (and (=> t!34604 result!16991) b_and!37535)))

(declare-fun m!1028233 () Bool)

(assert (=> b!1110121 m!1028233))

(declare-fun m!1028235 () Bool)

(assert (=> b!1110127 m!1028235))

(declare-fun m!1028237 () Bool)

(assert (=> b!1110124 m!1028237))

(declare-fun m!1028239 () Bool)

(assert (=> start!97378 m!1028239))

(declare-fun m!1028241 () Bool)

(assert (=> start!97378 m!1028241))

(declare-fun m!1028243 () Bool)

(assert (=> b!1110125 m!1028243))

(declare-fun m!1028245 () Bool)

(assert (=> b!1110125 m!1028245))

(declare-fun m!1028247 () Bool)

(assert (=> b!1110134 m!1028247))

(declare-fun m!1028249 () Bool)

(assert (=> b!1110134 m!1028249))

(declare-fun m!1028251 () Bool)

(assert (=> b!1110129 m!1028251))

(declare-fun m!1028253 () Bool)

(assert (=> b!1110132 m!1028253))

(declare-fun m!1028255 () Bool)

(assert (=> bm!46741 m!1028255))

(declare-fun m!1028257 () Bool)

(assert (=> bm!46741 m!1028257))

(declare-fun m!1028259 () Bool)

(assert (=> bm!46741 m!1028259))

(declare-fun m!1028261 () Bool)

(assert (=> mapNonEmpty!43231 m!1028261))

(declare-fun m!1028263 () Bool)

(assert (=> bm!46740 m!1028263))

(declare-fun m!1028265 () Bool)

(assert (=> b!1110119 m!1028265))

(declare-fun m!1028267 () Bool)

(assert (=> b!1110131 m!1028267))

(declare-fun m!1028269 () Bool)

(assert (=> b!1110133 m!1028269))

(check-sat (not b!1110129) (not bm!46741) (not b_next!23349) (not b_lambda!18371) (not b!1110124) (not mapNonEmpty!43231) (not b!1110131) (not bm!46740) (not b!1110133) tp_is_empty!27609 (not b!1110125) b_and!37535 (not b!1110132) (not start!97378) (not b!1110121) (not b!1110119) (not b!1110134))
(check-sat b_and!37535 (not b_next!23349))
