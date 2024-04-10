; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43516 () Bool)

(assert start!43516)

(declare-fun b_free!12295 () Bool)

(declare-fun b_next!12295 () Bool)

(assert (=> start!43516 (= b_free!12295 (not b_next!12295))))

(declare-fun tp!43168 () Bool)

(declare-fun b_and!21055 () Bool)

(assert (=> start!43516 (= tp!43168 b_and!21055)))

(declare-fun mapNonEmpty!22420 () Bool)

(declare-fun mapRes!22420 () Bool)

(declare-fun tp!43167 () Bool)

(declare-fun e!283716 () Bool)

(assert (=> mapNonEmpty!22420 (= mapRes!22420 (and tp!43167 e!283716))))

(declare-datatypes ((V!19481 0))(
  ( (V!19482 (val!6951 Int)) )
))
(declare-datatypes ((ValueCell!6542 0))(
  ( (ValueCellFull!6542 (v!9244 V!19481)) (EmptyCell!6542) )
))
(declare-fun mapValue!22420 () ValueCell!6542)

(declare-fun mapRest!22420 () (Array (_ BitVec 32) ValueCell!6542))

(declare-fun mapKey!22420 () (_ BitVec 32))

(declare-datatypes ((array!31273 0))(
  ( (array!31274 (arr!15039 (Array (_ BitVec 32) ValueCell!6542)) (size!15397 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31273)

(assert (=> mapNonEmpty!22420 (= (arr!15039 _values!1516) (store mapRest!22420 mapKey!22420 mapValue!22420))))

(declare-fun mapIsEmpty!22420 () Bool)

(assert (=> mapIsEmpty!22420 mapRes!22420))

(declare-fun b!482153 () Bool)

(declare-fun res!287422 () Bool)

(declare-fun e!283715 () Bool)

(assert (=> b!482153 (=> (not res!287422) (not e!283715))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31275 0))(
  ( (array!31276 (arr!15040 (Array (_ BitVec 32) (_ BitVec 64))) (size!15398 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31275)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482153 (= res!287422 (and (= (size!15397 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15398 _keys!1874) (size!15397 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482154 () Bool)

(declare-fun res!287425 () Bool)

(assert (=> b!482154 (=> (not res!287425) (not e!283715))))

(declare-datatypes ((List!9201 0))(
  ( (Nil!9198) (Cons!9197 (h!10053 (_ BitVec 64)) (t!15415 List!9201)) )
))
(declare-fun arrayNoDuplicates!0 (array!31275 (_ BitVec 32) List!9201) Bool)

(assert (=> b!482154 (= res!287425 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9198))))

(declare-fun b!482155 () Bool)

(declare-fun res!287424 () Bool)

(assert (=> b!482155 (=> (not res!287424) (not e!283715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31275 (_ BitVec 32)) Bool)

(assert (=> b!482155 (= res!287424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287423 () Bool)

(assert (=> start!43516 (=> (not res!287423) (not e!283715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43516 (= res!287423 (validMask!0 mask!2352))))

(assert (=> start!43516 e!283715))

(assert (=> start!43516 true))

(declare-fun tp_is_empty!13807 () Bool)

(assert (=> start!43516 tp_is_empty!13807))

(declare-fun e!283717 () Bool)

(declare-fun array_inv!10848 (array!31273) Bool)

(assert (=> start!43516 (and (array_inv!10848 _values!1516) e!283717)))

(assert (=> start!43516 tp!43168))

(declare-fun array_inv!10849 (array!31275) Bool)

(assert (=> start!43516 (array_inv!10849 _keys!1874)))

(declare-fun b!482156 () Bool)

(assert (=> b!482156 (= e!283716 tp_is_empty!13807)))

(declare-fun b!482157 () Bool)

(assert (=> b!482157 (= e!283715 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun lt!218680 () Bool)

(declare-fun minValue!1458 () V!19481)

(declare-fun zeroValue!1458 () V!19481)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9122 0))(
  ( (tuple2!9123 (_1!4572 (_ BitVec 64)) (_2!4572 V!19481)) )
))
(declare-datatypes ((List!9202 0))(
  ( (Nil!9199) (Cons!9198 (h!10054 tuple2!9122) (t!15416 List!9202)) )
))
(declare-datatypes ((ListLongMap!8035 0))(
  ( (ListLongMap!8036 (toList!4033 List!9202)) )
))
(declare-fun contains!2647 (ListLongMap!8035 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2352 (array!31275 array!31273 (_ BitVec 32) (_ BitVec 32) V!19481 V!19481 (_ BitVec 32) Int) ListLongMap!8035)

(assert (=> b!482157 (= lt!218680 (contains!2647 (getCurrentListMap!2352 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482158 () Bool)

(declare-fun e!283718 () Bool)

(assert (=> b!482158 (= e!283717 (and e!283718 mapRes!22420))))

(declare-fun condMapEmpty!22420 () Bool)

(declare-fun mapDefault!22420 () ValueCell!6542)

