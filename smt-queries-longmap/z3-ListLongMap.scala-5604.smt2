; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73410 () Bool)

(assert start!73410)

(declare-fun b_free!14325 () Bool)

(declare-fun b_next!14325 () Bool)

(assert (=> start!73410 (= b_free!14325 (not b_next!14325))))

(declare-fun tp!50479 () Bool)

(declare-fun b_and!23681 () Bool)

(assert (=> start!73410 (= tp!50479 b_and!23681)))

(declare-fun b!856974 () Bool)

(declare-fun e!477665 () Bool)

(declare-fun tp_is_empty!16461 () Bool)

(assert (=> b!856974 (= e!477665 tp_is_empty!16461)))

(declare-fun b!856975 () Bool)

(declare-fun e!477667 () Bool)

(assert (=> b!856975 (= e!477667 (not true))))

(declare-datatypes ((V!26995 0))(
  ( (V!26996 (val!8278 Int)) )
))
(declare-datatypes ((ValueCell!7791 0))(
  ( (ValueCellFull!7791 (v!10703 V!26995)) (EmptyCell!7791) )
))
(declare-datatypes ((array!49114 0))(
  ( (array!49115 (arr!23588 (Array (_ BitVec 32) ValueCell!7791)) (size!24028 (_ BitVec 32))) )
))
(declare-fun lt!386134 () array!49114)

(declare-fun v!557 () V!26995)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49116 0))(
  ( (array!49117 (arr!23589 (Array (_ BitVec 32) (_ BitVec 64))) (size!24029 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49116)

(declare-fun _values!688 () array!49114)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26995)

(declare-fun zeroValue!654 () V!26995)

(declare-datatypes ((tuple2!10920 0))(
  ( (tuple2!10921 (_1!5471 (_ BitVec 64)) (_2!5471 V!26995)) )
))
(declare-datatypes ((List!16729 0))(
  ( (Nil!16726) (Cons!16725 (h!17856 tuple2!10920) (t!23370 List!16729)) )
))
(declare-datatypes ((ListLongMap!9689 0))(
  ( (ListLongMap!9690 (toList!4860 List!16729)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2841 (array!49116 array!49114 (_ BitVec 32) (_ BitVec 32) V!26995 V!26995 (_ BitVec 32) Int) ListLongMap!9689)

(declare-fun +!2214 (ListLongMap!9689 tuple2!10920) ListLongMap!9689)

(assert (=> b!856975 (= (getCurrentListMapNoExtraKeys!2841 _keys!868 lt!386134 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2214 (getCurrentListMapNoExtraKeys!2841 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10921 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29215 0))(
  ( (Unit!29216) )
))
(declare-fun lt!386136 () Unit!29215)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!435 (array!49116 array!49114 (_ BitVec 32) (_ BitVec 32) V!26995 V!26995 (_ BitVec 32) (_ BitVec 64) V!26995 (_ BitVec 32) Int) Unit!29215)

(assert (=> b!856975 (= lt!386136 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!435 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856976 () Bool)

(declare-fun e!477670 () Bool)

(declare-fun e!477668 () Bool)

(declare-fun mapRes!26291 () Bool)

(assert (=> b!856976 (= e!477670 (and e!477668 mapRes!26291))))

(declare-fun condMapEmpty!26291 () Bool)

(declare-fun mapDefault!26291 () ValueCell!7791)

(assert (=> b!856976 (= condMapEmpty!26291 (= (arr!23588 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7791)) mapDefault!26291)))))

(declare-fun b!856977 () Bool)

(declare-fun res!582104 () Bool)

(declare-fun e!477669 () Bool)

(assert (=> b!856977 (=> (not res!582104) (not e!477669))))

(assert (=> b!856977 (= res!582104 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24029 _keys!868))))))

(declare-fun res!582098 () Bool)

(assert (=> start!73410 (=> (not res!582098) (not e!477669))))

(assert (=> start!73410 (= res!582098 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24029 _keys!868))))))

(assert (=> start!73410 e!477669))

(assert (=> start!73410 tp_is_empty!16461))

(assert (=> start!73410 true))

(assert (=> start!73410 tp!50479))

(declare-fun array_inv!18680 (array!49116) Bool)

(assert (=> start!73410 (array_inv!18680 _keys!868)))

(declare-fun array_inv!18681 (array!49114) Bool)

(assert (=> start!73410 (and (array_inv!18681 _values!688) e!477670)))

(declare-fun b!856978 () Bool)

(assert (=> b!856978 (= e!477668 tp_is_empty!16461)))

(declare-fun mapNonEmpty!26291 () Bool)

(declare-fun tp!50478 () Bool)

(assert (=> mapNonEmpty!26291 (= mapRes!26291 (and tp!50478 e!477665))))

(declare-fun mapKey!26291 () (_ BitVec 32))

(declare-fun mapRest!26291 () (Array (_ BitVec 32) ValueCell!7791))

(declare-fun mapValue!26291 () ValueCell!7791)

(assert (=> mapNonEmpty!26291 (= (arr!23588 _values!688) (store mapRest!26291 mapKey!26291 mapValue!26291))))

(declare-fun b!856979 () Bool)

(declare-fun res!582100 () Bool)

(assert (=> b!856979 (=> (not res!582100) (not e!477669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49116 (_ BitVec 32)) Bool)

(assert (=> b!856979 (= res!582100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856980 () Bool)

(declare-fun res!582099 () Bool)

(assert (=> b!856980 (=> (not res!582099) (not e!477669))))

(assert (=> b!856980 (= res!582099 (and (= (select (arr!23589 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856981 () Bool)

(declare-fun res!582096 () Bool)

(assert (=> b!856981 (=> (not res!582096) (not e!477669))))

(declare-datatypes ((List!16730 0))(
  ( (Nil!16727) (Cons!16726 (h!17857 (_ BitVec 64)) (t!23371 List!16730)) )
))
(declare-fun arrayNoDuplicates!0 (array!49116 (_ BitVec 32) List!16730) Bool)

(assert (=> b!856981 (= res!582096 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16727))))

(declare-fun mapIsEmpty!26291 () Bool)

(assert (=> mapIsEmpty!26291 mapRes!26291))

(declare-fun b!856982 () Bool)

(assert (=> b!856982 (= e!477669 e!477667)))

(declare-fun res!582097 () Bool)

(assert (=> b!856982 (=> (not res!582097) (not e!477667))))

(assert (=> b!856982 (= res!582097 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386135 () ListLongMap!9689)

(assert (=> b!856982 (= lt!386135 (getCurrentListMapNoExtraKeys!2841 _keys!868 lt!386134 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856982 (= lt!386134 (array!49115 (store (arr!23588 _values!688) i!612 (ValueCellFull!7791 v!557)) (size!24028 _values!688)))))

(declare-fun lt!386137 () ListLongMap!9689)

(assert (=> b!856982 (= lt!386137 (getCurrentListMapNoExtraKeys!2841 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856983 () Bool)

(declare-fun res!582103 () Bool)

(assert (=> b!856983 (=> (not res!582103) (not e!477669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856983 (= res!582103 (validMask!0 mask!1196))))

(declare-fun b!856984 () Bool)

(declare-fun res!582102 () Bool)

(assert (=> b!856984 (=> (not res!582102) (not e!477669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856984 (= res!582102 (validKeyInArray!0 k0!854))))

(declare-fun b!856985 () Bool)

(declare-fun res!582101 () Bool)

(assert (=> b!856985 (=> (not res!582101) (not e!477669))))

(assert (=> b!856985 (= res!582101 (and (= (size!24028 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24029 _keys!868) (size!24028 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73410 res!582098) b!856983))

(assert (= (and b!856983 res!582103) b!856985))

(assert (= (and b!856985 res!582101) b!856979))

(assert (= (and b!856979 res!582100) b!856981))

(assert (= (and b!856981 res!582096) b!856977))

(assert (= (and b!856977 res!582104) b!856984))

(assert (= (and b!856984 res!582102) b!856980))

(assert (= (and b!856980 res!582099) b!856982))

(assert (= (and b!856982 res!582097) b!856975))

(assert (= (and b!856976 condMapEmpty!26291) mapIsEmpty!26291))

(assert (= (and b!856976 (not condMapEmpty!26291)) mapNonEmpty!26291))

(get-info :version)

(assert (= (and mapNonEmpty!26291 ((_ is ValueCellFull!7791) mapValue!26291)) b!856974))

(assert (= (and b!856976 ((_ is ValueCellFull!7791) mapDefault!26291)) b!856978))

(assert (= start!73410 b!856976))

(declare-fun m!797831 () Bool)

(assert (=> b!856975 m!797831))

(declare-fun m!797833 () Bool)

(assert (=> b!856975 m!797833))

(assert (=> b!856975 m!797833))

(declare-fun m!797835 () Bool)

(assert (=> b!856975 m!797835))

(declare-fun m!797837 () Bool)

(assert (=> b!856975 m!797837))

(declare-fun m!797839 () Bool)

(assert (=> b!856980 m!797839))

(declare-fun m!797841 () Bool)

(assert (=> b!856979 m!797841))

(declare-fun m!797843 () Bool)

(assert (=> b!856983 m!797843))

(declare-fun m!797845 () Bool)

(assert (=> mapNonEmpty!26291 m!797845))

(declare-fun m!797847 () Bool)

(assert (=> b!856982 m!797847))

(declare-fun m!797849 () Bool)

(assert (=> b!856982 m!797849))

(declare-fun m!797851 () Bool)

(assert (=> b!856982 m!797851))

(declare-fun m!797853 () Bool)

(assert (=> b!856984 m!797853))

(declare-fun m!797855 () Bool)

(assert (=> start!73410 m!797855))

(declare-fun m!797857 () Bool)

(assert (=> start!73410 m!797857))

(declare-fun m!797859 () Bool)

(assert (=> b!856981 m!797859))

(check-sat (not start!73410) (not b_next!14325) (not b!856979) (not b!856983) (not b!856982) (not b!856981) b_and!23681 (not b!856975) (not mapNonEmpty!26291) tp_is_empty!16461 (not b!856984))
(check-sat b_and!23681 (not b_next!14325))
