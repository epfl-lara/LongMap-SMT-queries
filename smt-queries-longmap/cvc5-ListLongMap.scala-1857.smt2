; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33522 () Bool)

(assert start!33522)

(declare-fun b_free!6811 () Bool)

(declare-fun b_next!6811 () Bool)

(assert (=> start!33522 (= b_free!6811 (not b_next!6811))))

(declare-fun tp!23927 () Bool)

(declare-fun b_and!13985 () Bool)

(assert (=> start!33522 (= tp!23927 b_and!13985)))

(declare-fun b!332672 () Bool)

(declare-fun res!183277 () Bool)

(declare-fun e!204285 () Bool)

(assert (=> b!332672 (=> (not res!183277) (not e!204285))))

(declare-datatypes ((array!17123 0))(
  ( (array!17124 (arr!8095 (Array (_ BitVec 32) (_ BitVec 64))) (size!8447 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17123)

(declare-datatypes ((List!4606 0))(
  ( (Nil!4603) (Cons!4602 (h!5458 (_ BitVec 64)) (t!9688 List!4606)) )
))
(declare-fun arrayNoDuplicates!0 (array!17123 (_ BitVec 32) List!4606) Bool)

(assert (=> b!332672 (= res!183277 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4603))))

(declare-fun b!332673 () Bool)

(declare-fun e!204284 () Bool)

(declare-fun e!204286 () Bool)

(declare-fun mapRes!11532 () Bool)

(assert (=> b!332673 (= e!204284 (and e!204286 mapRes!11532))))

(declare-fun condMapEmpty!11532 () Bool)

(declare-datatypes ((V!9995 0))(
  ( (V!9996 (val!3426 Int)) )
))
(declare-datatypes ((ValueCell!3038 0))(
  ( (ValueCellFull!3038 (v!5585 V!9995)) (EmptyCell!3038) )
))
(declare-datatypes ((array!17125 0))(
  ( (array!17126 (arr!8096 (Array (_ BitVec 32) ValueCell!3038)) (size!8448 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17125)

(declare-fun mapDefault!11532 () ValueCell!3038)

