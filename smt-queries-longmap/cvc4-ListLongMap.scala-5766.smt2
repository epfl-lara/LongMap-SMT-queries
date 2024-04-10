; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74502 () Bool)

(assert start!74502)

(declare-fun b_free!15191 () Bool)

(declare-fun b_next!15191 () Bool)

(assert (=> start!74502 (= b_free!15191 (not b_next!15191))))

(declare-fun tp!53255 () Bool)

(declare-fun b_and!25067 () Bool)

(assert (=> start!74502 (= tp!53255 b_and!25067)))

(declare-fun b!877487 () Bool)

(declare-fun e!488469 () Bool)

(declare-fun tp_is_empty!17435 () Bool)

(assert (=> b!877487 (= e!488469 tp_is_empty!17435)))

(declare-fun mapIsEmpty!27768 () Bool)

(declare-fun mapRes!27768 () Bool)

(assert (=> mapIsEmpty!27768 mapRes!27768))

(declare-fun b!877488 () Bool)

(declare-fun res!596093 () Bool)

(declare-fun e!488467 () Bool)

(assert (=> b!877488 (=> (not res!596093) (not e!488467))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50998 0))(
  ( (array!50999 (arr!24525 (Array (_ BitVec 32) (_ BitVec 64))) (size!24965 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50998)

(declare-datatypes ((V!28293 0))(
  ( (V!28294 (val!8765 Int)) )
))
(declare-datatypes ((ValueCell!8278 0))(
  ( (ValueCellFull!8278 (v!11205 V!28293)) (EmptyCell!8278) )
))
(declare-datatypes ((array!51000 0))(
  ( (array!51001 (arr!24526 (Array (_ BitVec 32) ValueCell!8278)) (size!24966 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51000)

(assert (=> b!877488 (= res!596093 (and (= (size!24966 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24965 _keys!868) (size!24966 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877489 () Bool)

(declare-fun res!596094 () Bool)

(assert (=> b!877489 (=> (not res!596094) (not e!488467))))

(declare-datatypes ((List!17406 0))(
  ( (Nil!17403) (Cons!17402 (h!18533 (_ BitVec 64)) (t!24495 List!17406)) )
))
(declare-fun arrayNoDuplicates!0 (array!50998 (_ BitVec 32) List!17406) Bool)

(assert (=> b!877489 (= res!596094 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17403))))

(declare-fun b!877490 () Bool)

(declare-fun res!596091 () Bool)

(assert (=> b!877490 (=> (not res!596091) (not e!488467))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877490 (= res!596091 (and (= (select (arr!24525 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!877491 () Bool)

(declare-fun res!596092 () Bool)

(assert (=> b!877491 (=> (not res!596092) (not e!488467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877491 (= res!596092 (validKeyInArray!0 k!854))))

(declare-fun b!877492 () Bool)

(declare-fun e!488468 () Bool)

(assert (=> b!877492 (= e!488468 tp_is_empty!17435)))

(declare-fun b!877493 () Bool)

(declare-fun res!596089 () Bool)

(assert (=> b!877493 (=> (not res!596089) (not e!488467))))

(assert (=> b!877493 (= res!596089 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24965 _keys!868))))))

(declare-fun b!877494 () Bool)

(declare-fun res!596090 () Bool)

(assert (=> b!877494 (=> (not res!596090) (not e!488467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50998 (_ BitVec 32)) Bool)

(assert (=> b!877494 (= res!596090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27768 () Bool)

(declare-fun tp!53254 () Bool)

(assert (=> mapNonEmpty!27768 (= mapRes!27768 (and tp!53254 e!488469))))

(declare-fun mapKey!27768 () (_ BitVec 32))

(declare-fun mapRest!27768 () (Array (_ BitVec 32) ValueCell!8278))

(declare-fun mapValue!27768 () ValueCell!8278)

(assert (=> mapNonEmpty!27768 (= (arr!24526 _values!688) (store mapRest!27768 mapKey!27768 mapValue!27768))))

(declare-fun b!877495 () Bool)

(declare-fun res!596096 () Bool)

(assert (=> b!877495 (=> (not res!596096) (not e!488467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877495 (= res!596096 (validMask!0 mask!1196))))

(declare-fun res!596095 () Bool)

(assert (=> start!74502 (=> (not res!596095) (not e!488467))))

(assert (=> start!74502 (= res!596095 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24965 _keys!868))))))

(assert (=> start!74502 e!488467))

(assert (=> start!74502 tp_is_empty!17435))

(assert (=> start!74502 true))

(assert (=> start!74502 tp!53255))

(declare-fun array_inv!19332 (array!50998) Bool)

(assert (=> start!74502 (array_inv!19332 _keys!868)))

(declare-fun e!488470 () Bool)

(declare-fun array_inv!19333 (array!51000) Bool)

(assert (=> start!74502 (and (array_inv!19333 _values!688) e!488470)))

(declare-fun b!877496 () Bool)

(assert (=> b!877496 (= e!488467 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24965 _keys!868)))))))

(declare-fun v!557 () V!28293)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11590 0))(
  ( (tuple2!11591 (_1!5806 (_ BitVec 64)) (_2!5806 V!28293)) )
))
(declare-datatypes ((List!17407 0))(
  ( (Nil!17404) (Cons!17403 (h!18534 tuple2!11590) (t!24496 List!17407)) )
))
(declare-datatypes ((ListLongMap!10359 0))(
  ( (ListLongMap!10360 (toList!5195 List!17407)) )
))
(declare-fun lt!397083 () ListLongMap!10359)

(declare-fun minValue!654 () V!28293)

(declare-fun zeroValue!654 () V!28293)

(declare-fun getCurrentListMapNoExtraKeys!3162 (array!50998 array!51000 (_ BitVec 32) (_ BitVec 32) V!28293 V!28293 (_ BitVec 32) Int) ListLongMap!10359)

(assert (=> b!877496 (= lt!397083 (getCurrentListMapNoExtraKeys!3162 _keys!868 (array!51001 (store (arr!24526 _values!688) i!612 (ValueCellFull!8278 v!557)) (size!24966 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397082 () ListLongMap!10359)

(assert (=> b!877496 (= lt!397082 (getCurrentListMapNoExtraKeys!3162 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877497 () Bool)

(assert (=> b!877497 (= e!488470 (and e!488468 mapRes!27768))))

(declare-fun condMapEmpty!27768 () Bool)

(declare-fun mapDefault!27768 () ValueCell!8278)

