; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77766 () Bool)

(assert start!77766)

(declare-fun b_free!16183 () Bool)

(declare-fun b_next!16183 () Bool)

(assert (=> start!77766 (= b_free!16183 (not b_next!16183))))

(declare-fun tp!56811 () Bool)

(declare-fun b_and!26559 () Bool)

(assert (=> start!77766 (= tp!56811 b_and!26559)))

(declare-fun b!905238 () Bool)

(declare-fun e!507318 () Bool)

(declare-fun tp_is_empty!18601 () Bool)

(assert (=> b!905238 (= e!507318 tp_is_empty!18601)))

(declare-fun b!905239 () Bool)

(declare-fun e!507316 () Bool)

(assert (=> b!905239 (= e!507316 tp_is_empty!18601)))

(declare-fun b!905240 () Bool)

(declare-fun e!507321 () Bool)

(declare-fun mapRes!29614 () Bool)

(assert (=> b!905240 (= e!507321 (and e!507318 mapRes!29614))))

(declare-fun condMapEmpty!29614 () Bool)

(declare-datatypes ((V!29767 0))(
  ( (V!29768 (val!9351 Int)) )
))
(declare-datatypes ((ValueCell!8819 0))(
  ( (ValueCellFull!8819 (v!11853 V!29767)) (EmptyCell!8819) )
))
(declare-datatypes ((array!53293 0))(
  ( (array!53294 (arr!25601 (Array (_ BitVec 32) ValueCell!8819)) (size!26061 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53293)

(declare-fun mapDefault!29614 () ValueCell!8819)

(assert (=> b!905240 (= condMapEmpty!29614 (= (arr!25601 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8819)) mapDefault!29614)))))

(declare-fun b!905241 () Bool)

(declare-fun res!610521 () Bool)

(declare-fun e!507319 () Bool)

(assert (=> b!905241 (=> (not res!610521) (not e!507319))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53295 0))(
  ( (array!53296 (arr!25602 (Array (_ BitVec 32) (_ BitVec 64))) (size!26062 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53295)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!905241 (= res!610521 (and (= (select (arr!25602 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905242 () Bool)

(declare-fun res!610519 () Bool)

(assert (=> b!905242 (=> (not res!610519) (not e!507319))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905242 (= res!610519 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29614 () Bool)

(assert (=> mapIsEmpty!29614 mapRes!29614))

(declare-fun b!905243 () Bool)

(declare-fun e!507320 () Bool)

(assert (=> b!905243 (= e!507319 (not e!507320))))

(declare-fun res!610523 () Bool)

(assert (=> b!905243 (=> res!610523 e!507320)))

(assert (=> b!905243 (= res!610523 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26062 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905243 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30674 0))(
  ( (Unit!30675) )
))
(declare-fun lt!408570 () Unit!30674)

(declare-fun zeroValue!1094 () V!29767)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29767)

(declare-fun lemmaKeyInListMapIsInArray!184 (array!53295 array!53293 (_ BitVec 32) (_ BitVec 32) V!29767 V!29767 (_ BitVec 64) Int) Unit!30674)

(assert (=> b!905243 (= lt!408570 (lemmaKeyInListMapIsInArray!184 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905244 () Bool)

(declare-fun e!507317 () Bool)

(assert (=> b!905244 (= e!507320 e!507317)))

(declare-fun res!610524 () Bool)

(assert (=> b!905244 (=> res!610524 e!507317)))

(declare-datatypes ((tuple2!12080 0))(
  ( (tuple2!12081 (_1!6051 (_ BitVec 64)) (_2!6051 V!29767)) )
))
(declare-datatypes ((List!17930 0))(
  ( (Nil!17927) (Cons!17926 (h!19078 tuple2!12080) (t!25305 List!17930)) )
))
(declare-datatypes ((ListLongMap!10779 0))(
  ( (ListLongMap!10780 (toList!5405 List!17930)) )
))
(declare-fun lt!408569 () ListLongMap!10779)

(declare-fun contains!4462 (ListLongMap!10779 (_ BitVec 64)) Bool)

(assert (=> b!905244 (= res!610524 (not (contains!4462 lt!408569 k0!1033)))))

(declare-fun getCurrentListMap!2673 (array!53295 array!53293 (_ BitVec 32) (_ BitVec 32) V!29767 V!29767 (_ BitVec 32) Int) ListLongMap!10779)

(assert (=> b!905244 (= lt!408569 (getCurrentListMap!2673 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905245 () Bool)

(declare-fun res!610518 () Bool)

(assert (=> b!905245 (=> (not res!610518) (not e!507319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53295 (_ BitVec 32)) Bool)

(assert (=> b!905245 (= res!610518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905246 () Bool)

(declare-fun res!610520 () Bool)

(assert (=> b!905246 (=> (not res!610520) (not e!507319))))

(assert (=> b!905246 (= res!610520 (and (= (size!26061 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26062 _keys!1386) (size!26061 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905247 () Bool)

(declare-fun res!610517 () Bool)

(assert (=> b!905247 (=> (not res!610517) (not e!507319))))

(declare-datatypes ((List!17931 0))(
  ( (Nil!17928) (Cons!17927 (h!19079 (_ BitVec 64)) (t!25306 List!17931)) )
))
(declare-fun arrayNoDuplicates!0 (array!53295 (_ BitVec 32) List!17931) Bool)

(assert (=> b!905247 (= res!610517 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17928))))

(declare-fun mapNonEmpty!29614 () Bool)

(declare-fun tp!56812 () Bool)

(assert (=> mapNonEmpty!29614 (= mapRes!29614 (and tp!56812 e!507316))))

(declare-fun mapKey!29614 () (_ BitVec 32))

(declare-fun mapRest!29614 () (Array (_ BitVec 32) ValueCell!8819))

(declare-fun mapValue!29614 () ValueCell!8819)

(assert (=> mapNonEmpty!29614 (= (arr!25601 _values!1152) (store mapRest!29614 mapKey!29614 mapValue!29614))))

(declare-fun b!905249 () Bool)

(assert (=> b!905249 (= e!507317 true)))

(declare-fun lt!408571 () V!29767)

(declare-fun apply!432 (ListLongMap!10779 (_ BitVec 64)) V!29767)

(assert (=> b!905249 (= lt!408571 (apply!432 lt!408569 k0!1033))))

(declare-fun b!905248 () Bool)

(declare-fun res!610525 () Bool)

(assert (=> b!905248 (=> (not res!610525) (not e!507319))))

(assert (=> b!905248 (= res!610525 (contains!4462 (getCurrentListMap!2673 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!610522 () Bool)

(assert (=> start!77766 (=> (not res!610522) (not e!507319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77766 (= res!610522 (validMask!0 mask!1756))))

(assert (=> start!77766 e!507319))

(declare-fun array_inv!20120 (array!53293) Bool)

(assert (=> start!77766 (and (array_inv!20120 _values!1152) e!507321)))

(assert (=> start!77766 tp!56811))

(assert (=> start!77766 true))

(assert (=> start!77766 tp_is_empty!18601))

(declare-fun array_inv!20121 (array!53295) Bool)

(assert (=> start!77766 (array_inv!20121 _keys!1386)))

(assert (= (and start!77766 res!610522) b!905246))

(assert (= (and b!905246 res!610520) b!905245))

(assert (= (and b!905245 res!610518) b!905247))

(assert (= (and b!905247 res!610517) b!905248))

(assert (= (and b!905248 res!610525) b!905242))

(assert (= (and b!905242 res!610519) b!905241))

(assert (= (and b!905241 res!610521) b!905243))

(assert (= (and b!905243 (not res!610523)) b!905244))

(assert (= (and b!905244 (not res!610524)) b!905249))

(assert (= (and b!905240 condMapEmpty!29614) mapIsEmpty!29614))

(assert (= (and b!905240 (not condMapEmpty!29614)) mapNonEmpty!29614))

(get-info :version)

(assert (= (and mapNonEmpty!29614 ((_ is ValueCellFull!8819) mapValue!29614)) b!905239))

(assert (= (and b!905240 ((_ is ValueCellFull!8819) mapDefault!29614)) b!905238))

(assert (= start!77766 b!905240))

(declare-fun m!841139 () Bool)

(assert (=> b!905249 m!841139))

(declare-fun m!841141 () Bool)

(assert (=> b!905248 m!841141))

(assert (=> b!905248 m!841141))

(declare-fun m!841143 () Bool)

(assert (=> b!905248 m!841143))

(declare-fun m!841145 () Bool)

(assert (=> mapNonEmpty!29614 m!841145))

(declare-fun m!841147 () Bool)

(assert (=> start!77766 m!841147))

(declare-fun m!841149 () Bool)

(assert (=> start!77766 m!841149))

(declare-fun m!841151 () Bool)

(assert (=> start!77766 m!841151))

(declare-fun m!841153 () Bool)

(assert (=> b!905243 m!841153))

(declare-fun m!841155 () Bool)

(assert (=> b!905243 m!841155))

(declare-fun m!841157 () Bool)

(assert (=> b!905245 m!841157))

(declare-fun m!841159 () Bool)

(assert (=> b!905244 m!841159))

(declare-fun m!841161 () Bool)

(assert (=> b!905244 m!841161))

(declare-fun m!841163 () Bool)

(assert (=> b!905247 m!841163))

(declare-fun m!841165 () Bool)

(assert (=> b!905241 m!841165))

(declare-fun m!841167 () Bool)

(assert (=> b!905242 m!841167))

(check-sat (not mapNonEmpty!29614) (not b_next!16183) tp_is_empty!18601 (not b!905245) (not start!77766) (not b!905247) (not b!905243) (not b!905242) (not b!905244) (not b!905249) b_and!26559 (not b!905248))
(check-sat b_and!26559 (not b_next!16183))
