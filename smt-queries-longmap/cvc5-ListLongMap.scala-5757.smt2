; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74370 () Bool)

(assert start!74370)

(declare-fun b_free!15133 () Bool)

(declare-fun b_next!15133 () Bool)

(assert (=> start!74370 (= b_free!15133 (not b_next!15133))))

(declare-fun tp!53073 () Bool)

(declare-fun b_and!24909 () Bool)

(assert (=> start!74370 (= tp!53073 b_and!24909)))

(declare-fun b!875512 () Bool)

(declare-fun e!487398 () Bool)

(declare-fun tp_is_empty!17377 () Bool)

(assert (=> b!875512 (= e!487398 tp_is_empty!17377)))

(declare-fun b!875513 () Bool)

(declare-fun e!487396 () Bool)

(declare-fun e!487400 () Bool)

(declare-fun mapRes!27674 () Bool)

(assert (=> b!875513 (= e!487396 (and e!487400 mapRes!27674))))

(declare-fun condMapEmpty!27674 () Bool)

(declare-datatypes ((V!28217 0))(
  ( (V!28218 (val!8736 Int)) )
))
(declare-datatypes ((ValueCell!8249 0))(
  ( (ValueCellFull!8249 (v!11165 V!28217)) (EmptyCell!8249) )
))
(declare-datatypes ((array!50880 0))(
  ( (array!50881 (arr!24468 (Array (_ BitVec 32) ValueCell!8249)) (size!24908 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50880)

(declare-fun mapDefault!27674 () ValueCell!8249)

