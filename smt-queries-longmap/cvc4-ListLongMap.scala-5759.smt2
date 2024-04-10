; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74406 () Bool)

(assert start!74406)

(declare-fun b_free!15149 () Bool)

(declare-fun b_next!15149 () Bool)

(assert (=> start!74406 (= b_free!15149 (not b_next!15149))))

(declare-fun tp!53125 () Bool)

(declare-fun b_and!24951 () Bool)

(assert (=> start!74406 (= tp!53125 b_and!24951)))

(declare-fun b!876012 () Bool)

(declare-fun e!487675 () Bool)

(declare-datatypes ((V!28237 0))(
  ( (V!28238 (val!8744 Int)) )
))
(declare-datatypes ((tuple2!11556 0))(
  ( (tuple2!11557 (_1!5789 (_ BitVec 64)) (_2!5789 V!28237)) )
))
(declare-datatypes ((List!17376 0))(
  ( (Nil!17373) (Cons!17372 (h!18503 tuple2!11556) (t!24429 List!17376)) )
))
(declare-datatypes ((ListLongMap!10325 0))(
  ( (ListLongMap!10326 (toList!5178 List!17376)) )
))
(declare-fun call!38691 () ListLongMap!10325)

(declare-fun call!38690 () ListLongMap!10325)

(assert (=> b!876012 (= e!487675 (= call!38691 call!38690))))

(declare-fun b!876013 () Bool)

(declare-fun res!595289 () Bool)

(declare-fun e!487671 () Bool)

(assert (=> b!876013 (=> (not res!595289) (not e!487671))))

(declare-datatypes ((array!50912 0))(
  ( (array!50913 (arr!24483 (Array (_ BitVec 32) (_ BitVec 64))) (size!24923 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50912)

(declare-datatypes ((List!17377 0))(
  ( (Nil!17374) (Cons!17373 (h!18504 (_ BitVec 64)) (t!24430 List!17377)) )
))
(declare-fun arrayNoDuplicates!0 (array!50912 (_ BitVec 32) List!17377) Bool)

(assert (=> b!876013 (= res!595289 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17374))))

(declare-fun b!876014 () Bool)

(declare-fun res!595285 () Bool)

(assert (=> b!876014 (=> (not res!595285) (not e!487671))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!876014 (= res!595285 (and (= (select (arr!24483 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!876015 () Bool)

(declare-fun res!595280 () Bool)

(assert (=> b!876015 (=> (not res!595280) (not e!487671))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8257 0))(
  ( (ValueCellFull!8257 (v!11177 V!28237)) (EmptyCell!8257) )
))
(declare-datatypes ((array!50914 0))(
  ( (array!50915 (arr!24484 (Array (_ BitVec 32) ValueCell!8257)) (size!24924 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50914)

(assert (=> b!876015 (= res!595280 (and (= (size!24924 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24923 _keys!868) (size!24924 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27701 () Bool)

(declare-fun mapRes!27701 () Bool)

(assert (=> mapIsEmpty!27701 mapRes!27701))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28237)

(declare-fun zeroValue!654 () V!28237)

(declare-fun bm!38687 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3145 (array!50912 array!50914 (_ BitVec 32) (_ BitVec 32) V!28237 V!28237 (_ BitVec 32) Int) ListLongMap!10325)

(assert (=> bm!38687 (= call!38690 (getCurrentListMapNoExtraKeys!3145 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876016 () Bool)

(declare-fun v!557 () V!28237)

(declare-fun +!2480 (ListLongMap!10325 tuple2!11556) ListLongMap!10325)

(assert (=> b!876016 (= e!487675 (= call!38691 (+!2480 call!38690 (tuple2!11557 k!854 v!557))))))

(declare-fun b!876017 () Bool)

(declare-fun e!487673 () Bool)

(declare-fun tp_is_empty!17393 () Bool)

(assert (=> b!876017 (= e!487673 tp_is_empty!17393)))

(declare-fun b!876018 () Bool)

(declare-fun e!487674 () Bool)

(assert (=> b!876018 (= e!487674 (bvslt i!612 (size!24924 _values!688)))))

(declare-fun lt!396372 () array!50914)

(declare-fun lt!396373 () ListLongMap!10325)

(declare-fun get!12872 (ValueCell!8257 V!28237) V!28237)

(declare-fun dynLambda!1208 (Int (_ BitVec 64)) V!28237)

(assert (=> b!876018 (= lt!396373 (+!2480 (getCurrentListMapNoExtraKeys!3145 _keys!868 lt!396372 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11557 (select (arr!24483 _keys!868) from!1053) (get!12872 (select (arr!24484 lt!396372) from!1053) (dynLambda!1208 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38688 () Bool)

(assert (=> bm!38688 (= call!38691 (getCurrentListMapNoExtraKeys!3145 _keys!868 lt!396372 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876019 () Bool)

(declare-fun res!595281 () Bool)

(assert (=> b!876019 (=> (not res!595281) (not e!487671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876019 (= res!595281 (validMask!0 mask!1196))))

(declare-fun b!876020 () Bool)

(declare-fun res!595287 () Bool)

(assert (=> b!876020 (=> (not res!595287) (not e!487671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50912 (_ BitVec 32)) Bool)

(assert (=> b!876020 (= res!595287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876021 () Bool)

(declare-fun e!487672 () Bool)

(assert (=> b!876021 (= e!487672 tp_is_empty!17393)))

(declare-fun b!876022 () Bool)

(declare-fun e!487676 () Bool)

(assert (=> b!876022 (= e!487676 (not e!487674))))

(declare-fun res!595284 () Bool)

(assert (=> b!876022 (=> res!595284 e!487674)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876022 (= res!595284 (not (validKeyInArray!0 (select (arr!24483 _keys!868) from!1053))))))

(assert (=> b!876022 e!487675))

(declare-fun c!92573 () Bool)

(assert (=> b!876022 (= c!92573 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29958 0))(
  ( (Unit!29959) )
))
(declare-fun lt!396374 () Unit!29958)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!672 (array!50912 array!50914 (_ BitVec 32) (_ BitVec 32) V!28237 V!28237 (_ BitVec 32) (_ BitVec 64) V!28237 (_ BitVec 32) Int) Unit!29958)

(assert (=> b!876022 (= lt!396374 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!672 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876023 () Bool)

(declare-fun res!595283 () Bool)

(assert (=> b!876023 (=> (not res!595283) (not e!487671))))

(assert (=> b!876023 (= res!595283 (validKeyInArray!0 k!854))))

(declare-fun b!876024 () Bool)

(declare-fun res!595282 () Bool)

(assert (=> b!876024 (=> (not res!595282) (not e!487671))))

(assert (=> b!876024 (= res!595282 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24923 _keys!868))))))

(declare-fun b!876025 () Bool)

(declare-fun e!487677 () Bool)

(assert (=> b!876025 (= e!487677 (and e!487672 mapRes!27701))))

(declare-fun condMapEmpty!27701 () Bool)

(declare-fun mapDefault!27701 () ValueCell!8257)

