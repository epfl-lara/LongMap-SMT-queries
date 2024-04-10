; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94820 () Bool)

(assert start!94820)

(declare-fun b_free!22049 () Bool)

(declare-fun b_next!22049 () Bool)

(assert (=> start!94820 (= b_free!22049 (not b_next!22049))))

(declare-fun tp!77608 () Bool)

(declare-fun b_and!34891 () Bool)

(assert (=> start!94820 (= tp!77608 b_and!34891)))

(declare-fun b!1072158 () Bool)

(declare-fun e!612327 () Bool)

(declare-fun tp_is_empty!25859 () Bool)

(assert (=> b!1072158 (= e!612327 tp_is_empty!25859)))

(declare-fun b!1072159 () Bool)

(declare-fun res!715183 () Bool)

(declare-fun e!612328 () Bool)

(assert (=> b!1072159 (=> (not res!715183) (not e!612328))))

(declare-datatypes ((array!68689 0))(
  ( (array!68690 (arr!33039 (Array (_ BitVec 32) (_ BitVec 64))) (size!33575 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68689)

(declare-datatypes ((List!23064 0))(
  ( (Nil!23061) (Cons!23060 (h!24269 (_ BitVec 64)) (t!32399 List!23064)) )
))
(declare-fun arrayNoDuplicates!0 (array!68689 (_ BitVec 32) List!23064) Bool)

(assert (=> b!1072159 (= res!715183 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23061))))

(declare-fun b!1072160 () Bool)

(declare-fun res!715185 () Bool)

(assert (=> b!1072160 (=> (not res!715185) (not e!612328))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39613 0))(
  ( (V!39614 (val!12980 Int)) )
))
(declare-datatypes ((ValueCell!12226 0))(
  ( (ValueCellFull!12226 (v!15597 V!39613)) (EmptyCell!12226) )
))
(declare-datatypes ((array!68691 0))(
  ( (array!68692 (arr!33040 (Array (_ BitVec 32) ValueCell!12226)) (size!33576 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68691)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072160 (= res!715185 (and (= (size!33576 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33575 _keys!1163) (size!33576 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072161 () Bool)

(declare-fun res!715186 () Bool)

(assert (=> b!1072161 (=> (not res!715186) (not e!612328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68689 (_ BitVec 32)) Bool)

(assert (=> b!1072161 (= res!715186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-datatypes ((tuple2!16530 0))(
  ( (tuple2!16531 (_1!8276 (_ BitVec 64)) (_2!8276 V!39613)) )
))
(declare-datatypes ((List!23065 0))(
  ( (Nil!23062) (Cons!23061 (h!24270 tuple2!16530) (t!32400 List!23065)) )
))
(declare-datatypes ((ListLongMap!14499 0))(
  ( (ListLongMap!14500 (toList!7265 List!23065)) )
))
(declare-fun lt!474996 () ListLongMap!14499)

(declare-fun lt!475008 () ListLongMap!14499)

(declare-fun lt!475007 () tuple2!16530)

(declare-fun b!1072163 () Bool)

(declare-fun e!612329 () Bool)

(declare-fun +!3199 (ListLongMap!14499 tuple2!16530) ListLongMap!14499)

(assert (=> b!1072163 (= e!612329 (= lt!474996 (+!3199 lt!475008 lt!475007)))))

(declare-fun b!1072164 () Bool)

(declare-fun e!612331 () Bool)

(declare-fun e!612332 () Bool)

(declare-fun mapRes!40498 () Bool)

(assert (=> b!1072164 (= e!612331 (and e!612332 mapRes!40498))))

(declare-fun condMapEmpty!40498 () Bool)

(declare-fun mapDefault!40498 () ValueCell!12226)

