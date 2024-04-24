; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94314 () Bool)

(assert start!94314)

(declare-fun b_free!21493 () Bool)

(declare-fun b_next!21493 () Bool)

(assert (=> start!94314 (= b_free!21493 (not b_next!21493))))

(declare-fun tp!75911 () Bool)

(declare-fun b_and!34245 () Bool)

(assert (=> start!94314 (= tp!75911 b_and!34245)))

(declare-fun b!1065297 () Bool)

(declare-fun e!607172 () Bool)

(declare-fun tp_is_empty!25303 () Bool)

(assert (=> b!1065297 (= e!607172 tp_is_empty!25303)))

(declare-fun mapNonEmpty!39634 () Bool)

(declare-fun mapRes!39634 () Bool)

(declare-fun tp!75910 () Bool)

(declare-fun e!607174 () Bool)

(assert (=> mapNonEmpty!39634 (= mapRes!39634 (and tp!75910 e!607174))))

(declare-datatypes ((V!38873 0))(
  ( (V!38874 (val!12702 Int)) )
))
(declare-datatypes ((ValueCell!11948 0))(
  ( (ValueCellFull!11948 (v!15310 V!38873)) (EmptyCell!11948) )
))
(declare-fun mapRest!39634 () (Array (_ BitVec 32) ValueCell!11948))

(declare-fun mapKey!39634 () (_ BitVec 32))

(declare-datatypes ((array!67651 0))(
  ( (array!67652 (arr!32524 (Array (_ BitVec 32) ValueCell!11948)) (size!33061 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67651)

(declare-fun mapValue!39634 () ValueCell!11948)

(assert (=> mapNonEmpty!39634 (= (arr!32524 _values!955) (store mapRest!39634 mapKey!39634 mapValue!39634))))

(declare-fun mapIsEmpty!39634 () Bool)

(assert (=> mapIsEmpty!39634 mapRes!39634))

(declare-fun res!710857 () Bool)

(declare-fun e!607173 () Bool)

(assert (=> start!94314 (=> (not res!710857) (not e!607173))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94314 (= res!710857 (validMask!0 mask!1515))))

(assert (=> start!94314 e!607173))

(assert (=> start!94314 true))

(assert (=> start!94314 tp_is_empty!25303))

(declare-fun e!607176 () Bool)

(declare-fun array_inv!25208 (array!67651) Bool)

(assert (=> start!94314 (and (array_inv!25208 _values!955) e!607176)))

(assert (=> start!94314 tp!75911))

(declare-datatypes ((array!67653 0))(
  ( (array!67654 (arr!32525 (Array (_ BitVec 32) (_ BitVec 64))) (size!33062 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67653)

(declare-fun array_inv!25209 (array!67653) Bool)

(assert (=> start!94314 (array_inv!25209 _keys!1163)))

(declare-fun b!1065298 () Bool)

(assert (=> b!1065298 (= e!607174 tp_is_empty!25303)))

(declare-fun b!1065299 () Bool)

(declare-fun res!710859 () Bool)

(assert (=> b!1065299 (=> (not res!710859) (not e!607173))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065299 (= res!710859 (and (= (size!33061 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33062 _keys!1163) (size!33061 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065300 () Bool)

(assert (=> b!1065300 (= e!607173 (not true))))

(declare-datatypes ((tuple2!16076 0))(
  ( (tuple2!16077 (_1!8049 (_ BitVec 64)) (_2!8049 V!38873)) )
))
(declare-datatypes ((List!22648 0))(
  ( (Nil!22645) (Cons!22644 (h!23862 tuple2!16076) (t!31955 List!22648)) )
))
(declare-datatypes ((ListLongMap!14053 0))(
  ( (ListLongMap!14054 (toList!7042 List!22648)) )
))
(declare-fun lt!469505 () ListLongMap!14053)

(declare-fun lt!469504 () ListLongMap!14053)

(assert (=> b!1065300 (= lt!469505 lt!469504)))

(declare-fun zeroValueBefore!47 () V!38873)

(declare-fun minValue!907 () V!38873)

(declare-datatypes ((Unit!34887 0))(
  ( (Unit!34888) )
))
(declare-fun lt!469506 () Unit!34887)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38873)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!679 (array!67653 array!67651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38873 V!38873 V!38873 V!38873 (_ BitVec 32) Int) Unit!34887)

(assert (=> b!1065300 (= lt!469506 (lemmaNoChangeToArrayThenSameMapNoExtras!679 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3676 (array!67653 array!67651 (_ BitVec 32) (_ BitVec 32) V!38873 V!38873 (_ BitVec 32) Int) ListLongMap!14053)

(assert (=> b!1065300 (= lt!469504 (getCurrentListMapNoExtraKeys!3676 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065300 (= lt!469505 (getCurrentListMapNoExtraKeys!3676 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065301 () Bool)

(assert (=> b!1065301 (= e!607176 (and e!607172 mapRes!39634))))

(declare-fun condMapEmpty!39634 () Bool)

(declare-fun mapDefault!39634 () ValueCell!11948)

(assert (=> b!1065301 (= condMapEmpty!39634 (= (arr!32524 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11948)) mapDefault!39634)))))

(declare-fun b!1065302 () Bool)

(declare-fun res!710858 () Bool)

(assert (=> b!1065302 (=> (not res!710858) (not e!607173))))

(declare-datatypes ((List!22649 0))(
  ( (Nil!22646) (Cons!22645 (h!23863 (_ BitVec 64)) (t!31956 List!22649)) )
))
(declare-fun arrayNoDuplicates!0 (array!67653 (_ BitVec 32) List!22649) Bool)

(assert (=> b!1065302 (= res!710858 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22646))))

(declare-fun b!1065303 () Bool)

(declare-fun res!710860 () Bool)

(assert (=> b!1065303 (=> (not res!710860) (not e!607173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67653 (_ BitVec 32)) Bool)

(assert (=> b!1065303 (= res!710860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94314 res!710857) b!1065299))

(assert (= (and b!1065299 res!710859) b!1065303))

(assert (= (and b!1065303 res!710860) b!1065302))

(assert (= (and b!1065302 res!710858) b!1065300))

(assert (= (and b!1065301 condMapEmpty!39634) mapIsEmpty!39634))

(assert (= (and b!1065301 (not condMapEmpty!39634)) mapNonEmpty!39634))

(get-info :version)

(assert (= (and mapNonEmpty!39634 ((_ is ValueCellFull!11948) mapValue!39634)) b!1065298))

(assert (= (and b!1065301 ((_ is ValueCellFull!11948) mapDefault!39634)) b!1065297))

(assert (= start!94314 b!1065301))

(declare-fun m!984265 () Bool)

(assert (=> b!1065300 m!984265))

(declare-fun m!984267 () Bool)

(assert (=> b!1065300 m!984267))

(declare-fun m!984269 () Bool)

(assert (=> b!1065300 m!984269))

(declare-fun m!984271 () Bool)

(assert (=> b!1065302 m!984271))

(declare-fun m!984273 () Bool)

(assert (=> start!94314 m!984273))

(declare-fun m!984275 () Bool)

(assert (=> start!94314 m!984275))

(declare-fun m!984277 () Bool)

(assert (=> start!94314 m!984277))

(declare-fun m!984279 () Bool)

(assert (=> mapNonEmpty!39634 m!984279))

(declare-fun m!984281 () Bool)

(assert (=> b!1065303 m!984281))

(check-sat tp_is_empty!25303 (not b!1065300) b_and!34245 (not mapNonEmpty!39634) (not start!94314) (not b!1065302) (not b_next!21493) (not b!1065303))
(check-sat b_and!34245 (not b_next!21493))
