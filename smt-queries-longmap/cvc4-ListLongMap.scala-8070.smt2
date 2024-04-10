; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99290 () Bool)

(assert start!99290)

(declare-fun b_free!24869 () Bool)

(declare-fun b_next!24869 () Bool)

(assert (=> start!99290 (= b_free!24869 (not b_next!24869))))

(declare-fun tp!87320 () Bool)

(declare-fun b_and!40605 () Bool)

(assert (=> start!99290 (= tp!87320 b_and!40605)))

(declare-fun mapIsEmpty!45926 () Bool)

(declare-fun mapRes!45926 () Bool)

(assert (=> mapIsEmpty!45926 mapRes!45926))

(declare-fun b!1169786 () Bool)

(declare-fun e!664858 () Bool)

(declare-fun e!664857 () Bool)

(assert (=> b!1169786 (= e!664858 e!664857)))

(declare-fun res!776255 () Bool)

(assert (=> b!1169786 (=> res!776255 e!664857)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169786 (= res!776255 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44325 0))(
  ( (V!44326 (val!14756 Int)) )
))
(declare-fun zeroValue!944 () V!44325)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!75621 0))(
  ( (array!75622 (arr!36460 (Array (_ BitVec 32) (_ BitVec 64))) (size!36996 (_ BitVec 32))) )
))
(declare-fun lt!526782 () array!75621)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13990 0))(
  ( (ValueCellFull!13990 (v!17394 V!44325)) (EmptyCell!13990) )
))
(declare-datatypes ((array!75623 0))(
  ( (array!75624 (arr!36461 (Array (_ BitVec 32) ValueCell!13990)) (size!36997 (_ BitVec 32))) )
))
(declare-fun lt!526780 () array!75623)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44325)

(declare-datatypes ((tuple2!18842 0))(
  ( (tuple2!18843 (_1!9432 (_ BitVec 64)) (_2!9432 V!44325)) )
))
(declare-datatypes ((List!25578 0))(
  ( (Nil!25575) (Cons!25574 (h!26783 tuple2!18842) (t!37439 List!25578)) )
))
(declare-datatypes ((ListLongMap!16811 0))(
  ( (ListLongMap!16812 (toList!8421 List!25578)) )
))
(declare-fun lt!526779 () ListLongMap!16811)

(declare-fun getCurrentListMapNoExtraKeys!4885 (array!75621 array!75623 (_ BitVec 32) (_ BitVec 32) V!44325 V!44325 (_ BitVec 32) Int) ListLongMap!16811)

(assert (=> b!1169786 (= lt!526779 (getCurrentListMapNoExtraKeys!4885 lt!526782 lt!526780 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526777 () V!44325)

(declare-fun _values!996 () array!75623)

(assert (=> b!1169786 (= lt!526780 (array!75624 (store (arr!36461 _values!996) i!673 (ValueCellFull!13990 lt!526777)) (size!36997 _values!996)))))

(declare-fun dynLambda!2862 (Int (_ BitVec 64)) V!44325)

(assert (=> b!1169786 (= lt!526777 (dynLambda!2862 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75621)

(declare-fun lt!526778 () ListLongMap!16811)

(assert (=> b!1169786 (= lt!526778 (getCurrentListMapNoExtraKeys!4885 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169787 () Bool)

(declare-fun e!664854 () Bool)

(assert (=> b!1169787 (= e!664854 (not e!664858))))

(declare-fun res!776246 () Bool)

(assert (=> b!1169787 (=> res!776246 e!664858)))

(assert (=> b!1169787 (= res!776246 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169787 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38594 0))(
  ( (Unit!38595) )
))
(declare-fun lt!526773 () Unit!38594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75621 (_ BitVec 64) (_ BitVec 32)) Unit!38594)

(assert (=> b!1169787 (= lt!526773 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!776244 () Bool)

(declare-fun e!664855 () Bool)

(assert (=> start!99290 (=> (not res!776244) (not e!664855))))

(assert (=> start!99290 (= res!776244 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36996 _keys!1208))))))

(assert (=> start!99290 e!664855))

(declare-fun tp_is_empty!29399 () Bool)

(assert (=> start!99290 tp_is_empty!29399))

(declare-fun array_inv!27868 (array!75621) Bool)

(assert (=> start!99290 (array_inv!27868 _keys!1208)))

(assert (=> start!99290 true))

(assert (=> start!99290 tp!87320))

(declare-fun e!664853 () Bool)

(declare-fun array_inv!27869 (array!75623) Bool)

(assert (=> start!99290 (and (array_inv!27869 _values!996) e!664853)))

(declare-fun b!1169788 () Bool)

(declare-fun res!776256 () Bool)

(assert (=> b!1169788 (=> (not res!776256) (not e!664855))))

(assert (=> b!1169788 (= res!776256 (= (select (arr!36460 _keys!1208) i!673) k!934))))

(declare-fun b!1169789 () Bool)

(assert (=> b!1169789 (= e!664855 e!664854)))

(declare-fun res!776247 () Bool)

(assert (=> b!1169789 (=> (not res!776247) (not e!664854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75621 (_ BitVec 32)) Bool)

(assert (=> b!1169789 (= res!776247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526782 mask!1564))))

(assert (=> b!1169789 (= lt!526782 (array!75622 (store (arr!36460 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36996 _keys!1208)))))

(declare-fun b!1169790 () Bool)

(declare-fun res!776248 () Bool)

(assert (=> b!1169790 (=> (not res!776248) (not e!664855))))

(assert (=> b!1169790 (= res!776248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169791 () Bool)

(declare-fun res!776252 () Bool)

(assert (=> b!1169791 (=> (not res!776252) (not e!664855))))

(assert (=> b!1169791 (= res!776252 (and (= (size!36997 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36996 _keys!1208) (size!36997 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169792 () Bool)

(declare-fun res!776257 () Bool)

(assert (=> b!1169792 (=> (not res!776257) (not e!664854))))

(declare-datatypes ((List!25579 0))(
  ( (Nil!25576) (Cons!25575 (h!26784 (_ BitVec 64)) (t!37440 List!25579)) )
))
(declare-fun arrayNoDuplicates!0 (array!75621 (_ BitVec 32) List!25579) Bool)

(assert (=> b!1169792 (= res!776257 (arrayNoDuplicates!0 lt!526782 #b00000000000000000000000000000000 Nil!25576))))

(declare-fun b!1169793 () Bool)

(declare-fun res!776251 () Bool)

(assert (=> b!1169793 (=> (not res!776251) (not e!664855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169793 (= res!776251 (validMask!0 mask!1564))))

(declare-fun e!664849 () Bool)

(declare-fun b!1169794 () Bool)

(assert (=> b!1169794 (= e!664849 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169795 () Bool)

(declare-fun res!776253 () Bool)

(assert (=> b!1169795 (=> (not res!776253) (not e!664855))))

(assert (=> b!1169795 (= res!776253 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36996 _keys!1208))))))

(declare-fun b!1169796 () Bool)

(declare-fun e!664852 () Bool)

(assert (=> b!1169796 (= e!664857 e!664852)))

(declare-fun res!776254 () Bool)

(assert (=> b!1169796 (=> res!776254 e!664852)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169796 (= res!776254 (not (validKeyInArray!0 (select (arr!36460 _keys!1208) from!1455))))))

(declare-fun lt!526776 () ListLongMap!16811)

(declare-fun lt!526775 () ListLongMap!16811)

(assert (=> b!1169796 (= lt!526776 lt!526775)))

(declare-fun lt!526781 () ListLongMap!16811)

(declare-fun -!1492 (ListLongMap!16811 (_ BitVec 64)) ListLongMap!16811)

(assert (=> b!1169796 (= lt!526775 (-!1492 lt!526781 k!934))))

(assert (=> b!1169796 (= lt!526776 (getCurrentListMapNoExtraKeys!4885 lt!526782 lt!526780 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169796 (= lt!526781 (getCurrentListMapNoExtraKeys!4885 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526774 () Unit!38594)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!719 (array!75621 array!75623 (_ BitVec 32) (_ BitVec 32) V!44325 V!44325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38594)

(assert (=> b!1169796 (= lt!526774 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169797 () Bool)

(declare-fun e!664848 () Bool)

(assert (=> b!1169797 (= e!664848 e!664849)))

(declare-fun res!776245 () Bool)

(assert (=> b!1169797 (=> res!776245 e!664849)))

(assert (=> b!1169797 (= res!776245 (not (= (select (arr!36460 _keys!1208) from!1455) k!934)))))

(declare-fun b!1169798 () Bool)

(declare-fun e!664851 () Bool)

(assert (=> b!1169798 (= e!664853 (and e!664851 mapRes!45926))))

(declare-fun condMapEmpty!45926 () Bool)

(declare-fun mapDefault!45926 () ValueCell!13990)

