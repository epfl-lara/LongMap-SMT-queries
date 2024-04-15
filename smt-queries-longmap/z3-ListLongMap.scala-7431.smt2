; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94430 () Bool)

(assert start!94430)

(declare-fun b_free!21763 () Bool)

(declare-fun b_next!21763 () Bool)

(assert (=> start!94430 (= b_free!21763 (not b_next!21763))))

(declare-fun tp!76735 () Bool)

(declare-fun b_and!34529 () Bool)

(assert (=> start!94430 (= tp!76735 b_and!34529)))

(declare-fun b!1067648 () Bool)

(declare-fun e!609002 () Bool)

(assert (=> b!1067648 (= e!609002 true)))

(declare-datatypes ((V!39233 0))(
  ( (V!39234 (val!12837 Int)) )
))
(declare-datatypes ((tuple2!16350 0))(
  ( (tuple2!16351 (_1!8186 (_ BitVec 64)) (_2!8186 V!39233)) )
))
(declare-datatypes ((List!22891 0))(
  ( (Nil!22888) (Cons!22887 (h!24096 tuple2!16350) (t!32207 List!22891)) )
))
(declare-datatypes ((ListLongMap!14319 0))(
  ( (ListLongMap!14320 (toList!7175 List!22891)) )
))
(declare-fun lt!471434 () ListLongMap!14319)

(declare-fun -!622 (ListLongMap!14319 (_ BitVec 64)) ListLongMap!14319)

(assert (=> b!1067648 (= (-!622 lt!471434 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471434)))

(declare-datatypes ((Unit!34940 0))(
  ( (Unit!34941) )
))
(declare-fun lt!471435 () Unit!34940)

(declare-fun removeNotPresentStillSame!39 (ListLongMap!14319 (_ BitVec 64)) Unit!34940)

(assert (=> b!1067648 (= lt!471435 (removeNotPresentStillSame!39 lt!471434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!712484 () Bool)

(declare-fun e!609004 () Bool)

(assert (=> start!94430 (=> (not res!712484) (not e!609004))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94430 (= res!712484 (validMask!0 mask!1515))))

(assert (=> start!94430 e!609004))

(assert (=> start!94430 true))

(declare-fun tp_is_empty!25573 () Bool)

(assert (=> start!94430 tp_is_empty!25573))

(declare-datatypes ((ValueCell!12083 0))(
  ( (ValueCellFull!12083 (v!15450 V!39233)) (EmptyCell!12083) )
))
(declare-datatypes ((array!68072 0))(
  ( (array!68073 (arr!32736 (Array (_ BitVec 32) ValueCell!12083)) (size!33274 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68072)

(declare-fun e!609006 () Bool)

(declare-fun array_inv!25340 (array!68072) Bool)

(assert (=> start!94430 (and (array_inv!25340 _values!955) e!609006)))

(assert (=> start!94430 tp!76735))

(declare-datatypes ((array!68074 0))(
  ( (array!68075 (arr!32737 (Array (_ BitVec 32) (_ BitVec 64))) (size!33275 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68074)

(declare-fun array_inv!25341 (array!68074) Bool)

(assert (=> start!94430 (array_inv!25341 _keys!1163)))

(declare-fun b!1067649 () Bool)

(declare-fun e!609007 () Bool)

(assert (=> b!1067649 (= e!609007 tp_is_empty!25573)))

(declare-fun b!1067650 () Bool)

(declare-fun e!609001 () Bool)

(assert (=> b!1067650 (= e!609001 e!609002)))

(declare-fun res!712483 () Bool)

(assert (=> b!1067650 (=> res!712483 e!609002)))

(declare-fun contains!6252 (ListLongMap!14319 (_ BitVec 64)) Bool)

(assert (=> b!1067650 (= res!712483 (contains!6252 lt!471434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39233)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39233)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4021 (array!68074 array!68072 (_ BitVec 32) (_ BitVec 32) V!39233 V!39233 (_ BitVec 32) Int) ListLongMap!14319)

(assert (=> b!1067650 (= lt!471434 (getCurrentListMap!4021 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067651 () Bool)

(declare-fun res!712482 () Bool)

(assert (=> b!1067651 (=> (not res!712482) (not e!609004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68074 (_ BitVec 32)) Bool)

(assert (=> b!1067651 (= res!712482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067652 () Bool)

(declare-fun e!609005 () Bool)

(declare-fun mapRes!40054 () Bool)

(assert (=> b!1067652 (= e!609006 (and e!609005 mapRes!40054))))

(declare-fun condMapEmpty!40054 () Bool)

(declare-fun mapDefault!40054 () ValueCell!12083)

(assert (=> b!1067652 (= condMapEmpty!40054 (= (arr!32736 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12083)) mapDefault!40054)))))

(declare-fun b!1067653 () Bool)

(declare-fun res!712485 () Bool)

(assert (=> b!1067653 (=> (not res!712485) (not e!609004))))

(declare-datatypes ((List!22892 0))(
  ( (Nil!22889) (Cons!22888 (h!24097 (_ BitVec 64)) (t!32208 List!22892)) )
))
(declare-fun arrayNoDuplicates!0 (array!68074 (_ BitVec 32) List!22892) Bool)

(assert (=> b!1067653 (= res!712485 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22889))))

(declare-fun b!1067654 () Bool)

(assert (=> b!1067654 (= e!609004 (not e!609001))))

(declare-fun res!712481 () Bool)

(assert (=> b!1067654 (=> res!712481 e!609001)))

(assert (=> b!1067654 (= res!712481 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471436 () ListLongMap!14319)

(declare-fun lt!471433 () ListLongMap!14319)

(assert (=> b!1067654 (= lt!471436 lt!471433)))

(declare-fun lt!471437 () Unit!34940)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39233)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!764 (array!68074 array!68072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39233 V!39233 V!39233 V!39233 (_ BitVec 32) Int) Unit!34940)

(assert (=> b!1067654 (= lt!471437 (lemmaNoChangeToArrayThenSameMapNoExtras!764 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3770 (array!68074 array!68072 (_ BitVec 32) (_ BitVec 32) V!39233 V!39233 (_ BitVec 32) Int) ListLongMap!14319)

(assert (=> b!1067654 (= lt!471433 (getCurrentListMapNoExtraKeys!3770 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067654 (= lt!471436 (getCurrentListMapNoExtraKeys!3770 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067655 () Bool)

(declare-fun res!712480 () Bool)

(assert (=> b!1067655 (=> (not res!712480) (not e!609004))))

(assert (=> b!1067655 (= res!712480 (and (= (size!33274 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33275 _keys!1163) (size!33274 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40054 () Bool)

(declare-fun tp!76736 () Bool)

(assert (=> mapNonEmpty!40054 (= mapRes!40054 (and tp!76736 e!609007))))

(declare-fun mapKey!40054 () (_ BitVec 32))

(declare-fun mapValue!40054 () ValueCell!12083)

(declare-fun mapRest!40054 () (Array (_ BitVec 32) ValueCell!12083))

(assert (=> mapNonEmpty!40054 (= (arr!32736 _values!955) (store mapRest!40054 mapKey!40054 mapValue!40054))))

(declare-fun b!1067656 () Bool)

(assert (=> b!1067656 (= e!609005 tp_is_empty!25573)))

(declare-fun mapIsEmpty!40054 () Bool)

(assert (=> mapIsEmpty!40054 mapRes!40054))

(assert (= (and start!94430 res!712484) b!1067655))

(assert (= (and b!1067655 res!712480) b!1067651))

(assert (= (and b!1067651 res!712482) b!1067653))

(assert (= (and b!1067653 res!712485) b!1067654))

(assert (= (and b!1067654 (not res!712481)) b!1067650))

(assert (= (and b!1067650 (not res!712483)) b!1067648))

(assert (= (and b!1067652 condMapEmpty!40054) mapIsEmpty!40054))

(assert (= (and b!1067652 (not condMapEmpty!40054)) mapNonEmpty!40054))

(get-info :version)

(assert (= (and mapNonEmpty!40054 ((_ is ValueCellFull!12083) mapValue!40054)) b!1067649))

(assert (= (and b!1067652 ((_ is ValueCellFull!12083) mapDefault!40054)) b!1067656))

(assert (= start!94430 b!1067652))

(declare-fun m!985795 () Bool)

(assert (=> mapNonEmpty!40054 m!985795))

(declare-fun m!985797 () Bool)

(assert (=> b!1067654 m!985797))

(declare-fun m!985799 () Bool)

(assert (=> b!1067654 m!985799))

(declare-fun m!985801 () Bool)

(assert (=> b!1067654 m!985801))

(declare-fun m!985803 () Bool)

(assert (=> b!1067648 m!985803))

(declare-fun m!985805 () Bool)

(assert (=> b!1067648 m!985805))

(declare-fun m!985807 () Bool)

(assert (=> b!1067651 m!985807))

(declare-fun m!985809 () Bool)

(assert (=> start!94430 m!985809))

(declare-fun m!985811 () Bool)

(assert (=> start!94430 m!985811))

(declare-fun m!985813 () Bool)

(assert (=> start!94430 m!985813))

(declare-fun m!985815 () Bool)

(assert (=> b!1067653 m!985815))

(declare-fun m!985817 () Bool)

(assert (=> b!1067650 m!985817))

(declare-fun m!985819 () Bool)

(assert (=> b!1067650 m!985819))

(check-sat (not b!1067650) (not b!1067653) (not b_next!21763) (not b!1067651) b_and!34529 (not start!94430) tp_is_empty!25573 (not b!1067648) (not b!1067654) (not mapNonEmpty!40054))
(check-sat b_and!34529 (not b_next!21763))
