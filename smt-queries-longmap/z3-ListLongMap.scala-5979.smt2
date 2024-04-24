; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77868 () Bool)

(assert start!77868)

(declare-fun b_free!16285 () Bool)

(declare-fun b_next!16285 () Bool)

(assert (=> start!77868 (= b_free!16285 (not b_next!16285))))

(declare-fun tp!57118 () Bool)

(declare-fun b_and!26733 () Bool)

(assert (=> start!77868 (= tp!57118 b_and!26733)))

(declare-fun res!612007 () Bool)

(declare-fun e!508501 () Bool)

(assert (=> start!77868 (=> (not res!612007) (not e!508501))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77868 (= res!612007 (validMask!0 mask!1756))))

(assert (=> start!77868 e!508501))

(declare-datatypes ((V!29903 0))(
  ( (V!29904 (val!9402 Int)) )
))
(declare-datatypes ((ValueCell!8870 0))(
  ( (ValueCellFull!8870 (v!11904 V!29903)) (EmptyCell!8870) )
))
(declare-datatypes ((array!53489 0))(
  ( (array!53490 (arr!25699 (Array (_ BitVec 32) ValueCell!8870)) (size!26159 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53489)

(declare-fun e!508498 () Bool)

(declare-fun array_inv!20184 (array!53489) Bool)

(assert (=> start!77868 (and (array_inv!20184 _values!1152) e!508498)))

(assert (=> start!77868 tp!57118))

(assert (=> start!77868 true))

(declare-fun tp_is_empty!18703 () Bool)

(assert (=> start!77868 tp_is_empty!18703))

(declare-datatypes ((array!53491 0))(
  ( (array!53492 (arr!25700 (Array (_ BitVec 32) (_ BitVec 64))) (size!26160 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53491)

(declare-fun array_inv!20185 (array!53491) Bool)

(assert (=> start!77868 (array_inv!20185 _keys!1386)))

(declare-fun b!907256 () Bool)

(declare-fun e!508503 () Bool)

(declare-fun e!508497 () Bool)

(assert (=> b!907256 (= e!508503 e!508497)))

(declare-fun res!612005 () Bool)

(assert (=> b!907256 (=> res!612005 e!508497)))

(declare-datatypes ((tuple2!12170 0))(
  ( (tuple2!12171 (_1!6096 (_ BitVec 64)) (_2!6096 V!29903)) )
))
(declare-datatypes ((List!18007 0))(
  ( (Nil!18004) (Cons!18003 (h!19155 tuple2!12170) (t!25456 List!18007)) )
))
(declare-datatypes ((ListLongMap!10869 0))(
  ( (ListLongMap!10870 (toList!5450 List!18007)) )
))
(declare-fun lt!409251 () ListLongMap!10869)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4505 (ListLongMap!10869 (_ BitVec 64)) Bool)

(assert (=> b!907256 (= res!612005 (not (contains!4505 lt!409251 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29903)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29903)

(declare-fun getCurrentListMap!2716 (array!53491 array!53489 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 32) Int) ListLongMap!10869)

(assert (=> b!907256 (= lt!409251 (getCurrentListMap!2716 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907257 () Bool)

(declare-fun e!508496 () Bool)

(assert (=> b!907257 (= e!508496 (not e!508503))))

(declare-fun res!612010 () Bool)

(assert (=> b!907257 (=> res!612010 e!508503)))

(assert (=> b!907257 (= res!612010 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26160 _keys!1386))))))

(declare-fun lt!409248 () V!29903)

(declare-fun get!13522 (ValueCell!8870 V!29903) V!29903)

(declare-fun dynLambda!1362 (Int (_ BitVec 64)) V!29903)

(assert (=> b!907257 (= lt!409248 (get!13522 (select (arr!25699 _values!1152) i!717) (dynLambda!1362 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907257 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30754 0))(
  ( (Unit!30755) )
))
(declare-fun lt!409252 () Unit!30754)

(declare-fun lemmaKeyInListMapIsInArray!221 (array!53491 array!53489 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 64) Int) Unit!30754)

(assert (=> b!907257 (= lt!409252 (lemmaKeyInListMapIsInArray!221 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907258 () Bool)

(assert (=> b!907258 (= e!508501 e!508496)))

(declare-fun res!612013 () Bool)

(assert (=> b!907258 (=> (not res!612013) (not e!508496))))

(declare-fun lt!409249 () ListLongMap!10869)

(assert (=> b!907258 (= res!612013 (contains!4505 lt!409249 k0!1033))))

(assert (=> b!907258 (= lt!409249 (getCurrentListMap!2716 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907259 () Bool)

(declare-fun res!612008 () Bool)

(assert (=> b!907259 (=> (not res!612008) (not e!508501))))

(assert (=> b!907259 (= res!612008 (and (= (size!26159 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26160 _keys!1386) (size!26159 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29767 () Bool)

(declare-fun mapRes!29767 () Bool)

(declare-fun tp!57117 () Bool)

(declare-fun e!508500 () Bool)

(assert (=> mapNonEmpty!29767 (= mapRes!29767 (and tp!57117 e!508500))))

(declare-fun mapRest!29767 () (Array (_ BitVec 32) ValueCell!8870))

(declare-fun mapKey!29767 () (_ BitVec 32))

(declare-fun mapValue!29767 () ValueCell!8870)

(assert (=> mapNonEmpty!29767 (= (arr!25699 _values!1152) (store mapRest!29767 mapKey!29767 mapValue!29767))))

(declare-fun mapIsEmpty!29767 () Bool)

(assert (=> mapIsEmpty!29767 mapRes!29767))

(declare-fun b!907260 () Bool)

(declare-fun e!508499 () Bool)

(assert (=> b!907260 (= e!508498 (and e!508499 mapRes!29767))))

(declare-fun condMapEmpty!29767 () Bool)

(declare-fun mapDefault!29767 () ValueCell!8870)

(assert (=> b!907260 (= condMapEmpty!29767 (= (arr!25699 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8870)) mapDefault!29767)))))

(declare-fun b!907261 () Bool)

(assert (=> b!907261 (= e!508500 tp_is_empty!18703)))

(declare-fun b!907262 () Bool)

(declare-fun res!612011 () Bool)

(assert (=> b!907262 (=> (not res!612011) (not e!508496))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907262 (= res!612011 (inRange!0 i!717 mask!1756))))

(declare-fun b!907263 () Bool)

(declare-fun res!612009 () Bool)

(assert (=> b!907263 (=> (not res!612009) (not e!508501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53491 (_ BitVec 32)) Bool)

(assert (=> b!907263 (= res!612009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907264 () Bool)

(assert (=> b!907264 (= e!508497 true)))

(declare-fun apply!469 (ListLongMap!10869 (_ BitVec 64)) V!29903)

(assert (=> b!907264 (= (apply!469 lt!409249 k0!1033) lt!409248)))

(declare-fun lt!409250 () Unit!30754)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!24 (array!53491 array!53489 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 64) V!29903 (_ BitVec 32) Int) Unit!30754)

(assert (=> b!907264 (= lt!409250 (lemmaListMapApplyFromThenApplyFromZero!24 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409248 i!717 defaultEntry!1160))))

(declare-fun b!907265 () Bool)

(declare-fun res!612012 () Bool)

(assert (=> b!907265 (=> res!612012 e!508497)))

(assert (=> b!907265 (= res!612012 (not (= (apply!469 lt!409251 k0!1033) lt!409248)))))

(declare-fun b!907266 () Bool)

(declare-fun res!612006 () Bool)

(assert (=> b!907266 (=> (not res!612006) (not e!508496))))

(assert (=> b!907266 (= res!612006 (and (= (select (arr!25700 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907267 () Bool)

(declare-fun res!612004 () Bool)

(assert (=> b!907267 (=> (not res!612004) (not e!508501))))

(declare-datatypes ((List!18008 0))(
  ( (Nil!18005) (Cons!18004 (h!19156 (_ BitVec 64)) (t!25457 List!18008)) )
))
(declare-fun arrayNoDuplicates!0 (array!53491 (_ BitVec 32) List!18008) Bool)

(assert (=> b!907267 (= res!612004 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18005))))

(declare-fun b!907268 () Bool)

(assert (=> b!907268 (= e!508499 tp_is_empty!18703)))

(assert (= (and start!77868 res!612007) b!907259))

(assert (= (and b!907259 res!612008) b!907263))

(assert (= (and b!907263 res!612009) b!907267))

(assert (= (and b!907267 res!612004) b!907258))

(assert (= (and b!907258 res!612013) b!907262))

(assert (= (and b!907262 res!612011) b!907266))

(assert (= (and b!907266 res!612006) b!907257))

(assert (= (and b!907257 (not res!612010)) b!907256))

(assert (= (and b!907256 (not res!612005)) b!907265))

(assert (= (and b!907265 (not res!612012)) b!907264))

(assert (= (and b!907260 condMapEmpty!29767) mapIsEmpty!29767))

(assert (= (and b!907260 (not condMapEmpty!29767)) mapNonEmpty!29767))

(get-info :version)

(assert (= (and mapNonEmpty!29767 ((_ is ValueCellFull!8870) mapValue!29767)) b!907261))

(assert (= (and b!907260 ((_ is ValueCellFull!8870) mapDefault!29767)) b!907268))

(assert (= start!77868 b!907260))

(declare-fun b_lambda!13173 () Bool)

(assert (=> (not b_lambda!13173) (not b!907257)))

(declare-fun t!25455 () Bool)

(declare-fun tb!5299 () Bool)

(assert (=> (and start!77868 (= defaultEntry!1160 defaultEntry!1160) t!25455) tb!5299))

(declare-fun result!10401 () Bool)

(assert (=> tb!5299 (= result!10401 tp_is_empty!18703)))

(assert (=> b!907257 t!25455))

(declare-fun b_and!26735 () Bool)

(assert (= b_and!26733 (and (=> t!25455 result!10401) b_and!26735)))

(declare-fun m!843029 () Bool)

(assert (=> b!907258 m!843029))

(declare-fun m!843031 () Bool)

(assert (=> b!907258 m!843031))

(declare-fun m!843033 () Bool)

(assert (=> b!907257 m!843033))

(declare-fun m!843035 () Bool)

(assert (=> b!907257 m!843035))

(declare-fun m!843037 () Bool)

(assert (=> b!907257 m!843037))

(declare-fun m!843039 () Bool)

(assert (=> b!907257 m!843039))

(assert (=> b!907257 m!843033))

(assert (=> b!907257 m!843037))

(declare-fun m!843041 () Bool)

(assert (=> b!907257 m!843041))

(declare-fun m!843043 () Bool)

(assert (=> b!907256 m!843043))

(declare-fun m!843045 () Bool)

(assert (=> b!907256 m!843045))

(declare-fun m!843047 () Bool)

(assert (=> mapNonEmpty!29767 m!843047))

(declare-fun m!843049 () Bool)

(assert (=> b!907264 m!843049))

(declare-fun m!843051 () Bool)

(assert (=> b!907264 m!843051))

(declare-fun m!843053 () Bool)

(assert (=> b!907265 m!843053))

(declare-fun m!843055 () Bool)

(assert (=> b!907263 m!843055))

(declare-fun m!843057 () Bool)

(assert (=> start!77868 m!843057))

(declare-fun m!843059 () Bool)

(assert (=> start!77868 m!843059))

(declare-fun m!843061 () Bool)

(assert (=> start!77868 m!843061))

(declare-fun m!843063 () Bool)

(assert (=> b!907262 m!843063))

(declare-fun m!843065 () Bool)

(assert (=> b!907267 m!843065))

(declare-fun m!843067 () Bool)

(assert (=> b!907266 m!843067))

(check-sat (not mapNonEmpty!29767) (not b!907258) (not b!907262) (not b_next!16285) (not b!907264) (not b!907257) (not b_lambda!13173) (not b!907265) (not b!907267) (not b!907263) b_and!26735 tp_is_empty!18703 (not start!77868) (not b!907256))
(check-sat b_and!26735 (not b_next!16285))
