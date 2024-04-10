; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20310 () Bool)

(assert start!20310)

(declare-fun b_free!4969 () Bool)

(declare-fun b_next!4969 () Bool)

(assert (=> start!20310 (= b_free!4969 (not b_next!4969))))

(declare-fun tp!17939 () Bool)

(declare-fun b_and!11715 () Bool)

(assert (=> start!20310 (= tp!17939 b_and!11715)))

(declare-fun b!200084 () Bool)

(declare-fun e!131249 () Bool)

(declare-fun e!131248 () Bool)

(declare-fun mapRes!8306 () Bool)

(assert (=> b!200084 (= e!131249 (and e!131248 mapRes!8306))))

(declare-fun condMapEmpty!8306 () Bool)

(declare-datatypes ((V!6081 0))(
  ( (V!6082 (val!2457 Int)) )
))
(declare-datatypes ((ValueCell!2069 0))(
  ( (ValueCellFull!2069 (v!4427 V!6081)) (EmptyCell!2069) )
))
(declare-datatypes ((array!8887 0))(
  ( (array!8888 (arr!4194 (Array (_ BitVec 32) ValueCell!2069)) (size!4519 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8887)

(declare-fun mapDefault!8306 () ValueCell!2069)

