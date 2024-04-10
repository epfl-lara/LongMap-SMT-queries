; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71256 () Bool)

(assert start!71256)

(declare-fun b_free!13403 () Bool)

(declare-fun b_next!13403 () Bool)

(assert (=> start!71256 (= b_free!13403 (not b_next!13403))))

(declare-fun tp!46971 () Bool)

(declare-fun b_and!22341 () Bool)

(assert (=> start!71256 (= tp!46971 b_and!22341)))

(declare-fun b!827681 () Bool)

(declare-fun res!564113 () Bool)

(declare-fun e!461113 () Bool)

(assert (=> b!827681 (=> (not res!564113) (not e!461113))))

(declare-datatypes ((array!46394 0))(
  ( (array!46395 (arr!22241 (Array (_ BitVec 32) (_ BitVec 64))) (size!22662 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46394)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25151 0))(
  ( (V!25152 (val!7604 Int)) )
))
(declare-datatypes ((ValueCell!7141 0))(
  ( (ValueCellFull!7141 (v!10039 V!25151)) (EmptyCell!7141) )
))
(declare-datatypes ((array!46396 0))(
  ( (array!46397 (arr!22242 (Array (_ BitVec 32) ValueCell!7141)) (size!22663 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46396)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827681 (= res!564113 (and (= (size!22663 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22662 _keys!976) (size!22663 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827682 () Bool)

(assert (=> b!827682 (= e!461113 false)))

(declare-datatypes ((tuple2!10080 0))(
  ( (tuple2!10081 (_1!5051 (_ BitVec 64)) (_2!5051 V!25151)) )
))
(declare-datatypes ((List!15875 0))(
  ( (Nil!15872) (Cons!15871 (h!17000 tuple2!10080) (t!22224 List!15875)) )
))
(declare-datatypes ((ListLongMap!8903 0))(
  ( (ListLongMap!8904 (toList!4467 List!15875)) )
))
(declare-fun lt!374975 () ListLongMap!8903)

(declare-fun zeroValueAfter!34 () V!25151)

(declare-fun minValue!754 () V!25151)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2469 (array!46394 array!46396 (_ BitVec 32) (_ BitVec 32) V!25151 V!25151 (_ BitVec 32) Int) ListLongMap!8903)

(assert (=> b!827682 (= lt!374975 (getCurrentListMapNoExtraKeys!2469 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374974 () ListLongMap!8903)

(declare-fun zeroValueBefore!34 () V!25151)

(assert (=> b!827682 (= lt!374974 (getCurrentListMapNoExtraKeys!2469 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24298 () Bool)

(declare-fun mapRes!24298 () Bool)

(assert (=> mapIsEmpty!24298 mapRes!24298))

(declare-fun b!827683 () Bool)

(declare-fun e!461114 () Bool)

(declare-fun tp_is_empty!15113 () Bool)

(assert (=> b!827683 (= e!461114 tp_is_empty!15113)))

(declare-fun b!827684 () Bool)

(declare-fun e!461112 () Bool)

(declare-fun e!461111 () Bool)

(assert (=> b!827684 (= e!461112 (and e!461111 mapRes!24298))))

(declare-fun condMapEmpty!24298 () Bool)

(declare-fun mapDefault!24298 () ValueCell!7141)

