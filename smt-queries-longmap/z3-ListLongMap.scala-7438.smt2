; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94736 () Bool)

(assert start!94736)

(declare-fun b_free!21805 () Bool)

(declare-fun b_next!21805 () Bool)

(assert (=> start!94736 (= b_free!21805 (not b_next!21805))))

(declare-fun tp!76865 () Bool)

(declare-fun b_and!34617 () Bool)

(assert (=> start!94736 (= tp!76865 b_and!34617)))

(declare-fun b!1069852 () Bool)

(declare-fun res!713510 () Bool)

(declare-fun e!610493 () Bool)

(assert (=> b!1069852 (=> (not res!713510) (not e!610493))))

(declare-datatypes ((array!68257 0))(
  ( (array!68258 (arr!32821 (Array (_ BitVec 32) (_ BitVec 64))) (size!33358 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68257)

(declare-datatypes ((List!22880 0))(
  ( (Nil!22877) (Cons!22876 (h!24094 (_ BitVec 64)) (t!32199 List!22880)) )
))
(declare-fun arrayNoDuplicates!0 (array!68257 (_ BitVec 32) List!22880) Bool)

(assert (=> b!1069852 (= res!713510 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22877))))

(declare-fun mapNonEmpty!40120 () Bool)

(declare-fun mapRes!40120 () Bool)

(declare-fun tp!76864 () Bool)

(declare-fun e!610496 () Bool)

(assert (=> mapNonEmpty!40120 (= mapRes!40120 (and tp!76864 e!610496))))

(declare-fun mapKey!40120 () (_ BitVec 32))

(declare-datatypes ((V!39289 0))(
  ( (V!39290 (val!12858 Int)) )
))
(declare-datatypes ((ValueCell!12104 0))(
  ( (ValueCellFull!12104 (v!15469 V!39289)) (EmptyCell!12104) )
))
(declare-fun mapValue!40120 () ValueCell!12104)

(declare-fun mapRest!40120 () (Array (_ BitVec 32) ValueCell!12104))

(declare-datatypes ((array!68259 0))(
  ( (array!68260 (arr!32822 (Array (_ BitVec 32) ValueCell!12104)) (size!33359 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68259)

(assert (=> mapNonEmpty!40120 (= (arr!32822 _values!955) (store mapRest!40120 mapKey!40120 mapValue!40120))))

(declare-fun b!1069853 () Bool)

(declare-fun e!610494 () Bool)

(assert (=> b!1069853 (= e!610494 true)))

(declare-datatypes ((tuple2!16312 0))(
  ( (tuple2!16313 (_1!8167 (_ BitVec 64)) (_2!8167 V!39289)) )
))
(declare-datatypes ((List!22881 0))(
  ( (Nil!22878) (Cons!22877 (h!24095 tuple2!16312) (t!32200 List!22881)) )
))
(declare-datatypes ((ListLongMap!14289 0))(
  ( (ListLongMap!14290 (toList!7160 List!22881)) )
))
(declare-fun lt!472588 () ListLongMap!14289)

(declare-fun -!644 (ListLongMap!14289 (_ BitVec 64)) ListLongMap!14289)

(assert (=> b!1069853 (= (-!644 lt!472588 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472588)))

(declare-datatypes ((Unit!35114 0))(
  ( (Unit!35115) )
))
(declare-fun lt!472590 () Unit!35114)

(declare-fun removeNotPresentStillSame!61 (ListLongMap!14289 (_ BitVec 64)) Unit!35114)

(assert (=> b!1069853 (= lt!472590 (removeNotPresentStillSame!61 lt!472588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069854 () Bool)

(declare-fun res!713515 () Bool)

(assert (=> b!1069854 (=> (not res!713515) (not e!610493))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069854 (= res!713515 (and (= (size!33359 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33358 _keys!1163) (size!33359 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069855 () Bool)

(declare-fun res!713512 () Bool)

(assert (=> b!1069855 (=> (not res!713512) (not e!610493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68257 (_ BitVec 32)) Bool)

(assert (=> b!1069855 (= res!713512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069856 () Bool)

(declare-fun tp_is_empty!25615 () Bool)

(assert (=> b!1069856 (= e!610496 tp_is_empty!25615)))

(declare-fun b!1069857 () Bool)

(declare-fun e!610491 () Bool)

(declare-fun e!610492 () Bool)

(assert (=> b!1069857 (= e!610491 (and e!610492 mapRes!40120))))

(declare-fun condMapEmpty!40120 () Bool)

(declare-fun mapDefault!40120 () ValueCell!12104)

(assert (=> b!1069857 (= condMapEmpty!40120 (= (arr!32822 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12104)) mapDefault!40120)))))

(declare-fun b!1069858 () Bool)

(assert (=> b!1069858 (= e!610492 tp_is_empty!25615)))

(declare-fun b!1069859 () Bool)

(declare-fun e!610495 () Bool)

(assert (=> b!1069859 (= e!610495 e!610494)))

(declare-fun res!713511 () Bool)

(assert (=> b!1069859 (=> res!713511 e!610494)))

(declare-fun contains!6321 (ListLongMap!14289 (_ BitVec 64)) Bool)

(assert (=> b!1069859 (= res!713511 (contains!6321 lt!472588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39289)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39289)

(declare-fun getCurrentListMap!4083 (array!68257 array!68259 (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 (_ BitVec 32) Int) ListLongMap!14289)

(assert (=> b!1069859 (= lt!472588 (getCurrentListMap!4083 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40120 () Bool)

(assert (=> mapIsEmpty!40120 mapRes!40120))

(declare-fun b!1069860 () Bool)

(assert (=> b!1069860 (= e!610493 (not e!610495))))

(declare-fun res!713514 () Bool)

(assert (=> b!1069860 (=> res!713514 e!610495)))

(assert (=> b!1069860 (= res!713514 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472589 () ListLongMap!14289)

(declare-fun lt!472587 () ListLongMap!14289)

(assert (=> b!1069860 (= lt!472589 lt!472587)))

(declare-fun lt!472591 () Unit!35114)

(declare-fun zeroValueAfter!47 () V!39289)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!777 (array!68257 array!68259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 V!39289 V!39289 (_ BitVec 32) Int) Unit!35114)

(assert (=> b!1069860 (= lt!472591 (lemmaNoChangeToArrayThenSameMapNoExtras!777 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3774 (array!68257 array!68259 (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 (_ BitVec 32) Int) ListLongMap!14289)

(assert (=> b!1069860 (= lt!472587 (getCurrentListMapNoExtraKeys!3774 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069860 (= lt!472589 (getCurrentListMapNoExtraKeys!3774 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713513 () Bool)

(assert (=> start!94736 (=> (not res!713513) (not e!610493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94736 (= res!713513 (validMask!0 mask!1515))))

(assert (=> start!94736 e!610493))

(assert (=> start!94736 true))

(assert (=> start!94736 tp_is_empty!25615))

(declare-fun array_inv!25426 (array!68259) Bool)

(assert (=> start!94736 (and (array_inv!25426 _values!955) e!610491)))

(assert (=> start!94736 tp!76865))

(declare-fun array_inv!25427 (array!68257) Bool)

(assert (=> start!94736 (array_inv!25427 _keys!1163)))

(assert (= (and start!94736 res!713513) b!1069854))

(assert (= (and b!1069854 res!713515) b!1069855))

(assert (= (and b!1069855 res!713512) b!1069852))

(assert (= (and b!1069852 res!713510) b!1069860))

(assert (= (and b!1069860 (not res!713514)) b!1069859))

(assert (= (and b!1069859 (not res!713511)) b!1069853))

(assert (= (and b!1069857 condMapEmpty!40120) mapIsEmpty!40120))

(assert (= (and b!1069857 (not condMapEmpty!40120)) mapNonEmpty!40120))

(get-info :version)

(assert (= (and mapNonEmpty!40120 ((_ is ValueCellFull!12104) mapValue!40120)) b!1069856))

(assert (= (and b!1069857 ((_ is ValueCellFull!12104) mapDefault!40120)) b!1069858))

(assert (= start!94736 b!1069857))

(declare-fun m!988765 () Bool)

(assert (=> mapNonEmpty!40120 m!988765))

(declare-fun m!988767 () Bool)

(assert (=> start!94736 m!988767))

(declare-fun m!988769 () Bool)

(assert (=> start!94736 m!988769))

(declare-fun m!988771 () Bool)

(assert (=> start!94736 m!988771))

(declare-fun m!988773 () Bool)

(assert (=> b!1069859 m!988773))

(declare-fun m!988775 () Bool)

(assert (=> b!1069859 m!988775))

(declare-fun m!988777 () Bool)

(assert (=> b!1069852 m!988777))

(declare-fun m!988779 () Bool)

(assert (=> b!1069853 m!988779))

(declare-fun m!988781 () Bool)

(assert (=> b!1069853 m!988781))

(declare-fun m!988783 () Bool)

(assert (=> b!1069855 m!988783))

(declare-fun m!988785 () Bool)

(assert (=> b!1069860 m!988785))

(declare-fun m!988787 () Bool)

(assert (=> b!1069860 m!988787))

(declare-fun m!988789 () Bool)

(assert (=> b!1069860 m!988789))

(check-sat (not b!1069852) tp_is_empty!25615 (not b!1069855) b_and!34617 (not b_next!21805) (not b!1069860) (not start!94736) (not b!1069853) (not b!1069859) (not mapNonEmpty!40120))
(check-sat b_and!34617 (not b_next!21805))
