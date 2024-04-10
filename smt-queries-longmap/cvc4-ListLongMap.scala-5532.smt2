; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72980 () Bool)

(assert start!72980)

(declare-fun b_free!13895 () Bool)

(declare-fun b_next!13895 () Bool)

(assert (=> start!72980 (= b_free!13895 (not b_next!13895))))

(declare-fun tp!49189 () Bool)

(declare-fun b_and!22981 () Bool)

(assert (=> start!72980 (= tp!49189 b_and!22981)))

(declare-fun b!847756 () Bool)

(declare-fun e!473039 () Bool)

(declare-fun tp_is_empty!16031 () Bool)

(assert (=> b!847756 (= e!473039 tp_is_empty!16031)))

(declare-fun res!575993 () Bool)

(declare-fun e!473042 () Bool)

(assert (=> start!72980 (=> (not res!575993) (not e!473042))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48272 0))(
  ( (array!48273 (arr!23167 (Array (_ BitVec 32) (_ BitVec 64))) (size!23607 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48272)

(assert (=> start!72980 (= res!575993 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23607 _keys!868))))))

(assert (=> start!72980 e!473042))

(assert (=> start!72980 tp_is_empty!16031))

(assert (=> start!72980 true))

(assert (=> start!72980 tp!49189))

(declare-fun array_inv!18398 (array!48272) Bool)

(assert (=> start!72980 (array_inv!18398 _keys!868)))

(declare-datatypes ((V!26421 0))(
  ( (V!26422 (val!8063 Int)) )
))
(declare-datatypes ((ValueCell!7576 0))(
  ( (ValueCellFull!7576 (v!10488 V!26421)) (EmptyCell!7576) )
))
(declare-datatypes ((array!48274 0))(
  ( (array!48275 (arr!23168 (Array (_ BitVec 32) ValueCell!7576)) (size!23608 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48274)

(declare-fun e!473044 () Bool)

(declare-fun array_inv!18399 (array!48274) Bool)

(assert (=> start!72980 (and (array_inv!18399 _values!688) e!473044)))

(declare-fun b!847757 () Bool)

(declare-fun e!473041 () Bool)

(assert (=> b!847757 (= e!473042 e!473041)))

(declare-fun res!575991 () Bool)

(assert (=> b!847757 (=> (not res!575991) (not e!473041))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847757 (= res!575991 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10536 0))(
  ( (tuple2!10537 (_1!5279 (_ BitVec 64)) (_2!5279 V!26421)) )
))
(declare-datatypes ((List!16394 0))(
  ( (Nil!16391) (Cons!16390 (h!17521 tuple2!10536) (t!22765 List!16394)) )
))
(declare-datatypes ((ListLongMap!9305 0))(
  ( (ListLongMap!9306 (toList!4668 List!16394)) )
))
(declare-fun lt!381826 () ListLongMap!9305)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!381828 () array!48274)

(declare-fun minValue!654 () V!26421)

(declare-fun zeroValue!654 () V!26421)

(declare-fun getCurrentListMapNoExtraKeys!2652 (array!48272 array!48274 (_ BitVec 32) (_ BitVec 32) V!26421 V!26421 (_ BitVec 32) Int) ListLongMap!9305)

(assert (=> b!847757 (= lt!381826 (getCurrentListMapNoExtraKeys!2652 _keys!868 lt!381828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26421)

(assert (=> b!847757 (= lt!381828 (array!48275 (store (arr!23168 _values!688) i!612 (ValueCellFull!7576 v!557)) (size!23608 _values!688)))))

(declare-fun lt!381827 () ListLongMap!9305)

(assert (=> b!847757 (= lt!381827 (getCurrentListMapNoExtraKeys!2652 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847758 () Bool)

(declare-fun res!575990 () Bool)

(assert (=> b!847758 (=> (not res!575990) (not e!473042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847758 (= res!575990 (validMask!0 mask!1196))))

(declare-fun bm!37537 () Bool)

(declare-fun call!37540 () ListLongMap!9305)

(assert (=> bm!37537 (= call!37540 (getCurrentListMapNoExtraKeys!2652 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847759 () Bool)

(declare-fun res!575986 () Bool)

(assert (=> b!847759 (=> (not res!575986) (not e!473042))))

(declare-datatypes ((List!16395 0))(
  ( (Nil!16392) (Cons!16391 (h!17522 (_ BitVec 64)) (t!22766 List!16395)) )
))
(declare-fun arrayNoDuplicates!0 (array!48272 (_ BitVec 32) List!16395) Bool)

(assert (=> b!847759 (= res!575986 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16392))))

(declare-fun mapIsEmpty!25646 () Bool)

(declare-fun mapRes!25646 () Bool)

(assert (=> mapIsEmpty!25646 mapRes!25646))

(declare-fun b!847760 () Bool)

(declare-fun res!575989 () Bool)

(assert (=> b!847760 (=> (not res!575989) (not e!473042))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!847760 (= res!575989 (and (= (select (arr!23167 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!847761 () Bool)

(declare-fun res!575988 () Bool)

(assert (=> b!847761 (=> (not res!575988) (not e!473042))))

(assert (=> b!847761 (= res!575988 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23607 _keys!868))))))

(declare-fun b!847762 () Bool)

(declare-fun res!575992 () Bool)

(assert (=> b!847762 (=> (not res!575992) (not e!473042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847762 (= res!575992 (validKeyInArray!0 k!854))))

(declare-fun b!847763 () Bool)

(declare-fun res!575985 () Bool)

(assert (=> b!847763 (=> (not res!575985) (not e!473042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48272 (_ BitVec 32)) Bool)

(assert (=> b!847763 (= res!575985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847764 () Bool)

(assert (=> b!847764 (= e!473041 (not true))))

(declare-fun e!473043 () Bool)

(assert (=> b!847764 e!473043))

(declare-fun c!91513 () Bool)

(assert (=> b!847764 (= c!91513 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28951 0))(
  ( (Unit!28952) )
))
(declare-fun lt!381829 () Unit!28951)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!321 (array!48272 array!48274 (_ BitVec 32) (_ BitVec 32) V!26421 V!26421 (_ BitVec 32) (_ BitVec 64) V!26421 (_ BitVec 32) Int) Unit!28951)

(assert (=> b!847764 (= lt!381829 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!321 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37541 () ListLongMap!9305)

(declare-fun bm!37538 () Bool)

(assert (=> bm!37538 (= call!37541 (getCurrentListMapNoExtraKeys!2652 _keys!868 lt!381828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847765 () Bool)

(declare-fun e!473040 () Bool)

(assert (=> b!847765 (= e!473040 tp_is_empty!16031)))

(declare-fun b!847766 () Bool)

(assert (=> b!847766 (= e!473043 (= call!37541 call!37540))))

(declare-fun b!847767 () Bool)

(declare-fun +!2084 (ListLongMap!9305 tuple2!10536) ListLongMap!9305)

(assert (=> b!847767 (= e!473043 (= call!37541 (+!2084 call!37540 (tuple2!10537 k!854 v!557))))))

(declare-fun b!847768 () Bool)

(assert (=> b!847768 (= e!473044 (and e!473040 mapRes!25646))))

(declare-fun condMapEmpty!25646 () Bool)

(declare-fun mapDefault!25646 () ValueCell!7576)

