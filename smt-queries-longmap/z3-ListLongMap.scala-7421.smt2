; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94598 () Bool)

(assert start!94598)

(declare-fun b_free!21703 () Bool)

(declare-fun b_next!21703 () Bool)

(assert (=> start!94598 (= b_free!21703 (not b_next!21703))))

(declare-fun tp!76553 () Bool)

(declare-fun b_and!34497 () Bool)

(assert (=> start!94598 (= tp!76553 b_and!34497)))

(declare-fun b!1068364 () Bool)

(declare-fun res!712632 () Bool)

(declare-fun e!609395 () Bool)

(assert (=> b!1068364 (=> (not res!712632) (not e!609395))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39153 0))(
  ( (V!39154 (val!12807 Int)) )
))
(declare-datatypes ((ValueCell!12053 0))(
  ( (ValueCellFull!12053 (v!15417 V!39153)) (EmptyCell!12053) )
))
(declare-datatypes ((array!68055 0))(
  ( (array!68056 (arr!32722 (Array (_ BitVec 32) ValueCell!12053)) (size!33259 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68055)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68057 0))(
  ( (array!68058 (arr!32723 (Array (_ BitVec 32) (_ BitVec 64))) (size!33260 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68057)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1068364 (= res!712632 (and (= (size!33259 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33260 _keys!1163) (size!33259 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068365 () Bool)

(declare-fun res!712631 () Bool)

(assert (=> b!1068365 (=> (not res!712631) (not e!609395))))

(declare-datatypes ((List!22795 0))(
  ( (Nil!22792) (Cons!22791 (h!24009 (_ BitVec 64)) (t!32110 List!22795)) )
))
(declare-fun arrayNoDuplicates!0 (array!68057 (_ BitVec 32) List!22795) Bool)

(assert (=> b!1068365 (= res!712631 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22792))))

(declare-fun b!1068366 () Bool)

(declare-fun e!609399 () Bool)

(declare-fun tp_is_empty!25513 () Bool)

(assert (=> b!1068366 (= e!609399 tp_is_empty!25513)))

(declare-fun mapNonEmpty!39961 () Bool)

(declare-fun mapRes!39961 () Bool)

(declare-fun tp!76552 () Bool)

(declare-fun e!609397 () Bool)

(assert (=> mapNonEmpty!39961 (= mapRes!39961 (and tp!76552 e!609397))))

(declare-fun mapKey!39961 () (_ BitVec 32))

(declare-fun mapRest!39961 () (Array (_ BitVec 32) ValueCell!12053))

(declare-fun mapValue!39961 () ValueCell!12053)

(assert (=> mapNonEmpty!39961 (= (arr!32722 _values!955) (store mapRest!39961 mapKey!39961 mapValue!39961))))

(declare-fun b!1068367 () Bool)

(declare-fun e!609396 () Bool)

(assert (=> b!1068367 (= e!609396 (and e!609399 mapRes!39961))))

(declare-fun condMapEmpty!39961 () Bool)

(declare-fun mapDefault!39961 () ValueCell!12053)

(assert (=> b!1068367 (= condMapEmpty!39961 (= (arr!32722 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12053)) mapDefault!39961)))))

(declare-fun b!1068368 () Bool)

(assert (=> b!1068368 (= e!609395 (not true))))

(declare-datatypes ((tuple2!16226 0))(
  ( (tuple2!16227 (_1!8124 (_ BitVec 64)) (_2!8124 V!39153)) )
))
(declare-datatypes ((List!22796 0))(
  ( (Nil!22793) (Cons!22792 (h!24010 tuple2!16226) (t!32111 List!22796)) )
))
(declare-datatypes ((ListLongMap!14203 0))(
  ( (ListLongMap!14204 (toList!7117 List!22796)) )
))
(declare-fun lt!471791 () ListLongMap!14203)

(declare-fun lt!471790 () ListLongMap!14203)

(assert (=> b!1068368 (= lt!471791 lt!471790)))

(declare-fun zeroValueBefore!47 () V!39153)

(declare-datatypes ((Unit!35032 0))(
  ( (Unit!35033) )
))
(declare-fun lt!471789 () Unit!35032)

(declare-fun minValue!907 () V!39153)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39153)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!739 (array!68057 array!68055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39153 V!39153 V!39153 V!39153 (_ BitVec 32) Int) Unit!35032)

(assert (=> b!1068368 (= lt!471789 (lemmaNoChangeToArrayThenSameMapNoExtras!739 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3736 (array!68057 array!68055 (_ BitVec 32) (_ BitVec 32) V!39153 V!39153 (_ BitVec 32) Int) ListLongMap!14203)

(assert (=> b!1068368 (= lt!471790 (getCurrentListMapNoExtraKeys!3736 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068368 (= lt!471791 (getCurrentListMapNoExtraKeys!3736 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712633 () Bool)

(assert (=> start!94598 (=> (not res!712633) (not e!609395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94598 (= res!712633 (validMask!0 mask!1515))))

(assert (=> start!94598 e!609395))

(assert (=> start!94598 true))

(assert (=> start!94598 tp_is_empty!25513))

(declare-fun array_inv!25354 (array!68055) Bool)

(assert (=> start!94598 (and (array_inv!25354 _values!955) e!609396)))

(assert (=> start!94598 tp!76553))

(declare-fun array_inv!25355 (array!68057) Bool)

(assert (=> start!94598 (array_inv!25355 _keys!1163)))

(declare-fun b!1068369 () Bool)

(assert (=> b!1068369 (= e!609397 tp_is_empty!25513)))

(declare-fun mapIsEmpty!39961 () Bool)

(assert (=> mapIsEmpty!39961 mapRes!39961))

(declare-fun b!1068370 () Bool)

(declare-fun res!712634 () Bool)

(assert (=> b!1068370 (=> (not res!712634) (not e!609395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68057 (_ BitVec 32)) Bool)

(assert (=> b!1068370 (= res!712634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94598 res!712633) b!1068364))

(assert (= (and b!1068364 res!712632) b!1068370))

(assert (= (and b!1068370 res!712634) b!1068365))

(assert (= (and b!1068365 res!712631) b!1068368))

(assert (= (and b!1068367 condMapEmpty!39961) mapIsEmpty!39961))

(assert (= (and b!1068367 (not condMapEmpty!39961)) mapNonEmpty!39961))

(get-info :version)

(assert (= (and mapNonEmpty!39961 ((_ is ValueCellFull!12053) mapValue!39961)) b!1068369))

(assert (= (and b!1068367 ((_ is ValueCellFull!12053) mapDefault!39961)) b!1068366))

(assert (= start!94598 b!1068367))

(declare-fun m!987427 () Bool)

(assert (=> mapNonEmpty!39961 m!987427))

(declare-fun m!987429 () Bool)

(assert (=> b!1068368 m!987429))

(declare-fun m!987431 () Bool)

(assert (=> b!1068368 m!987431))

(declare-fun m!987433 () Bool)

(assert (=> b!1068368 m!987433))

(declare-fun m!987435 () Bool)

(assert (=> b!1068370 m!987435))

(declare-fun m!987437 () Bool)

(assert (=> b!1068365 m!987437))

(declare-fun m!987439 () Bool)

(assert (=> start!94598 m!987439))

(declare-fun m!987441 () Bool)

(assert (=> start!94598 m!987441))

(declare-fun m!987443 () Bool)

(assert (=> start!94598 m!987443))

(check-sat (not b!1068368) tp_is_empty!25513 (not mapNonEmpty!39961) (not b!1068365) b_and!34497 (not start!94598) (not b!1068370) (not b_next!21703))
(check-sat b_and!34497 (not b_next!21703))
