; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77724 () Bool)

(assert start!77724)

(declare-fun b_free!16327 () Bool)

(declare-fun b_next!16327 () Bool)

(assert (=> start!77724 (= b_free!16327 (not b_next!16327))))

(declare-fun tp!57243 () Bool)

(declare-fun b_and!26781 () Bool)

(assert (=> start!77724 (= tp!57243 b_and!26781)))

(declare-fun b!906975 () Bool)

(declare-fun e!508276 () Bool)

(declare-fun e!508275 () Bool)

(declare-fun mapRes!29830 () Bool)

(assert (=> b!906975 (= e!508276 (and e!508275 mapRes!29830))))

(declare-fun condMapEmpty!29830 () Bool)

(declare-datatypes ((V!29959 0))(
  ( (V!29960 (val!9423 Int)) )
))
(declare-datatypes ((ValueCell!8891 0))(
  ( (ValueCellFull!8891 (v!11927 V!29959)) (EmptyCell!8891) )
))
(declare-datatypes ((array!53503 0))(
  ( (array!53504 (arr!25711 (Array (_ BitVec 32) ValueCell!8891)) (size!26172 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53503)

(declare-fun mapDefault!29830 () ValueCell!8891)

(assert (=> b!906975 (= condMapEmpty!29830 (= (arr!25711 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8891)) mapDefault!29830)))))

(declare-fun b!906976 () Bool)

(declare-fun e!508273 () Bool)

(assert (=> b!906976 (= e!508273 true)))

(declare-datatypes ((tuple2!12292 0))(
  ( (tuple2!12293 (_1!6157 (_ BitVec 64)) (_2!6157 V!29959)) )
))
(declare-datatypes ((List!18078 0))(
  ( (Nil!18075) (Cons!18074 (h!19220 tuple2!12292) (t!25568 List!18078)) )
))
(declare-datatypes ((ListLongMap!10979 0))(
  ( (ListLongMap!10980 (toList!5505 List!18078)) )
))
(declare-fun lt!408968 () ListLongMap!10979)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408966 () V!29959)

(declare-fun apply!480 (ListLongMap!10979 (_ BitVec 64)) V!29959)

(assert (=> b!906976 (= (apply!480 lt!408968 k0!1033) lt!408966)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29959)

(declare-datatypes ((Unit!30710 0))(
  ( (Unit!30711) )
))
(declare-fun lt!408969 () Unit!30710)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29959)

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53505 0))(
  ( (array!53506 (arr!25712 (Array (_ BitVec 32) (_ BitVec 64))) (size!26173 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53505)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!41 (array!53505 array!53503 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 64) V!29959 (_ BitVec 32) Int) Unit!30710)

(assert (=> b!906976 (= lt!408969 (lemmaListMapApplyFromThenApplyFromZero!41 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408966 i!717 defaultEntry!1160))))

(declare-fun b!906977 () Bool)

(declare-fun tp_is_empty!18745 () Bool)

(assert (=> b!906977 (= e!508275 tp_is_empty!18745)))

(declare-fun res!612180 () Bool)

(declare-fun e!508272 () Bool)

(assert (=> start!77724 (=> (not res!612180) (not e!508272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77724 (= res!612180 (validMask!0 mask!1756))))

(assert (=> start!77724 e!508272))

(declare-fun array_inv!20176 (array!53503) Bool)

(assert (=> start!77724 (and (array_inv!20176 _values!1152) e!508276)))

(assert (=> start!77724 tp!57243))

(assert (=> start!77724 true))

(assert (=> start!77724 tp_is_empty!18745))

(declare-fun array_inv!20177 (array!53505) Bool)

(assert (=> start!77724 (array_inv!20177 _keys!1386)))

(declare-fun b!906978 () Bool)

(declare-fun e!508277 () Bool)

(declare-fun e!508270 () Bool)

(assert (=> b!906978 (= e!508277 (not e!508270))))

(declare-fun res!612187 () Bool)

(assert (=> b!906978 (=> res!612187 e!508270)))

(assert (=> b!906978 (= res!612187 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26173 _keys!1386))))))

(declare-fun get!13526 (ValueCell!8891 V!29959) V!29959)

(declare-fun dynLambda!1351 (Int (_ BitVec 64)) V!29959)

(assert (=> b!906978 (= lt!408966 (get!13526 (select (arr!25711 _values!1152) i!717) (dynLambda!1351 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906978 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408970 () Unit!30710)

(declare-fun lemmaKeyInListMapIsInArray!227 (array!53505 array!53503 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 64) Int) Unit!30710)

(assert (=> b!906978 (= lt!408970 (lemmaKeyInListMapIsInArray!227 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906979 () Bool)

(declare-fun res!612189 () Bool)

(assert (=> b!906979 (=> (not res!612189) (not e!508272))))

(assert (=> b!906979 (= res!612189 (and (= (size!26172 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26173 _keys!1386) (size!26172 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906980 () Bool)

(declare-fun res!612185 () Bool)

(assert (=> b!906980 (=> (not res!612185) (not e!508272))))

(declare-datatypes ((List!18079 0))(
  ( (Nil!18076) (Cons!18075 (h!19221 (_ BitVec 64)) (t!25569 List!18079)) )
))
(declare-fun arrayNoDuplicates!0 (array!53505 (_ BitVec 32) List!18079) Bool)

(assert (=> b!906980 (= res!612185 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18076))))

(declare-fun b!906981 () Bool)

(declare-fun res!612182 () Bool)

(assert (=> b!906981 (=> (not res!612182) (not e!508277))))

(assert (=> b!906981 (= res!612182 (and (= (select (arr!25712 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906982 () Bool)

(declare-fun res!612181 () Bool)

(assert (=> b!906982 (=> (not res!612181) (not e!508272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53505 (_ BitVec 32)) Bool)

(assert (=> b!906982 (= res!612181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906983 () Bool)

(declare-fun e!508274 () Bool)

(assert (=> b!906983 (= e!508274 tp_is_empty!18745)))

(declare-fun b!906984 () Bool)

(declare-fun res!612188 () Bool)

(assert (=> b!906984 (=> (not res!612188) (not e!508277))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906984 (= res!612188 (inRange!0 i!717 mask!1756))))

(declare-fun b!906985 () Bool)

(declare-fun res!612183 () Bool)

(assert (=> b!906985 (=> res!612183 e!508273)))

(declare-fun lt!408967 () ListLongMap!10979)

(assert (=> b!906985 (= res!612183 (not (= (apply!480 lt!408967 k0!1033) lt!408966)))))

(declare-fun mapNonEmpty!29830 () Bool)

(declare-fun tp!57244 () Bool)

(assert (=> mapNonEmpty!29830 (= mapRes!29830 (and tp!57244 e!508274))))

(declare-fun mapRest!29830 () (Array (_ BitVec 32) ValueCell!8891))

(declare-fun mapKey!29830 () (_ BitVec 32))

(declare-fun mapValue!29830 () ValueCell!8891)

(assert (=> mapNonEmpty!29830 (= (arr!25711 _values!1152) (store mapRest!29830 mapKey!29830 mapValue!29830))))

(declare-fun mapIsEmpty!29830 () Bool)

(assert (=> mapIsEmpty!29830 mapRes!29830))

(declare-fun b!906986 () Bool)

(assert (=> b!906986 (= e!508272 e!508277)))

(declare-fun res!612184 () Bool)

(assert (=> b!906986 (=> (not res!612184) (not e!508277))))

(declare-fun contains!4508 (ListLongMap!10979 (_ BitVec 64)) Bool)

(assert (=> b!906986 (= res!612184 (contains!4508 lt!408968 k0!1033))))

(declare-fun getCurrentListMap!2712 (array!53505 array!53503 (_ BitVec 32) (_ BitVec 32) V!29959 V!29959 (_ BitVec 32) Int) ListLongMap!10979)

(assert (=> b!906986 (= lt!408968 (getCurrentListMap!2712 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906987 () Bool)

(assert (=> b!906987 (= e!508270 e!508273)))

(declare-fun res!612186 () Bool)

(assert (=> b!906987 (=> res!612186 e!508273)))

(assert (=> b!906987 (= res!612186 (not (contains!4508 lt!408967 k0!1033)))))

(assert (=> b!906987 (= lt!408967 (getCurrentListMap!2712 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77724 res!612180) b!906979))

(assert (= (and b!906979 res!612189) b!906982))

(assert (= (and b!906982 res!612181) b!906980))

(assert (= (and b!906980 res!612185) b!906986))

(assert (= (and b!906986 res!612184) b!906984))

(assert (= (and b!906984 res!612188) b!906981))

(assert (= (and b!906981 res!612182) b!906978))

(assert (= (and b!906978 (not res!612187)) b!906987))

(assert (= (and b!906987 (not res!612186)) b!906985))

(assert (= (and b!906985 (not res!612183)) b!906976))

(assert (= (and b!906975 condMapEmpty!29830) mapIsEmpty!29830))

(assert (= (and b!906975 (not condMapEmpty!29830)) mapNonEmpty!29830))

(get-info :version)

(assert (= (and mapNonEmpty!29830 ((_ is ValueCellFull!8891) mapValue!29830)) b!906983))

(assert (= (and b!906975 ((_ is ValueCellFull!8891) mapDefault!29830)) b!906977))

(assert (= start!77724 b!906975))

(declare-fun b_lambda!13183 () Bool)

(assert (=> (not b_lambda!13183) (not b!906978)))

(declare-fun t!25567 () Bool)

(declare-fun tb!5341 () Bool)

(assert (=> (and start!77724 (= defaultEntry!1160 defaultEntry!1160) t!25567) tb!5341))

(declare-fun result!10485 () Bool)

(assert (=> tb!5341 (= result!10485 tp_is_empty!18745)))

(assert (=> b!906978 t!25567))

(declare-fun b_and!26783 () Bool)

(assert (= b_and!26781 (and (=> t!25567 result!10485) b_and!26783)))

(declare-fun m!841817 () Bool)

(assert (=> b!906985 m!841817))

(declare-fun m!841819 () Bool)

(assert (=> b!906987 m!841819))

(declare-fun m!841821 () Bool)

(assert (=> b!906987 m!841821))

(declare-fun m!841823 () Bool)

(assert (=> b!906984 m!841823))

(declare-fun m!841825 () Bool)

(assert (=> b!906982 m!841825))

(declare-fun m!841827 () Bool)

(assert (=> b!906976 m!841827))

(declare-fun m!841829 () Bool)

(assert (=> b!906976 m!841829))

(declare-fun m!841831 () Bool)

(assert (=> b!906986 m!841831))

(declare-fun m!841833 () Bool)

(assert (=> b!906986 m!841833))

(declare-fun m!841835 () Bool)

(assert (=> b!906978 m!841835))

(declare-fun m!841837 () Bool)

(assert (=> b!906978 m!841837))

(declare-fun m!841839 () Bool)

(assert (=> b!906978 m!841839))

(declare-fun m!841841 () Bool)

(assert (=> b!906978 m!841841))

(assert (=> b!906978 m!841835))

(assert (=> b!906978 m!841839))

(declare-fun m!841843 () Bool)

(assert (=> b!906978 m!841843))

(declare-fun m!841845 () Bool)

(assert (=> b!906981 m!841845))

(declare-fun m!841847 () Bool)

(assert (=> start!77724 m!841847))

(declare-fun m!841849 () Bool)

(assert (=> start!77724 m!841849))

(declare-fun m!841851 () Bool)

(assert (=> start!77724 m!841851))

(declare-fun m!841853 () Bool)

(assert (=> mapNonEmpty!29830 m!841853))

(declare-fun m!841855 () Bool)

(assert (=> b!906980 m!841855))

(check-sat (not b!906987) (not b_lambda!13183) (not b!906982) (not b!906984) (not b!906985) (not start!77724) b_and!26783 (not mapNonEmpty!29830) (not b!906976) tp_is_empty!18745 (not b_next!16327) (not b!906986) (not b!906978) (not b!906980))
(check-sat b_and!26783 (not b_next!16327))
