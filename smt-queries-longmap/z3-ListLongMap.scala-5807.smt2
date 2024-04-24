; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75082 () Bool)

(assert start!75082)

(declare-fun b_free!15433 () Bool)

(declare-fun b_next!15433 () Bool)

(assert (=> start!75082 (= b_free!15433 (not b_next!15433))))

(declare-fun tp!54003 () Bool)

(declare-fun b_and!25575 () Bool)

(assert (=> start!75082 (= tp!54003 b_and!25575)))

(declare-fun b!884270 () Bool)

(declare-fun res!600492 () Bool)

(declare-fun e!492214 () Bool)

(assert (=> b!884270 (=> (not res!600492) (not e!492214))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51521 0))(
  ( (array!51522 (arr!24775 (Array (_ BitVec 32) (_ BitVec 64))) (size!25216 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51521)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884270 (= res!600492 (and (= (select (arr!24775 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884271 () Bool)

(declare-fun res!600495 () Bool)

(assert (=> b!884271 (=> (not res!600495) (not e!492214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884271 (= res!600495 (validKeyInArray!0 k0!854))))

(declare-fun b!884272 () Bool)

(declare-fun res!600493 () Bool)

(assert (=> b!884272 (=> (not res!600493) (not e!492214))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884272 (= res!600493 (validMask!0 mask!1196))))

(declare-fun b!884273 () Bool)

(declare-fun e!492209 () Bool)

(declare-fun tp_is_empty!17677 () Bool)

(assert (=> b!884273 (= e!492209 tp_is_empty!17677)))

(declare-fun b!884275 () Bool)

(declare-fun res!600490 () Bool)

(assert (=> b!884275 (=> (not res!600490) (not e!492214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51521 (_ BitVec 32)) Bool)

(assert (=> b!884275 (= res!600490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884276 () Bool)

(declare-fun res!600494 () Bool)

(assert (=> b!884276 (=> (not res!600494) (not e!492214))))

(assert (=> b!884276 (= res!600494 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25216 _keys!868))))))

(declare-fun b!884277 () Bool)

(declare-datatypes ((Unit!30117 0))(
  ( (Unit!30118) )
))
(declare-fun e!492216 () Unit!30117)

(declare-fun Unit!30119 () Unit!30117)

(assert (=> b!884277 (= e!492216 Unit!30119)))

(declare-fun b!884278 () Bool)

(declare-fun res!600496 () Bool)

(assert (=> b!884278 (=> (not res!600496) (not e!492214))))

(declare-datatypes ((V!28617 0))(
  ( (V!28618 (val!8886 Int)) )
))
(declare-datatypes ((ValueCell!8399 0))(
  ( (ValueCellFull!8399 (v!11355 V!28617)) (EmptyCell!8399) )
))
(declare-datatypes ((array!51523 0))(
  ( (array!51524 (arr!24776 (Array (_ BitVec 32) ValueCell!8399)) (size!25217 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51523)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!884278 (= res!600496 (and (= (size!25217 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25216 _keys!868) (size!25217 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun e!492213 () Bool)

(declare-fun b!884279 () Bool)

(assert (=> b!884279 (= e!492213 (not (= (select (arr!24775 _keys!868) from!1053) k0!854)))))

(declare-fun lt!400164 () Unit!30117)

(assert (=> b!884279 (= lt!400164 e!492216)))

(declare-fun c!93337 () Bool)

(assert (=> b!884279 (= c!93337 (= (select (arr!24775 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11712 0))(
  ( (tuple2!11713 (_1!5867 (_ BitVec 64)) (_2!5867 V!28617)) )
))
(declare-datatypes ((List!17543 0))(
  ( (Nil!17540) (Cons!17539 (h!18676 tuple2!11712) (t!24770 List!17543)) )
))
(declare-datatypes ((ListLongMap!10483 0))(
  ( (ListLongMap!10484 (toList!5257 List!17543)) )
))
(declare-fun lt!400163 () ListLongMap!10483)

(declare-fun lt!400154 () ListLongMap!10483)

(declare-fun +!2569 (ListLongMap!10483 tuple2!11712) ListLongMap!10483)

(declare-fun get!13069 (ValueCell!8399 V!28617) V!28617)

(declare-fun dynLambda!1286 (Int (_ BitVec 64)) V!28617)

(assert (=> b!884279 (= lt!400154 (+!2569 lt!400163 (tuple2!11713 (select (arr!24775 _keys!868) from!1053) (get!13069 (select (arr!24776 _values!688) from!1053) (dynLambda!1286 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884280 () Bool)

(declare-fun Unit!30120 () Unit!30117)

(assert (=> b!884280 (= e!492216 Unit!30120)))

(declare-fun lt!400157 () Unit!30117)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51521 (_ BitVec 32) (_ BitVec 32)) Unit!30117)

(assert (=> b!884280 (= lt!400157 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17544 0))(
  ( (Nil!17541) (Cons!17540 (h!18677 (_ BitVec 64)) (t!24771 List!17544)) )
))
(declare-fun arrayNoDuplicates!0 (array!51521 (_ BitVec 32) List!17544) Bool)

(assert (=> b!884280 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17541)))

(declare-fun lt!400160 () Unit!30117)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30117)

(assert (=> b!884280 (= lt!400160 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884280 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400161 () Unit!30117)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51521 (_ BitVec 64) (_ BitVec 32) List!17544) Unit!30117)

(assert (=> b!884280 (= lt!400161 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17541))))

(assert (=> b!884280 false))

(declare-fun b!884281 () Bool)

(declare-fun e!492211 () Bool)

(declare-fun e!492210 () Bool)

(declare-fun mapRes!28152 () Bool)

(assert (=> b!884281 (= e!492211 (and e!492210 mapRes!28152))))

(declare-fun condMapEmpty!28152 () Bool)

(declare-fun mapDefault!28152 () ValueCell!8399)

(assert (=> b!884281 (= condMapEmpty!28152 (= (arr!24776 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8399)) mapDefault!28152)))))

(declare-fun b!884282 () Bool)

(assert (=> b!884282 (= e!492210 tp_is_empty!17677)))

(declare-fun b!884274 () Bool)

(declare-fun res!600489 () Bool)

(assert (=> b!884274 (=> (not res!600489) (not e!492214))))

(assert (=> b!884274 (= res!600489 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17541))))

(declare-fun res!600488 () Bool)

(assert (=> start!75082 (=> (not res!600488) (not e!492214))))

(assert (=> start!75082 (= res!600488 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25216 _keys!868))))))

(assert (=> start!75082 e!492214))

(assert (=> start!75082 tp_is_empty!17677))

(assert (=> start!75082 true))

(assert (=> start!75082 tp!54003))

(declare-fun array_inv!19550 (array!51521) Bool)

(assert (=> start!75082 (array_inv!19550 _keys!868)))

(declare-fun array_inv!19551 (array!51523) Bool)

(assert (=> start!75082 (and (array_inv!19551 _values!688) e!492211)))

(declare-fun b!884283 () Bool)

(declare-fun e!492212 () Bool)

(assert (=> b!884283 (= e!492212 (not e!492213))))

(declare-fun res!600491 () Bool)

(assert (=> b!884283 (=> res!600491 e!492213)))

(assert (=> b!884283 (= res!600491 (not (validKeyInArray!0 (select (arr!24775 _keys!868) from!1053))))))

(declare-fun lt!400155 () ListLongMap!10483)

(assert (=> b!884283 (= lt!400155 lt!400163)))

(declare-fun v!557 () V!28617)

(declare-fun lt!400159 () ListLongMap!10483)

(assert (=> b!884283 (= lt!400163 (+!2569 lt!400159 (tuple2!11713 k0!854 v!557)))))

(declare-fun lt!400158 () array!51523)

(declare-fun minValue!654 () V!28617)

(declare-fun zeroValue!654 () V!28617)

(declare-fun getCurrentListMapNoExtraKeys!3296 (array!51521 array!51523 (_ BitVec 32) (_ BitVec 32) V!28617 V!28617 (_ BitVec 32) Int) ListLongMap!10483)

(assert (=> b!884283 (= lt!400155 (getCurrentListMapNoExtraKeys!3296 _keys!868 lt!400158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884283 (= lt!400159 (getCurrentListMapNoExtraKeys!3296 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400156 () Unit!30117)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!733 (array!51521 array!51523 (_ BitVec 32) (_ BitVec 32) V!28617 V!28617 (_ BitVec 32) (_ BitVec 64) V!28617 (_ BitVec 32) Int) Unit!30117)

(assert (=> b!884283 (= lt!400156 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!733 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!28152 () Bool)

(declare-fun tp!54002 () Bool)

(assert (=> mapNonEmpty!28152 (= mapRes!28152 (and tp!54002 e!492209))))

(declare-fun mapValue!28152 () ValueCell!8399)

(declare-fun mapKey!28152 () (_ BitVec 32))

(declare-fun mapRest!28152 () (Array (_ BitVec 32) ValueCell!8399))

(assert (=> mapNonEmpty!28152 (= (arr!24776 _values!688) (store mapRest!28152 mapKey!28152 mapValue!28152))))

(declare-fun mapIsEmpty!28152 () Bool)

(assert (=> mapIsEmpty!28152 mapRes!28152))

(declare-fun b!884284 () Bool)

(assert (=> b!884284 (= e!492214 e!492212)))

(declare-fun res!600497 () Bool)

(assert (=> b!884284 (=> (not res!600497) (not e!492212))))

(assert (=> b!884284 (= res!600497 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884284 (= lt!400154 (getCurrentListMapNoExtraKeys!3296 _keys!868 lt!400158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884284 (= lt!400158 (array!51524 (store (arr!24776 _values!688) i!612 (ValueCellFull!8399 v!557)) (size!25217 _values!688)))))

(declare-fun lt!400162 () ListLongMap!10483)

(assert (=> b!884284 (= lt!400162 (getCurrentListMapNoExtraKeys!3296 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!75082 res!600488) b!884272))

(assert (= (and b!884272 res!600493) b!884278))

(assert (= (and b!884278 res!600496) b!884275))

(assert (= (and b!884275 res!600490) b!884274))

(assert (= (and b!884274 res!600489) b!884276))

(assert (= (and b!884276 res!600494) b!884271))

(assert (= (and b!884271 res!600495) b!884270))

(assert (= (and b!884270 res!600492) b!884284))

(assert (= (and b!884284 res!600497) b!884283))

(assert (= (and b!884283 (not res!600491)) b!884279))

(assert (= (and b!884279 c!93337) b!884280))

(assert (= (and b!884279 (not c!93337)) b!884277))

(assert (= (and b!884281 condMapEmpty!28152) mapIsEmpty!28152))

(assert (= (and b!884281 (not condMapEmpty!28152)) mapNonEmpty!28152))

(get-info :version)

(assert (= (and mapNonEmpty!28152 ((_ is ValueCellFull!8399) mapValue!28152)) b!884273))

(assert (= (and b!884281 ((_ is ValueCellFull!8399) mapDefault!28152)) b!884282))

(assert (= start!75082 b!884281))

(declare-fun b_lambda!12725 () Bool)

(assert (=> (not b_lambda!12725) (not b!884279)))

(declare-fun t!24769 () Bool)

(declare-fun tb!5083 () Bool)

(assert (=> (and start!75082 (= defaultEntry!696 defaultEntry!696) t!24769) tb!5083))

(declare-fun result!9809 () Bool)

(assert (=> tb!5083 (= result!9809 tp_is_empty!17677)))

(assert (=> b!884279 t!24769))

(declare-fun b_and!25577 () Bool)

(assert (= b_and!25575 (and (=> t!24769 result!9809) b_and!25577)))

(declare-fun m!824715 () Bool)

(assert (=> start!75082 m!824715))

(declare-fun m!824717 () Bool)

(assert (=> start!75082 m!824717))

(declare-fun m!824719 () Bool)

(assert (=> b!884274 m!824719))

(declare-fun m!824721 () Bool)

(assert (=> b!884280 m!824721))

(declare-fun m!824723 () Bool)

(assert (=> b!884280 m!824723))

(declare-fun m!824725 () Bool)

(assert (=> b!884280 m!824725))

(declare-fun m!824727 () Bool)

(assert (=> b!884280 m!824727))

(declare-fun m!824729 () Bool)

(assert (=> b!884280 m!824729))

(declare-fun m!824731 () Bool)

(assert (=> b!884270 m!824731))

(declare-fun m!824733 () Bool)

(assert (=> b!884275 m!824733))

(declare-fun m!824735 () Bool)

(assert (=> b!884279 m!824735))

(declare-fun m!824737 () Bool)

(assert (=> b!884279 m!824737))

(declare-fun m!824739 () Bool)

(assert (=> b!884279 m!824739))

(declare-fun m!824741 () Bool)

(assert (=> b!884279 m!824741))

(assert (=> b!884279 m!824737))

(declare-fun m!824743 () Bool)

(assert (=> b!884279 m!824743))

(assert (=> b!884279 m!824739))

(declare-fun m!824745 () Bool)

(assert (=> b!884283 m!824745))

(declare-fun m!824747 () Bool)

(assert (=> b!884283 m!824747))

(assert (=> b!884283 m!824743))

(declare-fun m!824749 () Bool)

(assert (=> b!884283 m!824749))

(assert (=> b!884283 m!824743))

(declare-fun m!824751 () Bool)

(assert (=> b!884283 m!824751))

(declare-fun m!824753 () Bool)

(assert (=> b!884283 m!824753))

(declare-fun m!824755 () Bool)

(assert (=> b!884271 m!824755))

(declare-fun m!824757 () Bool)

(assert (=> mapNonEmpty!28152 m!824757))

(declare-fun m!824759 () Bool)

(assert (=> b!884284 m!824759))

(declare-fun m!824761 () Bool)

(assert (=> b!884284 m!824761))

(declare-fun m!824763 () Bool)

(assert (=> b!884284 m!824763))

(declare-fun m!824765 () Bool)

(assert (=> b!884272 m!824765))

(check-sat tp_is_empty!17677 (not b!884279) (not b!884280) (not start!75082) (not b_lambda!12725) b_and!25577 (not b!884274) (not b!884275) (not b!884272) (not b!884271) (not mapNonEmpty!28152) (not b!884284) (not b!884283) (not b_next!15433))
(check-sat b_and!25577 (not b_next!15433))
