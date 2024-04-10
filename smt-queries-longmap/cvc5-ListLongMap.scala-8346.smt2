; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101626 () Bool)

(assert start!101626)

(declare-fun b_free!26347 () Bool)

(declare-fun b_next!26347 () Bool)

(assert (=> start!101626 (= b_free!26347 (not b_next!26347))))

(declare-fun tp!92083 () Bool)

(declare-fun b_and!43937 () Bool)

(assert (=> start!101626 (= tp!92083 b_and!43937)))

(declare-fun b!1221979 () Bool)

(declare-fun res!811842 () Bool)

(declare-fun e!693974 () Bool)

(assert (=> b!1221979 (=> (not res!811842) (not e!693974))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78885 0))(
  ( (array!78886 (arr!38070 (Array (_ BitVec 32) (_ BitVec 64))) (size!38606 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78885)

(assert (=> b!1221979 (= res!811842 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38606 _keys!1208))))))

(declare-fun b!1221980 () Bool)

(declare-fun e!693980 () Bool)

(declare-fun e!693969 () Bool)

(assert (=> b!1221980 (= e!693980 e!693969)))

(declare-fun res!811834 () Bool)

(assert (=> b!1221980 (=> res!811834 e!693969)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221980 (= res!811834 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46529 0))(
  ( (V!46530 (val!15582 Int)) )
))
(declare-fun zeroValue!944 () V!46529)

(declare-datatypes ((ValueCell!14816 0))(
  ( (ValueCellFull!14816 (v!18243 V!46529)) (EmptyCell!14816) )
))
(declare-datatypes ((array!78887 0))(
  ( (array!78888 (arr!38071 (Array (_ BitVec 32) ValueCell!14816)) (size!38607 (_ BitVec 32))) )
))
(declare-fun lt!555877 () array!78887)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!46529)

(declare-datatypes ((tuple2!20066 0))(
  ( (tuple2!20067 (_1!10044 (_ BitVec 64)) (_2!10044 V!46529)) )
))
(declare-datatypes ((List!26867 0))(
  ( (Nil!26864) (Cons!26863 (h!28072 tuple2!20066) (t!40194 List!26867)) )
))
(declare-datatypes ((ListLongMap!18035 0))(
  ( (ListLongMap!18036 (toList!9033 List!26867)) )
))
(declare-fun lt!555886 () ListLongMap!18035)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!555882 () array!78885)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5455 (array!78885 array!78887 (_ BitVec 32) (_ BitVec 32) V!46529 V!46529 (_ BitVec 32) Int) ListLongMap!18035)

(assert (=> b!1221980 (= lt!555886 (getCurrentListMapNoExtraKeys!5455 lt!555882 lt!555877 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555887 () V!46529)

(declare-fun _values!996 () array!78887)

(assert (=> b!1221980 (= lt!555877 (array!78888 (store (arr!38071 _values!996) i!673 (ValueCellFull!14816 lt!555887)) (size!38607 _values!996)))))

(declare-fun dynLambda!3334 (Int (_ BitVec 64)) V!46529)

(assert (=> b!1221980 (= lt!555887 (dynLambda!3334 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555879 () ListLongMap!18035)

(assert (=> b!1221980 (= lt!555879 (getCurrentListMapNoExtraKeys!5455 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221981 () Bool)

(declare-fun res!811832 () Bool)

(assert (=> b!1221981 (=> (not res!811832) (not e!693974))))

(assert (=> b!1221981 (= res!811832 (and (= (size!38607 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38606 _keys!1208) (size!38607 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221982 () Bool)

(declare-fun e!693970 () Bool)

(declare-fun e!693979 () Bool)

(assert (=> b!1221982 (= e!693970 e!693979)))

(declare-fun res!811843 () Bool)

(assert (=> b!1221982 (=> res!811843 e!693979)))

(assert (=> b!1221982 (= res!811843 (or (bvsge (size!38606 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38606 _keys!1208)) (bvsge from!1455 (size!38606 _keys!1208))))))

(declare-datatypes ((List!26868 0))(
  ( (Nil!26865) (Cons!26864 (h!28073 (_ BitVec 64)) (t!40195 List!26868)) )
))
(declare-fun arrayNoDuplicates!0 (array!78885 (_ BitVec 32) List!26868) Bool)

(assert (=> b!1221982 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26865)))

(declare-datatypes ((Unit!40470 0))(
  ( (Unit!40471) )
))
(declare-fun lt!555878 () Unit!40470)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78885 (_ BitVec 32) (_ BitVec 32)) Unit!40470)

(assert (=> b!1221982 (= lt!555878 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221982 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555884 () Unit!40470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78885 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40470)

(assert (=> b!1221982 (= lt!555884 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221983 () Bool)

(declare-fun res!811840 () Bool)

(assert (=> b!1221983 (=> (not res!811840) (not e!693974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221983 (= res!811840 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48472 () Bool)

(declare-fun mapRes!48472 () Bool)

(assert (=> mapIsEmpty!48472 mapRes!48472))

(declare-fun res!811835 () Bool)

(assert (=> start!101626 (=> (not res!811835) (not e!693974))))

(assert (=> start!101626 (= res!811835 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38606 _keys!1208))))))

(assert (=> start!101626 e!693974))

(declare-fun tp_is_empty!31051 () Bool)

(assert (=> start!101626 tp_is_empty!31051))

(declare-fun array_inv!28966 (array!78885) Bool)

(assert (=> start!101626 (array_inv!28966 _keys!1208)))

(assert (=> start!101626 true))

(assert (=> start!101626 tp!92083))

(declare-fun e!693978 () Bool)

(declare-fun array_inv!28967 (array!78887) Bool)

(assert (=> start!101626 (and (array_inv!28967 _values!996) e!693978)))

(declare-fun b!1221984 () Bool)

(declare-fun e!693971 () Bool)

(assert (=> b!1221984 (= e!693974 e!693971)))

(declare-fun res!811839 () Bool)

(assert (=> b!1221984 (=> (not res!811839) (not e!693971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78885 (_ BitVec 32)) Bool)

(assert (=> b!1221984 (= res!811839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555882 mask!1564))))

(assert (=> b!1221984 (= lt!555882 (array!78886 (store (arr!38070 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38606 _keys!1208)))))

(declare-fun b!1221985 () Bool)

(assert (=> b!1221985 (= e!693979 true)))

(declare-fun lt!555889 () Bool)

(declare-fun contains!7031 (List!26868 (_ BitVec 64)) Bool)

(assert (=> b!1221985 (= lt!555889 (contains!7031 Nil!26865 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221986 () Bool)

(declare-fun res!811847 () Bool)

(assert (=> b!1221986 (=> (not res!811847) (not e!693974))))

(assert (=> b!1221986 (= res!811847 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26865))))

(declare-fun b!1221987 () Bool)

(declare-fun res!811849 () Bool)

(assert (=> b!1221987 (=> (not res!811849) (not e!693971))))

(assert (=> b!1221987 (= res!811849 (arrayNoDuplicates!0 lt!555882 #b00000000000000000000000000000000 Nil!26865))))

(declare-fun b!1221988 () Bool)

(declare-fun e!693976 () Bool)

(assert (=> b!1221988 (= e!693976 tp_is_empty!31051)))

(declare-fun b!1221989 () Bool)

(declare-fun res!811833 () Bool)

(assert (=> b!1221989 (=> (not res!811833) (not e!693974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221989 (= res!811833 (validKeyInArray!0 k!934))))

(declare-fun b!1221990 () Bool)

(declare-fun e!693975 () Bool)

(assert (=> b!1221990 (= e!693978 (and e!693975 mapRes!48472))))

(declare-fun condMapEmpty!48472 () Bool)

(declare-fun mapDefault!48472 () ValueCell!14816)

