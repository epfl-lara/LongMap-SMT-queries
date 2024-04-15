; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41468 () Bool)

(assert start!41468)

(declare-fun b_free!11149 () Bool)

(declare-fun b_next!11149 () Bool)

(assert (=> start!41468 (= b_free!11149 (not b_next!11149))))

(declare-fun tp!39444 () Bool)

(declare-fun b_and!19463 () Bool)

(assert (=> start!41468 (= tp!39444 b_and!19463)))

(declare-fun mapIsEmpty!20542 () Bool)

(declare-fun mapRes!20542 () Bool)

(assert (=> mapIsEmpty!20542 mapRes!20542))

(declare-fun res!276957 () Bool)

(declare-fun e!270391 () Bool)

(assert (=> start!41468 (=> (not res!276957) (not e!270391))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41468 (= res!276957 (validMask!0 mask!1365))))

(assert (=> start!41468 e!270391))

(declare-fun tp_is_empty!12577 () Bool)

(assert (=> start!41468 tp_is_empty!12577))

(assert (=> start!41468 tp!39444))

(assert (=> start!41468 true))

(declare-datatypes ((array!28947 0))(
  ( (array!28948 (arr!13905 (Array (_ BitVec 32) (_ BitVec 64))) (size!14258 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28947)

(declare-fun array_inv!10116 (array!28947) Bool)

(assert (=> start!41468 (array_inv!10116 _keys!1025)))

(declare-datatypes ((V!17875 0))(
  ( (V!17876 (val!6333 Int)) )
))
(declare-datatypes ((ValueCell!5945 0))(
  ( (ValueCellFull!5945 (v!8614 V!17875)) (EmptyCell!5945) )
))
(declare-datatypes ((array!28949 0))(
  ( (array!28950 (arr!13906 (Array (_ BitVec 32) ValueCell!5945)) (size!14259 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28949)

(declare-fun e!270389 () Bool)

(declare-fun array_inv!10117 (array!28949) Bool)

(assert (=> start!41468 (and (array_inv!10117 _values!833) e!270389)))

(declare-fun b!463140 () Bool)

(declare-fun res!276956 () Bool)

(assert (=> b!463140 (=> (not res!276956) (not e!270391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28947 (_ BitVec 32)) Bool)

(assert (=> b!463140 (= res!276956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463141 () Bool)

(declare-fun res!276958 () Bool)

(assert (=> b!463141 (=> (not res!276958) (not e!270391))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463141 (= res!276958 (and (= (size!14259 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14258 _keys!1025) (size!14259 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463142 () Bool)

(declare-fun e!270390 () Bool)

(assert (=> b!463142 (= e!270390 tp_is_empty!12577)))

(declare-fun b!463143 () Bool)

(declare-fun e!270393 () Bool)

(assert (=> b!463143 (= e!270393 tp_is_empty!12577)))

(declare-fun b!463144 () Bool)

(assert (=> b!463144 (= e!270391 false)))

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!17875)

(declare-datatypes ((tuple2!8328 0))(
  ( (tuple2!8329 (_1!4175 (_ BitVec 64)) (_2!4175 V!17875)) )
))
(declare-datatypes ((List!8415 0))(
  ( (Nil!8412) (Cons!8411 (h!9267 tuple2!8328) (t!14352 List!8415)) )
))
(declare-datatypes ((ListLongMap!7231 0))(
  ( (ListLongMap!7232 (toList!3631 List!8415)) )
))
(declare-fun lt!209137 () ListLongMap!7231)

(declare-fun minValueAfter!38 () V!17875)

(declare-fun getCurrentListMapNoExtraKeys!1823 (array!28947 array!28949 (_ BitVec 32) (_ BitVec 32) V!17875 V!17875 (_ BitVec 32) Int) ListLongMap!7231)

(assert (=> b!463144 (= lt!209137 (getCurrentListMapNoExtraKeys!1823 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17875)

(declare-fun lt!209138 () ListLongMap!7231)

(assert (=> b!463144 (= lt!209138 (getCurrentListMapNoExtraKeys!1823 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463145 () Bool)

(assert (=> b!463145 (= e!270389 (and e!270390 mapRes!20542))))

(declare-fun condMapEmpty!20542 () Bool)

(declare-fun mapDefault!20542 () ValueCell!5945)

(assert (=> b!463145 (= condMapEmpty!20542 (= (arr!13906 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5945)) mapDefault!20542)))))

(declare-fun mapNonEmpty!20542 () Bool)

(declare-fun tp!39445 () Bool)

(assert (=> mapNonEmpty!20542 (= mapRes!20542 (and tp!39445 e!270393))))

(declare-fun mapValue!20542 () ValueCell!5945)

(declare-fun mapRest!20542 () (Array (_ BitVec 32) ValueCell!5945))

(declare-fun mapKey!20542 () (_ BitVec 32))

(assert (=> mapNonEmpty!20542 (= (arr!13906 _values!833) (store mapRest!20542 mapKey!20542 mapValue!20542))))

(declare-fun b!463146 () Bool)

(declare-fun res!276959 () Bool)

(assert (=> b!463146 (=> (not res!276959) (not e!270391))))

(declare-datatypes ((List!8416 0))(
  ( (Nil!8413) (Cons!8412 (h!9268 (_ BitVec 64)) (t!14353 List!8416)) )
))
(declare-fun arrayNoDuplicates!0 (array!28947 (_ BitVec 32) List!8416) Bool)

(assert (=> b!463146 (= res!276959 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8413))))

(assert (= (and start!41468 res!276957) b!463141))

(assert (= (and b!463141 res!276958) b!463140))

(assert (= (and b!463140 res!276956) b!463146))

(assert (= (and b!463146 res!276959) b!463144))

(assert (= (and b!463145 condMapEmpty!20542) mapIsEmpty!20542))

(assert (= (and b!463145 (not condMapEmpty!20542)) mapNonEmpty!20542))

(get-info :version)

(assert (= (and mapNonEmpty!20542 ((_ is ValueCellFull!5945) mapValue!20542)) b!463143))

(assert (= (and b!463145 ((_ is ValueCellFull!5945) mapDefault!20542)) b!463142))

(assert (= start!41468 b!463145))

(declare-fun m!445275 () Bool)

(assert (=> start!41468 m!445275))

(declare-fun m!445277 () Bool)

(assert (=> start!41468 m!445277))

(declare-fun m!445279 () Bool)

(assert (=> start!41468 m!445279))

(declare-fun m!445281 () Bool)

(assert (=> b!463146 m!445281))

(declare-fun m!445283 () Bool)

(assert (=> mapNonEmpty!20542 m!445283))

(declare-fun m!445285 () Bool)

(assert (=> b!463144 m!445285))

(declare-fun m!445287 () Bool)

(assert (=> b!463144 m!445287))

(declare-fun m!445289 () Bool)

(assert (=> b!463140 m!445289))

(check-sat tp_is_empty!12577 b_and!19463 (not b!463144) (not b!463146) (not b_next!11149) (not mapNonEmpty!20542) (not b!463140) (not start!41468))
(check-sat b_and!19463 (not b_next!11149))
