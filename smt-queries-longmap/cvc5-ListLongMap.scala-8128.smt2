; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99634 () Bool)

(assert start!99634)

(declare-fun b_free!25213 () Bool)

(declare-fun b_next!25213 () Bool)

(assert (=> start!99634 (= b_free!25213 (not b_next!25213))))

(declare-fun tp!88353 () Bool)

(declare-fun b_and!41293 () Bool)

(assert (=> start!99634 (= tp!88353 b_and!41293)))

(declare-fun b!1180821 () Bool)

(declare-fun e!671332 () Bool)

(declare-fun e!671333 () Bool)

(assert (=> b!1180821 (= e!671332 e!671333)))

(declare-fun res!784642 () Bool)

(assert (=> b!1180821 (=> res!784642 e!671333)))

(declare-datatypes ((array!76289 0))(
  ( (array!76290 (arr!36794 (Array (_ BitVec 32) (_ BitVec 64))) (size!37330 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76289)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1180821 (= res!784642 (not (= (select (arr!36794 _keys!1208) from!1455) k!934)))))

(declare-fun b!1180822 () Bool)

(declare-fun e!671329 () Bool)

(declare-fun e!671340 () Bool)

(assert (=> b!1180822 (= e!671329 e!671340)))

(declare-fun res!784636 () Bool)

(assert (=> b!1180822 (=> res!784636 e!671340)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180822 (= res!784636 (not (validKeyInArray!0 (select (arr!36794 _keys!1208) from!1455))))))

(declare-datatypes ((V!44785 0))(
  ( (V!44786 (val!14928 Int)) )
))
(declare-datatypes ((tuple2!19118 0))(
  ( (tuple2!19119 (_1!9570 (_ BitVec 64)) (_2!9570 V!44785)) )
))
(declare-datatypes ((List!25858 0))(
  ( (Nil!25855) (Cons!25854 (h!27063 tuple2!19118) (t!38063 List!25858)) )
))
(declare-datatypes ((ListLongMap!17087 0))(
  ( (ListLongMap!17088 (toList!8559 List!25858)) )
))
(declare-fun lt!533960 () ListLongMap!17087)

(declare-fun lt!533959 () ListLongMap!17087)

(assert (=> b!1180822 (= lt!533960 lt!533959)))

(declare-fun lt!533961 () ListLongMap!17087)

(declare-fun -!1600 (ListLongMap!17087 (_ BitVec 64)) ListLongMap!17087)

(assert (=> b!1180822 (= lt!533959 (-!1600 lt!533961 k!934))))

(declare-fun zeroValue!944 () V!44785)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14162 0))(
  ( (ValueCellFull!14162 (v!17566 V!44785)) (EmptyCell!14162) )
))
(declare-datatypes ((array!76291 0))(
  ( (array!76292 (arr!36795 (Array (_ BitVec 32) ValueCell!14162)) (size!37331 (_ BitVec 32))) )
))
(declare-fun lt!533972 () array!76291)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533971 () array!76289)

(declare-fun minValue!944 () V!44785)

(declare-fun getCurrentListMapNoExtraKeys!5013 (array!76289 array!76291 (_ BitVec 32) (_ BitVec 32) V!44785 V!44785 (_ BitVec 32) Int) ListLongMap!17087)

(assert (=> b!1180822 (= lt!533960 (getCurrentListMapNoExtraKeys!5013 lt!533971 lt!533972 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76291)

(assert (=> b!1180822 (= lt!533961 (getCurrentListMapNoExtraKeys!5013 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39041 0))(
  ( (Unit!39042) )
))
(declare-fun lt!533966 () Unit!39041)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!827 (array!76289 array!76291 (_ BitVec 32) (_ BitVec 32) V!44785 V!44785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39041)

(assert (=> b!1180822 (= lt!533966 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180823 () Bool)

(declare-fun res!784639 () Bool)

(declare-fun e!671331 () Bool)

(assert (=> b!1180823 (=> (not res!784639) (not e!671331))))

(assert (=> b!1180823 (= res!784639 (validKeyInArray!0 k!934))))

(declare-fun b!1180824 () Bool)

(declare-fun res!784633 () Bool)

(assert (=> b!1180824 (=> (not res!784633) (not e!671331))))

(declare-datatypes ((List!25859 0))(
  ( (Nil!25856) (Cons!25855 (h!27064 (_ BitVec 64)) (t!38064 List!25859)) )
))
(declare-fun arrayNoDuplicates!0 (array!76289 (_ BitVec 32) List!25859) Bool)

(assert (=> b!1180824 (= res!784633 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25856))))

(declare-fun res!784629 () Bool)

(assert (=> start!99634 (=> (not res!784629) (not e!671331))))

(assert (=> start!99634 (= res!784629 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37330 _keys!1208))))))

(assert (=> start!99634 e!671331))

(declare-fun tp_is_empty!29743 () Bool)

(assert (=> start!99634 tp_is_empty!29743))

(declare-fun array_inv!28094 (array!76289) Bool)

(assert (=> start!99634 (array_inv!28094 _keys!1208)))

(assert (=> start!99634 true))

(assert (=> start!99634 tp!88353))

(declare-fun e!671330 () Bool)

(declare-fun array_inv!28095 (array!76291) Bool)

(assert (=> start!99634 (and (array_inv!28095 _values!996) e!671330)))

(declare-fun b!1180825 () Bool)

(declare-fun e!671338 () Bool)

(assert (=> b!1180825 (= e!671338 tp_is_empty!29743)))

(declare-fun mapNonEmpty!46442 () Bool)

(declare-fun mapRes!46442 () Bool)

(declare-fun tp!88352 () Bool)

(declare-fun e!671334 () Bool)

(assert (=> mapNonEmpty!46442 (= mapRes!46442 (and tp!88352 e!671334))))

(declare-fun mapKey!46442 () (_ BitVec 32))

(declare-fun mapValue!46442 () ValueCell!14162)

(declare-fun mapRest!46442 () (Array (_ BitVec 32) ValueCell!14162))

(assert (=> mapNonEmpty!46442 (= (arr!36795 _values!996) (store mapRest!46442 mapKey!46442 mapValue!46442))))

(declare-fun b!1180826 () Bool)

(declare-fun e!671339 () Unit!39041)

(declare-fun Unit!39043 () Unit!39041)

(assert (=> b!1180826 (= e!671339 Unit!39043)))

(declare-fun lt!533970 () Unit!39041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39041)

(assert (=> b!1180826 (= lt!533970 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180826 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533969 () Unit!39041)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76289 (_ BitVec 32) (_ BitVec 32)) Unit!39041)

(assert (=> b!1180826 (= lt!533969 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180826 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25856)))

(declare-fun lt!533973 () Unit!39041)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76289 (_ BitVec 64) (_ BitVec 32) List!25859) Unit!39041)

(assert (=> b!1180826 (= lt!533973 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25856))))

(assert (=> b!1180826 false))

(declare-fun b!1180827 () Bool)

(declare-fun e!671335 () Bool)

(assert (=> b!1180827 (= e!671335 e!671329)))

(declare-fun res!784634 () Bool)

(assert (=> b!1180827 (=> res!784634 e!671329)))

(assert (=> b!1180827 (= res!784634 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!533962 () ListLongMap!17087)

(assert (=> b!1180827 (= lt!533962 (getCurrentListMapNoExtraKeys!5013 lt!533971 lt!533972 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533963 () V!44785)

(assert (=> b!1180827 (= lt!533972 (array!76292 (store (arr!36795 _values!996) i!673 (ValueCellFull!14162 lt!533963)) (size!37331 _values!996)))))

(declare-fun dynLambda!2970 (Int (_ BitVec 64)) V!44785)

(assert (=> b!1180827 (= lt!533963 (dynLambda!2970 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533964 () ListLongMap!17087)

(assert (=> b!1180827 (= lt!533964 (getCurrentListMapNoExtraKeys!5013 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180828 () Bool)

(declare-fun res!784640 () Bool)

(declare-fun e!671336 () Bool)

(assert (=> b!1180828 (=> (not res!784640) (not e!671336))))

(assert (=> b!1180828 (= res!784640 (arrayNoDuplicates!0 lt!533971 #b00000000000000000000000000000000 Nil!25856))))

(declare-fun b!1180829 () Bool)

(assert (=> b!1180829 (= e!671333 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1180830 () Bool)

(declare-fun res!784632 () Bool)

(declare-fun e!671337 () Bool)

(assert (=> b!1180830 (=> (not res!784632) (not e!671337))))

(declare-fun lt!533967 () tuple2!19118)

(declare-fun +!3868 (ListLongMap!17087 tuple2!19118) ListLongMap!17087)

(assert (=> b!1180830 (= res!784632 (= lt!533964 (+!3868 lt!533961 lt!533967)))))

(declare-fun b!1180831 () Bool)

(assert (=> b!1180831 (= e!671330 (and e!671338 mapRes!46442))))

(declare-fun condMapEmpty!46442 () Bool)

(declare-fun mapDefault!46442 () ValueCell!14162)

