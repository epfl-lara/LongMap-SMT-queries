; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109388 () Bool)

(assert start!109388)

(declare-fun b_free!28877 () Bool)

(declare-fun b_next!28877 () Bool)

(assert (=> start!109388 (= b_free!28877 (not b_next!28877))))

(declare-fun tp!101749 () Bool)

(declare-fun b_and!46967 () Bool)

(assert (=> start!109388 (= tp!101749 b_and!46967)))

(declare-fun b!1294907 () Bool)

(declare-fun e!738868 () Bool)

(declare-fun tp_is_empty!34517 () Bool)

(assert (=> b!1294907 (= e!738868 tp_is_empty!34517)))

(declare-fun b!1294908 () Bool)

(declare-fun res!860579 () Bool)

(declare-fun e!738869 () Bool)

(assert (=> b!1294908 (=> (not res!860579) (not e!738869))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86054 0))(
  ( (array!86055 (arr!41528 (Array (_ BitVec 32) (_ BitVec 64))) (size!42078 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86054)

(assert (=> b!1294908 (= res!860579 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42078 _keys!1741))))))

(declare-fun mapNonEmpty!53336 () Bool)

(declare-fun mapRes!53336 () Bool)

(declare-fun tp!101750 () Bool)

(assert (=> mapNonEmpty!53336 (= mapRes!53336 (and tp!101750 e!738868))))

(declare-datatypes ((V!51125 0))(
  ( (V!51126 (val!17333 Int)) )
))
(declare-datatypes ((ValueCell!16360 0))(
  ( (ValueCellFull!16360 (v!19936 V!51125)) (EmptyCell!16360) )
))
(declare-fun mapValue!53336 () ValueCell!16360)

(declare-datatypes ((array!86056 0))(
  ( (array!86057 (arr!41529 (Array (_ BitVec 32) ValueCell!16360)) (size!42079 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86056)

(declare-fun mapRest!53336 () (Array (_ BitVec 32) ValueCell!16360))

(declare-fun mapKey!53336 () (_ BitVec 32))

(assert (=> mapNonEmpty!53336 (= (arr!41529 _values!1445) (store mapRest!53336 mapKey!53336 mapValue!53336))))

(declare-fun mapIsEmpty!53336 () Bool)

(assert (=> mapIsEmpty!53336 mapRes!53336))

(declare-fun b!1294909 () Bool)

(declare-fun res!860583 () Bool)

(assert (=> b!1294909 (=> (not res!860583) (not e!738869))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86054 (_ BitVec 32)) Bool)

(assert (=> b!1294909 (= res!860583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294910 () Bool)

(declare-fun res!860582 () Bool)

(assert (=> b!1294910 (=> (not res!860582) (not e!738869))))

(declare-fun minValue!1387 () V!51125)

(declare-fun zeroValue!1387 () V!51125)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22312 0))(
  ( (tuple2!22313 (_1!11167 (_ BitVec 64)) (_2!11167 V!51125)) )
))
(declare-datatypes ((List!29456 0))(
  ( (Nil!29453) (Cons!29452 (h!30661 tuple2!22312) (t!43020 List!29456)) )
))
(declare-datatypes ((ListLongMap!19969 0))(
  ( (ListLongMap!19970 (toList!10000 List!29456)) )
))
(declare-fun contains!8118 (ListLongMap!19969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5037 (array!86054 array!86056 (_ BitVec 32) (_ BitVec 32) V!51125 V!51125 (_ BitVec 32) Int) ListLongMap!19969)

(assert (=> b!1294910 (= res!860582 (contains!8118 (getCurrentListMap!5037 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1294911 () Bool)

(declare-fun res!860581 () Bool)

(assert (=> b!1294911 (=> (not res!860581) (not e!738869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294911 (= res!860581 (not (validKeyInArray!0 (select (arr!41528 _keys!1741) from!2144))))))

(declare-fun b!1294912 () Bool)

(declare-fun e!738870 () Bool)

(declare-fun e!738871 () Bool)

(assert (=> b!1294912 (= e!738870 (and e!738871 mapRes!53336))))

(declare-fun condMapEmpty!53336 () Bool)

(declare-fun mapDefault!53336 () ValueCell!16360)

