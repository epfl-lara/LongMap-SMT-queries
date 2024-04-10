; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77726 () Bool)

(assert start!77726)

(declare-fun b_free!16311 () Bool)

(declare-fun b_next!16311 () Bool)

(assert (=> start!77726 (= b_free!16311 (not b_next!16311))))

(declare-fun tp!57195 () Bool)

(declare-fun b_and!26775 () Bool)

(assert (=> start!77726 (= tp!57195 b_and!26775)))

(declare-fun b!906886 () Bool)

(declare-fun res!612051 () Bool)

(declare-fun e!508232 () Bool)

(assert (=> b!906886 (=> (not res!612051) (not e!508232))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906886 (= res!612051 (inRange!0 i!717 mask!1756))))

(declare-fun res!612054 () Bool)

(declare-fun e!508227 () Bool)

(assert (=> start!77726 (=> (not res!612054) (not e!508227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77726 (= res!612054 (validMask!0 mask!1756))))

(assert (=> start!77726 e!508227))

(declare-datatypes ((V!29937 0))(
  ( (V!29938 (val!9415 Int)) )
))
(declare-datatypes ((ValueCell!8883 0))(
  ( (ValueCellFull!8883 (v!11920 V!29937)) (EmptyCell!8883) )
))
(declare-datatypes ((array!53498 0))(
  ( (array!53499 (arr!25708 (Array (_ BitVec 32) ValueCell!8883)) (size!26167 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53498)

(declare-fun e!508233 () Bool)

(declare-fun array_inv!20140 (array!53498) Bool)

(assert (=> start!77726 (and (array_inv!20140 _values!1152) e!508233)))

(assert (=> start!77726 tp!57195))

(assert (=> start!77726 true))

(declare-fun tp_is_empty!18729 () Bool)

(assert (=> start!77726 tp_is_empty!18729))

(declare-datatypes ((array!53500 0))(
  ( (array!53501 (arr!25709 (Array (_ BitVec 32) (_ BitVec 64))) (size!26168 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53500)

(declare-fun array_inv!20141 (array!53500) Bool)

(assert (=> start!77726 (array_inv!20141 _keys!1386)))

(declare-fun mapNonEmpty!29806 () Bool)

(declare-fun mapRes!29806 () Bool)

(declare-fun tp!57194 () Bool)

(declare-fun e!508226 () Bool)

(assert (=> mapNonEmpty!29806 (= mapRes!29806 (and tp!57194 e!508226))))

(declare-fun mapKey!29806 () (_ BitVec 32))

(declare-fun mapValue!29806 () ValueCell!8883)

(declare-fun mapRest!29806 () (Array (_ BitVec 32) ValueCell!8883))

(assert (=> mapNonEmpty!29806 (= (arr!25708 _values!1152) (store mapRest!29806 mapKey!29806 mapValue!29806))))

(declare-fun b!906887 () Bool)

(assert (=> b!906887 (= e!508227 e!508232)))

(declare-fun res!612050 () Bool)

(assert (=> b!906887 (=> (not res!612050) (not e!508232))))

(declare-datatypes ((tuple2!12260 0))(
  ( (tuple2!12261 (_1!6141 (_ BitVec 64)) (_2!6141 V!29937)) )
))
(declare-datatypes ((List!18063 0))(
  ( (Nil!18060) (Cons!18059 (h!19205 tuple2!12260) (t!25546 List!18063)) )
))
(declare-datatypes ((ListLongMap!10957 0))(
  ( (ListLongMap!10958 (toList!5494 List!18063)) )
))
(declare-fun lt!409086 () ListLongMap!10957)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4539 (ListLongMap!10957 (_ BitVec 64)) Bool)

(assert (=> b!906887 (= res!612050 (contains!4539 lt!409086 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29937)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29937)

(declare-fun getCurrentListMap!2760 (array!53500 array!53498 (_ BitVec 32) (_ BitVec 32) V!29937 V!29937 (_ BitVec 32) Int) ListLongMap!10957)

(assert (=> b!906887 (= lt!409086 (getCurrentListMap!2760 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906888 () Bool)

(declare-fun res!612059 () Bool)

(assert (=> b!906888 (=> (not res!612059) (not e!508232))))

(assert (=> b!906888 (= res!612059 (and (= (select (arr!25709 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906889 () Bool)

(declare-fun res!612055 () Bool)

(assert (=> b!906889 (=> (not res!612055) (not e!508227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53500 (_ BitVec 32)) Bool)

(assert (=> b!906889 (= res!612055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906890 () Bool)

(declare-fun e!508229 () Bool)

(declare-fun e!508231 () Bool)

(assert (=> b!906890 (= e!508229 e!508231)))

(declare-fun res!612053 () Bool)

(assert (=> b!906890 (=> res!612053 e!508231)))

(declare-fun lt!409082 () ListLongMap!10957)

(assert (=> b!906890 (= res!612053 (not (contains!4539 lt!409082 k0!1033)))))

(assert (=> b!906890 (= lt!409082 (getCurrentListMap!2760 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906891 () Bool)

(declare-fun res!612056 () Bool)

(assert (=> b!906891 (=> (not res!612056) (not e!508227))))

(assert (=> b!906891 (= res!612056 (and (= (size!26167 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26168 _keys!1386) (size!26167 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906892 () Bool)

(assert (=> b!906892 (= e!508231 true)))

(declare-fun lt!409085 () V!29937)

(declare-fun apply!480 (ListLongMap!10957 (_ BitVec 64)) V!29937)

(assert (=> b!906892 (= (apply!480 lt!409086 k0!1033) lt!409085)))

(declare-datatypes ((Unit!30782 0))(
  ( (Unit!30783) )
))
(declare-fun lt!409083 () Unit!30782)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!34 (array!53500 array!53498 (_ BitVec 32) (_ BitVec 32) V!29937 V!29937 (_ BitVec 64) V!29937 (_ BitVec 32) Int) Unit!30782)

(assert (=> b!906892 (= lt!409083 (lemmaListMapApplyFromThenApplyFromZero!34 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409085 i!717 defaultEntry!1160))))

(declare-fun b!906893 () Bool)

(declare-fun res!612057 () Bool)

(assert (=> b!906893 (=> res!612057 e!508231)))

(assert (=> b!906893 (= res!612057 (not (= (apply!480 lt!409082 k0!1033) lt!409085)))))

(declare-fun b!906894 () Bool)

(declare-fun e!508228 () Bool)

(assert (=> b!906894 (= e!508228 tp_is_empty!18729)))

(declare-fun mapIsEmpty!29806 () Bool)

(assert (=> mapIsEmpty!29806 mapRes!29806))

(declare-fun b!906895 () Bool)

(assert (=> b!906895 (= e!508233 (and e!508228 mapRes!29806))))

(declare-fun condMapEmpty!29806 () Bool)

(declare-fun mapDefault!29806 () ValueCell!8883)

(assert (=> b!906895 (= condMapEmpty!29806 (= (arr!25708 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8883)) mapDefault!29806)))))

(declare-fun b!906896 () Bool)

(assert (=> b!906896 (= e!508232 (not e!508229))))

(declare-fun res!612058 () Bool)

(assert (=> b!906896 (=> res!612058 e!508229)))

(assert (=> b!906896 (= res!612058 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26168 _keys!1386))))))

(declare-fun get!13521 (ValueCell!8883 V!29937) V!29937)

(declare-fun dynLambda!1357 (Int (_ BitVec 64)) V!29937)

(assert (=> b!906896 (= lt!409085 (get!13521 (select (arr!25708 _values!1152) i!717) (dynLambda!1357 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906896 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409084 () Unit!30782)

(declare-fun lemmaKeyInListMapIsInArray!229 (array!53500 array!53498 (_ BitVec 32) (_ BitVec 32) V!29937 V!29937 (_ BitVec 64) Int) Unit!30782)

(assert (=> b!906896 (= lt!409084 (lemmaKeyInListMapIsInArray!229 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906897 () Bool)

(assert (=> b!906897 (= e!508226 tp_is_empty!18729)))

(declare-fun b!906898 () Bool)

(declare-fun res!612052 () Bool)

(assert (=> b!906898 (=> (not res!612052) (not e!508227))))

(declare-datatypes ((List!18064 0))(
  ( (Nil!18061) (Cons!18060 (h!19206 (_ BitVec 64)) (t!25547 List!18064)) )
))
(declare-fun arrayNoDuplicates!0 (array!53500 (_ BitVec 32) List!18064) Bool)

(assert (=> b!906898 (= res!612052 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18061))))

(assert (= (and start!77726 res!612054) b!906891))

(assert (= (and b!906891 res!612056) b!906889))

(assert (= (and b!906889 res!612055) b!906898))

(assert (= (and b!906898 res!612052) b!906887))

(assert (= (and b!906887 res!612050) b!906886))

(assert (= (and b!906886 res!612051) b!906888))

(assert (= (and b!906888 res!612059) b!906896))

(assert (= (and b!906896 (not res!612058)) b!906890))

(assert (= (and b!906890 (not res!612053)) b!906893))

(assert (= (and b!906893 (not res!612057)) b!906892))

(assert (= (and b!906895 condMapEmpty!29806) mapIsEmpty!29806))

(assert (= (and b!906895 (not condMapEmpty!29806)) mapNonEmpty!29806))

(get-info :version)

(assert (= (and mapNonEmpty!29806 ((_ is ValueCellFull!8883) mapValue!29806)) b!906897))

(assert (= (and b!906895 ((_ is ValueCellFull!8883) mapDefault!29806)) b!906894))

(assert (= start!77726 b!906895))

(declare-fun b_lambda!13185 () Bool)

(assert (=> (not b_lambda!13185) (not b!906896)))

(declare-fun t!25545 () Bool)

(declare-fun tb!5333 () Bool)

(assert (=> (and start!77726 (= defaultEntry!1160 defaultEntry!1160) t!25545) tb!5333))

(declare-fun result!10461 () Bool)

(assert (=> tb!5333 (= result!10461 tp_is_empty!18729)))

(assert (=> b!906896 t!25545))

(declare-fun b_and!26777 () Bool)

(assert (= b_and!26775 (and (=> t!25545 result!10461) b_and!26777)))

(declare-fun m!842255 () Bool)

(assert (=> b!906890 m!842255))

(declare-fun m!842257 () Bool)

(assert (=> b!906890 m!842257))

(declare-fun m!842259 () Bool)

(assert (=> b!906887 m!842259))

(declare-fun m!842261 () Bool)

(assert (=> b!906887 m!842261))

(declare-fun m!842263 () Bool)

(assert (=> b!906889 m!842263))

(declare-fun m!842265 () Bool)

(assert (=> b!906888 m!842265))

(declare-fun m!842267 () Bool)

(assert (=> start!77726 m!842267))

(declare-fun m!842269 () Bool)

(assert (=> start!77726 m!842269))

(declare-fun m!842271 () Bool)

(assert (=> start!77726 m!842271))

(declare-fun m!842273 () Bool)

(assert (=> b!906892 m!842273))

(declare-fun m!842275 () Bool)

(assert (=> b!906892 m!842275))

(declare-fun m!842277 () Bool)

(assert (=> b!906893 m!842277))

(declare-fun m!842279 () Bool)

(assert (=> b!906896 m!842279))

(declare-fun m!842281 () Bool)

(assert (=> b!906896 m!842281))

(declare-fun m!842283 () Bool)

(assert (=> b!906896 m!842283))

(declare-fun m!842285 () Bool)

(assert (=> b!906896 m!842285))

(assert (=> b!906896 m!842279))

(assert (=> b!906896 m!842283))

(declare-fun m!842287 () Bool)

(assert (=> b!906896 m!842287))

(declare-fun m!842289 () Bool)

(assert (=> mapNonEmpty!29806 m!842289))

(declare-fun m!842291 () Bool)

(assert (=> b!906886 m!842291))

(declare-fun m!842293 () Bool)

(assert (=> b!906898 m!842293))

(check-sat b_and!26777 (not b!906890) (not b!906898) (not start!77726) (not b_next!16311) (not b!906887) (not b!906886) tp_is_empty!18729 (not b!906892) (not b_lambda!13185) (not mapNonEmpty!29806) (not b!906896) (not b!906889) (not b!906893))
(check-sat b_and!26777 (not b_next!16311))
