; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94308 () Bool)

(assert start!94308)

(declare-fun b_free!21671 () Bool)

(declare-fun b_next!21671 () Bool)

(assert (=> start!94308 (= b_free!21671 (not b_next!21671))))

(declare-fun tp!76454 () Bool)

(declare-fun b_and!34443 () Bool)

(assert (=> start!94308 (= tp!76454 b_and!34443)))

(declare-fun b!1066489 () Bool)

(declare-fun e!608158 () Bool)

(declare-fun e!608155 () Bool)

(assert (=> b!1066489 (= e!608158 (not e!608155))))

(declare-fun res!711810 () Bool)

(assert (=> b!1066489 (=> res!711810 e!608155)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066489 (= res!711810 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39109 0))(
  ( (V!39110 (val!12791 Int)) )
))
(declare-datatypes ((tuple2!16222 0))(
  ( (tuple2!16223 (_1!8122 (_ BitVec 64)) (_2!8122 V!39109)) )
))
(declare-datatypes ((List!22786 0))(
  ( (Nil!22783) (Cons!22782 (h!23991 tuple2!16222) (t!32107 List!22786)) )
))
(declare-datatypes ((ListLongMap!14191 0))(
  ( (ListLongMap!14192 (toList!7111 List!22786)) )
))
(declare-fun lt!470859 () ListLongMap!14191)

(declare-fun lt!470856 () ListLongMap!14191)

(assert (=> b!1066489 (= lt!470859 lt!470856)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39109)

(declare-datatypes ((ValueCell!12037 0))(
  ( (ValueCellFull!12037 (v!15404 V!39109)) (EmptyCell!12037) )
))
(declare-datatypes ((array!67947 0))(
  ( (array!67948 (arr!32675 (Array (_ BitVec 32) ValueCell!12037)) (size!33211 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67947)

(declare-fun minValue!907 () V!39109)

(declare-datatypes ((Unit!35017 0))(
  ( (Unit!35018) )
))
(declare-fun lt!470854 () Unit!35017)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39109)

(declare-datatypes ((array!67949 0))(
  ( (array!67950 (arr!32676 (Array (_ BitVec 32) (_ BitVec 64))) (size!33212 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67949)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!734 (array!67949 array!67947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39109 V!39109 V!39109 V!39109 (_ BitVec 32) Int) Unit!35017)

(assert (=> b!1066489 (= lt!470854 (lemmaNoChangeToArrayThenSameMapNoExtras!734 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3697 (array!67949 array!67947 (_ BitVec 32) (_ BitVec 32) V!39109 V!39109 (_ BitVec 32) Int) ListLongMap!14191)

(assert (=> b!1066489 (= lt!470856 (getCurrentListMapNoExtraKeys!3697 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066489 (= lt!470859 (getCurrentListMapNoExtraKeys!3697 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066490 () Bool)

(declare-fun e!608153 () Bool)

(declare-fun e!608157 () Bool)

(declare-fun mapRes!39910 () Bool)

(assert (=> b!1066490 (= e!608153 (and e!608157 mapRes!39910))))

(declare-fun condMapEmpty!39910 () Bool)

(declare-fun mapDefault!39910 () ValueCell!12037)

