; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99708 () Bool)

(assert start!99708)

(declare-fun b_free!25287 () Bool)

(declare-fun b_next!25287 () Bool)

(assert (=> start!99708 (= b_free!25287 (not b_next!25287))))

(declare-fun tp!88575 () Bool)

(declare-fun b_and!41441 () Bool)

(assert (=> start!99708 (= tp!88575 b_and!41441)))

(declare-fun b!1183183 () Bool)

(declare-datatypes ((Unit!39154 0))(
  ( (Unit!39155) )
))
(declare-fun e!672702 () Unit!39154)

(declare-fun Unit!39156 () Unit!39154)

(assert (=> b!1183183 (= e!672702 Unit!39156)))

(declare-datatypes ((array!76435 0))(
  ( (array!76436 (arr!36867 (Array (_ BitVec 32) (_ BitVec 64))) (size!37403 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76435)

(declare-fun lt!535942 () Unit!39154)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76435 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39154)

(assert (=> b!1183183 (= lt!535942 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183183 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535933 () Unit!39154)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76435 (_ BitVec 32) (_ BitVec 32)) Unit!39154)

(assert (=> b!1183183 (= lt!535933 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25924 0))(
  ( (Nil!25921) (Cons!25920 (h!27129 (_ BitVec 64)) (t!38203 List!25924)) )
))
(declare-fun arrayNoDuplicates!0 (array!76435 (_ BitVec 32) List!25924) Bool)

(assert (=> b!1183183 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25921)))

(declare-fun lt!535945 () Unit!39154)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76435 (_ BitVec 64) (_ BitVec 32) List!25924) Unit!39154)

(assert (=> b!1183183 (= lt!535945 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25921))))

(assert (=> b!1183183 false))

(declare-fun b!1183184 () Bool)

(declare-fun res!786372 () Bool)

(declare-fun e!672695 () Bool)

(assert (=> b!1183184 (=> (not res!786372) (not e!672695))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76435 (_ BitVec 32)) Bool)

(assert (=> b!1183184 (= res!786372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183185 () Bool)

(declare-fun e!672697 () Bool)

(assert (=> b!1183185 (= e!672695 e!672697)))

(declare-fun res!786370 () Bool)

(assert (=> b!1183185 (=> (not res!786370) (not e!672697))))

(declare-fun lt!535944 () array!76435)

(assert (=> b!1183185 (= res!786370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535944 mask!1564))))

(assert (=> b!1183185 (= lt!535944 (array!76436 (store (arr!36867 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37403 _keys!1208)))))

(declare-fun b!1183186 () Bool)

(declare-fun res!786360 () Bool)

(assert (=> b!1183186 (=> (not res!786360) (not e!672695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183186 (= res!786360 (validKeyInArray!0 k0!934))))

(declare-fun b!1183187 () Bool)

(declare-fun e!672704 () Bool)

(declare-fun e!672696 () Bool)

(assert (=> b!1183187 (= e!672704 e!672696)))

(declare-fun res!786373 () Bool)

(assert (=> b!1183187 (=> res!786373 e!672696)))

(assert (=> b!1183187 (= res!786373 (not (validKeyInArray!0 (select (arr!36867 _keys!1208) from!1455))))))

(declare-datatypes ((V!44883 0))(
  ( (V!44884 (val!14965 Int)) )
))
(declare-datatypes ((tuple2!19184 0))(
  ( (tuple2!19185 (_1!9603 (_ BitVec 64)) (_2!9603 V!44883)) )
))
(declare-datatypes ((List!25925 0))(
  ( (Nil!25922) (Cons!25921 (h!27130 tuple2!19184) (t!38204 List!25925)) )
))
(declare-datatypes ((ListLongMap!17153 0))(
  ( (ListLongMap!17154 (toList!8592 List!25925)) )
))
(declare-fun lt!535947 () ListLongMap!17153)

(declare-fun lt!535932 () ListLongMap!17153)

(assert (=> b!1183187 (= lt!535947 lt!535932)))

(declare-fun lt!535949 () ListLongMap!17153)

(declare-fun -!1627 (ListLongMap!17153 (_ BitVec 64)) ListLongMap!17153)

(assert (=> b!1183187 (= lt!535932 (-!1627 lt!535949 k0!934))))

(declare-fun zeroValue!944 () V!44883)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14199 0))(
  ( (ValueCellFull!14199 (v!17603 V!44883)) (EmptyCell!14199) )
))
(declare-datatypes ((array!76437 0))(
  ( (array!76438 (arr!36868 (Array (_ BitVec 32) ValueCell!14199)) (size!37404 (_ BitVec 32))) )
))
(declare-fun lt!535939 () array!76437)

(declare-fun minValue!944 () V!44883)

(declare-fun getCurrentListMapNoExtraKeys!5043 (array!76435 array!76437 (_ BitVec 32) (_ BitVec 32) V!44883 V!44883 (_ BitVec 32) Int) ListLongMap!17153)

(assert (=> b!1183187 (= lt!535947 (getCurrentListMapNoExtraKeys!5043 lt!535944 lt!535939 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76437)

(assert (=> b!1183187 (= lt!535949 (getCurrentListMapNoExtraKeys!5043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535935 () Unit!39154)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!849 (array!76435 array!76437 (_ BitVec 32) (_ BitVec 32) V!44883 V!44883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39154)

(assert (=> b!1183187 (= lt!535935 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!849 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183188 () Bool)

(declare-fun e!672706 () Bool)

(declare-fun tp_is_empty!29817 () Bool)

(assert (=> b!1183188 (= e!672706 tp_is_empty!29817)))

(declare-fun mapIsEmpty!46553 () Bool)

(declare-fun mapRes!46553 () Bool)

(assert (=> mapIsEmpty!46553 mapRes!46553))

(declare-fun b!1183189 () Bool)

(declare-fun res!786364 () Bool)

(assert (=> b!1183189 (=> (not res!786364) (not e!672695))))

(assert (=> b!1183189 (= res!786364 (and (= (size!37404 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37403 _keys!1208) (size!37404 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183190 () Bool)

(declare-fun e!672703 () Bool)

(declare-fun e!672701 () Bool)

(assert (=> b!1183190 (= e!672703 e!672701)))

(declare-fun res!786367 () Bool)

(assert (=> b!1183190 (=> res!786367 e!672701)))

(assert (=> b!1183190 (= res!786367 (not (= (select (arr!36867 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183191 () Bool)

(declare-fun e!672699 () Bool)

(assert (=> b!1183191 (= e!672699 tp_is_empty!29817)))

(declare-fun b!1183192 () Bool)

(declare-fun res!786363 () Bool)

(assert (=> b!1183192 (=> (not res!786363) (not e!672697))))

(assert (=> b!1183192 (= res!786363 (arrayNoDuplicates!0 lt!535944 #b00000000000000000000000000000000 Nil!25921))))

(declare-fun b!1183193 () Bool)

(declare-fun Unit!39157 () Unit!39154)

(assert (=> b!1183193 (= e!672702 Unit!39157)))

(declare-fun b!1183194 () Bool)

(assert (=> b!1183194 (= e!672696 true)))

(declare-fun lt!535948 () ListLongMap!17153)

(declare-fun lt!535941 () ListLongMap!17153)

(assert (=> b!1183194 (= (-!1627 lt!535948 k0!934) lt!535941)))

(declare-fun lt!535936 () Unit!39154)

(declare-fun lt!535946 () V!44883)

(declare-fun addRemoveCommutativeForDiffKeys!154 (ListLongMap!17153 (_ BitVec 64) V!44883 (_ BitVec 64)) Unit!39154)

(assert (=> b!1183194 (= lt!535936 (addRemoveCommutativeForDiffKeys!154 lt!535949 (select (arr!36867 _keys!1208) from!1455) lt!535946 k0!934))))

(declare-fun lt!535940 () ListLongMap!17153)

(assert (=> b!1183194 (and (= lt!535940 lt!535948) (= lt!535932 lt!535947))))

(declare-fun lt!535934 () tuple2!19184)

(declare-fun +!3891 (ListLongMap!17153 tuple2!19184) ListLongMap!17153)

(assert (=> b!1183194 (= lt!535948 (+!3891 lt!535949 lt!535934))))

(assert (=> b!1183194 (not (= (select (arr!36867 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535950 () Unit!39154)

(assert (=> b!1183194 (= lt!535950 e!672702)))

(declare-fun c!117054 () Bool)

(assert (=> b!1183194 (= c!117054 (= (select (arr!36867 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183194 e!672703))

(declare-fun res!786359 () Bool)

(assert (=> b!1183194 (=> (not res!786359) (not e!672703))))

(declare-fun lt!535943 () ListLongMap!17153)

(assert (=> b!1183194 (= res!786359 (= lt!535943 lt!535941))))

(assert (=> b!1183194 (= lt!535941 (+!3891 lt!535932 lt!535934))))

(assert (=> b!1183194 (= lt!535934 (tuple2!19185 (select (arr!36867 _keys!1208) from!1455) lt!535946))))

(declare-fun lt!535937 () V!44883)

(declare-fun get!18860 (ValueCell!14199 V!44883) V!44883)

(assert (=> b!1183194 (= lt!535946 (get!18860 (select (arr!36868 _values!996) from!1455) lt!535937))))

(declare-fun b!1183195 () Bool)

(declare-fun e!672705 () Bool)

(assert (=> b!1183195 (= e!672705 (and e!672699 mapRes!46553))))

(declare-fun condMapEmpty!46553 () Bool)

(declare-fun mapDefault!46553 () ValueCell!14199)

(assert (=> b!1183195 (= condMapEmpty!46553 (= (arr!36868 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14199)) mapDefault!46553)))))

(declare-fun b!1183196 () Bool)

(assert (=> b!1183196 (= e!672701 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183197 () Bool)

(declare-fun res!786371 () Bool)

(assert (=> b!1183197 (=> (not res!786371) (not e!672695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183197 (= res!786371 (validMask!0 mask!1564))))

(declare-fun b!1183198 () Bool)

(declare-fun res!786362 () Bool)

(assert (=> b!1183198 (=> (not res!786362) (not e!672695))))

(assert (=> b!1183198 (= res!786362 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25921))))

(declare-fun b!1183199 () Bool)

(declare-fun e!672700 () Bool)

(assert (=> b!1183199 (= e!672697 (not e!672700))))

(declare-fun res!786366 () Bool)

(assert (=> b!1183199 (=> res!786366 e!672700)))

(assert (=> b!1183199 (= res!786366 (bvsgt from!1455 i!673))))

(assert (=> b!1183199 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535938 () Unit!39154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76435 (_ BitVec 64) (_ BitVec 32)) Unit!39154)

(assert (=> b!1183199 (= lt!535938 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183200 () Bool)

(declare-fun res!786369 () Bool)

(assert (=> b!1183200 (=> (not res!786369) (not e!672695))))

(assert (=> b!1183200 (= res!786369 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37403 _keys!1208))))))

(declare-fun mapNonEmpty!46553 () Bool)

(declare-fun tp!88574 () Bool)

(assert (=> mapNonEmpty!46553 (= mapRes!46553 (and tp!88574 e!672706))))

(declare-fun mapRest!46553 () (Array (_ BitVec 32) ValueCell!14199))

(declare-fun mapKey!46553 () (_ BitVec 32))

(declare-fun mapValue!46553 () ValueCell!14199)

(assert (=> mapNonEmpty!46553 (= (arr!36868 _values!996) (store mapRest!46553 mapKey!46553 mapValue!46553))))

(declare-fun res!786361 () Bool)

(assert (=> start!99708 (=> (not res!786361) (not e!672695))))

(assert (=> start!99708 (= res!786361 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37403 _keys!1208))))))

(assert (=> start!99708 e!672695))

(assert (=> start!99708 tp_is_empty!29817))

(declare-fun array_inv!28144 (array!76435) Bool)

(assert (=> start!99708 (array_inv!28144 _keys!1208)))

(assert (=> start!99708 true))

(assert (=> start!99708 tp!88575))

(declare-fun array_inv!28145 (array!76437) Bool)

(assert (=> start!99708 (and (array_inv!28145 _values!996) e!672705)))

(declare-fun b!1183201 () Bool)

(assert (=> b!1183201 (= e!672700 e!672704)))

(declare-fun res!786368 () Bool)

(assert (=> b!1183201 (=> res!786368 e!672704)))

(assert (=> b!1183201 (= res!786368 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183201 (= lt!535943 (getCurrentListMapNoExtraKeys!5043 lt!535944 lt!535939 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183201 (= lt!535939 (array!76438 (store (arr!36868 _values!996) i!673 (ValueCellFull!14199 lt!535937)) (size!37404 _values!996)))))

(declare-fun dynLambda!2996 (Int (_ BitVec 64)) V!44883)

(assert (=> b!1183201 (= lt!535937 (dynLambda!2996 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183201 (= lt!535940 (getCurrentListMapNoExtraKeys!5043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183202 () Bool)

(declare-fun res!786365 () Bool)

(assert (=> b!1183202 (=> (not res!786365) (not e!672695))))

(assert (=> b!1183202 (= res!786365 (= (select (arr!36867 _keys!1208) i!673) k0!934))))

(assert (= (and start!99708 res!786361) b!1183197))

(assert (= (and b!1183197 res!786371) b!1183189))

(assert (= (and b!1183189 res!786364) b!1183184))

(assert (= (and b!1183184 res!786372) b!1183198))

(assert (= (and b!1183198 res!786362) b!1183200))

(assert (= (and b!1183200 res!786369) b!1183186))

(assert (= (and b!1183186 res!786360) b!1183202))

(assert (= (and b!1183202 res!786365) b!1183185))

(assert (= (and b!1183185 res!786370) b!1183192))

(assert (= (and b!1183192 res!786363) b!1183199))

(assert (= (and b!1183199 (not res!786366)) b!1183201))

(assert (= (and b!1183201 (not res!786368)) b!1183187))

(assert (= (and b!1183187 (not res!786373)) b!1183194))

(assert (= (and b!1183194 res!786359) b!1183190))

(assert (= (and b!1183190 (not res!786367)) b!1183196))

(assert (= (and b!1183194 c!117054) b!1183183))

(assert (= (and b!1183194 (not c!117054)) b!1183193))

(assert (= (and b!1183195 condMapEmpty!46553) mapIsEmpty!46553))

(assert (= (and b!1183195 (not condMapEmpty!46553)) mapNonEmpty!46553))

(get-info :version)

(assert (= (and mapNonEmpty!46553 ((_ is ValueCellFull!14199) mapValue!46553)) b!1183188))

(assert (= (and b!1183195 ((_ is ValueCellFull!14199) mapDefault!46553)) b!1183191))

(assert (= start!99708 b!1183195))

(declare-fun b_lambda!20431 () Bool)

(assert (=> (not b_lambda!20431) (not b!1183201)))

(declare-fun t!38202 () Bool)

(declare-fun tb!10099 () Bool)

(assert (=> (and start!99708 (= defaultEntry!1004 defaultEntry!1004) t!38202) tb!10099))

(declare-fun result!20765 () Bool)

(assert (=> tb!10099 (= result!20765 tp_is_empty!29817)))

(assert (=> b!1183201 t!38202))

(declare-fun b_and!41443 () Bool)

(assert (= b_and!41441 (and (=> t!38202 result!20765) b_and!41443)))

(declare-fun m!1091305 () Bool)

(assert (=> b!1183201 m!1091305))

(declare-fun m!1091307 () Bool)

(assert (=> b!1183201 m!1091307))

(declare-fun m!1091309 () Bool)

(assert (=> b!1183201 m!1091309))

(declare-fun m!1091311 () Bool)

(assert (=> b!1183201 m!1091311))

(declare-fun m!1091313 () Bool)

(assert (=> b!1183184 m!1091313))

(declare-fun m!1091315 () Bool)

(assert (=> b!1183199 m!1091315))

(declare-fun m!1091317 () Bool)

(assert (=> b!1183199 m!1091317))

(declare-fun m!1091319 () Bool)

(assert (=> b!1183194 m!1091319))

(declare-fun m!1091321 () Bool)

(assert (=> b!1183194 m!1091321))

(declare-fun m!1091323 () Bool)

(assert (=> b!1183194 m!1091323))

(declare-fun m!1091325 () Bool)

(assert (=> b!1183194 m!1091325))

(declare-fun m!1091327 () Bool)

(assert (=> b!1183194 m!1091327))

(declare-fun m!1091329 () Bool)

(assert (=> b!1183194 m!1091329))

(assert (=> b!1183194 m!1091323))

(assert (=> b!1183194 m!1091319))

(declare-fun m!1091331 () Bool)

(assert (=> b!1183194 m!1091331))

(assert (=> b!1183190 m!1091323))

(declare-fun m!1091333 () Bool)

(assert (=> b!1183197 m!1091333))

(declare-fun m!1091335 () Bool)

(assert (=> b!1183196 m!1091335))

(declare-fun m!1091337 () Bool)

(assert (=> mapNonEmpty!46553 m!1091337))

(declare-fun m!1091339 () Bool)

(assert (=> b!1183187 m!1091339))

(declare-fun m!1091341 () Bool)

(assert (=> b!1183187 m!1091341))

(declare-fun m!1091343 () Bool)

(assert (=> b!1183187 m!1091343))

(assert (=> b!1183187 m!1091323))

(declare-fun m!1091345 () Bool)

(assert (=> b!1183187 m!1091345))

(assert (=> b!1183187 m!1091323))

(declare-fun m!1091347 () Bool)

(assert (=> b!1183187 m!1091347))

(declare-fun m!1091349 () Bool)

(assert (=> b!1183192 m!1091349))

(declare-fun m!1091351 () Bool)

(assert (=> b!1183198 m!1091351))

(declare-fun m!1091353 () Bool)

(assert (=> b!1183183 m!1091353))

(declare-fun m!1091355 () Bool)

(assert (=> b!1183183 m!1091355))

(declare-fun m!1091357 () Bool)

(assert (=> b!1183183 m!1091357))

(declare-fun m!1091359 () Bool)

(assert (=> b!1183183 m!1091359))

(declare-fun m!1091361 () Bool)

(assert (=> b!1183183 m!1091361))

(declare-fun m!1091363 () Bool)

(assert (=> b!1183186 m!1091363))

(declare-fun m!1091365 () Bool)

(assert (=> start!99708 m!1091365))

(declare-fun m!1091367 () Bool)

(assert (=> start!99708 m!1091367))

(declare-fun m!1091369 () Bool)

(assert (=> b!1183185 m!1091369))

(declare-fun m!1091371 () Bool)

(assert (=> b!1183185 m!1091371))

(declare-fun m!1091373 () Bool)

(assert (=> b!1183202 m!1091373))

(check-sat (not b!1183197) (not b!1183192) (not b_next!25287) (not b_lambda!20431) (not b!1183187) (not b!1183194) (not b!1183185) b_and!41443 (not b!1183186) (not b!1183201) (not mapNonEmpty!46553) (not b!1183196) (not b!1183183) (not b!1183184) (not b!1183199) tp_is_empty!29817 (not b!1183198) (not start!99708))
(check-sat b_and!41443 (not b_next!25287))
