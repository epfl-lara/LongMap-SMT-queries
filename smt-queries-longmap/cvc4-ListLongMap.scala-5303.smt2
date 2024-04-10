; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71026 () Bool)

(assert start!71026)

(declare-fun b_free!13229 () Bool)

(declare-fun b_next!13229 () Bool)

(assert (=> start!71026 (= b_free!13229 (not b_next!13229))))

(declare-fun tp!46441 () Bool)

(declare-fun b_and!22133 () Bool)

(assert (=> start!71026 (= tp!46441 b_and!22133)))

(declare-fun b!824788 () Bool)

(declare-fun e!458947 () Bool)

(declare-fun e!458946 () Bool)

(assert (=> b!824788 (= e!458947 (not e!458946))))

(declare-fun res!562300 () Bool)

(assert (=> b!824788 (=> res!562300 e!458946)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824788 (= res!562300 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24919 0))(
  ( (V!24920 (val!7517 Int)) )
))
(declare-datatypes ((tuple2!9952 0))(
  ( (tuple2!9953 (_1!4987 (_ BitVec 64)) (_2!4987 V!24919)) )
))
(declare-datatypes ((List!15759 0))(
  ( (Nil!15756) (Cons!15755 (h!16884 tuple2!9952) (t!22102 List!15759)) )
))
(declare-datatypes ((ListLongMap!8775 0))(
  ( (ListLongMap!8776 (toList!4403 List!15759)) )
))
(declare-fun lt!372001 () ListLongMap!8775)

(declare-fun lt!371999 () ListLongMap!8775)

(assert (=> b!824788 (= lt!372001 lt!371999)))

(declare-fun zeroValueBefore!34 () V!24919)

(declare-datatypes ((array!46066 0))(
  ( (array!46067 (arr!22080 (Array (_ BitVec 32) (_ BitVec 64))) (size!22501 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46066)

(declare-datatypes ((Unit!28270 0))(
  ( (Unit!28271) )
))
(declare-fun lt!372000 () Unit!28270)

(declare-fun zeroValueAfter!34 () V!24919)

(declare-fun minValue!754 () V!24919)

(declare-datatypes ((ValueCell!7054 0))(
  ( (ValueCellFull!7054 (v!9950 V!24919)) (EmptyCell!7054) )
))
(declare-datatypes ((array!46068 0))(
  ( (array!46069 (arr!22081 (Array (_ BitVec 32) ValueCell!7054)) (size!22502 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46068)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!526 (array!46066 array!46068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24919 V!24919 V!24919 V!24919 (_ BitVec 32) Int) Unit!28270)

(assert (=> b!824788 (= lt!372000 (lemmaNoChangeToArrayThenSameMapNoExtras!526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2416 (array!46066 array!46068 (_ BitVec 32) (_ BitVec 32) V!24919 V!24919 (_ BitVec 32) Int) ListLongMap!8775)

(assert (=> b!824788 (= lt!371999 (getCurrentListMapNoExtraKeys!2416 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824788 (= lt!372001 (getCurrentListMapNoExtraKeys!2416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824789 () Bool)

(assert (=> b!824789 (= e!458946 true)))

(declare-fun lt!372002 () ListLongMap!8775)

(declare-fun getCurrentListMap!2541 (array!46066 array!46068 (_ BitVec 32) (_ BitVec 32) V!24919 V!24919 (_ BitVec 32) Int) ListLongMap!8775)

(assert (=> b!824789 (= lt!372002 (getCurrentListMap!2541 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824790 () Bool)

(declare-fun res!562298 () Bool)

(assert (=> b!824790 (=> (not res!562298) (not e!458947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46066 (_ BitVec 32)) Bool)

(assert (=> b!824790 (= res!562298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24028 () Bool)

(declare-fun mapRes!24028 () Bool)

(assert (=> mapIsEmpty!24028 mapRes!24028))

(declare-fun b!824791 () Bool)

(declare-fun e!458949 () Bool)

(declare-fun e!458950 () Bool)

(assert (=> b!824791 (= e!458949 (and e!458950 mapRes!24028))))

(declare-fun condMapEmpty!24028 () Bool)

(declare-fun mapDefault!24028 () ValueCell!7054)

