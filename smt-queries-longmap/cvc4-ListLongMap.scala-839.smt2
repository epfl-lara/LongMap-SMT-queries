; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20134 () Bool)

(assert start!20134)

(declare-fun b_free!4793 () Bool)

(declare-fun b_next!4793 () Bool)

(assert (=> start!20134 (= b_free!4793 (not b_next!4793))))

(declare-fun tp!17411 () Bool)

(declare-fun b_and!11539 () Bool)

(assert (=> start!20134 (= tp!17411 b_and!11539)))

(declare-fun b!197444 () Bool)

(declare-fun res!93396 () Bool)

(declare-fun e!129927 () Bool)

(assert (=> b!197444 (=> (not res!93396) (not e!129927))))

(declare-datatypes ((array!8551 0))(
  ( (array!8552 (arr!4026 (Array (_ BitVec 32) (_ BitVec 64))) (size!4351 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8551)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197444 (= res!93396 (= (select (arr!4026 _keys!825) i!601) k!843))))

(declare-fun b!197445 () Bool)

(declare-fun e!129926 () Bool)

(declare-fun e!129928 () Bool)

(declare-fun mapRes!8042 () Bool)

(assert (=> b!197445 (= e!129926 (and e!129928 mapRes!8042))))

(declare-fun condMapEmpty!8042 () Bool)

(declare-datatypes ((V!5845 0))(
  ( (V!5846 (val!2369 Int)) )
))
(declare-datatypes ((ValueCell!1981 0))(
  ( (ValueCellFull!1981 (v!4339 V!5845)) (EmptyCell!1981) )
))
(declare-datatypes ((array!8553 0))(
  ( (array!8554 (arr!4027 (Array (_ BitVec 32) ValueCell!1981)) (size!4352 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8553)

(declare-fun mapDefault!8042 () ValueCell!1981)

