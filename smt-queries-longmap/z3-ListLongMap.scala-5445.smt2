; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72622 () Bool)

(assert start!72622)

(declare-fun b_free!13639 () Bool)

(declare-fun b_next!13639 () Bool)

(assert (=> start!72622 (= b_free!13639 (not b_next!13639))))

(declare-fun tp!48017 () Bool)

(declare-fun b_and!22735 () Bool)

(assert (=> start!72622 (= tp!48017 b_and!22735)))

(declare-fun b!841175 () Bool)

(declare-fun res!571606 () Bool)

(declare-fun e!469447 () Bool)

(assert (=> b!841175 (=> (not res!571606) (not e!469447))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841175 (= res!571606 (validMask!0 mask!1196))))

(declare-fun b!841176 () Bool)

(declare-fun res!571602 () Bool)

(assert (=> b!841176 (=> (not res!571602) (not e!469447))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841176 (= res!571602 (validKeyInArray!0 k0!854))))

(declare-fun b!841177 () Bool)

(declare-fun e!469446 () Bool)

(declare-datatypes ((V!25721 0))(
  ( (V!25722 (val!7800 Int)) )
))
(declare-datatypes ((tuple2!10266 0))(
  ( (tuple2!10267 (_1!5144 (_ BitVec 64)) (_2!5144 V!25721)) )
))
(declare-datatypes ((List!16042 0))(
  ( (Nil!16039) (Cons!16038 (h!17175 tuple2!10266) (t!22405 List!16042)) )
))
(declare-datatypes ((ListLongMap!9037 0))(
  ( (ListLongMap!9038 (toList!4534 List!16042)) )
))
(declare-fun call!37196 () ListLongMap!9037)

(declare-fun call!37195 () ListLongMap!9037)

(assert (=> b!841177 (= e!469446 (= call!37196 call!37195))))

(declare-fun res!571605 () Bool)

(assert (=> start!72622 (=> (not res!571605) (not e!469447))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47305 0))(
  ( (array!47306 (arr!22679 (Array (_ BitVec 32) (_ BitVec 64))) (size!23120 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47305)

(assert (=> start!72622 (= res!571605 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23120 _keys!868))))))

(assert (=> start!72622 e!469447))

(declare-fun tp_is_empty!15505 () Bool)

(assert (=> start!72622 tp_is_empty!15505))

(assert (=> start!72622 true))

(assert (=> start!72622 tp!48017))

(declare-fun array_inv!18096 (array!47305) Bool)

(assert (=> start!72622 (array_inv!18096 _keys!868)))

(declare-datatypes ((ValueCell!7313 0))(
  ( (ValueCellFull!7313 (v!10225 V!25721)) (EmptyCell!7313) )
))
(declare-datatypes ((array!47307 0))(
  ( (array!47308 (arr!22680 (Array (_ BitVec 32) ValueCell!7313)) (size!23121 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47307)

(declare-fun e!469448 () Bool)

(declare-fun array_inv!18097 (array!47307) Bool)

(assert (=> start!72622 (and (array_inv!18097 _values!688) e!469448)))

(declare-fun b!841178 () Bool)

(declare-fun e!469450 () Bool)

(declare-fun mapRes!24857 () Bool)

(assert (=> b!841178 (= e!469448 (and e!469450 mapRes!24857))))

(declare-fun condMapEmpty!24857 () Bool)

(declare-fun mapDefault!24857 () ValueCell!7313)

(assert (=> b!841178 (= condMapEmpty!24857 (= (arr!22680 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7313)) mapDefault!24857)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37192 () Bool)

(declare-fun minValue!654 () V!25721)

(declare-fun zeroValue!654 () V!25721)

(declare-fun getCurrentListMapNoExtraKeys!2595 (array!47305 array!47307 (_ BitVec 32) (_ BitVec 32) V!25721 V!25721 (_ BitVec 32) Int) ListLongMap!9037)

(assert (=> bm!37192 (= call!37195 (getCurrentListMapNoExtraKeys!2595 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841179 () Bool)

(declare-fun res!571604 () Bool)

(assert (=> b!841179 (=> (not res!571604) (not e!469447))))

(declare-datatypes ((List!16043 0))(
  ( (Nil!16040) (Cons!16039 (h!17176 (_ BitVec 64)) (t!22406 List!16043)) )
))
(declare-fun arrayNoDuplicates!0 (array!47305 (_ BitVec 32) List!16043) Bool)

(assert (=> b!841179 (= res!571604 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16040))))

(declare-fun b!841180 () Bool)

(assert (=> b!841180 (= e!469447 (not true))))

(assert (=> b!841180 e!469446))

(declare-fun c!91600 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841180 (= c!91600 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25721)

(declare-datatypes ((Unit!28876 0))(
  ( (Unit!28877) )
))
(declare-fun lt!381185 () Unit!28876)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!274 (array!47305 array!47307 (_ BitVec 32) (_ BitVec 32) V!25721 V!25721 (_ BitVec 32) (_ BitVec 64) V!25721 (_ BitVec 32) Int) Unit!28876)

(assert (=> b!841180 (= lt!381185 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!274 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841181 () Bool)

(declare-fun res!571603 () Bool)

(assert (=> b!841181 (=> (not res!571603) (not e!469447))))

(assert (=> b!841181 (= res!571603 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23120 _keys!868))))))

(declare-fun b!841182 () Bool)

(declare-fun res!571608 () Bool)

(assert (=> b!841182 (=> (not res!571608) (not e!469447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47305 (_ BitVec 32)) Bool)

(assert (=> b!841182 (= res!571608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24857 () Bool)

(assert (=> mapIsEmpty!24857 mapRes!24857))

(declare-fun b!841183 () Bool)

(declare-fun e!469449 () Bool)

(assert (=> b!841183 (= e!469449 tp_is_empty!15505)))

(declare-fun b!841184 () Bool)

(declare-fun +!2044 (ListLongMap!9037 tuple2!10266) ListLongMap!9037)

(assert (=> b!841184 (= e!469446 (= call!37196 (+!2044 call!37195 (tuple2!10267 k0!854 v!557))))))

(declare-fun bm!37193 () Bool)

(assert (=> bm!37193 (= call!37196 (getCurrentListMapNoExtraKeys!2595 _keys!868 (array!47308 (store (arr!22680 _values!688) i!612 (ValueCellFull!7313 v!557)) (size!23121 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841185 () Bool)

(declare-fun res!571607 () Bool)

(assert (=> b!841185 (=> (not res!571607) (not e!469447))))

(assert (=> b!841185 (= res!571607 (and (= (size!23121 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23120 _keys!868) (size!23121 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24857 () Bool)

(declare-fun tp!48016 () Bool)

(assert (=> mapNonEmpty!24857 (= mapRes!24857 (and tp!48016 e!469449))))

(declare-fun mapKey!24857 () (_ BitVec 32))

(declare-fun mapRest!24857 () (Array (_ BitVec 32) ValueCell!7313))

(declare-fun mapValue!24857 () ValueCell!7313)

(assert (=> mapNonEmpty!24857 (= (arr!22680 _values!688) (store mapRest!24857 mapKey!24857 mapValue!24857))))

(declare-fun b!841186 () Bool)

(assert (=> b!841186 (= e!469450 tp_is_empty!15505)))

(declare-fun b!841187 () Bool)

(declare-fun res!571609 () Bool)

(assert (=> b!841187 (=> (not res!571609) (not e!469447))))

(assert (=> b!841187 (= res!571609 (and (= (select (arr!22679 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23120 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72622 res!571605) b!841175))

(assert (= (and b!841175 res!571606) b!841185))

(assert (= (and b!841185 res!571607) b!841182))

(assert (= (and b!841182 res!571608) b!841179))

(assert (= (and b!841179 res!571604) b!841181))

(assert (= (and b!841181 res!571603) b!841176))

(assert (= (and b!841176 res!571602) b!841187))

(assert (= (and b!841187 res!571609) b!841180))

(assert (= (and b!841180 c!91600) b!841184))

(assert (= (and b!841180 (not c!91600)) b!841177))

(assert (= (or b!841184 b!841177) bm!37193))

(assert (= (or b!841184 b!841177) bm!37192))

(assert (= (and b!841178 condMapEmpty!24857) mapIsEmpty!24857))

(assert (= (and b!841178 (not condMapEmpty!24857)) mapNonEmpty!24857))

(get-info :version)

(assert (= (and mapNonEmpty!24857 ((_ is ValueCellFull!7313) mapValue!24857)) b!841183))

(assert (= (and b!841178 ((_ is ValueCellFull!7313) mapDefault!24857)) b!841186))

(assert (= start!72622 b!841178))

(declare-fun m!785393 () Bool)

(assert (=> b!841179 m!785393))

(declare-fun m!785395 () Bool)

(assert (=> b!841175 m!785395))

(declare-fun m!785397 () Bool)

(assert (=> bm!37192 m!785397))

(declare-fun m!785399 () Bool)

(assert (=> bm!37193 m!785399))

(declare-fun m!785401 () Bool)

(assert (=> bm!37193 m!785401))

(declare-fun m!785403 () Bool)

(assert (=> b!841182 m!785403))

(declare-fun m!785405 () Bool)

(assert (=> mapNonEmpty!24857 m!785405))

(declare-fun m!785407 () Bool)

(assert (=> start!72622 m!785407))

(declare-fun m!785409 () Bool)

(assert (=> start!72622 m!785409))

(declare-fun m!785411 () Bool)

(assert (=> b!841184 m!785411))

(declare-fun m!785413 () Bool)

(assert (=> b!841176 m!785413))

(declare-fun m!785415 () Bool)

(assert (=> b!841187 m!785415))

(declare-fun m!785417 () Bool)

(assert (=> b!841180 m!785417))

(check-sat (not b!841175) (not b!841179) (not start!72622) (not bm!37192) (not b!841180) (not b_next!13639) tp_is_empty!15505 (not b!841182) b_and!22735 (not b!841184) (not bm!37193) (not mapNonEmpty!24857) (not b!841176))
(check-sat b_and!22735 (not b_next!13639))
