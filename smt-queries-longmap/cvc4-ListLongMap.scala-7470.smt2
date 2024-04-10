; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94748 () Bool)

(assert start!94748)

(declare-fun b_free!22001 () Bool)

(declare-fun b_next!22001 () Bool)

(assert (=> start!94748 (= b_free!22001 (not b_next!22001))))

(declare-fun tp!77462 () Bool)

(declare-fun b_and!34831 () Bool)

(assert (=> start!94748 (= tp!77462 b_and!34831)))

(declare-fun b!1071318 () Bool)

(declare-datatypes ((V!39549 0))(
  ( (V!39550 (val!12956 Int)) )
))
(declare-datatypes ((tuple2!16490 0))(
  ( (tuple2!16491 (_1!8256 (_ BitVec 64)) (_2!8256 V!39549)) )
))
(declare-datatypes ((List!23031 0))(
  ( (Nil!23028) (Cons!23027 (h!24236 tuple2!16490) (t!32364 List!23031)) )
))
(declare-datatypes ((ListLongMap!14459 0))(
  ( (ListLongMap!14460 (toList!7245 List!23031)) )
))
(declare-fun lt!473915 () ListLongMap!14459)

(declare-fun lt!473912 () tuple2!16490)

(declare-fun e!611704 () Bool)

(declare-fun lt!473910 () ListLongMap!14459)

(declare-fun +!3180 (ListLongMap!14459 tuple2!16490) ListLongMap!14459)

(assert (=> b!1071318 (= e!611704 (= lt!473915 (+!3180 lt!473910 lt!473912)))))

(declare-fun b!1071319 () Bool)

(declare-fun res!714659 () Bool)

(declare-fun e!611699 () Bool)

(assert (=> b!1071319 (=> (not res!714659) (not e!611699))))

(declare-datatypes ((array!68597 0))(
  ( (array!68598 (arr!32994 (Array (_ BitVec 32) (_ BitVec 64))) (size!33530 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68597)

(declare-datatypes ((List!23032 0))(
  ( (Nil!23029) (Cons!23028 (h!24237 (_ BitVec 64)) (t!32365 List!23032)) )
))
(declare-fun arrayNoDuplicates!0 (array!68597 (_ BitVec 32) List!23032) Bool)

(assert (=> b!1071319 (= res!714659 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23029))))

(declare-fun b!1071320 () Bool)

(declare-fun res!714663 () Bool)

(assert (=> b!1071320 (=> (not res!714663) (not e!611699))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12202 0))(
  ( (ValueCellFull!12202 (v!15572 V!39549)) (EmptyCell!12202) )
))
(declare-datatypes ((array!68599 0))(
  ( (array!68600 (arr!32995 (Array (_ BitVec 32) ValueCell!12202)) (size!33531 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68599)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071320 (= res!714663 (and (= (size!33531 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33530 _keys!1163) (size!33531 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071321 () Bool)

(declare-fun e!611705 () Bool)

(assert (=> b!1071321 (= e!611699 (not e!611705))))

(declare-fun res!714660 () Bool)

(assert (=> b!1071321 (=> res!714660 e!611705)))

(assert (=> b!1071321 (= res!714660 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473911 () ListLongMap!14459)

(assert (=> b!1071321 (= lt!473911 lt!473910)))

(declare-fun zeroValueBefore!47 () V!39549)

(declare-fun minValue!907 () V!39549)

(declare-datatypes ((Unit!35286 0))(
  ( (Unit!35287) )
))
(declare-fun lt!473914 () Unit!35286)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39549)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!853 (array!68597 array!68599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39549 V!39549 V!39549 V!39549 (_ BitVec 32) Int) Unit!35286)

(assert (=> b!1071321 (= lt!473914 (lemmaNoChangeToArrayThenSameMapNoExtras!853 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3816 (array!68597 array!68599 (_ BitVec 32) (_ BitVec 32) V!39549 V!39549 (_ BitVec 32) Int) ListLongMap!14459)

(assert (=> b!1071321 (= lt!473910 (getCurrentListMapNoExtraKeys!3816 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071321 (= lt!473911 (getCurrentListMapNoExtraKeys!3816 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071322 () Bool)

(declare-fun e!611700 () Bool)

(declare-fun tp_is_empty!25811 () Bool)

(assert (=> b!1071322 (= e!611700 tp_is_empty!25811)))

(declare-fun mapIsEmpty!40423 () Bool)

(declare-fun mapRes!40423 () Bool)

(assert (=> mapIsEmpty!40423 mapRes!40423))

(declare-fun b!1071324 () Bool)

(declare-fun e!611703 () Bool)

(assert (=> b!1071324 (= e!611703 (and e!611700 mapRes!40423))))

(declare-fun condMapEmpty!40423 () Bool)

(declare-fun mapDefault!40423 () ValueCell!12202)

