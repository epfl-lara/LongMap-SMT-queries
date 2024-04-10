; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93844 () Bool)

(assert start!93844)

(declare-fun b_free!21317 () Bool)

(declare-fun b_next!21317 () Bool)

(assert (=> start!93844 (= b_free!21317 (not b_next!21317))))

(declare-fun tp!75374 () Bool)

(declare-fun b_and!34031 () Bool)

(assert (=> start!93844 (= tp!75374 b_and!34031)))

(declare-fun b!1061390 () Bool)

(declare-fun res!708795 () Bool)

(declare-fun e!604411 () Bool)

(assert (=> b!1061390 (=> (not res!708795) (not e!604411))))

(declare-datatypes ((array!67257 0))(
  ( (array!67258 (arr!32336 (Array (_ BitVec 32) (_ BitVec 64))) (size!32872 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67257)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67257 (_ BitVec 32)) Bool)

(assert (=> b!1061390 (= res!708795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061391 () Bool)

(assert (=> b!1061391 (= e!604411 (not true))))

(declare-datatypes ((V!38637 0))(
  ( (V!38638 (val!12614 Int)) )
))
(declare-datatypes ((tuple2!15944 0))(
  ( (tuple2!15945 (_1!7983 (_ BitVec 64)) (_2!7983 V!38637)) )
))
(declare-datatypes ((List!22529 0))(
  ( (Nil!22526) (Cons!22525 (h!23734 tuple2!15944) (t!31838 List!22529)) )
))
(declare-datatypes ((ListLongMap!13913 0))(
  ( (ListLongMap!13914 (toList!6972 List!22529)) )
))
(declare-fun lt!467577 () ListLongMap!13913)

(declare-fun lt!467578 () ListLongMap!13913)

(assert (=> b!1061391 (= lt!467577 lt!467578)))

(declare-fun zeroValueBefore!47 () V!38637)

(declare-datatypes ((Unit!34746 0))(
  ( (Unit!34747) )
))
(declare-fun lt!467576 () Unit!34746)

(declare-datatypes ((ValueCell!11860 0))(
  ( (ValueCellFull!11860 (v!15224 V!38637)) (EmptyCell!11860) )
))
(declare-datatypes ((array!67259 0))(
  ( (array!67260 (arr!32337 (Array (_ BitVec 32) ValueCell!11860)) (size!32873 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67259)

(declare-fun minValue!907 () V!38637)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38637)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!611 (array!67257 array!67259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38637 V!38637 V!38637 V!38637 (_ BitVec 32) Int) Unit!34746)

(assert (=> b!1061391 (= lt!467576 (lemmaNoChangeToArrayThenSameMapNoExtras!611 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3574 (array!67257 array!67259 (_ BitVec 32) (_ BitVec 32) V!38637 V!38637 (_ BitVec 32) Int) ListLongMap!13913)

(assert (=> b!1061391 (= lt!467578 (getCurrentListMapNoExtraKeys!3574 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061391 (= lt!467577 (getCurrentListMapNoExtraKeys!3574 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39361 () Bool)

(declare-fun mapRes!39361 () Bool)

(declare-fun tp!75373 () Bool)

(declare-fun e!604413 () Bool)

(assert (=> mapNonEmpty!39361 (= mapRes!39361 (and tp!75373 e!604413))))

(declare-fun mapValue!39361 () ValueCell!11860)

(declare-fun mapKey!39361 () (_ BitVec 32))

(declare-fun mapRest!39361 () (Array (_ BitVec 32) ValueCell!11860))

(assert (=> mapNonEmpty!39361 (= (arr!32337 _values!955) (store mapRest!39361 mapKey!39361 mapValue!39361))))

(declare-fun b!1061392 () Bool)

(declare-fun res!708794 () Bool)

(assert (=> b!1061392 (=> (not res!708794) (not e!604411))))

(declare-datatypes ((List!22530 0))(
  ( (Nil!22527) (Cons!22526 (h!23735 (_ BitVec 64)) (t!31839 List!22530)) )
))
(declare-fun arrayNoDuplicates!0 (array!67257 (_ BitVec 32) List!22530) Bool)

(assert (=> b!1061392 (= res!708794 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22527))))

(declare-fun b!1061393 () Bool)

(declare-fun tp_is_empty!25127 () Bool)

(assert (=> b!1061393 (= e!604413 tp_is_empty!25127)))

(declare-fun b!1061394 () Bool)

(declare-fun e!604410 () Bool)

(assert (=> b!1061394 (= e!604410 tp_is_empty!25127)))

(declare-fun res!708796 () Bool)

(assert (=> start!93844 (=> (not res!708796) (not e!604411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93844 (= res!708796 (validMask!0 mask!1515))))

(assert (=> start!93844 e!604411))

(assert (=> start!93844 true))

(assert (=> start!93844 tp_is_empty!25127))

(declare-fun e!604412 () Bool)

(declare-fun array_inv!25056 (array!67259) Bool)

(assert (=> start!93844 (and (array_inv!25056 _values!955) e!604412)))

(assert (=> start!93844 tp!75374))

(declare-fun array_inv!25057 (array!67257) Bool)

(assert (=> start!93844 (array_inv!25057 _keys!1163)))

(declare-fun b!1061395 () Bool)

(declare-fun res!708793 () Bool)

(assert (=> b!1061395 (=> (not res!708793) (not e!604411))))

(assert (=> b!1061395 (= res!708793 (and (= (size!32873 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32872 _keys!1163) (size!32873 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061396 () Bool)

(assert (=> b!1061396 (= e!604412 (and e!604410 mapRes!39361))))

(declare-fun condMapEmpty!39361 () Bool)

(declare-fun mapDefault!39361 () ValueCell!11860)

