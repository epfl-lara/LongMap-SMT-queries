; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97388 () Bool)

(assert start!97388)

(declare-fun b_free!23365 () Bool)

(declare-fun b_next!23365 () Bool)

(assert (=> start!97388 (= b_free!23365 (not b_next!23365))))

(declare-fun tp!82393 () Bool)

(declare-fun b_and!37545 () Bool)

(assert (=> start!97388 (= tp!82393 b_and!37545)))

(declare-fun b!1110402 () Bool)

(declare-fun e!633257 () Bool)

(declare-datatypes ((V!41961 0))(
  ( (V!41962 (val!13869 Int)) )
))
(declare-datatypes ((tuple2!17602 0))(
  ( (tuple2!17603 (_1!8812 (_ BitVec 64)) (_2!8812 V!41961)) )
))
(declare-datatypes ((List!24257 0))(
  ( (Nil!24254) (Cons!24253 (h!25462 tuple2!17602) (t!34659 List!24257)) )
))
(declare-datatypes ((ListLongMap!15571 0))(
  ( (ListLongMap!15572 (toList!7801 List!24257)) )
))
(declare-fun call!46769 () ListLongMap!15571)

(declare-fun call!46768 () ListLongMap!15571)

(assert (=> b!1110402 (= e!633257 (= call!46769 call!46768))))

(declare-fun b!1110403 () Bool)

(declare-fun res!741027 () Bool)

(declare-fun e!633256 () Bool)

(assert (=> b!1110403 (=> (not res!741027) (not e!633256))))

(declare-datatypes ((array!72060 0))(
  ( (array!72061 (arr!34683 (Array (_ BitVec 32) (_ BitVec 64))) (size!35221 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72060)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13103 0))(
  ( (ValueCellFull!13103 (v!16501 V!41961)) (EmptyCell!13103) )
))
(declare-datatypes ((array!72062 0))(
  ( (array!72063 (arr!34684 (Array (_ BitVec 32) ValueCell!13103)) (size!35222 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72062)

(assert (=> b!1110403 (= res!741027 (and (= (size!35222 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35221 _keys!1208) (size!35222 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110404 () Bool)

(declare-fun res!741021 () Bool)

(assert (=> b!1110404 (=> (not res!741021) (not e!633256))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110404 (= res!741021 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35221 _keys!1208))))))

(declare-fun mapIsEmpty!43255 () Bool)

(declare-fun mapRes!43255 () Bool)

(assert (=> mapIsEmpty!43255 mapRes!43255))

(declare-fun b!1110405 () Bool)

(declare-fun res!741020 () Bool)

(assert (=> b!1110405 (=> (not res!741020) (not e!633256))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1110405 (= res!741020 (= (select (arr!34683 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43255 () Bool)

(declare-fun tp!82394 () Bool)

(declare-fun e!633253 () Bool)

(assert (=> mapNonEmpty!43255 (= mapRes!43255 (and tp!82394 e!633253))))

(declare-fun mapRest!43255 () (Array (_ BitVec 32) ValueCell!13103))

(declare-fun mapKey!43255 () (_ BitVec 32))

(declare-fun mapValue!43255 () ValueCell!13103)

(assert (=> mapNonEmpty!43255 (= (arr!34684 _values!996) (store mapRest!43255 mapKey!43255 mapValue!43255))))

(declare-fun b!1110406 () Bool)

(declare-fun res!741019 () Bool)

(assert (=> b!1110406 (=> (not res!741019) (not e!633256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110406 (= res!741019 (validKeyInArray!0 k0!934))))

(declare-fun b!1110408 () Bool)

(declare-fun e!633254 () Bool)

(declare-fun e!633251 () Bool)

(assert (=> b!1110408 (= e!633254 (not e!633251))))

(declare-fun res!741026 () Bool)

(assert (=> b!1110408 (=> res!741026 e!633251)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1110408 (= res!741026 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35221 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110408 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36253 0))(
  ( (Unit!36254) )
))
(declare-fun lt!495980 () Unit!36253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72060 (_ BitVec 64) (_ BitVec 32)) Unit!36253)

(assert (=> b!1110408 (= lt!495980 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!41961)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46765 () Bool)

(declare-fun minValue!944 () V!41961)

(declare-fun lt!495979 () array!72060)

(declare-fun getCurrentListMapNoExtraKeys!4316 (array!72060 array!72062 (_ BitVec 32) (_ BitVec 32) V!41961 V!41961 (_ BitVec 32) Int) ListLongMap!15571)

(declare-fun dynLambda!2381 (Int (_ BitVec 64)) V!41961)

(assert (=> bm!46765 (= call!46769 (getCurrentListMapNoExtraKeys!4316 lt!495979 (array!72063 (store (arr!34684 _values!996) i!673 (ValueCellFull!13103 (dynLambda!2381 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35222 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110409 () Bool)

(assert (=> b!1110409 (= e!633256 e!633254)))

(declare-fun res!741022 () Bool)

(assert (=> b!1110409 (=> (not res!741022) (not e!633254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72060 (_ BitVec 32)) Bool)

(assert (=> b!1110409 (= res!741022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495979 mask!1564))))

(assert (=> b!1110409 (= lt!495979 (array!72061 (store (arr!34683 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35221 _keys!1208)))))

(declare-fun b!1110410 () Bool)

(declare-fun res!741018 () Bool)

(assert (=> b!1110410 (=> (not res!741018) (not e!633256))))

(assert (=> b!1110410 (= res!741018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110411 () Bool)

(declare-fun -!1016 (ListLongMap!15571 (_ BitVec 64)) ListLongMap!15571)

(assert (=> b!1110411 (= e!633257 (= call!46769 (-!1016 call!46768 k0!934)))))

(declare-fun bm!46766 () Bool)

(assert (=> bm!46766 (= call!46768 (getCurrentListMapNoExtraKeys!4316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110412 () Bool)

(declare-fun tp_is_empty!27625 () Bool)

(assert (=> b!1110412 (= e!633253 tp_is_empty!27625)))

(declare-fun b!1110413 () Bool)

(declare-fun e!633255 () Bool)

(declare-fun e!633252 () Bool)

(assert (=> b!1110413 (= e!633255 (and e!633252 mapRes!43255))))

(declare-fun condMapEmpty!43255 () Bool)

(declare-fun mapDefault!43255 () ValueCell!13103)

(assert (=> b!1110413 (= condMapEmpty!43255 (= (arr!34684 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13103)) mapDefault!43255)))))

(declare-fun b!1110414 () Bool)

(assert (=> b!1110414 (= e!633251 true)))

(assert (=> b!1110414 e!633257))

(declare-fun c!109218 () Bool)

(assert (=> b!1110414 (= c!109218 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495981 () Unit!36253)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!288 (array!72060 array!72062 (_ BitVec 32) (_ BitVec 32) V!41961 V!41961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36253)

(assert (=> b!1110414 (= lt!495981 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110415 () Bool)

(declare-fun res!741028 () Bool)

(assert (=> b!1110415 (=> (not res!741028) (not e!633254))))

(declare-datatypes ((List!24258 0))(
  ( (Nil!24255) (Cons!24254 (h!25463 (_ BitVec 64)) (t!34660 List!24258)) )
))
(declare-fun arrayNoDuplicates!0 (array!72060 (_ BitVec 32) List!24258) Bool)

(assert (=> b!1110415 (= res!741028 (arrayNoDuplicates!0 lt!495979 #b00000000000000000000000000000000 Nil!24255))))

(declare-fun b!1110416 () Bool)

(declare-fun res!741023 () Bool)

(assert (=> b!1110416 (=> (not res!741023) (not e!633256))))

(assert (=> b!1110416 (= res!741023 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24255))))

(declare-fun b!1110417 () Bool)

(declare-fun res!741025 () Bool)

(assert (=> b!1110417 (=> (not res!741025) (not e!633256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110417 (= res!741025 (validMask!0 mask!1564))))

(declare-fun res!741024 () Bool)

(assert (=> start!97388 (=> (not res!741024) (not e!633256))))

(assert (=> start!97388 (= res!741024 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35221 _keys!1208))))))

(assert (=> start!97388 e!633256))

(assert (=> start!97388 tp_is_empty!27625))

(declare-fun array_inv!26736 (array!72060) Bool)

(assert (=> start!97388 (array_inv!26736 _keys!1208)))

(assert (=> start!97388 true))

(assert (=> start!97388 tp!82393))

(declare-fun array_inv!26737 (array!72062) Bool)

(assert (=> start!97388 (and (array_inv!26737 _values!996) e!633255)))

(declare-fun b!1110407 () Bool)

(assert (=> b!1110407 (= e!633252 tp_is_empty!27625)))

(assert (= (and start!97388 res!741024) b!1110417))

(assert (= (and b!1110417 res!741025) b!1110403))

(assert (= (and b!1110403 res!741027) b!1110410))

(assert (= (and b!1110410 res!741018) b!1110416))

(assert (= (and b!1110416 res!741023) b!1110404))

(assert (= (and b!1110404 res!741021) b!1110406))

(assert (= (and b!1110406 res!741019) b!1110405))

(assert (= (and b!1110405 res!741020) b!1110409))

(assert (= (and b!1110409 res!741022) b!1110415))

(assert (= (and b!1110415 res!741028) b!1110408))

(assert (= (and b!1110408 (not res!741026)) b!1110414))

(assert (= (and b!1110414 c!109218) b!1110411))

(assert (= (and b!1110414 (not c!109218)) b!1110402))

(assert (= (or b!1110411 b!1110402) bm!46765))

(assert (= (or b!1110411 b!1110402) bm!46766))

(assert (= (and b!1110413 condMapEmpty!43255) mapIsEmpty!43255))

(assert (= (and b!1110413 (not condMapEmpty!43255)) mapNonEmpty!43255))

(get-info :version)

(assert (= (and mapNonEmpty!43255 ((_ is ValueCellFull!13103) mapValue!43255)) b!1110412))

(assert (= (and b!1110413 ((_ is ValueCellFull!13103) mapDefault!43255)) b!1110407))

(assert (= start!97388 b!1110413))

(declare-fun b_lambda!18371 () Bool)

(assert (=> (not b_lambda!18371) (not bm!46765)))

(declare-fun t!34658 () Bool)

(declare-fun tb!8223 () Bool)

(assert (=> (and start!97388 (= defaultEntry!1004 defaultEntry!1004) t!34658) tb!8223))

(declare-fun result!17015 () Bool)

(assert (=> tb!8223 (= result!17015 tp_is_empty!27625)))

(assert (=> bm!46765 t!34658))

(declare-fun b_and!37547 () Bool)

(assert (= b_and!37545 (and (=> t!34658 result!17015) b_and!37547)))

(declare-fun m!1027911 () Bool)

(assert (=> bm!46766 m!1027911))

(declare-fun m!1027913 () Bool)

(assert (=> b!1110405 m!1027913))

(declare-fun m!1027915 () Bool)

(assert (=> start!97388 m!1027915))

(declare-fun m!1027917 () Bool)

(assert (=> start!97388 m!1027917))

(declare-fun m!1027919 () Bool)

(assert (=> b!1110408 m!1027919))

(declare-fun m!1027921 () Bool)

(assert (=> b!1110408 m!1027921))

(declare-fun m!1027923 () Bool)

(assert (=> b!1110417 m!1027923))

(declare-fun m!1027925 () Bool)

(assert (=> b!1110416 m!1027925))

(declare-fun m!1027927 () Bool)

(assert (=> b!1110406 m!1027927))

(declare-fun m!1027929 () Bool)

(assert (=> bm!46765 m!1027929))

(declare-fun m!1027931 () Bool)

(assert (=> bm!46765 m!1027931))

(declare-fun m!1027933 () Bool)

(assert (=> bm!46765 m!1027933))

(declare-fun m!1027935 () Bool)

(assert (=> b!1110411 m!1027935))

(declare-fun m!1027937 () Bool)

(assert (=> b!1110410 m!1027937))

(declare-fun m!1027939 () Bool)

(assert (=> mapNonEmpty!43255 m!1027939))

(declare-fun m!1027941 () Bool)

(assert (=> b!1110409 m!1027941))

(declare-fun m!1027943 () Bool)

(assert (=> b!1110409 m!1027943))

(declare-fun m!1027945 () Bool)

(assert (=> b!1110415 m!1027945))

(declare-fun m!1027947 () Bool)

(assert (=> b!1110414 m!1027947))

(check-sat tp_is_empty!27625 b_and!37547 (not b!1110406) (not b_lambda!18371) (not b!1110410) (not b!1110416) (not b!1110417) (not bm!46765) (not b!1110415) (not b!1110411) (not b!1110408) (not mapNonEmpty!43255) (not start!97388) (not bm!46766) (not b!1110409) (not b_next!23365) (not b!1110414))
(check-sat b_and!37547 (not b_next!23365))
