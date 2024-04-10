; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72900 () Bool)

(assert start!72900)

(declare-fun b_free!13815 () Bool)

(declare-fun b_next!13815 () Bool)

(assert (=> start!72900 (= b_free!13815 (not b_next!13815))))

(declare-fun tp!48949 () Bool)

(declare-fun b_and!22901 () Bool)

(assert (=> start!72900 (= tp!48949 b_and!22901)))

(declare-fun b!846331 () Bool)

(declare-fun e!472370 () Bool)

(declare-fun e!472368 () Bool)

(declare-fun mapRes!25526 () Bool)

(assert (=> b!846331 (= e!472370 (and e!472368 mapRes!25526))))

(declare-fun condMapEmpty!25526 () Bool)

(declare-datatypes ((V!26315 0))(
  ( (V!26316 (val!8023 Int)) )
))
(declare-datatypes ((ValueCell!7536 0))(
  ( (ValueCellFull!7536 (v!10448 V!26315)) (EmptyCell!7536) )
))
(declare-datatypes ((array!48116 0))(
  ( (array!48117 (arr!23089 (Array (_ BitVec 32) ValueCell!7536)) (size!23529 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48116)

(declare-fun mapDefault!25526 () ValueCell!7536)

(assert (=> b!846331 (= condMapEmpty!25526 (= (arr!23089 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7536)) mapDefault!25526)))))

(declare-fun b!846332 () Bool)

(declare-fun res!574996 () Bool)

(declare-fun e!472371 () Bool)

(assert (=> b!846332 (=> (not res!574996) (not e!472371))))

(declare-datatypes ((array!48118 0))(
  ( (array!48119 (arr!23090 (Array (_ BitVec 32) (_ BitVec 64))) (size!23530 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48118)

(declare-datatypes ((List!16341 0))(
  ( (Nil!16338) (Cons!16337 (h!17468 (_ BitVec 64)) (t!22712 List!16341)) )
))
(declare-fun arrayNoDuplicates!0 (array!48118 (_ BitVec 32) List!16341) Bool)

(assert (=> b!846332 (= res!574996 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16338))))

(declare-fun b!846333 () Bool)

(declare-fun res!574991 () Bool)

(assert (=> b!846333 (=> (not res!574991) (not e!472371))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846333 (= res!574991 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25526 () Bool)

(assert (=> mapIsEmpty!25526 mapRes!25526))

(declare-fun res!574993 () Bool)

(assert (=> start!72900 (=> (not res!574993) (not e!472371))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72900 (= res!574993 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23530 _keys!868))))))

(assert (=> start!72900 e!472371))

(declare-fun tp_is_empty!15951 () Bool)

(assert (=> start!72900 tp_is_empty!15951))

(assert (=> start!72900 true))

(assert (=> start!72900 tp!48949))

(declare-fun array_inv!18346 (array!48118) Bool)

(assert (=> start!72900 (array_inv!18346 _keys!868)))

(declare-fun array_inv!18347 (array!48116) Bool)

(assert (=> start!72900 (and (array_inv!18347 _values!688) e!472370)))

(declare-fun mapNonEmpty!25526 () Bool)

(declare-fun tp!48948 () Bool)

(declare-fun e!472372 () Bool)

(assert (=> mapNonEmpty!25526 (= mapRes!25526 (and tp!48948 e!472372))))

(declare-fun mapValue!25526 () ValueCell!7536)

(declare-fun mapKey!25526 () (_ BitVec 32))

(declare-fun mapRest!25526 () (Array (_ BitVec 32) ValueCell!7536))

(assert (=> mapNonEmpty!25526 (= (arr!23089 _values!688) (store mapRest!25526 mapKey!25526 mapValue!25526))))

(declare-fun b!846334 () Bool)

(declare-fun res!574997 () Bool)

(assert (=> b!846334 (=> (not res!574997) (not e!472371))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48118 (_ BitVec 32)) Bool)

(assert (=> b!846334 (= res!574997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846335 () Bool)

(declare-fun res!574990 () Bool)

(assert (=> b!846335 (=> (not res!574990) (not e!472371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846335 (= res!574990 (validMask!0 mask!1196))))

(declare-fun b!846336 () Bool)

(assert (=> b!846336 (= e!472368 tp_is_empty!15951)))

(declare-fun b!846337 () Bool)

(assert (=> b!846337 (= e!472371 false)))

(declare-fun v!557 () V!26315)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26315)

(declare-fun zeroValue!654 () V!26315)

(declare-datatypes ((tuple2!10480 0))(
  ( (tuple2!10481 (_1!5251 (_ BitVec 64)) (_2!5251 V!26315)) )
))
(declare-datatypes ((List!16342 0))(
  ( (Nil!16339) (Cons!16338 (h!17469 tuple2!10480) (t!22713 List!16342)) )
))
(declare-datatypes ((ListLongMap!9249 0))(
  ( (ListLongMap!9250 (toList!4640 List!16342)) )
))
(declare-fun lt!381516 () ListLongMap!9249)

(declare-fun getCurrentListMapNoExtraKeys!2625 (array!48118 array!48116 (_ BitVec 32) (_ BitVec 32) V!26315 V!26315 (_ BitVec 32) Int) ListLongMap!9249)

(assert (=> b!846337 (= lt!381516 (getCurrentListMapNoExtraKeys!2625 _keys!868 (array!48117 (store (arr!23089 _values!688) i!612 (ValueCellFull!7536 v!557)) (size!23529 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381517 () ListLongMap!9249)

(assert (=> b!846337 (= lt!381517 (getCurrentListMapNoExtraKeys!2625 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846338 () Bool)

(assert (=> b!846338 (= e!472372 tp_is_empty!15951)))

(declare-fun b!846339 () Bool)

(declare-fun res!574994 () Bool)

(assert (=> b!846339 (=> (not res!574994) (not e!472371))))

(assert (=> b!846339 (= res!574994 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23530 _keys!868))))))

(declare-fun b!846340 () Bool)

(declare-fun res!574992 () Bool)

(assert (=> b!846340 (=> (not res!574992) (not e!472371))))

(assert (=> b!846340 (= res!574992 (and (= (select (arr!23090 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846341 () Bool)

(declare-fun res!574995 () Bool)

(assert (=> b!846341 (=> (not res!574995) (not e!472371))))

(assert (=> b!846341 (= res!574995 (and (= (size!23529 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23530 _keys!868) (size!23529 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72900 res!574993) b!846335))

(assert (= (and b!846335 res!574990) b!846341))

(assert (= (and b!846341 res!574995) b!846334))

(assert (= (and b!846334 res!574997) b!846332))

(assert (= (and b!846332 res!574996) b!846339))

(assert (= (and b!846339 res!574994) b!846333))

(assert (= (and b!846333 res!574991) b!846340))

(assert (= (and b!846340 res!574992) b!846337))

(assert (= (and b!846331 condMapEmpty!25526) mapIsEmpty!25526))

(assert (= (and b!846331 (not condMapEmpty!25526)) mapNonEmpty!25526))

(get-info :version)

(assert (= (and mapNonEmpty!25526 ((_ is ValueCellFull!7536) mapValue!25526)) b!846338))

(assert (= (and b!846331 ((_ is ValueCellFull!7536) mapDefault!25526)) b!846336))

(assert (= start!72900 b!846331))

(declare-fun m!787765 () Bool)

(assert (=> b!846340 m!787765))

(declare-fun m!787767 () Bool)

(assert (=> b!846337 m!787767))

(declare-fun m!787769 () Bool)

(assert (=> b!846337 m!787769))

(declare-fun m!787771 () Bool)

(assert (=> b!846337 m!787771))

(declare-fun m!787773 () Bool)

(assert (=> b!846334 m!787773))

(declare-fun m!787775 () Bool)

(assert (=> mapNonEmpty!25526 m!787775))

(declare-fun m!787777 () Bool)

(assert (=> b!846333 m!787777))

(declare-fun m!787779 () Bool)

(assert (=> b!846332 m!787779))

(declare-fun m!787781 () Bool)

(assert (=> b!846335 m!787781))

(declare-fun m!787783 () Bool)

(assert (=> start!72900 m!787783))

(declare-fun m!787785 () Bool)

(assert (=> start!72900 m!787785))

(check-sat (not mapNonEmpty!25526) (not start!72900) b_and!22901 (not b!846337) (not b!846335) (not b!846333) (not b!846332) (not b_next!13815) tp_is_empty!15951 (not b!846334))
(check-sat b_and!22901 (not b_next!13815))
