; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99332 () Bool)

(assert start!99332)

(declare-fun b_free!24911 () Bool)

(declare-fun b_next!24911 () Bool)

(assert (=> start!99332 (= b_free!24911 (not b_next!24911))))

(declare-fun tp!87446 () Bool)

(declare-fun b_and!40689 () Bool)

(assert (=> start!99332 (= tp!87446 b_and!40689)))

(declare-fun b!1171039 () Bool)

(declare-fun e!665612 () Bool)

(declare-fun tp_is_empty!29441 () Bool)

(assert (=> b!1171039 (= e!665612 tp_is_empty!29441)))

(declare-fun mapIsEmpty!45989 () Bool)

(declare-fun mapRes!45989 () Bool)

(assert (=> mapIsEmpty!45989 mapRes!45989))

(declare-fun b!1171040 () Bool)

(declare-fun res!777275 () Bool)

(declare-fun e!665604 () Bool)

(assert (=> b!1171040 (=> (not res!777275) (not e!665604))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171040 (= res!777275 (validMask!0 mask!1564))))

(declare-fun b!1171041 () Bool)

(declare-fun res!777267 () Bool)

(assert (=> b!1171041 (=> (not res!777267) (not e!665604))))

(declare-datatypes ((array!75701 0))(
  ( (array!75702 (arr!36500 (Array (_ BitVec 32) (_ BitVec 64))) (size!37036 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75701)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75701 (_ BitVec 32)) Bool)

(assert (=> b!1171041 (= res!777267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171042 () Bool)

(declare-fun e!665606 () Bool)

(assert (=> b!1171042 (= e!665606 true)))

(declare-fun lt!527480 () Bool)

(declare-datatypes ((List!25610 0))(
  ( (Nil!25607) (Cons!25606 (h!26815 (_ BitVec 64)) (t!37513 List!25610)) )
))
(declare-fun contains!6843 (List!25610 (_ BitVec 64)) Bool)

(assert (=> b!1171042 (= lt!527480 (contains!6843 Nil!25607 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171043 () Bool)

(declare-fun e!665608 () Bool)

(declare-fun e!665609 () Bool)

(assert (=> b!1171043 (= e!665608 e!665609)))

(declare-fun res!777270 () Bool)

(assert (=> b!1171043 (=> res!777270 e!665609)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171043 (= res!777270 (not (validKeyInArray!0 (select (arr!36500 _keys!1208) from!1455))))))

(declare-datatypes ((V!44381 0))(
  ( (V!44382 (val!14777 Int)) )
))
(declare-datatypes ((tuple2!18874 0))(
  ( (tuple2!18875 (_1!9448 (_ BitVec 64)) (_2!9448 V!44381)) )
))
(declare-datatypes ((List!25611 0))(
  ( (Nil!25608) (Cons!25607 (h!26816 tuple2!18874) (t!37514 List!25611)) )
))
(declare-datatypes ((ListLongMap!16843 0))(
  ( (ListLongMap!16844 (toList!8437 List!25611)) )
))
(declare-fun lt!527482 () ListLongMap!16843)

(declare-fun lt!527479 () ListLongMap!16843)

(assert (=> b!1171043 (= lt!527482 lt!527479)))

(declare-fun lt!527472 () ListLongMap!16843)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1507 (ListLongMap!16843 (_ BitVec 64)) ListLongMap!16843)

(assert (=> b!1171043 (= lt!527479 (-!1507 lt!527472 k!934))))

(declare-fun zeroValue!944 () V!44381)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14011 0))(
  ( (ValueCellFull!14011 (v!17415 V!44381)) (EmptyCell!14011) )
))
(declare-datatypes ((array!75703 0))(
  ( (array!75704 (arr!36501 (Array (_ BitVec 32) ValueCell!14011)) (size!37037 (_ BitVec 32))) )
))
(declare-fun lt!527473 () array!75703)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527481 () array!75701)

(declare-fun minValue!944 () V!44381)

(declare-fun getCurrentListMapNoExtraKeys!4901 (array!75701 array!75703 (_ BitVec 32) (_ BitVec 32) V!44381 V!44381 (_ BitVec 32) Int) ListLongMap!16843)

(assert (=> b!1171043 (= lt!527482 (getCurrentListMapNoExtraKeys!4901 lt!527481 lt!527473 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75703)

(assert (=> b!1171043 (= lt!527472 (getCurrentListMapNoExtraKeys!4901 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38628 0))(
  ( (Unit!38629) )
))
(declare-fun lt!527476 () Unit!38628)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!734 (array!75701 array!75703 (_ BitVec 32) (_ BitVec 32) V!44381 V!44381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38628)

(assert (=> b!1171043 (= lt!527476 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!734 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171044 () Bool)

(declare-fun res!777281 () Bool)

(assert (=> b!1171044 (=> (not res!777281) (not e!665604))))

(assert (=> b!1171044 (= res!777281 (= (select (arr!36500 _keys!1208) i!673) k!934))))

(declare-fun b!1171045 () Bool)

(declare-fun res!777276 () Bool)

(declare-fun e!665603 () Bool)

(assert (=> b!1171045 (=> (not res!777276) (not e!665603))))

(declare-fun arrayNoDuplicates!0 (array!75701 (_ BitVec 32) List!25610) Bool)

(assert (=> b!1171045 (= res!777276 (arrayNoDuplicates!0 lt!527481 #b00000000000000000000000000000000 Nil!25607))))

(declare-fun b!1171046 () Bool)

(declare-fun res!777280 () Bool)

(assert (=> b!1171046 (=> (not res!777280) (not e!665604))))

(assert (=> b!1171046 (= res!777280 (validKeyInArray!0 k!934))))

(declare-fun b!1171047 () Bool)

(declare-fun res!777271 () Bool)

(assert (=> b!1171047 (=> (not res!777271) (not e!665604))))

(assert (=> b!1171047 (= res!777271 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25607))))

(declare-fun b!1171048 () Bool)

(declare-fun e!665602 () Bool)

(assert (=> b!1171048 (= e!665602 (and e!665612 mapRes!45989))))

(declare-fun condMapEmpty!45989 () Bool)

(declare-fun mapDefault!45989 () ValueCell!14011)

