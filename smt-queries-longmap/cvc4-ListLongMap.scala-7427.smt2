; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94402 () Bool)

(assert start!94402)

(declare-fun b_free!21743 () Bool)

(declare-fun b_next!21743 () Bool)

(assert (=> start!94402 (= b_free!21743 (not b_next!21743))))

(declare-fun tp!76672 () Bool)

(declare-fun b_and!34527 () Bool)

(assert (=> start!94402 (= tp!76672 b_and!34527)))

(declare-fun b!1067457 () Bool)

(declare-fun e!608841 () Bool)

(declare-fun tp_is_empty!25553 () Bool)

(assert (=> b!1067457 (= e!608841 tp_is_empty!25553)))

(declare-fun mapNonEmpty!40021 () Bool)

(declare-fun mapRes!40021 () Bool)

(declare-fun tp!76673 () Bool)

(declare-fun e!608842 () Bool)

(assert (=> mapNonEmpty!40021 (= mapRes!40021 (and tp!76673 e!608842))))

(declare-datatypes ((V!39205 0))(
  ( (V!39206 (val!12827 Int)) )
))
(declare-datatypes ((ValueCell!12073 0))(
  ( (ValueCellFull!12073 (v!15441 V!39205)) (EmptyCell!12073) )
))
(declare-fun mapRest!40021 () (Array (_ BitVec 32) ValueCell!12073))

(declare-fun mapKey!40021 () (_ BitVec 32))

(declare-fun mapValue!40021 () ValueCell!12073)

(declare-datatypes ((array!68087 0))(
  ( (array!68088 (arr!32744 (Array (_ BitVec 32) ValueCell!12073)) (size!33280 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68087)

(assert (=> mapNonEmpty!40021 (= (arr!32744 _values!955) (store mapRest!40021 mapKey!40021 mapValue!40021))))

(declare-fun b!1067458 () Bool)

(declare-fun res!712352 () Bool)

(declare-fun e!608843 () Bool)

(assert (=> b!1067458 (=> (not res!712352) (not e!608843))))

(declare-datatypes ((array!68089 0))(
  ( (array!68090 (arr!32745 (Array (_ BitVec 32) (_ BitVec 64))) (size!33281 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68089)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68089 (_ BitVec 32)) Bool)

(assert (=> b!1067458 (= res!712352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067459 () Bool)

(declare-fun res!712351 () Bool)

(assert (=> b!1067459 (=> (not res!712351) (not e!608843))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067459 (= res!712351 (and (= (size!33280 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33281 _keys!1163) (size!33280 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!712349 () Bool)

(assert (=> start!94402 (=> (not res!712349) (not e!608843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94402 (= res!712349 (validMask!0 mask!1515))))

(assert (=> start!94402 e!608843))

(assert (=> start!94402 true))

(assert (=> start!94402 tp_is_empty!25553))

(declare-fun e!608844 () Bool)

(declare-fun array_inv!25348 (array!68087) Bool)

(assert (=> start!94402 (and (array_inv!25348 _values!955) e!608844)))

(assert (=> start!94402 tp!76672))

(declare-fun array_inv!25349 (array!68089) Bool)

(assert (=> start!94402 (array_inv!25349 _keys!1163)))

(declare-fun mapIsEmpty!40021 () Bool)

(assert (=> mapIsEmpty!40021 mapRes!40021))

(declare-fun b!1067460 () Bool)

(assert (=> b!1067460 (= e!608843 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!33281 _keys!1163)))))))

(declare-datatypes ((tuple2!16276 0))(
  ( (tuple2!16277 (_1!8149 (_ BitVec 64)) (_2!8149 V!39205)) )
))
(declare-datatypes ((List!22835 0))(
  ( (Nil!22832) (Cons!22831 (h!24040 tuple2!16276) (t!32158 List!22835)) )
))
(declare-datatypes ((ListLongMap!14245 0))(
  ( (ListLongMap!14246 (toList!7138 List!22835)) )
))
(declare-fun lt!471456 () ListLongMap!14245)

(declare-fun lt!471455 () ListLongMap!14245)

(assert (=> b!1067460 (= lt!471456 lt!471455)))

(declare-fun zeroValueBefore!47 () V!39205)

(declare-datatypes ((Unit!35073 0))(
  ( (Unit!35074) )
))
(declare-fun lt!471454 () Unit!35073)

(declare-fun minValue!907 () V!39205)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39205)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!759 (array!68089 array!68087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39205 V!39205 V!39205 V!39205 (_ BitVec 32) Int) Unit!35073)

(assert (=> b!1067460 (= lt!471454 (lemmaNoChangeToArrayThenSameMapNoExtras!759 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3722 (array!68089 array!68087 (_ BitVec 32) (_ BitVec 32) V!39205 V!39205 (_ BitVec 32) Int) ListLongMap!14245)

(assert (=> b!1067460 (= lt!471455 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067460 (= lt!471456 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067461 () Bool)

(assert (=> b!1067461 (= e!608842 tp_is_empty!25553)))

(declare-fun b!1067462 () Bool)

(assert (=> b!1067462 (= e!608844 (and e!608841 mapRes!40021))))

(declare-fun condMapEmpty!40021 () Bool)

(declare-fun mapDefault!40021 () ValueCell!12073)

