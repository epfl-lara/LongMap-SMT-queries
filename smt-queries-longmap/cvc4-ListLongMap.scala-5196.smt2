; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70180 () Bool)

(assert start!70180)

(declare-fun b_free!12587 () Bool)

(declare-fun b_next!12587 () Bool)

(assert (=> start!70180 (= b_free!12587 (not b_next!12587))))

(declare-fun tp!44479 () Bool)

(declare-fun b_and!21367 () Bool)

(assert (=> start!70180 (= tp!44479 b_and!21367)))

(declare-fun b!815403 () Bool)

(declare-fun e!452141 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((array!44794 0))(
  ( (array!44795 (arr!21456 (Array (_ BitVec 32) (_ BitVec 64))) (size!21877 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44794)

(assert (=> b!815403 (= e!452141 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21877 _keys!976)))))))

(declare-datatypes ((V!24063 0))(
  ( (V!24064 (val!7196 Int)) )
))
(declare-datatypes ((tuple2!9438 0))(
  ( (tuple2!9439 (_1!4730 (_ BitVec 64)) (_2!4730 V!24063)) )
))
(declare-datatypes ((List!15270 0))(
  ( (Nil!15267) (Cons!15266 (h!16395 tuple2!9438) (t!21589 List!15270)) )
))
(declare-datatypes ((ListLongMap!8261 0))(
  ( (ListLongMap!8262 (toList!4146 List!15270)) )
))
(declare-fun lt!365035 () ListLongMap!8261)

(declare-fun lt!365033 () ListLongMap!8261)

(assert (=> b!815403 (= lt!365035 lt!365033)))

(declare-fun zeroValueBefore!34 () V!24063)

(declare-fun zeroValueAfter!34 () V!24063)

(declare-fun minValue!754 () V!24063)

(declare-datatypes ((ValueCell!6733 0))(
  ( (ValueCellFull!6733 (v!9623 V!24063)) (EmptyCell!6733) )
))
(declare-datatypes ((array!44796 0))(
  ( (array!44797 (arr!21457 (Array (_ BitVec 32) ValueCell!6733)) (size!21878 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44796)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27790 0))(
  ( (Unit!27791) )
))
(declare-fun lt!365034 () Unit!27790)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!306 (array!44794 array!44796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24063 V!24063 V!24063 V!24063 (_ BitVec 32) Int) Unit!27790)

(assert (=> b!815403 (= lt!365034 (lemmaNoChangeToArrayThenSameMapNoExtras!306 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2196 (array!44794 array!44796 (_ BitVec 32) (_ BitVec 32) V!24063 V!24063 (_ BitVec 32) Int) ListLongMap!8261)

(assert (=> b!815403 (= lt!365033 (getCurrentListMapNoExtraKeys!2196 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815403 (= lt!365035 (getCurrentListMapNoExtraKeys!2196 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23029 () Bool)

(declare-fun mapRes!23029 () Bool)

(assert (=> mapIsEmpty!23029 mapRes!23029))

(declare-fun b!815404 () Bool)

(declare-fun e!452143 () Bool)

(declare-fun e!452139 () Bool)

(assert (=> b!815404 (= e!452143 (and e!452139 mapRes!23029))))

(declare-fun condMapEmpty!23029 () Bool)

(declare-fun mapDefault!23029 () ValueCell!6733)

