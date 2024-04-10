; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94518 () Bool)

(assert start!94518)

(declare-fun b_free!21823 () Bool)

(declare-fun b_next!21823 () Bool)

(assert (=> start!94518 (= b_free!21823 (not b_next!21823))))

(declare-fun tp!76919 () Bool)

(declare-fun b_and!34625 () Bool)

(assert (=> start!94518 (= tp!76919 b_and!34625)))

(declare-fun b!1068768 () Bool)

(declare-fun e!609826 () Bool)

(declare-fun tp_is_empty!25633 () Bool)

(assert (=> b!1068768 (= e!609826 tp_is_empty!25633)))

(declare-fun b!1068769 () Bool)

(declare-fun e!609828 () Bool)

(declare-fun e!609830 () Bool)

(assert (=> b!1068769 (= e!609828 (not e!609830))))

(declare-fun res!713154 () Bool)

(assert (=> b!1068769 (=> res!713154 e!609830)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068769 (= res!713154 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39313 0))(
  ( (V!39314 (val!12867 Int)) )
))
(declare-datatypes ((tuple2!16346 0))(
  ( (tuple2!16347 (_1!8184 (_ BitVec 64)) (_2!8184 V!39313)) )
))
(declare-datatypes ((List!22894 0))(
  ( (Nil!22891) (Cons!22890 (h!24099 tuple2!16346) (t!32221 List!22894)) )
))
(declare-datatypes ((ListLongMap!14315 0))(
  ( (ListLongMap!14316 (toList!7173 List!22894)) )
))
(declare-fun lt!472209 () ListLongMap!14315)

(declare-fun lt!472211 () ListLongMap!14315)

(assert (=> b!1068769 (= lt!472209 lt!472211)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39313)

(declare-datatypes ((ValueCell!12113 0))(
  ( (ValueCellFull!12113 (v!15482 V!39313)) (EmptyCell!12113) )
))
(declare-datatypes ((array!68243 0))(
  ( (array!68244 (arr!32820 (Array (_ BitVec 32) ValueCell!12113)) (size!33356 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68243)

(declare-fun minValue!907 () V!39313)

(declare-datatypes ((Unit!35145 0))(
  ( (Unit!35146) )
))
(declare-fun lt!472210 () Unit!35145)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39313)

(declare-datatypes ((array!68245 0))(
  ( (array!68246 (arr!32821 (Array (_ BitVec 32) (_ BitVec 64))) (size!33357 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68245)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!789 (array!68245 array!68243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 V!39313 V!39313 (_ BitVec 32) Int) Unit!35145)

(assert (=> b!1068769 (= lt!472210 (lemmaNoChangeToArrayThenSameMapNoExtras!789 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3752 (array!68245 array!68243 (_ BitVec 32) (_ BitVec 32) V!39313 V!39313 (_ BitVec 32) Int) ListLongMap!14315)

(assert (=> b!1068769 (= lt!472211 (getCurrentListMapNoExtraKeys!3752 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068769 (= lt!472209 (getCurrentListMapNoExtraKeys!3752 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40147 () Bool)

(declare-fun mapRes!40147 () Bool)

(declare-fun tp!76918 () Bool)

(declare-fun e!609825 () Bool)

(assert (=> mapNonEmpty!40147 (= mapRes!40147 (and tp!76918 e!609825))))

(declare-fun mapValue!40147 () ValueCell!12113)

(declare-fun mapRest!40147 () (Array (_ BitVec 32) ValueCell!12113))

(declare-fun mapKey!40147 () (_ BitVec 32))

(assert (=> mapNonEmpty!40147 (= (arr!32820 _values!955) (store mapRest!40147 mapKey!40147 mapValue!40147))))

(declare-fun b!1068770 () Bool)

(declare-fun res!713150 () Bool)

(assert (=> b!1068770 (=> (not res!713150) (not e!609828))))

(assert (=> b!1068770 (= res!713150 (and (= (size!33356 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33357 _keys!1163) (size!33356 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068771 () Bool)

(declare-fun res!713152 () Bool)

(assert (=> b!1068771 (=> (not res!713152) (not e!609828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68245 (_ BitVec 32)) Bool)

(assert (=> b!1068771 (= res!713152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068772 () Bool)

(declare-fun e!609829 () Bool)

(assert (=> b!1068772 (= e!609829 (and e!609826 mapRes!40147))))

(declare-fun condMapEmpty!40147 () Bool)

(declare-fun mapDefault!40147 () ValueCell!12113)

