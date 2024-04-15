; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94708 () Bool)

(assert start!94708)

(declare-fun b_free!21967 () Bool)

(declare-fun b_next!21967 () Bool)

(assert (=> start!94708 (= b_free!21967 (not b_next!21967))))

(declare-fun tp!77359 () Bool)

(declare-fun b_and!34771 () Bool)

(assert (=> start!94708 (= tp!77359 b_and!34771)))

(declare-fun mapNonEmpty!40372 () Bool)

(declare-fun mapRes!40372 () Bool)

(declare-fun tp!77360 () Bool)

(declare-fun e!611252 () Bool)

(assert (=> mapNonEmpty!40372 (= mapRes!40372 (and tp!77360 e!611252))))

(declare-fun mapKey!40372 () (_ BitVec 32))

(declare-datatypes ((V!39505 0))(
  ( (V!39506 (val!12939 Int)) )
))
(declare-datatypes ((ValueCell!12185 0))(
  ( (ValueCellFull!12185 (v!15554 V!39505)) (EmptyCell!12185) )
))
(declare-datatypes ((array!68466 0))(
  ( (array!68467 (arr!32929 (Array (_ BitVec 32) ValueCell!12185)) (size!33467 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68466)

(declare-fun mapValue!40372 () ValueCell!12185)

(declare-fun mapRest!40372 () (Array (_ BitVec 32) ValueCell!12185))

(assert (=> mapNonEmpty!40372 (= (arr!32929 _values!955) (store mapRest!40372 mapKey!40372 mapValue!40372))))

(declare-fun b!1070706 () Bool)

(declare-fun e!611250 () Bool)

(declare-fun e!611253 () Bool)

(assert (=> b!1070706 (= e!611250 (not e!611253))))

(declare-fun res!714286 () Bool)

(assert (=> b!1070706 (=> res!714286 e!611253)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070706 (= res!714286 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16506 0))(
  ( (tuple2!16507 (_1!8264 (_ BitVec 64)) (_2!8264 V!39505)) )
))
(declare-datatypes ((List!23035 0))(
  ( (Nil!23032) (Cons!23031 (h!24240 tuple2!16506) (t!32359 List!23035)) )
))
(declare-datatypes ((ListLongMap!14475 0))(
  ( (ListLongMap!14476 (toList!7253 List!23035)) )
))
(declare-fun lt!473120 () ListLongMap!14475)

(declare-fun lt!473124 () ListLongMap!14475)

(assert (=> b!1070706 (= lt!473120 lt!473124)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39505)

(declare-fun minValue!907 () V!39505)

(declare-datatypes ((Unit!35089 0))(
  ( (Unit!35090) )
))
(declare-fun lt!473121 () Unit!35089)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39505)

(declare-datatypes ((array!68468 0))(
  ( (array!68469 (arr!32930 (Array (_ BitVec 32) (_ BitVec 64))) (size!33468 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68468)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!833 (array!68468 array!68466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39505 V!39505 V!39505 V!39505 (_ BitVec 32) Int) Unit!35089)

(assert (=> b!1070706 (= lt!473121 (lemmaNoChangeToArrayThenSameMapNoExtras!833 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3839 (array!68468 array!68466 (_ BitVec 32) (_ BitVec 32) V!39505 V!39505 (_ BitVec 32) Int) ListLongMap!14475)

(assert (=> b!1070706 (= lt!473124 (getCurrentListMapNoExtraKeys!3839 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070706 (= lt!473120 (getCurrentListMapNoExtraKeys!3839 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070707 () Bool)

(declare-fun res!714289 () Bool)

(assert (=> b!1070707 (=> (not res!714289) (not e!611250))))

(assert (=> b!1070707 (= res!714289 (and (= (size!33467 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33468 _keys!1163) (size!33467 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070708 () Bool)

(declare-fun e!611254 () Bool)

(declare-fun e!611255 () Bool)

(assert (=> b!1070708 (= e!611254 (and e!611255 mapRes!40372))))

(declare-fun condMapEmpty!40372 () Bool)

(declare-fun mapDefault!40372 () ValueCell!12185)

(assert (=> b!1070708 (= condMapEmpty!40372 (= (arr!32929 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12185)) mapDefault!40372)))))

(declare-fun b!1070709 () Bool)

(declare-fun tp_is_empty!25777 () Bool)

(assert (=> b!1070709 (= e!611252 tp_is_empty!25777)))

(declare-fun b!1070710 () Bool)

(declare-fun res!714288 () Bool)

(assert (=> b!1070710 (=> (not res!714288) (not e!611250))))

(declare-datatypes ((List!23036 0))(
  ( (Nil!23033) (Cons!23032 (h!24241 (_ BitVec 64)) (t!32360 List!23036)) )
))
(declare-fun arrayNoDuplicates!0 (array!68468 (_ BitVec 32) List!23036) Bool)

(assert (=> b!1070710 (= res!714288 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23033))))

(declare-fun b!1070711 () Bool)

(assert (=> b!1070711 (= e!611255 tp_is_empty!25777)))

(declare-fun b!1070712 () Bool)

(declare-fun e!611251 () Bool)

(declare-fun lt!473122 () ListLongMap!14475)

(declare-fun lt!473119 () tuple2!16506)

(declare-fun +!3189 (ListLongMap!14475 tuple2!16506) ListLongMap!14475)

(assert (=> b!1070712 (= e!611251 (= lt!473122 (+!3189 lt!473124 lt!473119)))))

(declare-fun b!1070713 () Bool)

(assert (=> b!1070713 (= e!611253 true)))

(declare-fun lt!473118 () Bool)

(declare-fun contains!6288 (ListLongMap!14475 (_ BitVec 64)) Bool)

(assert (=> b!1070713 (= lt!473118 (contains!6288 (+!3189 lt!473120 lt!473119) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1070713 e!611251))

(declare-fun res!714287 () Bool)

(assert (=> b!1070713 (=> (not res!714287) (not e!611251))))

(declare-fun lt!473123 () ListLongMap!14475)

(assert (=> b!1070713 (= res!714287 (= lt!473123 (+!3189 (+!3189 lt!473120 (tuple2!16507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!473119)))))

(assert (=> b!1070713 (= lt!473119 (tuple2!16507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun getCurrentListMap!4066 (array!68468 array!68466 (_ BitVec 32) (_ BitVec 32) V!39505 V!39505 (_ BitVec 32) Int) ListLongMap!14475)

(assert (=> b!1070713 (= lt!473122 (getCurrentListMap!4066 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070713 (= lt!473123 (getCurrentListMap!4066 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!714285 () Bool)

(assert (=> start!94708 (=> (not res!714285) (not e!611250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94708 (= res!714285 (validMask!0 mask!1515))))

(assert (=> start!94708 e!611250))

(assert (=> start!94708 true))

(assert (=> start!94708 tp_is_empty!25777))

(declare-fun array_inv!25476 (array!68466) Bool)

(assert (=> start!94708 (and (array_inv!25476 _values!955) e!611254)))

(assert (=> start!94708 tp!77359))

(declare-fun array_inv!25477 (array!68468) Bool)

(assert (=> start!94708 (array_inv!25477 _keys!1163)))

(declare-fun b!1070714 () Bool)

(declare-fun res!714284 () Bool)

(assert (=> b!1070714 (=> (not res!714284) (not e!611250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68468 (_ BitVec 32)) Bool)

(assert (=> b!1070714 (= res!714284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40372 () Bool)

(assert (=> mapIsEmpty!40372 mapRes!40372))

(assert (= (and start!94708 res!714285) b!1070707))

(assert (= (and b!1070707 res!714289) b!1070714))

(assert (= (and b!1070714 res!714284) b!1070710))

(assert (= (and b!1070710 res!714288) b!1070706))

(assert (= (and b!1070706 (not res!714286)) b!1070713))

(assert (= (and b!1070713 res!714287) b!1070712))

(assert (= (and b!1070708 condMapEmpty!40372) mapIsEmpty!40372))

(assert (= (and b!1070708 (not condMapEmpty!40372)) mapNonEmpty!40372))

(get-info :version)

(assert (= (and mapNonEmpty!40372 ((_ is ValueCellFull!12185) mapValue!40372)) b!1070709))

(assert (= (and b!1070708 ((_ is ValueCellFull!12185) mapDefault!40372)) b!1070711))

(assert (= start!94708 b!1070708))

(declare-fun m!988499 () Bool)

(assert (=> b!1070706 m!988499))

(declare-fun m!988501 () Bool)

(assert (=> b!1070706 m!988501))

(declare-fun m!988503 () Bool)

(assert (=> b!1070706 m!988503))

(declare-fun m!988505 () Bool)

(assert (=> b!1070713 m!988505))

(declare-fun m!988507 () Bool)

(assert (=> b!1070713 m!988507))

(declare-fun m!988509 () Bool)

(assert (=> b!1070713 m!988509))

(assert (=> b!1070713 m!988505))

(declare-fun m!988511 () Bool)

(assert (=> b!1070713 m!988511))

(declare-fun m!988513 () Bool)

(assert (=> b!1070713 m!988513))

(declare-fun m!988515 () Bool)

(assert (=> b!1070713 m!988515))

(assert (=> b!1070713 m!988507))

(declare-fun m!988517 () Bool)

(assert (=> start!94708 m!988517))

(declare-fun m!988519 () Bool)

(assert (=> start!94708 m!988519))

(declare-fun m!988521 () Bool)

(assert (=> start!94708 m!988521))

(declare-fun m!988523 () Bool)

(assert (=> b!1070710 m!988523))

(declare-fun m!988525 () Bool)

(assert (=> b!1070712 m!988525))

(declare-fun m!988527 () Bool)

(assert (=> b!1070714 m!988527))

(declare-fun m!988529 () Bool)

(assert (=> mapNonEmpty!40372 m!988529))

(check-sat (not b!1070706) (not b!1070714) b_and!34771 (not b_next!21967) (not b!1070710) (not b!1070712) tp_is_empty!25777 (not start!94708) (not b!1070713) (not mapNonEmpty!40372))
(check-sat b_and!34771 (not b_next!21967))
