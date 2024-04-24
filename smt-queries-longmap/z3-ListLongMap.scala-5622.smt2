; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73684 () Bool)

(assert start!73684)

(declare-fun b_free!14431 () Bool)

(declare-fun b_next!14431 () Bool)

(assert (=> start!73684 (= b_free!14431 (not b_next!14431))))

(declare-fun tp!50797 () Bool)

(declare-fun b_and!23851 () Bool)

(assert (=> start!73684 (= tp!50797 b_and!23851)))

(declare-fun b!859969 () Bool)

(declare-fun e!479333 () Bool)

(declare-fun e!479338 () Bool)

(assert (=> b!859969 (= e!479333 e!479338)))

(declare-fun res!584001 () Bool)

(assert (=> b!859969 (=> (not res!584001) (not e!479338))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859969 (= res!584001 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27137 0))(
  ( (V!27138 (val!8331 Int)) )
))
(declare-datatypes ((tuple2!10924 0))(
  ( (tuple2!10925 (_1!5473 (_ BitVec 64)) (_2!5473 V!27137)) )
))
(declare-datatypes ((List!16763 0))(
  ( (Nil!16760) (Cons!16759 (h!17896 tuple2!10924) (t!23452 List!16763)) )
))
(declare-datatypes ((ListLongMap!9695 0))(
  ( (ListLongMap!9696 (toList!4863 List!16763)) )
))
(declare-fun lt!387424 () ListLongMap!9695)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49363 0))(
  ( (array!49364 (arr!23708 (Array (_ BitVec 32) (_ BitVec 64))) (size!24149 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49363)

(declare-fun minValue!654 () V!27137)

(declare-fun zeroValue!654 () V!27137)

(declare-datatypes ((ValueCell!7844 0))(
  ( (ValueCellFull!7844 (v!10756 V!27137)) (EmptyCell!7844) )
))
(declare-datatypes ((array!49365 0))(
  ( (array!49366 (arr!23709 (Array (_ BitVec 32) ValueCell!7844)) (size!24150 (_ BitVec 32))) )
))
(declare-fun lt!387423 () array!49365)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2919 (array!49363 array!49365 (_ BitVec 32) (_ BitVec 32) V!27137 V!27137 (_ BitVec 32) Int) ListLongMap!9695)

(assert (=> b!859969 (= lt!387424 (getCurrentListMapNoExtraKeys!2919 _keys!868 lt!387423 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27137)

(declare-fun _values!688 () array!49365)

(assert (=> b!859969 (= lt!387423 (array!49366 (store (arr!23709 _values!688) i!612 (ValueCellFull!7844 v!557)) (size!24150 _values!688)))))

(declare-fun lt!387421 () ListLongMap!9695)

(assert (=> b!859969 (= lt!387421 (getCurrentListMapNoExtraKeys!2919 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26450 () Bool)

(declare-fun mapRes!26450 () Bool)

(assert (=> mapIsEmpty!26450 mapRes!26450))

(declare-fun mapNonEmpty!26450 () Bool)

(declare-fun tp!50798 () Bool)

(declare-fun e!479335 () Bool)

(assert (=> mapNonEmpty!26450 (= mapRes!26450 (and tp!50798 e!479335))))

(declare-fun mapValue!26450 () ValueCell!7844)

(declare-fun mapRest!26450 () (Array (_ BitVec 32) ValueCell!7844))

(declare-fun mapKey!26450 () (_ BitVec 32))

(assert (=> mapNonEmpty!26450 (= (arr!23709 _values!688) (store mapRest!26450 mapKey!26450 mapValue!26450))))

(declare-fun b!859970 () Bool)

(declare-fun res!584009 () Bool)

(assert (=> b!859970 (=> (not res!584009) (not e!479333))))

(declare-datatypes ((List!16764 0))(
  ( (Nil!16761) (Cons!16760 (h!17897 (_ BitVec 64)) (t!23453 List!16764)) )
))
(declare-fun arrayNoDuplicates!0 (array!49363 (_ BitVec 32) List!16764) Bool)

(assert (=> b!859970 (= res!584009 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16761))))

(declare-fun b!859971 () Bool)

(declare-fun e!479336 () Bool)

(assert (=> b!859971 (= e!479336 true)))

(assert (=> b!859971 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16761)))

(declare-datatypes ((Unit!29290 0))(
  ( (Unit!29291) )
))
(declare-fun lt!387420 () Unit!29290)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49363 (_ BitVec 32) (_ BitVec 32)) Unit!29290)

(assert (=> b!859971 (= lt!387420 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859972 () Bool)

(declare-fun e!479331 () Bool)

(declare-fun tp_is_empty!16567 () Bool)

(assert (=> b!859972 (= e!479331 tp_is_empty!16567)))

(declare-fun b!859973 () Bool)

(declare-fun res!584005 () Bool)

(assert (=> b!859973 (=> (not res!584005) (not e!479333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859973 (= res!584005 (validMask!0 mask!1196))))

(declare-fun b!859974 () Bool)

(assert (=> b!859974 (= e!479335 tp_is_empty!16567)))

(declare-fun b!859976 () Bool)

(declare-fun res!584007 () Bool)

(assert (=> b!859976 (=> (not res!584007) (not e!479333))))

(assert (=> b!859976 (= res!584007 (and (= (size!24150 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24149 _keys!868) (size!24150 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859977 () Bool)

(declare-fun res!584008 () Bool)

(assert (=> b!859977 (=> (not res!584008) (not e!479333))))

(assert (=> b!859977 (= res!584008 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24149 _keys!868))))))

(declare-fun b!859978 () Bool)

(declare-fun res!584006 () Bool)

(assert (=> b!859978 (=> (not res!584006) (not e!479333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49363 (_ BitVec 32)) Bool)

(assert (=> b!859978 (= res!584006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859979 () Bool)

(declare-fun res!584003 () Bool)

(assert (=> b!859979 (=> (not res!584003) (not e!479333))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859979 (= res!584003 (validKeyInArray!0 k0!854))))

(declare-fun b!859980 () Bool)

(declare-fun e!479332 () Bool)

(assert (=> b!859980 (= e!479332 (and e!479331 mapRes!26450))))

(declare-fun condMapEmpty!26450 () Bool)

(declare-fun mapDefault!26450 () ValueCell!7844)

(assert (=> b!859980 (= condMapEmpty!26450 (= (arr!23709 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7844)) mapDefault!26450)))))

(declare-fun res!584002 () Bool)

(assert (=> start!73684 (=> (not res!584002) (not e!479333))))

(assert (=> start!73684 (= res!584002 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24149 _keys!868))))))

(assert (=> start!73684 e!479333))

(assert (=> start!73684 tp_is_empty!16567))

(assert (=> start!73684 true))

(assert (=> start!73684 tp!50797))

(declare-fun array_inv!18820 (array!49363) Bool)

(assert (=> start!73684 (array_inv!18820 _keys!868)))

(declare-fun array_inv!18821 (array!49365) Bool)

(assert (=> start!73684 (and (array_inv!18821 _values!688) e!479332)))

(declare-fun b!859975 () Bool)

(declare-fun res!584011 () Bool)

(assert (=> b!859975 (=> (not res!584011) (not e!479333))))

(assert (=> b!859975 (= res!584011 (and (= (select (arr!23708 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859981 () Bool)

(declare-fun e!479337 () Bool)

(assert (=> b!859981 (= e!479337 e!479336)))

(declare-fun res!584004 () Bool)

(assert (=> b!859981 (=> res!584004 e!479336)))

(assert (=> b!859981 (= res!584004 (not (= (select (arr!23708 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387419 () ListLongMap!9695)

(declare-fun +!2269 (ListLongMap!9695 tuple2!10924) ListLongMap!9695)

(declare-fun get!12497 (ValueCell!7844 V!27137) V!27137)

(declare-fun dynLambda!1103 (Int (_ BitVec 64)) V!27137)

(assert (=> b!859981 (= lt!387424 (+!2269 lt!387419 (tuple2!10925 (select (arr!23708 _keys!868) from!1053) (get!12497 (select (arr!23709 _values!688) from!1053) (dynLambda!1103 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859982 () Bool)

(assert (=> b!859982 (= e!479338 (not e!479337))))

(declare-fun res!584010 () Bool)

(assert (=> b!859982 (=> res!584010 e!479337)))

(assert (=> b!859982 (= res!584010 (not (validKeyInArray!0 (select (arr!23708 _keys!868) from!1053))))))

(declare-fun lt!387425 () ListLongMap!9695)

(assert (=> b!859982 (= lt!387425 lt!387419)))

(declare-fun lt!387418 () ListLongMap!9695)

(assert (=> b!859982 (= lt!387419 (+!2269 lt!387418 (tuple2!10925 k0!854 v!557)))))

(assert (=> b!859982 (= lt!387425 (getCurrentListMapNoExtraKeys!2919 _keys!868 lt!387423 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859982 (= lt!387418 (getCurrentListMapNoExtraKeys!2919 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387422 () Unit!29290)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!465 (array!49363 array!49365 (_ BitVec 32) (_ BitVec 32) V!27137 V!27137 (_ BitVec 32) (_ BitVec 64) V!27137 (_ BitVec 32) Int) Unit!29290)

(assert (=> b!859982 (= lt!387422 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!465 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73684 res!584002) b!859973))

(assert (= (and b!859973 res!584005) b!859976))

(assert (= (and b!859976 res!584007) b!859978))

(assert (= (and b!859978 res!584006) b!859970))

(assert (= (and b!859970 res!584009) b!859977))

(assert (= (and b!859977 res!584008) b!859979))

(assert (= (and b!859979 res!584003) b!859975))

(assert (= (and b!859975 res!584011) b!859969))

(assert (= (and b!859969 res!584001) b!859982))

(assert (= (and b!859982 (not res!584010)) b!859981))

(assert (= (and b!859981 (not res!584004)) b!859971))

(assert (= (and b!859980 condMapEmpty!26450) mapIsEmpty!26450))

(assert (= (and b!859980 (not condMapEmpty!26450)) mapNonEmpty!26450))

(get-info :version)

(assert (= (and mapNonEmpty!26450 ((_ is ValueCellFull!7844) mapValue!26450)) b!859974))

(assert (= (and b!859980 ((_ is ValueCellFull!7844) mapDefault!26450)) b!859972))

(assert (= start!73684 b!859980))

(declare-fun b_lambda!11797 () Bool)

(assert (=> (not b_lambda!11797) (not b!859981)))

(declare-fun t!23451 () Bool)

(declare-fun tb!4545 () Bool)

(assert (=> (and start!73684 (= defaultEntry!696 defaultEntry!696) t!23451) tb!4545))

(declare-fun result!8709 () Bool)

(assert (=> tb!4545 (= result!8709 tp_is_empty!16567)))

(assert (=> b!859981 t!23451))

(declare-fun b_and!23853 () Bool)

(assert (= b_and!23851 (and (=> t!23451 result!8709) b_and!23853)))

(declare-fun m!801095 () Bool)

(assert (=> mapNonEmpty!26450 m!801095))

(declare-fun m!801097 () Bool)

(assert (=> b!859970 m!801097))

(declare-fun m!801099 () Bool)

(assert (=> b!859982 m!801099))

(declare-fun m!801101 () Bool)

(assert (=> b!859982 m!801101))

(declare-fun m!801103 () Bool)

(assert (=> b!859982 m!801103))

(assert (=> b!859982 m!801101))

(declare-fun m!801105 () Bool)

(assert (=> b!859982 m!801105))

(declare-fun m!801107 () Bool)

(assert (=> b!859982 m!801107))

(declare-fun m!801109 () Bool)

(assert (=> b!859982 m!801109))

(declare-fun m!801111 () Bool)

(assert (=> b!859978 m!801111))

(declare-fun m!801113 () Bool)

(assert (=> b!859973 m!801113))

(declare-fun m!801115 () Bool)

(assert (=> b!859979 m!801115))

(declare-fun m!801117 () Bool)

(assert (=> b!859981 m!801117))

(declare-fun m!801119 () Bool)

(assert (=> b!859981 m!801119))

(declare-fun m!801121 () Bool)

(assert (=> b!859981 m!801121))

(declare-fun m!801123 () Bool)

(assert (=> b!859981 m!801123))

(assert (=> b!859981 m!801119))

(assert (=> b!859981 m!801101))

(assert (=> b!859981 m!801121))

(declare-fun m!801125 () Bool)

(assert (=> b!859969 m!801125))

(declare-fun m!801127 () Bool)

(assert (=> b!859969 m!801127))

(declare-fun m!801129 () Bool)

(assert (=> b!859969 m!801129))

(declare-fun m!801131 () Bool)

(assert (=> b!859975 m!801131))

(declare-fun m!801133 () Bool)

(assert (=> start!73684 m!801133))

(declare-fun m!801135 () Bool)

(assert (=> start!73684 m!801135))

(declare-fun m!801137 () Bool)

(assert (=> b!859971 m!801137))

(declare-fun m!801139 () Bool)

(assert (=> b!859971 m!801139))

(check-sat b_and!23853 tp_is_empty!16567 (not b!859969) (not b!859973) (not b!859978) (not b_next!14431) (not b!859970) (not b!859979) (not b!859971) (not mapNonEmpty!26450) (not b!859981) (not b!859982) (not start!73684) (not b_lambda!11797))
(check-sat b_and!23853 (not b_next!14431))
