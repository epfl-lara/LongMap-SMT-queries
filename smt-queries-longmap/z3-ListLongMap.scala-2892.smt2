; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41480 () Bool)

(assert start!41480)

(declare-fun b_free!11161 () Bool)

(declare-fun b_next!11161 () Bool)

(assert (=> start!41480 (= b_free!11161 (not b_next!11161))))

(declare-fun tp!39480 () Bool)

(declare-fun b_and!19511 () Bool)

(assert (=> start!41480 (= tp!39480 b_and!19511)))

(declare-fun b!463476 () Bool)

(declare-fun res!277150 () Bool)

(declare-fun e!270614 () Bool)

(assert (=> b!463476 (=> (not res!277150) (not e!270614))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!28974 0))(
  ( (array!28975 (arr!13918 (Array (_ BitVec 32) (_ BitVec 64))) (size!14270 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28974)

(declare-datatypes ((V!17891 0))(
  ( (V!17892 (val!6339 Int)) )
))
(declare-datatypes ((ValueCell!5951 0))(
  ( (ValueCellFull!5951 (v!8627 V!17891)) (EmptyCell!5951) )
))
(declare-datatypes ((array!28976 0))(
  ( (array!28977 (arr!13919 (Array (_ BitVec 32) ValueCell!5951)) (size!14271 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28976)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463476 (= res!277150 (and (= (size!14271 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14270 _keys!1025) (size!14271 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20560 () Bool)

(declare-fun mapRes!20560 () Bool)

(declare-fun tp!39481 () Bool)

(declare-fun e!270617 () Bool)

(assert (=> mapNonEmpty!20560 (= mapRes!20560 (and tp!39481 e!270617))))

(declare-fun mapRest!20560 () (Array (_ BitVec 32) ValueCell!5951))

(declare-fun mapKey!20560 () (_ BitVec 32))

(declare-fun mapValue!20560 () ValueCell!5951)

(assert (=> mapNonEmpty!20560 (= (arr!13919 _values!833) (store mapRest!20560 mapKey!20560 mapValue!20560))))

(declare-fun b!463477 () Bool)

(declare-fun tp_is_empty!12589 () Bool)

(assert (=> b!463477 (= e!270617 tp_is_empty!12589)))

(declare-fun b!463478 () Bool)

(declare-fun e!270616 () Bool)

(assert (=> b!463478 (= e!270616 tp_is_empty!12589)))

(declare-fun b!463479 () Bool)

(declare-fun res!277152 () Bool)

(assert (=> b!463479 (=> (not res!277152) (not e!270614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28974 (_ BitVec 32)) Bool)

(assert (=> b!463479 (= res!277152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277151 () Bool)

(assert (=> start!41480 (=> (not res!277151) (not e!270614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41480 (= res!277151 (validMask!0 mask!1365))))

(assert (=> start!41480 e!270614))

(assert (=> start!41480 tp_is_empty!12589))

(assert (=> start!41480 tp!39480))

(assert (=> start!41480 true))

(declare-fun array_inv!10146 (array!28974) Bool)

(assert (=> start!41480 (array_inv!10146 _keys!1025)))

(declare-fun e!270615 () Bool)

(declare-fun array_inv!10147 (array!28976) Bool)

(assert (=> start!41480 (and (array_inv!10147 _values!833) e!270615)))

(declare-fun b!463480 () Bool)

(assert (=> b!463480 (= e!270615 (and e!270616 mapRes!20560))))

(declare-fun condMapEmpty!20560 () Bool)

(declare-fun mapDefault!20560 () ValueCell!5951)

(assert (=> b!463480 (= condMapEmpty!20560 (= (arr!13919 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5951)) mapDefault!20560)))))

(declare-fun mapIsEmpty!20560 () Bool)

(assert (=> mapIsEmpty!20560 mapRes!20560))

(declare-fun b!463481 () Bool)

(declare-fun res!277153 () Bool)

(assert (=> b!463481 (=> (not res!277153) (not e!270614))))

(declare-datatypes ((List!8327 0))(
  ( (Nil!8324) (Cons!8323 (h!9179 (_ BitVec 64)) (t!14265 List!8327)) )
))
(declare-fun arrayNoDuplicates!0 (array!28974 (_ BitVec 32) List!8327) Bool)

(assert (=> b!463481 (= res!277153 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8324))))

(declare-fun b!463482 () Bool)

(assert (=> b!463482 (= e!270614 false)))

(declare-datatypes ((tuple2!8246 0))(
  ( (tuple2!8247 (_1!4134 (_ BitVec 64)) (_2!4134 V!17891)) )
))
(declare-datatypes ((List!8328 0))(
  ( (Nil!8325) (Cons!8324 (h!9180 tuple2!8246) (t!14266 List!8328)) )
))
(declare-datatypes ((ListLongMap!7161 0))(
  ( (ListLongMap!7162 (toList!3596 List!8328)) )
))
(declare-fun lt!209419 () ListLongMap!7161)

(declare-fun zeroValue!794 () V!17891)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17891)

(declare-fun getCurrentListMapNoExtraKeys!1823 (array!28974 array!28976 (_ BitVec 32) (_ BitVec 32) V!17891 V!17891 (_ BitVec 32) Int) ListLongMap!7161)

(assert (=> b!463482 (= lt!209419 (getCurrentListMapNoExtraKeys!1823 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17891)

(declare-fun lt!209420 () ListLongMap!7161)

(assert (=> b!463482 (= lt!209420 (getCurrentListMapNoExtraKeys!1823 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41480 res!277151) b!463476))

(assert (= (and b!463476 res!277150) b!463479))

(assert (= (and b!463479 res!277152) b!463481))

(assert (= (and b!463481 res!277153) b!463482))

(assert (= (and b!463480 condMapEmpty!20560) mapIsEmpty!20560))

(assert (= (and b!463480 (not condMapEmpty!20560)) mapNonEmpty!20560))

(get-info :version)

(assert (= (and mapNonEmpty!20560 ((_ is ValueCellFull!5951) mapValue!20560)) b!463477))

(assert (= (and b!463480 ((_ is ValueCellFull!5951) mapDefault!20560)) b!463478))

(assert (= start!41480 b!463480))

(declare-fun m!446287 () Bool)

(assert (=> b!463479 m!446287))

(declare-fun m!446289 () Bool)

(assert (=> b!463482 m!446289))

(declare-fun m!446291 () Bool)

(assert (=> b!463482 m!446291))

(declare-fun m!446293 () Bool)

(assert (=> b!463481 m!446293))

(declare-fun m!446295 () Bool)

(assert (=> start!41480 m!446295))

(declare-fun m!446297 () Bool)

(assert (=> start!41480 m!446297))

(declare-fun m!446299 () Bool)

(assert (=> start!41480 m!446299))

(declare-fun m!446301 () Bool)

(assert (=> mapNonEmpty!20560 m!446301))

(check-sat (not b!463479) (not b!463481) (not start!41480) (not b!463482) (not b_next!11161) tp_is_empty!12589 b_and!19511 (not mapNonEmpty!20560))
(check-sat b_and!19511 (not b_next!11161))
