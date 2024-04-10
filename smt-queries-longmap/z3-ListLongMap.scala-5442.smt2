; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72438 () Bool)

(assert start!72438)

(declare-fun b_free!13623 () Bool)

(declare-fun b_next!13623 () Bool)

(assert (=> start!72438 (= b_free!13623 (not b_next!13623))))

(declare-fun tp!47968 () Bool)

(declare-fun b_and!22709 () Bool)

(assert (=> start!72438 (= tp!47968 b_and!22709)))

(declare-fun b!839960 () Bool)

(declare-fun e!468723 () Bool)

(declare-fun tp_is_empty!15489 () Bool)

(assert (=> b!839960 (= e!468723 tp_is_empty!15489)))

(declare-fun b!839961 () Bool)

(declare-fun res!571066 () Bool)

(declare-fun e!468722 () Bool)

(assert (=> b!839961 (=> (not res!571066) (not e!468722))))

(declare-datatypes ((array!47260 0))(
  ( (array!47261 (arr!22661 (Array (_ BitVec 32) (_ BitVec 64))) (size!23101 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47260)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47260 (_ BitVec 32)) Bool)

(assert (=> b!839961 (= res!571066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!25699 0))(
  ( (V!25700 (val!7792 Int)) )
))
(declare-fun v!557 () V!25699)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!10322 0))(
  ( (tuple2!10323 (_1!5172 (_ BitVec 64)) (_2!5172 V!25699)) )
))
(declare-datatypes ((List!16117 0))(
  ( (Nil!16114) (Cons!16113 (h!17244 tuple2!10322) (t!22488 List!16117)) )
))
(declare-datatypes ((ListLongMap!9091 0))(
  ( (ListLongMap!9092 (toList!4561 List!16117)) )
))
(declare-fun call!37103 () ListLongMap!9091)

(declare-fun e!468724 () Bool)

(declare-fun call!37102 () ListLongMap!9091)

(declare-fun b!839962 () Bool)

(declare-fun +!2031 (ListLongMap!9091 tuple2!10322) ListLongMap!9091)

(assert (=> b!839962 (= e!468724 (= call!37102 (+!2031 call!37103 (tuple2!10323 k0!854 v!557))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37099 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7305 0))(
  ( (ValueCellFull!7305 (v!10217 V!25699)) (EmptyCell!7305) )
))
(declare-datatypes ((array!47262 0))(
  ( (array!47263 (arr!22662 (Array (_ BitVec 32) ValueCell!7305)) (size!23102 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47262)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25699)

(declare-fun zeroValue!654 () V!25699)

(declare-fun getCurrentListMapNoExtraKeys!2549 (array!47260 array!47262 (_ BitVec 32) (_ BitVec 32) V!25699 V!25699 (_ BitVec 32) Int) ListLongMap!9091)

(assert (=> bm!37099 (= call!37103 (getCurrentListMapNoExtraKeys!2549 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24833 () Bool)

(declare-fun mapRes!24833 () Bool)

(declare-fun tp!47967 () Bool)

(assert (=> mapNonEmpty!24833 (= mapRes!24833 (and tp!47967 e!468723))))

(declare-fun mapRest!24833 () (Array (_ BitVec 32) ValueCell!7305))

(declare-fun mapValue!24833 () ValueCell!7305)

(declare-fun mapKey!24833 () (_ BitVec 32))

(assert (=> mapNonEmpty!24833 (= (arr!22662 _values!688) (store mapRest!24833 mapKey!24833 mapValue!24833))))

(declare-fun mapIsEmpty!24833 () Bool)

(assert (=> mapIsEmpty!24833 mapRes!24833))

(declare-fun bm!37100 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> bm!37100 (= call!37102 (getCurrentListMapNoExtraKeys!2549 _keys!868 (array!47263 (store (arr!22662 _values!688) i!612 (ValueCellFull!7305 v!557)) (size!23102 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839963 () Bool)

(declare-fun e!468721 () Bool)

(declare-fun e!468719 () Bool)

(assert (=> b!839963 (= e!468721 (and e!468719 mapRes!24833))))

(declare-fun condMapEmpty!24833 () Bool)

(declare-fun mapDefault!24833 () ValueCell!7305)

(assert (=> b!839963 (= condMapEmpty!24833 (= (arr!22662 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7305)) mapDefault!24833)))))

(declare-fun b!839964 () Bool)

(assert (=> b!839964 (= e!468719 tp_is_empty!15489)))

(declare-fun b!839965 () Bool)

(declare-fun res!571071 () Bool)

(assert (=> b!839965 (=> (not res!571071) (not e!468722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839965 (= res!571071 (validKeyInArray!0 k0!854))))

(declare-fun b!839966 () Bool)

(declare-fun res!571067 () Bool)

(assert (=> b!839966 (=> (not res!571067) (not e!468722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839966 (= res!571067 (validMask!0 mask!1196))))

(declare-fun b!839967 () Bool)

(declare-fun res!571068 () Bool)

(assert (=> b!839967 (=> (not res!571068) (not e!468722))))

(assert (=> b!839967 (= res!571068 (and (= (size!23102 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23101 _keys!868) (size!23102 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!571069 () Bool)

(assert (=> start!72438 (=> (not res!571069) (not e!468722))))

(assert (=> start!72438 (= res!571069 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23101 _keys!868))))))

(assert (=> start!72438 e!468722))

(assert (=> start!72438 tp_is_empty!15489))

(assert (=> start!72438 true))

(assert (=> start!72438 tp!47968))

(declare-fun array_inv!18046 (array!47260) Bool)

(assert (=> start!72438 (array_inv!18046 _keys!868)))

(declare-fun array_inv!18047 (array!47262) Bool)

(assert (=> start!72438 (and (array_inv!18047 _values!688) e!468721)))

(declare-fun b!839968 () Bool)

(assert (=> b!839968 (= e!468722 (not true))))

(assert (=> b!839968 e!468724))

(declare-fun c!91294 () Bool)

(assert (=> b!839968 (= c!91294 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28847 0))(
  ( (Unit!28848) )
))
(declare-fun lt!380800 () Unit!28847)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!269 (array!47260 array!47262 (_ BitVec 32) (_ BitVec 32) V!25699 V!25699 (_ BitVec 32) (_ BitVec 64) V!25699 (_ BitVec 32) Int) Unit!28847)

(assert (=> b!839968 (= lt!380800 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839969 () Bool)

(declare-fun res!571073 () Bool)

(assert (=> b!839969 (=> (not res!571073) (not e!468722))))

(assert (=> b!839969 (= res!571073 (and (= (select (arr!22661 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23101 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839970 () Bool)

(assert (=> b!839970 (= e!468724 (= call!37102 call!37103))))

(declare-fun b!839971 () Bool)

(declare-fun res!571072 () Bool)

(assert (=> b!839971 (=> (not res!571072) (not e!468722))))

(declare-datatypes ((List!16118 0))(
  ( (Nil!16115) (Cons!16114 (h!17245 (_ BitVec 64)) (t!22489 List!16118)) )
))
(declare-fun arrayNoDuplicates!0 (array!47260 (_ BitVec 32) List!16118) Bool)

(assert (=> b!839971 (= res!571072 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16115))))

(declare-fun b!839972 () Bool)

(declare-fun res!571070 () Bool)

(assert (=> b!839972 (=> (not res!571070) (not e!468722))))

(assert (=> b!839972 (= res!571070 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23101 _keys!868))))))

(assert (= (and start!72438 res!571069) b!839966))

(assert (= (and b!839966 res!571067) b!839967))

(assert (= (and b!839967 res!571068) b!839961))

(assert (= (and b!839961 res!571066) b!839971))

(assert (= (and b!839971 res!571072) b!839972))

(assert (= (and b!839972 res!571070) b!839965))

(assert (= (and b!839965 res!571071) b!839969))

(assert (= (and b!839969 res!571073) b!839968))

(assert (= (and b!839968 c!91294) b!839962))

(assert (= (and b!839968 (not c!91294)) b!839970))

(assert (= (or b!839962 b!839970) bm!37100))

(assert (= (or b!839962 b!839970) bm!37099))

(assert (= (and b!839963 condMapEmpty!24833) mapIsEmpty!24833))

(assert (= (and b!839963 (not condMapEmpty!24833)) mapNonEmpty!24833))

(get-info :version)

(assert (= (and mapNonEmpty!24833 ((_ is ValueCellFull!7305) mapValue!24833)) b!839960))

(assert (= (and b!839963 ((_ is ValueCellFull!7305) mapDefault!24833)) b!839964))

(assert (= start!72438 b!839963))

(declare-fun m!783893 () Bool)

(assert (=> b!839965 m!783893))

(declare-fun m!783895 () Bool)

(assert (=> b!839961 m!783895))

(declare-fun m!783897 () Bool)

(assert (=> start!72438 m!783897))

(declare-fun m!783899 () Bool)

(assert (=> start!72438 m!783899))

(declare-fun m!783901 () Bool)

(assert (=> b!839971 m!783901))

(declare-fun m!783903 () Bool)

(assert (=> bm!37100 m!783903))

(declare-fun m!783905 () Bool)

(assert (=> bm!37100 m!783905))

(declare-fun m!783907 () Bool)

(assert (=> b!839966 m!783907))

(declare-fun m!783909 () Bool)

(assert (=> b!839969 m!783909))

(declare-fun m!783911 () Bool)

(assert (=> b!839962 m!783911))

(declare-fun m!783913 () Bool)

(assert (=> mapNonEmpty!24833 m!783913))

(declare-fun m!783915 () Bool)

(assert (=> b!839968 m!783915))

(declare-fun m!783917 () Bool)

(assert (=> bm!37099 m!783917))

(check-sat b_and!22709 (not b!839961) (not b!839962) (not bm!37099) (not bm!37100) (not b!839971) (not b!839965) tp_is_empty!15489 (not mapNonEmpty!24833) (not b!839968) (not b!839966) (not b_next!13623) (not start!72438))
(check-sat b_and!22709 (not b_next!13623))
