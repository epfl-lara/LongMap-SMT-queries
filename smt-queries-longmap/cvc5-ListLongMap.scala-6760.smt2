; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84826 () Bool)

(assert start!84826)

(declare-fun b!991567 () Bool)

(declare-fun e!559233 () Bool)

(declare-fun tp_is_empty!23335 () Bool)

(assert (=> b!991567 (= e!559233 tp_is_empty!23335)))

(declare-fun mapNonEmpty!37065 () Bool)

(declare-fun mapRes!37065 () Bool)

(declare-fun tp!70136 () Bool)

(declare-fun e!559231 () Bool)

(assert (=> mapNonEmpty!37065 (= mapRes!37065 (and tp!70136 e!559231))))

(declare-datatypes ((V!36097 0))(
  ( (V!36098 (val!11718 Int)) )
))
(declare-datatypes ((ValueCell!11186 0))(
  ( (ValueCellFull!11186 (v!14294 V!36097)) (EmptyCell!11186) )
))
(declare-fun mapValue!37065 () ValueCell!11186)

(declare-fun mapKey!37065 () (_ BitVec 32))

(declare-datatypes ((array!62635 0))(
  ( (array!62636 (arr!30165 (Array (_ BitVec 32) ValueCell!11186)) (size!30644 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62635)

(declare-fun mapRest!37065 () (Array (_ BitVec 32) ValueCell!11186))

(assert (=> mapNonEmpty!37065 (= (arr!30165 _values!1551) (store mapRest!37065 mapKey!37065 mapValue!37065))))

(declare-fun b!991568 () Bool)

(declare-fun res!662802 () Bool)

(declare-fun e!559234 () Bool)

(assert (=> b!991568 (=> (not res!662802) (not e!559234))))

(declare-datatypes ((array!62637 0))(
  ( (array!62638 (arr!30166 (Array (_ BitVec 32) (_ BitVec 64))) (size!30645 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62637)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62637 (_ BitVec 32)) Bool)

(assert (=> b!991568 (= res!662802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991569 () Bool)

(declare-fun res!662803 () Bool)

(assert (=> b!991569 (=> (not res!662803) (not e!559234))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991569 (= res!662803 (and (= (size!30644 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30645 _keys!1945) (size!30644 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun res!662801 () Bool)

(assert (=> start!84826 (=> (not res!662801) (not e!559234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84826 (= res!662801 (validMask!0 mask!2471))))

(assert (=> start!84826 e!559234))

(assert (=> start!84826 true))

(declare-fun e!559232 () Bool)

(declare-fun array_inv!23297 (array!62635) Bool)

(assert (=> start!84826 (and (array_inv!23297 _values!1551) e!559232)))

(declare-fun array_inv!23298 (array!62637) Bool)

(assert (=> start!84826 (array_inv!23298 _keys!1945)))

(declare-fun b!991570 () Bool)

(assert (=> b!991570 (= e!559231 tp_is_empty!23335)))

(declare-fun b!991571 () Bool)

(assert (=> b!991571 (= e!559232 (and e!559233 mapRes!37065))))

(declare-fun condMapEmpty!37065 () Bool)

(declare-fun mapDefault!37065 () ValueCell!11186)

