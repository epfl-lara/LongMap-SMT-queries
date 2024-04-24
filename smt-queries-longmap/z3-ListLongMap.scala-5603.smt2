; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73570 () Bool)

(assert start!73570)

(declare-fun b_free!14317 () Bool)

(declare-fun b_next!14317 () Bool)

(assert (=> start!73570 (= b_free!14317 (not b_next!14317))))

(declare-fun tp!50455 () Bool)

(declare-fun b_and!23683 () Bool)

(assert (=> start!73570 (= tp!50455 b_and!23683)))

(declare-fun b!857733 () Bool)

(declare-fun res!582333 () Bool)

(declare-fun e!478179 () Bool)

(assert (=> b!857733 (=> (not res!582333) (not e!478179))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857733 (= res!582333 (validMask!0 mask!1196))))

(declare-fun b!857734 () Bool)

(declare-fun e!478176 () Bool)

(declare-fun tp_is_empty!16453 () Bool)

(assert (=> b!857734 (= e!478176 tp_is_empty!16453)))

(declare-fun b!857735 () Bool)

(declare-fun res!582340 () Bool)

(assert (=> b!857735 (=> (not res!582340) (not e!478179))))

(declare-datatypes ((array!49143 0))(
  ( (array!49144 (arr!23598 (Array (_ BitVec 32) (_ BitVec 64))) (size!24039 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49143)

(declare-datatypes ((List!16675 0))(
  ( (Nil!16672) (Cons!16671 (h!17808 (_ BitVec 64)) (t!23308 List!16675)) )
))
(declare-fun arrayNoDuplicates!0 (array!49143 (_ BitVec 32) List!16675) Bool)

(assert (=> b!857735 (= res!582340 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16672))))

(declare-fun b!857736 () Bool)

(declare-fun res!582337 () Bool)

(assert (=> b!857736 (=> (not res!582337) (not e!478179))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857736 (= res!582337 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26279 () Bool)

(declare-fun mapRes!26279 () Bool)

(assert (=> mapIsEmpty!26279 mapRes!26279))

(declare-fun b!857737 () Bool)

(declare-fun e!478177 () Bool)

(assert (=> b!857737 (= e!478177 tp_is_empty!16453)))

(declare-fun b!857738 () Bool)

(declare-fun res!582336 () Bool)

(assert (=> b!857738 (=> (not res!582336) (not e!478179))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857738 (= res!582336 (and (= (select (arr!23598 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857739 () Bool)

(declare-fun e!478180 () Bool)

(assert (=> b!857739 (= e!478180 (not true))))

(declare-datatypes ((V!26985 0))(
  ( (V!26986 (val!8274 Int)) )
))
(declare-fun v!557 () V!26985)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7787 0))(
  ( (ValueCellFull!7787 (v!10699 V!26985)) (EmptyCell!7787) )
))
(declare-datatypes ((array!49145 0))(
  ( (array!49146 (arr!23599 (Array (_ BitVec 32) ValueCell!7787)) (size!24040 (_ BitVec 32))) )
))
(declare-fun lt!386448 () array!49145)

(declare-fun _values!688 () array!49145)

(declare-fun minValue!654 () V!26985)

(declare-fun zeroValue!654 () V!26985)

(declare-datatypes ((tuple2!10830 0))(
  ( (tuple2!10831 (_1!5426 (_ BitVec 64)) (_2!5426 V!26985)) )
))
(declare-datatypes ((List!16676 0))(
  ( (Nil!16673) (Cons!16672 (h!17809 tuple2!10830) (t!23309 List!16676)) )
))
(declare-datatypes ((ListLongMap!9601 0))(
  ( (ListLongMap!9602 (toList!4816 List!16676)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2872 (array!49143 array!49145 (_ BitVec 32) (_ BitVec 32) V!26985 V!26985 (_ BitVec 32) Int) ListLongMap!9601)

(declare-fun +!2228 (ListLongMap!9601 tuple2!10830) ListLongMap!9601)

(assert (=> b!857739 (= (getCurrentListMapNoExtraKeys!2872 _keys!868 lt!386448 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2228 (getCurrentListMapNoExtraKeys!2872 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10831 k0!854 v!557)))))

(declare-datatypes ((Unit!29212 0))(
  ( (Unit!29213) )
))
(declare-fun lt!386450 () Unit!29212)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!426 (array!49143 array!49145 (_ BitVec 32) (_ BitVec 32) V!26985 V!26985 (_ BitVec 32) (_ BitVec 64) V!26985 (_ BitVec 32) Int) Unit!29212)

(assert (=> b!857739 (= lt!386450 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!426 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857741 () Bool)

(assert (=> b!857741 (= e!478179 e!478180)))

(declare-fun res!582335 () Bool)

(assert (=> b!857741 (=> (not res!582335) (not e!478180))))

(assert (=> b!857741 (= res!582335 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386449 () ListLongMap!9601)

(assert (=> b!857741 (= lt!386449 (getCurrentListMapNoExtraKeys!2872 _keys!868 lt!386448 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857741 (= lt!386448 (array!49146 (store (arr!23599 _values!688) i!612 (ValueCellFull!7787 v!557)) (size!24040 _values!688)))))

(declare-fun lt!386447 () ListLongMap!9601)

(assert (=> b!857741 (= lt!386447 (getCurrentListMapNoExtraKeys!2872 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857742 () Bool)

(declare-fun res!582334 () Bool)

(assert (=> b!857742 (=> (not res!582334) (not e!478179))))

(assert (=> b!857742 (= res!582334 (and (= (size!24040 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24039 _keys!868) (size!24040 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857743 () Bool)

(declare-fun res!582339 () Bool)

(assert (=> b!857743 (=> (not res!582339) (not e!478179))))

(assert (=> b!857743 (= res!582339 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24039 _keys!868))))))

(declare-fun b!857744 () Bool)

(declare-fun res!582338 () Bool)

(assert (=> b!857744 (=> (not res!582338) (not e!478179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49143 (_ BitVec 32)) Bool)

(assert (=> b!857744 (= res!582338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26279 () Bool)

(declare-fun tp!50456 () Bool)

(assert (=> mapNonEmpty!26279 (= mapRes!26279 (and tp!50456 e!478176))))

(declare-fun mapValue!26279 () ValueCell!7787)

(declare-fun mapKey!26279 () (_ BitVec 32))

(declare-fun mapRest!26279 () (Array (_ BitVec 32) ValueCell!7787))

(assert (=> mapNonEmpty!26279 (= (arr!23599 _values!688) (store mapRest!26279 mapKey!26279 mapValue!26279))))

(declare-fun b!857740 () Bool)

(declare-fun e!478175 () Bool)

(assert (=> b!857740 (= e!478175 (and e!478177 mapRes!26279))))

(declare-fun condMapEmpty!26279 () Bool)

(declare-fun mapDefault!26279 () ValueCell!7787)

(assert (=> b!857740 (= condMapEmpty!26279 (= (arr!23599 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7787)) mapDefault!26279)))))

(declare-fun res!582332 () Bool)

(assert (=> start!73570 (=> (not res!582332) (not e!478179))))

(assert (=> start!73570 (= res!582332 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24039 _keys!868))))))

(assert (=> start!73570 e!478179))

(assert (=> start!73570 tp_is_empty!16453))

(assert (=> start!73570 true))

(assert (=> start!73570 tp!50455))

(declare-fun array_inv!18748 (array!49143) Bool)

(assert (=> start!73570 (array_inv!18748 _keys!868)))

(declare-fun array_inv!18749 (array!49145) Bool)

(assert (=> start!73570 (and (array_inv!18749 _values!688) e!478175)))

(assert (= (and start!73570 res!582332) b!857733))

(assert (= (and b!857733 res!582333) b!857742))

(assert (= (and b!857742 res!582334) b!857744))

(assert (= (and b!857744 res!582338) b!857735))

(assert (= (and b!857735 res!582340) b!857743))

(assert (= (and b!857743 res!582339) b!857736))

(assert (= (and b!857736 res!582337) b!857738))

(assert (= (and b!857738 res!582336) b!857741))

(assert (= (and b!857741 res!582335) b!857739))

(assert (= (and b!857740 condMapEmpty!26279) mapIsEmpty!26279))

(assert (= (and b!857740 (not condMapEmpty!26279)) mapNonEmpty!26279))

(get-info :version)

(assert (= (and mapNonEmpty!26279 ((_ is ValueCellFull!7787) mapValue!26279)) b!857734))

(assert (= (and b!857740 ((_ is ValueCellFull!7787) mapDefault!26279)) b!857737))

(assert (= start!73570 b!857740))

(declare-fun m!799001 () Bool)

(assert (=> b!857739 m!799001))

(declare-fun m!799003 () Bool)

(assert (=> b!857739 m!799003))

(assert (=> b!857739 m!799003))

(declare-fun m!799005 () Bool)

(assert (=> b!857739 m!799005))

(declare-fun m!799007 () Bool)

(assert (=> b!857739 m!799007))

(declare-fun m!799009 () Bool)

(assert (=> start!73570 m!799009))

(declare-fun m!799011 () Bool)

(assert (=> start!73570 m!799011))

(declare-fun m!799013 () Bool)

(assert (=> b!857738 m!799013))

(declare-fun m!799015 () Bool)

(assert (=> mapNonEmpty!26279 m!799015))

(declare-fun m!799017 () Bool)

(assert (=> b!857741 m!799017))

(declare-fun m!799019 () Bool)

(assert (=> b!857741 m!799019))

(declare-fun m!799021 () Bool)

(assert (=> b!857741 m!799021))

(declare-fun m!799023 () Bool)

(assert (=> b!857735 m!799023))

(declare-fun m!799025 () Bool)

(assert (=> b!857736 m!799025))

(declare-fun m!799027 () Bool)

(assert (=> b!857733 m!799027))

(declare-fun m!799029 () Bool)

(assert (=> b!857744 m!799029))

(check-sat tp_is_empty!16453 (not b!857744) (not b!857739) (not b_next!14317) (not b!857735) (not mapNonEmpty!26279) (not start!73570) (not b!857733) (not b!857741) (not b!857736) b_and!23683)
(check-sat b_and!23683 (not b_next!14317))
