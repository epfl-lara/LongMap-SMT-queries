; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94152 () Bool)

(assert start!94152)

(declare-fun b_free!21559 () Bool)

(declare-fun b_next!21559 () Bool)

(assert (=> start!94152 (= b_free!21559 (not b_next!21559))))

(declare-fun tp!76112 () Bool)

(declare-fun b_and!34283 () Bool)

(assert (=> start!94152 (= tp!76112 b_and!34283)))

(declare-fun mapIsEmpty!39736 () Bool)

(declare-fun mapRes!39736 () Bool)

(assert (=> mapIsEmpty!39736 mapRes!39736))

(declare-fun b!1064651 () Bool)

(declare-fun res!710752 () Bool)

(declare-fun e!606835 () Bool)

(assert (=> b!1064651 (=> (not res!710752) (not e!606835))))

(declare-datatypes ((array!67672 0))(
  ( (array!67673 (arr!32540 (Array (_ BitVec 32) (_ BitVec 64))) (size!33078 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67672)

(declare-datatypes ((List!22741 0))(
  ( (Nil!22738) (Cons!22737 (h!23946 (_ BitVec 64)) (t!32049 List!22741)) )
))
(declare-fun arrayNoDuplicates!0 (array!67672 (_ BitVec 32) List!22741) Bool)

(assert (=> b!1064651 (= res!710752 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22738))))

(declare-fun b!1064652 () Bool)

(declare-fun res!710751 () Bool)

(assert (=> b!1064652 (=> (not res!710751) (not e!606835))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67672 (_ BitVec 32)) Bool)

(assert (=> b!1064652 (= res!710751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064653 () Bool)

(declare-fun e!606834 () Bool)

(assert (=> b!1064653 (= e!606835 (not e!606834))))

(declare-fun res!710753 () Bool)

(assert (=> b!1064653 (=> res!710753 e!606834)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064653 (= res!710753 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38961 0))(
  ( (V!38962 (val!12735 Int)) )
))
(declare-datatypes ((tuple2!16190 0))(
  ( (tuple2!16191 (_1!8106 (_ BitVec 64)) (_2!8106 V!38961)) )
))
(declare-datatypes ((List!22742 0))(
  ( (Nil!22739) (Cons!22738 (h!23947 tuple2!16190) (t!32050 List!22742)) )
))
(declare-datatypes ((ListLongMap!14159 0))(
  ( (ListLongMap!14160 (toList!7095 List!22742)) )
))
(declare-fun lt!469184 () ListLongMap!14159)

(declare-fun lt!469183 () ListLongMap!14159)

(assert (=> b!1064653 (= lt!469184 lt!469183)))

(declare-fun zeroValueBefore!47 () V!38961)

(declare-datatypes ((ValueCell!11981 0))(
  ( (ValueCellFull!11981 (v!15346 V!38961)) (EmptyCell!11981) )
))
(declare-datatypes ((array!67674 0))(
  ( (array!67675 (arr!32541 (Array (_ BitVec 32) ValueCell!11981)) (size!33079 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67674)

(declare-fun minValue!907 () V!38961)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38961)

(declare-datatypes ((Unit!34781 0))(
  ( (Unit!34782) )
))
(declare-fun lt!469182 () Unit!34781)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!695 (array!67672 array!67674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 V!38961 V!38961 (_ BitVec 32) Int) Unit!34781)

(assert (=> b!1064653 (= lt!469182 (lemmaNoChangeToArrayThenSameMapNoExtras!695 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3701 (array!67672 array!67674 (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 (_ BitVec 32) Int) ListLongMap!14159)

(assert (=> b!1064653 (= lt!469183 (getCurrentListMapNoExtraKeys!3701 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064653 (= lt!469184 (getCurrentListMapNoExtraKeys!3701 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710749 () Bool)

(assert (=> start!94152 (=> (not res!710749) (not e!606835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94152 (= res!710749 (validMask!0 mask!1515))))

(assert (=> start!94152 e!606835))

(assert (=> start!94152 true))

(declare-fun tp_is_empty!25369 () Bool)

(assert (=> start!94152 tp_is_empty!25369))

(declare-fun e!606830 () Bool)

(declare-fun array_inv!25200 (array!67674) Bool)

(assert (=> start!94152 (and (array_inv!25200 _values!955) e!606830)))

(assert (=> start!94152 tp!76112))

(declare-fun array_inv!25201 (array!67672) Bool)

(assert (=> start!94152 (array_inv!25201 _keys!1163)))

(declare-fun b!1064654 () Bool)

(declare-fun e!606832 () Bool)

(assert (=> b!1064654 (= e!606832 tp_is_empty!25369)))

(declare-fun b!1064655 () Bool)

(declare-fun e!606833 () Bool)

(assert (=> b!1064655 (= e!606830 (and e!606833 mapRes!39736))))

(declare-fun condMapEmpty!39736 () Bool)

(declare-fun mapDefault!39736 () ValueCell!11981)

(assert (=> b!1064655 (= condMapEmpty!39736 (= (arr!32541 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11981)) mapDefault!39736)))))

(declare-fun mapNonEmpty!39736 () Bool)

(declare-fun tp!76111 () Bool)

(assert (=> mapNonEmpty!39736 (= mapRes!39736 (and tp!76111 e!606832))))

(declare-fun mapRest!39736 () (Array (_ BitVec 32) ValueCell!11981))

(declare-fun mapKey!39736 () (_ BitVec 32))

(declare-fun mapValue!39736 () ValueCell!11981)

(assert (=> mapNonEmpty!39736 (= (arr!32541 _values!955) (store mapRest!39736 mapKey!39736 mapValue!39736))))

(declare-fun b!1064656 () Bool)

(assert (=> b!1064656 (= e!606833 tp_is_empty!25369)))

(declare-fun b!1064657 () Bool)

(assert (=> b!1064657 (= e!606834 true)))

(declare-fun lt!469185 () ListLongMap!14159)

(declare-fun getCurrentListMap!3974 (array!67672 array!67674 (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 (_ BitVec 32) Int) ListLongMap!14159)

(assert (=> b!1064657 (= lt!469185 (getCurrentListMap!3974 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064658 () Bool)

(declare-fun res!710750 () Bool)

(assert (=> b!1064658 (=> (not res!710750) (not e!606835))))

(assert (=> b!1064658 (= res!710750 (and (= (size!33079 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33078 _keys!1163) (size!33079 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94152 res!710749) b!1064658))

(assert (= (and b!1064658 res!710750) b!1064652))

(assert (= (and b!1064652 res!710751) b!1064651))

(assert (= (and b!1064651 res!710752) b!1064653))

(assert (= (and b!1064653 (not res!710753)) b!1064657))

(assert (= (and b!1064655 condMapEmpty!39736) mapIsEmpty!39736))

(assert (= (and b!1064655 (not condMapEmpty!39736)) mapNonEmpty!39736))

(get-info :version)

(assert (= (and mapNonEmpty!39736 ((_ is ValueCellFull!11981) mapValue!39736)) b!1064654))

(assert (= (and b!1064655 ((_ is ValueCellFull!11981) mapDefault!39736)) b!1064656))

(assert (= start!94152 b!1064655))

(declare-fun m!982663 () Bool)

(assert (=> b!1064652 m!982663))

(declare-fun m!982665 () Bool)

(assert (=> start!94152 m!982665))

(declare-fun m!982667 () Bool)

(assert (=> start!94152 m!982667))

(declare-fun m!982669 () Bool)

(assert (=> start!94152 m!982669))

(declare-fun m!982671 () Bool)

(assert (=> b!1064657 m!982671))

(declare-fun m!982673 () Bool)

(assert (=> b!1064651 m!982673))

(declare-fun m!982675 () Bool)

(assert (=> b!1064653 m!982675))

(declare-fun m!982677 () Bool)

(assert (=> b!1064653 m!982677))

(declare-fun m!982679 () Bool)

(assert (=> b!1064653 m!982679))

(declare-fun m!982681 () Bool)

(assert (=> mapNonEmpty!39736 m!982681))

(check-sat b_and!34283 (not b_next!21559) (not mapNonEmpty!39736) (not b!1064653) (not b!1064657) (not b!1064651) (not start!94152) (not b!1064652) tp_is_empty!25369)
(check-sat b_and!34283 (not b_next!21559))
