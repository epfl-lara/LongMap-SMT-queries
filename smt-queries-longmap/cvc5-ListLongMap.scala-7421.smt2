; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94362 () Bool)

(assert start!94362)

(declare-fun b_free!21703 () Bool)

(declare-fun b_next!21703 () Bool)

(assert (=> start!94362 (= b_free!21703 (not b_next!21703))))

(declare-fun tp!76553 () Bool)

(declare-fun b_and!34487 () Bool)

(assert (=> start!94362 (= tp!76553 b_and!34487)))

(declare-fun res!712111 () Bool)

(declare-fun e!608540 () Bool)

(assert (=> start!94362 (=> (not res!712111) (not e!608540))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94362 (= res!712111 (validMask!0 mask!1515))))

(assert (=> start!94362 e!608540))

(assert (=> start!94362 true))

(declare-fun tp_is_empty!25513 () Bool)

(assert (=> start!94362 tp_is_empty!25513))

(declare-datatypes ((V!39153 0))(
  ( (V!39154 (val!12807 Int)) )
))
(declare-datatypes ((ValueCell!12053 0))(
  ( (ValueCellFull!12053 (v!15421 V!39153)) (EmptyCell!12053) )
))
(declare-datatypes ((array!68011 0))(
  ( (array!68012 (arr!32706 (Array (_ BitVec 32) ValueCell!12053)) (size!33242 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68011)

(declare-fun e!608542 () Bool)

(declare-fun array_inv!25322 (array!68011) Bool)

(assert (=> start!94362 (and (array_inv!25322 _values!955) e!608542)))

(assert (=> start!94362 tp!76553))

(declare-datatypes ((array!68013 0))(
  ( (array!68014 (arr!32707 (Array (_ BitVec 32) (_ BitVec 64))) (size!33243 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68013)

(declare-fun array_inv!25323 (array!68013) Bool)

(assert (=> start!94362 (array_inv!25323 _keys!1163)))

(declare-fun b!1067037 () Bool)

(declare-fun res!712112 () Bool)

(assert (=> b!1067037 (=> (not res!712112) (not e!608540))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067037 (= res!712112 (and (= (size!33242 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33243 _keys!1163) (size!33242 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067038 () Bool)

(declare-fun res!712110 () Bool)

(assert (=> b!1067038 (=> (not res!712110) (not e!608540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68013 (_ BitVec 32)) Bool)

(assert (=> b!1067038 (= res!712110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067039 () Bool)

(declare-fun res!712109 () Bool)

(assert (=> b!1067039 (=> (not res!712109) (not e!608540))))

(declare-datatypes ((List!22809 0))(
  ( (Nil!22806) (Cons!22805 (h!24014 (_ BitVec 64)) (t!32132 List!22809)) )
))
(declare-fun arrayNoDuplicates!0 (array!68013 (_ BitVec 32) List!22809) Bool)

(assert (=> b!1067039 (= res!712109 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22806))))

(declare-fun b!1067040 () Bool)

(declare-fun e!608544 () Bool)

(assert (=> b!1067040 (= e!608544 tp_is_empty!25513)))

(declare-fun b!1067041 () Bool)

(assert (=> b!1067041 (= e!608540 (not true))))

(declare-datatypes ((tuple2!16250 0))(
  ( (tuple2!16251 (_1!8136 (_ BitVec 64)) (_2!8136 V!39153)) )
))
(declare-datatypes ((List!22810 0))(
  ( (Nil!22807) (Cons!22806 (h!24015 tuple2!16250) (t!32133 List!22810)) )
))
(declare-datatypes ((ListLongMap!14219 0))(
  ( (ListLongMap!14220 (toList!7125 List!22810)) )
))
(declare-fun lt!471276 () ListLongMap!14219)

(declare-fun lt!471274 () ListLongMap!14219)

(assert (=> b!1067041 (= lt!471276 lt!471274)))

(declare-fun zeroValueBefore!47 () V!39153)

(declare-datatypes ((Unit!35047 0))(
  ( (Unit!35048) )
))
(declare-fun lt!471275 () Unit!35047)

(declare-fun minValue!907 () V!39153)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39153)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!746 (array!68013 array!68011 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39153 V!39153 V!39153 V!39153 (_ BitVec 32) Int) Unit!35047)

(assert (=> b!1067041 (= lt!471275 (lemmaNoChangeToArrayThenSameMapNoExtras!746 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3709 (array!68013 array!68011 (_ BitVec 32) (_ BitVec 32) V!39153 V!39153 (_ BitVec 32) Int) ListLongMap!14219)

(assert (=> b!1067041 (= lt!471274 (getCurrentListMapNoExtraKeys!3709 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067041 (= lt!471276 (getCurrentListMapNoExtraKeys!3709 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39961 () Bool)

(declare-fun mapRes!39961 () Bool)

(assert (=> mapIsEmpty!39961 mapRes!39961))

(declare-fun b!1067042 () Bool)

(declare-fun e!608543 () Bool)

(assert (=> b!1067042 (= e!608542 (and e!608543 mapRes!39961))))

(declare-fun condMapEmpty!39961 () Bool)

(declare-fun mapDefault!39961 () ValueCell!12053)

