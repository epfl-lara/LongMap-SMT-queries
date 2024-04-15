; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94084 () Bool)

(assert start!94084)

(declare-fun b_free!21505 () Bool)

(declare-fun b_next!21505 () Bool)

(assert (=> start!94084 (= b_free!21505 (not b_next!21505))))

(declare-fun tp!75946 () Bool)

(declare-fun b_and!34221 () Bool)

(assert (=> start!94084 (= tp!75946 b_and!34221)))

(declare-fun mapIsEmpty!39652 () Bool)

(declare-fun mapRes!39652 () Bool)

(assert (=> mapIsEmpty!39652 mapRes!39652))

(declare-fun res!710340 () Bool)

(declare-fun e!606316 () Bool)

(assert (=> start!94084 (=> (not res!710340) (not e!606316))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94084 (= res!710340 (validMask!0 mask!1515))))

(assert (=> start!94084 e!606316))

(assert (=> start!94084 true))

(declare-fun tp_is_empty!25315 () Bool)

(assert (=> start!94084 tp_is_empty!25315))

(declare-datatypes ((V!38889 0))(
  ( (V!38890 (val!12708 Int)) )
))
(declare-datatypes ((ValueCell!11954 0))(
  ( (ValueCellFull!11954 (v!15319 V!38889)) (EmptyCell!11954) )
))
(declare-datatypes ((array!67566 0))(
  ( (array!67567 (arr!32488 (Array (_ BitVec 32) ValueCell!11954)) (size!33026 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67566)

(declare-fun e!606317 () Bool)

(declare-fun array_inv!25164 (array!67566) Bool)

(assert (=> start!94084 (and (array_inv!25164 _values!955) e!606317)))

(assert (=> start!94084 tp!75946))

(declare-datatypes ((array!67568 0))(
  ( (array!67569 (arr!32489 (Array (_ BitVec 32) (_ BitVec 64))) (size!33027 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67568)

(declare-fun array_inv!25165 (array!67568) Bool)

(assert (=> start!94084 (array_inv!25165 _keys!1163)))

(declare-fun b!1063943 () Bool)

(declare-fun res!710339 () Bool)

(assert (=> b!1063943 (=> (not res!710339) (not e!606316))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063943 (= res!710339 (and (= (size!33026 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33027 _keys!1163) (size!33026 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063944 () Bool)

(declare-fun e!606315 () Bool)

(assert (=> b!1063944 (= e!606315 tp_is_empty!25315)))

(declare-fun b!1063945 () Bool)

(declare-fun e!606318 () Bool)

(assert (=> b!1063945 (= e!606317 (and e!606318 mapRes!39652))))

(declare-fun condMapEmpty!39652 () Bool)

(declare-fun mapDefault!39652 () ValueCell!11954)

(assert (=> b!1063945 (= condMapEmpty!39652 (= (arr!32488 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11954)) mapDefault!39652)))))

(declare-fun mapNonEmpty!39652 () Bool)

(declare-fun tp!75947 () Bool)

(assert (=> mapNonEmpty!39652 (= mapRes!39652 (and tp!75947 e!606315))))

(declare-fun mapKey!39652 () (_ BitVec 32))

(declare-fun mapRest!39652 () (Array (_ BitVec 32) ValueCell!11954))

(declare-fun mapValue!39652 () ValueCell!11954)

(assert (=> mapNonEmpty!39652 (= (arr!32488 _values!955) (store mapRest!39652 mapKey!39652 mapValue!39652))))

(declare-fun b!1063946 () Bool)

(declare-fun res!710338 () Bool)

(assert (=> b!1063946 (=> (not res!710338) (not e!606316))))

(declare-datatypes ((List!22700 0))(
  ( (Nil!22697) (Cons!22696 (h!23905 (_ BitVec 64)) (t!32006 List!22700)) )
))
(declare-fun arrayNoDuplicates!0 (array!67568 (_ BitVec 32) List!22700) Bool)

(assert (=> b!1063946 (= res!710338 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22697))))

(declare-fun b!1063947 () Bool)

(assert (=> b!1063947 (= e!606316 (not true))))

(declare-datatypes ((tuple2!16150 0))(
  ( (tuple2!16151 (_1!8086 (_ BitVec 64)) (_2!8086 V!38889)) )
))
(declare-datatypes ((List!22701 0))(
  ( (Nil!22698) (Cons!22697 (h!23906 tuple2!16150) (t!32007 List!22701)) )
))
(declare-datatypes ((ListLongMap!14119 0))(
  ( (ListLongMap!14120 (toList!7075 List!22701)) )
))
(declare-fun lt!468843 () ListLongMap!14119)

(declare-fun lt!468845 () ListLongMap!14119)

(assert (=> b!1063947 (= lt!468843 lt!468845)))

(declare-fun zeroValueBefore!47 () V!38889)

(declare-fun minValue!907 () V!38889)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38889)

(declare-datatypes ((Unit!34741 0))(
  ( (Unit!34742) )
))
(declare-fun lt!468844 () Unit!34741)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!675 (array!67568 array!67566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38889 V!38889 V!38889 V!38889 (_ BitVec 32) Int) Unit!34741)

(assert (=> b!1063947 (= lt!468844 (lemmaNoChangeToArrayThenSameMapNoExtras!675 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3681 (array!67568 array!67566 (_ BitVec 32) (_ BitVec 32) V!38889 V!38889 (_ BitVec 32) Int) ListLongMap!14119)

(assert (=> b!1063947 (= lt!468845 (getCurrentListMapNoExtraKeys!3681 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063947 (= lt!468843 (getCurrentListMapNoExtraKeys!3681 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063948 () Bool)

(assert (=> b!1063948 (= e!606318 tp_is_empty!25315)))

(declare-fun b!1063949 () Bool)

(declare-fun res!710341 () Bool)

(assert (=> b!1063949 (=> (not res!710341) (not e!606316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67568 (_ BitVec 32)) Bool)

(assert (=> b!1063949 (= res!710341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94084 res!710340) b!1063943))

(assert (= (and b!1063943 res!710339) b!1063949))

(assert (= (and b!1063949 res!710341) b!1063946))

(assert (= (and b!1063946 res!710338) b!1063947))

(assert (= (and b!1063945 condMapEmpty!39652) mapIsEmpty!39652))

(assert (= (and b!1063945 (not condMapEmpty!39652)) mapNonEmpty!39652))

(get-info :version)

(assert (= (and mapNonEmpty!39652 ((_ is ValueCellFull!11954) mapValue!39652)) b!1063944))

(assert (= (and b!1063945 ((_ is ValueCellFull!11954) mapDefault!39652)) b!1063948))

(assert (= start!94084 b!1063945))

(declare-fun m!982075 () Bool)

(assert (=> mapNonEmpty!39652 m!982075))

(declare-fun m!982077 () Bool)

(assert (=> b!1063947 m!982077))

(declare-fun m!982079 () Bool)

(assert (=> b!1063947 m!982079))

(declare-fun m!982081 () Bool)

(assert (=> b!1063947 m!982081))

(declare-fun m!982083 () Bool)

(assert (=> b!1063949 m!982083))

(declare-fun m!982085 () Bool)

(assert (=> b!1063946 m!982085))

(declare-fun m!982087 () Bool)

(assert (=> start!94084 m!982087))

(declare-fun m!982089 () Bool)

(assert (=> start!94084 m!982089))

(declare-fun m!982091 () Bool)

(assert (=> start!94084 m!982091))

(check-sat (not b_next!21505) (not b!1063949) tp_is_empty!25315 (not mapNonEmpty!39652) (not b!1063947) b_and!34221 (not b!1063946) (not start!94084))
(check-sat b_and!34221 (not b_next!21505))
