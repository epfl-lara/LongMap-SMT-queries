; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43290 () Bool)

(assert start!43290)

(declare-fun b_free!12157 () Bool)

(declare-fun b_next!12157 () Bool)

(assert (=> start!43290 (= b_free!12157 (not b_next!12157))))

(declare-fun tp!42741 () Bool)

(declare-fun b_and!20909 () Bool)

(assert (=> start!43290 (= tp!42741 b_and!20909)))

(declare-fun b!479615 () Bool)

(declare-fun res!286089 () Bool)

(declare-fun e!282195 () Bool)

(assert (=> b!479615 (=> (not res!286089) (not e!282195))))

(declare-datatypes ((array!31007 0))(
  ( (array!31008 (arr!14910 (Array (_ BitVec 32) (_ BitVec 64))) (size!15268 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31007)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31007 (_ BitVec 32)) Bool)

(assert (=> b!479615 (= res!286089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479616 () Bool)

(assert (=> b!479616 (= e!282195 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-datatypes ((V!19297 0))(
  ( (V!19298 (val!6882 Int)) )
))
(declare-fun minValue!1458 () V!19297)

(declare-fun lt!217888 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19297)

(declare-datatypes ((ValueCell!6473 0))(
  ( (ValueCellFull!6473 (v!9171 V!19297)) (EmptyCell!6473) )
))
(declare-datatypes ((array!31009 0))(
  ( (array!31010 (arr!14911 (Array (_ BitVec 32) ValueCell!6473)) (size!15269 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31009)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9032 0))(
  ( (tuple2!9033 (_1!4527 (_ BitVec 64)) (_2!4527 V!19297)) )
))
(declare-datatypes ((List!9110 0))(
  ( (Nil!9107) (Cons!9106 (h!9962 tuple2!9032) (t!15316 List!9110)) )
))
(declare-datatypes ((ListLongMap!7945 0))(
  ( (ListLongMap!7946 (toList!3988 List!9110)) )
))
(declare-fun contains!2598 (ListLongMap!7945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2307 (array!31007 array!31009 (_ BitVec 32) (_ BitVec 32) V!19297 V!19297 (_ BitVec 32) Int) ListLongMap!7945)

(assert (=> b!479616 (= lt!217888 (contains!2598 (getCurrentListMap!2307 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapIsEmpty!22201 () Bool)

(declare-fun mapRes!22201 () Bool)

(assert (=> mapIsEmpty!22201 mapRes!22201))

(declare-fun b!479617 () Bool)

(declare-fun res!286092 () Bool)

(assert (=> b!479617 (=> (not res!286092) (not e!282195))))

(declare-datatypes ((List!9111 0))(
  ( (Nil!9108) (Cons!9107 (h!9963 (_ BitVec 64)) (t!15317 List!9111)) )
))
(declare-fun arrayNoDuplicates!0 (array!31007 (_ BitVec 32) List!9111) Bool)

(assert (=> b!479617 (= res!286092 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9108))))

(declare-fun b!479618 () Bool)

(declare-fun e!282194 () Bool)

(declare-fun tp_is_empty!13669 () Bool)

(assert (=> b!479618 (= e!282194 tp_is_empty!13669)))

(declare-fun mapNonEmpty!22201 () Bool)

(declare-fun tp!42742 () Bool)

(declare-fun e!282192 () Bool)

(assert (=> mapNonEmpty!22201 (= mapRes!22201 (and tp!42742 e!282192))))

(declare-fun mapKey!22201 () (_ BitVec 32))

(declare-fun mapValue!22201 () ValueCell!6473)

(declare-fun mapRest!22201 () (Array (_ BitVec 32) ValueCell!6473))

(assert (=> mapNonEmpty!22201 (= (arr!14911 _values!1516) (store mapRest!22201 mapKey!22201 mapValue!22201))))

(declare-fun res!286090 () Bool)

(assert (=> start!43290 (=> (not res!286090) (not e!282195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43290 (= res!286090 (validMask!0 mask!2352))))

(assert (=> start!43290 e!282195))

(assert (=> start!43290 true))

(assert (=> start!43290 tp_is_empty!13669))

(declare-fun e!282193 () Bool)

(declare-fun array_inv!10756 (array!31009) Bool)

(assert (=> start!43290 (and (array_inv!10756 _values!1516) e!282193)))

(assert (=> start!43290 tp!42741))

(declare-fun array_inv!10757 (array!31007) Bool)

(assert (=> start!43290 (array_inv!10757 _keys!1874)))

(declare-fun b!479619 () Bool)

(declare-fun res!286091 () Bool)

(assert (=> b!479619 (=> (not res!286091) (not e!282195))))

(assert (=> b!479619 (= res!286091 (and (= (size!15269 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15268 _keys!1874) (size!15269 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479620 () Bool)

(assert (=> b!479620 (= e!282192 tp_is_empty!13669)))

(declare-fun b!479621 () Bool)

(assert (=> b!479621 (= e!282193 (and e!282194 mapRes!22201))))

(declare-fun condMapEmpty!22201 () Bool)

(declare-fun mapDefault!22201 () ValueCell!6473)

