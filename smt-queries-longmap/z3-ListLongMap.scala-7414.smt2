; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94534 () Bool)

(assert start!94534)

(declare-fun b_free!21661 () Bool)

(declare-fun b_next!21661 () Bool)

(assert (=> start!94534 (= b_free!21661 (not b_next!21661))))

(declare-fun tp!76424 () Bool)

(declare-fun b_and!34443 () Bool)

(assert (=> start!94534 (= tp!76424 b_and!34443)))

(declare-fun b!1067696 () Bool)

(declare-fun e!608922 () Bool)

(declare-fun e!608919 () Bool)

(assert (=> b!1067696 (= e!608922 (not e!608919))))

(declare-fun res!712257 () Bool)

(assert (=> b!1067696 (=> res!712257 e!608919)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067696 (= res!712257 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39097 0))(
  ( (V!39098 (val!12786 Int)) )
))
(declare-datatypes ((tuple2!16194 0))(
  ( (tuple2!16195 (_1!8108 (_ BitVec 64)) (_2!8108 V!39097)) )
))
(declare-datatypes ((List!22762 0))(
  ( (Nil!22759) (Cons!22758 (h!23976 tuple2!16194) (t!32075 List!22762)) )
))
(declare-datatypes ((ListLongMap!14171 0))(
  ( (ListLongMap!14172 (toList!7101 List!22762)) )
))
(declare-fun lt!471254 () ListLongMap!14171)

(declare-fun lt!471247 () ListLongMap!14171)

(assert (=> b!1067696 (= lt!471254 lt!471247)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39097)

(declare-datatypes ((ValueCell!12032 0))(
  ( (ValueCellFull!12032 (v!15395 V!39097)) (EmptyCell!12032) )
))
(declare-datatypes ((array!67971 0))(
  ( (array!67972 (arr!32681 (Array (_ BitVec 32) ValueCell!12032)) (size!33218 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67971)

(declare-fun minValue!907 () V!39097)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!34998 0))(
  ( (Unit!34999) )
))
(declare-fun lt!471249 () Unit!34998)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39097)

(declare-datatypes ((array!67973 0))(
  ( (array!67974 (arr!32682 (Array (_ BitVec 32) (_ BitVec 64))) (size!33219 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67973)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!725 (array!67973 array!67971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39097 V!39097 V!39097 V!39097 (_ BitVec 32) Int) Unit!34998)

(assert (=> b!1067696 (= lt!471249 (lemmaNoChangeToArrayThenSameMapNoExtras!725 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3722 (array!67973 array!67971 (_ BitVec 32) (_ BitVec 32) V!39097 V!39097 (_ BitVec 32) Int) ListLongMap!14171)

(assert (=> b!1067696 (= lt!471247 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067696 (= lt!471254 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39895 () Bool)

(declare-fun mapRes!39895 () Bool)

(declare-fun tp!76423 () Bool)

(declare-fun e!608921 () Bool)

(assert (=> mapNonEmpty!39895 (= mapRes!39895 (and tp!76423 e!608921))))

(declare-fun mapRest!39895 () (Array (_ BitVec 32) ValueCell!12032))

(declare-fun mapValue!39895 () ValueCell!12032)

(declare-fun mapKey!39895 () (_ BitVec 32))

(assert (=> mapNonEmpty!39895 (= (arr!32681 _values!955) (store mapRest!39895 mapKey!39895 mapValue!39895))))

(declare-fun res!712256 () Bool)

(assert (=> start!94534 (=> (not res!712256) (not e!608922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94534 (= res!712256 (validMask!0 mask!1515))))

(assert (=> start!94534 e!608922))

(assert (=> start!94534 true))

(declare-fun tp_is_empty!25471 () Bool)

(assert (=> start!94534 tp_is_empty!25471))

(declare-fun e!608923 () Bool)

(declare-fun array_inv!25326 (array!67971) Bool)

(assert (=> start!94534 (and (array_inv!25326 _values!955) e!608923)))

(assert (=> start!94534 tp!76424))

(declare-fun array_inv!25327 (array!67973) Bool)

(assert (=> start!94534 (array_inv!25327 _keys!1163)))

(declare-fun b!1067697 () Bool)

(declare-fun res!712258 () Bool)

(assert (=> b!1067697 (=> (not res!712258) (not e!608922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67973 (_ BitVec 32)) Bool)

(assert (=> b!1067697 (= res!712258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067698 () Bool)

(declare-fun res!712255 () Bool)

(assert (=> b!1067698 (=> (not res!712255) (not e!608922))))

(assert (=> b!1067698 (= res!712255 (and (= (size!33218 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33219 _keys!1163) (size!33218 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067699 () Bool)

(declare-fun e!608918 () Bool)

(assert (=> b!1067699 (= e!608923 (and e!608918 mapRes!39895))))

(declare-fun condMapEmpty!39895 () Bool)

(declare-fun mapDefault!39895 () ValueCell!12032)

(assert (=> b!1067699 (= condMapEmpty!39895 (= (arr!32681 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12032)) mapDefault!39895)))))

(declare-fun b!1067700 () Bool)

(declare-fun res!712254 () Bool)

(assert (=> b!1067700 (=> (not res!712254) (not e!608922))))

(declare-datatypes ((List!22763 0))(
  ( (Nil!22760) (Cons!22759 (h!23977 (_ BitVec 64)) (t!32076 List!22763)) )
))
(declare-fun arrayNoDuplicates!0 (array!67973 (_ BitVec 32) List!22763) Bool)

(assert (=> b!1067700 (= res!712254 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22760))))

(declare-fun b!1067701 () Bool)

(assert (=> b!1067701 (= e!608919 true)))

(declare-fun lt!471248 () ListLongMap!14171)

(declare-fun lt!471250 () ListLongMap!14171)

(declare-fun -!617 (ListLongMap!14171 (_ BitVec 64)) ListLongMap!14171)

(assert (=> b!1067701 (= lt!471248 (-!617 lt!471250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!471252 () ListLongMap!14171)

(assert (=> b!1067701 (= (-!617 lt!471252 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471254)))

(declare-fun lt!471251 () Unit!34998)

(declare-fun addThenRemoveForNewKeyIsSame!27 (ListLongMap!14171 (_ BitVec 64) V!39097) Unit!34998)

(assert (=> b!1067701 (= lt!471251 (addThenRemoveForNewKeyIsSame!27 lt!471254 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471253 () ListLongMap!14171)

(assert (=> b!1067701 (and (= lt!471250 lt!471252) (= lt!471253 lt!471247))))

(declare-fun +!3170 (ListLongMap!14171 tuple2!16194) ListLongMap!14171)

(assert (=> b!1067701 (= lt!471252 (+!3170 lt!471254 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4051 (array!67973 array!67971 (_ BitVec 32) (_ BitVec 32) V!39097 V!39097 (_ BitVec 32) Int) ListLongMap!14171)

(assert (=> b!1067701 (= lt!471253 (getCurrentListMap!4051 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067701 (= lt!471250 (getCurrentListMap!4051 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067702 () Bool)

(assert (=> b!1067702 (= e!608918 tp_is_empty!25471)))

(declare-fun b!1067703 () Bool)

(assert (=> b!1067703 (= e!608921 tp_is_empty!25471)))

(declare-fun mapIsEmpty!39895 () Bool)

(assert (=> mapIsEmpty!39895 mapRes!39895))

(assert (= (and start!94534 res!712256) b!1067698))

(assert (= (and b!1067698 res!712255) b!1067697))

(assert (= (and b!1067697 res!712258) b!1067700))

(assert (= (and b!1067700 res!712254) b!1067696))

(assert (= (and b!1067696 (not res!712257)) b!1067701))

(assert (= (and b!1067699 condMapEmpty!39895) mapIsEmpty!39895))

(assert (= (and b!1067699 (not condMapEmpty!39895)) mapNonEmpty!39895))

(get-info :version)

(assert (= (and mapNonEmpty!39895 ((_ is ValueCellFull!12032) mapValue!39895)) b!1067703))

(assert (= (and b!1067699 ((_ is ValueCellFull!12032) mapDefault!39895)) b!1067702))

(assert (= start!94534 b!1067699))

(declare-fun m!986685 () Bool)

(assert (=> b!1067701 m!986685))

(declare-fun m!986687 () Bool)

(assert (=> b!1067701 m!986687))

(declare-fun m!986689 () Bool)

(assert (=> b!1067701 m!986689))

(declare-fun m!986691 () Bool)

(assert (=> b!1067701 m!986691))

(declare-fun m!986693 () Bool)

(assert (=> b!1067701 m!986693))

(declare-fun m!986695 () Bool)

(assert (=> b!1067701 m!986695))

(declare-fun m!986697 () Bool)

(assert (=> b!1067700 m!986697))

(declare-fun m!986699 () Bool)

(assert (=> start!94534 m!986699))

(declare-fun m!986701 () Bool)

(assert (=> start!94534 m!986701))

(declare-fun m!986703 () Bool)

(assert (=> start!94534 m!986703))

(declare-fun m!986705 () Bool)

(assert (=> b!1067697 m!986705))

(declare-fun m!986707 () Bool)

(assert (=> b!1067696 m!986707))

(declare-fun m!986709 () Bool)

(assert (=> b!1067696 m!986709))

(declare-fun m!986711 () Bool)

(assert (=> b!1067696 m!986711))

(declare-fun m!986713 () Bool)

(assert (=> mapNonEmpty!39895 m!986713))

(check-sat (not b!1067696) (not start!94534) (not b_next!21661) (not b!1067701) tp_is_empty!25471 (not mapNonEmpty!39895) b_and!34443 (not b!1067697) (not b!1067700))
(check-sat b_and!34443 (not b_next!21661))
