; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93842 () Bool)

(assert start!93842)

(declare-fun b_free!21315 () Bool)

(declare-fun b_next!21315 () Bool)

(assert (=> start!93842 (= b_free!21315 (not b_next!21315))))

(declare-fun tp!75368 () Bool)

(declare-fun b_and!34029 () Bool)

(assert (=> start!93842 (= tp!75368 b_and!34029)))

(declare-fun b!1061369 () Bool)

(declare-fun e!604395 () Bool)

(declare-fun e!604394 () Bool)

(declare-fun mapRes!39358 () Bool)

(assert (=> b!1061369 (= e!604395 (and e!604394 mapRes!39358))))

(declare-fun condMapEmpty!39358 () Bool)

(declare-datatypes ((V!38635 0))(
  ( (V!38636 (val!12613 Int)) )
))
(declare-datatypes ((ValueCell!11859 0))(
  ( (ValueCellFull!11859 (v!15223 V!38635)) (EmptyCell!11859) )
))
(declare-datatypes ((array!67253 0))(
  ( (array!67254 (arr!32334 (Array (_ BitVec 32) ValueCell!11859)) (size!32870 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67253)

(declare-fun mapDefault!39358 () ValueCell!11859)

(assert (=> b!1061369 (= condMapEmpty!39358 (= (arr!32334 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11859)) mapDefault!39358)))))

(declare-fun b!1061370 () Bool)

(declare-fun res!708782 () Bool)

(declare-fun e!604398 () Bool)

(assert (=> b!1061370 (=> (not res!708782) (not e!604398))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67255 0))(
  ( (array!67256 (arr!32335 (Array (_ BitVec 32) (_ BitVec 64))) (size!32871 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67255)

(assert (=> b!1061370 (= res!708782 (and (= (size!32870 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32871 _keys!1163) (size!32870 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061371 () Bool)

(assert (=> b!1061371 (= e!604398 (not true))))

(declare-datatypes ((tuple2!15942 0))(
  ( (tuple2!15943 (_1!7982 (_ BitVec 64)) (_2!7982 V!38635)) )
))
(declare-datatypes ((List!22527 0))(
  ( (Nil!22524) (Cons!22523 (h!23732 tuple2!15942) (t!31836 List!22527)) )
))
(declare-datatypes ((ListLongMap!13911 0))(
  ( (ListLongMap!13912 (toList!6971 List!22527)) )
))
(declare-fun lt!467567 () ListLongMap!13911)

(declare-fun lt!467569 () ListLongMap!13911)

(assert (=> b!1061371 (= lt!467567 lt!467569)))

(declare-fun zeroValueBefore!47 () V!38635)

(declare-fun minValue!907 () V!38635)

(declare-datatypes ((Unit!34744 0))(
  ( (Unit!34745) )
))
(declare-fun lt!467568 () Unit!34744)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38635)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!610 (array!67255 array!67253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38635 V!38635 V!38635 V!38635 (_ BitVec 32) Int) Unit!34744)

(assert (=> b!1061371 (= lt!467568 (lemmaNoChangeToArrayThenSameMapNoExtras!610 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3573 (array!67255 array!67253 (_ BitVec 32) (_ BitVec 32) V!38635 V!38635 (_ BitVec 32) Int) ListLongMap!13911)

(assert (=> b!1061371 (= lt!467569 (getCurrentListMapNoExtraKeys!3573 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061371 (= lt!467567 (getCurrentListMapNoExtraKeys!3573 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39358 () Bool)

(assert (=> mapIsEmpty!39358 mapRes!39358))

(declare-fun res!708784 () Bool)

(assert (=> start!93842 (=> (not res!708784) (not e!604398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93842 (= res!708784 (validMask!0 mask!1515))))

(assert (=> start!93842 e!604398))

(assert (=> start!93842 true))

(declare-fun tp_is_empty!25125 () Bool)

(assert (=> start!93842 tp_is_empty!25125))

(declare-fun array_inv!25054 (array!67253) Bool)

(assert (=> start!93842 (and (array_inv!25054 _values!955) e!604395)))

(assert (=> start!93842 tp!75368))

(declare-fun array_inv!25055 (array!67255) Bool)

(assert (=> start!93842 (array_inv!25055 _keys!1163)))

(declare-fun mapNonEmpty!39358 () Bool)

(declare-fun tp!75367 () Bool)

(declare-fun e!604396 () Bool)

(assert (=> mapNonEmpty!39358 (= mapRes!39358 (and tp!75367 e!604396))))

(declare-fun mapValue!39358 () ValueCell!11859)

(declare-fun mapKey!39358 () (_ BitVec 32))

(declare-fun mapRest!39358 () (Array (_ BitVec 32) ValueCell!11859))

(assert (=> mapNonEmpty!39358 (= (arr!32334 _values!955) (store mapRest!39358 mapKey!39358 mapValue!39358))))

(declare-fun b!1061372 () Bool)

(assert (=> b!1061372 (= e!604394 tp_is_empty!25125)))

(declare-fun b!1061373 () Bool)

(declare-fun res!708783 () Bool)

(assert (=> b!1061373 (=> (not res!708783) (not e!604398))))

(declare-datatypes ((List!22528 0))(
  ( (Nil!22525) (Cons!22524 (h!23733 (_ BitVec 64)) (t!31837 List!22528)) )
))
(declare-fun arrayNoDuplicates!0 (array!67255 (_ BitVec 32) List!22528) Bool)

(assert (=> b!1061373 (= res!708783 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22525))))

(declare-fun b!1061374 () Bool)

(declare-fun res!708781 () Bool)

(assert (=> b!1061374 (=> (not res!708781) (not e!604398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67255 (_ BitVec 32)) Bool)

(assert (=> b!1061374 (= res!708781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061375 () Bool)

(assert (=> b!1061375 (= e!604396 tp_is_empty!25125)))

(assert (= (and start!93842 res!708784) b!1061370))

(assert (= (and b!1061370 res!708782) b!1061374))

(assert (= (and b!1061374 res!708781) b!1061373))

(assert (= (and b!1061373 res!708783) b!1061371))

(assert (= (and b!1061369 condMapEmpty!39358) mapIsEmpty!39358))

(assert (= (and b!1061369 (not condMapEmpty!39358)) mapNonEmpty!39358))

(get-info :version)

(assert (= (and mapNonEmpty!39358 ((_ is ValueCellFull!11859) mapValue!39358)) b!1061375))

(assert (= (and b!1061369 ((_ is ValueCellFull!11859) mapDefault!39358)) b!1061372))

(assert (= start!93842 b!1061369))

(declare-fun m!980229 () Bool)

(assert (=> mapNonEmpty!39358 m!980229))

(declare-fun m!980231 () Bool)

(assert (=> b!1061374 m!980231))

(declare-fun m!980233 () Bool)

(assert (=> start!93842 m!980233))

(declare-fun m!980235 () Bool)

(assert (=> start!93842 m!980235))

(declare-fun m!980237 () Bool)

(assert (=> start!93842 m!980237))

(declare-fun m!980239 () Bool)

(assert (=> b!1061371 m!980239))

(declare-fun m!980241 () Bool)

(assert (=> b!1061371 m!980241))

(declare-fun m!980243 () Bool)

(assert (=> b!1061371 m!980243))

(declare-fun m!980245 () Bool)

(assert (=> b!1061373 m!980245))

(check-sat tp_is_empty!25125 (not start!93842) (not b!1061371) b_and!34029 (not b!1061374) (not b_next!21315) (not mapNonEmpty!39358) (not b!1061373))
(check-sat b_and!34029 (not b_next!21315))
