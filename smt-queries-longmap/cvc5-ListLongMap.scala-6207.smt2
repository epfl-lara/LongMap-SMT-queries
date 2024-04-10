; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79376 () Bool)

(assert start!79376)

(declare-fun b_free!17563 () Bool)

(declare-fun b_next!17563 () Bool)

(assert (=> start!79376 (= b_free!17563 (not b_next!17563))))

(declare-fun tp!61133 () Bool)

(declare-fun b_and!28685 () Bool)

(assert (=> start!79376 (= tp!61133 b_and!28685)))

(declare-fun b!932527 () Bool)

(declare-fun e!523676 () Bool)

(declare-fun tp_is_empty!20071 () Bool)

(assert (=> b!932527 (= e!523676 tp_is_empty!20071)))

(declare-fun b!932528 () Bool)

(declare-fun e!523678 () Bool)

(declare-fun mapRes!31866 () Bool)

(assert (=> b!932528 (= e!523678 (and e!523676 mapRes!31866))))

(declare-fun condMapEmpty!31866 () Bool)

(declare-datatypes ((V!31727 0))(
  ( (V!31728 (val!10086 Int)) )
))
(declare-datatypes ((ValueCell!9554 0))(
  ( (ValueCellFull!9554 (v!12605 V!31727)) (EmptyCell!9554) )
))
(declare-datatypes ((array!56082 0))(
  ( (array!56083 (arr!26985 (Array (_ BitVec 32) ValueCell!9554)) (size!27444 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56082)

(declare-fun mapDefault!31866 () ValueCell!9554)

