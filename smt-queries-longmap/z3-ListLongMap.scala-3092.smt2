; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43478 () Bool)

(assert start!43478)

(declare-fun b_free!12271 () Bool)

(declare-fun b_next!12271 () Bool)

(assert (=> start!43478 (= b_free!12271 (not b_next!12271))))

(declare-fun tp!43095 () Bool)

(declare-fun b_and!21005 () Bool)

(assert (=> start!43478 (= tp!43095 b_and!21005)))

(declare-fun b!481630 () Bool)

(declare-fun e!283362 () Bool)

(declare-fun tp_is_empty!13783 () Bool)

(assert (=> b!481630 (= e!283362 tp_is_empty!13783)))

(declare-fun mapIsEmpty!22384 () Bool)

(declare-fun mapRes!22384 () Bool)

(assert (=> mapIsEmpty!22384 mapRes!22384))

(declare-fun res!287149 () Bool)

(declare-fun e!283364 () Bool)

(assert (=> start!43478 (=> (not res!287149) (not e!283364))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43478 (= res!287149 (validMask!0 mask!2352))))

(assert (=> start!43478 e!283364))

(assert (=> start!43478 true))

(assert (=> start!43478 tp_is_empty!13783))

(declare-datatypes ((V!19449 0))(
  ( (V!19450 (val!6939 Int)) )
))
(declare-datatypes ((ValueCell!6530 0))(
  ( (ValueCellFull!6530 (v!9226 V!19449)) (EmptyCell!6530) )
))
(declare-datatypes ((array!31227 0))(
  ( (array!31228 (arr!15016 (Array (_ BitVec 32) ValueCell!6530)) (size!15375 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31227)

(declare-fun e!283365 () Bool)

(declare-fun array_inv!10920 (array!31227) Bool)

(assert (=> start!43478 (and (array_inv!10920 _values!1516) e!283365)))

(assert (=> start!43478 tp!43095))

(declare-datatypes ((array!31229 0))(
  ( (array!31230 (arr!15017 (Array (_ BitVec 32) (_ BitVec 64))) (size!15376 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31229)

(declare-fun array_inv!10921 (array!31229) Bool)

(assert (=> start!43478 (array_inv!10921 _keys!1874)))

(declare-fun b!481631 () Bool)

(assert (=> b!481631 (= e!283365 (and e!283362 mapRes!22384))))

(declare-fun condMapEmpty!22384 () Bool)

(declare-fun mapDefault!22384 () ValueCell!6530)

(assert (=> b!481631 (= condMapEmpty!22384 (= (arr!15016 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6530)) mapDefault!22384)))))

(declare-fun b!481632 () Bool)

(declare-fun res!287150 () Bool)

(assert (=> b!481632 (=> (not res!287150) (not e!283364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31229 (_ BitVec 32)) Bool)

(assert (=> b!481632 (= res!287150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22384 () Bool)

(declare-fun tp!43096 () Bool)

(declare-fun e!283363 () Bool)

(assert (=> mapNonEmpty!22384 (= mapRes!22384 (and tp!43096 e!283363))))

(declare-fun mapRest!22384 () (Array (_ BitVec 32) ValueCell!6530))

(declare-fun mapValue!22384 () ValueCell!6530)

(declare-fun mapKey!22384 () (_ BitVec 32))

(assert (=> mapNonEmpty!22384 (= (arr!15016 _values!1516) (store mapRest!22384 mapKey!22384 mapValue!22384))))

(declare-fun b!481633 () Bool)

(assert (=> b!481633 (= e!283363 tp_is_empty!13783)))

(declare-fun b!481634 () Bool)

(declare-fun res!287151 () Bool)

(assert (=> b!481634 (=> (not res!287151) (not e!283364))))

(declare-datatypes ((List!9223 0))(
  ( (Nil!9220) (Cons!9219 (h!10075 (_ BitVec 64)) (t!15428 List!9223)) )
))
(declare-fun arrayNoDuplicates!0 (array!31229 (_ BitVec 32) List!9223) Bool)

(assert (=> b!481634 (= res!287151 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9220))))

(declare-fun b!481635 () Bool)

(declare-fun res!287152 () Bool)

(assert (=> b!481635 (=> (not res!287152) (not e!283364))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481635 (= res!287152 (and (= (size!15375 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15376 _keys!1874) (size!15375 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481636 () Bool)

(assert (=> b!481636 (= e!283364 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218410 () Bool)

(declare-fun minValue!1458 () V!19449)

(declare-fun zeroValue!1458 () V!19449)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9158 0))(
  ( (tuple2!9159 (_1!4590 (_ BitVec 64)) (_2!4590 V!19449)) )
))
(declare-datatypes ((List!9224 0))(
  ( (Nil!9221) (Cons!9220 (h!10076 tuple2!9158) (t!15429 List!9224)) )
))
(declare-datatypes ((ListLongMap!8061 0))(
  ( (ListLongMap!8062 (toList!4046 List!9224)) )
))
(declare-fun contains!2625 (ListLongMap!8061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2299 (array!31229 array!31227 (_ BitVec 32) (_ BitVec 32) V!19449 V!19449 (_ BitVec 32) Int) ListLongMap!8061)

(assert (=> b!481636 (= lt!218410 (contains!2625 (getCurrentListMap!2299 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43478 res!287149) b!481635))

(assert (= (and b!481635 res!287152) b!481632))

(assert (= (and b!481632 res!287150) b!481634))

(assert (= (and b!481634 res!287151) b!481636))

(assert (= (and b!481631 condMapEmpty!22384) mapIsEmpty!22384))

(assert (= (and b!481631 (not condMapEmpty!22384)) mapNonEmpty!22384))

(get-info :version)

(assert (= (and mapNonEmpty!22384 ((_ is ValueCellFull!6530) mapValue!22384)) b!481633))

(assert (= (and b!481631 ((_ is ValueCellFull!6530) mapDefault!22384)) b!481630))

(assert (= start!43478 b!481631))

(declare-fun m!462549 () Bool)

(assert (=> mapNonEmpty!22384 m!462549))

(declare-fun m!462551 () Bool)

(assert (=> b!481632 m!462551))

(declare-fun m!462553 () Bool)

(assert (=> b!481634 m!462553))

(declare-fun m!462555 () Bool)

(assert (=> b!481636 m!462555))

(assert (=> b!481636 m!462555))

(declare-fun m!462557 () Bool)

(assert (=> b!481636 m!462557))

(declare-fun m!462559 () Bool)

(assert (=> start!43478 m!462559))

(declare-fun m!462561 () Bool)

(assert (=> start!43478 m!462561))

(declare-fun m!462563 () Bool)

(assert (=> start!43478 m!462563))

(check-sat b_and!21005 (not b!481634) (not b!481632) (not mapNonEmpty!22384) (not start!43478) (not b_next!12271) (not b!481636) tp_is_empty!13783)
(check-sat b_and!21005 (not b_next!12271))
