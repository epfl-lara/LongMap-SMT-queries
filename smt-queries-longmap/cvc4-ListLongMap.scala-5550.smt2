; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73088 () Bool)

(assert start!73088)

(declare-fun b_free!14003 () Bool)

(declare-fun b_next!14003 () Bool)

(assert (=> start!73088 (= b_free!14003 (not b_next!14003))))

(declare-fun tp!49513 () Bool)

(declare-fun b_and!23165 () Bool)

(assert (=> start!73088 (= tp!49513 b_and!23165)))

(declare-fun b!850225 () Bool)

(declare-fun e!474301 () Bool)

(declare-fun tp_is_empty!16139 () Bool)

(assert (=> b!850225 (= e!474301 tp_is_empty!16139)))

(declare-fun b!850226 () Bool)

(declare-fun res!577573 () Bool)

(declare-fun e!474304 () Bool)

(assert (=> b!850226 (=> (not res!577573) (not e!474304))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850226 (= res!577573 (validMask!0 mask!1196))))

(declare-fun b!850227 () Bool)

(declare-fun res!577570 () Bool)

(assert (=> b!850227 (=> (not res!577570) (not e!474304))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48482 0))(
  ( (array!48483 (arr!23272 (Array (_ BitVec 32) (_ BitVec 64))) (size!23712 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48482)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!850227 (= res!577570 (and (= (select (arr!23272 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25808 () Bool)

(declare-fun mapRes!25808 () Bool)

(assert (=> mapIsEmpty!25808 mapRes!25808))

(declare-fun b!850228 () Bool)

(declare-fun res!577568 () Bool)

(assert (=> b!850228 (=> (not res!577568) (not e!474304))))

(assert (=> b!850228 (= res!577568 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23712 _keys!868))))))

(declare-fun res!577569 () Bool)

(assert (=> start!73088 (=> (not res!577569) (not e!474304))))

(assert (=> start!73088 (= res!577569 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23712 _keys!868))))))

(assert (=> start!73088 e!474304))

(assert (=> start!73088 tp_is_empty!16139))

(assert (=> start!73088 true))

(assert (=> start!73088 tp!49513))

(declare-fun array_inv!18468 (array!48482) Bool)

(assert (=> start!73088 (array_inv!18468 _keys!868)))

(declare-datatypes ((V!26565 0))(
  ( (V!26566 (val!8117 Int)) )
))
(declare-datatypes ((ValueCell!7630 0))(
  ( (ValueCellFull!7630 (v!10542 V!26565)) (EmptyCell!7630) )
))
(declare-datatypes ((array!48484 0))(
  ( (array!48485 (arr!23273 (Array (_ BitVec 32) ValueCell!7630)) (size!23713 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48484)

(declare-fun e!474297 () Bool)

(declare-fun array_inv!18469 (array!48484) Bool)

(assert (=> start!73088 (and (array_inv!18469 _values!688) e!474297)))

(declare-fun b!850229 () Bool)

(declare-fun e!474300 () Bool)

(declare-datatypes ((tuple2!10636 0))(
  ( (tuple2!10637 (_1!5329 (_ BitVec 64)) (_2!5329 V!26565)) )
))
(declare-datatypes ((List!16481 0))(
  ( (Nil!16478) (Cons!16477 (h!17608 tuple2!10636) (t!22930 List!16481)) )
))
(declare-datatypes ((ListLongMap!9405 0))(
  ( (ListLongMap!9406 (toList!4718 List!16481)) )
))
(declare-fun call!37864 () ListLongMap!9405)

(declare-fun call!37865 () ListLongMap!9405)

(assert (=> b!850229 (= e!474300 (= call!37864 call!37865))))

(declare-fun b!850230 () Bool)

(declare-fun res!577575 () Bool)

(assert (=> b!850230 (=> (not res!577575) (not e!474304))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!850230 (= res!577575 (and (= (size!23713 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23712 _keys!868) (size!23713 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850231 () Bool)

(declare-fun res!577571 () Bool)

(assert (=> b!850231 (=> (not res!577571) (not e!474304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850231 (= res!577571 (validKeyInArray!0 k!854))))

(declare-fun b!850232 () Bool)

(declare-fun e!474299 () Bool)

(declare-fun e!474303 () Bool)

(assert (=> b!850232 (= e!474299 (not e!474303))))

(declare-fun res!577576 () Bool)

(assert (=> b!850232 (=> res!577576 e!474303)))

(assert (=> b!850232 (= res!577576 (not (validKeyInArray!0 (select (arr!23272 _keys!868) from!1053))))))

(assert (=> b!850232 e!474300))

(declare-fun c!91675 () Bool)

(assert (=> b!850232 (= c!91675 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26565)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29031 0))(
  ( (Unit!29032) )
))
(declare-fun lt!382693 () Unit!29031)

(declare-fun minValue!654 () V!26565)

(declare-fun zeroValue!654 () V!26565)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!359 (array!48482 array!48484 (_ BitVec 32) (_ BitVec 32) V!26565 V!26565 (_ BitVec 32) (_ BitVec 64) V!26565 (_ BitVec 32) Int) Unit!29031)

(assert (=> b!850232 (= lt!382693 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!359 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37861 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2700 (array!48482 array!48484 (_ BitVec 32) (_ BitVec 32) V!26565 V!26565 (_ BitVec 32) Int) ListLongMap!9405)

(assert (=> bm!37861 (= call!37865 (getCurrentListMapNoExtraKeys!2700 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850233 () Bool)

(declare-fun +!2120 (ListLongMap!9405 tuple2!10636) ListLongMap!9405)

(assert (=> b!850233 (= e!474300 (= call!37864 (+!2120 call!37865 (tuple2!10637 k!854 v!557))))))

(declare-fun b!850234 () Bool)

(declare-fun res!577572 () Bool)

(assert (=> b!850234 (=> (not res!577572) (not e!474304))))

(declare-datatypes ((List!16482 0))(
  ( (Nil!16479) (Cons!16478 (h!17609 (_ BitVec 64)) (t!22931 List!16482)) )
))
(declare-fun arrayNoDuplicates!0 (array!48482 (_ BitVec 32) List!16482) Bool)

(assert (=> b!850234 (= res!577572 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16479))))

(declare-fun b!850235 () Bool)

(assert (=> b!850235 (= e!474297 (and e!474301 mapRes!25808))))

(declare-fun condMapEmpty!25808 () Bool)

(declare-fun mapDefault!25808 () ValueCell!7630)

