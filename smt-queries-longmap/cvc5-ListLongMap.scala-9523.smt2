; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113000 () Bool)

(assert start!113000)

(declare-fun b!1339373 () Bool)

(declare-fun e!762862 () Bool)

(declare-fun tp_is_empty!37051 () Bool)

(assert (=> b!1339373 (= e!762862 tp_is_empty!37051)))

(declare-fun res!888523 () Bool)

(declare-fun e!762859 () Bool)

(assert (=> start!113000 (=> (not res!888523) (not e!762859))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113000 (= res!888523 (validMask!0 mask!1977))))

(assert (=> start!113000 e!762859))

(assert (=> start!113000 true))

(declare-datatypes ((V!54505 0))(
  ( (V!54506 (val!18600 Int)) )
))
(declare-datatypes ((ValueCell!17627 0))(
  ( (ValueCellFull!17627 (v!21248 V!54505)) (EmptyCell!17627) )
))
(declare-datatypes ((array!90960 0))(
  ( (array!90961 (arr!43936 (Array (_ BitVec 32) ValueCell!17627)) (size!44486 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90960)

(declare-fun e!762863 () Bool)

(declare-fun array_inv!33129 (array!90960) Bool)

(assert (=> start!113000 (and (array_inv!33129 _values!1303) e!762863)))

(declare-datatypes ((array!90962 0))(
  ( (array!90963 (arr!43937 (Array (_ BitVec 32) (_ BitVec 64))) (size!44487 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90962)

(declare-fun array_inv!33130 (array!90962) Bool)

(assert (=> start!113000 (array_inv!33130 _keys!1571)))

(declare-fun mapIsEmpty!57283 () Bool)

(declare-fun mapRes!57283 () Bool)

(assert (=> mapIsEmpty!57283 mapRes!57283))

(declare-fun b!1339374 () Bool)

(assert (=> b!1339374 (= e!762863 (and e!762862 mapRes!57283))))

(declare-fun condMapEmpty!57283 () Bool)

(declare-fun mapDefault!57283 () ValueCell!17627)

