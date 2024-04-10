; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43556 () Bool)

(assert start!43556)

(declare-fun b_free!12335 () Bool)

(declare-fun b_next!12335 () Bool)

(assert (=> start!43556 (= b_free!12335 (not b_next!12335))))

(declare-fun tp!43288 () Bool)

(declare-fun b_and!21095 () Bool)

(assert (=> start!43556 (= tp!43288 b_and!21095)))

(declare-fun b!482677 () Bool)

(declare-fun e!284042 () Bool)

(declare-datatypes ((array!31351 0))(
  ( (array!31352 (arr!15078 (Array (_ BitVec 32) (_ BitVec 64))) (size!15436 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31351)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482677 (= e!284042 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!482678 () Bool)

(declare-fun e!284043 () Bool)

(declare-fun e!284041 () Bool)

(declare-fun mapRes!22480 () Bool)

(assert (=> b!482678 (= e!284043 (and e!284041 mapRes!22480))))

(declare-fun condMapEmpty!22480 () Bool)

(declare-datatypes ((V!19533 0))(
  ( (V!19534 (val!6971 Int)) )
))
(declare-datatypes ((ValueCell!6562 0))(
  ( (ValueCellFull!6562 (v!9264 V!19533)) (EmptyCell!6562) )
))
(declare-datatypes ((array!31353 0))(
  ( (array!31354 (arr!15079 (Array (_ BitVec 32) ValueCell!6562)) (size!15437 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31353)

(declare-fun mapDefault!22480 () ValueCell!6562)

