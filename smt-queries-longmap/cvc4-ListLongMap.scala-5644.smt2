; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73652 () Bool)

(assert start!73652)

(declare-fun b_free!14567 () Bool)

(declare-fun b_next!14567 () Bool)

(assert (=> start!73652 (= b_free!14567 (not b_next!14567))))

(declare-fun tp!51205 () Bool)

(declare-fun b_and!24113 () Bool)

(assert (=> start!73652 (= tp!51205 b_and!24113)))

(declare-fun b!862425 () Bool)

(declare-fun e!480484 () Bool)

(declare-fun tp_is_empty!16703 () Bool)

(assert (=> b!862425 (= e!480484 tp_is_empty!16703)))

(declare-fun mapNonEmpty!26654 () Bool)

(declare-fun mapRes!26654 () Bool)

(declare-fun tp!51204 () Bool)

(assert (=> mapNonEmpty!26654 (= mapRes!26654 (and tp!51204 e!480484))))

(declare-datatypes ((V!27317 0))(
  ( (V!27318 (val!8399 Int)) )
))
(declare-datatypes ((ValueCell!7912 0))(
  ( (ValueCellFull!7912 (v!10824 V!27317)) (EmptyCell!7912) )
))
(declare-fun mapValue!26654 () ValueCell!7912)

(declare-fun mapKey!26654 () (_ BitVec 32))

(declare-fun mapRest!26654 () (Array (_ BitVec 32) ValueCell!7912))

(declare-datatypes ((array!49570 0))(
  ( (array!49571 (arr!23816 (Array (_ BitVec 32) ValueCell!7912)) (size!24256 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49570)

(assert (=> mapNonEmpty!26654 (= (arr!23816 _values!688) (store mapRest!26654 mapKey!26654 mapValue!26654))))

(declare-fun b!862426 () Bool)

(declare-datatypes ((Unit!29450 0))(
  ( (Unit!29451) )
))
(declare-fun e!480481 () Unit!29450)

(declare-fun Unit!29452 () Unit!29450)

(assert (=> b!862426 (= e!480481 Unit!29452)))

(declare-fun b!862427 () Bool)

(declare-fun res!586057 () Bool)

(declare-fun e!480482 () Bool)

(assert (=> b!862427 (=> (not res!586057) (not e!480482))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49572 0))(
  ( (array!49573 (arr!23817 (Array (_ BitVec 32) (_ BitVec 64))) (size!24257 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49572)

(assert (=> b!862427 (= res!586057 (and (= (select (arr!23817 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!862428 () Bool)

(declare-fun res!586055 () Bool)

(assert (=> b!862428 (=> (not res!586055) (not e!480482))))

(declare-datatypes ((List!16917 0))(
  ( (Nil!16914) (Cons!16913 (h!18044 (_ BitVec 64)) (t!23750 List!16917)) )
))
(declare-fun arrayNoDuplicates!0 (array!49572 (_ BitVec 32) List!16917) Bool)

(assert (=> b!862428 (= res!586055 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16914))))

(declare-fun b!862429 () Bool)

(declare-fun res!586063 () Bool)

(assert (=> b!862429 (=> (not res!586063) (not e!480482))))

(assert (=> b!862429 (= res!586063 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24257 _keys!868))))))

(declare-fun b!862430 () Bool)

(declare-fun e!480479 () Bool)

(assert (=> b!862430 (= e!480482 e!480479)))

(declare-fun res!586059 () Bool)

(assert (=> b!862430 (=> (not res!586059) (not e!480479))))

(assert (=> b!862430 (= res!586059 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11108 0))(
  ( (tuple2!11109 (_1!5565 (_ BitVec 64)) (_2!5565 V!27317)) )
))
(declare-datatypes ((List!16918 0))(
  ( (Nil!16915) (Cons!16914 (h!18045 tuple2!11108) (t!23751 List!16918)) )
))
(declare-datatypes ((ListLongMap!9877 0))(
  ( (ListLongMap!9878 (toList!4954 List!16918)) )
))
(declare-fun lt!389271 () ListLongMap!9877)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27317)

(declare-fun zeroValue!654 () V!27317)

(declare-fun lt!389268 () array!49570)

(declare-fun getCurrentListMapNoExtraKeys!2930 (array!49572 array!49570 (_ BitVec 32) (_ BitVec 32) V!27317 V!27317 (_ BitVec 32) Int) ListLongMap!9877)

(assert (=> b!862430 (= lt!389271 (getCurrentListMapNoExtraKeys!2930 _keys!868 lt!389268 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27317)

(assert (=> b!862430 (= lt!389268 (array!49571 (store (arr!23816 _values!688) i!612 (ValueCellFull!7912 v!557)) (size!24256 _values!688)))))

(declare-fun lt!389267 () ListLongMap!9877)

(assert (=> b!862430 (= lt!389267 (getCurrentListMapNoExtraKeys!2930 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862431 () Bool)

(declare-fun res!586064 () Bool)

(assert (=> b!862431 (=> (not res!586064) (not e!480482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49572 (_ BitVec 32)) Bool)

(assert (=> b!862431 (= res!586064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862432 () Bool)

(declare-fun res!586062 () Bool)

(assert (=> b!862432 (=> (not res!586062) (not e!480482))))

(assert (=> b!862432 (= res!586062 (and (= (size!24256 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24257 _keys!868) (size!24256 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862433 () Bool)

(declare-fun res!586058 () Bool)

(assert (=> b!862433 (=> (not res!586058) (not e!480482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862433 (= res!586058 (validMask!0 mask!1196))))

(declare-fun b!862434 () Bool)

(declare-fun e!480483 () Bool)

(assert (=> b!862434 (= e!480479 (not e!480483))))

(declare-fun res!586054 () Bool)

(assert (=> b!862434 (=> res!586054 e!480483)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862434 (= res!586054 (not (validKeyInArray!0 (select (arr!23817 _keys!868) from!1053))))))

(declare-fun lt!389261 () ListLongMap!9877)

(declare-fun lt!389263 () ListLongMap!9877)

(assert (=> b!862434 (= lt!389261 lt!389263)))

(declare-fun lt!389269 () ListLongMap!9877)

(declare-fun lt!389260 () tuple2!11108)

(declare-fun +!2303 (ListLongMap!9877 tuple2!11108) ListLongMap!9877)

(assert (=> b!862434 (= lt!389263 (+!2303 lt!389269 lt!389260))))

(assert (=> b!862434 (= lt!389261 (getCurrentListMapNoExtraKeys!2930 _keys!868 lt!389268 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862434 (= lt!389260 (tuple2!11109 k!854 v!557))))

(assert (=> b!862434 (= lt!389269 (getCurrentListMapNoExtraKeys!2930 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389270 () Unit!29450)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!513 (array!49572 array!49570 (_ BitVec 32) (_ BitVec 32) V!27317 V!27317 (_ BitVec 32) (_ BitVec 64) V!27317 (_ BitVec 32) Int) Unit!29450)

(assert (=> b!862434 (= lt!389270 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!513 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862435 () Bool)

(declare-fun e!480485 () Bool)

(assert (=> b!862435 (= e!480483 e!480485)))

(declare-fun res!586056 () Bool)

(assert (=> b!862435 (=> res!586056 e!480485)))

(assert (=> b!862435 (= res!586056 (= k!854 (select (arr!23817 _keys!868) from!1053)))))

(assert (=> b!862435 (not (= (select (arr!23817 _keys!868) from!1053) k!854))))

(declare-fun lt!389262 () Unit!29450)

(assert (=> b!862435 (= lt!389262 e!480481)))

(declare-fun c!92071 () Bool)

(assert (=> b!862435 (= c!92071 (= (select (arr!23817 _keys!868) from!1053) k!854))))

(declare-fun lt!389264 () ListLongMap!9877)

(assert (=> b!862435 (= lt!389271 lt!389264)))

(declare-fun lt!389266 () tuple2!11108)

(assert (=> b!862435 (= lt!389264 (+!2303 lt!389263 lt!389266))))

(declare-fun lt!389272 () V!27317)

(assert (=> b!862435 (= lt!389266 (tuple2!11109 (select (arr!23817 _keys!868) from!1053) lt!389272))))

(declare-fun get!12569 (ValueCell!7912 V!27317) V!27317)

(declare-fun dynLambda!1137 (Int (_ BitVec 64)) V!27317)

(assert (=> b!862435 (= lt!389272 (get!12569 (select (arr!23816 _values!688) from!1053) (dynLambda!1137 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!26654 () Bool)

(assert (=> mapIsEmpty!26654 mapRes!26654))

(declare-fun b!862437 () Bool)

(assert (=> b!862437 (= e!480485 true)))

(assert (=> b!862437 (= lt!389264 (+!2303 (+!2303 lt!389269 lt!389266) lt!389260))))

(declare-fun lt!389257 () Unit!29450)

(declare-fun addCommutativeForDiffKeys!480 (ListLongMap!9877 (_ BitVec 64) V!27317 (_ BitVec 64) V!27317) Unit!29450)

(assert (=> b!862437 (= lt!389257 (addCommutativeForDiffKeys!480 lt!389269 k!854 v!557 (select (arr!23817 _keys!868) from!1053) lt!389272))))

(declare-fun b!862438 () Bool)

(declare-fun res!586060 () Bool)

(assert (=> b!862438 (=> (not res!586060) (not e!480482))))

(assert (=> b!862438 (= res!586060 (validKeyInArray!0 k!854))))

(declare-fun b!862439 () Bool)

(declare-fun e!480487 () Bool)

(declare-fun e!480486 () Bool)

(assert (=> b!862439 (= e!480487 (and e!480486 mapRes!26654))))

(declare-fun condMapEmpty!26654 () Bool)

(declare-fun mapDefault!26654 () ValueCell!7912)

