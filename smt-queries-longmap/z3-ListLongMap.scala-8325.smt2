; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101326 () Bool)

(assert start!101326)

(declare-fun b_free!26223 () Bool)

(declare-fun b_next!26223 () Bool)

(assert (=> start!101326 (= b_free!26223 (not b_next!26223))))

(declare-fun tp!91694 () Bool)

(declare-fun b_and!43581 () Bool)

(assert (=> start!101326 (= tp!91694 b_and!43581)))

(declare-fun b!1217423 () Bool)

(declare-fun res!808470 () Bool)

(declare-fun e!691171 () Bool)

(assert (=> b!1217423 (=> (not res!808470) (not e!691171))))

(declare-datatypes ((array!78627 0))(
  ( (array!78628 (arr!37947 (Array (_ BitVec 32) (_ BitVec 64))) (size!38483 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78627)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46363 0))(
  ( (V!46364 (val!15520 Int)) )
))
(declare-datatypes ((ValueCell!14754 0))(
  ( (ValueCellFull!14754 (v!18174 V!46363)) (EmptyCell!14754) )
))
(declare-datatypes ((array!78629 0))(
  ( (array!78630 (arr!37948 (Array (_ BitVec 32) ValueCell!14754)) (size!38484 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78629)

(assert (=> b!1217423 (= res!808470 (and (= (size!38484 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38483 _keys!1208) (size!38484 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217424 () Bool)

(declare-fun e!691168 () Bool)

(declare-fun e!691167 () Bool)

(assert (=> b!1217424 (= e!691168 e!691167)))

(declare-fun res!808475 () Bool)

(assert (=> b!1217424 (=> res!808475 e!691167)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217424 (= res!808475 (not (validKeyInArray!0 (select (arr!37947 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19956 0))(
  ( (tuple2!19957 (_1!9989 (_ BitVec 64)) (_2!9989 V!46363)) )
))
(declare-datatypes ((List!26760 0))(
  ( (Nil!26757) (Cons!26756 (h!27965 tuple2!19956) (t!39963 List!26760)) )
))
(declare-datatypes ((ListLongMap!17925 0))(
  ( (ListLongMap!17926 (toList!8978 List!26760)) )
))
(declare-fun lt!553343 () ListLongMap!17925)

(declare-fun lt!553339 () ListLongMap!17925)

(assert (=> b!1217424 (= lt!553343 lt!553339)))

(declare-fun lt!553344 () ListLongMap!17925)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1895 (ListLongMap!17925 (_ BitVec 64)) ListLongMap!17925)

(assert (=> b!1217424 (= lt!553339 (-!1895 lt!553344 k0!934))))

(declare-fun zeroValue!944 () V!46363)

(declare-fun lt!553345 () array!78629)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46363)

(declare-fun lt!553346 () array!78627)

(declare-fun getCurrentListMapNoExtraKeys!5405 (array!78627 array!78629 (_ BitVec 32) (_ BitVec 32) V!46363 V!46363 (_ BitVec 32) Int) ListLongMap!17925)

(assert (=> b!1217424 (= lt!553343 (getCurrentListMapNoExtraKeys!5405 lt!553346 lt!553345 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217424 (= lt!553344 (getCurrentListMapNoExtraKeys!5405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40362 0))(
  ( (Unit!40363) )
))
(declare-fun lt!553338 () Unit!40362)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1102 (array!78627 array!78629 (_ BitVec 32) (_ BitVec 32) V!46363 V!46363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40362)

(assert (=> b!1217424 (= lt!553338 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1102 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217425 () Bool)

(declare-fun e!691169 () Bool)

(assert (=> b!1217425 (= e!691169 e!691168)))

(declare-fun res!808479 () Bool)

(assert (=> b!1217425 (=> res!808479 e!691168)))

(assert (=> b!1217425 (= res!808479 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553347 () ListLongMap!17925)

(assert (=> b!1217425 (= lt!553347 (getCurrentListMapNoExtraKeys!5405 lt!553346 lt!553345 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553341 () V!46363)

(assert (=> b!1217425 (= lt!553345 (array!78630 (store (arr!37948 _values!996) i!673 (ValueCellFull!14754 lt!553341)) (size!38484 _values!996)))))

(declare-fun dynLambda!3291 (Int (_ BitVec 64)) V!46363)

(assert (=> b!1217425 (= lt!553341 (dynLambda!3291 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553342 () ListLongMap!17925)

(assert (=> b!1217425 (= lt!553342 (getCurrentListMapNoExtraKeys!5405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217426 () Bool)

(assert (=> b!1217426 (= e!691167 (bvslt from!1455 (size!38483 _keys!1208)))))

(declare-fun +!4051 (ListLongMap!17925 tuple2!19956) ListLongMap!17925)

(declare-fun get!19334 (ValueCell!14754 V!46363) V!46363)

(assert (=> b!1217426 (= lt!553347 (+!4051 lt!553339 (tuple2!19957 (select (arr!37947 _keys!1208) from!1455) (get!19334 (select (arr!37948 _values!996) from!1455) lt!553341))))))

(declare-fun b!1217427 () Bool)

(declare-fun res!808468 () Bool)

(assert (=> b!1217427 (=> (not res!808468) (not e!691171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78627 (_ BitVec 32)) Bool)

(assert (=> b!1217427 (= res!808468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217428 () Bool)

(declare-fun res!808471 () Bool)

(assert (=> b!1217428 (=> (not res!808471) (not e!691171))))

(declare-datatypes ((List!26761 0))(
  ( (Nil!26758) (Cons!26757 (h!27966 (_ BitVec 64)) (t!39964 List!26761)) )
))
(declare-fun arrayNoDuplicates!0 (array!78627 (_ BitVec 32) List!26761) Bool)

(assert (=> b!1217428 (= res!808471 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26758))))

(declare-fun b!1217429 () Bool)

(declare-fun res!808472 () Bool)

(assert (=> b!1217429 (=> (not res!808472) (not e!691171))))

(assert (=> b!1217429 (= res!808472 (validKeyInArray!0 k0!934))))

(declare-fun b!1217430 () Bool)

(declare-fun e!691172 () Bool)

(declare-fun e!691173 () Bool)

(declare-fun mapRes!48268 () Bool)

(assert (=> b!1217430 (= e!691172 (and e!691173 mapRes!48268))))

(declare-fun condMapEmpty!48268 () Bool)

(declare-fun mapDefault!48268 () ValueCell!14754)

(assert (=> b!1217430 (= condMapEmpty!48268 (= (arr!37948 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14754)) mapDefault!48268)))))

(declare-fun b!1217431 () Bool)

(declare-fun res!808473 () Bool)

(assert (=> b!1217431 (=> (not res!808473) (not e!691171))))

(assert (=> b!1217431 (= res!808473 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38483 _keys!1208))))))

(declare-fun b!1217432 () Bool)

(declare-fun tp_is_empty!30927 () Bool)

(assert (=> b!1217432 (= e!691173 tp_is_empty!30927)))

(declare-fun mapNonEmpty!48268 () Bool)

(declare-fun tp!91693 () Bool)

(declare-fun e!691174 () Bool)

(assert (=> mapNonEmpty!48268 (= mapRes!48268 (and tp!91693 e!691174))))

(declare-fun mapRest!48268 () (Array (_ BitVec 32) ValueCell!14754))

(declare-fun mapValue!48268 () ValueCell!14754)

(declare-fun mapKey!48268 () (_ BitVec 32))

(assert (=> mapNonEmpty!48268 (= (arr!37948 _values!996) (store mapRest!48268 mapKey!48268 mapValue!48268))))

(declare-fun res!808474 () Bool)

(assert (=> start!101326 (=> (not res!808474) (not e!691171))))

(assert (=> start!101326 (= res!808474 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38483 _keys!1208))))))

(assert (=> start!101326 e!691171))

(assert (=> start!101326 tp_is_empty!30927))

(declare-fun array_inv!28886 (array!78627) Bool)

(assert (=> start!101326 (array_inv!28886 _keys!1208)))

(assert (=> start!101326 true))

(assert (=> start!101326 tp!91694))

(declare-fun array_inv!28887 (array!78629) Bool)

(assert (=> start!101326 (and (array_inv!28887 _values!996) e!691172)))

(declare-fun b!1217433 () Bool)

(declare-fun res!808476 () Bool)

(assert (=> b!1217433 (=> (not res!808476) (not e!691171))))

(assert (=> b!1217433 (= res!808476 (= (select (arr!37947 _keys!1208) i!673) k0!934))))

(declare-fun b!1217434 () Bool)

(declare-fun e!691170 () Bool)

(assert (=> b!1217434 (= e!691170 (not e!691169))))

(declare-fun res!808478 () Bool)

(assert (=> b!1217434 (=> res!808478 e!691169)))

(assert (=> b!1217434 (= res!808478 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217434 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553340 () Unit!40362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78627 (_ BitVec 64) (_ BitVec 32)) Unit!40362)

(assert (=> b!1217434 (= lt!553340 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217435 () Bool)

(declare-fun res!808480 () Bool)

(assert (=> b!1217435 (=> (not res!808480) (not e!691171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217435 (= res!808480 (validMask!0 mask!1564))))

(declare-fun b!1217436 () Bool)

(declare-fun res!808477 () Bool)

(assert (=> b!1217436 (=> (not res!808477) (not e!691170))))

(assert (=> b!1217436 (= res!808477 (arrayNoDuplicates!0 lt!553346 #b00000000000000000000000000000000 Nil!26758))))

(declare-fun b!1217437 () Bool)

(assert (=> b!1217437 (= e!691174 tp_is_empty!30927)))

(declare-fun mapIsEmpty!48268 () Bool)

(assert (=> mapIsEmpty!48268 mapRes!48268))

(declare-fun b!1217438 () Bool)

(assert (=> b!1217438 (= e!691171 e!691170)))

(declare-fun res!808469 () Bool)

(assert (=> b!1217438 (=> (not res!808469) (not e!691170))))

(assert (=> b!1217438 (= res!808469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553346 mask!1564))))

(assert (=> b!1217438 (= lt!553346 (array!78628 (store (arr!37947 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38483 _keys!1208)))))

(assert (= (and start!101326 res!808474) b!1217435))

(assert (= (and b!1217435 res!808480) b!1217423))

(assert (= (and b!1217423 res!808470) b!1217427))

(assert (= (and b!1217427 res!808468) b!1217428))

(assert (= (and b!1217428 res!808471) b!1217431))

(assert (= (and b!1217431 res!808473) b!1217429))

(assert (= (and b!1217429 res!808472) b!1217433))

(assert (= (and b!1217433 res!808476) b!1217438))

(assert (= (and b!1217438 res!808469) b!1217436))

(assert (= (and b!1217436 res!808477) b!1217434))

(assert (= (and b!1217434 (not res!808478)) b!1217425))

(assert (= (and b!1217425 (not res!808479)) b!1217424))

(assert (= (and b!1217424 (not res!808475)) b!1217426))

(assert (= (and b!1217430 condMapEmpty!48268) mapIsEmpty!48268))

(assert (= (and b!1217430 (not condMapEmpty!48268)) mapNonEmpty!48268))

(get-info :version)

(assert (= (and mapNonEmpty!48268 ((_ is ValueCellFull!14754) mapValue!48268)) b!1217437))

(assert (= (and b!1217430 ((_ is ValueCellFull!14754) mapDefault!48268)) b!1217432))

(assert (= start!101326 b!1217430))

(declare-fun b_lambda!21937 () Bool)

(assert (=> (not b_lambda!21937) (not b!1217425)))

(declare-fun t!39962 () Bool)

(declare-fun tb!11023 () Bool)

(assert (=> (and start!101326 (= defaultEntry!1004 defaultEntry!1004) t!39962) tb!11023))

(declare-fun result!22645 () Bool)

(assert (=> tb!11023 (= result!22645 tp_is_empty!30927)))

(assert (=> b!1217425 t!39962))

(declare-fun b_and!43583 () Bool)

(assert (= b_and!43581 (and (=> t!39962 result!22645) b_and!43583)))

(declare-fun m!1122155 () Bool)

(assert (=> b!1217435 m!1122155))

(declare-fun m!1122157 () Bool)

(assert (=> b!1217425 m!1122157))

(declare-fun m!1122159 () Bool)

(assert (=> b!1217425 m!1122159))

(declare-fun m!1122161 () Bool)

(assert (=> b!1217425 m!1122161))

(declare-fun m!1122163 () Bool)

(assert (=> b!1217425 m!1122163))

(declare-fun m!1122165 () Bool)

(assert (=> b!1217438 m!1122165))

(declare-fun m!1122167 () Bool)

(assert (=> b!1217438 m!1122167))

(declare-fun m!1122169 () Bool)

(assert (=> b!1217433 m!1122169))

(declare-fun m!1122171 () Bool)

(assert (=> b!1217424 m!1122171))

(declare-fun m!1122173 () Bool)

(assert (=> b!1217424 m!1122173))

(declare-fun m!1122175 () Bool)

(assert (=> b!1217424 m!1122175))

(declare-fun m!1122177 () Bool)

(assert (=> b!1217424 m!1122177))

(declare-fun m!1122179 () Bool)

(assert (=> b!1217424 m!1122179))

(declare-fun m!1122181 () Bool)

(assert (=> b!1217424 m!1122181))

(assert (=> b!1217424 m!1122179))

(declare-fun m!1122183 () Bool)

(assert (=> b!1217429 m!1122183))

(declare-fun m!1122185 () Bool)

(assert (=> mapNonEmpty!48268 m!1122185))

(declare-fun m!1122187 () Bool)

(assert (=> b!1217434 m!1122187))

(declare-fun m!1122189 () Bool)

(assert (=> b!1217434 m!1122189))

(declare-fun m!1122191 () Bool)

(assert (=> b!1217436 m!1122191))

(assert (=> b!1217426 m!1122179))

(declare-fun m!1122193 () Bool)

(assert (=> b!1217426 m!1122193))

(assert (=> b!1217426 m!1122193))

(declare-fun m!1122195 () Bool)

(assert (=> b!1217426 m!1122195))

(declare-fun m!1122197 () Bool)

(assert (=> b!1217426 m!1122197))

(declare-fun m!1122199 () Bool)

(assert (=> start!101326 m!1122199))

(declare-fun m!1122201 () Bool)

(assert (=> start!101326 m!1122201))

(declare-fun m!1122203 () Bool)

(assert (=> b!1217427 m!1122203))

(declare-fun m!1122205 () Bool)

(assert (=> b!1217428 m!1122205))

(check-sat (not b!1217438) (not b!1217426) (not b!1217425) (not b!1217436) (not b_lambda!21937) (not b!1217428) (not b!1217435) tp_is_empty!30927 (not b!1217429) (not start!101326) (not mapNonEmpty!48268) (not b!1217424) b_and!43583 (not b!1217434) (not b_next!26223) (not b!1217427))
(check-sat b_and!43583 (not b_next!26223))
