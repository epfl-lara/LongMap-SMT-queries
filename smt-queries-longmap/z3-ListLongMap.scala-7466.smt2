; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94956 () Bool)

(assert start!94956)

(declare-fun b_free!21973 () Bool)

(declare-fun b_next!21973 () Bool)

(assert (=> start!94956 (= b_free!21973 (not b_next!21973))))

(declare-fun tp!77377 () Bool)

(declare-fun b_and!34813 () Bool)

(assert (=> start!94956 (= tp!77377 b_and!34813)))

(declare-fun b!1072267 () Bool)

(declare-fun res!714932 () Bool)

(declare-fun e!612261 () Bool)

(assert (=> b!1072267 (=> (not res!714932) (not e!612261))))

(declare-datatypes ((array!68581 0))(
  ( (array!68582 (arr!32980 (Array (_ BitVec 32) (_ BitVec 64))) (size!33517 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68581)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68581 (_ BitVec 32)) Bool)

(assert (=> b!1072267 (= res!714932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072268 () Bool)

(declare-fun e!612262 () Bool)

(declare-fun tp_is_empty!25783 () Bool)

(assert (=> b!1072268 (= e!612262 tp_is_empty!25783)))

(declare-fun b!1072269 () Bool)

(declare-fun res!714930 () Bool)

(assert (=> b!1072269 (=> (not res!714930) (not e!612261))))

(declare-datatypes ((List!23000 0))(
  ( (Nil!22997) (Cons!22996 (h!24214 (_ BitVec 64)) (t!32325 List!23000)) )
))
(declare-fun arrayNoDuplicates!0 (array!68581 (_ BitVec 32) List!23000) Bool)

(assert (=> b!1072269 (= res!714930 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22997))))

(declare-fun b!1072270 () Bool)

(declare-fun res!714931 () Bool)

(assert (=> b!1072270 (=> (not res!714931) (not e!612261))))

(declare-datatypes ((V!39513 0))(
  ( (V!39514 (val!12942 Int)) )
))
(declare-datatypes ((ValueCell!12188 0))(
  ( (ValueCellFull!12188 (v!15554 V!39513)) (EmptyCell!12188) )
))
(declare-datatypes ((array!68583 0))(
  ( (array!68584 (arr!32981 (Array (_ BitVec 32) ValueCell!12188)) (size!33518 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68583)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072270 (= res!714931 (and (= (size!33518 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33517 _keys!1163) (size!33518 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16436 0))(
  ( (tuple2!16437 (_1!8229 (_ BitVec 64)) (_2!8229 V!39513)) )
))
(declare-fun lt!473902 () tuple2!16436)

(declare-datatypes ((List!23001 0))(
  ( (Nil!22998) (Cons!22997 (h!24215 tuple2!16436) (t!32326 List!23001)) )
))
(declare-datatypes ((ListLongMap!14413 0))(
  ( (ListLongMap!14414 (toList!7222 List!23001)) )
))
(declare-fun lt!473907 () ListLongMap!14413)

(declare-fun e!612263 () Bool)

(declare-fun lt!473903 () ListLongMap!14413)

(declare-fun b!1072271 () Bool)

(declare-fun +!3186 (ListLongMap!14413 tuple2!16436) ListLongMap!14413)

(assert (=> b!1072271 (= e!612263 (= lt!473907 (+!3186 lt!473903 lt!473902)))))

(declare-fun mapNonEmpty!40381 () Bool)

(declare-fun mapRes!40381 () Bool)

(declare-fun tp!77378 () Bool)

(assert (=> mapNonEmpty!40381 (= mapRes!40381 (and tp!77378 e!612262))))

(declare-fun mapRest!40381 () (Array (_ BitVec 32) ValueCell!12188))

(declare-fun mapKey!40381 () (_ BitVec 32))

(declare-fun mapValue!40381 () ValueCell!12188)

(assert (=> mapNonEmpty!40381 (= (arr!32981 _values!955) (store mapRest!40381 mapKey!40381 mapValue!40381))))

(declare-fun res!714929 () Bool)

(assert (=> start!94956 (=> (not res!714929) (not e!612261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94956 (= res!714929 (validMask!0 mask!1515))))

(assert (=> start!94956 e!612261))

(assert (=> start!94956 true))

(assert (=> start!94956 tp_is_empty!25783))

(declare-fun e!612264 () Bool)

(declare-fun array_inv!25536 (array!68583) Bool)

(assert (=> start!94956 (and (array_inv!25536 _values!955) e!612264)))

(assert (=> start!94956 tp!77377))

(declare-fun array_inv!25537 (array!68581) Bool)

(assert (=> start!94956 (array_inv!25537 _keys!1163)))

(declare-fun mapIsEmpty!40381 () Bool)

(assert (=> mapIsEmpty!40381 mapRes!40381))

(declare-fun b!1072272 () Bool)

(declare-fun e!612266 () Bool)

(assert (=> b!1072272 (= e!612266 tp_is_empty!25783)))

(declare-fun b!1072273 () Bool)

(assert (=> b!1072273 (= e!612264 (and e!612266 mapRes!40381))))

(declare-fun condMapEmpty!40381 () Bool)

(declare-fun mapDefault!40381 () ValueCell!12188)

(assert (=> b!1072273 (= condMapEmpty!40381 (= (arr!32981 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12188)) mapDefault!40381)))))

(declare-fun b!1072274 () Bool)

(declare-fun e!612260 () Bool)

(assert (=> b!1072274 (= e!612261 (not e!612260))))

(declare-fun res!714933 () Bool)

(assert (=> b!1072274 (=> res!714933 e!612260)))

(assert (=> b!1072274 (= res!714933 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473905 () ListLongMap!14413)

(assert (=> b!1072274 (= lt!473905 lt!473903)))

(declare-fun zeroValueBefore!47 () V!39513)

(declare-datatypes ((Unit!35231 0))(
  ( (Unit!35232) )
))
(declare-fun lt!473906 () Unit!35231)

(declare-fun minValue!907 () V!39513)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39513)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!833 (array!68581 array!68583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 V!39513 V!39513 (_ BitVec 32) Int) Unit!35231)

(assert (=> b!1072274 (= lt!473906 (lemmaNoChangeToArrayThenSameMapNoExtras!833 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3830 (array!68581 array!68583 (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 (_ BitVec 32) Int) ListLongMap!14413)

(assert (=> b!1072274 (= lt!473903 (getCurrentListMapNoExtraKeys!3830 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072274 (= lt!473905 (getCurrentListMapNoExtraKeys!3830 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072275 () Bool)

(assert (=> b!1072275 (= e!612260 true)))

(declare-fun lt!473904 () ListLongMap!14413)

(declare-fun lt!473901 () tuple2!16436)

(declare-fun -!660 (ListLongMap!14413 (_ BitVec 64)) ListLongMap!14413)

(assert (=> b!1072275 (= (-!660 (+!3186 lt!473904 lt!473901) #b0000000000000000000000000000000000000000000000000000000000000000) lt!473904)))

(declare-fun lt!473908 () Unit!35231)

(declare-fun addThenRemoveForNewKeyIsSame!35 (ListLongMap!14413 (_ BitVec 64) V!39513) Unit!35231)

(assert (=> b!1072275 (= lt!473908 (addThenRemoveForNewKeyIsSame!35 lt!473904 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072275 (= lt!473904 (+!3186 lt!473905 lt!473902))))

(assert (=> b!1072275 e!612263))

(declare-fun res!714934 () Bool)

(assert (=> b!1072275 (=> (not res!714934) (not e!612263))))

(declare-fun lt!473900 () ListLongMap!14413)

(assert (=> b!1072275 (= res!714934 (= lt!473900 (+!3186 (+!3186 lt!473905 lt!473901) lt!473902)))))

(assert (=> b!1072275 (= lt!473902 (tuple2!16437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072275 (= lt!473901 (tuple2!16437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4121 (array!68581 array!68583 (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 (_ BitVec 32) Int) ListLongMap!14413)

(assert (=> b!1072275 (= lt!473907 (getCurrentListMap!4121 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072275 (= lt!473900 (getCurrentListMap!4121 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94956 res!714929) b!1072270))

(assert (= (and b!1072270 res!714931) b!1072267))

(assert (= (and b!1072267 res!714932) b!1072269))

(assert (= (and b!1072269 res!714930) b!1072274))

(assert (= (and b!1072274 (not res!714933)) b!1072275))

(assert (= (and b!1072275 res!714934) b!1072271))

(assert (= (and b!1072273 condMapEmpty!40381) mapIsEmpty!40381))

(assert (= (and b!1072273 (not condMapEmpty!40381)) mapNonEmpty!40381))

(get-info :version)

(assert (= (and mapNonEmpty!40381 ((_ is ValueCellFull!12188) mapValue!40381)) b!1072268))

(assert (= (and b!1072273 ((_ is ValueCellFull!12188) mapDefault!40381)) b!1072272))

(assert (= start!94956 b!1072273))

(declare-fun m!990893 () Bool)

(assert (=> b!1072271 m!990893))

(declare-fun m!990895 () Bool)

(assert (=> b!1072269 m!990895))

(declare-fun m!990897 () Bool)

(assert (=> start!94956 m!990897))

(declare-fun m!990899 () Bool)

(assert (=> start!94956 m!990899))

(declare-fun m!990901 () Bool)

(assert (=> start!94956 m!990901))

(declare-fun m!990903 () Bool)

(assert (=> b!1072274 m!990903))

(declare-fun m!990905 () Bool)

(assert (=> b!1072274 m!990905))

(declare-fun m!990907 () Bool)

(assert (=> b!1072274 m!990907))

(declare-fun m!990909 () Bool)

(assert (=> mapNonEmpty!40381 m!990909))

(declare-fun m!990911 () Bool)

(assert (=> b!1072275 m!990911))

(declare-fun m!990913 () Bool)

(assert (=> b!1072275 m!990913))

(declare-fun m!990915 () Bool)

(assert (=> b!1072275 m!990915))

(assert (=> b!1072275 m!990911))

(declare-fun m!990917 () Bool)

(assert (=> b!1072275 m!990917))

(declare-fun m!990919 () Bool)

(assert (=> b!1072275 m!990919))

(declare-fun m!990921 () Bool)

(assert (=> b!1072275 m!990921))

(declare-fun m!990923 () Bool)

(assert (=> b!1072275 m!990923))

(assert (=> b!1072275 m!990917))

(declare-fun m!990925 () Bool)

(assert (=> b!1072275 m!990925))

(declare-fun m!990927 () Bool)

(assert (=> b!1072267 m!990927))

(check-sat (not b!1072267) (not b!1072269) (not b!1072274) (not mapNonEmpty!40381) (not b!1072275) (not b!1072271) b_and!34813 tp_is_empty!25783 (not start!94956) (not b_next!21973))
(check-sat b_and!34813 (not b_next!21973))
