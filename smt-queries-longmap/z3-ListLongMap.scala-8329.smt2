; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101368 () Bool)

(assert start!101368)

(declare-fun b_free!26245 () Bool)

(declare-fun b_next!26245 () Bool)

(assert (=> start!101368 (= b_free!26245 (not b_next!26245))))

(declare-fun tp!91762 () Bool)

(declare-fun b_and!43625 () Bool)

(assert (=> start!101368 (= tp!91762 b_and!43625)))

(declare-fun b!1218058 () Bool)

(declare-fun res!808949 () Bool)

(declare-fun e!691545 () Bool)

(assert (=> b!1218058 (=> (not res!808949) (not e!691545))))

(declare-datatypes ((array!78592 0))(
  ( (array!78593 (arr!37929 (Array (_ BitVec 32) (_ BitVec 64))) (size!38467 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78592)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78592 (_ BitVec 32)) Bool)

(assert (=> b!1218058 (= res!808949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218059 () Bool)

(declare-fun e!691549 () Bool)

(declare-fun e!691540 () Bool)

(assert (=> b!1218059 (= e!691549 (not e!691540))))

(declare-fun res!808957 () Bool)

(assert (=> b!1218059 (=> res!808957 e!691540)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218059 (= res!808957 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218059 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40237 0))(
  ( (Unit!40238) )
))
(declare-fun lt!553570 () Unit!40237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78592 (_ BitVec 64) (_ BitVec 32)) Unit!40237)

(assert (=> b!1218059 (= lt!553570 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218060 () Bool)

(declare-fun e!691550 () Bool)

(declare-fun e!691541 () Bool)

(declare-fun mapRes!48304 () Bool)

(assert (=> b!1218060 (= e!691550 (and e!691541 mapRes!48304))))

(declare-fun condMapEmpty!48304 () Bool)

(declare-datatypes ((V!46393 0))(
  ( (V!46394 (val!15531 Int)) )
))
(declare-datatypes ((ValueCell!14765 0))(
  ( (ValueCellFull!14765 (v!18185 V!46393)) (EmptyCell!14765) )
))
(declare-datatypes ((array!78594 0))(
  ( (array!78595 (arr!37930 (Array (_ BitVec 32) ValueCell!14765)) (size!38468 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78594)

(declare-fun mapDefault!48304 () ValueCell!14765)

(assert (=> b!1218060 (= condMapEmpty!48304 (= (arr!37930 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14765)) mapDefault!48304)))))

(declare-fun b!1218061 () Bool)

(declare-fun e!691542 () Bool)

(declare-fun tp_is_empty!30949 () Bool)

(assert (=> b!1218061 (= e!691542 tp_is_empty!30949)))

(declare-fun b!1218062 () Bool)

(declare-fun res!808947 () Bool)

(assert (=> b!1218062 (=> (not res!808947) (not e!691545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218062 (= res!808947 (validKeyInArray!0 k0!934))))

(declare-fun b!1218063 () Bool)

(declare-fun e!691543 () Bool)

(assert (=> b!1218063 (= e!691543 (or (not (= (select (arr!37929 _keys!1208) from!1455) k0!934)) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun e!691546 () Bool)

(assert (=> b!1218063 e!691546))

(declare-fun res!808952 () Bool)

(assert (=> b!1218063 (=> (not res!808952) (not e!691546))))

(declare-fun lt!553565 () V!46393)

(declare-datatypes ((tuple2!20064 0))(
  ( (tuple2!20065 (_1!10043 (_ BitVec 64)) (_2!10043 V!46393)) )
))
(declare-datatypes ((List!26842 0))(
  ( (Nil!26839) (Cons!26838 (h!28047 tuple2!20064) (t!40058 List!26842)) )
))
(declare-datatypes ((ListLongMap!18033 0))(
  ( (ListLongMap!18034 (toList!9032 List!26842)) )
))
(declare-fun lt!553563 () ListLongMap!18033)

(declare-fun lt!553562 () ListLongMap!18033)

(declare-fun +!4100 (ListLongMap!18033 tuple2!20064) ListLongMap!18033)

(declare-fun get!19345 (ValueCell!14765 V!46393) V!46393)

(assert (=> b!1218063 (= res!808952 (= lt!553562 (+!4100 lt!553563 (tuple2!20065 (select (arr!37929 _keys!1208) from!1455) (get!19345 (select (arr!37930 _values!996) from!1455) lt!553565)))))))

(declare-fun mapNonEmpty!48304 () Bool)

(declare-fun tp!91763 () Bool)

(assert (=> mapNonEmpty!48304 (= mapRes!48304 (and tp!91763 e!691542))))

(declare-fun mapRest!48304 () (Array (_ BitVec 32) ValueCell!14765))

(declare-fun mapKey!48304 () (_ BitVec 32))

(declare-fun mapValue!48304 () ValueCell!14765)

(assert (=> mapNonEmpty!48304 (= (arr!37930 _values!996) (store mapRest!48304 mapKey!48304 mapValue!48304))))

(declare-fun b!1218064 () Bool)

(declare-fun res!808946 () Bool)

(assert (=> b!1218064 (=> (not res!808946) (not e!691545))))

(assert (=> b!1218064 (= res!808946 (= (select (arr!37929 _keys!1208) i!673) k0!934))))

(declare-fun b!1218065 () Bool)

(declare-fun res!808960 () Bool)

(assert (=> b!1218065 (=> (not res!808960) (not e!691549))))

(declare-fun lt!553567 () array!78592)

(declare-datatypes ((List!26843 0))(
  ( (Nil!26840) (Cons!26839 (h!28048 (_ BitVec 64)) (t!40059 List!26843)) )
))
(declare-fun arrayNoDuplicates!0 (array!78592 (_ BitVec 32) List!26843) Bool)

(assert (=> b!1218065 (= res!808960 (arrayNoDuplicates!0 lt!553567 #b00000000000000000000000000000000 Nil!26840))))

(declare-fun b!1218066 () Bool)

(declare-fun res!808948 () Bool)

(assert (=> b!1218066 (=> (not res!808948) (not e!691545))))

(assert (=> b!1218066 (= res!808948 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38467 _keys!1208))))))

(declare-fun b!1218067 () Bool)

(assert (=> b!1218067 (= e!691545 e!691549)))

(declare-fun res!808953 () Bool)

(assert (=> b!1218067 (=> (not res!808953) (not e!691549))))

(assert (=> b!1218067 (= res!808953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553567 mask!1564))))

(assert (=> b!1218067 (= lt!553567 (array!78593 (store (arr!37929 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38467 _keys!1208)))))

(declare-fun e!691547 () Bool)

(declare-fun b!1218068 () Bool)

(assert (=> b!1218068 (= e!691547 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218069 () Bool)

(declare-fun e!691544 () Bool)

(assert (=> b!1218069 (= e!691544 e!691543)))

(declare-fun res!808959 () Bool)

(assert (=> b!1218069 (=> res!808959 e!691543)))

(assert (=> b!1218069 (= res!808959 (not (validKeyInArray!0 (select (arr!37929 _keys!1208) from!1455))))))

(declare-fun lt!553568 () ListLongMap!18033)

(assert (=> b!1218069 (= lt!553568 lt!553563)))

(declare-fun lt!553571 () ListLongMap!18033)

(declare-fun -!1866 (ListLongMap!18033 (_ BitVec 64)) ListLongMap!18033)

(assert (=> b!1218069 (= lt!553563 (-!1866 lt!553571 k0!934))))

(declare-fun zeroValue!944 () V!46393)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553564 () array!78594)

(declare-fun minValue!944 () V!46393)

(declare-fun getCurrentListMapNoExtraKeys!5471 (array!78592 array!78594 (_ BitVec 32) (_ BitVec 32) V!46393 V!46393 (_ BitVec 32) Int) ListLongMap!18033)

(assert (=> b!1218069 (= lt!553568 (getCurrentListMapNoExtraKeys!5471 lt!553567 lt!553564 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218069 (= lt!553571 (getCurrentListMapNoExtraKeys!5471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553566 () Unit!40237)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1101 (array!78592 array!78594 (_ BitVec 32) (_ BitVec 32) V!46393 V!46393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40237)

(assert (=> b!1218069 (= lt!553566 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1101 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218070 () Bool)

(assert (=> b!1218070 (= e!691546 e!691547)))

(declare-fun res!808956 () Bool)

(assert (=> b!1218070 (=> res!808956 e!691547)))

(assert (=> b!1218070 (= res!808956 (not (= (select (arr!37929 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218071 () Bool)

(declare-fun res!808958 () Bool)

(assert (=> b!1218071 (=> (not res!808958) (not e!691545))))

(assert (=> b!1218071 (= res!808958 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26840))))

(declare-fun b!1218072 () Bool)

(declare-fun res!808955 () Bool)

(assert (=> b!1218072 (=> (not res!808955) (not e!691545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218072 (= res!808955 (validMask!0 mask!1564))))

(declare-fun b!1218073 () Bool)

(assert (=> b!1218073 (= e!691541 tp_is_empty!30949)))

(declare-fun b!1218074 () Bool)

(assert (=> b!1218074 (= e!691540 e!691544)))

(declare-fun res!808954 () Bool)

(assert (=> b!1218074 (=> res!808954 e!691544)))

(assert (=> b!1218074 (= res!808954 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1218074 (= lt!553562 (getCurrentListMapNoExtraKeys!5471 lt!553567 lt!553564 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218074 (= lt!553564 (array!78595 (store (arr!37930 _values!996) i!673 (ValueCellFull!14765 lt!553565)) (size!38468 _values!996)))))

(declare-fun dynLambda!3322 (Int (_ BitVec 64)) V!46393)

(assert (=> b!1218074 (= lt!553565 (dynLambda!3322 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553569 () ListLongMap!18033)

(assert (=> b!1218074 (= lt!553569 (getCurrentListMapNoExtraKeys!5471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218075 () Bool)

(declare-fun res!808950 () Bool)

(assert (=> b!1218075 (=> (not res!808950) (not e!691545))))

(assert (=> b!1218075 (= res!808950 (and (= (size!38468 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38467 _keys!1208) (size!38468 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48304 () Bool)

(assert (=> mapIsEmpty!48304 mapRes!48304))

(declare-fun res!808951 () Bool)

(assert (=> start!101368 (=> (not res!808951) (not e!691545))))

(assert (=> start!101368 (= res!808951 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38467 _keys!1208))))))

(assert (=> start!101368 e!691545))

(assert (=> start!101368 tp_is_empty!30949))

(declare-fun array_inv!28990 (array!78592) Bool)

(assert (=> start!101368 (array_inv!28990 _keys!1208)))

(assert (=> start!101368 true))

(assert (=> start!101368 tp!91762))

(declare-fun array_inv!28991 (array!78594) Bool)

(assert (=> start!101368 (and (array_inv!28991 _values!996) e!691550)))

(assert (= (and start!101368 res!808951) b!1218072))

(assert (= (and b!1218072 res!808955) b!1218075))

(assert (= (and b!1218075 res!808950) b!1218058))

(assert (= (and b!1218058 res!808949) b!1218071))

(assert (= (and b!1218071 res!808958) b!1218066))

(assert (= (and b!1218066 res!808948) b!1218062))

(assert (= (and b!1218062 res!808947) b!1218064))

(assert (= (and b!1218064 res!808946) b!1218067))

(assert (= (and b!1218067 res!808953) b!1218065))

(assert (= (and b!1218065 res!808960) b!1218059))

(assert (= (and b!1218059 (not res!808957)) b!1218074))

(assert (= (and b!1218074 (not res!808954)) b!1218069))

(assert (= (and b!1218069 (not res!808959)) b!1218063))

(assert (= (and b!1218063 res!808952) b!1218070))

(assert (= (and b!1218070 (not res!808956)) b!1218068))

(assert (= (and b!1218060 condMapEmpty!48304) mapIsEmpty!48304))

(assert (= (and b!1218060 (not condMapEmpty!48304)) mapNonEmpty!48304))

(get-info :version)

(assert (= (and mapNonEmpty!48304 ((_ is ValueCellFull!14765) mapValue!48304)) b!1218061))

(assert (= (and b!1218060 ((_ is ValueCellFull!14765) mapDefault!48304)) b!1218073))

(assert (= start!101368 b!1218060))

(declare-fun b_lambda!21987 () Bool)

(assert (=> (not b_lambda!21987) (not b!1218074)))

(declare-fun t!40057 () Bool)

(declare-fun tb!11037 () Bool)

(assert (=> (and start!101368 (= defaultEntry!1004 defaultEntry!1004) t!40057) tb!11037))

(declare-fun result!22683 () Bool)

(assert (=> tb!11037 (= result!22683 tp_is_empty!30949)))

(assert (=> b!1218074 t!40057))

(declare-fun b_and!43627 () Bool)

(assert (= b_and!43625 (and (=> t!40057 result!22683) b_and!43627)))

(declare-fun m!1122355 () Bool)

(assert (=> b!1218068 m!1122355))

(declare-fun m!1122357 () Bool)

(assert (=> b!1218064 m!1122357))

(declare-fun m!1122359 () Bool)

(assert (=> b!1218074 m!1122359))

(declare-fun m!1122361 () Bool)

(assert (=> b!1218074 m!1122361))

(declare-fun m!1122363 () Bool)

(assert (=> b!1218074 m!1122363))

(declare-fun m!1122365 () Bool)

(assert (=> b!1218074 m!1122365))

(declare-fun m!1122367 () Bool)

(assert (=> start!101368 m!1122367))

(declare-fun m!1122369 () Bool)

(assert (=> start!101368 m!1122369))

(declare-fun m!1122371 () Bool)

(assert (=> b!1218072 m!1122371))

(declare-fun m!1122373 () Bool)

(assert (=> b!1218069 m!1122373))

(declare-fun m!1122375 () Bool)

(assert (=> b!1218069 m!1122375))

(declare-fun m!1122377 () Bool)

(assert (=> b!1218069 m!1122377))

(declare-fun m!1122379 () Bool)

(assert (=> b!1218069 m!1122379))

(declare-fun m!1122381 () Bool)

(assert (=> b!1218069 m!1122381))

(declare-fun m!1122383 () Bool)

(assert (=> b!1218069 m!1122383))

(assert (=> b!1218069 m!1122381))

(declare-fun m!1122385 () Bool)

(assert (=> mapNonEmpty!48304 m!1122385))

(declare-fun m!1122387 () Bool)

(assert (=> b!1218067 m!1122387))

(declare-fun m!1122389 () Bool)

(assert (=> b!1218067 m!1122389))

(declare-fun m!1122391 () Bool)

(assert (=> b!1218058 m!1122391))

(declare-fun m!1122393 () Bool)

(assert (=> b!1218062 m!1122393))

(assert (=> b!1218070 m!1122381))

(declare-fun m!1122395 () Bool)

(assert (=> b!1218071 m!1122395))

(assert (=> b!1218063 m!1122381))

(declare-fun m!1122397 () Bool)

(assert (=> b!1218063 m!1122397))

(assert (=> b!1218063 m!1122397))

(declare-fun m!1122399 () Bool)

(assert (=> b!1218063 m!1122399))

(declare-fun m!1122401 () Bool)

(assert (=> b!1218063 m!1122401))

(declare-fun m!1122403 () Bool)

(assert (=> b!1218065 m!1122403))

(declare-fun m!1122405 () Bool)

(assert (=> b!1218059 m!1122405))

(declare-fun m!1122407 () Bool)

(assert (=> b!1218059 m!1122407))

(check-sat (not b!1218068) (not b!1218069) (not b!1218071) (not b!1218074) (not b!1218067) (not b!1218072) (not b!1218059) (not b!1218063) (not start!101368) (not b!1218062) (not mapNonEmpty!48304) (not b_lambda!21987) (not b_next!26245) b_and!43627 (not b!1218065) tp_is_empty!30949 (not b!1218058))
(check-sat b_and!43627 (not b_next!26245))
