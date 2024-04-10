; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77548 () Bool)

(assert start!77548)

(declare-fun b_free!16133 () Bool)

(declare-fun b_next!16133 () Bool)

(assert (=> start!77548 (= b_free!16133 (not b_next!16133))))

(declare-fun tp!56660 () Bool)

(declare-fun b_and!26499 () Bool)

(assert (=> start!77548 (= tp!56660 b_and!26499)))

(declare-fun b!903530 () Bool)

(declare-fun e!506249 () Bool)

(declare-fun tp_is_empty!18551 () Bool)

(assert (=> b!903530 (= e!506249 tp_is_empty!18551)))

(declare-fun b!903531 () Bool)

(declare-fun e!506250 () Bool)

(declare-fun mapRes!29539 () Bool)

(assert (=> b!903531 (= e!506250 (and e!506249 mapRes!29539))))

(declare-fun condMapEmpty!29539 () Bool)

(declare-datatypes ((V!29699 0))(
  ( (V!29700 (val!9326 Int)) )
))
(declare-datatypes ((ValueCell!8794 0))(
  ( (ValueCellFull!8794 (v!11831 V!29699)) (EmptyCell!8794) )
))
(declare-datatypes ((array!53158 0))(
  ( (array!53159 (arr!25538 (Array (_ BitVec 32) ValueCell!8794)) (size!25997 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53158)

(declare-fun mapDefault!29539 () ValueCell!8794)

