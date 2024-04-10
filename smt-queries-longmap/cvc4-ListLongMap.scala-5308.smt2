; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71072 () Bool)

(assert start!71072)

(declare-fun b_free!13259 () Bool)

(declare-fun b_next!13259 () Bool)

(assert (=> start!71072 (= b_free!13259 (not b_next!13259))))

(declare-fun tp!46534 () Bool)

(declare-fun b_and!22173 () Bool)

(assert (=> start!71072 (= tp!46534 b_and!22173)))

(declare-fun b!825348 () Bool)

(declare-fun e!459369 () Bool)

(declare-fun e!459363 () Bool)

(assert (=> b!825348 (= e!459369 (not e!459363))))

(declare-fun res!562633 () Bool)

(assert (=> b!825348 (=> res!562633 e!459363)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825348 (= res!562633 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24959 0))(
  ( (V!24960 (val!7532 Int)) )
))
(declare-datatypes ((tuple2!9968 0))(
  ( (tuple2!9969 (_1!4995 (_ BitVec 64)) (_2!4995 V!24959)) )
))
(declare-datatypes ((List!15774 0))(
  ( (Nil!15771) (Cons!15770 (h!16899 tuple2!9968) (t!22119 List!15774)) )
))
(declare-datatypes ((ListLongMap!8791 0))(
  ( (ListLongMap!8792 (toList!4411 List!15774)) )
))
(declare-fun lt!372553 () ListLongMap!8791)

(declare-fun lt!372549 () ListLongMap!8791)

(assert (=> b!825348 (= lt!372553 lt!372549)))

(declare-fun zeroValueBefore!34 () V!24959)

(declare-datatypes ((array!46122 0))(
  ( (array!46123 (arr!22107 (Array (_ BitVec 32) (_ BitVec 64))) (size!22528 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46122)

(declare-fun zeroValueAfter!34 () V!24959)

(declare-fun minValue!754 () V!24959)

(declare-datatypes ((ValueCell!7069 0))(
  ( (ValueCellFull!7069 (v!9965 V!24959)) (EmptyCell!7069) )
))
(declare-datatypes ((array!46124 0))(
  ( (array!46125 (arr!22108 (Array (_ BitVec 32) ValueCell!7069)) (size!22529 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46124)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28287 0))(
  ( (Unit!28288) )
))
(declare-fun lt!372555 () Unit!28287)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!534 (array!46122 array!46124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24959 V!24959 V!24959 V!24959 (_ BitVec 32) Int) Unit!28287)

(assert (=> b!825348 (= lt!372555 (lemmaNoChangeToArrayThenSameMapNoExtras!534 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2424 (array!46122 array!46124 (_ BitVec 32) (_ BitVec 32) V!24959 V!24959 (_ BitVec 32) Int) ListLongMap!8791)

(assert (=> b!825348 (= lt!372549 (getCurrentListMapNoExtraKeys!2424 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825348 (= lt!372553 (getCurrentListMapNoExtraKeys!2424 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825349 () Bool)

(declare-fun res!562636 () Bool)

(assert (=> b!825349 (=> (not res!562636) (not e!459369))))

(declare-datatypes ((List!15775 0))(
  ( (Nil!15772) (Cons!15771 (h!16900 (_ BitVec 64)) (t!22120 List!15775)) )
))
(declare-fun arrayNoDuplicates!0 (array!46122 (_ BitVec 32) List!15775) Bool)

(assert (=> b!825349 (= res!562636 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15772))))

(declare-fun b!825350 () Bool)

(declare-fun e!459367 () Bool)

(declare-fun e!459366 () Bool)

(declare-fun mapRes!24076 () Bool)

(assert (=> b!825350 (= e!459367 (and e!459366 mapRes!24076))))

(declare-fun condMapEmpty!24076 () Bool)

(declare-fun mapDefault!24076 () ValueCell!7069)

