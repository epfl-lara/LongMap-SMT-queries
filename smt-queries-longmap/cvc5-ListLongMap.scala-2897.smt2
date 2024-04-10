; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41524 () Bool)

(assert start!41524)

(declare-fun b_free!11191 () Bool)

(declare-fun b_next!11191 () Bool)

(assert (=> start!41524 (= b_free!11191 (not b_next!11191))))

(declare-fun tp!39571 () Bool)

(declare-fun b_and!19531 () Bool)

(assert (=> start!41524 (= tp!39571 b_and!19531)))

(declare-fun res!277338 () Bool)

(declare-fun e!270880 () Bool)

(assert (=> start!41524 (=> (not res!277338) (not e!270880))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41524 (= res!277338 (validMask!0 mask!1365))))

(assert (=> start!41524 e!270880))

(declare-fun tp_is_empty!12619 () Bool)

(assert (=> start!41524 tp_is_empty!12619))

(assert (=> start!41524 tp!39571))

(assert (=> start!41524 true))

(declare-datatypes ((array!29027 0))(
  ( (array!29028 (arr!13945 (Array (_ BitVec 32) (_ BitVec 64))) (size!14297 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29027)

(declare-fun array_inv!10078 (array!29027) Bool)

(assert (=> start!41524 (array_inv!10078 _keys!1025)))

(declare-datatypes ((V!17931 0))(
  ( (V!17932 (val!6354 Int)) )
))
(declare-datatypes ((ValueCell!5966 0))(
  ( (ValueCellFull!5966 (v!8641 V!17931)) (EmptyCell!5966) )
))
(declare-datatypes ((array!29029 0))(
  ( (array!29030 (arr!13946 (Array (_ BitVec 32) ValueCell!5966)) (size!14298 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29029)

(declare-fun e!270879 () Bool)

(declare-fun array_inv!10079 (array!29029) Bool)

(assert (=> start!41524 (and (array_inv!10079 _values!833) e!270879)))

(declare-fun mapIsEmpty!20605 () Bool)

(declare-fun mapRes!20605 () Bool)

(assert (=> mapIsEmpty!20605 mapRes!20605))

(declare-fun b!463852 () Bool)

(declare-fun e!270878 () Bool)

(assert (=> b!463852 (= e!270879 (and e!270878 mapRes!20605))))

(declare-fun condMapEmpty!20605 () Bool)

(declare-fun mapDefault!20605 () ValueCell!5966)

