; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111152 () Bool)

(assert start!111152)

(declare-fun b_free!29987 () Bool)

(declare-fun b_next!29987 () Bool)

(assert (=> start!111152 (= b_free!29987 (not b_next!29987))))

(declare-fun tp!105283 () Bool)

(declare-fun b_and!48195 () Bool)

(assert (=> start!111152 (= tp!105283 b_and!48195)))

(declare-fun b!1316054 () Bool)

(declare-fun e!750766 () Bool)

(declare-fun tp_is_empty!35717 () Bool)

(assert (=> b!1316054 (= e!750766 tp_is_empty!35717)))

(declare-fun b!1316055 () Bool)

(declare-fun e!750763 () Bool)

(assert (=> b!1316055 (= e!750763 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88392 0))(
  ( (array!88393 (arr!42676 (Array (_ BitVec 32) (_ BitVec 64))) (size!43226 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88392)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52725 0))(
  ( (V!52726 (val!17933 Int)) )
))
(declare-fun minValue!1296 () V!52725)

(declare-fun zeroValue!1296 () V!52725)

(declare-fun lt!585990 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16960 0))(
  ( (ValueCellFull!16960 (v!20560 V!52725)) (EmptyCell!16960) )
))
(declare-datatypes ((array!88394 0))(
  ( (array!88395 (arr!42677 (Array (_ BitVec 32) ValueCell!16960)) (size!43227 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88394)

(declare-datatypes ((tuple2!23136 0))(
  ( (tuple2!23137 (_1!11579 (_ BitVec 64)) (_2!11579 V!52725)) )
))
(declare-datatypes ((List!30275 0))(
  ( (Nil!30272) (Cons!30271 (h!31480 tuple2!23136) (t!43881 List!30275)) )
))
(declare-datatypes ((ListLongMap!20793 0))(
  ( (ListLongMap!20794 (toList!10412 List!30275)) )
))
(declare-fun contains!8562 (ListLongMap!20793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5425 (array!88392 array!88394 (_ BitVec 32) (_ BitVec 32) V!52725 V!52725 (_ BitVec 32) Int) ListLongMap!20793)

(assert (=> b!1316055 (= lt!585990 (contains!8562 (getCurrentListMap!5425 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!55204 () Bool)

(declare-fun mapRes!55204 () Bool)

(assert (=> mapIsEmpty!55204 mapRes!55204))

(declare-fun b!1316056 () Bool)

(declare-fun res!873659 () Bool)

(assert (=> b!1316056 (=> (not res!873659) (not e!750763))))

(assert (=> b!1316056 (= res!873659 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43226 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316057 () Bool)

(declare-fun e!750765 () Bool)

(assert (=> b!1316057 (= e!750765 tp_is_empty!35717)))

(declare-fun b!1316058 () Bool)

(declare-fun e!750767 () Bool)

(assert (=> b!1316058 (= e!750767 (and e!750765 mapRes!55204))))

(declare-fun condMapEmpty!55204 () Bool)

(declare-fun mapDefault!55204 () ValueCell!16960)

