; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94612 () Bool)

(assert start!94612)

(declare-fun b_free!21901 () Bool)

(declare-fun b_next!21901 () Bool)

(assert (=> start!94612 (= b_free!21901 (not b_next!21901))))

(declare-fun tp!77156 () Bool)

(declare-fun b_and!34687 () Bool)

(assert (=> start!94612 (= tp!77156 b_and!34687)))

(declare-fun b!1069695 () Bool)

(declare-fun res!713715 () Bool)

(declare-fun e!610522 () Bool)

(assert (=> b!1069695 (=> (not res!713715) (not e!610522))))

(declare-datatypes ((array!68340 0))(
  ( (array!68341 (arr!32868 (Array (_ BitVec 32) (_ BitVec 64))) (size!33406 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68340)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68340 (_ BitVec 32)) Bool)

(assert (=> b!1069695 (= res!713715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069696 () Bool)

(declare-fun res!713717 () Bool)

(assert (=> b!1069696 (=> (not res!713717) (not e!610522))))

(declare-datatypes ((List!22993 0))(
  ( (Nil!22990) (Cons!22989 (h!24198 (_ BitVec 64)) (t!32313 List!22993)) )
))
(declare-fun arrayNoDuplicates!0 (array!68340 (_ BitVec 32) List!22993) Bool)

(assert (=> b!1069696 (= res!713717 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22990))))

(declare-fun res!713716 () Bool)

(assert (=> start!94612 (=> (not res!713716) (not e!610522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94612 (= res!713716 (validMask!0 mask!1515))))

(assert (=> start!94612 e!610522))

(assert (=> start!94612 true))

(declare-fun tp_is_empty!25711 () Bool)

(assert (=> start!94612 tp_is_empty!25711))

(declare-datatypes ((V!39417 0))(
  ( (V!39418 (val!12906 Int)) )
))
(declare-datatypes ((ValueCell!12152 0))(
  ( (ValueCellFull!12152 (v!15521 V!39417)) (EmptyCell!12152) )
))
(declare-datatypes ((array!68342 0))(
  ( (array!68343 (arr!32869 (Array (_ BitVec 32) ValueCell!12152)) (size!33407 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68342)

(declare-fun e!610523 () Bool)

(declare-fun array_inv!25434 (array!68342) Bool)

(assert (=> start!94612 (and (array_inv!25434 _values!955) e!610523)))

(assert (=> start!94612 tp!77156))

(declare-fun array_inv!25435 (array!68340) Bool)

(assert (=> start!94612 (array_inv!25435 _keys!1163)))

(declare-fun b!1069697 () Bool)

(declare-fun e!610520 () Bool)

(assert (=> b!1069697 (= e!610520 tp_is_empty!25711)))

(declare-fun b!1069698 () Bool)

(declare-fun e!610524 () Bool)

(declare-fun mapRes!40267 () Bool)

(assert (=> b!1069698 (= e!610523 (and e!610524 mapRes!40267))))

(declare-fun condMapEmpty!40267 () Bool)

(declare-fun mapDefault!40267 () ValueCell!12152)

(assert (=> b!1069698 (= condMapEmpty!40267 (= (arr!32869 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12152)) mapDefault!40267)))))

(declare-fun b!1069699 () Bool)

(declare-fun res!713714 () Bool)

(assert (=> b!1069699 (=> (not res!713714) (not e!610522))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069699 (= res!713714 (and (= (size!33407 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33406 _keys!1163) (size!33407 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40267 () Bool)

(declare-fun tp!77155 () Bool)

(assert (=> mapNonEmpty!40267 (= mapRes!40267 (and tp!77155 e!610520))))

(declare-fun mapValue!40267 () ValueCell!12152)

(declare-fun mapRest!40267 () (Array (_ BitVec 32) ValueCell!12152))

(declare-fun mapKey!40267 () (_ BitVec 32))

(assert (=> mapNonEmpty!40267 (= (arr!32869 _values!955) (store mapRest!40267 mapKey!40267 mapValue!40267))))

(declare-fun b!1069700 () Bool)

(assert (=> b!1069700 (= e!610522 (not true))))

(declare-datatypes ((tuple2!16464 0))(
  ( (tuple2!16465 (_1!8243 (_ BitVec 64)) (_2!8243 V!39417)) )
))
(declare-datatypes ((List!22994 0))(
  ( (Nil!22991) (Cons!22990 (h!24199 tuple2!16464) (t!32314 List!22994)) )
))
(declare-datatypes ((ListLongMap!14433 0))(
  ( (ListLongMap!14434 (toList!7232 List!22994)) )
))
(declare-fun lt!472588 () ListLongMap!14433)

(declare-fun lt!472586 () ListLongMap!14433)

(assert (=> b!1069700 (= lt!472588 lt!472586)))

(declare-fun zeroValueBefore!47 () V!39417)

(declare-fun minValue!907 () V!39417)

(declare-datatypes ((Unit!35052 0))(
  ( (Unit!35053) )
))
(declare-fun lt!472587 () Unit!35052)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39417)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!815 (array!68340 array!68342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39417 V!39417 V!39417 V!39417 (_ BitVec 32) Int) Unit!35052)

(assert (=> b!1069700 (= lt!472587 (lemmaNoChangeToArrayThenSameMapNoExtras!815 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3821 (array!68340 array!68342 (_ BitVec 32) (_ BitVec 32) V!39417 V!39417 (_ BitVec 32) Int) ListLongMap!14433)

(assert (=> b!1069700 (= lt!472586 (getCurrentListMapNoExtraKeys!3821 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069700 (= lt!472588 (getCurrentListMapNoExtraKeys!3821 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40267 () Bool)

(assert (=> mapIsEmpty!40267 mapRes!40267))

(declare-fun b!1069701 () Bool)

(assert (=> b!1069701 (= e!610524 tp_is_empty!25711)))

(assert (= (and start!94612 res!713716) b!1069699))

(assert (= (and b!1069699 res!713714) b!1069695))

(assert (= (and b!1069695 res!713715) b!1069696))

(assert (= (and b!1069696 res!713717) b!1069700))

(assert (= (and b!1069698 condMapEmpty!40267) mapIsEmpty!40267))

(assert (= (and b!1069698 (not condMapEmpty!40267)) mapNonEmpty!40267))

(get-info :version)

(assert (= (and mapNonEmpty!40267 ((_ is ValueCellFull!12152) mapValue!40267)) b!1069697))

(assert (= (and b!1069698 ((_ is ValueCellFull!12152) mapDefault!40267)) b!1069701))

(assert (= start!94612 b!1069698))

(declare-fun m!987673 () Bool)

(assert (=> b!1069696 m!987673))

(declare-fun m!987675 () Bool)

(assert (=> mapNonEmpty!40267 m!987675))

(declare-fun m!987677 () Bool)

(assert (=> b!1069695 m!987677))

(declare-fun m!987679 () Bool)

(assert (=> b!1069700 m!987679))

(declare-fun m!987681 () Bool)

(assert (=> b!1069700 m!987681))

(declare-fun m!987683 () Bool)

(assert (=> b!1069700 m!987683))

(declare-fun m!987685 () Bool)

(assert (=> start!94612 m!987685))

(declare-fun m!987687 () Bool)

(assert (=> start!94612 m!987687))

(declare-fun m!987689 () Bool)

(assert (=> start!94612 m!987689))

(check-sat tp_is_empty!25711 (not b_next!21901) (not mapNonEmpty!40267) (not start!94612) (not b!1069700) b_and!34687 (not b!1069696) (not b!1069695))
(check-sat b_and!34687 (not b_next!21901))
