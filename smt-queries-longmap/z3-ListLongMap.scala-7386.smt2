; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94072 () Bool)

(assert start!94072)

(declare-fun b_free!21493 () Bool)

(declare-fun b_next!21493 () Bool)

(assert (=> start!94072 (= b_free!21493 (not b_next!21493))))

(declare-fun tp!75910 () Bool)

(declare-fun b_and!34209 () Bool)

(assert (=> start!94072 (= tp!75910 b_and!34209)))

(declare-fun b!1063817 () Bool)

(declare-fun e!606228 () Bool)

(declare-fun tp_is_empty!25303 () Bool)

(assert (=> b!1063817 (= e!606228 tp_is_empty!25303)))

(declare-fun b!1063818 () Bool)

(declare-fun e!606227 () Bool)

(assert (=> b!1063818 (= e!606227 tp_is_empty!25303)))

(declare-fun res!710266 () Bool)

(declare-fun e!606226 () Bool)

(assert (=> start!94072 (=> (not res!710266) (not e!606226))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94072 (= res!710266 (validMask!0 mask!1515))))

(assert (=> start!94072 e!606226))

(assert (=> start!94072 true))

(assert (=> start!94072 tp_is_empty!25303))

(declare-datatypes ((V!38873 0))(
  ( (V!38874 (val!12702 Int)) )
))
(declare-datatypes ((ValueCell!11948 0))(
  ( (ValueCellFull!11948 (v!15313 V!38873)) (EmptyCell!11948) )
))
(declare-datatypes ((array!67544 0))(
  ( (array!67545 (arr!32477 (Array (_ BitVec 32) ValueCell!11948)) (size!33015 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67544)

(declare-fun e!606224 () Bool)

(declare-fun array_inv!25160 (array!67544) Bool)

(assert (=> start!94072 (and (array_inv!25160 _values!955) e!606224)))

(assert (=> start!94072 tp!75910))

(declare-datatypes ((array!67546 0))(
  ( (array!67547 (arr!32478 (Array (_ BitVec 32) (_ BitVec 64))) (size!33016 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67546)

(declare-fun array_inv!25161 (array!67546) Bool)

(assert (=> start!94072 (array_inv!25161 _keys!1163)))

(declare-fun b!1063819 () Bool)

(declare-fun res!710268 () Bool)

(assert (=> b!1063819 (=> (not res!710268) (not e!606226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67546 (_ BitVec 32)) Bool)

(assert (=> b!1063819 (= res!710268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063820 () Bool)

(declare-fun res!710269 () Bool)

(assert (=> b!1063820 (=> (not res!710269) (not e!606226))))

(declare-datatypes ((List!22693 0))(
  ( (Nil!22690) (Cons!22689 (h!23898 (_ BitVec 64)) (t!31999 List!22693)) )
))
(declare-fun arrayNoDuplicates!0 (array!67546 (_ BitVec 32) List!22693) Bool)

(assert (=> b!1063820 (= res!710269 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22690))))

(declare-fun mapNonEmpty!39634 () Bool)

(declare-fun mapRes!39634 () Bool)

(declare-fun tp!75911 () Bool)

(assert (=> mapNonEmpty!39634 (= mapRes!39634 (and tp!75911 e!606228))))

(declare-fun mapKey!39634 () (_ BitVec 32))

(declare-fun mapValue!39634 () ValueCell!11948)

(declare-fun mapRest!39634 () (Array (_ BitVec 32) ValueCell!11948))

(assert (=> mapNonEmpty!39634 (= (arr!32477 _values!955) (store mapRest!39634 mapKey!39634 mapValue!39634))))

(declare-fun b!1063821 () Bool)

(assert (=> b!1063821 (= e!606224 (and e!606227 mapRes!39634))))

(declare-fun condMapEmpty!39634 () Bool)

(declare-fun mapDefault!39634 () ValueCell!11948)

(assert (=> b!1063821 (= condMapEmpty!39634 (= (arr!32477 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11948)) mapDefault!39634)))))

(declare-fun b!1063822 () Bool)

(assert (=> b!1063822 (= e!606226 (not true))))

(declare-datatypes ((tuple2!16144 0))(
  ( (tuple2!16145 (_1!8083 (_ BitVec 64)) (_2!8083 V!38873)) )
))
(declare-datatypes ((List!22694 0))(
  ( (Nil!22691) (Cons!22690 (h!23899 tuple2!16144) (t!32000 List!22694)) )
))
(declare-datatypes ((ListLongMap!14113 0))(
  ( (ListLongMap!14114 (toList!7072 List!22694)) )
))
(declare-fun lt!468790 () ListLongMap!14113)

(declare-fun lt!468791 () ListLongMap!14113)

(assert (=> b!1063822 (= lt!468790 lt!468791)))

(declare-fun zeroValueBefore!47 () V!38873)

(declare-fun minValue!907 () V!38873)

(declare-datatypes ((Unit!34735 0))(
  ( (Unit!34736) )
))
(declare-fun lt!468789 () Unit!34735)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38873)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!672 (array!67546 array!67544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38873 V!38873 V!38873 V!38873 (_ BitVec 32) Int) Unit!34735)

(assert (=> b!1063822 (= lt!468789 (lemmaNoChangeToArrayThenSameMapNoExtras!672 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3678 (array!67546 array!67544 (_ BitVec 32) (_ BitVec 32) V!38873 V!38873 (_ BitVec 32) Int) ListLongMap!14113)

(assert (=> b!1063822 (= lt!468791 (getCurrentListMapNoExtraKeys!3678 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063822 (= lt!468790 (getCurrentListMapNoExtraKeys!3678 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063823 () Bool)

(declare-fun res!710267 () Bool)

(assert (=> b!1063823 (=> (not res!710267) (not e!606226))))

(assert (=> b!1063823 (= res!710267 (and (= (size!33015 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33016 _keys!1163) (size!33015 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39634 () Bool)

(assert (=> mapIsEmpty!39634 mapRes!39634))

(assert (= (and start!94072 res!710266) b!1063823))

(assert (= (and b!1063823 res!710267) b!1063819))

(assert (= (and b!1063819 res!710268) b!1063820))

(assert (= (and b!1063820 res!710269) b!1063822))

(assert (= (and b!1063821 condMapEmpty!39634) mapIsEmpty!39634))

(assert (= (and b!1063821 (not condMapEmpty!39634)) mapNonEmpty!39634))

(get-info :version)

(assert (= (and mapNonEmpty!39634 ((_ is ValueCellFull!11948) mapValue!39634)) b!1063817))

(assert (= (and b!1063821 ((_ is ValueCellFull!11948) mapDefault!39634)) b!1063818))

(assert (= start!94072 b!1063821))

(declare-fun m!981967 () Bool)

(assert (=> b!1063819 m!981967))

(declare-fun m!981969 () Bool)

(assert (=> mapNonEmpty!39634 m!981969))

(declare-fun m!981971 () Bool)

(assert (=> b!1063820 m!981971))

(declare-fun m!981973 () Bool)

(assert (=> start!94072 m!981973))

(declare-fun m!981975 () Bool)

(assert (=> start!94072 m!981975))

(declare-fun m!981977 () Bool)

(assert (=> start!94072 m!981977))

(declare-fun m!981979 () Bool)

(assert (=> b!1063822 m!981979))

(declare-fun m!981981 () Bool)

(assert (=> b!1063822 m!981981))

(declare-fun m!981983 () Bool)

(assert (=> b!1063822 m!981983))

(check-sat (not mapNonEmpty!39634) (not start!94072) tp_is_empty!25303 (not b_next!21493) b_and!34209 (not b!1063819) (not b!1063820) (not b!1063822))
(check-sat b_and!34209 (not b_next!21493))
