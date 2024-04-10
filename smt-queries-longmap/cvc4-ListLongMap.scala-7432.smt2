; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94446 () Bool)

(assert start!94446)

(declare-fun b_free!21773 () Bool)

(declare-fun b_next!21773 () Bool)

(assert (=> start!94446 (= b_free!21773 (not b_next!21773))))

(declare-fun tp!76766 () Bool)

(declare-fun b_and!34565 () Bool)

(assert (=> start!94446 (= tp!76766 b_and!34565)))

(declare-fun b!1067936 () Bool)

(declare-fun e!609204 () Bool)

(declare-fun tp_is_empty!25583 () Bool)

(assert (=> b!1067936 (= e!609204 tp_is_empty!25583)))

(declare-fun b!1067937 () Bool)

(declare-fun res!712644 () Bool)

(declare-fun e!609199 () Bool)

(assert (=> b!1067937 (=> (not res!712644) (not e!609199))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39245 0))(
  ( (V!39246 (val!12842 Int)) )
))
(declare-datatypes ((ValueCell!12088 0))(
  ( (ValueCellFull!12088 (v!15456 V!39245)) (EmptyCell!12088) )
))
(declare-datatypes ((array!68149 0))(
  ( (array!68150 (arr!32774 (Array (_ BitVec 32) ValueCell!12088)) (size!33310 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68149)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68151 0))(
  ( (array!68152 (arr!32775 (Array (_ BitVec 32) (_ BitVec 64))) (size!33311 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68151)

(assert (=> b!1067937 (= res!712644 (and (= (size!33310 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33311 _keys!1163) (size!33310 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067938 () Bool)

(declare-fun e!609200 () Bool)

(assert (=> b!1067938 (= e!609200 true)))

(declare-datatypes ((tuple2!16304 0))(
  ( (tuple2!16305 (_1!8163 (_ BitVec 64)) (_2!8163 V!39245)) )
))
(declare-datatypes ((List!22859 0))(
  ( (Nil!22856) (Cons!22855 (h!24064 tuple2!16304) (t!32184 List!22859)) )
))
(declare-datatypes ((ListLongMap!14273 0))(
  ( (ListLongMap!14274 (toList!7152 List!22859)) )
))
(declare-fun lt!471711 () ListLongMap!14273)

(declare-fun -!637 (ListLongMap!14273 (_ BitVec 64)) ListLongMap!14273)

(assert (=> b!1067938 (= (-!637 lt!471711 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471711)))

(declare-datatypes ((Unit!35101 0))(
  ( (Unit!35102) )
))
(declare-fun lt!471712 () Unit!35101)

(declare-fun removeNotPresentStillSame!47 (ListLongMap!14273 (_ BitVec 64)) Unit!35101)

(assert (=> b!1067938 (= lt!471712 (removeNotPresentStillSame!47 lt!471711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!712639 () Bool)

(assert (=> start!94446 (=> (not res!712639) (not e!609199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94446 (= res!712639 (validMask!0 mask!1515))))

(assert (=> start!94446 e!609199))

(assert (=> start!94446 true))

(assert (=> start!94446 tp_is_empty!25583))

(declare-fun e!609203 () Bool)

(declare-fun array_inv!25374 (array!68149) Bool)

(assert (=> start!94446 (and (array_inv!25374 _values!955) e!609203)))

(assert (=> start!94446 tp!76766))

(declare-fun array_inv!25375 (array!68151) Bool)

(assert (=> start!94446 (array_inv!25375 _keys!1163)))

(declare-fun b!1067939 () Bool)

(declare-fun res!712643 () Bool)

(assert (=> b!1067939 (=> (not res!712643) (not e!609199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68151 (_ BitVec 32)) Bool)

(assert (=> b!1067939 (= res!712643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40069 () Bool)

(declare-fun mapRes!40069 () Bool)

(declare-fun tp!76765 () Bool)

(declare-fun e!609201 () Bool)

(assert (=> mapNonEmpty!40069 (= mapRes!40069 (and tp!76765 e!609201))))

(declare-fun mapValue!40069 () ValueCell!12088)

(declare-fun mapKey!40069 () (_ BitVec 32))

(declare-fun mapRest!40069 () (Array (_ BitVec 32) ValueCell!12088))

(assert (=> mapNonEmpty!40069 (= (arr!32774 _values!955) (store mapRest!40069 mapKey!40069 mapValue!40069))))

(declare-fun b!1067940 () Bool)

(assert (=> b!1067940 (= e!609203 (and e!609204 mapRes!40069))))

(declare-fun condMapEmpty!40069 () Bool)

(declare-fun mapDefault!40069 () ValueCell!12088)

