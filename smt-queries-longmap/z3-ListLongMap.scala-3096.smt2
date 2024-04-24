; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43502 () Bool)

(assert start!43502)

(declare-fun b_free!12295 () Bool)

(declare-fun b_next!12295 () Bool)

(assert (=> start!43502 (= b_free!12295 (not b_next!12295))))

(declare-fun tp!43167 () Bool)

(declare-fun b_and!21065 () Bool)

(assert (=> start!43502 (= tp!43167 b_and!21065)))

(declare-fun b!482092 () Bool)

(declare-fun res!287418 () Bool)

(declare-fun e!283679 () Bool)

(assert (=> b!482092 (=> (not res!287418) (not e!283679))))

(declare-datatypes ((array!31260 0))(
  ( (array!31261 (arr!15032 (Array (_ BitVec 32) (_ BitVec 64))) (size!15390 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31260)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31260 (_ BitVec 32)) Bool)

(assert (=> b!482092 (= res!287418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482093 () Bool)

(declare-fun res!287416 () Bool)

(assert (=> b!482093 (=> (not res!287416) (not e!283679))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19481 0))(
  ( (V!19482 (val!6951 Int)) )
))
(declare-datatypes ((ValueCell!6542 0))(
  ( (ValueCellFull!6542 (v!9245 V!19481)) (EmptyCell!6542) )
))
(declare-datatypes ((array!31262 0))(
  ( (array!31263 (arr!15033 (Array (_ BitVec 32) ValueCell!6542)) (size!15391 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31262)

(assert (=> b!482093 (= res!287416 (and (= (size!15391 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15390 _keys!1874) (size!15391 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482094 () Bool)

(declare-fun res!287417 () Bool)

(assert (=> b!482094 (=> (not res!287417) (not e!283679))))

(declare-datatypes ((List!9108 0))(
  ( (Nil!9105) (Cons!9104 (h!9960 (_ BitVec 64)) (t!15314 List!9108)) )
))
(declare-fun arrayNoDuplicates!0 (array!31260 (_ BitVec 32) List!9108) Bool)

(assert (=> b!482094 (= res!287417 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9105))))

(declare-fun b!482095 () Bool)

(declare-fun e!283678 () Bool)

(declare-fun e!283677 () Bool)

(declare-fun mapRes!22420 () Bool)

(assert (=> b!482095 (= e!283678 (and e!283677 mapRes!22420))))

(declare-fun condMapEmpty!22420 () Bool)

(declare-fun mapDefault!22420 () ValueCell!6542)

(assert (=> b!482095 (= condMapEmpty!22420 (= (arr!15033 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6542)) mapDefault!22420)))))

(declare-fun res!287415 () Bool)

(assert (=> start!43502 (=> (not res!287415) (not e!283679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43502 (= res!287415 (validMask!0 mask!2352))))

(assert (=> start!43502 e!283679))

(assert (=> start!43502 true))

(declare-fun tp_is_empty!13807 () Bool)

(assert (=> start!43502 tp_is_empty!13807))

(declare-fun array_inv!10918 (array!31262) Bool)

(assert (=> start!43502 (and (array_inv!10918 _values!1516) e!283678)))

(assert (=> start!43502 tp!43167))

(declare-fun array_inv!10919 (array!31260) Bool)

(assert (=> start!43502 (array_inv!10919 _keys!1874)))

(declare-fun mapIsEmpty!22420 () Bool)

(assert (=> mapIsEmpty!22420 mapRes!22420))

(declare-fun mapNonEmpty!22420 () Bool)

(declare-fun tp!43168 () Bool)

(declare-fun e!283676 () Bool)

(assert (=> mapNonEmpty!22420 (= mapRes!22420 (and tp!43168 e!283676))))

(declare-fun mapValue!22420 () ValueCell!6542)

(declare-fun mapRest!22420 () (Array (_ BitVec 32) ValueCell!6542))

(declare-fun mapKey!22420 () (_ BitVec 32))

(assert (=> mapNonEmpty!22420 (= (arr!15033 _values!1516) (store mapRest!22420 mapKey!22420 mapValue!22420))))

(declare-fun b!482096 () Bool)

(assert (=> b!482096 (= e!283677 tp_is_empty!13807)))

(declare-fun b!482097 () Bool)

(assert (=> b!482097 (= e!283676 tp_is_empty!13807)))

(declare-fun b!482098 () Bool)

(assert (=> b!482098 (= e!283679 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19481)

(declare-fun lt!218692 () Bool)

(declare-fun zeroValue!1458 () V!19481)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9042 0))(
  ( (tuple2!9043 (_1!4532 (_ BitVec 64)) (_2!4532 V!19481)) )
))
(declare-datatypes ((List!9109 0))(
  ( (Nil!9106) (Cons!9105 (h!9961 tuple2!9042) (t!15315 List!9109)) )
))
(declare-datatypes ((ListLongMap!7957 0))(
  ( (ListLongMap!7958 (toList!3994 List!9109)) )
))
(declare-fun contains!2626 (ListLongMap!7957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2308 (array!31260 array!31262 (_ BitVec 32) (_ BitVec 32) V!19481 V!19481 (_ BitVec 32) Int) ListLongMap!7957)

(assert (=> b!482098 (= lt!218692 (contains!2626 (getCurrentListMap!2308 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43502 res!287415) b!482093))

(assert (= (and b!482093 res!287416) b!482092))

(assert (= (and b!482092 res!287418) b!482094))

(assert (= (and b!482094 res!287417) b!482098))

(assert (= (and b!482095 condMapEmpty!22420) mapIsEmpty!22420))

(assert (= (and b!482095 (not condMapEmpty!22420)) mapNonEmpty!22420))

(get-info :version)

(assert (= (and mapNonEmpty!22420 ((_ is ValueCellFull!6542) mapValue!22420)) b!482097))

(assert (= (and b!482095 ((_ is ValueCellFull!6542) mapDefault!22420)) b!482096))

(assert (= start!43502 b!482095))

(declare-fun m!463657 () Bool)

(assert (=> b!482092 m!463657))

(declare-fun m!463659 () Bool)

(assert (=> mapNonEmpty!22420 m!463659))

(declare-fun m!463661 () Bool)

(assert (=> b!482098 m!463661))

(assert (=> b!482098 m!463661))

(declare-fun m!463663 () Bool)

(assert (=> b!482098 m!463663))

(declare-fun m!463665 () Bool)

(assert (=> b!482094 m!463665))

(declare-fun m!463667 () Bool)

(assert (=> start!43502 m!463667))

(declare-fun m!463669 () Bool)

(assert (=> start!43502 m!463669))

(declare-fun m!463671 () Bool)

(assert (=> start!43502 m!463671))

(check-sat (not mapNonEmpty!22420) (not b!482094) (not b_next!12295) tp_is_empty!13807 (not start!43502) (not b!482092) b_and!21065 (not b!482098))
(check-sat b_and!21065 (not b_next!12295))
