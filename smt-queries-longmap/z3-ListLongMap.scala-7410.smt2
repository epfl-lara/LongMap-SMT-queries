; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94268 () Bool)

(assert start!94268)

(declare-fun b_free!21637 () Bool)

(declare-fun b_next!21637 () Bool)

(assert (=> start!94268 (= b_free!21637 (not b_next!21637))))

(declare-fun tp!76352 () Bool)

(declare-fun b_and!34383 () Bool)

(assert (=> start!94268 (= tp!76352 b_and!34383)))

(declare-fun mapIsEmpty!39859 () Bool)

(declare-fun mapRes!39859 () Bool)

(assert (=> mapIsEmpty!39859 mapRes!39859))

(declare-fun b!1065928 () Bool)

(declare-fun res!711485 () Bool)

(declare-fun e!607756 () Bool)

(assert (=> b!1065928 (=> (not res!711485) (not e!607756))))

(declare-datatypes ((array!67820 0))(
  ( (array!67821 (arr!32612 (Array (_ BitVec 32) (_ BitVec 64))) (size!33150 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67820)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67820 (_ BitVec 32)) Bool)

(assert (=> b!1065928 (= res!711485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065929 () Bool)

(declare-fun e!607754 () Bool)

(assert (=> b!1065929 (= e!607756 (not e!607754))))

(declare-fun res!711484 () Bool)

(assert (=> b!1065929 (=> res!711484 e!607754)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065929 (= res!711484 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39065 0))(
  ( (V!39066 (val!12774 Int)) )
))
(declare-datatypes ((tuple2!16250 0))(
  ( (tuple2!16251 (_1!8136 (_ BitVec 64)) (_2!8136 V!39065)) )
))
(declare-datatypes ((List!22796 0))(
  ( (Nil!22793) (Cons!22792 (h!24001 tuple2!16250) (t!32108 List!22796)) )
))
(declare-datatypes ((ListLongMap!14219 0))(
  ( (ListLongMap!14220 (toList!7125 List!22796)) )
))
(declare-fun lt!470250 () ListLongMap!14219)

(declare-fun lt!470249 () ListLongMap!14219)

(assert (=> b!1065929 (= lt!470250 lt!470249)))

(declare-fun zeroValueBefore!47 () V!39065)

(declare-datatypes ((Unit!34838 0))(
  ( (Unit!34839) )
))
(declare-fun lt!470251 () Unit!34838)

(declare-datatypes ((ValueCell!12020 0))(
  ( (ValueCellFull!12020 (v!15386 V!39065)) (EmptyCell!12020) )
))
(declare-datatypes ((array!67822 0))(
  ( (array!67823 (arr!32613 (Array (_ BitVec 32) ValueCell!12020)) (size!33151 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67822)

(declare-fun minValue!907 () V!39065)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39065)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!718 (array!67820 array!67822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 V!39065 V!39065 (_ BitVec 32) Int) Unit!34838)

(assert (=> b!1065929 (= lt!470251 (lemmaNoChangeToArrayThenSameMapNoExtras!718 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3724 (array!67820 array!67822 (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 (_ BitVec 32) Int) ListLongMap!14219)

(assert (=> b!1065929 (= lt!470249 (getCurrentListMapNoExtraKeys!3724 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065929 (= lt!470250 (getCurrentListMapNoExtraKeys!3724 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39859 () Bool)

(declare-fun tp!76351 () Bool)

(declare-fun e!607757 () Bool)

(assert (=> mapNonEmpty!39859 (= mapRes!39859 (and tp!76351 e!607757))))

(declare-fun mapRest!39859 () (Array (_ BitVec 32) ValueCell!12020))

(declare-fun mapKey!39859 () (_ BitVec 32))

(declare-fun mapValue!39859 () ValueCell!12020)

(assert (=> mapNonEmpty!39859 (= (arr!32613 _values!955) (store mapRest!39859 mapKey!39859 mapValue!39859))))

(declare-fun b!1065930 () Bool)

(declare-fun res!711487 () Bool)

(assert (=> b!1065930 (=> (not res!711487) (not e!607756))))

(assert (=> b!1065930 (= res!711487 (and (= (size!33151 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33150 _keys!1163) (size!33151 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065931 () Bool)

(declare-fun e!607755 () Bool)

(declare-fun tp_is_empty!25447 () Bool)

(assert (=> b!1065931 (= e!607755 tp_is_empty!25447)))

(declare-fun b!1065932 () Bool)

(assert (=> b!1065932 (= e!607754 true)))

(declare-fun lt!470244 () ListLongMap!14219)

(declare-fun lt!470248 () ListLongMap!14219)

(declare-fun -!600 (ListLongMap!14219 (_ BitVec 64)) ListLongMap!14219)

(assert (=> b!1065932 (= lt!470244 (-!600 lt!470248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470245 () ListLongMap!14219)

(assert (=> b!1065932 (= (-!600 lt!470245 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470250)))

(declare-fun lt!470247 () Unit!34838)

(declare-fun addThenRemoveForNewKeyIsSame!18 (ListLongMap!14219 (_ BitVec 64) V!39065) Unit!34838)

(assert (=> b!1065932 (= lt!470247 (addThenRemoveForNewKeyIsSame!18 lt!470250 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470246 () ListLongMap!14219)

(assert (=> b!1065932 (and (= lt!470248 lt!470245) (= lt!470246 lt!470249))))

(declare-fun +!3166 (ListLongMap!14219 tuple2!16250) ListLongMap!14219)

(assert (=> b!1065932 (= lt!470245 (+!3166 lt!470250 (tuple2!16251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!3998 (array!67820 array!67822 (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 (_ BitVec 32) Int) ListLongMap!14219)

(assert (=> b!1065932 (= lt!470246 (getCurrentListMap!3998 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065932 (= lt!470248 (getCurrentListMap!3998 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065933 () Bool)

(declare-fun e!607759 () Bool)

(assert (=> b!1065933 (= e!607759 (and e!607755 mapRes!39859))))

(declare-fun condMapEmpty!39859 () Bool)

(declare-fun mapDefault!39859 () ValueCell!12020)

(assert (=> b!1065933 (= condMapEmpty!39859 (= (arr!32613 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12020)) mapDefault!39859)))))

(declare-fun b!1065934 () Bool)

(declare-fun res!711483 () Bool)

(assert (=> b!1065934 (=> (not res!711483) (not e!607756))))

(declare-datatypes ((List!22797 0))(
  ( (Nil!22794) (Cons!22793 (h!24002 (_ BitVec 64)) (t!32109 List!22797)) )
))
(declare-fun arrayNoDuplicates!0 (array!67820 (_ BitVec 32) List!22797) Bool)

(assert (=> b!1065934 (= res!711483 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22794))))

(declare-fun b!1065935 () Bool)

(assert (=> b!1065935 (= e!607757 tp_is_empty!25447)))

(declare-fun res!711486 () Bool)

(assert (=> start!94268 (=> (not res!711486) (not e!607756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94268 (= res!711486 (validMask!0 mask!1515))))

(assert (=> start!94268 e!607756))

(assert (=> start!94268 true))

(assert (=> start!94268 tp_is_empty!25447))

(declare-fun array_inv!25250 (array!67822) Bool)

(assert (=> start!94268 (and (array_inv!25250 _values!955) e!607759)))

(assert (=> start!94268 tp!76352))

(declare-fun array_inv!25251 (array!67820) Bool)

(assert (=> start!94268 (array_inv!25251 _keys!1163)))

(assert (= (and start!94268 res!711486) b!1065930))

(assert (= (and b!1065930 res!711487) b!1065928))

(assert (= (and b!1065928 res!711485) b!1065934))

(assert (= (and b!1065934 res!711483) b!1065929))

(assert (= (and b!1065929 (not res!711484)) b!1065932))

(assert (= (and b!1065933 condMapEmpty!39859) mapIsEmpty!39859))

(assert (= (and b!1065933 (not condMapEmpty!39859)) mapNonEmpty!39859))

(get-info :version)

(assert (= (and mapNonEmpty!39859 ((_ is ValueCellFull!12020) mapValue!39859)) b!1065935))

(assert (= (and b!1065933 ((_ is ValueCellFull!12020) mapDefault!39859)) b!1065931))

(assert (= start!94268 b!1065933))

(declare-fun m!984027 () Bool)

(assert (=> b!1065932 m!984027))

(declare-fun m!984029 () Bool)

(assert (=> b!1065932 m!984029))

(declare-fun m!984031 () Bool)

(assert (=> b!1065932 m!984031))

(declare-fun m!984033 () Bool)

(assert (=> b!1065932 m!984033))

(declare-fun m!984035 () Bool)

(assert (=> b!1065932 m!984035))

(declare-fun m!984037 () Bool)

(assert (=> b!1065932 m!984037))

(declare-fun m!984039 () Bool)

(assert (=> mapNonEmpty!39859 m!984039))

(declare-fun m!984041 () Bool)

(assert (=> start!94268 m!984041))

(declare-fun m!984043 () Bool)

(assert (=> start!94268 m!984043))

(declare-fun m!984045 () Bool)

(assert (=> start!94268 m!984045))

(declare-fun m!984047 () Bool)

(assert (=> b!1065929 m!984047))

(declare-fun m!984049 () Bool)

(assert (=> b!1065929 m!984049))

(declare-fun m!984051 () Bool)

(assert (=> b!1065929 m!984051))

(declare-fun m!984053 () Bool)

(assert (=> b!1065928 m!984053))

(declare-fun m!984055 () Bool)

(assert (=> b!1065934 m!984055))

(check-sat (not start!94268) (not mapNonEmpty!39859) (not b!1065932) b_and!34383 (not b_next!21637) (not b!1065928) (not b!1065929) (not b!1065934) tp_is_empty!25447)
(check-sat b_and!34383 (not b_next!21637))
