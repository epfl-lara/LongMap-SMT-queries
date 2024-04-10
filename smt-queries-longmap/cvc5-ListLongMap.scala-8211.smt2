; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100132 () Bool)

(assert start!100132)

(declare-fun b!1194130 () Bool)

(declare-fun e!678655 () Bool)

(assert (=> b!1194130 (= e!678655 false)))

(declare-fun lt!542726 () Bool)

(declare-datatypes ((array!77261 0))(
  ( (array!77262 (arr!37280 (Array (_ BitVec 32) (_ BitVec 64))) (size!37816 (_ BitVec 32))) )
))
(declare-fun lt!542727 () array!77261)

(declare-datatypes ((List!26254 0))(
  ( (Nil!26251) (Cons!26250 (h!27459 (_ BitVec 64)) (t!38925 List!26254)) )
))
(declare-fun arrayNoDuplicates!0 (array!77261 (_ BitVec 32) List!26254) Bool)

(assert (=> b!1194130 (= lt!542726 (arrayNoDuplicates!0 lt!542727 #b00000000000000000000000000000000 Nil!26251))))

(declare-fun b!1194131 () Bool)

(declare-fun res!794496 () Bool)

(declare-fun e!678651 () Bool)

(assert (=> b!1194131 (=> (not res!794496) (not e!678651))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194131 (= res!794496 (validKeyInArray!0 k!934))))

(declare-fun b!1194132 () Bool)

(declare-fun res!794493 () Bool)

(assert (=> b!1194132 (=> (not res!794493) (not e!678651))))

(declare-fun _keys!1208 () array!77261)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77261 (_ BitVec 32)) Bool)

(assert (=> b!1194132 (= res!794493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!794494 () Bool)

(assert (=> start!100132 (=> (not res!794494) (not e!678651))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100132 (= res!794494 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37816 _keys!1208))))))

(assert (=> start!100132 e!678651))

(declare-fun array_inv!28420 (array!77261) Bool)

(assert (=> start!100132 (array_inv!28420 _keys!1208)))

(assert (=> start!100132 true))

(declare-datatypes ((V!45449 0))(
  ( (V!45450 (val!15177 Int)) )
))
(declare-datatypes ((ValueCell!14411 0))(
  ( (ValueCellFull!14411 (v!17815 V!45449)) (EmptyCell!14411) )
))
(declare-datatypes ((array!77263 0))(
  ( (array!77264 (arr!37281 (Array (_ BitVec 32) ValueCell!14411)) (size!37817 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77263)

(declare-fun e!678652 () Bool)

(declare-fun array_inv!28421 (array!77263) Bool)

(assert (=> start!100132 (and (array_inv!28421 _values!996) e!678652)))

(declare-fun b!1194133 () Bool)

(assert (=> b!1194133 (= e!678651 e!678655)))

(declare-fun res!794495 () Bool)

(assert (=> b!1194133 (=> (not res!794495) (not e!678655))))

(assert (=> b!1194133 (= res!794495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542727 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194133 (= lt!542727 (array!77262 (store (arr!37280 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37816 _keys!1208)))))

(declare-fun b!1194134 () Bool)

(declare-fun res!794498 () Bool)

(assert (=> b!1194134 (=> (not res!794498) (not e!678651))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194134 (= res!794498 (and (= (size!37817 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37816 _keys!1208) (size!37817 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194135 () Bool)

(declare-fun res!794500 () Bool)

(assert (=> b!1194135 (=> (not res!794500) (not e!678651))))

(assert (=> b!1194135 (= res!794500 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26251))))

(declare-fun b!1194136 () Bool)

(declare-fun e!678654 () Bool)

(declare-fun tp_is_empty!30241 () Bool)

(assert (=> b!1194136 (= e!678654 tp_is_empty!30241)))

(declare-fun b!1194137 () Bool)

(declare-fun res!794492 () Bool)

(assert (=> b!1194137 (=> (not res!794492) (not e!678651))))

(assert (=> b!1194137 (= res!794492 (= (select (arr!37280 _keys!1208) i!673) k!934))))

(declare-fun b!1194138 () Bool)

(declare-fun e!678650 () Bool)

(assert (=> b!1194138 (= e!678650 tp_is_empty!30241)))

(declare-fun mapNonEmpty!47189 () Bool)

(declare-fun mapRes!47189 () Bool)

(declare-fun tp!89799 () Bool)

(assert (=> mapNonEmpty!47189 (= mapRes!47189 (and tp!89799 e!678650))))

(declare-fun mapKey!47189 () (_ BitVec 32))

(declare-fun mapValue!47189 () ValueCell!14411)

(declare-fun mapRest!47189 () (Array (_ BitVec 32) ValueCell!14411))

(assert (=> mapNonEmpty!47189 (= (arr!37281 _values!996) (store mapRest!47189 mapKey!47189 mapValue!47189))))

(declare-fun b!1194139 () Bool)

(declare-fun res!794499 () Bool)

(assert (=> b!1194139 (=> (not res!794499) (not e!678651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194139 (= res!794499 (validMask!0 mask!1564))))

(declare-fun b!1194140 () Bool)

(assert (=> b!1194140 (= e!678652 (and e!678654 mapRes!47189))))

(declare-fun condMapEmpty!47189 () Bool)

(declare-fun mapDefault!47189 () ValueCell!14411)

