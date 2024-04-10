; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73888 () Bool)

(assert start!73888)

(declare-fun b_free!14803 () Bool)

(declare-fun b_next!14803 () Bool)

(assert (=> start!73888 (= b_free!14803 (not b_next!14803))))

(declare-fun tp!51912 () Bool)

(declare-fun b_and!24555 () Bool)

(assert (=> start!73888 (= tp!51912 b_and!24555)))

(declare-fun b!868107 () Bool)

(declare-fun e!483526 () Bool)

(declare-fun e!483524 () Bool)

(declare-fun mapRes!27008 () Bool)

(assert (=> b!868107 (= e!483526 (and e!483524 mapRes!27008))))

(declare-fun condMapEmpty!27008 () Bool)

(declare-datatypes ((V!27633 0))(
  ( (V!27634 (val!8517 Int)) )
))
(declare-datatypes ((ValueCell!8030 0))(
  ( (ValueCellFull!8030 (v!10942 V!27633)) (EmptyCell!8030) )
))
(declare-datatypes ((array!50036 0))(
  ( (array!50037 (arr!24049 (Array (_ BitVec 32) ValueCell!8030)) (size!24489 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50036)

(declare-fun mapDefault!27008 () ValueCell!8030)

