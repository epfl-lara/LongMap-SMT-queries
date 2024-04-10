; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98002 () Bool)

(assert start!98002)

(declare-fun b_free!23703 () Bool)

(declare-fun b_next!23703 () Bool)

(assert (=> start!98002 (= b_free!23703 (not b_next!23703))))

(declare-fun tp!83812 () Bool)

(declare-fun b_and!38189 () Bool)

(assert (=> start!98002 (= tp!83812 b_and!38189)))

(declare-fun b!1124140 () Bool)

(declare-fun e!639943 () Bool)

(declare-fun e!639947 () Bool)

(assert (=> b!1124140 (= e!639943 e!639947)))

(declare-fun res!751083 () Bool)

(assert (=> b!1124140 (=> res!751083 e!639947)))

(declare-datatypes ((V!42771 0))(
  ( (V!42772 (val!14173 Int)) )
))
(declare-datatypes ((tuple2!17802 0))(
  ( (tuple2!17803 (_1!8912 (_ BitVec 64)) (_2!8912 V!42771)) )
))
(declare-datatypes ((List!24581 0))(
  ( (Nil!24578) (Cons!24577 (h!25786 tuple2!17802) (t!35276 List!24581)) )
))
(declare-datatypes ((ListLongMap!15771 0))(
  ( (ListLongMap!15772 (toList!7901 List!24581)) )
))
(declare-fun lt!499351 () ListLongMap!15771)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6440 (ListLongMap!15771 (_ BitVec 64)) Bool)

(assert (=> b!1124140 (= res!751083 (not (contains!6440 lt!499351 k0!934)))))

(declare-fun zeroValue!944 () V!42771)

(declare-datatypes ((array!73333 0))(
  ( (array!73334 (arr!35319 (Array (_ BitVec 32) (_ BitVec 64))) (size!35855 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73333)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13407 0))(
  ( (ValueCellFull!13407 (v!16806 V!42771)) (EmptyCell!13407) )
))
(declare-datatypes ((array!73335 0))(
  ( (array!73336 (arr!35320 (Array (_ BitVec 32) ValueCell!13407)) (size!35856 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73335)

(declare-fun minValue!944 () V!42771)

(declare-fun getCurrentListMapNoExtraKeys!4389 (array!73333 array!73335 (_ BitVec 32) (_ BitVec 32) V!42771 V!42771 (_ BitVec 32) Int) ListLongMap!15771)

(assert (=> b!1124140 (= lt!499351 (getCurrentListMapNoExtraKeys!4389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124141 () Bool)

(declare-fun e!639946 () Bool)

(declare-fun tp_is_empty!28233 () Bool)

(assert (=> b!1124141 (= e!639946 tp_is_empty!28233)))

(declare-fun b!1124142 () Bool)

(declare-fun res!751090 () Bool)

(declare-fun e!639951 () Bool)

(assert (=> b!1124142 (=> (not res!751090) (not e!639951))))

(assert (=> b!1124142 (= res!751090 (and (= (size!35856 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35855 _keys!1208) (size!35856 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124143 () Bool)

(declare-fun e!639948 () Bool)

(declare-fun e!639950 () Bool)

(assert (=> b!1124143 (= e!639948 e!639950)))

(declare-fun res!751078 () Bool)

(assert (=> b!1124143 (=> res!751078 e!639950)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124143 (= res!751078 (not (= from!1455 i!673)))))

(declare-fun lt!499347 () array!73333)

(declare-fun lt!499349 () ListLongMap!15771)

(declare-fun lt!499348 () array!73335)

(assert (=> b!1124143 (= lt!499349 (getCurrentListMapNoExtraKeys!4389 lt!499347 lt!499348 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2485 (Int (_ BitVec 64)) V!42771)

(assert (=> b!1124143 (= lt!499348 (array!73336 (store (arr!35320 _values!996) i!673 (ValueCellFull!13407 (dynLambda!2485 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35856 _values!996)))))

(declare-fun lt!499352 () ListLongMap!15771)

(assert (=> b!1124143 (= lt!499352 (getCurrentListMapNoExtraKeys!4389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124144 () Bool)

(declare-fun res!751077 () Bool)

(assert (=> b!1124144 (=> (not res!751077) (not e!639951))))

(declare-datatypes ((List!24582 0))(
  ( (Nil!24579) (Cons!24578 (h!25787 (_ BitVec 64)) (t!35277 List!24582)) )
))
(declare-fun arrayNoDuplicates!0 (array!73333 (_ BitVec 32) List!24582) Bool)

(assert (=> b!1124144 (= res!751077 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24579))))

(declare-fun b!1124145 () Bool)

(declare-fun res!751082 () Bool)

(assert (=> b!1124145 (=> (not res!751082) (not e!639951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73333 (_ BitVec 32)) Bool)

(assert (=> b!1124145 (= res!751082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124146 () Bool)

(declare-fun res!751086 () Bool)

(assert (=> b!1124146 (=> (not res!751086) (not e!639951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124146 (= res!751086 (validKeyInArray!0 k0!934))))

(declare-fun b!1124147 () Bool)

(assert (=> b!1124147 (= e!639947 true)))

(declare-fun +!3411 (ListLongMap!15771 tuple2!17802) ListLongMap!15771)

(assert (=> b!1124147 (contains!6440 (+!3411 lt!499351 (tuple2!17803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!36854 0))(
  ( (Unit!36855) )
))
(declare-fun lt!499345 () Unit!36854)

(declare-fun addStillContains!673 (ListLongMap!15771 (_ BitVec 64) V!42771 (_ BitVec 64)) Unit!36854)

(assert (=> b!1124147 (= lt!499345 (addStillContains!673 lt!499351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!47392 () ListLongMap!15771)

(declare-fun bm!47388 () Bool)

(assert (=> bm!47388 (= call!47392 (getCurrentListMapNoExtraKeys!4389 lt!499347 lt!499348 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751081 () Bool)

(assert (=> start!98002 (=> (not res!751081) (not e!639951))))

(assert (=> start!98002 (= res!751081 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35855 _keys!1208))))))

(assert (=> start!98002 e!639951))

(assert (=> start!98002 tp_is_empty!28233))

(declare-fun array_inv!27112 (array!73333) Bool)

(assert (=> start!98002 (array_inv!27112 _keys!1208)))

(assert (=> start!98002 true))

(assert (=> start!98002 tp!83812))

(declare-fun e!639942 () Bool)

(declare-fun array_inv!27113 (array!73335) Bool)

(assert (=> start!98002 (and (array_inv!27113 _values!996) e!639942)))

(declare-fun b!1124148 () Bool)

(declare-fun res!751089 () Bool)

(assert (=> b!1124148 (=> (not res!751089) (not e!639951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124148 (= res!751089 (validMask!0 mask!1564))))

(declare-fun b!1124149 () Bool)

(declare-fun res!751079 () Bool)

(assert (=> b!1124149 (=> res!751079 e!639947)))

(assert (=> b!1124149 (= res!751079 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124150 () Bool)

(declare-fun e!639944 () Bool)

(assert (=> b!1124150 (= e!639951 e!639944)))

(declare-fun res!751076 () Bool)

(assert (=> b!1124150 (=> (not res!751076) (not e!639944))))

(assert (=> b!1124150 (= res!751076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499347 mask!1564))))

(assert (=> b!1124150 (= lt!499347 (array!73334 (store (arr!35319 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35855 _keys!1208)))))

(declare-fun mapNonEmpty!44167 () Bool)

(declare-fun mapRes!44167 () Bool)

(declare-fun tp!83813 () Bool)

(assert (=> mapNonEmpty!44167 (= mapRes!44167 (and tp!83813 e!639946))))

(declare-fun mapKey!44167 () (_ BitVec 32))

(declare-fun mapValue!44167 () ValueCell!13407)

(declare-fun mapRest!44167 () (Array (_ BitVec 32) ValueCell!13407))

(assert (=> mapNonEmpty!44167 (= (arr!35320 _values!996) (store mapRest!44167 mapKey!44167 mapValue!44167))))

(declare-fun e!639949 () Bool)

(declare-fun b!1124151 () Bool)

(declare-fun call!47391 () ListLongMap!15771)

(declare-fun -!1106 (ListLongMap!15771 (_ BitVec 64)) ListLongMap!15771)

(assert (=> b!1124151 (= e!639949 (= call!47392 (-!1106 call!47391 k0!934)))))

(declare-fun mapIsEmpty!44167 () Bool)

(assert (=> mapIsEmpty!44167 mapRes!44167))

(declare-fun b!1124152 () Bool)

(declare-fun res!751080 () Bool)

(assert (=> b!1124152 (=> (not res!751080) (not e!639951))))

(assert (=> b!1124152 (= res!751080 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35855 _keys!1208))))))

(declare-fun b!1124153 () Bool)

(declare-fun e!639941 () Bool)

(assert (=> b!1124153 (= e!639941 tp_is_empty!28233)))

(declare-fun bm!47389 () Bool)

(assert (=> bm!47389 (= call!47391 (getCurrentListMapNoExtraKeys!4389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124154 () Bool)

(declare-fun res!751084 () Bool)

(assert (=> b!1124154 (=> (not res!751084) (not e!639951))))

(assert (=> b!1124154 (= res!751084 (= (select (arr!35319 _keys!1208) i!673) k0!934))))

(declare-fun b!1124155 () Bool)

(assert (=> b!1124155 (= e!639942 (and e!639941 mapRes!44167))))

(declare-fun condMapEmpty!44167 () Bool)

(declare-fun mapDefault!44167 () ValueCell!13407)

(assert (=> b!1124155 (= condMapEmpty!44167 (= (arr!35320 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13407)) mapDefault!44167)))))

(declare-fun b!1124156 () Bool)

(assert (=> b!1124156 (= e!639944 (not e!639948))))

(declare-fun res!751085 () Bool)

(assert (=> b!1124156 (=> res!751085 e!639948)))

(assert (=> b!1124156 (= res!751085 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124156 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499350 () Unit!36854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73333 (_ BitVec 64) (_ BitVec 32)) Unit!36854)

(assert (=> b!1124156 (= lt!499350 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124157 () Bool)

(assert (=> b!1124157 (= e!639949 (= call!47392 call!47391))))

(declare-fun b!1124158 () Bool)

(declare-fun res!751087 () Bool)

(assert (=> b!1124158 (=> (not res!751087) (not e!639944))))

(assert (=> b!1124158 (= res!751087 (arrayNoDuplicates!0 lt!499347 #b00000000000000000000000000000000 Nil!24579))))

(declare-fun b!1124159 () Bool)

(assert (=> b!1124159 (= e!639950 e!639943)))

(declare-fun res!751088 () Bool)

(assert (=> b!1124159 (=> res!751088 e!639943)))

(assert (=> b!1124159 (= res!751088 (not (= (select (arr!35319 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124159 e!639949))

(declare-fun c!109545 () Bool)

(assert (=> b!1124159 (= c!109545 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499346 () Unit!36854)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!352 (array!73333 array!73335 (_ BitVec 32) (_ BitVec 32) V!42771 V!42771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36854)

(assert (=> b!1124159 (= lt!499346 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98002 res!751081) b!1124148))

(assert (= (and b!1124148 res!751089) b!1124142))

(assert (= (and b!1124142 res!751090) b!1124145))

(assert (= (and b!1124145 res!751082) b!1124144))

(assert (= (and b!1124144 res!751077) b!1124152))

(assert (= (and b!1124152 res!751080) b!1124146))

(assert (= (and b!1124146 res!751086) b!1124154))

(assert (= (and b!1124154 res!751084) b!1124150))

(assert (= (and b!1124150 res!751076) b!1124158))

(assert (= (and b!1124158 res!751087) b!1124156))

(assert (= (and b!1124156 (not res!751085)) b!1124143))

(assert (= (and b!1124143 (not res!751078)) b!1124159))

(assert (= (and b!1124159 c!109545) b!1124151))

(assert (= (and b!1124159 (not c!109545)) b!1124157))

(assert (= (or b!1124151 b!1124157) bm!47388))

(assert (= (or b!1124151 b!1124157) bm!47389))

(assert (= (and b!1124159 (not res!751088)) b!1124140))

(assert (= (and b!1124140 (not res!751083)) b!1124149))

(assert (= (and b!1124149 (not res!751079)) b!1124147))

(assert (= (and b!1124155 condMapEmpty!44167) mapIsEmpty!44167))

(assert (= (and b!1124155 (not condMapEmpty!44167)) mapNonEmpty!44167))

(get-info :version)

(assert (= (and mapNonEmpty!44167 ((_ is ValueCellFull!13407) mapValue!44167)) b!1124141))

(assert (= (and b!1124155 ((_ is ValueCellFull!13407) mapDefault!44167)) b!1124153))

(assert (= start!98002 b!1124155))

(declare-fun b_lambda!18673 () Bool)

(assert (=> (not b_lambda!18673) (not b!1124143)))

(declare-fun t!35275 () Bool)

(declare-fun tb!8515 () Bool)

(assert (=> (and start!98002 (= defaultEntry!1004 defaultEntry!1004) t!35275) tb!8515))

(declare-fun result!17591 () Bool)

(assert (=> tb!8515 (= result!17591 tp_is_empty!28233)))

(assert (=> b!1124143 t!35275))

(declare-fun b_and!38191 () Bool)

(assert (= b_and!38189 (and (=> t!35275 result!17591) b_and!38191)))

(declare-fun m!1038485 () Bool)

(assert (=> b!1124150 m!1038485))

(declare-fun m!1038487 () Bool)

(assert (=> b!1124150 m!1038487))

(declare-fun m!1038489 () Bool)

(assert (=> b!1124148 m!1038489))

(declare-fun m!1038491 () Bool)

(assert (=> b!1124159 m!1038491))

(declare-fun m!1038493 () Bool)

(assert (=> b!1124159 m!1038493))

(declare-fun m!1038495 () Bool)

(assert (=> b!1124145 m!1038495))

(declare-fun m!1038497 () Bool)

(assert (=> b!1124151 m!1038497))

(declare-fun m!1038499 () Bool)

(assert (=> start!98002 m!1038499))

(declare-fun m!1038501 () Bool)

(assert (=> start!98002 m!1038501))

(declare-fun m!1038503 () Bool)

(assert (=> b!1124143 m!1038503))

(declare-fun m!1038505 () Bool)

(assert (=> b!1124143 m!1038505))

(declare-fun m!1038507 () Bool)

(assert (=> b!1124143 m!1038507))

(declare-fun m!1038509 () Bool)

(assert (=> b!1124143 m!1038509))

(declare-fun m!1038511 () Bool)

(assert (=> b!1124154 m!1038511))

(declare-fun m!1038513 () Bool)

(assert (=> b!1124156 m!1038513))

(declare-fun m!1038515 () Bool)

(assert (=> b!1124156 m!1038515))

(declare-fun m!1038517 () Bool)

(assert (=> bm!47389 m!1038517))

(declare-fun m!1038519 () Bool)

(assert (=> b!1124140 m!1038519))

(assert (=> b!1124140 m!1038517))

(declare-fun m!1038521 () Bool)

(assert (=> b!1124158 m!1038521))

(declare-fun m!1038523 () Bool)

(assert (=> b!1124146 m!1038523))

(declare-fun m!1038525 () Bool)

(assert (=> mapNonEmpty!44167 m!1038525))

(declare-fun m!1038527 () Bool)

(assert (=> b!1124147 m!1038527))

(assert (=> b!1124147 m!1038527))

(declare-fun m!1038529 () Bool)

(assert (=> b!1124147 m!1038529))

(declare-fun m!1038531 () Bool)

(assert (=> b!1124147 m!1038531))

(declare-fun m!1038533 () Bool)

(assert (=> bm!47388 m!1038533))

(declare-fun m!1038535 () Bool)

(assert (=> b!1124144 m!1038535))

(check-sat (not b!1124143) (not mapNonEmpty!44167) (not b_next!23703) (not b!1124150) (not b!1124140) (not b!1124158) (not bm!47389) (not b!1124147) (not b!1124148) (not b!1124144) tp_is_empty!28233 (not b!1124156) (not b!1124146) (not b!1124145) (not start!98002) (not b!1124151) (not bm!47388) b_and!38191 (not b_lambda!18673) (not b!1124159))
(check-sat b_and!38191 (not b_next!23703))
