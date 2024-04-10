; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3942 () Bool)

(assert start!3942)

(declare-fun b_free!847 () Bool)

(declare-fun b_next!847 () Bool)

(assert (=> start!3942 (= b_free!847 (not b_next!847))))

(declare-fun tp!3960 () Bool)

(declare-fun b_and!1657 () Bool)

(assert (=> start!3942 (= tp!3960 b_and!1657)))

(declare-fun b!28086 () Bool)

(declare-fun e!18199 () Bool)

(declare-fun tp_is_empty!1201 () Bool)

(assert (=> b!28086 (= e!18199 tp_is_empty!1201)))

(declare-fun b!28087 () Bool)

(declare-fun res!16693 () Bool)

(declare-fun e!18200 () Bool)

(assert (=> b!28087 (=> (not res!16693) (not e!18200))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28087 (= res!16693 (validKeyInArray!0 k!1304))))

(declare-fun b!28088 () Bool)

(declare-fun e!18202 () Bool)

(assert (=> b!28088 (= e!18202 tp_is_empty!1201)))

(declare-fun b!28089 () Bool)

(declare-fun res!16695 () Bool)

(assert (=> b!28089 (=> (not res!16695) (not e!18200))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1427 0))(
  ( (V!1428 (val!627 Int)) )
))
(declare-datatypes ((ValueCell!401 0))(
  ( (ValueCellFull!401 (v!1716 V!1427)) (EmptyCell!401) )
))
(declare-datatypes ((array!1643 0))(
  ( (array!1644 (arr!775 (Array (_ BitVec 32) ValueCell!401)) (size!876 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1643)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1645 0))(
  ( (array!1646 (arr!776 (Array (_ BitVec 32) (_ BitVec 64))) (size!877 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1645)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1427)

(declare-fun minValue!1443 () V!1427)

(declare-datatypes ((tuple2!1046 0))(
  ( (tuple2!1047 (_1!534 (_ BitVec 64)) (_2!534 V!1427)) )
))
(declare-datatypes ((List!648 0))(
  ( (Nil!645) (Cons!644 (h!1211 tuple2!1046) (t!3341 List!648)) )
))
(declare-datatypes ((ListLongMap!623 0))(
  ( (ListLongMap!624 (toList!327 List!648)) )
))
(declare-fun contains!267 (ListLongMap!623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!157 (array!1645 array!1643 (_ BitVec 32) (_ BitVec 32) V!1427 V!1427 (_ BitVec 32) Int) ListLongMap!623)

(assert (=> b!28089 (= res!16695 (not (contains!267 (getCurrentListMap!157 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!28090 () Bool)

(declare-fun e!18201 () Bool)

(declare-fun mapRes!1330 () Bool)

(assert (=> b!28090 (= e!18201 (and e!18199 mapRes!1330))))

(declare-fun condMapEmpty!1330 () Bool)

(declare-fun mapDefault!1330 () ValueCell!401)

