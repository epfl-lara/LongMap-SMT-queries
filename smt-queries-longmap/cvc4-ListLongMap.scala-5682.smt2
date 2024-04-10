; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73880 () Bool)

(assert start!73880)

(declare-fun b_free!14795 () Bool)

(declare-fun b_next!14795 () Bool)

(assert (=> start!73880 (= b_free!14795 (not b_next!14795))))

(declare-fun tp!51888 () Bool)

(declare-fun b_and!24547 () Bool)

(assert (=> start!73880 (= tp!51888 b_and!24547)))

(declare-fun b!867963 () Bool)

(declare-fun e!483452 () Bool)

(declare-fun e!483457 () Bool)

(declare-fun mapRes!26996 () Bool)

(assert (=> b!867963 (= e!483452 (and e!483457 mapRes!26996))))

(declare-fun condMapEmpty!26996 () Bool)

(declare-datatypes ((V!27621 0))(
  ( (V!27622 (val!8513 Int)) )
))
(declare-datatypes ((ValueCell!8026 0))(
  ( (ValueCellFull!8026 (v!10938 V!27621)) (EmptyCell!8026) )
))
(declare-datatypes ((array!50022 0))(
  ( (array!50023 (arr!24042 (Array (_ BitVec 32) ValueCell!8026)) (size!24482 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50022)

(declare-fun mapDefault!26996 () ValueCell!8026)

