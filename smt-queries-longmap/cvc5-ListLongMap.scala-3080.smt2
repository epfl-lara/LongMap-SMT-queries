; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43372 () Bool)

(assert start!43372)

(declare-fun b_free!12199 () Bool)

(declare-fun b_next!12199 () Bool)

(assert (=> start!43372 (= b_free!12199 (not b_next!12199))))

(declare-fun tp!42874 () Bool)

(declare-fun b_and!20955 () Bool)

(assert (=> start!43372 (= tp!42874 b_and!20955)))

(declare-fun b!480495 () Bool)

(declare-fun e!282727 () Bool)

(declare-fun tp_is_empty!13711 () Bool)

(assert (=> b!480495 (= e!282727 tp_is_empty!13711)))

(declare-fun b!480496 () Bool)

(declare-fun e!282724 () Bool)

(declare-fun mapRes!22270 () Bool)

(assert (=> b!480496 (= e!282724 (and e!282727 mapRes!22270))))

(declare-fun condMapEmpty!22270 () Bool)

(declare-datatypes ((V!19353 0))(
  ( (V!19354 (val!6903 Int)) )
))
(declare-datatypes ((ValueCell!6494 0))(
  ( (ValueCellFull!6494 (v!9194 V!19353)) (EmptyCell!6494) )
))
(declare-datatypes ((array!31089 0))(
  ( (array!31090 (arr!14949 (Array (_ BitVec 32) ValueCell!6494)) (size!15307 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31089)

(declare-fun mapDefault!22270 () ValueCell!6494)

