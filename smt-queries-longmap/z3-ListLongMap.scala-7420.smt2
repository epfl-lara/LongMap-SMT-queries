; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94592 () Bool)

(assert start!94592)

(declare-fun b_free!21697 () Bool)

(declare-fun b_next!21697 () Bool)

(assert (=> start!94592 (= b_free!21697 (not b_next!21697))))

(declare-fun tp!76535 () Bool)

(declare-fun b_and!34491 () Bool)

(assert (=> start!94592 (= tp!76535 b_and!34491)))

(declare-fun b!1068301 () Bool)

(declare-fun res!712595 () Bool)

(declare-fun e!609350 () Bool)

(assert (=> b!1068301 (=> (not res!712595) (not e!609350))))

(declare-datatypes ((array!68043 0))(
  ( (array!68044 (arr!32716 (Array (_ BitVec 32) (_ BitVec 64))) (size!33253 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68043)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68043 (_ BitVec 32)) Bool)

(assert (=> b!1068301 (= res!712595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39952 () Bool)

(declare-fun mapRes!39952 () Bool)

(declare-fun tp!76534 () Bool)

(declare-fun e!609353 () Bool)

(assert (=> mapNonEmpty!39952 (= mapRes!39952 (and tp!76534 e!609353))))

(declare-datatypes ((V!39145 0))(
  ( (V!39146 (val!12804 Int)) )
))
(declare-datatypes ((ValueCell!12050 0))(
  ( (ValueCellFull!12050 (v!15414 V!39145)) (EmptyCell!12050) )
))
(declare-fun mapRest!39952 () (Array (_ BitVec 32) ValueCell!12050))

(declare-datatypes ((array!68045 0))(
  ( (array!68046 (arr!32717 (Array (_ BitVec 32) ValueCell!12050)) (size!33254 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68045)

(declare-fun mapKey!39952 () (_ BitVec 32))

(declare-fun mapValue!39952 () ValueCell!12050)

(assert (=> mapNonEmpty!39952 (= (arr!32717 _values!955) (store mapRest!39952 mapKey!39952 mapValue!39952))))

(declare-fun b!1068302 () Bool)

(declare-fun res!712598 () Bool)

(assert (=> b!1068302 (=> (not res!712598) (not e!609350))))

(declare-datatypes ((List!22791 0))(
  ( (Nil!22788) (Cons!22787 (h!24005 (_ BitVec 64)) (t!32106 List!22791)) )
))
(declare-fun arrayNoDuplicates!0 (array!68043 (_ BitVec 32) List!22791) Bool)

(assert (=> b!1068302 (= res!712598 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22788))))

(declare-fun b!1068303 () Bool)

(declare-fun res!712597 () Bool)

(assert (=> b!1068303 (=> (not res!712597) (not e!609350))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068303 (= res!712597 (and (= (size!33254 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33253 _keys!1163) (size!33254 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068304 () Bool)

(declare-fun e!609354 () Bool)

(declare-fun tp_is_empty!25507 () Bool)

(assert (=> b!1068304 (= e!609354 tp_is_empty!25507)))

(declare-fun mapIsEmpty!39952 () Bool)

(assert (=> mapIsEmpty!39952 mapRes!39952))

(declare-fun b!1068305 () Bool)

(declare-fun e!609351 () Bool)

(assert (=> b!1068305 (= e!609351 (and e!609354 mapRes!39952))))

(declare-fun condMapEmpty!39952 () Bool)

(declare-fun mapDefault!39952 () ValueCell!12050)

(assert (=> b!1068305 (= condMapEmpty!39952 (= (arr!32717 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12050)) mapDefault!39952)))))

(declare-fun res!712596 () Bool)

(assert (=> start!94592 (=> (not res!712596) (not e!609350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94592 (= res!712596 (validMask!0 mask!1515))))

(assert (=> start!94592 e!609350))

(assert (=> start!94592 true))

(assert (=> start!94592 tp_is_empty!25507))

(declare-fun array_inv!25352 (array!68045) Bool)

(assert (=> start!94592 (and (array_inv!25352 _values!955) e!609351)))

(assert (=> start!94592 tp!76535))

(declare-fun array_inv!25353 (array!68043) Bool)

(assert (=> start!94592 (array_inv!25353 _keys!1163)))

(declare-fun b!1068306 () Bool)

(assert (=> b!1068306 (= e!609350 (not true))))

(declare-datatypes ((tuple2!16222 0))(
  ( (tuple2!16223 (_1!8122 (_ BitVec 64)) (_2!8122 V!39145)) )
))
(declare-datatypes ((List!22792 0))(
  ( (Nil!22789) (Cons!22788 (h!24006 tuple2!16222) (t!32107 List!22792)) )
))
(declare-datatypes ((ListLongMap!14199 0))(
  ( (ListLongMap!14200 (toList!7115 List!22792)) )
))
(declare-fun lt!471762 () ListLongMap!14199)

(declare-fun lt!471763 () ListLongMap!14199)

(assert (=> b!1068306 (= lt!471762 lt!471763)))

(declare-fun zeroValueBefore!47 () V!39145)

(declare-fun minValue!907 () V!39145)

(declare-datatypes ((Unit!35028 0))(
  ( (Unit!35029) )
))
(declare-fun lt!471764 () Unit!35028)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39145)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!737 (array!68043 array!68045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39145 V!39145 V!39145 V!39145 (_ BitVec 32) Int) Unit!35028)

(assert (=> b!1068306 (= lt!471764 (lemmaNoChangeToArrayThenSameMapNoExtras!737 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3734 (array!68043 array!68045 (_ BitVec 32) (_ BitVec 32) V!39145 V!39145 (_ BitVec 32) Int) ListLongMap!14199)

(assert (=> b!1068306 (= lt!471763 (getCurrentListMapNoExtraKeys!3734 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068306 (= lt!471762 (getCurrentListMapNoExtraKeys!3734 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068307 () Bool)

(assert (=> b!1068307 (= e!609353 tp_is_empty!25507)))

(assert (= (and start!94592 res!712596) b!1068303))

(assert (= (and b!1068303 res!712597) b!1068301))

(assert (= (and b!1068301 res!712595) b!1068302))

(assert (= (and b!1068302 res!712598) b!1068306))

(assert (= (and b!1068305 condMapEmpty!39952) mapIsEmpty!39952))

(assert (= (and b!1068305 (not condMapEmpty!39952)) mapNonEmpty!39952))

(get-info :version)

(assert (= (and mapNonEmpty!39952 ((_ is ValueCellFull!12050) mapValue!39952)) b!1068307))

(assert (= (and b!1068305 ((_ is ValueCellFull!12050) mapDefault!39952)) b!1068304))

(assert (= start!94592 b!1068305))

(declare-fun m!987373 () Bool)

(assert (=> b!1068301 m!987373))

(declare-fun m!987375 () Bool)

(assert (=> start!94592 m!987375))

(declare-fun m!987377 () Bool)

(assert (=> start!94592 m!987377))

(declare-fun m!987379 () Bool)

(assert (=> start!94592 m!987379))

(declare-fun m!987381 () Bool)

(assert (=> mapNonEmpty!39952 m!987381))

(declare-fun m!987383 () Bool)

(assert (=> b!1068302 m!987383))

(declare-fun m!987385 () Bool)

(assert (=> b!1068306 m!987385))

(declare-fun m!987387 () Bool)

(assert (=> b!1068306 m!987387))

(declare-fun m!987389 () Bool)

(assert (=> b!1068306 m!987389))

(check-sat (not b!1068301) (not b_next!21697) (not mapNonEmpty!39952) (not b!1068302) b_and!34491 tp_is_empty!25507 (not start!94592) (not b!1068306))
(check-sat b_and!34491 (not b_next!21697))
