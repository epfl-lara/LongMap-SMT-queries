; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97784 () Bool)

(assert start!97784)

(declare-fun b_free!23485 () Bool)

(declare-fun b_next!23485 () Bool)

(assert (=> start!97784 (= b_free!23485 (not b_next!23485))))

(declare-fun tp!83158 () Bool)

(declare-fun b_and!37759 () Bool)

(assert (=> start!97784 (= tp!83158 b_and!37759)))

(declare-fun b!1118600 () Bool)

(declare-fun e!637130 () Bool)

(assert (=> b!1118600 (= e!637130 true)))

(declare-datatypes ((V!42481 0))(
  ( (V!42482 (val!14064 Int)) )
))
(declare-fun zeroValue!944 () V!42481)

(declare-datatypes ((array!72921 0))(
  ( (array!72922 (arr!35113 (Array (_ BitVec 32) (_ BitVec 64))) (size!35649 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72921)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13298 0))(
  ( (ValueCellFull!13298 (v!16697 V!42481)) (EmptyCell!13298) )
))
(declare-datatypes ((array!72923 0))(
  ( (array!72924 (arr!35114 (Array (_ BitVec 32) ValueCell!13298)) (size!35650 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72923)

(declare-fun minValue!944 () V!42481)

(declare-datatypes ((tuple2!17642 0))(
  ( (tuple2!17643 (_1!8832 (_ BitVec 64)) (_2!8832 V!42481)) )
))
(declare-datatypes ((List!24428 0))(
  ( (Nil!24425) (Cons!24424 (h!25633 tuple2!17642) (t!34909 List!24428)) )
))
(declare-datatypes ((ListLongMap!15611 0))(
  ( (ListLongMap!15612 (toList!7821 List!24428)) )
))
(declare-fun lt!497531 () ListLongMap!15611)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4311 (array!72921 array!72923 (_ BitVec 32) (_ BitVec 32) V!42481 V!42481 (_ BitVec 32) Int) ListLongMap!15611)

(assert (=> b!1118600 (= lt!497531 (getCurrentListMapNoExtraKeys!4311 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118601 () Bool)

(declare-fun res!747123 () Bool)

(declare-fun e!637133 () Bool)

(assert (=> b!1118601 (=> (not res!747123) (not e!637133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72921 (_ BitVec 32)) Bool)

(assert (=> b!1118601 (= res!747123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118602 () Bool)

(declare-fun e!637132 () Bool)

(declare-fun tp_is_empty!28015 () Bool)

(assert (=> b!1118602 (= e!637132 tp_is_empty!28015)))

(declare-fun b!1118603 () Bool)

(declare-fun e!637134 () Bool)

(assert (=> b!1118603 (= e!637134 (not e!637130))))

(declare-fun res!747119 () Bool)

(assert (=> b!1118603 (=> res!747119 e!637130)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118603 (= res!747119 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118603 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36712 0))(
  ( (Unit!36713) )
))
(declare-fun lt!497530 () Unit!36712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72921 (_ BitVec 64) (_ BitVec 32)) Unit!36712)

(assert (=> b!1118603 (= lt!497530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43840 () Bool)

(declare-fun mapRes!43840 () Bool)

(assert (=> mapIsEmpty!43840 mapRes!43840))

(declare-fun res!747122 () Bool)

(assert (=> start!97784 (=> (not res!747122) (not e!637133))))

(assert (=> start!97784 (= res!747122 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35649 _keys!1208))))))

(assert (=> start!97784 e!637133))

(assert (=> start!97784 tp_is_empty!28015))

(declare-fun array_inv!26980 (array!72921) Bool)

(assert (=> start!97784 (array_inv!26980 _keys!1208)))

(assert (=> start!97784 true))

(assert (=> start!97784 tp!83158))

(declare-fun e!637131 () Bool)

(declare-fun array_inv!26981 (array!72923) Bool)

(assert (=> start!97784 (and (array_inv!26981 _values!996) e!637131)))

(declare-fun b!1118604 () Bool)

(assert (=> b!1118604 (= e!637133 e!637134)))

(declare-fun res!747126 () Bool)

(assert (=> b!1118604 (=> (not res!747126) (not e!637134))))

(declare-fun lt!497529 () array!72921)

(assert (=> b!1118604 (= res!747126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497529 mask!1564))))

(assert (=> b!1118604 (= lt!497529 (array!72922 (store (arr!35113 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35649 _keys!1208)))))

(declare-fun mapNonEmpty!43840 () Bool)

(declare-fun tp!83159 () Bool)

(assert (=> mapNonEmpty!43840 (= mapRes!43840 (and tp!83159 e!637132))))

(declare-fun mapValue!43840 () ValueCell!13298)

(declare-fun mapKey!43840 () (_ BitVec 32))

(declare-fun mapRest!43840 () (Array (_ BitVec 32) ValueCell!13298))

(assert (=> mapNonEmpty!43840 (= (arr!35114 _values!996) (store mapRest!43840 mapKey!43840 mapValue!43840))))

(declare-fun b!1118605 () Bool)

(declare-fun res!747124 () Bool)

(assert (=> b!1118605 (=> (not res!747124) (not e!637133))))

(assert (=> b!1118605 (= res!747124 (= (select (arr!35113 _keys!1208) i!673) k!934))))

(declare-fun b!1118606 () Bool)

(declare-fun res!747127 () Bool)

(assert (=> b!1118606 (=> (not res!747127) (not e!637133))))

(assert (=> b!1118606 (= res!747127 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35649 _keys!1208))))))

(declare-fun b!1118607 () Bool)

(declare-fun res!747117 () Bool)

(assert (=> b!1118607 (=> (not res!747117) (not e!637133))))

(assert (=> b!1118607 (= res!747117 (and (= (size!35650 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35649 _keys!1208) (size!35650 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118608 () Bool)

(declare-fun res!747118 () Bool)

(assert (=> b!1118608 (=> (not res!747118) (not e!637134))))

(declare-datatypes ((List!24429 0))(
  ( (Nil!24426) (Cons!24425 (h!25634 (_ BitVec 64)) (t!34910 List!24429)) )
))
(declare-fun arrayNoDuplicates!0 (array!72921 (_ BitVec 32) List!24429) Bool)

(assert (=> b!1118608 (= res!747118 (arrayNoDuplicates!0 lt!497529 #b00000000000000000000000000000000 Nil!24426))))

(declare-fun b!1118609 () Bool)

(declare-fun res!747120 () Bool)

(assert (=> b!1118609 (=> (not res!747120) (not e!637133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118609 (= res!747120 (validKeyInArray!0 k!934))))

(declare-fun b!1118610 () Bool)

(declare-fun e!637129 () Bool)

(assert (=> b!1118610 (= e!637129 tp_is_empty!28015)))

(declare-fun b!1118611 () Bool)

(declare-fun res!747121 () Bool)

(assert (=> b!1118611 (=> (not res!747121) (not e!637133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118611 (= res!747121 (validMask!0 mask!1564))))

(declare-fun b!1118612 () Bool)

(declare-fun res!747125 () Bool)

(assert (=> b!1118612 (=> (not res!747125) (not e!637133))))

(assert (=> b!1118612 (= res!747125 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24426))))

(declare-fun b!1118613 () Bool)

(assert (=> b!1118613 (= e!637131 (and e!637129 mapRes!43840))))

(declare-fun condMapEmpty!43840 () Bool)

(declare-fun mapDefault!43840 () ValueCell!13298)

