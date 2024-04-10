; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109486 () Bool)

(assert start!109486)

(declare-fun b_free!28975 () Bool)

(declare-fun b_next!28975 () Bool)

(assert (=> start!109486 (= b_free!28975 (not b_next!28975))))

(declare-fun tp!102044 () Bool)

(declare-fun b_and!47065 () Bool)

(assert (=> start!109486 (= tp!102044 b_and!47065)))

(declare-fun mapIsEmpty!53483 () Bool)

(declare-fun mapRes!53483 () Bool)

(assert (=> mapIsEmpty!53483 mapRes!53483))

(declare-fun b!1296726 () Bool)

(declare-fun e!739783 () Bool)

(declare-fun tp_is_empty!34615 () Bool)

(assert (=> b!1296726 (= e!739783 tp_is_empty!34615)))

(declare-fun mapNonEmpty!53483 () Bool)

(declare-fun tp!102043 () Bool)

(assert (=> mapNonEmpty!53483 (= mapRes!53483 (and tp!102043 e!739783))))

(declare-datatypes ((V!51257 0))(
  ( (V!51258 (val!17382 Int)) )
))
(declare-datatypes ((ValueCell!16409 0))(
  ( (ValueCellFull!16409 (v!19985 V!51257)) (EmptyCell!16409) )
))
(declare-fun mapRest!53483 () (Array (_ BitVec 32) ValueCell!16409))

(declare-fun mapValue!53483 () ValueCell!16409)

(declare-fun mapKey!53483 () (_ BitVec 32))

(declare-datatypes ((array!86248 0))(
  ( (array!86249 (arr!41625 (Array (_ BitVec 32) ValueCell!16409)) (size!42175 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86248)

(assert (=> mapNonEmpty!53483 (= (arr!41625 _values!1445) (store mapRest!53483 mapKey!53483 mapValue!53483))))

(declare-fun b!1296727 () Bool)

(declare-fun res!861795 () Bool)

(declare-fun e!739784 () Bool)

(assert (=> b!1296727 (=> (not res!861795) (not e!739784))))

(declare-datatypes ((array!86250 0))(
  ( (array!86251 (arr!41626 (Array (_ BitVec 32) (_ BitVec 64))) (size!42176 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86250)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86250 (_ BitVec 32)) Bool)

(assert (=> b!1296727 (= res!861795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296728 () Bool)

(declare-fun res!861798 () Bool)

(assert (=> b!1296728 (=> (not res!861798) (not e!739784))))

(declare-datatypes ((List!29531 0))(
  ( (Nil!29528) (Cons!29527 (h!30736 (_ BitVec 64)) (t!43095 List!29531)) )
))
(declare-fun arrayNoDuplicates!0 (array!86250 (_ BitVec 32) List!29531) Bool)

(assert (=> b!1296728 (= res!861798 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29528))))

(declare-fun b!1296729 () Bool)

(assert (=> b!1296729 (= e!739784 false)))

(declare-fun minValue!1387 () V!51257)

(declare-fun zeroValue!1387 () V!51257)

(declare-fun lt!580517 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22394 0))(
  ( (tuple2!22395 (_1!11208 (_ BitVec 64)) (_2!11208 V!51257)) )
))
(declare-datatypes ((List!29532 0))(
  ( (Nil!29529) (Cons!29528 (h!30737 tuple2!22394) (t!43096 List!29532)) )
))
(declare-datatypes ((ListLongMap!20051 0))(
  ( (ListLongMap!20052 (toList!10041 List!29532)) )
))
(declare-fun contains!8159 (ListLongMap!20051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5070 (array!86250 array!86248 (_ BitVec 32) (_ BitVec 32) V!51257 V!51257 (_ BitVec 32) Int) ListLongMap!20051)

(assert (=> b!1296729 (= lt!580517 (contains!8159 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296730 () Bool)

(declare-fun e!739787 () Bool)

(declare-fun e!739785 () Bool)

(assert (=> b!1296730 (= e!739787 (and e!739785 mapRes!53483))))

(declare-fun condMapEmpty!53483 () Bool)

(declare-fun mapDefault!53483 () ValueCell!16409)

