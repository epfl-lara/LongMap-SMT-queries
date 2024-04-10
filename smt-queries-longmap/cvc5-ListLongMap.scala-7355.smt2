; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93834 () Bool)

(assert start!93834)

(declare-fun b_free!21307 () Bool)

(declare-fun b_next!21307 () Bool)

(assert (=> start!93834 (= b_free!21307 (not b_next!21307))))

(declare-fun tp!75343 () Bool)

(declare-fun b_and!34021 () Bool)

(assert (=> start!93834 (= tp!75343 b_and!34021)))

(declare-fun b!1061285 () Bool)

(declare-fun res!708736 () Bool)

(declare-fun e!604338 () Bool)

(assert (=> b!1061285 (=> (not res!708736) (not e!604338))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38625 0))(
  ( (V!38626 (val!12609 Int)) )
))
(declare-datatypes ((ValueCell!11855 0))(
  ( (ValueCellFull!11855 (v!15219 V!38625)) (EmptyCell!11855) )
))
(declare-datatypes ((array!67237 0))(
  ( (array!67238 (arr!32326 (Array (_ BitVec 32) ValueCell!11855)) (size!32862 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67237)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67239 0))(
  ( (array!67240 (arr!32327 (Array (_ BitVec 32) (_ BitVec 64))) (size!32863 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67239)

(assert (=> b!1061285 (= res!708736 (and (= (size!32862 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32863 _keys!1163) (size!32862 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061286 () Bool)

(declare-fun res!708734 () Bool)

(assert (=> b!1061286 (=> (not res!708734) (not e!604338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67239 (_ BitVec 32)) Bool)

(assert (=> b!1061286 (= res!708734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061287 () Bool)

(assert (=> b!1061287 (= e!604338 (not true))))

(declare-datatypes ((tuple2!15934 0))(
  ( (tuple2!15935 (_1!7978 (_ BitVec 64)) (_2!7978 V!38625)) )
))
(declare-datatypes ((List!22520 0))(
  ( (Nil!22517) (Cons!22516 (h!23725 tuple2!15934) (t!31829 List!22520)) )
))
(declare-datatypes ((ListLongMap!13903 0))(
  ( (ListLongMap!13904 (toList!6967 List!22520)) )
))
(declare-fun lt!467533 () ListLongMap!13903)

(declare-fun lt!467532 () ListLongMap!13903)

(assert (=> b!1061287 (= lt!467533 lt!467532)))

(declare-fun zeroValueBefore!47 () V!38625)

(declare-fun minValue!907 () V!38625)

(declare-datatypes ((Unit!34736 0))(
  ( (Unit!34737) )
))
(declare-fun lt!467531 () Unit!34736)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38625)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!606 (array!67239 array!67237 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38625 V!38625 V!38625 V!38625 (_ BitVec 32) Int) Unit!34736)

(assert (=> b!1061287 (= lt!467531 (lemmaNoChangeToArrayThenSameMapNoExtras!606 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3569 (array!67239 array!67237 (_ BitVec 32) (_ BitVec 32) V!38625 V!38625 (_ BitVec 32) Int) ListLongMap!13903)

(assert (=> b!1061287 (= lt!467532 (getCurrentListMapNoExtraKeys!3569 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061287 (= lt!467533 (getCurrentListMapNoExtraKeys!3569 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061288 () Bool)

(declare-fun res!708733 () Bool)

(assert (=> b!1061288 (=> (not res!708733) (not e!604338))))

(declare-datatypes ((List!22521 0))(
  ( (Nil!22518) (Cons!22517 (h!23726 (_ BitVec 64)) (t!31830 List!22521)) )
))
(declare-fun arrayNoDuplicates!0 (array!67239 (_ BitVec 32) List!22521) Bool)

(assert (=> b!1061288 (= res!708733 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22518))))

(declare-fun b!1061289 () Bool)

(declare-fun e!604335 () Bool)

(declare-fun tp_is_empty!25117 () Bool)

(assert (=> b!1061289 (= e!604335 tp_is_empty!25117)))

(declare-fun mapNonEmpty!39346 () Bool)

(declare-fun mapRes!39346 () Bool)

(declare-fun tp!75344 () Bool)

(declare-fun e!604334 () Bool)

(assert (=> mapNonEmpty!39346 (= mapRes!39346 (and tp!75344 e!604334))))

(declare-fun mapValue!39346 () ValueCell!11855)

(declare-fun mapRest!39346 () (Array (_ BitVec 32) ValueCell!11855))

(declare-fun mapKey!39346 () (_ BitVec 32))

(assert (=> mapNonEmpty!39346 (= (arr!32326 _values!955) (store mapRest!39346 mapKey!39346 mapValue!39346))))

(declare-fun res!708735 () Bool)

(assert (=> start!93834 (=> (not res!708735) (not e!604338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93834 (= res!708735 (validMask!0 mask!1515))))

(assert (=> start!93834 e!604338))

(assert (=> start!93834 true))

(assert (=> start!93834 tp_is_empty!25117))

(declare-fun e!604336 () Bool)

(declare-fun array_inv!25050 (array!67237) Bool)

(assert (=> start!93834 (and (array_inv!25050 _values!955) e!604336)))

(assert (=> start!93834 tp!75343))

(declare-fun array_inv!25051 (array!67239) Bool)

(assert (=> start!93834 (array_inv!25051 _keys!1163)))

(declare-fun b!1061290 () Bool)

(assert (=> b!1061290 (= e!604336 (and e!604335 mapRes!39346))))

(declare-fun condMapEmpty!39346 () Bool)

(declare-fun mapDefault!39346 () ValueCell!11855)

