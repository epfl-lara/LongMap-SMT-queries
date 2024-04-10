; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!788 () Bool)

(assert start!788)

(declare-fun b_free!181 () Bool)

(declare-fun b_next!181 () Bool)

(assert (=> start!788 (= b_free!181 (not b_next!181))))

(declare-fun tp!773 () Bool)

(declare-fun b_and!327 () Bool)

(assert (=> start!788 (= tp!773 b_and!327)))

(declare-fun b!5724 () Bool)

(declare-fun e!3110 () Bool)

(declare-fun tp_is_empty!259 () Bool)

(assert (=> b!5724 (= e!3110 tp_is_empty!259)))

(declare-fun b!5725 () Bool)

(declare-fun e!3116 () Bool)

(declare-fun e!3114 () Bool)

(declare-fun mapRes!359 () Bool)

(assert (=> b!5725 (= e!3116 (and e!3114 mapRes!359))))

(declare-fun condMapEmpty!359 () Bool)

(declare-datatypes ((V!523 0))(
  ( (V!524 (val!135 Int)) )
))
(declare-datatypes ((ValueCell!113 0))(
  ( (ValueCellFull!113 (v!1226 V!523)) (EmptyCell!113) )
))
(declare-datatypes ((array!455 0))(
  ( (array!456 (arr!216 (Array (_ BitVec 32) ValueCell!113)) (size!278 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!455)

(declare-fun mapDefault!359 () ValueCell!113)

