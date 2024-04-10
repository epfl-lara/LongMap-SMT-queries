; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94726 () Bool)

(assert start!94726)

(declare-fun b_free!21979 () Bool)

(declare-fun b_next!21979 () Bool)

(assert (=> start!94726 (= b_free!21979 (not b_next!21979))))

(declare-fun tp!77396 () Bool)

(declare-fun b_and!34809 () Bool)

(assert (=> start!94726 (= tp!77396 b_and!34809)))

(declare-fun b!1071021 () Bool)

(declare-fun e!611470 () Bool)

(assert (=> b!1071021 (= e!611470 true)))

(declare-datatypes ((V!39521 0))(
  ( (V!39522 (val!12945 Int)) )
))
(declare-datatypes ((tuple2!16470 0))(
  ( (tuple2!16471 (_1!8246 (_ BitVec 64)) (_2!8246 V!39521)) )
))
(declare-datatypes ((List!23011 0))(
  ( (Nil!23008) (Cons!23007 (h!24216 tuple2!16470) (t!32344 List!23011)) )
))
(declare-datatypes ((ListLongMap!14439 0))(
  ( (ListLongMap!14440 (toList!7235 List!23011)) )
))
(declare-fun lt!473480 () ListLongMap!14439)

(declare-fun lt!473483 () ListLongMap!14439)

(declare-fun -!671 (ListLongMap!14439 (_ BitVec 64)) ListLongMap!14439)

(assert (=> b!1071021 (= lt!473480 (-!671 lt!473483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473476 () ListLongMap!14439)

(declare-fun lt!473479 () ListLongMap!14439)

(assert (=> b!1071021 (= lt!473476 lt!473479)))

(declare-fun zeroValueBefore!47 () V!39521)

(declare-datatypes ((Unit!35266 0))(
  ( (Unit!35267) )
))
(declare-fun lt!473478 () Unit!35266)

(declare-fun lt!473477 () ListLongMap!14439)

(declare-fun minValue!907 () V!39521)

(declare-fun addCommutativeForDiffKeys!716 (ListLongMap!14439 (_ BitVec 64) V!39521 (_ BitVec 64) V!39521) Unit!35266)

(assert (=> b!1071021 (= lt!473478 (addCommutativeForDiffKeys!716 lt!473477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473475 () ListLongMap!14439)

(assert (=> b!1071021 (= (-!671 lt!473479 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473475)))

(declare-fun lt!473484 () tuple2!16470)

(declare-fun +!3170 (ListLongMap!14439 tuple2!16470) ListLongMap!14439)

(assert (=> b!1071021 (= lt!473479 (+!3170 lt!473475 lt!473484))))

(declare-fun lt!473485 () Unit!35266)

(declare-fun addThenRemoveForNewKeyIsSame!41 (ListLongMap!14439 (_ BitVec 64) V!39521) Unit!35266)

(assert (=> b!1071021 (= lt!473485 (addThenRemoveForNewKeyIsSame!41 lt!473475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473486 () tuple2!16470)

(assert (=> b!1071021 (= lt!473475 (+!3170 lt!473477 lt!473486))))

(declare-fun e!611472 () Bool)

(assert (=> b!1071021 e!611472))

(declare-fun res!714466 () Bool)

(assert (=> b!1071021 (=> (not res!714466) (not e!611472))))

(assert (=> b!1071021 (= res!714466 (= lt!473483 lt!473476))))

(assert (=> b!1071021 (= lt!473476 (+!3170 (+!3170 lt!473477 lt!473484) lt!473486))))

(assert (=> b!1071021 (= lt!473486 (tuple2!16471 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071021 (= lt!473484 (tuple2!16471 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((array!68555 0))(
  ( (array!68556 (arr!32973 (Array (_ BitVec 32) (_ BitVec 64))) (size!33509 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68555)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12191 0))(
  ( (ValueCellFull!12191 (v!15561 V!39521)) (EmptyCell!12191) )
))
(declare-datatypes ((array!68557 0))(
  ( (array!68558 (arr!32974 (Array (_ BitVec 32) ValueCell!12191)) (size!33510 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68557)

(declare-fun lt!473481 () ListLongMap!14439)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39521)

(declare-fun getCurrentListMap!4137 (array!68555 array!68557 (_ BitVec 32) (_ BitVec 32) V!39521 V!39521 (_ BitVec 32) Int) ListLongMap!14439)

(assert (=> b!1071021 (= lt!473481 (getCurrentListMap!4137 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071021 (= lt!473483 (getCurrentListMap!4137 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473474 () ListLongMap!14439)

(declare-fun b!1071022 () Bool)

(assert (=> b!1071022 (= e!611472 (= lt!473481 (+!3170 lt!473474 lt!473486)))))

(declare-fun b!1071023 () Bool)

(declare-fun res!714465 () Bool)

(declare-fun e!611474 () Bool)

(assert (=> b!1071023 (=> (not res!714465) (not e!611474))))

(assert (=> b!1071023 (= res!714465 (and (= (size!33510 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33509 _keys!1163) (size!33510 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40390 () Bool)

(declare-fun mapRes!40390 () Bool)

(assert (=> mapIsEmpty!40390 mapRes!40390))

(declare-fun b!1071024 () Bool)

(declare-fun e!611469 () Bool)

(declare-fun tp_is_empty!25789 () Bool)

(assert (=> b!1071024 (= e!611469 tp_is_empty!25789)))

(declare-fun res!714461 () Bool)

(assert (=> start!94726 (=> (not res!714461) (not e!611474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94726 (= res!714461 (validMask!0 mask!1515))))

(assert (=> start!94726 e!611474))

(assert (=> start!94726 true))

(assert (=> start!94726 tp_is_empty!25789))

(declare-fun e!611471 () Bool)

(declare-fun array_inv!25500 (array!68557) Bool)

(assert (=> start!94726 (and (array_inv!25500 _values!955) e!611471)))

(assert (=> start!94726 tp!77396))

(declare-fun array_inv!25501 (array!68555) Bool)

(assert (=> start!94726 (array_inv!25501 _keys!1163)))

(declare-fun b!1071025 () Bool)

(declare-fun e!611473 () Bool)

(assert (=> b!1071025 (= e!611473 tp_is_empty!25789)))

(declare-fun b!1071026 () Bool)

(declare-fun res!714464 () Bool)

(assert (=> b!1071026 (=> (not res!714464) (not e!611474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68555 (_ BitVec 32)) Bool)

(assert (=> b!1071026 (= res!714464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071027 () Bool)

(declare-fun res!714463 () Bool)

(assert (=> b!1071027 (=> (not res!714463) (not e!611474))))

(declare-datatypes ((List!23012 0))(
  ( (Nil!23009) (Cons!23008 (h!24217 (_ BitVec 64)) (t!32345 List!23012)) )
))
(declare-fun arrayNoDuplicates!0 (array!68555 (_ BitVec 32) List!23012) Bool)

(assert (=> b!1071027 (= res!714463 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23009))))

(declare-fun mapNonEmpty!40390 () Bool)

(declare-fun tp!77395 () Bool)

(assert (=> mapNonEmpty!40390 (= mapRes!40390 (and tp!77395 e!611469))))

(declare-fun mapValue!40390 () ValueCell!12191)

(declare-fun mapRest!40390 () (Array (_ BitVec 32) ValueCell!12191))

(declare-fun mapKey!40390 () (_ BitVec 32))

(assert (=> mapNonEmpty!40390 (= (arr!32974 _values!955) (store mapRest!40390 mapKey!40390 mapValue!40390))))

(declare-fun b!1071028 () Bool)

(assert (=> b!1071028 (= e!611471 (and e!611473 mapRes!40390))))

(declare-fun condMapEmpty!40390 () Bool)

(declare-fun mapDefault!40390 () ValueCell!12191)

