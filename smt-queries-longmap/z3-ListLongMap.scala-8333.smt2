; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101660 () Bool)

(assert start!101660)

(declare-fun b_free!26269 () Bool)

(declare-fun b_next!26269 () Bool)

(assert (=> start!101660 (= b_free!26269 (not b_next!26269))))

(declare-fun tp!91837 () Bool)

(declare-fun b_and!43711 () Bool)

(assert (=> start!101660 (= tp!91837 b_and!43711)))

(declare-fun b!1220273 () Bool)

(declare-fun res!810127 () Bool)

(declare-fun e!692943 () Bool)

(assert (=> b!1220273 (=> (not res!810127) (not e!692943))))

(declare-datatypes ((array!78761 0))(
  ( (array!78762 (arr!38006 (Array (_ BitVec 32) (_ BitVec 64))) (size!38543 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78761)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1220273 (= res!810127 (= (select (arr!38006 _keys!1208) i!673) k0!934))))

(declare-fun b!1220274 () Bool)

(declare-fun e!692939 () Bool)

(declare-fun tp_is_empty!30973 () Bool)

(assert (=> b!1220274 (= e!692939 tp_is_empty!30973)))

(declare-fun mapNonEmpty!48343 () Bool)

(declare-fun mapRes!48343 () Bool)

(declare-fun tp!91838 () Bool)

(assert (=> mapNonEmpty!48343 (= mapRes!48343 (and tp!91838 e!692939))))

(declare-datatypes ((V!46425 0))(
  ( (V!46426 (val!15543 Int)) )
))
(declare-datatypes ((ValueCell!14777 0))(
  ( (ValueCellFull!14777 (v!18195 V!46425)) (EmptyCell!14777) )
))
(declare-fun mapRest!48343 () (Array (_ BitVec 32) ValueCell!14777))

(declare-fun mapKey!48343 () (_ BitVec 32))

(declare-fun mapValue!48343 () ValueCell!14777)

(declare-datatypes ((array!78763 0))(
  ( (array!78764 (arr!38007 (Array (_ BitVec 32) ValueCell!14777)) (size!38544 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78763)

(assert (=> mapNonEmpty!48343 (= (arr!38007 _values!996) (store mapRest!48343 mapKey!48343 mapValue!48343))))

(declare-fun b!1220275 () Bool)

(declare-fun res!810129 () Bool)

(assert (=> b!1220275 (=> (not res!810129) (not e!692943))))

(assert (=> b!1220275 (= res!810129 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38543 _keys!1208))))))

(declare-fun res!810117 () Bool)

(assert (=> start!101660 (=> (not res!810117) (not e!692943))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101660 (= res!810117 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38543 _keys!1208))))))

(assert (=> start!101660 e!692943))

(assert (=> start!101660 tp_is_empty!30973))

(declare-fun array_inv!28996 (array!78761) Bool)

(assert (=> start!101660 (array_inv!28996 _keys!1208)))

(assert (=> start!101660 true))

(assert (=> start!101660 tp!91837))

(declare-fun e!692936 () Bool)

(declare-fun array_inv!28997 (array!78763) Bool)

(assert (=> start!101660 (and (array_inv!28997 _values!996) e!692936)))

(declare-fun b!1220276 () Bool)

(declare-fun e!692941 () Bool)

(declare-fun e!692944 () Bool)

(assert (=> b!1220276 (= e!692941 e!692944)))

(declare-fun res!810123 () Bool)

(assert (=> b!1220276 (=> res!810123 e!692944)))

(assert (=> b!1220276 (= res!810123 (not (= (select (arr!38006 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220277 () Bool)

(declare-fun e!692945 () Bool)

(assert (=> b!1220277 (= e!692936 (and e!692945 mapRes!48343))))

(declare-fun condMapEmpty!48343 () Bool)

(declare-fun mapDefault!48343 () ValueCell!14777)

(assert (=> b!1220277 (= condMapEmpty!48343 (= (arr!38007 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14777)) mapDefault!48343)))))

(declare-fun b!1220278 () Bool)

(assert (=> b!1220278 (= e!692945 tp_is_empty!30973)))

(declare-fun b!1220279 () Bool)

(declare-fun res!810119 () Bool)

(assert (=> b!1220279 (=> (not res!810119) (not e!692943))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220279 (= res!810119 (validMask!0 mask!1564))))

(declare-fun b!1220280 () Bool)

(declare-fun e!692934 () Bool)

(declare-fun e!692937 () Bool)

(assert (=> b!1220280 (= e!692934 e!692937)))

(declare-fun res!810122 () Bool)

(assert (=> b!1220280 (=> res!810122 e!692937)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220280 (= res!810122 (not (validKeyInArray!0 (select (arr!38006 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20010 0))(
  ( (tuple2!20011 (_1!10016 (_ BitVec 64)) (_2!10016 V!46425)) )
))
(declare-datatypes ((List!26820 0))(
  ( (Nil!26817) (Cons!26816 (h!28034 tuple2!20010) (t!40061 List!26820)) )
))
(declare-datatypes ((ListLongMap!17987 0))(
  ( (ListLongMap!17988 (toList!9009 List!26820)) )
))
(declare-fun lt!554660 () ListLongMap!17987)

(declare-fun lt!554667 () ListLongMap!17987)

(assert (=> b!1220280 (= lt!554660 lt!554667)))

(declare-fun lt!554669 () ListLongMap!17987)

(declare-fun -!1897 (ListLongMap!17987 (_ BitVec 64)) ListLongMap!17987)

(assert (=> b!1220280 (= lt!554667 (-!1897 lt!554669 k0!934))))

(declare-fun zeroValue!944 () V!46425)

(declare-fun lt!554663 () array!78763)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!554665 () array!78761)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46425)

(declare-fun getCurrentListMapNoExtraKeys!5466 (array!78761 array!78763 (_ BitVec 32) (_ BitVec 32) V!46425 V!46425 (_ BitVec 32) Int) ListLongMap!17987)

(assert (=> b!1220280 (= lt!554660 (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220280 (= lt!554669 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40374 0))(
  ( (Unit!40375) )
))
(declare-fun lt!554668 () Unit!40374)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1112 (array!78761 array!78763 (_ BitVec 32) (_ BitVec 32) V!46425 V!46425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40374)

(assert (=> b!1220280 (= lt!554668 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1112 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220281 () Bool)

(declare-fun e!692938 () Bool)

(assert (=> b!1220281 (= e!692943 e!692938)))

(declare-fun res!810116 () Bool)

(assert (=> b!1220281 (=> (not res!810116) (not e!692938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78761 (_ BitVec 32)) Bool)

(assert (=> b!1220281 (= res!810116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554665 mask!1564))))

(assert (=> b!1220281 (= lt!554665 (array!78762 (store (arr!38006 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38543 _keys!1208)))))

(declare-fun b!1220282 () Bool)

(declare-fun e!692935 () Bool)

(assert (=> b!1220282 (= e!692935 (bvslt (size!38543 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!78761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220282 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554661 () Unit!40374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78761 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40374)

(assert (=> b!1220282 (= lt!554661 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220283 () Bool)

(declare-fun res!810131 () Bool)

(assert (=> b!1220283 (=> (not res!810131) (not e!692943))))

(assert (=> b!1220283 (= res!810131 (and (= (size!38544 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38543 _keys!1208) (size!38544 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48343 () Bool)

(assert (=> mapIsEmpty!48343 mapRes!48343))

(declare-fun b!1220284 () Bool)

(declare-fun e!692942 () Bool)

(assert (=> b!1220284 (= e!692938 (not e!692942))))

(declare-fun res!810130 () Bool)

(assert (=> b!1220284 (=> res!810130 e!692942)))

(assert (=> b!1220284 (= res!810130 (bvsgt from!1455 i!673))))

(assert (=> b!1220284 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554666 () Unit!40374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78761 (_ BitVec 64) (_ BitVec 32)) Unit!40374)

(assert (=> b!1220284 (= lt!554666 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220285 () Bool)

(assert (=> b!1220285 (= e!692944 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220286 () Bool)

(declare-fun res!810118 () Bool)

(assert (=> b!1220286 (=> (not res!810118) (not e!692943))))

(assert (=> b!1220286 (= res!810118 (validKeyInArray!0 k0!934))))

(declare-fun b!1220287 () Bool)

(assert (=> b!1220287 (= e!692942 e!692934)))

(declare-fun res!810126 () Bool)

(assert (=> b!1220287 (=> res!810126 e!692934)))

(assert (=> b!1220287 (= res!810126 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!554664 () ListLongMap!17987)

(assert (=> b!1220287 (= lt!554664 (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554670 () V!46425)

(assert (=> b!1220287 (= lt!554663 (array!78764 (store (arr!38007 _values!996) i!673 (ValueCellFull!14777 lt!554670)) (size!38544 _values!996)))))

(declare-fun dynLambda!3368 (Int (_ BitVec 64)) V!46425)

(assert (=> b!1220287 (= lt!554670 (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554662 () ListLongMap!17987)

(assert (=> b!1220287 (= lt!554662 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220288 () Bool)

(declare-fun res!810124 () Bool)

(assert (=> b!1220288 (=> (not res!810124) (not e!692938))))

(declare-datatypes ((List!26821 0))(
  ( (Nil!26818) (Cons!26817 (h!28035 (_ BitVec 64)) (t!40062 List!26821)) )
))
(declare-fun arrayNoDuplicates!0 (array!78761 (_ BitVec 32) List!26821) Bool)

(assert (=> b!1220288 (= res!810124 (arrayNoDuplicates!0 lt!554665 #b00000000000000000000000000000000 Nil!26818))))

(declare-fun b!1220289 () Bool)

(declare-fun res!810120 () Bool)

(assert (=> b!1220289 (=> (not res!810120) (not e!692943))))

(assert (=> b!1220289 (= res!810120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220290 () Bool)

(assert (=> b!1220290 (= e!692937 e!692935)))

(declare-fun res!810128 () Bool)

(assert (=> b!1220290 (=> res!810128 e!692935)))

(assert (=> b!1220290 (= res!810128 (not (= (select (arr!38006 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1220290 e!692941))

(declare-fun res!810125 () Bool)

(assert (=> b!1220290 (=> (not res!810125) (not e!692941))))

(declare-fun +!4119 (ListLongMap!17987 tuple2!20010) ListLongMap!17987)

(declare-fun get!19419 (ValueCell!14777 V!46425) V!46425)

(assert (=> b!1220290 (= res!810125 (= lt!554664 (+!4119 lt!554667 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670)))))))

(declare-fun b!1220291 () Bool)

(declare-fun res!810121 () Bool)

(assert (=> b!1220291 (=> (not res!810121) (not e!692943))))

(assert (=> b!1220291 (= res!810121 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26818))))

(assert (= (and start!101660 res!810117) b!1220279))

(assert (= (and b!1220279 res!810119) b!1220283))

(assert (= (and b!1220283 res!810131) b!1220289))

(assert (= (and b!1220289 res!810120) b!1220291))

(assert (= (and b!1220291 res!810121) b!1220275))

(assert (= (and b!1220275 res!810129) b!1220286))

(assert (= (and b!1220286 res!810118) b!1220273))

(assert (= (and b!1220273 res!810127) b!1220281))

(assert (= (and b!1220281 res!810116) b!1220288))

(assert (= (and b!1220288 res!810124) b!1220284))

(assert (= (and b!1220284 (not res!810130)) b!1220287))

(assert (= (and b!1220287 (not res!810126)) b!1220280))

(assert (= (and b!1220280 (not res!810122)) b!1220290))

(assert (= (and b!1220290 res!810125) b!1220276))

(assert (= (and b!1220276 (not res!810123)) b!1220285))

(assert (= (and b!1220290 (not res!810128)) b!1220282))

(assert (= (and b!1220277 condMapEmpty!48343) mapIsEmpty!48343))

(assert (= (and b!1220277 (not condMapEmpty!48343)) mapNonEmpty!48343))

(get-info :version)

(assert (= (and mapNonEmpty!48343 ((_ is ValueCellFull!14777) mapValue!48343)) b!1220274))

(assert (= (and b!1220277 ((_ is ValueCellFull!14777) mapDefault!48343)) b!1220278))

(assert (= start!101660 b!1220277))

(declare-fun b_lambda!22053 () Bool)

(assert (=> (not b_lambda!22053) (not b!1220287)))

(declare-fun t!40060 () Bool)

(declare-fun tb!11061 () Bool)

(assert (=> (and start!101660 (= defaultEntry!1004 defaultEntry!1004) t!40060) tb!11061))

(declare-fun result!22733 () Bool)

(assert (=> tb!11061 (= result!22733 tp_is_empty!30973)))

(assert (=> b!1220287 t!40060))

(declare-fun b_and!43713 () Bool)

(assert (= b_and!43711 (and (=> t!40060 result!22733) b_and!43713)))

(declare-fun m!1125331 () Bool)

(assert (=> b!1220285 m!1125331))

(declare-fun m!1125333 () Bool)

(assert (=> mapNonEmpty!48343 m!1125333))

(declare-fun m!1125335 () Bool)

(assert (=> b!1220291 m!1125335))

(declare-fun m!1125337 () Bool)

(assert (=> b!1220279 m!1125337))

(declare-fun m!1125339 () Bool)

(assert (=> b!1220287 m!1125339))

(declare-fun m!1125341 () Bool)

(assert (=> b!1220287 m!1125341))

(declare-fun m!1125343 () Bool)

(assert (=> b!1220287 m!1125343))

(declare-fun m!1125345 () Bool)

(assert (=> b!1220287 m!1125345))

(declare-fun m!1125347 () Bool)

(assert (=> b!1220273 m!1125347))

(declare-fun m!1125349 () Bool)

(assert (=> b!1220288 m!1125349))

(declare-fun m!1125351 () Bool)

(assert (=> start!101660 m!1125351))

(declare-fun m!1125353 () Bool)

(assert (=> start!101660 m!1125353))

(declare-fun m!1125355 () Bool)

(assert (=> b!1220282 m!1125355))

(declare-fun m!1125357 () Bool)

(assert (=> b!1220282 m!1125357))

(declare-fun m!1125359 () Bool)

(assert (=> b!1220280 m!1125359))

(declare-fun m!1125361 () Bool)

(assert (=> b!1220280 m!1125361))

(declare-fun m!1125363 () Bool)

(assert (=> b!1220280 m!1125363))

(declare-fun m!1125365 () Bool)

(assert (=> b!1220280 m!1125365))

(assert (=> b!1220280 m!1125363))

(declare-fun m!1125367 () Bool)

(assert (=> b!1220280 m!1125367))

(declare-fun m!1125369 () Bool)

(assert (=> b!1220280 m!1125369))

(declare-fun m!1125371 () Bool)

(assert (=> b!1220281 m!1125371))

(declare-fun m!1125373 () Bool)

(assert (=> b!1220281 m!1125373))

(declare-fun m!1125375 () Bool)

(assert (=> b!1220289 m!1125375))

(assert (=> b!1220276 m!1125363))

(declare-fun m!1125377 () Bool)

(assert (=> b!1220286 m!1125377))

(assert (=> b!1220290 m!1125363))

(declare-fun m!1125379 () Bool)

(assert (=> b!1220290 m!1125379))

(assert (=> b!1220290 m!1125379))

(declare-fun m!1125381 () Bool)

(assert (=> b!1220290 m!1125381))

(declare-fun m!1125383 () Bool)

(assert (=> b!1220290 m!1125383))

(declare-fun m!1125385 () Bool)

(assert (=> b!1220284 m!1125385))

(declare-fun m!1125387 () Bool)

(assert (=> b!1220284 m!1125387))

(check-sat (not b!1220286) (not b!1220284) (not b!1220289) (not b!1220279) b_and!43713 (not b!1220291) (not b!1220282) (not start!101660) (not b!1220287) tp_is_empty!30973 (not b!1220285) (not b!1220290) (not b_next!26269) (not b!1220288) (not b!1220280) (not b_lambda!22053) (not b!1220281) (not mapNonEmpty!48343))
(check-sat b_and!43713 (not b_next!26269))
(get-model)

(declare-fun b_lambda!22059 () Bool)

(assert (= b_lambda!22053 (or (and start!101660 b_free!26269) b_lambda!22059)))

(check-sat (not b!1220286) (not b!1220284) (not b_lambda!22059) (not b!1220289) (not b!1220279) b_and!43713 (not b!1220280) (not b!1220291) (not b!1220282) (not start!101660) (not b!1220287) tp_is_empty!30973 (not b!1220285) (not b!1220290) (not b_next!26269) (not b!1220288) (not b!1220281) (not mapNonEmpty!48343))
(check-sat b_and!43713 (not b_next!26269))
(get-model)

(declare-fun b!1220422 () Bool)

(declare-fun e!693028 () Bool)

(declare-fun e!693026 () Bool)

(assert (=> b!1220422 (= e!693028 e!693026)))

(declare-fun res!810236 () Bool)

(assert (=> b!1220422 (=> (not res!810236) (not e!693026))))

(declare-fun e!693029 () Bool)

(assert (=> b!1220422 (= res!810236 (not e!693029))))

(declare-fun res!810234 () Bool)

(assert (=> b!1220422 (=> (not res!810234) (not e!693029))))

(assert (=> b!1220422 (= res!810234 (validKeyInArray!0 (select (arr!38006 lt!554665) #b00000000000000000000000000000000)))))

(declare-fun b!1220423 () Bool)

(declare-fun contains!7049 (List!26821 (_ BitVec 64)) Bool)

(assert (=> b!1220423 (= e!693029 (contains!7049 Nil!26818 (select (arr!38006 lt!554665) #b00000000000000000000000000000000)))))

(declare-fun b!1220424 () Bool)

(declare-fun e!693027 () Bool)

(declare-fun call!60734 () Bool)

(assert (=> b!1220424 (= e!693027 call!60734)))

(declare-fun d!134125 () Bool)

(declare-fun res!810235 () Bool)

(assert (=> d!134125 (=> res!810235 e!693028)))

(assert (=> d!134125 (= res!810235 (bvsge #b00000000000000000000000000000000 (size!38543 lt!554665)))))

(assert (=> d!134125 (= (arrayNoDuplicates!0 lt!554665 #b00000000000000000000000000000000 Nil!26818) e!693028)))

(declare-fun bm!60731 () Bool)

(declare-fun c!120563 () Bool)

(assert (=> bm!60731 (= call!60734 (arrayNoDuplicates!0 lt!554665 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120563 (Cons!26817 (select (arr!38006 lt!554665) #b00000000000000000000000000000000) Nil!26818) Nil!26818)))))

(declare-fun b!1220425 () Bool)

(assert (=> b!1220425 (= e!693026 e!693027)))

(assert (=> b!1220425 (= c!120563 (validKeyInArray!0 (select (arr!38006 lt!554665) #b00000000000000000000000000000000)))))

(declare-fun b!1220426 () Bool)

(assert (=> b!1220426 (= e!693027 call!60734)))

(assert (= (and d!134125 (not res!810235)) b!1220422))

(assert (= (and b!1220422 res!810234) b!1220423))

(assert (= (and b!1220422 res!810236) b!1220425))

(assert (= (and b!1220425 c!120563) b!1220426))

(assert (= (and b!1220425 (not c!120563)) b!1220424))

(assert (= (or b!1220426 b!1220424) bm!60731))

(declare-fun m!1125505 () Bool)

(assert (=> b!1220422 m!1125505))

(assert (=> b!1220422 m!1125505))

(declare-fun m!1125507 () Bool)

(assert (=> b!1220422 m!1125507))

(assert (=> b!1220423 m!1125505))

(assert (=> b!1220423 m!1125505))

(declare-fun m!1125509 () Bool)

(assert (=> b!1220423 m!1125509))

(assert (=> bm!60731 m!1125505))

(declare-fun m!1125511 () Bool)

(assert (=> bm!60731 m!1125511))

(assert (=> b!1220425 m!1125505))

(assert (=> b!1220425 m!1125505))

(assert (=> b!1220425 m!1125507))

(assert (=> b!1220288 d!134125))

(declare-fun d!134127 () Bool)

(assert (=> d!134127 (= (array_inv!28996 _keys!1208) (bvsge (size!38543 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101660 d!134127))

(declare-fun d!134129 () Bool)

(assert (=> d!134129 (= (array_inv!28997 _values!996) (bvsge (size!38544 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101660 d!134129))

(declare-fun b!1220451 () Bool)

(declare-fun e!693050 () ListLongMap!17987)

(assert (=> b!1220451 (= e!693050 (ListLongMap!17988 Nil!26817))))

(declare-fun b!1220452 () Bool)

(declare-fun e!693048 () Bool)

(declare-fun lt!554757 () ListLongMap!17987)

(declare-fun isEmpty!1001 (ListLongMap!17987) Bool)

(assert (=> b!1220452 (= e!693048 (isEmpty!1001 lt!554757))))

(declare-fun b!1220453 () Bool)

(declare-fun e!693044 () ListLongMap!17987)

(assert (=> b!1220453 (= e!693050 e!693044)))

(declare-fun c!120574 () Bool)

(assert (=> b!1220453 (= c!120574 (validKeyInArray!0 (select (arr!38006 lt!554665) from!1455)))))

(declare-fun b!1220454 () Bool)

(declare-fun e!693047 () Bool)

(declare-fun e!693046 () Bool)

(assert (=> b!1220454 (= e!693047 e!693046)))

(declare-fun c!120575 () Bool)

(declare-fun e!693049 () Bool)

(assert (=> b!1220454 (= c!120575 e!693049)))

(declare-fun res!810245 () Bool)

(assert (=> b!1220454 (=> (not res!810245) (not e!693049))))

(assert (=> b!1220454 (= res!810245 (bvslt from!1455 (size!38543 lt!554665)))))

(declare-fun b!1220455 () Bool)

(assert (=> b!1220455 (= e!693046 e!693048)))

(declare-fun c!120572 () Bool)

(assert (=> b!1220455 (= c!120572 (bvslt from!1455 (size!38543 lt!554665)))))

(declare-fun b!1220456 () Bool)

(declare-fun res!810246 () Bool)

(assert (=> b!1220456 (=> (not res!810246) (not e!693047))))

(declare-fun contains!7050 (ListLongMap!17987 (_ BitVec 64)) Bool)

(assert (=> b!1220456 (= res!810246 (not (contains!7050 lt!554757 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220457 () Bool)

(assert (=> b!1220457 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38543 lt!554665)))))

(assert (=> b!1220457 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38544 lt!554663)))))

(declare-fun e!693045 () Bool)

(declare-fun apply!982 (ListLongMap!17987 (_ BitVec 64)) V!46425)

(assert (=> b!1220457 (= e!693045 (= (apply!982 lt!554757 (select (arr!38006 lt!554665) from!1455)) (get!19419 (select (arr!38007 lt!554663) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!60737 () ListLongMap!17987)

(declare-fun bm!60734 () Bool)

(assert (=> bm!60734 (= call!60737 (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!134131 () Bool)

(assert (=> d!134131 e!693047))

(declare-fun res!810248 () Bool)

(assert (=> d!134131 (=> (not res!810248) (not e!693047))))

(assert (=> d!134131 (= res!810248 (not (contains!7050 lt!554757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134131 (= lt!554757 e!693050)))

(declare-fun c!120573 () Bool)

(assert (=> d!134131 (= c!120573 (bvsge from!1455 (size!38543 lt!554665)))))

(assert (=> d!134131 (validMask!0 mask!1564)))

(assert (=> d!134131 (= (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554757)))

(declare-fun b!1220458 () Bool)

(assert (=> b!1220458 (= e!693046 e!693045)))

(assert (=> b!1220458 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38543 lt!554665)))))

(declare-fun res!810247 () Bool)

(assert (=> b!1220458 (= res!810247 (contains!7050 lt!554757 (select (arr!38006 lt!554665) from!1455)))))

(assert (=> b!1220458 (=> (not res!810247) (not e!693045))))

(declare-fun b!1220459 () Bool)

(assert (=> b!1220459 (= e!693048 (= lt!554757 (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220460 () Bool)

(declare-fun lt!554756 () Unit!40374)

(declare-fun lt!554755 () Unit!40374)

(assert (=> b!1220460 (= lt!554756 lt!554755)))

(declare-fun lt!554752 () V!46425)

(declare-fun lt!554754 () (_ BitVec 64))

(declare-fun lt!554751 () ListLongMap!17987)

(declare-fun lt!554753 () (_ BitVec 64))

(assert (=> b!1220460 (not (contains!7050 (+!4119 lt!554751 (tuple2!20011 lt!554754 lt!554752)) lt!554753))))

(declare-fun addStillNotContains!303 (ListLongMap!17987 (_ BitVec 64) V!46425 (_ BitVec 64)) Unit!40374)

(assert (=> b!1220460 (= lt!554755 (addStillNotContains!303 lt!554751 lt!554754 lt!554752 lt!554753))))

(assert (=> b!1220460 (= lt!554753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220460 (= lt!554752 (get!19419 (select (arr!38007 lt!554663) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220460 (= lt!554754 (select (arr!38006 lt!554665) from!1455))))

(assert (=> b!1220460 (= lt!554751 call!60737)))

(assert (=> b!1220460 (= e!693044 (+!4119 call!60737 (tuple2!20011 (select (arr!38006 lt!554665) from!1455) (get!19419 (select (arr!38007 lt!554663) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220461 () Bool)

(assert (=> b!1220461 (= e!693044 call!60737)))

(declare-fun b!1220462 () Bool)

(assert (=> b!1220462 (= e!693049 (validKeyInArray!0 (select (arr!38006 lt!554665) from!1455)))))

(assert (=> b!1220462 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!134131 c!120573) b!1220451))

(assert (= (and d!134131 (not c!120573)) b!1220453))

(assert (= (and b!1220453 c!120574) b!1220460))

(assert (= (and b!1220453 (not c!120574)) b!1220461))

(assert (= (or b!1220460 b!1220461) bm!60734))

(assert (= (and d!134131 res!810248) b!1220456))

(assert (= (and b!1220456 res!810246) b!1220454))

(assert (= (and b!1220454 res!810245) b!1220462))

(assert (= (and b!1220454 c!120575) b!1220458))

(assert (= (and b!1220454 (not c!120575)) b!1220455))

(assert (= (and b!1220458 res!810247) b!1220457))

(assert (= (and b!1220455 c!120572) b!1220459))

(assert (= (and b!1220455 (not c!120572)) b!1220452))

(declare-fun b_lambda!22061 () Bool)

(assert (=> (not b_lambda!22061) (not b!1220457)))

(assert (=> b!1220457 t!40060))

(declare-fun b_and!43723 () Bool)

(assert (= b_and!43713 (and (=> t!40060 result!22733) b_and!43723)))

(declare-fun b_lambda!22063 () Bool)

(assert (=> (not b_lambda!22063) (not b!1220460)))

(assert (=> b!1220460 t!40060))

(declare-fun b_and!43725 () Bool)

(assert (= b_and!43723 (and (=> t!40060 result!22733) b_and!43725)))

(declare-fun m!1125513 () Bool)

(assert (=> b!1220458 m!1125513))

(assert (=> b!1220458 m!1125513))

(declare-fun m!1125515 () Bool)

(assert (=> b!1220458 m!1125515))

(declare-fun m!1125517 () Bool)

(assert (=> bm!60734 m!1125517))

(declare-fun m!1125519 () Bool)

(assert (=> b!1220460 m!1125519))

(assert (=> b!1220460 m!1125343))

(declare-fun m!1125521 () Bool)

(assert (=> b!1220460 m!1125521))

(assert (=> b!1220460 m!1125513))

(declare-fun m!1125523 () Bool)

(assert (=> b!1220460 m!1125523))

(declare-fun m!1125525 () Bool)

(assert (=> b!1220460 m!1125525))

(assert (=> b!1220460 m!1125525))

(declare-fun m!1125527 () Bool)

(assert (=> b!1220460 m!1125527))

(assert (=> b!1220460 m!1125521))

(assert (=> b!1220460 m!1125343))

(declare-fun m!1125529 () Bool)

(assert (=> b!1220460 m!1125529))

(declare-fun m!1125531 () Bool)

(assert (=> b!1220456 m!1125531))

(declare-fun m!1125533 () Bool)

(assert (=> d!134131 m!1125533))

(assert (=> d!134131 m!1125337))

(assert (=> b!1220453 m!1125513))

(assert (=> b!1220453 m!1125513))

(declare-fun m!1125535 () Bool)

(assert (=> b!1220453 m!1125535))

(assert (=> b!1220457 m!1125343))

(assert (=> b!1220457 m!1125521))

(assert (=> b!1220457 m!1125513))

(declare-fun m!1125537 () Bool)

(assert (=> b!1220457 m!1125537))

(assert (=> b!1220457 m!1125513))

(assert (=> b!1220457 m!1125521))

(assert (=> b!1220457 m!1125343))

(assert (=> b!1220457 m!1125529))

(assert (=> b!1220462 m!1125513))

(assert (=> b!1220462 m!1125513))

(assert (=> b!1220462 m!1125535))

(assert (=> b!1220459 m!1125517))

(declare-fun m!1125539 () Bool)

(assert (=> b!1220452 m!1125539))

(assert (=> b!1220287 d!134131))

(declare-fun b!1220463 () Bool)

(declare-fun e!693057 () ListLongMap!17987)

(assert (=> b!1220463 (= e!693057 (ListLongMap!17988 Nil!26817))))

(declare-fun b!1220464 () Bool)

(declare-fun e!693055 () Bool)

(declare-fun lt!554764 () ListLongMap!17987)

(assert (=> b!1220464 (= e!693055 (isEmpty!1001 lt!554764))))

(declare-fun b!1220465 () Bool)

(declare-fun e!693051 () ListLongMap!17987)

(assert (=> b!1220465 (= e!693057 e!693051)))

(declare-fun c!120578 () Bool)

(assert (=> b!1220465 (= c!120578 (validKeyInArray!0 (select (arr!38006 _keys!1208) from!1455)))))

(declare-fun b!1220466 () Bool)

(declare-fun e!693054 () Bool)

(declare-fun e!693053 () Bool)

(assert (=> b!1220466 (= e!693054 e!693053)))

(declare-fun c!120579 () Bool)

(declare-fun e!693056 () Bool)

(assert (=> b!1220466 (= c!120579 e!693056)))

(declare-fun res!810249 () Bool)

(assert (=> b!1220466 (=> (not res!810249) (not e!693056))))

(assert (=> b!1220466 (= res!810249 (bvslt from!1455 (size!38543 _keys!1208)))))

(declare-fun b!1220467 () Bool)

(assert (=> b!1220467 (= e!693053 e!693055)))

(declare-fun c!120576 () Bool)

(assert (=> b!1220467 (= c!120576 (bvslt from!1455 (size!38543 _keys!1208)))))

(declare-fun b!1220468 () Bool)

(declare-fun res!810250 () Bool)

(assert (=> b!1220468 (=> (not res!810250) (not e!693054))))

(assert (=> b!1220468 (= res!810250 (not (contains!7050 lt!554764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220469 () Bool)

(assert (=> b!1220469 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38543 _keys!1208)))))

(assert (=> b!1220469 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38544 _values!996)))))

(declare-fun e!693052 () Bool)

(assert (=> b!1220469 (= e!693052 (= (apply!982 lt!554764 (select (arr!38006 _keys!1208) from!1455)) (get!19419 (select (arr!38007 _values!996) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!60735 () Bool)

(declare-fun call!60738 () ListLongMap!17987)

(assert (=> bm!60735 (= call!60738 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!134133 () Bool)

(assert (=> d!134133 e!693054))

(declare-fun res!810252 () Bool)

(assert (=> d!134133 (=> (not res!810252) (not e!693054))))

(assert (=> d!134133 (= res!810252 (not (contains!7050 lt!554764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134133 (= lt!554764 e!693057)))

(declare-fun c!120577 () Bool)

(assert (=> d!134133 (= c!120577 (bvsge from!1455 (size!38543 _keys!1208)))))

(assert (=> d!134133 (validMask!0 mask!1564)))

(assert (=> d!134133 (= (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554764)))

(declare-fun b!1220470 () Bool)

(assert (=> b!1220470 (= e!693053 e!693052)))

(assert (=> b!1220470 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38543 _keys!1208)))))

(declare-fun res!810251 () Bool)

(assert (=> b!1220470 (= res!810251 (contains!7050 lt!554764 (select (arr!38006 _keys!1208) from!1455)))))

(assert (=> b!1220470 (=> (not res!810251) (not e!693052))))

(declare-fun b!1220471 () Bool)

(assert (=> b!1220471 (= e!693055 (= lt!554764 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220472 () Bool)

(declare-fun lt!554763 () Unit!40374)

(declare-fun lt!554762 () Unit!40374)

(assert (=> b!1220472 (= lt!554763 lt!554762)))

(declare-fun lt!554759 () V!46425)

(declare-fun lt!554761 () (_ BitVec 64))

(declare-fun lt!554758 () ListLongMap!17987)

(declare-fun lt!554760 () (_ BitVec 64))

(assert (=> b!1220472 (not (contains!7050 (+!4119 lt!554758 (tuple2!20011 lt!554761 lt!554759)) lt!554760))))

(assert (=> b!1220472 (= lt!554762 (addStillNotContains!303 lt!554758 lt!554761 lt!554759 lt!554760))))

(assert (=> b!1220472 (= lt!554760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220472 (= lt!554759 (get!19419 (select (arr!38007 _values!996) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220472 (= lt!554761 (select (arr!38006 _keys!1208) from!1455))))

(assert (=> b!1220472 (= lt!554758 call!60738)))

(assert (=> b!1220472 (= e!693051 (+!4119 call!60738 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220473 () Bool)

(assert (=> b!1220473 (= e!693051 call!60738)))

(declare-fun b!1220474 () Bool)

(assert (=> b!1220474 (= e!693056 (validKeyInArray!0 (select (arr!38006 _keys!1208) from!1455)))))

(assert (=> b!1220474 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!134133 c!120577) b!1220463))

(assert (= (and d!134133 (not c!120577)) b!1220465))

(assert (= (and b!1220465 c!120578) b!1220472))

(assert (= (and b!1220465 (not c!120578)) b!1220473))

(assert (= (or b!1220472 b!1220473) bm!60735))

(assert (= (and d!134133 res!810252) b!1220468))

(assert (= (and b!1220468 res!810250) b!1220466))

(assert (= (and b!1220466 res!810249) b!1220474))

(assert (= (and b!1220466 c!120579) b!1220470))

(assert (= (and b!1220466 (not c!120579)) b!1220467))

(assert (= (and b!1220470 res!810251) b!1220469))

(assert (= (and b!1220467 c!120576) b!1220471))

(assert (= (and b!1220467 (not c!120576)) b!1220464))

(declare-fun b_lambda!22065 () Bool)

(assert (=> (not b_lambda!22065) (not b!1220469)))

(assert (=> b!1220469 t!40060))

(declare-fun b_and!43727 () Bool)

(assert (= b_and!43725 (and (=> t!40060 result!22733) b_and!43727)))

(declare-fun b_lambda!22067 () Bool)

(assert (=> (not b_lambda!22067) (not b!1220472)))

(assert (=> b!1220472 t!40060))

(declare-fun b_and!43729 () Bool)

(assert (= b_and!43727 (and (=> t!40060 result!22733) b_and!43729)))

(assert (=> b!1220470 m!1125363))

(assert (=> b!1220470 m!1125363))

(declare-fun m!1125541 () Bool)

(assert (=> b!1220470 m!1125541))

(declare-fun m!1125543 () Bool)

(assert (=> bm!60735 m!1125543))

(declare-fun m!1125545 () Bool)

(assert (=> b!1220472 m!1125545))

(assert (=> b!1220472 m!1125343))

(assert (=> b!1220472 m!1125379))

(assert (=> b!1220472 m!1125363))

(declare-fun m!1125547 () Bool)

(assert (=> b!1220472 m!1125547))

(declare-fun m!1125549 () Bool)

(assert (=> b!1220472 m!1125549))

(assert (=> b!1220472 m!1125549))

(declare-fun m!1125551 () Bool)

(assert (=> b!1220472 m!1125551))

(assert (=> b!1220472 m!1125379))

(assert (=> b!1220472 m!1125343))

(declare-fun m!1125553 () Bool)

(assert (=> b!1220472 m!1125553))

(declare-fun m!1125555 () Bool)

(assert (=> b!1220468 m!1125555))

(declare-fun m!1125557 () Bool)

(assert (=> d!134133 m!1125557))

(assert (=> d!134133 m!1125337))

(assert (=> b!1220465 m!1125363))

(assert (=> b!1220465 m!1125363))

(assert (=> b!1220465 m!1125365))

(assert (=> b!1220469 m!1125343))

(assert (=> b!1220469 m!1125379))

(assert (=> b!1220469 m!1125363))

(declare-fun m!1125559 () Bool)

(assert (=> b!1220469 m!1125559))

(assert (=> b!1220469 m!1125363))

(assert (=> b!1220469 m!1125379))

(assert (=> b!1220469 m!1125343))

(assert (=> b!1220469 m!1125553))

(assert (=> b!1220474 m!1125363))

(assert (=> b!1220474 m!1125363))

(assert (=> b!1220474 m!1125365))

(assert (=> b!1220471 m!1125543))

(declare-fun m!1125561 () Bool)

(assert (=> b!1220464 m!1125561))

(assert (=> b!1220287 d!134133))

(declare-fun d!134135 () Bool)

(assert (=> d!134135 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1220286 d!134135))

(declare-fun b!1220483 () Bool)

(declare-fun e!693064 () Bool)

(declare-fun call!60741 () Bool)

(assert (=> b!1220483 (= e!693064 call!60741)))

(declare-fun b!1220485 () Bool)

(declare-fun e!693066 () Bool)

(assert (=> b!1220485 (= e!693066 call!60741)))

(declare-fun b!1220486 () Bool)

(assert (=> b!1220486 (= e!693064 e!693066)))

(declare-fun lt!554773 () (_ BitVec 64))

(assert (=> b!1220486 (= lt!554773 (select (arr!38006 lt!554665) #b00000000000000000000000000000000))))

(declare-fun lt!554772 () Unit!40374)

(assert (=> b!1220486 (= lt!554772 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!554665 lt!554773 #b00000000000000000000000000000000))))

(assert (=> b!1220486 (arrayContainsKey!0 lt!554665 lt!554773 #b00000000000000000000000000000000)))

(declare-fun lt!554771 () Unit!40374)

(assert (=> b!1220486 (= lt!554771 lt!554772)))

(declare-fun res!810258 () Bool)

(declare-datatypes ((SeekEntryResult!9902 0))(
  ( (MissingZero!9902 (index!41979 (_ BitVec 32))) (Found!9902 (index!41980 (_ BitVec 32))) (Intermediate!9902 (undefined!10714 Bool) (index!41981 (_ BitVec 32)) (x!107372 (_ BitVec 32))) (Undefined!9902) (MissingVacant!9902 (index!41982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78761 (_ BitVec 32)) SeekEntryResult!9902)

(assert (=> b!1220486 (= res!810258 (= (seekEntryOrOpen!0 (select (arr!38006 lt!554665) #b00000000000000000000000000000000) lt!554665 mask!1564) (Found!9902 #b00000000000000000000000000000000)))))

(assert (=> b!1220486 (=> (not res!810258) (not e!693066))))

(declare-fun bm!60738 () Bool)

(assert (=> bm!60738 (= call!60741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!554665 mask!1564))))

(declare-fun d!134137 () Bool)

(declare-fun res!810257 () Bool)

(declare-fun e!693065 () Bool)

(assert (=> d!134137 (=> res!810257 e!693065)))

(assert (=> d!134137 (= res!810257 (bvsge #b00000000000000000000000000000000 (size!38543 lt!554665)))))

(assert (=> d!134137 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554665 mask!1564) e!693065)))

(declare-fun b!1220484 () Bool)

(assert (=> b!1220484 (= e!693065 e!693064)))

(declare-fun c!120582 () Bool)

(assert (=> b!1220484 (= c!120582 (validKeyInArray!0 (select (arr!38006 lt!554665) #b00000000000000000000000000000000)))))

(assert (= (and d!134137 (not res!810257)) b!1220484))

(assert (= (and b!1220484 c!120582) b!1220486))

(assert (= (and b!1220484 (not c!120582)) b!1220483))

(assert (= (and b!1220486 res!810258) b!1220485))

(assert (= (or b!1220485 b!1220483) bm!60738))

(assert (=> b!1220486 m!1125505))

(declare-fun m!1125563 () Bool)

(assert (=> b!1220486 m!1125563))

(declare-fun m!1125565 () Bool)

(assert (=> b!1220486 m!1125565))

(assert (=> b!1220486 m!1125505))

(declare-fun m!1125567 () Bool)

(assert (=> b!1220486 m!1125567))

(declare-fun m!1125569 () Bool)

(assert (=> bm!60738 m!1125569))

(assert (=> b!1220484 m!1125505))

(assert (=> b!1220484 m!1125505))

(assert (=> b!1220484 m!1125507))

(assert (=> b!1220281 d!134137))

(declare-fun d!134139 () Bool)

(declare-fun e!693069 () Bool)

(assert (=> d!134139 e!693069))

(declare-fun res!810264 () Bool)

(assert (=> d!134139 (=> (not res!810264) (not e!693069))))

(declare-fun lt!554784 () ListLongMap!17987)

(assert (=> d!134139 (= res!810264 (contains!7050 lt!554784 (_1!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670)))))))

(declare-fun lt!554782 () List!26820)

(assert (=> d!134139 (= lt!554784 (ListLongMap!17988 lt!554782))))

(declare-fun lt!554783 () Unit!40374)

(declare-fun lt!554785 () Unit!40374)

(assert (=> d!134139 (= lt!554783 lt!554785)))

(declare-datatypes ((Option!691 0))(
  ( (Some!690 (v!18198 V!46425)) (None!689) )
))
(declare-fun getValueByKey!640 (List!26820 (_ BitVec 64)) Option!691)

(assert (=> d!134139 (= (getValueByKey!640 lt!554782 (_1!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670)))) (Some!690 (_2!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!322 (List!26820 (_ BitVec 64) V!46425) Unit!40374)

(assert (=> d!134139 (= lt!554785 (lemmaContainsTupThenGetReturnValue!322 lt!554782 (_1!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670))) (_2!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670)))))))

(declare-fun insertStrictlySorted!415 (List!26820 (_ BitVec 64) V!46425) List!26820)

(assert (=> d!134139 (= lt!554782 (insertStrictlySorted!415 (toList!9009 lt!554667) (_1!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670))) (_2!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670)))))))

(assert (=> d!134139 (= (+!4119 lt!554667 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670))) lt!554784)))

(declare-fun b!1220491 () Bool)

(declare-fun res!810263 () Bool)

(assert (=> b!1220491 (=> (not res!810263) (not e!693069))))

(assert (=> b!1220491 (= res!810263 (= (getValueByKey!640 (toList!9009 lt!554784) (_1!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670)))) (Some!690 (_2!10016 (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670))))))))

(declare-fun b!1220492 () Bool)

(declare-fun contains!7051 (List!26820 tuple2!20010) Bool)

(assert (=> b!1220492 (= e!693069 (contains!7051 (toList!9009 lt!554784) (tuple2!20011 (select (arr!38006 _keys!1208) from!1455) (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670))))))

(assert (= (and d!134139 res!810264) b!1220491))

(assert (= (and b!1220491 res!810263) b!1220492))

(declare-fun m!1125571 () Bool)

(assert (=> d!134139 m!1125571))

(declare-fun m!1125573 () Bool)

(assert (=> d!134139 m!1125573))

(declare-fun m!1125575 () Bool)

(assert (=> d!134139 m!1125575))

(declare-fun m!1125577 () Bool)

(assert (=> d!134139 m!1125577))

(declare-fun m!1125579 () Bool)

(assert (=> b!1220491 m!1125579))

(declare-fun m!1125581 () Bool)

(assert (=> b!1220492 m!1125581))

(assert (=> b!1220290 d!134139))

(declare-fun d!134141 () Bool)

(declare-fun c!120585 () Bool)

(assert (=> d!134141 (= c!120585 ((_ is ValueCellFull!14777) (select (arr!38007 _values!996) from!1455)))))

(declare-fun e!693072 () V!46425)

(assert (=> d!134141 (= (get!19419 (select (arr!38007 _values!996) from!1455) lt!554670) e!693072)))

(declare-fun b!1220497 () Bool)

(declare-fun get!19421 (ValueCell!14777 V!46425) V!46425)

(assert (=> b!1220497 (= e!693072 (get!19421 (select (arr!38007 _values!996) from!1455) lt!554670))))

(declare-fun b!1220498 () Bool)

(declare-fun get!19422 (ValueCell!14777 V!46425) V!46425)

(assert (=> b!1220498 (= e!693072 (get!19422 (select (arr!38007 _values!996) from!1455) lt!554670))))

(assert (= (and d!134141 c!120585) b!1220497))

(assert (= (and d!134141 (not c!120585)) b!1220498))

(assert (=> b!1220497 m!1125379))

(declare-fun m!1125583 () Bool)

(assert (=> b!1220497 m!1125583))

(assert (=> b!1220498 m!1125379))

(declare-fun m!1125585 () Bool)

(assert (=> b!1220498 m!1125585))

(assert (=> b!1220290 d!134141))

(declare-fun d!134143 () Bool)

(assert (=> d!134143 (= (validKeyInArray!0 (select (arr!38006 _keys!1208) from!1455)) (and (not (= (select (arr!38006 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38006 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1220280 d!134143))

(declare-fun b!1220505 () Bool)

(declare-fun e!693077 () Bool)

(declare-fun call!60746 () ListLongMap!17987)

(declare-fun call!60747 () ListLongMap!17987)

(assert (=> b!1220505 (= e!693077 (= call!60746 call!60747))))

(assert (=> b!1220505 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38544 _values!996)))))

(declare-fun bm!60744 () Bool)

(assert (=> bm!60744 (= call!60746 (getCurrentListMapNoExtraKeys!5466 (array!78762 (store (arr!38006 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38543 _keys!1208)) (array!78764 (store (arr!38007 _values!996) i!673 (ValueCellFull!14777 (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38544 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220506 () Bool)

(declare-fun e!693078 () Bool)

(assert (=> b!1220506 (= e!693078 e!693077)))

(declare-fun c!120588 () Bool)

(assert (=> b!1220506 (= c!120588 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1220507 () Bool)

(assert (=> b!1220507 (= e!693077 (= call!60746 (-!1897 call!60747 k0!934)))))

(assert (=> b!1220507 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38544 _values!996)))))

(declare-fun d!134145 () Bool)

(assert (=> d!134145 e!693078))

(declare-fun res!810267 () Bool)

(assert (=> d!134145 (=> (not res!810267) (not e!693078))))

(assert (=> d!134145 (= res!810267 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38543 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38543 _keys!1208))))))))

(declare-fun lt!554788 () Unit!40374)

(declare-fun choose!1829 (array!78761 array!78763 (_ BitVec 32) (_ BitVec 32) V!46425 V!46425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40374)

(assert (=> d!134145 (= lt!554788 (choose!1829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 _keys!1208)))))

(assert (=> d!134145 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1112 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554788)))

(declare-fun bm!60743 () Bool)

(assert (=> bm!60743 (= call!60747 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!134145 res!810267) b!1220506))

(assert (= (and b!1220506 c!120588) b!1220507))

(assert (= (and b!1220506 (not c!120588)) b!1220505))

(assert (= (or b!1220507 b!1220505) bm!60743))

(assert (= (or b!1220507 b!1220505) bm!60744))

(declare-fun b_lambda!22069 () Bool)

(assert (=> (not b_lambda!22069) (not bm!60744)))

(assert (=> bm!60744 t!40060))

(declare-fun b_and!43731 () Bool)

(assert (= b_and!43729 (and (=> t!40060 result!22733) b_and!43731)))

(assert (=> bm!60744 m!1125373))

(assert (=> bm!60744 m!1125343))

(declare-fun m!1125587 () Bool)

(assert (=> bm!60744 m!1125587))

(declare-fun m!1125589 () Bool)

(assert (=> bm!60744 m!1125589))

(declare-fun m!1125591 () Bool)

(assert (=> b!1220507 m!1125591))

(declare-fun m!1125593 () Bool)

(assert (=> d!134145 m!1125593))

(assert (=> bm!60743 m!1125361))

(assert (=> b!1220280 d!134145))

(declare-fun b!1220508 () Bool)

(declare-fun e!693085 () ListLongMap!17987)

(assert (=> b!1220508 (= e!693085 (ListLongMap!17988 Nil!26817))))

(declare-fun b!1220509 () Bool)

(declare-fun e!693083 () Bool)

(declare-fun lt!554795 () ListLongMap!17987)

(assert (=> b!1220509 (= e!693083 (isEmpty!1001 lt!554795))))

(declare-fun b!1220510 () Bool)

(declare-fun e!693079 () ListLongMap!17987)

(assert (=> b!1220510 (= e!693085 e!693079)))

(declare-fun c!120591 () Bool)

(assert (=> b!1220510 (= c!120591 (validKeyInArray!0 (select (arr!38006 lt!554665) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1220511 () Bool)

(declare-fun e!693082 () Bool)

(declare-fun e!693081 () Bool)

(assert (=> b!1220511 (= e!693082 e!693081)))

(declare-fun c!120592 () Bool)

(declare-fun e!693084 () Bool)

(assert (=> b!1220511 (= c!120592 e!693084)))

(declare-fun res!810268 () Bool)

(assert (=> b!1220511 (=> (not res!810268) (not e!693084))))

(assert (=> b!1220511 (= res!810268 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 lt!554665)))))

(declare-fun b!1220512 () Bool)

(assert (=> b!1220512 (= e!693081 e!693083)))

(declare-fun c!120589 () Bool)

(assert (=> b!1220512 (= c!120589 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 lt!554665)))))

(declare-fun b!1220513 () Bool)

(declare-fun res!810269 () Bool)

(assert (=> b!1220513 (=> (not res!810269) (not e!693082))))

(assert (=> b!1220513 (= res!810269 (not (contains!7050 lt!554795 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220514 () Bool)

(assert (=> b!1220514 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 lt!554665)))))

(assert (=> b!1220514 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38544 lt!554663)))))

(declare-fun e!693080 () Bool)

(assert (=> b!1220514 (= e!693080 (= (apply!982 lt!554795 (select (arr!38006 lt!554665) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19419 (select (arr!38007 lt!554663) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!60748 () ListLongMap!17987)

(declare-fun bm!60745 () Bool)

(assert (=> bm!60745 (= call!60748 (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!134147 () Bool)

(assert (=> d!134147 e!693082))

(declare-fun res!810271 () Bool)

(assert (=> d!134147 (=> (not res!810271) (not e!693082))))

(assert (=> d!134147 (= res!810271 (not (contains!7050 lt!554795 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134147 (= lt!554795 e!693085)))

(declare-fun c!120590 () Bool)

(assert (=> d!134147 (= c!120590 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 lt!554665)))))

(assert (=> d!134147 (validMask!0 mask!1564)))

(assert (=> d!134147 (= (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554795)))

(declare-fun b!1220515 () Bool)

(assert (=> b!1220515 (= e!693081 e!693080)))

(assert (=> b!1220515 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 lt!554665)))))

(declare-fun res!810270 () Bool)

(assert (=> b!1220515 (= res!810270 (contains!7050 lt!554795 (select (arr!38006 lt!554665) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220515 (=> (not res!810270) (not e!693080))))

(declare-fun b!1220516 () Bool)

(assert (=> b!1220516 (= e!693083 (= lt!554795 (getCurrentListMapNoExtraKeys!5466 lt!554665 lt!554663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220517 () Bool)

(declare-fun lt!554794 () Unit!40374)

(declare-fun lt!554793 () Unit!40374)

(assert (=> b!1220517 (= lt!554794 lt!554793)))

(declare-fun lt!554792 () (_ BitVec 64))

(declare-fun lt!554789 () ListLongMap!17987)

(declare-fun lt!554791 () (_ BitVec 64))

(declare-fun lt!554790 () V!46425)

(assert (=> b!1220517 (not (contains!7050 (+!4119 lt!554789 (tuple2!20011 lt!554792 lt!554790)) lt!554791))))

(assert (=> b!1220517 (= lt!554793 (addStillNotContains!303 lt!554789 lt!554792 lt!554790 lt!554791))))

(assert (=> b!1220517 (= lt!554791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220517 (= lt!554790 (get!19419 (select (arr!38007 lt!554663) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220517 (= lt!554792 (select (arr!38006 lt!554665) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220517 (= lt!554789 call!60748)))

(assert (=> b!1220517 (= e!693079 (+!4119 call!60748 (tuple2!20011 (select (arr!38006 lt!554665) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19419 (select (arr!38007 lt!554663) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220518 () Bool)

(assert (=> b!1220518 (= e!693079 call!60748)))

(declare-fun b!1220519 () Bool)

(assert (=> b!1220519 (= e!693084 (validKeyInArray!0 (select (arr!38006 lt!554665) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220519 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!134147 c!120590) b!1220508))

(assert (= (and d!134147 (not c!120590)) b!1220510))

(assert (= (and b!1220510 c!120591) b!1220517))

(assert (= (and b!1220510 (not c!120591)) b!1220518))

(assert (= (or b!1220517 b!1220518) bm!60745))

(assert (= (and d!134147 res!810271) b!1220513))

(assert (= (and b!1220513 res!810269) b!1220511))

(assert (= (and b!1220511 res!810268) b!1220519))

(assert (= (and b!1220511 c!120592) b!1220515))

(assert (= (and b!1220511 (not c!120592)) b!1220512))

(assert (= (and b!1220515 res!810270) b!1220514))

(assert (= (and b!1220512 c!120589) b!1220516))

(assert (= (and b!1220512 (not c!120589)) b!1220509))

(declare-fun b_lambda!22071 () Bool)

(assert (=> (not b_lambda!22071) (not b!1220514)))

(assert (=> b!1220514 t!40060))

(declare-fun b_and!43733 () Bool)

(assert (= b_and!43731 (and (=> t!40060 result!22733) b_and!43733)))

(declare-fun b_lambda!22073 () Bool)

(assert (=> (not b_lambda!22073) (not b!1220517)))

(assert (=> b!1220517 t!40060))

(declare-fun b_and!43735 () Bool)

(assert (= b_and!43733 (and (=> t!40060 result!22733) b_and!43735)))

(declare-fun m!1125595 () Bool)

(assert (=> b!1220515 m!1125595))

(assert (=> b!1220515 m!1125595))

(declare-fun m!1125597 () Bool)

(assert (=> b!1220515 m!1125597))

(declare-fun m!1125599 () Bool)

(assert (=> bm!60745 m!1125599))

(declare-fun m!1125601 () Bool)

(assert (=> b!1220517 m!1125601))

(assert (=> b!1220517 m!1125343))

(declare-fun m!1125603 () Bool)

(assert (=> b!1220517 m!1125603))

(assert (=> b!1220517 m!1125595))

(declare-fun m!1125605 () Bool)

(assert (=> b!1220517 m!1125605))

(declare-fun m!1125607 () Bool)

(assert (=> b!1220517 m!1125607))

(assert (=> b!1220517 m!1125607))

(declare-fun m!1125609 () Bool)

(assert (=> b!1220517 m!1125609))

(assert (=> b!1220517 m!1125603))

(assert (=> b!1220517 m!1125343))

(declare-fun m!1125611 () Bool)

(assert (=> b!1220517 m!1125611))

(declare-fun m!1125613 () Bool)

(assert (=> b!1220513 m!1125613))

(declare-fun m!1125615 () Bool)

(assert (=> d!134147 m!1125615))

(assert (=> d!134147 m!1125337))

(assert (=> b!1220510 m!1125595))

(assert (=> b!1220510 m!1125595))

(declare-fun m!1125617 () Bool)

(assert (=> b!1220510 m!1125617))

(assert (=> b!1220514 m!1125343))

(assert (=> b!1220514 m!1125603))

(assert (=> b!1220514 m!1125595))

(declare-fun m!1125619 () Bool)

(assert (=> b!1220514 m!1125619))

(assert (=> b!1220514 m!1125595))

(assert (=> b!1220514 m!1125603))

(assert (=> b!1220514 m!1125343))

(assert (=> b!1220514 m!1125611))

(assert (=> b!1220519 m!1125595))

(assert (=> b!1220519 m!1125595))

(assert (=> b!1220519 m!1125617))

(assert (=> b!1220516 m!1125599))

(declare-fun m!1125621 () Bool)

(assert (=> b!1220509 m!1125621))

(assert (=> b!1220280 d!134147))

(declare-fun b!1220520 () Bool)

(declare-fun e!693092 () ListLongMap!17987)

(assert (=> b!1220520 (= e!693092 (ListLongMap!17988 Nil!26817))))

(declare-fun b!1220521 () Bool)

(declare-fun e!693090 () Bool)

(declare-fun lt!554802 () ListLongMap!17987)

(assert (=> b!1220521 (= e!693090 (isEmpty!1001 lt!554802))))

(declare-fun b!1220522 () Bool)

(declare-fun e!693086 () ListLongMap!17987)

(assert (=> b!1220522 (= e!693092 e!693086)))

(declare-fun c!120595 () Bool)

(assert (=> b!1220522 (= c!120595 (validKeyInArray!0 (select (arr!38006 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1220523 () Bool)

(declare-fun e!693089 () Bool)

(declare-fun e!693088 () Bool)

(assert (=> b!1220523 (= e!693089 e!693088)))

(declare-fun c!120596 () Bool)

(declare-fun e!693091 () Bool)

(assert (=> b!1220523 (= c!120596 e!693091)))

(declare-fun res!810272 () Bool)

(assert (=> b!1220523 (=> (not res!810272) (not e!693091))))

(assert (=> b!1220523 (= res!810272 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 _keys!1208)))))

(declare-fun b!1220524 () Bool)

(assert (=> b!1220524 (= e!693088 e!693090)))

(declare-fun c!120593 () Bool)

(assert (=> b!1220524 (= c!120593 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 _keys!1208)))))

(declare-fun b!1220525 () Bool)

(declare-fun res!810273 () Bool)

(assert (=> b!1220525 (=> (not res!810273) (not e!693089))))

(assert (=> b!1220525 (= res!810273 (not (contains!7050 lt!554802 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220526 () Bool)

(assert (=> b!1220526 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 _keys!1208)))))

(assert (=> b!1220526 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38544 _values!996)))))

(declare-fun e!693087 () Bool)

(assert (=> b!1220526 (= e!693087 (= (apply!982 lt!554802 (select (arr!38006 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19419 (select (arr!38007 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!60749 () ListLongMap!17987)

(declare-fun bm!60746 () Bool)

(assert (=> bm!60746 (= call!60749 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!134149 () Bool)

(assert (=> d!134149 e!693089))

(declare-fun res!810275 () Bool)

(assert (=> d!134149 (=> (not res!810275) (not e!693089))))

(assert (=> d!134149 (= res!810275 (not (contains!7050 lt!554802 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134149 (= lt!554802 e!693092)))

(declare-fun c!120594 () Bool)

(assert (=> d!134149 (= c!120594 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 _keys!1208)))))

(assert (=> d!134149 (validMask!0 mask!1564)))

(assert (=> d!134149 (= (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554802)))

(declare-fun b!1220527 () Bool)

(assert (=> b!1220527 (= e!693088 e!693087)))

(assert (=> b!1220527 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38543 _keys!1208)))))

(declare-fun res!810274 () Bool)

(assert (=> b!1220527 (= res!810274 (contains!7050 lt!554802 (select (arr!38006 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220527 (=> (not res!810274) (not e!693087))))

(declare-fun b!1220528 () Bool)

(assert (=> b!1220528 (= e!693090 (= lt!554802 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220529 () Bool)

(declare-fun lt!554801 () Unit!40374)

(declare-fun lt!554800 () Unit!40374)

(assert (=> b!1220529 (= lt!554801 lt!554800)))

(declare-fun lt!554796 () ListLongMap!17987)

(declare-fun lt!554797 () V!46425)

(declare-fun lt!554798 () (_ BitVec 64))

(declare-fun lt!554799 () (_ BitVec 64))

(assert (=> b!1220529 (not (contains!7050 (+!4119 lt!554796 (tuple2!20011 lt!554799 lt!554797)) lt!554798))))

(assert (=> b!1220529 (= lt!554800 (addStillNotContains!303 lt!554796 lt!554799 lt!554797 lt!554798))))

(assert (=> b!1220529 (= lt!554798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220529 (= lt!554797 (get!19419 (select (arr!38007 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220529 (= lt!554799 (select (arr!38006 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220529 (= lt!554796 call!60749)))

(assert (=> b!1220529 (= e!693086 (+!4119 call!60749 (tuple2!20011 (select (arr!38006 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19419 (select (arr!38007 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220530 () Bool)

(assert (=> b!1220530 (= e!693086 call!60749)))

(declare-fun b!1220531 () Bool)

(assert (=> b!1220531 (= e!693091 (validKeyInArray!0 (select (arr!38006 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220531 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!134149 c!120594) b!1220520))

(assert (= (and d!134149 (not c!120594)) b!1220522))

(assert (= (and b!1220522 c!120595) b!1220529))

(assert (= (and b!1220522 (not c!120595)) b!1220530))

(assert (= (or b!1220529 b!1220530) bm!60746))

(assert (= (and d!134149 res!810275) b!1220525))

(assert (= (and b!1220525 res!810273) b!1220523))

(assert (= (and b!1220523 res!810272) b!1220531))

(assert (= (and b!1220523 c!120596) b!1220527))

(assert (= (and b!1220523 (not c!120596)) b!1220524))

(assert (= (and b!1220527 res!810274) b!1220526))

(assert (= (and b!1220524 c!120593) b!1220528))

(assert (= (and b!1220524 (not c!120593)) b!1220521))

(declare-fun b_lambda!22075 () Bool)

(assert (=> (not b_lambda!22075) (not b!1220526)))

(assert (=> b!1220526 t!40060))

(declare-fun b_and!43737 () Bool)

(assert (= b_and!43735 (and (=> t!40060 result!22733) b_and!43737)))

(declare-fun b_lambda!22077 () Bool)

(assert (=> (not b_lambda!22077) (not b!1220529)))

(assert (=> b!1220529 t!40060))

(declare-fun b_and!43739 () Bool)

(assert (= b_and!43737 (and (=> t!40060 result!22733) b_and!43739)))

(declare-fun m!1125623 () Bool)

(assert (=> b!1220527 m!1125623))

(assert (=> b!1220527 m!1125623))

(declare-fun m!1125625 () Bool)

(assert (=> b!1220527 m!1125625))

(declare-fun m!1125627 () Bool)

(assert (=> bm!60746 m!1125627))

(declare-fun m!1125629 () Bool)

(assert (=> b!1220529 m!1125629))

(assert (=> b!1220529 m!1125343))

(declare-fun m!1125631 () Bool)

(assert (=> b!1220529 m!1125631))

(assert (=> b!1220529 m!1125623))

(declare-fun m!1125633 () Bool)

(assert (=> b!1220529 m!1125633))

(declare-fun m!1125635 () Bool)

(assert (=> b!1220529 m!1125635))

(assert (=> b!1220529 m!1125635))

(declare-fun m!1125637 () Bool)

(assert (=> b!1220529 m!1125637))

(assert (=> b!1220529 m!1125631))

(assert (=> b!1220529 m!1125343))

(declare-fun m!1125639 () Bool)

(assert (=> b!1220529 m!1125639))

(declare-fun m!1125641 () Bool)

(assert (=> b!1220525 m!1125641))

(declare-fun m!1125643 () Bool)

(assert (=> d!134149 m!1125643))

(assert (=> d!134149 m!1125337))

(assert (=> b!1220522 m!1125623))

(assert (=> b!1220522 m!1125623))

(declare-fun m!1125645 () Bool)

(assert (=> b!1220522 m!1125645))

(assert (=> b!1220526 m!1125343))

(assert (=> b!1220526 m!1125631))

(assert (=> b!1220526 m!1125623))

(declare-fun m!1125647 () Bool)

(assert (=> b!1220526 m!1125647))

(assert (=> b!1220526 m!1125623))

(assert (=> b!1220526 m!1125631))

(assert (=> b!1220526 m!1125343))

(assert (=> b!1220526 m!1125639))

(assert (=> b!1220531 m!1125623))

(assert (=> b!1220531 m!1125623))

(assert (=> b!1220531 m!1125645))

(assert (=> b!1220528 m!1125627))

(declare-fun m!1125649 () Bool)

(assert (=> b!1220521 m!1125649))

(assert (=> b!1220280 d!134149))

(declare-fun d!134151 () Bool)

(declare-fun lt!554805 () ListLongMap!17987)

(assert (=> d!134151 (not (contains!7050 lt!554805 k0!934))))

(declare-fun removeStrictlySorted!105 (List!26820 (_ BitVec 64)) List!26820)

(assert (=> d!134151 (= lt!554805 (ListLongMap!17988 (removeStrictlySorted!105 (toList!9009 lt!554669) k0!934)))))

(assert (=> d!134151 (= (-!1897 lt!554669 k0!934) lt!554805)))

(declare-fun bs!34357 () Bool)

(assert (= bs!34357 d!134151))

(declare-fun m!1125651 () Bool)

(assert (=> bs!34357 m!1125651))

(declare-fun m!1125653 () Bool)

(assert (=> bs!34357 m!1125653))

(assert (=> b!1220280 d!134151))

(declare-fun b!1220532 () Bool)

(declare-fun e!693093 () Bool)

(declare-fun call!60750 () Bool)

(assert (=> b!1220532 (= e!693093 call!60750)))

(declare-fun b!1220534 () Bool)

(declare-fun e!693095 () Bool)

(assert (=> b!1220534 (= e!693095 call!60750)))

(declare-fun b!1220535 () Bool)

(assert (=> b!1220535 (= e!693093 e!693095)))

(declare-fun lt!554808 () (_ BitVec 64))

(assert (=> b!1220535 (= lt!554808 (select (arr!38006 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!554807 () Unit!40374)

(assert (=> b!1220535 (= lt!554807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554808 #b00000000000000000000000000000000))))

(assert (=> b!1220535 (arrayContainsKey!0 _keys!1208 lt!554808 #b00000000000000000000000000000000)))

(declare-fun lt!554806 () Unit!40374)

(assert (=> b!1220535 (= lt!554806 lt!554807)))

(declare-fun res!810277 () Bool)

(assert (=> b!1220535 (= res!810277 (= (seekEntryOrOpen!0 (select (arr!38006 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9902 #b00000000000000000000000000000000)))))

(assert (=> b!1220535 (=> (not res!810277) (not e!693095))))

(declare-fun bm!60747 () Bool)

(assert (=> bm!60747 (= call!60750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!134153 () Bool)

(declare-fun res!810276 () Bool)

(declare-fun e!693094 () Bool)

(assert (=> d!134153 (=> res!810276 e!693094)))

(assert (=> d!134153 (= res!810276 (bvsge #b00000000000000000000000000000000 (size!38543 _keys!1208)))))

(assert (=> d!134153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!693094)))

(declare-fun b!1220533 () Bool)

(assert (=> b!1220533 (= e!693094 e!693093)))

(declare-fun c!120597 () Bool)

(assert (=> b!1220533 (= c!120597 (validKeyInArray!0 (select (arr!38006 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!134153 (not res!810276)) b!1220533))

(assert (= (and b!1220533 c!120597) b!1220535))

(assert (= (and b!1220533 (not c!120597)) b!1220532))

(assert (= (and b!1220535 res!810277) b!1220534))

(assert (= (or b!1220534 b!1220532) bm!60747))

(declare-fun m!1125655 () Bool)

(assert (=> b!1220535 m!1125655))

(declare-fun m!1125657 () Bool)

(assert (=> b!1220535 m!1125657))

(declare-fun m!1125659 () Bool)

(assert (=> b!1220535 m!1125659))

(assert (=> b!1220535 m!1125655))

(declare-fun m!1125661 () Bool)

(assert (=> b!1220535 m!1125661))

(declare-fun m!1125663 () Bool)

(assert (=> bm!60747 m!1125663))

(assert (=> b!1220533 m!1125655))

(assert (=> b!1220533 m!1125655))

(declare-fun m!1125665 () Bool)

(assert (=> b!1220533 m!1125665))

(assert (=> b!1220289 d!134153))

(declare-fun d!134155 () Bool)

(assert (=> d!134155 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1220279 d!134155))

(declare-fun d!134157 () Bool)

(declare-fun res!810282 () Bool)

(declare-fun e!693100 () Bool)

(assert (=> d!134157 (=> res!810282 e!693100)))

(assert (=> d!134157 (= res!810282 (= (select (arr!38006 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!134157 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!693100)))

(declare-fun b!1220540 () Bool)

(declare-fun e!693101 () Bool)

(assert (=> b!1220540 (= e!693100 e!693101)))

(declare-fun res!810283 () Bool)

(assert (=> b!1220540 (=> (not res!810283) (not e!693101))))

(assert (=> b!1220540 (= res!810283 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38543 _keys!1208)))))

(declare-fun b!1220541 () Bool)

(assert (=> b!1220541 (= e!693101 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!134157 (not res!810282)) b!1220540))

(assert (= (and b!1220540 res!810283) b!1220541))

(assert (=> d!134157 m!1125623))

(declare-fun m!1125667 () Bool)

(assert (=> b!1220541 m!1125667))

(assert (=> b!1220282 d!134157))

(declare-fun d!134159 () Bool)

(assert (=> d!134159 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554811 () Unit!40374)

(declare-fun choose!114 (array!78761 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40374)

(assert (=> d!134159 (= lt!554811 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!134159 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134159 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!554811)))

(declare-fun bs!34358 () Bool)

(assert (= bs!34358 d!134159))

(assert (=> bs!34358 m!1125355))

(declare-fun m!1125669 () Bool)

(assert (=> bs!34358 m!1125669))

(assert (=> b!1220282 d!134159))

(declare-fun b!1220542 () Bool)

(declare-fun e!693104 () Bool)

(declare-fun e!693102 () Bool)

(assert (=> b!1220542 (= e!693104 e!693102)))

(declare-fun res!810286 () Bool)

(assert (=> b!1220542 (=> (not res!810286) (not e!693102))))

(declare-fun e!693105 () Bool)

(assert (=> b!1220542 (= res!810286 (not e!693105))))

(declare-fun res!810284 () Bool)

(assert (=> b!1220542 (=> (not res!810284) (not e!693105))))

(assert (=> b!1220542 (= res!810284 (validKeyInArray!0 (select (arr!38006 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1220543 () Bool)

(assert (=> b!1220543 (= e!693105 (contains!7049 Nil!26818 (select (arr!38006 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1220544 () Bool)

(declare-fun e!693103 () Bool)

(declare-fun call!60751 () Bool)

(assert (=> b!1220544 (= e!693103 call!60751)))

(declare-fun d!134161 () Bool)

(declare-fun res!810285 () Bool)

(assert (=> d!134161 (=> res!810285 e!693104)))

(assert (=> d!134161 (= res!810285 (bvsge #b00000000000000000000000000000000 (size!38543 _keys!1208)))))

(assert (=> d!134161 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26818) e!693104)))

(declare-fun bm!60748 () Bool)

(declare-fun c!120598 () Bool)

(assert (=> bm!60748 (= call!60751 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120598 (Cons!26817 (select (arr!38006 _keys!1208) #b00000000000000000000000000000000) Nil!26818) Nil!26818)))))

(declare-fun b!1220545 () Bool)

(assert (=> b!1220545 (= e!693102 e!693103)))

(assert (=> b!1220545 (= c!120598 (validKeyInArray!0 (select (arr!38006 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1220546 () Bool)

(assert (=> b!1220546 (= e!693103 call!60751)))

(assert (= (and d!134161 (not res!810285)) b!1220542))

(assert (= (and b!1220542 res!810284) b!1220543))

(assert (= (and b!1220542 res!810286) b!1220545))

(assert (= (and b!1220545 c!120598) b!1220546))

(assert (= (and b!1220545 (not c!120598)) b!1220544))

(assert (= (or b!1220546 b!1220544) bm!60748))

(assert (=> b!1220542 m!1125655))

(assert (=> b!1220542 m!1125655))

(assert (=> b!1220542 m!1125665))

(assert (=> b!1220543 m!1125655))

(assert (=> b!1220543 m!1125655))

(declare-fun m!1125671 () Bool)

(assert (=> b!1220543 m!1125671))

(assert (=> bm!60748 m!1125655))

(declare-fun m!1125673 () Bool)

(assert (=> bm!60748 m!1125673))

(assert (=> b!1220545 m!1125655))

(assert (=> b!1220545 m!1125655))

(assert (=> b!1220545 m!1125665))

(assert (=> b!1220291 d!134161))

(declare-fun d!134163 () Bool)

(declare-fun res!810287 () Bool)

(declare-fun e!693106 () Bool)

(assert (=> d!134163 (=> res!810287 e!693106)))

(assert (=> d!134163 (= res!810287 (= (select (arr!38006 _keys!1208) i!673) k0!934))))

(assert (=> d!134163 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!693106)))

(declare-fun b!1220547 () Bool)

(declare-fun e!693107 () Bool)

(assert (=> b!1220547 (= e!693106 e!693107)))

(declare-fun res!810288 () Bool)

(assert (=> b!1220547 (=> (not res!810288) (not e!693107))))

(assert (=> b!1220547 (= res!810288 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38543 _keys!1208)))))

(declare-fun b!1220548 () Bool)

(assert (=> b!1220548 (= e!693107 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!134163 (not res!810287)) b!1220547))

(assert (= (and b!1220547 res!810288) b!1220548))

(assert (=> d!134163 m!1125347))

(declare-fun m!1125675 () Bool)

(assert (=> b!1220548 m!1125675))

(assert (=> b!1220285 d!134163))

(declare-fun d!134165 () Bool)

(declare-fun res!810289 () Bool)

(declare-fun e!693108 () Bool)

(assert (=> d!134165 (=> res!810289 e!693108)))

(assert (=> d!134165 (= res!810289 (= (select (arr!38006 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134165 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!693108)))

(declare-fun b!1220549 () Bool)

(declare-fun e!693109 () Bool)

(assert (=> b!1220549 (= e!693108 e!693109)))

(declare-fun res!810290 () Bool)

(assert (=> b!1220549 (=> (not res!810290) (not e!693109))))

(assert (=> b!1220549 (= res!810290 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38543 _keys!1208)))))

(declare-fun b!1220550 () Bool)

(assert (=> b!1220550 (= e!693109 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134165 (not res!810289)) b!1220549))

(assert (= (and b!1220549 res!810290) b!1220550))

(assert (=> d!134165 m!1125655))

(declare-fun m!1125677 () Bool)

(assert (=> b!1220550 m!1125677))

(assert (=> b!1220284 d!134165))

(declare-fun d!134167 () Bool)

(assert (=> d!134167 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554814 () Unit!40374)

(declare-fun choose!13 (array!78761 (_ BitVec 64) (_ BitVec 32)) Unit!40374)

(assert (=> d!134167 (= lt!554814 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134167 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134167 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!554814)))

(declare-fun bs!34359 () Bool)

(assert (= bs!34359 d!134167))

(assert (=> bs!34359 m!1125385))

(declare-fun m!1125679 () Bool)

(assert (=> bs!34359 m!1125679))

(assert (=> b!1220284 d!134167))

(declare-fun mapNonEmpty!48352 () Bool)

(declare-fun mapRes!48352 () Bool)

(declare-fun tp!91853 () Bool)

(declare-fun e!693114 () Bool)

(assert (=> mapNonEmpty!48352 (= mapRes!48352 (and tp!91853 e!693114))))

(declare-fun mapValue!48352 () ValueCell!14777)

(declare-fun mapKey!48352 () (_ BitVec 32))

(declare-fun mapRest!48352 () (Array (_ BitVec 32) ValueCell!14777))

(assert (=> mapNonEmpty!48352 (= mapRest!48343 (store mapRest!48352 mapKey!48352 mapValue!48352))))

(declare-fun mapIsEmpty!48352 () Bool)

(assert (=> mapIsEmpty!48352 mapRes!48352))

(declare-fun b!1220557 () Bool)

(assert (=> b!1220557 (= e!693114 tp_is_empty!30973)))

(declare-fun b!1220558 () Bool)

(declare-fun e!693115 () Bool)

(assert (=> b!1220558 (= e!693115 tp_is_empty!30973)))

(declare-fun condMapEmpty!48352 () Bool)

(declare-fun mapDefault!48352 () ValueCell!14777)

(assert (=> mapNonEmpty!48343 (= condMapEmpty!48352 (= mapRest!48343 ((as const (Array (_ BitVec 32) ValueCell!14777)) mapDefault!48352)))))

(assert (=> mapNonEmpty!48343 (= tp!91838 (and e!693115 mapRes!48352))))

(assert (= (and mapNonEmpty!48343 condMapEmpty!48352) mapIsEmpty!48352))

(assert (= (and mapNonEmpty!48343 (not condMapEmpty!48352)) mapNonEmpty!48352))

(assert (= (and mapNonEmpty!48352 ((_ is ValueCellFull!14777) mapValue!48352)) b!1220557))

(assert (= (and mapNonEmpty!48343 ((_ is ValueCellFull!14777) mapDefault!48352)) b!1220558))

(declare-fun m!1125681 () Bool)

(assert (=> mapNonEmpty!48352 m!1125681))

(declare-fun b_lambda!22079 () Bool)

(assert (= b_lambda!22065 (or (and start!101660 b_free!26269) b_lambda!22079)))

(declare-fun b_lambda!22081 () Bool)

(assert (= b_lambda!22075 (or (and start!101660 b_free!26269) b_lambda!22081)))

(declare-fun b_lambda!22083 () Bool)

(assert (= b_lambda!22063 (or (and start!101660 b_free!26269) b_lambda!22083)))

(declare-fun b_lambda!22085 () Bool)

(assert (= b_lambda!22067 (or (and start!101660 b_free!26269) b_lambda!22085)))

(declare-fun b_lambda!22087 () Bool)

(assert (= b_lambda!22077 (or (and start!101660 b_free!26269) b_lambda!22087)))

(declare-fun b_lambda!22089 () Bool)

(assert (= b_lambda!22069 (or (and start!101660 b_free!26269) b_lambda!22089)))

(declare-fun b_lambda!22091 () Bool)

(assert (= b_lambda!22061 (or (and start!101660 b_free!26269) b_lambda!22091)))

(declare-fun b_lambda!22093 () Bool)

(assert (= b_lambda!22071 (or (and start!101660 b_free!26269) b_lambda!22093)))

(declare-fun b_lambda!22095 () Bool)

(assert (= b_lambda!22073 (or (and start!101660 b_free!26269) b_lambda!22095)))

(check-sat (not b_lambda!22095) (not d!134145) (not d!134151) (not bm!60734) (not b!1220519) (not bm!60735) (not mapNonEmpty!48352) (not b!1220458) (not b!1220550) (not b!1220513) (not b!1220514) (not b!1220468) (not b!1220531) b_and!43739 (not b!1220529) (not b!1220526) (not d!134139) (not b!1220484) (not bm!60743) (not b!1220543) (not b_lambda!22085) tp_is_empty!30973 (not b!1220457) (not b!1220469) (not b_lambda!22079) (not bm!60731) (not d!134133) (not b!1220456) (not b_lambda!22059) (not b!1220491) (not d!134149) (not b!1220492) (not b!1220472) (not b_next!26269) (not b!1220510) (not b!1220497) (not b!1220471) (not b!1220465) (not b!1220453) (not b!1220515) (not b!1220542) (not b!1220517) (not b!1220470) (not b_lambda!22081) (not b_lambda!22087) (not bm!60738) (not b!1220528) (not b!1220522) (not b!1220498) (not b!1220425) (not bm!60744) (not b!1220452) (not b!1220527) (not d!134131) (not b!1220507) (not b!1220525) (not b!1220474) (not b_lambda!22091) (not b!1220533) (not d!134147) (not b!1220464) (not b!1220545) (not b_lambda!22093) (not b!1220509) (not b!1220486) (not bm!60746) (not d!134167) (not bm!60745) (not b_lambda!22083) (not b_lambda!22089) (not bm!60748) (not b!1220423) (not d!134159) (not b!1220548) (not b!1220422) (not b!1220460) (not bm!60747) (not b!1220541) (not b!1220516) (not b!1220535) (not b!1220459) (not b!1220462) (not b!1220521))
(check-sat b_and!43739 (not b_next!26269))
