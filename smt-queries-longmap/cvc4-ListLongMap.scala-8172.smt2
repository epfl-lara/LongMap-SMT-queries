; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99902 () Bool)

(assert start!99902)

(declare-fun b_free!25481 () Bool)

(declare-fun b_next!25481 () Bool)

(assert (=> start!99902 (= b_free!25481 (not b_next!25481))))

(declare-fun tp!89157 () Bool)

(declare-fun b_and!41829 () Bool)

(assert (=> start!99902 (= tp!89157 b_and!41829)))

(declare-fun b!1188977 () Bool)

(declare-fun res!790595 () Bool)

(declare-fun e!676014 () Bool)

(assert (=> b!1188977 (=> (not res!790595) (not e!676014))))

(declare-datatypes ((array!76817 0))(
  ( (array!76818 (arr!37058 (Array (_ BitVec 32) (_ BitVec 64))) (size!37594 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76817)

(declare-datatypes ((List!26087 0))(
  ( (Nil!26084) (Cons!26083 (h!27292 (_ BitVec 64)) (t!38560 List!26087)) )
))
(declare-fun arrayNoDuplicates!0 (array!76817 (_ BitVec 32) List!26087) Bool)

(assert (=> b!1188977 (= res!790595 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26084))))

(declare-fun b!1188978 () Bool)

(declare-fun e!676011 () Bool)

(declare-fun e!676017 () Bool)

(assert (=> b!1188978 (= e!676011 (not e!676017))))

(declare-fun res!790596 () Bool)

(assert (=> b!1188978 (=> res!790596 e!676017)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188978 (= res!790596 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188978 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39442 0))(
  ( (Unit!39443) )
))
(declare-fun lt!540892 () Unit!39442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76817 (_ BitVec 64) (_ BitVec 32)) Unit!39442)

(assert (=> b!1188978 (= lt!540892 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1188979 () Bool)

(declare-fun e!676012 () Bool)

(assert (=> b!1188979 (= e!676012 true)))

(declare-datatypes ((V!45141 0))(
  ( (V!45142 (val!15062 Int)) )
))
(declare-fun zeroValue!944 () V!45141)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45141)

(declare-datatypes ((ValueCell!14296 0))(
  ( (ValueCellFull!14296 (v!17700 V!45141)) (EmptyCell!14296) )
))
(declare-datatypes ((array!76819 0))(
  ( (array!76820 (arr!37059 (Array (_ BitVec 32) ValueCell!14296)) (size!37595 (_ BitVec 32))) )
))
(declare-fun lt!540894 () array!76819)

(declare-fun _values!996 () array!76819)

(declare-fun lt!540889 () array!76817)

(declare-datatypes ((tuple2!19342 0))(
  ( (tuple2!19343 (_1!9682 (_ BitVec 64)) (_2!9682 V!45141)) )
))
(declare-datatypes ((List!26088 0))(
  ( (Nil!26085) (Cons!26084 (h!27293 tuple2!19342) (t!38561 List!26088)) )
))
(declare-datatypes ((ListLongMap!17311 0))(
  ( (ListLongMap!17312 (toList!8671 List!26088)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5112 (array!76817 array!76819 (_ BitVec 32) (_ BitVec 32) V!45141 V!45141 (_ BitVec 32) Int) ListLongMap!17311)

(declare-fun -!1701 (ListLongMap!17311 (_ BitVec 64)) ListLongMap!17311)

(assert (=> b!1188979 (= (getCurrentListMapNoExtraKeys!5112 lt!540889 lt!540894 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1701 (getCurrentListMapNoExtraKeys!5112 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!540891 () Unit!39442)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!910 (array!76817 array!76819 (_ BitVec 32) (_ BitVec 32) V!45141 V!45141 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39442)

(assert (=> b!1188979 (= lt!540891 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!910 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188980 () Bool)

(declare-fun res!790599 () Bool)

(assert (=> b!1188980 (=> (not res!790599) (not e!676014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76817 (_ BitVec 32)) Bool)

(assert (=> b!1188980 (= res!790599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188981 () Bool)

(declare-fun res!790592 () Bool)

(assert (=> b!1188981 (=> (not res!790592) (not e!676014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188981 (= res!790592 (validKeyInArray!0 k!934))))

(declare-fun b!1188982 () Bool)

(declare-fun e!676016 () Bool)

(declare-fun tp_is_empty!30011 () Bool)

(assert (=> b!1188982 (= e!676016 tp_is_empty!30011)))

(declare-fun b!1188983 () Bool)

(declare-fun e!676015 () Bool)

(assert (=> b!1188983 (= e!676015 tp_is_empty!30011)))

(declare-fun mapIsEmpty!46844 () Bool)

(declare-fun mapRes!46844 () Bool)

(assert (=> mapIsEmpty!46844 mapRes!46844))

(declare-fun b!1188984 () Bool)

(declare-fun res!790594 () Bool)

(assert (=> b!1188984 (=> (not res!790594) (not e!676014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188984 (= res!790594 (validMask!0 mask!1564))))

(declare-fun b!1188985 () Bool)

(assert (=> b!1188985 (= e!676017 e!676012)))

(declare-fun res!790602 () Bool)

(assert (=> b!1188985 (=> res!790602 e!676012)))

(assert (=> b!1188985 (= res!790602 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540893 () ListLongMap!17311)

(assert (=> b!1188985 (= lt!540893 (getCurrentListMapNoExtraKeys!5112 lt!540889 lt!540894 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3056 (Int (_ BitVec 64)) V!45141)

(assert (=> b!1188985 (= lt!540894 (array!76820 (store (arr!37059 _values!996) i!673 (ValueCellFull!14296 (dynLambda!3056 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37595 _values!996)))))

(declare-fun lt!540890 () ListLongMap!17311)

(assert (=> b!1188985 (= lt!540890 (getCurrentListMapNoExtraKeys!5112 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188986 () Bool)

(declare-fun res!790593 () Bool)

(assert (=> b!1188986 (=> (not res!790593) (not e!676014))))

(assert (=> b!1188986 (= res!790593 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37594 _keys!1208))))))

(declare-fun b!1188987 () Bool)

(declare-fun e!676018 () Bool)

(assert (=> b!1188987 (= e!676018 (and e!676016 mapRes!46844))))

(declare-fun condMapEmpty!46844 () Bool)

(declare-fun mapDefault!46844 () ValueCell!14296)

