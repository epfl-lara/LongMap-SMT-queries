; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94508 () Bool)

(assert start!94508)

(declare-fun b_free!21813 () Bool)

(declare-fun b_next!21813 () Bool)

(assert (=> start!94508 (= b_free!21813 (not b_next!21813))))

(declare-fun tp!76889 () Bool)

(declare-fun b_and!34615 () Bool)

(assert (=> start!94508 (= tp!76889 b_and!34615)))

(declare-fun res!713065 () Bool)

(declare-fun e!609723 () Bool)

(assert (=> start!94508 (=> (not res!713065) (not e!609723))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94508 (= res!713065 (validMask!0 mask!1515))))

(assert (=> start!94508 e!609723))

(assert (=> start!94508 true))

(declare-fun tp_is_empty!25623 () Bool)

(assert (=> start!94508 tp_is_empty!25623))

(declare-datatypes ((V!39299 0))(
  ( (V!39300 (val!12862 Int)) )
))
(declare-datatypes ((ValueCell!12108 0))(
  ( (ValueCellFull!12108 (v!15477 V!39299)) (EmptyCell!12108) )
))
(declare-datatypes ((array!68227 0))(
  ( (array!68228 (arr!32812 (Array (_ BitVec 32) ValueCell!12108)) (size!33348 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68227)

(declare-fun e!609721 () Bool)

(declare-fun array_inv!25402 (array!68227) Bool)

(assert (=> start!94508 (and (array_inv!25402 _values!955) e!609721)))

(assert (=> start!94508 tp!76889))

(declare-datatypes ((array!68229 0))(
  ( (array!68230 (arr!32813 (Array (_ BitVec 32) (_ BitVec 64))) (size!33349 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68229)

(declare-fun array_inv!25403 (array!68229) Bool)

(assert (=> start!94508 (array_inv!25403 _keys!1163)))

(declare-fun mapIsEmpty!40132 () Bool)

(declare-fun mapRes!40132 () Bool)

(assert (=> mapIsEmpty!40132 mapRes!40132))

(declare-fun b!1068633 () Bool)

(declare-fun e!609722 () Bool)

(assert (=> b!1068633 (= e!609721 (and e!609722 mapRes!40132))))

(declare-fun condMapEmpty!40132 () Bool)

(declare-fun mapDefault!40132 () ValueCell!12108)

(assert (=> b!1068633 (= condMapEmpty!40132 (= (arr!32812 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12108)) mapDefault!40132)))))

(declare-fun b!1068634 () Bool)

(declare-fun res!713062 () Bool)

(assert (=> b!1068634 (=> (not res!713062) (not e!609723))))

(declare-datatypes ((List!22889 0))(
  ( (Nil!22886) (Cons!22885 (h!24094 (_ BitVec 64)) (t!32216 List!22889)) )
))
(declare-fun arrayNoDuplicates!0 (array!68229 (_ BitVec 32) List!22889) Bool)

(assert (=> b!1068634 (= res!713062 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22886))))

(declare-fun b!1068635 () Bool)

(declare-fun e!609724 () Bool)

(assert (=> b!1068635 (= e!609723 (not e!609724))))

(declare-fun res!713060 () Bool)

(assert (=> b!1068635 (=> res!713060 e!609724)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068635 (= res!713060 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16340 0))(
  ( (tuple2!16341 (_1!8181 (_ BitVec 64)) (_2!8181 V!39299)) )
))
(declare-datatypes ((List!22890 0))(
  ( (Nil!22887) (Cons!22886 (h!24095 tuple2!16340) (t!32217 List!22890)) )
))
(declare-datatypes ((ListLongMap!14309 0))(
  ( (ListLongMap!14310 (toList!7170 List!22890)) )
))
(declare-fun lt!472133 () ListLongMap!14309)

(declare-fun lt!472136 () ListLongMap!14309)

(assert (=> b!1068635 (= lt!472133 lt!472136)))

(declare-fun zeroValueBefore!47 () V!39299)

(declare-datatypes ((Unit!35139 0))(
  ( (Unit!35140) )
))
(declare-fun lt!472135 () Unit!35139)

(declare-fun minValue!907 () V!39299)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!787 (array!68229 array!68227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39299 V!39299 V!39299 V!39299 (_ BitVec 32) Int) Unit!35139)

(assert (=> b!1068635 (= lt!472135 (lemmaNoChangeToArrayThenSameMapNoExtras!787 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3750 (array!68229 array!68227 (_ BitVec 32) (_ BitVec 32) V!39299 V!39299 (_ BitVec 32) Int) ListLongMap!14309)

(assert (=> b!1068635 (= lt!472136 (getCurrentListMapNoExtraKeys!3750 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068635 (= lt!472133 (getCurrentListMapNoExtraKeys!3750 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068636 () Bool)

(declare-fun e!609719 () Bool)

(assert (=> b!1068636 (= e!609724 e!609719)))

(declare-fun res!713063 () Bool)

(assert (=> b!1068636 (=> res!713063 e!609719)))

(declare-fun lt!472134 () ListLongMap!14309)

(declare-fun contains!6301 (ListLongMap!14309 (_ BitVec 64)) Bool)

(assert (=> b!1068636 (= res!713063 (contains!6301 lt!472134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4097 (array!68229 array!68227 (_ BitVec 32) (_ BitVec 32) V!39299 V!39299 (_ BitVec 32) Int) ListLongMap!14309)

(assert (=> b!1068636 (= lt!472134 (getCurrentListMap!4097 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068637 () Bool)

(assert (=> b!1068637 (= e!609719 true)))

(declare-fun -!652 (ListLongMap!14309 (_ BitVec 64)) ListLongMap!14309)

(assert (=> b!1068637 (= (-!652 lt!472134 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472134)))

(declare-fun lt!472132 () Unit!35139)

(declare-fun removeNotPresentStillSame!62 (ListLongMap!14309 (_ BitVec 64)) Unit!35139)

(assert (=> b!1068637 (= lt!472132 (removeNotPresentStillSame!62 lt!472134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068638 () Bool)

(assert (=> b!1068638 (= e!609722 tp_is_empty!25623)))

(declare-fun mapNonEmpty!40132 () Bool)

(declare-fun tp!76888 () Bool)

(declare-fun e!609725 () Bool)

(assert (=> mapNonEmpty!40132 (= mapRes!40132 (and tp!76888 e!609725))))

(declare-fun mapValue!40132 () ValueCell!12108)

(declare-fun mapRest!40132 () (Array (_ BitVec 32) ValueCell!12108))

(declare-fun mapKey!40132 () (_ BitVec 32))

(assert (=> mapNonEmpty!40132 (= (arr!32812 _values!955) (store mapRest!40132 mapKey!40132 mapValue!40132))))

(declare-fun b!1068639 () Bool)

(declare-fun res!713064 () Bool)

(assert (=> b!1068639 (=> (not res!713064) (not e!609723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68229 (_ BitVec 32)) Bool)

(assert (=> b!1068639 (= res!713064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068640 () Bool)

(declare-fun res!713061 () Bool)

(assert (=> b!1068640 (=> (not res!713061) (not e!609723))))

(assert (=> b!1068640 (= res!713061 (and (= (size!33348 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33349 _keys!1163) (size!33348 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068641 () Bool)

(assert (=> b!1068641 (= e!609725 tp_is_empty!25623)))

(assert (= (and start!94508 res!713065) b!1068640))

(assert (= (and b!1068640 res!713061) b!1068639))

(assert (= (and b!1068639 res!713064) b!1068634))

(assert (= (and b!1068634 res!713062) b!1068635))

(assert (= (and b!1068635 (not res!713060)) b!1068636))

(assert (= (and b!1068636 (not res!713063)) b!1068637))

(assert (= (and b!1068633 condMapEmpty!40132) mapIsEmpty!40132))

(assert (= (and b!1068633 (not condMapEmpty!40132)) mapNonEmpty!40132))

(get-info :version)

(assert (= (and mapNonEmpty!40132 ((_ is ValueCellFull!12108) mapValue!40132)) b!1068641))

(assert (= (and b!1068633 ((_ is ValueCellFull!12108) mapDefault!40132)) b!1068638))

(assert (= start!94508 b!1068633))

(declare-fun m!987197 () Bool)

(assert (=> b!1068637 m!987197))

(declare-fun m!987199 () Bool)

(assert (=> b!1068637 m!987199))

(declare-fun m!987201 () Bool)

(assert (=> start!94508 m!987201))

(declare-fun m!987203 () Bool)

(assert (=> start!94508 m!987203))

(declare-fun m!987205 () Bool)

(assert (=> start!94508 m!987205))

(declare-fun m!987207 () Bool)

(assert (=> b!1068634 m!987207))

(declare-fun m!987209 () Bool)

(assert (=> b!1068636 m!987209))

(declare-fun m!987211 () Bool)

(assert (=> b!1068636 m!987211))

(declare-fun m!987213 () Bool)

(assert (=> b!1068635 m!987213))

(declare-fun m!987215 () Bool)

(assert (=> b!1068635 m!987215))

(declare-fun m!987217 () Bool)

(assert (=> b!1068635 m!987217))

(declare-fun m!987219 () Bool)

(assert (=> b!1068639 m!987219))

(declare-fun m!987221 () Bool)

(assert (=> mapNonEmpty!40132 m!987221))

(check-sat (not b!1068637) (not start!94508) (not b!1068636) (not b!1068639) (not mapNonEmpty!40132) b_and!34615 (not b!1068634) (not b_next!21813) (not b!1068635) tp_is_empty!25623)
(check-sat b_and!34615 (not b_next!21813))
