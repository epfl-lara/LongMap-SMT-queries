; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34504 () Bool)

(assert start!34504)

(declare-fun b_free!7427 () Bool)

(declare-fun b_next!7427 () Bool)

(assert (=> start!34504 (= b_free!7427 (not b_next!7427))))

(declare-fun tp!25826 () Bool)

(declare-fun b_and!14635 () Bool)

(assert (=> start!34504 (= tp!25826 b_and!14635)))

(declare-fun b!344812 () Bool)

(declare-fun res!190737 () Bool)

(declare-fun e!211355 () Bool)

(assert (=> b!344812 (=> (not res!190737) (not e!211355))))

(declare-datatypes ((array!18343 0))(
  ( (array!18344 (arr!8688 (Array (_ BitVec 32) (_ BitVec 64))) (size!9040 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18343)

(declare-datatypes ((List!5026 0))(
  ( (Nil!5023) (Cons!5022 (h!5878 (_ BitVec 64)) (t!10142 List!5026)) )
))
(declare-fun arrayNoDuplicates!0 (array!18343 (_ BitVec 32) List!5026) Bool)

(assert (=> b!344812 (= res!190737 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5023))))

(declare-fun b!344813 () Bool)

(declare-fun e!211358 () Bool)

(declare-fun e!211359 () Bool)

(declare-fun mapRes!12507 () Bool)

(assert (=> b!344813 (= e!211358 (and e!211359 mapRes!12507))))

(declare-fun condMapEmpty!12507 () Bool)

(declare-datatypes ((V!10815 0))(
  ( (V!10816 (val!3734 Int)) )
))
(declare-datatypes ((ValueCell!3346 0))(
  ( (ValueCellFull!3346 (v!5910 V!10815)) (EmptyCell!3346) )
))
(declare-datatypes ((array!18345 0))(
  ( (array!18346 (arr!8689 (Array (_ BitVec 32) ValueCell!3346)) (size!9041 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18345)

(declare-fun mapDefault!12507 () ValueCell!3346)

