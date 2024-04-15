; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95092 () Bool)

(assert start!95092)

(declare-fun b_free!22195 () Bool)

(declare-fun b_next!22195 () Bool)

(assert (=> start!95092 (= b_free!22195 (not b_next!22195))))

(declare-fun tp!78067 () Bool)

(declare-fun b_and!35089 () Bool)

(assert (=> start!95092 (= tp!78067 b_and!35089)))

(declare-fun b!1074886 () Bool)

(declare-fun res!716665 () Bool)

(declare-fun e!614257 () Bool)

(assert (=> b!1074886 (=> (not res!716665) (not e!614257))))

(declare-datatypes ((array!68910 0))(
  ( (array!68911 (arr!33143 (Array (_ BitVec 32) (_ BitVec 64))) (size!33681 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68910)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68910 (_ BitVec 32)) Bool)

(assert (=> b!1074886 (= res!716665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074887 () Bool)

(declare-fun e!614260 () Bool)

(declare-fun e!614259 () Bool)

(declare-fun mapRes!40738 () Bool)

(assert (=> b!1074887 (= e!614260 (and e!614259 mapRes!40738))))

(declare-fun condMapEmpty!40738 () Bool)

(declare-datatypes ((V!39809 0))(
  ( (V!39810 (val!13053 Int)) )
))
(declare-datatypes ((ValueCell!12299 0))(
  ( (ValueCellFull!12299 (v!15675 V!39809)) (EmptyCell!12299) )
))
(declare-datatypes ((array!68912 0))(
  ( (array!68913 (arr!33144 (Array (_ BitVec 32) ValueCell!12299)) (size!33682 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68912)

(declare-fun mapDefault!40738 () ValueCell!12299)

(assert (=> b!1074887 (= condMapEmpty!40738 (= (arr!33144 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12299)) mapDefault!40738)))))

(declare-fun b!1074888 () Bool)

(declare-fun res!716668 () Bool)

(assert (=> b!1074888 (=> (not res!716668) (not e!614257))))

(declare-datatypes ((List!23214 0))(
  ( (Nil!23211) (Cons!23210 (h!24419 (_ BitVec 64)) (t!32554 List!23214)) )
))
(declare-fun arrayNoDuplicates!0 (array!68910 (_ BitVec 32) List!23214) Bool)

(assert (=> b!1074888 (= res!716668 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23211))))

(declare-fun b!1074889 () Bool)

(declare-fun tp_is_empty!26005 () Bool)

(assert (=> b!1074889 (= e!614259 tp_is_empty!26005)))

(declare-fun res!716666 () Bool)

(assert (=> start!95092 (=> (not res!716666) (not e!614257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95092 (= res!716666 (validMask!0 mask!1515))))

(assert (=> start!95092 e!614257))

(assert (=> start!95092 true))

(assert (=> start!95092 tp_is_empty!26005))

(declare-fun array_inv!25642 (array!68912) Bool)

(assert (=> start!95092 (and (array_inv!25642 _values!955) e!614260)))

(assert (=> start!95092 tp!78067))

(declare-fun array_inv!25643 (array!68910) Bool)

(assert (=> start!95092 (array_inv!25643 _keys!1163)))

(declare-fun b!1074890 () Bool)

(declare-fun res!716667 () Bool)

(assert (=> b!1074890 (=> (not res!716667) (not e!614257))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074890 (= res!716667 (and (= (size!33682 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33681 _keys!1163) (size!33682 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074891 () Bool)

(declare-fun e!614262 () Bool)

(assert (=> b!1074891 (= e!614262 true)))

(declare-datatypes ((tuple2!16692 0))(
  ( (tuple2!16693 (_1!8357 (_ BitVec 64)) (_2!8357 V!39809)) )
))
(declare-datatypes ((List!23215 0))(
  ( (Nil!23212) (Cons!23211 (h!24420 tuple2!16692) (t!32555 List!23215)) )
))
(declare-datatypes ((ListLongMap!14661 0))(
  ( (ListLongMap!14662 (toList!7346 List!23215)) )
))
(declare-fun lt!476894 () ListLongMap!14661)

(declare-fun lt!476896 () ListLongMap!14661)

(declare-fun -!694 (ListLongMap!14661 (_ BitVec 64)) ListLongMap!14661)

(assert (=> b!1074891 (= lt!476894 (-!694 lt!476896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!476901 () ListLongMap!14661)

(declare-fun lt!476899 () ListLongMap!14661)

(assert (=> b!1074891 (= (-!694 lt!476901 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476899)))

(declare-datatypes ((Unit!35237 0))(
  ( (Unit!35238) )
))
(declare-fun lt!476895 () Unit!35237)

(declare-fun zeroValueBefore!47 () V!39809)

(declare-fun addThenRemoveForNewKeyIsSame!74 (ListLongMap!14661 (_ BitVec 64) V!39809) Unit!35237)

(assert (=> b!1074891 (= lt!476895 (addThenRemoveForNewKeyIsSame!74 lt!476899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!476900 () ListLongMap!14661)

(declare-fun lt!476897 () ListLongMap!14661)

(assert (=> b!1074891 (and (= lt!476896 lt!476901) (= lt!476900 lt!476897))))

(declare-fun +!3249 (ListLongMap!14661 tuple2!16692) ListLongMap!14661)

(assert (=> b!1074891 (= lt!476901 (+!3249 lt!476899 (tuple2!16693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39809)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39809)

(declare-fun getCurrentListMap!4116 (array!68910 array!68912 (_ BitVec 32) (_ BitVec 32) V!39809 V!39809 (_ BitVec 32) Int) ListLongMap!14661)

(assert (=> b!1074891 (= lt!476900 (getCurrentListMap!4116 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074891 (= lt!476896 (getCurrentListMap!4116 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074892 () Bool)

(assert (=> b!1074892 (= e!614257 (not e!614262))))

(declare-fun res!716664 () Bool)

(assert (=> b!1074892 (=> res!716664 e!614262)))

(assert (=> b!1074892 (= res!716664 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074892 (= lt!476899 lt!476897)))

(declare-fun lt!476898 () Unit!35237)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!897 (array!68910 array!68912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39809 V!39809 V!39809 V!39809 (_ BitVec 32) Int) Unit!35237)

(assert (=> b!1074892 (= lt!476898 (lemmaNoChangeToArrayThenSameMapNoExtras!897 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3925 (array!68910 array!68912 (_ BitVec 32) (_ BitVec 32) V!39809 V!39809 (_ BitVec 32) Int) ListLongMap!14661)

(assert (=> b!1074892 (= lt!476897 (getCurrentListMapNoExtraKeys!3925 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074892 (= lt!476899 (getCurrentListMapNoExtraKeys!3925 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40738 () Bool)

(declare-fun tp!78068 () Bool)

(declare-fun e!614261 () Bool)

(assert (=> mapNonEmpty!40738 (= mapRes!40738 (and tp!78068 e!614261))))

(declare-fun mapValue!40738 () ValueCell!12299)

(declare-fun mapRest!40738 () (Array (_ BitVec 32) ValueCell!12299))

(declare-fun mapKey!40738 () (_ BitVec 32))

(assert (=> mapNonEmpty!40738 (= (arr!33144 _values!955) (store mapRest!40738 mapKey!40738 mapValue!40738))))

(declare-fun mapIsEmpty!40738 () Bool)

(assert (=> mapIsEmpty!40738 mapRes!40738))

(declare-fun b!1074893 () Bool)

(assert (=> b!1074893 (= e!614261 tp_is_empty!26005)))

(assert (= (and start!95092 res!716666) b!1074890))

(assert (= (and b!1074890 res!716667) b!1074886))

(assert (= (and b!1074886 res!716665) b!1074888))

(assert (= (and b!1074888 res!716668) b!1074892))

(assert (= (and b!1074892 (not res!716664)) b!1074891))

(assert (= (and b!1074887 condMapEmpty!40738) mapIsEmpty!40738))

(assert (= (and b!1074887 (not condMapEmpty!40738)) mapNonEmpty!40738))

(get-info :version)

(assert (= (and mapNonEmpty!40738 ((_ is ValueCellFull!12299) mapValue!40738)) b!1074893))

(assert (= (and b!1074887 ((_ is ValueCellFull!12299) mapDefault!40738)) b!1074889))

(assert (= start!95092 b!1074887))

(declare-fun m!993269 () Bool)

(assert (=> b!1074888 m!993269))

(declare-fun m!993271 () Bool)

(assert (=> b!1074891 m!993271))

(declare-fun m!993273 () Bool)

(assert (=> b!1074891 m!993273))

(declare-fun m!993275 () Bool)

(assert (=> b!1074891 m!993275))

(declare-fun m!993277 () Bool)

(assert (=> b!1074891 m!993277))

(declare-fun m!993279 () Bool)

(assert (=> b!1074891 m!993279))

(declare-fun m!993281 () Bool)

(assert (=> b!1074891 m!993281))

(declare-fun m!993283 () Bool)

(assert (=> mapNonEmpty!40738 m!993283))

(declare-fun m!993285 () Bool)

(assert (=> b!1074886 m!993285))

(declare-fun m!993287 () Bool)

(assert (=> start!95092 m!993287))

(declare-fun m!993289 () Bool)

(assert (=> start!95092 m!993289))

(declare-fun m!993291 () Bool)

(assert (=> start!95092 m!993291))

(declare-fun m!993293 () Bool)

(assert (=> b!1074892 m!993293))

(declare-fun m!993295 () Bool)

(assert (=> b!1074892 m!993295))

(declare-fun m!993297 () Bool)

(assert (=> b!1074892 m!993297))

(check-sat tp_is_empty!26005 (not b_next!22195) (not b!1074892) (not start!95092) b_and!35089 (not mapNonEmpty!40738) (not b!1074891) (not b!1074888) (not b!1074886))
(check-sat b_and!35089 (not b_next!22195))
