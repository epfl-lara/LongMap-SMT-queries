; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41468 () Bool)

(assert start!41468)

(declare-fun b_free!11149 () Bool)

(declare-fun b_next!11149 () Bool)

(assert (=> start!41468 (= b_free!11149 (not b_next!11149))))

(declare-fun tp!39445 () Bool)

(declare-fun b_and!19499 () Bool)

(assert (=> start!41468 (= tp!39445 b_and!19499)))

(declare-fun b!463350 () Bool)

(declare-fun res!277081 () Bool)

(declare-fun e!270528 () Bool)

(assert (=> b!463350 (=> (not res!277081) (not e!270528))))

(declare-datatypes ((array!28950 0))(
  ( (array!28951 (arr!13906 (Array (_ BitVec 32) (_ BitVec 64))) (size!14258 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28950)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28950 (_ BitVec 32)) Bool)

(assert (=> b!463350 (= res!277081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463351 () Bool)

(assert (=> b!463351 (= e!270528 false)))

(declare-datatypes ((V!17875 0))(
  ( (V!17876 (val!6333 Int)) )
))
(declare-fun zeroValue!794 () V!17875)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5945 0))(
  ( (ValueCellFull!5945 (v!8621 V!17875)) (EmptyCell!5945) )
))
(declare-datatypes ((array!28952 0))(
  ( (array!28953 (arr!13907 (Array (_ BitVec 32) ValueCell!5945)) (size!14259 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28952)

(declare-datatypes ((tuple2!8234 0))(
  ( (tuple2!8235 (_1!4128 (_ BitVec 64)) (_2!4128 V!17875)) )
))
(declare-datatypes ((List!8315 0))(
  ( (Nil!8312) (Cons!8311 (h!9167 tuple2!8234) (t!14253 List!8315)) )
))
(declare-datatypes ((ListLongMap!7149 0))(
  ( (ListLongMap!7150 (toList!3590 List!8315)) )
))
(declare-fun lt!209383 () ListLongMap!7149)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17875)

(declare-fun getCurrentListMapNoExtraKeys!1817 (array!28950 array!28952 (_ BitVec 32) (_ BitVec 32) V!17875 V!17875 (_ BitVec 32) Int) ListLongMap!7149)

(assert (=> b!463351 (= lt!209383 (getCurrentListMapNoExtraKeys!1817 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!17875)

(declare-fun lt!209384 () ListLongMap!7149)

(assert (=> b!463351 (= lt!209384 (getCurrentListMapNoExtraKeys!1817 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20542 () Bool)

(declare-fun mapRes!20542 () Bool)

(declare-fun tp!39444 () Bool)

(declare-fun e!270525 () Bool)

(assert (=> mapNonEmpty!20542 (= mapRes!20542 (and tp!39444 e!270525))))

(declare-fun mapRest!20542 () (Array (_ BitVec 32) ValueCell!5945))

(declare-fun mapKey!20542 () (_ BitVec 32))

(declare-fun mapValue!20542 () ValueCell!5945)

(assert (=> mapNonEmpty!20542 (= (arr!13907 _values!833) (store mapRest!20542 mapKey!20542 mapValue!20542))))

(declare-fun b!463352 () Bool)

(declare-fun e!270524 () Bool)

(declare-fun e!270526 () Bool)

(assert (=> b!463352 (= e!270524 (and e!270526 mapRes!20542))))

(declare-fun condMapEmpty!20542 () Bool)

(declare-fun mapDefault!20542 () ValueCell!5945)

(assert (=> b!463352 (= condMapEmpty!20542 (= (arr!13907 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5945)) mapDefault!20542)))))

(declare-fun b!463353 () Bool)

(declare-fun res!277080 () Bool)

(assert (=> b!463353 (=> (not res!277080) (not e!270528))))

(assert (=> b!463353 (= res!277080 (and (= (size!14259 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14258 _keys!1025) (size!14259 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20542 () Bool)

(assert (=> mapIsEmpty!20542 mapRes!20542))

(declare-fun b!463354 () Bool)

(declare-fun tp_is_empty!12577 () Bool)

(assert (=> b!463354 (= e!270525 tp_is_empty!12577)))

(declare-fun res!277078 () Bool)

(assert (=> start!41468 (=> (not res!277078) (not e!270528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41468 (= res!277078 (validMask!0 mask!1365))))

(assert (=> start!41468 e!270528))

(assert (=> start!41468 tp_is_empty!12577))

(assert (=> start!41468 tp!39445))

(assert (=> start!41468 true))

(declare-fun array_inv!10134 (array!28950) Bool)

(assert (=> start!41468 (array_inv!10134 _keys!1025)))

(declare-fun array_inv!10135 (array!28952) Bool)

(assert (=> start!41468 (and (array_inv!10135 _values!833) e!270524)))

(declare-fun b!463355 () Bool)

(declare-fun res!277079 () Bool)

(assert (=> b!463355 (=> (not res!277079) (not e!270528))))

(declare-datatypes ((List!8316 0))(
  ( (Nil!8313) (Cons!8312 (h!9168 (_ BitVec 64)) (t!14254 List!8316)) )
))
(declare-fun arrayNoDuplicates!0 (array!28950 (_ BitVec 32) List!8316) Bool)

(assert (=> b!463355 (= res!277079 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8313))))

(declare-fun b!463356 () Bool)

(assert (=> b!463356 (= e!270526 tp_is_empty!12577)))

(assert (= (and start!41468 res!277078) b!463353))

(assert (= (and b!463353 res!277080) b!463350))

(assert (= (and b!463350 res!277081) b!463355))

(assert (= (and b!463355 res!277079) b!463351))

(assert (= (and b!463352 condMapEmpty!20542) mapIsEmpty!20542))

(assert (= (and b!463352 (not condMapEmpty!20542)) mapNonEmpty!20542))

(get-info :version)

(assert (= (and mapNonEmpty!20542 ((_ is ValueCellFull!5945) mapValue!20542)) b!463354))

(assert (= (and b!463352 ((_ is ValueCellFull!5945) mapDefault!20542)) b!463356))

(assert (= start!41468 b!463352))

(declare-fun m!446191 () Bool)

(assert (=> mapNonEmpty!20542 m!446191))

(declare-fun m!446193 () Bool)

(assert (=> start!41468 m!446193))

(declare-fun m!446195 () Bool)

(assert (=> start!41468 m!446195))

(declare-fun m!446197 () Bool)

(assert (=> start!41468 m!446197))

(declare-fun m!446199 () Bool)

(assert (=> b!463355 m!446199))

(declare-fun m!446201 () Bool)

(assert (=> b!463351 m!446201))

(declare-fun m!446203 () Bool)

(assert (=> b!463351 m!446203))

(declare-fun m!446205 () Bool)

(assert (=> b!463350 m!446205))

(check-sat tp_is_empty!12577 (not mapNonEmpty!20542) (not b!463355) (not b_next!11149) (not b!463350) b_and!19499 (not start!41468) (not b!463351))
(check-sat b_and!19499 (not b_next!11149))
