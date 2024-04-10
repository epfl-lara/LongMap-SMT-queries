; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95070 () Bool)

(assert start!95070)

(declare-fun b_free!22187 () Bool)

(declare-fun b_next!22187 () Bool)

(assert (=> start!95070 (= b_free!22187 (not b_next!22187))))

(declare-fun tp!78040 () Bool)

(declare-fun b_and!35095 () Bool)

(assert (=> start!95070 (= tp!78040 b_and!35095)))

(declare-fun b!1074758 () Bool)

(declare-fun e!614165 () Bool)

(declare-fun e!614164 () Bool)

(assert (=> b!1074758 (= e!614165 (not e!614164))))

(declare-fun res!716599 () Bool)

(assert (=> b!1074758 (=> res!716599 e!614164)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074758 (= res!716599 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39797 0))(
  ( (V!39798 (val!13049 Int)) )
))
(declare-datatypes ((tuple2!16624 0))(
  ( (tuple2!16625 (_1!8323 (_ BitVec 64)) (_2!8323 V!39797)) )
))
(declare-datatypes ((List!23160 0))(
  ( (Nil!23157) (Cons!23156 (h!24365 tuple2!16624) (t!32507 List!23160)) )
))
(declare-datatypes ((ListLongMap!14593 0))(
  ( (ListLongMap!14594 (toList!7312 List!23160)) )
))
(declare-fun lt!476860 () ListLongMap!14593)

(declare-fun lt!476859 () ListLongMap!14593)

(assert (=> b!1074758 (= lt!476860 lt!476859)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39797)

(declare-datatypes ((Unit!35389 0))(
  ( (Unit!35390) )
))
(declare-fun lt!476861 () Unit!35389)

(declare-datatypes ((ValueCell!12295 0))(
  ( (ValueCellFull!12295 (v!15671 V!39797)) (EmptyCell!12295) )
))
(declare-datatypes ((array!68961 0))(
  ( (array!68962 (arr!33169 (Array (_ BitVec 32) ValueCell!12295)) (size!33705 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68961)

(declare-fun minValue!907 () V!39797)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39797)

(declare-datatypes ((array!68963 0))(
  ( (array!68964 (arr!33170 (Array (_ BitVec 32) (_ BitVec 64))) (size!33706 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!891 (array!68963 array!68961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39797 V!39797 V!39797 V!39797 (_ BitVec 32) Int) Unit!35389)

(assert (=> b!1074758 (= lt!476861 (lemmaNoChangeToArrayThenSameMapNoExtras!891 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3875 (array!68963 array!68961 (_ BitVec 32) (_ BitVec 32) V!39797 V!39797 (_ BitVec 32) Int) ListLongMap!14593)

(assert (=> b!1074758 (= lt!476859 (getCurrentListMapNoExtraKeys!3875 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074758 (= lt!476860 (getCurrentListMapNoExtraKeys!3875 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074759 () Bool)

(declare-fun res!716601 () Bool)

(assert (=> b!1074759 (=> (not res!716601) (not e!614165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68963 (_ BitVec 32)) Bool)

(assert (=> b!1074759 (= res!716601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074760 () Bool)

(declare-fun e!614162 () Bool)

(declare-fun e!614161 () Bool)

(declare-fun mapRes!40723 () Bool)

(assert (=> b!1074760 (= e!614162 (and e!614161 mapRes!40723))))

(declare-fun condMapEmpty!40723 () Bool)

(declare-fun mapDefault!40723 () ValueCell!12295)

