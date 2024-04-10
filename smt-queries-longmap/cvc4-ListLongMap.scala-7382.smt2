; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94058 () Bool)

(assert start!94058)

(declare-fun b_free!21473 () Bool)

(declare-fun b_next!21473 () Bool)

(assert (=> start!94058 (= b_free!21473 (not b_next!21473))))

(declare-fun tp!75851 () Bool)

(declare-fun b_and!34215 () Bool)

(assert (=> start!94058 (= tp!75851 b_and!34215)))

(declare-fun b!1063760 () Bool)

(declare-fun res!710217 () Bool)

(declare-fun e!606167 () Bool)

(assert (=> b!1063760 (=> (not res!710217) (not e!606167))))

(declare-datatypes ((array!67565 0))(
  ( (array!67566 (arr!32487 (Array (_ BitVec 32) (_ BitVec 64))) (size!33023 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67565)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67565 (_ BitVec 32)) Bool)

(assert (=> b!1063760 (= res!710217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39604 () Bool)

(declare-fun mapRes!39604 () Bool)

(declare-fun tp!75850 () Bool)

(declare-fun e!606168 () Bool)

(assert (=> mapNonEmpty!39604 (= mapRes!39604 (and tp!75850 e!606168))))

(declare-datatypes ((V!38845 0))(
  ( (V!38846 (val!12692 Int)) )
))
(declare-datatypes ((ValueCell!11938 0))(
  ( (ValueCellFull!11938 (v!15304 V!38845)) (EmptyCell!11938) )
))
(declare-fun mapValue!39604 () ValueCell!11938)

(declare-fun mapKey!39604 () (_ BitVec 32))

(declare-datatypes ((array!67567 0))(
  ( (array!67568 (arr!32488 (Array (_ BitVec 32) ValueCell!11938)) (size!33024 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67567)

(declare-fun mapRest!39604 () (Array (_ BitVec 32) ValueCell!11938))

(assert (=> mapNonEmpty!39604 (= (arr!32488 _values!955) (store mapRest!39604 mapKey!39604 mapValue!39604))))

(declare-fun res!710215 () Bool)

(assert (=> start!94058 (=> (not res!710215) (not e!606167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94058 (= res!710215 (validMask!0 mask!1515))))

(assert (=> start!94058 e!606167))

(assert (=> start!94058 true))

(declare-fun tp_is_empty!25283 () Bool)

(assert (=> start!94058 tp_is_empty!25283))

(declare-fun e!606170 () Bool)

(declare-fun array_inv!25162 (array!67567) Bool)

(assert (=> start!94058 (and (array_inv!25162 _values!955) e!606170)))

(assert (=> start!94058 tp!75851))

(declare-fun array_inv!25163 (array!67565) Bool)

(assert (=> start!94058 (array_inv!25163 _keys!1163)))

(declare-fun b!1063761 () Bool)

(declare-fun res!710216 () Bool)

(assert (=> b!1063761 (=> (not res!710216) (not e!606167))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063761 (= res!710216 (and (= (size!33024 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33023 _keys!1163) (size!33024 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39604 () Bool)

(assert (=> mapIsEmpty!39604 mapRes!39604))

(declare-fun b!1063762 () Bool)

(declare-fun e!606171 () Bool)

(assert (=> b!1063762 (= e!606171 tp_is_empty!25283)))

(declare-fun b!1063763 () Bool)

(assert (=> b!1063763 (= e!606167 (not true))))

(declare-datatypes ((tuple2!16068 0))(
  ( (tuple2!16069 (_1!8045 (_ BitVec 64)) (_2!8045 V!38845)) )
))
(declare-datatypes ((List!22646 0))(
  ( (Nil!22643) (Cons!22642 (h!23851 tuple2!16068) (t!31961 List!22646)) )
))
(declare-datatypes ((ListLongMap!14037 0))(
  ( (ListLongMap!14038 (toList!7034 List!22646)) )
))
(declare-fun lt!468899 () ListLongMap!14037)

(declare-fun lt!468900 () ListLongMap!14037)

(assert (=> b!1063763 (= lt!468899 lt!468900)))

(declare-fun zeroValueBefore!47 () V!38845)

(declare-fun minValue!907 () V!38845)

(declare-datatypes ((Unit!34868 0))(
  ( (Unit!34869) )
))
(declare-fun lt!468901 () Unit!34868)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38845)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!663 (array!67565 array!67567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38845 V!38845 V!38845 V!38845 (_ BitVec 32) Int) Unit!34868)

(assert (=> b!1063763 (= lt!468901 (lemmaNoChangeToArrayThenSameMapNoExtras!663 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3626 (array!67565 array!67567 (_ BitVec 32) (_ BitVec 32) V!38845 V!38845 (_ BitVec 32) Int) ListLongMap!14037)

(assert (=> b!1063763 (= lt!468900 (getCurrentListMapNoExtraKeys!3626 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063763 (= lt!468899 (getCurrentListMapNoExtraKeys!3626 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063764 () Bool)

(assert (=> b!1063764 (= e!606168 tp_is_empty!25283)))

(declare-fun b!1063765 () Bool)

(declare-fun res!710218 () Bool)

(assert (=> b!1063765 (=> (not res!710218) (not e!606167))))

(declare-datatypes ((List!22647 0))(
  ( (Nil!22644) (Cons!22643 (h!23852 (_ BitVec 64)) (t!31962 List!22647)) )
))
(declare-fun arrayNoDuplicates!0 (array!67565 (_ BitVec 32) List!22647) Bool)

(assert (=> b!1063765 (= res!710218 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22644))))

(declare-fun b!1063766 () Bool)

(assert (=> b!1063766 (= e!606170 (and e!606171 mapRes!39604))))

(declare-fun condMapEmpty!39604 () Bool)

(declare-fun mapDefault!39604 () ValueCell!11938)

