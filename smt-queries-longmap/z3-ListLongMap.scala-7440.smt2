; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94748 () Bool)

(assert start!94748)

(declare-fun b_free!21817 () Bool)

(declare-fun b_next!21817 () Bool)

(assert (=> start!94748 (= b_free!21817 (not b_next!21817))))

(declare-fun tp!76901 () Bool)

(declare-fun b_and!34629 () Bool)

(assert (=> start!94748 (= tp!76901 b_and!34629)))

(declare-fun b!1070014 () Bool)

(declare-fun e!610617 () Bool)

(assert (=> b!1070014 (= e!610617 true)))

(declare-datatypes ((V!39305 0))(
  ( (V!39306 (val!12864 Int)) )
))
(declare-datatypes ((tuple2!16318 0))(
  ( (tuple2!16319 (_1!8170 (_ BitVec 64)) (_2!8170 V!39305)) )
))
(declare-datatypes ((List!22886 0))(
  ( (Nil!22883) (Cons!22882 (h!24100 tuple2!16318) (t!32205 List!22886)) )
))
(declare-datatypes ((ListLongMap!14295 0))(
  ( (ListLongMap!14296 (toList!7163 List!22886)) )
))
(declare-fun lt!472681 () ListLongMap!14295)

(declare-fun -!647 (ListLongMap!14295 (_ BitVec 64)) ListLongMap!14295)

(assert (=> b!1070014 (= (-!647 lt!472681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472681)))

(declare-datatypes ((Unit!35120 0))(
  ( (Unit!35121) )
))
(declare-fun lt!472678 () Unit!35120)

(declare-fun removeNotPresentStillSame!64 (ListLongMap!14295 (_ BitVec 64)) Unit!35120)

(assert (=> b!1070014 (= lt!472678 (removeNotPresentStillSame!64 lt!472681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070015 () Bool)

(declare-fun e!610616 () Bool)

(declare-fun e!610619 () Bool)

(declare-fun mapRes!40138 () Bool)

(assert (=> b!1070015 (= e!610616 (and e!610619 mapRes!40138))))

(declare-fun condMapEmpty!40138 () Bool)

(declare-datatypes ((ValueCell!12110 0))(
  ( (ValueCellFull!12110 (v!15475 V!39305)) (EmptyCell!12110) )
))
(declare-datatypes ((array!68277 0))(
  ( (array!68278 (arr!32831 (Array (_ BitVec 32) ValueCell!12110)) (size!33368 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68277)

(declare-fun mapDefault!40138 () ValueCell!12110)

(assert (=> b!1070015 (= condMapEmpty!40138 (= (arr!32831 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12110)) mapDefault!40138)))))

(declare-fun b!1070016 () Bool)

(declare-fun res!713619 () Bool)

(declare-fun e!610620 () Bool)

(assert (=> b!1070016 (=> (not res!713619) (not e!610620))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68279 0))(
  ( (array!68280 (arr!32832 (Array (_ BitVec 32) (_ BitVec 64))) (size!33369 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68279)

(assert (=> b!1070016 (= res!713619 (and (= (size!33368 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33369 _keys!1163) (size!33368 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070017 () Bool)

(declare-fun e!610622 () Bool)

(assert (=> b!1070017 (= e!610620 (not e!610622))))

(declare-fun res!713622 () Bool)

(assert (=> b!1070017 (=> res!713622 e!610622)))

(assert (=> b!1070017 (= res!713622 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472680 () ListLongMap!14295)

(declare-fun lt!472679 () ListLongMap!14295)

(assert (=> b!1070017 (= lt!472680 lt!472679)))

(declare-fun zeroValueBefore!47 () V!39305)

(declare-fun lt!472677 () Unit!35120)

(declare-fun minValue!907 () V!39305)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39305)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!780 (array!68279 array!68277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39305 V!39305 V!39305 V!39305 (_ BitVec 32) Int) Unit!35120)

(assert (=> b!1070017 (= lt!472677 (lemmaNoChangeToArrayThenSameMapNoExtras!780 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3777 (array!68279 array!68277 (_ BitVec 32) (_ BitVec 32) V!39305 V!39305 (_ BitVec 32) Int) ListLongMap!14295)

(assert (=> b!1070017 (= lt!472679 (getCurrentListMapNoExtraKeys!3777 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070017 (= lt!472680 (getCurrentListMapNoExtraKeys!3777 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713620 () Bool)

(assert (=> start!94748 (=> (not res!713620) (not e!610620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94748 (= res!713620 (validMask!0 mask!1515))))

(assert (=> start!94748 e!610620))

(assert (=> start!94748 true))

(declare-fun tp_is_empty!25627 () Bool)

(assert (=> start!94748 tp_is_empty!25627))

(declare-fun array_inv!25432 (array!68277) Bool)

(assert (=> start!94748 (and (array_inv!25432 _values!955) e!610616)))

(assert (=> start!94748 tp!76901))

(declare-fun array_inv!25433 (array!68279) Bool)

(assert (=> start!94748 (array_inv!25433 _keys!1163)))

(declare-fun b!1070018 () Bool)

(declare-fun res!713623 () Bool)

(assert (=> b!1070018 (=> (not res!713623) (not e!610620))))

(declare-datatypes ((List!22887 0))(
  ( (Nil!22884) (Cons!22883 (h!24101 (_ BitVec 64)) (t!32206 List!22887)) )
))
(declare-fun arrayNoDuplicates!0 (array!68279 (_ BitVec 32) List!22887) Bool)

(assert (=> b!1070018 (= res!713623 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22884))))

(declare-fun b!1070019 () Bool)

(assert (=> b!1070019 (= e!610619 tp_is_empty!25627)))

(declare-fun b!1070020 () Bool)

(declare-fun e!610621 () Bool)

(assert (=> b!1070020 (= e!610621 tp_is_empty!25627)))

(declare-fun mapNonEmpty!40138 () Bool)

(declare-fun tp!76900 () Bool)

(assert (=> mapNonEmpty!40138 (= mapRes!40138 (and tp!76900 e!610621))))

(declare-fun mapRest!40138 () (Array (_ BitVec 32) ValueCell!12110))

(declare-fun mapValue!40138 () ValueCell!12110)

(declare-fun mapKey!40138 () (_ BitVec 32))

(assert (=> mapNonEmpty!40138 (= (arr!32831 _values!955) (store mapRest!40138 mapKey!40138 mapValue!40138))))

(declare-fun b!1070021 () Bool)

(assert (=> b!1070021 (= e!610622 e!610617)))

(declare-fun res!713621 () Bool)

(assert (=> b!1070021 (=> res!713621 e!610617)))

(declare-fun contains!6324 (ListLongMap!14295 (_ BitVec 64)) Bool)

(assert (=> b!1070021 (= res!713621 (contains!6324 lt!472681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4086 (array!68279 array!68277 (_ BitVec 32) (_ BitVec 32) V!39305 V!39305 (_ BitVec 32) Int) ListLongMap!14295)

(assert (=> b!1070021 (= lt!472681 (getCurrentListMap!4086 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070022 () Bool)

(declare-fun res!713618 () Bool)

(assert (=> b!1070022 (=> (not res!713618) (not e!610620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68279 (_ BitVec 32)) Bool)

(assert (=> b!1070022 (= res!713618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40138 () Bool)

(assert (=> mapIsEmpty!40138 mapRes!40138))

(assert (= (and start!94748 res!713620) b!1070016))

(assert (= (and b!1070016 res!713619) b!1070022))

(assert (= (and b!1070022 res!713618) b!1070018))

(assert (= (and b!1070018 res!713623) b!1070017))

(assert (= (and b!1070017 (not res!713622)) b!1070021))

(assert (= (and b!1070021 (not res!713621)) b!1070014))

(assert (= (and b!1070015 condMapEmpty!40138) mapIsEmpty!40138))

(assert (= (and b!1070015 (not condMapEmpty!40138)) mapNonEmpty!40138))

(get-info :version)

(assert (= (and mapNonEmpty!40138 ((_ is ValueCellFull!12110) mapValue!40138)) b!1070020))

(assert (= (and b!1070015 ((_ is ValueCellFull!12110) mapDefault!40138)) b!1070019))

(assert (= start!94748 b!1070015))

(declare-fun m!988921 () Bool)

(assert (=> b!1070014 m!988921))

(declare-fun m!988923 () Bool)

(assert (=> b!1070014 m!988923))

(declare-fun m!988925 () Bool)

(assert (=> start!94748 m!988925))

(declare-fun m!988927 () Bool)

(assert (=> start!94748 m!988927))

(declare-fun m!988929 () Bool)

(assert (=> start!94748 m!988929))

(declare-fun m!988931 () Bool)

(assert (=> mapNonEmpty!40138 m!988931))

(declare-fun m!988933 () Bool)

(assert (=> b!1070018 m!988933))

(declare-fun m!988935 () Bool)

(assert (=> b!1070021 m!988935))

(declare-fun m!988937 () Bool)

(assert (=> b!1070021 m!988937))

(declare-fun m!988939 () Bool)

(assert (=> b!1070022 m!988939))

(declare-fun m!988941 () Bool)

(assert (=> b!1070017 m!988941))

(declare-fun m!988943 () Bool)

(assert (=> b!1070017 m!988943))

(declare-fun m!988945 () Bool)

(assert (=> b!1070017 m!988945))

(check-sat (not b!1070022) (not b_next!21817) tp_is_empty!25627 (not b!1070014) (not b!1070018) b_and!34629 (not start!94748) (not b!1070017) (not b!1070021) (not mapNonEmpty!40138))
(check-sat b_and!34629 (not b_next!21817))
