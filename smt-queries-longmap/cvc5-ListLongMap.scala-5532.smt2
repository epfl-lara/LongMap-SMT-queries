; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72976 () Bool)

(assert start!72976)

(declare-fun b_free!13891 () Bool)

(declare-fun b_next!13891 () Bool)

(assert (=> start!72976 (= b_free!13891 (not b_next!13891))))

(declare-fun tp!49176 () Bool)

(declare-fun b_and!22977 () Bool)

(assert (=> start!72976 (= tp!49176 b_and!22977)))

(declare-fun b!847672 () Bool)

(declare-fun e!473001 () Bool)

(assert (=> b!847672 (= e!473001 (not true))))

(declare-fun e!473000 () Bool)

(assert (=> b!847672 e!473000))

(declare-fun c!91507 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847672 (= c!91507 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26417 0))(
  ( (V!26418 (val!8061 Int)) )
))
(declare-fun v!557 () V!26417)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28947 0))(
  ( (Unit!28948) )
))
(declare-fun lt!381802 () Unit!28947)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48264 0))(
  ( (array!48265 (arr!23163 (Array (_ BitVec 32) (_ BitVec 64))) (size!23603 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48264)

(declare-datatypes ((ValueCell!7574 0))(
  ( (ValueCellFull!7574 (v!10486 V!26417)) (EmptyCell!7574) )
))
(declare-datatypes ((array!48266 0))(
  ( (array!48267 (arr!23164 (Array (_ BitVec 32) ValueCell!7574)) (size!23604 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48266)

(declare-fun minValue!654 () V!26417)

(declare-fun zeroValue!654 () V!26417)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!319 (array!48264 array!48266 (_ BitVec 32) (_ BitVec 32) V!26417 V!26417 (_ BitVec 32) (_ BitVec 64) V!26417 (_ BitVec 32) Int) Unit!28947)

(assert (=> b!847672 (= lt!381802 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!319 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847673 () Bool)

(declare-fun res!575931 () Bool)

(declare-fun e!472997 () Bool)

(assert (=> b!847673 (=> (not res!575931) (not e!472997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48264 (_ BitVec 32)) Bool)

(assert (=> b!847673 (= res!575931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847674 () Bool)

(declare-fun e!472998 () Bool)

(declare-fun tp_is_empty!16027 () Bool)

(assert (=> b!847674 (= e!472998 tp_is_empty!16027)))

(declare-fun b!847675 () Bool)

(declare-datatypes ((tuple2!10532 0))(
  ( (tuple2!10533 (_1!5277 (_ BitVec 64)) (_2!5277 V!26417)) )
))
(declare-datatypes ((List!16390 0))(
  ( (Nil!16387) (Cons!16386 (h!17517 tuple2!10532) (t!22761 List!16390)) )
))
(declare-datatypes ((ListLongMap!9301 0))(
  ( (ListLongMap!9302 (toList!4666 List!16390)) )
))
(declare-fun call!37528 () ListLongMap!9301)

(declare-fun call!37529 () ListLongMap!9301)

(assert (=> b!847675 (= e!473000 (= call!37528 call!37529))))

(declare-fun b!847676 () Bool)

(declare-fun res!575935 () Bool)

(assert (=> b!847676 (=> (not res!575935) (not e!472997))))

(assert (=> b!847676 (= res!575935 (and (= (size!23604 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23603 _keys!868) (size!23604 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37525 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2650 (array!48264 array!48266 (_ BitVec 32) (_ BitVec 32) V!26417 V!26417 (_ BitVec 32) Int) ListLongMap!9301)

(assert (=> bm!37525 (= call!37529 (getCurrentListMapNoExtraKeys!2650 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847677 () Bool)

(declare-fun res!575938 () Bool)

(assert (=> b!847677 (=> (not res!575938) (not e!472997))))

(assert (=> b!847677 (= res!575938 (and (= (select (arr!23163 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!847679 () Bool)

(declare-fun res!575937 () Bool)

(assert (=> b!847679 (=> (not res!575937) (not e!472997))))

(declare-datatypes ((List!16391 0))(
  ( (Nil!16388) (Cons!16387 (h!17518 (_ BitVec 64)) (t!22762 List!16391)) )
))
(declare-fun arrayNoDuplicates!0 (array!48264 (_ BitVec 32) List!16391) Bool)

(assert (=> b!847679 (= res!575937 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16388))))

(declare-fun b!847680 () Bool)

(declare-fun res!575932 () Bool)

(assert (=> b!847680 (=> (not res!575932) (not e!472997))))

(assert (=> b!847680 (= res!575932 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23603 _keys!868))))))

(declare-fun b!847681 () Bool)

(declare-fun +!2082 (ListLongMap!9301 tuple2!10532) ListLongMap!9301)

(assert (=> b!847681 (= e!473000 (= call!37528 (+!2082 call!37529 (tuple2!10533 k!854 v!557))))))

(declare-fun b!847682 () Bool)

(declare-fun e!472996 () Bool)

(declare-fun mapRes!25640 () Bool)

(assert (=> b!847682 (= e!472996 (and e!472998 mapRes!25640))))

(declare-fun condMapEmpty!25640 () Bool)

(declare-fun mapDefault!25640 () ValueCell!7574)

