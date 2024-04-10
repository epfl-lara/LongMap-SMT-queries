; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70936 () Bool)

(assert start!70936)

(declare-fun b_free!13153 () Bool)

(declare-fun b_next!13153 () Bool)

(assert (=> start!70936 (= b_free!13153 (not b_next!13153))))

(declare-fun tp!46209 () Bool)

(declare-fun b_and!22049 () Bool)

(assert (=> start!70936 (= tp!46209 b_and!22049)))

(declare-fun b!823843 () Bool)

(declare-fun e!458260 () Bool)

(assert (=> b!823843 (= e!458260 (not true))))

(declare-datatypes ((V!24819 0))(
  ( (V!24820 (val!7479 Int)) )
))
(declare-datatypes ((tuple2!9892 0))(
  ( (tuple2!9893 (_1!4957 (_ BitVec 64)) (_2!4957 V!24819)) )
))
(declare-datatypes ((List!15704 0))(
  ( (Nil!15701) (Cons!15700 (h!16829 tuple2!9892) (t!22045 List!15704)) )
))
(declare-datatypes ((ListLongMap!8715 0))(
  ( (ListLongMap!8716 (toList!4373 List!15704)) )
))
(declare-fun lt!371557 () ListLongMap!8715)

(declare-fun lt!371556 () ListLongMap!8715)

(assert (=> b!823843 (= lt!371557 lt!371556)))

(declare-datatypes ((array!45916 0))(
  ( (array!45917 (arr!22006 (Array (_ BitVec 32) (_ BitVec 64))) (size!22427 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45916)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24819)

(declare-fun minValue!754 () V!24819)

(declare-datatypes ((ValueCell!7016 0))(
  ( (ValueCellFull!7016 (v!9912 V!24819)) (EmptyCell!7016) )
))
(declare-datatypes ((array!45918 0))(
  ( (array!45919 (arr!22007 (Array (_ BitVec 32) ValueCell!7016)) (size!22428 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45918)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28214 0))(
  ( (Unit!28215) )
))
(declare-fun lt!371555 () Unit!28214)

(declare-fun zeroValueBefore!34 () V!24819)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!498 (array!45916 array!45918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24819 V!24819 V!24819 V!24819 (_ BitVec 32) Int) Unit!28214)

(assert (=> b!823843 (= lt!371555 (lemmaNoChangeToArrayThenSameMapNoExtras!498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2388 (array!45916 array!45918 (_ BitVec 32) (_ BitVec 32) V!24819 V!24819 (_ BitVec 32) Int) ListLongMap!8715)

(assert (=> b!823843 (= lt!371556 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823843 (= lt!371557 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23911 () Bool)

(declare-fun mapRes!23911 () Bool)

(declare-fun tp!46210 () Bool)

(declare-fun e!458262 () Bool)

(assert (=> mapNonEmpty!23911 (= mapRes!23911 (and tp!46210 e!458262))))

(declare-fun mapRest!23911 () (Array (_ BitVec 32) ValueCell!7016))

(declare-fun mapValue!23911 () ValueCell!7016)

(declare-fun mapKey!23911 () (_ BitVec 32))

(assert (=> mapNonEmpty!23911 (= (arr!22007 _values!788) (store mapRest!23911 mapKey!23911 mapValue!23911))))

(declare-fun b!823844 () Bool)

(declare-fun e!458263 () Bool)

(declare-fun e!458259 () Bool)

(assert (=> b!823844 (= e!458263 (and e!458259 mapRes!23911))))

(declare-fun condMapEmpty!23911 () Bool)

(declare-fun mapDefault!23911 () ValueCell!7016)

