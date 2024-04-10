; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71292 () Bool)

(assert start!71292)

(declare-fun b_free!13427 () Bool)

(declare-fun b_next!13427 () Bool)

(assert (=> start!71292 (= b_free!13427 (not b_next!13427))))

(declare-fun tp!47046 () Bool)

(declare-fun b_and!22373 () Bool)

(assert (=> start!71292 (= tp!47046 b_and!22373)))

(declare-fun b!828025 () Bool)

(declare-fun e!461355 () Bool)

(declare-fun e!461354 () Bool)

(assert (=> b!828025 (= e!461355 (not e!461354))))

(declare-fun res!564300 () Bool)

(assert (=> b!828025 (=> res!564300 e!461354)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828025 (= res!564300 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!25183 0))(
  ( (V!25184 (val!7616 Int)) )
))
(declare-datatypes ((tuple2!10098 0))(
  ( (tuple2!10099 (_1!5060 (_ BitVec 64)) (_2!5060 V!25183)) )
))
(declare-datatypes ((List!15890 0))(
  ( (Nil!15887) (Cons!15886 (h!17015 tuple2!10098) (t!22241 List!15890)) )
))
(declare-datatypes ((ListLongMap!8921 0))(
  ( (ListLongMap!8922 (toList!4476 List!15890)) )
))
(declare-fun lt!375092 () ListLongMap!8921)

(declare-fun lt!375091 () ListLongMap!8921)

(assert (=> b!828025 (= lt!375092 lt!375091)))

(declare-fun zeroValueBefore!34 () V!25183)

(declare-datatypes ((array!46438 0))(
  ( (array!46439 (arr!22262 (Array (_ BitVec 32) (_ BitVec 64))) (size!22683 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46438)

(declare-fun zeroValueAfter!34 () V!25183)

(declare-fun minValue!754 () V!25183)

(declare-datatypes ((ValueCell!7153 0))(
  ( (ValueCellFull!7153 (v!10051 V!25183)) (EmptyCell!7153) )
))
(declare-datatypes ((array!46440 0))(
  ( (array!46441 (arr!22263 (Array (_ BitVec 32) ValueCell!7153)) (size!22684 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46440)

(declare-datatypes ((Unit!28369 0))(
  ( (Unit!28370) )
))
(declare-fun lt!375093 () Unit!28369)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!566 (array!46438 array!46440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25183 V!25183 V!25183 V!25183 (_ BitVec 32) Int) Unit!28369)

(assert (=> b!828025 (= lt!375093 (lemmaNoChangeToArrayThenSameMapNoExtras!566 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2478 (array!46438 array!46440 (_ BitVec 32) (_ BitVec 32) V!25183 V!25183 (_ BitVec 32) Int) ListLongMap!8921)

(assert (=> b!828025 (= lt!375091 (getCurrentListMapNoExtraKeys!2478 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828025 (= lt!375092 (getCurrentListMapNoExtraKeys!2478 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828026 () Bool)

(declare-fun e!461358 () Bool)

(declare-fun e!461353 () Bool)

(declare-fun mapRes!24337 () Bool)

(assert (=> b!828026 (= e!461358 (and e!461353 mapRes!24337))))

(declare-fun condMapEmpty!24337 () Bool)

(declare-fun mapDefault!24337 () ValueCell!7153)

