; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73240 () Bool)

(assert start!73240)

(declare-fun b_free!14173 () Bool)

(declare-fun b_next!14173 () Bool)

(assert (=> start!73240 (= b_free!14173 (not b_next!14173))))

(declare-fun tp!50023 () Bool)

(declare-fun b_and!23479 () Bool)

(assert (=> start!73240 (= tp!50023 b_and!23479)))

(declare-fun mapIsEmpty!26063 () Bool)

(declare-fun mapRes!26063 () Bool)

(assert (=> mapIsEmpty!26063 mapRes!26063))

(declare-fun b!853981 () Bool)

(declare-fun e!476189 () Bool)

(declare-fun e!476192 () Bool)

(assert (=> b!853981 (= e!476189 e!476192)))

(declare-fun res!580009 () Bool)

(assert (=> b!853981 (=> (not res!580009) (not e!476192))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853981 (= res!580009 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48801 0))(
  ( (array!48802 (arr!23432 (Array (_ BitVec 32) (_ BitVec 64))) (size!23874 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48801)

(declare-datatypes ((V!26793 0))(
  ( (V!26794 (val!8202 Int)) )
))
(declare-fun minValue!654 () V!26793)

(declare-fun zeroValue!654 () V!26793)

(declare-datatypes ((tuple2!10810 0))(
  ( (tuple2!10811 (_1!5416 (_ BitVec 64)) (_2!5416 V!26793)) )
))
(declare-datatypes ((List!16626 0))(
  ( (Nil!16623) (Cons!16622 (h!17753 tuple2!10810) (t!23236 List!16626)) )
))
(declare-datatypes ((ListLongMap!9569 0))(
  ( (ListLongMap!9570 (toList!4800 List!16626)) )
))
(declare-fun lt!384999 () ListLongMap!9569)

(declare-datatypes ((ValueCell!7715 0))(
  ( (ValueCellFull!7715 (v!10621 V!26793)) (EmptyCell!7715) )
))
(declare-datatypes ((array!48803 0))(
  ( (array!48804 (arr!23433 (Array (_ BitVec 32) ValueCell!7715)) (size!23875 (_ BitVec 32))) )
))
(declare-fun lt!385007 () array!48803)

(declare-fun getCurrentListMapNoExtraKeys!2807 (array!48801 array!48803 (_ BitVec 32) (_ BitVec 32) V!26793 V!26793 (_ BitVec 32) Int) ListLongMap!9569)

(assert (=> b!853981 (= lt!384999 (getCurrentListMapNoExtraKeys!2807 _keys!868 lt!385007 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26793)

(declare-fun _values!688 () array!48803)

(assert (=> b!853981 (= lt!385007 (array!48804 (store (arr!23433 _values!688) i!612 (ValueCellFull!7715 v!557)) (size!23875 _values!688)))))

(declare-fun lt!385001 () ListLongMap!9569)

(assert (=> b!853981 (= lt!385001 (getCurrentListMapNoExtraKeys!2807 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853982 () Bool)

(declare-fun res!580015 () Bool)

(assert (=> b!853982 (=> (not res!580015) (not e!476189))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853982 (= res!580015 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26063 () Bool)

(declare-fun tp!50024 () Bool)

(declare-fun e!476195 () Bool)

(assert (=> mapNonEmpty!26063 (= mapRes!26063 (and tp!50024 e!476195))))

(declare-fun mapValue!26063 () ValueCell!7715)

(declare-fun mapRest!26063 () (Array (_ BitVec 32) ValueCell!7715))

(declare-fun mapKey!26063 () (_ BitVec 32))

(assert (=> mapNonEmpty!26063 (= (arr!23433 _values!688) (store mapRest!26063 mapKey!26063 mapValue!26063))))

(declare-fun b!853983 () Bool)

(declare-fun e!476194 () Bool)

(declare-fun tp_is_empty!16309 () Bool)

(assert (=> b!853983 (= e!476194 tp_is_empty!16309)))

(declare-fun b!853984 () Bool)

(declare-fun res!580011 () Bool)

(assert (=> b!853984 (=> (not res!580011) (not e!476189))))

(assert (=> b!853984 (= res!580011 (and (= (select (arr!23432 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853985 () Bool)

(declare-fun res!580010 () Bool)

(assert (=> b!853985 (=> (not res!580010) (not e!476189))))

(assert (=> b!853985 (= res!580010 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23874 _keys!868))))))

(declare-fun b!853986 () Bool)

(declare-fun res!580012 () Bool)

(assert (=> b!853986 (=> (not res!580012) (not e!476189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48801 (_ BitVec 32)) Bool)

(assert (=> b!853986 (= res!580012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!580013 () Bool)

(assert (=> start!73240 (=> (not res!580013) (not e!476189))))

(assert (=> start!73240 (= res!580013 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23874 _keys!868))))))

(assert (=> start!73240 e!476189))

(assert (=> start!73240 tp_is_empty!16309))

(assert (=> start!73240 true))

(assert (=> start!73240 tp!50023))

(declare-fun array_inv!18654 (array!48801) Bool)

(assert (=> start!73240 (array_inv!18654 _keys!868)))

(declare-fun e!476193 () Bool)

(declare-fun array_inv!18655 (array!48803) Bool)

(assert (=> start!73240 (and (array_inv!18655 _values!688) e!476193)))

(declare-fun call!38349 () ListLongMap!9569)

(declare-fun b!853987 () Bool)

(declare-fun call!38348 () ListLongMap!9569)

(declare-fun e!476196 () Bool)

(declare-fun +!2209 (ListLongMap!9569 tuple2!10810) ListLongMap!9569)

(assert (=> b!853987 (= e!476196 (= call!38349 (+!2209 call!38348 (tuple2!10811 k0!854 v!557))))))

(declare-fun b!853988 () Bool)

(declare-fun e!476190 () Bool)

(assert (=> b!853988 (= e!476190 true)))

(declare-fun lt!385006 () tuple2!10810)

(declare-fun lt!384998 () ListLongMap!9569)

(declare-fun lt!385000 () V!26793)

(assert (=> b!853988 (= (+!2209 lt!384998 lt!385006) (+!2209 (+!2209 lt!384998 (tuple2!10811 k0!854 lt!385000)) lt!385006))))

(declare-fun lt!385002 () V!26793)

(assert (=> b!853988 (= lt!385006 (tuple2!10811 k0!854 lt!385002))))

(declare-datatypes ((Unit!29091 0))(
  ( (Unit!29092) )
))
(declare-fun lt!385003 () Unit!29091)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!317 (ListLongMap!9569 (_ BitVec 64) V!26793 V!26793) Unit!29091)

(assert (=> b!853988 (= lt!385003 (addSameAsAddTwiceSameKeyDiffValues!317 lt!384998 k0!854 lt!385000 lt!385002))))

(declare-fun lt!385005 () V!26793)

(declare-fun get!12372 (ValueCell!7715 V!26793) V!26793)

(assert (=> b!853988 (= lt!385000 (get!12372 (select (arr!23433 _values!688) from!1053) lt!385005))))

(assert (=> b!853988 (= lt!384999 (+!2209 lt!384998 (tuple2!10811 (select (arr!23432 _keys!868) from!1053) lt!385002)))))

(assert (=> b!853988 (= lt!385002 (get!12372 (select (store (arr!23433 _values!688) i!612 (ValueCellFull!7715 v!557)) from!1053) lt!385005))))

(declare-fun dynLambda!1067 (Int (_ BitVec 64)) V!26793)

(assert (=> b!853988 (= lt!385005 (dynLambda!1067 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853988 (= lt!384998 (getCurrentListMapNoExtraKeys!2807 _keys!868 lt!385007 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853989 () Bool)

(assert (=> b!853989 (= e!476192 (not e!476190))))

(declare-fun res!580008 () Bool)

(assert (=> b!853989 (=> res!580008 e!476190)))

(assert (=> b!853989 (= res!580008 (not (validKeyInArray!0 (select (arr!23432 _keys!868) from!1053))))))

(assert (=> b!853989 e!476196))

(declare-fun c!91865 () Bool)

(assert (=> b!853989 (= c!91865 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!385004 () Unit!29091)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!409 (array!48801 array!48803 (_ BitVec 32) (_ BitVec 32) V!26793 V!26793 (_ BitVec 32) (_ BitVec 64) V!26793 (_ BitVec 32) Int) Unit!29091)

(assert (=> b!853989 (= lt!385004 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!409 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38345 () Bool)

(assert (=> bm!38345 (= call!38349 (getCurrentListMapNoExtraKeys!2807 _keys!868 lt!385007 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853990 () Bool)

(declare-fun res!580017 () Bool)

(assert (=> b!853990 (=> (not res!580017) (not e!476189))))

(assert (=> b!853990 (= res!580017 (and (= (size!23875 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23874 _keys!868) (size!23875 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38346 () Bool)

(assert (=> bm!38346 (= call!38348 (getCurrentListMapNoExtraKeys!2807 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853991 () Bool)

(assert (=> b!853991 (= e!476195 tp_is_empty!16309)))

(declare-fun b!853992 () Bool)

(declare-fun res!580016 () Bool)

(assert (=> b!853992 (=> (not res!580016) (not e!476189))))

(declare-datatypes ((List!16627 0))(
  ( (Nil!16624) (Cons!16623 (h!17754 (_ BitVec 64)) (t!23237 List!16627)) )
))
(declare-fun arrayNoDuplicates!0 (array!48801 (_ BitVec 32) List!16627) Bool)

(assert (=> b!853992 (= res!580016 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16624))))

(declare-fun b!853993 () Bool)

(assert (=> b!853993 (= e!476196 (= call!38349 call!38348))))

(declare-fun b!853994 () Bool)

(assert (=> b!853994 (= e!476193 (and e!476194 mapRes!26063))))

(declare-fun condMapEmpty!26063 () Bool)

(declare-fun mapDefault!26063 () ValueCell!7715)

(assert (=> b!853994 (= condMapEmpty!26063 (= (arr!23433 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7715)) mapDefault!26063)))))

(declare-fun b!853995 () Bool)

(declare-fun res!580014 () Bool)

(assert (=> b!853995 (=> (not res!580014) (not e!476189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853995 (= res!580014 (validMask!0 mask!1196))))

(assert (= (and start!73240 res!580013) b!853995))

(assert (= (and b!853995 res!580014) b!853990))

(assert (= (and b!853990 res!580017) b!853986))

(assert (= (and b!853986 res!580012) b!853992))

(assert (= (and b!853992 res!580016) b!853985))

(assert (= (and b!853985 res!580010) b!853982))

(assert (= (and b!853982 res!580015) b!853984))

(assert (= (and b!853984 res!580011) b!853981))

(assert (= (and b!853981 res!580009) b!853989))

(assert (= (and b!853989 c!91865) b!853987))

(assert (= (and b!853989 (not c!91865)) b!853993))

(assert (= (or b!853987 b!853993) bm!38345))

(assert (= (or b!853987 b!853993) bm!38346))

(assert (= (and b!853989 (not res!580008)) b!853988))

(assert (= (and b!853994 condMapEmpty!26063) mapIsEmpty!26063))

(assert (= (and b!853994 (not condMapEmpty!26063)) mapNonEmpty!26063))

(get-info :version)

(assert (= (and mapNonEmpty!26063 ((_ is ValueCellFull!7715) mapValue!26063)) b!853991))

(assert (= (and b!853994 ((_ is ValueCellFull!7715) mapDefault!26063)) b!853983))

(assert (= start!73240 b!853994))

(declare-fun b_lambda!11687 () Bool)

(assert (=> (not b_lambda!11687) (not b!853988)))

(declare-fun t!23235 () Bool)

(declare-fun tb!4467 () Bool)

(assert (=> (and start!73240 (= defaultEntry!696 defaultEntry!696) t!23235) tb!4467))

(declare-fun result!8553 () Bool)

(assert (=> tb!4467 (= result!8553 tp_is_empty!16309)))

(assert (=> b!853988 t!23235))

(declare-fun b_and!23481 () Bool)

(assert (= b_and!23479 (and (=> t!23235 result!8553) b_and!23481)))

(declare-fun m!794793 () Bool)

(assert (=> bm!38346 m!794793))

(declare-fun m!794795 () Bool)

(assert (=> mapNonEmpty!26063 m!794795))

(declare-fun m!794797 () Bool)

(assert (=> b!853992 m!794797))

(declare-fun m!794799 () Bool)

(assert (=> b!853995 m!794799))

(declare-fun m!794801 () Bool)

(assert (=> start!73240 m!794801))

(declare-fun m!794803 () Bool)

(assert (=> start!73240 m!794803))

(declare-fun m!794805 () Bool)

(assert (=> b!853984 m!794805))

(declare-fun m!794807 () Bool)

(assert (=> bm!38345 m!794807))

(declare-fun m!794809 () Bool)

(assert (=> b!853986 m!794809))

(declare-fun m!794811 () Bool)

(assert (=> b!853981 m!794811))

(declare-fun m!794813 () Bool)

(assert (=> b!853981 m!794813))

(declare-fun m!794815 () Bool)

(assert (=> b!853981 m!794815))

(declare-fun m!794817 () Bool)

(assert (=> b!853989 m!794817))

(assert (=> b!853989 m!794817))

(declare-fun m!794819 () Bool)

(assert (=> b!853989 m!794819))

(declare-fun m!794821 () Bool)

(assert (=> b!853989 m!794821))

(declare-fun m!794823 () Bool)

(assert (=> b!853988 m!794823))

(declare-fun m!794825 () Bool)

(assert (=> b!853988 m!794825))

(declare-fun m!794827 () Bool)

(assert (=> b!853988 m!794827))

(declare-fun m!794829 () Bool)

(assert (=> b!853988 m!794829))

(declare-fun m!794831 () Bool)

(assert (=> b!853988 m!794831))

(assert (=> b!853988 m!794807))

(assert (=> b!853988 m!794817))

(declare-fun m!794833 () Bool)

(assert (=> b!853988 m!794833))

(declare-fun m!794835 () Bool)

(assert (=> b!853988 m!794835))

(assert (=> b!853988 m!794823))

(declare-fun m!794837 () Bool)

(assert (=> b!853988 m!794837))

(assert (=> b!853988 m!794829))

(declare-fun m!794839 () Bool)

(assert (=> b!853988 m!794839))

(assert (=> b!853988 m!794835))

(declare-fun m!794841 () Bool)

(assert (=> b!853988 m!794841))

(assert (=> b!853988 m!794813))

(declare-fun m!794843 () Bool)

(assert (=> b!853982 m!794843))

(declare-fun m!794845 () Bool)

(assert (=> b!853987 m!794845))

(check-sat (not b_next!14173) (not b!853992) (not start!73240) (not b!853995) (not b!853981) (not bm!38346) (not b!853982) (not b!853986) (not b!853987) (not b!853988) (not b!853989) tp_is_empty!16309 (not mapNonEmpty!26063) (not b_lambda!11687) (not bm!38345) b_and!23481)
(check-sat b_and!23481 (not b_next!14173))
