; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97820 () Bool)

(assert start!97820)

(declare-fun b_free!23521 () Bool)

(declare-fun b_next!23521 () Bool)

(assert (=> start!97820 (= b_free!23521 (not b_next!23521))))

(declare-fun tp!83267 () Bool)

(declare-fun b_and!37825 () Bool)

(assert (=> start!97820 (= tp!83267 b_and!37825)))

(declare-fun b!1119386 () Bool)

(declare-fun res!747716 () Bool)

(declare-fun e!637511 () Bool)

(assert (=> b!1119386 (=> (not res!747716) (not e!637511))))

(declare-datatypes ((array!72987 0))(
  ( (array!72988 (arr!35146 (Array (_ BitVec 32) (_ BitVec 64))) (size!35682 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72987)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1119386 (= res!747716 (= (select (arr!35146 _keys!1208) i!673) k!934))))

(declare-fun b!1119387 () Bool)

(declare-fun res!747721 () Bool)

(assert (=> b!1119387 (=> (not res!747721) (not e!637511))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119387 (= res!747721 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43894 () Bool)

(declare-fun mapRes!43894 () Bool)

(declare-fun tp!83266 () Bool)

(declare-fun e!637506 () Bool)

(assert (=> mapNonEmpty!43894 (= mapRes!43894 (and tp!83266 e!637506))))

(declare-fun mapKey!43894 () (_ BitVec 32))

(declare-datatypes ((V!42529 0))(
  ( (V!42530 (val!14082 Int)) )
))
(declare-datatypes ((ValueCell!13316 0))(
  ( (ValueCellFull!13316 (v!16715 V!42529)) (EmptyCell!13316) )
))
(declare-fun mapRest!43894 () (Array (_ BitVec 32) ValueCell!13316))

(declare-datatypes ((array!72989 0))(
  ( (array!72990 (arr!35147 (Array (_ BitVec 32) ValueCell!13316)) (size!35683 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72989)

(declare-fun mapValue!43894 () ValueCell!13316)

(assert (=> mapNonEmpty!43894 (= (arr!35147 _values!996) (store mapRest!43894 mapKey!43894 mapValue!43894))))

(declare-fun b!1119388 () Bool)

(declare-fun e!637508 () Bool)

(assert (=> b!1119388 (= e!637508 true)))

(declare-fun zeroValue!944 () V!42529)

(declare-datatypes ((tuple2!17666 0))(
  ( (tuple2!17667 (_1!8844 (_ BitVec 64)) (_2!8844 V!42529)) )
))
(declare-datatypes ((List!24450 0))(
  ( (Nil!24447) (Cons!24446 (h!25655 tuple2!17666) (t!34963 List!24450)) )
))
(declare-datatypes ((ListLongMap!15635 0))(
  ( (ListLongMap!15636 (toList!7833 List!24450)) )
))
(declare-fun lt!497741 () ListLongMap!15635)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!497740 () array!72987)

(declare-fun minValue!944 () V!42529)

(declare-fun getCurrentListMapNoExtraKeys!4323 (array!72987 array!72989 (_ BitVec 32) (_ BitVec 32) V!42529 V!42529 (_ BitVec 32) Int) ListLongMap!15635)

(declare-fun dynLambda!2427 (Int (_ BitVec 64)) V!42529)

(assert (=> b!1119388 (= lt!497741 (getCurrentListMapNoExtraKeys!4323 lt!497740 (array!72990 (store (arr!35147 _values!996) i!673 (ValueCellFull!13316 (dynLambda!2427 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35683 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497739 () ListLongMap!15635)

(assert (=> b!1119388 (= lt!497739 (getCurrentListMapNoExtraKeys!4323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119389 () Bool)

(declare-fun res!747711 () Bool)

(assert (=> b!1119389 (=> (not res!747711) (not e!637511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72987 (_ BitVec 32)) Bool)

(assert (=> b!1119389 (= res!747711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119390 () Bool)

(declare-fun res!747718 () Bool)

(assert (=> b!1119390 (=> (not res!747718) (not e!637511))))

(assert (=> b!1119390 (= res!747718 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35682 _keys!1208))))))

(declare-fun b!1119391 () Bool)

(declare-fun res!747714 () Bool)

(assert (=> b!1119391 (=> (not res!747714) (not e!637511))))

(assert (=> b!1119391 (= res!747714 (and (= (size!35683 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35682 _keys!1208) (size!35683 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!747713 () Bool)

(assert (=> start!97820 (=> (not res!747713) (not e!637511))))

(assert (=> start!97820 (= res!747713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35682 _keys!1208))))))

(assert (=> start!97820 e!637511))

(declare-fun tp_is_empty!28051 () Bool)

(assert (=> start!97820 tp_is_empty!28051))

(declare-fun array_inv!27002 (array!72987) Bool)

(assert (=> start!97820 (array_inv!27002 _keys!1208)))

(assert (=> start!97820 true))

(assert (=> start!97820 tp!83267))

(declare-fun e!637510 () Bool)

(declare-fun array_inv!27003 (array!72989) Bool)

(assert (=> start!97820 (and (array_inv!27003 _values!996) e!637510)))

(declare-fun b!1119392 () Bool)

(declare-fun e!637507 () Bool)

(assert (=> b!1119392 (= e!637507 tp_is_empty!28051)))

(declare-fun b!1119393 () Bool)

(declare-fun res!747720 () Bool)

(assert (=> b!1119393 (=> (not res!747720) (not e!637511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119393 (= res!747720 (validKeyInArray!0 k!934))))

(declare-fun b!1119394 () Bool)

(assert (=> b!1119394 (= e!637506 tp_is_empty!28051)))

(declare-fun b!1119395 () Bool)

(declare-fun res!747717 () Bool)

(assert (=> b!1119395 (=> (not res!747717) (not e!637511))))

(declare-datatypes ((List!24451 0))(
  ( (Nil!24448) (Cons!24447 (h!25656 (_ BitVec 64)) (t!34964 List!24451)) )
))
(declare-fun arrayNoDuplicates!0 (array!72987 (_ BitVec 32) List!24451) Bool)

(assert (=> b!1119395 (= res!747717 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24448))))

(declare-fun mapIsEmpty!43894 () Bool)

(assert (=> mapIsEmpty!43894 mapRes!43894))

(declare-fun b!1119396 () Bool)

(declare-fun e!637509 () Bool)

(assert (=> b!1119396 (= e!637511 e!637509)))

(declare-fun res!747715 () Bool)

(assert (=> b!1119396 (=> (not res!747715) (not e!637509))))

(assert (=> b!1119396 (= res!747715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497740 mask!1564))))

(assert (=> b!1119396 (= lt!497740 (array!72988 (store (arr!35146 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35682 _keys!1208)))))

(declare-fun b!1119397 () Bool)

(assert (=> b!1119397 (= e!637509 (not e!637508))))

(declare-fun res!747719 () Bool)

(assert (=> b!1119397 (=> res!747719 e!637508)))

(assert (=> b!1119397 (= res!747719 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119397 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36736 0))(
  ( (Unit!36737) )
))
(declare-fun lt!497738 () Unit!36736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72987 (_ BitVec 64) (_ BitVec 32)) Unit!36736)

(assert (=> b!1119397 (= lt!497738 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1119398 () Bool)

(declare-fun res!747712 () Bool)

(assert (=> b!1119398 (=> (not res!747712) (not e!637509))))

(assert (=> b!1119398 (= res!747712 (arrayNoDuplicates!0 lt!497740 #b00000000000000000000000000000000 Nil!24448))))

(declare-fun b!1119399 () Bool)

(assert (=> b!1119399 (= e!637510 (and e!637507 mapRes!43894))))

(declare-fun condMapEmpty!43894 () Bool)

(declare-fun mapDefault!43894 () ValueCell!13316)

