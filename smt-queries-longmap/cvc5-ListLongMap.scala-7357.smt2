; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93846 () Bool)

(assert start!93846)

(declare-fun b_free!21319 () Bool)

(declare-fun b_next!21319 () Bool)

(assert (=> start!93846 (= b_free!21319 (not b_next!21319))))

(declare-fun tp!75380 () Bool)

(declare-fun b_and!34033 () Bool)

(assert (=> start!93846 (= tp!75380 b_and!34033)))

(declare-fun b!1061411 () Bool)

(declare-fun e!604428 () Bool)

(assert (=> b!1061411 (= e!604428 (not true))))

(declare-datatypes ((V!38641 0))(
  ( (V!38642 (val!12615 Int)) )
))
(declare-datatypes ((tuple2!15946 0))(
  ( (tuple2!15947 (_1!7984 (_ BitVec 64)) (_2!7984 V!38641)) )
))
(declare-datatypes ((List!22531 0))(
  ( (Nil!22528) (Cons!22527 (h!23736 tuple2!15946) (t!31840 List!22531)) )
))
(declare-datatypes ((ListLongMap!13915 0))(
  ( (ListLongMap!13916 (toList!6973 List!22531)) )
))
(declare-fun lt!467585 () ListLongMap!13915)

(declare-fun lt!467587 () ListLongMap!13915)

(assert (=> b!1061411 (= lt!467585 lt!467587)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38641)

(declare-datatypes ((ValueCell!11861 0))(
  ( (ValueCellFull!11861 (v!15225 V!38641)) (EmptyCell!11861) )
))
(declare-datatypes ((array!67261 0))(
  ( (array!67262 (arr!32338 (Array (_ BitVec 32) ValueCell!11861)) (size!32874 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67261)

(declare-fun minValue!907 () V!38641)

(declare-datatypes ((Unit!34748 0))(
  ( (Unit!34749) )
))
(declare-fun lt!467586 () Unit!34748)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38641)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67263 0))(
  ( (array!67264 (arr!32339 (Array (_ BitVec 32) (_ BitVec 64))) (size!32875 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67263)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!612 (array!67263 array!67261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38641 V!38641 V!38641 V!38641 (_ BitVec 32) Int) Unit!34748)

(assert (=> b!1061411 (= lt!467586 (lemmaNoChangeToArrayThenSameMapNoExtras!612 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3575 (array!67263 array!67261 (_ BitVec 32) (_ BitVec 32) V!38641 V!38641 (_ BitVec 32) Int) ListLongMap!13915)

(assert (=> b!1061411 (= lt!467587 (getCurrentListMapNoExtraKeys!3575 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061411 (= lt!467585 (getCurrentListMapNoExtraKeys!3575 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061412 () Bool)

(declare-fun res!708806 () Bool)

(assert (=> b!1061412 (=> (not res!708806) (not e!604428))))

(assert (=> b!1061412 (= res!708806 (and (= (size!32874 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32875 _keys!1163) (size!32874 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39364 () Bool)

(declare-fun mapRes!39364 () Bool)

(declare-fun tp!75379 () Bool)

(declare-fun e!604426 () Bool)

(assert (=> mapNonEmpty!39364 (= mapRes!39364 (and tp!75379 e!604426))))

(declare-fun mapRest!39364 () (Array (_ BitVec 32) ValueCell!11861))

(declare-fun mapValue!39364 () ValueCell!11861)

(declare-fun mapKey!39364 () (_ BitVec 32))

(assert (=> mapNonEmpty!39364 (= (arr!32338 _values!955) (store mapRest!39364 mapKey!39364 mapValue!39364))))

(declare-fun b!1061413 () Bool)

(declare-fun res!708808 () Bool)

(assert (=> b!1061413 (=> (not res!708808) (not e!604428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67263 (_ BitVec 32)) Bool)

(assert (=> b!1061413 (= res!708808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061414 () Bool)

(declare-fun e!604427 () Bool)

(declare-fun tp_is_empty!25129 () Bool)

(assert (=> b!1061414 (= e!604427 tp_is_empty!25129)))

(declare-fun b!1061415 () Bool)

(declare-fun res!708807 () Bool)

(assert (=> b!1061415 (=> (not res!708807) (not e!604428))))

(declare-datatypes ((List!22532 0))(
  ( (Nil!22529) (Cons!22528 (h!23737 (_ BitVec 64)) (t!31841 List!22532)) )
))
(declare-fun arrayNoDuplicates!0 (array!67263 (_ BitVec 32) List!22532) Bool)

(assert (=> b!1061415 (= res!708807 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22529))))

(declare-fun mapIsEmpty!39364 () Bool)

(assert (=> mapIsEmpty!39364 mapRes!39364))

(declare-fun res!708805 () Bool)

(assert (=> start!93846 (=> (not res!708805) (not e!604428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93846 (= res!708805 (validMask!0 mask!1515))))

(assert (=> start!93846 e!604428))

(assert (=> start!93846 true))

(assert (=> start!93846 tp_is_empty!25129))

(declare-fun e!604424 () Bool)

(declare-fun array_inv!25058 (array!67261) Bool)

(assert (=> start!93846 (and (array_inv!25058 _values!955) e!604424)))

(assert (=> start!93846 tp!75380))

(declare-fun array_inv!25059 (array!67263) Bool)

(assert (=> start!93846 (array_inv!25059 _keys!1163)))

(declare-fun b!1061416 () Bool)

(assert (=> b!1061416 (= e!604426 tp_is_empty!25129)))

(declare-fun b!1061417 () Bool)

(assert (=> b!1061417 (= e!604424 (and e!604427 mapRes!39364))))

(declare-fun condMapEmpty!39364 () Bool)

(declare-fun mapDefault!39364 () ValueCell!11861)

