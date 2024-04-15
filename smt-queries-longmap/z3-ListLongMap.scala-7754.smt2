; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97262 () Bool)

(assert start!97262)

(declare-fun b_free!23239 () Bool)

(declare-fun b_next!23239 () Bool)

(assert (=> start!97262 (= b_free!23239 (not b_next!23239))))

(declare-fun tp!82016 () Bool)

(declare-fun b_and!37283 () Bool)

(assert (=> start!97262 (= tp!82016 b_and!37283)))

(declare-datatypes ((V!41793 0))(
  ( (V!41794 (val!13806 Int)) )
))
(declare-fun zeroValue!944 () V!41793)

(declare-datatypes ((array!71818 0))(
  ( (array!71819 (arr!34562 (Array (_ BitVec 32) (_ BitVec 64))) (size!35100 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71818)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17488 0))(
  ( (tuple2!17489 (_1!8755 (_ BitVec 64)) (_2!8755 V!41793)) )
))
(declare-datatypes ((List!24149 0))(
  ( (Nil!24146) (Cons!24145 (h!25354 tuple2!17488) (t!34425 List!24149)) )
))
(declare-datatypes ((ListLongMap!15457 0))(
  ( (ListLongMap!15458 (toList!7744 List!24149)) )
))
(declare-fun call!46390 () ListLongMap!15457)

(declare-fun minValue!944 () V!41793)

(declare-datatypes ((ValueCell!13040 0))(
  ( (ValueCellFull!13040 (v!16438 V!41793)) (EmptyCell!13040) )
))
(declare-datatypes ((array!71820 0))(
  ( (array!71821 (arr!34563 (Array (_ BitVec 32) ValueCell!13040)) (size!35101 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71820)

(declare-fun bm!46387 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4263 (array!71818 array!71820 (_ BitVec 32) (_ BitVec 32) V!41793 V!41793 (_ BitVec 32) Int) ListLongMap!15457)

(assert (=> bm!46387 (= call!46390 (getCurrentListMapNoExtraKeys!4263 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!46391 () ListLongMap!15457)

(declare-fun b!1107193 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!631711 () Bool)

(declare-fun -!971 (ListLongMap!15457 (_ BitVec 64)) ListLongMap!15457)

(assert (=> b!1107193 (= e!631711 (= call!46391 (-!971 call!46390 k0!934)))))

(declare-fun b!1107194 () Bool)

(declare-fun e!631710 () Bool)

(declare-fun e!631716 () Bool)

(assert (=> b!1107194 (= e!631710 (not e!631716))))

(declare-fun res!738948 () Bool)

(assert (=> b!1107194 (=> res!738948 e!631716)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107194 (= res!738948 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35100 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107194 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36155 0))(
  ( (Unit!36156) )
))
(declare-fun lt!495413 () Unit!36155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71818 (_ BitVec 64) (_ BitVec 32)) Unit!36155)

(assert (=> b!1107194 (= lt!495413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107195 () Bool)

(declare-fun res!738947 () Bool)

(declare-fun e!631714 () Bool)

(assert (=> b!1107195 (=> (not res!738947) (not e!631714))))

(assert (=> b!1107195 (= res!738947 (and (= (size!35101 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35100 _keys!1208) (size!35101 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43066 () Bool)

(declare-fun mapRes!43066 () Bool)

(assert (=> mapIsEmpty!43066 mapRes!43066))

(declare-fun b!1107196 () Bool)

(declare-fun res!738949 () Bool)

(assert (=> b!1107196 (=> (not res!738949) (not e!631710))))

(declare-fun lt!495412 () array!71818)

(declare-datatypes ((List!24150 0))(
  ( (Nil!24147) (Cons!24146 (h!25355 (_ BitVec 64)) (t!34426 List!24150)) )
))
(declare-fun arrayNoDuplicates!0 (array!71818 (_ BitVec 32) List!24150) Bool)

(assert (=> b!1107196 (= res!738949 (arrayNoDuplicates!0 lt!495412 #b00000000000000000000000000000000 Nil!24147))))

(declare-fun b!1107197 () Bool)

(assert (=> b!1107197 (= e!631716 true)))

(assert (=> b!1107197 e!631711))

(declare-fun c!108999 () Bool)

(assert (=> b!1107197 (= c!108999 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495414 () Unit!36155)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!244 (array!71818 array!71820 (_ BitVec 32) (_ BitVec 32) V!41793 V!41793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36155)

(assert (=> b!1107197 (= lt!495414 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!244 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107198 () Bool)

(declare-fun res!738944 () Bool)

(assert (=> b!1107198 (=> (not res!738944) (not e!631714))))

(assert (=> b!1107198 (= res!738944 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24147))))

(declare-fun b!1107199 () Bool)

(declare-fun res!738942 () Bool)

(assert (=> b!1107199 (=> (not res!738942) (not e!631714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107199 (= res!738942 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43066 () Bool)

(declare-fun tp!82015 () Bool)

(declare-fun e!631713 () Bool)

(assert (=> mapNonEmpty!43066 (= mapRes!43066 (and tp!82015 e!631713))))

(declare-fun mapRest!43066 () (Array (_ BitVec 32) ValueCell!13040))

(declare-fun mapValue!43066 () ValueCell!13040)

(declare-fun mapKey!43066 () (_ BitVec 32))

(assert (=> mapNonEmpty!43066 (= (arr!34563 _values!996) (store mapRest!43066 mapKey!43066 mapValue!43066))))

(declare-fun b!1107200 () Bool)

(assert (=> b!1107200 (= e!631711 (= call!46391 call!46390))))

(declare-fun b!1107201 () Bool)

(declare-fun res!738945 () Bool)

(assert (=> b!1107201 (=> (not res!738945) (not e!631714))))

(assert (=> b!1107201 (= res!738945 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35100 _keys!1208))))))

(declare-fun b!1107202 () Bool)

(declare-fun e!631712 () Bool)

(declare-fun e!631709 () Bool)

(assert (=> b!1107202 (= e!631712 (and e!631709 mapRes!43066))))

(declare-fun condMapEmpty!43066 () Bool)

(declare-fun mapDefault!43066 () ValueCell!13040)

(assert (=> b!1107202 (= condMapEmpty!43066 (= (arr!34563 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13040)) mapDefault!43066)))))

(declare-fun res!738946 () Bool)

(assert (=> start!97262 (=> (not res!738946) (not e!631714))))

(assert (=> start!97262 (= res!738946 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35100 _keys!1208))))))

(assert (=> start!97262 e!631714))

(declare-fun tp_is_empty!27499 () Bool)

(assert (=> start!97262 tp_is_empty!27499))

(declare-fun array_inv!26650 (array!71818) Bool)

(assert (=> start!97262 (array_inv!26650 _keys!1208)))

(assert (=> start!97262 true))

(assert (=> start!97262 tp!82016))

(declare-fun array_inv!26651 (array!71820) Bool)

(assert (=> start!97262 (and (array_inv!26651 _values!996) e!631712)))

(declare-fun b!1107192 () Bool)

(assert (=> b!1107192 (= e!631714 e!631710)))

(declare-fun res!738939 () Bool)

(assert (=> b!1107192 (=> (not res!738939) (not e!631710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71818 (_ BitVec 32)) Bool)

(assert (=> b!1107192 (= res!738939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495412 mask!1564))))

(assert (=> b!1107192 (= lt!495412 (array!71819 (store (arr!34562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35100 _keys!1208)))))

(declare-fun b!1107203 () Bool)

(declare-fun res!738943 () Bool)

(assert (=> b!1107203 (=> (not res!738943) (not e!631714))))

(assert (=> b!1107203 (= res!738943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107204 () Bool)

(assert (=> b!1107204 (= e!631713 tp_is_empty!27499)))

(declare-fun b!1107205 () Bool)

(declare-fun res!738940 () Bool)

(assert (=> b!1107205 (=> (not res!738940) (not e!631714))))

(assert (=> b!1107205 (= res!738940 (= (select (arr!34562 _keys!1208) i!673) k0!934))))

(declare-fun b!1107206 () Bool)

(declare-fun res!738941 () Bool)

(assert (=> b!1107206 (=> (not res!738941) (not e!631714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107206 (= res!738941 (validKeyInArray!0 k0!934))))

(declare-fun bm!46388 () Bool)

(declare-fun dynLambda!2332 (Int (_ BitVec 64)) V!41793)

(assert (=> bm!46388 (= call!46391 (getCurrentListMapNoExtraKeys!4263 lt!495412 (array!71821 (store (arr!34563 _values!996) i!673 (ValueCellFull!13040 (dynLambda!2332 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35101 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107207 () Bool)

(assert (=> b!1107207 (= e!631709 tp_is_empty!27499)))

(assert (= (and start!97262 res!738946) b!1107199))

(assert (= (and b!1107199 res!738942) b!1107195))

(assert (= (and b!1107195 res!738947) b!1107203))

(assert (= (and b!1107203 res!738943) b!1107198))

(assert (= (and b!1107198 res!738944) b!1107201))

(assert (= (and b!1107201 res!738945) b!1107206))

(assert (= (and b!1107206 res!738941) b!1107205))

(assert (= (and b!1107205 res!738940) b!1107192))

(assert (= (and b!1107192 res!738939) b!1107196))

(assert (= (and b!1107196 res!738949) b!1107194))

(assert (= (and b!1107194 (not res!738948)) b!1107197))

(assert (= (and b!1107197 c!108999) b!1107193))

(assert (= (and b!1107197 (not c!108999)) b!1107200))

(assert (= (or b!1107193 b!1107200) bm!46388))

(assert (= (or b!1107193 b!1107200) bm!46387))

(assert (= (and b!1107202 condMapEmpty!43066) mapIsEmpty!43066))

(assert (= (and b!1107202 (not condMapEmpty!43066)) mapNonEmpty!43066))

(get-info :version)

(assert (= (and mapNonEmpty!43066 ((_ is ValueCellFull!13040) mapValue!43066)) b!1107204))

(assert (= (and b!1107202 ((_ is ValueCellFull!13040) mapDefault!43066)) b!1107207))

(assert (= start!97262 b!1107202))

(declare-fun b_lambda!18235 () Bool)

(assert (=> (not b_lambda!18235) (not bm!46388)))

(declare-fun t!34424 () Bool)

(declare-fun tb!8097 () Bool)

(assert (=> (and start!97262 (= defaultEntry!1004 defaultEntry!1004) t!34424) tb!8097))

(declare-fun result!16763 () Bool)

(assert (=> tb!8097 (= result!16763 tp_is_empty!27499)))

(assert (=> bm!46388 t!34424))

(declare-fun b_and!37285 () Bool)

(assert (= b_and!37283 (and (=> t!34424 result!16763) b_and!37285)))

(declare-fun m!1025517 () Bool)

(assert (=> b!1107194 m!1025517))

(declare-fun m!1025519 () Bool)

(assert (=> b!1107194 m!1025519))

(declare-fun m!1025521 () Bool)

(assert (=> b!1107196 m!1025521))

(declare-fun m!1025523 () Bool)

(assert (=> b!1107205 m!1025523))

(declare-fun m!1025525 () Bool)

(assert (=> bm!46387 m!1025525))

(declare-fun m!1025527 () Bool)

(assert (=> mapNonEmpty!43066 m!1025527))

(declare-fun m!1025529 () Bool)

(assert (=> bm!46388 m!1025529))

(declare-fun m!1025531 () Bool)

(assert (=> bm!46388 m!1025531))

(declare-fun m!1025533 () Bool)

(assert (=> bm!46388 m!1025533))

(declare-fun m!1025535 () Bool)

(assert (=> b!1107203 m!1025535))

(declare-fun m!1025537 () Bool)

(assert (=> b!1107199 m!1025537))

(declare-fun m!1025539 () Bool)

(assert (=> b!1107206 m!1025539))

(declare-fun m!1025541 () Bool)

(assert (=> start!97262 m!1025541))

(declare-fun m!1025543 () Bool)

(assert (=> start!97262 m!1025543))

(declare-fun m!1025545 () Bool)

(assert (=> b!1107192 m!1025545))

(declare-fun m!1025547 () Bool)

(assert (=> b!1107192 m!1025547))

(declare-fun m!1025549 () Bool)

(assert (=> b!1107193 m!1025549))

(declare-fun m!1025551 () Bool)

(assert (=> b!1107198 m!1025551))

(declare-fun m!1025553 () Bool)

(assert (=> b!1107197 m!1025553))

(check-sat (not b!1107206) (not mapNonEmpty!43066) tp_is_empty!27499 (not b_next!23239) (not b!1107193) (not bm!46387) b_and!37285 (not b!1107197) (not b!1107196) (not b!1107194) (not bm!46388) (not b!1107203) (not b!1107198) (not start!97262) (not b!1107199) (not b!1107192) (not b_lambda!18235))
(check-sat b_and!37285 (not b_next!23239))
