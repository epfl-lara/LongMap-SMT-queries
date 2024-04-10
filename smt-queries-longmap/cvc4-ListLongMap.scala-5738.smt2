; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74246 () Bool)

(assert start!74246)

(declare-fun b_free!15023 () Bool)

(declare-fun b_next!15023 () Bool)

(assert (=> start!74246 (= b_free!15023 (not b_next!15023))))

(declare-fun tp!52740 () Bool)

(declare-fun b_and!24791 () Bool)

(assert (=> start!74246 (= tp!52740 b_and!24791)))

(declare-fun b!873469 () Bool)

(declare-fun res!593576 () Bool)

(declare-fun e!486415 () Bool)

(assert (=> b!873469 (=> (not res!593576) (not e!486415))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50660 0))(
  ( (array!50661 (arr!24359 (Array (_ BitVec 32) (_ BitVec 64))) (size!24799 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50660)

(assert (=> b!873469 (= res!593576 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24799 _keys!868))))))

(declare-fun b!873471 () Bool)

(declare-fun res!593577 () Bool)

(assert (=> b!873471 (=> (not res!593577) (not e!486415))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873471 (= res!593577 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!27506 () Bool)

(declare-fun mapRes!27506 () Bool)

(declare-fun tp!52741 () Bool)

(declare-fun e!486412 () Bool)

(assert (=> mapNonEmpty!27506 (= mapRes!27506 (and tp!52741 e!486412))))

(declare-fun mapKey!27506 () (_ BitVec 32))

(declare-datatypes ((V!28069 0))(
  ( (V!28070 (val!8681 Int)) )
))
(declare-datatypes ((ValueCell!8194 0))(
  ( (ValueCellFull!8194 (v!11110 V!28069)) (EmptyCell!8194) )
))
(declare-fun mapValue!27506 () ValueCell!8194)

(declare-datatypes ((array!50662 0))(
  ( (array!50663 (arr!24360 (Array (_ BitVec 32) ValueCell!8194)) (size!24800 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50662)

(declare-fun mapRest!27506 () (Array (_ BitVec 32) ValueCell!8194))

(assert (=> mapNonEmpty!27506 (= (arr!24360 _values!688) (store mapRest!27506 mapKey!27506 mapValue!27506))))

(declare-fun b!873472 () Bool)

(declare-fun e!486413 () Bool)

(declare-fun e!486414 () Bool)

(assert (=> b!873472 (= e!486413 (and e!486414 mapRes!27506))))

(declare-fun condMapEmpty!27506 () Bool)

(declare-fun mapDefault!27506 () ValueCell!8194)

