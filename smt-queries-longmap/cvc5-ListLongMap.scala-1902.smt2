; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33902 () Bool)

(assert start!33902)

(declare-fun b_free!7081 () Bool)

(declare-fun b_next!7081 () Bool)

(assert (=> start!33902 (= b_free!7081 (not b_next!7081))))

(declare-fun tp!24755 () Bool)

(declare-fun b_and!14267 () Bool)

(assert (=> start!33902 (= tp!24755 b_and!14267)))

(declare-fun b!337658 () Bool)

(declare-fun e!207185 () Bool)

(declare-fun e!207188 () Bool)

(declare-fun mapRes!11955 () Bool)

(assert (=> b!337658 (= e!207185 (and e!207188 mapRes!11955))))

(declare-fun condMapEmpty!11955 () Bool)

(declare-datatypes ((V!10355 0))(
  ( (V!10356 (val!3561 Int)) )
))
(declare-datatypes ((ValueCell!3173 0))(
  ( (ValueCellFull!3173 (v!5726 V!10355)) (EmptyCell!3173) )
))
(declare-datatypes ((array!17661 0))(
  ( (array!17662 (arr!8358 (Array (_ BitVec 32) ValueCell!3173)) (size!8710 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17661)

(declare-fun mapDefault!11955 () ValueCell!3173)

