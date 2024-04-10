; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71074 () Bool)

(assert start!71074)

(declare-fun b_free!13261 () Bool)

(declare-fun b_next!13261 () Bool)

(assert (=> start!71074 (= b_free!13261 (not b_next!13261))))

(declare-fun tp!46539 () Bool)

(declare-fun b_and!22175 () Bool)

(assert (=> start!71074 (= tp!46539 b_and!22175)))

(declare-fun b!825378 () Bool)

(declare-fun res!562654 () Bool)

(declare-fun e!459386 () Bool)

(assert (=> b!825378 (=> (not res!562654) (not e!459386))))

(declare-datatypes ((array!46126 0))(
  ( (array!46127 (arr!22109 (Array (_ BitVec 32) (_ BitVec 64))) (size!22530 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46126)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24963 0))(
  ( (V!24964 (val!7533 Int)) )
))
(declare-datatypes ((ValueCell!7070 0))(
  ( (ValueCellFull!7070 (v!9966 V!24963)) (EmptyCell!7070) )
))
(declare-datatypes ((array!46128 0))(
  ( (array!46129 (arr!22110 (Array (_ BitVec 32) ValueCell!7070)) (size!22531 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46128)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825378 (= res!562654 (and (= (size!22531 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22530 _keys!976) (size!22531 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24079 () Bool)

(declare-fun mapRes!24079 () Bool)

(assert (=> mapIsEmpty!24079 mapRes!24079))

(declare-fun b!825379 () Bool)

(declare-fun e!459391 () Bool)

(assert (=> b!825379 (= e!459386 (not e!459391))))

(declare-fun res!562658 () Bool)

(assert (=> b!825379 (=> res!562658 e!459391)))

(assert (=> b!825379 (= res!562658 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9970 0))(
  ( (tuple2!9971 (_1!4996 (_ BitVec 64)) (_2!4996 V!24963)) )
))
(declare-datatypes ((List!15776 0))(
  ( (Nil!15773) (Cons!15772 (h!16901 tuple2!9970) (t!22121 List!15776)) )
))
(declare-datatypes ((ListLongMap!8793 0))(
  ( (ListLongMap!8794 (toList!4412 List!15776)) )
))
(declare-fun lt!372587 () ListLongMap!8793)

(declare-fun lt!372596 () ListLongMap!8793)

(assert (=> b!825379 (= lt!372587 lt!372596)))

(declare-fun zeroValueBefore!34 () V!24963)

(declare-fun zeroValueAfter!34 () V!24963)

(declare-fun minValue!754 () V!24963)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28289 0))(
  ( (Unit!28290) )
))
(declare-fun lt!372598 () Unit!28289)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!535 (array!46126 array!46128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 V!24963 V!24963 (_ BitVec 32) Int) Unit!28289)

(assert (=> b!825379 (= lt!372598 (lemmaNoChangeToArrayThenSameMapNoExtras!535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2425 (array!46126 array!46128 (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 (_ BitVec 32) Int) ListLongMap!8793)

(assert (=> b!825379 (= lt!372596 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825379 (= lt!372587 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825380 () Bool)

(declare-fun e!459389 () Bool)

(declare-fun e!459392 () Bool)

(assert (=> b!825380 (= e!459389 (and e!459392 mapRes!24079))))

(declare-fun condMapEmpty!24079 () Bool)

(declare-fun mapDefault!24079 () ValueCell!7070)

