; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74534 () Bool)

(assert start!74534)

(declare-fun b_free!15223 () Bool)

(declare-fun b_next!15223 () Bool)

(assert (=> start!74534 (= b_free!15223 (not b_next!15223))))

(declare-fun tp!53350 () Bool)

(declare-fun b_and!25099 () Bool)

(assert (=> start!74534 (= tp!53350 b_and!25099)))

(declare-fun mapIsEmpty!27816 () Bool)

(declare-fun mapRes!27816 () Bool)

(assert (=> mapIsEmpty!27816 mapRes!27816))

(declare-fun b!878015 () Bool)

(declare-fun res!596473 () Bool)

(declare-fun e!488706 () Bool)

(assert (=> b!878015 (=> (not res!596473) (not e!488706))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878015 (= res!596473 (validMask!0 mask!1196))))

(declare-fun b!878016 () Bool)

(declare-fun res!596479 () Bool)

(assert (=> b!878016 (=> (not res!596479) (not e!488706))))

(declare-datatypes ((array!51062 0))(
  ( (array!51063 (arr!24557 (Array (_ BitVec 32) (_ BitVec 64))) (size!24997 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51062)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51062 (_ BitVec 32)) Bool)

(assert (=> b!878016 (= res!596479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878018 () Bool)

(assert (=> b!878018 (= e!488706 false)))

(declare-datatypes ((V!28337 0))(
  ( (V!28338 (val!8781 Int)) )
))
(declare-fun v!557 () V!28337)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8294 0))(
  ( (ValueCellFull!8294 (v!11221 V!28337)) (EmptyCell!8294) )
))
(declare-datatypes ((array!51064 0))(
  ( (array!51065 (arr!24558 (Array (_ BitVec 32) ValueCell!8294)) (size!24998 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51064)

(declare-fun minValue!654 () V!28337)

(declare-fun zeroValue!654 () V!28337)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!11610 0))(
  ( (tuple2!11611 (_1!5816 (_ BitVec 64)) (_2!5816 V!28337)) )
))
(declare-datatypes ((List!17426 0))(
  ( (Nil!17423) (Cons!17422 (h!18553 tuple2!11610) (t!24515 List!17426)) )
))
(declare-datatypes ((ListLongMap!10379 0))(
  ( (ListLongMap!10380 (toList!5205 List!17426)) )
))
(declare-fun lt!397179 () ListLongMap!10379)

(declare-fun getCurrentListMapNoExtraKeys!3172 (array!51062 array!51064 (_ BitVec 32) (_ BitVec 32) V!28337 V!28337 (_ BitVec 32) Int) ListLongMap!10379)

(assert (=> b!878018 (= lt!397179 (getCurrentListMapNoExtraKeys!3172 _keys!868 (array!51065 (store (arr!24558 _values!688) i!612 (ValueCellFull!8294 v!557)) (size!24998 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397178 () ListLongMap!10379)

(assert (=> b!878018 (= lt!397178 (getCurrentListMapNoExtraKeys!3172 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878019 () Bool)

(declare-fun e!488707 () Bool)

(declare-fun tp_is_empty!17467 () Bool)

(assert (=> b!878019 (= e!488707 tp_is_empty!17467)))

(declare-fun b!878020 () Bool)

(declare-fun e!488708 () Bool)

(assert (=> b!878020 (= e!488708 tp_is_empty!17467)))

(declare-fun mapNonEmpty!27816 () Bool)

(declare-fun tp!53351 () Bool)

(assert (=> mapNonEmpty!27816 (= mapRes!27816 (and tp!53351 e!488708))))

(declare-fun mapValue!27816 () ValueCell!8294)

(declare-fun mapKey!27816 () (_ BitVec 32))

(declare-fun mapRest!27816 () (Array (_ BitVec 32) ValueCell!8294))

(assert (=> mapNonEmpty!27816 (= (arr!24558 _values!688) (store mapRest!27816 mapKey!27816 mapValue!27816))))

(declare-fun b!878021 () Bool)

(declare-fun res!596478 () Bool)

(assert (=> b!878021 (=> (not res!596478) (not e!488706))))

(assert (=> b!878021 (= res!596478 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24997 _keys!868))))))

(declare-fun b!878022 () Bool)

(declare-fun res!596477 () Bool)

(assert (=> b!878022 (=> (not res!596477) (not e!488706))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878022 (= res!596477 (validKeyInArray!0 k!854))))

(declare-fun b!878023 () Bool)

(declare-fun res!596480 () Bool)

(assert (=> b!878023 (=> (not res!596480) (not e!488706))))

(assert (=> b!878023 (= res!596480 (and (= (size!24998 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24997 _keys!868) (size!24998 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!596475 () Bool)

(assert (=> start!74534 (=> (not res!596475) (not e!488706))))

(assert (=> start!74534 (= res!596475 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24997 _keys!868))))))

(assert (=> start!74534 e!488706))

(assert (=> start!74534 tp_is_empty!17467))

(assert (=> start!74534 true))

(assert (=> start!74534 tp!53350))

(declare-fun array_inv!19354 (array!51062) Bool)

(assert (=> start!74534 (array_inv!19354 _keys!868)))

(declare-fun e!488709 () Bool)

(declare-fun array_inv!19355 (array!51064) Bool)

(assert (=> start!74534 (and (array_inv!19355 _values!688) e!488709)))

(declare-fun b!878017 () Bool)

(declare-fun res!596474 () Bool)

(assert (=> b!878017 (=> (not res!596474) (not e!488706))))

(assert (=> b!878017 (= res!596474 (and (= (select (arr!24557 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878024 () Bool)

(assert (=> b!878024 (= e!488709 (and e!488707 mapRes!27816))))

(declare-fun condMapEmpty!27816 () Bool)

(declare-fun mapDefault!27816 () ValueCell!8294)

