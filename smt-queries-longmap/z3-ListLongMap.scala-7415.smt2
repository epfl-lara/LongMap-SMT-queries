; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94306 () Bool)

(assert start!94306)

(declare-fun b_free!21669 () Bool)

(declare-fun b_next!21669 () Bool)

(assert (=> start!94306 (= b_free!21669 (not b_next!21669))))

(declare-fun tp!76448 () Bool)

(declare-fun b_and!34441 () Bool)

(assert (=> start!94306 (= tp!76448 b_and!34441)))

(declare-fun b!1066465 () Bool)

(declare-fun e!608138 () Bool)

(assert (=> b!1066465 (= e!608138 true)))

(declare-datatypes ((V!39107 0))(
  ( (V!39108 (val!12790 Int)) )
))
(declare-datatypes ((tuple2!16220 0))(
  ( (tuple2!16221 (_1!8121 (_ BitVec 64)) (_2!8121 V!39107)) )
))
(declare-datatypes ((List!22784 0))(
  ( (Nil!22781) (Cons!22780 (h!23989 tuple2!16220) (t!32105 List!22784)) )
))
(declare-datatypes ((ListLongMap!14189 0))(
  ( (ListLongMap!14190 (toList!7110 List!22784)) )
))
(declare-fun lt!470831 () ListLongMap!14189)

(declare-fun lt!470834 () ListLongMap!14189)

(declare-fun -!621 (ListLongMap!14189 (_ BitVec 64)) ListLongMap!14189)

(assert (=> b!1066465 (= lt!470831 (-!621 lt!470834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470835 () ListLongMap!14189)

(declare-fun lt!470833 () ListLongMap!14189)

(assert (=> b!1066465 (= (-!621 lt!470835 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470833)))

(declare-datatypes ((Unit!35015 0))(
  ( (Unit!35016) )
))
(declare-fun lt!470829 () Unit!35015)

(declare-fun zeroValueBefore!47 () V!39107)

(declare-fun addThenRemoveForNewKeyIsSame!30 (ListLongMap!14189 (_ BitVec 64) V!39107) Unit!35015)

(assert (=> b!1066465 (= lt!470829 (addThenRemoveForNewKeyIsSame!30 lt!470833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470828 () ListLongMap!14189)

(declare-fun lt!470830 () ListLongMap!14189)

(assert (=> b!1066465 (and (= lt!470834 lt!470835) (= lt!470828 lt!470830))))

(declare-fun +!3152 (ListLongMap!14189 tuple2!16220) ListLongMap!14189)

(assert (=> b!1066465 (= lt!470835 (+!3152 lt!470833 (tuple2!16221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12036 0))(
  ( (ValueCellFull!12036 (v!15403 V!39107)) (EmptyCell!12036) )
))
(declare-datatypes ((array!67943 0))(
  ( (array!67944 (arr!32673 (Array (_ BitVec 32) ValueCell!12036)) (size!33209 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67943)

(declare-fun minValue!907 () V!39107)

(declare-datatypes ((array!67945 0))(
  ( (array!67946 (arr!32674 (Array (_ BitVec 32) (_ BitVec 64))) (size!33210 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67945)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39107)

(declare-fun getCurrentListMap!4065 (array!67945 array!67943 (_ BitVec 32) (_ BitVec 32) V!39107 V!39107 (_ BitVec 32) Int) ListLongMap!14189)

(assert (=> b!1066465 (= lt!470828 (getCurrentListMap!4065 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066465 (= lt!470834 (getCurrentListMap!4065 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066467 () Bool)

(declare-fun res!711796 () Bool)

(declare-fun e!608135 () Bool)

(assert (=> b!1066467 (=> (not res!711796) (not e!608135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67945 (_ BitVec 32)) Bool)

(assert (=> b!1066467 (= res!711796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39907 () Bool)

(declare-fun mapRes!39907 () Bool)

(declare-fun tp!76447 () Bool)

(declare-fun e!608136 () Bool)

(assert (=> mapNonEmpty!39907 (= mapRes!39907 (and tp!76447 e!608136))))

(declare-fun mapRest!39907 () (Array (_ BitVec 32) ValueCell!12036))

(declare-fun mapValue!39907 () ValueCell!12036)

(declare-fun mapKey!39907 () (_ BitVec 32))

(assert (=> mapNonEmpty!39907 (= (arr!32673 _values!955) (store mapRest!39907 mapKey!39907 mapValue!39907))))

(declare-fun b!1066468 () Bool)

(declare-fun e!608137 () Bool)

(declare-fun tp_is_empty!25479 () Bool)

(assert (=> b!1066468 (= e!608137 tp_is_empty!25479)))

(declare-fun b!1066469 () Bool)

(declare-fun res!711793 () Bool)

(assert (=> b!1066469 (=> (not res!711793) (not e!608135))))

(declare-datatypes ((List!22785 0))(
  ( (Nil!22782) (Cons!22781 (h!23990 (_ BitVec 64)) (t!32106 List!22785)) )
))
(declare-fun arrayNoDuplicates!0 (array!67945 (_ BitVec 32) List!22785) Bool)

(assert (=> b!1066469 (= res!711793 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22782))))

(declare-fun b!1066466 () Bool)

(declare-fun res!711795 () Bool)

(assert (=> b!1066466 (=> (not res!711795) (not e!608135))))

(assert (=> b!1066466 (= res!711795 (and (= (size!33209 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33210 _keys!1163) (size!33209 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711794 () Bool)

(assert (=> start!94306 (=> (not res!711794) (not e!608135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94306 (= res!711794 (validMask!0 mask!1515))))

(assert (=> start!94306 e!608135))

(assert (=> start!94306 true))

(assert (=> start!94306 tp_is_empty!25479))

(declare-fun e!608140 () Bool)

(declare-fun array_inv!25300 (array!67943) Bool)

(assert (=> start!94306 (and (array_inv!25300 _values!955) e!608140)))

(assert (=> start!94306 tp!76448))

(declare-fun array_inv!25301 (array!67945) Bool)

(assert (=> start!94306 (array_inv!25301 _keys!1163)))

(declare-fun mapIsEmpty!39907 () Bool)

(assert (=> mapIsEmpty!39907 mapRes!39907))

(declare-fun b!1066470 () Bool)

(assert (=> b!1066470 (= e!608140 (and e!608137 mapRes!39907))))

(declare-fun condMapEmpty!39907 () Bool)

(declare-fun mapDefault!39907 () ValueCell!12036)

(assert (=> b!1066470 (= condMapEmpty!39907 (= (arr!32673 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12036)) mapDefault!39907)))))

(declare-fun b!1066471 () Bool)

(assert (=> b!1066471 (= e!608135 (not e!608138))))

(declare-fun res!711792 () Bool)

(assert (=> b!1066471 (=> res!711792 e!608138)))

(assert (=> b!1066471 (= res!711792 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066471 (= lt!470833 lt!470830)))

(declare-fun lt!470832 () Unit!35015)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!733 (array!67945 array!67943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39107 V!39107 V!39107 V!39107 (_ BitVec 32) Int) Unit!35015)

(assert (=> b!1066471 (= lt!470832 (lemmaNoChangeToArrayThenSameMapNoExtras!733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3696 (array!67945 array!67943 (_ BitVec 32) (_ BitVec 32) V!39107 V!39107 (_ BitVec 32) Int) ListLongMap!14189)

(assert (=> b!1066471 (= lt!470830 (getCurrentListMapNoExtraKeys!3696 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066471 (= lt!470833 (getCurrentListMapNoExtraKeys!3696 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066472 () Bool)

(assert (=> b!1066472 (= e!608136 tp_is_empty!25479)))

(assert (= (and start!94306 res!711794) b!1066466))

(assert (= (and b!1066466 res!711795) b!1066467))

(assert (= (and b!1066467 res!711796) b!1066469))

(assert (= (and b!1066469 res!711793) b!1066471))

(assert (= (and b!1066471 (not res!711792)) b!1066465))

(assert (= (and b!1066470 condMapEmpty!39907) mapIsEmpty!39907))

(assert (= (and b!1066470 (not condMapEmpty!39907)) mapNonEmpty!39907))

(get-info :version)

(assert (= (and mapNonEmpty!39907 ((_ is ValueCellFull!12036) mapValue!39907)) b!1066472))

(assert (= (and b!1066470 ((_ is ValueCellFull!12036) mapDefault!39907)) b!1066468))

(assert (= start!94306 b!1066470))

(declare-fun m!985133 () Bool)

(assert (=> start!94306 m!985133))

(declare-fun m!985135 () Bool)

(assert (=> start!94306 m!985135))

(declare-fun m!985137 () Bool)

(assert (=> start!94306 m!985137))

(declare-fun m!985139 () Bool)

(assert (=> b!1066471 m!985139))

(declare-fun m!985141 () Bool)

(assert (=> b!1066471 m!985141))

(declare-fun m!985143 () Bool)

(assert (=> b!1066471 m!985143))

(declare-fun m!985145 () Bool)

(assert (=> mapNonEmpty!39907 m!985145))

(declare-fun m!985147 () Bool)

(assert (=> b!1066469 m!985147))

(declare-fun m!985149 () Bool)

(assert (=> b!1066465 m!985149))

(declare-fun m!985151 () Bool)

(assert (=> b!1066465 m!985151))

(declare-fun m!985153 () Bool)

(assert (=> b!1066465 m!985153))

(declare-fun m!985155 () Bool)

(assert (=> b!1066465 m!985155))

(declare-fun m!985157 () Bool)

(assert (=> b!1066465 m!985157))

(declare-fun m!985159 () Bool)

(assert (=> b!1066465 m!985159))

(declare-fun m!985161 () Bool)

(assert (=> b!1066467 m!985161))

(check-sat (not mapNonEmpty!39907) b_and!34441 (not b_next!21669) (not b!1066467) tp_is_empty!25479 (not b!1066469) (not b!1066465) (not b!1066471) (not start!94306))
(check-sat b_and!34441 (not b_next!21669))
