; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108850 () Bool)

(assert start!108850)

(declare-fun b_free!28363 () Bool)

(declare-fun b_next!28363 () Bool)

(assert (=> start!108850 (= b_free!28363 (not b_next!28363))))

(declare-fun tp!100205 () Bool)

(declare-fun b_and!46429 () Bool)

(assert (=> start!108850 (= tp!100205 b_and!46429)))

(declare-fun b!1285487 () Bool)

(declare-fun res!853965 () Bool)

(declare-fun e!734283 () Bool)

(assert (=> b!1285487 (=> (not res!853965) (not e!734283))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85062 0))(
  ( (array!85063 (arr!41033 (Array (_ BitVec 32) (_ BitVec 64))) (size!41583 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85062)

(assert (=> b!1285487 (= res!853965 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41583 _keys!1741))))))

(declare-fun mapIsEmpty!52562 () Bool)

(declare-fun mapRes!52562 () Bool)

(assert (=> mapIsEmpty!52562 mapRes!52562))

(declare-fun res!853961 () Bool)

(assert (=> start!108850 (=> (not res!853961) (not e!734283))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108850 (= res!853961 (validMask!0 mask!2175))))

(assert (=> start!108850 e!734283))

(declare-fun tp_is_empty!34003 () Bool)

(assert (=> start!108850 tp_is_empty!34003))

(assert (=> start!108850 true))

(declare-datatypes ((V!50441 0))(
  ( (V!50442 (val!17076 Int)) )
))
(declare-datatypes ((ValueCell!16103 0))(
  ( (ValueCellFull!16103 (v!19678 V!50441)) (EmptyCell!16103) )
))
(declare-datatypes ((array!85064 0))(
  ( (array!85065 (arr!41034 (Array (_ BitVec 32) ValueCell!16103)) (size!41584 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85064)

(declare-fun e!734285 () Bool)

(declare-fun array_inv!31117 (array!85064) Bool)

(assert (=> start!108850 (and (array_inv!31117 _values!1445) e!734285)))

(declare-fun array_inv!31118 (array!85062) Bool)

(assert (=> start!108850 (array_inv!31118 _keys!1741)))

(assert (=> start!108850 tp!100205))

(declare-fun b!1285488 () Bool)

(assert (=> b!1285488 (= e!734283 false)))

(declare-fun minValue!1387 () V!50441)

(declare-fun zeroValue!1387 () V!50441)

(declare-fun lt!576922 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21888 0))(
  ( (tuple2!21889 (_1!10955 (_ BitVec 64)) (_2!10955 V!50441)) )
))
(declare-datatypes ((List!29078 0))(
  ( (Nil!29075) (Cons!29074 (h!30283 tuple2!21888) (t!42622 List!29078)) )
))
(declare-datatypes ((ListLongMap!19545 0))(
  ( (ListLongMap!19546 (toList!9788 List!29078)) )
))
(declare-fun contains!7905 (ListLongMap!19545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4866 (array!85062 array!85064 (_ BitVec 32) (_ BitVec 32) V!50441 V!50441 (_ BitVec 32) Int) ListLongMap!19545)

(assert (=> b!1285488 (= lt!576922 (contains!7905 (getCurrentListMap!4866 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285489 () Bool)

(declare-fun e!734282 () Bool)

(assert (=> b!1285489 (= e!734282 tp_is_empty!34003)))

(declare-fun b!1285490 () Bool)

(declare-fun res!853962 () Bool)

(assert (=> b!1285490 (=> (not res!853962) (not e!734283))))

(declare-datatypes ((List!29079 0))(
  ( (Nil!29076) (Cons!29075 (h!30284 (_ BitVec 64)) (t!42623 List!29079)) )
))
(declare-fun arrayNoDuplicates!0 (array!85062 (_ BitVec 32) List!29079) Bool)

(assert (=> b!1285490 (= res!853962 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29076))))

(declare-fun b!1285491 () Bool)

(declare-fun res!853963 () Bool)

(assert (=> b!1285491 (=> (not res!853963) (not e!734283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85062 (_ BitVec 32)) Bool)

(assert (=> b!1285491 (= res!853963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52562 () Bool)

(declare-fun tp!100204 () Bool)

(declare-fun e!734284 () Bool)

(assert (=> mapNonEmpty!52562 (= mapRes!52562 (and tp!100204 e!734284))))

(declare-fun mapValue!52562 () ValueCell!16103)

(declare-fun mapKey!52562 () (_ BitVec 32))

(declare-fun mapRest!52562 () (Array (_ BitVec 32) ValueCell!16103))

(assert (=> mapNonEmpty!52562 (= (arr!41034 _values!1445) (store mapRest!52562 mapKey!52562 mapValue!52562))))

(declare-fun b!1285492 () Bool)

(assert (=> b!1285492 (= e!734284 tp_is_empty!34003)))

(declare-fun b!1285493 () Bool)

(declare-fun res!853964 () Bool)

(assert (=> b!1285493 (=> (not res!853964) (not e!734283))))

(assert (=> b!1285493 (= res!853964 (and (= (size!41584 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41583 _keys!1741) (size!41584 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285494 () Bool)

(assert (=> b!1285494 (= e!734285 (and e!734282 mapRes!52562))))

(declare-fun condMapEmpty!52562 () Bool)

(declare-fun mapDefault!52562 () ValueCell!16103)

