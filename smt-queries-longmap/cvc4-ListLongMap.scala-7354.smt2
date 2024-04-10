; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93832 () Bool)

(assert start!93832)

(declare-fun b_free!21305 () Bool)

(declare-fun b_next!21305 () Bool)

(assert (=> start!93832 (= b_free!21305 (not b_next!21305))))

(declare-fun tp!75337 () Bool)

(declare-fun b_and!34019 () Bool)

(assert (=> start!93832 (= tp!75337 b_and!34019)))

(declare-fun mapIsEmpty!39343 () Bool)

(declare-fun mapRes!39343 () Bool)

(assert (=> mapIsEmpty!39343 mapRes!39343))

(declare-fun b!1061264 () Bool)

(declare-fun e!604322 () Bool)

(declare-fun tp_is_empty!25115 () Bool)

(assert (=> b!1061264 (= e!604322 tp_is_empty!25115)))

(declare-fun b!1061265 () Bool)

(declare-fun res!708722 () Bool)

(declare-fun e!604319 () Bool)

(assert (=> b!1061265 (=> (not res!708722) (not e!604319))))

(declare-datatypes ((array!67233 0))(
  ( (array!67234 (arr!32324 (Array (_ BitVec 32) (_ BitVec 64))) (size!32860 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67233)

(declare-datatypes ((List!22518 0))(
  ( (Nil!22515) (Cons!22514 (h!23723 (_ BitVec 64)) (t!31827 List!22518)) )
))
(declare-fun arrayNoDuplicates!0 (array!67233 (_ BitVec 32) List!22518) Bool)

(assert (=> b!1061265 (= res!708722 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22515))))

(declare-fun b!1061266 () Bool)

(assert (=> b!1061266 (= e!604319 (not true))))

(declare-datatypes ((V!38621 0))(
  ( (V!38622 (val!12608 Int)) )
))
(declare-datatypes ((tuple2!15932 0))(
  ( (tuple2!15933 (_1!7977 (_ BitVec 64)) (_2!7977 V!38621)) )
))
(declare-datatypes ((List!22519 0))(
  ( (Nil!22516) (Cons!22515 (h!23724 tuple2!15932) (t!31828 List!22519)) )
))
(declare-datatypes ((ListLongMap!13901 0))(
  ( (ListLongMap!13902 (toList!6966 List!22519)) )
))
(declare-fun lt!467523 () ListLongMap!13901)

(declare-fun lt!467522 () ListLongMap!13901)

(assert (=> b!1061266 (= lt!467523 lt!467522)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38621)

(declare-datatypes ((Unit!34734 0))(
  ( (Unit!34735) )
))
(declare-fun lt!467524 () Unit!34734)

(declare-datatypes ((ValueCell!11854 0))(
  ( (ValueCellFull!11854 (v!15218 V!38621)) (EmptyCell!11854) )
))
(declare-datatypes ((array!67235 0))(
  ( (array!67236 (arr!32325 (Array (_ BitVec 32) ValueCell!11854)) (size!32861 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67235)

(declare-fun minValue!907 () V!38621)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38621)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!605 (array!67233 array!67235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38621 V!38621 V!38621 V!38621 (_ BitVec 32) Int) Unit!34734)

(assert (=> b!1061266 (= lt!467524 (lemmaNoChangeToArrayThenSameMapNoExtras!605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3568 (array!67233 array!67235 (_ BitVec 32) (_ BitVec 32) V!38621 V!38621 (_ BitVec 32) Int) ListLongMap!13901)

(assert (=> b!1061266 (= lt!467522 (getCurrentListMapNoExtraKeys!3568 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061266 (= lt!467523 (getCurrentListMapNoExtraKeys!3568 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061267 () Bool)

(declare-fun e!604321 () Bool)

(assert (=> b!1061267 (= e!604321 tp_is_empty!25115)))

(declare-fun res!708723 () Bool)

(assert (=> start!93832 (=> (not res!708723) (not e!604319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93832 (= res!708723 (validMask!0 mask!1515))))

(assert (=> start!93832 e!604319))

(assert (=> start!93832 true))

(assert (=> start!93832 tp_is_empty!25115))

(declare-fun e!604320 () Bool)

(declare-fun array_inv!25048 (array!67235) Bool)

(assert (=> start!93832 (and (array_inv!25048 _values!955) e!604320)))

(assert (=> start!93832 tp!75337))

(declare-fun array_inv!25049 (array!67233) Bool)

(assert (=> start!93832 (array_inv!25049 _keys!1163)))

(declare-fun b!1061268 () Bool)

(declare-fun res!708721 () Bool)

(assert (=> b!1061268 (=> (not res!708721) (not e!604319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67233 (_ BitVec 32)) Bool)

(assert (=> b!1061268 (= res!708721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39343 () Bool)

(declare-fun tp!75338 () Bool)

(assert (=> mapNonEmpty!39343 (= mapRes!39343 (and tp!75338 e!604322))))

(declare-fun mapValue!39343 () ValueCell!11854)

(declare-fun mapRest!39343 () (Array (_ BitVec 32) ValueCell!11854))

(declare-fun mapKey!39343 () (_ BitVec 32))

(assert (=> mapNonEmpty!39343 (= (arr!32325 _values!955) (store mapRest!39343 mapKey!39343 mapValue!39343))))

(declare-fun b!1061269 () Bool)

(declare-fun res!708724 () Bool)

(assert (=> b!1061269 (=> (not res!708724) (not e!604319))))

(assert (=> b!1061269 (= res!708724 (and (= (size!32861 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32860 _keys!1163) (size!32861 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061270 () Bool)

(assert (=> b!1061270 (= e!604320 (and e!604321 mapRes!39343))))

(declare-fun condMapEmpty!39343 () Bool)

(declare-fun mapDefault!39343 () ValueCell!11854)

