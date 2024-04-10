; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100442 () Bool)

(assert start!100442)

(declare-fun b_free!25765 () Bool)

(declare-fun b_next!25765 () Bool)

(assert (=> start!100442 (= b_free!25765 (not b_next!25765))))

(declare-fun tp!90285 () Bool)

(declare-fun b_and!42417 () Bool)

(assert (=> start!100442 (= tp!90285 b_and!42417)))

(declare-fun b!1199232 () Bool)

(declare-fun res!798200 () Bool)

(declare-fun e!681146 () Bool)

(assert (=> b!1199232 (=> (not res!798200) (not e!681146))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199232 (= res!798200 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47546 () Bool)

(declare-fun mapRes!47546 () Bool)

(declare-fun tp!90284 () Bool)

(declare-fun e!681149 () Bool)

(assert (=> mapNonEmpty!47546 (= mapRes!47546 (and tp!90284 e!681149))))

(declare-fun mapKey!47546 () (_ BitVec 32))

(declare-datatypes ((V!45753 0))(
  ( (V!45754 (val!15291 Int)) )
))
(declare-datatypes ((ValueCell!14525 0))(
  ( (ValueCellFull!14525 (v!17929 V!45753)) (EmptyCell!14525) )
))
(declare-datatypes ((array!77715 0))(
  ( (array!77716 (arr!37502 (Array (_ BitVec 32) ValueCell!14525)) (size!38038 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77715)

(declare-fun mapRest!47546 () (Array (_ BitVec 32) ValueCell!14525))

(declare-fun mapValue!47546 () ValueCell!14525)

(assert (=> mapNonEmpty!47546 (= (arr!37502 _values!996) (store mapRest!47546 mapKey!47546 mapValue!47546))))

(declare-fun b!1199233 () Bool)

(declare-fun res!798204 () Bool)

(declare-fun e!681145 () Bool)

(assert (=> b!1199233 (=> (not res!798204) (not e!681145))))

(declare-datatypes ((array!77717 0))(
  ( (array!77718 (arr!37503 (Array (_ BitVec 32) (_ BitVec 64))) (size!38039 (_ BitVec 32))) )
))
(declare-fun lt!543714 () array!77717)

(declare-datatypes ((List!26388 0))(
  ( (Nil!26385) (Cons!26384 (h!27593 (_ BitVec 64)) (t!39133 List!26388)) )
))
(declare-fun arrayNoDuplicates!0 (array!77717 (_ BitVec 32) List!26388) Bool)

(assert (=> b!1199233 (= res!798204 (arrayNoDuplicates!0 lt!543714 #b00000000000000000000000000000000 Nil!26385))))

(declare-fun b!1199234 () Bool)

(declare-fun res!798207 () Bool)

(assert (=> b!1199234 (=> (not res!798207) (not e!681146))))

(declare-fun _keys!1208 () array!77717)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199234 (= res!798207 (= (select (arr!37503 _keys!1208) i!673) k!934))))

(declare-fun b!1199235 () Bool)

(declare-fun res!798206 () Bool)

(assert (=> b!1199235 (=> (not res!798206) (not e!681146))))

(assert (=> b!1199235 (= res!798206 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38039 _keys!1208))))))

(declare-fun b!1199237 () Bool)

(declare-fun res!798203 () Bool)

(assert (=> b!1199237 (=> (not res!798203) (not e!681146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199237 (= res!798203 (validKeyInArray!0 k!934))))

(declare-fun b!1199238 () Bool)

(declare-fun res!798210 () Bool)

(assert (=> b!1199238 (=> (not res!798210) (not e!681146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77717 (_ BitVec 32)) Bool)

(assert (=> b!1199238 (= res!798210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199239 () Bool)

(declare-fun tp_is_empty!30469 () Bool)

(assert (=> b!1199239 (= e!681149 tp_is_empty!30469)))

(declare-fun b!1199240 () Bool)

(declare-fun e!681148 () Bool)

(assert (=> b!1199240 (= e!681148 true)))

(declare-fun zeroValue!944 () V!45753)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19572 0))(
  ( (tuple2!19573 (_1!9797 (_ BitVec 64)) (_2!9797 V!45753)) )
))
(declare-datatypes ((List!26389 0))(
  ( (Nil!26386) (Cons!26385 (h!27594 tuple2!19572) (t!39134 List!26389)) )
))
(declare-datatypes ((ListLongMap!17541 0))(
  ( (ListLongMap!17542 (toList!8786 List!26389)) )
))
(declare-fun lt!543712 () ListLongMap!17541)

(declare-fun minValue!944 () V!45753)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5225 (array!77717 array!77715 (_ BitVec 32) (_ BitVec 32) V!45753 V!45753 (_ BitVec 32) Int) ListLongMap!17541)

(declare-fun dynLambda!3145 (Int (_ BitVec 64)) V!45753)

(assert (=> b!1199240 (= lt!543712 (getCurrentListMapNoExtraKeys!5225 lt!543714 (array!77716 (store (arr!37502 _values!996) i!673 (ValueCellFull!14525 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38038 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543715 () ListLongMap!17541)

(assert (=> b!1199240 (= lt!543715 (getCurrentListMapNoExtraKeys!5225 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199241 () Bool)

(declare-fun e!681150 () Bool)

(declare-fun e!681151 () Bool)

(assert (=> b!1199241 (= e!681150 (and e!681151 mapRes!47546))))

(declare-fun condMapEmpty!47546 () Bool)

(declare-fun mapDefault!47546 () ValueCell!14525)

