; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72492 () Bool)

(assert start!72492)

(declare-fun b_free!13677 () Bool)

(declare-fun b_next!13677 () Bool)

(assert (=> start!72492 (= b_free!13677 (not b_next!13677))))

(declare-fun tp!48130 () Bool)

(declare-fun b_and!22763 () Bool)

(assert (=> start!72492 (= tp!48130 b_and!22763)))

(declare-fun b!841014 () Bool)

(declare-fun e!469207 () Bool)

(assert (=> b!841014 (= e!469207 (not true))))

(declare-fun e!469209 () Bool)

(assert (=> b!841014 e!469209))

(declare-fun c!91375 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841014 (= c!91375 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25771 0))(
  ( (V!25772 (val!7819 Int)) )
))
(declare-fun v!557 () V!25771)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47364 0))(
  ( (array!47365 (arr!22713 (Array (_ BitVec 32) (_ BitVec 64))) (size!23153 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47364)

(declare-datatypes ((ValueCell!7332 0))(
  ( (ValueCellFull!7332 (v!10244 V!25771)) (EmptyCell!7332) )
))
(declare-datatypes ((array!47366 0))(
  ( (array!47367 (arr!22714 (Array (_ BitVec 32) ValueCell!7332)) (size!23154 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47366)

(declare-fun minValue!654 () V!25771)

(declare-fun zeroValue!654 () V!25771)

(declare-datatypes ((Unit!28885 0))(
  ( (Unit!28886) )
))
(declare-fun lt!380881 () Unit!28885)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!288 (array!47364 array!47366 (_ BitVec 32) (_ BitVec 32) V!25771 V!25771 (_ BitVec 32) (_ BitVec 64) V!25771 (_ BitVec 32) Int) Unit!28885)

(assert (=> b!841014 (= lt!380881 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!288 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841015 () Bool)

(declare-fun res!571719 () Bool)

(assert (=> b!841015 (=> (not res!571719) (not e!469207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841015 (= res!571719 (validKeyInArray!0 k0!854))))

(declare-fun b!841016 () Bool)

(declare-datatypes ((tuple2!10370 0))(
  ( (tuple2!10371 (_1!5196 (_ BitVec 64)) (_2!5196 V!25771)) )
))
(declare-datatypes ((List!16156 0))(
  ( (Nil!16153) (Cons!16152 (h!17283 tuple2!10370) (t!22527 List!16156)) )
))
(declare-datatypes ((ListLongMap!9139 0))(
  ( (ListLongMap!9140 (toList!4585 List!16156)) )
))
(declare-fun call!37264 () ListLongMap!9139)

(declare-fun call!37265 () ListLongMap!9139)

(declare-fun +!2054 (ListLongMap!9139 tuple2!10370) ListLongMap!9139)

(assert (=> b!841016 (= e!469209 (= call!37264 (+!2054 call!37265 (tuple2!10371 k0!854 v!557))))))

(declare-fun b!841017 () Bool)

(declare-fun res!571717 () Bool)

(assert (=> b!841017 (=> (not res!571717) (not e!469207))))

(assert (=> b!841017 (= res!571717 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23153 _keys!868))))))

(declare-fun b!841018 () Bool)

(declare-fun res!571721 () Bool)

(assert (=> b!841018 (=> (not res!571721) (not e!469207))))

(assert (=> b!841018 (= res!571721 (and (= (select (arr!22713 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23153 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!24914 () Bool)

(declare-fun mapRes!24914 () Bool)

(declare-fun tp!48129 () Bool)

(declare-fun e!469208 () Bool)

(assert (=> mapNonEmpty!24914 (= mapRes!24914 (and tp!48129 e!469208))))

(declare-fun mapValue!24914 () ValueCell!7332)

(declare-fun mapRest!24914 () (Array (_ BitVec 32) ValueCell!7332))

(declare-fun mapKey!24914 () (_ BitVec 32))

(assert (=> mapNonEmpty!24914 (= (arr!22714 _values!688) (store mapRest!24914 mapKey!24914 mapValue!24914))))

(declare-fun bm!37261 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2572 (array!47364 array!47366 (_ BitVec 32) (_ BitVec 32) V!25771 V!25771 (_ BitVec 32) Int) ListLongMap!9139)

(assert (=> bm!37261 (= call!37264 (getCurrentListMapNoExtraKeys!2572 _keys!868 (array!47367 (store (arr!22714 _values!688) i!612 (ValueCellFull!7332 v!557)) (size!23154 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841019 () Bool)

(declare-fun e!469205 () Bool)

(declare-fun tp_is_empty!15543 () Bool)

(assert (=> b!841019 (= e!469205 tp_is_empty!15543)))

(declare-fun b!841020 () Bool)

(declare-fun res!571718 () Bool)

(assert (=> b!841020 (=> (not res!571718) (not e!469207))))

(declare-datatypes ((List!16157 0))(
  ( (Nil!16154) (Cons!16153 (h!17284 (_ BitVec 64)) (t!22528 List!16157)) )
))
(declare-fun arrayNoDuplicates!0 (array!47364 (_ BitVec 32) List!16157) Bool)

(assert (=> b!841020 (= res!571718 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16154))))

(declare-fun bm!37262 () Bool)

(assert (=> bm!37262 (= call!37265 (getCurrentListMapNoExtraKeys!2572 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571716 () Bool)

(assert (=> start!72492 (=> (not res!571716) (not e!469207))))

(assert (=> start!72492 (= res!571716 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23153 _keys!868))))))

(assert (=> start!72492 e!469207))

(assert (=> start!72492 tp_is_empty!15543))

(assert (=> start!72492 true))

(assert (=> start!72492 tp!48130))

(declare-fun array_inv!18080 (array!47364) Bool)

(assert (=> start!72492 (array_inv!18080 _keys!868)))

(declare-fun e!469210 () Bool)

(declare-fun array_inv!18081 (array!47366) Bool)

(assert (=> start!72492 (and (array_inv!18081 _values!688) e!469210)))

(declare-fun b!841013 () Bool)

(declare-fun res!571715 () Bool)

(assert (=> b!841013 (=> (not res!571715) (not e!469207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841013 (= res!571715 (validMask!0 mask!1196))))

(declare-fun b!841021 () Bool)

(assert (=> b!841021 (= e!469210 (and e!469205 mapRes!24914))))

(declare-fun condMapEmpty!24914 () Bool)

(declare-fun mapDefault!24914 () ValueCell!7332)

(assert (=> b!841021 (= condMapEmpty!24914 (= (arr!22714 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7332)) mapDefault!24914)))))

(declare-fun b!841022 () Bool)

(declare-fun res!571714 () Bool)

(assert (=> b!841022 (=> (not res!571714) (not e!469207))))

(assert (=> b!841022 (= res!571714 (and (= (size!23154 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23153 _keys!868) (size!23154 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841023 () Bool)

(assert (=> b!841023 (= e!469209 (= call!37264 call!37265))))

(declare-fun mapIsEmpty!24914 () Bool)

(assert (=> mapIsEmpty!24914 mapRes!24914))

(declare-fun b!841024 () Bool)

(assert (=> b!841024 (= e!469208 tp_is_empty!15543)))

(declare-fun b!841025 () Bool)

(declare-fun res!571720 () Bool)

(assert (=> b!841025 (=> (not res!571720) (not e!469207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47364 (_ BitVec 32)) Bool)

(assert (=> b!841025 (= res!571720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72492 res!571716) b!841013))

(assert (= (and b!841013 res!571715) b!841022))

(assert (= (and b!841022 res!571714) b!841025))

(assert (= (and b!841025 res!571720) b!841020))

(assert (= (and b!841020 res!571718) b!841017))

(assert (= (and b!841017 res!571717) b!841015))

(assert (= (and b!841015 res!571719) b!841018))

(assert (= (and b!841018 res!571721) b!841014))

(assert (= (and b!841014 c!91375) b!841016))

(assert (= (and b!841014 (not c!91375)) b!841023))

(assert (= (or b!841016 b!841023) bm!37261))

(assert (= (or b!841016 b!841023) bm!37262))

(assert (= (and b!841021 condMapEmpty!24914) mapIsEmpty!24914))

(assert (= (and b!841021 (not condMapEmpty!24914)) mapNonEmpty!24914))

(get-info :version)

(assert (= (and mapNonEmpty!24914 ((_ is ValueCellFull!7332) mapValue!24914)) b!841024))

(assert (= (and b!841021 ((_ is ValueCellFull!7332) mapDefault!24914)) b!841019))

(assert (= start!72492 b!841021))

(declare-fun m!784595 () Bool)

(assert (=> b!841013 m!784595))

(declare-fun m!784597 () Bool)

(assert (=> bm!37261 m!784597))

(declare-fun m!784599 () Bool)

(assert (=> bm!37261 m!784599))

(declare-fun m!784601 () Bool)

(assert (=> b!841016 m!784601))

(declare-fun m!784603 () Bool)

(assert (=> b!841015 m!784603))

(declare-fun m!784605 () Bool)

(assert (=> b!841014 m!784605))

(declare-fun m!784607 () Bool)

(assert (=> b!841025 m!784607))

(declare-fun m!784609 () Bool)

(assert (=> b!841020 m!784609))

(declare-fun m!784611 () Bool)

(assert (=> bm!37262 m!784611))

(declare-fun m!784613 () Bool)

(assert (=> b!841018 m!784613))

(declare-fun m!784615 () Bool)

(assert (=> start!72492 m!784615))

(declare-fun m!784617 () Bool)

(assert (=> start!72492 m!784617))

(declare-fun m!784619 () Bool)

(assert (=> mapNonEmpty!24914 m!784619))

(check-sat (not b!841015) (not mapNonEmpty!24914) (not b!841020) (not bm!37262) (not start!72492) (not b!841013) b_and!22763 (not b!841025) (not bm!37261) (not b!841014) tp_is_empty!15543 (not b!841016) (not b_next!13677))
(check-sat b_and!22763 (not b_next!13677))
