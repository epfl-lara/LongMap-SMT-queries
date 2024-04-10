; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43282 () Bool)

(assert start!43282)

(declare-fun b_free!12149 () Bool)

(declare-fun b_next!12149 () Bool)

(assert (=> start!43282 (= b_free!12149 (not b_next!12149))))

(declare-fun tp!42718 () Bool)

(declare-fun b_and!20901 () Bool)

(assert (=> start!43282 (= tp!42718 b_and!20901)))

(declare-fun b!479531 () Bool)

(declare-fun res!286043 () Bool)

(declare-fun e!282132 () Bool)

(assert (=> b!479531 (=> (not res!286043) (not e!282132))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30993 0))(
  ( (array!30994 (arr!14903 (Array (_ BitVec 32) (_ BitVec 64))) (size!15261 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30993)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19285 0))(
  ( (V!19286 (val!6878 Int)) )
))
(declare-datatypes ((ValueCell!6469 0))(
  ( (ValueCellFull!6469 (v!9167 V!19285)) (EmptyCell!6469) )
))
(declare-datatypes ((array!30995 0))(
  ( (array!30996 (arr!14904 (Array (_ BitVec 32) ValueCell!6469)) (size!15262 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30995)

(assert (=> b!479531 (= res!286043 (and (= (size!15262 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15261 _keys!1874) (size!15262 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479532 () Bool)

(declare-fun res!286044 () Bool)

(assert (=> b!479532 (=> (not res!286044) (not e!282132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30993 (_ BitVec 32)) Bool)

(assert (=> b!479532 (= res!286044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!286041 () Bool)

(assert (=> start!43282 (=> (not res!286041) (not e!282132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43282 (= res!286041 (validMask!0 mask!2352))))

(assert (=> start!43282 e!282132))

(assert (=> start!43282 true))

(declare-fun tp_is_empty!13661 () Bool)

(assert (=> start!43282 tp_is_empty!13661))

(declare-fun e!282135 () Bool)

(declare-fun array_inv!10750 (array!30995) Bool)

(assert (=> start!43282 (and (array_inv!10750 _values!1516) e!282135)))

(assert (=> start!43282 tp!42718))

(declare-fun array_inv!10751 (array!30993) Bool)

(assert (=> start!43282 (array_inv!10751 _keys!1874)))

(declare-fun mapIsEmpty!22189 () Bool)

(declare-fun mapRes!22189 () Bool)

(assert (=> mapIsEmpty!22189 mapRes!22189))

(declare-fun b!479533 () Bool)

(assert (=> b!479533 (= e!282132 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun lt!217876 () Bool)

(declare-fun minValue!1458 () V!19285)

(declare-fun zeroValue!1458 () V!19285)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9026 0))(
  ( (tuple2!9027 (_1!4524 (_ BitVec 64)) (_2!4524 V!19285)) )
))
(declare-datatypes ((List!9105 0))(
  ( (Nil!9102) (Cons!9101 (h!9957 tuple2!9026) (t!15311 List!9105)) )
))
(declare-datatypes ((ListLongMap!7939 0))(
  ( (ListLongMap!7940 (toList!3985 List!9105)) )
))
(declare-fun contains!2595 (ListLongMap!7939 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2304 (array!30993 array!30995 (_ BitVec 32) (_ BitVec 32) V!19285 V!19285 (_ BitVec 32) Int) ListLongMap!7939)

(assert (=> b!479533 (= lt!217876 (contains!2595 (getCurrentListMap!2304 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479534 () Bool)

(declare-fun e!282133 () Bool)

(assert (=> b!479534 (= e!282133 tp_is_empty!13661)))

(declare-fun b!479535 () Bool)

(declare-fun e!282131 () Bool)

(assert (=> b!479535 (= e!282131 tp_is_empty!13661)))

(declare-fun mapNonEmpty!22189 () Bool)

(declare-fun tp!42717 () Bool)

(assert (=> mapNonEmpty!22189 (= mapRes!22189 (and tp!42717 e!282131))))

(declare-fun mapKey!22189 () (_ BitVec 32))

(declare-fun mapRest!22189 () (Array (_ BitVec 32) ValueCell!6469))

(declare-fun mapValue!22189 () ValueCell!6469)

(assert (=> mapNonEmpty!22189 (= (arr!14904 _values!1516) (store mapRest!22189 mapKey!22189 mapValue!22189))))

(declare-fun b!479536 () Bool)

(assert (=> b!479536 (= e!282135 (and e!282133 mapRes!22189))))

(declare-fun condMapEmpty!22189 () Bool)

(declare-fun mapDefault!22189 () ValueCell!6469)

