; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73018 () Bool)

(assert start!73018)

(declare-fun b_free!13765 () Bool)

(declare-fun b_next!13765 () Bool)

(assert (=> start!73018 (= b_free!13765 (not b_next!13765))))

(declare-fun tp!48799 () Bool)

(declare-fun b_and!22861 () Bool)

(assert (=> start!73018 (= tp!48799 b_and!22861)))

(declare-fun b!846409 () Bool)

(declare-fun e!472575 () Bool)

(assert (=> b!846409 (= e!472575 false)))

(declare-datatypes ((V!26249 0))(
  ( (V!26250 (val!7998 Int)) )
))
(declare-datatypes ((tuple2!10374 0))(
  ( (tuple2!10375 (_1!5198 (_ BitVec 64)) (_2!5198 V!26249)) )
))
(declare-datatypes ((List!16239 0))(
  ( (Nil!16236) (Cons!16235 (h!17372 tuple2!10374) (t!22602 List!16239)) )
))
(declare-datatypes ((ListLongMap!9145 0))(
  ( (ListLongMap!9146 (toList!4588 List!16239)) )
))
(declare-fun lt!381779 () ListLongMap!9145)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48067 0))(
  ( (array!48068 (arr!23060 (Array (_ BitVec 32) (_ BitVec 64))) (size!23501 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48067)

(declare-datatypes ((ValueCell!7511 0))(
  ( (ValueCellFull!7511 (v!10423 V!26249)) (EmptyCell!7511) )
))
(declare-datatypes ((array!48069 0))(
  ( (array!48070 (arr!23061 (Array (_ BitVec 32) ValueCell!7511)) (size!23502 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48069)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26249)

(declare-fun zeroValue!654 () V!26249)

(declare-fun getCurrentListMapNoExtraKeys!2646 (array!48067 array!48069 (_ BitVec 32) (_ BitVec 32) V!26249 V!26249 (_ BitVec 32) Int) ListLongMap!9145)

(assert (=> b!846409 (= lt!381779 (getCurrentListMapNoExtraKeys!2646 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846410 () Bool)

(declare-fun res!574734 () Bool)

(assert (=> b!846410 (=> (not res!574734) (not e!472575))))

(declare-datatypes ((List!16240 0))(
  ( (Nil!16237) (Cons!16236 (h!17373 (_ BitVec 64)) (t!22603 List!16240)) )
))
(declare-fun arrayNoDuplicates!0 (array!48067 (_ BitVec 32) List!16240) Bool)

(assert (=> b!846410 (= res!574734 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16237))))

(declare-fun b!846411 () Bool)

(declare-fun e!472576 () Bool)

(declare-fun tp_is_empty!15901 () Bool)

(assert (=> b!846411 (= e!472576 tp_is_empty!15901)))

(declare-fun res!574735 () Bool)

(assert (=> start!73018 (=> (not res!574735) (not e!472575))))

(assert (=> start!73018 (= res!574735 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23501 _keys!868))))))

(assert (=> start!73018 e!472575))

(assert (=> start!73018 true))

(assert (=> start!73018 tp!48799))

(declare-fun array_inv!18378 (array!48067) Bool)

(assert (=> start!73018 (array_inv!18378 _keys!868)))

(declare-fun e!472578 () Bool)

(declare-fun array_inv!18379 (array!48069) Bool)

(assert (=> start!73018 (and (array_inv!18379 _values!688) e!472578)))

(assert (=> start!73018 tp_is_empty!15901))

(declare-fun b!846412 () Bool)

(declare-fun e!472577 () Bool)

(declare-fun mapRes!25451 () Bool)

(assert (=> b!846412 (= e!472578 (and e!472577 mapRes!25451))))

(declare-fun condMapEmpty!25451 () Bool)

(declare-fun mapDefault!25451 () ValueCell!7511)

(assert (=> b!846412 (= condMapEmpty!25451 (= (arr!23061 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7511)) mapDefault!25451)))))

(declare-fun b!846413 () Bool)

(declare-fun res!574739 () Bool)

(assert (=> b!846413 (=> (not res!574739) (not e!472575))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846413 (= res!574739 (and (= (select (arr!23060 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846414 () Bool)

(declare-fun res!574737 () Bool)

(assert (=> b!846414 (=> (not res!574737) (not e!472575))))

(assert (=> b!846414 (= res!574737 (and (= (size!23502 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23501 _keys!868) (size!23502 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846415 () Bool)

(assert (=> b!846415 (= e!472577 tp_is_empty!15901)))

(declare-fun mapIsEmpty!25451 () Bool)

(assert (=> mapIsEmpty!25451 mapRes!25451))

(declare-fun b!846416 () Bool)

(declare-fun res!574738 () Bool)

(assert (=> b!846416 (=> (not res!574738) (not e!472575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48067 (_ BitVec 32)) Bool)

(assert (=> b!846416 (= res!574738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846417 () Bool)

(declare-fun res!574736 () Bool)

(assert (=> b!846417 (=> (not res!574736) (not e!472575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846417 (= res!574736 (validKeyInArray!0 k0!854))))

(declare-fun b!846418 () Bool)

(declare-fun res!574741 () Bool)

(assert (=> b!846418 (=> (not res!574741) (not e!472575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846418 (= res!574741 (validMask!0 mask!1196))))

(declare-fun b!846419 () Bool)

(declare-fun res!574740 () Bool)

(assert (=> b!846419 (=> (not res!574740) (not e!472575))))

(assert (=> b!846419 (= res!574740 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23501 _keys!868))))))

(declare-fun mapNonEmpty!25451 () Bool)

(declare-fun tp!48800 () Bool)

(assert (=> mapNonEmpty!25451 (= mapRes!25451 (and tp!48800 e!472576))))

(declare-fun mapRest!25451 () (Array (_ BitVec 32) ValueCell!7511))

(declare-fun mapKey!25451 () (_ BitVec 32))

(declare-fun mapValue!25451 () ValueCell!7511)

(assert (=> mapNonEmpty!25451 (= (arr!23061 _values!688) (store mapRest!25451 mapKey!25451 mapValue!25451))))

(assert (= (and start!73018 res!574735) b!846418))

(assert (= (and b!846418 res!574741) b!846414))

(assert (= (and b!846414 res!574737) b!846416))

(assert (= (and b!846416 res!574738) b!846410))

(assert (= (and b!846410 res!574734) b!846419))

(assert (= (and b!846419 res!574740) b!846417))

(assert (= (and b!846417 res!574736) b!846413))

(assert (= (and b!846413 res!574739) b!846409))

(assert (= (and b!846412 condMapEmpty!25451) mapIsEmpty!25451))

(assert (= (and b!846412 (not condMapEmpty!25451)) mapNonEmpty!25451))

(get-info :version)

(assert (= (and mapNonEmpty!25451 ((_ is ValueCellFull!7511) mapValue!25451)) b!846411))

(assert (= (and b!846412 ((_ is ValueCellFull!7511) mapDefault!25451)) b!846415))

(assert (= start!73018 b!846412))

(declare-fun m!788579 () Bool)

(assert (=> b!846416 m!788579))

(declare-fun m!788581 () Bool)

(assert (=> mapNonEmpty!25451 m!788581))

(declare-fun m!788583 () Bool)

(assert (=> b!846418 m!788583))

(declare-fun m!788585 () Bool)

(assert (=> b!846409 m!788585))

(declare-fun m!788587 () Bool)

(assert (=> b!846417 m!788587))

(declare-fun m!788589 () Bool)

(assert (=> b!846413 m!788589))

(declare-fun m!788591 () Bool)

(assert (=> b!846410 m!788591))

(declare-fun m!788593 () Bool)

(assert (=> start!73018 m!788593))

(declare-fun m!788595 () Bool)

(assert (=> start!73018 m!788595))

(check-sat tp_is_empty!15901 (not mapNonEmpty!25451) b_and!22861 (not b!846409) (not start!73018) (not b!846416) (not b!846417) (not b!846418) (not b!846410) (not b_next!13765))
(check-sat b_and!22861 (not b_next!13765))
