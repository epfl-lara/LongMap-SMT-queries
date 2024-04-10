; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97778 () Bool)

(assert start!97778)

(declare-fun b_free!23479 () Bool)

(declare-fun b_next!23479 () Bool)

(assert (=> start!97778 (= b_free!23479 (not b_next!23479))))

(declare-fun tp!83141 () Bool)

(declare-fun b_and!37753 () Bool)

(assert (=> start!97778 (= tp!83141 b_and!37753)))

(declare-fun b!1118474 () Bool)

(declare-fun res!747022 () Bool)

(declare-fun e!637071 () Bool)

(assert (=> b!1118474 (=> (not res!747022) (not e!637071))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!72909 0))(
  ( (array!72910 (arr!35107 (Array (_ BitVec 32) (_ BitVec 64))) (size!35643 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72909)

(assert (=> b!1118474 (= res!747022 (= (select (arr!35107 _keys!1208) i!673) k!934))))

(declare-fun res!747026 () Bool)

(assert (=> start!97778 (=> (not res!747026) (not e!637071))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97778 (= res!747026 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35643 _keys!1208))))))

(assert (=> start!97778 e!637071))

(declare-fun tp_is_empty!28009 () Bool)

(assert (=> start!97778 tp_is_empty!28009))

(declare-fun array_inv!26974 (array!72909) Bool)

(assert (=> start!97778 (array_inv!26974 _keys!1208)))

(assert (=> start!97778 true))

(assert (=> start!97778 tp!83141))

(declare-datatypes ((V!42473 0))(
  ( (V!42474 (val!14061 Int)) )
))
(declare-datatypes ((ValueCell!13295 0))(
  ( (ValueCellFull!13295 (v!16694 V!42473)) (EmptyCell!13295) )
))
(declare-datatypes ((array!72911 0))(
  ( (array!72912 (arr!35108 (Array (_ BitVec 32) ValueCell!13295)) (size!35644 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72911)

(declare-fun e!637065 () Bool)

(declare-fun array_inv!26975 (array!72911) Bool)

(assert (=> start!97778 (and (array_inv!26975 _values!996) e!637065)))

(declare-fun b!1118475 () Bool)

(declare-fun e!637070 () Bool)

(assert (=> b!1118475 (= e!637070 true)))

(declare-fun zeroValue!944 () V!42473)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17636 0))(
  ( (tuple2!17637 (_1!8829 (_ BitVec 64)) (_2!8829 V!42473)) )
))
(declare-datatypes ((List!24422 0))(
  ( (Nil!24419) (Cons!24418 (h!25627 tuple2!17636) (t!34903 List!24422)) )
))
(declare-datatypes ((ListLongMap!15605 0))(
  ( (ListLongMap!15606 (toList!7818 List!24422)) )
))
(declare-fun lt!497504 () ListLongMap!15605)

(declare-fun minValue!944 () V!42473)

(declare-fun getCurrentListMapNoExtraKeys!4308 (array!72909 array!72911 (_ BitVec 32) (_ BitVec 32) V!42473 V!42473 (_ BitVec 32) Int) ListLongMap!15605)

(assert (=> b!1118475 (= lt!497504 (getCurrentListMapNoExtraKeys!4308 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118476 () Bool)

(declare-fun res!747023 () Bool)

(declare-fun e!637066 () Bool)

(assert (=> b!1118476 (=> (not res!747023) (not e!637066))))

(declare-fun lt!497503 () array!72909)

(declare-datatypes ((List!24423 0))(
  ( (Nil!24420) (Cons!24419 (h!25628 (_ BitVec 64)) (t!34904 List!24423)) )
))
(declare-fun arrayNoDuplicates!0 (array!72909 (_ BitVec 32) List!24423) Bool)

(assert (=> b!1118476 (= res!747023 (arrayNoDuplicates!0 lt!497503 #b00000000000000000000000000000000 Nil!24420))))

(declare-fun b!1118477 () Bool)

(declare-fun res!747019 () Bool)

(assert (=> b!1118477 (=> (not res!747019) (not e!637071))))

(assert (=> b!1118477 (= res!747019 (and (= (size!35644 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35643 _keys!1208) (size!35644 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118478 () Bool)

(declare-fun e!637069 () Bool)

(assert (=> b!1118478 (= e!637069 tp_is_empty!28009)))

(declare-fun mapNonEmpty!43831 () Bool)

(declare-fun mapRes!43831 () Bool)

(declare-fun tp!83140 () Bool)

(assert (=> mapNonEmpty!43831 (= mapRes!43831 (and tp!83140 e!637069))))

(declare-fun mapKey!43831 () (_ BitVec 32))

(declare-fun mapRest!43831 () (Array (_ BitVec 32) ValueCell!13295))

(declare-fun mapValue!43831 () ValueCell!13295)

(assert (=> mapNonEmpty!43831 (= (arr!35108 _values!996) (store mapRest!43831 mapKey!43831 mapValue!43831))))

(declare-fun b!1118479 () Bool)

(declare-fun res!747028 () Bool)

(assert (=> b!1118479 (=> (not res!747028) (not e!637071))))

(assert (=> b!1118479 (= res!747028 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24420))))

(declare-fun b!1118480 () Bool)

(assert (=> b!1118480 (= e!637071 e!637066)))

(declare-fun res!747027 () Bool)

(assert (=> b!1118480 (=> (not res!747027) (not e!637066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72909 (_ BitVec 32)) Bool)

(assert (=> b!1118480 (= res!747027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497503 mask!1564))))

(assert (=> b!1118480 (= lt!497503 (array!72910 (store (arr!35107 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35643 _keys!1208)))))

(declare-fun b!1118481 () Bool)

(declare-fun res!747021 () Bool)

(assert (=> b!1118481 (=> (not res!747021) (not e!637071))))

(assert (=> b!1118481 (= res!747021 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35643 _keys!1208))))))

(declare-fun b!1118482 () Bool)

(declare-fun e!637067 () Bool)

(assert (=> b!1118482 (= e!637065 (and e!637067 mapRes!43831))))

(declare-fun condMapEmpty!43831 () Bool)

(declare-fun mapDefault!43831 () ValueCell!13295)

