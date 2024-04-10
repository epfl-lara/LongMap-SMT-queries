; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99302 () Bool)

(assert start!99302)

(declare-fun b_free!24881 () Bool)

(declare-fun b_next!24881 () Bool)

(assert (=> start!99302 (= b_free!24881 (not b_next!24881))))

(declare-fun tp!87357 () Bool)

(declare-fun b_and!40629 () Bool)

(assert (=> start!99302 (= tp!87357 b_and!40629)))

(declare-fun b!1170130 () Bool)

(declare-fun e!665062 () Bool)

(declare-fun e!665058 () Bool)

(assert (=> b!1170130 (= e!665062 e!665058)))

(declare-fun res!776525 () Bool)

(assert (=> b!1170130 (=> res!776525 e!665058)))

(declare-datatypes ((array!75641 0))(
  ( (array!75642 (arr!36470 (Array (_ BitVec 32) (_ BitVec 64))) (size!37006 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75641)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170130 (= res!776525 (not (validKeyInArray!0 (select (arr!36470 _keys!1208) from!1455))))))

(declare-datatypes ((V!44341 0))(
  ( (V!44342 (val!14762 Int)) )
))
(declare-datatypes ((tuple2!18850 0))(
  ( (tuple2!18851 (_1!9436 (_ BitVec 64)) (_2!9436 V!44341)) )
))
(declare-datatypes ((List!25586 0))(
  ( (Nil!25583) (Cons!25582 (h!26791 tuple2!18850) (t!37459 List!25586)) )
))
(declare-datatypes ((ListLongMap!16819 0))(
  ( (ListLongMap!16820 (toList!8425 List!25586)) )
))
(declare-fun lt!526968 () ListLongMap!16819)

(declare-fun lt!526964 () ListLongMap!16819)

(assert (=> b!1170130 (= lt!526968 lt!526964)))

(declare-fun lt!526967 () ListLongMap!16819)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1496 (ListLongMap!16819 (_ BitVec 64)) ListLongMap!16819)

(assert (=> b!1170130 (= lt!526964 (-!1496 lt!526967 k!934))))

(declare-fun zeroValue!944 () V!44341)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13996 0))(
  ( (ValueCellFull!13996 (v!17400 V!44341)) (EmptyCell!13996) )
))
(declare-datatypes ((array!75643 0))(
  ( (array!75644 (arr!36471 (Array (_ BitVec 32) ValueCell!13996)) (size!37007 (_ BitVec 32))) )
))
(declare-fun lt!526969 () array!75643)

(declare-fun lt!526966 () array!75641)

(declare-fun minValue!944 () V!44341)

(declare-fun getCurrentListMapNoExtraKeys!4889 (array!75641 array!75643 (_ BitVec 32) (_ BitVec 32) V!44341 V!44341 (_ BitVec 32) Int) ListLongMap!16819)

(assert (=> b!1170130 (= lt!526968 (getCurrentListMapNoExtraKeys!4889 lt!526966 lt!526969 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75643)

(assert (=> b!1170130 (= lt!526967 (getCurrentListMapNoExtraKeys!4889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38602 0))(
  ( (Unit!38603) )
))
(declare-fun lt!526965 () Unit!38602)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!723 (array!75641 array!75643 (_ BitVec 32) (_ BitVec 32) V!44341 V!44341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38602)

(assert (=> b!1170130 (= lt!526965 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!723 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45944 () Bool)

(declare-fun mapRes!45944 () Bool)

(declare-fun tp!87356 () Bool)

(declare-fun e!665065 () Bool)

(assert (=> mapNonEmpty!45944 (= mapRes!45944 (and tp!87356 e!665065))))

(declare-fun mapKey!45944 () (_ BitVec 32))

(declare-fun mapValue!45944 () ValueCell!13996)

(declare-fun mapRest!45944 () (Array (_ BitVec 32) ValueCell!13996))

(assert (=> mapNonEmpty!45944 (= (arr!36471 _values!996) (store mapRest!45944 mapKey!45944 mapValue!45944))))

(declare-fun b!1170131 () Bool)

(declare-fun res!776533 () Bool)

(declare-fun e!665059 () Bool)

(assert (=> b!1170131 (=> (not res!776533) (not e!665059))))

(declare-datatypes ((List!25587 0))(
  ( (Nil!25584) (Cons!25583 (h!26792 (_ BitVec 64)) (t!37460 List!25587)) )
))
(declare-fun arrayNoDuplicates!0 (array!75641 (_ BitVec 32) List!25587) Bool)

(assert (=> b!1170131 (= res!776533 (arrayNoDuplicates!0 lt!526966 #b00000000000000000000000000000000 Nil!25584))))

(declare-fun b!1170132 () Bool)

(declare-fun res!776536 () Bool)

(declare-fun e!665056 () Bool)

(assert (=> b!1170132 (=> (not res!776536) (not e!665056))))

(assert (=> b!1170132 (= res!776536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25584))))

(declare-fun b!1170133 () Bool)

(declare-fun e!665064 () Bool)

(declare-fun e!665063 () Bool)

(assert (=> b!1170133 (= e!665064 e!665063)))

(declare-fun res!776521 () Bool)

(assert (=> b!1170133 (=> res!776521 e!665063)))

(assert (=> b!1170133 (= res!776521 (not (= (select (arr!36470 _keys!1208) from!1455) k!934)))))

(declare-fun b!1170134 () Bool)

(declare-fun res!776524 () Bool)

(assert (=> b!1170134 (=> (not res!776524) (not e!665056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170134 (= res!776524 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45944 () Bool)

(assert (=> mapIsEmpty!45944 mapRes!45944))

(declare-fun b!1170135 () Bool)

(declare-fun res!776530 () Bool)

(assert (=> b!1170135 (=> (not res!776530) (not e!665056))))

(assert (=> b!1170135 (= res!776530 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37006 _keys!1208))))))

(declare-fun b!1170136 () Bool)

(assert (=> b!1170136 (= e!665056 e!665059)))

(declare-fun res!776522 () Bool)

(assert (=> b!1170136 (=> (not res!776522) (not e!665059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75641 (_ BitVec 32)) Bool)

(assert (=> b!1170136 (= res!776522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526966 mask!1564))))

(assert (=> b!1170136 (= lt!526966 (array!75642 (store (arr!36470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37006 _keys!1208)))))

(declare-fun b!1170137 () Bool)

(declare-fun res!776523 () Bool)

(assert (=> b!1170137 (=> (not res!776523) (not e!665056))))

(assert (=> b!1170137 (= res!776523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170138 () Bool)

(declare-fun res!776527 () Bool)

(assert (=> b!1170138 (=> (not res!776527) (not e!665056))))

(assert (=> b!1170138 (= res!776527 (and (= (size!37007 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37006 _keys!1208) (size!37007 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170139 () Bool)

(declare-fun e!665055 () Bool)

(declare-fun tp_is_empty!29411 () Bool)

(assert (=> b!1170139 (= e!665055 tp_is_empty!29411)))

(declare-fun res!776531 () Bool)

(assert (=> start!99302 (=> (not res!776531) (not e!665056))))

(assert (=> start!99302 (= res!776531 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37006 _keys!1208))))))

(assert (=> start!99302 e!665056))

(assert (=> start!99302 tp_is_empty!29411))

(declare-fun array_inv!27876 (array!75641) Bool)

(assert (=> start!99302 (array_inv!27876 _keys!1208)))

(assert (=> start!99302 true))

(assert (=> start!99302 tp!87357))

(declare-fun e!665057 () Bool)

(declare-fun array_inv!27877 (array!75643) Bool)

(assert (=> start!99302 (and (array_inv!27877 _values!996) e!665057)))

(declare-fun b!1170140 () Bool)

(assert (=> b!1170140 (= e!665065 tp_is_empty!29411)))

(declare-fun b!1170141 () Bool)

(declare-fun e!665054 () Bool)

(assert (=> b!1170141 (= e!665059 (not e!665054))))

(declare-fun res!776526 () Bool)

(assert (=> b!1170141 (=> res!776526 e!665054)))

(assert (=> b!1170141 (= res!776526 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170141 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!526961 () Unit!38602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75641 (_ BitVec 64) (_ BitVec 32)) Unit!38602)

(assert (=> b!1170141 (= lt!526961 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170142 () Bool)

(declare-fun res!776534 () Bool)

(assert (=> b!1170142 (=> (not res!776534) (not e!665056))))

(assert (=> b!1170142 (= res!776534 (= (select (arr!36470 _keys!1208) i!673) k!934))))

(declare-fun b!1170143 () Bool)

(assert (=> b!1170143 (= e!665054 e!665062)))

(declare-fun res!776528 () Bool)

(assert (=> b!1170143 (=> res!776528 e!665062)))

(assert (=> b!1170143 (= res!776528 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526971 () ListLongMap!16819)

(assert (=> b!1170143 (= lt!526971 (getCurrentListMapNoExtraKeys!4889 lt!526966 lt!526969 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526970 () V!44341)

(assert (=> b!1170143 (= lt!526969 (array!75644 (store (arr!36471 _values!996) i!673 (ValueCellFull!13996 lt!526970)) (size!37007 _values!996)))))

(declare-fun dynLambda!2866 (Int (_ BitVec 64)) V!44341)

(assert (=> b!1170143 (= lt!526970 (dynLambda!2866 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526962 () ListLongMap!16819)

(assert (=> b!1170143 (= lt!526962 (getCurrentListMapNoExtraKeys!4889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170144 () Bool)

(declare-fun e!665061 () Bool)

(assert (=> b!1170144 (= e!665058 e!665061)))

(declare-fun res!776532 () Bool)

(assert (=> b!1170144 (=> res!776532 e!665061)))

(assert (=> b!1170144 (= res!776532 (not (= (select (arr!36470 _keys!1208) from!1455) k!934)))))

(assert (=> b!1170144 e!665064))

(declare-fun res!776535 () Bool)

(assert (=> b!1170144 (=> (not res!776535) (not e!665064))))

(declare-fun +!3754 (ListLongMap!16819 tuple2!18850) ListLongMap!16819)

(declare-fun get!18594 (ValueCell!13996 V!44341) V!44341)

(assert (=> b!1170144 (= res!776535 (= lt!526971 (+!3754 lt!526964 (tuple2!18851 (select (arr!36470 _keys!1208) from!1455) (get!18594 (select (arr!36471 _values!996) from!1455) lt!526970)))))))

(declare-fun b!1170145 () Bool)

(assert (=> b!1170145 (= e!665063 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170146 () Bool)

(assert (=> b!1170146 (= e!665057 (and e!665055 mapRes!45944))))

(declare-fun condMapEmpty!45944 () Bool)

(declare-fun mapDefault!45944 () ValueCell!13996)

