; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94012 () Bool)

(assert start!94012)

(declare-fun b_free!21449 () Bool)

(declare-fun b_next!21449 () Bool)

(assert (=> start!94012 (= b_free!21449 (not b_next!21449))))

(declare-fun tp!75776 () Bool)

(declare-fun b_and!34181 () Bool)

(assert (=> start!94012 (= tp!75776 b_and!34181)))

(declare-fun b!1063295 () Bool)

(declare-fun e!605837 () Bool)

(declare-fun e!605835 () Bool)

(assert (=> b!1063295 (= e!605837 (not e!605835))))

(declare-fun res!709958 () Bool)

(assert (=> b!1063295 (=> res!709958 e!605835)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063295 (= res!709958 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38813 0))(
  ( (V!38814 (val!12680 Int)) )
))
(declare-datatypes ((tuple2!16050 0))(
  ( (tuple2!16051 (_1!8036 (_ BitVec 64)) (_2!8036 V!38813)) )
))
(declare-datatypes ((List!22629 0))(
  ( (Nil!22626) (Cons!22625 (h!23834 tuple2!16050) (t!31942 List!22629)) )
))
(declare-datatypes ((ListLongMap!14019 0))(
  ( (ListLongMap!14020 (toList!7025 List!22629)) )
))
(declare-fun lt!468615 () ListLongMap!14019)

(declare-fun lt!468611 () ListLongMap!14019)

(assert (=> b!1063295 (= lt!468615 lt!468611)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38813)

(declare-datatypes ((Unit!34848 0))(
  ( (Unit!34849) )
))
(declare-fun lt!468612 () Unit!34848)

(declare-datatypes ((ValueCell!11926 0))(
  ( (ValueCellFull!11926 (v!15291 V!38813)) (EmptyCell!11926) )
))
(declare-datatypes ((array!67517 0))(
  ( (array!67518 (arr!32464 (Array (_ BitVec 32) ValueCell!11926)) (size!33000 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67517)

(declare-fun minValue!907 () V!38813)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38813)

(declare-datatypes ((array!67519 0))(
  ( (array!67520 (arr!32465 (Array (_ BitVec 32) (_ BitVec 64))) (size!33001 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67519)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!654 (array!67519 array!67517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38813 V!38813 V!38813 V!38813 (_ BitVec 32) Int) Unit!34848)

(assert (=> b!1063295 (= lt!468612 (lemmaNoChangeToArrayThenSameMapNoExtras!654 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3617 (array!67519 array!67517 (_ BitVec 32) (_ BitVec 32) V!38813 V!38813 (_ BitVec 32) Int) ListLongMap!14019)

(assert (=> b!1063295 (= lt!468611 (getCurrentListMapNoExtraKeys!3617 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063295 (= lt!468615 (getCurrentListMapNoExtraKeys!3617 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063296 () Bool)

(declare-fun e!605833 () Bool)

(assert (=> b!1063296 (= e!605833 true)))

(declare-fun lt!468613 () ListLongMap!14019)

(declare-fun -!585 (ListLongMap!14019 (_ BitVec 64)) ListLongMap!14019)

(assert (=> b!1063296 (= (-!585 lt!468613 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468613)))

(declare-fun lt!468614 () Unit!34848)

(declare-fun removeNotPresentStillSame!32 (ListLongMap!14019 (_ BitVec 64)) Unit!34848)

(assert (=> b!1063296 (= lt!468614 (removeNotPresentStillSame!32 lt!468613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!39565 () Bool)

(declare-fun mapRes!39565 () Bool)

(declare-fun tp!75775 () Bool)

(declare-fun e!605831 () Bool)

(assert (=> mapNonEmpty!39565 (= mapRes!39565 (and tp!75775 e!605831))))

(declare-fun mapValue!39565 () ValueCell!11926)

(declare-fun mapKey!39565 () (_ BitVec 32))

(declare-fun mapRest!39565 () (Array (_ BitVec 32) ValueCell!11926))

(assert (=> mapNonEmpty!39565 (= (arr!32464 _values!955) (store mapRest!39565 mapKey!39565 mapValue!39565))))

(declare-fun b!1063297 () Bool)

(declare-fun tp_is_empty!25259 () Bool)

(assert (=> b!1063297 (= e!605831 tp_is_empty!25259)))

(declare-fun b!1063298 () Bool)

(declare-fun res!709956 () Bool)

(assert (=> b!1063298 (=> (not res!709956) (not e!605837))))

(declare-datatypes ((List!22630 0))(
  ( (Nil!22627) (Cons!22626 (h!23835 (_ BitVec 64)) (t!31943 List!22630)) )
))
(declare-fun arrayNoDuplicates!0 (array!67519 (_ BitVec 32) List!22630) Bool)

(assert (=> b!1063298 (= res!709956 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22627))))

(declare-fun b!1063299 () Bool)

(declare-fun res!709957 () Bool)

(assert (=> b!1063299 (=> (not res!709957) (not e!605837))))

(assert (=> b!1063299 (= res!709957 (and (= (size!33000 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33001 _keys!1163) (size!33000 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063300 () Bool)

(declare-fun e!605834 () Bool)

(declare-fun e!605832 () Bool)

(assert (=> b!1063300 (= e!605834 (and e!605832 mapRes!39565))))

(declare-fun condMapEmpty!39565 () Bool)

(declare-fun mapDefault!39565 () ValueCell!11926)

