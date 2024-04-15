; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94128 () Bool)

(assert start!94128)

(declare-fun b_free!21535 () Bool)

(declare-fun b_next!21535 () Bool)

(assert (=> start!94128 (= b_free!21535 (not b_next!21535))))

(declare-fun tp!76040 () Bool)

(declare-fun b_and!34259 () Bool)

(assert (=> start!94128 (= tp!76040 b_and!34259)))

(declare-fun mapNonEmpty!39700 () Bool)

(declare-fun mapRes!39700 () Bool)

(declare-fun tp!76039 () Bool)

(declare-fun e!606617 () Bool)

(assert (=> mapNonEmpty!39700 (= mapRes!39700 (and tp!76039 e!606617))))

(declare-datatypes ((V!38929 0))(
  ( (V!38930 (val!12723 Int)) )
))
(declare-datatypes ((ValueCell!11969 0))(
  ( (ValueCellFull!11969 (v!15334 V!38929)) (EmptyCell!11969) )
))
(declare-fun mapValue!39700 () ValueCell!11969)

(declare-fun mapRest!39700 () (Array (_ BitVec 32) ValueCell!11969))

(declare-datatypes ((array!67624 0))(
  ( (array!67625 (arr!32516 (Array (_ BitVec 32) ValueCell!11969)) (size!33054 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67624)

(declare-fun mapKey!39700 () (_ BitVec 32))

(assert (=> mapNonEmpty!39700 (= (arr!32516 _values!955) (store mapRest!39700 mapKey!39700 mapValue!39700))))

(declare-fun b!1064363 () Bool)

(declare-fun e!606616 () Bool)

(declare-fun e!606615 () Bool)

(assert (=> b!1064363 (= e!606616 (and e!606615 mapRes!39700))))

(declare-fun condMapEmpty!39700 () Bool)

(declare-fun mapDefault!39700 () ValueCell!11969)

(assert (=> b!1064363 (= condMapEmpty!39700 (= (arr!32516 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11969)) mapDefault!39700)))))

(declare-fun b!1064364 () Bool)

(declare-fun tp_is_empty!25345 () Bool)

(assert (=> b!1064364 (= e!606615 tp_is_empty!25345)))

(declare-fun b!1064365 () Bool)

(declare-fun e!606619 () Bool)

(declare-fun e!606618 () Bool)

(assert (=> b!1064365 (= e!606619 (not e!606618))))

(declare-fun res!710569 () Bool)

(assert (=> b!1064365 (=> res!710569 e!606618)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064365 (= res!710569 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16174 0))(
  ( (tuple2!16175 (_1!8098 (_ BitVec 64)) (_2!8098 V!38929)) )
))
(declare-datatypes ((List!22723 0))(
  ( (Nil!22720) (Cons!22719 (h!23928 tuple2!16174) (t!32031 List!22723)) )
))
(declare-datatypes ((ListLongMap!14143 0))(
  ( (ListLongMap!14144 (toList!7087 List!22723)) )
))
(declare-fun lt!469040 () ListLongMap!14143)

(declare-fun lt!469041 () ListLongMap!14143)

(assert (=> b!1064365 (= lt!469040 lt!469041)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38929)

(declare-fun minValue!907 () V!38929)

(declare-datatypes ((Unit!34765 0))(
  ( (Unit!34766) )
))
(declare-fun lt!469038 () Unit!34765)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38929)

(declare-datatypes ((array!67626 0))(
  ( (array!67627 (arr!32517 (Array (_ BitVec 32) (_ BitVec 64))) (size!33055 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67626)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!687 (array!67626 array!67624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38929 V!38929 V!38929 V!38929 (_ BitVec 32) Int) Unit!34765)

(assert (=> b!1064365 (= lt!469038 (lemmaNoChangeToArrayThenSameMapNoExtras!687 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3693 (array!67626 array!67624 (_ BitVec 32) (_ BitVec 32) V!38929 V!38929 (_ BitVec 32) Int) ListLongMap!14143)

(assert (=> b!1064365 (= lt!469041 (getCurrentListMapNoExtraKeys!3693 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064365 (= lt!469040 (getCurrentListMapNoExtraKeys!3693 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39700 () Bool)

(assert (=> mapIsEmpty!39700 mapRes!39700))

(declare-fun b!1064366 () Bool)

(declare-fun res!710573 () Bool)

(assert (=> b!1064366 (=> (not res!710573) (not e!606619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67626 (_ BitVec 32)) Bool)

(assert (=> b!1064366 (= res!710573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064367 () Bool)

(assert (=> b!1064367 (= e!606617 tp_is_empty!25345)))

(declare-fun b!1064368 () Bool)

(declare-fun res!710572 () Bool)

(assert (=> b!1064368 (=> (not res!710572) (not e!606619))))

(declare-datatypes ((List!22724 0))(
  ( (Nil!22721) (Cons!22720 (h!23929 (_ BitVec 64)) (t!32032 List!22724)) )
))
(declare-fun arrayNoDuplicates!0 (array!67626 (_ BitVec 32) List!22724) Bool)

(assert (=> b!1064368 (= res!710572 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22721))))

(declare-fun b!1064369 () Bool)

(assert (=> b!1064369 (= e!606618 true)))

(declare-fun lt!469039 () ListLongMap!14143)

(declare-fun getCurrentListMap!3966 (array!67626 array!67624 (_ BitVec 32) (_ BitVec 32) V!38929 V!38929 (_ BitVec 32) Int) ListLongMap!14143)

(assert (=> b!1064369 (= lt!469039 (getCurrentListMap!3966 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064370 () Bool)

(declare-fun res!710571 () Bool)

(assert (=> b!1064370 (=> (not res!710571) (not e!606619))))

(assert (=> b!1064370 (= res!710571 (and (= (size!33054 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33055 _keys!1163) (size!33054 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!710570 () Bool)

(assert (=> start!94128 (=> (not res!710570) (not e!606619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94128 (= res!710570 (validMask!0 mask!1515))))

(assert (=> start!94128 e!606619))

(assert (=> start!94128 true))

(assert (=> start!94128 tp_is_empty!25345))

(declare-fun array_inv!25184 (array!67624) Bool)

(assert (=> start!94128 (and (array_inv!25184 _values!955) e!606616)))

(assert (=> start!94128 tp!76040))

(declare-fun array_inv!25185 (array!67626) Bool)

(assert (=> start!94128 (array_inv!25185 _keys!1163)))

(assert (= (and start!94128 res!710570) b!1064370))

(assert (= (and b!1064370 res!710571) b!1064366))

(assert (= (and b!1064366 res!710573) b!1064368))

(assert (= (and b!1064368 res!710572) b!1064365))

(assert (= (and b!1064365 (not res!710569)) b!1064369))

(assert (= (and b!1064363 condMapEmpty!39700) mapIsEmpty!39700))

(assert (= (and b!1064363 (not condMapEmpty!39700)) mapNonEmpty!39700))

(get-info :version)

(assert (= (and mapNonEmpty!39700 ((_ is ValueCellFull!11969) mapValue!39700)) b!1064367))

(assert (= (and b!1064363 ((_ is ValueCellFull!11969) mapDefault!39700)) b!1064364))

(assert (= start!94128 b!1064363))

(declare-fun m!982423 () Bool)

(assert (=> b!1064369 m!982423))

(declare-fun m!982425 () Bool)

(assert (=> b!1064365 m!982425))

(declare-fun m!982427 () Bool)

(assert (=> b!1064365 m!982427))

(declare-fun m!982429 () Bool)

(assert (=> b!1064365 m!982429))

(declare-fun m!982431 () Bool)

(assert (=> b!1064368 m!982431))

(declare-fun m!982433 () Bool)

(assert (=> start!94128 m!982433))

(declare-fun m!982435 () Bool)

(assert (=> start!94128 m!982435))

(declare-fun m!982437 () Bool)

(assert (=> start!94128 m!982437))

(declare-fun m!982439 () Bool)

(assert (=> b!1064366 m!982439))

(declare-fun m!982441 () Bool)

(assert (=> mapNonEmpty!39700 m!982441))

(check-sat b_and!34259 tp_is_empty!25345 (not b!1064369) (not b!1064368) (not start!94128) (not mapNonEmpty!39700) (not b!1064365) (not b!1064366) (not b_next!21535))
(check-sat b_and!34259 (not b_next!21535))
