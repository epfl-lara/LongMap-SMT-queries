; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94444 () Bool)

(assert start!94444)

(declare-fun b_free!21771 () Bool)

(declare-fun b_next!21771 () Bool)

(assert (=> start!94444 (= b_free!21771 (not b_next!21771))))

(declare-fun tp!76759 () Bool)

(declare-fun b_and!34563 () Bool)

(assert (=> start!94444 (= tp!76759 b_and!34563)))

(declare-fun b!1067909 () Bool)

(declare-fun e!609179 () Bool)

(declare-fun e!609183 () Bool)

(assert (=> b!1067909 (= e!609179 (not e!609183))))

(declare-fun res!712623 () Bool)

(assert (=> b!1067909 (=> res!712623 e!609183)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067909 (= res!712623 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39243 0))(
  ( (V!39244 (val!12841 Int)) )
))
(declare-datatypes ((tuple2!16302 0))(
  ( (tuple2!16303 (_1!8162 (_ BitVec 64)) (_2!8162 V!39243)) )
))
(declare-datatypes ((List!22857 0))(
  ( (Nil!22854) (Cons!22853 (h!24062 tuple2!16302) (t!32182 List!22857)) )
))
(declare-datatypes ((ListLongMap!14271 0))(
  ( (ListLongMap!14272 (toList!7151 List!22857)) )
))
(declare-fun lt!471694 () ListLongMap!14271)

(declare-fun lt!471695 () ListLongMap!14271)

(assert (=> b!1067909 (= lt!471694 lt!471695)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39243)

(declare-datatypes ((Unit!35099 0))(
  ( (Unit!35100) )
))
(declare-fun lt!471696 () Unit!35099)

(declare-datatypes ((ValueCell!12087 0))(
  ( (ValueCellFull!12087 (v!15455 V!39243)) (EmptyCell!12087) )
))
(declare-datatypes ((array!68145 0))(
  ( (array!68146 (arr!32772 (Array (_ BitVec 32) ValueCell!12087)) (size!33308 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68145)

(declare-fun minValue!907 () V!39243)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39243)

(declare-datatypes ((array!68147 0))(
  ( (array!68148 (arr!32773 (Array (_ BitVec 32) (_ BitVec 64))) (size!33309 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68147)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!770 (array!68147 array!68145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39243 V!39243 V!39243 V!39243 (_ BitVec 32) Int) Unit!35099)

(assert (=> b!1067909 (= lt!471696 (lemmaNoChangeToArrayThenSameMapNoExtras!770 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3733 (array!68147 array!68145 (_ BitVec 32) (_ BitVec 32) V!39243 V!39243 (_ BitVec 32) Int) ListLongMap!14271)

(assert (=> b!1067909 (= lt!471695 (getCurrentListMapNoExtraKeys!3733 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067909 (= lt!471694 (getCurrentListMapNoExtraKeys!3733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067910 () Bool)

(declare-fun e!609181 () Bool)

(declare-fun e!609184 () Bool)

(declare-fun mapRes!40066 () Bool)

(assert (=> b!1067910 (= e!609181 (and e!609184 mapRes!40066))))

(declare-fun condMapEmpty!40066 () Bool)

(declare-fun mapDefault!40066 () ValueCell!12087)

(assert (=> b!1067910 (= condMapEmpty!40066 (= (arr!32772 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12087)) mapDefault!40066)))))

(declare-fun b!1067911 () Bool)

(declare-fun e!609178 () Bool)

(assert (=> b!1067911 (= e!609178 true)))

(declare-fun lt!471697 () ListLongMap!14271)

(declare-fun -!636 (ListLongMap!14271 (_ BitVec 64)) ListLongMap!14271)

(assert (=> b!1067911 (= (-!636 lt!471697 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471697)))

(declare-fun lt!471693 () Unit!35099)

(declare-fun removeNotPresentStillSame!46 (ListLongMap!14271 (_ BitVec 64)) Unit!35099)

(assert (=> b!1067911 (= lt!471693 (removeNotPresentStillSame!46 lt!471697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067912 () Bool)

(assert (=> b!1067912 (= e!609183 e!609178)))

(declare-fun res!712625 () Bool)

(assert (=> b!1067912 (=> res!712625 e!609178)))

(declare-fun contains!6287 (ListLongMap!14271 (_ BitVec 64)) Bool)

(assert (=> b!1067912 (= res!712625 (contains!6287 lt!471697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4084 (array!68147 array!68145 (_ BitVec 32) (_ BitVec 32) V!39243 V!39243 (_ BitVec 32) Int) ListLongMap!14271)

(assert (=> b!1067912 (= lt!471697 (getCurrentListMap!4084 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067913 () Bool)

(declare-fun tp_is_empty!25581 () Bool)

(assert (=> b!1067913 (= e!609184 tp_is_empty!25581)))

(declare-fun mapNonEmpty!40066 () Bool)

(declare-fun tp!76760 () Bool)

(declare-fun e!609180 () Bool)

(assert (=> mapNonEmpty!40066 (= mapRes!40066 (and tp!76760 e!609180))))

(declare-fun mapRest!40066 () (Array (_ BitVec 32) ValueCell!12087))

(declare-fun mapKey!40066 () (_ BitVec 32))

(declare-fun mapValue!40066 () ValueCell!12087)

(assert (=> mapNonEmpty!40066 (= (arr!32772 _values!955) (store mapRest!40066 mapKey!40066 mapValue!40066))))

(declare-fun b!1067914 () Bool)

(declare-fun res!712626 () Bool)

(assert (=> b!1067914 (=> (not res!712626) (not e!609179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68147 (_ BitVec 32)) Bool)

(assert (=> b!1067914 (= res!712626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067915 () Bool)

(declare-fun res!712622 () Bool)

(assert (=> b!1067915 (=> (not res!712622) (not e!609179))))

(assert (=> b!1067915 (= res!712622 (and (= (size!33308 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33309 _keys!1163) (size!33308 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067916 () Bool)

(declare-fun res!712624 () Bool)

(assert (=> b!1067916 (=> (not res!712624) (not e!609179))))

(declare-datatypes ((List!22858 0))(
  ( (Nil!22855) (Cons!22854 (h!24063 (_ BitVec 64)) (t!32183 List!22858)) )
))
(declare-fun arrayNoDuplicates!0 (array!68147 (_ BitVec 32) List!22858) Bool)

(assert (=> b!1067916 (= res!712624 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22855))))

(declare-fun b!1067917 () Bool)

(assert (=> b!1067917 (= e!609180 tp_is_empty!25581)))

(declare-fun mapIsEmpty!40066 () Bool)

(assert (=> mapIsEmpty!40066 mapRes!40066))

(declare-fun res!712621 () Bool)

(assert (=> start!94444 (=> (not res!712621) (not e!609179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94444 (= res!712621 (validMask!0 mask!1515))))

(assert (=> start!94444 e!609179))

(assert (=> start!94444 true))

(assert (=> start!94444 tp_is_empty!25581))

(declare-fun array_inv!25372 (array!68145) Bool)

(assert (=> start!94444 (and (array_inv!25372 _values!955) e!609181)))

(assert (=> start!94444 tp!76759))

(declare-fun array_inv!25373 (array!68147) Bool)

(assert (=> start!94444 (array_inv!25373 _keys!1163)))

(assert (= (and start!94444 res!712621) b!1067915))

(assert (= (and b!1067915 res!712622) b!1067914))

(assert (= (and b!1067914 res!712626) b!1067916))

(assert (= (and b!1067916 res!712624) b!1067909))

(assert (= (and b!1067909 (not res!712623)) b!1067912))

(assert (= (and b!1067912 (not res!712625)) b!1067911))

(assert (= (and b!1067910 condMapEmpty!40066) mapIsEmpty!40066))

(assert (= (and b!1067910 (not condMapEmpty!40066)) mapNonEmpty!40066))

(get-info :version)

(assert (= (and mapNonEmpty!40066 ((_ is ValueCellFull!12087) mapValue!40066)) b!1067917))

(assert (= (and b!1067910 ((_ is ValueCellFull!12087) mapDefault!40066)) b!1067913))

(assert (= start!94444 b!1067910))

(declare-fun m!986525 () Bool)

(assert (=> b!1067914 m!986525))

(declare-fun m!986527 () Bool)

(assert (=> b!1067909 m!986527))

(declare-fun m!986529 () Bool)

(assert (=> b!1067909 m!986529))

(declare-fun m!986531 () Bool)

(assert (=> b!1067909 m!986531))

(declare-fun m!986533 () Bool)

(assert (=> b!1067916 m!986533))

(declare-fun m!986535 () Bool)

(assert (=> start!94444 m!986535))

(declare-fun m!986537 () Bool)

(assert (=> start!94444 m!986537))

(declare-fun m!986539 () Bool)

(assert (=> start!94444 m!986539))

(declare-fun m!986541 () Bool)

(assert (=> b!1067912 m!986541))

(declare-fun m!986543 () Bool)

(assert (=> b!1067912 m!986543))

(declare-fun m!986545 () Bool)

(assert (=> b!1067911 m!986545))

(declare-fun m!986547 () Bool)

(assert (=> b!1067911 m!986547))

(declare-fun m!986549 () Bool)

(assert (=> mapNonEmpty!40066 m!986549))

(check-sat (not b!1067912) (not mapNonEmpty!40066) (not b!1067916) tp_is_empty!25581 (not b!1067911) (not b_next!21771) (not b!1067909) (not b!1067914) b_and!34563 (not start!94444))
(check-sat b_and!34563 (not b_next!21771))
