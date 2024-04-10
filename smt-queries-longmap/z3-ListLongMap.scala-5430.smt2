; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72366 () Bool)

(assert start!72366)

(declare-fun b_free!13551 () Bool)

(declare-fun b_next!13551 () Bool)

(assert (=> start!72366 (= b_free!13551 (not b_next!13551))))

(declare-fun tp!47751 () Bool)

(declare-fun b_and!22637 () Bool)

(assert (=> start!72366 (= tp!47751 b_and!22637)))

(declare-fun b!838556 () Bool)

(declare-fun res!570204 () Bool)

(declare-fun e!468071 () Bool)

(assert (=> b!838556 (=> (not res!570204) (not e!468071))))

(declare-datatypes ((array!47122 0))(
  ( (array!47123 (arr!22592 (Array (_ BitVec 32) (_ BitVec 64))) (size!23032 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47122)

(declare-datatypes ((List!16063 0))(
  ( (Nil!16060) (Cons!16059 (h!17190 (_ BitVec 64)) (t!22434 List!16063)) )
))
(declare-fun arrayNoDuplicates!0 (array!47122 (_ BitVec 32) List!16063) Bool)

(assert (=> b!838556 (= res!570204 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16060))))

(declare-fun b!838557 () Bool)

(assert (=> b!838557 (= e!468071 (not true))))

(declare-fun e!468075 () Bool)

(assert (=> b!838557 e!468075))

(declare-fun c!91186 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838557 (= c!91186 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25603 0))(
  ( (V!25604 (val!7756 Int)) )
))
(declare-fun v!557 () V!25603)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28801 0))(
  ( (Unit!28802) )
))
(declare-fun lt!380692 () Unit!28801)

(declare-datatypes ((ValueCell!7269 0))(
  ( (ValueCellFull!7269 (v!10181 V!25603)) (EmptyCell!7269) )
))
(declare-datatypes ((array!47124 0))(
  ( (array!47125 (arr!22593 (Array (_ BitVec 32) ValueCell!7269)) (size!23033 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47124)

(declare-fun minValue!654 () V!25603)

(declare-fun zeroValue!654 () V!25603)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!246 (array!47122 array!47124 (_ BitVec 32) (_ BitVec 32) V!25603 V!25603 (_ BitVec 32) (_ BitVec 64) V!25603 (_ BitVec 32) Int) Unit!28801)

(assert (=> b!838557 (= lt!380692 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838558 () Bool)

(declare-fun e!468076 () Bool)

(declare-fun tp_is_empty!15417 () Bool)

(assert (=> b!838558 (= e!468076 tp_is_empty!15417)))

(declare-datatypes ((tuple2!10260 0))(
  ( (tuple2!10261 (_1!5141 (_ BitVec 64)) (_2!5141 V!25603)) )
))
(declare-datatypes ((List!16064 0))(
  ( (Nil!16061) (Cons!16060 (h!17191 tuple2!10260) (t!22435 List!16064)) )
))
(declare-datatypes ((ListLongMap!9029 0))(
  ( (ListLongMap!9030 (toList!4530 List!16064)) )
))
(declare-fun call!36887 () ListLongMap!9029)

(declare-fun bm!36883 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2522 (array!47122 array!47124 (_ BitVec 32) (_ BitVec 32) V!25603 V!25603 (_ BitVec 32) Int) ListLongMap!9029)

(assert (=> bm!36883 (= call!36887 (getCurrentListMapNoExtraKeys!2522 _keys!868 (array!47125 (store (arr!22593 _values!688) i!612 (ValueCellFull!7269 v!557)) (size!23033 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570209 () Bool)

(assert (=> start!72366 (=> (not res!570209) (not e!468071))))

(assert (=> start!72366 (= res!570209 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23032 _keys!868))))))

(assert (=> start!72366 e!468071))

(assert (=> start!72366 tp_is_empty!15417))

(assert (=> start!72366 true))

(assert (=> start!72366 tp!47751))

(declare-fun array_inv!18000 (array!47122) Bool)

(assert (=> start!72366 (array_inv!18000 _keys!868)))

(declare-fun e!468072 () Bool)

(declare-fun array_inv!18001 (array!47124) Bool)

(assert (=> start!72366 (and (array_inv!18001 _values!688) e!468072)))

(declare-fun b!838559 () Bool)

(declare-fun res!570208 () Bool)

(assert (=> b!838559 (=> (not res!570208) (not e!468071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47122 (_ BitVec 32)) Bool)

(assert (=> b!838559 (= res!570208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838560 () Bool)

(declare-fun res!570202 () Bool)

(assert (=> b!838560 (=> (not res!570202) (not e!468071))))

(assert (=> b!838560 (= res!570202 (and (= (size!23033 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23032 _keys!868) (size!23033 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838561 () Bool)

(declare-fun res!570205 () Bool)

(assert (=> b!838561 (=> (not res!570205) (not e!468071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838561 (= res!570205 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24725 () Bool)

(declare-fun mapRes!24725 () Bool)

(assert (=> mapIsEmpty!24725 mapRes!24725))

(declare-fun b!838562 () Bool)

(declare-fun e!468073 () Bool)

(assert (=> b!838562 (= e!468073 tp_is_empty!15417)))

(declare-fun b!838563 () Bool)

(declare-fun call!36886 () ListLongMap!9029)

(declare-fun +!2004 (ListLongMap!9029 tuple2!10260) ListLongMap!9029)

(assert (=> b!838563 (= e!468075 (= call!36887 (+!2004 call!36886 (tuple2!10261 k0!854 v!557))))))

(declare-fun b!838564 () Bool)

(assert (=> b!838564 (= e!468075 (= call!36887 call!36886))))

(declare-fun b!838565 () Bool)

(declare-fun res!570207 () Bool)

(assert (=> b!838565 (=> (not res!570207) (not e!468071))))

(assert (=> b!838565 (= res!570207 (and (= (select (arr!22592 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23032 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838566 () Bool)

(assert (=> b!838566 (= e!468072 (and e!468076 mapRes!24725))))

(declare-fun condMapEmpty!24725 () Bool)

(declare-fun mapDefault!24725 () ValueCell!7269)

(assert (=> b!838566 (= condMapEmpty!24725 (= (arr!22593 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7269)) mapDefault!24725)))))

(declare-fun b!838567 () Bool)

(declare-fun res!570203 () Bool)

(assert (=> b!838567 (=> (not res!570203) (not e!468071))))

(assert (=> b!838567 (= res!570203 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23032 _keys!868))))))

(declare-fun b!838568 () Bool)

(declare-fun res!570206 () Bool)

(assert (=> b!838568 (=> (not res!570206) (not e!468071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838568 (= res!570206 (validKeyInArray!0 k0!854))))

(declare-fun bm!36884 () Bool)

(assert (=> bm!36884 (= call!36886 (getCurrentListMapNoExtraKeys!2522 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24725 () Bool)

(declare-fun tp!47752 () Bool)

(assert (=> mapNonEmpty!24725 (= mapRes!24725 (and tp!47752 e!468073))))

(declare-fun mapKey!24725 () (_ BitVec 32))

(declare-fun mapValue!24725 () ValueCell!7269)

(declare-fun mapRest!24725 () (Array (_ BitVec 32) ValueCell!7269))

(assert (=> mapNonEmpty!24725 (= (arr!22593 _values!688) (store mapRest!24725 mapKey!24725 mapValue!24725))))

(assert (= (and start!72366 res!570209) b!838561))

(assert (= (and b!838561 res!570205) b!838560))

(assert (= (and b!838560 res!570202) b!838559))

(assert (= (and b!838559 res!570208) b!838556))

(assert (= (and b!838556 res!570204) b!838567))

(assert (= (and b!838567 res!570203) b!838568))

(assert (= (and b!838568 res!570206) b!838565))

(assert (= (and b!838565 res!570207) b!838557))

(assert (= (and b!838557 c!91186) b!838563))

(assert (= (and b!838557 (not c!91186)) b!838564))

(assert (= (or b!838563 b!838564) bm!36883))

(assert (= (or b!838563 b!838564) bm!36884))

(assert (= (and b!838566 condMapEmpty!24725) mapIsEmpty!24725))

(assert (= (and b!838566 (not condMapEmpty!24725)) mapNonEmpty!24725))

(get-info :version)

(assert (= (and mapNonEmpty!24725 ((_ is ValueCellFull!7269) mapValue!24725)) b!838562))

(assert (= (and b!838566 ((_ is ValueCellFull!7269) mapDefault!24725)) b!838558))

(assert (= start!72366 b!838566))

(declare-fun m!782957 () Bool)

(assert (=> mapNonEmpty!24725 m!782957))

(declare-fun m!782959 () Bool)

(assert (=> bm!36884 m!782959))

(declare-fun m!782961 () Bool)

(assert (=> b!838565 m!782961))

(declare-fun m!782963 () Bool)

(assert (=> bm!36883 m!782963))

(declare-fun m!782965 () Bool)

(assert (=> bm!36883 m!782965))

(declare-fun m!782967 () Bool)

(assert (=> b!838568 m!782967))

(declare-fun m!782969 () Bool)

(assert (=> b!838557 m!782969))

(declare-fun m!782971 () Bool)

(assert (=> b!838556 m!782971))

(declare-fun m!782973 () Bool)

(assert (=> start!72366 m!782973))

(declare-fun m!782975 () Bool)

(assert (=> start!72366 m!782975))

(declare-fun m!782977 () Bool)

(assert (=> b!838561 m!782977))

(declare-fun m!782979 () Bool)

(assert (=> b!838563 m!782979))

(declare-fun m!782981 () Bool)

(assert (=> b!838559 m!782981))

(check-sat (not b!838559) (not b_next!13551) b_and!22637 (not b!838568) (not b!838556) (not bm!36883) tp_is_empty!15417 (not b!838557) (not bm!36884) (not b!838563) (not mapNonEmpty!24725) (not start!72366) (not b!838561))
(check-sat b_and!22637 (not b_next!13551))
