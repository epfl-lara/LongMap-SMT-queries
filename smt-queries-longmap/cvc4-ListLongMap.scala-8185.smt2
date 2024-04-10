; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99980 () Bool)

(assert start!99980)

(declare-fun b_free!25559 () Bool)

(declare-fun b_next!25559 () Bool)

(assert (=> start!99980 (= b_free!25559 (not b_next!25559))))

(declare-fun tp!89390 () Bool)

(declare-fun b_and!41985 () Bool)

(assert (=> start!99980 (= tp!89390 b_and!41985)))

(declare-fun b!1190810 () Bool)

(declare-fun e!676952 () Bool)

(declare-fun tp_is_empty!30089 () Bool)

(assert (=> b!1190810 (= e!676952 tp_is_empty!30089)))

(declare-fun mapNonEmpty!46961 () Bool)

(declare-fun mapRes!46961 () Bool)

(declare-fun tp!89391 () Bool)

(declare-fun e!676947 () Bool)

(assert (=> mapNonEmpty!46961 (= mapRes!46961 (and tp!89391 e!676947))))

(declare-fun mapKey!46961 () (_ BitVec 32))

(declare-datatypes ((V!45245 0))(
  ( (V!45246 (val!15101 Int)) )
))
(declare-datatypes ((ValueCell!14335 0))(
  ( (ValueCellFull!14335 (v!17739 V!45245)) (EmptyCell!14335) )
))
(declare-fun mapValue!46961 () ValueCell!14335)

(declare-datatypes ((array!76969 0))(
  ( (array!76970 (arr!37134 (Array (_ BitVec 32) ValueCell!14335)) (size!37670 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76969)

(declare-fun mapRest!46961 () (Array (_ BitVec 32) ValueCell!14335))

(assert (=> mapNonEmpty!46961 (= (arr!37134 _values!996) (store mapRest!46961 mapKey!46961 mapValue!46961))))

(declare-fun b!1190811 () Bool)

(declare-fun res!792004 () Bool)

(declare-fun e!676950 () Bool)

(assert (=> b!1190811 (=> (not res!792004) (not e!676950))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190811 (= res!792004 (validMask!0 mask!1564))))

(declare-fun b!1190812 () Bool)

(declare-fun res!792000 () Bool)

(assert (=> b!1190812 (=> (not res!792000) (not e!676950))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190812 (= res!792000 (validKeyInArray!0 k!934))))

(declare-fun b!1190813 () Bool)

(declare-fun res!792003 () Bool)

(assert (=> b!1190813 (=> (not res!792003) (not e!676950))))

(declare-datatypes ((array!76971 0))(
  ( (array!76972 (arr!37135 (Array (_ BitVec 32) (_ BitVec 64))) (size!37671 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76971)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76971 (_ BitVec 32)) Bool)

(assert (=> b!1190813 (= res!792003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190814 () Bool)

(declare-fun e!676953 () Bool)

(declare-fun e!676951 () Bool)

(assert (=> b!1190814 (= e!676953 (not e!676951))))

(declare-fun res!791996 () Bool)

(assert (=> b!1190814 (=> res!791996 e!676951)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190814 (= res!791996 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190814 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39500 0))(
  ( (Unit!39501) )
))
(declare-fun lt!541592 () Unit!39500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76971 (_ BitVec 64) (_ BitVec 32)) Unit!39500)

(assert (=> b!1190814 (= lt!541592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!792002 () Bool)

(assert (=> start!99980 (=> (not res!792002) (not e!676950))))

(assert (=> start!99980 (= res!792002 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37671 _keys!1208))))))

(assert (=> start!99980 e!676950))

(assert (=> start!99980 tp_is_empty!30089))

(declare-fun array_inv!28318 (array!76971) Bool)

(assert (=> start!99980 (array_inv!28318 _keys!1208)))

(assert (=> start!99980 true))

(assert (=> start!99980 tp!89390))

(declare-fun e!676954 () Bool)

(declare-fun array_inv!28319 (array!76969) Bool)

(assert (=> start!99980 (and (array_inv!28319 _values!996) e!676954)))

(declare-fun b!1190815 () Bool)

(declare-fun res!791999 () Bool)

(assert (=> b!1190815 (=> (not res!791999) (not e!676953))))

(declare-fun lt!541595 () array!76971)

(declare-datatypes ((List!26147 0))(
  ( (Nil!26144) (Cons!26143 (h!27352 (_ BitVec 64)) (t!38698 List!26147)) )
))
(declare-fun arrayNoDuplicates!0 (array!76971 (_ BitVec 32) List!26147) Bool)

(assert (=> b!1190815 (= res!791999 (arrayNoDuplicates!0 lt!541595 #b00000000000000000000000000000000 Nil!26144))))

(declare-fun b!1190816 () Bool)

(declare-fun e!676948 () Bool)

(assert (=> b!1190816 (= e!676951 e!676948)))

(declare-fun res!791998 () Bool)

(assert (=> b!1190816 (=> res!791998 e!676948)))

(assert (=> b!1190816 (= res!791998 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45245)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19402 0))(
  ( (tuple2!19403 (_1!9712 (_ BitVec 64)) (_2!9712 V!45245)) )
))
(declare-datatypes ((List!26148 0))(
  ( (Nil!26145) (Cons!26144 (h!27353 tuple2!19402) (t!38699 List!26148)) )
))
(declare-datatypes ((ListLongMap!17371 0))(
  ( (ListLongMap!17372 (toList!8701 List!26148)) )
))
(declare-fun lt!541593 () ListLongMap!17371)

(declare-fun minValue!944 () V!45245)

(declare-fun lt!541594 () array!76969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5142 (array!76971 array!76969 (_ BitVec 32) (_ BitVec 32) V!45245 V!45245 (_ BitVec 32) Int) ListLongMap!17371)

(assert (=> b!1190816 (= lt!541593 (getCurrentListMapNoExtraKeys!5142 lt!541595 lt!541594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3080 (Int (_ BitVec 64)) V!45245)

(assert (=> b!1190816 (= lt!541594 (array!76970 (store (arr!37134 _values!996) i!673 (ValueCellFull!14335 (dynLambda!3080 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37670 _values!996)))))

(declare-fun lt!541596 () ListLongMap!17371)

(assert (=> b!1190816 (= lt!541596 (getCurrentListMapNoExtraKeys!5142 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190817 () Bool)

(declare-fun res!792007 () Bool)

(assert (=> b!1190817 (=> (not res!792007) (not e!676950))))

(assert (=> b!1190817 (= res!792007 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37671 _keys!1208))))))

(declare-fun b!1190818 () Bool)

(assert (=> b!1190818 (= e!676948 true)))

(declare-fun -!1727 (ListLongMap!17371 (_ BitVec 64)) ListLongMap!17371)

(assert (=> b!1190818 (= (getCurrentListMapNoExtraKeys!5142 lt!541595 lt!541594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1727 (getCurrentListMapNoExtraKeys!5142 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!541591 () Unit!39500)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!936 (array!76971 array!76969 (_ BitVec 32) (_ BitVec 32) V!45245 V!45245 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39500)

(assert (=> b!1190818 (= lt!541591 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!936 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190819 () Bool)

(declare-fun res!792001 () Bool)

(assert (=> b!1190819 (=> (not res!792001) (not e!676950))))

(assert (=> b!1190819 (= res!792001 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26144))))

(declare-fun mapIsEmpty!46961 () Bool)

(assert (=> mapIsEmpty!46961 mapRes!46961))

(declare-fun b!1190820 () Bool)

(assert (=> b!1190820 (= e!676954 (and e!676952 mapRes!46961))))

(declare-fun condMapEmpty!46961 () Bool)

(declare-fun mapDefault!46961 () ValueCell!14335)

