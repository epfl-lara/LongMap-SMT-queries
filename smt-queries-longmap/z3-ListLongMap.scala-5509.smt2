; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73006 () Bool)

(assert start!73006)

(declare-fun b_free!13753 () Bool)

(declare-fun b_next!13753 () Bool)

(assert (=> start!73006 (= b_free!13753 (not b_next!13753))))

(declare-fun tp!48763 () Bool)

(declare-fun b_and!22849 () Bool)

(assert (=> start!73006 (= tp!48763 b_and!22849)))

(declare-fun res!574595 () Bool)

(declare-fun e!472488 () Bool)

(assert (=> start!73006 (=> (not res!574595) (not e!472488))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48045 0))(
  ( (array!48046 (arr!23049 (Array (_ BitVec 32) (_ BitVec 64))) (size!23490 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48045)

(assert (=> start!73006 (= res!574595 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23490 _keys!868))))))

(assert (=> start!73006 e!472488))

(assert (=> start!73006 true))

(assert (=> start!73006 tp!48763))

(declare-fun array_inv!18372 (array!48045) Bool)

(assert (=> start!73006 (array_inv!18372 _keys!868)))

(declare-datatypes ((V!26233 0))(
  ( (V!26234 (val!7992 Int)) )
))
(declare-datatypes ((ValueCell!7505 0))(
  ( (ValueCellFull!7505 (v!10417 V!26233)) (EmptyCell!7505) )
))
(declare-datatypes ((array!48047 0))(
  ( (array!48048 (arr!23050 (Array (_ BitVec 32) ValueCell!7505)) (size!23491 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48047)

(declare-fun e!472486 () Bool)

(declare-fun array_inv!18373 (array!48047) Bool)

(assert (=> start!73006 (and (array_inv!18373 _values!688) e!472486)))

(declare-fun tp_is_empty!15889 () Bool)

(assert (=> start!73006 tp_is_empty!15889))

(declare-fun b!846211 () Bool)

(declare-fun e!472489 () Bool)

(declare-fun mapRes!25433 () Bool)

(assert (=> b!846211 (= e!472486 (and e!472489 mapRes!25433))))

(declare-fun condMapEmpty!25433 () Bool)

(declare-fun mapDefault!25433 () ValueCell!7505)

(assert (=> b!846211 (= condMapEmpty!25433 (= (arr!23050 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7505)) mapDefault!25433)))))

(declare-fun b!846212 () Bool)

(declare-fun res!574597 () Bool)

(assert (=> b!846212 (=> (not res!574597) (not e!472488))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846212 (= res!574597 (and (= (size!23491 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23490 _keys!868) (size!23491 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846213 () Bool)

(declare-fun res!574590 () Bool)

(assert (=> b!846213 (=> (not res!574590) (not e!472488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846213 (= res!574590 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25433 () Bool)

(declare-fun tp!48764 () Bool)

(declare-fun e!472487 () Bool)

(assert (=> mapNonEmpty!25433 (= mapRes!25433 (and tp!48764 e!472487))))

(declare-fun mapValue!25433 () ValueCell!7505)

(declare-fun mapKey!25433 () (_ BitVec 32))

(declare-fun mapRest!25433 () (Array (_ BitVec 32) ValueCell!7505))

(assert (=> mapNonEmpty!25433 (= (arr!23050 _values!688) (store mapRest!25433 mapKey!25433 mapValue!25433))))

(declare-fun b!846214 () Bool)

(assert (=> b!846214 (= e!472489 tp_is_empty!15889)))

(declare-fun b!846215 () Bool)

(declare-fun res!574593 () Bool)

(assert (=> b!846215 (=> (not res!574593) (not e!472488))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846215 (= res!574593 (and (= (select (arr!23049 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25433 () Bool)

(assert (=> mapIsEmpty!25433 mapRes!25433))

(declare-fun b!846216 () Bool)

(declare-fun res!574591 () Bool)

(assert (=> b!846216 (=> (not res!574591) (not e!472488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48045 (_ BitVec 32)) Bool)

(assert (=> b!846216 (= res!574591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846217 () Bool)

(declare-fun res!574592 () Bool)

(assert (=> b!846217 (=> (not res!574592) (not e!472488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846217 (= res!574592 (validKeyInArray!0 k0!854))))

(declare-fun b!846218 () Bool)

(assert (=> b!846218 (= e!472487 tp_is_empty!15889)))

(declare-fun b!846219 () Bool)

(declare-fun res!574596 () Bool)

(assert (=> b!846219 (=> (not res!574596) (not e!472488))))

(assert (=> b!846219 (= res!574596 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23490 _keys!868))))))

(declare-fun b!846220 () Bool)

(assert (=> b!846220 (= e!472488 false)))

(declare-datatypes ((tuple2!10366 0))(
  ( (tuple2!10367 (_1!5194 (_ BitVec 64)) (_2!5194 V!26233)) )
))
(declare-datatypes ((List!16232 0))(
  ( (Nil!16229) (Cons!16228 (h!17365 tuple2!10366) (t!22595 List!16232)) )
))
(declare-datatypes ((ListLongMap!9137 0))(
  ( (ListLongMap!9138 (toList!4584 List!16232)) )
))
(declare-fun lt!381761 () ListLongMap!9137)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26233)

(declare-fun zeroValue!654 () V!26233)

(declare-fun getCurrentListMapNoExtraKeys!2642 (array!48045 array!48047 (_ BitVec 32) (_ BitVec 32) V!26233 V!26233 (_ BitVec 32) Int) ListLongMap!9137)

(assert (=> b!846220 (= lt!381761 (getCurrentListMapNoExtraKeys!2642 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846221 () Bool)

(declare-fun res!574594 () Bool)

(assert (=> b!846221 (=> (not res!574594) (not e!472488))))

(declare-datatypes ((List!16233 0))(
  ( (Nil!16230) (Cons!16229 (h!17366 (_ BitVec 64)) (t!22596 List!16233)) )
))
(declare-fun arrayNoDuplicates!0 (array!48045 (_ BitVec 32) List!16233) Bool)

(assert (=> b!846221 (= res!574594 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16230))))

(assert (= (and start!73006 res!574595) b!846213))

(assert (= (and b!846213 res!574590) b!846212))

(assert (= (and b!846212 res!574597) b!846216))

(assert (= (and b!846216 res!574591) b!846221))

(assert (= (and b!846221 res!574594) b!846219))

(assert (= (and b!846219 res!574596) b!846217))

(assert (= (and b!846217 res!574592) b!846215))

(assert (= (and b!846215 res!574593) b!846220))

(assert (= (and b!846211 condMapEmpty!25433) mapIsEmpty!25433))

(assert (= (and b!846211 (not condMapEmpty!25433)) mapNonEmpty!25433))

(get-info :version)

(assert (= (and mapNonEmpty!25433 ((_ is ValueCellFull!7505) mapValue!25433)) b!846218))

(assert (= (and b!846211 ((_ is ValueCellFull!7505) mapDefault!25433)) b!846214))

(assert (= start!73006 b!846211))

(declare-fun m!788471 () Bool)

(assert (=> b!846220 m!788471))

(declare-fun m!788473 () Bool)

(assert (=> b!846221 m!788473))

(declare-fun m!788475 () Bool)

(assert (=> b!846213 m!788475))

(declare-fun m!788477 () Bool)

(assert (=> b!846217 m!788477))

(declare-fun m!788479 () Bool)

(assert (=> b!846215 m!788479))

(declare-fun m!788481 () Bool)

(assert (=> b!846216 m!788481))

(declare-fun m!788483 () Bool)

(assert (=> mapNonEmpty!25433 m!788483))

(declare-fun m!788485 () Bool)

(assert (=> start!73006 m!788485))

(declare-fun m!788487 () Bool)

(assert (=> start!73006 m!788487))

(check-sat (not b_next!13753) (not b!846221) (not start!73006) (not b!846213) (not mapNonEmpty!25433) (not b!846216) (not b!846217) (not b!846220) b_and!22849 tp_is_empty!15889)
(check-sat b_and!22849 (not b_next!13753))
