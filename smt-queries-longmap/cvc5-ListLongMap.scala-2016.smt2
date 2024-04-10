; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35146 () Bool)

(assert start!35146)

(declare-fun b_free!7765 () Bool)

(declare-fun b_next!7765 () Bool)

(assert (=> start!35146 (= b_free!7765 (not b_next!7765))))

(declare-fun tp!26882 () Bool)

(declare-fun b_and!15001 () Bool)

(assert (=> start!35146 (= tp!26882 b_and!15001)))

(declare-fun b!352349 () Bool)

(declare-fun e!215764 () Bool)

(declare-fun e!215766 () Bool)

(declare-fun mapRes!13056 () Bool)

(assert (=> b!352349 (= e!215764 (and e!215766 mapRes!13056))))

(declare-fun condMapEmpty!13056 () Bool)

(declare-datatypes ((V!11267 0))(
  ( (V!11268 (val!3903 Int)) )
))
(declare-datatypes ((ValueCell!3515 0))(
  ( (ValueCellFull!3515 (v!6093 V!11267)) (EmptyCell!3515) )
))
(declare-datatypes ((array!19025 0))(
  ( (array!19026 (arr!9015 (Array (_ BitVec 32) ValueCell!3515)) (size!9367 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19025)

(declare-fun mapDefault!13056 () ValueCell!3515)

