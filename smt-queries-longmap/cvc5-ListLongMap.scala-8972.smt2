; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108558 () Bool)

(assert start!108558)

(declare-fun b_free!28105 () Bool)

(declare-fun b_next!28105 () Bool)

(assert (=> start!108558 (= b_free!28105 (not b_next!28105))))

(declare-fun tp!99425 () Bool)

(declare-fun b_and!46165 () Bool)

(assert (=> start!108558 (= tp!99425 b_and!46165)))

(declare-fun b!1281486 () Bool)

(declare-fun res!851276 () Bool)

(declare-fun e!732166 () Bool)

(assert (=> b!1281486 (=> (not res!851276) (not e!732166))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84560 0))(
  ( (array!84561 (arr!40784 (Array (_ BitVec 32) (_ BitVec 64))) (size!41334 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84560)

(assert (=> b!1281486 (= res!851276 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41334 _keys!1741)) (not (= (select (arr!40784 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1281487 () Bool)

(declare-fun res!851272 () Bool)

(assert (=> b!1281487 (=> (not res!851272) (not e!732166))))

(declare-datatypes ((V!50097 0))(
  ( (V!50098 (val!16947 Int)) )
))
(declare-fun minValue!1387 () V!50097)

(declare-fun zeroValue!1387 () V!50097)

(declare-datatypes ((ValueCell!15974 0))(
  ( (ValueCellFull!15974 (v!19547 V!50097)) (EmptyCell!15974) )
))
(declare-datatypes ((array!84562 0))(
  ( (array!84563 (arr!40785 (Array (_ BitVec 32) ValueCell!15974)) (size!41335 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84562)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21700 0))(
  ( (tuple2!21701 (_1!10861 (_ BitVec 64)) (_2!10861 V!50097)) )
))
(declare-datatypes ((List!28893 0))(
  ( (Nil!28890) (Cons!28889 (h!30098 tuple2!21700) (t!42433 List!28893)) )
))
(declare-datatypes ((ListLongMap!19357 0))(
  ( (ListLongMap!19358 (toList!9694 List!28893)) )
))
(declare-fun contains!7809 (ListLongMap!19357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4778 (array!84560 array!84562 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 32) Int) ListLongMap!19357)

(assert (=> b!1281487 (= res!851272 (contains!7809 (getCurrentListMap!4778 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52169 () Bool)

(declare-fun mapRes!52169 () Bool)

(assert (=> mapIsEmpty!52169 mapRes!52169))

(declare-fun b!1281488 () Bool)

(declare-fun e!732162 () Bool)

(declare-fun tp_is_empty!33745 () Bool)

(assert (=> b!1281488 (= e!732162 tp_is_empty!33745)))

(declare-fun b!1281489 () Bool)

(declare-fun res!851273 () Bool)

(assert (=> b!1281489 (=> (not res!851273) (not e!732166))))

(assert (=> b!1281489 (= res!851273 (and (= (size!41335 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41334 _keys!1741) (size!41335 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281491 () Bool)

(declare-fun res!851275 () Bool)

(assert (=> b!1281491 (=> (not res!851275) (not e!732166))))

(assert (=> b!1281491 (= res!851275 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41334 _keys!1741))))))

(declare-fun b!1281492 () Bool)

(declare-fun e!732163 () Bool)

(assert (=> b!1281492 (= e!732166 (not e!732163))))

(declare-fun res!851274 () Bool)

(assert (=> b!1281492 (=> res!851274 e!732163)))

(assert (=> b!1281492 (= res!851274 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(assert (=> b!1281492 (contains!7809 (getCurrentListMap!4778 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42445 0))(
  ( (Unit!42446) )
))
(declare-fun lt!576241 () Unit!42445)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!27 (array!84560 array!84562 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 64) (_ BitVec 32) Int) Unit!42445)

(assert (=> b!1281492 (= lt!576241 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!27 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52169 () Bool)

(declare-fun tp!99424 () Bool)

(assert (=> mapNonEmpty!52169 (= mapRes!52169 (and tp!99424 e!732162))))

(declare-fun mapRest!52169 () (Array (_ BitVec 32) ValueCell!15974))

(declare-fun mapValue!52169 () ValueCell!15974)

(declare-fun mapKey!52169 () (_ BitVec 32))

(assert (=> mapNonEmpty!52169 (= (arr!40785 _values!1445) (store mapRest!52169 mapKey!52169 mapValue!52169))))

(declare-fun b!1281493 () Bool)

(declare-fun res!851271 () Bool)

(assert (=> b!1281493 (=> (not res!851271) (not e!732166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84560 (_ BitVec 32)) Bool)

(assert (=> b!1281493 (= res!851271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281494 () Bool)

(declare-fun e!732167 () Bool)

(assert (=> b!1281494 (= e!732167 tp_is_empty!33745)))

(declare-fun b!1281495 () Bool)

(assert (=> b!1281495 (= e!732163 true)))

(declare-fun arrayContainsKey!0 (array!84560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281495 (arrayContainsKey!0 _keys!1741 k!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576242 () Unit!42445)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!634 (array!84560 array!84562 (_ BitVec 32) (_ BitVec 32) V!50097 V!50097 (_ BitVec 64) (_ BitVec 32) Int) Unit!42445)

(assert (=> b!1281495 (= lt!576242 (lemmaListMapContainsThenArrayContainsFrom!634 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281496 () Bool)

(declare-fun e!732165 () Bool)

(assert (=> b!1281496 (= e!732165 (and e!732167 mapRes!52169))))

(declare-fun condMapEmpty!52169 () Bool)

(declare-fun mapDefault!52169 () ValueCell!15974)

