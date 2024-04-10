; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73492 () Bool)

(assert start!73492)

(declare-fun b_free!14407 () Bool)

(declare-fun b_next!14407 () Bool)

(assert (=> start!73492 (= b_free!14407 (not b_next!14407))))

(declare-fun tp!50725 () Bool)

(declare-fun b_and!23793 () Bool)

(assert (=> start!73492 (= tp!50725 b_and!23793)))

(declare-fun b!858538 () Bool)

(declare-fun e!478463 () Bool)

(declare-fun tp_is_empty!16543 () Bool)

(assert (=> b!858538 (= e!478463 tp_is_empty!16543)))

(declare-fun res!583261 () Bool)

(declare-fun e!478465 () Bool)

(assert (=> start!73492 (=> (not res!583261) (not e!478465))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49270 0))(
  ( (array!49271 (arr!23666 (Array (_ BitVec 32) (_ BitVec 64))) (size!24106 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49270)

(assert (=> start!73492 (= res!583261 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24106 _keys!868))))))

(assert (=> start!73492 e!478465))

(assert (=> start!73492 tp_is_empty!16543))

(assert (=> start!73492 true))

(assert (=> start!73492 tp!50725))

(declare-fun array_inv!18744 (array!49270) Bool)

(assert (=> start!73492 (array_inv!18744 _keys!868)))

(declare-datatypes ((V!27105 0))(
  ( (V!27106 (val!8319 Int)) )
))
(declare-datatypes ((ValueCell!7832 0))(
  ( (ValueCellFull!7832 (v!10744 V!27105)) (EmptyCell!7832) )
))
(declare-datatypes ((array!49272 0))(
  ( (array!49273 (arr!23667 (Array (_ BitVec 32) ValueCell!7832)) (size!24107 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49272)

(declare-fun e!478464 () Bool)

(declare-fun array_inv!18745 (array!49272) Bool)

(assert (=> start!73492 (and (array_inv!18745 _values!688) e!478464)))

(declare-fun b!858539 () Bool)

(declare-fun e!478462 () Bool)

(assert (=> b!858539 (= e!478462 true)))

(declare-datatypes ((List!16788 0))(
  ( (Nil!16785) (Cons!16784 (h!17915 (_ BitVec 64)) (t!23461 List!16788)) )
))
(declare-fun arrayNoDuplicates!0 (array!49270 (_ BitVec 32) List!16788) Bool)

(assert (=> b!858539 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16785)))

(declare-datatypes ((Unit!29271 0))(
  ( (Unit!29272) )
))
(declare-fun lt!386774 () Unit!29271)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49270 (_ BitVec 32) (_ BitVec 32)) Unit!29271)

(assert (=> b!858539 (= lt!386774 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858540 () Bool)

(declare-fun e!478461 () Bool)

(assert (=> b!858540 (= e!478461 e!478462)))

(declare-fun res!583268 () Bool)

(assert (=> b!858540 (=> res!583268 e!478462)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!858540 (= res!583268 (not (= (select (arr!23666 _keys!868) from!1053) k!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10980 0))(
  ( (tuple2!10981 (_1!5501 (_ BitVec 64)) (_2!5501 V!27105)) )
))
(declare-datatypes ((List!16789 0))(
  ( (Nil!16786) (Cons!16785 (h!17916 tuple2!10980) (t!23462 List!16789)) )
))
(declare-datatypes ((ListLongMap!9749 0))(
  ( (ListLongMap!9750 (toList!4890 List!16789)) )
))
(declare-fun lt!386775 () ListLongMap!9749)

(declare-fun lt!386773 () ListLongMap!9749)

(declare-fun +!2243 (ListLongMap!9749 tuple2!10980) ListLongMap!9749)

(declare-fun get!12463 (ValueCell!7832 V!27105) V!27105)

(declare-fun dynLambda!1083 (Int (_ BitVec 64)) V!27105)

(assert (=> b!858540 (= lt!386775 (+!2243 lt!386773 (tuple2!10981 (select (arr!23666 _keys!868) from!1053) (get!12463 (select (arr!23667 _values!688) from!1053) (dynLambda!1083 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858541 () Bool)

(declare-fun res!583264 () Bool)

(assert (=> b!858541 (=> (not res!583264) (not e!478465))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858541 (= res!583264 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24106 _keys!868))))))

(declare-fun mapIsEmpty!26414 () Bool)

(declare-fun mapRes!26414 () Bool)

(assert (=> mapIsEmpty!26414 mapRes!26414))

(declare-fun b!858542 () Bool)

(declare-fun res!583266 () Bool)

(assert (=> b!858542 (=> (not res!583266) (not e!478465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858542 (= res!583266 (validKeyInArray!0 k!854))))

(declare-fun b!858543 () Bool)

(declare-fun res!583270 () Bool)

(assert (=> b!858543 (=> (not res!583270) (not e!478465))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858543 (= res!583270 (validMask!0 mask!1196))))

(declare-fun b!858544 () Bool)

(declare-fun res!583267 () Bool)

(assert (=> b!858544 (=> (not res!583267) (not e!478465))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!858544 (= res!583267 (and (= (size!24107 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24106 _keys!868) (size!24107 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858545 () Bool)

(declare-fun e!478468 () Bool)

(assert (=> b!858545 (= e!478464 (and e!478468 mapRes!26414))))

(declare-fun condMapEmpty!26414 () Bool)

(declare-fun mapDefault!26414 () ValueCell!7832)

