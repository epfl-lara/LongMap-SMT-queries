; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77966 () Bool)

(assert start!77966)

(declare-fun b_free!16509 () Bool)

(declare-fun b_next!16509 () Bool)

(assert (=> start!77966 (= b_free!16509 (not b_next!16509))))

(declare-fun tp!57794 () Bool)

(declare-fun b_and!27079 () Bool)

(assert (=> start!77966 (= tp!57794 b_and!27079)))

(declare-fun b!910232 () Bool)

(declare-fun e!510330 () Bool)

(declare-fun e!510331 () Bool)

(declare-fun mapRes!30109 () Bool)

(assert (=> b!910232 (= e!510330 (and e!510331 mapRes!30109))))

(declare-fun condMapEmpty!30109 () Bool)

(declare-datatypes ((V!30201 0))(
  ( (V!30202 (val!9514 Int)) )
))
(declare-datatypes ((ValueCell!8982 0))(
  ( (ValueCellFull!8982 (v!12022 V!30201)) (EmptyCell!8982) )
))
(declare-datatypes ((array!53872 0))(
  ( (array!53873 (arr!25893 (Array (_ BitVec 32) ValueCell!8982)) (size!26352 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53872)

(declare-fun mapDefault!30109 () ValueCell!8982)

(assert (=> b!910232 (= condMapEmpty!30109 (= (arr!25893 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8982)) mapDefault!30109)))))

(declare-fun b!910233 () Bool)

(declare-fun e!510333 () Bool)

(assert (=> b!910233 (= e!510333 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!410168 () Bool)

(declare-fun zeroValue!1094 () V!30201)

(declare-datatypes ((array!53874 0))(
  ( (array!53875 (arr!25894 (Array (_ BitVec 32) (_ BitVec 64))) (size!26353 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53874)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30201)

(declare-datatypes ((tuple2!12396 0))(
  ( (tuple2!12397 (_1!6209 (_ BitVec 64)) (_2!6209 V!30201)) )
))
(declare-datatypes ((List!18188 0))(
  ( (Nil!18185) (Cons!18184 (h!19330 tuple2!12396) (t!25771 List!18188)) )
))
(declare-datatypes ((ListLongMap!11093 0))(
  ( (ListLongMap!11094 (toList!5562 List!18188)) )
))
(declare-fun contains!4605 (ListLongMap!11093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2824 (array!53874 array!53872 (_ BitVec 32) (_ BitVec 32) V!30201 V!30201 (_ BitVec 32) Int) ListLongMap!11093)

(assert (=> b!910233 (= lt!410168 (contains!4605 (getCurrentListMap!2824 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30109 () Bool)

(assert (=> mapIsEmpty!30109 mapRes!30109))

(declare-fun res!614256 () Bool)

(assert (=> start!77966 (=> (not res!614256) (not e!510333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77966 (= res!614256 (validMask!0 mask!1756))))

(assert (=> start!77966 e!510333))

(declare-fun array_inv!20252 (array!53872) Bool)

(assert (=> start!77966 (and (array_inv!20252 _values!1152) e!510330)))

(assert (=> start!77966 tp!57794))

(assert (=> start!77966 true))

(declare-fun tp_is_empty!18927 () Bool)

(assert (=> start!77966 tp_is_empty!18927))

(declare-fun array_inv!20253 (array!53874) Bool)

(assert (=> start!77966 (array_inv!20253 _keys!1386)))

(declare-fun b!910234 () Bool)

(declare-fun res!614254 () Bool)

(assert (=> b!910234 (=> (not res!614254) (not e!510333))))

(assert (=> b!910234 (= res!614254 (and (= (size!26352 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26353 _keys!1386) (size!26352 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910235 () Bool)

(declare-fun res!614253 () Bool)

(assert (=> b!910235 (=> (not res!614253) (not e!510333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53874 (_ BitVec 32)) Bool)

(assert (=> b!910235 (= res!614253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910236 () Bool)

(assert (=> b!910236 (= e!510331 tp_is_empty!18927)))

(declare-fun b!910237 () Bool)

(declare-fun e!510332 () Bool)

(assert (=> b!910237 (= e!510332 tp_is_empty!18927)))

(declare-fun mapNonEmpty!30109 () Bool)

(declare-fun tp!57795 () Bool)

(assert (=> mapNonEmpty!30109 (= mapRes!30109 (and tp!57795 e!510332))))

(declare-fun mapValue!30109 () ValueCell!8982)

(declare-fun mapKey!30109 () (_ BitVec 32))

(declare-fun mapRest!30109 () (Array (_ BitVec 32) ValueCell!8982))

(assert (=> mapNonEmpty!30109 (= (arr!25893 _values!1152) (store mapRest!30109 mapKey!30109 mapValue!30109))))

(declare-fun b!910238 () Bool)

(declare-fun res!614255 () Bool)

(assert (=> b!910238 (=> (not res!614255) (not e!510333))))

(declare-datatypes ((List!18189 0))(
  ( (Nil!18186) (Cons!18185 (h!19331 (_ BitVec 64)) (t!25772 List!18189)) )
))
(declare-fun arrayNoDuplicates!0 (array!53874 (_ BitVec 32) List!18189) Bool)

(assert (=> b!910238 (= res!614255 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18186))))

(assert (= (and start!77966 res!614256) b!910234))

(assert (= (and b!910234 res!614254) b!910235))

(assert (= (and b!910235 res!614253) b!910238))

(assert (= (and b!910238 res!614255) b!910233))

(assert (= (and b!910232 condMapEmpty!30109) mapIsEmpty!30109))

(assert (= (and b!910232 (not condMapEmpty!30109)) mapNonEmpty!30109))

(get-info :version)

(assert (= (and mapNonEmpty!30109 ((_ is ValueCellFull!8982) mapValue!30109)) b!910237))

(assert (= (and b!910232 ((_ is ValueCellFull!8982) mapDefault!30109)) b!910236))

(assert (= start!77966 b!910232))

(declare-fun m!845285 () Bool)

(assert (=> b!910233 m!845285))

(assert (=> b!910233 m!845285))

(declare-fun m!845287 () Bool)

(assert (=> b!910233 m!845287))

(declare-fun m!845289 () Bool)

(assert (=> b!910235 m!845289))

(declare-fun m!845291 () Bool)

(assert (=> start!77966 m!845291))

(declare-fun m!845293 () Bool)

(assert (=> start!77966 m!845293))

(declare-fun m!845295 () Bool)

(assert (=> start!77966 m!845295))

(declare-fun m!845297 () Bool)

(assert (=> mapNonEmpty!30109 m!845297))

(declare-fun m!845299 () Bool)

(assert (=> b!910238 m!845299))

(check-sat (not b!910233) (not b!910238) (not b_next!16509) (not mapNonEmpty!30109) tp_is_empty!18927 b_and!27079 (not b!910235) (not start!77966))
(check-sat b_and!27079 (not b_next!16509))
