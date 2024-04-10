; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74236 () Bool)

(assert start!74236)

(declare-fun mapNonEmpty!27491 () Bool)

(declare-fun mapRes!27491 () Bool)

(declare-fun tp!52717 () Bool)

(declare-fun e!486338 () Bool)

(assert (=> mapNonEmpty!27491 (= mapRes!27491 (and tp!52717 e!486338))))

(declare-datatypes ((V!28057 0))(
  ( (V!28058 (val!8676 Int)) )
))
(declare-datatypes ((ValueCell!8189 0))(
  ( (ValueCellFull!8189 (v!11105 V!28057)) (EmptyCell!8189) )
))
(declare-fun mapValue!27491 () ValueCell!8189)

(declare-fun mapKey!27491 () (_ BitVec 32))

(declare-fun mapRest!27491 () (Array (_ BitVec 32) ValueCell!8189))

(declare-datatypes ((array!50640 0))(
  ( (array!50641 (arr!24349 (Array (_ BitVec 32) ValueCell!8189)) (size!24789 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50640)

(assert (=> mapNonEmpty!27491 (= (arr!24349 _values!688) (store mapRest!27491 mapKey!27491 mapValue!27491))))

(declare-fun mapIsEmpty!27491 () Bool)

(assert (=> mapIsEmpty!27491 mapRes!27491))

(declare-fun e!486340 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50642 0))(
  ( (array!50643 (arr!24350 (Array (_ BitVec 32) (_ BitVec 64))) (size!24790 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50642)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun b!873311 () Bool)

(assert (=> b!873311 (= e!486340 (and (= (select (arr!24350 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24790 _keys!868)) (bvsge i!612 (size!24789 _values!688))))))

(declare-fun b!873312 () Bool)

(declare-fun e!486336 () Bool)

(declare-fun e!486339 () Bool)

(assert (=> b!873312 (= e!486336 (and e!486339 mapRes!27491))))

(declare-fun condMapEmpty!27491 () Bool)

(declare-fun mapDefault!27491 () ValueCell!8189)

