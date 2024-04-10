; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97318 () Bool)

(assert start!97318)

(declare-fun b_free!23289 () Bool)

(declare-fun b_next!23289 () Bool)

(assert (=> start!97318 (= b_free!23289 (not b_next!23289))))

(declare-fun tp!82165 () Bool)

(declare-fun b_and!37411 () Bool)

(assert (=> start!97318 (= tp!82165 b_and!37411)))

(declare-fun b!1108607 () Bool)

(declare-fun res!739842 () Bool)

(declare-fun e!632409 () Bool)

(assert (=> b!1108607 (=> (not res!739842) (not e!632409))))

(declare-datatypes ((array!72015 0))(
  ( (array!72016 (arr!34660 (Array (_ BitVec 32) (_ BitVec 64))) (size!35196 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72015)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1108607 (= res!739842 (= (select (arr!34660 _keys!1208) i!673) k0!934))))

(declare-datatypes ((V!41859 0))(
  ( (V!41860 (val!13831 Int)) )
))
(declare-datatypes ((tuple2!17478 0))(
  ( (tuple2!17479 (_1!8750 (_ BitVec 64)) (_2!8750 V!41859)) )
))
(declare-datatypes ((List!24162 0))(
  ( (Nil!24159) (Cons!24158 (h!25367 tuple2!17478) (t!34497 List!24162)) )
))
(declare-datatypes ((ListLongMap!15447 0))(
  ( (ListLongMap!15448 (toList!7739 List!24162)) )
))
(declare-fun call!46563 () ListLongMap!15447)

(declare-fun b!1108608 () Bool)

(declare-fun call!46564 () ListLongMap!15447)

(declare-fun e!632410 () Bool)

(declare-fun -!1018 (ListLongMap!15447 (_ BitVec 64)) ListLongMap!15447)

(assert (=> b!1108608 (= e!632410 (= call!46564 (-!1018 call!46563 k0!934)))))

(declare-fun b!1108609 () Bool)

(declare-fun res!739835 () Bool)

(assert (=> b!1108609 (=> (not res!739835) (not e!632409))))

(declare-datatypes ((List!24163 0))(
  ( (Nil!24160) (Cons!24159 (h!25368 (_ BitVec 64)) (t!34498 List!24163)) )
))
(declare-fun arrayNoDuplicates!0 (array!72015 (_ BitVec 32) List!24163) Bool)

(assert (=> b!1108609 (= res!739835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24160))))

(declare-fun mapIsEmpty!43141 () Bool)

(declare-fun mapRes!43141 () Bool)

(assert (=> mapIsEmpty!43141 mapRes!43141))

(declare-fun b!1108610 () Bool)

(declare-fun e!632413 () Bool)

(declare-fun e!632408 () Bool)

(assert (=> b!1108610 (= e!632413 (not e!632408))))

(declare-fun res!739840 () Bool)

(assert (=> b!1108610 (=> res!739840 e!632408)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108610 (= res!739840 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35196 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108610 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36384 0))(
  ( (Unit!36385) )
))
(declare-fun lt!495838 () Unit!36384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72015 (_ BitVec 64) (_ BitVec 32)) Unit!36384)

(assert (=> b!1108610 (= lt!495838 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108611 () Bool)

(declare-fun e!632412 () Bool)

(declare-fun tp_is_empty!27549 () Bool)

(assert (=> b!1108611 (= e!632412 tp_is_empty!27549)))

(declare-fun b!1108612 () Bool)

(declare-fun res!739839 () Bool)

(assert (=> b!1108612 (=> (not res!739839) (not e!632409))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13065 0))(
  ( (ValueCellFull!13065 (v!16464 V!41859)) (EmptyCell!13065) )
))
(declare-datatypes ((array!72017 0))(
  ( (array!72018 (arr!34661 (Array (_ BitVec 32) ValueCell!13065)) (size!35197 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72017)

(assert (=> b!1108612 (= res!739839 (and (= (size!35197 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35196 _keys!1208) (size!35197 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108613 () Bool)

(declare-fun res!739843 () Bool)

(assert (=> b!1108613 (=> (not res!739843) (not e!632413))))

(declare-fun lt!495837 () array!72015)

(assert (=> b!1108613 (= res!739843 (arrayNoDuplicates!0 lt!495837 #b00000000000000000000000000000000 Nil!24160))))

(declare-fun b!1108614 () Bool)

(declare-fun res!739836 () Bool)

(assert (=> b!1108614 (=> (not res!739836) (not e!632409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108614 (= res!739836 (validMask!0 mask!1564))))

(declare-fun b!1108615 () Bool)

(assert (=> b!1108615 (= e!632408 true)))

(assert (=> b!1108615 e!632410))

(declare-fun c!109119 () Bool)

(assert (=> b!1108615 (= c!109119 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41859)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41859)

(declare-fun lt!495839 () Unit!36384)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!264 (array!72015 array!72017 (_ BitVec 32) (_ BitVec 32) V!41859 V!41859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36384)

(assert (=> b!1108615 (= lt!495839 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!264 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43141 () Bool)

(declare-fun tp!82166 () Bool)

(declare-fun e!632414 () Bool)

(assert (=> mapNonEmpty!43141 (= mapRes!43141 (and tp!82166 e!632414))))

(declare-fun mapKey!43141 () (_ BitVec 32))

(declare-fun mapValue!43141 () ValueCell!13065)

(declare-fun mapRest!43141 () (Array (_ BitVec 32) ValueCell!13065))

(assert (=> mapNonEmpty!43141 (= (arr!34661 _values!996) (store mapRest!43141 mapKey!43141 mapValue!43141))))

(declare-fun b!1108616 () Bool)

(assert (=> b!1108616 (= e!632410 (= call!46564 call!46563))))

(declare-fun b!1108617 () Bool)

(declare-fun res!739837 () Bool)

(assert (=> b!1108617 (=> (not res!739837) (not e!632409))))

(assert (=> b!1108617 (= res!739837 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35196 _keys!1208))))))

(declare-fun res!739838 () Bool)

(assert (=> start!97318 (=> (not res!739838) (not e!632409))))

(assert (=> start!97318 (= res!739838 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35196 _keys!1208))))))

(assert (=> start!97318 e!632409))

(assert (=> start!97318 tp_is_empty!27549))

(declare-fun array_inv!26674 (array!72015) Bool)

(assert (=> start!97318 (array_inv!26674 _keys!1208)))

(assert (=> start!97318 true))

(assert (=> start!97318 tp!82165))

(declare-fun e!632411 () Bool)

(declare-fun array_inv!26675 (array!72017) Bool)

(assert (=> start!97318 (and (array_inv!26675 _values!996) e!632411)))

(declare-fun bm!46560 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4234 (array!72015 array!72017 (_ BitVec 32) (_ BitVec 32) V!41859 V!41859 (_ BitVec 32) Int) ListLongMap!15447)

(declare-fun dynLambda!2366 (Int (_ BitVec 64)) V!41859)

(assert (=> bm!46560 (= call!46564 (getCurrentListMapNoExtraKeys!4234 lt!495837 (array!72018 (store (arr!34661 _values!996) i!673 (ValueCellFull!13065 (dynLambda!2366 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35197 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108618 () Bool)

(assert (=> b!1108618 (= e!632409 e!632413)))

(declare-fun res!739833 () Bool)

(assert (=> b!1108618 (=> (not res!739833) (not e!632413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72015 (_ BitVec 32)) Bool)

(assert (=> b!1108618 (= res!739833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495837 mask!1564))))

(assert (=> b!1108618 (= lt!495837 (array!72016 (store (arr!34660 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35196 _keys!1208)))))

(declare-fun b!1108619 () Bool)

(declare-fun res!739841 () Bool)

(assert (=> b!1108619 (=> (not res!739841) (not e!632409))))

(assert (=> b!1108619 (= res!739841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108620 () Bool)

(assert (=> b!1108620 (= e!632411 (and e!632412 mapRes!43141))))

(declare-fun condMapEmpty!43141 () Bool)

(declare-fun mapDefault!43141 () ValueCell!13065)

(assert (=> b!1108620 (= condMapEmpty!43141 (= (arr!34661 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13065)) mapDefault!43141)))))

(declare-fun b!1108621 () Bool)

(assert (=> b!1108621 (= e!632414 tp_is_empty!27549)))

(declare-fun b!1108622 () Bool)

(declare-fun res!739834 () Bool)

(assert (=> b!1108622 (=> (not res!739834) (not e!632409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108622 (= res!739834 (validKeyInArray!0 k0!934))))

(declare-fun bm!46561 () Bool)

(assert (=> bm!46561 (= call!46563 (getCurrentListMapNoExtraKeys!4234 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97318 res!739838) b!1108614))

(assert (= (and b!1108614 res!739836) b!1108612))

(assert (= (and b!1108612 res!739839) b!1108619))

(assert (= (and b!1108619 res!739841) b!1108609))

(assert (= (and b!1108609 res!739835) b!1108617))

(assert (= (and b!1108617 res!739837) b!1108622))

(assert (= (and b!1108622 res!739834) b!1108607))

(assert (= (and b!1108607 res!739842) b!1108618))

(assert (= (and b!1108618 res!739833) b!1108613))

(assert (= (and b!1108613 res!739843) b!1108610))

(assert (= (and b!1108610 (not res!739840)) b!1108615))

(assert (= (and b!1108615 c!109119) b!1108608))

(assert (= (and b!1108615 (not c!109119)) b!1108616))

(assert (= (or b!1108608 b!1108616) bm!46560))

(assert (= (or b!1108608 b!1108616) bm!46561))

(assert (= (and b!1108620 condMapEmpty!43141) mapIsEmpty!43141))

(assert (= (and b!1108620 (not condMapEmpty!43141)) mapNonEmpty!43141))

(get-info :version)

(assert (= (and mapNonEmpty!43141 ((_ is ValueCellFull!13065) mapValue!43141)) b!1108621))

(assert (= (and b!1108620 ((_ is ValueCellFull!13065) mapDefault!43141)) b!1108611))

(assert (= start!97318 b!1108620))

(declare-fun b_lambda!18309 () Bool)

(assert (=> (not b_lambda!18309) (not bm!46560)))

(declare-fun t!34496 () Bool)

(declare-fun tb!8155 () Bool)

(assert (=> (and start!97318 (= defaultEntry!1004 defaultEntry!1004) t!34496) tb!8155))

(declare-fun result!16871 () Bool)

(assert (=> tb!8155 (= result!16871 tp_is_empty!27549)))

(assert (=> bm!46560 t!34496))

(declare-fun b_and!37413 () Bool)

(assert (= b_and!37411 (and (=> t!34496 result!16871) b_and!37413)))

(declare-fun m!1027093 () Bool)

(assert (=> b!1108613 m!1027093))

(declare-fun m!1027095 () Bool)

(assert (=> bm!46560 m!1027095))

(declare-fun m!1027097 () Bool)

(assert (=> bm!46560 m!1027097))

(declare-fun m!1027099 () Bool)

(assert (=> bm!46560 m!1027099))

(declare-fun m!1027101 () Bool)

(assert (=> b!1108609 m!1027101))

(declare-fun m!1027103 () Bool)

(assert (=> b!1108614 m!1027103))

(declare-fun m!1027105 () Bool)

(assert (=> b!1108622 m!1027105))

(declare-fun m!1027107 () Bool)

(assert (=> b!1108608 m!1027107))

(declare-fun m!1027109 () Bool)

(assert (=> mapNonEmpty!43141 m!1027109))

(declare-fun m!1027111 () Bool)

(assert (=> bm!46561 m!1027111))

(declare-fun m!1027113 () Bool)

(assert (=> b!1108610 m!1027113))

(declare-fun m!1027115 () Bool)

(assert (=> b!1108610 m!1027115))

(declare-fun m!1027117 () Bool)

(assert (=> start!97318 m!1027117))

(declare-fun m!1027119 () Bool)

(assert (=> start!97318 m!1027119))

(declare-fun m!1027121 () Bool)

(assert (=> b!1108618 m!1027121))

(declare-fun m!1027123 () Bool)

(assert (=> b!1108618 m!1027123))

(declare-fun m!1027125 () Bool)

(assert (=> b!1108607 m!1027125))

(declare-fun m!1027127 () Bool)

(assert (=> b!1108615 m!1027127))

(declare-fun m!1027129 () Bool)

(assert (=> b!1108619 m!1027129))

(check-sat b_and!37413 tp_is_empty!27549 (not b!1108619) (not b!1108622) (not bm!46561) (not b_lambda!18309) (not b!1108610) (not b!1108618) (not b!1108609) (not bm!46560) (not b!1108613) (not b!1108615) (not b_next!23289) (not mapNonEmpty!43141) (not b!1108614) (not b!1108608) (not start!97318))
(check-sat b_and!37413 (not b_next!23289))
