; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94196 () Bool)

(assert start!94196)

(declare-fun b_free!21581 () Bool)

(declare-fun b_next!21581 () Bool)

(assert (=> start!94196 (= b_free!21581 (not b_next!21581))))

(declare-fun tp!76180 () Bool)

(declare-fun b_and!34341 () Bool)

(assert (=> start!94196 (= tp!76180 b_and!34341)))

(declare-fun b!1065224 () Bool)

(declare-fun e!607229 () Bool)

(declare-fun tp_is_empty!25391 () Bool)

(assert (=> b!1065224 (= e!607229 tp_is_empty!25391)))

(declare-fun b!1065225 () Bool)

(declare-fun res!711054 () Bool)

(declare-fun e!607225 () Bool)

(assert (=> b!1065225 (=> (not res!711054) (not e!607225))))

(declare-datatypes ((array!67769 0))(
  ( (array!67770 (arr!32587 (Array (_ BitVec 32) (_ BitVec 64))) (size!33123 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67769)

(declare-datatypes ((List!22720 0))(
  ( (Nil!22717) (Cons!22716 (h!23925 (_ BitVec 64)) (t!32039 List!22720)) )
))
(declare-fun arrayNoDuplicates!0 (array!67769 (_ BitVec 32) List!22720) Bool)

(assert (=> b!1065225 (= res!711054 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22717))))

(declare-fun mapNonEmpty!39772 () Bool)

(declare-fun mapRes!39772 () Bool)

(declare-fun tp!76181 () Bool)

(assert (=> mapNonEmpty!39772 (= mapRes!39772 (and tp!76181 e!607229))))

(declare-datatypes ((V!38989 0))(
  ( (V!38990 (val!12746 Int)) )
))
(declare-datatypes ((ValueCell!11992 0))(
  ( (ValueCellFull!11992 (v!15358 V!38989)) (EmptyCell!11992) )
))
(declare-fun mapRest!39772 () (Array (_ BitVec 32) ValueCell!11992))

(declare-fun mapValue!39772 () ValueCell!11992)

(declare-fun mapKey!39772 () (_ BitVec 32))

(declare-datatypes ((array!67771 0))(
  ( (array!67772 (arr!32588 (Array (_ BitVec 32) ValueCell!11992)) (size!33124 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67771)

(assert (=> mapNonEmpty!39772 (= (arr!32588 _values!955) (store mapRest!39772 mapKey!39772 mapValue!39772))))

(declare-fun b!1065226 () Bool)

(declare-fun e!607227 () Bool)

(assert (=> b!1065226 (= e!607225 (not e!607227))))

(declare-fun res!711051 () Bool)

(assert (=> b!1065226 (=> res!711051 e!607227)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065226 (= res!711051 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16152 0))(
  ( (tuple2!16153 (_1!8087 (_ BitVec 64)) (_2!8087 V!38989)) )
))
(declare-datatypes ((List!22721 0))(
  ( (Nil!22718) (Cons!22717 (h!23926 tuple2!16152) (t!32040 List!22721)) )
))
(declare-datatypes ((ListLongMap!14121 0))(
  ( (ListLongMap!14122 (toList!7076 List!22721)) )
))
(declare-fun lt!469641 () ListLongMap!14121)

(declare-fun lt!469639 () ListLongMap!14121)

(assert (=> b!1065226 (= lt!469641 lt!469639)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38989)

(declare-fun minValue!907 () V!38989)

(declare-datatypes ((Unit!34945 0))(
  ( (Unit!34946) )
))
(declare-fun lt!469636 () Unit!34945)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38989)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!701 (array!67769 array!67771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38989 V!38989 V!38989 V!38989 (_ BitVec 32) Int) Unit!34945)

(assert (=> b!1065226 (= lt!469636 (lemmaNoChangeToArrayThenSameMapNoExtras!701 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3664 (array!67769 array!67771 (_ BitVec 32) (_ BitVec 32) V!38989 V!38989 (_ BitVec 32) Int) ListLongMap!14121)

(assert (=> b!1065226 (= lt!469639 (getCurrentListMapNoExtraKeys!3664 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065226 (= lt!469641 (getCurrentListMapNoExtraKeys!3664 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065227 () Bool)

(declare-fun e!607224 () Bool)

(assert (=> b!1065227 (= e!607224 tp_is_empty!25391)))

(declare-fun b!1065228 () Bool)

(declare-fun res!711052 () Bool)

(assert (=> b!1065228 (=> (not res!711052) (not e!607225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67769 (_ BitVec 32)) Bool)

(assert (=> b!1065228 (= res!711052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065229 () Bool)

(assert (=> b!1065229 (= e!607227 true)))

(declare-fun lt!469637 () Bool)

(declare-fun contains!6267 (ListLongMap!14121 (_ BitVec 64)) Bool)

(assert (=> b!1065229 (= lt!469637 (contains!6267 lt!469641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!607228 () Bool)

(assert (=> b!1065229 e!607228))

(declare-fun res!711049 () Bool)

(assert (=> b!1065229 (=> (not res!711049) (not e!607228))))

(declare-fun lt!469640 () ListLongMap!14121)

(declare-fun +!3122 (ListLongMap!14121 tuple2!16152) ListLongMap!14121)

(assert (=> b!1065229 (= res!711049 (= lt!469640 (+!3122 lt!469641 (tuple2!16153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!469638 () ListLongMap!14121)

(declare-fun getCurrentListMap!4035 (array!67769 array!67771 (_ BitVec 32) (_ BitVec 32) V!38989 V!38989 (_ BitVec 32) Int) ListLongMap!14121)

(assert (=> b!1065229 (= lt!469638 (getCurrentListMap!4035 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065229 (= lt!469640 (getCurrentListMap!4035 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711053 () Bool)

(assert (=> start!94196 (=> (not res!711053) (not e!607225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94196 (= res!711053 (validMask!0 mask!1515))))

(assert (=> start!94196 e!607225))

(assert (=> start!94196 true))

(assert (=> start!94196 tp_is_empty!25391))

(declare-fun e!607226 () Bool)

(declare-fun array_inv!25232 (array!67771) Bool)

(assert (=> start!94196 (and (array_inv!25232 _values!955) e!607226)))

(assert (=> start!94196 tp!76180))

(declare-fun array_inv!25233 (array!67769) Bool)

(assert (=> start!94196 (array_inv!25233 _keys!1163)))

(declare-fun mapIsEmpty!39772 () Bool)

(assert (=> mapIsEmpty!39772 mapRes!39772))

(declare-fun b!1065230 () Bool)

(declare-fun res!711050 () Bool)

(assert (=> b!1065230 (=> (not res!711050) (not e!607225))))

(assert (=> b!1065230 (= res!711050 (and (= (size!33124 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33123 _keys!1163) (size!33124 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065231 () Bool)

(assert (=> b!1065231 (= e!607226 (and e!607224 mapRes!39772))))

(declare-fun condMapEmpty!39772 () Bool)

(declare-fun mapDefault!39772 () ValueCell!11992)

