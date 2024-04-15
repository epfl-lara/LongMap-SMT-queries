; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99370 () Bool)

(assert start!99370)

(declare-fun b_free!24955 () Bool)

(declare-fun b_next!24955 () Bool)

(assert (=> start!99370 (= b_free!24955 (not b_next!24955))))

(declare-fun tp!87578 () Bool)

(declare-fun b_and!40755 () Bool)

(assert (=> start!99370 (= tp!87578 b_and!40755)))

(declare-fun mapNonEmpty!46055 () Bool)

(declare-fun mapRes!46055 () Bool)

(declare-fun tp!87579 () Bool)

(declare-fun e!666389 () Bool)

(assert (=> mapNonEmpty!46055 (= mapRes!46055 (and tp!87579 e!666389))))

(declare-fun mapKey!46055 () (_ BitVec 32))

(declare-datatypes ((V!44441 0))(
  ( (V!44442 (val!14799 Int)) )
))
(declare-datatypes ((ValueCell!14033 0))(
  ( (ValueCellFull!14033 (v!17436 V!44441)) (EmptyCell!14033) )
))
(declare-fun mapRest!46055 () (Array (_ BitVec 32) ValueCell!14033))

(declare-datatypes ((array!75712 0))(
  ( (array!75713 (arr!36506 (Array (_ BitVec 32) ValueCell!14033)) (size!37044 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75712)

(declare-fun mapValue!46055 () ValueCell!14033)

(assert (=> mapNonEmpty!46055 (= (arr!36506 _values!996) (store mapRest!46055 mapKey!46055 mapValue!46055))))

(declare-fun b!1172411 () Bool)

(declare-fun e!666390 () Bool)

(assert (=> b!1172411 (= e!666390 true)))

(declare-fun lt!528143 () Bool)

(declare-datatypes ((List!25714 0))(
  ( (Nil!25711) (Cons!25710 (h!26919 (_ BitVec 64)) (t!37652 List!25714)) )
))
(declare-fun contains!6838 (List!25714 (_ BitVec 64)) Bool)

(assert (=> b!1172411 (= lt!528143 (contains!6838 Nil!25711 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172412 () Bool)

(declare-fun res!778458 () Bool)

(declare-fun e!666387 () Bool)

(assert (=> b!1172412 (=> (not res!778458) (not e!666387))))

(declare-datatypes ((array!75714 0))(
  ( (array!75715 (arr!36507 (Array (_ BitVec 32) (_ BitVec 64))) (size!37045 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75714)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75714 (_ BitVec 32)) Bool)

(assert (=> b!1172412 (= res!778458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172413 () Bool)

(declare-fun res!778459 () Bool)

(assert (=> b!1172413 (=> (not res!778459) (not e!666387))))

(declare-fun arrayNoDuplicates!0 (array!75714 (_ BitVec 32) List!25714) Bool)

(assert (=> b!1172413 (= res!778459 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25711))))

(declare-fun b!1172414 () Bool)

(declare-fun e!666391 () Bool)

(declare-fun e!666385 () Bool)

(assert (=> b!1172414 (= e!666391 e!666385)))

(declare-fun res!778469 () Bool)

(assert (=> b!1172414 (=> res!778469 e!666385)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172414 (= res!778469 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528146 () array!75714)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44441)

(declare-fun lt!528138 () array!75712)

(declare-datatypes ((tuple2!18998 0))(
  ( (tuple2!18999 (_1!9510 (_ BitVec 64)) (_2!9510 V!44441)) )
))
(declare-datatypes ((List!25715 0))(
  ( (Nil!25712) (Cons!25711 (h!26920 tuple2!18998) (t!37653 List!25715)) )
))
(declare-datatypes ((ListLongMap!16967 0))(
  ( (ListLongMap!16968 (toList!8499 List!25715)) )
))
(declare-fun lt!528141 () ListLongMap!16967)

(declare-fun getCurrentListMapNoExtraKeys!4973 (array!75714 array!75712 (_ BitVec 32) (_ BitVec 32) V!44441 V!44441 (_ BitVec 32) Int) ListLongMap!16967)

(assert (=> b!1172414 (= lt!528141 (getCurrentListMapNoExtraKeys!4973 lt!528146 lt!528138 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528148 () V!44441)

(assert (=> b!1172414 (= lt!528138 (array!75713 (store (arr!36506 _values!996) i!673 (ValueCellFull!14033 lt!528148)) (size!37044 _values!996)))))

(declare-fun dynLambda!2898 (Int (_ BitVec 64)) V!44441)

(assert (=> b!1172414 (= lt!528148 (dynLambda!2898 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528149 () ListLongMap!16967)

(assert (=> b!1172414 (= lt!528149 (getCurrentListMapNoExtraKeys!4973 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172415 () Bool)

(declare-fun tp_is_empty!29485 () Bool)

(assert (=> b!1172415 (= e!666389 tp_is_empty!29485)))

(declare-fun b!1172416 () Bool)

(declare-fun e!666384 () Bool)

(assert (=> b!1172416 (= e!666385 e!666384)))

(declare-fun res!778454 () Bool)

(assert (=> b!1172416 (=> res!778454 e!666384)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172416 (= res!778454 (not (validKeyInArray!0 (select (arr!36507 _keys!1208) from!1455))))))

(declare-fun lt!528144 () ListLongMap!16967)

(declare-fun lt!528147 () ListLongMap!16967)

(assert (=> b!1172416 (= lt!528144 lt!528147)))

(declare-fun lt!528150 () ListLongMap!16967)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1490 (ListLongMap!16967 (_ BitVec 64)) ListLongMap!16967)

(assert (=> b!1172416 (= lt!528147 (-!1490 lt!528150 k0!934))))

(assert (=> b!1172416 (= lt!528144 (getCurrentListMapNoExtraKeys!4973 lt!528146 lt!528138 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172416 (= lt!528150 (getCurrentListMapNoExtraKeys!4973 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38481 0))(
  ( (Unit!38482) )
))
(declare-fun lt!528142 () Unit!38481)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!754 (array!75714 array!75712 (_ BitVec 32) (_ BitVec 32) V!44441 V!44441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38481)

(assert (=> b!1172416 (= lt!528142 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!754 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172417 () Bool)

(declare-fun res!778462 () Bool)

(assert (=> b!1172417 (=> res!778462 e!666390)))

(assert (=> b!1172417 (= res!778462 (contains!6838 Nil!25711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172418 () Bool)

(declare-fun e!666383 () Bool)

(declare-fun e!666388 () Bool)

(assert (=> b!1172418 (= e!666383 e!666388)))

(declare-fun res!778468 () Bool)

(assert (=> b!1172418 (=> res!778468 e!666388)))

(assert (=> b!1172418 (= res!778468 (not (= (select (arr!36507 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172419 () Bool)

(declare-fun res!778461 () Bool)

(assert (=> b!1172419 (=> (not res!778461) (not e!666387))))

(assert (=> b!1172419 (= res!778461 (and (= (size!37044 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37045 _keys!1208) (size!37044 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172420 () Bool)

(declare-fun res!778453 () Bool)

(assert (=> b!1172420 (=> (not res!778453) (not e!666387))))

(assert (=> b!1172420 (= res!778453 (= (select (arr!36507 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46055 () Bool)

(assert (=> mapIsEmpty!46055 mapRes!46055))

(declare-fun res!778466 () Bool)

(assert (=> start!99370 (=> (not res!778466) (not e!666387))))

(assert (=> start!99370 (= res!778466 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37045 _keys!1208))))))

(assert (=> start!99370 e!666387))

(assert (=> start!99370 tp_is_empty!29485))

(declare-fun array_inv!27998 (array!75714) Bool)

(assert (=> start!99370 (array_inv!27998 _keys!1208)))

(assert (=> start!99370 true))

(assert (=> start!99370 tp!87578))

(declare-fun e!666392 () Bool)

(declare-fun array_inv!27999 (array!75712) Bool)

(assert (=> start!99370 (and (array_inv!27999 _values!996) e!666392)))

(declare-fun b!1172421 () Bool)

(declare-fun res!778465 () Bool)

(declare-fun e!666393 () Bool)

(assert (=> b!1172421 (=> (not res!778465) (not e!666393))))

(assert (=> b!1172421 (= res!778465 (arrayNoDuplicates!0 lt!528146 #b00000000000000000000000000000000 Nil!25711))))

(declare-fun b!1172422 () Bool)

(assert (=> b!1172422 (= e!666387 e!666393)))

(declare-fun res!778457 () Bool)

(assert (=> b!1172422 (=> (not res!778457) (not e!666393))))

(assert (=> b!1172422 (= res!778457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528146 mask!1564))))

(assert (=> b!1172422 (= lt!528146 (array!75715 (store (arr!36507 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37045 _keys!1208)))))

(declare-fun b!1172423 () Bool)

(declare-fun e!666382 () Bool)

(assert (=> b!1172423 (= e!666382 e!666390)))

(declare-fun res!778456 () Bool)

(assert (=> b!1172423 (=> res!778456 e!666390)))

(assert (=> b!1172423 (= res!778456 (or (bvsge (size!37045 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37045 _keys!1208)) (bvsge from!1455 (size!37045 _keys!1208))))))

(assert (=> b!1172423 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25711)))

(declare-fun lt!528140 () Unit!38481)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75714 (_ BitVec 32) (_ BitVec 32)) Unit!38481)

(assert (=> b!1172423 (= lt!528140 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172423 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528139 () Unit!38481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75714 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38481)

(assert (=> b!1172423 (= lt!528139 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172424 () Bool)

(declare-fun e!666386 () Bool)

(assert (=> b!1172424 (= e!666392 (and e!666386 mapRes!46055))))

(declare-fun condMapEmpty!46055 () Bool)

(declare-fun mapDefault!46055 () ValueCell!14033)

(assert (=> b!1172424 (= condMapEmpty!46055 (= (arr!36506 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14033)) mapDefault!46055)))))

(declare-fun b!1172425 () Bool)

(declare-fun res!778471 () Bool)

(assert (=> b!1172425 (=> (not res!778471) (not e!666387))))

(assert (=> b!1172425 (= res!778471 (validKeyInArray!0 k0!934))))

(declare-fun b!1172426 () Bool)

(assert (=> b!1172426 (= e!666393 (not e!666391))))

(declare-fun res!778455 () Bool)

(assert (=> b!1172426 (=> res!778455 e!666391)))

(assert (=> b!1172426 (= res!778455 (bvsgt from!1455 i!673))))

(assert (=> b!1172426 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528145 () Unit!38481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75714 (_ BitVec 64) (_ BitVec 32)) Unit!38481)

(assert (=> b!1172426 (= lt!528145 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172427 () Bool)

(declare-fun res!778460 () Bool)

(assert (=> b!1172427 (=> (not res!778460) (not e!666387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172427 (= res!778460 (validMask!0 mask!1564))))

(declare-fun b!1172428 () Bool)

(assert (=> b!1172428 (= e!666388 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172429 () Bool)

(declare-fun res!778470 () Bool)

(assert (=> b!1172429 (=> res!778470 e!666390)))

(declare-fun noDuplicate!1635 (List!25714) Bool)

(assert (=> b!1172429 (= res!778470 (not (noDuplicate!1635 Nil!25711)))))

(declare-fun b!1172430 () Bool)

(assert (=> b!1172430 (= e!666386 tp_is_empty!29485)))

(declare-fun b!1172431 () Bool)

(assert (=> b!1172431 (= e!666384 e!666382)))

(declare-fun res!778467 () Bool)

(assert (=> b!1172431 (=> res!778467 e!666382)))

(assert (=> b!1172431 (= res!778467 (not (= (select (arr!36507 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1172431 e!666383))

(declare-fun res!778464 () Bool)

(assert (=> b!1172431 (=> (not res!778464) (not e!666383))))

(declare-fun +!3815 (ListLongMap!16967 tuple2!18998) ListLongMap!16967)

(declare-fun get!18633 (ValueCell!14033 V!44441) V!44441)

(assert (=> b!1172431 (= res!778464 (= lt!528141 (+!3815 lt!528147 (tuple2!18999 (select (arr!36507 _keys!1208) from!1455) (get!18633 (select (arr!36506 _values!996) from!1455) lt!528148)))))))

(declare-fun b!1172432 () Bool)

(declare-fun res!778463 () Bool)

(assert (=> b!1172432 (=> (not res!778463) (not e!666387))))

(assert (=> b!1172432 (= res!778463 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37045 _keys!1208))))))

(assert (= (and start!99370 res!778466) b!1172427))

(assert (= (and b!1172427 res!778460) b!1172419))

(assert (= (and b!1172419 res!778461) b!1172412))

(assert (= (and b!1172412 res!778458) b!1172413))

(assert (= (and b!1172413 res!778459) b!1172432))

(assert (= (and b!1172432 res!778463) b!1172425))

(assert (= (and b!1172425 res!778471) b!1172420))

(assert (= (and b!1172420 res!778453) b!1172422))

(assert (= (and b!1172422 res!778457) b!1172421))

(assert (= (and b!1172421 res!778465) b!1172426))

(assert (= (and b!1172426 (not res!778455)) b!1172414))

(assert (= (and b!1172414 (not res!778469)) b!1172416))

(assert (= (and b!1172416 (not res!778454)) b!1172431))

(assert (= (and b!1172431 res!778464) b!1172418))

(assert (= (and b!1172418 (not res!778468)) b!1172428))

(assert (= (and b!1172431 (not res!778467)) b!1172423))

(assert (= (and b!1172423 (not res!778456)) b!1172429))

(assert (= (and b!1172429 (not res!778470)) b!1172417))

(assert (= (and b!1172417 (not res!778462)) b!1172411))

(assert (= (and b!1172424 condMapEmpty!46055) mapIsEmpty!46055))

(assert (= (and b!1172424 (not condMapEmpty!46055)) mapNonEmpty!46055))

(get-info :version)

(assert (= (and mapNonEmpty!46055 ((_ is ValueCellFull!14033) mapValue!46055)) b!1172415))

(assert (= (and b!1172424 ((_ is ValueCellFull!14033) mapDefault!46055)) b!1172430))

(assert (= start!99370 b!1172424))

(declare-fun b_lambda!20081 () Bool)

(assert (=> (not b_lambda!20081) (not b!1172414)))

(declare-fun t!37651 () Bool)

(declare-fun tb!9759 () Bool)

(assert (=> (and start!99370 (= defaultEntry!1004 defaultEntry!1004) t!37651) tb!9759))

(declare-fun result!20093 () Bool)

(assert (=> tb!9759 (= result!20093 tp_is_empty!29485)))

(assert (=> b!1172414 t!37651))

(declare-fun b_and!40757 () Bool)

(assert (= b_and!40755 (and (=> t!37651 result!20093) b_and!40757)))

(declare-fun m!1079741 () Bool)

(assert (=> b!1172431 m!1079741))

(declare-fun m!1079743 () Bool)

(assert (=> b!1172431 m!1079743))

(assert (=> b!1172431 m!1079743))

(declare-fun m!1079745 () Bool)

(assert (=> b!1172431 m!1079745))

(declare-fun m!1079747 () Bool)

(assert (=> b!1172431 m!1079747))

(declare-fun m!1079749 () Bool)

(assert (=> b!1172413 m!1079749))

(declare-fun m!1079751 () Bool)

(assert (=> start!99370 m!1079751))

(declare-fun m!1079753 () Bool)

(assert (=> start!99370 m!1079753))

(declare-fun m!1079755 () Bool)

(assert (=> b!1172428 m!1079755))

(declare-fun m!1079757 () Bool)

(assert (=> b!1172426 m!1079757))

(declare-fun m!1079759 () Bool)

(assert (=> b!1172426 m!1079759))

(declare-fun m!1079761 () Bool)

(assert (=> b!1172411 m!1079761))

(declare-fun m!1079763 () Bool)

(assert (=> b!1172427 m!1079763))

(declare-fun m!1079765 () Bool)

(assert (=> b!1172429 m!1079765))

(declare-fun m!1079767 () Bool)

(assert (=> b!1172421 m!1079767))

(declare-fun m!1079769 () Bool)

(assert (=> b!1172422 m!1079769))

(declare-fun m!1079771 () Bool)

(assert (=> b!1172422 m!1079771))

(declare-fun m!1079773 () Bool)

(assert (=> b!1172416 m!1079773))

(declare-fun m!1079775 () Bool)

(assert (=> b!1172416 m!1079775))

(declare-fun m!1079777 () Bool)

(assert (=> b!1172416 m!1079777))

(assert (=> b!1172416 m!1079741))

(declare-fun m!1079779 () Bool)

(assert (=> b!1172416 m!1079779))

(declare-fun m!1079781 () Bool)

(assert (=> b!1172416 m!1079781))

(assert (=> b!1172416 m!1079741))

(declare-fun m!1079783 () Bool)

(assert (=> b!1172425 m!1079783))

(declare-fun m!1079785 () Bool)

(assert (=> b!1172423 m!1079785))

(declare-fun m!1079787 () Bool)

(assert (=> b!1172423 m!1079787))

(declare-fun m!1079789 () Bool)

(assert (=> b!1172423 m!1079789))

(declare-fun m!1079791 () Bool)

(assert (=> b!1172423 m!1079791))

(declare-fun m!1079793 () Bool)

(assert (=> mapNonEmpty!46055 m!1079793))

(declare-fun m!1079795 () Bool)

(assert (=> b!1172417 m!1079795))

(declare-fun m!1079797 () Bool)

(assert (=> b!1172414 m!1079797))

(declare-fun m!1079799 () Bool)

(assert (=> b!1172414 m!1079799))

(declare-fun m!1079801 () Bool)

(assert (=> b!1172414 m!1079801))

(declare-fun m!1079803 () Bool)

(assert (=> b!1172414 m!1079803))

(declare-fun m!1079805 () Bool)

(assert (=> b!1172412 m!1079805))

(declare-fun m!1079807 () Bool)

(assert (=> b!1172420 m!1079807))

(assert (=> b!1172418 m!1079741))

(check-sat (not b!1172427) (not b!1172414) (not b_lambda!20081) (not b!1172422) (not b!1172425) (not b!1172413) (not b_next!24955) (not start!99370) (not b!1172416) (not mapNonEmpty!46055) (not b!1172417) (not b!1172411) (not b!1172431) (not b!1172423) (not b!1172412) b_and!40757 (not b!1172426) (not b!1172421) (not b!1172429) tp_is_empty!29485 (not b!1172428))
(check-sat b_and!40757 (not b_next!24955))
