; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72986 () Bool)

(assert start!72986)

(declare-fun b_free!13901 () Bool)

(declare-fun b_next!13901 () Bool)

(assert (=> start!72986 (= b_free!13901 (not b_next!13901))))

(declare-fun tp!49207 () Bool)

(declare-fun b_and!22987 () Bool)

(assert (=> start!72986 (= tp!49207 b_and!22987)))

(declare-fun b!847882 () Bool)

(declare-fun e!473102 () Bool)

(declare-fun tp_is_empty!16037 () Bool)

(assert (=> b!847882 (= e!473102 tp_is_empty!16037)))

(declare-fun b!847883 () Bool)

(declare-fun res!576067 () Bool)

(declare-fun e!473103 () Bool)

(assert (=> b!847883 (=> (not res!576067) (not e!473103))))

(declare-datatypes ((array!48284 0))(
  ( (array!48285 (arr!23173 (Array (_ BitVec 32) (_ BitVec 64))) (size!23613 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48284)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48284 (_ BitVec 32)) Bool)

(assert (=> b!847883 (= res!576067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847884 () Bool)

(declare-fun res!576074 () Bool)

(assert (=> b!847884 (=> (not res!576074) (not e!473103))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847884 (= res!576074 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23613 _keys!868))))))

(declare-fun b!847885 () Bool)

(declare-fun res!576070 () Bool)

(assert (=> b!847885 (=> (not res!576070) (not e!473103))))

(declare-datatypes ((List!16400 0))(
  ( (Nil!16397) (Cons!16396 (h!17527 (_ BitVec 64)) (t!22771 List!16400)) )
))
(declare-fun arrayNoDuplicates!0 (array!48284 (_ BitVec 32) List!16400) Bool)

(assert (=> b!847885 (= res!576070 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16397))))

(declare-fun res!576071 () Bool)

(assert (=> start!72986 (=> (not res!576071) (not e!473103))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72986 (= res!576071 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23613 _keys!868))))))

(assert (=> start!72986 e!473103))

(assert (=> start!72986 tp_is_empty!16037))

(assert (=> start!72986 true))

(assert (=> start!72986 tp!49207))

(declare-fun array_inv!18404 (array!48284) Bool)

(assert (=> start!72986 (array_inv!18404 _keys!868)))

(declare-datatypes ((V!26429 0))(
  ( (V!26430 (val!8066 Int)) )
))
(declare-datatypes ((ValueCell!7579 0))(
  ( (ValueCellFull!7579 (v!10491 V!26429)) (EmptyCell!7579) )
))
(declare-datatypes ((array!48286 0))(
  ( (array!48287 (arr!23174 (Array (_ BitVec 32) ValueCell!7579)) (size!23614 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48286)

(declare-fun e!473106 () Bool)

(declare-fun array_inv!18405 (array!48286) Bool)

(assert (=> start!72986 (and (array_inv!18405 _values!688) e!473106)))

(declare-fun b!847886 () Bool)

(declare-fun e!473107 () Bool)

(assert (=> b!847886 (= e!473107 (not true))))

(declare-fun e!473104 () Bool)

(assert (=> b!847886 e!473104))

(declare-fun c!91522 () Bool)

(assert (=> b!847886 (= c!91522 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26429)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28957 0))(
  ( (Unit!28958) )
))
(declare-fun lt!381864 () Unit!28957)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26429)

(declare-fun zeroValue!654 () V!26429)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!324 (array!48284 array!48286 (_ BitVec 32) (_ BitVec 32) V!26429 V!26429 (_ BitVec 32) (_ BitVec 64) V!26429 (_ BitVec 32) Int) Unit!28957)

(assert (=> b!847886 (= lt!381864 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!324 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25655 () Bool)

(declare-fun mapRes!25655 () Bool)

(assert (=> mapIsEmpty!25655 mapRes!25655))

(declare-fun b!847887 () Bool)

(declare-fun res!576073 () Bool)

(assert (=> b!847887 (=> (not res!576073) (not e!473103))))

(assert (=> b!847887 (= res!576073 (and (= (size!23614 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23613 _keys!868) (size!23614 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847888 () Bool)

(declare-fun res!576066 () Bool)

(assert (=> b!847888 (=> (not res!576066) (not e!473103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847888 (= res!576066 (validMask!0 mask!1196))))

(declare-datatypes ((tuple2!10542 0))(
  ( (tuple2!10543 (_1!5282 (_ BitVec 64)) (_2!5282 V!26429)) )
))
(declare-datatypes ((List!16401 0))(
  ( (Nil!16398) (Cons!16397 (h!17528 tuple2!10542) (t!22772 List!16401)) )
))
(declare-datatypes ((ListLongMap!9311 0))(
  ( (ListLongMap!9312 (toList!4671 List!16401)) )
))
(declare-fun call!37558 () ListLongMap!9311)

(declare-fun b!847889 () Bool)

(declare-fun call!37559 () ListLongMap!9311)

(declare-fun +!2086 (ListLongMap!9311 tuple2!10542) ListLongMap!9311)

(assert (=> b!847889 (= e!473104 (= call!37559 (+!2086 call!37558 (tuple2!10543 k!854 v!557))))))

(declare-fun lt!381865 () array!48286)

(declare-fun bm!37555 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2655 (array!48284 array!48286 (_ BitVec 32) (_ BitVec 32) V!26429 V!26429 (_ BitVec 32) Int) ListLongMap!9311)

(assert (=> bm!37555 (= call!37559 (getCurrentListMapNoExtraKeys!2655 _keys!868 lt!381865 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847890 () Bool)

(assert (=> b!847890 (= e!473103 e!473107)))

(declare-fun res!576068 () Bool)

(assert (=> b!847890 (=> (not res!576068) (not e!473107))))

(assert (=> b!847890 (= res!576068 (= from!1053 i!612))))

(declare-fun lt!381862 () ListLongMap!9311)

(assert (=> b!847890 (= lt!381862 (getCurrentListMapNoExtraKeys!2655 _keys!868 lt!381865 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847890 (= lt!381865 (array!48287 (store (arr!23174 _values!688) i!612 (ValueCellFull!7579 v!557)) (size!23614 _values!688)))))

(declare-fun lt!381863 () ListLongMap!9311)

(assert (=> b!847890 (= lt!381863 (getCurrentListMapNoExtraKeys!2655 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37556 () Bool)

(assert (=> bm!37556 (= call!37558 (getCurrentListMapNoExtraKeys!2655 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847891 () Bool)

(declare-fun res!576072 () Bool)

(assert (=> b!847891 (=> (not res!576072) (not e!473103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847891 (= res!576072 (validKeyInArray!0 k!854))))

(declare-fun b!847892 () Bool)

(assert (=> b!847892 (= e!473106 (and e!473102 mapRes!25655))))

(declare-fun condMapEmpty!25655 () Bool)

(declare-fun mapDefault!25655 () ValueCell!7579)

