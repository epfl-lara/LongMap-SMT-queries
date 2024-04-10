; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33586 () Bool)

(assert start!33586)

(declare-fun b_free!6839 () Bool)

(declare-fun b_next!6839 () Bool)

(assert (=> start!33586 (= b_free!6839 (not b_next!6839))))

(declare-fun tp!24017 () Bool)

(declare-fun b_and!14017 () Bool)

(assert (=> start!33586 (= tp!24017 b_and!14017)))

(declare-fun b!333295 () Bool)

(declare-fun e!204657 () Bool)

(declare-fun e!204660 () Bool)

(declare-fun mapRes!11580 () Bool)

(assert (=> b!333295 (= e!204657 (and e!204660 mapRes!11580))))

(declare-fun condMapEmpty!11580 () Bool)

(declare-datatypes ((V!10031 0))(
  ( (V!10032 (val!3440 Int)) )
))
(declare-datatypes ((ValueCell!3052 0))(
  ( (ValueCellFull!3052 (v!5601 V!10031)) (EmptyCell!3052) )
))
(declare-datatypes ((array!17179 0))(
  ( (array!17180 (arr!8121 (Array (_ BitVec 32) ValueCell!3052)) (size!8473 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17179)

(declare-fun mapDefault!11580 () ValueCell!3052)

