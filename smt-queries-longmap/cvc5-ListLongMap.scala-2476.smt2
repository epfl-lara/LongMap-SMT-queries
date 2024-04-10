; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38674 () Bool)

(assert start!38674)

(declare-fun b_free!9211 () Bool)

(declare-fun b_next!9211 () Bool)

(assert (=> start!38674 (= b_free!9211 (not b_next!9211))))

(declare-fun tp!32756 () Bool)

(declare-fun b_and!16597 () Bool)

(assert (=> start!38674 (= tp!32756 b_and!16597)))

(declare-fun b!401839 () Bool)

(declare-fun res!231381 () Bool)

(declare-fun e!242222 () Bool)

(assert (=> b!401839 (=> (not res!231381) (not e!242222))))

(declare-datatypes ((array!24093 0))(
  ( (array!24094 (arr!11496 (Array (_ BitVec 32) (_ BitVec 64))) (size!11848 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24093)

(declare-datatypes ((List!6683 0))(
  ( (Nil!6680) (Cons!6679 (h!7535 (_ BitVec 64)) (t!11857 List!6683)) )
))
(declare-fun arrayNoDuplicates!0 (array!24093 (_ BitVec 32) List!6683) Bool)

(assert (=> b!401839 (= res!231381 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6680))))

(declare-fun b!401840 () Bool)

(declare-fun e!242223 () Bool)

(declare-fun e!242217 () Bool)

(declare-fun mapRes!16761 () Bool)

(assert (=> b!401840 (= e!242223 (and e!242217 mapRes!16761))))

(declare-fun condMapEmpty!16761 () Bool)

(declare-datatypes ((V!14563 0))(
  ( (V!14564 (val!5091 Int)) )
))
(declare-datatypes ((ValueCell!4703 0))(
  ( (ValueCellFull!4703 (v!7338 V!14563)) (EmptyCell!4703) )
))
(declare-datatypes ((array!24095 0))(
  ( (array!24096 (arr!11497 (Array (_ BitVec 32) ValueCell!4703)) (size!11849 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24095)

(declare-fun mapDefault!16761 () ValueCell!4703)

