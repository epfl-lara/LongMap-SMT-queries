; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94140 () Bool)

(assert start!94140)

(declare-fun b_free!21547 () Bool)

(declare-fun b_next!21547 () Bool)

(assert (=> start!94140 (= b_free!21547 (not b_next!21547))))

(declare-fun tp!76075 () Bool)

(declare-fun b_and!34271 () Bool)

(assert (=> start!94140 (= tp!76075 b_and!34271)))

(declare-fun b!1064507 () Bool)

(declare-fun res!710662 () Bool)

(declare-fun e!606724 () Bool)

(assert (=> b!1064507 (=> (not res!710662) (not e!606724))))

(declare-datatypes ((array!67648 0))(
  ( (array!67649 (arr!32528 (Array (_ BitVec 32) (_ BitVec 64))) (size!33066 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67648)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67648 (_ BitVec 32)) Bool)

(assert (=> b!1064507 (= res!710662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!710660 () Bool)

(assert (=> start!94140 (=> (not res!710660) (not e!606724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94140 (= res!710660 (validMask!0 mask!1515))))

(assert (=> start!94140 e!606724))

(assert (=> start!94140 true))

(declare-fun tp_is_empty!25357 () Bool)

(assert (=> start!94140 tp_is_empty!25357))

(declare-datatypes ((V!38945 0))(
  ( (V!38946 (val!12729 Int)) )
))
(declare-datatypes ((ValueCell!11975 0))(
  ( (ValueCellFull!11975 (v!15340 V!38945)) (EmptyCell!11975) )
))
(declare-datatypes ((array!67650 0))(
  ( (array!67651 (arr!32529 (Array (_ BitVec 32) ValueCell!11975)) (size!33067 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67650)

(declare-fun e!606722 () Bool)

(declare-fun array_inv!25192 (array!67650) Bool)

(assert (=> start!94140 (and (array_inv!25192 _values!955) e!606722)))

(assert (=> start!94140 tp!76075))

(declare-fun array_inv!25193 (array!67648) Bool)

(assert (=> start!94140 (array_inv!25193 _keys!1163)))

(declare-fun b!1064508 () Bool)

(declare-fun e!606726 () Bool)

(assert (=> b!1064508 (= e!606726 true)))

(declare-fun zeroValueBefore!47 () V!38945)

(declare-datatypes ((tuple2!16184 0))(
  ( (tuple2!16185 (_1!8103 (_ BitVec 64)) (_2!8103 V!38945)) )
))
(declare-datatypes ((List!22733 0))(
  ( (Nil!22730) (Cons!22729 (h!23938 tuple2!16184) (t!32041 List!22733)) )
))
(declare-datatypes ((ListLongMap!14153 0))(
  ( (ListLongMap!14154 (toList!7092 List!22733)) )
))
(declare-fun lt!469113 () ListLongMap!14153)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38945)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3971 (array!67648 array!67650 (_ BitVec 32) (_ BitVec 32) V!38945 V!38945 (_ BitVec 32) Int) ListLongMap!14153)

(assert (=> b!1064508 (= lt!469113 (getCurrentListMap!3971 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39718 () Bool)

(declare-fun mapRes!39718 () Bool)

(declare-fun tp!76076 () Bool)

(declare-fun e!606727 () Bool)

(assert (=> mapNonEmpty!39718 (= mapRes!39718 (and tp!76076 e!606727))))

(declare-fun mapRest!39718 () (Array (_ BitVec 32) ValueCell!11975))

(declare-fun mapKey!39718 () (_ BitVec 32))

(declare-fun mapValue!39718 () ValueCell!11975)

(assert (=> mapNonEmpty!39718 (= (arr!32529 _values!955) (store mapRest!39718 mapKey!39718 mapValue!39718))))

(declare-fun b!1064509 () Bool)

(assert (=> b!1064509 (= e!606727 tp_is_empty!25357)))

(declare-fun b!1064510 () Bool)

(declare-fun res!710659 () Bool)

(assert (=> b!1064510 (=> (not res!710659) (not e!606724))))

(declare-datatypes ((List!22734 0))(
  ( (Nil!22731) (Cons!22730 (h!23939 (_ BitVec 64)) (t!32042 List!22734)) )
))
(declare-fun arrayNoDuplicates!0 (array!67648 (_ BitVec 32) List!22734) Bool)

(assert (=> b!1064510 (= res!710659 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22731))))

(declare-fun b!1064511 () Bool)

(declare-fun res!710663 () Bool)

(assert (=> b!1064511 (=> (not res!710663) (not e!606724))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1064511 (= res!710663 (and (= (size!33067 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33066 _keys!1163) (size!33067 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064512 () Bool)

(assert (=> b!1064512 (= e!606724 (not e!606726))))

(declare-fun res!710661 () Bool)

(assert (=> b!1064512 (=> res!710661 e!606726)))

(assert (=> b!1064512 (= res!710661 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469112 () ListLongMap!14153)

(declare-fun lt!469110 () ListLongMap!14153)

(assert (=> b!1064512 (= lt!469112 lt!469110)))

(declare-datatypes ((Unit!34775 0))(
  ( (Unit!34776) )
))
(declare-fun lt!469111 () Unit!34775)

(declare-fun zeroValueAfter!47 () V!38945)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!692 (array!67648 array!67650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38945 V!38945 V!38945 V!38945 (_ BitVec 32) Int) Unit!34775)

(assert (=> b!1064512 (= lt!469111 (lemmaNoChangeToArrayThenSameMapNoExtras!692 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3698 (array!67648 array!67650 (_ BitVec 32) (_ BitVec 32) V!38945 V!38945 (_ BitVec 32) Int) ListLongMap!14153)

(assert (=> b!1064512 (= lt!469110 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064512 (= lt!469112 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064513 () Bool)

(declare-fun e!606723 () Bool)

(assert (=> b!1064513 (= e!606722 (and e!606723 mapRes!39718))))

(declare-fun condMapEmpty!39718 () Bool)

(declare-fun mapDefault!39718 () ValueCell!11975)

(assert (=> b!1064513 (= condMapEmpty!39718 (= (arr!32529 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11975)) mapDefault!39718)))))

(declare-fun mapIsEmpty!39718 () Bool)

(assert (=> mapIsEmpty!39718 mapRes!39718))

(declare-fun b!1064514 () Bool)

(assert (=> b!1064514 (= e!606723 tp_is_empty!25357)))

(assert (= (and start!94140 res!710660) b!1064511))

(assert (= (and b!1064511 res!710663) b!1064507))

(assert (= (and b!1064507 res!710662) b!1064510))

(assert (= (and b!1064510 res!710659) b!1064512))

(assert (= (and b!1064512 (not res!710661)) b!1064508))

(assert (= (and b!1064513 condMapEmpty!39718) mapIsEmpty!39718))

(assert (= (and b!1064513 (not condMapEmpty!39718)) mapNonEmpty!39718))

(get-info :version)

(assert (= (and mapNonEmpty!39718 ((_ is ValueCellFull!11975) mapValue!39718)) b!1064509))

(assert (= (and b!1064513 ((_ is ValueCellFull!11975) mapDefault!39718)) b!1064514))

(assert (= start!94140 b!1064513))

(declare-fun m!982543 () Bool)

(assert (=> b!1064512 m!982543))

(declare-fun m!982545 () Bool)

(assert (=> b!1064512 m!982545))

(declare-fun m!982547 () Bool)

(assert (=> b!1064512 m!982547))

(declare-fun m!982549 () Bool)

(assert (=> b!1064510 m!982549))

(declare-fun m!982551 () Bool)

(assert (=> b!1064507 m!982551))

(declare-fun m!982553 () Bool)

(assert (=> b!1064508 m!982553))

(declare-fun m!982555 () Bool)

(assert (=> mapNonEmpty!39718 m!982555))

(declare-fun m!982557 () Bool)

(assert (=> start!94140 m!982557))

(declare-fun m!982559 () Bool)

(assert (=> start!94140 m!982559))

(declare-fun m!982561 () Bool)

(assert (=> start!94140 m!982561))

(check-sat (not b!1064507) (not mapNonEmpty!39718) (not start!94140) (not b!1064512) tp_is_empty!25357 b_and!34271 (not b!1064508) (not b_next!21547) (not b!1064510))
(check-sat b_and!34271 (not b_next!21547))
