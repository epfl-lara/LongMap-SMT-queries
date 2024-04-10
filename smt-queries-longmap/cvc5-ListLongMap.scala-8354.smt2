; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101706 () Bool)

(assert start!101706)

(declare-fun b_free!26395 () Bool)

(declare-fun b_next!26395 () Bool)

(assert (=> start!101706 (= b_free!26395 (not b_next!26395))))

(declare-fun tp!92230 () Bool)

(declare-fun b_and!44051 () Bool)

(assert (=> start!101706 (= tp!92230 b_and!44051)))

(declare-fun b!1223637 () Bool)

(declare-fun e!694963 () Bool)

(declare-fun e!694960 () Bool)

(assert (=> b!1223637 (= e!694963 e!694960)))

(declare-fun res!813034 () Bool)

(assert (=> b!1223637 (=> (not res!813034) (not e!694960))))

(declare-datatypes ((array!78981 0))(
  ( (array!78982 (arr!38117 (Array (_ BitVec 32) (_ BitVec 64))) (size!38653 (_ BitVec 32))) )
))
(declare-fun lt!556978 () array!78981)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78981 (_ BitVec 32)) Bool)

(assert (=> b!1223637 (= res!813034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556978 mask!1564))))

(declare-fun _keys!1208 () array!78981)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1223637 (= lt!556978 (array!78982 (store (arr!38117 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38653 _keys!1208)))))

(declare-fun e!694961 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1223638 () Bool)

(declare-fun arrayContainsKey!0 (array!78981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223638 (= e!694961 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1223639 () Bool)

(declare-fun e!694954 () Bool)

(declare-fun tp_is_empty!31099 () Bool)

(assert (=> b!1223639 (= e!694954 tp_is_empty!31099)))

(declare-fun res!813041 () Bool)

(assert (=> start!101706 (=> (not res!813041) (not e!694963))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101706 (= res!813041 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38653 _keys!1208))))))

(assert (=> start!101706 e!694963))

(assert (=> start!101706 tp_is_empty!31099))

(declare-fun array_inv!28998 (array!78981) Bool)

(assert (=> start!101706 (array_inv!28998 _keys!1208)))

(assert (=> start!101706 true))

(assert (=> start!101706 tp!92230))

(declare-datatypes ((V!46593 0))(
  ( (V!46594 (val!15606 Int)) )
))
(declare-datatypes ((ValueCell!14840 0))(
  ( (ValueCellFull!14840 (v!18268 V!46593)) (EmptyCell!14840) )
))
(declare-datatypes ((array!78983 0))(
  ( (array!78984 (arr!38118 (Array (_ BitVec 32) ValueCell!14840)) (size!38654 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78983)

(declare-fun e!694955 () Bool)

(declare-fun array_inv!28999 (array!78983) Bool)

(assert (=> start!101706 (and (array_inv!28999 _values!996) e!694955)))

(declare-fun b!1223640 () Bool)

(declare-fun e!694966 () Bool)

(assert (=> b!1223640 (= e!694966 tp_is_empty!31099)))

(declare-fun mapNonEmpty!48547 () Bool)

(declare-fun mapRes!48547 () Bool)

(declare-fun tp!92231 () Bool)

(assert (=> mapNonEmpty!48547 (= mapRes!48547 (and tp!92231 e!694954))))

(declare-fun mapRest!48547 () (Array (_ BitVec 32) ValueCell!14840))

(declare-fun mapKey!48547 () (_ BitVec 32))

(declare-fun mapValue!48547 () ValueCell!14840)

(assert (=> mapNonEmpty!48547 (= (arr!38118 _values!996) (store mapRest!48547 mapKey!48547 mapValue!48547))))

(declare-fun b!1223641 () Bool)

(declare-fun res!813035 () Bool)

(assert (=> b!1223641 (=> (not res!813035) (not e!694963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223641 (= res!813035 (validKeyInArray!0 k!934))))

(declare-fun b!1223642 () Bool)

(declare-fun res!813038 () Bool)

(assert (=> b!1223642 (=> (not res!813038) (not e!694963))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1223642 (= res!813038 (and (= (size!38654 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38653 _keys!1208) (size!38654 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223643 () Bool)

(declare-fun e!694958 () Bool)

(assert (=> b!1223643 (= e!694958 e!694961)))

(declare-fun res!813043 () Bool)

(assert (=> b!1223643 (=> res!813043 e!694961)))

(assert (=> b!1223643 (= res!813043 (not (= (select (arr!38117 _keys!1208) from!1455) k!934)))))

(declare-fun b!1223644 () Bool)

(declare-fun res!813030 () Bool)

(assert (=> b!1223644 (=> (not res!813030) (not e!694960))))

(declare-datatypes ((List!26909 0))(
  ( (Nil!26906) (Cons!26905 (h!28114 (_ BitVec 64)) (t!40284 List!26909)) )
))
(declare-fun arrayNoDuplicates!0 (array!78981 (_ BitVec 32) List!26909) Bool)

(assert (=> b!1223644 (= res!813030 (arrayNoDuplicates!0 lt!556978 #b00000000000000000000000000000000 Nil!26906))))

(declare-fun b!1223645 () Bool)

(declare-fun e!694965 () Bool)

(assert (=> b!1223645 (= e!694960 (not e!694965))))

(declare-fun res!813036 () Bool)

(assert (=> b!1223645 (=> res!813036 e!694965)))

(assert (=> b!1223645 (= res!813036 (bvsgt from!1455 i!673))))

(assert (=> b!1223645 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40538 0))(
  ( (Unit!40539) )
))
(declare-fun lt!556989 () Unit!40538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78981 (_ BitVec 64) (_ BitVec 32)) Unit!40538)

(assert (=> b!1223645 (= lt!556989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1223646 () Bool)

(declare-fun e!694959 () Bool)

(declare-fun e!694964 () Bool)

(assert (=> b!1223646 (= e!694959 e!694964)))

(declare-fun res!813040 () Bool)

(assert (=> b!1223646 (=> res!813040 e!694964)))

(assert (=> b!1223646 (= res!813040 (not (validKeyInArray!0 (select (arr!38117 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20108 0))(
  ( (tuple2!20109 (_1!10065 (_ BitVec 64)) (_2!10065 V!46593)) )
))
(declare-datatypes ((List!26910 0))(
  ( (Nil!26907) (Cons!26906 (h!28115 tuple2!20108) (t!40285 List!26910)) )
))
(declare-datatypes ((ListLongMap!18077 0))(
  ( (ListLongMap!18078 (toList!9054 List!26910)) )
))
(declare-fun lt!556990 () ListLongMap!18077)

(declare-fun lt!556981 () ListLongMap!18077)

(assert (=> b!1223646 (= lt!556990 lt!556981)))

(declare-fun lt!556982 () ListLongMap!18077)

(declare-fun -!1956 (ListLongMap!18077 (_ BitVec 64)) ListLongMap!18077)

(assert (=> b!1223646 (= lt!556981 (-!1956 lt!556982 k!934))))

(declare-fun zeroValue!944 () V!46593)

(declare-fun lt!556983 () array!78983)

(declare-fun minValue!944 () V!46593)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5476 (array!78981 array!78983 (_ BitVec 32) (_ BitVec 32) V!46593 V!46593 (_ BitVec 32) Int) ListLongMap!18077)

(assert (=> b!1223646 (= lt!556990 (getCurrentListMapNoExtraKeys!5476 lt!556978 lt!556983 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223646 (= lt!556982 (getCurrentListMapNoExtraKeys!5476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556987 () Unit!40538)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1163 (array!78981 array!78983 (_ BitVec 32) (_ BitVec 32) V!46593 V!46593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40538)

(assert (=> b!1223646 (= lt!556987 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1163 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!694957 () Bool)

(declare-fun b!1223647 () Bool)

(declare-fun lt!556985 () ListLongMap!18077)

(declare-fun lt!556988 () tuple2!20108)

(declare-fun +!4112 (ListLongMap!18077 tuple2!20108) ListLongMap!18077)

(assert (=> b!1223647 (= e!694957 (= lt!556985 (+!4112 lt!556982 lt!556988)))))

(declare-fun b!1223648 () Bool)

(assert (=> b!1223648 (= e!694955 (and e!694966 mapRes!48547))))

(declare-fun condMapEmpty!48547 () Bool)

(declare-fun mapDefault!48547 () ValueCell!14840)

