; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97298 () Bool)

(assert start!97298)

(declare-fun b_free!23275 () Bool)

(declare-fun b_next!23275 () Bool)

(assert (=> start!97298 (= b_free!23275 (not b_next!23275))))

(declare-fun tp!82124 () Bool)

(declare-fun b_and!37361 () Bool)

(assert (=> start!97298 (= tp!82124 b_and!37361)))

(declare-fun b!1108128 () Bool)

(declare-fun res!739539 () Bool)

(declare-fun e!632164 () Bool)

(assert (=> b!1108128 (=> (not res!739539) (not e!632164))))

(declare-datatypes ((array!71886 0))(
  ( (array!71887 (arr!34596 (Array (_ BitVec 32) (_ BitVec 64))) (size!35134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71886)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1108128 (= res!739539 (= (select (arr!34596 _keys!1208) i!673) k0!934))))

(declare-fun b!1108129 () Bool)

(declare-fun res!739543 () Bool)

(assert (=> b!1108129 (=> (not res!739543) (not e!632164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108129 (= res!739543 (validKeyInArray!0 k0!934))))

(declare-fun b!1108130 () Bool)

(declare-fun e!632163 () Bool)

(declare-fun tp_is_empty!27535 () Bool)

(assert (=> b!1108130 (= e!632163 tp_is_empty!27535)))

(declare-fun b!1108131 () Bool)

(declare-fun res!739541 () Bool)

(assert (=> b!1108131 (=> (not res!739541) (not e!632164))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71886 (_ BitVec 32)) Bool)

(assert (=> b!1108131 (= res!739541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!739537 () Bool)

(assert (=> start!97298 (=> (not res!739537) (not e!632164))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97298 (= res!739537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35134 _keys!1208))))))

(assert (=> start!97298 e!632164))

(assert (=> start!97298 tp_is_empty!27535))

(declare-fun array_inv!26678 (array!71886) Bool)

(assert (=> start!97298 (array_inv!26678 _keys!1208)))

(assert (=> start!97298 true))

(assert (=> start!97298 tp!82124))

(declare-datatypes ((V!41841 0))(
  ( (V!41842 (val!13824 Int)) )
))
(declare-datatypes ((ValueCell!13058 0))(
  ( (ValueCellFull!13058 (v!16456 V!41841)) (EmptyCell!13058) )
))
(declare-datatypes ((array!71888 0))(
  ( (array!71889 (arr!34597 (Array (_ BitVec 32) ValueCell!13058)) (size!35135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71888)

(declare-fun e!632159 () Bool)

(declare-fun array_inv!26679 (array!71888) Bool)

(assert (=> start!97298 (and (array_inv!26679 _values!996) e!632159)))

(declare-fun b!1108132 () Bool)

(declare-fun res!739538 () Bool)

(assert (=> b!1108132 (=> (not res!739538) (not e!632164))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1108132 (= res!739538 (and (= (size!35135 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35134 _keys!1208) (size!35135 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108133 () Bool)

(declare-fun e!632160 () Bool)

(assert (=> b!1108133 (= e!632160 tp_is_empty!27535)))

(declare-fun zeroValue!944 () V!41841)

(declare-fun bm!46495 () Bool)

(declare-datatypes ((tuple2!17520 0))(
  ( (tuple2!17521 (_1!8771 (_ BitVec 64)) (_2!8771 V!41841)) )
))
(declare-datatypes ((List!24177 0))(
  ( (Nil!24174) (Cons!24173 (h!25382 tuple2!17520) (t!34489 List!24177)) )
))
(declare-datatypes ((ListLongMap!15489 0))(
  ( (ListLongMap!15490 (toList!7760 List!24177)) )
))
(declare-fun call!46499 () ListLongMap!15489)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41841)

(declare-fun getCurrentListMapNoExtraKeys!4277 (array!71886 array!71888 (_ BitVec 32) (_ BitVec 32) V!41841 V!41841 (_ BitVec 32) Int) ListLongMap!15489)

(assert (=> bm!46495 (= call!46499 (getCurrentListMapNoExtraKeys!4277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108134 () Bool)

(declare-fun res!739534 () Bool)

(assert (=> b!1108134 (=> (not res!739534) (not e!632164))))

(declare-datatypes ((List!24178 0))(
  ( (Nil!24175) (Cons!24174 (h!25383 (_ BitVec 64)) (t!34490 List!24178)) )
))
(declare-fun arrayNoDuplicates!0 (array!71886 (_ BitVec 32) List!24178) Bool)

(assert (=> b!1108134 (= res!739534 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24175))))

(declare-fun b!1108135 () Bool)

(declare-fun e!632161 () Bool)

(assert (=> b!1108135 (= e!632164 e!632161)))

(declare-fun res!739535 () Bool)

(assert (=> b!1108135 (=> (not res!739535) (not e!632161))))

(declare-fun lt!495576 () array!71886)

(assert (=> b!1108135 (= res!739535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495576 mask!1564))))

(assert (=> b!1108135 (= lt!495576 (array!71887 (store (arr!34596 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35134 _keys!1208)))))

(declare-fun mapIsEmpty!43120 () Bool)

(declare-fun mapRes!43120 () Bool)

(assert (=> mapIsEmpty!43120 mapRes!43120))

(declare-fun b!1108136 () Bool)

(declare-fun call!46498 () ListLongMap!15489)

(declare-fun e!632165 () Bool)

(declare-fun -!982 (ListLongMap!15489 (_ BitVec 64)) ListLongMap!15489)

(assert (=> b!1108136 (= e!632165 (= call!46498 (-!982 call!46499 k0!934)))))

(declare-fun b!1108137 () Bool)

(declare-fun e!632166 () Bool)

(assert (=> b!1108137 (= e!632166 true)))

(assert (=> b!1108137 e!632165))

(declare-fun c!109071 () Bool)

(assert (=> b!1108137 (= c!109071 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36181 0))(
  ( (Unit!36182) )
))
(declare-fun lt!495574 () Unit!36181)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!255 (array!71886 array!71888 (_ BitVec 32) (_ BitVec 32) V!41841 V!41841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36181)

(assert (=> b!1108137 (= lt!495574 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108138 () Bool)

(assert (=> b!1108138 (= e!632165 (= call!46498 call!46499))))

(declare-fun bm!46496 () Bool)

(declare-fun dynLambda!2344 (Int (_ BitVec 64)) V!41841)

(assert (=> bm!46496 (= call!46498 (getCurrentListMapNoExtraKeys!4277 lt!495576 (array!71889 (store (arr!34597 _values!996) i!673 (ValueCellFull!13058 (dynLambda!2344 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35135 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108139 () Bool)

(assert (=> b!1108139 (= e!632159 (and e!632163 mapRes!43120))))

(declare-fun condMapEmpty!43120 () Bool)

(declare-fun mapDefault!43120 () ValueCell!13058)

(assert (=> b!1108139 (= condMapEmpty!43120 (= (arr!34597 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13058)) mapDefault!43120)))))

(declare-fun b!1108140 () Bool)

(declare-fun res!739542 () Bool)

(assert (=> b!1108140 (=> (not res!739542) (not e!632164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108140 (= res!739542 (validMask!0 mask!1564))))

(declare-fun b!1108141 () Bool)

(declare-fun res!739540 () Bool)

(assert (=> b!1108141 (=> (not res!739540) (not e!632161))))

(assert (=> b!1108141 (= res!739540 (arrayNoDuplicates!0 lt!495576 #b00000000000000000000000000000000 Nil!24175))))

(declare-fun mapNonEmpty!43120 () Bool)

(declare-fun tp!82123 () Bool)

(assert (=> mapNonEmpty!43120 (= mapRes!43120 (and tp!82123 e!632160))))

(declare-fun mapValue!43120 () ValueCell!13058)

(declare-fun mapKey!43120 () (_ BitVec 32))

(declare-fun mapRest!43120 () (Array (_ BitVec 32) ValueCell!13058))

(assert (=> mapNonEmpty!43120 (= (arr!34597 _values!996) (store mapRest!43120 mapKey!43120 mapValue!43120))))

(declare-fun b!1108142 () Bool)

(assert (=> b!1108142 (= e!632161 (not e!632166))))

(declare-fun res!739536 () Bool)

(assert (=> b!1108142 (=> res!739536 e!632166)))

(assert (=> b!1108142 (= res!739536 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35134 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108142 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495575 () Unit!36181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71886 (_ BitVec 64) (_ BitVec 32)) Unit!36181)

(assert (=> b!1108142 (= lt!495575 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108143 () Bool)

(declare-fun res!739533 () Bool)

(assert (=> b!1108143 (=> (not res!739533) (not e!632164))))

(assert (=> b!1108143 (= res!739533 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35134 _keys!1208))))))

(assert (= (and start!97298 res!739537) b!1108140))

(assert (= (and b!1108140 res!739542) b!1108132))

(assert (= (and b!1108132 res!739538) b!1108131))

(assert (= (and b!1108131 res!739541) b!1108134))

(assert (= (and b!1108134 res!739534) b!1108143))

(assert (= (and b!1108143 res!739533) b!1108129))

(assert (= (and b!1108129 res!739543) b!1108128))

(assert (= (and b!1108128 res!739539) b!1108135))

(assert (= (and b!1108135 res!739535) b!1108141))

(assert (= (and b!1108141 res!739540) b!1108142))

(assert (= (and b!1108142 (not res!739536)) b!1108137))

(assert (= (and b!1108137 c!109071) b!1108136))

(assert (= (and b!1108137 (not c!109071)) b!1108138))

(assert (= (or b!1108136 b!1108138) bm!46496))

(assert (= (or b!1108136 b!1108138) bm!46495))

(assert (= (and b!1108139 condMapEmpty!43120) mapIsEmpty!43120))

(assert (= (and b!1108139 (not condMapEmpty!43120)) mapNonEmpty!43120))

(get-info :version)

(assert (= (and mapNonEmpty!43120 ((_ is ValueCellFull!13058) mapValue!43120)) b!1108133))

(assert (= (and b!1108139 ((_ is ValueCellFull!13058) mapDefault!43120)) b!1108130))

(assert (= start!97298 b!1108139))

(declare-fun b_lambda!18277 () Bool)

(assert (=> (not b_lambda!18277) (not bm!46496)))

(declare-fun t!34488 () Bool)

(declare-fun tb!8133 () Bool)

(assert (=> (and start!97298 (= defaultEntry!1004 defaultEntry!1004) t!34488) tb!8133))

(declare-fun result!16835 () Bool)

(assert (=> tb!8133 (= result!16835 tp_is_empty!27535)))

(assert (=> bm!46496 t!34488))

(declare-fun b_and!37363 () Bool)

(assert (= b_and!37361 (and (=> t!34488 result!16835) b_and!37363)))

(declare-fun m!1026201 () Bool)

(assert (=> b!1108142 m!1026201))

(declare-fun m!1026203 () Bool)

(assert (=> b!1108142 m!1026203))

(declare-fun m!1026205 () Bool)

(assert (=> bm!46496 m!1026205))

(declare-fun m!1026207 () Bool)

(assert (=> bm!46496 m!1026207))

(declare-fun m!1026209 () Bool)

(assert (=> bm!46496 m!1026209))

(declare-fun m!1026211 () Bool)

(assert (=> b!1108140 m!1026211))

(declare-fun m!1026213 () Bool)

(assert (=> b!1108131 m!1026213))

(declare-fun m!1026215 () Bool)

(assert (=> b!1108135 m!1026215))

(declare-fun m!1026217 () Bool)

(assert (=> b!1108135 m!1026217))

(declare-fun m!1026219 () Bool)

(assert (=> bm!46495 m!1026219))

(declare-fun m!1026221 () Bool)

(assert (=> b!1108137 m!1026221))

(declare-fun m!1026223 () Bool)

(assert (=> b!1108129 m!1026223))

(declare-fun m!1026225 () Bool)

(assert (=> start!97298 m!1026225))

(declare-fun m!1026227 () Bool)

(assert (=> start!97298 m!1026227))

(declare-fun m!1026229 () Bool)

(assert (=> b!1108134 m!1026229))

(declare-fun m!1026231 () Bool)

(assert (=> mapNonEmpty!43120 m!1026231))

(declare-fun m!1026233 () Bool)

(assert (=> b!1108128 m!1026233))

(declare-fun m!1026235 () Bool)

(assert (=> b!1108136 m!1026235))

(declare-fun m!1026237 () Bool)

(assert (=> b!1108141 m!1026237))

(check-sat (not mapNonEmpty!43120) (not b!1108137) (not bm!46496) (not b!1108142) (not bm!46495) (not b!1108135) (not b_next!23275) (not b!1108136) (not b!1108134) tp_is_empty!27535 (not b!1108140) b_and!37363 (not start!97298) (not b!1108131) (not b_lambda!18277) (not b!1108129) (not b!1108141))
(check-sat b_and!37363 (not b_next!23275))
