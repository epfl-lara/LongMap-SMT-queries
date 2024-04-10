; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108782 () Bool)

(assert start!108782)

(declare-fun b_free!28295 () Bool)

(declare-fun b_next!28295 () Bool)

(assert (=> start!108782 (= b_free!28295 (not b_next!28295))))

(declare-fun tp!100000 () Bool)

(declare-fun b_and!46361 () Bool)

(assert (=> start!108782 (= tp!100000 b_and!46361)))

(declare-fun b!1284572 () Bool)

(declare-fun res!853353 () Bool)

(declare-fun e!733773 () Bool)

(assert (=> b!1284572 (=> (not res!853353) (not e!733773))))

(declare-datatypes ((array!84928 0))(
  ( (array!84929 (arr!40966 (Array (_ BitVec 32) (_ BitVec 64))) (size!41516 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84928)

(declare-datatypes ((List!29031 0))(
  ( (Nil!29028) (Cons!29027 (h!30236 (_ BitVec 64)) (t!42575 List!29031)) )
))
(declare-fun arrayNoDuplicates!0 (array!84928 (_ BitVec 32) List!29031) Bool)

(assert (=> b!1284572 (= res!853353 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29028))))

(declare-fun b!1284573 () Bool)

(declare-fun res!853352 () Bool)

(assert (=> b!1284573 (=> (not res!853352) (not e!733773))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84928 (_ BitVec 32)) Bool)

(assert (=> b!1284573 (= res!853352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284574 () Bool)

(declare-fun res!853354 () Bool)

(assert (=> b!1284574 (=> (not res!853354) (not e!733773))))

(declare-datatypes ((V!50349 0))(
  ( (V!50350 (val!17042 Int)) )
))
(declare-datatypes ((ValueCell!16069 0))(
  ( (ValueCellFull!16069 (v!19644 V!50349)) (EmptyCell!16069) )
))
(declare-datatypes ((array!84930 0))(
  ( (array!84931 (arr!40967 (Array (_ BitVec 32) ValueCell!16069)) (size!41517 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84930)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284574 (= res!853354 (and (= (size!41517 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41516 _keys!1741) (size!41517 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52460 () Bool)

(declare-fun mapRes!52460 () Bool)

(declare-fun tp!100001 () Bool)

(declare-fun e!733775 () Bool)

(assert (=> mapNonEmpty!52460 (= mapRes!52460 (and tp!100001 e!733775))))

(declare-fun mapValue!52460 () ValueCell!16069)

(declare-fun mapKey!52460 () (_ BitVec 32))

(declare-fun mapRest!52460 () (Array (_ BitVec 32) ValueCell!16069))

(assert (=> mapNonEmpty!52460 (= (arr!40967 _values!1445) (store mapRest!52460 mapKey!52460 mapValue!52460))))

(declare-fun b!1284575 () Bool)

(declare-fun tp_is_empty!33935 () Bool)

(assert (=> b!1284575 (= e!733775 tp_is_empty!33935)))

(declare-fun b!1284576 () Bool)

(declare-fun res!853356 () Bool)

(assert (=> b!1284576 (=> (not res!853356) (not e!733773))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284576 (= res!853356 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41516 _keys!1741))))))

(declare-fun mapIsEmpty!52460 () Bool)

(assert (=> mapIsEmpty!52460 mapRes!52460))

(declare-fun b!1284578 () Bool)

(assert (=> b!1284578 (= e!733773 false)))

(declare-fun minValue!1387 () V!50349)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576829 () Bool)

(declare-fun zeroValue!1387 () V!50349)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21838 0))(
  ( (tuple2!21839 (_1!10930 (_ BitVec 64)) (_2!10930 V!50349)) )
))
(declare-datatypes ((List!29032 0))(
  ( (Nil!29029) (Cons!29028 (h!30237 tuple2!21838) (t!42576 List!29032)) )
))
(declare-datatypes ((ListLongMap!19495 0))(
  ( (ListLongMap!19496 (toList!9763 List!29032)) )
))
(declare-fun contains!7880 (ListLongMap!19495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4842 (array!84928 array!84930 (_ BitVec 32) (_ BitVec 32) V!50349 V!50349 (_ BitVec 32) Int) ListLongMap!19495)

(assert (=> b!1284578 (= lt!576829 (contains!7880 (getCurrentListMap!4842 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284579 () Bool)

(declare-fun e!733771 () Bool)

(declare-fun e!733772 () Bool)

(assert (=> b!1284579 (= e!733771 (and e!733772 mapRes!52460))))

(declare-fun condMapEmpty!52460 () Bool)

(declare-fun mapDefault!52460 () ValueCell!16069)

