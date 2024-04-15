; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94350 () Bool)

(assert start!94350)

(declare-fun b_free!21697 () Bool)

(declare-fun b_next!21697 () Bool)

(assert (=> start!94350 (= b_free!21697 (not b_next!21697))))

(declare-fun tp!76534 () Bool)

(declare-fun b_and!34455 () Bool)

(assert (=> start!94350 (= tp!76534 b_and!34455)))

(declare-fun b!1066821 () Bool)

(declare-fun e!608405 () Bool)

(declare-fun tp_is_empty!25507 () Bool)

(assert (=> b!1066821 (= e!608405 tp_is_empty!25507)))

(declare-fun b!1066822 () Bool)

(declare-fun e!608406 () Bool)

(assert (=> b!1066822 (= e!608406 tp_is_empty!25507)))

(declare-fun b!1066823 () Bool)

(declare-fun e!608404 () Bool)

(declare-fun mapRes!39952 () Bool)

(assert (=> b!1066823 (= e!608404 (and e!608406 mapRes!39952))))

(declare-fun condMapEmpty!39952 () Bool)

(declare-datatypes ((V!39145 0))(
  ( (V!39146 (val!12804 Int)) )
))
(declare-datatypes ((ValueCell!12050 0))(
  ( (ValueCellFull!12050 (v!15417 V!39145)) (EmptyCell!12050) )
))
(declare-datatypes ((array!67942 0))(
  ( (array!67943 (arr!32672 (Array (_ BitVec 32) ValueCell!12050)) (size!33210 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67942)

(declare-fun mapDefault!39952 () ValueCell!12050)

(assert (=> b!1066823 (= condMapEmpty!39952 (= (arr!32672 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12050)) mapDefault!39952)))))

(declare-fun mapIsEmpty!39952 () Bool)

(assert (=> mapIsEmpty!39952 mapRes!39952))

(declare-fun mapNonEmpty!39952 () Bool)

(declare-fun tp!76535 () Bool)

(assert (=> mapNonEmpty!39952 (= mapRes!39952 (and tp!76535 e!608405))))

(declare-fun mapRest!39952 () (Array (_ BitVec 32) ValueCell!12050))

(declare-fun mapKey!39952 () (_ BitVec 32))

(declare-fun mapValue!39952 () ValueCell!12050)

(assert (=> mapNonEmpty!39952 (= (arr!32672 _values!955) (store mapRest!39952 mapKey!39952 mapValue!39952))))

(declare-fun b!1066824 () Bool)

(declare-fun e!608402 () Bool)

(assert (=> b!1066824 (= e!608402 (not true))))

(declare-datatypes ((tuple2!16298 0))(
  ( (tuple2!16299 (_1!8160 (_ BitVec 64)) (_2!8160 V!39145)) )
))
(declare-datatypes ((List!22841 0))(
  ( (Nil!22838) (Cons!22837 (h!24046 tuple2!16298) (t!32155 List!22841)) )
))
(declare-datatypes ((ListLongMap!14267 0))(
  ( (ListLongMap!14268 (toList!7149 List!22841)) )
))
(declare-fun lt!471047 () ListLongMap!14267)

(declare-fun lt!471049 () ListLongMap!14267)

(assert (=> b!1066824 (= lt!471047 lt!471049)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39145)

(declare-datatypes ((Unit!34888 0))(
  ( (Unit!34889) )
))
(declare-fun lt!471048 () Unit!34888)

(declare-fun minValue!907 () V!39145)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39145)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67944 0))(
  ( (array!67945 (arr!32673 (Array (_ BitVec 32) (_ BitVec 64))) (size!33211 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67944)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!739 (array!67944 array!67942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39145 V!39145 V!39145 V!39145 (_ BitVec 32) Int) Unit!34888)

(assert (=> b!1066824 (= lt!471048 (lemmaNoChangeToArrayThenSameMapNoExtras!739 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3745 (array!67944 array!67942 (_ BitVec 32) (_ BitVec 32) V!39145 V!39145 (_ BitVec 32) Int) ListLongMap!14267)

(assert (=> b!1066824 (= lt!471049 (getCurrentListMapNoExtraKeys!3745 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066824 (= lt!471047 (getCurrentListMapNoExtraKeys!3745 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066825 () Bool)

(declare-fun res!712004 () Bool)

(assert (=> b!1066825 (=> (not res!712004) (not e!608402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67944 (_ BitVec 32)) Bool)

(assert (=> b!1066825 (= res!712004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066826 () Bool)

(declare-fun res!712005 () Bool)

(assert (=> b!1066826 (=> (not res!712005) (not e!608402))))

(declare-datatypes ((List!22842 0))(
  ( (Nil!22839) (Cons!22838 (h!24047 (_ BitVec 64)) (t!32156 List!22842)) )
))
(declare-fun arrayNoDuplicates!0 (array!67944 (_ BitVec 32) List!22842) Bool)

(assert (=> b!1066826 (= res!712005 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22839))))

(declare-fun b!1066827 () Bool)

(declare-fun res!712007 () Bool)

(assert (=> b!1066827 (=> (not res!712007) (not e!608402))))

(assert (=> b!1066827 (= res!712007 (and (= (size!33210 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33211 _keys!1163) (size!33210 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!712006 () Bool)

(assert (=> start!94350 (=> (not res!712006) (not e!608402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94350 (= res!712006 (validMask!0 mask!1515))))

(assert (=> start!94350 e!608402))

(assert (=> start!94350 true))

(assert (=> start!94350 tp_is_empty!25507))

(declare-fun array_inv!25296 (array!67942) Bool)

(assert (=> start!94350 (and (array_inv!25296 _values!955) e!608404)))

(assert (=> start!94350 tp!76534))

(declare-fun array_inv!25297 (array!67944) Bool)

(assert (=> start!94350 (array_inv!25297 _keys!1163)))

(assert (= (and start!94350 res!712006) b!1066827))

(assert (= (and b!1066827 res!712007) b!1066825))

(assert (= (and b!1066825 res!712004) b!1066826))

(assert (= (and b!1066826 res!712005) b!1066824))

(assert (= (and b!1066823 condMapEmpty!39952) mapIsEmpty!39952))

(assert (= (and b!1066823 (not condMapEmpty!39952)) mapNonEmpty!39952))

(get-info :version)

(assert (= (and mapNonEmpty!39952 ((_ is ValueCellFull!12050) mapValue!39952)) b!1066821))

(assert (= (and b!1066823 ((_ is ValueCellFull!12050) mapDefault!39952)) b!1066822))

(assert (= start!94350 b!1066823))

(declare-fun m!985075 () Bool)

(assert (=> mapNonEmpty!39952 m!985075))

(declare-fun m!985077 () Bool)

(assert (=> b!1066825 m!985077))

(declare-fun m!985079 () Bool)

(assert (=> b!1066824 m!985079))

(declare-fun m!985081 () Bool)

(assert (=> b!1066824 m!985081))

(declare-fun m!985083 () Bool)

(assert (=> b!1066824 m!985083))

(declare-fun m!985085 () Bool)

(assert (=> b!1066826 m!985085))

(declare-fun m!985087 () Bool)

(assert (=> start!94350 m!985087))

(declare-fun m!985089 () Bool)

(assert (=> start!94350 m!985089))

(declare-fun m!985091 () Bool)

(assert (=> start!94350 m!985091))

(check-sat (not b!1066826) (not b!1066824) (not start!94350) (not b_next!21697) (not b!1066825) tp_is_empty!25507 b_and!34455 (not mapNonEmpty!39952))
(check-sat b_and!34455 (not b_next!21697))
