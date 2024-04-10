; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73042 () Bool)

(assert start!73042)

(declare-fun b_free!13957 () Bool)

(declare-fun b_next!13957 () Bool)

(assert (=> start!73042 (= b_free!13957 (not b_next!13957))))

(declare-fun tp!49375 () Bool)

(declare-fun b_and!23073 () Bool)

(assert (=> start!73042 (= tp!49375 b_and!23073)))

(declare-fun res!576878 () Bool)

(declare-fun e!473749 () Bool)

(assert (=> start!73042 (=> (not res!576878) (not e!473749))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48392 0))(
  ( (array!48393 (arr!23227 (Array (_ BitVec 32) (_ BitVec 64))) (size!23667 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48392)

(assert (=> start!73042 (= res!576878 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23667 _keys!868))))))

(assert (=> start!73042 e!473749))

(declare-fun tp_is_empty!16093 () Bool)

(assert (=> start!73042 tp_is_empty!16093))

(assert (=> start!73042 true))

(assert (=> start!73042 tp!49375))

(declare-fun array_inv!18434 (array!48392) Bool)

(assert (=> start!73042 (array_inv!18434 _keys!868)))

(declare-datatypes ((V!26505 0))(
  ( (V!26506 (val!8094 Int)) )
))
(declare-datatypes ((ValueCell!7607 0))(
  ( (ValueCellFull!7607 (v!10519 V!26505)) (EmptyCell!7607) )
))
(declare-datatypes ((array!48394 0))(
  ( (array!48395 (arr!23228 (Array (_ BitVec 32) ValueCell!7607)) (size!23668 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48394)

(declare-fun e!473752 () Bool)

(declare-fun array_inv!18435 (array!48394) Bool)

(assert (=> start!73042 (and (array_inv!18435 _values!688) e!473752)))

(declare-datatypes ((tuple2!10594 0))(
  ( (tuple2!10595 (_1!5308 (_ BitVec 64)) (_2!5308 V!26505)) )
))
(declare-datatypes ((List!16444 0))(
  ( (Nil!16441) (Cons!16440 (h!17571 tuple2!10594) (t!22847 List!16444)) )
))
(declare-datatypes ((ListLongMap!9363 0))(
  ( (ListLongMap!9364 (toList!4697 List!16444)) )
))
(declare-fun call!37726 () ListLongMap!9363)

(declare-fun call!37727 () ListLongMap!9363)

(declare-fun b!849144 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!26505)

(declare-fun e!473747 () Bool)

(declare-fun +!2102 (ListLongMap!9363 tuple2!10594) ListLongMap!9363)

(assert (=> b!849144 (= e!473747 (= call!37726 (+!2102 call!37727 (tuple2!10595 k!854 v!557))))))

(declare-fun b!849145 () Bool)

(assert (=> b!849145 (= e!473747 (= call!37726 call!37727))))

(declare-fun b!849146 () Bool)

(declare-fun res!576880 () Bool)

(assert (=> b!849146 (=> (not res!576880) (not e!473749))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!849146 (= res!576880 (and (= (size!23668 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23667 _keys!868) (size!23668 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849147 () Bool)

(declare-fun e!473745 () Bool)

(assert (=> b!849147 (= e!473745 true)))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!382198 () array!48394)

(declare-fun lt!382201 () ListLongMap!9363)

(declare-fun minValue!654 () V!26505)

(declare-fun zeroValue!654 () V!26505)

(declare-fun getCurrentListMapNoExtraKeys!2679 (array!48392 array!48394 (_ BitVec 32) (_ BitVec 32) V!26505 V!26505 (_ BitVec 32) Int) ListLongMap!9363)

(declare-fun get!12223 (ValueCell!7607 V!26505) V!26505)

(declare-fun dynLambda!993 (Int (_ BitVec 64)) V!26505)

(assert (=> b!849147 (= lt!382201 (+!2102 (getCurrentListMapNoExtraKeys!2679 _keys!868 lt!382198 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10595 (select (arr!23227 _keys!868) from!1053) (get!12223 (select (arr!23228 lt!382198) from!1053) (dynLambda!993 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!37723 () Bool)

(assert (=> bm!37723 (= call!37727 (getCurrentListMapNoExtraKeys!2679 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849148 () Bool)

(declare-fun res!576883 () Bool)

(assert (=> b!849148 (=> (not res!576883) (not e!473749))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849148 (= res!576883 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23667 _keys!868))))))

(declare-fun b!849149 () Bool)

(declare-fun res!576882 () Bool)

(assert (=> b!849149 (=> (not res!576882) (not e!473749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849149 (= res!576882 (validKeyInArray!0 k!854))))

(declare-fun b!849150 () Bool)

(declare-fun res!576881 () Bool)

(assert (=> b!849150 (=> (not res!576881) (not e!473749))))

(assert (=> b!849150 (= res!576881 (and (= (select (arr!23227 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849151 () Bool)

(declare-fun e!473751 () Bool)

(assert (=> b!849151 (= e!473751 (not e!473745))))

(declare-fun res!576885 () Bool)

(assert (=> b!849151 (=> res!576885 e!473745)))

(assert (=> b!849151 (= res!576885 (not (validKeyInArray!0 (select (arr!23227 _keys!868) from!1053))))))

(assert (=> b!849151 e!473747))

(declare-fun c!91606 () Bool)

(assert (=> b!849151 (= c!91606 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28995 0))(
  ( (Unit!28996) )
))
(declare-fun lt!382200 () Unit!28995)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!343 (array!48392 array!48394 (_ BitVec 32) (_ BitVec 32) V!26505 V!26505 (_ BitVec 32) (_ BitVec 64) V!26505 (_ BitVec 32) Int) Unit!28995)

(assert (=> b!849151 (= lt!382200 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!343 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849152 () Bool)

(declare-fun e!473748 () Bool)

(assert (=> b!849152 (= e!473748 tp_is_empty!16093)))

(declare-fun b!849153 () Bool)

(declare-fun res!576886 () Bool)

(assert (=> b!849153 (=> (not res!576886) (not e!473749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48392 (_ BitVec 32)) Bool)

(assert (=> b!849153 (= res!576886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849154 () Bool)

(declare-fun mapRes!25739 () Bool)

(assert (=> b!849154 (= e!473752 (and e!473748 mapRes!25739))))

(declare-fun condMapEmpty!25739 () Bool)

(declare-fun mapDefault!25739 () ValueCell!7607)

