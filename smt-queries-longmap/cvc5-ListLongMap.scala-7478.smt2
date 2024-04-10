; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94816 () Bool)

(assert start!94816)

(declare-fun b_free!22045 () Bool)

(declare-fun b_next!22045 () Bool)

(assert (=> start!94816 (= b_free!22045 (not b_next!22045))))

(declare-fun tp!77597 () Bool)

(declare-fun b_and!34887 () Bool)

(assert (=> start!94816 (= tp!77597 b_and!34887)))

(declare-fun mapNonEmpty!40492 () Bool)

(declare-fun mapRes!40492 () Bool)

(declare-fun tp!77596 () Bool)

(declare-fun e!612288 () Bool)

(assert (=> mapNonEmpty!40492 (= mapRes!40492 (and tp!77596 e!612288))))

(declare-datatypes ((V!39609 0))(
  ( (V!39610 (val!12978 Int)) )
))
(declare-datatypes ((ValueCell!12224 0))(
  ( (ValueCellFull!12224 (v!15595 V!39609)) (EmptyCell!12224) )
))
(declare-fun mapRest!40492 () (Array (_ BitVec 32) ValueCell!12224))

(declare-datatypes ((array!68681 0))(
  ( (array!68682 (arr!33035 (Array (_ BitVec 32) ValueCell!12224)) (size!33571 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68681)

(declare-fun mapKey!40492 () (_ BitVec 32))

(declare-fun mapValue!40492 () ValueCell!12224)

(assert (=> mapNonEmpty!40492 (= (arr!33035 _values!955) (store mapRest!40492 mapKey!40492 mapValue!40492))))

(declare-fun res!715150 () Bool)

(declare-fun e!612290 () Bool)

(assert (=> start!94816 (=> (not res!715150) (not e!612290))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94816 (= res!715150 (validMask!0 mask!1515))))

(assert (=> start!94816 e!612290))

(assert (=> start!94816 true))

(declare-fun tp_is_empty!25855 () Bool)

(assert (=> start!94816 tp_is_empty!25855))

(declare-fun e!612287 () Bool)

(declare-fun array_inv!25540 (array!68681) Bool)

(assert (=> start!94816 (and (array_inv!25540 _values!955) e!612287)))

(assert (=> start!94816 tp!77597))

(declare-datatypes ((array!68683 0))(
  ( (array!68684 (arr!33036 (Array (_ BitVec 32) (_ BitVec 64))) (size!33572 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68683)

(declare-fun array_inv!25541 (array!68683) Bool)

(assert (=> start!94816 (array_inv!25541 _keys!1163)))

(declare-fun b!1072104 () Bool)

(declare-fun e!612289 () Bool)

(assert (=> b!1072104 (= e!612289 true)))

(declare-datatypes ((tuple2!16526 0))(
  ( (tuple2!16527 (_1!8274 (_ BitVec 64)) (_2!8274 V!39609)) )
))
(declare-datatypes ((List!23061 0))(
  ( (Nil!23058) (Cons!23057 (h!24266 tuple2!16526) (t!32396 List!23061)) )
))
(declare-datatypes ((ListLongMap!14495 0))(
  ( (ListLongMap!14496 (toList!7263 List!23061)) )
))
(declare-fun lt!474918 () ListLongMap!14495)

(declare-fun lt!474920 () ListLongMap!14495)

(declare-fun -!693 (ListLongMap!14495 (_ BitVec 64)) ListLongMap!14495)

(assert (=> b!1072104 (= lt!474918 (-!693 lt!474920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474929 () ListLongMap!14495)

(declare-fun lt!474928 () ListLongMap!14495)

(assert (=> b!1072104 (= lt!474929 lt!474928)))

(declare-fun zeroValueBefore!47 () V!39609)

(declare-fun lt!474927 () ListLongMap!14495)

(declare-fun minValue!907 () V!39609)

(declare-datatypes ((Unit!35322 0))(
  ( (Unit!35323) )
))
(declare-fun lt!474926 () Unit!35322)

(declare-fun addCommutativeForDiffKeys!738 (ListLongMap!14495 (_ BitVec 64) V!39609 (_ BitVec 64) V!39609) Unit!35322)

(assert (=> b!1072104 (= lt!474926 (addCommutativeForDiffKeys!738 lt!474927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474930 () ListLongMap!14495)

(assert (=> b!1072104 (= (-!693 lt!474928 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474930)))

(declare-fun lt!474919 () tuple2!16526)

(declare-fun +!3197 (ListLongMap!14495 tuple2!16526) ListLongMap!14495)

(assert (=> b!1072104 (= lt!474928 (+!3197 lt!474930 lt!474919))))

(declare-fun lt!474922 () Unit!35322)

(declare-fun addThenRemoveForNewKeyIsSame!63 (ListLongMap!14495 (_ BitVec 64) V!39609) Unit!35322)

(assert (=> b!1072104 (= lt!474922 (addThenRemoveForNewKeyIsSame!63 lt!474930 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474921 () tuple2!16526)

(assert (=> b!1072104 (= lt!474930 (+!3197 lt!474927 lt!474921))))

(declare-fun e!612285 () Bool)

(assert (=> b!1072104 e!612285))

(declare-fun res!715148 () Bool)

(assert (=> b!1072104 (=> (not res!715148) (not e!612285))))

(assert (=> b!1072104 (= res!715148 (= lt!474920 lt!474929))))

(assert (=> b!1072104 (= lt!474929 (+!3197 (+!3197 lt!474927 lt!474919) lt!474921))))

(assert (=> b!1072104 (= lt!474921 (tuple2!16527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072104 (= lt!474919 (tuple2!16527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474925 () ListLongMap!14495)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39609)

(declare-fun getCurrentListMap!4159 (array!68683 array!68681 (_ BitVec 32) (_ BitVec 32) V!39609 V!39609 (_ BitVec 32) Int) ListLongMap!14495)

(assert (=> b!1072104 (= lt!474925 (getCurrentListMap!4159 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072104 (= lt!474920 (getCurrentListMap!4159 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072105 () Bool)

(declare-fun e!612286 () Bool)

(assert (=> b!1072105 (= e!612287 (and e!612286 mapRes!40492))))

(declare-fun condMapEmpty!40492 () Bool)

(declare-fun mapDefault!40492 () ValueCell!12224)

