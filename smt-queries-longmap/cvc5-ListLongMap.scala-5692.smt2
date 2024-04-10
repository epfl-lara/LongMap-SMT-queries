; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73936 () Bool)

(assert start!73936)

(declare-fun b_free!14851 () Bool)

(declare-fun b_next!14851 () Bool)

(assert (=> start!73936 (= b_free!14851 (not b_next!14851))))

(declare-fun tp!52056 () Bool)

(declare-fun b_and!24603 () Bool)

(assert (=> start!73936 (= tp!52056 b_and!24603)))

(declare-fun b!868971 () Bool)

(declare-fun e!483960 () Bool)

(declare-fun tp_is_empty!16987 () Bool)

(assert (=> b!868971 (= e!483960 tp_is_empty!16987)))

(declare-fun b!868972 () Bool)

(declare-fun e!483957 () Bool)

(declare-fun mapRes!27080 () Bool)

(assert (=> b!868972 (= e!483957 (and e!483960 mapRes!27080))))

(declare-fun condMapEmpty!27080 () Bool)

(declare-datatypes ((V!27697 0))(
  ( (V!27698 (val!8541 Int)) )
))
(declare-datatypes ((ValueCell!8054 0))(
  ( (ValueCellFull!8054 (v!10966 V!27697)) (EmptyCell!8054) )
))
(declare-datatypes ((array!50124 0))(
  ( (array!50125 (arr!24093 (Array (_ BitVec 32) ValueCell!8054)) (size!24533 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50124)

(declare-fun mapDefault!27080 () ValueCell!8054)

