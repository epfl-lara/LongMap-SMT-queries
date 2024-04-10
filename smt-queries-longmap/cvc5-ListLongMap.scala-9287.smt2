; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111070 () Bool)

(assert start!111070)

(declare-fun b_free!29905 () Bool)

(declare-fun b_next!29905 () Bool)

(assert (=> start!111070 (= b_free!29905 (not b_next!29905))))

(declare-fun tp!105037 () Bool)

(declare-fun b_and!48113 () Bool)

(assert (=> start!111070 (= tp!105037 b_and!48113)))

(declare-fun b!1315034 () Bool)

(declare-fun e!750150 () Bool)

(declare-fun tp_is_empty!35635 () Bool)

(assert (=> b!1315034 (= e!750150 tp_is_empty!35635)))

(declare-fun b!1315035 () Bool)

(declare-fun e!750152 () Bool)

(assert (=> b!1315035 (= e!750152 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88234 0))(
  ( (array!88235 (arr!42597 (Array (_ BitVec 32) (_ BitVec 64))) (size!43147 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88234)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52617 0))(
  ( (V!52618 (val!17892 Int)) )
))
(declare-datatypes ((ValueCell!16919 0))(
  ( (ValueCellFull!16919 (v!20519 V!52617)) (EmptyCell!16919) )
))
(declare-datatypes ((array!88236 0))(
  ( (array!88237 (arr!42598 (Array (_ BitVec 32) ValueCell!16919)) (size!43148 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88236)

(declare-fun zeroValue!1296 () V!52617)

(declare-fun lt!585867 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52617)

(declare-datatypes ((tuple2!23076 0))(
  ( (tuple2!23077 (_1!11549 (_ BitVec 64)) (_2!11549 V!52617)) )
))
(declare-datatypes ((List!30213 0))(
  ( (Nil!30210) (Cons!30209 (h!31418 tuple2!23076) (t!43819 List!30213)) )
))
(declare-datatypes ((ListLongMap!20733 0))(
  ( (ListLongMap!20734 (toList!10382 List!30213)) )
))
(declare-fun contains!8532 (ListLongMap!20733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5395 (array!88234 array!88236 (_ BitVec 32) (_ BitVec 32) V!52617 V!52617 (_ BitVec 32) Int) ListLongMap!20733)

(assert (=> b!1315035 (= lt!585867 (contains!8532 (getCurrentListMap!5395 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315036 () Bool)

(declare-fun e!750149 () Bool)

(assert (=> b!1315036 (= e!750149 tp_is_empty!35635)))

(declare-fun res!873005 () Bool)

(assert (=> start!111070 (=> (not res!873005) (not e!750152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111070 (= res!873005 (validMask!0 mask!2040))))

(assert (=> start!111070 e!750152))

(assert (=> start!111070 tp!105037))

(declare-fun array_inv!32171 (array!88234) Bool)

(assert (=> start!111070 (array_inv!32171 _keys!1628)))

(assert (=> start!111070 true))

(assert (=> start!111070 tp_is_empty!35635))

(declare-fun e!750148 () Bool)

(declare-fun array_inv!32172 (array!88236) Bool)

(assert (=> start!111070 (and (array_inv!32172 _values!1354) e!750148)))

(declare-fun mapIsEmpty!55081 () Bool)

(declare-fun mapRes!55081 () Bool)

(assert (=> mapIsEmpty!55081 mapRes!55081))

(declare-fun b!1315037 () Bool)

(assert (=> b!1315037 (= e!750148 (and e!750149 mapRes!55081))))

(declare-fun condMapEmpty!55081 () Bool)

(declare-fun mapDefault!55081 () ValueCell!16919)

