; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70138 () Bool)

(assert start!70138)

(declare-fun b_free!12545 () Bool)

(declare-fun b_next!12545 () Bool)

(assert (=> start!70138 (= b_free!12545 (not b_next!12545))))

(declare-fun tp!44352 () Bool)

(declare-fun b_and!21325 () Bool)

(assert (=> start!70138 (= tp!44352 b_and!21325)))

(declare-fun b!814962 () Bool)

(declare-fun e!451824 () Bool)

(declare-fun tp_is_empty!14255 () Bool)

(assert (=> b!814962 (= e!451824 tp_is_empty!14255)))

(declare-fun b!814963 () Bool)

(declare-fun e!451825 () Bool)

(assert (=> b!814963 (= e!451825 tp_is_empty!14255)))

(declare-fun res!556561 () Bool)

(declare-fun e!451828 () Bool)

(assert (=> start!70138 (=> (not res!556561) (not e!451828))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70138 (= res!556561 (validMask!0 mask!1312))))

(assert (=> start!70138 e!451828))

(assert (=> start!70138 tp_is_empty!14255))

(declare-datatypes ((array!44714 0))(
  ( (array!44715 (arr!21416 (Array (_ BitVec 32) (_ BitVec 64))) (size!21837 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44714)

(declare-fun array_inv!17135 (array!44714) Bool)

(assert (=> start!70138 (array_inv!17135 _keys!976)))

(assert (=> start!70138 true))

(declare-datatypes ((V!24007 0))(
  ( (V!24008 (val!7175 Int)) )
))
(declare-datatypes ((ValueCell!6712 0))(
  ( (ValueCellFull!6712 (v!9602 V!24007)) (EmptyCell!6712) )
))
(declare-datatypes ((array!44716 0))(
  ( (array!44717 (arr!21417 (Array (_ BitVec 32) ValueCell!6712)) (size!21838 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44716)

(declare-fun e!451826 () Bool)

(declare-fun array_inv!17136 (array!44716) Bool)

(assert (=> start!70138 (and (array_inv!17136 _values!788) e!451826)))

(assert (=> start!70138 tp!44352))

(declare-fun b!814964 () Bool)

(assert (=> b!814964 (= e!451828 (not true))))

(declare-datatypes ((tuple2!9406 0))(
  ( (tuple2!9407 (_1!4714 (_ BitVec 64)) (_2!4714 V!24007)) )
))
(declare-datatypes ((List!15238 0))(
  ( (Nil!15235) (Cons!15234 (h!16363 tuple2!9406) (t!21557 List!15238)) )
))
(declare-datatypes ((ListLongMap!8229 0))(
  ( (ListLongMap!8230 (toList!4130 List!15238)) )
))
(declare-fun lt!364844 () ListLongMap!8229)

(declare-fun lt!364846 () ListLongMap!8229)

(assert (=> b!814964 (= lt!364844 lt!364846)))

(declare-fun zeroValueBefore!34 () V!24007)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24007)

(declare-fun minValue!754 () V!24007)

(declare-datatypes ((Unit!27758 0))(
  ( (Unit!27759) )
))
(declare-fun lt!364845 () Unit!27758)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!290 (array!44714 array!44716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24007 V!24007 V!24007 V!24007 (_ BitVec 32) Int) Unit!27758)

(assert (=> b!814964 (= lt!364845 (lemmaNoChangeToArrayThenSameMapNoExtras!290 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2180 (array!44714 array!44716 (_ BitVec 32) (_ BitVec 32) V!24007 V!24007 (_ BitVec 32) Int) ListLongMap!8229)

(assert (=> b!814964 (= lt!364846 (getCurrentListMapNoExtraKeys!2180 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814964 (= lt!364844 (getCurrentListMapNoExtraKeys!2180 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814965 () Bool)

(declare-fun res!556560 () Bool)

(assert (=> b!814965 (=> (not res!556560) (not e!451828))))

(assert (=> b!814965 (= res!556560 (and (= (size!21838 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21837 _keys!976) (size!21838 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22966 () Bool)

(declare-fun mapRes!22966 () Bool)

(assert (=> mapIsEmpty!22966 mapRes!22966))

(declare-fun mapNonEmpty!22966 () Bool)

(declare-fun tp!44353 () Bool)

(assert (=> mapNonEmpty!22966 (= mapRes!22966 (and tp!44353 e!451825))))

(declare-fun mapKey!22966 () (_ BitVec 32))

(declare-fun mapValue!22966 () ValueCell!6712)

(declare-fun mapRest!22966 () (Array (_ BitVec 32) ValueCell!6712))

(assert (=> mapNonEmpty!22966 (= (arr!21417 _values!788) (store mapRest!22966 mapKey!22966 mapValue!22966))))

(declare-fun b!814966 () Bool)

(declare-fun res!556558 () Bool)

(assert (=> b!814966 (=> (not res!556558) (not e!451828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44714 (_ BitVec 32)) Bool)

(assert (=> b!814966 (= res!556558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814967 () Bool)

(assert (=> b!814967 (= e!451826 (and e!451824 mapRes!22966))))

(declare-fun condMapEmpty!22966 () Bool)

(declare-fun mapDefault!22966 () ValueCell!6712)

