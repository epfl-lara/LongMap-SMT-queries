; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70158 () Bool)

(assert start!70158)

(declare-fun b_free!12565 () Bool)

(declare-fun b_next!12565 () Bool)

(assert (=> start!70158 (= b_free!12565 (not b_next!12565))))

(declare-fun tp!44413 () Bool)

(declare-fun b_and!21345 () Bool)

(assert (=> start!70158 (= tp!44413 b_and!21345)))

(declare-fun b!815172 () Bool)

(declare-fun res!556680 () Bool)

(declare-fun e!451975 () Bool)

(assert (=> b!815172 (=> (not res!556680) (not e!451975))))

(declare-datatypes ((array!44754 0))(
  ( (array!44755 (arr!21436 (Array (_ BitVec 32) (_ BitVec 64))) (size!21857 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44754)

(declare-datatypes ((List!15253 0))(
  ( (Nil!15250) (Cons!15249 (h!16378 (_ BitVec 64)) (t!21572 List!15253)) )
))
(declare-fun arrayNoDuplicates!0 (array!44754 (_ BitVec 32) List!15253) Bool)

(assert (=> b!815172 (= res!556680 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15250))))

(declare-fun b!815173 () Bool)

(declare-fun res!556679 () Bool)

(assert (=> b!815173 (=> (not res!556679) (not e!451975))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44754 (_ BitVec 32)) Bool)

(assert (=> b!815173 (= res!556679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556678 () Bool)

(assert (=> start!70158 (=> (not res!556678) (not e!451975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70158 (= res!556678 (validMask!0 mask!1312))))

(assert (=> start!70158 e!451975))

(declare-fun tp_is_empty!14275 () Bool)

(assert (=> start!70158 tp_is_empty!14275))

(declare-fun array_inv!17151 (array!44754) Bool)

(assert (=> start!70158 (array_inv!17151 _keys!976)))

(assert (=> start!70158 true))

(declare-datatypes ((V!24035 0))(
  ( (V!24036 (val!7185 Int)) )
))
(declare-datatypes ((ValueCell!6722 0))(
  ( (ValueCellFull!6722 (v!9612 V!24035)) (EmptyCell!6722) )
))
(declare-datatypes ((array!44756 0))(
  ( (array!44757 (arr!21437 (Array (_ BitVec 32) ValueCell!6722)) (size!21858 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44756)

(declare-fun e!451974 () Bool)

(declare-fun array_inv!17152 (array!44756) Bool)

(assert (=> start!70158 (and (array_inv!17152 _values!788) e!451974)))

(assert (=> start!70158 tp!44413))

(declare-fun b!815174 () Bool)

(declare-fun e!451976 () Bool)

(assert (=> b!815174 (= e!451976 tp_is_empty!14275)))

(declare-fun mapIsEmpty!22996 () Bool)

(declare-fun mapRes!22996 () Bool)

(assert (=> mapIsEmpty!22996 mapRes!22996))

(declare-fun b!815175 () Bool)

(declare-fun res!556681 () Bool)

(assert (=> b!815175 (=> (not res!556681) (not e!451975))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815175 (= res!556681 (and (= (size!21858 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21857 _keys!976) (size!21858 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22996 () Bool)

(declare-fun tp!44412 () Bool)

(declare-fun e!451978 () Bool)

(assert (=> mapNonEmpty!22996 (= mapRes!22996 (and tp!44412 e!451978))))

(declare-fun mapValue!22996 () ValueCell!6722)

(declare-fun mapKey!22996 () (_ BitVec 32))

(declare-fun mapRest!22996 () (Array (_ BitVec 32) ValueCell!6722))

(assert (=> mapNonEmpty!22996 (= (arr!21437 _values!788) (store mapRest!22996 mapKey!22996 mapValue!22996))))

(declare-fun b!815176 () Bool)

(assert (=> b!815176 (= e!451978 tp_is_empty!14275)))

(declare-fun b!815177 () Bool)

(assert (=> b!815177 (= e!451975 (not true))))

(declare-datatypes ((tuple2!9422 0))(
  ( (tuple2!9423 (_1!4722 (_ BitVec 64)) (_2!4722 V!24035)) )
))
(declare-datatypes ((List!15254 0))(
  ( (Nil!15251) (Cons!15250 (h!16379 tuple2!9422) (t!21573 List!15254)) )
))
(declare-datatypes ((ListLongMap!8245 0))(
  ( (ListLongMap!8246 (toList!4138 List!15254)) )
))
(declare-fun lt!364936 () ListLongMap!8245)

(declare-fun lt!364935 () ListLongMap!8245)

(assert (=> b!815177 (= lt!364936 lt!364935)))

(declare-fun zeroValueBefore!34 () V!24035)

(declare-fun zeroValueAfter!34 () V!24035)

(declare-fun minValue!754 () V!24035)

(declare-datatypes ((Unit!27774 0))(
  ( (Unit!27775) )
))
(declare-fun lt!364934 () Unit!27774)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!298 (array!44754 array!44756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24035 V!24035 V!24035 V!24035 (_ BitVec 32) Int) Unit!27774)

(assert (=> b!815177 (= lt!364934 (lemmaNoChangeToArrayThenSameMapNoExtras!298 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2188 (array!44754 array!44756 (_ BitVec 32) (_ BitVec 32) V!24035 V!24035 (_ BitVec 32) Int) ListLongMap!8245)

(assert (=> b!815177 (= lt!364935 (getCurrentListMapNoExtraKeys!2188 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815177 (= lt!364936 (getCurrentListMapNoExtraKeys!2188 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815178 () Bool)

(assert (=> b!815178 (= e!451974 (and e!451976 mapRes!22996))))

(declare-fun condMapEmpty!22996 () Bool)

(declare-fun mapDefault!22996 () ValueCell!6722)

