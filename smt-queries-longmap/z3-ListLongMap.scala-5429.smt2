; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72340 () Bool)

(assert start!72340)

(declare-fun b_free!13543 () Bool)

(declare-fun b_next!13543 () Bool)

(assert (=> start!72340 (= b_free!13543 (not b_next!13543))))

(declare-fun tp!47729 () Bool)

(declare-fun b_and!22603 () Bool)

(assert (=> start!72340 (= tp!47729 b_and!22603)))

(declare-fun b!838161 () Bool)

(declare-fun e!467854 () Bool)

(declare-fun e!467855 () Bool)

(declare-fun mapRes!24713 () Bool)

(assert (=> b!838161 (= e!467854 (and e!467855 mapRes!24713))))

(declare-fun condMapEmpty!24713 () Bool)

(declare-datatypes ((V!25593 0))(
  ( (V!25594 (val!7752 Int)) )
))
(declare-datatypes ((ValueCell!7265 0))(
  ( (ValueCellFull!7265 (v!10171 V!25593)) (EmptyCell!7265) )
))
(declare-datatypes ((array!47079 0))(
  ( (array!47080 (arr!22571 (Array (_ BitVec 32) ValueCell!7265)) (size!23013 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47079)

(declare-fun mapDefault!24713 () ValueCell!7265)

(assert (=> b!838161 (= condMapEmpty!24713 (= (arr!22571 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7265)) mapDefault!24713)))))

(declare-fun b!838162 () Bool)

(declare-fun e!467851 () Bool)

(declare-datatypes ((tuple2!10262 0))(
  ( (tuple2!10263 (_1!5142 (_ BitVec 64)) (_2!5142 V!25593)) )
))
(declare-datatypes ((List!16058 0))(
  ( (Nil!16055) (Cons!16054 (h!17185 tuple2!10262) (t!22420 List!16058)) )
))
(declare-datatypes ((ListLongMap!9021 0))(
  ( (ListLongMap!9022 (toList!4526 List!16058)) )
))
(declare-fun call!36836 () ListLongMap!9021)

(declare-fun call!36837 () ListLongMap!9021)

(assert (=> b!838162 (= e!467851 (= call!36836 call!36837))))

(declare-fun mapNonEmpty!24713 () Bool)

(declare-fun tp!47728 () Bool)

(declare-fun e!467856 () Bool)

(assert (=> mapNonEmpty!24713 (= mapRes!24713 (and tp!47728 e!467856))))

(declare-fun mapRest!24713 () (Array (_ BitVec 32) ValueCell!7265))

(declare-fun mapValue!24713 () ValueCell!7265)

(declare-fun mapKey!24713 () (_ BitVec 32))

(assert (=> mapNonEmpty!24713 (= (arr!22571 _values!688) (store mapRest!24713 mapKey!24713 mapValue!24713))))

(declare-fun mapIsEmpty!24713 () Bool)

(assert (=> mapIsEmpty!24713 mapRes!24713))

(declare-fun res!570000 () Bool)

(declare-fun e!467853 () Bool)

(assert (=> start!72340 (=> (not res!570000) (not e!467853))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47081 0))(
  ( (array!47082 (arr!22572 (Array (_ BitVec 32) (_ BitVec 64))) (size!23014 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47081)

(assert (=> start!72340 (= res!570000 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23014 _keys!868))))))

(assert (=> start!72340 e!467853))

(declare-fun tp_is_empty!15409 () Bool)

(assert (=> start!72340 tp_is_empty!15409))

(assert (=> start!72340 true))

(assert (=> start!72340 tp!47729))

(declare-fun array_inv!18050 (array!47081) Bool)

(assert (=> start!72340 (array_inv!18050 _keys!868)))

(declare-fun array_inv!18051 (array!47079) Bool)

(assert (=> start!72340 (and (array_inv!18051 _values!688) e!467854)))

(declare-fun b!838163 () Bool)

(declare-fun res!569997 () Bool)

(assert (=> b!838163 (=> (not res!569997) (not e!467853))))

(declare-datatypes ((List!16059 0))(
  ( (Nil!16056) (Cons!16055 (h!17186 (_ BitVec 64)) (t!22421 List!16059)) )
))
(declare-fun arrayNoDuplicates!0 (array!47081 (_ BitVec 32) List!16059) Bool)

(assert (=> b!838163 (= res!569997 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16056))))

(declare-fun b!838164 () Bool)

(declare-fun res!569998 () Bool)

(assert (=> b!838164 (=> (not res!569998) (not e!467853))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838164 (= res!569998 (validMask!0 mask!1196))))

(declare-fun v!557 () V!25593)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!838165 () Bool)

(declare-fun +!2029 (ListLongMap!9021 tuple2!10262) ListLongMap!9021)

(assert (=> b!838165 (= e!467851 (= call!36836 (+!2029 call!36837 (tuple2!10263 k0!854 v!557))))))

(declare-fun bm!36833 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25593)

(declare-fun zeroValue!654 () V!25593)

(declare-fun getCurrentListMapNoExtraKeys!2546 (array!47081 array!47079 (_ BitVec 32) (_ BitVec 32) V!25593 V!25593 (_ BitVec 32) Int) ListLongMap!9021)

(assert (=> bm!36833 (= call!36837 (getCurrentListMapNoExtraKeys!2546 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838166 () Bool)

(assert (=> b!838166 (= e!467855 tp_is_empty!15409)))

(declare-fun b!838167 () Bool)

(assert (=> b!838167 (= e!467853 (not true))))

(assert (=> b!838167 e!467851))

(declare-fun c!91109 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838167 (= c!91109 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28737 0))(
  ( (Unit!28738) )
))
(declare-fun lt!380444 () Unit!28737)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!243 (array!47081 array!47079 (_ BitVec 32) (_ BitVec 32) V!25593 V!25593 (_ BitVec 32) (_ BitVec 64) V!25593 (_ BitVec 32) Int) Unit!28737)

(assert (=> b!838167 (= lt!380444 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838168 () Bool)

(declare-fun res!569996 () Bool)

(assert (=> b!838168 (=> (not res!569996) (not e!467853))))

(assert (=> b!838168 (= res!569996 (and (= (select (arr!22572 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23014 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!36834 () Bool)

(assert (=> bm!36834 (= call!36836 (getCurrentListMapNoExtraKeys!2546 _keys!868 (array!47080 (store (arr!22571 _values!688) i!612 (ValueCellFull!7265 v!557)) (size!23013 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838169 () Bool)

(assert (=> b!838169 (= e!467856 tp_is_empty!15409)))

(declare-fun b!838170 () Bool)

(declare-fun res!570001 () Bool)

(assert (=> b!838170 (=> (not res!570001) (not e!467853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838170 (= res!570001 (validKeyInArray!0 k0!854))))

(declare-fun b!838171 () Bool)

(declare-fun res!570002 () Bool)

(assert (=> b!838171 (=> (not res!570002) (not e!467853))))

(assert (=> b!838171 (= res!570002 (and (= (size!23013 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23014 _keys!868) (size!23013 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838172 () Bool)

(declare-fun res!570003 () Bool)

(assert (=> b!838172 (=> (not res!570003) (not e!467853))))

(assert (=> b!838172 (= res!570003 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23014 _keys!868))))))

(declare-fun b!838173 () Bool)

(declare-fun res!569999 () Bool)

(assert (=> b!838173 (=> (not res!569999) (not e!467853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47081 (_ BitVec 32)) Bool)

(assert (=> b!838173 (= res!569999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72340 res!570000) b!838164))

(assert (= (and b!838164 res!569998) b!838171))

(assert (= (and b!838171 res!570002) b!838173))

(assert (= (and b!838173 res!569999) b!838163))

(assert (= (and b!838163 res!569997) b!838172))

(assert (= (and b!838172 res!570003) b!838170))

(assert (= (and b!838170 res!570001) b!838168))

(assert (= (and b!838168 res!569996) b!838167))

(assert (= (and b!838167 c!91109) b!838165))

(assert (= (and b!838167 (not c!91109)) b!838162))

(assert (= (or b!838165 b!838162) bm!36834))

(assert (= (or b!838165 b!838162) bm!36833))

(assert (= (and b!838161 condMapEmpty!24713) mapIsEmpty!24713))

(assert (= (and b!838161 (not condMapEmpty!24713)) mapNonEmpty!24713))

(get-info :version)

(assert (= (and mapNonEmpty!24713 ((_ is ValueCellFull!7265) mapValue!24713)) b!838169))

(assert (= (and b!838161 ((_ is ValueCellFull!7265) mapDefault!24713)) b!838166))

(assert (= start!72340 b!838161))

(declare-fun m!782099 () Bool)

(assert (=> b!838170 m!782099))

(declare-fun m!782101 () Bool)

(assert (=> b!838163 m!782101))

(declare-fun m!782103 () Bool)

(assert (=> bm!36834 m!782103))

(declare-fun m!782105 () Bool)

(assert (=> bm!36834 m!782105))

(declare-fun m!782107 () Bool)

(assert (=> b!838167 m!782107))

(declare-fun m!782109 () Bool)

(assert (=> mapNonEmpty!24713 m!782109))

(declare-fun m!782111 () Bool)

(assert (=> b!838173 m!782111))

(declare-fun m!782113 () Bool)

(assert (=> b!838164 m!782113))

(declare-fun m!782115 () Bool)

(assert (=> bm!36833 m!782115))

(declare-fun m!782117 () Bool)

(assert (=> b!838165 m!782117))

(declare-fun m!782119 () Bool)

(assert (=> start!72340 m!782119))

(declare-fun m!782121 () Bool)

(assert (=> start!72340 m!782121))

(declare-fun m!782123 () Bool)

(assert (=> b!838168 m!782123))

(check-sat (not b!838173) (not b_next!13543) (not b!838165) (not start!72340) (not b!838163) (not b!838164) (not bm!36834) (not mapNonEmpty!24713) (not b!838170) tp_is_empty!15409 (not bm!36833) (not b!838167) b_and!22603)
(check-sat b_and!22603 (not b_next!13543))
