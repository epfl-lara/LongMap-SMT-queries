; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73030 () Bool)

(assert start!73030)

(declare-fun b_free!13945 () Bool)

(declare-fun b_next!13945 () Bool)

(assert (=> start!73030 (= b_free!13945 (not b_next!13945))))

(declare-fun tp!49338 () Bool)

(declare-fun b_and!23049 () Bool)

(assert (=> start!73030 (= tp!49338 b_and!23049)))

(declare-fun b!848862 () Bool)

(declare-fun e!473605 () Bool)

(assert (=> b!848862 (= e!473605 true)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26489 0))(
  ( (V!26490 (val!8088 Int)) )
))
(declare-datatypes ((tuple2!10582 0))(
  ( (tuple2!10583 (_1!5302 (_ BitVec 64)) (_2!5302 V!26489)) )
))
(declare-datatypes ((List!16435 0))(
  ( (Nil!16432) (Cons!16431 (h!17562 tuple2!10582) (t!22826 List!16435)) )
))
(declare-datatypes ((ListLongMap!9351 0))(
  ( (ListLongMap!9352 (toList!4691 List!16435)) )
))
(declare-fun lt!382128 () ListLongMap!9351)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48368 0))(
  ( (array!48369 (arr!23215 (Array (_ BitVec 32) (_ BitVec 64))) (size!23655 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48368)

(declare-datatypes ((ValueCell!7601 0))(
  ( (ValueCellFull!7601 (v!10513 V!26489)) (EmptyCell!7601) )
))
(declare-datatypes ((array!48370 0))(
  ( (array!48371 (arr!23216 (Array (_ BitVec 32) ValueCell!7601)) (size!23656 (_ BitVec 32))) )
))
(declare-fun lt!382129 () array!48370)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26489)

(declare-fun zeroValue!654 () V!26489)

(declare-fun +!2099 (ListLongMap!9351 tuple2!10582) ListLongMap!9351)

(declare-fun getCurrentListMapNoExtraKeys!2673 (array!48368 array!48370 (_ BitVec 32) (_ BitVec 32) V!26489 V!26489 (_ BitVec 32) Int) ListLongMap!9351)

(declare-fun get!12216 (ValueCell!7601 V!26489) V!26489)

(declare-fun dynLambda!990 (Int (_ BitVec 64)) V!26489)

(assert (=> b!848862 (= lt!382128 (+!2099 (getCurrentListMapNoExtraKeys!2673 _keys!868 lt!382129 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10583 (select (arr!23215 _keys!868) from!1053) (get!12216 (select (arr!23216 lt!382129) from!1053) (dynLambda!990 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!848863 () Bool)

(declare-fun call!37691 () ListLongMap!9351)

(declare-fun v!557 () V!26489)

(declare-fun call!37690 () ListLongMap!9351)

(declare-fun e!473607 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!848863 (= e!473607 (= call!37690 (+!2099 call!37691 (tuple2!10583 k!854 v!557))))))

(declare-fun mapIsEmpty!25721 () Bool)

(declare-fun mapRes!25721 () Bool)

(assert (=> mapIsEmpty!25721 mapRes!25721))

(declare-fun bm!37687 () Bool)

(assert (=> bm!37687 (= call!37690 (getCurrentListMapNoExtraKeys!2673 _keys!868 lt!382129 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848864 () Bool)

(declare-fun e!473606 () Bool)

(declare-fun tp_is_empty!16081 () Bool)

(assert (=> b!848864 (= e!473606 tp_is_empty!16081)))

(declare-fun b!848865 () Bool)

(declare-fun res!576703 () Bool)

(declare-fun e!473603 () Bool)

(assert (=> b!848865 (=> (not res!576703) (not e!473603))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848865 (= res!576703 (and (= (select (arr!23215 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!848866 () Bool)

(declare-fun res!576707 () Bool)

(assert (=> b!848866 (=> (not res!576707) (not e!473603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48368 (_ BitVec 32)) Bool)

(assert (=> b!848866 (= res!576707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!576702 () Bool)

(assert (=> start!73030 (=> (not res!576702) (not e!473603))))

(assert (=> start!73030 (= res!576702 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23655 _keys!868))))))

(assert (=> start!73030 e!473603))

(assert (=> start!73030 tp_is_empty!16081))

(assert (=> start!73030 true))

(assert (=> start!73030 tp!49338))

(declare-fun array_inv!18426 (array!48368) Bool)

(assert (=> start!73030 (array_inv!18426 _keys!868)))

(declare-fun _values!688 () array!48370)

(declare-fun e!473608 () Bool)

(declare-fun array_inv!18427 (array!48370) Bool)

(assert (=> start!73030 (and (array_inv!18427 _values!688) e!473608)))

(declare-fun mapNonEmpty!25721 () Bool)

(declare-fun tp!49339 () Bool)

(declare-fun e!473601 () Bool)

(assert (=> mapNonEmpty!25721 (= mapRes!25721 (and tp!49339 e!473601))))

(declare-fun mapRest!25721 () (Array (_ BitVec 32) ValueCell!7601))

(declare-fun mapKey!25721 () (_ BitVec 32))

(declare-fun mapValue!25721 () ValueCell!7601)

(assert (=> mapNonEmpty!25721 (= (arr!23216 _values!688) (store mapRest!25721 mapKey!25721 mapValue!25721))))

(declare-fun b!848867 () Bool)

(declare-fun e!473604 () Bool)

(assert (=> b!848867 (= e!473604 (not e!473605))))

(declare-fun res!576704 () Bool)

(assert (=> b!848867 (=> res!576704 e!473605)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848867 (= res!576704 (not (validKeyInArray!0 (select (arr!23215 _keys!868) from!1053))))))

(assert (=> b!848867 e!473607))

(declare-fun c!91588 () Bool)

(assert (=> b!848867 (= c!91588 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28989 0))(
  ( (Unit!28990) )
))
(declare-fun lt!382126 () Unit!28989)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!340 (array!48368 array!48370 (_ BitVec 32) (_ BitVec 32) V!26489 V!26489 (_ BitVec 32) (_ BitVec 64) V!26489 (_ BitVec 32) Int) Unit!28989)

(assert (=> b!848867 (= lt!382126 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!340 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848868 () Bool)

(assert (=> b!848868 (= e!473607 (= call!37690 call!37691))))

(declare-fun b!848869 () Bool)

(assert (=> b!848869 (= e!473601 tp_is_empty!16081)))

(declare-fun b!848870 () Bool)

(declare-fun res!576700 () Bool)

(assert (=> b!848870 (=> (not res!576700) (not e!473603))))

(assert (=> b!848870 (= res!576700 (validKeyInArray!0 k!854))))

(declare-fun bm!37688 () Bool)

(assert (=> bm!37688 (= call!37691 (getCurrentListMapNoExtraKeys!2673 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848871 () Bool)

(assert (=> b!848871 (= e!473603 e!473604)))

(declare-fun res!576698 () Bool)

(assert (=> b!848871 (=> (not res!576698) (not e!473604))))

(assert (=> b!848871 (= res!576698 (= from!1053 i!612))))

(assert (=> b!848871 (= lt!382128 (getCurrentListMapNoExtraKeys!2673 _keys!868 lt!382129 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848871 (= lt!382129 (array!48371 (store (arr!23216 _values!688) i!612 (ValueCellFull!7601 v!557)) (size!23656 _values!688)))))

(declare-fun lt!382127 () ListLongMap!9351)

(assert (=> b!848871 (= lt!382127 (getCurrentListMapNoExtraKeys!2673 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848872 () Bool)

(declare-fun res!576706 () Bool)

(assert (=> b!848872 (=> (not res!576706) (not e!473603))))

(declare-datatypes ((List!16436 0))(
  ( (Nil!16433) (Cons!16432 (h!17563 (_ BitVec 64)) (t!22827 List!16436)) )
))
(declare-fun arrayNoDuplicates!0 (array!48368 (_ BitVec 32) List!16436) Bool)

(assert (=> b!848872 (= res!576706 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16433))))

(declare-fun b!848873 () Bool)

(declare-fun res!576705 () Bool)

(assert (=> b!848873 (=> (not res!576705) (not e!473603))))

(assert (=> b!848873 (= res!576705 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23655 _keys!868))))))

(declare-fun b!848874 () Bool)

(declare-fun res!576701 () Bool)

(assert (=> b!848874 (=> (not res!576701) (not e!473603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848874 (= res!576701 (validMask!0 mask!1196))))

(declare-fun b!848875 () Bool)

(assert (=> b!848875 (= e!473608 (and e!473606 mapRes!25721))))

(declare-fun condMapEmpty!25721 () Bool)

(declare-fun mapDefault!25721 () ValueCell!7601)

