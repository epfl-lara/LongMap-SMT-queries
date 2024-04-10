; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74280 () Bool)

(assert start!74280)

(declare-fun b_free!15043 () Bool)

(declare-fun b_next!15043 () Bool)

(assert (=> start!74280 (= b_free!15043 (not b_next!15043))))

(declare-fun tp!52803 () Bool)

(declare-fun b_and!24819 () Bool)

(assert (=> start!74280 (= tp!52803 b_and!24819)))

(declare-fun b!873884 () Bool)

(declare-fun res!593847 () Bool)

(declare-fun e!486618 () Bool)

(assert (=> b!873884 (=> (not res!593847) (not e!486618))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50702 0))(
  ( (array!50703 (arr!24379 (Array (_ BitVec 32) (_ BitVec 64))) (size!24819 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50702)

(assert (=> b!873884 (= res!593847 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24819 _keys!868))))))

(declare-fun b!873885 () Bool)

(declare-fun res!593846 () Bool)

(assert (=> b!873885 (=> (not res!593846) (not e!486618))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873885 (= res!593846 (validKeyInArray!0 k!854))))

(declare-fun res!593849 () Bool)

(assert (=> start!74280 (=> (not res!593849) (not e!486618))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74280 (= res!593849 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24819 _keys!868))))))

(assert (=> start!74280 e!486618))

(declare-fun tp_is_empty!17287 () Bool)

(assert (=> start!74280 tp_is_empty!17287))

(assert (=> start!74280 true))

(assert (=> start!74280 tp!52803))

(declare-fun array_inv!19232 (array!50702) Bool)

(assert (=> start!74280 (array_inv!19232 _keys!868)))

(declare-datatypes ((V!28097 0))(
  ( (V!28098 (val!8691 Int)) )
))
(declare-datatypes ((ValueCell!8204 0))(
  ( (ValueCellFull!8204 (v!11120 V!28097)) (EmptyCell!8204) )
))
(declare-datatypes ((array!50704 0))(
  ( (array!50705 (arr!24380 (Array (_ BitVec 32) ValueCell!8204)) (size!24820 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50704)

(declare-fun e!486616 () Bool)

(declare-fun array_inv!19233 (array!50704) Bool)

(assert (=> start!74280 (and (array_inv!19233 _values!688) e!486616)))

(declare-fun b!873886 () Bool)

(declare-fun e!486617 () Bool)

(declare-fun mapRes!27539 () Bool)

(assert (=> b!873886 (= e!486616 (and e!486617 mapRes!27539))))

(declare-fun condMapEmpty!27539 () Bool)

(declare-fun mapDefault!27539 () ValueCell!8204)

