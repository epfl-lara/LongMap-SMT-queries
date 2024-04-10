; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99200 () Bool)

(assert start!99200)

(declare-fun b_free!24805 () Bool)

(declare-fun b_next!24805 () Bool)

(assert (=> start!99200 (= b_free!24805 (not b_next!24805))))

(declare-fun tp!87126 () Bool)

(declare-fun b_and!40459 () Bool)

(assert (=> start!99200 (= tp!87126 b_and!40459)))

(declare-fun mapNonEmpty!45827 () Bool)

(declare-fun mapRes!45827 () Bool)

(declare-fun tp!87125 () Bool)

(declare-fun e!663821 () Bool)

(assert (=> mapNonEmpty!45827 (= mapRes!45827 (and tp!87125 e!663821))))

(declare-fun mapKey!45827 () (_ BitVec 32))

(declare-datatypes ((V!44241 0))(
  ( (V!44242 (val!14724 Int)) )
))
(declare-datatypes ((ValueCell!13958 0))(
  ( (ValueCellFull!13958 (v!17361 V!44241)) (EmptyCell!13958) )
))
(declare-fun mapRest!45827 () (Array (_ BitVec 32) ValueCell!13958))

(declare-fun mapValue!45827 () ValueCell!13958)

(declare-datatypes ((array!75493 0))(
  ( (array!75494 (arr!36397 (Array (_ BitVec 32) ValueCell!13958)) (size!36933 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75493)

(assert (=> mapNonEmpty!45827 (= (arr!36397 _values!996) (store mapRest!45827 mapKey!45827 mapValue!45827))))

(declare-fun b!1167971 () Bool)

(declare-fun e!663820 () Bool)

(assert (=> b!1167971 (= e!663820 true)))

(declare-fun zeroValue!944 () V!44241)

(declare-datatypes ((array!75495 0))(
  ( (array!75496 (arr!36398 (Array (_ BitVec 32) (_ BitVec 64))) (size!36934 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75495)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525840 () array!75495)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!525842 () array!75493)

(declare-fun minValue!944 () V!44241)

(declare-datatypes ((tuple2!18786 0))(
  ( (tuple2!18787 (_1!9404 (_ BitVec 64)) (_2!9404 V!44241)) )
))
(declare-datatypes ((List!25526 0))(
  ( (Nil!25523) (Cons!25522 (h!26731 tuple2!18786) (t!37323 List!25526)) )
))
(declare-datatypes ((ListLongMap!16755 0))(
  ( (ListLongMap!16756 (toList!8393 List!25526)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4857 (array!75495 array!75493 (_ BitVec 32) (_ BitVec 32) V!44241 V!44241 (_ BitVec 32) Int) ListLongMap!16755)

(declare-fun -!1468 (ListLongMap!16755 (_ BitVec 64)) ListLongMap!16755)

(assert (=> b!1167971 (= (getCurrentListMapNoExtraKeys!4857 lt!525840 lt!525842 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1468 (getCurrentListMapNoExtraKeys!4857 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38538 0))(
  ( (Unit!38539) )
))
(declare-fun lt!525843 () Unit!38538)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!695 (array!75495 array!75493 (_ BitVec 32) (_ BitVec 32) V!44241 V!44241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38538)

(assert (=> b!1167971 (= lt!525843 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167972 () Bool)

(declare-fun tp_is_empty!29335 () Bool)

(assert (=> b!1167972 (= e!663821 tp_is_empty!29335)))

(declare-fun b!1167973 () Bool)

(declare-fun res!774874 () Bool)

(declare-fun e!663819 () Bool)

(assert (=> b!1167973 (=> (not res!774874) (not e!663819))))

(declare-datatypes ((List!25527 0))(
  ( (Nil!25524) (Cons!25523 (h!26732 (_ BitVec 64)) (t!37324 List!25527)) )
))
(declare-fun arrayNoDuplicates!0 (array!75495 (_ BitVec 32) List!25527) Bool)

(assert (=> b!1167973 (= res!774874 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25524))))

(declare-fun b!1167974 () Bool)

(declare-fun res!774872 () Bool)

(assert (=> b!1167974 (=> (not res!774872) (not e!663819))))

(assert (=> b!1167974 (= res!774872 (and (= (size!36933 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36934 _keys!1208) (size!36933 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167975 () Bool)

(declare-fun e!663823 () Bool)

(assert (=> b!1167975 (= e!663823 e!663820)))

(declare-fun res!774875 () Bool)

(assert (=> b!1167975 (=> res!774875 e!663820)))

(assert (=> b!1167975 (= res!774875 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525838 () ListLongMap!16755)

(assert (=> b!1167975 (= lt!525838 (getCurrentListMapNoExtraKeys!4857 lt!525840 lt!525842 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2838 (Int (_ BitVec 64)) V!44241)

(assert (=> b!1167975 (= lt!525842 (array!75494 (store (arr!36397 _values!996) i!673 (ValueCellFull!13958 (dynLambda!2838 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36933 _values!996)))))

(declare-fun lt!525841 () ListLongMap!16755)

(assert (=> b!1167975 (= lt!525841 (getCurrentListMapNoExtraKeys!4857 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167976 () Bool)

(declare-fun res!774873 () Bool)

(assert (=> b!1167976 (=> (not res!774873) (not e!663819))))

(assert (=> b!1167976 (= res!774873 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36934 _keys!1208))))))

(declare-fun res!774870 () Bool)

(assert (=> start!99200 (=> (not res!774870) (not e!663819))))

(assert (=> start!99200 (= res!774870 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36934 _keys!1208))))))

(assert (=> start!99200 e!663819))

(assert (=> start!99200 tp_is_empty!29335))

(declare-fun array_inv!27822 (array!75495) Bool)

(assert (=> start!99200 (array_inv!27822 _keys!1208)))

(assert (=> start!99200 true))

(assert (=> start!99200 tp!87126))

(declare-fun e!663818 () Bool)

(declare-fun array_inv!27823 (array!75493) Bool)

(assert (=> start!99200 (and (array_inv!27823 _values!996) e!663818)))

(declare-fun b!1167977 () Bool)

(declare-fun res!774866 () Bool)

(declare-fun e!663825 () Bool)

(assert (=> b!1167977 (=> (not res!774866) (not e!663825))))

(assert (=> b!1167977 (= res!774866 (arrayNoDuplicates!0 lt!525840 #b00000000000000000000000000000000 Nil!25524))))

(declare-fun b!1167978 () Bool)

(declare-fun e!663822 () Bool)

(assert (=> b!1167978 (= e!663822 tp_is_empty!29335)))

(declare-fun b!1167979 () Bool)

(assert (=> b!1167979 (= e!663818 (and e!663822 mapRes!45827))))

(declare-fun condMapEmpty!45827 () Bool)

(declare-fun mapDefault!45827 () ValueCell!13958)

