; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41232 () Bool)

(assert start!41232)

(declare-fun b_free!11089 () Bool)

(declare-fun b_next!11089 () Bool)

(assert (=> start!41232 (= b_free!11089 (not b_next!11089))))

(declare-fun tp!39105 () Bool)

(declare-fun b_and!19383 () Bool)

(assert (=> start!41232 (= tp!39105 b_and!19383)))

(declare-fun b!461264 () Bool)

(declare-fun res!275973 () Bool)

(declare-fun e!268987 () Bool)

(assert (=> b!461264 (=> (not res!275973) (not e!268987))))

(declare-datatypes ((array!28647 0))(
  ( (array!28648 (arr!13763 (Array (_ BitVec 32) (_ BitVec 64))) (size!14116 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28647)

(declare-datatypes ((List!8347 0))(
  ( (Nil!8344) (Cons!8343 (h!9199 (_ BitVec 64)) (t!14280 List!8347)) )
))
(declare-fun arrayNoDuplicates!0 (array!28647 (_ BitVec 32) List!8347) Bool)

(assert (=> b!461264 (= res!275973 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8344))))

(declare-fun b!461265 () Bool)

(declare-fun res!275970 () Bool)

(assert (=> b!461265 (=> (not res!275970) (not e!268987))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461265 (= res!275970 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!461266 () Bool)

(declare-fun res!275969 () Bool)

(assert (=> b!461266 (=> (not res!275969) (not e!268987))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461266 (= res!275969 (or (= (select (arr!13763 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13763 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461267 () Bool)

(declare-fun res!275967 () Bool)

(assert (=> b!461267 (=> (not res!275967) (not e!268987))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17675 0))(
  ( (V!17676 (val!6258 Int)) )
))
(declare-datatypes ((ValueCell!5870 0))(
  ( (ValueCellFull!5870 (v!8534 V!17675)) (EmptyCell!5870) )
))
(declare-datatypes ((array!28649 0))(
  ( (array!28650 (arr!13764 (Array (_ BitVec 32) ValueCell!5870)) (size!14117 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28649)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!461267 (= res!275967 (and (= (size!14117 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14116 _keys!709) (size!14117 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!8284 0))(
  ( (tuple2!8285 (_1!4153 (_ BitVec 64)) (_2!4153 V!17675)) )
))
(declare-datatypes ((List!8348 0))(
  ( (Nil!8345) (Cons!8344 (h!9200 tuple2!8284) (t!14281 List!8348)) )
))
(declare-datatypes ((ListLongMap!7187 0))(
  ( (ListLongMap!7188 (toList!3609 List!8348)) )
))
(declare-fun lt!208788 () ListLongMap!7187)

(declare-fun lt!208787 () tuple2!8284)

(declare-fun e!268983 () Bool)

(declare-fun lt!208789 () ListLongMap!7187)

(declare-fun b!461268 () Bool)

(declare-fun +!1661 (ListLongMap!7187 tuple2!8284) ListLongMap!7187)

(assert (=> b!461268 (= e!268983 (= lt!208789 (+!1661 lt!208788 lt!208787)))))

(declare-fun mapNonEmpty!20293 () Bool)

(declare-fun mapRes!20293 () Bool)

(declare-fun tp!39106 () Bool)

(declare-fun e!268984 () Bool)

(assert (=> mapNonEmpty!20293 (= mapRes!20293 (and tp!39106 e!268984))))

(declare-fun mapValue!20293 () ValueCell!5870)

(declare-fun mapRest!20293 () (Array (_ BitVec 32) ValueCell!5870))

(declare-fun mapKey!20293 () (_ BitVec 32))

(assert (=> mapNonEmpty!20293 (= (arr!13764 _values!549) (store mapRest!20293 mapKey!20293 mapValue!20293))))

(declare-fun b!461269 () Bool)

(declare-fun res!275977 () Bool)

(assert (=> b!461269 (=> (not res!275977) (not e!268987))))

(assert (=> b!461269 (= res!275977 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14116 _keys!709))))))

(declare-fun b!461270 () Bool)

(declare-fun e!268986 () Bool)

(assert (=> b!461270 (= e!268987 e!268986)))

(declare-fun res!275975 () Bool)

(assert (=> b!461270 (=> (not res!275975) (not e!268986))))

(declare-fun lt!208790 () array!28647)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28647 (_ BitVec 32)) Bool)

(assert (=> b!461270 (= res!275975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208790 mask!1025))))

(assert (=> b!461270 (= lt!208790 (array!28648 (store (arr!13763 _keys!709) i!563 k0!794) (size!14116 _keys!709)))))

(declare-fun b!461271 () Bool)

(declare-fun res!275974 () Bool)

(assert (=> b!461271 (=> (not res!275974) (not e!268987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461271 (= res!275974 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!20293 () Bool)

(assert (=> mapIsEmpty!20293 mapRes!20293))

(declare-fun b!461273 () Bool)

(declare-fun res!275966 () Bool)

(assert (=> b!461273 (=> (not res!275966) (not e!268986))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!461273 (= res!275966 (bvsle from!863 i!563))))

(declare-fun b!461274 () Bool)

(declare-fun e!268988 () Bool)

(declare-fun e!268982 () Bool)

(assert (=> b!461274 (= e!268988 (and e!268982 mapRes!20293))))

(declare-fun condMapEmpty!20293 () Bool)

(declare-fun mapDefault!20293 () ValueCell!5870)

(assert (=> b!461274 (= condMapEmpty!20293 (= (arr!13764 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5870)) mapDefault!20293)))))

(declare-fun b!461275 () Bool)

(declare-fun tp_is_empty!12427 () Bool)

(assert (=> b!461275 (= e!268982 tp_is_empty!12427)))

(declare-fun b!461276 () Bool)

(declare-fun res!275968 () Bool)

(assert (=> b!461276 (=> (not res!275968) (not e!268986))))

(assert (=> b!461276 (= res!275968 (arrayNoDuplicates!0 lt!208790 #b00000000000000000000000000000000 Nil!8344))))

(declare-fun b!461277 () Bool)

(assert (=> b!461277 (= e!268984 tp_is_empty!12427)))

(declare-fun b!461278 () Bool)

(declare-fun e!268985 () Bool)

(assert (=> b!461278 (= e!268986 e!268985)))

(declare-fun res!275972 () Bool)

(assert (=> b!461278 (=> (not res!275972) (not e!268985))))

(assert (=> b!461278 (= res!275972 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17675)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17675)

(declare-fun lt!208786 () array!28649)

(declare-fun getCurrentListMapNoExtraKeys!1801 (array!28647 array!28649 (_ BitVec 32) (_ BitVec 32) V!17675 V!17675 (_ BitVec 32) Int) ListLongMap!7187)

(assert (=> b!461278 (= lt!208789 (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17675)

(assert (=> b!461278 (= lt!208786 (array!28650 (store (arr!13764 _values!549) i!563 (ValueCellFull!5870 v!412)) (size!14117 _values!549)))))

(assert (=> b!461278 (= lt!208788 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461279 () Bool)

(declare-fun res!275978 () Bool)

(assert (=> b!461279 (=> (not res!275978) (not e!268987))))

(assert (=> b!461279 (= res!275978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461280 () Bool)

(assert (=> b!461280 (= e!268985 (not e!268983))))

(declare-fun res!275965 () Bool)

(assert (=> b!461280 (=> res!275965 e!268983)))

(assert (=> b!461280 (= res!275965 (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)))))

(assert (=> b!461280 (= (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1661 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208787))))

(assert (=> b!461280 (= lt!208787 (tuple2!8285 k0!794 v!412))))

(declare-datatypes ((Unit!13402 0))(
  ( (Unit!13403) )
))
(declare-fun lt!208791 () Unit!13402)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!791 (array!28647 array!28649 (_ BitVec 32) (_ BitVec 32) V!17675 V!17675 (_ BitVec 32) (_ BitVec 64) V!17675 (_ BitVec 32) Int) Unit!13402)

(assert (=> b!461280 (= lt!208791 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!791 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461272 () Bool)

(declare-fun res!275976 () Bool)

(assert (=> b!461272 (=> (not res!275976) (not e!268987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461272 (= res!275976 (validMask!0 mask!1025))))

(declare-fun res!275971 () Bool)

(assert (=> start!41232 (=> (not res!275971) (not e!268987))))

(assert (=> start!41232 (= res!275971 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14116 _keys!709))))))

(assert (=> start!41232 e!268987))

(assert (=> start!41232 tp_is_empty!12427))

(assert (=> start!41232 tp!39105))

(assert (=> start!41232 true))

(declare-fun array_inv!10020 (array!28649) Bool)

(assert (=> start!41232 (and (array_inv!10020 _values!549) e!268988)))

(declare-fun array_inv!10021 (array!28647) Bool)

(assert (=> start!41232 (array_inv!10021 _keys!709)))

(assert (= (and start!41232 res!275971) b!461272))

(assert (= (and b!461272 res!275976) b!461267))

(assert (= (and b!461267 res!275967) b!461279))

(assert (= (and b!461279 res!275978) b!461264))

(assert (= (and b!461264 res!275973) b!461269))

(assert (= (and b!461269 res!275977) b!461271))

(assert (= (and b!461271 res!275974) b!461266))

(assert (= (and b!461266 res!275969) b!461265))

(assert (= (and b!461265 res!275970) b!461270))

(assert (= (and b!461270 res!275975) b!461276))

(assert (= (and b!461276 res!275968) b!461273))

(assert (= (and b!461273 res!275966) b!461278))

(assert (= (and b!461278 res!275972) b!461280))

(assert (= (and b!461280 (not res!275965)) b!461268))

(assert (= (and b!461274 condMapEmpty!20293) mapIsEmpty!20293))

(assert (= (and b!461274 (not condMapEmpty!20293)) mapNonEmpty!20293))

(get-info :version)

(assert (= (and mapNonEmpty!20293 ((_ is ValueCellFull!5870) mapValue!20293)) b!461277))

(assert (= (and b!461274 ((_ is ValueCellFull!5870) mapDefault!20293)) b!461275))

(assert (= start!41232 b!461274))

(declare-fun m!443935 () Bool)

(assert (=> mapNonEmpty!20293 m!443935))

(declare-fun m!443937 () Bool)

(assert (=> b!461264 m!443937))

(declare-fun m!443939 () Bool)

(assert (=> start!41232 m!443939))

(declare-fun m!443941 () Bool)

(assert (=> start!41232 m!443941))

(declare-fun m!443943 () Bool)

(assert (=> b!461271 m!443943))

(declare-fun m!443945 () Bool)

(assert (=> b!461270 m!443945))

(declare-fun m!443947 () Bool)

(assert (=> b!461270 m!443947))

(declare-fun m!443949 () Bool)

(assert (=> b!461265 m!443949))

(declare-fun m!443951 () Bool)

(assert (=> b!461280 m!443951))

(declare-fun m!443953 () Bool)

(assert (=> b!461280 m!443953))

(declare-fun m!443955 () Bool)

(assert (=> b!461280 m!443955))

(assert (=> b!461280 m!443951))

(declare-fun m!443957 () Bool)

(assert (=> b!461280 m!443957))

(declare-fun m!443959 () Bool)

(assert (=> b!461280 m!443959))

(declare-fun m!443961 () Bool)

(assert (=> b!461280 m!443961))

(assert (=> b!461280 m!443953))

(declare-fun m!443963 () Bool)

(assert (=> b!461268 m!443963))

(declare-fun m!443965 () Bool)

(assert (=> b!461266 m!443965))

(declare-fun m!443967 () Bool)

(assert (=> b!461278 m!443967))

(declare-fun m!443969 () Bool)

(assert (=> b!461278 m!443969))

(declare-fun m!443971 () Bool)

(assert (=> b!461278 m!443971))

(declare-fun m!443973 () Bool)

(assert (=> b!461279 m!443973))

(declare-fun m!443975 () Bool)

(assert (=> b!461276 m!443975))

(declare-fun m!443977 () Bool)

(assert (=> b!461272 m!443977))

(check-sat (not b!461270) b_and!19383 (not b!461276) (not b!461280) (not start!41232) (not b!461265) (not b!461278) (not b!461279) (not b!461268) (not b!461272) (not mapNonEmpty!20293) (not b!461271) tp_is_empty!12427 (not b_next!11089) (not b!461264))
(check-sat b_and!19383 (not b_next!11089))
(get-model)

(declare-fun b!461407 () Bool)

(assert (=> b!461407 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 _keys!709)))))

(assert (=> b!461407 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14117 _values!549)))))

(declare-fun e!269057 () Bool)

(declare-fun lt!208844 () ListLongMap!7187)

(declare-fun apply!318 (ListLongMap!7187 (_ BitVec 64)) V!17675)

(declare-fun get!6803 (ValueCell!5870 V!17675) V!17675)

(declare-fun dynLambda!914 (Int (_ BitVec 64)) V!17675)

(assert (=> b!461407 (= e!269057 (= (apply!318 lt!208844 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6803 (select (arr!13764 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461408 () Bool)

(declare-fun lt!208842 () Unit!13402)

(declare-fun lt!208847 () Unit!13402)

(assert (=> b!461408 (= lt!208842 lt!208847)))

(declare-fun lt!208843 () (_ BitVec 64))

(declare-fun lt!208848 () V!17675)

(declare-fun lt!208845 () (_ BitVec 64))

(declare-fun lt!208846 () ListLongMap!7187)

(declare-fun contains!2501 (ListLongMap!7187 (_ BitVec 64)) Bool)

(assert (=> b!461408 (not (contains!2501 (+!1661 lt!208846 (tuple2!8285 lt!208843 lt!208848)) lt!208845))))

(declare-fun addStillNotContains!152 (ListLongMap!7187 (_ BitVec 64) V!17675 (_ BitVec 64)) Unit!13402)

(assert (=> b!461408 (= lt!208847 (addStillNotContains!152 lt!208846 lt!208843 lt!208848 lt!208845))))

(assert (=> b!461408 (= lt!208845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461408 (= lt!208848 (get!6803 (select (arr!13764 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461408 (= lt!208843 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30149 () ListLongMap!7187)

(assert (=> b!461408 (= lt!208846 call!30149)))

(declare-fun e!269056 () ListLongMap!7187)

(assert (=> b!461408 (= e!269056 (+!1661 call!30149 (tuple2!8285 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6803 (select (arr!13764 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461409 () Bool)

(declare-fun e!269052 () ListLongMap!7187)

(assert (=> b!461409 (= e!269052 (ListLongMap!7188 Nil!8345))))

(declare-fun b!461410 () Bool)

(declare-fun e!269055 () Bool)

(assert (=> b!461410 (= e!269055 e!269057)))

(assert (=> b!461410 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 _keys!709)))))

(declare-fun res!276072 () Bool)

(assert (=> b!461410 (= res!276072 (contains!2501 lt!208844 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461410 (=> (not res!276072) (not e!269057))))

(declare-fun b!461411 () Bool)

(declare-fun res!276074 () Bool)

(declare-fun e!269051 () Bool)

(assert (=> b!461411 (=> (not res!276074) (not e!269051))))

(assert (=> b!461411 (= res!276074 (not (contains!2501 lt!208844 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461412 () Bool)

(assert (=> b!461412 (= e!269052 e!269056)))

(declare-fun c!56519 () Bool)

(assert (=> b!461412 (= c!56519 (validKeyInArray!0 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!461413 () Bool)

(declare-fun e!269053 () Bool)

(assert (=> b!461413 (= e!269055 e!269053)))

(declare-fun c!56522 () Bool)

(assert (=> b!461413 (= c!56522 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 _keys!709)))))

(declare-fun d!74661 () Bool)

(assert (=> d!74661 e!269051))

(declare-fun res!276073 () Bool)

(assert (=> d!74661 (=> (not res!276073) (not e!269051))))

(assert (=> d!74661 (= res!276073 (not (contains!2501 lt!208844 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74661 (= lt!208844 e!269052)))

(declare-fun c!56521 () Bool)

(assert (=> d!74661 (= c!56521 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14116 _keys!709)))))

(assert (=> d!74661 (validMask!0 mask!1025)))

(assert (=> d!74661 (= (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208844)))

(declare-fun b!461414 () Bool)

(assert (=> b!461414 (= e!269056 call!30149)))

(declare-fun b!461415 () Bool)

(declare-fun isEmpty!569 (ListLongMap!7187) Bool)

(assert (=> b!461415 (= e!269053 (isEmpty!569 lt!208844))))

(declare-fun b!461416 () Bool)

(assert (=> b!461416 (= e!269053 (= lt!208844 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461417 () Bool)

(assert (=> b!461417 (= e!269051 e!269055)))

(declare-fun c!56520 () Bool)

(declare-fun e!269054 () Bool)

(assert (=> b!461417 (= c!56520 e!269054)))

(declare-fun res!276071 () Bool)

(assert (=> b!461417 (=> (not res!276071) (not e!269054))))

(assert (=> b!461417 (= res!276071 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 _keys!709)))))

(declare-fun bm!30146 () Bool)

(assert (=> bm!30146 (= call!30149 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461418 () Bool)

(assert (=> b!461418 (= e!269054 (validKeyInArray!0 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461418 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(assert (= (and d!74661 c!56521) b!461409))

(assert (= (and d!74661 (not c!56521)) b!461412))

(assert (= (and b!461412 c!56519) b!461408))

(assert (= (and b!461412 (not c!56519)) b!461414))

(assert (= (or b!461408 b!461414) bm!30146))

(assert (= (and d!74661 res!276073) b!461411))

(assert (= (and b!461411 res!276074) b!461417))

(assert (= (and b!461417 res!276071) b!461418))

(assert (= (and b!461417 c!56520) b!461410))

(assert (= (and b!461417 (not c!56520)) b!461413))

(assert (= (and b!461410 res!276072) b!461407))

(assert (= (and b!461413 c!56522) b!461416))

(assert (= (and b!461413 (not c!56522)) b!461415))

(declare-fun b_lambda!9915 () Bool)

(assert (=> (not b_lambda!9915) (not b!461407)))

(declare-fun t!14287 () Bool)

(declare-fun tb!3893 () Bool)

(assert (=> (and start!41232 (= defaultEntry!557 defaultEntry!557) t!14287) tb!3893))

(declare-fun result!7341 () Bool)

(assert (=> tb!3893 (= result!7341 tp_is_empty!12427)))

(assert (=> b!461407 t!14287))

(declare-fun b_and!19389 () Bool)

(assert (= b_and!19383 (and (=> t!14287 result!7341) b_and!19389)))

(declare-fun b_lambda!9917 () Bool)

(assert (=> (not b_lambda!9917) (not b!461408)))

(assert (=> b!461408 t!14287))

(declare-fun b_and!19391 () Bool)

(assert (= b_and!19389 (and (=> t!14287 result!7341) b_and!19391)))

(declare-fun m!444067 () Bool)

(assert (=> b!461416 m!444067))

(declare-fun m!444069 () Bool)

(assert (=> b!461408 m!444069))

(declare-fun m!444071 () Bool)

(assert (=> b!461408 m!444071))

(declare-fun m!444073 () Bool)

(assert (=> b!461408 m!444073))

(declare-fun m!444075 () Bool)

(assert (=> b!461408 m!444075))

(assert (=> b!461408 m!444075))

(assert (=> b!461408 m!444069))

(declare-fun m!444077 () Bool)

(assert (=> b!461408 m!444077))

(assert (=> b!461408 m!444073))

(declare-fun m!444079 () Bool)

(assert (=> b!461408 m!444079))

(declare-fun m!444081 () Bool)

(assert (=> b!461408 m!444081))

(declare-fun m!444083 () Bool)

(assert (=> b!461408 m!444083))

(assert (=> b!461410 m!444083))

(assert (=> b!461410 m!444083))

(declare-fun m!444085 () Bool)

(assert (=> b!461410 m!444085))

(declare-fun m!444087 () Bool)

(assert (=> b!461415 m!444087))

(declare-fun m!444089 () Bool)

(assert (=> d!74661 m!444089))

(assert (=> d!74661 m!443977))

(assert (=> b!461412 m!444083))

(assert (=> b!461412 m!444083))

(declare-fun m!444091 () Bool)

(assert (=> b!461412 m!444091))

(assert (=> bm!30146 m!444067))

(assert (=> b!461407 m!444075))

(assert (=> b!461407 m!444075))

(assert (=> b!461407 m!444069))

(assert (=> b!461407 m!444077))

(assert (=> b!461407 m!444083))

(assert (=> b!461407 m!444069))

(assert (=> b!461407 m!444083))

(declare-fun m!444093 () Bool)

(assert (=> b!461407 m!444093))

(declare-fun m!444095 () Bool)

(assert (=> b!461411 m!444095))

(assert (=> b!461418 m!444083))

(assert (=> b!461418 m!444083))

(assert (=> b!461418 m!444091))

(assert (=> b!461280 d!74661))

(declare-fun d!74663 () Bool)

(declare-fun e!269060 () Bool)

(assert (=> d!74663 e!269060))

(declare-fun res!276079 () Bool)

(assert (=> d!74663 (=> (not res!276079) (not e!269060))))

(declare-fun lt!208860 () ListLongMap!7187)

(assert (=> d!74663 (= res!276079 (contains!2501 lt!208860 (_1!4153 lt!208787)))))

(declare-fun lt!208859 () List!8348)

(assert (=> d!74663 (= lt!208860 (ListLongMap!7188 lt!208859))))

(declare-fun lt!208858 () Unit!13402)

(declare-fun lt!208857 () Unit!13402)

(assert (=> d!74663 (= lt!208858 lt!208857)))

(declare-datatypes ((Option!379 0))(
  ( (Some!378 (v!8540 V!17675)) (None!377) )
))
(declare-fun getValueByKey!373 (List!8348 (_ BitVec 64)) Option!379)

(assert (=> d!74663 (= (getValueByKey!373 lt!208859 (_1!4153 lt!208787)) (Some!378 (_2!4153 lt!208787)))))

(declare-fun lemmaContainsTupThenGetReturnValue!198 (List!8348 (_ BitVec 64) V!17675) Unit!13402)

(assert (=> d!74663 (= lt!208857 (lemmaContainsTupThenGetReturnValue!198 lt!208859 (_1!4153 lt!208787) (_2!4153 lt!208787)))))

(declare-fun insertStrictlySorted!201 (List!8348 (_ BitVec 64) V!17675) List!8348)

(assert (=> d!74663 (= lt!208859 (insertStrictlySorted!201 (toList!3609 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557)) (_1!4153 lt!208787) (_2!4153 lt!208787)))))

(assert (=> d!74663 (= (+!1661 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208787) lt!208860)))

(declare-fun b!461425 () Bool)

(declare-fun res!276080 () Bool)

(assert (=> b!461425 (=> (not res!276080) (not e!269060))))

(assert (=> b!461425 (= res!276080 (= (getValueByKey!373 (toList!3609 lt!208860) (_1!4153 lt!208787)) (Some!378 (_2!4153 lt!208787))))))

(declare-fun b!461426 () Bool)

(declare-fun contains!2502 (List!8348 tuple2!8284) Bool)

(assert (=> b!461426 (= e!269060 (contains!2502 (toList!3609 lt!208860) lt!208787))))

(assert (= (and d!74663 res!276079) b!461425))

(assert (= (and b!461425 res!276080) b!461426))

(declare-fun m!444097 () Bool)

(assert (=> d!74663 m!444097))

(declare-fun m!444099 () Bool)

(assert (=> d!74663 m!444099))

(declare-fun m!444101 () Bool)

(assert (=> d!74663 m!444101))

(declare-fun m!444103 () Bool)

(assert (=> d!74663 m!444103))

(declare-fun m!444105 () Bool)

(assert (=> b!461425 m!444105))

(declare-fun m!444107 () Bool)

(assert (=> b!461426 m!444107))

(assert (=> b!461280 d!74663))

(declare-fun d!74665 () Bool)

(assert (=> d!74665 (= (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)) (and (not (= (select (arr!13763 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13763 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!461280 d!74665))

(declare-fun b!461427 () Bool)

(assert (=> b!461427 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 lt!208790)))))

(assert (=> b!461427 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14117 lt!208786)))))

(declare-fun lt!208863 () ListLongMap!7187)

(declare-fun e!269067 () Bool)

(assert (=> b!461427 (= e!269067 (= (apply!318 lt!208863 (select (arr!13763 lt!208790) (bvadd #b00000000000000000000000000000001 from!863))) (get!6803 (select (arr!13764 lt!208786) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461428 () Bool)

(declare-fun lt!208861 () Unit!13402)

(declare-fun lt!208866 () Unit!13402)

(assert (=> b!461428 (= lt!208861 lt!208866)))

(declare-fun lt!208862 () (_ BitVec 64))

(declare-fun lt!208865 () ListLongMap!7187)

(declare-fun lt!208864 () (_ BitVec 64))

(declare-fun lt!208867 () V!17675)

(assert (=> b!461428 (not (contains!2501 (+!1661 lt!208865 (tuple2!8285 lt!208862 lt!208867)) lt!208864))))

(assert (=> b!461428 (= lt!208866 (addStillNotContains!152 lt!208865 lt!208862 lt!208867 lt!208864))))

(assert (=> b!461428 (= lt!208864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461428 (= lt!208867 (get!6803 (select (arr!13764 lt!208786) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461428 (= lt!208862 (select (arr!13763 lt!208790) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30150 () ListLongMap!7187)

(assert (=> b!461428 (= lt!208865 call!30150)))

(declare-fun e!269066 () ListLongMap!7187)

(assert (=> b!461428 (= e!269066 (+!1661 call!30150 (tuple2!8285 (select (arr!13763 lt!208790) (bvadd #b00000000000000000000000000000001 from!863)) (get!6803 (select (arr!13764 lt!208786) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461429 () Bool)

(declare-fun e!269062 () ListLongMap!7187)

(assert (=> b!461429 (= e!269062 (ListLongMap!7188 Nil!8345))))

(declare-fun b!461430 () Bool)

(declare-fun e!269065 () Bool)

(assert (=> b!461430 (= e!269065 e!269067)))

(assert (=> b!461430 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 lt!208790)))))

(declare-fun res!276082 () Bool)

(assert (=> b!461430 (= res!276082 (contains!2501 lt!208863 (select (arr!13763 lt!208790) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461430 (=> (not res!276082) (not e!269067))))

(declare-fun b!461431 () Bool)

(declare-fun res!276084 () Bool)

(declare-fun e!269061 () Bool)

(assert (=> b!461431 (=> (not res!276084) (not e!269061))))

(assert (=> b!461431 (= res!276084 (not (contains!2501 lt!208863 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461432 () Bool)

(assert (=> b!461432 (= e!269062 e!269066)))

(declare-fun c!56523 () Bool)

(assert (=> b!461432 (= c!56523 (validKeyInArray!0 (select (arr!13763 lt!208790) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!461433 () Bool)

(declare-fun e!269063 () Bool)

(assert (=> b!461433 (= e!269065 e!269063)))

(declare-fun c!56526 () Bool)

(assert (=> b!461433 (= c!56526 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 lt!208790)))))

(declare-fun d!74667 () Bool)

(assert (=> d!74667 e!269061))

(declare-fun res!276083 () Bool)

(assert (=> d!74667 (=> (not res!276083) (not e!269061))))

(assert (=> d!74667 (= res!276083 (not (contains!2501 lt!208863 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74667 (= lt!208863 e!269062)))

(declare-fun c!56525 () Bool)

(assert (=> d!74667 (= c!56525 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14116 lt!208790)))))

(assert (=> d!74667 (validMask!0 mask!1025)))

(assert (=> d!74667 (= (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208863)))

(declare-fun b!461434 () Bool)

(assert (=> b!461434 (= e!269066 call!30150)))

(declare-fun b!461435 () Bool)

(assert (=> b!461435 (= e!269063 (isEmpty!569 lt!208863))))

(declare-fun b!461436 () Bool)

(assert (=> b!461436 (= e!269063 (= lt!208863 (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461437 () Bool)

(assert (=> b!461437 (= e!269061 e!269065)))

(declare-fun c!56524 () Bool)

(declare-fun e!269064 () Bool)

(assert (=> b!461437 (= c!56524 e!269064)))

(declare-fun res!276081 () Bool)

(assert (=> b!461437 (=> (not res!276081) (not e!269064))))

(assert (=> b!461437 (= res!276081 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 lt!208790)))))

(declare-fun bm!30147 () Bool)

(assert (=> bm!30147 (= call!30150 (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461438 () Bool)

(assert (=> b!461438 (= e!269064 (validKeyInArray!0 (select (arr!13763 lt!208790) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461438 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(assert (= (and d!74667 c!56525) b!461429))

(assert (= (and d!74667 (not c!56525)) b!461432))

(assert (= (and b!461432 c!56523) b!461428))

(assert (= (and b!461432 (not c!56523)) b!461434))

(assert (= (or b!461428 b!461434) bm!30147))

(assert (= (and d!74667 res!276083) b!461431))

(assert (= (and b!461431 res!276084) b!461437))

(assert (= (and b!461437 res!276081) b!461438))

(assert (= (and b!461437 c!56524) b!461430))

(assert (= (and b!461437 (not c!56524)) b!461433))

(assert (= (and b!461430 res!276082) b!461427))

(assert (= (and b!461433 c!56526) b!461436))

(assert (= (and b!461433 (not c!56526)) b!461435))

(declare-fun b_lambda!9919 () Bool)

(assert (=> (not b_lambda!9919) (not b!461427)))

(assert (=> b!461427 t!14287))

(declare-fun b_and!19393 () Bool)

(assert (= b_and!19391 (and (=> t!14287 result!7341) b_and!19393)))

(declare-fun b_lambda!9921 () Bool)

(assert (=> (not b_lambda!9921) (not b!461428)))

(assert (=> b!461428 t!14287))

(declare-fun b_and!19395 () Bool)

(assert (= b_and!19393 (and (=> t!14287 result!7341) b_and!19395)))

(declare-fun m!444109 () Bool)

(assert (=> b!461436 m!444109))

(assert (=> b!461428 m!444069))

(declare-fun m!444111 () Bool)

(assert (=> b!461428 m!444111))

(declare-fun m!444113 () Bool)

(assert (=> b!461428 m!444113))

(declare-fun m!444115 () Bool)

(assert (=> b!461428 m!444115))

(assert (=> b!461428 m!444115))

(assert (=> b!461428 m!444069))

(declare-fun m!444117 () Bool)

(assert (=> b!461428 m!444117))

(assert (=> b!461428 m!444113))

(declare-fun m!444119 () Bool)

(assert (=> b!461428 m!444119))

(declare-fun m!444121 () Bool)

(assert (=> b!461428 m!444121))

(declare-fun m!444123 () Bool)

(assert (=> b!461428 m!444123))

(assert (=> b!461430 m!444123))

(assert (=> b!461430 m!444123))

(declare-fun m!444125 () Bool)

(assert (=> b!461430 m!444125))

(declare-fun m!444127 () Bool)

(assert (=> b!461435 m!444127))

(declare-fun m!444129 () Bool)

(assert (=> d!74667 m!444129))

(assert (=> d!74667 m!443977))

(assert (=> b!461432 m!444123))

(assert (=> b!461432 m!444123))

(declare-fun m!444131 () Bool)

(assert (=> b!461432 m!444131))

(assert (=> bm!30147 m!444109))

(assert (=> b!461427 m!444115))

(assert (=> b!461427 m!444115))

(assert (=> b!461427 m!444069))

(assert (=> b!461427 m!444117))

(assert (=> b!461427 m!444123))

(assert (=> b!461427 m!444069))

(assert (=> b!461427 m!444123))

(declare-fun m!444133 () Bool)

(assert (=> b!461427 m!444133))

(declare-fun m!444135 () Bool)

(assert (=> b!461431 m!444135))

(assert (=> b!461438 m!444123))

(assert (=> b!461438 m!444123))

(assert (=> b!461438 m!444131))

(assert (=> b!461280 d!74667))

(declare-fun d!74669 () Bool)

(declare-fun e!269072 () Bool)

(assert (=> d!74669 e!269072))

(declare-fun res!276087 () Bool)

(assert (=> d!74669 (=> (not res!276087) (not e!269072))))

(assert (=> d!74669 (= res!276087 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14116 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14117 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14116 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14117 _values!549))))))))

(declare-fun lt!208870 () Unit!13402)

(declare-fun choose!1343 (array!28647 array!28649 (_ BitVec 32) (_ BitVec 32) V!17675 V!17675 (_ BitVec 32) (_ BitVec 64) V!17675 (_ BitVec 32) Int) Unit!13402)

(assert (=> d!74669 (= lt!208870 (choose!1343 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74669 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14116 _keys!709)))))

(assert (=> d!74669 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!791 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208870)))

(declare-fun call!30156 () ListLongMap!7187)

(declare-fun bm!30152 () Bool)

(assert (=> bm!30152 (= call!30156 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461445 () Bool)

(declare-fun e!269073 () Bool)

(assert (=> b!461445 (= e!269072 e!269073)))

(declare-fun c!56529 () Bool)

(assert (=> b!461445 (= c!56529 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!461446 () Bool)

(declare-fun call!30155 () ListLongMap!7187)

(assert (=> b!461446 (= e!269073 (= call!30155 (+!1661 call!30156 (tuple2!8285 k0!794 v!412))))))

(declare-fun b!461447 () Bool)

(assert (=> b!461447 (= e!269073 (= call!30155 call!30156))))

(declare-fun bm!30153 () Bool)

(assert (=> bm!30153 (= call!30155 (getCurrentListMapNoExtraKeys!1801 (array!28648 (store (arr!13763 _keys!709) i!563 k0!794) (size!14116 _keys!709)) (array!28650 (store (arr!13764 _values!549) i!563 (ValueCellFull!5870 v!412)) (size!14117 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74669 res!276087) b!461445))

(assert (= (and b!461445 c!56529) b!461446))

(assert (= (and b!461445 (not c!56529)) b!461447))

(assert (= (or b!461446 b!461447) bm!30152))

(assert (= (or b!461446 b!461447) bm!30153))

(declare-fun m!444137 () Bool)

(assert (=> d!74669 m!444137))

(assert (=> bm!30152 m!443953))

(declare-fun m!444139 () Bool)

(assert (=> b!461446 m!444139))

(assert (=> bm!30153 m!443947))

(assert (=> bm!30153 m!443969))

(declare-fun m!444141 () Bool)

(assert (=> bm!30153 m!444141))

(assert (=> b!461280 d!74669))

(declare-fun b!461456 () Bool)

(declare-fun e!269082 () Bool)

(declare-fun call!30159 () Bool)

(assert (=> b!461456 (= e!269082 call!30159)))

(declare-fun bm!30156 () Bool)

(assert (=> bm!30156 (= call!30159 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!208790 mask!1025))))

(declare-fun d!74671 () Bool)

(declare-fun res!276093 () Bool)

(declare-fun e!269081 () Bool)

(assert (=> d!74671 (=> res!276093 e!269081)))

(assert (=> d!74671 (= res!276093 (bvsge #b00000000000000000000000000000000 (size!14116 lt!208790)))))

(assert (=> d!74671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208790 mask!1025) e!269081)))

(declare-fun b!461457 () Bool)

(declare-fun e!269080 () Bool)

(assert (=> b!461457 (= e!269080 call!30159)))

(declare-fun b!461458 () Bool)

(assert (=> b!461458 (= e!269081 e!269080)))

(declare-fun c!56532 () Bool)

(assert (=> b!461458 (= c!56532 (validKeyInArray!0 (select (arr!13763 lt!208790) #b00000000000000000000000000000000)))))

(declare-fun b!461459 () Bool)

(assert (=> b!461459 (= e!269080 e!269082)))

(declare-fun lt!208878 () (_ BitVec 64))

(assert (=> b!461459 (= lt!208878 (select (arr!13763 lt!208790) #b00000000000000000000000000000000))))

(declare-fun lt!208877 () Unit!13402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28647 (_ BitVec 64) (_ BitVec 32)) Unit!13402)

(assert (=> b!461459 (= lt!208877 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!208790 lt!208878 #b00000000000000000000000000000000))))

(assert (=> b!461459 (arrayContainsKey!0 lt!208790 lt!208878 #b00000000000000000000000000000000)))

(declare-fun lt!208879 () Unit!13402)

(assert (=> b!461459 (= lt!208879 lt!208877)))

(declare-fun res!276092 () Bool)

(declare-datatypes ((SeekEntryResult!3532 0))(
  ( (MissingZero!3532 (index!16307 (_ BitVec 32))) (Found!3532 (index!16308 (_ BitVec 32))) (Intermediate!3532 (undefined!4344 Bool) (index!16309 (_ BitVec 32)) (x!43013 (_ BitVec 32))) (Undefined!3532) (MissingVacant!3532 (index!16310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28647 (_ BitVec 32)) SeekEntryResult!3532)

(assert (=> b!461459 (= res!276092 (= (seekEntryOrOpen!0 (select (arr!13763 lt!208790) #b00000000000000000000000000000000) lt!208790 mask!1025) (Found!3532 #b00000000000000000000000000000000)))))

(assert (=> b!461459 (=> (not res!276092) (not e!269082))))

(assert (= (and d!74671 (not res!276093)) b!461458))

(assert (= (and b!461458 c!56532) b!461459))

(assert (= (and b!461458 (not c!56532)) b!461457))

(assert (= (and b!461459 res!276092) b!461456))

(assert (= (or b!461456 b!461457) bm!30156))

(declare-fun m!444143 () Bool)

(assert (=> bm!30156 m!444143))

(declare-fun m!444145 () Bool)

(assert (=> b!461458 m!444145))

(assert (=> b!461458 m!444145))

(declare-fun m!444147 () Bool)

(assert (=> b!461458 m!444147))

(assert (=> b!461459 m!444145))

(declare-fun m!444149 () Bool)

(assert (=> b!461459 m!444149))

(declare-fun m!444151 () Bool)

(assert (=> b!461459 m!444151))

(assert (=> b!461459 m!444145))

(declare-fun m!444153 () Bool)

(assert (=> b!461459 m!444153))

(assert (=> b!461270 d!74671))

(declare-fun d!74673 () Bool)

(assert (=> d!74673 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!461271 d!74673))

(declare-fun d!74675 () Bool)

(assert (=> d!74675 (= (array_inv!10020 _values!549) (bvsge (size!14117 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41232 d!74675))

(declare-fun d!74677 () Bool)

(assert (=> d!74677 (= (array_inv!10021 _keys!709) (bvsge (size!14116 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41232 d!74677))

(declare-fun d!74679 () Bool)

(declare-fun res!276098 () Bool)

(declare-fun e!269087 () Bool)

(assert (=> d!74679 (=> res!276098 e!269087)))

(assert (=> d!74679 (= res!276098 (= (select (arr!13763 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74679 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!269087)))

(declare-fun b!461464 () Bool)

(declare-fun e!269088 () Bool)

(assert (=> b!461464 (= e!269087 e!269088)))

(declare-fun res!276099 () Bool)

(assert (=> b!461464 (=> (not res!276099) (not e!269088))))

(assert (=> b!461464 (= res!276099 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14116 _keys!709)))))

(declare-fun b!461465 () Bool)

(assert (=> b!461465 (= e!269088 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74679 (not res!276098)) b!461464))

(assert (= (and b!461464 res!276099) b!461465))

(declare-fun m!444155 () Bool)

(assert (=> d!74679 m!444155))

(declare-fun m!444157 () Bool)

(assert (=> b!461465 m!444157))

(assert (=> b!461265 d!74679))

(declare-fun b!461466 () Bool)

(declare-fun e!269091 () Bool)

(declare-fun call!30160 () Bool)

(assert (=> b!461466 (= e!269091 call!30160)))

(declare-fun bm!30157 () Bool)

(assert (=> bm!30157 (= call!30160 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun d!74681 () Bool)

(declare-fun res!276101 () Bool)

(declare-fun e!269090 () Bool)

(assert (=> d!74681 (=> res!276101 e!269090)))

(assert (=> d!74681 (= res!276101 (bvsge #b00000000000000000000000000000000 (size!14116 _keys!709)))))

(assert (=> d!74681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!269090)))

(declare-fun b!461467 () Bool)

(declare-fun e!269089 () Bool)

(assert (=> b!461467 (= e!269089 call!30160)))

(declare-fun b!461468 () Bool)

(assert (=> b!461468 (= e!269090 e!269089)))

(declare-fun c!56533 () Bool)

(assert (=> b!461468 (= c!56533 (validKeyInArray!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!461469 () Bool)

(assert (=> b!461469 (= e!269089 e!269091)))

(declare-fun lt!208881 () (_ BitVec 64))

(assert (=> b!461469 (= lt!208881 (select (arr!13763 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!208880 () Unit!13402)

(assert (=> b!461469 (= lt!208880 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!208881 #b00000000000000000000000000000000))))

(assert (=> b!461469 (arrayContainsKey!0 _keys!709 lt!208881 #b00000000000000000000000000000000)))

(declare-fun lt!208882 () Unit!13402)

(assert (=> b!461469 (= lt!208882 lt!208880)))

(declare-fun res!276100 () Bool)

(assert (=> b!461469 (= res!276100 (= (seekEntryOrOpen!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3532 #b00000000000000000000000000000000)))))

(assert (=> b!461469 (=> (not res!276100) (not e!269091))))

(assert (= (and d!74681 (not res!276101)) b!461468))

(assert (= (and b!461468 c!56533) b!461469))

(assert (= (and b!461468 (not c!56533)) b!461467))

(assert (= (and b!461469 res!276100) b!461466))

(assert (= (or b!461466 b!461467) bm!30157))

(declare-fun m!444159 () Bool)

(assert (=> bm!30157 m!444159))

(assert (=> b!461468 m!444155))

(assert (=> b!461468 m!444155))

(declare-fun m!444161 () Bool)

(assert (=> b!461468 m!444161))

(assert (=> b!461469 m!444155))

(declare-fun m!444163 () Bool)

(assert (=> b!461469 m!444163))

(declare-fun m!444165 () Bool)

(assert (=> b!461469 m!444165))

(assert (=> b!461469 m!444155))

(declare-fun m!444167 () Bool)

(assert (=> b!461469 m!444167))

(assert (=> b!461279 d!74681))

(declare-fun d!74683 () Bool)

(declare-fun res!276108 () Bool)

(declare-fun e!269101 () Bool)

(assert (=> d!74683 (=> res!276108 e!269101)))

(assert (=> d!74683 (= res!276108 (bvsge #b00000000000000000000000000000000 (size!14116 _keys!709)))))

(assert (=> d!74683 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8344) e!269101)))

(declare-fun b!461480 () Bool)

(declare-fun e!269100 () Bool)

(declare-fun call!30163 () Bool)

(assert (=> b!461480 (= e!269100 call!30163)))

(declare-fun b!461481 () Bool)

(assert (=> b!461481 (= e!269100 call!30163)))

(declare-fun b!461482 () Bool)

(declare-fun e!269102 () Bool)

(declare-fun contains!2503 (List!8347 (_ BitVec 64)) Bool)

(assert (=> b!461482 (= e!269102 (contains!2503 Nil!8344 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!461483 () Bool)

(declare-fun e!269103 () Bool)

(assert (=> b!461483 (= e!269103 e!269100)))

(declare-fun c!56536 () Bool)

(assert (=> b!461483 (= c!56536 (validKeyInArray!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!461484 () Bool)

(assert (=> b!461484 (= e!269101 e!269103)))

(declare-fun res!276110 () Bool)

(assert (=> b!461484 (=> (not res!276110) (not e!269103))))

(assert (=> b!461484 (= res!276110 (not e!269102))))

(declare-fun res!276109 () Bool)

(assert (=> b!461484 (=> (not res!276109) (not e!269102))))

(assert (=> b!461484 (= res!276109 (validKeyInArray!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30160 () Bool)

(assert (=> bm!30160 (= call!30163 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56536 (Cons!8343 (select (arr!13763 _keys!709) #b00000000000000000000000000000000) Nil!8344) Nil!8344)))))

(assert (= (and d!74683 (not res!276108)) b!461484))

(assert (= (and b!461484 res!276109) b!461482))

(assert (= (and b!461484 res!276110) b!461483))

(assert (= (and b!461483 c!56536) b!461481))

(assert (= (and b!461483 (not c!56536)) b!461480))

(assert (= (or b!461481 b!461480) bm!30160))

(assert (=> b!461482 m!444155))

(assert (=> b!461482 m!444155))

(declare-fun m!444169 () Bool)

(assert (=> b!461482 m!444169))

(assert (=> b!461483 m!444155))

(assert (=> b!461483 m!444155))

(assert (=> b!461483 m!444161))

(assert (=> b!461484 m!444155))

(assert (=> b!461484 m!444155))

(assert (=> b!461484 m!444161))

(assert (=> bm!30160 m!444155))

(declare-fun m!444171 () Bool)

(assert (=> bm!30160 m!444171))

(assert (=> b!461264 d!74683))

(declare-fun b!461485 () Bool)

(assert (=> b!461485 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14116 lt!208790)))))

(assert (=> b!461485 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14117 lt!208786)))))

(declare-fun e!269110 () Bool)

(declare-fun lt!208885 () ListLongMap!7187)

(assert (=> b!461485 (= e!269110 (= (apply!318 lt!208885 (select (arr!13763 lt!208790) from!863)) (get!6803 (select (arr!13764 lt!208786) from!863) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461486 () Bool)

(declare-fun lt!208883 () Unit!13402)

(declare-fun lt!208888 () Unit!13402)

(assert (=> b!461486 (= lt!208883 lt!208888)))

(declare-fun lt!208884 () (_ BitVec 64))

(declare-fun lt!208889 () V!17675)

(declare-fun lt!208886 () (_ BitVec 64))

(declare-fun lt!208887 () ListLongMap!7187)

(assert (=> b!461486 (not (contains!2501 (+!1661 lt!208887 (tuple2!8285 lt!208884 lt!208889)) lt!208886))))

(assert (=> b!461486 (= lt!208888 (addStillNotContains!152 lt!208887 lt!208884 lt!208889 lt!208886))))

(assert (=> b!461486 (= lt!208886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461486 (= lt!208889 (get!6803 (select (arr!13764 lt!208786) from!863) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461486 (= lt!208884 (select (arr!13763 lt!208790) from!863))))

(declare-fun call!30164 () ListLongMap!7187)

(assert (=> b!461486 (= lt!208887 call!30164)))

(declare-fun e!269109 () ListLongMap!7187)

(assert (=> b!461486 (= e!269109 (+!1661 call!30164 (tuple2!8285 (select (arr!13763 lt!208790) from!863) (get!6803 (select (arr!13764 lt!208786) from!863) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461487 () Bool)

(declare-fun e!269105 () ListLongMap!7187)

(assert (=> b!461487 (= e!269105 (ListLongMap!7188 Nil!8345))))

(declare-fun b!461488 () Bool)

(declare-fun e!269108 () Bool)

(assert (=> b!461488 (= e!269108 e!269110)))

(assert (=> b!461488 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14116 lt!208790)))))

(declare-fun res!276112 () Bool)

(assert (=> b!461488 (= res!276112 (contains!2501 lt!208885 (select (arr!13763 lt!208790) from!863)))))

(assert (=> b!461488 (=> (not res!276112) (not e!269110))))

(declare-fun b!461489 () Bool)

(declare-fun res!276114 () Bool)

(declare-fun e!269104 () Bool)

(assert (=> b!461489 (=> (not res!276114) (not e!269104))))

(assert (=> b!461489 (= res!276114 (not (contains!2501 lt!208885 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461490 () Bool)

(assert (=> b!461490 (= e!269105 e!269109)))

(declare-fun c!56537 () Bool)

(assert (=> b!461490 (= c!56537 (validKeyInArray!0 (select (arr!13763 lt!208790) from!863)))))

(declare-fun b!461491 () Bool)

(declare-fun e!269106 () Bool)

(assert (=> b!461491 (= e!269108 e!269106)))

(declare-fun c!56540 () Bool)

(assert (=> b!461491 (= c!56540 (bvslt from!863 (size!14116 lt!208790)))))

(declare-fun d!74685 () Bool)

(assert (=> d!74685 e!269104))

(declare-fun res!276113 () Bool)

(assert (=> d!74685 (=> (not res!276113) (not e!269104))))

(assert (=> d!74685 (= res!276113 (not (contains!2501 lt!208885 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74685 (= lt!208885 e!269105)))

(declare-fun c!56539 () Bool)

(assert (=> d!74685 (= c!56539 (bvsge from!863 (size!14116 lt!208790)))))

(assert (=> d!74685 (validMask!0 mask!1025)))

(assert (=> d!74685 (= (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208885)))

(declare-fun b!461492 () Bool)

(assert (=> b!461492 (= e!269109 call!30164)))

(declare-fun b!461493 () Bool)

(assert (=> b!461493 (= e!269106 (isEmpty!569 lt!208885))))

(declare-fun b!461494 () Bool)

(assert (=> b!461494 (= e!269106 (= lt!208885 (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461495 () Bool)

(assert (=> b!461495 (= e!269104 e!269108)))

(declare-fun c!56538 () Bool)

(declare-fun e!269107 () Bool)

(assert (=> b!461495 (= c!56538 e!269107)))

(declare-fun res!276111 () Bool)

(assert (=> b!461495 (=> (not res!276111) (not e!269107))))

(assert (=> b!461495 (= res!276111 (bvslt from!863 (size!14116 lt!208790)))))

(declare-fun bm!30161 () Bool)

(assert (=> bm!30161 (= call!30164 (getCurrentListMapNoExtraKeys!1801 lt!208790 lt!208786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461496 () Bool)

(assert (=> b!461496 (= e!269107 (validKeyInArray!0 (select (arr!13763 lt!208790) from!863)))))

(assert (=> b!461496 (bvsge from!863 #b00000000000000000000000000000000)))

(assert (= (and d!74685 c!56539) b!461487))

(assert (= (and d!74685 (not c!56539)) b!461490))

(assert (= (and b!461490 c!56537) b!461486))

(assert (= (and b!461490 (not c!56537)) b!461492))

(assert (= (or b!461486 b!461492) bm!30161))

(assert (= (and d!74685 res!276113) b!461489))

(assert (= (and b!461489 res!276114) b!461495))

(assert (= (and b!461495 res!276111) b!461496))

(assert (= (and b!461495 c!56538) b!461488))

(assert (= (and b!461495 (not c!56538)) b!461491))

(assert (= (and b!461488 res!276112) b!461485))

(assert (= (and b!461491 c!56540) b!461494))

(assert (= (and b!461491 (not c!56540)) b!461493))

(declare-fun b_lambda!9923 () Bool)

(assert (=> (not b_lambda!9923) (not b!461485)))

(assert (=> b!461485 t!14287))

(declare-fun b_and!19397 () Bool)

(assert (= b_and!19395 (and (=> t!14287 result!7341) b_and!19397)))

(declare-fun b_lambda!9925 () Bool)

(assert (=> (not b_lambda!9925) (not b!461486)))

(assert (=> b!461486 t!14287))

(declare-fun b_and!19399 () Bool)

(assert (= b_and!19397 (and (=> t!14287 result!7341) b_and!19399)))

(declare-fun m!444173 () Bool)

(assert (=> b!461494 m!444173))

(assert (=> b!461486 m!444069))

(declare-fun m!444175 () Bool)

(assert (=> b!461486 m!444175))

(declare-fun m!444177 () Bool)

(assert (=> b!461486 m!444177))

(declare-fun m!444179 () Bool)

(assert (=> b!461486 m!444179))

(assert (=> b!461486 m!444179))

(assert (=> b!461486 m!444069))

(declare-fun m!444181 () Bool)

(assert (=> b!461486 m!444181))

(assert (=> b!461486 m!444177))

(declare-fun m!444183 () Bool)

(assert (=> b!461486 m!444183))

(declare-fun m!444185 () Bool)

(assert (=> b!461486 m!444185))

(declare-fun m!444187 () Bool)

(assert (=> b!461486 m!444187))

(assert (=> b!461488 m!444187))

(assert (=> b!461488 m!444187))

(declare-fun m!444189 () Bool)

(assert (=> b!461488 m!444189))

(declare-fun m!444191 () Bool)

(assert (=> b!461493 m!444191))

(declare-fun m!444193 () Bool)

(assert (=> d!74685 m!444193))

(assert (=> d!74685 m!443977))

(assert (=> b!461490 m!444187))

(assert (=> b!461490 m!444187))

(declare-fun m!444195 () Bool)

(assert (=> b!461490 m!444195))

(assert (=> bm!30161 m!444173))

(assert (=> b!461485 m!444179))

(assert (=> b!461485 m!444179))

(assert (=> b!461485 m!444069))

(assert (=> b!461485 m!444181))

(assert (=> b!461485 m!444187))

(assert (=> b!461485 m!444069))

(assert (=> b!461485 m!444187))

(declare-fun m!444197 () Bool)

(assert (=> b!461485 m!444197))

(declare-fun m!444199 () Bool)

(assert (=> b!461489 m!444199))

(assert (=> b!461496 m!444187))

(assert (=> b!461496 m!444187))

(assert (=> b!461496 m!444195))

(assert (=> b!461278 d!74685))

(declare-fun b!461497 () Bool)

(assert (=> b!461497 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14116 _keys!709)))))

(assert (=> b!461497 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14117 _values!549)))))

(declare-fun e!269117 () Bool)

(declare-fun lt!208892 () ListLongMap!7187)

(assert (=> b!461497 (= e!269117 (= (apply!318 lt!208892 (select (arr!13763 _keys!709) from!863)) (get!6803 (select (arr!13764 _values!549) from!863) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461498 () Bool)

(declare-fun lt!208890 () Unit!13402)

(declare-fun lt!208895 () Unit!13402)

(assert (=> b!461498 (= lt!208890 lt!208895)))

(declare-fun lt!208891 () (_ BitVec 64))

(declare-fun lt!208894 () ListLongMap!7187)

(declare-fun lt!208896 () V!17675)

(declare-fun lt!208893 () (_ BitVec 64))

(assert (=> b!461498 (not (contains!2501 (+!1661 lt!208894 (tuple2!8285 lt!208891 lt!208896)) lt!208893))))

(assert (=> b!461498 (= lt!208895 (addStillNotContains!152 lt!208894 lt!208891 lt!208896 lt!208893))))

(assert (=> b!461498 (= lt!208893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461498 (= lt!208896 (get!6803 (select (arr!13764 _values!549) from!863) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461498 (= lt!208891 (select (arr!13763 _keys!709) from!863))))

(declare-fun call!30165 () ListLongMap!7187)

(assert (=> b!461498 (= lt!208894 call!30165)))

(declare-fun e!269116 () ListLongMap!7187)

(assert (=> b!461498 (= e!269116 (+!1661 call!30165 (tuple2!8285 (select (arr!13763 _keys!709) from!863) (get!6803 (select (arr!13764 _values!549) from!863) (dynLambda!914 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461499 () Bool)

(declare-fun e!269112 () ListLongMap!7187)

(assert (=> b!461499 (= e!269112 (ListLongMap!7188 Nil!8345))))

(declare-fun b!461500 () Bool)

(declare-fun e!269115 () Bool)

(assert (=> b!461500 (= e!269115 e!269117)))

(assert (=> b!461500 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14116 _keys!709)))))

(declare-fun res!276116 () Bool)

(assert (=> b!461500 (= res!276116 (contains!2501 lt!208892 (select (arr!13763 _keys!709) from!863)))))

(assert (=> b!461500 (=> (not res!276116) (not e!269117))))

(declare-fun b!461501 () Bool)

(declare-fun res!276118 () Bool)

(declare-fun e!269111 () Bool)

(assert (=> b!461501 (=> (not res!276118) (not e!269111))))

(assert (=> b!461501 (= res!276118 (not (contains!2501 lt!208892 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461502 () Bool)

(assert (=> b!461502 (= e!269112 e!269116)))

(declare-fun c!56541 () Bool)

(assert (=> b!461502 (= c!56541 (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)))))

(declare-fun b!461503 () Bool)

(declare-fun e!269113 () Bool)

(assert (=> b!461503 (= e!269115 e!269113)))

(declare-fun c!56544 () Bool)

(assert (=> b!461503 (= c!56544 (bvslt from!863 (size!14116 _keys!709)))))

(declare-fun d!74687 () Bool)

(assert (=> d!74687 e!269111))

(declare-fun res!276117 () Bool)

(assert (=> d!74687 (=> (not res!276117) (not e!269111))))

(assert (=> d!74687 (= res!276117 (not (contains!2501 lt!208892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74687 (= lt!208892 e!269112)))

(declare-fun c!56543 () Bool)

(assert (=> d!74687 (= c!56543 (bvsge from!863 (size!14116 _keys!709)))))

(assert (=> d!74687 (validMask!0 mask!1025)))

(assert (=> d!74687 (= (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208892)))

(declare-fun b!461504 () Bool)

(assert (=> b!461504 (= e!269116 call!30165)))

(declare-fun b!461505 () Bool)

(assert (=> b!461505 (= e!269113 (isEmpty!569 lt!208892))))

(declare-fun b!461506 () Bool)

(assert (=> b!461506 (= e!269113 (= lt!208892 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461507 () Bool)

(assert (=> b!461507 (= e!269111 e!269115)))

(declare-fun c!56542 () Bool)

(declare-fun e!269114 () Bool)

(assert (=> b!461507 (= c!56542 e!269114)))

(declare-fun res!276115 () Bool)

(assert (=> b!461507 (=> (not res!276115) (not e!269114))))

(assert (=> b!461507 (= res!276115 (bvslt from!863 (size!14116 _keys!709)))))

(declare-fun bm!30162 () Bool)

(assert (=> bm!30162 (= call!30165 (getCurrentListMapNoExtraKeys!1801 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461508 () Bool)

(assert (=> b!461508 (= e!269114 (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)))))

(assert (=> b!461508 (bvsge from!863 #b00000000000000000000000000000000)))

(assert (= (and d!74687 c!56543) b!461499))

(assert (= (and d!74687 (not c!56543)) b!461502))

(assert (= (and b!461502 c!56541) b!461498))

(assert (= (and b!461502 (not c!56541)) b!461504))

(assert (= (or b!461498 b!461504) bm!30162))

(assert (= (and d!74687 res!276117) b!461501))

(assert (= (and b!461501 res!276118) b!461507))

(assert (= (and b!461507 res!276115) b!461508))

(assert (= (and b!461507 c!56542) b!461500))

(assert (= (and b!461507 (not c!56542)) b!461503))

(assert (= (and b!461500 res!276116) b!461497))

(assert (= (and b!461503 c!56544) b!461506))

(assert (= (and b!461503 (not c!56544)) b!461505))

(declare-fun b_lambda!9927 () Bool)

(assert (=> (not b_lambda!9927) (not b!461497)))

(assert (=> b!461497 t!14287))

(declare-fun b_and!19401 () Bool)

(assert (= b_and!19399 (and (=> t!14287 result!7341) b_and!19401)))

(declare-fun b_lambda!9929 () Bool)

(assert (=> (not b_lambda!9929) (not b!461498)))

(assert (=> b!461498 t!14287))

(declare-fun b_and!19403 () Bool)

(assert (= b_and!19401 (and (=> t!14287 result!7341) b_and!19403)))

(declare-fun m!444201 () Bool)

(assert (=> b!461506 m!444201))

(assert (=> b!461498 m!444069))

(declare-fun m!444203 () Bool)

(assert (=> b!461498 m!444203))

(declare-fun m!444205 () Bool)

(assert (=> b!461498 m!444205))

(declare-fun m!444207 () Bool)

(assert (=> b!461498 m!444207))

(assert (=> b!461498 m!444207))

(assert (=> b!461498 m!444069))

(declare-fun m!444209 () Bool)

(assert (=> b!461498 m!444209))

(assert (=> b!461498 m!444205))

(declare-fun m!444211 () Bool)

(assert (=> b!461498 m!444211))

(declare-fun m!444213 () Bool)

(assert (=> b!461498 m!444213))

(assert (=> b!461498 m!443951))

(assert (=> b!461500 m!443951))

(assert (=> b!461500 m!443951))

(declare-fun m!444215 () Bool)

(assert (=> b!461500 m!444215))

(declare-fun m!444217 () Bool)

(assert (=> b!461505 m!444217))

(declare-fun m!444219 () Bool)

(assert (=> d!74687 m!444219))

(assert (=> d!74687 m!443977))

(assert (=> b!461502 m!443951))

(assert (=> b!461502 m!443951))

(assert (=> b!461502 m!443957))

(assert (=> bm!30162 m!444201))

(assert (=> b!461497 m!444207))

(assert (=> b!461497 m!444207))

(assert (=> b!461497 m!444069))

(assert (=> b!461497 m!444209))

(assert (=> b!461497 m!443951))

(assert (=> b!461497 m!444069))

(assert (=> b!461497 m!443951))

(declare-fun m!444221 () Bool)

(assert (=> b!461497 m!444221))

(declare-fun m!444223 () Bool)

(assert (=> b!461501 m!444223))

(assert (=> b!461508 m!443951))

(assert (=> b!461508 m!443951))

(assert (=> b!461508 m!443957))

(assert (=> b!461278 d!74687))

(declare-fun d!74689 () Bool)

(declare-fun res!276119 () Bool)

(declare-fun e!269119 () Bool)

(assert (=> d!74689 (=> res!276119 e!269119)))

(assert (=> d!74689 (= res!276119 (bvsge #b00000000000000000000000000000000 (size!14116 lt!208790)))))

(assert (=> d!74689 (= (arrayNoDuplicates!0 lt!208790 #b00000000000000000000000000000000 Nil!8344) e!269119)))

(declare-fun b!461509 () Bool)

(declare-fun e!269118 () Bool)

(declare-fun call!30166 () Bool)

(assert (=> b!461509 (= e!269118 call!30166)))

(declare-fun b!461510 () Bool)

(assert (=> b!461510 (= e!269118 call!30166)))

(declare-fun b!461511 () Bool)

(declare-fun e!269120 () Bool)

(assert (=> b!461511 (= e!269120 (contains!2503 Nil!8344 (select (arr!13763 lt!208790) #b00000000000000000000000000000000)))))

(declare-fun b!461512 () Bool)

(declare-fun e!269121 () Bool)

(assert (=> b!461512 (= e!269121 e!269118)))

(declare-fun c!56545 () Bool)

(assert (=> b!461512 (= c!56545 (validKeyInArray!0 (select (arr!13763 lt!208790) #b00000000000000000000000000000000)))))

(declare-fun b!461513 () Bool)

(assert (=> b!461513 (= e!269119 e!269121)))

(declare-fun res!276121 () Bool)

(assert (=> b!461513 (=> (not res!276121) (not e!269121))))

(assert (=> b!461513 (= res!276121 (not e!269120))))

(declare-fun res!276120 () Bool)

(assert (=> b!461513 (=> (not res!276120) (not e!269120))))

(assert (=> b!461513 (= res!276120 (validKeyInArray!0 (select (arr!13763 lt!208790) #b00000000000000000000000000000000)))))

(declare-fun bm!30163 () Bool)

(assert (=> bm!30163 (= call!30166 (arrayNoDuplicates!0 lt!208790 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56545 (Cons!8343 (select (arr!13763 lt!208790) #b00000000000000000000000000000000) Nil!8344) Nil!8344)))))

(assert (= (and d!74689 (not res!276119)) b!461513))

(assert (= (and b!461513 res!276120) b!461511))

(assert (= (and b!461513 res!276121) b!461512))

(assert (= (and b!461512 c!56545) b!461510))

(assert (= (and b!461512 (not c!56545)) b!461509))

(assert (= (or b!461510 b!461509) bm!30163))

(assert (=> b!461511 m!444145))

(assert (=> b!461511 m!444145))

(declare-fun m!444225 () Bool)

(assert (=> b!461511 m!444225))

(assert (=> b!461512 m!444145))

(assert (=> b!461512 m!444145))

(assert (=> b!461512 m!444147))

(assert (=> b!461513 m!444145))

(assert (=> b!461513 m!444145))

(assert (=> b!461513 m!444147))

(assert (=> bm!30163 m!444145))

(declare-fun m!444227 () Bool)

(assert (=> bm!30163 m!444227))

(assert (=> b!461276 d!74689))

(declare-fun d!74691 () Bool)

(declare-fun e!269122 () Bool)

(assert (=> d!74691 e!269122))

(declare-fun res!276122 () Bool)

(assert (=> d!74691 (=> (not res!276122) (not e!269122))))

(declare-fun lt!208900 () ListLongMap!7187)

(assert (=> d!74691 (= res!276122 (contains!2501 lt!208900 (_1!4153 lt!208787)))))

(declare-fun lt!208899 () List!8348)

(assert (=> d!74691 (= lt!208900 (ListLongMap!7188 lt!208899))))

(declare-fun lt!208898 () Unit!13402)

(declare-fun lt!208897 () Unit!13402)

(assert (=> d!74691 (= lt!208898 lt!208897)))

(assert (=> d!74691 (= (getValueByKey!373 lt!208899 (_1!4153 lt!208787)) (Some!378 (_2!4153 lt!208787)))))

(assert (=> d!74691 (= lt!208897 (lemmaContainsTupThenGetReturnValue!198 lt!208899 (_1!4153 lt!208787) (_2!4153 lt!208787)))))

(assert (=> d!74691 (= lt!208899 (insertStrictlySorted!201 (toList!3609 lt!208788) (_1!4153 lt!208787) (_2!4153 lt!208787)))))

(assert (=> d!74691 (= (+!1661 lt!208788 lt!208787) lt!208900)))

(declare-fun b!461514 () Bool)

(declare-fun res!276123 () Bool)

(assert (=> b!461514 (=> (not res!276123) (not e!269122))))

(assert (=> b!461514 (= res!276123 (= (getValueByKey!373 (toList!3609 lt!208900) (_1!4153 lt!208787)) (Some!378 (_2!4153 lt!208787))))))

(declare-fun b!461515 () Bool)

(assert (=> b!461515 (= e!269122 (contains!2502 (toList!3609 lt!208900) lt!208787))))

(assert (= (and d!74691 res!276122) b!461514))

(assert (= (and b!461514 res!276123) b!461515))

(declare-fun m!444229 () Bool)

(assert (=> d!74691 m!444229))

(declare-fun m!444231 () Bool)

(assert (=> d!74691 m!444231))

(declare-fun m!444233 () Bool)

(assert (=> d!74691 m!444233))

(declare-fun m!444235 () Bool)

(assert (=> d!74691 m!444235))

(declare-fun m!444237 () Bool)

(assert (=> b!461514 m!444237))

(declare-fun m!444239 () Bool)

(assert (=> b!461515 m!444239))

(assert (=> b!461268 d!74691))

(declare-fun d!74693 () Bool)

(assert (=> d!74693 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!461272 d!74693))

(declare-fun mapIsEmpty!20302 () Bool)

(declare-fun mapRes!20302 () Bool)

(assert (=> mapIsEmpty!20302 mapRes!20302))

(declare-fun mapNonEmpty!20302 () Bool)

(declare-fun tp!39121 () Bool)

(declare-fun e!269128 () Bool)

(assert (=> mapNonEmpty!20302 (= mapRes!20302 (and tp!39121 e!269128))))

(declare-fun mapValue!20302 () ValueCell!5870)

(declare-fun mapRest!20302 () (Array (_ BitVec 32) ValueCell!5870))

(declare-fun mapKey!20302 () (_ BitVec 32))

(assert (=> mapNonEmpty!20302 (= mapRest!20293 (store mapRest!20302 mapKey!20302 mapValue!20302))))

(declare-fun condMapEmpty!20302 () Bool)

(declare-fun mapDefault!20302 () ValueCell!5870)

(assert (=> mapNonEmpty!20293 (= condMapEmpty!20302 (= mapRest!20293 ((as const (Array (_ BitVec 32) ValueCell!5870)) mapDefault!20302)))))

(declare-fun e!269127 () Bool)

(assert (=> mapNonEmpty!20293 (= tp!39106 (and e!269127 mapRes!20302))))

(declare-fun b!461523 () Bool)

(assert (=> b!461523 (= e!269127 tp_is_empty!12427)))

(declare-fun b!461522 () Bool)

(assert (=> b!461522 (= e!269128 tp_is_empty!12427)))

(assert (= (and mapNonEmpty!20293 condMapEmpty!20302) mapIsEmpty!20302))

(assert (= (and mapNonEmpty!20293 (not condMapEmpty!20302)) mapNonEmpty!20302))

(assert (= (and mapNonEmpty!20302 ((_ is ValueCellFull!5870) mapValue!20302)) b!461522))

(assert (= (and mapNonEmpty!20293 ((_ is ValueCellFull!5870) mapDefault!20302)) b!461523))

(declare-fun m!444241 () Bool)

(assert (=> mapNonEmpty!20302 m!444241))

(declare-fun b_lambda!9931 () Bool)

(assert (= b_lambda!9927 (or (and start!41232 b_free!11089) b_lambda!9931)))

(declare-fun b_lambda!9933 () Bool)

(assert (= b_lambda!9915 (or (and start!41232 b_free!11089) b_lambda!9933)))

(declare-fun b_lambda!9935 () Bool)

(assert (= b_lambda!9925 (or (and start!41232 b_free!11089) b_lambda!9935)))

(declare-fun b_lambda!9937 () Bool)

(assert (= b_lambda!9917 (or (and start!41232 b_free!11089) b_lambda!9937)))

(declare-fun b_lambda!9939 () Bool)

(assert (= b_lambda!9919 (or (and start!41232 b_free!11089) b_lambda!9939)))

(declare-fun b_lambda!9941 () Bool)

(assert (= b_lambda!9921 (or (and start!41232 b_free!11089) b_lambda!9941)))

(declare-fun b_lambda!9943 () Bool)

(assert (= b_lambda!9929 (or (and start!41232 b_free!11089) b_lambda!9943)))

(declare-fun b_lambda!9945 () Bool)

(assert (= b_lambda!9923 (or (and start!41232 b_free!11089) b_lambda!9945)))

(check-sat (not b!461418) (not bm!30161) (not bm!30153) (not d!74687) (not d!74691) (not b!461469) b_and!19403 (not b!461412) (not d!74663) (not b!461486) (not b!461490) (not b!461497) (not b!461465) (not b!461435) (not b!461468) (not d!74685) tp_is_empty!12427 (not b!461513) (not b!461512) (not b!461425) (not b!461411) (not b_next!11089) (not mapNonEmpty!20302) (not b!461511) (not b_lambda!9943) (not b!461505) (not b!461494) (not b_lambda!9933) (not b!461436) (not b!461484) (not bm!30163) (not b!461415) (not b!461430) (not b!461458) (not b!461496) (not b!461485) (not b!461498) (not b!461489) (not b!461482) (not b!461500) (not bm!30156) (not b!461506) (not d!74661) (not b!461493) (not bm!30147) (not b!461502) (not b!461408) (not b!461410) (not b_lambda!9937) (not bm!30152) (not b_lambda!9939) (not b!461416) (not b!461515) (not b!461508) (not b_lambda!9935) (not b!461438) (not b!461488) (not b!461514) (not b!461459) (not b!461427) (not d!74667) (not bm!30157) (not b!461483) (not b!461501) (not b_lambda!9931) (not b_lambda!9945) (not b!461446) (not bm!30146) (not b!461407) (not b_lambda!9941) (not d!74669) (not b!461431) (not b!461426) (not bm!30162) (not b!461428) (not bm!30160) (not b!461432))
(check-sat b_and!19403 (not b_next!11089))
