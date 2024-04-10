; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94014 () Bool)

(assert start!94014)

(declare-fun b_free!21451 () Bool)

(declare-fun b_next!21451 () Bool)

(assert (=> start!94014 (= b_free!21451 (not b_next!21451))))

(declare-fun tp!75782 () Bool)

(declare-fun b_and!34183 () Bool)

(assert (=> start!94014 (= tp!75782 b_and!34183)))

(declare-fun mapNonEmpty!39568 () Bool)

(declare-fun mapRes!39568 () Bool)

(declare-fun tp!75781 () Bool)

(declare-fun e!605852 () Bool)

(assert (=> mapNonEmpty!39568 (= mapRes!39568 (and tp!75781 e!605852))))

(declare-datatypes ((V!38817 0))(
  ( (V!38818 (val!12681 Int)) )
))
(declare-datatypes ((ValueCell!11927 0))(
  ( (ValueCellFull!11927 (v!15292 V!38817)) (EmptyCell!11927) )
))
(declare-fun mapValue!39568 () ValueCell!11927)

(declare-fun mapRest!39568 () (Array (_ BitVec 32) ValueCell!11927))

(declare-datatypes ((array!67521 0))(
  ( (array!67522 (arr!32466 (Array (_ BitVec 32) ValueCell!11927)) (size!33002 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67521)

(declare-fun mapKey!39568 () (_ BitVec 32))

(assert (=> mapNonEmpty!39568 (= (arr!32466 _values!955) (store mapRest!39568 mapKey!39568 mapValue!39568))))

(declare-fun b!1063322 () Bool)

(declare-fun e!605856 () Bool)

(declare-fun e!605855 () Bool)

(assert (=> b!1063322 (= e!605856 e!605855)))

(declare-fun res!709976 () Bool)

(assert (=> b!1063322 (=> res!709976 e!605855)))

(declare-datatypes ((tuple2!16052 0))(
  ( (tuple2!16053 (_1!8037 (_ BitVec 64)) (_2!8037 V!38817)) )
))
(declare-datatypes ((List!22631 0))(
  ( (Nil!22628) (Cons!22627 (h!23836 tuple2!16052) (t!31944 List!22631)) )
))
(declare-datatypes ((ListLongMap!14021 0))(
  ( (ListLongMap!14022 (toList!7026 List!22631)) )
))
(declare-fun lt!468626 () ListLongMap!14021)

(declare-fun contains!6255 (ListLongMap!14021 (_ BitVec 64)) Bool)

(assert (=> b!1063322 (= res!709976 (contains!6255 lt!468626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38817)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38817)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67523 0))(
  ( (array!67524 (arr!32467 (Array (_ BitVec 32) (_ BitVec 64))) (size!33003 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67523)

(declare-fun getCurrentListMap!4007 (array!67523 array!67521 (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 (_ BitVec 32) Int) ListLongMap!14021)

(assert (=> b!1063322 (= lt!468626 (getCurrentListMap!4007 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063323 () Bool)

(declare-fun e!605858 () Bool)

(assert (=> b!1063323 (= e!605858 (not e!605856))))

(declare-fun res!709972 () Bool)

(assert (=> b!1063323 (=> res!709972 e!605856)))

(assert (=> b!1063323 (= res!709972 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468630 () ListLongMap!14021)

(declare-fun lt!468627 () ListLongMap!14021)

(assert (=> b!1063323 (= lt!468630 lt!468627)))

(declare-datatypes ((Unit!34850 0))(
  ( (Unit!34851) )
))
(declare-fun lt!468629 () Unit!34850)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38817)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!655 (array!67523 array!67521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 V!38817 V!38817 (_ BitVec 32) Int) Unit!34850)

(assert (=> b!1063323 (= lt!468629 (lemmaNoChangeToArrayThenSameMapNoExtras!655 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3618 (array!67523 array!67521 (_ BitVec 32) (_ BitVec 32) V!38817 V!38817 (_ BitVec 32) Int) ListLongMap!14021)

(assert (=> b!1063323 (= lt!468627 (getCurrentListMapNoExtraKeys!3618 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063323 (= lt!468630 (getCurrentListMapNoExtraKeys!3618 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063324 () Bool)

(declare-fun e!605853 () Bool)

(declare-fun tp_is_empty!25261 () Bool)

(assert (=> b!1063324 (= e!605853 tp_is_empty!25261)))

(declare-fun b!1063326 () Bool)

(assert (=> b!1063326 (= e!605852 tp_is_empty!25261)))

(declare-fun b!1063327 () Bool)

(assert (=> b!1063327 (= e!605855 true)))

(declare-fun -!586 (ListLongMap!14021 (_ BitVec 64)) ListLongMap!14021)

(assert (=> b!1063327 (= (-!586 lt!468626 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468626)))

(declare-fun lt!468628 () Unit!34850)

(declare-fun removeNotPresentStillSame!33 (ListLongMap!14021 (_ BitVec 64)) Unit!34850)

(assert (=> b!1063327 (= lt!468628 (removeNotPresentStillSame!33 lt!468626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063328 () Bool)

(declare-fun e!605854 () Bool)

(assert (=> b!1063328 (= e!605854 (and e!605853 mapRes!39568))))

(declare-fun condMapEmpty!39568 () Bool)

(declare-fun mapDefault!39568 () ValueCell!11927)

