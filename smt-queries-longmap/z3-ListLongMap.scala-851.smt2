; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20206 () Bool)

(assert start!20206)

(declare-fun b_free!4861 () Bool)

(declare-fun b_next!4861 () Bool)

(assert (=> start!20206 (= b_free!4861 (not b_next!4861))))

(declare-fun tp!17614 () Bool)

(declare-fun b_and!11621 () Bool)

(assert (=> start!20206 (= tp!17614 b_and!11621)))

(declare-fun b!198511 () Bool)

(declare-fun res!94130 () Bool)

(declare-fun e!130459 () Bool)

(assert (=> b!198511 (=> (not res!94130) (not e!130459))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8669 0))(
  ( (array!8670 (arr!4085 (Array (_ BitVec 32) (_ BitVec 64))) (size!4410 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8669)

(assert (=> b!198511 (= res!94130 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4410 _keys!825))))))

(declare-fun b!198512 () Bool)

(declare-fun res!94131 () Bool)

(assert (=> b!198512 (=> (not res!94131) (not e!130459))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8669 (_ BitVec 32)) Bool)

(assert (=> b!198512 (= res!94131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198513 () Bool)

(declare-fun res!94127 () Bool)

(assert (=> b!198513 (=> (not res!94127) (not e!130459))))

(declare-datatypes ((List!2508 0))(
  ( (Nil!2505) (Cons!2504 (h!3146 (_ BitVec 64)) (t!7431 List!2508)) )
))
(declare-fun arrayNoDuplicates!0 (array!8669 (_ BitVec 32) List!2508) Bool)

(assert (=> b!198513 (= res!94127 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2505))))

(declare-fun b!198515 () Bool)

(declare-fun e!130461 () Bool)

(declare-fun tp_is_empty!4717 () Bool)

(assert (=> b!198515 (= e!130461 tp_is_empty!4717)))

(declare-fun b!198516 () Bool)

(assert (=> b!198516 (= e!130459 false)))

(declare-datatypes ((V!5937 0))(
  ( (V!5938 (val!2403 Int)) )
))
(declare-datatypes ((ValueCell!2015 0))(
  ( (ValueCellFull!2015 (v!4374 V!5937)) (EmptyCell!2015) )
))
(declare-datatypes ((array!8671 0))(
  ( (array!8672 (arr!4086 (Array (_ BitVec 32) ValueCell!2015)) (size!4411 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8671)

(declare-fun v!520 () V!5937)

(declare-datatypes ((tuple2!3588 0))(
  ( (tuple2!3589 (_1!1805 (_ BitVec 64)) (_2!1805 V!5937)) )
))
(declare-datatypes ((List!2509 0))(
  ( (Nil!2506) (Cons!2505 (h!3147 tuple2!3588) (t!7432 List!2509)) )
))
(declare-datatypes ((ListLongMap!2503 0))(
  ( (ListLongMap!2504 (toList!1267 List!2509)) )
))
(declare-fun lt!97981 () ListLongMap!2503)

(declare-fun zeroValue!615 () V!5937)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5937)

(declare-fun getCurrentListMapNoExtraKeys!257 (array!8669 array!8671 (_ BitVec 32) (_ BitVec 32) V!5937 V!5937 (_ BitVec 32) Int) ListLongMap!2503)

(assert (=> b!198516 (= lt!97981 (getCurrentListMapNoExtraKeys!257 _keys!825 (array!8672 (store (arr!4086 _values!649) i!601 (ValueCellFull!2015 v!520)) (size!4411 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97982 () ListLongMap!2503)

(assert (=> b!198516 (= lt!97982 (getCurrentListMapNoExtraKeys!257 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8144 () Bool)

(declare-fun mapRes!8144 () Bool)

(assert (=> mapIsEmpty!8144 mapRes!8144))

(declare-fun b!198517 () Bool)

(declare-fun res!94129 () Bool)

(assert (=> b!198517 (=> (not res!94129) (not e!130459))))

(assert (=> b!198517 (= res!94129 (and (= (size!4411 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4410 _keys!825) (size!4411 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198518 () Bool)

(declare-fun res!94126 () Bool)

(assert (=> b!198518 (=> (not res!94126) (not e!130459))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198518 (= res!94126 (validKeyInArray!0 k0!843))))

(declare-fun b!198519 () Bool)

(declare-fun e!130462 () Bool)

(assert (=> b!198519 (= e!130462 tp_is_empty!4717)))

(declare-fun mapNonEmpty!8144 () Bool)

(declare-fun tp!17615 () Bool)

(assert (=> mapNonEmpty!8144 (= mapRes!8144 (and tp!17615 e!130462))))

(declare-fun mapKey!8144 () (_ BitVec 32))

(declare-fun mapValue!8144 () ValueCell!2015)

(declare-fun mapRest!8144 () (Array (_ BitVec 32) ValueCell!2015))

(assert (=> mapNonEmpty!8144 (= (arr!4086 _values!649) (store mapRest!8144 mapKey!8144 mapValue!8144))))

(declare-fun b!198520 () Bool)

(declare-fun e!130463 () Bool)

(assert (=> b!198520 (= e!130463 (and e!130461 mapRes!8144))))

(declare-fun condMapEmpty!8144 () Bool)

(declare-fun mapDefault!8144 () ValueCell!2015)

(assert (=> b!198520 (= condMapEmpty!8144 (= (arr!4086 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2015)) mapDefault!8144)))))

(declare-fun b!198514 () Bool)

(declare-fun res!94132 () Bool)

(assert (=> b!198514 (=> (not res!94132) (not e!130459))))

(assert (=> b!198514 (= res!94132 (= (select (arr!4085 _keys!825) i!601) k0!843))))

(declare-fun res!94128 () Bool)

(assert (=> start!20206 (=> (not res!94128) (not e!130459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20206 (= res!94128 (validMask!0 mask!1149))))

(assert (=> start!20206 e!130459))

(declare-fun array_inv!2663 (array!8671) Bool)

(assert (=> start!20206 (and (array_inv!2663 _values!649) e!130463)))

(assert (=> start!20206 true))

(assert (=> start!20206 tp_is_empty!4717))

(declare-fun array_inv!2664 (array!8669) Bool)

(assert (=> start!20206 (array_inv!2664 _keys!825)))

(assert (=> start!20206 tp!17614))

(assert (= (and start!20206 res!94128) b!198517))

(assert (= (and b!198517 res!94129) b!198512))

(assert (= (and b!198512 res!94131) b!198513))

(assert (= (and b!198513 res!94127) b!198511))

(assert (= (and b!198511 res!94130) b!198518))

(assert (= (and b!198518 res!94126) b!198514))

(assert (= (and b!198514 res!94132) b!198516))

(assert (= (and b!198520 condMapEmpty!8144) mapIsEmpty!8144))

(assert (= (and b!198520 (not condMapEmpty!8144)) mapNonEmpty!8144))

(get-info :version)

(assert (= (and mapNonEmpty!8144 ((_ is ValueCellFull!2015) mapValue!8144)) b!198519))

(assert (= (and b!198520 ((_ is ValueCellFull!2015) mapDefault!8144)) b!198515))

(assert (= start!20206 b!198520))

(declare-fun m!225249 () Bool)

(assert (=> b!198513 m!225249))

(declare-fun m!225251 () Bool)

(assert (=> b!198518 m!225251))

(declare-fun m!225253 () Bool)

(assert (=> start!20206 m!225253))

(declare-fun m!225255 () Bool)

(assert (=> start!20206 m!225255))

(declare-fun m!225257 () Bool)

(assert (=> start!20206 m!225257))

(declare-fun m!225259 () Bool)

(assert (=> b!198514 m!225259))

(declare-fun m!225261 () Bool)

(assert (=> b!198516 m!225261))

(declare-fun m!225263 () Bool)

(assert (=> b!198516 m!225263))

(declare-fun m!225265 () Bool)

(assert (=> b!198516 m!225265))

(declare-fun m!225267 () Bool)

(assert (=> b!198512 m!225267))

(declare-fun m!225269 () Bool)

(assert (=> mapNonEmpty!8144 m!225269))

(check-sat (not b!198512) (not b_next!4861) (not b!198516) (not b!198513) (not start!20206) (not mapNonEmpty!8144) b_and!11621 (not b!198518) tp_is_empty!4717)
(check-sat b_and!11621 (not b_next!4861))
