; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74968 () Bool)

(assert start!74968)

(declare-fun b_free!15475 () Bool)

(declare-fun b_next!15475 () Bool)

(assert (=> start!74968 (= b_free!15475 (not b_next!15475))))

(declare-fun tp!54132 () Bool)

(declare-fun b_and!25639 () Bool)

(assert (=> start!74968 (= tp!54132 b_and!25639)))

(declare-fun b!884285 () Bool)

(declare-fun res!600757 () Bool)

(declare-fun e!492103 () Bool)

(assert (=> b!884285 (=> (not res!600757) (not e!492103))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884285 (= res!600757 (validMask!0 mask!1196))))

(declare-fun b!884286 () Bool)

(declare-fun e!492109 () Bool)

(declare-fun tp_is_empty!17719 () Bool)

(assert (=> b!884286 (= e!492109 tp_is_empty!17719)))

(declare-fun b!884287 () Bool)

(declare-fun e!492106 () Bool)

(declare-fun e!492104 () Bool)

(declare-fun mapRes!28218 () Bool)

(assert (=> b!884287 (= e!492106 (and e!492104 mapRes!28218))))

(declare-fun condMapEmpty!28218 () Bool)

(declare-datatypes ((V!28673 0))(
  ( (V!28674 (val!8907 Int)) )
))
(declare-datatypes ((ValueCell!8420 0))(
  ( (ValueCellFull!8420 (v!11374 V!28673)) (EmptyCell!8420) )
))
(declare-datatypes ((array!51547 0))(
  ( (array!51548 (arr!24792 (Array (_ BitVec 32) ValueCell!8420)) (size!25234 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51547)

(declare-fun mapDefault!28218 () ValueCell!8420)

(assert (=> b!884287 (= condMapEmpty!28218 (= (arr!24792 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8420)) mapDefault!28218)))))

(declare-fun b!884288 () Bool)

(declare-fun res!600763 () Bool)

(assert (=> b!884288 (=> (not res!600763) (not e!492103))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51549 0))(
  ( (array!51550 (arr!24793 (Array (_ BitVec 32) (_ BitVec 64))) (size!25235 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51549)

(assert (=> b!884288 (= res!600763 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25235 _keys!868))))))

(declare-fun b!884289 () Bool)

(declare-fun e!492107 () Bool)

(assert (=> b!884289 (= e!492107 (bvslt i!612 (size!25234 _values!688)))))

(declare-fun b!884290 () Bool)

(declare-fun res!600765 () Bool)

(assert (=> b!884290 (=> (not res!600765) (not e!492103))))

(declare-datatypes ((List!17624 0))(
  ( (Nil!17621) (Cons!17620 (h!18751 (_ BitVec 64)) (t!24890 List!17624)) )
))
(declare-fun arrayNoDuplicates!0 (array!51549 (_ BitVec 32) List!17624) Bool)

(assert (=> b!884290 (= res!600765 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17621))))

(declare-fun mapNonEmpty!28218 () Bool)

(declare-fun tp!54131 () Bool)

(assert (=> mapNonEmpty!28218 (= mapRes!28218 (and tp!54131 e!492109))))

(declare-fun mapRest!28218 () (Array (_ BitVec 32) ValueCell!8420))

(declare-fun mapValue!28218 () ValueCell!8420)

(declare-fun mapKey!28218 () (_ BitVec 32))

(assert (=> mapNonEmpty!28218 (= (arr!24792 _values!688) (store mapRest!28218 mapKey!28218 mapValue!28218))))

(declare-fun res!600756 () Bool)

(assert (=> start!74968 (=> (not res!600756) (not e!492103))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74968 (= res!600756 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25235 _keys!868))))))

(assert (=> start!74968 e!492103))

(assert (=> start!74968 tp_is_empty!17719))

(assert (=> start!74968 true))

(assert (=> start!74968 tp!54132))

(declare-fun array_inv!19570 (array!51549) Bool)

(assert (=> start!74968 (array_inv!19570 _keys!868)))

(declare-fun array_inv!19571 (array!51547) Bool)

(assert (=> start!74968 (and (array_inv!19571 _values!688) e!492106)))

(declare-fun b!884291 () Bool)

(declare-fun e!492105 () Bool)

(assert (=> b!884291 (= e!492103 e!492105)))

(declare-fun res!600762 () Bool)

(assert (=> b!884291 (=> (not res!600762) (not e!492105))))

(assert (=> b!884291 (= res!600762 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11828 0))(
  ( (tuple2!11829 (_1!5925 (_ BitVec 64)) (_2!5925 V!28673)) )
))
(declare-datatypes ((List!17625 0))(
  ( (Nil!17622) (Cons!17621 (h!18752 tuple2!11828) (t!24891 List!17625)) )
))
(declare-datatypes ((ListLongMap!10587 0))(
  ( (ListLongMap!10588 (toList!5309 List!17625)) )
))
(declare-fun lt!400466 () ListLongMap!10587)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!400465 () array!51547)

(declare-fun minValue!654 () V!28673)

(declare-fun zeroValue!654 () V!28673)

(declare-fun getCurrentListMapNoExtraKeys!3299 (array!51549 array!51547 (_ BitVec 32) (_ BitVec 32) V!28673 V!28673 (_ BitVec 32) Int) ListLongMap!10587)

(assert (=> b!884291 (= lt!400466 (getCurrentListMapNoExtraKeys!3299 _keys!868 lt!400465 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28673)

(assert (=> b!884291 (= lt!400465 (array!51548 (store (arr!24792 _values!688) i!612 (ValueCellFull!8420 v!557)) (size!25234 _values!688)))))

(declare-fun lt!400467 () ListLongMap!10587)

(assert (=> b!884291 (= lt!400467 (getCurrentListMapNoExtraKeys!3299 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884292 () Bool)

(assert (=> b!884292 (= e!492104 tp_is_empty!17719)))

(declare-fun b!884293 () Bool)

(declare-fun res!600760 () Bool)

(assert (=> b!884293 (=> (not res!600760) (not e!492103))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!884293 (= res!600760 (and (= (select (arr!24793 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884294 () Bool)

(declare-fun res!600761 () Bool)

(assert (=> b!884294 (=> (not res!600761) (not e!492103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884294 (= res!600761 (validKeyInArray!0 k0!854))))

(declare-fun b!884295 () Bool)

(assert (=> b!884295 (= e!492105 (not e!492107))))

(declare-fun res!600764 () Bool)

(assert (=> b!884295 (=> res!600764 e!492107)))

(assert (=> b!884295 (= res!600764 (validKeyInArray!0 (select (arr!24793 _keys!868) from!1053)))))

(declare-fun +!2600 (ListLongMap!10587 tuple2!11828) ListLongMap!10587)

(assert (=> b!884295 (= (getCurrentListMapNoExtraKeys!3299 _keys!868 lt!400465 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2600 (getCurrentListMapNoExtraKeys!3299 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11829 k0!854 v!557)))))

(declare-datatypes ((Unit!30146 0))(
  ( (Unit!30147) )
))
(declare-fun lt!400468 () Unit!30146)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!761 (array!51549 array!51547 (_ BitVec 32) (_ BitVec 32) V!28673 V!28673 (_ BitVec 32) (_ BitVec 64) V!28673 (_ BitVec 32) Int) Unit!30146)

(assert (=> b!884295 (= lt!400468 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!761 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884296 () Bool)

(declare-fun res!600758 () Bool)

(assert (=> b!884296 (=> (not res!600758) (not e!492103))))

(assert (=> b!884296 (= res!600758 (and (= (size!25234 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25235 _keys!868) (size!25234 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28218 () Bool)

(assert (=> mapIsEmpty!28218 mapRes!28218))

(declare-fun b!884297 () Bool)

(declare-fun res!600759 () Bool)

(assert (=> b!884297 (=> (not res!600759) (not e!492103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51549 (_ BitVec 32)) Bool)

(assert (=> b!884297 (= res!600759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74968 res!600756) b!884285))

(assert (= (and b!884285 res!600757) b!884296))

(assert (= (and b!884296 res!600758) b!884297))

(assert (= (and b!884297 res!600759) b!884290))

(assert (= (and b!884290 res!600765) b!884288))

(assert (= (and b!884288 res!600763) b!884294))

(assert (= (and b!884294 res!600761) b!884293))

(assert (= (and b!884293 res!600760) b!884291))

(assert (= (and b!884291 res!600762) b!884295))

(assert (= (and b!884295 (not res!600764)) b!884289))

(assert (= (and b!884287 condMapEmpty!28218) mapIsEmpty!28218))

(assert (= (and b!884287 (not condMapEmpty!28218)) mapNonEmpty!28218))

(get-info :version)

(assert (= (and mapNonEmpty!28218 ((_ is ValueCellFull!8420) mapValue!28218)) b!884286))

(assert (= (and b!884287 ((_ is ValueCellFull!8420) mapDefault!28218)) b!884292))

(assert (= start!74968 b!884287))

(declare-fun m!824021 () Bool)

(assert (=> b!884291 m!824021))

(declare-fun m!824023 () Bool)

(assert (=> b!884291 m!824023))

(declare-fun m!824025 () Bool)

(assert (=> b!884291 m!824025))

(declare-fun m!824027 () Bool)

(assert (=> b!884290 m!824027))

(declare-fun m!824029 () Bool)

(assert (=> start!74968 m!824029))

(declare-fun m!824031 () Bool)

(assert (=> start!74968 m!824031))

(declare-fun m!824033 () Bool)

(assert (=> mapNonEmpty!28218 m!824033))

(declare-fun m!824035 () Bool)

(assert (=> b!884293 m!824035))

(declare-fun m!824037 () Bool)

(assert (=> b!884285 m!824037))

(declare-fun m!824039 () Bool)

(assert (=> b!884295 m!824039))

(declare-fun m!824041 () Bool)

(assert (=> b!884295 m!824041))

(declare-fun m!824043 () Bool)

(assert (=> b!884295 m!824043))

(assert (=> b!884295 m!824039))

(declare-fun m!824045 () Bool)

(assert (=> b!884295 m!824045))

(declare-fun m!824047 () Bool)

(assert (=> b!884295 m!824047))

(assert (=> b!884295 m!824045))

(declare-fun m!824049 () Bool)

(assert (=> b!884295 m!824049))

(declare-fun m!824051 () Bool)

(assert (=> b!884294 m!824051))

(declare-fun m!824053 () Bool)

(assert (=> b!884297 m!824053))

(check-sat (not start!74968) tp_is_empty!17719 (not b_next!15475) (not b!884285) (not b!884291) (not b!884294) (not mapNonEmpty!28218) (not b!884295) b_and!25639 (not b!884290) (not b!884297))
(check-sat b_and!25639 (not b_next!15475))
