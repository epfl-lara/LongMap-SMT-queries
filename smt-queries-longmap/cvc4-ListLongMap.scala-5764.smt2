; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74436 () Bool)

(assert start!74436)

(declare-fun b_free!15179 () Bool)

(declare-fun b_next!15179 () Bool)

(assert (=> start!74436 (= b_free!15179 (not b_next!15179))))

(declare-fun tp!53215 () Bool)

(declare-fun b_and!25011 () Bool)

(assert (=> start!74436 (= tp!53215 b_and!25011)))

(declare-fun b!876717 () Bool)

(declare-fun e!488030 () Bool)

(declare-fun e!488037 () Bool)

(assert (=> b!876717 (= e!488030 (not e!488037))))

(declare-fun res!595733 () Bool)

(assert (=> b!876717 (=> res!595733 e!488037)))

(declare-datatypes ((array!50972 0))(
  ( (array!50973 (arr!24513 (Array (_ BitVec 32) (_ BitVec 64))) (size!24953 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50972)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876717 (= res!595733 (not (validKeyInArray!0 (select (arr!24513 _keys!868) from!1053))))))

(declare-fun e!488034 () Bool)

(assert (=> b!876717 e!488034))

(declare-fun c!92618 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876717 (= c!92618 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29982 0))(
  ( (Unit!29983) )
))
(declare-fun lt!396659 () Unit!29982)

(declare-datatypes ((V!28277 0))(
  ( (V!28278 (val!8759 Int)) )
))
(declare-fun v!557 () V!28277)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8272 0))(
  ( (ValueCellFull!8272 (v!11192 V!28277)) (EmptyCell!8272) )
))
(declare-datatypes ((array!50974 0))(
  ( (array!50975 (arr!24514 (Array (_ BitVec 32) ValueCell!8272)) (size!24954 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50974)

(declare-fun minValue!654 () V!28277)

(declare-fun zeroValue!654 () V!28277)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!684 (array!50972 array!50974 (_ BitVec 32) (_ BitVec 32) V!28277 V!28277 (_ BitVec 32) (_ BitVec 64) V!28277 (_ BitVec 32) Int) Unit!29982)

(assert (=> b!876717 (= lt!396659 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!684 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876718 () Bool)

(declare-fun res!595732 () Bool)

(declare-fun e!488035 () Bool)

(assert (=> b!876718 (=> (not res!595732) (not e!488035))))

(assert (=> b!876718 (= res!595732 (and (= (size!24954 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24953 _keys!868) (size!24954 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876719 () Bool)

(declare-fun res!595731 () Bool)

(assert (=> b!876719 (=> (not res!595731) (not e!488035))))

(assert (=> b!876719 (= res!595731 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24953 _keys!868))))))

(declare-fun b!876720 () Bool)

(declare-fun res!595737 () Bool)

(assert (=> b!876720 (=> (not res!595737) (not e!488035))))

(assert (=> b!876720 (= res!595737 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!27746 () Bool)

(declare-fun mapRes!27746 () Bool)

(declare-fun tp!53214 () Bool)

(declare-fun e!488033 () Bool)

(assert (=> mapNonEmpty!27746 (= mapRes!27746 (and tp!53214 e!488033))))

(declare-fun mapRest!27746 () (Array (_ BitVec 32) ValueCell!8272))

(declare-fun mapValue!27746 () ValueCell!8272)

(declare-fun mapKey!27746 () (_ BitVec 32))

(assert (=> mapNonEmpty!27746 (= (arr!24514 _values!688) (store mapRest!27746 mapKey!27746 mapValue!27746))))

(declare-fun b!876721 () Bool)

(declare-fun e!488032 () Bool)

(declare-fun e!488031 () Bool)

(assert (=> b!876721 (= e!488032 (and e!488031 mapRes!27746))))

(declare-fun condMapEmpty!27746 () Bool)

(declare-fun mapDefault!27746 () ValueCell!8272)

