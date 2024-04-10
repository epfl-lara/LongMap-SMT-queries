; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72450 () Bool)

(assert start!72450)

(declare-fun b_free!13635 () Bool)

(declare-fun b_next!13635 () Bool)

(assert (=> start!72450 (= b_free!13635 (not b_next!13635))))

(declare-fun tp!48003 () Bool)

(declare-fun b_and!22721 () Bool)

(assert (=> start!72450 (= tp!48003 b_and!22721)))

(declare-fun b!840194 () Bool)

(declare-fun res!571214 () Bool)

(declare-fun e!468829 () Bool)

(assert (=> b!840194 (=> (not res!571214) (not e!468829))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840194 (= res!571214 (validMask!0 mask!1196))))

(declare-fun b!840195 () Bool)

(assert (=> b!840195 (= e!468829 (not true))))

(declare-fun e!468831 () Bool)

(assert (=> b!840195 e!468831))

(declare-fun c!91312 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840195 (= c!91312 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25715 0))(
  ( (V!25716 (val!7798 Int)) )
))
(declare-fun v!557 () V!25715)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28857 0))(
  ( (Unit!28858) )
))
(declare-fun lt!380818 () Unit!28857)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47282 0))(
  ( (array!47283 (arr!22672 (Array (_ BitVec 32) (_ BitVec 64))) (size!23112 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47282)

(declare-datatypes ((ValueCell!7311 0))(
  ( (ValueCellFull!7311 (v!10223 V!25715)) (EmptyCell!7311) )
))
(declare-datatypes ((array!47284 0))(
  ( (array!47285 (arr!22673 (Array (_ BitVec 32) ValueCell!7311)) (size!23113 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47284)

(declare-fun minValue!654 () V!25715)

(declare-fun zeroValue!654 () V!25715)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!274 (array!47282 array!47284 (_ BitVec 32) (_ BitVec 32) V!25715 V!25715 (_ BitVec 32) (_ BitVec 64) V!25715 (_ BitVec 32) Int) Unit!28857)

(assert (=> b!840195 (= lt!380818 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!274 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((tuple2!10332 0))(
  ( (tuple2!10333 (_1!5177 (_ BitVec 64)) (_2!5177 V!25715)) )
))
(declare-datatypes ((List!16125 0))(
  ( (Nil!16122) (Cons!16121 (h!17252 tuple2!10332) (t!22496 List!16125)) )
))
(declare-datatypes ((ListLongMap!9101 0))(
  ( (ListLongMap!9102 (toList!4566 List!16125)) )
))
(declare-fun call!37138 () ListLongMap!9101)

(declare-fun bm!37135 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2554 (array!47282 array!47284 (_ BitVec 32) (_ BitVec 32) V!25715 V!25715 (_ BitVec 32) Int) ListLongMap!9101)

(assert (=> bm!37135 (= call!37138 (getCurrentListMapNoExtraKeys!2554 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24851 () Bool)

(declare-fun mapRes!24851 () Bool)

(assert (=> mapIsEmpty!24851 mapRes!24851))

(declare-fun b!840196 () Bool)

(declare-fun res!571215 () Bool)

(assert (=> b!840196 (=> (not res!571215) (not e!468829))))

(declare-datatypes ((List!16126 0))(
  ( (Nil!16123) (Cons!16122 (h!17253 (_ BitVec 64)) (t!22497 List!16126)) )
))
(declare-fun arrayNoDuplicates!0 (array!47282 (_ BitVec 32) List!16126) Bool)

(assert (=> b!840196 (= res!571215 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16123))))

(declare-fun b!840197 () Bool)

(declare-fun res!571213 () Bool)

(assert (=> b!840197 (=> (not res!571213) (not e!468829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47282 (_ BitVec 32)) Bool)

(assert (=> b!840197 (= res!571213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840198 () Bool)

(declare-fun res!571211 () Bool)

(assert (=> b!840198 (=> (not res!571211) (not e!468829))))

(assert (=> b!840198 (= res!571211 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23112 _keys!868))))))

(declare-fun b!840199 () Bool)

(declare-fun e!468828 () Bool)

(declare-fun tp_is_empty!15501 () Bool)

(assert (=> b!840199 (= e!468828 tp_is_empty!15501)))

(declare-fun b!840200 () Bool)

(declare-fun call!37139 () ListLongMap!9101)

(declare-fun +!2035 (ListLongMap!9101 tuple2!10332) ListLongMap!9101)

(assert (=> b!840200 (= e!468831 (= call!37139 (+!2035 call!37138 (tuple2!10333 k0!854 v!557))))))

(declare-fun b!840201 () Bool)

(assert (=> b!840201 (= e!468831 (= call!37139 call!37138))))

(declare-fun b!840202 () Bool)

(declare-fun res!571216 () Bool)

(assert (=> b!840202 (=> (not res!571216) (not e!468829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840202 (= res!571216 (validKeyInArray!0 k0!854))))

(declare-fun res!571217 () Bool)

(assert (=> start!72450 (=> (not res!571217) (not e!468829))))

(assert (=> start!72450 (= res!571217 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23112 _keys!868))))))

(assert (=> start!72450 e!468829))

(assert (=> start!72450 tp_is_empty!15501))

(assert (=> start!72450 true))

(assert (=> start!72450 tp!48003))

(declare-fun array_inv!18054 (array!47282) Bool)

(assert (=> start!72450 (array_inv!18054 _keys!868)))

(declare-fun e!468827 () Bool)

(declare-fun array_inv!18055 (array!47284) Bool)

(assert (=> start!72450 (and (array_inv!18055 _values!688) e!468827)))

(declare-fun b!840203 () Bool)

(declare-fun e!468832 () Bool)

(assert (=> b!840203 (= e!468832 tp_is_empty!15501)))

(declare-fun b!840204 () Bool)

(declare-fun res!571212 () Bool)

(assert (=> b!840204 (=> (not res!571212) (not e!468829))))

(assert (=> b!840204 (= res!571212 (and (= (size!23113 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23112 _keys!868) (size!23113 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24851 () Bool)

(declare-fun tp!48004 () Bool)

(assert (=> mapNonEmpty!24851 (= mapRes!24851 (and tp!48004 e!468828))))

(declare-fun mapKey!24851 () (_ BitVec 32))

(declare-fun mapRest!24851 () (Array (_ BitVec 32) ValueCell!7311))

(declare-fun mapValue!24851 () ValueCell!7311)

(assert (=> mapNonEmpty!24851 (= (arr!22673 _values!688) (store mapRest!24851 mapKey!24851 mapValue!24851))))

(declare-fun b!840205 () Bool)

(declare-fun res!571210 () Bool)

(assert (=> b!840205 (=> (not res!571210) (not e!468829))))

(assert (=> b!840205 (= res!571210 (and (= (select (arr!22672 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23112 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840206 () Bool)

(assert (=> b!840206 (= e!468827 (and e!468832 mapRes!24851))))

(declare-fun condMapEmpty!24851 () Bool)

(declare-fun mapDefault!24851 () ValueCell!7311)

(assert (=> b!840206 (= condMapEmpty!24851 (= (arr!22673 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7311)) mapDefault!24851)))))

(declare-fun bm!37136 () Bool)

(assert (=> bm!37136 (= call!37139 (getCurrentListMapNoExtraKeys!2554 _keys!868 (array!47285 (store (arr!22673 _values!688) i!612 (ValueCellFull!7311 v!557)) (size!23113 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72450 res!571217) b!840194))

(assert (= (and b!840194 res!571214) b!840204))

(assert (= (and b!840204 res!571212) b!840197))

(assert (= (and b!840197 res!571213) b!840196))

(assert (= (and b!840196 res!571215) b!840198))

(assert (= (and b!840198 res!571211) b!840202))

(assert (= (and b!840202 res!571216) b!840205))

(assert (= (and b!840205 res!571210) b!840195))

(assert (= (and b!840195 c!91312) b!840200))

(assert (= (and b!840195 (not c!91312)) b!840201))

(assert (= (or b!840200 b!840201) bm!37136))

(assert (= (or b!840200 b!840201) bm!37135))

(assert (= (and b!840206 condMapEmpty!24851) mapIsEmpty!24851))

(assert (= (and b!840206 (not condMapEmpty!24851)) mapNonEmpty!24851))

(get-info :version)

(assert (= (and mapNonEmpty!24851 ((_ is ValueCellFull!7311) mapValue!24851)) b!840199))

(assert (= (and b!840206 ((_ is ValueCellFull!7311) mapDefault!24851)) b!840203))

(assert (= start!72450 b!840206))

(declare-fun m!784049 () Bool)

(assert (=> bm!37136 m!784049))

(declare-fun m!784051 () Bool)

(assert (=> bm!37136 m!784051))

(declare-fun m!784053 () Bool)

(assert (=> bm!37135 m!784053))

(declare-fun m!784055 () Bool)

(assert (=> b!840194 m!784055))

(declare-fun m!784057 () Bool)

(assert (=> b!840200 m!784057))

(declare-fun m!784059 () Bool)

(assert (=> b!840205 m!784059))

(declare-fun m!784061 () Bool)

(assert (=> b!840197 m!784061))

(declare-fun m!784063 () Bool)

(assert (=> b!840202 m!784063))

(declare-fun m!784065 () Bool)

(assert (=> b!840195 m!784065))

(declare-fun m!784067 () Bool)

(assert (=> start!72450 m!784067))

(declare-fun m!784069 () Bool)

(assert (=> start!72450 m!784069))

(declare-fun m!784071 () Bool)

(assert (=> mapNonEmpty!24851 m!784071))

(declare-fun m!784073 () Bool)

(assert (=> b!840196 m!784073))

(check-sat (not b!840195) (not bm!37135) (not b!840200) (not b!840197) (not bm!37136) (not b!840202) tp_is_empty!15501 (not b!840194) (not b_next!13635) (not mapNonEmpty!24851) b_and!22721 (not b!840196) (not start!72450))
(check-sat b_and!22721 (not b_next!13635))
