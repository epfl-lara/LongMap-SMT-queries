; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73096 () Bool)

(assert start!73096)

(declare-fun b_free!13843 () Bool)

(declare-fun b_next!13843 () Bool)

(assert (=> start!73096 (= b_free!13843 (not b_next!13843))))

(declare-fun tp!49033 () Bool)

(declare-fun b_and!22939 () Bool)

(assert (=> start!73096 (= tp!49033 b_and!22939)))

(declare-fun mapNonEmpty!25568 () Bool)

(declare-fun mapRes!25568 () Bool)

(declare-fun tp!49034 () Bool)

(declare-fun e!473161 () Bool)

(assert (=> mapNonEmpty!25568 (= mapRes!25568 (and tp!49034 e!473161))))

(declare-fun mapKey!25568 () (_ BitVec 32))

(declare-datatypes ((V!26353 0))(
  ( (V!26354 (val!8037 Int)) )
))
(declare-datatypes ((ValueCell!7550 0))(
  ( (ValueCellFull!7550 (v!10462 V!26353)) (EmptyCell!7550) )
))
(declare-fun mapRest!25568 () (Array (_ BitVec 32) ValueCell!7550))

(declare-datatypes ((array!48221 0))(
  ( (array!48222 (arr!23137 (Array (_ BitVec 32) ValueCell!7550)) (size!23578 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48221)

(declare-fun mapValue!25568 () ValueCell!7550)

(assert (=> mapNonEmpty!25568 (= (arr!23137 _values!688) (store mapRest!25568 mapKey!25568 mapValue!25568))))

(declare-fun b!847696 () Bool)

(declare-fun res!575670 () Bool)

(declare-fun e!473162 () Bool)

(assert (=> b!847696 (=> (not res!575670) (not e!473162))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48223 0))(
  ( (array!48224 (arr!23138 (Array (_ BitVec 32) (_ BitVec 64))) (size!23579 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48223)

(assert (=> b!847696 (= res!575670 (and (= (size!23578 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23579 _keys!868) (size!23578 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847697 () Bool)

(declare-fun res!575673 () Bool)

(assert (=> b!847697 (=> (not res!575673) (not e!473162))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847697 (= res!575673 (validKeyInArray!0 k0!854))))

(declare-fun b!847698 () Bool)

(declare-fun res!575674 () Bool)

(assert (=> b!847698 (=> (not res!575674) (not e!473162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48223 (_ BitVec 32)) Bool)

(assert (=> b!847698 (= res!575674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847699 () Bool)

(declare-fun tp_is_empty!15979 () Bool)

(assert (=> b!847699 (= e!473161 tp_is_empty!15979)))

(declare-fun b!847700 () Bool)

(declare-fun res!575672 () Bool)

(assert (=> b!847700 (=> (not res!575672) (not e!473162))))

(declare-datatypes ((List!16294 0))(
  ( (Nil!16291) (Cons!16290 (h!17427 (_ BitVec 64)) (t!22657 List!16294)) )
))
(declare-fun arrayNoDuplicates!0 (array!48223 (_ BitVec 32) List!16294) Bool)

(assert (=> b!847700 (= res!575672 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16291))))

(declare-fun b!847701 () Bool)

(declare-fun res!575676 () Bool)

(assert (=> b!847701 (=> (not res!575676) (not e!473162))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847701 (= res!575676 (and (= (select (arr!23138 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25568 () Bool)

(assert (=> mapIsEmpty!25568 mapRes!25568))

(declare-fun b!847703 () Bool)

(declare-fun res!575671 () Bool)

(assert (=> b!847703 (=> (not res!575671) (not e!473162))))

(assert (=> b!847703 (= res!575671 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23579 _keys!868))))))

(declare-fun b!847704 () Bool)

(declare-fun e!473160 () Bool)

(assert (=> b!847704 (= e!473160 tp_is_empty!15979)))

(declare-fun b!847705 () Bool)

(declare-fun e!473164 () Bool)

(assert (=> b!847705 (= e!473164 (and e!473160 mapRes!25568))))

(declare-fun condMapEmpty!25568 () Bool)

(declare-fun mapDefault!25568 () ValueCell!7550)

(assert (=> b!847705 (= condMapEmpty!25568 (= (arr!23137 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7550)) mapDefault!25568)))))

(declare-fun b!847706 () Bool)

(declare-fun res!575675 () Bool)

(assert (=> b!847706 (=> (not res!575675) (not e!473162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847706 (= res!575675 (validMask!0 mask!1196))))

(declare-fun b!847702 () Bool)

(assert (=> b!847702 (= e!473162 false)))

(declare-datatypes ((tuple2!10422 0))(
  ( (tuple2!10423 (_1!5222 (_ BitVec 64)) (_2!5222 V!26353)) )
))
(declare-datatypes ((List!16295 0))(
  ( (Nil!16292) (Cons!16291 (h!17428 tuple2!10422) (t!22658 List!16295)) )
))
(declare-datatypes ((ListLongMap!9193 0))(
  ( (ListLongMap!9194 (toList!4612 List!16295)) )
))
(declare-fun lt!381962 () ListLongMap!9193)

(declare-fun v!557 () V!26353)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26353)

(declare-fun zeroValue!654 () V!26353)

(declare-fun getCurrentListMapNoExtraKeys!2670 (array!48223 array!48221 (_ BitVec 32) (_ BitVec 32) V!26353 V!26353 (_ BitVec 32) Int) ListLongMap!9193)

(assert (=> b!847702 (= lt!381962 (getCurrentListMapNoExtraKeys!2670 _keys!868 (array!48222 (store (arr!23137 _values!688) i!612 (ValueCellFull!7550 v!557)) (size!23578 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381961 () ListLongMap!9193)

(assert (=> b!847702 (= lt!381961 (getCurrentListMapNoExtraKeys!2670 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!575677 () Bool)

(assert (=> start!73096 (=> (not res!575677) (not e!473162))))

(assert (=> start!73096 (= res!575677 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23579 _keys!868))))))

(assert (=> start!73096 e!473162))

(assert (=> start!73096 tp_is_empty!15979))

(assert (=> start!73096 true))

(assert (=> start!73096 tp!49033))

(declare-fun array_inv!18432 (array!48223) Bool)

(assert (=> start!73096 (array_inv!18432 _keys!868)))

(declare-fun array_inv!18433 (array!48221) Bool)

(assert (=> start!73096 (and (array_inv!18433 _values!688) e!473164)))

(assert (= (and start!73096 res!575677) b!847706))

(assert (= (and b!847706 res!575675) b!847696))

(assert (= (and b!847696 res!575670) b!847698))

(assert (= (and b!847698 res!575674) b!847700))

(assert (= (and b!847700 res!575672) b!847703))

(assert (= (and b!847703 res!575671) b!847697))

(assert (= (and b!847697 res!575673) b!847701))

(assert (= (and b!847701 res!575676) b!847702))

(assert (= (and b!847705 condMapEmpty!25568) mapIsEmpty!25568))

(assert (= (and b!847705 (not condMapEmpty!25568)) mapNonEmpty!25568))

(get-info :version)

(assert (= (and mapNonEmpty!25568 ((_ is ValueCellFull!7550) mapValue!25568)) b!847699))

(assert (= (and b!847705 ((_ is ValueCellFull!7550) mapDefault!25568)) b!847704))

(assert (= start!73096 b!847705))

(declare-fun m!789365 () Bool)

(assert (=> b!847697 m!789365))

(declare-fun m!789367 () Bool)

(assert (=> b!847700 m!789367))

(declare-fun m!789369 () Bool)

(assert (=> b!847698 m!789369))

(declare-fun m!789371 () Bool)

(assert (=> b!847706 m!789371))

(declare-fun m!789373 () Bool)

(assert (=> start!73096 m!789373))

(declare-fun m!789375 () Bool)

(assert (=> start!73096 m!789375))

(declare-fun m!789377 () Bool)

(assert (=> b!847701 m!789377))

(declare-fun m!789379 () Bool)

(assert (=> b!847702 m!789379))

(declare-fun m!789381 () Bool)

(assert (=> b!847702 m!789381))

(declare-fun m!789383 () Bool)

(assert (=> b!847702 m!789383))

(declare-fun m!789385 () Bool)

(assert (=> mapNonEmpty!25568 m!789385))

(check-sat (not b!847700) (not b!847706) (not b!847698) (not b_next!13843) b_and!22939 (not start!73096) (not mapNonEmpty!25568) tp_is_empty!15979 (not b!847702) (not b!847697))
(check-sat b_and!22939 (not b_next!13843))
