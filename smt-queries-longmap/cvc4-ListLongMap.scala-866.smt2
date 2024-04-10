; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20296 () Bool)

(assert start!20296)

(declare-fun b_free!4955 () Bool)

(declare-fun b_next!4955 () Bool)

(assert (=> start!20296 (= b_free!4955 (not b_next!4955))))

(declare-fun tp!17897 () Bool)

(declare-fun b_and!11701 () Bool)

(assert (=> start!20296 (= tp!17897 b_and!11701)))

(declare-fun b!199874 () Bool)

(declare-fun res!95097 () Bool)

(declare-fun e!131141 () Bool)

(assert (=> b!199874 (=> (not res!95097) (not e!131141))))

(declare-datatypes ((array!8859 0))(
  ( (array!8860 (arr!4180 (Array (_ BitVec 32) (_ BitVec 64))) (size!4505 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8859)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199874 (= res!95097 (= (select (arr!4180 _keys!825) i!601) k!843))))

(declare-fun b!199875 () Bool)

(declare-fun res!95092 () Bool)

(assert (=> b!199875 (=> (not res!95092) (not e!131141))))

(assert (=> b!199875 (= res!95092 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4505 _keys!825))))))

(declare-fun b!199876 () Bool)

(declare-fun e!131142 () Bool)

(declare-fun e!131140 () Bool)

(declare-fun mapRes!8285 () Bool)

(assert (=> b!199876 (= e!131142 (and e!131140 mapRes!8285))))

(declare-fun condMapEmpty!8285 () Bool)

(declare-datatypes ((V!6061 0))(
  ( (V!6062 (val!2450 Int)) )
))
(declare-datatypes ((ValueCell!2062 0))(
  ( (ValueCellFull!2062 (v!4420 V!6061)) (EmptyCell!2062) )
))
(declare-datatypes ((array!8861 0))(
  ( (array!8862 (arr!4181 (Array (_ BitVec 32) ValueCell!2062)) (size!4506 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8861)

(declare-fun mapDefault!8285 () ValueCell!2062)

