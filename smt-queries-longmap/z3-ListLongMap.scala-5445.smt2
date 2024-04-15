; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72436 () Bool)

(assert start!72436)

(declare-fun b_free!13639 () Bool)

(declare-fun b_next!13639 () Bool)

(assert (=> start!72436 (= b_free!13639 (not b_next!13639))))

(declare-fun tp!48017 () Bool)

(declare-fun b_and!22699 () Bool)

(assert (=> start!72436 (= tp!48017 b_and!22699)))

(declare-datatypes ((V!25721 0))(
  ( (V!25722 (val!7800 Int)) )
))
(declare-fun v!557 () V!25721)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10350 0))(
  ( (tuple2!10351 (_1!5186 (_ BitVec 64)) (_2!5186 V!25721)) )
))
(declare-datatypes ((List!16131 0))(
  ( (Nil!16128) (Cons!16127 (h!17258 tuple2!10350) (t!22493 List!16131)) )
))
(declare-datatypes ((ListLongMap!9109 0))(
  ( (ListLongMap!9110 (toList!4570 List!16131)) )
))
(declare-fun call!37124 () ListLongMap!9109)

(declare-datatypes ((array!47265 0))(
  ( (array!47266 (arr!22664 (Array (_ BitVec 32) (_ BitVec 64))) (size!23106 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47265)

(declare-datatypes ((ValueCell!7313 0))(
  ( (ValueCellFull!7313 (v!10219 V!25721)) (EmptyCell!7313) )
))
(declare-datatypes ((array!47267 0))(
  ( (array!47268 (arr!22665 (Array (_ BitVec 32) ValueCell!7313)) (size!23107 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47267)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25721)

(declare-fun zeroValue!654 () V!25721)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37121 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2590 (array!47265 array!47267 (_ BitVec 32) (_ BitVec 32) V!25721 V!25721 (_ BitVec 32) Int) ListLongMap!9109)

(assert (=> bm!37121 (= call!37124 (getCurrentListMapNoExtraKeys!2590 _keys!868 (array!47268 (store (arr!22665 _values!688) i!612 (ValueCellFull!7313 v!557)) (size!23107 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24857 () Bool)

(declare-fun mapRes!24857 () Bool)

(assert (=> mapIsEmpty!24857 mapRes!24857))

(declare-fun b!840033 () Bool)

(declare-fun res!571151 () Bool)

(declare-fun e!468717 () Bool)

(assert (=> b!840033 (=> (not res!571151) (not e!468717))))

(declare-datatypes ((List!16132 0))(
  ( (Nil!16129) (Cons!16128 (h!17259 (_ BitVec 64)) (t!22494 List!16132)) )
))
(declare-fun arrayNoDuplicates!0 (array!47265 (_ BitVec 32) List!16132) Bool)

(assert (=> b!840033 (= res!571151 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16129))))

(declare-fun call!37125 () ListLongMap!9109)

(declare-fun b!840034 () Bool)

(declare-fun e!468720 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2060 (ListLongMap!9109 tuple2!10350) ListLongMap!9109)

(assert (=> b!840034 (= e!468720 (= call!37124 (+!2060 call!37125 (tuple2!10351 k0!854 v!557))))))

(declare-fun res!571154 () Bool)

(assert (=> start!72436 (=> (not res!571154) (not e!468717))))

(assert (=> start!72436 (= res!571154 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23106 _keys!868))))))

(assert (=> start!72436 e!468717))

(declare-fun tp_is_empty!15505 () Bool)

(assert (=> start!72436 tp_is_empty!15505))

(assert (=> start!72436 true))

(assert (=> start!72436 tp!48017))

(declare-fun array_inv!18118 (array!47265) Bool)

(assert (=> start!72436 (array_inv!18118 _keys!868)))

(declare-fun e!468718 () Bool)

(declare-fun array_inv!18119 (array!47267) Bool)

(assert (=> start!72436 (and (array_inv!18119 _values!688) e!468718)))

(declare-fun b!840035 () Bool)

(declare-fun res!571153 () Bool)

(assert (=> b!840035 (=> (not res!571153) (not e!468717))))

(assert (=> b!840035 (= res!571153 (and (= (size!23107 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23106 _keys!868) (size!23107 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840036 () Bool)

(declare-fun res!571150 () Bool)

(assert (=> b!840036 (=> (not res!571150) (not e!468717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840036 (= res!571150 (validMask!0 mask!1196))))

(declare-fun b!840037 () Bool)

(assert (=> b!840037 (= e!468720 (= call!37124 call!37125))))

(declare-fun b!840038 () Bool)

(declare-fun e!468719 () Bool)

(assert (=> b!840038 (= e!468719 tp_is_empty!15505)))

(declare-fun b!840039 () Bool)

(declare-fun e!468716 () Bool)

(assert (=> b!840039 (= e!468718 (and e!468716 mapRes!24857))))

(declare-fun condMapEmpty!24857 () Bool)

(declare-fun mapDefault!24857 () ValueCell!7313)

(assert (=> b!840039 (= condMapEmpty!24857 (= (arr!22665 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7313)) mapDefault!24857)))))

(declare-fun b!840040 () Bool)

(declare-fun res!571148 () Bool)

(assert (=> b!840040 (=> (not res!571148) (not e!468717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840040 (= res!571148 (validKeyInArray!0 k0!854))))

(declare-fun b!840041 () Bool)

(declare-fun res!571155 () Bool)

(assert (=> b!840041 (=> (not res!571155) (not e!468717))))

(assert (=> b!840041 (= res!571155 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23106 _keys!868))))))

(declare-fun b!840042 () Bool)

(declare-fun res!571149 () Bool)

(assert (=> b!840042 (=> (not res!571149) (not e!468717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47265 (_ BitVec 32)) Bool)

(assert (=> b!840042 (= res!571149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24857 () Bool)

(declare-fun tp!48016 () Bool)

(assert (=> mapNonEmpty!24857 (= mapRes!24857 (and tp!48016 e!468719))))

(declare-fun mapValue!24857 () ValueCell!7313)

(declare-fun mapKey!24857 () (_ BitVec 32))

(declare-fun mapRest!24857 () (Array (_ BitVec 32) ValueCell!7313))

(assert (=> mapNonEmpty!24857 (= (arr!22665 _values!688) (store mapRest!24857 mapKey!24857 mapValue!24857))))

(declare-fun b!840043 () Bool)

(assert (=> b!840043 (= e!468716 tp_is_empty!15505)))

(declare-fun b!840044 () Bool)

(assert (=> b!840044 (= e!468717 (not true))))

(assert (=> b!840044 e!468720))

(declare-fun c!91253 () Bool)

(assert (=> b!840044 (= c!91253 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28801 0))(
  ( (Unit!28802) )
))
(declare-fun lt!380588 () Unit!28801)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!275 (array!47265 array!47267 (_ BitVec 32) (_ BitVec 32) V!25721 V!25721 (_ BitVec 32) (_ BitVec 64) V!25721 (_ BitVec 32) Int) Unit!28801)

(assert (=> b!840044 (= lt!380588 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!275 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37122 () Bool)

(assert (=> bm!37122 (= call!37125 (getCurrentListMapNoExtraKeys!2590 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840045 () Bool)

(declare-fun res!571152 () Bool)

(assert (=> b!840045 (=> (not res!571152) (not e!468717))))

(assert (=> b!840045 (= res!571152 (and (= (select (arr!22664 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23106 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72436 res!571154) b!840036))

(assert (= (and b!840036 res!571150) b!840035))

(assert (= (and b!840035 res!571153) b!840042))

(assert (= (and b!840042 res!571149) b!840033))

(assert (= (and b!840033 res!571151) b!840041))

(assert (= (and b!840041 res!571155) b!840040))

(assert (= (and b!840040 res!571148) b!840045))

(assert (= (and b!840045 res!571152) b!840044))

(assert (= (and b!840044 c!91253) b!840034))

(assert (= (and b!840044 (not c!91253)) b!840037))

(assert (= (or b!840034 b!840037) bm!37121))

(assert (= (or b!840034 b!840037) bm!37122))

(assert (= (and b!840039 condMapEmpty!24857) mapIsEmpty!24857))

(assert (= (and b!840039 (not condMapEmpty!24857)) mapNonEmpty!24857))

(get-info :version)

(assert (= (and mapNonEmpty!24857 ((_ is ValueCellFull!7313) mapValue!24857)) b!840038))

(assert (= (and b!840039 ((_ is ValueCellFull!7313) mapDefault!24857)) b!840043))

(assert (= start!72436 b!840039))

(declare-fun m!783347 () Bool)

(assert (=> b!840040 m!783347))

(declare-fun m!783349 () Bool)

(assert (=> bm!37122 m!783349))

(declare-fun m!783351 () Bool)

(assert (=> bm!37121 m!783351))

(declare-fun m!783353 () Bool)

(assert (=> bm!37121 m!783353))

(declare-fun m!783355 () Bool)

(assert (=> start!72436 m!783355))

(declare-fun m!783357 () Bool)

(assert (=> start!72436 m!783357))

(declare-fun m!783359 () Bool)

(assert (=> b!840034 m!783359))

(declare-fun m!783361 () Bool)

(assert (=> b!840036 m!783361))

(declare-fun m!783363 () Bool)

(assert (=> b!840045 m!783363))

(declare-fun m!783365 () Bool)

(assert (=> b!840033 m!783365))

(declare-fun m!783367 () Bool)

(assert (=> b!840042 m!783367))

(declare-fun m!783369 () Bool)

(assert (=> b!840044 m!783369))

(declare-fun m!783371 () Bool)

(assert (=> mapNonEmpty!24857 m!783371))

(check-sat (not b!840042) (not b!840036) (not mapNonEmpty!24857) tp_is_empty!15505 (not bm!37122) (not b!840040) (not b!840033) (not b_next!13639) (not b!840034) (not b!840044) (not bm!37121) b_and!22699 (not start!72436))
(check-sat b_and!22699 (not b_next!13639))
