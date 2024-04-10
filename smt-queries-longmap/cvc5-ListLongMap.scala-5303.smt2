; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71022 () Bool)

(assert start!71022)

(declare-fun b_free!13225 () Bool)

(declare-fun b_next!13225 () Bool)

(assert (=> start!71022 (= b_free!13225 (not b_next!13225))))

(declare-fun tp!46428 () Bool)

(declare-fun b_and!22129 () Bool)

(assert (=> start!71022 (= tp!46428 b_and!22129)))

(declare-fun b!824740 () Bool)

(declare-fun e!458915 () Bool)

(declare-fun e!458912 () Bool)

(assert (=> b!824740 (= e!458915 (not e!458912))))

(declare-fun res!562268 () Bool)

(assert (=> b!824740 (=> res!562268 e!458912)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824740 (= res!562268 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24915 0))(
  ( (V!24916 (val!7515 Int)) )
))
(declare-datatypes ((tuple2!9948 0))(
  ( (tuple2!9949 (_1!4985 (_ BitVec 64)) (_2!4985 V!24915)) )
))
(declare-datatypes ((List!15756 0))(
  ( (Nil!15753) (Cons!15752 (h!16881 tuple2!9948) (t!22099 List!15756)) )
))
(declare-datatypes ((ListLongMap!8771 0))(
  ( (ListLongMap!8772 (toList!4401 List!15756)) )
))
(declare-fun lt!371975 () ListLongMap!8771)

(declare-fun lt!371976 () ListLongMap!8771)

(assert (=> b!824740 (= lt!371975 lt!371976)))

(declare-fun zeroValueBefore!34 () V!24915)

(declare-datatypes ((array!46058 0))(
  ( (array!46059 (arr!22076 (Array (_ BitVec 32) (_ BitVec 64))) (size!22497 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46058)

(declare-fun zeroValueAfter!34 () V!24915)

(declare-fun minValue!754 () V!24915)

(declare-datatypes ((ValueCell!7052 0))(
  ( (ValueCellFull!7052 (v!9948 V!24915)) (EmptyCell!7052) )
))
(declare-datatypes ((array!46060 0))(
  ( (array!46061 (arr!22077 (Array (_ BitVec 32) ValueCell!7052)) (size!22498 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46060)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28266 0))(
  ( (Unit!28267) )
))
(declare-fun lt!371977 () Unit!28266)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!524 (array!46058 array!46060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 V!24915 V!24915 (_ BitVec 32) Int) Unit!28266)

(assert (=> b!824740 (= lt!371977 (lemmaNoChangeToArrayThenSameMapNoExtras!524 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2414 (array!46058 array!46060 (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 (_ BitVec 32) Int) ListLongMap!8771)

(assert (=> b!824740 (= lt!371976 (getCurrentListMapNoExtraKeys!2414 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824740 (= lt!371975 (getCurrentListMapNoExtraKeys!2414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824741 () Bool)

(declare-fun e!458910 () Bool)

(declare-fun e!458914 () Bool)

(declare-fun mapRes!24022 () Bool)

(assert (=> b!824741 (= e!458910 (and e!458914 mapRes!24022))))

(declare-fun condMapEmpty!24022 () Bool)

(declare-fun mapDefault!24022 () ValueCell!7052)

