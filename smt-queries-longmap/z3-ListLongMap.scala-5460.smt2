; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72546 () Bool)

(assert start!72546)

(declare-fun b_free!13731 () Bool)

(declare-fun b_next!13731 () Bool)

(assert (=> start!72546 (= b_free!13731 (not b_next!13731))))

(declare-fun tp!48292 () Bool)

(declare-fun b_and!22817 () Bool)

(assert (=> start!72546 (= tp!48292 b_and!22817)))

(declare-fun e!469696 () Bool)

(declare-datatypes ((V!25843 0))(
  ( (V!25844 (val!7846 Int)) )
))
(declare-datatypes ((tuple2!10418 0))(
  ( (tuple2!10419 (_1!5220 (_ BitVec 64)) (_2!5220 V!25843)) )
))
(declare-datatypes ((List!16196 0))(
  ( (Nil!16193) (Cons!16192 (h!17323 tuple2!10418) (t!22567 List!16196)) )
))
(declare-datatypes ((ListLongMap!9187 0))(
  ( (ListLongMap!9188 (toList!4609 List!16196)) )
))
(declare-fun call!37427 () ListLongMap!9187)

(declare-fun call!37426 () ListLongMap!9187)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!25843)

(declare-fun b!842066 () Bool)

(declare-fun +!2071 (ListLongMap!9187 tuple2!10418) ListLongMap!9187)

(assert (=> b!842066 (= e!469696 (= call!37426 (+!2071 call!37427 (tuple2!10419 k0!854 v!557))))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47468 0))(
  ( (array!47469 (arr!22765 (Array (_ BitVec 32) (_ BitVec 64))) (size!23205 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47468)

(declare-datatypes ((ValueCell!7359 0))(
  ( (ValueCellFull!7359 (v!10271 V!25843)) (EmptyCell!7359) )
))
(declare-datatypes ((array!47470 0))(
  ( (array!47471 (arr!22766 (Array (_ BitVec 32) ValueCell!7359)) (size!23206 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47470)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!37423 () Bool)

(declare-fun minValue!654 () V!25843)

(declare-fun zeroValue!654 () V!25843)

(declare-fun getCurrentListMapNoExtraKeys!2594 (array!47468 array!47470 (_ BitVec 32) (_ BitVec 32) V!25843 V!25843 (_ BitVec 32) Int) ListLongMap!9187)

(assert (=> bm!37423 (= call!37426 (getCurrentListMapNoExtraKeys!2594 _keys!868 (array!47471 (store (arr!22766 _values!688) i!612 (ValueCellFull!7359 v!557)) (size!23206 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842067 () Bool)

(declare-fun res!572363 () Bool)

(declare-fun e!469694 () Bool)

(assert (=> b!842067 (=> (not res!572363) (not e!469694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47468 (_ BitVec 32)) Bool)

(assert (=> b!842067 (= res!572363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842068 () Bool)

(declare-fun e!469693 () Bool)

(declare-fun e!469695 () Bool)

(declare-fun mapRes!24995 () Bool)

(assert (=> b!842068 (= e!469693 (and e!469695 mapRes!24995))))

(declare-fun condMapEmpty!24995 () Bool)

(declare-fun mapDefault!24995 () ValueCell!7359)

(assert (=> b!842068 (= condMapEmpty!24995 (= (arr!22766 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7359)) mapDefault!24995)))))

(declare-fun res!572366 () Bool)

(assert (=> start!72546 (=> (not res!572366) (not e!469694))))

(assert (=> start!72546 (= res!572366 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23205 _keys!868))))))

(assert (=> start!72546 e!469694))

(declare-fun tp_is_empty!15597 () Bool)

(assert (=> start!72546 tp_is_empty!15597))

(assert (=> start!72546 true))

(assert (=> start!72546 tp!48292))

(declare-fun array_inv!18114 (array!47468) Bool)

(assert (=> start!72546 (array_inv!18114 _keys!868)))

(declare-fun array_inv!18115 (array!47470) Bool)

(assert (=> start!72546 (and (array_inv!18115 _values!688) e!469693)))

(declare-fun b!842069 () Bool)

(declare-fun res!572362 () Bool)

(assert (=> b!842069 (=> (not res!572362) (not e!469694))))

(assert (=> b!842069 (= res!572362 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23205 _keys!868))))))

(declare-fun b!842070 () Bool)

(assert (=> b!842070 (= e!469694 (not true))))

(assert (=> b!842070 e!469696))

(declare-fun c!91456 () Bool)

(assert (=> b!842070 (= c!91456 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28923 0))(
  ( (Unit!28924) )
))
(declare-fun lt!380962 () Unit!28923)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!307 (array!47468 array!47470 (_ BitVec 32) (_ BitVec 32) V!25843 V!25843 (_ BitVec 32) (_ BitVec 64) V!25843 (_ BitVec 32) Int) Unit!28923)

(assert (=> b!842070 (= lt!380962 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!307 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842071 () Bool)

(declare-fun res!572369 () Bool)

(assert (=> b!842071 (=> (not res!572369) (not e!469694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842071 (= res!572369 (validKeyInArray!0 k0!854))))

(declare-fun b!842072 () Bool)

(declare-fun res!572368 () Bool)

(assert (=> b!842072 (=> (not res!572368) (not e!469694))))

(assert (=> b!842072 (= res!572368 (and (= (size!23206 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23205 _keys!868) (size!23206 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37424 () Bool)

(assert (=> bm!37424 (= call!37427 (getCurrentListMapNoExtraKeys!2594 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842073 () Bool)

(declare-fun res!572367 () Bool)

(assert (=> b!842073 (=> (not res!572367) (not e!469694))))

(declare-datatypes ((List!16197 0))(
  ( (Nil!16194) (Cons!16193 (h!17324 (_ BitVec 64)) (t!22568 List!16197)) )
))
(declare-fun arrayNoDuplicates!0 (array!47468 (_ BitVec 32) List!16197) Bool)

(assert (=> b!842073 (= res!572367 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16194))))

(declare-fun b!842074 () Bool)

(declare-fun res!572364 () Bool)

(assert (=> b!842074 (=> (not res!572364) (not e!469694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842074 (= res!572364 (validMask!0 mask!1196))))

(declare-fun b!842075 () Bool)

(declare-fun res!572365 () Bool)

(assert (=> b!842075 (=> (not res!572365) (not e!469694))))

(assert (=> b!842075 (= res!572365 (and (= (select (arr!22765 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23205 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24995 () Bool)

(assert (=> mapIsEmpty!24995 mapRes!24995))

(declare-fun b!842076 () Bool)

(assert (=> b!842076 (= e!469696 (= call!37426 call!37427))))

(declare-fun mapNonEmpty!24995 () Bool)

(declare-fun tp!48291 () Bool)

(declare-fun e!469692 () Bool)

(assert (=> mapNonEmpty!24995 (= mapRes!24995 (and tp!48291 e!469692))))

(declare-fun mapRest!24995 () (Array (_ BitVec 32) ValueCell!7359))

(declare-fun mapValue!24995 () ValueCell!7359)

(declare-fun mapKey!24995 () (_ BitVec 32))

(assert (=> mapNonEmpty!24995 (= (arr!22766 _values!688) (store mapRest!24995 mapKey!24995 mapValue!24995))))

(declare-fun b!842077 () Bool)

(assert (=> b!842077 (= e!469692 tp_is_empty!15597)))

(declare-fun b!842078 () Bool)

(assert (=> b!842078 (= e!469695 tp_is_empty!15597)))

(assert (= (and start!72546 res!572366) b!842074))

(assert (= (and b!842074 res!572364) b!842072))

(assert (= (and b!842072 res!572368) b!842067))

(assert (= (and b!842067 res!572363) b!842073))

(assert (= (and b!842073 res!572367) b!842069))

(assert (= (and b!842069 res!572362) b!842071))

(assert (= (and b!842071 res!572369) b!842075))

(assert (= (and b!842075 res!572365) b!842070))

(assert (= (and b!842070 c!91456) b!842066))

(assert (= (and b!842070 (not c!91456)) b!842076))

(assert (= (or b!842066 b!842076) bm!37423))

(assert (= (or b!842066 b!842076) bm!37424))

(assert (= (and b!842068 condMapEmpty!24995) mapIsEmpty!24995))

(assert (= (and b!842068 (not condMapEmpty!24995)) mapNonEmpty!24995))

(get-info :version)

(assert (= (and mapNonEmpty!24995 ((_ is ValueCellFull!7359) mapValue!24995)) b!842077))

(assert (= (and b!842068 ((_ is ValueCellFull!7359) mapDefault!24995)) b!842078))

(assert (= start!72546 b!842068))

(declare-fun m!785297 () Bool)

(assert (=> b!842071 m!785297))

(declare-fun m!785299 () Bool)

(assert (=> bm!37424 m!785299))

(declare-fun m!785301 () Bool)

(assert (=> b!842066 m!785301))

(declare-fun m!785303 () Bool)

(assert (=> b!842075 m!785303))

(declare-fun m!785305 () Bool)

(assert (=> b!842074 m!785305))

(declare-fun m!785307 () Bool)

(assert (=> bm!37423 m!785307))

(declare-fun m!785309 () Bool)

(assert (=> bm!37423 m!785309))

(declare-fun m!785311 () Bool)

(assert (=> b!842073 m!785311))

(declare-fun m!785313 () Bool)

(assert (=> start!72546 m!785313))

(declare-fun m!785315 () Bool)

(assert (=> start!72546 m!785315))

(declare-fun m!785317 () Bool)

(assert (=> b!842070 m!785317))

(declare-fun m!785319 () Bool)

(assert (=> mapNonEmpty!24995 m!785319))

(declare-fun m!785321 () Bool)

(assert (=> b!842067 m!785321))

(check-sat b_and!22817 tp_is_empty!15597 (not start!72546) (not b!842071) (not b!842070) (not b!842067) (not bm!37423) (not b!842074) (not b!842066) (not bm!37424) (not mapNonEmpty!24995) (not b!842073) (not b_next!13731))
(check-sat b_and!22817 (not b_next!13731))
