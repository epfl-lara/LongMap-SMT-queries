; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94034 () Bool)

(assert start!94034)

(declare-fun b_free!21271 () Bool)

(declare-fun b_next!21271 () Bool)

(assert (=> start!94034 (= b_free!21271 (not b_next!21271))))

(declare-fun tp!75236 () Bool)

(declare-fun b_and!33995 () Bool)

(assert (=> start!94034 (= tp!75236 b_and!33995)))

(declare-fun b!1062234 () Bool)

(declare-fun e!604922 () Bool)

(declare-fun tp_is_empty!25081 () Bool)

(assert (=> b!1062234 (= e!604922 tp_is_empty!25081)))

(declare-fun res!709042 () Bool)

(declare-fun e!604919 () Bool)

(assert (=> start!94034 (=> (not res!709042) (not e!604919))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94034 (= res!709042 (validMask!0 mask!1515))))

(assert (=> start!94034 e!604919))

(assert (=> start!94034 true))

(assert (=> start!94034 tp_is_empty!25081))

(declare-datatypes ((V!38577 0))(
  ( (V!38578 (val!12591 Int)) )
))
(declare-datatypes ((ValueCell!11837 0))(
  ( (ValueCellFull!11837 (v!15197 V!38577)) (EmptyCell!11837) )
))
(declare-datatypes ((array!67221 0))(
  ( (array!67222 (arr!32312 (Array (_ BitVec 32) ValueCell!11837)) (size!32849 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67221)

(declare-fun e!604921 () Bool)

(declare-fun array_inv!25050 (array!67221) Bool)

(assert (=> start!94034 (and (array_inv!25050 _values!955) e!604921)))

(assert (=> start!94034 tp!75236))

(declare-datatypes ((array!67223 0))(
  ( (array!67224 (arr!32313 (Array (_ BitVec 32) (_ BitVec 64))) (size!32850 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67223)

(declare-fun array_inv!25051 (array!67223) Bool)

(assert (=> start!94034 (array_inv!25051 _keys!1163)))

(declare-fun mapNonEmpty!39292 () Bool)

(declare-fun mapRes!39292 () Bool)

(declare-fun tp!75235 () Bool)

(declare-fun e!604920 () Bool)

(assert (=> mapNonEmpty!39292 (= mapRes!39292 (and tp!75235 e!604920))))

(declare-fun mapValue!39292 () ValueCell!11837)

(declare-fun mapRest!39292 () (Array (_ BitVec 32) ValueCell!11837))

(declare-fun mapKey!39292 () (_ BitVec 32))

(assert (=> mapNonEmpty!39292 (= (arr!32312 _values!955) (store mapRest!39292 mapKey!39292 mapValue!39292))))

(declare-fun b!1062235 () Bool)

(declare-fun res!709040 () Bool)

(assert (=> b!1062235 (=> (not res!709040) (not e!604919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67223 (_ BitVec 32)) Bool)

(assert (=> b!1062235 (= res!709040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062236 () Bool)

(assert (=> b!1062236 (= e!604921 (and e!604922 mapRes!39292))))

(declare-fun condMapEmpty!39292 () Bool)

(declare-fun mapDefault!39292 () ValueCell!11837)

(assert (=> b!1062236 (= condMapEmpty!39292 (= (arr!32312 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11837)) mapDefault!39292)))))

(declare-fun mapIsEmpty!39292 () Bool)

(assert (=> mapIsEmpty!39292 mapRes!39292))

(declare-fun b!1062237 () Bool)

(assert (=> b!1062237 (= e!604920 tp_is_empty!25081)))

(declare-fun b!1062238 () Bool)

(declare-fun res!709041 () Bool)

(assert (=> b!1062238 (=> (not res!709041) (not e!604919))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062238 (= res!709041 (and (= (size!32849 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32850 _keys!1163) (size!32849 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062239 () Bool)

(declare-fun res!709039 () Bool)

(assert (=> b!1062239 (=> (not res!709039) (not e!604919))))

(declare-datatypes ((List!22485 0))(
  ( (Nil!22482) (Cons!22481 (h!23699 (_ BitVec 64)) (t!31786 List!22485)) )
))
(declare-fun arrayNoDuplicates!0 (array!67223 (_ BitVec 32) List!22485) Bool)

(assert (=> b!1062239 (= res!709039 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22482))))

(declare-fun b!1062240 () Bool)

(assert (=> b!1062240 (= e!604919 false)))

(declare-datatypes ((tuple2!15902 0))(
  ( (tuple2!15903 (_1!7962 (_ BitVec 64)) (_2!7962 V!38577)) )
))
(declare-datatypes ((List!22486 0))(
  ( (Nil!22483) (Cons!22482 (h!23700 tuple2!15902) (t!31787 List!22486)) )
))
(declare-datatypes ((ListLongMap!13879 0))(
  ( (ListLongMap!13880 (toList!6955 List!22486)) )
))
(declare-fun lt!467928 () ListLongMap!13879)

(declare-fun minValue!907 () V!38577)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38577)

(declare-fun getCurrentListMapNoExtraKeys!3603 (array!67223 array!67221 (_ BitVec 32) (_ BitVec 32) V!38577 V!38577 (_ BitVec 32) Int) ListLongMap!13879)

(assert (=> b!1062240 (= lt!467928 (getCurrentListMapNoExtraKeys!3603 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38577)

(declare-fun lt!467927 () ListLongMap!13879)

(assert (=> b!1062240 (= lt!467927 (getCurrentListMapNoExtraKeys!3603 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94034 res!709042) b!1062238))

(assert (= (and b!1062238 res!709041) b!1062235))

(assert (= (and b!1062235 res!709040) b!1062239))

(assert (= (and b!1062239 res!709039) b!1062240))

(assert (= (and b!1062236 condMapEmpty!39292) mapIsEmpty!39292))

(assert (= (and b!1062236 (not condMapEmpty!39292)) mapNonEmpty!39292))

(get-info :version)

(assert (= (and mapNonEmpty!39292 ((_ is ValueCellFull!11837) mapValue!39292)) b!1062237))

(assert (= (and b!1062236 ((_ is ValueCellFull!11837) mapDefault!39292)) b!1062234))

(assert (= start!94034 b!1062236))

(declare-fun m!981535 () Bool)

(assert (=> b!1062239 m!981535))

(declare-fun m!981537 () Bool)

(assert (=> b!1062235 m!981537))

(declare-fun m!981539 () Bool)

(assert (=> start!94034 m!981539))

(declare-fun m!981541 () Bool)

(assert (=> start!94034 m!981541))

(declare-fun m!981543 () Bool)

(assert (=> start!94034 m!981543))

(declare-fun m!981545 () Bool)

(assert (=> b!1062240 m!981545))

(declare-fun m!981547 () Bool)

(assert (=> b!1062240 m!981547))

(declare-fun m!981549 () Bool)

(assert (=> mapNonEmpty!39292 m!981549))

(check-sat (not mapNonEmpty!39292) (not b!1062240) (not b!1062235) (not b_next!21271) (not b!1062239) (not start!94034) b_and!33995 tp_is_empty!25081)
(check-sat b_and!33995 (not b_next!21271))
