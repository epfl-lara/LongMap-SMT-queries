; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93950 () Bool)

(assert start!93950)

(declare-fun b_free!21409 () Bool)

(declare-fun b_next!21409 () Bool)

(assert (=> start!93950 (= b_free!21409 (not b_next!21409))))

(declare-fun tp!75653 () Bool)

(declare-fun b_and!34131 () Bool)

(assert (=> start!93950 (= tp!75653 b_and!34131)))

(declare-fun b!1062598 () Bool)

(declare-fun e!605314 () Bool)

(declare-fun e!605315 () Bool)

(assert (=> b!1062598 (= e!605314 (not e!605315))))

(declare-fun res!709533 () Bool)

(assert (=> b!1062598 (=> res!709533 e!605315)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062598 (= res!709533 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38761 0))(
  ( (V!38762 (val!12660 Int)) )
))
(declare-datatypes ((tuple2!16020 0))(
  ( (tuple2!16021 (_1!8021 (_ BitVec 64)) (_2!8021 V!38761)) )
))
(declare-datatypes ((List!22601 0))(
  ( (Nil!22598) (Cons!22597 (h!23806 tuple2!16020) (t!31912 List!22601)) )
))
(declare-datatypes ((ListLongMap!13989 0))(
  ( (ListLongMap!13990 (toList!7010 List!22601)) )
))
(declare-fun lt!468189 () ListLongMap!13989)

(declare-fun lt!468190 () ListLongMap!13989)

(assert (=> b!1062598 (= lt!468189 lt!468190)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38761)

(declare-datatypes ((Unit!34818 0))(
  ( (Unit!34819) )
))
(declare-fun lt!468191 () Unit!34818)

(declare-datatypes ((ValueCell!11906 0))(
  ( (ValueCellFull!11906 (v!15270 V!38761)) (EmptyCell!11906) )
))
(declare-datatypes ((array!67441 0))(
  ( (array!67442 (arr!32427 (Array (_ BitVec 32) ValueCell!11906)) (size!32963 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67441)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38761)

(declare-fun minValue!907 () V!38761)

(declare-datatypes ((array!67443 0))(
  ( (array!67444 (arr!32428 (Array (_ BitVec 32) (_ BitVec 64))) (size!32964 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67443)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!641 (array!67443 array!67441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 V!38761 V!38761 (_ BitVec 32) Int) Unit!34818)

(assert (=> b!1062598 (= lt!468191 (lemmaNoChangeToArrayThenSameMapNoExtras!641 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3604 (array!67443 array!67441 (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 (_ BitVec 32) Int) ListLongMap!13989)

(assert (=> b!1062598 (= lt!468190 (getCurrentListMapNoExtraKeys!3604 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062598 (= lt!468189 (getCurrentListMapNoExtraKeys!3604 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709536 () Bool)

(assert (=> start!93950 (=> (not res!709536) (not e!605314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93950 (= res!709536 (validMask!0 mask!1515))))

(assert (=> start!93950 e!605314))

(assert (=> start!93950 true))

(declare-fun tp_is_empty!25219 () Bool)

(assert (=> start!93950 tp_is_empty!25219))

(declare-fun e!605312 () Bool)

(declare-fun array_inv!25120 (array!67441) Bool)

(assert (=> start!93950 (and (array_inv!25120 _values!955) e!605312)))

(assert (=> start!93950 tp!75653))

(declare-fun array_inv!25121 (array!67443) Bool)

(assert (=> start!93950 (array_inv!25121 _keys!1163)))

(declare-fun b!1062599 () Bool)

(declare-fun res!709537 () Bool)

(assert (=> b!1062599 (=> (not res!709537) (not e!605314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67443 (_ BitVec 32)) Bool)

(assert (=> b!1062599 (= res!709537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062600 () Bool)

(declare-fun e!605311 () Bool)

(assert (=> b!1062600 (= e!605311 (bvsle #b00000000000000000000000000000000 (size!32964 _keys!1163)))))

(declare-fun lt!468187 () ListLongMap!13989)

(declare-fun -!574 (ListLongMap!13989 (_ BitVec 64)) ListLongMap!13989)

(assert (=> b!1062600 (= (-!574 lt!468187 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468187)))

(declare-fun lt!468188 () Unit!34818)

(declare-fun removeNotPresentStillSame!21 (ListLongMap!13989 (_ BitVec 64)) Unit!34818)

(assert (=> b!1062600 (= lt!468188 (removeNotPresentStillSame!21 lt!468187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!39502 () Bool)

(declare-fun mapRes!39502 () Bool)

(declare-fun tp!75652 () Bool)

(declare-fun e!605316 () Bool)

(assert (=> mapNonEmpty!39502 (= mapRes!39502 (and tp!75652 e!605316))))

(declare-fun mapRest!39502 () (Array (_ BitVec 32) ValueCell!11906))

(declare-fun mapKey!39502 () (_ BitVec 32))

(declare-fun mapValue!39502 () ValueCell!11906)

(assert (=> mapNonEmpty!39502 (= (arr!32427 _values!955) (store mapRest!39502 mapKey!39502 mapValue!39502))))

(declare-fun b!1062601 () Bool)

(declare-fun e!605317 () Bool)

(assert (=> b!1062601 (= e!605317 tp_is_empty!25219)))

(declare-fun b!1062602 () Bool)

(declare-fun res!709535 () Bool)

(assert (=> b!1062602 (=> (not res!709535) (not e!605314))))

(assert (=> b!1062602 (= res!709535 (and (= (size!32963 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32964 _keys!1163) (size!32963 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062603 () Bool)

(assert (=> b!1062603 (= e!605316 tp_is_empty!25219)))

(declare-fun b!1062604 () Bool)

(assert (=> b!1062604 (= e!605315 e!605311)))

(declare-fun res!709538 () Bool)

(assert (=> b!1062604 (=> res!709538 e!605311)))

(declare-fun contains!6241 (ListLongMap!13989 (_ BitVec 64)) Bool)

(assert (=> b!1062604 (= res!709538 (contains!6241 lt!468187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3994 (array!67443 array!67441 (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 (_ BitVec 32) Int) ListLongMap!13989)

(assert (=> b!1062604 (= lt!468187 (getCurrentListMap!3994 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39502 () Bool)

(assert (=> mapIsEmpty!39502 mapRes!39502))

(declare-fun b!1062605 () Bool)

(declare-fun res!709534 () Bool)

(assert (=> b!1062605 (=> (not res!709534) (not e!605314))))

(declare-datatypes ((List!22602 0))(
  ( (Nil!22599) (Cons!22598 (h!23807 (_ BitVec 64)) (t!31913 List!22602)) )
))
(declare-fun arrayNoDuplicates!0 (array!67443 (_ BitVec 32) List!22602) Bool)

(assert (=> b!1062605 (= res!709534 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22599))))

(declare-fun b!1062606 () Bool)

(assert (=> b!1062606 (= e!605312 (and e!605317 mapRes!39502))))

(declare-fun condMapEmpty!39502 () Bool)

(declare-fun mapDefault!39502 () ValueCell!11906)

