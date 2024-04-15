; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38142 () Bool)

(assert start!38142)

(declare-fun b_free!9037 () Bool)

(declare-fun b_next!9037 () Bool)

(assert (=> start!38142 (= b_free!9037 (not b_next!9037))))

(declare-fun tp!31893 () Bool)

(declare-fun b_and!16373 () Bool)

(assert (=> start!38142 (= tp!31893 b_and!16373)))

(declare-fun b!393069 () Bool)

(declare-fun e!237981 () Bool)

(declare-fun tp_is_empty!9709 () Bool)

(assert (=> b!393069 (= e!237981 tp_is_empty!9709)))

(declare-fun b!393070 () Bool)

(declare-fun res!225231 () Bool)

(declare-fun e!237984 () Bool)

(assert (=> b!393070 (=> (not res!225231) (not e!237984))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393070 (= res!225231 (validKeyInArray!0 k0!778))))

(declare-fun b!393071 () Bool)

(declare-fun e!237983 () Bool)

(assert (=> b!393071 (= e!237984 e!237983)))

(declare-fun res!225226 () Bool)

(assert (=> b!393071 (=> (not res!225226) (not e!237983))))

(declare-datatypes ((array!23307 0))(
  ( (array!23308 (arr!11112 (Array (_ BitVec 32) (_ BitVec 64))) (size!11465 (_ BitVec 32))) )
))
(declare-fun lt!185902 () array!23307)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23307 (_ BitVec 32)) Bool)

(assert (=> b!393071 (= res!225226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185902 mask!970))))

(declare-fun _keys!658 () array!23307)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393071 (= lt!185902 (array!23308 (store (arr!11112 _keys!658) i!548 k0!778) (size!11465 _keys!658)))))

(declare-fun b!393072 () Bool)

(declare-fun res!225223 () Bool)

(assert (=> b!393072 (=> (not res!225223) (not e!237984))))

(declare-datatypes ((List!6422 0))(
  ( (Nil!6419) (Cons!6418 (h!7274 (_ BitVec 64)) (t!11583 List!6422)) )
))
(declare-fun arrayNoDuplicates!0 (array!23307 (_ BitVec 32) List!6422) Bool)

(assert (=> b!393072 (= res!225223 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6419))))

(declare-fun b!393073 () Bool)

(declare-fun res!225230 () Bool)

(assert (=> b!393073 (=> (not res!225230) (not e!237984))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!14051 0))(
  ( (V!14052 (val!4899 Int)) )
))
(declare-datatypes ((ValueCell!4511 0))(
  ( (ValueCellFull!4511 (v!7130 V!14051)) (EmptyCell!4511) )
))
(declare-datatypes ((array!23309 0))(
  ( (array!23310 (arr!11113 (Array (_ BitVec 32) ValueCell!4511)) (size!11466 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23309)

(assert (=> b!393073 (= res!225230 (and (= (size!11466 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11465 _keys!658) (size!11466 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393074 () Bool)

(declare-fun res!225222 () Bool)

(assert (=> b!393074 (=> (not res!225222) (not e!237983))))

(assert (=> b!393074 (= res!225222 (arrayNoDuplicates!0 lt!185902 #b00000000000000000000000000000000 Nil!6419))))

(declare-datatypes ((tuple2!6582 0))(
  ( (tuple2!6583 (_1!3302 (_ BitVec 64)) (_2!3302 V!14051)) )
))
(declare-datatypes ((List!6423 0))(
  ( (Nil!6420) (Cons!6419 (h!7275 tuple2!6582) (t!11584 List!6423)) )
))
(declare-datatypes ((ListLongMap!5485 0))(
  ( (ListLongMap!5486 (toList!2758 List!6423)) )
))
(declare-fun lt!185900 () ListLongMap!5485)

(declare-fun lt!185905 () Bool)

(declare-fun lt!185907 () ListLongMap!5485)

(declare-fun b!393075 () Bool)

(assert (=> b!393075 (= e!237983 (not (or (and (not lt!185905) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!185905) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!185905) (= lt!185900 lt!185907))))))

(assert (=> b!393075 (= lt!185905 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!185904 () ListLongMap!5485)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14051)

(declare-fun minValue!472 () V!14051)

(declare-fun getCurrentListMap!2073 (array!23307 array!23309 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) Int) ListLongMap!5485)

(assert (=> b!393075 (= lt!185904 (getCurrentListMap!2073 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185903 () array!23309)

(assert (=> b!393075 (= lt!185900 (getCurrentListMap!2073 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185906 () ListLongMap!5485)

(assert (=> b!393075 (and (= lt!185907 lt!185906) (= lt!185906 lt!185907))))

(declare-fun lt!185908 () ListLongMap!5485)

(declare-fun v!373 () V!14051)

(declare-fun +!1078 (ListLongMap!5485 tuple2!6582) ListLongMap!5485)

(assert (=> b!393075 (= lt!185906 (+!1078 lt!185908 (tuple2!6583 k0!778 v!373)))))

(declare-datatypes ((Unit!12004 0))(
  ( (Unit!12005) )
))
(declare-fun lt!185901 () Unit!12004)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!274 (array!23307 array!23309 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) (_ BitVec 64) V!14051 (_ BitVec 32) Int) Unit!12004)

(assert (=> b!393075 (= lt!185901 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!274 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!983 (array!23307 array!23309 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) Int) ListLongMap!5485)

(assert (=> b!393075 (= lt!185907 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393075 (= lt!185903 (array!23310 (store (arr!11113 _values!506) i!548 (ValueCellFull!4511 v!373)) (size!11466 _values!506)))))

(assert (=> b!393075 (= lt!185908 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!225227 () Bool)

(assert (=> start!38142 (=> (not res!225227) (not e!237984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38142 (= res!225227 (validMask!0 mask!970))))

(assert (=> start!38142 e!237984))

(declare-fun e!237985 () Bool)

(declare-fun array_inv!8160 (array!23309) Bool)

(assert (=> start!38142 (and (array_inv!8160 _values!506) e!237985)))

(assert (=> start!38142 tp!31893))

(assert (=> start!38142 true))

(assert (=> start!38142 tp_is_empty!9709))

(declare-fun array_inv!8161 (array!23307) Bool)

(assert (=> start!38142 (array_inv!8161 _keys!658)))

(declare-fun mapNonEmpty!16158 () Bool)

(declare-fun mapRes!16158 () Bool)

(declare-fun tp!31892 () Bool)

(declare-fun e!237980 () Bool)

(assert (=> mapNonEmpty!16158 (= mapRes!16158 (and tp!31892 e!237980))))

(declare-fun mapRest!16158 () (Array (_ BitVec 32) ValueCell!4511))

(declare-fun mapValue!16158 () ValueCell!4511)

(declare-fun mapKey!16158 () (_ BitVec 32))

(assert (=> mapNonEmpty!16158 (= (arr!11113 _values!506) (store mapRest!16158 mapKey!16158 mapValue!16158))))

(declare-fun b!393076 () Bool)

(declare-fun res!225224 () Bool)

(assert (=> b!393076 (=> (not res!225224) (not e!237984))))

(declare-fun arrayContainsKey!0 (array!23307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393076 (= res!225224 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16158 () Bool)

(assert (=> mapIsEmpty!16158 mapRes!16158))

(declare-fun b!393077 () Bool)

(declare-fun res!225225 () Bool)

(assert (=> b!393077 (=> (not res!225225) (not e!237984))))

(assert (=> b!393077 (= res!225225 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11465 _keys!658))))))

(declare-fun b!393078 () Bool)

(declare-fun res!225229 () Bool)

(assert (=> b!393078 (=> (not res!225229) (not e!237984))))

(assert (=> b!393078 (= res!225229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393079 () Bool)

(assert (=> b!393079 (= e!237985 (and e!237981 mapRes!16158))))

(declare-fun condMapEmpty!16158 () Bool)

(declare-fun mapDefault!16158 () ValueCell!4511)

(assert (=> b!393079 (= condMapEmpty!16158 (= (arr!11113 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4511)) mapDefault!16158)))))

(declare-fun b!393080 () Bool)

(declare-fun res!225228 () Bool)

(assert (=> b!393080 (=> (not res!225228) (not e!237984))))

(assert (=> b!393080 (= res!225228 (or (= (select (arr!11112 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11112 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393081 () Bool)

(assert (=> b!393081 (= e!237980 tp_is_empty!9709)))

(assert (= (and start!38142 res!225227) b!393073))

(assert (= (and b!393073 res!225230) b!393078))

(assert (= (and b!393078 res!225229) b!393072))

(assert (= (and b!393072 res!225223) b!393077))

(assert (= (and b!393077 res!225225) b!393070))

(assert (= (and b!393070 res!225231) b!393080))

(assert (= (and b!393080 res!225228) b!393076))

(assert (= (and b!393076 res!225224) b!393071))

(assert (= (and b!393071 res!225226) b!393074))

(assert (= (and b!393074 res!225222) b!393075))

(assert (= (and b!393079 condMapEmpty!16158) mapIsEmpty!16158))

(assert (= (and b!393079 (not condMapEmpty!16158)) mapNonEmpty!16158))

(get-info :version)

(assert (= (and mapNonEmpty!16158 ((_ is ValueCellFull!4511) mapValue!16158)) b!393081))

(assert (= (and b!393079 ((_ is ValueCellFull!4511) mapDefault!16158)) b!393069))

(assert (= start!38142 b!393079))

(declare-fun m!389089 () Bool)

(assert (=> b!393070 m!389089))

(declare-fun m!389091 () Bool)

(assert (=> mapNonEmpty!16158 m!389091))

(declare-fun m!389093 () Bool)

(assert (=> b!393078 m!389093))

(declare-fun m!389095 () Bool)

(assert (=> b!393080 m!389095))

(declare-fun m!389097 () Bool)

(assert (=> b!393072 m!389097))

(declare-fun m!389099 () Bool)

(assert (=> b!393075 m!389099))

(declare-fun m!389101 () Bool)

(assert (=> b!393075 m!389101))

(declare-fun m!389103 () Bool)

(assert (=> b!393075 m!389103))

(declare-fun m!389105 () Bool)

(assert (=> b!393075 m!389105))

(declare-fun m!389107 () Bool)

(assert (=> b!393075 m!389107))

(declare-fun m!389109 () Bool)

(assert (=> b!393075 m!389109))

(declare-fun m!389111 () Bool)

(assert (=> b!393075 m!389111))

(declare-fun m!389113 () Bool)

(assert (=> b!393074 m!389113))

(declare-fun m!389115 () Bool)

(assert (=> b!393076 m!389115))

(declare-fun m!389117 () Bool)

(assert (=> start!38142 m!389117))

(declare-fun m!389119 () Bool)

(assert (=> start!38142 m!389119))

(declare-fun m!389121 () Bool)

(assert (=> start!38142 m!389121))

(declare-fun m!389123 () Bool)

(assert (=> b!393071 m!389123))

(declare-fun m!389125 () Bool)

(assert (=> b!393071 m!389125))

(check-sat b_and!16373 (not b_next!9037) (not b!393072) tp_is_empty!9709 (not b!393075) (not b!393070) (not b!393071) (not b!393074) (not b!393076) (not start!38142) (not b!393078) (not mapNonEmpty!16158))
(check-sat b_and!16373 (not b_next!9037))
(get-model)

(declare-fun d!73005 () Bool)

(declare-fun res!225300 () Bool)

(declare-fun e!238032 () Bool)

(assert (=> d!73005 (=> res!225300 e!238032)))

(assert (=> d!73005 (= res!225300 (bvsge #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(assert (=> d!73005 (= (arrayNoDuplicates!0 lt!185902 #b00000000000000000000000000000000 Nil!6419) e!238032)))

(declare-fun b!393170 () Bool)

(declare-fun e!238030 () Bool)

(declare-fun e!238033 () Bool)

(assert (=> b!393170 (= e!238030 e!238033)))

(declare-fun c!54366 () Bool)

(assert (=> b!393170 (= c!54366 (validKeyInArray!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(declare-fun bm!27743 () Bool)

(declare-fun call!27746 () Bool)

(assert (=> bm!27743 (= call!27746 (arrayNoDuplicates!0 lt!185902 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54366 (Cons!6418 (select (arr!11112 lt!185902) #b00000000000000000000000000000000) Nil!6419) Nil!6419)))))

(declare-fun b!393171 () Bool)

(declare-fun e!238031 () Bool)

(declare-fun contains!2460 (List!6422 (_ BitVec 64)) Bool)

(assert (=> b!393171 (= e!238031 (contains!2460 Nil!6419 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(declare-fun b!393172 () Bool)

(assert (=> b!393172 (= e!238032 e!238030)))

(declare-fun res!225299 () Bool)

(assert (=> b!393172 (=> (not res!225299) (not e!238030))))

(assert (=> b!393172 (= res!225299 (not e!238031))))

(declare-fun res!225298 () Bool)

(assert (=> b!393172 (=> (not res!225298) (not e!238031))))

(assert (=> b!393172 (= res!225298 (validKeyInArray!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(declare-fun b!393173 () Bool)

(assert (=> b!393173 (= e!238033 call!27746)))

(declare-fun b!393174 () Bool)

(assert (=> b!393174 (= e!238033 call!27746)))

(assert (= (and d!73005 (not res!225300)) b!393172))

(assert (= (and b!393172 res!225298) b!393171))

(assert (= (and b!393172 res!225299) b!393170))

(assert (= (and b!393170 c!54366) b!393174))

(assert (= (and b!393170 (not c!54366)) b!393173))

(assert (= (or b!393174 b!393173) bm!27743))

(declare-fun m!389203 () Bool)

(assert (=> b!393170 m!389203))

(assert (=> b!393170 m!389203))

(declare-fun m!389205 () Bool)

(assert (=> b!393170 m!389205))

(assert (=> bm!27743 m!389203))

(declare-fun m!389207 () Bool)

(assert (=> bm!27743 m!389207))

(assert (=> b!393171 m!389203))

(assert (=> b!393171 m!389203))

(declare-fun m!389209 () Bool)

(assert (=> b!393171 m!389209))

(assert (=> b!393172 m!389203))

(assert (=> b!393172 m!389203))

(assert (=> b!393172 m!389205))

(assert (=> b!393074 d!73005))

(declare-fun d!73007 () Bool)

(assert (=> d!73007 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393070 d!73007))

(declare-fun b!393199 () Bool)

(declare-fun e!238049 () ListLongMap!5485)

(declare-fun call!27749 () ListLongMap!5485)

(assert (=> b!393199 (= e!238049 call!27749)))

(declare-fun lt!185981 () ListLongMap!5485)

(declare-fun e!238054 () Bool)

(declare-fun b!393200 () Bool)

(assert (=> b!393200 (= e!238054 (= lt!185981 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!393201 () Bool)

(assert (=> b!393201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(assert (=> b!393201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 _values!506)))))

(declare-fun e!238048 () Bool)

(declare-fun apply!307 (ListLongMap!5485 (_ BitVec 64)) V!14051)

(declare-fun get!5611 (ValueCell!4511 V!14051) V!14051)

(declare-fun dynLambda!641 (Int (_ BitVec 64)) V!14051)

(assert (=> b!393201 (= e!238048 (= (apply!307 lt!185981 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)) (get!5611 (select (arr!11113 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!393202 () Bool)

(declare-fun e!238050 () Bool)

(assert (=> b!393202 (= e!238050 e!238054)))

(declare-fun c!54377 () Bool)

(assert (=> b!393202 (= c!54377 (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(declare-fun bm!27746 () Bool)

(assert (=> bm!27746 (= call!27749 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393203 () Bool)

(declare-fun res!225310 () Bool)

(declare-fun e!238051 () Bool)

(assert (=> b!393203 (=> (not res!225310) (not e!238051))))

(declare-fun contains!2461 (ListLongMap!5485 (_ BitVec 64)) Bool)

(assert (=> b!393203 (= res!225310 (not (contains!2461 lt!185981 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393205 () Bool)

(assert (=> b!393205 (= e!238051 e!238050)))

(declare-fun c!54376 () Bool)

(declare-fun e!238053 () Bool)

(assert (=> b!393205 (= c!54376 e!238053)))

(declare-fun res!225309 () Bool)

(assert (=> b!393205 (=> (not res!225309) (not e!238053))))

(assert (=> b!393205 (= res!225309 (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(declare-fun b!393206 () Bool)

(declare-fun lt!185983 () Unit!12004)

(declare-fun lt!185978 () Unit!12004)

(assert (=> b!393206 (= lt!185983 lt!185978)))

(declare-fun lt!185979 () (_ BitVec 64))

(declare-fun lt!185982 () (_ BitVec 64))

(declare-fun lt!185980 () ListLongMap!5485)

(declare-fun lt!185977 () V!14051)

(assert (=> b!393206 (not (contains!2461 (+!1078 lt!185980 (tuple2!6583 lt!185982 lt!185977)) lt!185979))))

(declare-fun addStillNotContains!141 (ListLongMap!5485 (_ BitVec 64) V!14051 (_ BitVec 64)) Unit!12004)

(assert (=> b!393206 (= lt!185978 (addStillNotContains!141 lt!185980 lt!185982 lt!185977 lt!185979))))

(assert (=> b!393206 (= lt!185979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393206 (= lt!185977 (get!5611 (select (arr!11113 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393206 (= lt!185982 (select (arr!11112 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!393206 (= lt!185980 call!27749)))

(assert (=> b!393206 (= e!238049 (+!1078 call!27749 (tuple2!6583 (select (arr!11112 _keys!658) #b00000000000000000000000000000000) (get!5611 (select (arr!11113 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393207 () Bool)

(declare-fun e!238052 () ListLongMap!5485)

(assert (=> b!393207 (= e!238052 e!238049)))

(declare-fun c!54375 () Bool)

(assert (=> b!393207 (= c!54375 (validKeyInArray!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393208 () Bool)

(assert (=> b!393208 (= e!238052 (ListLongMap!5486 Nil!6420))))

(declare-fun b!393209 () Bool)

(declare-fun isEmpty!557 (ListLongMap!5485) Bool)

(assert (=> b!393209 (= e!238054 (isEmpty!557 lt!185981))))

(declare-fun b!393210 () Bool)

(assert (=> b!393210 (= e!238050 e!238048)))

(assert (=> b!393210 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(declare-fun res!225312 () Bool)

(assert (=> b!393210 (= res!225312 (contains!2461 lt!185981 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393210 (=> (not res!225312) (not e!238048))))

(declare-fun d!73009 () Bool)

(assert (=> d!73009 e!238051))

(declare-fun res!225311 () Bool)

(assert (=> d!73009 (=> (not res!225311) (not e!238051))))

(assert (=> d!73009 (= res!225311 (not (contains!2461 lt!185981 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73009 (= lt!185981 e!238052)))

(declare-fun c!54378 () Bool)

(assert (=> d!73009 (= c!54378 (bvsge #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(assert (=> d!73009 (validMask!0 mask!970)))

(assert (=> d!73009 (= (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185981)))

(declare-fun b!393204 () Bool)

(assert (=> b!393204 (= e!238053 (validKeyInArray!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393204 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!73009 c!54378) b!393208))

(assert (= (and d!73009 (not c!54378)) b!393207))

(assert (= (and b!393207 c!54375) b!393206))

(assert (= (and b!393207 (not c!54375)) b!393199))

(assert (= (or b!393206 b!393199) bm!27746))

(assert (= (and d!73009 res!225311) b!393203))

(assert (= (and b!393203 res!225310) b!393205))

(assert (= (and b!393205 res!225309) b!393204))

(assert (= (and b!393205 c!54376) b!393210))

(assert (= (and b!393205 (not c!54376)) b!393202))

(assert (= (and b!393210 res!225312) b!393201))

(assert (= (and b!393202 c!54377) b!393200))

(assert (= (and b!393202 (not c!54377)) b!393209))

(declare-fun b_lambda!8749 () Bool)

(assert (=> (not b_lambda!8749) (not b!393201)))

(declare-fun t!11589 () Bool)

(declare-fun tb!3121 () Bool)

(assert (=> (and start!38142 (= defaultEntry!514 defaultEntry!514) t!11589) tb!3121))

(declare-fun result!5759 () Bool)

(assert (=> tb!3121 (= result!5759 tp_is_empty!9709)))

(assert (=> b!393201 t!11589))

(declare-fun b_and!16379 () Bool)

(assert (= b_and!16373 (and (=> t!11589 result!5759) b_and!16379)))

(declare-fun b_lambda!8751 () Bool)

(assert (=> (not b_lambda!8751) (not b!393206)))

(assert (=> b!393206 t!11589))

(declare-fun b_and!16381 () Bool)

(assert (= b_and!16379 (and (=> t!11589 result!5759) b_and!16381)))

(declare-fun m!389211 () Bool)

(assert (=> d!73009 m!389211))

(assert (=> d!73009 m!389117))

(declare-fun m!389213 () Bool)

(assert (=> b!393201 m!389213))

(assert (=> b!393201 m!389213))

(declare-fun m!389215 () Bool)

(assert (=> b!393201 m!389215))

(declare-fun m!389217 () Bool)

(assert (=> b!393201 m!389217))

(assert (=> b!393201 m!389217))

(declare-fun m!389219 () Bool)

(assert (=> b!393201 m!389219))

(declare-fun m!389221 () Bool)

(assert (=> b!393201 m!389221))

(assert (=> b!393201 m!389219))

(declare-fun m!389223 () Bool)

(assert (=> bm!27746 m!389223))

(assert (=> b!393204 m!389213))

(assert (=> b!393204 m!389213))

(declare-fun m!389225 () Bool)

(assert (=> b!393204 m!389225))

(declare-fun m!389227 () Bool)

(assert (=> b!393203 m!389227))

(assert (=> b!393207 m!389213))

(assert (=> b!393207 m!389213))

(assert (=> b!393207 m!389225))

(declare-fun m!389229 () Bool)

(assert (=> b!393206 m!389229))

(declare-fun m!389231 () Bool)

(assert (=> b!393206 m!389231))

(assert (=> b!393206 m!389213))

(declare-fun m!389233 () Bool)

(assert (=> b!393206 m!389233))

(assert (=> b!393206 m!389217))

(assert (=> b!393206 m!389217))

(assert (=> b!393206 m!389219))

(assert (=> b!393206 m!389221))

(assert (=> b!393206 m!389219))

(assert (=> b!393206 m!389229))

(declare-fun m!389235 () Bool)

(assert (=> b!393206 m!389235))

(assert (=> b!393210 m!389213))

(assert (=> b!393210 m!389213))

(declare-fun m!389237 () Bool)

(assert (=> b!393210 m!389237))

(assert (=> b!393200 m!389223))

(declare-fun m!389239 () Bool)

(assert (=> b!393209 m!389239))

(assert (=> b!393075 d!73009))

(declare-fun b!393255 () Bool)

(declare-fun e!238089 () Bool)

(declare-fun e!238084 () Bool)

(assert (=> b!393255 (= e!238089 e!238084)))

(declare-fun c!54392 () Bool)

(assert (=> b!393255 (= c!54392 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!73011 () Bool)

(assert (=> d!73011 e!238089))

(declare-fun res!225336 () Bool)

(assert (=> d!73011 (=> (not res!225336) (not e!238089))))

(assert (=> d!73011 (= res!225336 (or (bvsge #b00000000000000000000000000000000 (size!11465 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))))

(declare-fun lt!186045 () ListLongMap!5485)

(declare-fun lt!186037 () ListLongMap!5485)

(assert (=> d!73011 (= lt!186045 lt!186037)))

(declare-fun lt!186031 () Unit!12004)

(declare-fun e!238086 () Unit!12004)

(assert (=> d!73011 (= lt!186031 e!238086)))

(declare-fun c!54394 () Bool)

(declare-fun e!238087 () Bool)

(assert (=> d!73011 (= c!54394 e!238087)))

(declare-fun res!225337 () Bool)

(assert (=> d!73011 (=> (not res!225337) (not e!238087))))

(assert (=> d!73011 (= res!225337 (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(declare-fun e!238088 () ListLongMap!5485)

(assert (=> d!73011 (= lt!186037 e!238088)))

(declare-fun c!54393 () Bool)

(assert (=> d!73011 (= c!54393 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73011 (validMask!0 mask!970)))

(assert (=> d!73011 (= (getCurrentListMap!2073 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186045)))

(declare-fun b!393256 () Bool)

(declare-fun Unit!12008 () Unit!12004)

(assert (=> b!393256 (= e!238086 Unit!12008)))

(declare-fun b!393257 () Bool)

(declare-fun res!225332 () Bool)

(assert (=> b!393257 (=> (not res!225332) (not e!238089))))

(declare-fun e!238090 () Bool)

(assert (=> b!393257 (= res!225332 e!238090)))

(declare-fun res!225338 () Bool)

(assert (=> b!393257 (=> res!225338 e!238090)))

(declare-fun e!238081 () Bool)

(assert (=> b!393257 (= res!225338 (not e!238081))))

(declare-fun res!225335 () Bool)

(assert (=> b!393257 (=> (not res!225335) (not e!238081))))

(assert (=> b!393257 (= res!225335 (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(declare-fun b!393258 () Bool)

(declare-fun e!238093 () ListLongMap!5485)

(declare-fun call!27765 () ListLongMap!5485)

(assert (=> b!393258 (= e!238093 call!27765)))

(declare-fun b!393259 () Bool)

(declare-fun call!27766 () ListLongMap!5485)

(assert (=> b!393259 (= e!238093 call!27766)))

(declare-fun b!393260 () Bool)

(declare-fun e!238085 () Bool)

(declare-fun e!238082 () Bool)

(assert (=> b!393260 (= e!238085 e!238082)))

(declare-fun res!225334 () Bool)

(declare-fun call!27767 () Bool)

(assert (=> b!393260 (= res!225334 call!27767)))

(assert (=> b!393260 (=> (not res!225334) (not e!238082))))

(declare-fun bm!27761 () Bool)

(declare-fun call!27769 () ListLongMap!5485)

(assert (=> bm!27761 (= call!27766 call!27769)))

(declare-fun b!393261 () Bool)

(declare-fun e!238091 () Bool)

(assert (=> b!393261 (= e!238091 (= (apply!307 lt!186045 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393262 () Bool)

(declare-fun e!238092 () ListLongMap!5485)

(assert (=> b!393262 (= e!238092 call!27766)))

(declare-fun b!393263 () Bool)

(declare-fun call!27764 () Bool)

(assert (=> b!393263 (= e!238084 (not call!27764))))

(declare-fun bm!27762 () Bool)

(assert (=> bm!27762 (= call!27767 (contains!2461 lt!186045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393264 () Bool)

(assert (=> b!393264 (= e!238088 e!238092)))

(declare-fun c!54396 () Bool)

(assert (=> b!393264 (= c!54396 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27768 () ListLongMap!5485)

(declare-fun call!27770 () ListLongMap!5485)

(declare-fun bm!27763 () Bool)

(assert (=> bm!27763 (= call!27769 (+!1078 (ite c!54393 call!27770 (ite c!54396 call!27768 call!27765)) (ite (or c!54393 c!54396) (tuple2!6583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!393265 () Bool)

(assert (=> b!393265 (= e!238088 (+!1078 call!27769 (tuple2!6583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393266 () Bool)

(assert (=> b!393266 (= e!238085 (not call!27767))))

(declare-fun b!393267 () Bool)

(assert (=> b!393267 (= e!238084 e!238091)))

(declare-fun res!225331 () Bool)

(assert (=> b!393267 (= res!225331 call!27764)))

(assert (=> b!393267 (=> (not res!225331) (not e!238091))))

(declare-fun b!393268 () Bool)

(declare-fun e!238083 () Bool)

(assert (=> b!393268 (= e!238090 e!238083)))

(declare-fun res!225339 () Bool)

(assert (=> b!393268 (=> (not res!225339) (not e!238083))))

(assert (=> b!393268 (= res!225339 (contains!2461 lt!186045 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(declare-fun b!393269 () Bool)

(declare-fun lt!186048 () Unit!12004)

(assert (=> b!393269 (= e!238086 lt!186048)))

(declare-fun lt!186038 () ListLongMap!5485)

(assert (=> b!393269 (= lt!186038 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186044 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186032 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186032 (select (arr!11112 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186039 () Unit!12004)

(declare-fun addStillContains!283 (ListLongMap!5485 (_ BitVec 64) V!14051 (_ BitVec 64)) Unit!12004)

(assert (=> b!393269 (= lt!186039 (addStillContains!283 lt!186038 lt!186044 zeroValue!472 lt!186032))))

(assert (=> b!393269 (contains!2461 (+!1078 lt!186038 (tuple2!6583 lt!186044 zeroValue!472)) lt!186032)))

(declare-fun lt!186035 () Unit!12004)

(assert (=> b!393269 (= lt!186035 lt!186039)))

(declare-fun lt!186043 () ListLongMap!5485)

(assert (=> b!393269 (= lt!186043 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186042 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186042 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186040 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186040 (select (arr!11112 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186041 () Unit!12004)

(declare-fun addApplyDifferent!283 (ListLongMap!5485 (_ BitVec 64) V!14051 (_ BitVec 64)) Unit!12004)

(assert (=> b!393269 (= lt!186041 (addApplyDifferent!283 lt!186043 lt!186042 minValue!472 lt!186040))))

(assert (=> b!393269 (= (apply!307 (+!1078 lt!186043 (tuple2!6583 lt!186042 minValue!472)) lt!186040) (apply!307 lt!186043 lt!186040))))

(declare-fun lt!186028 () Unit!12004)

(assert (=> b!393269 (= lt!186028 lt!186041)))

(declare-fun lt!186033 () ListLongMap!5485)

(assert (=> b!393269 (= lt!186033 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186030 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186034 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186034 (select (arr!11112 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186046 () Unit!12004)

(assert (=> b!393269 (= lt!186046 (addApplyDifferent!283 lt!186033 lt!186030 zeroValue!472 lt!186034))))

(assert (=> b!393269 (= (apply!307 (+!1078 lt!186033 (tuple2!6583 lt!186030 zeroValue!472)) lt!186034) (apply!307 lt!186033 lt!186034))))

(declare-fun lt!186049 () Unit!12004)

(assert (=> b!393269 (= lt!186049 lt!186046)))

(declare-fun lt!186036 () ListLongMap!5485)

(assert (=> b!393269 (= lt!186036 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186047 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186047 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186029 () (_ BitVec 64))

(assert (=> b!393269 (= lt!186029 (select (arr!11112 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!393269 (= lt!186048 (addApplyDifferent!283 lt!186036 lt!186047 minValue!472 lt!186029))))

(assert (=> b!393269 (= (apply!307 (+!1078 lt!186036 (tuple2!6583 lt!186047 minValue!472)) lt!186029) (apply!307 lt!186036 lt!186029))))

(declare-fun bm!27764 () Bool)

(assert (=> bm!27764 (= call!27765 call!27768)))

(declare-fun b!393270 () Bool)

(assert (=> b!393270 (= e!238081 (validKeyInArray!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393271 () Bool)

(assert (=> b!393271 (= e!238082 (= (apply!307 lt!186045 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27765 () Bool)

(assert (=> bm!27765 (= call!27768 call!27770)))

(declare-fun b!393272 () Bool)

(assert (=> b!393272 (= e!238083 (= (apply!307 lt!186045 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)) (get!5611 (select (arr!11113 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 _values!506)))))

(assert (=> b!393272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(declare-fun b!393273 () Bool)

(declare-fun c!54391 () Bool)

(assert (=> b!393273 (= c!54391 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393273 (= e!238092 e!238093)))

(declare-fun bm!27766 () Bool)

(assert (=> bm!27766 (= call!27770 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393274 () Bool)

(declare-fun res!225333 () Bool)

(assert (=> b!393274 (=> (not res!225333) (not e!238089))))

(assert (=> b!393274 (= res!225333 e!238085)))

(declare-fun c!54395 () Bool)

(assert (=> b!393274 (= c!54395 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27767 () Bool)

(assert (=> bm!27767 (= call!27764 (contains!2461 lt!186045 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393275 () Bool)

(assert (=> b!393275 (= e!238087 (validKeyInArray!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73011 c!54393) b!393265))

(assert (= (and d!73011 (not c!54393)) b!393264))

(assert (= (and b!393264 c!54396) b!393262))

(assert (= (and b!393264 (not c!54396)) b!393273))

(assert (= (and b!393273 c!54391) b!393259))

(assert (= (and b!393273 (not c!54391)) b!393258))

(assert (= (or b!393259 b!393258) bm!27764))

(assert (= (or b!393262 bm!27764) bm!27765))

(assert (= (or b!393262 b!393259) bm!27761))

(assert (= (or b!393265 bm!27765) bm!27766))

(assert (= (or b!393265 bm!27761) bm!27763))

(assert (= (and d!73011 res!225337) b!393275))

(assert (= (and d!73011 c!54394) b!393269))

(assert (= (and d!73011 (not c!54394)) b!393256))

(assert (= (and d!73011 res!225336) b!393257))

(assert (= (and b!393257 res!225335) b!393270))

(assert (= (and b!393257 (not res!225338)) b!393268))

(assert (= (and b!393268 res!225339) b!393272))

(assert (= (and b!393257 res!225332) b!393274))

(assert (= (and b!393274 c!54395) b!393260))

(assert (= (and b!393274 (not c!54395)) b!393266))

(assert (= (and b!393260 res!225334) b!393271))

(assert (= (or b!393260 b!393266) bm!27762))

(assert (= (and b!393274 res!225333) b!393255))

(assert (= (and b!393255 c!54392) b!393267))

(assert (= (and b!393255 (not c!54392)) b!393263))

(assert (= (and b!393267 res!225331) b!393261))

(assert (= (or b!393267 b!393263) bm!27767))

(declare-fun b_lambda!8753 () Bool)

(assert (=> (not b_lambda!8753) (not b!393272)))

(assert (=> b!393272 t!11589))

(declare-fun b_and!16383 () Bool)

(assert (= b_and!16381 (and (=> t!11589 result!5759) b_and!16383)))

(declare-fun m!389241 () Bool)

(assert (=> b!393261 m!389241))

(assert (=> b!393272 m!389219))

(assert (=> b!393272 m!389217))

(assert (=> b!393272 m!389213))

(assert (=> b!393272 m!389213))

(declare-fun m!389243 () Bool)

(assert (=> b!393272 m!389243))

(assert (=> b!393272 m!389217))

(assert (=> b!393272 m!389219))

(assert (=> b!393272 m!389221))

(declare-fun m!389245 () Bool)

(assert (=> b!393269 m!389245))

(declare-fun m!389247 () Bool)

(assert (=> b!393269 m!389247))

(declare-fun m!389249 () Bool)

(assert (=> b!393269 m!389249))

(declare-fun m!389251 () Bool)

(assert (=> b!393269 m!389251))

(declare-fun m!389253 () Bool)

(assert (=> b!393269 m!389253))

(assert (=> b!393269 m!389251))

(declare-fun m!389255 () Bool)

(assert (=> b!393269 m!389255))

(declare-fun m!389257 () Bool)

(assert (=> b!393269 m!389257))

(assert (=> b!393269 m!389247))

(declare-fun m!389259 () Bool)

(assert (=> b!393269 m!389259))

(declare-fun m!389261 () Bool)

(assert (=> b!393269 m!389261))

(declare-fun m!389263 () Bool)

(assert (=> b!393269 m!389263))

(assert (=> b!393269 m!389099))

(declare-fun m!389265 () Bool)

(assert (=> b!393269 m!389265))

(assert (=> b!393269 m!389261))

(declare-fun m!389267 () Bool)

(assert (=> b!393269 m!389267))

(declare-fun m!389269 () Bool)

(assert (=> b!393269 m!389269))

(assert (=> b!393269 m!389213))

(assert (=> b!393269 m!389259))

(declare-fun m!389271 () Bool)

(assert (=> b!393269 m!389271))

(declare-fun m!389273 () Bool)

(assert (=> b!393269 m!389273))

(declare-fun m!389275 () Bool)

(assert (=> bm!27762 m!389275))

(assert (=> b!393275 m!389213))

(assert (=> b!393275 m!389213))

(assert (=> b!393275 m!389225))

(assert (=> bm!27766 m!389099))

(declare-fun m!389277 () Bool)

(assert (=> bm!27763 m!389277))

(assert (=> b!393270 m!389213))

(assert (=> b!393270 m!389213))

(assert (=> b!393270 m!389225))

(declare-fun m!389279 () Bool)

(assert (=> b!393265 m!389279))

(declare-fun m!389281 () Bool)

(assert (=> b!393271 m!389281))

(assert (=> d!73011 m!389117))

(assert (=> b!393268 m!389213))

(assert (=> b!393268 m!389213))

(declare-fun m!389283 () Bool)

(assert (=> b!393268 m!389283))

(declare-fun m!389285 () Bool)

(assert (=> bm!27767 m!389285))

(assert (=> b!393075 d!73011))

(declare-fun d!73013 () Bool)

(declare-fun e!238096 () Bool)

(assert (=> d!73013 e!238096))

(declare-fun res!225344 () Bool)

(assert (=> d!73013 (=> (not res!225344) (not e!238096))))

(declare-fun lt!186059 () ListLongMap!5485)

(assert (=> d!73013 (= res!225344 (contains!2461 lt!186059 (_1!3302 (tuple2!6583 k0!778 v!373))))))

(declare-fun lt!186058 () List!6423)

(assert (=> d!73013 (= lt!186059 (ListLongMap!5486 lt!186058))))

(declare-fun lt!186061 () Unit!12004)

(declare-fun lt!186060 () Unit!12004)

(assert (=> d!73013 (= lt!186061 lt!186060)))

(declare-datatypes ((Option!369 0))(
  ( (Some!368 (v!7136 V!14051)) (None!367) )
))
(declare-fun getValueByKey!363 (List!6423 (_ BitVec 64)) Option!369)

(assert (=> d!73013 (= (getValueByKey!363 lt!186058 (_1!3302 (tuple2!6583 k0!778 v!373))) (Some!368 (_2!3302 (tuple2!6583 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!188 (List!6423 (_ BitVec 64) V!14051) Unit!12004)

(assert (=> d!73013 (= lt!186060 (lemmaContainsTupThenGetReturnValue!188 lt!186058 (_1!3302 (tuple2!6583 k0!778 v!373)) (_2!3302 (tuple2!6583 k0!778 v!373))))))

(declare-fun insertStrictlySorted!191 (List!6423 (_ BitVec 64) V!14051) List!6423)

(assert (=> d!73013 (= lt!186058 (insertStrictlySorted!191 (toList!2758 lt!185908) (_1!3302 (tuple2!6583 k0!778 v!373)) (_2!3302 (tuple2!6583 k0!778 v!373))))))

(assert (=> d!73013 (= (+!1078 lt!185908 (tuple2!6583 k0!778 v!373)) lt!186059)))

(declare-fun b!393280 () Bool)

(declare-fun res!225345 () Bool)

(assert (=> b!393280 (=> (not res!225345) (not e!238096))))

(assert (=> b!393280 (= res!225345 (= (getValueByKey!363 (toList!2758 lt!186059) (_1!3302 (tuple2!6583 k0!778 v!373))) (Some!368 (_2!3302 (tuple2!6583 k0!778 v!373)))))))

(declare-fun b!393281 () Bool)

(declare-fun contains!2462 (List!6423 tuple2!6582) Bool)

(assert (=> b!393281 (= e!238096 (contains!2462 (toList!2758 lt!186059) (tuple2!6583 k0!778 v!373)))))

(assert (= (and d!73013 res!225344) b!393280))

(assert (= (and b!393280 res!225345) b!393281))

(declare-fun m!389287 () Bool)

(assert (=> d!73013 m!389287))

(declare-fun m!389289 () Bool)

(assert (=> d!73013 m!389289))

(declare-fun m!389291 () Bool)

(assert (=> d!73013 m!389291))

(declare-fun m!389293 () Bool)

(assert (=> d!73013 m!389293))

(declare-fun m!389295 () Bool)

(assert (=> b!393280 m!389295))

(declare-fun m!389297 () Bool)

(assert (=> b!393281 m!389297))

(assert (=> b!393075 d!73013))

(declare-fun b!393282 () Bool)

(declare-fun e!238098 () ListLongMap!5485)

(declare-fun call!27771 () ListLongMap!5485)

(assert (=> b!393282 (= e!238098 call!27771)))

(declare-fun e!238103 () Bool)

(declare-fun b!393283 () Bool)

(declare-fun lt!186066 () ListLongMap!5485)

(assert (=> b!393283 (= e!238103 (= lt!186066 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!393284 () Bool)

(assert (=> b!393284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(assert (=> b!393284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 lt!185903)))))

(declare-fun e!238097 () Bool)

(assert (=> b!393284 (= e!238097 (= (apply!307 lt!186066 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)) (get!5611 (select (arr!11113 lt!185903) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!393285 () Bool)

(declare-fun e!238099 () Bool)

(assert (=> b!393285 (= e!238099 e!238103)))

(declare-fun c!54399 () Bool)

(assert (=> b!393285 (= c!54399 (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(declare-fun bm!27768 () Bool)

(assert (=> bm!27768 (= call!27771 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393286 () Bool)

(declare-fun res!225347 () Bool)

(declare-fun e!238100 () Bool)

(assert (=> b!393286 (=> (not res!225347) (not e!238100))))

(assert (=> b!393286 (= res!225347 (not (contains!2461 lt!186066 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393288 () Bool)

(assert (=> b!393288 (= e!238100 e!238099)))

(declare-fun c!54398 () Bool)

(declare-fun e!238102 () Bool)

(assert (=> b!393288 (= c!54398 e!238102)))

(declare-fun res!225346 () Bool)

(assert (=> b!393288 (=> (not res!225346) (not e!238102))))

(assert (=> b!393288 (= res!225346 (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(declare-fun b!393289 () Bool)

(declare-fun lt!186068 () Unit!12004)

(declare-fun lt!186063 () Unit!12004)

(assert (=> b!393289 (= lt!186068 lt!186063)))

(declare-fun lt!186062 () V!14051)

(declare-fun lt!186064 () (_ BitVec 64))

(declare-fun lt!186067 () (_ BitVec 64))

(declare-fun lt!186065 () ListLongMap!5485)

(assert (=> b!393289 (not (contains!2461 (+!1078 lt!186065 (tuple2!6583 lt!186067 lt!186062)) lt!186064))))

(assert (=> b!393289 (= lt!186063 (addStillNotContains!141 lt!186065 lt!186067 lt!186062 lt!186064))))

(assert (=> b!393289 (= lt!186064 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393289 (= lt!186062 (get!5611 (select (arr!11113 lt!185903) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393289 (= lt!186067 (select (arr!11112 lt!185902) #b00000000000000000000000000000000))))

(assert (=> b!393289 (= lt!186065 call!27771)))

(assert (=> b!393289 (= e!238098 (+!1078 call!27771 (tuple2!6583 (select (arr!11112 lt!185902) #b00000000000000000000000000000000) (get!5611 (select (arr!11113 lt!185903) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393290 () Bool)

(declare-fun e!238101 () ListLongMap!5485)

(assert (=> b!393290 (= e!238101 e!238098)))

(declare-fun c!54397 () Bool)

(assert (=> b!393290 (= c!54397 (validKeyInArray!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(declare-fun b!393291 () Bool)

(assert (=> b!393291 (= e!238101 (ListLongMap!5486 Nil!6420))))

(declare-fun b!393292 () Bool)

(assert (=> b!393292 (= e!238103 (isEmpty!557 lt!186066))))

(declare-fun b!393293 () Bool)

(assert (=> b!393293 (= e!238099 e!238097)))

(assert (=> b!393293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(declare-fun res!225349 () Bool)

(assert (=> b!393293 (= res!225349 (contains!2461 lt!186066 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(assert (=> b!393293 (=> (not res!225349) (not e!238097))))

(declare-fun d!73015 () Bool)

(assert (=> d!73015 e!238100))

(declare-fun res!225348 () Bool)

(assert (=> d!73015 (=> (not res!225348) (not e!238100))))

(assert (=> d!73015 (= res!225348 (not (contains!2461 lt!186066 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73015 (= lt!186066 e!238101)))

(declare-fun c!54400 () Bool)

(assert (=> d!73015 (= c!54400 (bvsge #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(assert (=> d!73015 (validMask!0 mask!970)))

(assert (=> d!73015 (= (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186066)))

(declare-fun b!393287 () Bool)

(assert (=> b!393287 (= e!238102 (validKeyInArray!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(assert (=> b!393287 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!73015 c!54400) b!393291))

(assert (= (and d!73015 (not c!54400)) b!393290))

(assert (= (and b!393290 c!54397) b!393289))

(assert (= (and b!393290 (not c!54397)) b!393282))

(assert (= (or b!393289 b!393282) bm!27768))

(assert (= (and d!73015 res!225348) b!393286))

(assert (= (and b!393286 res!225347) b!393288))

(assert (= (and b!393288 res!225346) b!393287))

(assert (= (and b!393288 c!54398) b!393293))

(assert (= (and b!393288 (not c!54398)) b!393285))

(assert (= (and b!393293 res!225349) b!393284))

(assert (= (and b!393285 c!54399) b!393283))

(assert (= (and b!393285 (not c!54399)) b!393292))

(declare-fun b_lambda!8755 () Bool)

(assert (=> (not b_lambda!8755) (not b!393284)))

(assert (=> b!393284 t!11589))

(declare-fun b_and!16385 () Bool)

(assert (= b_and!16383 (and (=> t!11589 result!5759) b_and!16385)))

(declare-fun b_lambda!8757 () Bool)

(assert (=> (not b_lambda!8757) (not b!393289)))

(assert (=> b!393289 t!11589))

(declare-fun b_and!16387 () Bool)

(assert (= b_and!16385 (and (=> t!11589 result!5759) b_and!16387)))

(declare-fun m!389299 () Bool)

(assert (=> d!73015 m!389299))

(assert (=> d!73015 m!389117))

(assert (=> b!393284 m!389203))

(assert (=> b!393284 m!389203))

(declare-fun m!389301 () Bool)

(assert (=> b!393284 m!389301))

(declare-fun m!389303 () Bool)

(assert (=> b!393284 m!389303))

(assert (=> b!393284 m!389303))

(assert (=> b!393284 m!389219))

(declare-fun m!389305 () Bool)

(assert (=> b!393284 m!389305))

(assert (=> b!393284 m!389219))

(declare-fun m!389307 () Bool)

(assert (=> bm!27768 m!389307))

(assert (=> b!393287 m!389203))

(assert (=> b!393287 m!389203))

(assert (=> b!393287 m!389205))

(declare-fun m!389309 () Bool)

(assert (=> b!393286 m!389309))

(assert (=> b!393290 m!389203))

(assert (=> b!393290 m!389203))

(assert (=> b!393290 m!389205))

(declare-fun m!389311 () Bool)

(assert (=> b!393289 m!389311))

(declare-fun m!389313 () Bool)

(assert (=> b!393289 m!389313))

(assert (=> b!393289 m!389203))

(declare-fun m!389315 () Bool)

(assert (=> b!393289 m!389315))

(assert (=> b!393289 m!389303))

(assert (=> b!393289 m!389303))

(assert (=> b!393289 m!389219))

(assert (=> b!393289 m!389305))

(assert (=> b!393289 m!389219))

(assert (=> b!393289 m!389311))

(declare-fun m!389317 () Bool)

(assert (=> b!393289 m!389317))

(assert (=> b!393293 m!389203))

(assert (=> b!393293 m!389203))

(declare-fun m!389319 () Bool)

(assert (=> b!393293 m!389319))

(assert (=> b!393283 m!389307))

(declare-fun m!389321 () Bool)

(assert (=> b!393292 m!389321))

(assert (=> b!393075 d!73015))

(declare-fun call!27776 () ListLongMap!5485)

(declare-fun bm!27773 () Bool)

(assert (=> bm!27773 (= call!27776 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!73017 () Bool)

(declare-fun e!238109 () Bool)

(assert (=> d!73017 e!238109))

(declare-fun res!225352 () Bool)

(assert (=> d!73017 (=> (not res!225352) (not e!238109))))

(assert (=> d!73017 (= res!225352 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11465 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11466 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11465 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11466 _values!506))))))))

(declare-fun lt!186071 () Unit!12004)

(declare-fun choose!1329 (array!23307 array!23309 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) (_ BitVec 64) V!14051 (_ BitVec 32) Int) Unit!12004)

(assert (=> d!73017 (= lt!186071 (choose!1329 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(assert (=> d!73017 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!274 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!186071)))

(declare-fun bm!27774 () Bool)

(declare-fun call!27777 () ListLongMap!5485)

(assert (=> bm!27774 (= call!27777 (getCurrentListMapNoExtraKeys!983 (array!23308 (store (arr!11112 _keys!658) i!548 k0!778) (size!11465 _keys!658)) (array!23310 (store (arr!11113 _values!506) i!548 (ValueCellFull!4511 v!373)) (size!11466 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393300 () Bool)

(declare-fun e!238108 () Bool)

(assert (=> b!393300 (= e!238109 e!238108)))

(declare-fun c!54403 () Bool)

(assert (=> b!393300 (= c!54403 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!393301 () Bool)

(assert (=> b!393301 (= e!238108 (= call!27777 (+!1078 call!27776 (tuple2!6583 k0!778 v!373))))))

(declare-fun b!393302 () Bool)

(assert (=> b!393302 (= e!238108 (= call!27777 call!27776))))

(assert (= (and d!73017 res!225352) b!393300))

(assert (= (and b!393300 c!54403) b!393301))

(assert (= (and b!393300 (not c!54403)) b!393302))

(assert (= (or b!393301 b!393302) bm!27773))

(assert (= (or b!393301 b!393302) bm!27774))

(assert (=> bm!27773 m!389099))

(declare-fun m!389323 () Bool)

(assert (=> d!73017 m!389323))

(assert (=> bm!27774 m!389125))

(assert (=> bm!27774 m!389107))

(declare-fun m!389325 () Bool)

(assert (=> bm!27774 m!389325))

(declare-fun m!389327 () Bool)

(assert (=> b!393301 m!389327))

(assert (=> b!393075 d!73017))

(declare-fun b!393303 () Bool)

(declare-fun e!238118 () Bool)

(declare-fun e!238113 () Bool)

(assert (=> b!393303 (= e!238118 e!238113)))

(declare-fun c!54405 () Bool)

(assert (=> b!393303 (= c!54405 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!73019 () Bool)

(assert (=> d!73019 e!238118))

(declare-fun res!225358 () Bool)

(assert (=> d!73019 (=> (not res!225358) (not e!238118))))

(assert (=> d!73019 (= res!225358 (or (bvsge #b00000000000000000000000000000000 (size!11465 lt!185902)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))))

(declare-fun lt!186089 () ListLongMap!5485)

(declare-fun lt!186081 () ListLongMap!5485)

(assert (=> d!73019 (= lt!186089 lt!186081)))

(declare-fun lt!186075 () Unit!12004)

(declare-fun e!238115 () Unit!12004)

(assert (=> d!73019 (= lt!186075 e!238115)))

(declare-fun c!54407 () Bool)

(declare-fun e!238116 () Bool)

(assert (=> d!73019 (= c!54407 e!238116)))

(declare-fun res!225359 () Bool)

(assert (=> d!73019 (=> (not res!225359) (not e!238116))))

(assert (=> d!73019 (= res!225359 (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(declare-fun e!238117 () ListLongMap!5485)

(assert (=> d!73019 (= lt!186081 e!238117)))

(declare-fun c!54406 () Bool)

(assert (=> d!73019 (= c!54406 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73019 (validMask!0 mask!970)))

(assert (=> d!73019 (= (getCurrentListMap!2073 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186089)))

(declare-fun b!393304 () Bool)

(declare-fun Unit!12009 () Unit!12004)

(assert (=> b!393304 (= e!238115 Unit!12009)))

(declare-fun b!393305 () Bool)

(declare-fun res!225354 () Bool)

(assert (=> b!393305 (=> (not res!225354) (not e!238118))))

(declare-fun e!238119 () Bool)

(assert (=> b!393305 (= res!225354 e!238119)))

(declare-fun res!225360 () Bool)

(assert (=> b!393305 (=> res!225360 e!238119)))

(declare-fun e!238110 () Bool)

(assert (=> b!393305 (= res!225360 (not e!238110))))

(declare-fun res!225357 () Bool)

(assert (=> b!393305 (=> (not res!225357) (not e!238110))))

(assert (=> b!393305 (= res!225357 (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(declare-fun b!393306 () Bool)

(declare-fun e!238122 () ListLongMap!5485)

(declare-fun call!27779 () ListLongMap!5485)

(assert (=> b!393306 (= e!238122 call!27779)))

(declare-fun b!393307 () Bool)

(declare-fun call!27780 () ListLongMap!5485)

(assert (=> b!393307 (= e!238122 call!27780)))

(declare-fun b!393308 () Bool)

(declare-fun e!238114 () Bool)

(declare-fun e!238111 () Bool)

(assert (=> b!393308 (= e!238114 e!238111)))

(declare-fun res!225356 () Bool)

(declare-fun call!27781 () Bool)

(assert (=> b!393308 (= res!225356 call!27781)))

(assert (=> b!393308 (=> (not res!225356) (not e!238111))))

(declare-fun bm!27775 () Bool)

(declare-fun call!27783 () ListLongMap!5485)

(assert (=> bm!27775 (= call!27780 call!27783)))

(declare-fun b!393309 () Bool)

(declare-fun e!238120 () Bool)

(assert (=> b!393309 (= e!238120 (= (apply!307 lt!186089 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393310 () Bool)

(declare-fun e!238121 () ListLongMap!5485)

(assert (=> b!393310 (= e!238121 call!27780)))

(declare-fun b!393311 () Bool)

(declare-fun call!27778 () Bool)

(assert (=> b!393311 (= e!238113 (not call!27778))))

(declare-fun bm!27776 () Bool)

(assert (=> bm!27776 (= call!27781 (contains!2461 lt!186089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393312 () Bool)

(assert (=> b!393312 (= e!238117 e!238121)))

(declare-fun c!54409 () Bool)

(assert (=> b!393312 (= c!54409 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27784 () ListLongMap!5485)

(declare-fun bm!27777 () Bool)

(declare-fun call!27782 () ListLongMap!5485)

(assert (=> bm!27777 (= call!27783 (+!1078 (ite c!54406 call!27784 (ite c!54409 call!27782 call!27779)) (ite (or c!54406 c!54409) (tuple2!6583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!393313 () Bool)

(assert (=> b!393313 (= e!238117 (+!1078 call!27783 (tuple2!6583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393314 () Bool)

(assert (=> b!393314 (= e!238114 (not call!27781))))

(declare-fun b!393315 () Bool)

(assert (=> b!393315 (= e!238113 e!238120)))

(declare-fun res!225353 () Bool)

(assert (=> b!393315 (= res!225353 call!27778)))

(assert (=> b!393315 (=> (not res!225353) (not e!238120))))

(declare-fun b!393316 () Bool)

(declare-fun e!238112 () Bool)

(assert (=> b!393316 (= e!238119 e!238112)))

(declare-fun res!225361 () Bool)

(assert (=> b!393316 (=> (not res!225361) (not e!238112))))

(assert (=> b!393316 (= res!225361 (contains!2461 lt!186089 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(assert (=> b!393316 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(declare-fun b!393317 () Bool)

(declare-fun lt!186092 () Unit!12004)

(assert (=> b!393317 (= e!238115 lt!186092)))

(declare-fun lt!186082 () ListLongMap!5485)

(assert (=> b!393317 (= lt!186082 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186088 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186076 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186076 (select (arr!11112 lt!185902) #b00000000000000000000000000000000))))

(declare-fun lt!186083 () Unit!12004)

(assert (=> b!393317 (= lt!186083 (addStillContains!283 lt!186082 lt!186088 zeroValue!472 lt!186076))))

(assert (=> b!393317 (contains!2461 (+!1078 lt!186082 (tuple2!6583 lt!186088 zeroValue!472)) lt!186076)))

(declare-fun lt!186079 () Unit!12004)

(assert (=> b!393317 (= lt!186079 lt!186083)))

(declare-fun lt!186087 () ListLongMap!5485)

(assert (=> b!393317 (= lt!186087 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186086 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186086 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186084 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186084 (select (arr!11112 lt!185902) #b00000000000000000000000000000000))))

(declare-fun lt!186085 () Unit!12004)

(assert (=> b!393317 (= lt!186085 (addApplyDifferent!283 lt!186087 lt!186086 minValue!472 lt!186084))))

(assert (=> b!393317 (= (apply!307 (+!1078 lt!186087 (tuple2!6583 lt!186086 minValue!472)) lt!186084) (apply!307 lt!186087 lt!186084))))

(declare-fun lt!186072 () Unit!12004)

(assert (=> b!393317 (= lt!186072 lt!186085)))

(declare-fun lt!186077 () ListLongMap!5485)

(assert (=> b!393317 (= lt!186077 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186074 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186074 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186078 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186078 (select (arr!11112 lt!185902) #b00000000000000000000000000000000))))

(declare-fun lt!186090 () Unit!12004)

(assert (=> b!393317 (= lt!186090 (addApplyDifferent!283 lt!186077 lt!186074 zeroValue!472 lt!186078))))

(assert (=> b!393317 (= (apply!307 (+!1078 lt!186077 (tuple2!6583 lt!186074 zeroValue!472)) lt!186078) (apply!307 lt!186077 lt!186078))))

(declare-fun lt!186093 () Unit!12004)

(assert (=> b!393317 (= lt!186093 lt!186090)))

(declare-fun lt!186080 () ListLongMap!5485)

(assert (=> b!393317 (= lt!186080 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186091 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186091 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186073 () (_ BitVec 64))

(assert (=> b!393317 (= lt!186073 (select (arr!11112 lt!185902) #b00000000000000000000000000000000))))

(assert (=> b!393317 (= lt!186092 (addApplyDifferent!283 lt!186080 lt!186091 minValue!472 lt!186073))))

(assert (=> b!393317 (= (apply!307 (+!1078 lt!186080 (tuple2!6583 lt!186091 minValue!472)) lt!186073) (apply!307 lt!186080 lt!186073))))

(declare-fun bm!27778 () Bool)

(assert (=> bm!27778 (= call!27779 call!27782)))

(declare-fun b!393318 () Bool)

(assert (=> b!393318 (= e!238110 (validKeyInArray!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(declare-fun b!393319 () Bool)

(assert (=> b!393319 (= e!238111 (= (apply!307 lt!186089 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27779 () Bool)

(assert (=> bm!27779 (= call!27782 call!27784)))

(declare-fun b!393320 () Bool)

(assert (=> b!393320 (= e!238112 (= (apply!307 lt!186089 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)) (get!5611 (select (arr!11113 lt!185903) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 lt!185903)))))

(assert (=> b!393320 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(declare-fun b!393321 () Bool)

(declare-fun c!54404 () Bool)

(assert (=> b!393321 (= c!54404 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393321 (= e!238121 e!238122)))

(declare-fun bm!27780 () Bool)

(assert (=> bm!27780 (= call!27784 (getCurrentListMapNoExtraKeys!983 lt!185902 lt!185903 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393322 () Bool)

(declare-fun res!225355 () Bool)

(assert (=> b!393322 (=> (not res!225355) (not e!238118))))

(assert (=> b!393322 (= res!225355 e!238114)))

(declare-fun c!54408 () Bool)

(assert (=> b!393322 (= c!54408 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27781 () Bool)

(assert (=> bm!27781 (= call!27778 (contains!2461 lt!186089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393323 () Bool)

(assert (=> b!393323 (= e!238116 (validKeyInArray!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(assert (= (and d!73019 c!54406) b!393313))

(assert (= (and d!73019 (not c!54406)) b!393312))

(assert (= (and b!393312 c!54409) b!393310))

(assert (= (and b!393312 (not c!54409)) b!393321))

(assert (= (and b!393321 c!54404) b!393307))

(assert (= (and b!393321 (not c!54404)) b!393306))

(assert (= (or b!393307 b!393306) bm!27778))

(assert (= (or b!393310 bm!27778) bm!27779))

(assert (= (or b!393310 b!393307) bm!27775))

(assert (= (or b!393313 bm!27779) bm!27780))

(assert (= (or b!393313 bm!27775) bm!27777))

(assert (= (and d!73019 res!225359) b!393323))

(assert (= (and d!73019 c!54407) b!393317))

(assert (= (and d!73019 (not c!54407)) b!393304))

(assert (= (and d!73019 res!225358) b!393305))

(assert (= (and b!393305 res!225357) b!393318))

(assert (= (and b!393305 (not res!225360)) b!393316))

(assert (= (and b!393316 res!225361) b!393320))

(assert (= (and b!393305 res!225354) b!393322))

(assert (= (and b!393322 c!54408) b!393308))

(assert (= (and b!393322 (not c!54408)) b!393314))

(assert (= (and b!393308 res!225356) b!393319))

(assert (= (or b!393308 b!393314) bm!27776))

(assert (= (and b!393322 res!225355) b!393303))

(assert (= (and b!393303 c!54405) b!393315))

(assert (= (and b!393303 (not c!54405)) b!393311))

(assert (= (and b!393315 res!225353) b!393309))

(assert (= (or b!393315 b!393311) bm!27781))

(declare-fun b_lambda!8759 () Bool)

(assert (=> (not b_lambda!8759) (not b!393320)))

(assert (=> b!393320 t!11589))

(declare-fun b_and!16389 () Bool)

(assert (= b_and!16387 (and (=> t!11589 result!5759) b_and!16389)))

(declare-fun m!389329 () Bool)

(assert (=> b!393309 m!389329))

(assert (=> b!393320 m!389219))

(assert (=> b!393320 m!389303))

(assert (=> b!393320 m!389203))

(assert (=> b!393320 m!389203))

(declare-fun m!389331 () Bool)

(assert (=> b!393320 m!389331))

(assert (=> b!393320 m!389303))

(assert (=> b!393320 m!389219))

(assert (=> b!393320 m!389305))

(declare-fun m!389333 () Bool)

(assert (=> b!393317 m!389333))

(declare-fun m!389335 () Bool)

(assert (=> b!393317 m!389335))

(declare-fun m!389337 () Bool)

(assert (=> b!393317 m!389337))

(declare-fun m!389339 () Bool)

(assert (=> b!393317 m!389339))

(declare-fun m!389341 () Bool)

(assert (=> b!393317 m!389341))

(assert (=> b!393317 m!389339))

(declare-fun m!389343 () Bool)

(assert (=> b!393317 m!389343))

(declare-fun m!389345 () Bool)

(assert (=> b!393317 m!389345))

(assert (=> b!393317 m!389335))

(declare-fun m!389347 () Bool)

(assert (=> b!393317 m!389347))

(declare-fun m!389349 () Bool)

(assert (=> b!393317 m!389349))

(declare-fun m!389351 () Bool)

(assert (=> b!393317 m!389351))

(assert (=> b!393317 m!389109))

(declare-fun m!389353 () Bool)

(assert (=> b!393317 m!389353))

(assert (=> b!393317 m!389349))

(declare-fun m!389355 () Bool)

(assert (=> b!393317 m!389355))

(declare-fun m!389357 () Bool)

(assert (=> b!393317 m!389357))

(assert (=> b!393317 m!389203))

(assert (=> b!393317 m!389347))

(declare-fun m!389359 () Bool)

(assert (=> b!393317 m!389359))

(declare-fun m!389361 () Bool)

(assert (=> b!393317 m!389361))

(declare-fun m!389363 () Bool)

(assert (=> bm!27776 m!389363))

(assert (=> b!393323 m!389203))

(assert (=> b!393323 m!389203))

(assert (=> b!393323 m!389205))

(assert (=> bm!27780 m!389109))

(declare-fun m!389365 () Bool)

(assert (=> bm!27777 m!389365))

(assert (=> b!393318 m!389203))

(assert (=> b!393318 m!389203))

(assert (=> b!393318 m!389205))

(declare-fun m!389367 () Bool)

(assert (=> b!393313 m!389367))

(declare-fun m!389369 () Bool)

(assert (=> b!393319 m!389369))

(assert (=> d!73019 m!389117))

(assert (=> b!393316 m!389203))

(assert (=> b!393316 m!389203))

(declare-fun m!389371 () Bool)

(assert (=> b!393316 m!389371))

(declare-fun m!389373 () Bool)

(assert (=> bm!27781 m!389373))

(assert (=> b!393075 d!73019))

(declare-fun b!393332 () Bool)

(declare-fun e!238129 () Bool)

(declare-fun call!27787 () Bool)

(assert (=> b!393332 (= e!238129 call!27787)))

(declare-fun b!393333 () Bool)

(declare-fun e!238130 () Bool)

(assert (=> b!393333 (= e!238129 e!238130)))

(declare-fun lt!186101 () (_ BitVec 64))

(assert (=> b!393333 (= lt!186101 (select (arr!11112 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186100 () Unit!12004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23307 (_ BitVec 64) (_ BitVec 32)) Unit!12004)

(assert (=> b!393333 (= lt!186100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!186101 #b00000000000000000000000000000000))))

(assert (=> b!393333 (arrayContainsKey!0 _keys!658 lt!186101 #b00000000000000000000000000000000)))

(declare-fun lt!186102 () Unit!12004)

(assert (=> b!393333 (= lt!186102 lt!186100)))

(declare-fun res!225367 () Bool)

(declare-datatypes ((SeekEntryResult!3513 0))(
  ( (MissingZero!3513 (index!16231 (_ BitVec 32))) (Found!3513 (index!16232 (_ BitVec 32))) (Intermediate!3513 (undefined!4325 Bool) (index!16233 (_ BitVec 32)) (x!38467 (_ BitVec 32))) (Undefined!3513) (MissingVacant!3513 (index!16234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23307 (_ BitVec 32)) SeekEntryResult!3513)

(assert (=> b!393333 (= res!225367 (= (seekEntryOrOpen!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3513 #b00000000000000000000000000000000)))))

(assert (=> b!393333 (=> (not res!225367) (not e!238130))))

(declare-fun b!393334 () Bool)

(declare-fun e!238131 () Bool)

(assert (=> b!393334 (= e!238131 e!238129)))

(declare-fun c!54412 () Bool)

(assert (=> b!393334 (= c!54412 (validKeyInArray!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27784 () Bool)

(assert (=> bm!27784 (= call!27787 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!73021 () Bool)

(declare-fun res!225366 () Bool)

(assert (=> d!73021 (=> res!225366 e!238131)))

(assert (=> d!73021 (= res!225366 (bvsge #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(assert (=> d!73021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!238131)))

(declare-fun b!393335 () Bool)

(assert (=> b!393335 (= e!238130 call!27787)))

(assert (= (and d!73021 (not res!225366)) b!393334))

(assert (= (and b!393334 c!54412) b!393333))

(assert (= (and b!393334 (not c!54412)) b!393332))

(assert (= (and b!393333 res!225367) b!393335))

(assert (= (or b!393335 b!393332) bm!27784))

(assert (=> b!393333 m!389213))

(declare-fun m!389375 () Bool)

(assert (=> b!393333 m!389375))

(declare-fun m!389377 () Bool)

(assert (=> b!393333 m!389377))

(assert (=> b!393333 m!389213))

(declare-fun m!389379 () Bool)

(assert (=> b!393333 m!389379))

(assert (=> b!393334 m!389213))

(assert (=> b!393334 m!389213))

(assert (=> b!393334 m!389225))

(declare-fun m!389381 () Bool)

(assert (=> bm!27784 m!389381))

(assert (=> b!393078 d!73021))

(declare-fun b!393336 () Bool)

(declare-fun e!238132 () Bool)

(declare-fun call!27788 () Bool)

(assert (=> b!393336 (= e!238132 call!27788)))

(declare-fun b!393337 () Bool)

(declare-fun e!238133 () Bool)

(assert (=> b!393337 (= e!238132 e!238133)))

(declare-fun lt!186104 () (_ BitVec 64))

(assert (=> b!393337 (= lt!186104 (select (arr!11112 lt!185902) #b00000000000000000000000000000000))))

(declare-fun lt!186103 () Unit!12004)

(assert (=> b!393337 (= lt!186103 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185902 lt!186104 #b00000000000000000000000000000000))))

(assert (=> b!393337 (arrayContainsKey!0 lt!185902 lt!186104 #b00000000000000000000000000000000)))

(declare-fun lt!186105 () Unit!12004)

(assert (=> b!393337 (= lt!186105 lt!186103)))

(declare-fun res!225369 () Bool)

(assert (=> b!393337 (= res!225369 (= (seekEntryOrOpen!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000) lt!185902 mask!970) (Found!3513 #b00000000000000000000000000000000)))))

(assert (=> b!393337 (=> (not res!225369) (not e!238133))))

(declare-fun b!393338 () Bool)

(declare-fun e!238134 () Bool)

(assert (=> b!393338 (= e!238134 e!238132)))

(declare-fun c!54413 () Bool)

(assert (=> b!393338 (= c!54413 (validKeyInArray!0 (select (arr!11112 lt!185902) #b00000000000000000000000000000000)))))

(declare-fun bm!27785 () Bool)

(assert (=> bm!27785 (= call!27788 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185902 mask!970))))

(declare-fun d!73023 () Bool)

(declare-fun res!225368 () Bool)

(assert (=> d!73023 (=> res!225368 e!238134)))

(assert (=> d!73023 (= res!225368 (bvsge #b00000000000000000000000000000000 (size!11465 lt!185902)))))

(assert (=> d!73023 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185902 mask!970) e!238134)))

(declare-fun b!393339 () Bool)

(assert (=> b!393339 (= e!238133 call!27788)))

(assert (= (and d!73023 (not res!225368)) b!393338))

(assert (= (and b!393338 c!54413) b!393337))

(assert (= (and b!393338 (not c!54413)) b!393336))

(assert (= (and b!393337 res!225369) b!393339))

(assert (= (or b!393339 b!393336) bm!27785))

(assert (=> b!393337 m!389203))

(declare-fun m!389383 () Bool)

(assert (=> b!393337 m!389383))

(declare-fun m!389385 () Bool)

(assert (=> b!393337 m!389385))

(assert (=> b!393337 m!389203))

(declare-fun m!389387 () Bool)

(assert (=> b!393337 m!389387))

(assert (=> b!393338 m!389203))

(assert (=> b!393338 m!389203))

(assert (=> b!393338 m!389205))

(declare-fun m!389389 () Bool)

(assert (=> bm!27785 m!389389))

(assert (=> b!393071 d!73023))

(declare-fun d!73025 () Bool)

(assert (=> d!73025 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38142 d!73025))

(declare-fun d!73027 () Bool)

(assert (=> d!73027 (= (array_inv!8160 _values!506) (bvsge (size!11466 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38142 d!73027))

(declare-fun d!73029 () Bool)

(assert (=> d!73029 (= (array_inv!8161 _keys!658) (bvsge (size!11465 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38142 d!73029))

(declare-fun d!73031 () Bool)

(declare-fun res!225372 () Bool)

(declare-fun e!238137 () Bool)

(assert (=> d!73031 (=> res!225372 e!238137)))

(assert (=> d!73031 (= res!225372 (bvsge #b00000000000000000000000000000000 (size!11465 _keys!658)))))

(assert (=> d!73031 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6419) e!238137)))

(declare-fun b!393340 () Bool)

(declare-fun e!238135 () Bool)

(declare-fun e!238138 () Bool)

(assert (=> b!393340 (= e!238135 e!238138)))

(declare-fun c!54414 () Bool)

(assert (=> b!393340 (= c!54414 (validKeyInArray!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27786 () Bool)

(declare-fun call!27789 () Bool)

(assert (=> bm!27786 (= call!27789 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54414 (Cons!6418 (select (arr!11112 _keys!658) #b00000000000000000000000000000000) Nil!6419) Nil!6419)))))

(declare-fun b!393341 () Bool)

(declare-fun e!238136 () Bool)

(assert (=> b!393341 (= e!238136 (contains!2460 Nil!6419 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393342 () Bool)

(assert (=> b!393342 (= e!238137 e!238135)))

(declare-fun res!225371 () Bool)

(assert (=> b!393342 (=> (not res!225371) (not e!238135))))

(assert (=> b!393342 (= res!225371 (not e!238136))))

(declare-fun res!225370 () Bool)

(assert (=> b!393342 (=> (not res!225370) (not e!238136))))

(assert (=> b!393342 (= res!225370 (validKeyInArray!0 (select (arr!11112 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393343 () Bool)

(assert (=> b!393343 (= e!238138 call!27789)))

(declare-fun b!393344 () Bool)

(assert (=> b!393344 (= e!238138 call!27789)))

(assert (= (and d!73031 (not res!225372)) b!393342))

(assert (= (and b!393342 res!225370) b!393341))

(assert (= (and b!393342 res!225371) b!393340))

(assert (= (and b!393340 c!54414) b!393344))

(assert (= (and b!393340 (not c!54414)) b!393343))

(assert (= (or b!393344 b!393343) bm!27786))

(assert (=> b!393340 m!389213))

(assert (=> b!393340 m!389213))

(assert (=> b!393340 m!389225))

(assert (=> bm!27786 m!389213))

(declare-fun m!389391 () Bool)

(assert (=> bm!27786 m!389391))

(assert (=> b!393341 m!389213))

(assert (=> b!393341 m!389213))

(declare-fun m!389393 () Bool)

(assert (=> b!393341 m!389393))

(assert (=> b!393342 m!389213))

(assert (=> b!393342 m!389213))

(assert (=> b!393342 m!389225))

(assert (=> b!393072 d!73031))

(declare-fun d!73033 () Bool)

(declare-fun res!225377 () Bool)

(declare-fun e!238143 () Bool)

(assert (=> d!73033 (=> res!225377 e!238143)))

(assert (=> d!73033 (= res!225377 (= (select (arr!11112 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73033 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!238143)))

(declare-fun b!393349 () Bool)

(declare-fun e!238144 () Bool)

(assert (=> b!393349 (= e!238143 e!238144)))

(declare-fun res!225378 () Bool)

(assert (=> b!393349 (=> (not res!225378) (not e!238144))))

(assert (=> b!393349 (= res!225378 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11465 _keys!658)))))

(declare-fun b!393350 () Bool)

(assert (=> b!393350 (= e!238144 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73033 (not res!225377)) b!393349))

(assert (= (and b!393349 res!225378) b!393350))

(assert (=> d!73033 m!389213))

(declare-fun m!389395 () Bool)

(assert (=> b!393350 m!389395))

(assert (=> b!393076 d!73033))

(declare-fun mapNonEmpty!16167 () Bool)

(declare-fun mapRes!16167 () Bool)

(declare-fun tp!31908 () Bool)

(declare-fun e!238149 () Bool)

(assert (=> mapNonEmpty!16167 (= mapRes!16167 (and tp!31908 e!238149))))

(declare-fun mapRest!16167 () (Array (_ BitVec 32) ValueCell!4511))

(declare-fun mapKey!16167 () (_ BitVec 32))

(declare-fun mapValue!16167 () ValueCell!4511)

(assert (=> mapNonEmpty!16167 (= mapRest!16158 (store mapRest!16167 mapKey!16167 mapValue!16167))))

(declare-fun b!393357 () Bool)

(assert (=> b!393357 (= e!238149 tp_is_empty!9709)))

(declare-fun b!393358 () Bool)

(declare-fun e!238150 () Bool)

(assert (=> b!393358 (= e!238150 tp_is_empty!9709)))

(declare-fun condMapEmpty!16167 () Bool)

(declare-fun mapDefault!16167 () ValueCell!4511)

(assert (=> mapNonEmpty!16158 (= condMapEmpty!16167 (= mapRest!16158 ((as const (Array (_ BitVec 32) ValueCell!4511)) mapDefault!16167)))))

(assert (=> mapNonEmpty!16158 (= tp!31892 (and e!238150 mapRes!16167))))

(declare-fun mapIsEmpty!16167 () Bool)

(assert (=> mapIsEmpty!16167 mapRes!16167))

(assert (= (and mapNonEmpty!16158 condMapEmpty!16167) mapIsEmpty!16167))

(assert (= (and mapNonEmpty!16158 (not condMapEmpty!16167)) mapNonEmpty!16167))

(assert (= (and mapNonEmpty!16167 ((_ is ValueCellFull!4511) mapValue!16167)) b!393357))

(assert (= (and mapNonEmpty!16158 ((_ is ValueCellFull!4511) mapDefault!16167)) b!393358))

(declare-fun m!389397 () Bool)

(assert (=> mapNonEmpty!16167 m!389397))

(declare-fun b_lambda!8761 () Bool)

(assert (= b_lambda!8751 (or (and start!38142 b_free!9037) b_lambda!8761)))

(declare-fun b_lambda!8763 () Bool)

(assert (= b_lambda!8757 (or (and start!38142 b_free!9037) b_lambda!8763)))

(declare-fun b_lambda!8765 () Bool)

(assert (= b_lambda!8755 (or (and start!38142 b_free!9037) b_lambda!8765)))

(declare-fun b_lambda!8767 () Bool)

(assert (= b_lambda!8753 (or (and start!38142 b_free!9037) b_lambda!8767)))

(declare-fun b_lambda!8769 () Bool)

(assert (= b_lambda!8759 (or (and start!38142 b_free!9037) b_lambda!8769)))

(declare-fun b_lambda!8771 () Bool)

(assert (= b_lambda!8749 (or (and start!38142 b_free!9037) b_lambda!8771)))

(check-sat (not bm!27774) (not b!393280) (not b!393317) (not bm!27746) (not b!393270) (not bm!27743) (not b!393261) (not b!393320) (not b!393207) (not d!73017) (not b!393319) (not b_lambda!8765) (not bm!27768) (not b!393171) (not b_next!9037) (not d!73011) (not bm!27786) (not bm!27776) (not b!393293) (not b!393210) (not d!73013) (not b_lambda!8769) (not b!393313) (not mapNonEmpty!16167) (not bm!27763) (not b!393350) (not b!393271) (not b!393204) (not b!393269) (not d!73019) (not b!393206) (not b!393289) (not b!393338) (not bm!27766) (not d!73015) tp_is_empty!9709 (not bm!27784) (not b!393309) (not bm!27785) (not b!393272) (not bm!27762) (not b!393201) (not b!393318) (not b!393283) (not b!393292) b_and!16389 (not b!393209) (not b!393323) (not b!393342) (not bm!27767) (not bm!27773) (not b!393333) (not bm!27777) (not b!393281) (not bm!27780) (not d!73009) (not b!393337) (not b!393200) (not b!393340) (not b_lambda!8763) (not b_lambda!8761) (not b!393287) (not b!393334) (not b_lambda!8767) (not b!393290) (not b!393341) (not b!393170) (not b!393265) (not b!393286) (not b!393172) (not b!393203) (not b!393316) (not b!393284) (not b_lambda!8771) (not b!393268) (not b!393301) (not bm!27781) (not b!393275))
(check-sat b_and!16389 (not b_next!9037))
