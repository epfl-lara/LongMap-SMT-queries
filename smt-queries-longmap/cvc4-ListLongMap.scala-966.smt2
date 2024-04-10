; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20956 () Bool)

(assert start!20956)

(declare-fun b_free!5549 () Bool)

(declare-fun b_next!5549 () Bool)

(assert (=> start!20956 (= b_free!5549 (not b_next!5549))))

(declare-fun tp!19697 () Bool)

(declare-fun b_and!12331 () Bool)

(assert (=> start!20956 (= tp!19697 b_and!12331)))

(declare-fun b!210547 () Bool)

(declare-fun e!137100 () Bool)

(declare-fun tp_is_empty!5411 () Bool)

(assert (=> b!210547 (= e!137100 tp_is_empty!5411)))

(declare-fun b!210548 () Bool)

(declare-fun e!137099 () Bool)

(declare-fun e!137098 () Bool)

(declare-fun mapRes!9194 () Bool)

(assert (=> b!210548 (= e!137099 (and e!137098 mapRes!9194))))

(declare-fun condMapEmpty!9194 () Bool)

(declare-datatypes ((V!6861 0))(
  ( (V!6862 (val!2750 Int)) )
))
(declare-datatypes ((ValueCell!2362 0))(
  ( (ValueCellFull!2362 (v!4732 V!6861)) (EmptyCell!2362) )
))
(declare-datatypes ((array!10023 0))(
  ( (array!10024 (arr!4759 (Array (_ BitVec 32) ValueCell!2362)) (size!5084 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10023)

(declare-fun mapDefault!9194 () ValueCell!2362)

