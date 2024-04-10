; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98136 () Bool)

(assert start!98136)

(declare-fun b_free!23837 () Bool)

(declare-fun b_next!23837 () Bool)

(assert (=> start!98136 (= b_free!23837 (not b_next!23837))))

(declare-fun tp!84215 () Bool)

(declare-fun b_and!38457 () Bool)

(assert (=> start!98136 (= tp!84215 b_and!38457)))

(declare-fun b!1128035 () Bool)

(declare-fun e!642026 () Bool)

(declare-fun e!642020 () Bool)

(assert (=> b!1128035 (= e!642026 e!642020)))

(declare-fun res!753844 () Bool)

(assert (=> b!1128035 (=> res!753844 e!642020)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128035 (= res!753844 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42949 0))(
  ( (V!42950 (val!14240 Int)) )
))
(declare-fun zeroValue!944 () V!42949)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17916 0))(
  ( (tuple2!17917 (_1!8969 (_ BitVec 64)) (_2!8969 V!42949)) )
))
(declare-datatypes ((List!24687 0))(
  ( (Nil!24684) (Cons!24683 (h!25892 tuple2!17916) (t!35516 List!24687)) )
))
(declare-datatypes ((ListLongMap!15885 0))(
  ( (ListLongMap!15886 (toList!7958 List!24687)) )
))
(declare-fun lt!500813 () ListLongMap!15885)

(declare-fun minValue!944 () V!42949)

(declare-datatypes ((array!73593 0))(
  ( (array!73594 (arr!35449 (Array (_ BitVec 32) (_ BitVec 64))) (size!35985 (_ BitVec 32))) )
))
(declare-fun lt!500810 () array!73593)

(declare-datatypes ((ValueCell!13474 0))(
  ( (ValueCellFull!13474 (v!16873 V!42949)) (EmptyCell!13474) )
))
(declare-datatypes ((array!73595 0))(
  ( (array!73596 (arr!35450 (Array (_ BitVec 32) ValueCell!13474)) (size!35986 (_ BitVec 32))) )
))
(declare-fun lt!500811 () array!73595)

(declare-fun getCurrentListMapNoExtraKeys!4445 (array!73593 array!73595 (_ BitVec 32) (_ BitVec 32) V!42949 V!42949 (_ BitVec 32) Int) ListLongMap!15885)

(assert (=> b!1128035 (= lt!500813 (getCurrentListMapNoExtraKeys!4445 lt!500810 lt!500811 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73595)

(declare-fun dynLambda!2530 (Int (_ BitVec 64)) V!42949)

(assert (=> b!1128035 (= lt!500811 (array!73596 (store (arr!35450 _values!996) i!673 (ValueCellFull!13474 (dynLambda!2530 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35986 _values!996)))))

(declare-fun _keys!1208 () array!73593)

(declare-fun lt!500815 () ListLongMap!15885)

(assert (=> b!1128035 (= lt!500815 (getCurrentListMapNoExtraKeys!4445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128036 () Bool)

(declare-fun res!753832 () Bool)

(declare-fun e!642025 () Bool)

(assert (=> b!1128036 (=> (not res!753832) (not e!642025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128036 (= res!753832 (validMask!0 mask!1564))))

(declare-fun b!1128037 () Bool)

(declare-fun res!753843 () Bool)

(assert (=> b!1128037 (=> (not res!753843) (not e!642025))))

(declare-datatypes ((List!24688 0))(
  ( (Nil!24685) (Cons!24684 (h!25893 (_ BitVec 64)) (t!35517 List!24688)) )
))
(declare-fun arrayNoDuplicates!0 (array!73593 (_ BitVec 32) List!24688) Bool)

(assert (=> b!1128037 (= res!753843 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24685))))

(declare-fun b!1128038 () Bool)

(declare-fun res!753839 () Bool)

(assert (=> b!1128038 (=> (not res!753839) (not e!642025))))

(assert (=> b!1128038 (= res!753839 (and (= (size!35986 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35985 _keys!1208) (size!35986 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128039 () Bool)

(declare-fun res!753833 () Bool)

(declare-fun e!642021 () Bool)

(assert (=> b!1128039 (=> (not res!753833) (not e!642021))))

(assert (=> b!1128039 (= res!753833 (arrayNoDuplicates!0 lt!500810 #b00000000000000000000000000000000 Nil!24685))))

(declare-fun b!1128041 () Bool)

(declare-fun e!642027 () Bool)

(declare-fun call!47793 () ListLongMap!15885)

(declare-fun call!47794 () ListLongMap!15885)

(assert (=> b!1128041 (= e!642027 (= call!47793 call!47794))))

(declare-fun b!1128042 () Bool)

(declare-fun e!642018 () Bool)

(assert (=> b!1128042 (= e!642020 e!642018)))

(declare-fun res!753842 () Bool)

(assert (=> b!1128042 (=> res!753842 e!642018)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1128042 (= res!753842 (not (= (select (arr!35449 _keys!1208) from!1455) k!934)))))

(assert (=> b!1128042 e!642027))

(declare-fun c!109746 () Bool)

(assert (=> b!1128042 (= c!109746 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36958 0))(
  ( (Unit!36959) )
))
(declare-fun lt!500812 () Unit!36958)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!398 (array!73593 array!73595 (_ BitVec 32) (_ BitVec 32) V!42949 V!42949 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36958)

(assert (=> b!1128042 (= lt!500812 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128043 () Bool)

(declare-fun e!642024 () Bool)

(declare-fun tp_is_empty!28367 () Bool)

(assert (=> b!1128043 (= e!642024 tp_is_empty!28367)))

(declare-fun b!1128044 () Bool)

(declare-fun res!753841 () Bool)

(assert (=> b!1128044 (=> (not res!753841) (not e!642025))))

(assert (=> b!1128044 (= res!753841 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35985 _keys!1208))))))

(declare-fun b!1128045 () Bool)

(declare-fun e!642023 () Bool)

(assert (=> b!1128045 (= e!642023 tp_is_empty!28367)))

(declare-fun b!1128046 () Bool)

(declare-fun e!642022 () Bool)

(declare-fun mapRes!44368 () Bool)

(assert (=> b!1128046 (= e!642022 (and e!642023 mapRes!44368))))

(declare-fun condMapEmpty!44368 () Bool)

(declare-fun mapDefault!44368 () ValueCell!13474)

