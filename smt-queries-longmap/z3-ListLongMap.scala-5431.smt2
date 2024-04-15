; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72352 () Bool)

(assert start!72352)

(declare-fun b_free!13555 () Bool)

(declare-fun b_next!13555 () Bool)

(assert (=> start!72352 (= b_free!13555 (not b_next!13555))))

(declare-fun tp!47764 () Bool)

(declare-fun b_and!22615 () Bool)

(assert (=> start!72352 (= tp!47764 b_and!22615)))

(declare-fun b!838395 () Bool)

(declare-fun res!570147 () Bool)

(declare-fun e!467964 () Bool)

(assert (=> b!838395 (=> (not res!570147) (not e!467964))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47103 0))(
  ( (array!47104 (arr!22583 (Array (_ BitVec 32) (_ BitVec 64))) (size!23025 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47103)

(declare-datatypes ((V!25609 0))(
  ( (V!25610 (val!7758 Int)) )
))
(declare-datatypes ((ValueCell!7271 0))(
  ( (ValueCellFull!7271 (v!10177 V!25609)) (EmptyCell!7271) )
))
(declare-datatypes ((array!47105 0))(
  ( (array!47106 (arr!22584 (Array (_ BitVec 32) ValueCell!7271)) (size!23026 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47105)

(assert (=> b!838395 (= res!570147 (and (= (size!23026 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23025 _keys!868) (size!23026 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838396 () Bool)

(declare-fun res!570144 () Bool)

(assert (=> b!838396 (=> (not res!570144) (not e!467964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47103 (_ BitVec 32)) Bool)

(assert (=> b!838396 (= res!570144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!36869 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!10274 0))(
  ( (tuple2!10275 (_1!5148 (_ BitVec 64)) (_2!5148 V!25609)) )
))
(declare-datatypes ((List!16069 0))(
  ( (Nil!16066) (Cons!16065 (h!17196 tuple2!10274) (t!22431 List!16069)) )
))
(declare-datatypes ((ListLongMap!9033 0))(
  ( (ListLongMap!9034 (toList!4532 List!16069)) )
))
(declare-fun call!36872 () ListLongMap!9033)

(declare-fun minValue!654 () V!25609)

(declare-fun zeroValue!654 () V!25609)

(declare-fun getCurrentListMapNoExtraKeys!2552 (array!47103 array!47105 (_ BitVec 32) (_ BitVec 32) V!25609 V!25609 (_ BitVec 32) Int) ListLongMap!9033)

(assert (=> bm!36869 (= call!36872 (getCurrentListMapNoExtraKeys!2552 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838397 () Bool)

(declare-fun e!467962 () Bool)

(declare-fun tp_is_empty!15421 () Bool)

(assert (=> b!838397 (= e!467962 tp_is_empty!15421)))

(declare-fun call!36873 () ListLongMap!9033)

(declare-fun v!557 () V!25609)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun bm!36870 () Bool)

(assert (=> bm!36870 (= call!36873 (getCurrentListMapNoExtraKeys!2552 _keys!868 (array!47106 (store (arr!22584 _values!688) i!612 (ValueCellFull!7271 v!557)) (size!23026 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838399 () Bool)

(declare-fun res!570143 () Bool)

(assert (=> b!838399 (=> (not res!570143) (not e!467964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838399 (= res!570143 (validMask!0 mask!1196))))

(declare-fun b!838400 () Bool)

(declare-fun res!570141 () Bool)

(assert (=> b!838400 (=> (not res!570141) (not e!467964))))

(assert (=> b!838400 (= res!570141 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23025 _keys!868))))))

(declare-fun b!838401 () Bool)

(declare-fun res!570145 () Bool)

(assert (=> b!838401 (=> (not res!570145) (not e!467964))))

(declare-datatypes ((List!16070 0))(
  ( (Nil!16067) (Cons!16066 (h!17197 (_ BitVec 64)) (t!22432 List!16070)) )
))
(declare-fun arrayNoDuplicates!0 (array!47103 (_ BitVec 32) List!16070) Bool)

(assert (=> b!838401 (= res!570145 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16067))))

(declare-fun b!838402 () Bool)

(declare-fun res!570142 () Bool)

(assert (=> b!838402 (=> (not res!570142) (not e!467964))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!838402 (= res!570142 (and (= (select (arr!22583 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23025 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838403 () Bool)

(declare-fun e!467960 () Bool)

(declare-fun mapRes!24731 () Bool)

(assert (=> b!838403 (= e!467960 (and e!467962 mapRes!24731))))

(declare-fun condMapEmpty!24731 () Bool)

(declare-fun mapDefault!24731 () ValueCell!7271)

(assert (=> b!838403 (= condMapEmpty!24731 (= (arr!22584 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7271)) mapDefault!24731)))))

(declare-fun mapIsEmpty!24731 () Bool)

(assert (=> mapIsEmpty!24731 mapRes!24731))

(declare-fun mapNonEmpty!24731 () Bool)

(declare-fun tp!47765 () Bool)

(declare-fun e!467963 () Bool)

(assert (=> mapNonEmpty!24731 (= mapRes!24731 (and tp!47765 e!467963))))

(declare-fun mapRest!24731 () (Array (_ BitVec 32) ValueCell!7271))

(declare-fun mapKey!24731 () (_ BitVec 32))

(declare-fun mapValue!24731 () ValueCell!7271)

(assert (=> mapNonEmpty!24731 (= (arr!22584 _values!688) (store mapRest!24731 mapKey!24731 mapValue!24731))))

(declare-fun b!838404 () Bool)

(assert (=> b!838404 (= e!467963 tp_is_empty!15421)))

(declare-fun e!467959 () Bool)

(declare-fun b!838405 () Bool)

(declare-fun +!2033 (ListLongMap!9033 tuple2!10274) ListLongMap!9033)

(assert (=> b!838405 (= e!467959 (= call!36873 (+!2033 call!36872 (tuple2!10275 k0!854 v!557))))))

(declare-fun b!838406 () Bool)

(declare-fun res!570140 () Bool)

(assert (=> b!838406 (=> (not res!570140) (not e!467964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838406 (= res!570140 (validKeyInArray!0 k0!854))))

(declare-fun b!838407 () Bool)

(assert (=> b!838407 (= e!467959 (= call!36873 call!36872))))

(declare-fun res!570146 () Bool)

(assert (=> start!72352 (=> (not res!570146) (not e!467964))))

(assert (=> start!72352 (= res!570146 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23025 _keys!868))))))

(assert (=> start!72352 e!467964))

(assert (=> start!72352 tp_is_empty!15421))

(assert (=> start!72352 true))

(assert (=> start!72352 tp!47764))

(declare-fun array_inv!18058 (array!47103) Bool)

(assert (=> start!72352 (array_inv!18058 _keys!868)))

(declare-fun array_inv!18059 (array!47105) Bool)

(assert (=> start!72352 (and (array_inv!18059 _values!688) e!467960)))

(declare-fun b!838398 () Bool)

(assert (=> b!838398 (= e!467964 (not true))))

(assert (=> b!838398 e!467959))

(declare-fun c!91127 () Bool)

(assert (=> b!838398 (= c!91127 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28745 0))(
  ( (Unit!28746) )
))
(declare-fun lt!380462 () Unit!28745)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!247 (array!47103 array!47105 (_ BitVec 32) (_ BitVec 32) V!25609 V!25609 (_ BitVec 32) (_ BitVec 64) V!25609 (_ BitVec 32) Int) Unit!28745)

(assert (=> b!838398 (= lt!380462 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!247 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72352 res!570146) b!838399))

(assert (= (and b!838399 res!570143) b!838395))

(assert (= (and b!838395 res!570147) b!838396))

(assert (= (and b!838396 res!570144) b!838401))

(assert (= (and b!838401 res!570145) b!838400))

(assert (= (and b!838400 res!570141) b!838406))

(assert (= (and b!838406 res!570140) b!838402))

(assert (= (and b!838402 res!570142) b!838398))

(assert (= (and b!838398 c!91127) b!838405))

(assert (= (and b!838398 (not c!91127)) b!838407))

(assert (= (or b!838405 b!838407) bm!36870))

(assert (= (or b!838405 b!838407) bm!36869))

(assert (= (and b!838403 condMapEmpty!24731) mapIsEmpty!24731))

(assert (= (and b!838403 (not condMapEmpty!24731)) mapNonEmpty!24731))

(get-info :version)

(assert (= (and mapNonEmpty!24731 ((_ is ValueCellFull!7271) mapValue!24731)) b!838404))

(assert (= (and b!838403 ((_ is ValueCellFull!7271) mapDefault!24731)) b!838397))

(assert (= start!72352 b!838403))

(declare-fun m!782255 () Bool)

(assert (=> b!838401 m!782255))

(declare-fun m!782257 () Bool)

(assert (=> b!838396 m!782257))

(declare-fun m!782259 () Bool)

(assert (=> b!838406 m!782259))

(declare-fun m!782261 () Bool)

(assert (=> b!838398 m!782261))

(declare-fun m!782263 () Bool)

(assert (=> start!72352 m!782263))

(declare-fun m!782265 () Bool)

(assert (=> start!72352 m!782265))

(declare-fun m!782267 () Bool)

(assert (=> b!838402 m!782267))

(declare-fun m!782269 () Bool)

(assert (=> bm!36869 m!782269))

(declare-fun m!782271 () Bool)

(assert (=> mapNonEmpty!24731 m!782271))

(declare-fun m!782273 () Bool)

(assert (=> b!838405 m!782273))

(declare-fun m!782275 () Bool)

(assert (=> bm!36870 m!782275))

(declare-fun m!782277 () Bool)

(assert (=> bm!36870 m!782277))

(declare-fun m!782279 () Bool)

(assert (=> b!838399 m!782279))

(check-sat (not b!838401) tp_is_empty!15421 (not b!838399) (not b_next!13555) (not bm!36869) (not b!838406) (not start!72352) (not mapNonEmpty!24731) (not b!838405) (not b!838396) b_and!22615 (not bm!36870) (not b!838398))
(check-sat b_and!22615 (not b_next!13555))
