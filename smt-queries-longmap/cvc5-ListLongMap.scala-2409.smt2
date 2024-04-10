; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38138 () Bool)

(assert start!38138)

(declare-fun b_free!9019 () Bool)

(declare-fun b_next!9019 () Bool)

(assert (=> start!38138 (= b_free!9019 (not b_next!9019))))

(declare-fun tp!31839 () Bool)

(declare-fun b_and!16381 () Bool)

(assert (=> start!38138 (= tp!31839 b_and!16381)))

(declare-fun res!225036 () Bool)

(declare-fun e!237946 () Bool)

(assert (=> start!38138 (=> (not res!225036) (not e!237946))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38138 (= res!225036 (validMask!0 mask!970))))

(assert (=> start!38138 e!237946))

(declare-datatypes ((V!14027 0))(
  ( (V!14028 (val!4890 Int)) )
))
(declare-datatypes ((ValueCell!4502 0))(
  ( (ValueCellFull!4502 (v!7127 V!14027)) (EmptyCell!4502) )
))
(declare-datatypes ((array!23291 0))(
  ( (array!23292 (arr!11104 (Array (_ BitVec 32) ValueCell!4502)) (size!11456 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23291)

(declare-fun e!237947 () Bool)

(declare-fun array_inv!8156 (array!23291) Bool)

(assert (=> start!38138 (and (array_inv!8156 _values!506) e!237947)))

(assert (=> start!38138 tp!31839))

(assert (=> start!38138 true))

(declare-fun tp_is_empty!9691 () Bool)

(assert (=> start!38138 tp_is_empty!9691))

(declare-datatypes ((array!23293 0))(
  ( (array!23294 (arr!11105 (Array (_ BitVec 32) (_ BitVec 64))) (size!11457 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23293)

(declare-fun array_inv!8157 (array!23293) Bool)

(assert (=> start!38138 (array_inv!8157 _keys!658)))

(declare-fun mapIsEmpty!16131 () Bool)

(declare-fun mapRes!16131 () Bool)

(assert (=> mapIsEmpty!16131 mapRes!16131))

(declare-fun b!392939 () Bool)

(declare-fun res!225035 () Bool)

(assert (=> b!392939 (=> (not res!225035) (not e!237946))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392939 (= res!225035 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!392940 () Bool)

(declare-fun e!237944 () Bool)

(assert (=> b!392940 (= e!237947 (and e!237944 mapRes!16131))))

(declare-fun condMapEmpty!16131 () Bool)

(declare-fun mapDefault!16131 () ValueCell!4502)

