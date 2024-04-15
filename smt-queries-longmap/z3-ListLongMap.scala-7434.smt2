; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94448 () Bool)

(assert start!94448)

(declare-fun b_free!21781 () Bool)

(declare-fun b_next!21781 () Bool)

(assert (=> start!94448 (= b_free!21781 (not b_next!21781))))

(declare-fun tp!76789 () Bool)

(declare-fun b_and!34547 () Bool)

(assert (=> start!94448 (= tp!76789 b_and!34547)))

(declare-fun b!1067891 () Bool)

(declare-fun e!609192 () Bool)

(declare-fun tp_is_empty!25591 () Bool)

(assert (=> b!1067891 (= e!609192 tp_is_empty!25591)))

(declare-fun b!1067892 () Bool)

(declare-fun e!609194 () Bool)

(assert (=> b!1067892 (= e!609194 true)))

(declare-datatypes ((V!39257 0))(
  ( (V!39258 (val!12846 Int)) )
))
(declare-datatypes ((tuple2!16366 0))(
  ( (tuple2!16367 (_1!8194 (_ BitVec 64)) (_2!8194 V!39257)) )
))
(declare-datatypes ((List!22905 0))(
  ( (Nil!22902) (Cons!22901 (h!24110 tuple2!16366) (t!32221 List!22905)) )
))
(declare-datatypes ((ListLongMap!14335 0))(
  ( (ListLongMap!14336 (toList!7183 List!22905)) )
))
(declare-fun lt!471571 () ListLongMap!14335)

(declare-fun -!629 (ListLongMap!14335 (_ BitVec 64)) ListLongMap!14335)

(assert (=> b!1067892 (= (-!629 lt!471571 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471571)))

(declare-datatypes ((Unit!34956 0))(
  ( (Unit!34957) )
))
(declare-fun lt!471572 () Unit!34956)

(declare-fun removeNotPresentStillSame!46 (ListLongMap!14335 (_ BitVec 64)) Unit!34956)

(assert (=> b!1067892 (= lt!471572 (removeNotPresentStillSame!46 lt!471571 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067893 () Bool)

(declare-fun res!712642 () Bool)

(declare-fun e!609195 () Bool)

(assert (=> b!1067893 (=> (not res!712642) (not e!609195))))

(declare-datatypes ((ValueCell!12092 0))(
  ( (ValueCellFull!12092 (v!15459 V!39257)) (EmptyCell!12092) )
))
(declare-datatypes ((array!68108 0))(
  ( (array!68109 (arr!32754 (Array (_ BitVec 32) ValueCell!12092)) (size!33292 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68108)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68110 0))(
  ( (array!68111 (arr!32755 (Array (_ BitVec 32) (_ BitVec 64))) (size!33293 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68110)

(assert (=> b!1067893 (= res!712642 (and (= (size!33292 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33293 _keys!1163) (size!33292 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067895 () Bool)

(declare-fun e!609191 () Bool)

(assert (=> b!1067895 (= e!609191 tp_is_empty!25591)))

(declare-fun b!1067896 () Bool)

(declare-fun res!712645 () Bool)

(assert (=> b!1067896 (=> (not res!712645) (not e!609195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68110 (_ BitVec 32)) Bool)

(assert (=> b!1067896 (= res!712645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40081 () Bool)

(declare-fun mapRes!40081 () Bool)

(assert (=> mapIsEmpty!40081 mapRes!40081))

(declare-fun mapNonEmpty!40081 () Bool)

(declare-fun tp!76790 () Bool)

(assert (=> mapNonEmpty!40081 (= mapRes!40081 (and tp!76790 e!609191))))

(declare-fun mapRest!40081 () (Array (_ BitVec 32) ValueCell!12092))

(declare-fun mapValue!40081 () ValueCell!12092)

(declare-fun mapKey!40081 () (_ BitVec 32))

(assert (=> mapNonEmpty!40081 (= (arr!32754 _values!955) (store mapRest!40081 mapKey!40081 mapValue!40081))))

(declare-fun b!1067897 () Bool)

(declare-fun e!609193 () Bool)

(assert (=> b!1067897 (= e!609193 (and e!609192 mapRes!40081))))

(declare-fun condMapEmpty!40081 () Bool)

(declare-fun mapDefault!40081 () ValueCell!12092)

(assert (=> b!1067897 (= condMapEmpty!40081 (= (arr!32754 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12092)) mapDefault!40081)))))

(declare-fun b!1067898 () Bool)

(declare-fun e!609196 () Bool)

(assert (=> b!1067898 (= e!609196 e!609194)))

(declare-fun res!712647 () Bool)

(assert (=> b!1067898 (=> res!712647 e!609194)))

(declare-fun contains!6257 (ListLongMap!14335 (_ BitVec 64)) Bool)

(assert (=> b!1067898 (= res!712647 (contains!6257 lt!471571 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39257)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39257)

(declare-fun getCurrentListMap!4026 (array!68110 array!68108 (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 (_ BitVec 32) Int) ListLongMap!14335)

(assert (=> b!1067898 (= lt!471571 (getCurrentListMap!4026 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067899 () Bool)

(assert (=> b!1067899 (= e!609195 (not e!609196))))

(declare-fun res!712644 () Bool)

(assert (=> b!1067899 (=> res!712644 e!609196)))

(assert (=> b!1067899 (= res!712644 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471568 () ListLongMap!14335)

(declare-fun lt!471569 () ListLongMap!14335)

(assert (=> b!1067899 (= lt!471568 lt!471569)))

(declare-fun lt!471570 () Unit!34956)

(declare-fun zeroValueAfter!47 () V!39257)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!771 (array!68110 array!68108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 V!39257 V!39257 (_ BitVec 32) Int) Unit!34956)

(assert (=> b!1067899 (= lt!471570 (lemmaNoChangeToArrayThenSameMapNoExtras!771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3777 (array!68110 array!68108 (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 (_ BitVec 32) Int) ListLongMap!14335)

(assert (=> b!1067899 (= lt!471569 (getCurrentListMapNoExtraKeys!3777 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067899 (= lt!471568 (getCurrentListMapNoExtraKeys!3777 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712646 () Bool)

(assert (=> start!94448 (=> (not res!712646) (not e!609195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94448 (= res!712646 (validMask!0 mask!1515))))

(assert (=> start!94448 e!609195))

(assert (=> start!94448 true))

(assert (=> start!94448 tp_is_empty!25591))

(declare-fun array_inv!25356 (array!68108) Bool)

(assert (=> start!94448 (and (array_inv!25356 _values!955) e!609193)))

(assert (=> start!94448 tp!76789))

(declare-fun array_inv!25357 (array!68110) Bool)

(assert (=> start!94448 (array_inv!25357 _keys!1163)))

(declare-fun b!1067894 () Bool)

(declare-fun res!712643 () Bool)

(assert (=> b!1067894 (=> (not res!712643) (not e!609195))))

(declare-datatypes ((List!22906 0))(
  ( (Nil!22903) (Cons!22902 (h!24111 (_ BitVec 64)) (t!32222 List!22906)) )
))
(declare-fun arrayNoDuplicates!0 (array!68110 (_ BitVec 32) List!22906) Bool)

(assert (=> b!1067894 (= res!712643 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22903))))

(assert (= (and start!94448 res!712646) b!1067893))

(assert (= (and b!1067893 res!712642) b!1067896))

(assert (= (and b!1067896 res!712645) b!1067894))

(assert (= (and b!1067894 res!712643) b!1067899))

(assert (= (and b!1067899 (not res!712644)) b!1067898))

(assert (= (and b!1067898 (not res!712647)) b!1067892))

(assert (= (and b!1067897 condMapEmpty!40081) mapIsEmpty!40081))

(assert (= (and b!1067897 (not condMapEmpty!40081)) mapNonEmpty!40081))

(get-info :version)

(assert (= (and mapNonEmpty!40081 ((_ is ValueCellFull!12092) mapValue!40081)) b!1067895))

(assert (= (and b!1067897 ((_ is ValueCellFull!12092) mapDefault!40081)) b!1067891))

(assert (= start!94448 b!1067897))

(declare-fun m!986029 () Bool)

(assert (=> b!1067894 m!986029))

(declare-fun m!986031 () Bool)

(assert (=> b!1067892 m!986031))

(declare-fun m!986033 () Bool)

(assert (=> b!1067892 m!986033))

(declare-fun m!986035 () Bool)

(assert (=> b!1067896 m!986035))

(declare-fun m!986037 () Bool)

(assert (=> start!94448 m!986037))

(declare-fun m!986039 () Bool)

(assert (=> start!94448 m!986039))

(declare-fun m!986041 () Bool)

(assert (=> start!94448 m!986041))

(declare-fun m!986043 () Bool)

(assert (=> b!1067898 m!986043))

(declare-fun m!986045 () Bool)

(assert (=> b!1067898 m!986045))

(declare-fun m!986047 () Bool)

(assert (=> mapNonEmpty!40081 m!986047))

(declare-fun m!986049 () Bool)

(assert (=> b!1067899 m!986049))

(declare-fun m!986051 () Bool)

(assert (=> b!1067899 m!986051))

(declare-fun m!986053 () Bool)

(assert (=> b!1067899 m!986053))

(check-sat (not b!1067899) (not b!1067896) (not b!1067894) (not start!94448) (not b!1067898) (not mapNonEmpty!40081) b_and!34547 (not b!1067892) (not b_next!21781) tp_is_empty!25591)
(check-sat b_and!34547 (not b_next!21781))
