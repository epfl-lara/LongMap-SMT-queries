; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38710 () Bool)

(assert start!38710)

(declare-fun b_free!9247 () Bool)

(declare-fun b_next!9247 () Bool)

(assert (=> start!38710 (= b_free!9247 (not b_next!9247))))

(declare-fun tp!32865 () Bool)

(declare-fun b_and!16633 () Bool)

(assert (=> start!38710 (= tp!32865 b_and!16633)))

(declare-fun b!402757 () Bool)

(declare-fun res!232020 () Bool)

(declare-fun e!242600 () Bool)

(assert (=> b!402757 (=> (not res!232020) (not e!242600))))

(declare-datatypes ((array!24163 0))(
  ( (array!24164 (arr!11531 (Array (_ BitVec 32) (_ BitVec 64))) (size!11883 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24163)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14611 0))(
  ( (V!14612 (val!5109 Int)) )
))
(declare-datatypes ((ValueCell!4721 0))(
  ( (ValueCellFull!4721 (v!7356 V!14611)) (EmptyCell!4721) )
))
(declare-datatypes ((array!24165 0))(
  ( (array!24166 (arr!11532 (Array (_ BitVec 32) ValueCell!4721)) (size!11884 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24165)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!402757 (= res!232020 (and (= (size!11884 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11883 _keys!709) (size!11884 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402758 () Bool)

(declare-fun e!242598 () Bool)

(declare-fun e!242601 () Bool)

(declare-fun mapRes!16815 () Bool)

(assert (=> b!402758 (= e!242598 (and e!242601 mapRes!16815))))

(declare-fun condMapEmpty!16815 () Bool)

(declare-fun mapDefault!16815 () ValueCell!4721)

