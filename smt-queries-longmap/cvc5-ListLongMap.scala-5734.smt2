; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74200 () Bool)

(assert start!74200)

(declare-fun b_free!15007 () Bool)

(declare-fun b_next!15007 () Bool)

(assert (=> start!74200 (= b_free!15007 (not b_next!15007))))

(declare-fun tp!52671 () Bool)

(declare-fun b_and!24759 () Bool)

(assert (=> start!74200 (= tp!52671 b_and!24759)))

(declare-datatypes ((V!28033 0))(
  ( (V!28034 (val!8667 Int)) )
))
(declare-datatypes ((tuple2!11460 0))(
  ( (tuple2!11461 (_1!5741 (_ BitVec 64)) (_2!5741 V!28033)) )
))
(declare-datatypes ((List!17278 0))(
  ( (Nil!17275) (Cons!17274 (h!18405 tuple2!11460) (t!24315 List!17278)) )
))
(declare-datatypes ((ListLongMap!10229 0))(
  ( (ListLongMap!10230 (toList!5130 List!17278)) )
))
(declare-fun call!38489 () ListLongMap!10229)

(declare-fun call!38488 () ListLongMap!10229)

(declare-fun v!557 () V!28033)

(declare-fun e!486112 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun b!872896 () Bool)

(declare-fun +!2460 (ListLongMap!10229 tuple2!11460) ListLongMap!10229)

(assert (=> b!872896 (= e!486112 (= call!38488 (+!2460 call!38489 (tuple2!11461 k!854 v!557))))))

(declare-fun b!872897 () Bool)

(declare-fun e!486111 () Bool)

(declare-fun tp_is_empty!17239 () Bool)

(assert (=> b!872897 (= e!486111 tp_is_empty!17239)))

(declare-fun mapIsEmpty!27461 () Bool)

(declare-fun mapRes!27461 () Bool)

(assert (=> mapIsEmpty!27461 mapRes!27461))

(declare-fun b!872898 () Bool)

(assert (=> b!872898 (= e!486112 (= call!38488 call!38489))))

(declare-fun b!872899 () Bool)

(declare-fun res!593238 () Bool)

(declare-fun e!486108 () Bool)

(assert (=> b!872899 (=> (not res!593238) (not e!486108))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50606 0))(
  ( (array!50607 (arr!24333 (Array (_ BitVec 32) (_ BitVec 64))) (size!24773 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50606)

(assert (=> b!872899 (= res!593238 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24773 _keys!868))))))

(declare-fun b!872900 () Bool)

(declare-fun e!486110 () Bool)

(assert (=> b!872900 (= e!486110 (and e!486111 mapRes!27461))))

(declare-fun condMapEmpty!27461 () Bool)

(declare-datatypes ((ValueCell!8180 0))(
  ( (ValueCellFull!8180 (v!11092 V!28033)) (EmptyCell!8180) )
))
(declare-datatypes ((array!50608 0))(
  ( (array!50609 (arr!24334 (Array (_ BitVec 32) ValueCell!8180)) (size!24774 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50608)

(declare-fun mapDefault!27461 () ValueCell!8180)

