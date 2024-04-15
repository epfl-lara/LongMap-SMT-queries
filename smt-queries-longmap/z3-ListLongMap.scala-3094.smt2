; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43490 () Bool)

(assert start!43490)

(declare-fun b_free!12283 () Bool)

(declare-fun b_next!12283 () Bool)

(assert (=> start!43490 (= b_free!12283 (not b_next!12283))))

(declare-fun tp!43132 () Bool)

(declare-fun b_and!21017 () Bool)

(assert (=> start!43490 (= tp!43132 b_and!21017)))

(declare-fun b!481756 () Bool)

(declare-fun e!283454 () Bool)

(declare-fun e!283453 () Bool)

(declare-fun mapRes!22402 () Bool)

(assert (=> b!481756 (= e!283454 (and e!283453 mapRes!22402))))

(declare-fun condMapEmpty!22402 () Bool)

(declare-datatypes ((V!19465 0))(
  ( (V!19466 (val!6945 Int)) )
))
(declare-datatypes ((ValueCell!6536 0))(
  ( (ValueCellFull!6536 (v!9232 V!19465)) (EmptyCell!6536) )
))
(declare-datatypes ((array!31245 0))(
  ( (array!31246 (arr!15025 (Array (_ BitVec 32) ValueCell!6536)) (size!15384 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31245)

(declare-fun mapDefault!22402 () ValueCell!6536)

(assert (=> b!481756 (= condMapEmpty!22402 (= (arr!15025 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6536)) mapDefault!22402)))))

(declare-fun mapIsEmpty!22402 () Bool)

(assert (=> mapIsEmpty!22402 mapRes!22402))

(declare-fun b!481757 () Bool)

(declare-fun res!287224 () Bool)

(declare-fun e!283455 () Bool)

(assert (=> b!481757 (=> (not res!287224) (not e!283455))))

(declare-datatypes ((array!31247 0))(
  ( (array!31248 (arr!15026 (Array (_ BitVec 32) (_ BitVec 64))) (size!15385 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31247)

(declare-datatypes ((List!9229 0))(
  ( (Nil!9226) (Cons!9225 (h!10081 (_ BitVec 64)) (t!15434 List!9229)) )
))
(declare-fun arrayNoDuplicates!0 (array!31247 (_ BitVec 32) List!9229) Bool)

(assert (=> b!481757 (= res!287224 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9226))))

(declare-fun b!481758 () Bool)

(declare-fun e!283452 () Bool)

(declare-fun tp_is_empty!13795 () Bool)

(assert (=> b!481758 (= e!283452 tp_is_empty!13795)))

(declare-fun res!287223 () Bool)

(assert (=> start!43490 (=> (not res!287223) (not e!283455))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43490 (= res!287223 (validMask!0 mask!2352))))

(assert (=> start!43490 e!283455))

(assert (=> start!43490 true))

(assert (=> start!43490 tp_is_empty!13795))

(declare-fun array_inv!10926 (array!31245) Bool)

(assert (=> start!43490 (and (array_inv!10926 _values!1516) e!283454)))

(assert (=> start!43490 tp!43132))

(declare-fun array_inv!10927 (array!31247) Bool)

(assert (=> start!43490 (array_inv!10927 _keys!1874)))

(declare-fun b!481759 () Bool)

(declare-fun res!287222 () Bool)

(assert (=> b!481759 (=> (not res!287222) (not e!283455))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481759 (= res!287222 (and (= (size!15384 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15385 _keys!1874) (size!15384 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481760 () Bool)

(assert (=> b!481760 (= e!283455 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218428 () Bool)

(declare-fun minValue!1458 () V!19465)

(declare-fun zeroValue!1458 () V!19465)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9164 0))(
  ( (tuple2!9165 (_1!4593 (_ BitVec 64)) (_2!4593 V!19465)) )
))
(declare-datatypes ((List!9230 0))(
  ( (Nil!9227) (Cons!9226 (h!10082 tuple2!9164) (t!15435 List!9230)) )
))
(declare-datatypes ((ListLongMap!8067 0))(
  ( (ListLongMap!8068 (toList!4049 List!9230)) )
))
(declare-fun contains!2628 (ListLongMap!8067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2302 (array!31247 array!31245 (_ BitVec 32) (_ BitVec 32) V!19465 V!19465 (_ BitVec 32) Int) ListLongMap!8067)

(assert (=> b!481760 (= lt!218428 (contains!2628 (getCurrentListMap!2302 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22402 () Bool)

(declare-fun tp!43131 () Bool)

(assert (=> mapNonEmpty!22402 (= mapRes!22402 (and tp!43131 e!283452))))

(declare-fun mapValue!22402 () ValueCell!6536)

(declare-fun mapKey!22402 () (_ BitVec 32))

(declare-fun mapRest!22402 () (Array (_ BitVec 32) ValueCell!6536))

(assert (=> mapNonEmpty!22402 (= (arr!15025 _values!1516) (store mapRest!22402 mapKey!22402 mapValue!22402))))

(declare-fun b!481761 () Bool)

(declare-fun res!287221 () Bool)

(assert (=> b!481761 (=> (not res!287221) (not e!283455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31247 (_ BitVec 32)) Bool)

(assert (=> b!481761 (= res!287221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481762 () Bool)

(assert (=> b!481762 (= e!283453 tp_is_empty!13795)))

(assert (= (and start!43490 res!287223) b!481759))

(assert (= (and b!481759 res!287222) b!481761))

(assert (= (and b!481761 res!287221) b!481757))

(assert (= (and b!481757 res!287224) b!481760))

(assert (= (and b!481756 condMapEmpty!22402) mapIsEmpty!22402))

(assert (= (and b!481756 (not condMapEmpty!22402)) mapNonEmpty!22402))

(get-info :version)

(assert (= (and mapNonEmpty!22402 ((_ is ValueCellFull!6536) mapValue!22402)) b!481758))

(assert (= (and b!481756 ((_ is ValueCellFull!6536) mapDefault!22402)) b!481762))

(assert (= start!43490 b!481756))

(declare-fun m!462645 () Bool)

(assert (=> b!481757 m!462645))

(declare-fun m!462647 () Bool)

(assert (=> b!481760 m!462647))

(assert (=> b!481760 m!462647))

(declare-fun m!462649 () Bool)

(assert (=> b!481760 m!462649))

(declare-fun m!462651 () Bool)

(assert (=> b!481761 m!462651))

(declare-fun m!462653 () Bool)

(assert (=> start!43490 m!462653))

(declare-fun m!462655 () Bool)

(assert (=> start!43490 m!462655))

(declare-fun m!462657 () Bool)

(assert (=> start!43490 m!462657))

(declare-fun m!462659 () Bool)

(assert (=> mapNonEmpty!22402 m!462659))

(check-sat tp_is_empty!13795 (not b!481760) (not b!481757) (not b!481761) b_and!21017 (not mapNonEmpty!22402) (not start!43490) (not b_next!12283))
(check-sat b_and!21017 (not b_next!12283))
