; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73532 () Bool)

(assert start!73532)

(declare-fun b_free!14447 () Bool)

(declare-fun b_next!14447 () Bool)

(assert (=> start!73532 (= b_free!14447 (not b_next!14447))))

(declare-fun tp!50844 () Bool)

(declare-fun b_and!23873 () Bool)

(assert (=> start!73532 (= tp!50844 b_and!23873)))

(declare-fun b!859442 () Bool)

(declare-fun res!583953 () Bool)

(declare-fun e!478956 () Bool)

(assert (=> b!859442 (=> res!583953 e!478956)))

(declare-datatypes ((List!16819 0))(
  ( (Nil!16816) (Cons!16815 (h!17946 (_ BitVec 64)) (t!23532 List!16819)) )
))
(declare-fun noDuplicate!1300 (List!16819) Bool)

(assert (=> b!859442 (= res!583953 (not (noDuplicate!1300 Nil!16816)))))

(declare-fun b!859443 () Bool)

(declare-fun res!583950 () Bool)

(declare-fun e!478955 () Bool)

(assert (=> b!859443 (=> (not res!583950) (not e!478955))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859443 (= res!583950 (validMask!0 mask!1196))))

(declare-fun b!859444 () Bool)

(declare-fun e!478957 () Bool)

(declare-fun tp_is_empty!16583 () Bool)

(assert (=> b!859444 (= e!478957 tp_is_empty!16583)))

(declare-fun b!859445 () Bool)

(declare-fun res!583956 () Bool)

(assert (=> b!859445 (=> (not res!583956) (not e!478955))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859445 (= res!583956 (validKeyInArray!0 k!854))))

(declare-fun res!583952 () Bool)

(assert (=> start!73532 (=> (not res!583952) (not e!478955))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49342 0))(
  ( (array!49343 (arr!23702 (Array (_ BitVec 32) (_ BitVec 64))) (size!24142 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49342)

(assert (=> start!73532 (= res!583952 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24142 _keys!868))))))

(assert (=> start!73532 e!478955))

(assert (=> start!73532 tp_is_empty!16583))

(assert (=> start!73532 true))

(assert (=> start!73532 tp!50844))

(declare-fun array_inv!18764 (array!49342) Bool)

(assert (=> start!73532 (array_inv!18764 _keys!868)))

(declare-datatypes ((V!27157 0))(
  ( (V!27158 (val!8339 Int)) )
))
(declare-datatypes ((ValueCell!7852 0))(
  ( (ValueCellFull!7852 (v!10764 V!27157)) (EmptyCell!7852) )
))
(declare-datatypes ((array!49344 0))(
  ( (array!49345 (arr!23703 (Array (_ BitVec 32) ValueCell!7852)) (size!24143 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49344)

(declare-fun e!478953 () Bool)

(declare-fun array_inv!18765 (array!49344) Bool)

(assert (=> start!73532 (and (array_inv!18765 _values!688) e!478953)))

(declare-fun b!859446 () Bool)

(declare-fun res!583949 () Bool)

(assert (=> b!859446 (=> (not res!583949) (not e!478955))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859446 (= res!583949 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24142 _keys!868))))))

(declare-fun mapNonEmpty!26474 () Bool)

(declare-fun mapRes!26474 () Bool)

(declare-fun tp!50845 () Bool)

(declare-fun e!478952 () Bool)

(assert (=> mapNonEmpty!26474 (= mapRes!26474 (and tp!50845 e!478952))))

(declare-fun mapKey!26474 () (_ BitVec 32))

(declare-fun mapValue!26474 () ValueCell!7852)

(declare-fun mapRest!26474 () (Array (_ BitVec 32) ValueCell!7852))

(assert (=> mapNonEmpty!26474 (= (arr!23703 _values!688) (store mapRest!26474 mapKey!26474 mapValue!26474))))

(declare-fun b!859447 () Bool)

(declare-fun e!478951 () Bool)

(declare-fun e!478950 () Bool)

(assert (=> b!859447 (= e!478951 (not e!478950))))

(declare-fun res!583946 () Bool)

(assert (=> b!859447 (=> res!583946 e!478950)))

(assert (=> b!859447 (= res!583946 (not (validKeyInArray!0 (select (arr!23702 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11010 0))(
  ( (tuple2!11011 (_1!5516 (_ BitVec 64)) (_2!5516 V!27157)) )
))
(declare-datatypes ((List!16820 0))(
  ( (Nil!16817) (Cons!16816 (h!17947 tuple2!11010) (t!23533 List!16820)) )
))
(declare-datatypes ((ListLongMap!9779 0))(
  ( (ListLongMap!9780 (toList!4905 List!16820)) )
))
(declare-fun lt!387270 () ListLongMap!9779)

(declare-fun lt!387269 () ListLongMap!9779)

(assert (=> b!859447 (= lt!387270 lt!387269)))

(declare-fun lt!387266 () ListLongMap!9779)

(declare-fun v!557 () V!27157)

(declare-fun +!2258 (ListLongMap!9779 tuple2!11010) ListLongMap!9779)

(assert (=> b!859447 (= lt!387269 (+!2258 lt!387266 (tuple2!11011 k!854 v!557)))))

(declare-fun lt!387273 () array!49344)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27157)

(declare-fun zeroValue!654 () V!27157)

(declare-fun getCurrentListMapNoExtraKeys!2884 (array!49342 array!49344 (_ BitVec 32) (_ BitVec 32) V!27157 V!27157 (_ BitVec 32) Int) ListLongMap!9779)

(assert (=> b!859447 (= lt!387270 (getCurrentListMapNoExtraKeys!2884 _keys!868 lt!387273 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859447 (= lt!387266 (getCurrentListMapNoExtraKeys!2884 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29301 0))(
  ( (Unit!29302) )
))
(declare-fun lt!387272 () Unit!29301)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!474 (array!49342 array!49344 (_ BitVec 32) (_ BitVec 32) V!27157 V!27157 (_ BitVec 32) (_ BitVec 64) V!27157 (_ BitVec 32) Int) Unit!29301)

(assert (=> b!859447 (= lt!387272 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!474 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859448 () Bool)

(declare-fun res!583951 () Bool)

(assert (=> b!859448 (=> (not res!583951) (not e!478955))))

(assert (=> b!859448 (= res!583951 (and (= (select (arr!23702 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!859449 () Bool)

(assert (=> b!859449 (= e!478956 true)))

(declare-fun lt!387271 () Bool)

(declare-fun contains!4218 (List!16819 (_ BitVec 64)) Bool)

(assert (=> b!859449 (= lt!387271 (contains!4218 Nil!16816 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859450 () Bool)

(declare-fun res!583954 () Bool)

(assert (=> b!859450 (=> (not res!583954) (not e!478955))))

(declare-fun arrayNoDuplicates!0 (array!49342 (_ BitVec 32) List!16819) Bool)

(assert (=> b!859450 (= res!583954 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16816))))

(declare-fun b!859451 () Bool)

(assert (=> b!859451 (= e!478953 (and e!478957 mapRes!26474))))

(declare-fun condMapEmpty!26474 () Bool)

(declare-fun mapDefault!26474 () ValueCell!7852)

