; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20284 () Bool)

(assert start!20284)

(declare-fun b_free!4939 () Bool)

(declare-fun b_next!4939 () Bool)

(assert (=> start!20284 (= b_free!4939 (not b_next!4939))))

(declare-fun tp!17848 () Bool)

(declare-fun b_and!11659 () Bool)

(assert (=> start!20284 (= tp!17848 b_and!11659)))

(declare-fun b!199487 () Bool)

(declare-fun res!94835 () Bool)

(declare-fun e!130919 () Bool)

(assert (=> b!199487 (=> (not res!94835) (not e!130919))))

(declare-datatypes ((array!8811 0))(
  ( (array!8812 (arr!4155 (Array (_ BitVec 32) (_ BitVec 64))) (size!4481 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8811)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8811 (_ BitVec 32)) Bool)

(assert (=> b!199487 (= res!94835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199488 () Bool)

(declare-fun e!130921 () Bool)

(declare-fun tp_is_empty!4795 () Bool)

(assert (=> b!199488 (= e!130921 tp_is_empty!4795)))

(declare-fun mapIsEmpty!8261 () Bool)

(declare-fun mapRes!8261 () Bool)

(assert (=> mapIsEmpty!8261 mapRes!8261))

(declare-fun b!199489 () Bool)

(declare-fun res!94829 () Bool)

(assert (=> b!199489 (=> (not res!94829) (not e!130919))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199489 (= res!94829 (= (select (arr!4155 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8261 () Bool)

(declare-fun tp!17849 () Bool)

(declare-fun e!130920 () Bool)

(assert (=> mapNonEmpty!8261 (= mapRes!8261 (and tp!17849 e!130920))))

(declare-datatypes ((V!6041 0))(
  ( (V!6042 (val!2442 Int)) )
))
(declare-datatypes ((ValueCell!2054 0))(
  ( (ValueCellFull!2054 (v!4406 V!6041)) (EmptyCell!2054) )
))
(declare-datatypes ((array!8813 0))(
  ( (array!8814 (arr!4156 (Array (_ BitVec 32) ValueCell!2054)) (size!4482 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8813)

(declare-fun mapValue!8261 () ValueCell!2054)

(declare-fun mapRest!8261 () (Array (_ BitVec 32) ValueCell!2054))

(declare-fun mapKey!8261 () (_ BitVec 32))

(assert (=> mapNonEmpty!8261 (= (arr!4156 _values!649) (store mapRest!8261 mapKey!8261 mapValue!8261))))

(declare-fun b!199490 () Bool)

(declare-fun res!94830 () Bool)

(assert (=> b!199490 (=> (not res!94830) (not e!130919))))

(declare-datatypes ((List!2592 0))(
  ( (Nil!2589) (Cons!2588 (h!3230 (_ BitVec 64)) (t!7514 List!2592)) )
))
(declare-fun arrayNoDuplicates!0 (array!8811 (_ BitVec 32) List!2592) Bool)

(assert (=> b!199490 (= res!94830 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2589))))

(declare-fun res!94834 () Bool)

(assert (=> start!20284 (=> (not res!94834) (not e!130919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20284 (= res!94834 (validMask!0 mask!1149))))

(assert (=> start!20284 e!130919))

(declare-fun e!130922 () Bool)

(declare-fun array_inv!2713 (array!8813) Bool)

(assert (=> start!20284 (and (array_inv!2713 _values!649) e!130922)))

(assert (=> start!20284 true))

(assert (=> start!20284 tp_is_empty!4795))

(declare-fun array_inv!2714 (array!8811) Bool)

(assert (=> start!20284 (array_inv!2714 _keys!825)))

(assert (=> start!20284 tp!17848))

(declare-fun b!199491 () Bool)

(declare-fun res!94831 () Bool)

(assert (=> b!199491 (=> (not res!94831) (not e!130919))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199491 (= res!94831 (and (= (size!4482 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4481 _keys!825) (size!4482 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199492 () Bool)

(assert (=> b!199492 (= e!130919 (not true))))

(declare-datatypes ((tuple2!3664 0))(
  ( (tuple2!3665 (_1!1843 (_ BitVec 64)) (_2!1843 V!6041)) )
))
(declare-datatypes ((List!2593 0))(
  ( (Nil!2590) (Cons!2589 (h!3231 tuple2!3664) (t!7515 List!2593)) )
))
(declare-datatypes ((ListLongMap!2567 0))(
  ( (ListLongMap!2568 (toList!1299 List!2593)) )
))
(declare-fun lt!98256 () ListLongMap!2567)

(declare-fun lt!98253 () array!8813)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6041)

(declare-fun zeroValue!615 () V!6041)

(declare-fun getCurrentListMap!869 (array!8811 array!8813 (_ BitVec 32) (_ BitVec 32) V!6041 V!6041 (_ BitVec 32) Int) ListLongMap!2567)

(assert (=> b!199492 (= lt!98256 (getCurrentListMap!869 _keys!825 lt!98253 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98254 () ListLongMap!2567)

(declare-fun lt!98255 () ListLongMap!2567)

(assert (=> b!199492 (and (= lt!98254 lt!98255) (= lt!98255 lt!98254))))

(declare-fun v!520 () V!6041)

(declare-fun lt!98257 () ListLongMap!2567)

(declare-fun +!348 (ListLongMap!2567 tuple2!3664) ListLongMap!2567)

(assert (=> b!199492 (= lt!98255 (+!348 lt!98257 (tuple2!3665 k0!843 v!520)))))

(declare-datatypes ((Unit!5948 0))(
  ( (Unit!5949) )
))
(declare-fun lt!98258 () Unit!5948)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!28 (array!8811 array!8813 (_ BitVec 32) (_ BitVec 32) V!6041 V!6041 (_ BitVec 32) (_ BitVec 64) V!6041 (_ BitVec 32) Int) Unit!5948)

(assert (=> b!199492 (= lt!98258 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!28 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!279 (array!8811 array!8813 (_ BitVec 32) (_ BitVec 32) V!6041 V!6041 (_ BitVec 32) Int) ListLongMap!2567)

(assert (=> b!199492 (= lt!98254 (getCurrentListMapNoExtraKeys!279 _keys!825 lt!98253 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199492 (= lt!98253 (array!8814 (store (arr!4156 _values!649) i!601 (ValueCellFull!2054 v!520)) (size!4482 _values!649)))))

(assert (=> b!199492 (= lt!98257 (getCurrentListMapNoExtraKeys!279 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199493 () Bool)

(declare-fun res!94832 () Bool)

(assert (=> b!199493 (=> (not res!94832) (not e!130919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199493 (= res!94832 (validKeyInArray!0 k0!843))))

(declare-fun b!199494 () Bool)

(assert (=> b!199494 (= e!130922 (and e!130921 mapRes!8261))))

(declare-fun condMapEmpty!8261 () Bool)

(declare-fun mapDefault!8261 () ValueCell!2054)

(assert (=> b!199494 (= condMapEmpty!8261 (= (arr!4156 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2054)) mapDefault!8261)))))

(declare-fun b!199495 () Bool)

(declare-fun res!94833 () Bool)

(assert (=> b!199495 (=> (not res!94833) (not e!130919))))

(assert (=> b!199495 (= res!94833 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4481 _keys!825))))))

(declare-fun b!199496 () Bool)

(assert (=> b!199496 (= e!130920 tp_is_empty!4795)))

(assert (= (and start!20284 res!94834) b!199491))

(assert (= (and b!199491 res!94831) b!199487))

(assert (= (and b!199487 res!94835) b!199490))

(assert (= (and b!199490 res!94830) b!199495))

(assert (= (and b!199495 res!94833) b!199493))

(assert (= (and b!199493 res!94832) b!199489))

(assert (= (and b!199489 res!94829) b!199492))

(assert (= (and b!199494 condMapEmpty!8261) mapIsEmpty!8261))

(assert (= (and b!199494 (not condMapEmpty!8261)) mapNonEmpty!8261))

(get-info :version)

(assert (= (and mapNonEmpty!8261 ((_ is ValueCellFull!2054) mapValue!8261)) b!199496))

(assert (= (and b!199494 ((_ is ValueCellFull!2054) mapDefault!8261)) b!199488))

(assert (= start!20284 b!199494))

(declare-fun m!225471 () Bool)

(assert (=> b!199492 m!225471))

(declare-fun m!225473 () Bool)

(assert (=> b!199492 m!225473))

(declare-fun m!225475 () Bool)

(assert (=> b!199492 m!225475))

(declare-fun m!225477 () Bool)

(assert (=> b!199492 m!225477))

(declare-fun m!225479 () Bool)

(assert (=> b!199492 m!225479))

(declare-fun m!225481 () Bool)

(assert (=> b!199492 m!225481))

(declare-fun m!225483 () Bool)

(assert (=> b!199490 m!225483))

(declare-fun m!225485 () Bool)

(assert (=> start!20284 m!225485))

(declare-fun m!225487 () Bool)

(assert (=> start!20284 m!225487))

(declare-fun m!225489 () Bool)

(assert (=> start!20284 m!225489))

(declare-fun m!225491 () Bool)

(assert (=> mapNonEmpty!8261 m!225491))

(declare-fun m!225493 () Bool)

(assert (=> b!199487 m!225493))

(declare-fun m!225495 () Bool)

(assert (=> b!199489 m!225495))

(declare-fun m!225497 () Bool)

(assert (=> b!199493 m!225497))

(check-sat tp_is_empty!4795 (not mapNonEmpty!8261) (not b!199487) (not start!20284) (not b_next!4939) (not b!199490) (not b!199492) (not b!199493) b_and!11659)
(check-sat b_and!11659 (not b_next!4939))
