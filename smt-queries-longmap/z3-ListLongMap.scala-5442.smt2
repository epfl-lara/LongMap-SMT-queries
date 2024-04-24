; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72604 () Bool)

(assert start!72604)

(declare-fun b_free!13621 () Bool)

(declare-fun b_next!13621 () Bool)

(assert (=> start!72604 (= b_free!13621 (not b_next!13621))))

(declare-fun tp!47962 () Bool)

(declare-fun b_and!22717 () Bool)

(assert (=> start!72604 (= tp!47962 b_and!22717)))

(declare-fun b!840824 () Bool)

(declare-fun res!571392 () Bool)

(declare-fun e!469284 () Bool)

(assert (=> b!840824 (=> (not res!571392) (not e!469284))))

(declare-datatypes ((array!47269 0))(
  ( (array!47270 (arr!22661 (Array (_ BitVec 32) (_ BitVec 64))) (size!23102 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47269)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47269 (_ BitVec 32)) Bool)

(assert (=> b!840824 (= res!571392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840825 () Bool)

(assert (=> b!840825 (= e!469284 (not true))))

(declare-fun e!469285 () Bool)

(assert (=> b!840825 e!469285))

(declare-fun c!91573 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840825 (= c!91573 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25697 0))(
  ( (V!25698 (val!7791 Int)) )
))
(declare-fun v!557 () V!25697)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28862 0))(
  ( (Unit!28863) )
))
(declare-fun lt!381158 () Unit!28862)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7304 0))(
  ( (ValueCellFull!7304 (v!10216 V!25697)) (EmptyCell!7304) )
))
(declare-datatypes ((array!47271 0))(
  ( (array!47272 (arr!22662 (Array (_ BitVec 32) ValueCell!7304)) (size!23103 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47271)

(declare-fun minValue!654 () V!25697)

(declare-fun zeroValue!654 () V!25697)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!267 (array!47269 array!47271 (_ BitVec 32) (_ BitVec 32) V!25697 V!25697 (_ BitVec 32) (_ BitVec 64) V!25697 (_ BitVec 32) Int) Unit!28862)

(assert (=> b!840825 (= lt!381158 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!267 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24830 () Bool)

(declare-fun mapRes!24830 () Bool)

(assert (=> mapIsEmpty!24830 mapRes!24830))

(declare-fun b!840826 () Bool)

(declare-fun res!571391 () Bool)

(assert (=> b!840826 (=> (not res!571391) (not e!469284))))

(assert (=> b!840826 (= res!571391 (and (= (select (arr!22661 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23102 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37138 () Bool)

(declare-datatypes ((tuple2!10250 0))(
  ( (tuple2!10251 (_1!5136 (_ BitVec 64)) (_2!5136 V!25697)) )
))
(declare-datatypes ((List!16027 0))(
  ( (Nil!16024) (Cons!16023 (h!17160 tuple2!10250) (t!22390 List!16027)) )
))
(declare-datatypes ((ListLongMap!9021 0))(
  ( (ListLongMap!9022 (toList!4526 List!16027)) )
))
(declare-fun call!37142 () ListLongMap!9021)

(declare-fun getCurrentListMapNoExtraKeys!2588 (array!47269 array!47271 (_ BitVec 32) (_ BitVec 32) V!25697 V!25697 (_ BitVec 32) Int) ListLongMap!9021)

(assert (=> bm!37138 (= call!37142 (getCurrentListMapNoExtraKeys!2588 _keys!868 (array!47272 (store (arr!22662 _values!688) i!612 (ValueCellFull!7304 v!557)) (size!23103 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840827 () Bool)

(declare-fun res!571386 () Bool)

(assert (=> b!840827 (=> (not res!571386) (not e!469284))))

(assert (=> b!840827 (= res!571386 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23102 _keys!868))))))

(declare-fun call!37141 () ListLongMap!9021)

(declare-fun b!840828 () Bool)

(declare-fun +!2037 (ListLongMap!9021 tuple2!10250) ListLongMap!9021)

(assert (=> b!840828 (= e!469285 (= call!37142 (+!2037 call!37141 (tuple2!10251 k0!854 v!557))))))

(declare-fun b!840829 () Bool)

(declare-fun res!571389 () Bool)

(assert (=> b!840829 (=> (not res!571389) (not e!469284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840829 (= res!571389 (validMask!0 mask!1196))))

(declare-fun b!840830 () Bool)

(declare-fun res!571390 () Bool)

(assert (=> b!840830 (=> (not res!571390) (not e!469284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840830 (= res!571390 (validKeyInArray!0 k0!854))))

(declare-fun b!840831 () Bool)

(assert (=> b!840831 (= e!469285 (= call!37142 call!37141))))

(declare-fun b!840832 () Bool)

(declare-fun e!469286 () Bool)

(declare-fun e!469283 () Bool)

(assert (=> b!840832 (= e!469286 (and e!469283 mapRes!24830))))

(declare-fun condMapEmpty!24830 () Bool)

(declare-fun mapDefault!24830 () ValueCell!7304)

(assert (=> b!840832 (= condMapEmpty!24830 (= (arr!22662 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7304)) mapDefault!24830)))))

(declare-fun b!840833 () Bool)

(declare-fun res!571393 () Bool)

(assert (=> b!840833 (=> (not res!571393) (not e!469284))))

(assert (=> b!840833 (= res!571393 (and (= (size!23103 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23102 _keys!868) (size!23103 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840834 () Bool)

(declare-fun res!571388 () Bool)

(assert (=> b!840834 (=> (not res!571388) (not e!469284))))

(declare-datatypes ((List!16028 0))(
  ( (Nil!16025) (Cons!16024 (h!17161 (_ BitVec 64)) (t!22391 List!16028)) )
))
(declare-fun arrayNoDuplicates!0 (array!47269 (_ BitVec 32) List!16028) Bool)

(assert (=> b!840834 (= res!571388 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16025))))

(declare-fun b!840835 () Bool)

(declare-fun tp_is_empty!15487 () Bool)

(assert (=> b!840835 (= e!469283 tp_is_empty!15487)))

(declare-fun bm!37139 () Bool)

(assert (=> bm!37139 (= call!37141 (getCurrentListMapNoExtraKeys!2588 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840836 () Bool)

(declare-fun e!469288 () Bool)

(assert (=> b!840836 (= e!469288 tp_is_empty!15487)))

(declare-fun mapNonEmpty!24830 () Bool)

(declare-fun tp!47963 () Bool)

(assert (=> mapNonEmpty!24830 (= mapRes!24830 (and tp!47963 e!469288))))

(declare-fun mapKey!24830 () (_ BitVec 32))

(declare-fun mapRest!24830 () (Array (_ BitVec 32) ValueCell!7304))

(declare-fun mapValue!24830 () ValueCell!7304)

(assert (=> mapNonEmpty!24830 (= (arr!22662 _values!688) (store mapRest!24830 mapKey!24830 mapValue!24830))))

(declare-fun res!571387 () Bool)

(assert (=> start!72604 (=> (not res!571387) (not e!469284))))

(assert (=> start!72604 (= res!571387 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23102 _keys!868))))))

(assert (=> start!72604 e!469284))

(assert (=> start!72604 tp_is_empty!15487))

(assert (=> start!72604 true))

(assert (=> start!72604 tp!47962))

(declare-fun array_inv!18084 (array!47269) Bool)

(assert (=> start!72604 (array_inv!18084 _keys!868)))

(declare-fun array_inv!18085 (array!47271) Bool)

(assert (=> start!72604 (and (array_inv!18085 _values!688) e!469286)))

(assert (= (and start!72604 res!571387) b!840829))

(assert (= (and b!840829 res!571389) b!840833))

(assert (= (and b!840833 res!571393) b!840824))

(assert (= (and b!840824 res!571392) b!840834))

(assert (= (and b!840834 res!571388) b!840827))

(assert (= (and b!840827 res!571386) b!840830))

(assert (= (and b!840830 res!571390) b!840826))

(assert (= (and b!840826 res!571391) b!840825))

(assert (= (and b!840825 c!91573) b!840828))

(assert (= (and b!840825 (not c!91573)) b!840831))

(assert (= (or b!840828 b!840831) bm!37138))

(assert (= (or b!840828 b!840831) bm!37139))

(assert (= (and b!840832 condMapEmpty!24830) mapIsEmpty!24830))

(assert (= (and b!840832 (not condMapEmpty!24830)) mapNonEmpty!24830))

(get-info :version)

(assert (= (and mapNonEmpty!24830 ((_ is ValueCellFull!7304) mapValue!24830)) b!840836))

(assert (= (and b!840832 ((_ is ValueCellFull!7304) mapDefault!24830)) b!840835))

(assert (= start!72604 b!840832))

(declare-fun m!785159 () Bool)

(assert (=> b!840830 m!785159))

(declare-fun m!785161 () Bool)

(assert (=> mapNonEmpty!24830 m!785161))

(declare-fun m!785163 () Bool)

(assert (=> b!840828 m!785163))

(declare-fun m!785165 () Bool)

(assert (=> b!840826 m!785165))

(declare-fun m!785167 () Bool)

(assert (=> b!840829 m!785167))

(declare-fun m!785169 () Bool)

(assert (=> b!840834 m!785169))

(declare-fun m!785171 () Bool)

(assert (=> b!840824 m!785171))

(declare-fun m!785173 () Bool)

(assert (=> b!840825 m!785173))

(declare-fun m!785175 () Bool)

(assert (=> bm!37138 m!785175))

(declare-fun m!785177 () Bool)

(assert (=> bm!37138 m!785177))

(declare-fun m!785179 () Bool)

(assert (=> bm!37139 m!785179))

(declare-fun m!785181 () Bool)

(assert (=> start!72604 m!785181))

(declare-fun m!785183 () Bool)

(assert (=> start!72604 m!785183))

(check-sat (not start!72604) (not bm!37139) (not b!840828) (not b!840829) (not b_next!13621) (not bm!37138) (not b!840834) tp_is_empty!15487 b_and!22717 (not b!840825) (not b!840830) (not b!840824) (not mapNonEmpty!24830))
(check-sat b_and!22717 (not b_next!13621))
