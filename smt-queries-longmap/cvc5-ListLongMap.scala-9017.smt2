; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108862 () Bool)

(assert start!108862)

(declare-fun b_free!28375 () Bool)

(declare-fun b_next!28375 () Bool)

(assert (=> start!108862 (= b_free!28375 (not b_next!28375))))

(declare-fun tp!100241 () Bool)

(declare-fun b_and!46441 () Bool)

(assert (=> start!108862 (= tp!100241 b_and!46441)))

(declare-fun mapIsEmpty!52580 () Bool)

(declare-fun mapRes!52580 () Bool)

(assert (=> mapIsEmpty!52580 mapRes!52580))

(declare-fun b!1285631 () Bool)

(declare-fun e!734372 () Bool)

(declare-fun tp_is_empty!34015 () Bool)

(assert (=> b!1285631 (= e!734372 tp_is_empty!34015)))

(declare-fun mapNonEmpty!52580 () Bool)

(declare-fun tp!100240 () Bool)

(assert (=> mapNonEmpty!52580 (= mapRes!52580 (and tp!100240 e!734372))))

(declare-fun mapKey!52580 () (_ BitVec 32))

(declare-datatypes ((V!50457 0))(
  ( (V!50458 (val!17082 Int)) )
))
(declare-datatypes ((ValueCell!16109 0))(
  ( (ValueCellFull!16109 (v!19684 V!50457)) (EmptyCell!16109) )
))
(declare-fun mapRest!52580 () (Array (_ BitVec 32) ValueCell!16109))

(declare-fun mapValue!52580 () ValueCell!16109)

(declare-datatypes ((array!85084 0))(
  ( (array!85085 (arr!41044 (Array (_ BitVec 32) ValueCell!16109)) (size!41594 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85084)

(assert (=> mapNonEmpty!52580 (= (arr!41044 _values!1445) (store mapRest!52580 mapKey!52580 mapValue!52580))))

(declare-fun b!1285632 () Bool)

(declare-fun e!734371 () Bool)

(assert (=> b!1285632 (= e!734371 false)))

(declare-fun minValue!1387 () V!50457)

(declare-fun zeroValue!1387 () V!50457)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576940 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85086 0))(
  ( (array!85087 (arr!41045 (Array (_ BitVec 32) (_ BitVec 64))) (size!41595 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85086)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21896 0))(
  ( (tuple2!21897 (_1!10959 (_ BitVec 64)) (_2!10959 V!50457)) )
))
(declare-datatypes ((List!29085 0))(
  ( (Nil!29082) (Cons!29081 (h!30290 tuple2!21896) (t!42629 List!29085)) )
))
(declare-datatypes ((ListLongMap!19553 0))(
  ( (ListLongMap!19554 (toList!9792 List!29085)) )
))
(declare-fun contains!7909 (ListLongMap!19553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4870 (array!85086 array!85084 (_ BitVec 32) (_ BitVec 32) V!50457 V!50457 (_ BitVec 32) Int) ListLongMap!19553)

(assert (=> b!1285632 (= lt!576940 (contains!7909 (getCurrentListMap!4870 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285633 () Bool)

(declare-fun e!734374 () Bool)

(declare-fun e!734373 () Bool)

(assert (=> b!1285633 (= e!734374 (and e!734373 mapRes!52580))))

(declare-fun condMapEmpty!52580 () Bool)

(declare-fun mapDefault!52580 () ValueCell!16109)

