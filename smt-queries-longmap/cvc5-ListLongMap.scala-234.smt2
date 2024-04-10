; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4086 () Bool)

(assert start!4086)

(declare-fun b_free!991 () Bool)

(declare-fun b_next!991 () Bool)

(assert (=> start!4086 (= b_free!991 (not b_next!991))))

(declare-fun tp!4393 () Bool)

(declare-fun b_and!1801 () Bool)

(assert (=> start!4086 (= tp!4393 b_and!1801)))

(declare-fun b!30255 () Bool)

(declare-fun res!18216 () Bool)

(declare-fun e!19443 () Bool)

(assert (=> b!30255 (=> (not res!18216) (not e!19443))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30255 (= res!18216 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1546 () Bool)

(declare-fun mapRes!1546 () Bool)

(assert (=> mapIsEmpty!1546 mapRes!1546))

(declare-fun b!30256 () Bool)

(declare-fun res!18219 () Bool)

(assert (=> b!30256 (=> (not res!18219) (not e!19443))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1619 0))(
  ( (V!1620 (val!699 Int)) )
))
(declare-datatypes ((ValueCell!473 0))(
  ( (ValueCellFull!473 (v!1788 V!1619)) (EmptyCell!473) )
))
(declare-datatypes ((array!1919 0))(
  ( (array!1920 (arr!913 (Array (_ BitVec 32) ValueCell!473)) (size!1014 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1919)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1921 0))(
  ( (array!1922 (arr!914 (Array (_ BitVec 32) (_ BitVec 64))) (size!1015 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1921)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1619)

(declare-fun minValue!1443 () V!1619)

(declare-datatypes ((tuple2!1156 0))(
  ( (tuple2!1157 (_1!589 (_ BitVec 64)) (_2!589 V!1619)) )
))
(declare-datatypes ((List!751 0))(
  ( (Nil!748) (Cons!747 (h!1314 tuple2!1156) (t!3444 List!751)) )
))
(declare-datatypes ((ListLongMap!733 0))(
  ( (ListLongMap!734 (toList!382 List!751)) )
))
(declare-fun contains!322 (ListLongMap!733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!210 (array!1921 array!1919 (_ BitVec 32) (_ BitVec 32) V!1619 V!1619 (_ BitVec 32) Int) ListLongMap!733)

(assert (=> b!30256 (= res!18219 (not (contains!322 (getCurrentListMap!210 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!30257 () Bool)

(declare-fun res!18213 () Bool)

(assert (=> b!30257 (=> (not res!18213) (not e!19443))))

(declare-fun arrayContainsKey!0 (array!1921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30257 (= res!18213 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30258 () Bool)

(declare-fun e!19442 () Bool)

(declare-fun e!19441 () Bool)

(assert (=> b!30258 (= e!19442 (and e!19441 mapRes!1546))))

(declare-fun condMapEmpty!1546 () Bool)

(declare-fun mapDefault!1546 () ValueCell!473)

