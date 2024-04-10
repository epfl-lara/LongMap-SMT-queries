; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74704 () Bool)

(assert start!74704)

(declare-fun b_free!15353 () Bool)

(declare-fun b_next!15353 () Bool)

(assert (=> start!74704 (= b_free!15353 (not b_next!15353))))

(declare-fun tp!53746 () Bool)

(declare-fun b_and!25325 () Bool)

(assert (=> start!74704 (= tp!53746 b_and!25325)))

(declare-fun b!880778 () Bool)

(declare-fun e!490144 () Bool)

(declare-fun e!490143 () Bool)

(assert (=> b!880778 (= e!490144 e!490143)))

(declare-fun res!598430 () Bool)

(assert (=> b!880778 (=> res!598430 e!490143)))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51320 0))(
  ( (array!51321 (arr!24684 (Array (_ BitVec 32) (_ BitVec 64))) (size!25124 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51320)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880778 (= res!598430 (not (= (select (arr!24684 _keys!868) from!1053) k!854)))))

(declare-datatypes ((V!28509 0))(
  ( (V!28510 (val!8846 Int)) )
))
(declare-datatypes ((tuple2!11710 0))(
  ( (tuple2!11711 (_1!5866 (_ BitVec 64)) (_2!5866 V!28509)) )
))
(declare-datatypes ((List!17524 0))(
  ( (Nil!17521) (Cons!17520 (h!18651 tuple2!11710) (t!24679 List!17524)) )
))
(declare-datatypes ((ListLongMap!10479 0))(
  ( (ListLongMap!10480 (toList!5255 List!17524)) )
))
(declare-fun lt!398307 () ListLongMap!10479)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8359 0))(
  ( (ValueCellFull!8359 (v!11294 V!28509)) (EmptyCell!8359) )
))
(declare-datatypes ((array!51322 0))(
  ( (array!51323 (arr!24685 (Array (_ BitVec 32) ValueCell!8359)) (size!25125 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51322)

(declare-fun lt!398311 () ListLongMap!10479)

(declare-fun +!2527 (ListLongMap!10479 tuple2!11710) ListLongMap!10479)

(declare-fun get!12982 (ValueCell!8359 V!28509) V!28509)

(declare-fun dynLambda!1243 (Int (_ BitVec 64)) V!28509)

(assert (=> b!880778 (= lt!398307 (+!2527 lt!398311 (tuple2!11711 (select (arr!24684 _keys!868) from!1053) (get!12982 (select (arr!24685 _values!688) from!1053) (dynLambda!1243 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880779 () Bool)

(declare-fun e!490146 () Bool)

(declare-fun tp_is_empty!17597 () Bool)

(assert (=> b!880779 (= e!490146 tp_is_empty!17597)))

(declare-fun b!880780 () Bool)

(declare-fun res!598429 () Bool)

(declare-fun e!490140 () Bool)

(assert (=> b!880780 (=> (not res!598429) (not e!490140))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51320 (_ BitVec 32)) Bool)

(assert (=> b!880780 (= res!598429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880781 () Bool)

(declare-fun e!490145 () Bool)

(assert (=> b!880781 (= e!490145 tp_is_empty!17597)))

(declare-fun b!880782 () Bool)

(declare-fun res!598432 () Bool)

(assert (=> b!880782 (=> (not res!598432) (not e!490140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880782 (= res!598432 (validKeyInArray!0 k!854))))

(declare-fun b!880783 () Bool)

(declare-fun res!598427 () Bool)

(assert (=> b!880783 (=> (not res!598427) (not e!490140))))

(declare-datatypes ((List!17525 0))(
  ( (Nil!17522) (Cons!17521 (h!18652 (_ BitVec 64)) (t!24680 List!17525)) )
))
(declare-fun arrayNoDuplicates!0 (array!51320 (_ BitVec 32) List!17525) Bool)

(assert (=> b!880783 (= res!598427 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17522))))

(declare-fun mapIsEmpty!28017 () Bool)

(declare-fun mapRes!28017 () Bool)

(assert (=> mapIsEmpty!28017 mapRes!28017))

(declare-fun b!880784 () Bool)

(declare-fun e!490141 () Bool)

(assert (=> b!880784 (= e!490141 (not e!490144))))

(declare-fun res!598433 () Bool)

(assert (=> b!880784 (=> res!598433 e!490144)))

(assert (=> b!880784 (= res!598433 (not (validKeyInArray!0 (select (arr!24684 _keys!868) from!1053))))))

(declare-fun lt!398310 () ListLongMap!10479)

(assert (=> b!880784 (= lt!398310 lt!398311)))

(declare-fun v!557 () V!28509)

(declare-fun lt!398305 () ListLongMap!10479)

(assert (=> b!880784 (= lt!398311 (+!2527 lt!398305 (tuple2!11711 k!854 v!557)))))

(declare-fun lt!398309 () array!51322)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28509)

(declare-fun zeroValue!654 () V!28509)

(declare-fun getCurrentListMapNoExtraKeys!3218 (array!51320 array!51322 (_ BitVec 32) (_ BitVec 32) V!28509 V!28509 (_ BitVec 32) Int) ListLongMap!10479)

(assert (=> b!880784 (= lt!398310 (getCurrentListMapNoExtraKeys!3218 _keys!868 lt!398309 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880784 (= lt!398305 (getCurrentListMapNoExtraKeys!3218 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30070 0))(
  ( (Unit!30071) )
))
(declare-fun lt!398306 () Unit!30070)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!716 (array!51320 array!51322 (_ BitVec 32) (_ BitVec 32) V!28509 V!28509 (_ BitVec 32) (_ BitVec 64) V!28509 (_ BitVec 32) Int) Unit!30070)

(assert (=> b!880784 (= lt!398306 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!716 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!598436 () Bool)

(assert (=> start!74704 (=> (not res!598436) (not e!490140))))

(assert (=> start!74704 (= res!598436 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25124 _keys!868))))))

(assert (=> start!74704 e!490140))

(assert (=> start!74704 tp_is_empty!17597))

(assert (=> start!74704 true))

(assert (=> start!74704 tp!53746))

(declare-fun array_inv!19440 (array!51320) Bool)

(assert (=> start!74704 (array_inv!19440 _keys!868)))

(declare-fun e!490139 () Bool)

(declare-fun array_inv!19441 (array!51322) Bool)

(assert (=> start!74704 (and (array_inv!19441 _values!688) e!490139)))

(declare-fun b!880785 () Bool)

(assert (=> b!880785 (= e!490139 (and e!490145 mapRes!28017))))

(declare-fun condMapEmpty!28017 () Bool)

(declare-fun mapDefault!28017 () ValueCell!8359)

