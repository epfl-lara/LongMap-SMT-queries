; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72724 () Bool)

(assert start!72724)

(declare-fun b_free!13741 () Bool)

(declare-fun b_next!13741 () Bool)

(assert (=> start!72724 (= b_free!13741 (not b_next!13741))))

(declare-fun tp!48322 () Bool)

(declare-fun b_and!22837 () Bool)

(assert (=> start!72724 (= tp!48322 b_and!22837)))

(declare-fun b!843164 () Bool)

(declare-fun e!470366 () Bool)

(declare-datatypes ((V!25857 0))(
  ( (V!25858 (val!7851 Int)) )
))
(declare-datatypes ((tuple2!10356 0))(
  ( (tuple2!10357 (_1!5189 (_ BitVec 64)) (_2!5189 V!25857)) )
))
(declare-datatypes ((List!16125 0))(
  ( (Nil!16122) (Cons!16121 (h!17258 tuple2!10356) (t!22488 List!16125)) )
))
(declare-datatypes ((ListLongMap!9127 0))(
  ( (ListLongMap!9128 (toList!4579 List!16125)) )
))
(declare-fun call!37501 () ListLongMap!9127)

(declare-fun call!37502 () ListLongMap!9127)

(assert (=> b!843164 (= e!470366 (= call!37501 call!37502))))

(declare-fun b!843165 () Bool)

(declare-fun v!557 () V!25857)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2081 (ListLongMap!9127 tuple2!10356) ListLongMap!9127)

(assert (=> b!843165 (= e!470366 (= call!37501 (+!2081 call!37502 (tuple2!10357 k0!854 v!557))))))

(declare-fun res!572829 () Bool)

(declare-fun e!470365 () Bool)

(assert (=> start!72724 (=> (not res!572829) (not e!470365))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47507 0))(
  ( (array!47508 (arr!22780 (Array (_ BitVec 32) (_ BitVec 64))) (size!23221 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47507)

(assert (=> start!72724 (= res!572829 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23221 _keys!868))))))

(assert (=> start!72724 e!470365))

(declare-fun tp_is_empty!15607 () Bool)

(assert (=> start!72724 tp_is_empty!15607))

(assert (=> start!72724 true))

(assert (=> start!72724 tp!48322))

(declare-fun array_inv!18172 (array!47507) Bool)

(assert (=> start!72724 (array_inv!18172 _keys!868)))

(declare-datatypes ((ValueCell!7364 0))(
  ( (ValueCellFull!7364 (v!10276 V!25857)) (EmptyCell!7364) )
))
(declare-datatypes ((array!47509 0))(
  ( (array!47510 (arr!22781 (Array (_ BitVec 32) ValueCell!7364)) (size!23222 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47509)

(declare-fun e!470368 () Bool)

(declare-fun array_inv!18173 (array!47509) Bool)

(assert (=> start!72724 (and (array_inv!18173 _values!688) e!470368)))

(declare-fun b!843166 () Bool)

(declare-fun res!572828 () Bool)

(assert (=> b!843166 (=> (not res!572828) (not e!470365))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!843166 (= res!572828 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23221 _keys!868))))))

(declare-fun b!843167 () Bool)

(declare-fun res!572831 () Bool)

(assert (=> b!843167 (=> (not res!572831) (not e!470365))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47507 (_ BitVec 32)) Bool)

(assert (=> b!843167 (= res!572831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25010 () Bool)

(declare-fun mapRes!25010 () Bool)

(assert (=> mapIsEmpty!25010 mapRes!25010))

(declare-fun mapNonEmpty!25010 () Bool)

(declare-fun tp!48323 () Bool)

(declare-fun e!470367 () Bool)

(assert (=> mapNonEmpty!25010 (= mapRes!25010 (and tp!48323 e!470367))))

(declare-fun mapValue!25010 () ValueCell!7364)

(declare-fun mapRest!25010 () (Array (_ BitVec 32) ValueCell!7364))

(declare-fun mapKey!25010 () (_ BitVec 32))

(assert (=> mapNonEmpty!25010 (= (arr!22781 _values!688) (store mapRest!25010 mapKey!25010 mapValue!25010))))

(declare-fun b!843168 () Bool)

(assert (=> b!843168 (= e!470367 tp_is_empty!15607)))

(declare-fun b!843169 () Bool)

(assert (=> b!843169 (= e!470365 (not true))))

(assert (=> b!843169 e!470366))

(declare-fun c!91753 () Bool)

(assert (=> b!843169 (= c!91753 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28942 0))(
  ( (Unit!28943) )
))
(declare-fun lt!381338 () Unit!28942)

(declare-fun minValue!654 () V!25857)

(declare-fun zeroValue!654 () V!25857)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!307 (array!47507 array!47509 (_ BitVec 32) (_ BitVec 32) V!25857 V!25857 (_ BitVec 32) (_ BitVec 64) V!25857 (_ BitVec 32) Int) Unit!28942)

(assert (=> b!843169 (= lt!381338 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!307 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37498 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2637 (array!47507 array!47509 (_ BitVec 32) (_ BitVec 32) V!25857 V!25857 (_ BitVec 32) Int) ListLongMap!9127)

(assert (=> bm!37498 (= call!37502 (getCurrentListMapNoExtraKeys!2637 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!843170 () Bool)

(declare-fun res!572832 () Bool)

(assert (=> b!843170 (=> (not res!572832) (not e!470365))))

(declare-datatypes ((List!16126 0))(
  ( (Nil!16123) (Cons!16122 (h!17259 (_ BitVec 64)) (t!22489 List!16126)) )
))
(declare-fun arrayNoDuplicates!0 (array!47507 (_ BitVec 32) List!16126) Bool)

(assert (=> b!843170 (= res!572832 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16123))))

(declare-fun b!843171 () Bool)

(declare-fun e!470363 () Bool)

(assert (=> b!843171 (= e!470363 tp_is_empty!15607)))

(declare-fun b!843172 () Bool)

(declare-fun res!572833 () Bool)

(assert (=> b!843172 (=> (not res!572833) (not e!470365))))

(assert (=> b!843172 (= res!572833 (and (= (size!23222 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23221 _keys!868) (size!23222 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843173 () Bool)

(assert (=> b!843173 (= e!470368 (and e!470363 mapRes!25010))))

(declare-fun condMapEmpty!25010 () Bool)

(declare-fun mapDefault!25010 () ValueCell!7364)

(assert (=> b!843173 (= condMapEmpty!25010 (= (arr!22781 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7364)) mapDefault!25010)))))

(declare-fun b!843174 () Bool)

(declare-fun res!572826 () Bool)

(assert (=> b!843174 (=> (not res!572826) (not e!470365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843174 (= res!572826 (validMask!0 mask!1196))))

(declare-fun b!843175 () Bool)

(declare-fun res!572827 () Bool)

(assert (=> b!843175 (=> (not res!572827) (not e!470365))))

(assert (=> b!843175 (= res!572827 (and (= (select (arr!22780 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23221 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37499 () Bool)

(assert (=> bm!37499 (= call!37501 (getCurrentListMapNoExtraKeys!2637 _keys!868 (array!47510 (store (arr!22781 _values!688) i!612 (ValueCellFull!7364 v!557)) (size!23222 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!843176 () Bool)

(declare-fun res!572830 () Bool)

(assert (=> b!843176 (=> (not res!572830) (not e!470365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!843176 (= res!572830 (validKeyInArray!0 k0!854))))

(assert (= (and start!72724 res!572829) b!843174))

(assert (= (and b!843174 res!572826) b!843172))

(assert (= (and b!843172 res!572833) b!843167))

(assert (= (and b!843167 res!572831) b!843170))

(assert (= (and b!843170 res!572832) b!843166))

(assert (= (and b!843166 res!572828) b!843176))

(assert (= (and b!843176 res!572830) b!843175))

(assert (= (and b!843175 res!572827) b!843169))

(assert (= (and b!843169 c!91753) b!843165))

(assert (= (and b!843169 (not c!91753)) b!843164))

(assert (= (or b!843165 b!843164) bm!37499))

(assert (= (or b!843165 b!843164) bm!37498))

(assert (= (and b!843173 condMapEmpty!25010) mapIsEmpty!25010))

(assert (= (and b!843173 (not condMapEmpty!25010)) mapNonEmpty!25010))

(get-info :version)

(assert (= (and mapNonEmpty!25010 ((_ is ValueCellFull!7364) mapValue!25010)) b!843168))

(assert (= (and b!843173 ((_ is ValueCellFull!7364) mapDefault!25010)) b!843171))

(assert (= start!72724 b!843173))

(declare-fun m!786719 () Bool)

(assert (=> mapNonEmpty!25010 m!786719))

(declare-fun m!786721 () Bool)

(assert (=> b!843174 m!786721))

(declare-fun m!786723 () Bool)

(assert (=> bm!37499 m!786723))

(declare-fun m!786725 () Bool)

(assert (=> bm!37499 m!786725))

(declare-fun m!786727 () Bool)

(assert (=> b!843169 m!786727))

(declare-fun m!786729 () Bool)

(assert (=> b!843167 m!786729))

(declare-fun m!786731 () Bool)

(assert (=> bm!37498 m!786731))

(declare-fun m!786733 () Bool)

(assert (=> b!843165 m!786733))

(declare-fun m!786735 () Bool)

(assert (=> start!72724 m!786735))

(declare-fun m!786737 () Bool)

(assert (=> start!72724 m!786737))

(declare-fun m!786739 () Bool)

(assert (=> b!843176 m!786739))

(declare-fun m!786741 () Bool)

(assert (=> b!843175 m!786741))

(declare-fun m!786743 () Bool)

(assert (=> b!843170 m!786743))

(check-sat (not bm!37498) (not bm!37499) (not mapNonEmpty!25010) tp_is_empty!15607 (not b!843174) (not b_next!13741) (not b!843165) (not b!843170) (not start!72724) b_and!22837 (not b!843167) (not b!843176) (not b!843169))
(check-sat b_and!22837 (not b_next!13741))
