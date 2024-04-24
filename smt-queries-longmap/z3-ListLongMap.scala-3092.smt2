; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43478 () Bool)

(assert start!43478)

(declare-fun b_free!12271 () Bool)

(declare-fun b_next!12271 () Bool)

(assert (=> start!43478 (= b_free!12271 (not b_next!12271))))

(declare-fun tp!43096 () Bool)

(declare-fun b_and!21041 () Bool)

(assert (=> start!43478 (= tp!43096 b_and!21041)))

(declare-fun mapNonEmpty!22384 () Bool)

(declare-fun mapRes!22384 () Bool)

(declare-fun tp!43095 () Bool)

(declare-fun e!283499 () Bool)

(assert (=> mapNonEmpty!22384 (= mapRes!22384 (and tp!43095 e!283499))))

(declare-fun mapKey!22384 () (_ BitVec 32))

(declare-datatypes ((V!19449 0))(
  ( (V!19450 (val!6939 Int)) )
))
(declare-datatypes ((ValueCell!6530 0))(
  ( (ValueCellFull!6530 (v!9233 V!19449)) (EmptyCell!6530) )
))
(declare-fun mapRest!22384 () (Array (_ BitVec 32) ValueCell!6530))

(declare-fun mapValue!22384 () ValueCell!6530)

(declare-datatypes ((array!31212 0))(
  ( (array!31213 (arr!15008 (Array (_ BitVec 32) ValueCell!6530)) (size!15366 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31212)

(assert (=> mapNonEmpty!22384 (= (arr!15008 _values!1516) (store mapRest!22384 mapKey!22384 mapValue!22384))))

(declare-fun mapIsEmpty!22384 () Bool)

(assert (=> mapIsEmpty!22384 mapRes!22384))

(declare-fun b!481840 () Bool)

(declare-fun e!283498 () Bool)

(assert (=> b!481840 (= e!283498 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19449)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19449)

(declare-fun lt!218656 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31214 0))(
  ( (array!31215 (arr!15009 (Array (_ BitVec 32) (_ BitVec 64))) (size!15367 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31214)

(declare-datatypes ((tuple2!9022 0))(
  ( (tuple2!9023 (_1!4522 (_ BitVec 64)) (_2!4522 V!19449)) )
))
(declare-datatypes ((List!9088 0))(
  ( (Nil!9085) (Cons!9084 (h!9940 tuple2!9022) (t!15294 List!9088)) )
))
(declare-datatypes ((ListLongMap!7937 0))(
  ( (ListLongMap!7938 (toList!3984 List!9088)) )
))
(declare-fun contains!2616 (ListLongMap!7937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2298 (array!31214 array!31212 (_ BitVec 32) (_ BitVec 32) V!19449 V!19449 (_ BitVec 32) Int) ListLongMap!7937)

(assert (=> b!481840 (= lt!218656 (contains!2616 (getCurrentListMap!2298 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481841 () Bool)

(declare-fun res!287272 () Bool)

(assert (=> b!481841 (=> (not res!287272) (not e!283498))))

(declare-datatypes ((List!9089 0))(
  ( (Nil!9086) (Cons!9085 (h!9941 (_ BitVec 64)) (t!15295 List!9089)) )
))
(declare-fun arrayNoDuplicates!0 (array!31214 (_ BitVec 32) List!9089) Bool)

(assert (=> b!481841 (= res!287272 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9086))))

(declare-fun b!481842 () Bool)

(declare-fun res!287274 () Bool)

(assert (=> b!481842 (=> (not res!287274) (not e!283498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31214 (_ BitVec 32)) Bool)

(assert (=> b!481842 (= res!287274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481843 () Bool)

(declare-fun res!287271 () Bool)

(assert (=> b!481843 (=> (not res!287271) (not e!283498))))

(assert (=> b!481843 (= res!287271 (and (= (size!15366 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15367 _keys!1874) (size!15366 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481844 () Bool)

(declare-fun e!283497 () Bool)

(declare-fun e!283496 () Bool)

(assert (=> b!481844 (= e!283497 (and e!283496 mapRes!22384))))

(declare-fun condMapEmpty!22384 () Bool)

(declare-fun mapDefault!22384 () ValueCell!6530)

(assert (=> b!481844 (= condMapEmpty!22384 (= (arr!15008 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6530)) mapDefault!22384)))))

(declare-fun b!481845 () Bool)

(declare-fun tp_is_empty!13783 () Bool)

(assert (=> b!481845 (= e!283496 tp_is_empty!13783)))

(declare-fun b!481846 () Bool)

(assert (=> b!481846 (= e!283499 tp_is_empty!13783)))

(declare-fun res!287273 () Bool)

(assert (=> start!43478 (=> (not res!287273) (not e!283498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43478 (= res!287273 (validMask!0 mask!2352))))

(assert (=> start!43478 e!283498))

(assert (=> start!43478 true))

(assert (=> start!43478 tp_is_empty!13783))

(declare-fun array_inv!10900 (array!31212) Bool)

(assert (=> start!43478 (and (array_inv!10900 _values!1516) e!283497)))

(assert (=> start!43478 tp!43096))

(declare-fun array_inv!10901 (array!31214) Bool)

(assert (=> start!43478 (array_inv!10901 _keys!1874)))

(assert (= (and start!43478 res!287273) b!481843))

(assert (= (and b!481843 res!287271) b!481842))

(assert (= (and b!481842 res!287274) b!481841))

(assert (= (and b!481841 res!287272) b!481840))

(assert (= (and b!481844 condMapEmpty!22384) mapIsEmpty!22384))

(assert (= (and b!481844 (not condMapEmpty!22384)) mapNonEmpty!22384))

(get-info :version)

(assert (= (and mapNonEmpty!22384 ((_ is ValueCellFull!6530) mapValue!22384)) b!481846))

(assert (= (and b!481844 ((_ is ValueCellFull!6530) mapDefault!22384)) b!481845))

(assert (= start!43478 b!481844))

(declare-fun m!463465 () Bool)

(assert (=> b!481840 m!463465))

(assert (=> b!481840 m!463465))

(declare-fun m!463467 () Bool)

(assert (=> b!481840 m!463467))

(declare-fun m!463469 () Bool)

(assert (=> start!43478 m!463469))

(declare-fun m!463471 () Bool)

(assert (=> start!43478 m!463471))

(declare-fun m!463473 () Bool)

(assert (=> start!43478 m!463473))

(declare-fun m!463475 () Bool)

(assert (=> b!481842 m!463475))

(declare-fun m!463477 () Bool)

(assert (=> mapNonEmpty!22384 m!463477))

(declare-fun m!463479 () Bool)

(assert (=> b!481841 m!463479))

(check-sat (not start!43478) (not b_next!12271) tp_is_empty!13783 (not b!481841) (not mapNonEmpty!22384) (not b!481842) b_and!21041 (not b!481840))
(check-sat b_and!21041 (not b_next!12271))
