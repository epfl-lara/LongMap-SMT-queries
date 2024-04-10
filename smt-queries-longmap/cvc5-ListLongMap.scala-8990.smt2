; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108700 () Bool)

(assert start!108700)

(declare-fun b_free!28213 () Bool)

(declare-fun b_next!28213 () Bool)

(assert (=> start!108700 (= b_free!28213 (not b_next!28213))))

(declare-fun tp!99754 () Bool)

(declare-fun b_and!46279 () Bool)

(assert (=> start!108700 (= tp!99754 b_and!46279)))

(declare-fun mapNonEmpty!52337 () Bool)

(declare-fun mapRes!52337 () Bool)

(declare-fun tp!99755 () Bool)

(declare-fun e!733156 () Bool)

(assert (=> mapNonEmpty!52337 (= mapRes!52337 (and tp!99755 e!733156))))

(declare-datatypes ((V!50241 0))(
  ( (V!50242 (val!17001 Int)) )
))
(declare-datatypes ((ValueCell!16028 0))(
  ( (ValueCellFull!16028 (v!19603 V!50241)) (EmptyCell!16028) )
))
(declare-fun mapRest!52337 () (Array (_ BitVec 32) ValueCell!16028))

(declare-fun mapValue!52337 () ValueCell!16028)

(declare-datatypes ((array!84768 0))(
  ( (array!84769 (arr!40886 (Array (_ BitVec 32) ValueCell!16028)) (size!41436 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84768)

(declare-fun mapKey!52337 () (_ BitVec 32))

(assert (=> mapNonEmpty!52337 (= (arr!40886 _values!1445) (store mapRest!52337 mapKey!52337 mapValue!52337))))

(declare-fun res!852423 () Bool)

(declare-fun e!733158 () Bool)

(assert (=> start!108700 (=> (not res!852423) (not e!733158))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108700 (= res!852423 (validMask!0 mask!2175))))

(assert (=> start!108700 e!733158))

(declare-fun tp_is_empty!33853 () Bool)

(assert (=> start!108700 tp_is_empty!33853))

(assert (=> start!108700 true))

(declare-fun e!733160 () Bool)

(declare-fun array_inv!31015 (array!84768) Bool)

(assert (=> start!108700 (and (array_inv!31015 _values!1445) e!733160)))

(declare-datatypes ((array!84770 0))(
  ( (array!84771 (arr!40887 (Array (_ BitVec 32) (_ BitVec 64))) (size!41437 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84770)

(declare-fun array_inv!31016 (array!84770) Bool)

(assert (=> start!108700 (array_inv!31016 _keys!1741)))

(assert (=> start!108700 tp!99754))

(declare-fun b!1283272 () Bool)

(assert (=> b!1283272 (= e!733158 (not true))))

(declare-datatypes ((tuple2!21770 0))(
  ( (tuple2!21771 (_1!10896 (_ BitVec 64)) (_2!10896 V!50241)) )
))
(declare-datatypes ((List!28968 0))(
  ( (Nil!28965) (Cons!28964 (h!30173 tuple2!21770) (t!42512 List!28968)) )
))
(declare-datatypes ((ListLongMap!19427 0))(
  ( (ListLongMap!19428 (toList!9729 List!28968)) )
))
(declare-fun lt!576627 () ListLongMap!19427)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7846 (ListLongMap!19427 (_ BitVec 64)) Bool)

(assert (=> b!1283272 (contains!7846 lt!576627 k!1205)))

(declare-fun minValue!1387 () V!50241)

(declare-datatypes ((Unit!42469 0))(
  ( (Unit!42470) )
))
(declare-fun lt!576628 () Unit!42469)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!5 ((_ BitVec 64) (_ BitVec 64) V!50241 ListLongMap!19427) Unit!42469)

(assert (=> b!1283272 (= lt!576628 (lemmaInListMapAfterAddingDiffThenInBefore!5 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576627))))

(declare-fun zeroValue!1387 () V!50241)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun +!4281 (ListLongMap!19427 tuple2!21770) ListLongMap!19427)

(declare-fun getCurrentListMapNoExtraKeys!5911 (array!84770 array!84768 (_ BitVec 32) (_ BitVec 32) V!50241 V!50241 (_ BitVec 32) Int) ListLongMap!19427)

(assert (=> b!1283272 (= lt!576627 (+!4281 (getCurrentListMapNoExtraKeys!5911 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283273 () Bool)

(declare-fun res!852424 () Bool)

(assert (=> b!1283273 (=> (not res!852424) (not e!733158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84770 (_ BitVec 32)) Bool)

(assert (=> b!1283273 (= res!852424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283274 () Bool)

(declare-fun res!852428 () Bool)

(assert (=> b!1283274 (=> (not res!852428) (not e!733158))))

(assert (=> b!1283274 (= res!852428 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41437 _keys!1741))))))

(declare-fun mapIsEmpty!52337 () Bool)

(assert (=> mapIsEmpty!52337 mapRes!52337))

(declare-fun b!1283275 () Bool)

(declare-fun res!852425 () Bool)

(assert (=> b!1283275 (=> (not res!852425) (not e!733158))))

(assert (=> b!1283275 (= res!852425 (and (= (size!41436 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41437 _keys!1741) (size!41436 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283276 () Bool)

(declare-fun e!733159 () Bool)

(assert (=> b!1283276 (= e!733160 (and e!733159 mapRes!52337))))

(declare-fun condMapEmpty!52337 () Bool)

(declare-fun mapDefault!52337 () ValueCell!16028)

