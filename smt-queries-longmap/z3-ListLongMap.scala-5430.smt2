; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72346 () Bool)

(assert start!72346)

(declare-fun b_free!13549 () Bool)

(declare-fun b_next!13549 () Bool)

(assert (=> start!72346 (= b_free!13549 (not b_next!13549))))

(declare-fun tp!47747 () Bool)

(declare-fun b_and!22609 () Bool)

(assert (=> start!72346 (= tp!47747 b_and!22609)))

(declare-fun b!838278 () Bool)

(declare-fun e!467907 () Bool)

(declare-fun e!467905 () Bool)

(declare-fun mapRes!24722 () Bool)

(assert (=> b!838278 (= e!467907 (and e!467905 mapRes!24722))))

(declare-fun condMapEmpty!24722 () Bool)

(declare-datatypes ((V!25601 0))(
  ( (V!25602 (val!7755 Int)) )
))
(declare-datatypes ((ValueCell!7268 0))(
  ( (ValueCellFull!7268 (v!10174 V!25601)) (EmptyCell!7268) )
))
(declare-datatypes ((array!47091 0))(
  ( (array!47092 (arr!22577 (Array (_ BitVec 32) ValueCell!7268)) (size!23019 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47091)

(declare-fun mapDefault!24722 () ValueCell!7268)

(assert (=> b!838278 (= condMapEmpty!24722 (= (arr!22577 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7268)) mapDefault!24722)))))

(declare-fun b!838279 () Bool)

(declare-fun res!570070 () Bool)

(declare-fun e!467906 () Bool)

(assert (=> b!838279 (=> (not res!570070) (not e!467906))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47093 0))(
  ( (array!47094 (arr!22578 (Array (_ BitVec 32) (_ BitVec 64))) (size!23020 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47093)

(assert (=> b!838279 (= res!570070 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23020 _keys!868))))))

(declare-fun bm!36851 () Bool)

(declare-fun v!557 () V!25601)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10268 0))(
  ( (tuple2!10269 (_1!5145 (_ BitVec 64)) (_2!5145 V!25601)) )
))
(declare-datatypes ((List!16063 0))(
  ( (Nil!16060) (Cons!16059 (h!17190 tuple2!10268) (t!22425 List!16063)) )
))
(declare-datatypes ((ListLongMap!9027 0))(
  ( (ListLongMap!9028 (toList!4529 List!16063)) )
))
(declare-fun call!36855 () ListLongMap!9027)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25601)

(declare-fun zeroValue!654 () V!25601)

(declare-fun getCurrentListMapNoExtraKeys!2549 (array!47093 array!47091 (_ BitVec 32) (_ BitVec 32) V!25601 V!25601 (_ BitVec 32) Int) ListLongMap!9027)

(assert (=> bm!36851 (= call!36855 (getCurrentListMapNoExtraKeys!2549 _keys!868 (array!47092 (store (arr!22577 _values!688) i!612 (ValueCellFull!7268 v!557)) (size!23019 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838281 () Bool)

(declare-fun res!570071 () Bool)

(assert (=> b!838281 (=> (not res!570071) (not e!467906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838281 (= res!570071 (validMask!0 mask!1196))))

(declare-fun b!838282 () Bool)

(assert (=> b!838282 (= e!467906 (not true))))

(declare-fun e!467910 () Bool)

(assert (=> b!838282 e!467910))

(declare-fun c!91118 () Bool)

(assert (=> b!838282 (= c!91118 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28741 0))(
  ( (Unit!28742) )
))
(declare-fun lt!380453 () Unit!28741)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!245 (array!47093 array!47091 (_ BitVec 32) (_ BitVec 32) V!25601 V!25601 (_ BitVec 32) (_ BitVec 64) V!25601 (_ BitVec 32) Int) Unit!28741)

(assert (=> b!838282 (= lt!380453 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!245 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!36854 () ListLongMap!9027)

(declare-fun bm!36852 () Bool)

(assert (=> bm!36852 (= call!36854 (getCurrentListMapNoExtraKeys!2549 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838283 () Bool)

(declare-fun +!2030 (ListLongMap!9027 tuple2!10268) ListLongMap!9027)

(assert (=> b!838283 (= e!467910 (= call!36855 (+!2030 call!36854 (tuple2!10269 k0!854 v!557))))))

(declare-fun b!838284 () Bool)

(declare-fun res!570069 () Bool)

(assert (=> b!838284 (=> (not res!570069) (not e!467906))))

(assert (=> b!838284 (= res!570069 (and (= (select (arr!22578 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23020 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838285 () Bool)

(declare-fun res!570068 () Bool)

(assert (=> b!838285 (=> (not res!570068) (not e!467906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47093 (_ BitVec 32)) Bool)

(assert (=> b!838285 (= res!570068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838286 () Bool)

(declare-fun tp_is_empty!15415 () Bool)

(assert (=> b!838286 (= e!467905 tp_is_empty!15415)))

(declare-fun b!838287 () Bool)

(assert (=> b!838287 (= e!467910 (= call!36855 call!36854))))

(declare-fun b!838288 () Bool)

(declare-fun res!570074 () Bool)

(assert (=> b!838288 (=> (not res!570074) (not e!467906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838288 (= res!570074 (validKeyInArray!0 k0!854))))

(declare-fun b!838289 () Bool)

(declare-fun e!467908 () Bool)

(assert (=> b!838289 (= e!467908 tp_is_empty!15415)))

(declare-fun b!838290 () Bool)

(declare-fun res!570073 () Bool)

(assert (=> b!838290 (=> (not res!570073) (not e!467906))))

(assert (=> b!838290 (= res!570073 (and (= (size!23019 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23020 _keys!868) (size!23019 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838280 () Bool)

(declare-fun res!570075 () Bool)

(assert (=> b!838280 (=> (not res!570075) (not e!467906))))

(declare-datatypes ((List!16064 0))(
  ( (Nil!16061) (Cons!16060 (h!17191 (_ BitVec 64)) (t!22426 List!16064)) )
))
(declare-fun arrayNoDuplicates!0 (array!47093 (_ BitVec 32) List!16064) Bool)

(assert (=> b!838280 (= res!570075 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16061))))

(declare-fun res!570072 () Bool)

(assert (=> start!72346 (=> (not res!570072) (not e!467906))))

(assert (=> start!72346 (= res!570072 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23020 _keys!868))))))

(assert (=> start!72346 e!467906))

(assert (=> start!72346 tp_is_empty!15415))

(assert (=> start!72346 true))

(assert (=> start!72346 tp!47747))

(declare-fun array_inv!18054 (array!47093) Bool)

(assert (=> start!72346 (array_inv!18054 _keys!868)))

(declare-fun array_inv!18055 (array!47091) Bool)

(assert (=> start!72346 (and (array_inv!18055 _values!688) e!467907)))

(declare-fun mapNonEmpty!24722 () Bool)

(declare-fun tp!47746 () Bool)

(assert (=> mapNonEmpty!24722 (= mapRes!24722 (and tp!47746 e!467908))))

(declare-fun mapValue!24722 () ValueCell!7268)

(declare-fun mapKey!24722 () (_ BitVec 32))

(declare-fun mapRest!24722 () (Array (_ BitVec 32) ValueCell!7268))

(assert (=> mapNonEmpty!24722 (= (arr!22577 _values!688) (store mapRest!24722 mapKey!24722 mapValue!24722))))

(declare-fun mapIsEmpty!24722 () Bool)

(assert (=> mapIsEmpty!24722 mapRes!24722))

(assert (= (and start!72346 res!570072) b!838281))

(assert (= (and b!838281 res!570071) b!838290))

(assert (= (and b!838290 res!570073) b!838285))

(assert (= (and b!838285 res!570068) b!838280))

(assert (= (and b!838280 res!570075) b!838279))

(assert (= (and b!838279 res!570070) b!838288))

(assert (= (and b!838288 res!570074) b!838284))

(assert (= (and b!838284 res!570069) b!838282))

(assert (= (and b!838282 c!91118) b!838283))

(assert (= (and b!838282 (not c!91118)) b!838287))

(assert (= (or b!838283 b!838287) bm!36851))

(assert (= (or b!838283 b!838287) bm!36852))

(assert (= (and b!838278 condMapEmpty!24722) mapIsEmpty!24722))

(assert (= (and b!838278 (not condMapEmpty!24722)) mapNonEmpty!24722))

(get-info :version)

(assert (= (and mapNonEmpty!24722 ((_ is ValueCellFull!7268) mapValue!24722)) b!838289))

(assert (= (and b!838278 ((_ is ValueCellFull!7268) mapDefault!24722)) b!838286))

(assert (= start!72346 b!838278))

(declare-fun m!782177 () Bool)

(assert (=> bm!36851 m!782177))

(declare-fun m!782179 () Bool)

(assert (=> bm!36851 m!782179))

(declare-fun m!782181 () Bool)

(assert (=> b!838282 m!782181))

(declare-fun m!782183 () Bool)

(assert (=> start!72346 m!782183))

(declare-fun m!782185 () Bool)

(assert (=> start!72346 m!782185))

(declare-fun m!782187 () Bool)

(assert (=> mapNonEmpty!24722 m!782187))

(declare-fun m!782189 () Bool)

(assert (=> b!838285 m!782189))

(declare-fun m!782191 () Bool)

(assert (=> bm!36852 m!782191))

(declare-fun m!782193 () Bool)

(assert (=> b!838284 m!782193))

(declare-fun m!782195 () Bool)

(assert (=> b!838283 m!782195))

(declare-fun m!782197 () Bool)

(assert (=> b!838281 m!782197))

(declare-fun m!782199 () Bool)

(assert (=> b!838280 m!782199))

(declare-fun m!782201 () Bool)

(assert (=> b!838288 m!782201))

(check-sat (not bm!36852) (not b!838285) tp_is_empty!15415 (not b!838283) (not b!838282) (not b!838281) b_and!22609 (not mapNonEmpty!24722) (not b!838280) (not b!838288) (not bm!36851) (not b_next!13549) (not start!72346))
(check-sat b_and!22609 (not b_next!13549))
