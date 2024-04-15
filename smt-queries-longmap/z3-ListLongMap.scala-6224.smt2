; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79562 () Bool)

(assert start!79562)

(declare-fun b_free!17665 () Bool)

(declare-fun b_next!17665 () Bool)

(assert (=> start!79562 (= b_free!17665 (not b_next!17665))))

(declare-fun tp!61448 () Bool)

(declare-fun b_and!28887 () Bool)

(assert (=> start!79562 (= tp!61448 b_and!28887)))

(declare-fun b!935134 () Bool)

(declare-fun res!629783 () Bool)

(declare-fun e!525082 () Bool)

(assert (=> b!935134 (=> (not res!629783) (not e!525082))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31863 0))(
  ( (V!31864 (val!10137 Int)) )
))
(declare-fun v!791 () V!31863)

(declare-datatypes ((tuple2!13360 0))(
  ( (tuple2!13361 (_1!6691 (_ BitVec 64)) (_2!6691 V!31863)) )
))
(declare-datatypes ((List!19108 0))(
  ( (Nil!19105) (Cons!19104 (h!20250 tuple2!13360) (t!27308 List!19108)) )
))
(declare-datatypes ((ListLongMap!12047 0))(
  ( (ListLongMap!12048 (toList!6039 List!19108)) )
))
(declare-fun lt!421335 () ListLongMap!12047)

(declare-fun apply!818 (ListLongMap!12047 (_ BitVec 64)) V!31863)

(assert (=> b!935134 (= res!629783 (= (apply!818 lt!421335 k0!1099) v!791))))

(declare-fun b!935135 () Bool)

(declare-fun e!525086 () Bool)

(declare-fun tp_is_empty!20173 () Bool)

(assert (=> b!935135 (= e!525086 tp_is_empty!20173)))

(declare-fun b!935136 () Bool)

(declare-fun res!629784 () Bool)

(assert (=> b!935136 (=> (not res!629784) (not e!525082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935136 (= res!629784 (validKeyInArray!0 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!525083 () Bool)

(declare-fun b!935137 () Bool)

(declare-datatypes ((array!56253 0))(
  ( (array!56254 (arr!27068 (Array (_ BitVec 32) (_ BitVec 64))) (size!27529 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56253)

(declare-fun arrayContainsKey!0 (array!56253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935137 (= e!525083 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935138 () Bool)

(declare-fun e!525080 () Bool)

(assert (=> b!935138 (= e!525080 e!525082)))

(declare-fun res!629785 () Bool)

(assert (=> b!935138 (=> (not res!629785) (not e!525082))))

(declare-fun contains!5042 (ListLongMap!12047 (_ BitVec 64)) Bool)

(assert (=> b!935138 (= res!629785 (contains!5042 lt!421335 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9605 0))(
  ( (ValueCellFull!9605 (v!12659 V!31863)) (EmptyCell!9605) )
))
(declare-datatypes ((array!56255 0))(
  ( (array!56256 (arr!27069 (Array (_ BitVec 32) ValueCell!9605)) (size!27530 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56255)

(declare-fun zeroValue!1173 () V!31863)

(declare-fun minValue!1173 () V!31863)

(declare-fun getCurrentListMap!3209 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) ListLongMap!12047)

(assert (=> b!935138 (= lt!421335 (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935139 () Bool)

(declare-fun res!629791 () Bool)

(assert (=> b!935139 (=> (not res!629791) (not e!525080))))

(declare-datatypes ((List!19109 0))(
  ( (Nil!19106) (Cons!19105 (h!20251 (_ BitVec 64)) (t!27309 List!19109)) )
))
(declare-fun arrayNoDuplicates!0 (array!56253 (_ BitVec 32) List!19109) Bool)

(assert (=> b!935139 (= res!629791 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19106))))

(declare-fun b!935140 () Bool)

(declare-fun res!629793 () Bool)

(assert (=> b!935140 (=> (not res!629793) (not e!525080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56253 (_ BitVec 32)) Bool)

(assert (=> b!935140 (= res!629793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935141 () Bool)

(declare-fun res!629782 () Bool)

(assert (=> b!935141 (=> (not res!629782) (not e!525080))))

(assert (=> b!935141 (= res!629782 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27529 _keys!1487))))))

(declare-fun b!935142 () Bool)

(declare-fun res!629789 () Bool)

(assert (=> b!935142 (=> (not res!629789) (not e!525080))))

(assert (=> b!935142 (= res!629789 (and (= (size!27530 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27529 _keys!1487) (size!27530 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935143 () Bool)

(declare-fun res!629786 () Bool)

(declare-fun e!525081 () Bool)

(assert (=> b!935143 (=> res!629786 e!525081)))

(declare-fun contains!5043 (List!19109 (_ BitVec 64)) Bool)

(assert (=> b!935143 (= res!629786 (contains!5043 Nil!19106 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935144 () Bool)

(declare-fun e!525085 () Bool)

(assert (=> b!935144 (= e!525082 e!525085)))

(declare-fun res!629788 () Bool)

(assert (=> b!935144 (=> (not res!629788) (not e!525085))))

(declare-fun lt!421328 () (_ BitVec 64))

(assert (=> b!935144 (= res!629788 (validKeyInArray!0 lt!421328))))

(assert (=> b!935144 (= lt!421328 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935145 () Bool)

(declare-fun e!525084 () Bool)

(declare-fun e!525088 () Bool)

(declare-fun mapRes!32028 () Bool)

(assert (=> b!935145 (= e!525084 (and e!525088 mapRes!32028))))

(declare-fun condMapEmpty!32028 () Bool)

(declare-fun mapDefault!32028 () ValueCell!9605)

(assert (=> b!935145 (= condMapEmpty!32028 (= (arr!27069 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9605)) mapDefault!32028)))))

(declare-fun b!935146 () Bool)

(declare-fun lt!421336 () (_ BitVec 32))

(assert (=> b!935146 (= e!525081 (arrayContainsKey!0 _keys!1487 k0!1099 lt!421336))))

(declare-fun mapIsEmpty!32028 () Bool)

(assert (=> mapIsEmpty!32028 mapRes!32028))

(declare-fun res!629781 () Bool)

(assert (=> start!79562 (=> (not res!629781) (not e!525080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79562 (= res!629781 (validMask!0 mask!1881))))

(assert (=> start!79562 e!525080))

(assert (=> start!79562 true))

(assert (=> start!79562 tp_is_empty!20173))

(declare-fun array_inv!21126 (array!56255) Bool)

(assert (=> start!79562 (and (array_inv!21126 _values!1231) e!525084)))

(assert (=> start!79562 tp!61448))

(declare-fun array_inv!21127 (array!56253) Bool)

(assert (=> start!79562 (array_inv!21127 _keys!1487)))

(declare-fun b!935147 () Bool)

(declare-fun res!629787 () Bool)

(assert (=> b!935147 (=> res!629787 e!525081)))

(declare-fun noDuplicate!1361 (List!19109) Bool)

(assert (=> b!935147 (= res!629787 (not (noDuplicate!1361 Nil!19106)))))

(declare-fun b!935148 () Bool)

(declare-fun res!629790 () Bool)

(assert (=> b!935148 (=> res!629790 e!525081)))

(assert (=> b!935148 (= res!629790 (contains!5043 Nil!19106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!32028 () Bool)

(declare-fun tp!61449 () Bool)

(assert (=> mapNonEmpty!32028 (= mapRes!32028 (and tp!61449 e!525086))))

(declare-fun mapKey!32028 () (_ BitVec 32))

(declare-fun mapValue!32028 () ValueCell!9605)

(declare-fun mapRest!32028 () (Array (_ BitVec 32) ValueCell!9605))

(assert (=> mapNonEmpty!32028 (= (arr!27069 _values!1231) (store mapRest!32028 mapKey!32028 mapValue!32028))))

(declare-fun b!935149 () Bool)

(declare-fun res!629792 () Bool)

(assert (=> b!935149 (=> (not res!629792) (not e!525082))))

(assert (=> b!935149 (= res!629792 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935150 () Bool)

(assert (=> b!935150 (= e!525083 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935151 () Bool)

(assert (=> b!935151 (= e!525085 (not e!525081))))

(declare-fun res!629794 () Bool)

(assert (=> b!935151 (=> res!629794 e!525081)))

(assert (=> b!935151 (= res!629794 (or (bvsge (size!27529 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487))))))

(assert (=> b!935151 e!525083))

(declare-fun c!97217 () Bool)

(assert (=> b!935151 (= c!97217 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31463 0))(
  ( (Unit!31464) )
))
(declare-fun lt!421332 () Unit!31463)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!286 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 64) (_ BitVec 32) Int) Unit!31463)

(assert (=> b!935151 (= lt!421332 (lemmaListMapContainsThenArrayContainsFrom!286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!935151 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19106)))

(declare-fun lt!421334 () Unit!31463)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56253 (_ BitVec 32) (_ BitVec 32)) Unit!31463)

(assert (=> b!935151 (= lt!421334 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421333 () tuple2!13360)

(declare-fun +!2839 (ListLongMap!12047 tuple2!13360) ListLongMap!12047)

(assert (=> b!935151 (contains!5042 (+!2839 lt!421335 lt!421333) k0!1099)))

(declare-fun lt!421330 () Unit!31463)

(declare-fun lt!421329 () V!31863)

(declare-fun addStillContains!528 (ListLongMap!12047 (_ BitVec 64) V!31863 (_ BitVec 64)) Unit!31463)

(assert (=> b!935151 (= lt!421330 (addStillContains!528 lt!421335 lt!421328 lt!421329 k0!1099))))

(assert (=> b!935151 (= (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2839 (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235) lt!421333))))

(assert (=> b!935151 (= lt!421333 (tuple2!13361 lt!421328 lt!421329))))

(declare-fun get!14268 (ValueCell!9605 V!31863) V!31863)

(declare-fun dynLambda!1595 (Int (_ BitVec 64)) V!31863)

(assert (=> b!935151 (= lt!421329 (get!14268 (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!935151 (= lt!421336 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421331 () Unit!31463)

(declare-fun lemmaListMapRecursiveValidKeyArray!203 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) Unit!31463)

(assert (=> b!935151 (= lt!421331 (lemmaListMapRecursiveValidKeyArray!203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935152 () Bool)

(assert (=> b!935152 (= e!525088 tp_is_empty!20173)))

(assert (= (and start!79562 res!629781) b!935142))

(assert (= (and b!935142 res!629789) b!935140))

(assert (= (and b!935140 res!629793) b!935139))

(assert (= (and b!935139 res!629791) b!935141))

(assert (= (and b!935141 res!629782) b!935138))

(assert (= (and b!935138 res!629785) b!935134))

(assert (= (and b!935134 res!629783) b!935149))

(assert (= (and b!935149 res!629792) b!935136))

(assert (= (and b!935136 res!629784) b!935144))

(assert (= (and b!935144 res!629788) b!935151))

(assert (= (and b!935151 c!97217) b!935137))

(assert (= (and b!935151 (not c!97217)) b!935150))

(assert (= (and b!935151 (not res!629794)) b!935147))

(assert (= (and b!935147 (not res!629787)) b!935148))

(assert (= (and b!935148 (not res!629790)) b!935143))

(assert (= (and b!935143 (not res!629786)) b!935146))

(assert (= (and b!935145 condMapEmpty!32028) mapIsEmpty!32028))

(assert (= (and b!935145 (not condMapEmpty!32028)) mapNonEmpty!32028))

(get-info :version)

(assert (= (and mapNonEmpty!32028 ((_ is ValueCellFull!9605) mapValue!32028)) b!935135))

(assert (= (and b!935145 ((_ is ValueCellFull!9605) mapDefault!32028)) b!935152))

(assert (= start!79562 b!935145))

(declare-fun b_lambda!14035 () Bool)

(assert (=> (not b_lambda!14035) (not b!935151)))

(declare-fun t!27307 () Bool)

(declare-fun tb!6051 () Bool)

(assert (=> (and start!79562 (= defaultEntry!1235 defaultEntry!1235) t!27307) tb!6051))

(declare-fun result!11941 () Bool)

(assert (=> tb!6051 (= result!11941 tp_is_empty!20173)))

(assert (=> b!935151 t!27307))

(declare-fun b_and!28889 () Bool)

(assert (= b_and!28887 (and (=> t!27307 result!11941) b_and!28889)))

(declare-fun m!869063 () Bool)

(assert (=> b!935143 m!869063))

(declare-fun m!869065 () Bool)

(assert (=> mapNonEmpty!32028 m!869065))

(declare-fun m!869067 () Bool)

(assert (=> b!935138 m!869067))

(declare-fun m!869069 () Bool)

(assert (=> b!935138 m!869069))

(declare-fun m!869071 () Bool)

(assert (=> b!935144 m!869071))

(declare-fun m!869073 () Bool)

(assert (=> b!935144 m!869073))

(declare-fun m!869075 () Bool)

(assert (=> b!935146 m!869075))

(declare-fun m!869077 () Bool)

(assert (=> b!935151 m!869077))

(declare-fun m!869079 () Bool)

(assert (=> b!935151 m!869079))

(declare-fun m!869081 () Bool)

(assert (=> b!935151 m!869081))

(assert (=> b!935151 m!869079))

(declare-fun m!869083 () Bool)

(assert (=> b!935151 m!869083))

(declare-fun m!869085 () Bool)

(assert (=> b!935151 m!869085))

(assert (=> b!935151 m!869081))

(declare-fun m!869087 () Bool)

(assert (=> b!935151 m!869087))

(declare-fun m!869089 () Bool)

(assert (=> b!935151 m!869089))

(declare-fun m!869091 () Bool)

(assert (=> b!935151 m!869091))

(declare-fun m!869093 () Bool)

(assert (=> b!935151 m!869093))

(declare-fun m!869095 () Bool)

(assert (=> b!935151 m!869095))

(declare-fun m!869097 () Bool)

(assert (=> b!935151 m!869097))

(declare-fun m!869099 () Bool)

(assert (=> b!935151 m!869099))

(assert (=> b!935151 m!869085))

(declare-fun m!869101 () Bool)

(assert (=> b!935151 m!869101))

(assert (=> b!935151 m!869091))

(declare-fun m!869103 () Bool)

(assert (=> start!79562 m!869103))

(declare-fun m!869105 () Bool)

(assert (=> start!79562 m!869105))

(declare-fun m!869107 () Bool)

(assert (=> start!79562 m!869107))

(declare-fun m!869109 () Bool)

(assert (=> b!935134 m!869109))

(declare-fun m!869111 () Bool)

(assert (=> b!935139 m!869111))

(declare-fun m!869113 () Bool)

(assert (=> b!935148 m!869113))

(declare-fun m!869115 () Bool)

(assert (=> b!935140 m!869115))

(declare-fun m!869117 () Bool)

(assert (=> b!935137 m!869117))

(declare-fun m!869119 () Bool)

(assert (=> b!935136 m!869119))

(declare-fun m!869121 () Bool)

(assert (=> b!935147 m!869121))

(check-sat (not b!935137) (not b!935151) (not b!935140) (not b!935134) (not b!935138) (not b_lambda!14035) (not b!935146) (not b_next!17665) b_and!28889 (not b!935147) (not b!935143) (not b!935144) (not mapNonEmpty!32028) (not start!79562) tp_is_empty!20173 (not b!935136) (not b!935139) (not b!935148))
(check-sat b_and!28889 (not b_next!17665))
(get-model)

(declare-fun b_lambda!14041 () Bool)

(assert (= b_lambda!14035 (or (and start!79562 b_free!17665) b_lambda!14041)))

(check-sat (not b!935137) (not b!935151) (not b!935140) (not b!935134) (not b!935138) (not b_lambda!14041) (not b!935146) (not b_next!17665) b_and!28889 (not b!935147) (not b!935143) (not b!935144) (not mapNonEmpty!32028) (not start!79562) tp_is_empty!20173 (not b!935136) (not b!935139) (not b!935148))
(check-sat b_and!28889 (not b_next!17665))
(get-model)

(declare-fun d!113049 () Bool)

(declare-fun res!629886 () Bool)

(declare-fun e!525151 () Bool)

(assert (=> d!113049 (=> res!629886 e!525151)))

(assert (=> d!113049 (= res!629886 (bvsge #b00000000000000000000000000000000 (size!27529 _keys!1487)))))

(assert (=> d!113049 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19106) e!525151)))

(declare-fun b!935283 () Bool)

(declare-fun e!525153 () Bool)

(assert (=> b!935283 (= e!525153 (contains!5043 Nil!19106 (select (arr!27068 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935284 () Bool)

(declare-fun e!525152 () Bool)

(declare-fun call!40693 () Bool)

(assert (=> b!935284 (= e!525152 call!40693)))

(declare-fun bm!40690 () Bool)

(declare-fun c!97226 () Bool)

(assert (=> bm!40690 (= call!40693 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97226 (Cons!19105 (select (arr!27068 _keys!1487) #b00000000000000000000000000000000) Nil!19106) Nil!19106)))))

(declare-fun b!935285 () Bool)

(declare-fun e!525154 () Bool)

(assert (=> b!935285 (= e!525154 e!525152)))

(assert (=> b!935285 (= c!97226 (validKeyInArray!0 (select (arr!27068 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935286 () Bool)

(assert (=> b!935286 (= e!525151 e!525154)))

(declare-fun res!629887 () Bool)

(assert (=> b!935286 (=> (not res!629887) (not e!525154))))

(assert (=> b!935286 (= res!629887 (not e!525153))))

(declare-fun res!629885 () Bool)

(assert (=> b!935286 (=> (not res!629885) (not e!525153))))

(assert (=> b!935286 (= res!629885 (validKeyInArray!0 (select (arr!27068 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!935287 () Bool)

(assert (=> b!935287 (= e!525152 call!40693)))

(assert (= (and d!113049 (not res!629886)) b!935286))

(assert (= (and b!935286 res!629885) b!935283))

(assert (= (and b!935286 res!629887) b!935285))

(assert (= (and b!935285 c!97226) b!935287))

(assert (= (and b!935285 (not c!97226)) b!935284))

(assert (= (or b!935287 b!935284) bm!40690))

(declare-fun m!869243 () Bool)

(assert (=> b!935283 m!869243))

(assert (=> b!935283 m!869243))

(declare-fun m!869245 () Bool)

(assert (=> b!935283 m!869245))

(assert (=> bm!40690 m!869243))

(declare-fun m!869247 () Bool)

(assert (=> bm!40690 m!869247))

(assert (=> b!935285 m!869243))

(assert (=> b!935285 m!869243))

(declare-fun m!869249 () Bool)

(assert (=> b!935285 m!869249))

(assert (=> b!935286 m!869243))

(assert (=> b!935286 m!869243))

(assert (=> b!935286 m!869249))

(assert (=> b!935139 d!113049))

(declare-fun d!113051 () Bool)

(declare-fun lt!421393 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!405 (List!19109) (InoxSet (_ BitVec 64)))

(assert (=> d!113051 (= lt!421393 (select (content!405 Nil!19106) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525159 () Bool)

(assert (=> d!113051 (= lt!421393 e!525159)))

(declare-fun res!629893 () Bool)

(assert (=> d!113051 (=> (not res!629893) (not e!525159))))

(assert (=> d!113051 (= res!629893 ((_ is Cons!19105) Nil!19106))))

(assert (=> d!113051 (= (contains!5043 Nil!19106 #b0000000000000000000000000000000000000000000000000000000000000000) lt!421393)))

(declare-fun b!935292 () Bool)

(declare-fun e!525160 () Bool)

(assert (=> b!935292 (= e!525159 e!525160)))

(declare-fun res!629892 () Bool)

(assert (=> b!935292 (=> res!629892 e!525160)))

(assert (=> b!935292 (= res!629892 (= (h!20251 Nil!19106) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935293 () Bool)

(assert (=> b!935293 (= e!525160 (contains!5043 (t!27309 Nil!19106) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113051 res!629893) b!935292))

(assert (= (and b!935292 (not res!629892)) b!935293))

(declare-fun m!869251 () Bool)

(assert (=> d!113051 m!869251))

(declare-fun m!869253 () Bool)

(assert (=> d!113051 m!869253))

(declare-fun m!869255 () Bool)

(assert (=> b!935293 m!869255))

(assert (=> b!935148 d!113051))

(declare-fun d!113053 () Bool)

(declare-fun res!629898 () Bool)

(declare-fun e!525168 () Bool)

(assert (=> d!113053 (=> res!629898 e!525168)))

(assert (=> d!113053 (= res!629898 (bvsge #b00000000000000000000000000000000 (size!27529 _keys!1487)))))

(assert (=> d!113053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!525168)))

(declare-fun b!935302 () Bool)

(declare-fun e!525169 () Bool)

(declare-fun e!525167 () Bool)

(assert (=> b!935302 (= e!525169 e!525167)))

(declare-fun lt!421402 () (_ BitVec 64))

(assert (=> b!935302 (= lt!421402 (select (arr!27068 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421400 () Unit!31463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56253 (_ BitVec 64) (_ BitVec 32)) Unit!31463)

(assert (=> b!935302 (= lt!421400 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421402 #b00000000000000000000000000000000))))

(assert (=> b!935302 (arrayContainsKey!0 _keys!1487 lt!421402 #b00000000000000000000000000000000)))

(declare-fun lt!421401 () Unit!31463)

(assert (=> b!935302 (= lt!421401 lt!421400)))

(declare-fun res!629899 () Bool)

(declare-datatypes ((SeekEntryResult!8980 0))(
  ( (MissingZero!8980 (index!38291 (_ BitVec 32))) (Found!8980 (index!38292 (_ BitVec 32))) (Intermediate!8980 (undefined!9792 Bool) (index!38293 (_ BitVec 32)) (x!80220 (_ BitVec 32))) (Undefined!8980) (MissingVacant!8980 (index!38294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56253 (_ BitVec 32)) SeekEntryResult!8980)

(assert (=> b!935302 (= res!629899 (= (seekEntryOrOpen!0 (select (arr!27068 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8980 #b00000000000000000000000000000000)))))

(assert (=> b!935302 (=> (not res!629899) (not e!525167))))

(declare-fun bm!40693 () Bool)

(declare-fun call!40696 () Bool)

(assert (=> bm!40693 (= call!40696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!935303 () Bool)

(assert (=> b!935303 (= e!525167 call!40696)))

(declare-fun b!935304 () Bool)

(assert (=> b!935304 (= e!525169 call!40696)))

(declare-fun b!935305 () Bool)

(assert (=> b!935305 (= e!525168 e!525169)))

(declare-fun c!97229 () Bool)

(assert (=> b!935305 (= c!97229 (validKeyInArray!0 (select (arr!27068 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113053 (not res!629898)) b!935305))

(assert (= (and b!935305 c!97229) b!935302))

(assert (= (and b!935305 (not c!97229)) b!935304))

(assert (= (and b!935302 res!629899) b!935303))

(assert (= (or b!935303 b!935304) bm!40693))

(assert (=> b!935302 m!869243))

(declare-fun m!869257 () Bool)

(assert (=> b!935302 m!869257))

(declare-fun m!869259 () Bool)

(assert (=> b!935302 m!869259))

(assert (=> b!935302 m!869243))

(declare-fun m!869261 () Bool)

(assert (=> b!935302 m!869261))

(declare-fun m!869263 () Bool)

(assert (=> bm!40693 m!869263))

(assert (=> b!935305 m!869243))

(assert (=> b!935305 m!869243))

(assert (=> b!935305 m!869249))

(assert (=> b!935140 d!113053))

(declare-fun d!113055 () Bool)

(declare-fun lt!421403 () Bool)

(assert (=> d!113055 (= lt!421403 (select (content!405 Nil!19106) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525170 () Bool)

(assert (=> d!113055 (= lt!421403 e!525170)))

(declare-fun res!629901 () Bool)

(assert (=> d!113055 (=> (not res!629901) (not e!525170))))

(assert (=> d!113055 (= res!629901 ((_ is Cons!19105) Nil!19106))))

(assert (=> d!113055 (= (contains!5043 Nil!19106 #b1000000000000000000000000000000000000000000000000000000000000000) lt!421403)))

(declare-fun b!935306 () Bool)

(declare-fun e!525171 () Bool)

(assert (=> b!935306 (= e!525170 e!525171)))

(declare-fun res!629900 () Bool)

(assert (=> b!935306 (=> res!629900 e!525171)))

(assert (=> b!935306 (= res!629900 (= (h!20251 Nil!19106) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935307 () Bool)

(assert (=> b!935307 (= e!525171 (contains!5043 (t!27309 Nil!19106) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113055 res!629901) b!935306))

(assert (= (and b!935306 (not res!629900)) b!935307))

(assert (=> d!113055 m!869251))

(declare-fun m!869265 () Bool)

(assert (=> d!113055 m!869265))

(declare-fun m!869267 () Bool)

(assert (=> b!935307 m!869267))

(assert (=> b!935143 d!113055))

(declare-fun b!935350 () Bool)

(declare-fun e!525207 () ListLongMap!12047)

(declare-fun call!40711 () ListLongMap!12047)

(assert (=> b!935350 (= e!525207 (+!2839 call!40711 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935351 () Bool)

(declare-fun e!525203 () Unit!31463)

(declare-fun Unit!31465 () Unit!31463)

(assert (=> b!935351 (= e!525203 Unit!31465)))

(declare-fun b!935352 () Bool)

(declare-fun e!525205 () ListLongMap!12047)

(declare-fun call!40717 () ListLongMap!12047)

(assert (=> b!935352 (= e!525205 call!40717)))

(declare-fun b!935353 () Bool)

(declare-fun e!525209 () Bool)

(declare-fun e!525202 () Bool)

(assert (=> b!935353 (= e!525209 e!525202)))

(declare-fun res!629920 () Bool)

(declare-fun call!40715 () Bool)

(assert (=> b!935353 (= res!629920 call!40715)))

(assert (=> b!935353 (=> (not res!629920) (not e!525202))))

(declare-fun b!935354 () Bool)

(declare-fun c!97247 () Bool)

(assert (=> b!935354 (= c!97247 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525198 () ListLongMap!12047)

(assert (=> b!935354 (= e!525205 e!525198)))

(declare-fun e!525208 () Bool)

(declare-fun lt!421458 () ListLongMap!12047)

(declare-fun b!935355 () Bool)

(assert (=> b!935355 (= e!525208 (= (apply!818 lt!421458 (select (arr!27068 _keys!1487) lt!421336)) (get!14268 (select (arr!27069 _values!1231) lt!421336) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935355 (and (bvsge lt!421336 #b00000000000000000000000000000000) (bvslt lt!421336 (size!27530 _values!1231)))))

(assert (=> b!935355 (and (bvsge lt!421336 #b00000000000000000000000000000000) (bvslt lt!421336 (size!27529 _keys!1487)))))

(declare-fun b!935356 () Bool)

(declare-fun e!525199 () Bool)

(assert (=> b!935356 (= e!525199 e!525209)))

(declare-fun c!97246 () Bool)

(assert (=> b!935356 (= c!97246 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935357 () Bool)

(declare-fun res!629923 () Bool)

(assert (=> b!935357 (=> (not res!629923) (not e!525199))))

(declare-fun e!525206 () Bool)

(assert (=> b!935357 (= res!629923 e!525206)))

(declare-fun res!629924 () Bool)

(assert (=> b!935357 (=> res!629924 e!525206)))

(declare-fun e!525204 () Bool)

(assert (=> b!935357 (= res!629924 (not e!525204))))

(declare-fun res!629927 () Bool)

(assert (=> b!935357 (=> (not res!629927) (not e!525204))))

(assert (=> b!935357 (= res!629927 (bvslt lt!421336 (size!27529 _keys!1487)))))

(declare-fun bm!40708 () Bool)

(declare-fun call!40716 () ListLongMap!12047)

(declare-fun call!40713 () ListLongMap!12047)

(assert (=> bm!40708 (= call!40716 call!40713)))

(declare-fun b!935358 () Bool)

(assert (=> b!935358 (= e!525198 call!40717)))

(declare-fun bm!40709 () Bool)

(declare-fun call!40714 () Bool)

(assert (=> bm!40709 (= call!40714 (contains!5042 lt!421458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113057 () Bool)

(assert (=> d!113057 e!525199))

(declare-fun res!629922 () Bool)

(assert (=> d!113057 (=> (not res!629922) (not e!525199))))

(assert (=> d!113057 (= res!629922 (or (bvsge lt!421336 (size!27529 _keys!1487)) (and (bvsge lt!421336 #b00000000000000000000000000000000) (bvslt lt!421336 (size!27529 _keys!1487)))))))

(declare-fun lt!421456 () ListLongMap!12047)

(assert (=> d!113057 (= lt!421458 lt!421456)))

(declare-fun lt!421465 () Unit!31463)

(assert (=> d!113057 (= lt!421465 e!525203)))

(declare-fun c!97243 () Bool)

(declare-fun e!525210 () Bool)

(assert (=> d!113057 (= c!97243 e!525210)))

(declare-fun res!629925 () Bool)

(assert (=> d!113057 (=> (not res!629925) (not e!525210))))

(assert (=> d!113057 (= res!629925 (bvslt lt!421336 (size!27529 _keys!1487)))))

(assert (=> d!113057 (= lt!421456 e!525207)))

(declare-fun c!97242 () Bool)

(assert (=> d!113057 (= c!97242 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113057 (validMask!0 mask!1881)))

(assert (=> d!113057 (= (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235) lt!421458)))

(declare-fun b!935359 () Bool)

(declare-fun lt!421448 () Unit!31463)

(assert (=> b!935359 (= e!525203 lt!421448)))

(declare-fun lt!421468 () ListLongMap!12047)

(declare-fun getCurrentListMapNoExtraKeys!3338 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) ListLongMap!12047)

(assert (=> b!935359 (= lt!421468 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235))))

(declare-fun lt!421462 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421453 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421453 (select (arr!27068 _keys!1487) lt!421336))))

(declare-fun lt!421469 () Unit!31463)

(assert (=> b!935359 (= lt!421469 (addStillContains!528 lt!421468 lt!421462 zeroValue!1173 lt!421453))))

(assert (=> b!935359 (contains!5042 (+!2839 lt!421468 (tuple2!13361 lt!421462 zeroValue!1173)) lt!421453)))

(declare-fun lt!421460 () Unit!31463)

(assert (=> b!935359 (= lt!421460 lt!421469)))

(declare-fun lt!421463 () ListLongMap!12047)

(assert (=> b!935359 (= lt!421463 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235))))

(declare-fun lt!421461 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421461 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421449 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421449 (select (arr!27068 _keys!1487) lt!421336))))

(declare-fun lt!421467 () Unit!31463)

(declare-fun addApplyDifferent!416 (ListLongMap!12047 (_ BitVec 64) V!31863 (_ BitVec 64)) Unit!31463)

(assert (=> b!935359 (= lt!421467 (addApplyDifferent!416 lt!421463 lt!421461 minValue!1173 lt!421449))))

(assert (=> b!935359 (= (apply!818 (+!2839 lt!421463 (tuple2!13361 lt!421461 minValue!1173)) lt!421449) (apply!818 lt!421463 lt!421449))))

(declare-fun lt!421455 () Unit!31463)

(assert (=> b!935359 (= lt!421455 lt!421467)))

(declare-fun lt!421450 () ListLongMap!12047)

(assert (=> b!935359 (= lt!421450 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235))))

(declare-fun lt!421452 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421457 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421457 (select (arr!27068 _keys!1487) lt!421336))))

(declare-fun lt!421466 () Unit!31463)

(assert (=> b!935359 (= lt!421466 (addApplyDifferent!416 lt!421450 lt!421452 zeroValue!1173 lt!421457))))

(assert (=> b!935359 (= (apply!818 (+!2839 lt!421450 (tuple2!13361 lt!421452 zeroValue!1173)) lt!421457) (apply!818 lt!421450 lt!421457))))

(declare-fun lt!421451 () Unit!31463)

(assert (=> b!935359 (= lt!421451 lt!421466)))

(declare-fun lt!421454 () ListLongMap!12047)

(assert (=> b!935359 (= lt!421454 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235))))

(declare-fun lt!421459 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421459 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421464 () (_ BitVec 64))

(assert (=> b!935359 (= lt!421464 (select (arr!27068 _keys!1487) lt!421336))))

(assert (=> b!935359 (= lt!421448 (addApplyDifferent!416 lt!421454 lt!421459 minValue!1173 lt!421464))))

(assert (=> b!935359 (= (apply!818 (+!2839 lt!421454 (tuple2!13361 lt!421459 minValue!1173)) lt!421464) (apply!818 lt!421454 lt!421464))))

(declare-fun b!935360 () Bool)

(assert (=> b!935360 (= e!525209 (not call!40715))))

(declare-fun b!935361 () Bool)

(declare-fun e!525201 () Bool)

(assert (=> b!935361 (= e!525201 (not call!40714))))

(declare-fun bm!40710 () Bool)

(assert (=> bm!40710 (= call!40713 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235))))

(declare-fun b!935362 () Bool)

(declare-fun e!525200 () Bool)

(assert (=> b!935362 (= e!525200 (= (apply!818 lt!421458 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935363 () Bool)

(assert (=> b!935363 (= e!525206 e!525208)))

(declare-fun res!629928 () Bool)

(assert (=> b!935363 (=> (not res!629928) (not e!525208))))

(assert (=> b!935363 (= res!629928 (contains!5042 lt!421458 (select (arr!27068 _keys!1487) lt!421336)))))

(assert (=> b!935363 (and (bvsge lt!421336 #b00000000000000000000000000000000) (bvslt lt!421336 (size!27529 _keys!1487)))))

(declare-fun b!935364 () Bool)

(declare-fun res!629921 () Bool)

(assert (=> b!935364 (=> (not res!629921) (not e!525199))))

(assert (=> b!935364 (= res!629921 e!525201)))

(declare-fun c!97245 () Bool)

(assert (=> b!935364 (= c!97245 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40711 () Bool)

(assert (=> bm!40711 (= call!40717 call!40711)))

(declare-fun bm!40712 () Bool)

(declare-fun call!40712 () ListLongMap!12047)

(assert (=> bm!40712 (= call!40712 call!40716)))

(declare-fun bm!40713 () Bool)

(assert (=> bm!40713 (= call!40715 (contains!5042 lt!421458 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935365 () Bool)

(assert (=> b!935365 (= e!525198 call!40712)))

(declare-fun b!935366 () Bool)

(assert (=> b!935366 (= e!525202 (= (apply!818 lt!421458 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40714 () Bool)

(declare-fun c!97244 () Bool)

(assert (=> bm!40714 (= call!40711 (+!2839 (ite c!97242 call!40713 (ite c!97244 call!40716 call!40712)) (ite (or c!97242 c!97244) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935367 () Bool)

(assert (=> b!935367 (= e!525207 e!525205)))

(assert (=> b!935367 (= c!97244 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935368 () Bool)

(assert (=> b!935368 (= e!525204 (validKeyInArray!0 (select (arr!27068 _keys!1487) lt!421336)))))

(declare-fun b!935369 () Bool)

(assert (=> b!935369 (= e!525210 (validKeyInArray!0 (select (arr!27068 _keys!1487) lt!421336)))))

(declare-fun b!935370 () Bool)

(assert (=> b!935370 (= e!525201 e!525200)))

(declare-fun res!629926 () Bool)

(assert (=> b!935370 (= res!629926 call!40714)))

(assert (=> b!935370 (=> (not res!629926) (not e!525200))))

(assert (= (and d!113057 c!97242) b!935350))

(assert (= (and d!113057 (not c!97242)) b!935367))

(assert (= (and b!935367 c!97244) b!935352))

(assert (= (and b!935367 (not c!97244)) b!935354))

(assert (= (and b!935354 c!97247) b!935358))

(assert (= (and b!935354 (not c!97247)) b!935365))

(assert (= (or b!935358 b!935365) bm!40712))

(assert (= (or b!935352 bm!40712) bm!40708))

(assert (= (or b!935352 b!935358) bm!40711))

(assert (= (or b!935350 bm!40708) bm!40710))

(assert (= (or b!935350 bm!40711) bm!40714))

(assert (= (and d!113057 res!629925) b!935369))

(assert (= (and d!113057 c!97243) b!935359))

(assert (= (and d!113057 (not c!97243)) b!935351))

(assert (= (and d!113057 res!629922) b!935357))

(assert (= (and b!935357 res!629927) b!935368))

(assert (= (and b!935357 (not res!629924)) b!935363))

(assert (= (and b!935363 res!629928) b!935355))

(assert (= (and b!935357 res!629923) b!935364))

(assert (= (and b!935364 c!97245) b!935370))

(assert (= (and b!935364 (not c!97245)) b!935361))

(assert (= (and b!935370 res!629926) b!935362))

(assert (= (or b!935370 b!935361) bm!40709))

(assert (= (and b!935364 res!629921) b!935356))

(assert (= (and b!935356 c!97246) b!935353))

(assert (= (and b!935356 (not c!97246)) b!935360))

(assert (= (and b!935353 res!629920) b!935366))

(assert (= (or b!935353 b!935360) bm!40713))

(declare-fun b_lambda!14043 () Bool)

(assert (=> (not b_lambda!14043) (not b!935355)))

(assert (=> b!935355 t!27307))

(declare-fun b_and!28899 () Bool)

(assert (= b_and!28889 (and (=> t!27307 result!11941) b_and!28899)))

(assert (=> d!113057 m!869103))

(declare-fun m!869269 () Bool)

(assert (=> bm!40714 m!869269))

(declare-fun m!869271 () Bool)

(assert (=> b!935366 m!869271))

(declare-fun m!869273 () Bool)

(assert (=> b!935362 m!869273))

(declare-fun m!869275 () Bool)

(assert (=> b!935355 m!869275))

(assert (=> b!935355 m!869275))

(assert (=> b!935355 m!869081))

(declare-fun m!869277 () Bool)

(assert (=> b!935355 m!869277))

(assert (=> b!935355 m!869081))

(declare-fun m!869279 () Bool)

(assert (=> b!935355 m!869279))

(declare-fun m!869281 () Bool)

(assert (=> b!935355 m!869281))

(assert (=> b!935355 m!869279))

(declare-fun m!869283 () Bool)

(assert (=> bm!40710 m!869283))

(declare-fun m!869285 () Bool)

(assert (=> bm!40713 m!869285))

(assert (=> b!935369 m!869279))

(assert (=> b!935369 m!869279))

(declare-fun m!869287 () Bool)

(assert (=> b!935369 m!869287))

(declare-fun m!869289 () Bool)

(assert (=> b!935350 m!869289))

(declare-fun m!869291 () Bool)

(assert (=> bm!40709 m!869291))

(declare-fun m!869293 () Bool)

(assert (=> b!935359 m!869293))

(declare-fun m!869295 () Bool)

(assert (=> b!935359 m!869295))

(declare-fun m!869297 () Bool)

(assert (=> b!935359 m!869297))

(declare-fun m!869299 () Bool)

(assert (=> b!935359 m!869299))

(declare-fun m!869301 () Bool)

(assert (=> b!935359 m!869301))

(assert (=> b!935359 m!869283))

(declare-fun m!869303 () Bool)

(assert (=> b!935359 m!869303))

(declare-fun m!869305 () Bool)

(assert (=> b!935359 m!869305))

(declare-fun m!869307 () Bool)

(assert (=> b!935359 m!869307))

(assert (=> b!935359 m!869279))

(assert (=> b!935359 m!869293))

(declare-fun m!869309 () Bool)

(assert (=> b!935359 m!869309))

(declare-fun m!869311 () Bool)

(assert (=> b!935359 m!869311))

(declare-fun m!869313 () Bool)

(assert (=> b!935359 m!869313))

(assert (=> b!935359 m!869307))

(declare-fun m!869315 () Bool)

(assert (=> b!935359 m!869315))

(assert (=> b!935359 m!869311))

(declare-fun m!869317 () Bool)

(assert (=> b!935359 m!869317))

(declare-fun m!869319 () Bool)

(assert (=> b!935359 m!869319))

(assert (=> b!935359 m!869303))

(declare-fun m!869321 () Bool)

(assert (=> b!935359 m!869321))

(assert (=> b!935363 m!869279))

(assert (=> b!935363 m!869279))

(declare-fun m!869323 () Bool)

(assert (=> b!935363 m!869323))

(assert (=> b!935368 m!869279))

(assert (=> b!935368 m!869279))

(assert (=> b!935368 m!869287))

(assert (=> b!935151 d!113057))

(declare-fun d!113059 () Bool)

(declare-fun e!525216 () Bool)

(assert (=> d!113059 e!525216))

(declare-fun res!629931 () Bool)

(assert (=> d!113059 (=> res!629931 e!525216)))

(declare-fun lt!421481 () Bool)

(assert (=> d!113059 (= res!629931 (not lt!421481))))

(declare-fun lt!421478 () Bool)

(assert (=> d!113059 (= lt!421481 lt!421478)))

(declare-fun lt!421479 () Unit!31463)

(declare-fun e!525215 () Unit!31463)

(assert (=> d!113059 (= lt!421479 e!525215)))

(declare-fun c!97250 () Bool)

(assert (=> d!113059 (= c!97250 lt!421478)))

(declare-fun containsKey!449 (List!19108 (_ BitVec 64)) Bool)

(assert (=> d!113059 (= lt!421478 (containsKey!449 (toList!6039 (+!2839 lt!421335 lt!421333)) k0!1099))))

(assert (=> d!113059 (= (contains!5042 (+!2839 lt!421335 lt!421333) k0!1099) lt!421481)))

(declare-fun b!935377 () Bool)

(declare-fun lt!421480 () Unit!31463)

(assert (=> b!935377 (= e!525215 lt!421480)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!344 (List!19108 (_ BitVec 64)) Unit!31463)

(assert (=> b!935377 (= lt!421480 (lemmaContainsKeyImpliesGetValueByKeyDefined!344 (toList!6039 (+!2839 lt!421335 lt!421333)) k0!1099))))

(declare-datatypes ((Option!491 0))(
  ( (Some!490 (v!12663 V!31863)) (None!489) )
))
(declare-fun isDefined!357 (Option!491) Bool)

(declare-fun getValueByKey!485 (List!19108 (_ BitVec 64)) Option!491)

(assert (=> b!935377 (isDefined!357 (getValueByKey!485 (toList!6039 (+!2839 lt!421335 lt!421333)) k0!1099))))

(declare-fun b!935378 () Bool)

(declare-fun Unit!31466 () Unit!31463)

(assert (=> b!935378 (= e!525215 Unit!31466)))

(declare-fun b!935379 () Bool)

(assert (=> b!935379 (= e!525216 (isDefined!357 (getValueByKey!485 (toList!6039 (+!2839 lt!421335 lt!421333)) k0!1099)))))

(assert (= (and d!113059 c!97250) b!935377))

(assert (= (and d!113059 (not c!97250)) b!935378))

(assert (= (and d!113059 (not res!629931)) b!935379))

(declare-fun m!869325 () Bool)

(assert (=> d!113059 m!869325))

(declare-fun m!869327 () Bool)

(assert (=> b!935377 m!869327))

(declare-fun m!869329 () Bool)

(assert (=> b!935377 m!869329))

(assert (=> b!935377 m!869329))

(declare-fun m!869331 () Bool)

(assert (=> b!935377 m!869331))

(assert (=> b!935379 m!869329))

(assert (=> b!935379 m!869329))

(assert (=> b!935379 m!869331))

(assert (=> b!935151 d!113059))

(declare-fun b!935380 () Bool)

(declare-fun e!525226 () ListLongMap!12047)

(declare-fun call!40718 () ListLongMap!12047)

(assert (=> b!935380 (= e!525226 (+!2839 call!40718 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935381 () Bool)

(declare-fun e!525222 () Unit!31463)

(declare-fun Unit!31467 () Unit!31463)

(assert (=> b!935381 (= e!525222 Unit!31467)))

(declare-fun b!935382 () Bool)

(declare-fun e!525224 () ListLongMap!12047)

(declare-fun call!40724 () ListLongMap!12047)

(assert (=> b!935382 (= e!525224 call!40724)))

(declare-fun b!935383 () Bool)

(declare-fun e!525228 () Bool)

(declare-fun e!525221 () Bool)

(assert (=> b!935383 (= e!525228 e!525221)))

(declare-fun res!629932 () Bool)

(declare-fun call!40722 () Bool)

(assert (=> b!935383 (= res!629932 call!40722)))

(assert (=> b!935383 (=> (not res!629932) (not e!525221))))

(declare-fun b!935384 () Bool)

(declare-fun c!97256 () Bool)

(assert (=> b!935384 (= c!97256 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525217 () ListLongMap!12047)

(assert (=> b!935384 (= e!525224 e!525217)))

(declare-fun lt!421492 () ListLongMap!12047)

(declare-fun b!935385 () Bool)

(declare-fun e!525227 () Bool)

(assert (=> b!935385 (= e!525227 (= (apply!818 lt!421492 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14268 (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935385 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27530 _values!1231)))))

(assert (=> b!935385 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))

(declare-fun b!935386 () Bool)

(declare-fun e!525218 () Bool)

(assert (=> b!935386 (= e!525218 e!525228)))

(declare-fun c!97255 () Bool)

(assert (=> b!935386 (= c!97255 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935387 () Bool)

(declare-fun res!629935 () Bool)

(assert (=> b!935387 (=> (not res!629935) (not e!525218))))

(declare-fun e!525225 () Bool)

(assert (=> b!935387 (= res!629935 e!525225)))

(declare-fun res!629936 () Bool)

(assert (=> b!935387 (=> res!629936 e!525225)))

(declare-fun e!525223 () Bool)

(assert (=> b!935387 (= res!629936 (not e!525223))))

(declare-fun res!629939 () Bool)

(assert (=> b!935387 (=> (not res!629939) (not e!525223))))

(assert (=> b!935387 (= res!629939 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))

(declare-fun bm!40715 () Bool)

(declare-fun call!40723 () ListLongMap!12047)

(declare-fun call!40720 () ListLongMap!12047)

(assert (=> bm!40715 (= call!40723 call!40720)))

(declare-fun b!935388 () Bool)

(assert (=> b!935388 (= e!525217 call!40724)))

(declare-fun bm!40716 () Bool)

(declare-fun call!40721 () Bool)

(assert (=> bm!40716 (= call!40721 (contains!5042 lt!421492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113061 () Bool)

(assert (=> d!113061 e!525218))

(declare-fun res!629934 () Bool)

(assert (=> d!113061 (=> (not res!629934) (not e!525218))))

(assert (=> d!113061 (= res!629934 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))))

(declare-fun lt!421490 () ListLongMap!12047)

(assert (=> d!113061 (= lt!421492 lt!421490)))

(declare-fun lt!421499 () Unit!31463)

(assert (=> d!113061 (= lt!421499 e!525222)))

(declare-fun c!97252 () Bool)

(declare-fun e!525229 () Bool)

(assert (=> d!113061 (= c!97252 e!525229)))

(declare-fun res!629937 () Bool)

(assert (=> d!113061 (=> (not res!629937) (not e!525229))))

(assert (=> d!113061 (= res!629937 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))

(assert (=> d!113061 (= lt!421490 e!525226)))

(declare-fun c!97251 () Bool)

(assert (=> d!113061 (= c!97251 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113061 (validMask!0 mask!1881)))

(assert (=> d!113061 (= (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421492)))

(declare-fun b!935389 () Bool)

(declare-fun lt!421482 () Unit!31463)

(assert (=> b!935389 (= e!525222 lt!421482)))

(declare-fun lt!421502 () ListLongMap!12047)

(assert (=> b!935389 (= lt!421502 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421496 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421487 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421487 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421503 () Unit!31463)

(assert (=> b!935389 (= lt!421503 (addStillContains!528 lt!421502 lt!421496 zeroValue!1173 lt!421487))))

(assert (=> b!935389 (contains!5042 (+!2839 lt!421502 (tuple2!13361 lt!421496 zeroValue!1173)) lt!421487)))

(declare-fun lt!421494 () Unit!31463)

(assert (=> b!935389 (= lt!421494 lt!421503)))

(declare-fun lt!421497 () ListLongMap!12047)

(assert (=> b!935389 (= lt!421497 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421495 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421495 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421483 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421483 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421501 () Unit!31463)

(assert (=> b!935389 (= lt!421501 (addApplyDifferent!416 lt!421497 lt!421495 minValue!1173 lt!421483))))

(assert (=> b!935389 (= (apply!818 (+!2839 lt!421497 (tuple2!13361 lt!421495 minValue!1173)) lt!421483) (apply!818 lt!421497 lt!421483))))

(declare-fun lt!421489 () Unit!31463)

(assert (=> b!935389 (= lt!421489 lt!421501)))

(declare-fun lt!421484 () ListLongMap!12047)

(assert (=> b!935389 (= lt!421484 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421486 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421491 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421491 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421500 () Unit!31463)

(assert (=> b!935389 (= lt!421500 (addApplyDifferent!416 lt!421484 lt!421486 zeroValue!1173 lt!421491))))

(assert (=> b!935389 (= (apply!818 (+!2839 lt!421484 (tuple2!13361 lt!421486 zeroValue!1173)) lt!421491) (apply!818 lt!421484 lt!421491))))

(declare-fun lt!421485 () Unit!31463)

(assert (=> b!935389 (= lt!421485 lt!421500)))

(declare-fun lt!421488 () ListLongMap!12047)

(assert (=> b!935389 (= lt!421488 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421493 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421493 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421498 () (_ BitVec 64))

(assert (=> b!935389 (= lt!421498 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!935389 (= lt!421482 (addApplyDifferent!416 lt!421488 lt!421493 minValue!1173 lt!421498))))

(assert (=> b!935389 (= (apply!818 (+!2839 lt!421488 (tuple2!13361 lt!421493 minValue!1173)) lt!421498) (apply!818 lt!421488 lt!421498))))

(declare-fun b!935390 () Bool)

(assert (=> b!935390 (= e!525228 (not call!40722))))

(declare-fun b!935391 () Bool)

(declare-fun e!525220 () Bool)

(assert (=> b!935391 (= e!525220 (not call!40721))))

(declare-fun bm!40717 () Bool)

(assert (=> bm!40717 (= call!40720 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935392 () Bool)

(declare-fun e!525219 () Bool)

(assert (=> b!935392 (= e!525219 (= (apply!818 lt!421492 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935393 () Bool)

(assert (=> b!935393 (= e!525225 e!525227)))

(declare-fun res!629940 () Bool)

(assert (=> b!935393 (=> (not res!629940) (not e!525227))))

(assert (=> b!935393 (= res!629940 (contains!5042 lt!421492 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!935393 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))

(declare-fun b!935394 () Bool)

(declare-fun res!629933 () Bool)

(assert (=> b!935394 (=> (not res!629933) (not e!525218))))

(assert (=> b!935394 (= res!629933 e!525220)))

(declare-fun c!97254 () Bool)

(assert (=> b!935394 (= c!97254 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40718 () Bool)

(assert (=> bm!40718 (= call!40724 call!40718)))

(declare-fun bm!40719 () Bool)

(declare-fun call!40719 () ListLongMap!12047)

(assert (=> bm!40719 (= call!40719 call!40723)))

(declare-fun bm!40720 () Bool)

(assert (=> bm!40720 (= call!40722 (contains!5042 lt!421492 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935395 () Bool)

(assert (=> b!935395 (= e!525217 call!40719)))

(declare-fun b!935396 () Bool)

(assert (=> b!935396 (= e!525221 (= (apply!818 lt!421492 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40721 () Bool)

(declare-fun c!97253 () Bool)

(assert (=> bm!40721 (= call!40718 (+!2839 (ite c!97251 call!40720 (ite c!97253 call!40723 call!40719)) (ite (or c!97251 c!97253) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935397 () Bool)

(assert (=> b!935397 (= e!525226 e!525224)))

(assert (=> b!935397 (= c!97253 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935398 () Bool)

(assert (=> b!935398 (= e!525223 (validKeyInArray!0 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935399 () Bool)

(assert (=> b!935399 (= e!525229 (validKeyInArray!0 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935400 () Bool)

(assert (=> b!935400 (= e!525220 e!525219)))

(declare-fun res!629938 () Bool)

(assert (=> b!935400 (= res!629938 call!40721)))

(assert (=> b!935400 (=> (not res!629938) (not e!525219))))

(assert (= (and d!113061 c!97251) b!935380))

(assert (= (and d!113061 (not c!97251)) b!935397))

(assert (= (and b!935397 c!97253) b!935382))

(assert (= (and b!935397 (not c!97253)) b!935384))

(assert (= (and b!935384 c!97256) b!935388))

(assert (= (and b!935384 (not c!97256)) b!935395))

(assert (= (or b!935388 b!935395) bm!40719))

(assert (= (or b!935382 bm!40719) bm!40715))

(assert (= (or b!935382 b!935388) bm!40718))

(assert (= (or b!935380 bm!40715) bm!40717))

(assert (= (or b!935380 bm!40718) bm!40721))

(assert (= (and d!113061 res!629937) b!935399))

(assert (= (and d!113061 c!97252) b!935389))

(assert (= (and d!113061 (not c!97252)) b!935381))

(assert (= (and d!113061 res!629934) b!935387))

(assert (= (and b!935387 res!629939) b!935398))

(assert (= (and b!935387 (not res!629936)) b!935393))

(assert (= (and b!935393 res!629940) b!935385))

(assert (= (and b!935387 res!629935) b!935394))

(assert (= (and b!935394 c!97254) b!935400))

(assert (= (and b!935394 (not c!97254)) b!935391))

(assert (= (and b!935400 res!629938) b!935392))

(assert (= (or b!935400 b!935391) bm!40716))

(assert (= (and b!935394 res!629933) b!935386))

(assert (= (and b!935386 c!97255) b!935383))

(assert (= (and b!935386 (not c!97255)) b!935390))

(assert (= (and b!935383 res!629932) b!935396))

(assert (= (or b!935383 b!935390) bm!40720))

(declare-fun b_lambda!14045 () Bool)

(assert (=> (not b_lambda!14045) (not b!935385)))

(assert (=> b!935385 t!27307))

(declare-fun b_and!28901 () Bool)

(assert (= b_and!28899 (and (=> t!27307 result!11941) b_and!28901)))

(assert (=> d!113061 m!869103))

(declare-fun m!869333 () Bool)

(assert (=> bm!40721 m!869333))

(declare-fun m!869335 () Bool)

(assert (=> b!935396 m!869335))

(declare-fun m!869337 () Bool)

(assert (=> b!935392 m!869337))

(assert (=> b!935385 m!869085))

(assert (=> b!935385 m!869085))

(assert (=> b!935385 m!869081))

(assert (=> b!935385 m!869087))

(assert (=> b!935385 m!869081))

(assert (=> b!935385 m!869073))

(declare-fun m!869339 () Bool)

(assert (=> b!935385 m!869339))

(assert (=> b!935385 m!869073))

(declare-fun m!869341 () Bool)

(assert (=> bm!40717 m!869341))

(declare-fun m!869343 () Bool)

(assert (=> bm!40720 m!869343))

(assert (=> b!935399 m!869073))

(assert (=> b!935399 m!869073))

(declare-fun m!869345 () Bool)

(assert (=> b!935399 m!869345))

(declare-fun m!869347 () Bool)

(assert (=> b!935380 m!869347))

(declare-fun m!869349 () Bool)

(assert (=> bm!40716 m!869349))

(declare-fun m!869351 () Bool)

(assert (=> b!935389 m!869351))

(declare-fun m!869353 () Bool)

(assert (=> b!935389 m!869353))

(declare-fun m!869355 () Bool)

(assert (=> b!935389 m!869355))

(declare-fun m!869357 () Bool)

(assert (=> b!935389 m!869357))

(declare-fun m!869359 () Bool)

(assert (=> b!935389 m!869359))

(assert (=> b!935389 m!869341))

(declare-fun m!869361 () Bool)

(assert (=> b!935389 m!869361))

(declare-fun m!869363 () Bool)

(assert (=> b!935389 m!869363))

(declare-fun m!869365 () Bool)

(assert (=> b!935389 m!869365))

(assert (=> b!935389 m!869073))

(assert (=> b!935389 m!869351))

(declare-fun m!869367 () Bool)

(assert (=> b!935389 m!869367))

(declare-fun m!869369 () Bool)

(assert (=> b!935389 m!869369))

(declare-fun m!869371 () Bool)

(assert (=> b!935389 m!869371))

(assert (=> b!935389 m!869365))

(declare-fun m!869373 () Bool)

(assert (=> b!935389 m!869373))

(assert (=> b!935389 m!869369))

(declare-fun m!869375 () Bool)

(assert (=> b!935389 m!869375))

(declare-fun m!869377 () Bool)

(assert (=> b!935389 m!869377))

(assert (=> b!935389 m!869361))

(declare-fun m!869379 () Bool)

(assert (=> b!935389 m!869379))

(assert (=> b!935393 m!869073))

(assert (=> b!935393 m!869073))

(declare-fun m!869381 () Bool)

(assert (=> b!935393 m!869381))

(assert (=> b!935398 m!869073))

(assert (=> b!935398 m!869073))

(assert (=> b!935398 m!869345))

(assert (=> b!935151 d!113061))

(declare-fun d!113063 () Bool)

(assert (=> d!113063 (contains!5042 (+!2839 lt!421335 (tuple2!13361 lt!421328 lt!421329)) k0!1099)))

(declare-fun lt!421506 () Unit!31463)

(declare-fun choose!1559 (ListLongMap!12047 (_ BitVec 64) V!31863 (_ BitVec 64)) Unit!31463)

(assert (=> d!113063 (= lt!421506 (choose!1559 lt!421335 lt!421328 lt!421329 k0!1099))))

(assert (=> d!113063 (contains!5042 lt!421335 k0!1099)))

(assert (=> d!113063 (= (addStillContains!528 lt!421335 lt!421328 lt!421329 k0!1099) lt!421506)))

(declare-fun bs!26224 () Bool)

(assert (= bs!26224 d!113063))

(declare-fun m!869383 () Bool)

(assert (=> bs!26224 m!869383))

(assert (=> bs!26224 m!869383))

(declare-fun m!869385 () Bool)

(assert (=> bs!26224 m!869385))

(declare-fun m!869387 () Bool)

(assert (=> bs!26224 m!869387))

(assert (=> bs!26224 m!869067))

(assert (=> b!935151 d!113063))

(declare-fun d!113065 () Bool)

(declare-fun e!525232 () Bool)

(assert (=> d!113065 e!525232))

(declare-fun res!629946 () Bool)

(assert (=> d!113065 (=> (not res!629946) (not e!525232))))

(declare-fun lt!421518 () ListLongMap!12047)

(assert (=> d!113065 (= res!629946 (contains!5042 lt!421518 (_1!6691 lt!421333)))))

(declare-fun lt!421516 () List!19108)

(assert (=> d!113065 (= lt!421518 (ListLongMap!12048 lt!421516))))

(declare-fun lt!421515 () Unit!31463)

(declare-fun lt!421517 () Unit!31463)

(assert (=> d!113065 (= lt!421515 lt!421517)))

(assert (=> d!113065 (= (getValueByKey!485 lt!421516 (_1!6691 lt!421333)) (Some!490 (_2!6691 lt!421333)))))

(declare-fun lemmaContainsTupThenGetReturnValue!259 (List!19108 (_ BitVec 64) V!31863) Unit!31463)

(assert (=> d!113065 (= lt!421517 (lemmaContainsTupThenGetReturnValue!259 lt!421516 (_1!6691 lt!421333) (_2!6691 lt!421333)))))

(declare-fun insertStrictlySorted!316 (List!19108 (_ BitVec 64) V!31863) List!19108)

(assert (=> d!113065 (= lt!421516 (insertStrictlySorted!316 (toList!6039 (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235)) (_1!6691 lt!421333) (_2!6691 lt!421333)))))

(assert (=> d!113065 (= (+!2839 (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421336 defaultEntry!1235) lt!421333) lt!421518)))

(declare-fun b!935406 () Bool)

(declare-fun res!629945 () Bool)

(assert (=> b!935406 (=> (not res!629945) (not e!525232))))

(assert (=> b!935406 (= res!629945 (= (getValueByKey!485 (toList!6039 lt!421518) (_1!6691 lt!421333)) (Some!490 (_2!6691 lt!421333))))))

(declare-fun b!935407 () Bool)

(declare-fun contains!5045 (List!19108 tuple2!13360) Bool)

(assert (=> b!935407 (= e!525232 (contains!5045 (toList!6039 lt!421518) lt!421333))))

(assert (= (and d!113065 res!629946) b!935406))

(assert (= (and b!935406 res!629945) b!935407))

(declare-fun m!869389 () Bool)

(assert (=> d!113065 m!869389))

(declare-fun m!869391 () Bool)

(assert (=> d!113065 m!869391))

(declare-fun m!869393 () Bool)

(assert (=> d!113065 m!869393))

(declare-fun m!869395 () Bool)

(assert (=> d!113065 m!869395))

(declare-fun m!869397 () Bool)

(assert (=> b!935406 m!869397))

(declare-fun m!869399 () Bool)

(assert (=> b!935407 m!869399))

(assert (=> b!935151 d!113065))

(declare-fun d!113067 () Bool)

(declare-fun e!525235 () Bool)

(assert (=> d!113067 e!525235))

(declare-fun res!629949 () Bool)

(assert (=> d!113067 (=> (not res!629949) (not e!525235))))

(assert (=> d!113067 (= res!629949 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27530 _values!1231))))))

(declare-fun lt!421521 () Unit!31463)

(declare-fun choose!1560 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) Unit!31463)

(assert (=> d!113067 (= lt!421521 (choose!1560 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113067 (validMask!0 mask!1881)))

(assert (=> d!113067 (= (lemmaListMapRecursiveValidKeyArray!203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421521)))

(declare-fun b!935410 () Bool)

(assert (=> b!935410 (= e!525235 (= (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2839 (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13361 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14268 (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113067 res!629949) b!935410))

(declare-fun b_lambda!14047 () Bool)

(assert (=> (not b_lambda!14047) (not b!935410)))

(assert (=> b!935410 t!27307))

(declare-fun b_and!28903 () Bool)

(assert (= b_and!28901 (and (=> t!27307 result!11941) b_and!28903)))

(declare-fun m!869401 () Bool)

(assert (=> d!113067 m!869401))

(assert (=> d!113067 m!869103))

(assert (=> b!935410 m!869085))

(assert (=> b!935410 m!869081))

(assert (=> b!935410 m!869087))

(assert (=> b!935410 m!869073))

(assert (=> b!935410 m!869081))

(declare-fun m!869403 () Bool)

(assert (=> b!935410 m!869403))

(assert (=> b!935410 m!869089))

(assert (=> b!935410 m!869403))

(declare-fun m!869405 () Bool)

(assert (=> b!935410 m!869405))

(assert (=> b!935410 m!869085))

(assert (=> b!935151 d!113067))

(declare-fun d!113069 () Bool)

(declare-fun res!629951 () Bool)

(declare-fun e!525236 () Bool)

(assert (=> d!113069 (=> res!629951 e!525236)))

(assert (=> d!113069 (= res!629951 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))

(assert (=> d!113069 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19106) e!525236)))

(declare-fun b!935411 () Bool)

(declare-fun e!525238 () Bool)

(assert (=> b!935411 (= e!525238 (contains!5043 Nil!19106 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935412 () Bool)

(declare-fun e!525237 () Bool)

(declare-fun call!40725 () Bool)

(assert (=> b!935412 (= e!525237 call!40725)))

(declare-fun bm!40722 () Bool)

(declare-fun c!97257 () Bool)

(assert (=> bm!40722 (= call!40725 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97257 (Cons!19105 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19106) Nil!19106)))))

(declare-fun b!935413 () Bool)

(declare-fun e!525239 () Bool)

(assert (=> b!935413 (= e!525239 e!525237)))

(assert (=> b!935413 (= c!97257 (validKeyInArray!0 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935414 () Bool)

(assert (=> b!935414 (= e!525236 e!525239)))

(declare-fun res!629952 () Bool)

(assert (=> b!935414 (=> (not res!629952) (not e!525239))))

(assert (=> b!935414 (= res!629952 (not e!525238))))

(declare-fun res!629950 () Bool)

(assert (=> b!935414 (=> (not res!629950) (not e!525238))))

(assert (=> b!935414 (= res!629950 (validKeyInArray!0 (select (arr!27068 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935415 () Bool)

(assert (=> b!935415 (= e!525237 call!40725)))

(assert (= (and d!113069 (not res!629951)) b!935414))

(assert (= (and b!935414 res!629950) b!935411))

(assert (= (and b!935414 res!629952) b!935413))

(assert (= (and b!935413 c!97257) b!935415))

(assert (= (and b!935413 (not c!97257)) b!935412))

(assert (= (or b!935415 b!935412) bm!40722))

(assert (=> b!935411 m!869073))

(assert (=> b!935411 m!869073))

(declare-fun m!869407 () Bool)

(assert (=> b!935411 m!869407))

(assert (=> bm!40722 m!869073))

(declare-fun m!869409 () Bool)

(assert (=> bm!40722 m!869409))

(assert (=> b!935413 m!869073))

(assert (=> b!935413 m!869073))

(assert (=> b!935413 m!869345))

(assert (=> b!935414 m!869073))

(assert (=> b!935414 m!869073))

(assert (=> b!935414 m!869345))

(assert (=> b!935151 d!113069))

(declare-fun d!113071 () Bool)

(declare-fun e!525242 () Bool)

(assert (=> d!113071 e!525242))

(declare-fun c!97260 () Bool)

(assert (=> d!113071 (= c!97260 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421524 () Unit!31463)

(declare-fun choose!1561 (array!56253 array!56255 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 64) (_ BitVec 32) Int) Unit!31463)

(assert (=> d!113071 (= lt!421524 (choose!1561 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113071 (validMask!0 mask!1881)))

(assert (=> d!113071 (= (lemmaListMapContainsThenArrayContainsFrom!286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421524)))

(declare-fun b!935420 () Bool)

(assert (=> b!935420 (= e!525242 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935421 () Bool)

(assert (=> b!935421 (= e!525242 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113071 c!97260) b!935420))

(assert (= (and d!113071 (not c!97260)) b!935421))

(declare-fun m!869411 () Bool)

(assert (=> d!113071 m!869411))

(assert (=> d!113071 m!869103))

(assert (=> b!935420 m!869117))

(assert (=> b!935151 d!113071))

(declare-fun d!113073 () Bool)

(declare-fun e!525243 () Bool)

(assert (=> d!113073 e!525243))

(declare-fun res!629954 () Bool)

(assert (=> d!113073 (=> (not res!629954) (not e!525243))))

(declare-fun lt!421528 () ListLongMap!12047)

(assert (=> d!113073 (= res!629954 (contains!5042 lt!421528 (_1!6691 lt!421333)))))

(declare-fun lt!421526 () List!19108)

(assert (=> d!113073 (= lt!421528 (ListLongMap!12048 lt!421526))))

(declare-fun lt!421525 () Unit!31463)

(declare-fun lt!421527 () Unit!31463)

(assert (=> d!113073 (= lt!421525 lt!421527)))

(assert (=> d!113073 (= (getValueByKey!485 lt!421526 (_1!6691 lt!421333)) (Some!490 (_2!6691 lt!421333)))))

(assert (=> d!113073 (= lt!421527 (lemmaContainsTupThenGetReturnValue!259 lt!421526 (_1!6691 lt!421333) (_2!6691 lt!421333)))))

(assert (=> d!113073 (= lt!421526 (insertStrictlySorted!316 (toList!6039 lt!421335) (_1!6691 lt!421333) (_2!6691 lt!421333)))))

(assert (=> d!113073 (= (+!2839 lt!421335 lt!421333) lt!421528)))

(declare-fun b!935422 () Bool)

(declare-fun res!629953 () Bool)

(assert (=> b!935422 (=> (not res!629953) (not e!525243))))

(assert (=> b!935422 (= res!629953 (= (getValueByKey!485 (toList!6039 lt!421528) (_1!6691 lt!421333)) (Some!490 (_2!6691 lt!421333))))))

(declare-fun b!935423 () Bool)

(assert (=> b!935423 (= e!525243 (contains!5045 (toList!6039 lt!421528) lt!421333))))

(assert (= (and d!113073 res!629954) b!935422))

(assert (= (and b!935422 res!629953) b!935423))

(declare-fun m!869413 () Bool)

(assert (=> d!113073 m!869413))

(declare-fun m!869415 () Bool)

(assert (=> d!113073 m!869415))

(declare-fun m!869417 () Bool)

(assert (=> d!113073 m!869417))

(declare-fun m!869419 () Bool)

(assert (=> d!113073 m!869419))

(declare-fun m!869421 () Bool)

(assert (=> b!935422 m!869421))

(declare-fun m!869423 () Bool)

(assert (=> b!935423 m!869423))

(assert (=> b!935151 d!113073))

(declare-fun d!113075 () Bool)

(declare-fun c!97263 () Bool)

(assert (=> d!113075 (= c!97263 ((_ is ValueCellFull!9605) (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525246 () V!31863)

(assert (=> d!113075 (= (get!14268 (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525246)))

(declare-fun b!935428 () Bool)

(declare-fun get!14269 (ValueCell!9605 V!31863) V!31863)

(assert (=> b!935428 (= e!525246 (get!14269 (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935429 () Bool)

(declare-fun get!14270 (ValueCell!9605 V!31863) V!31863)

(assert (=> b!935429 (= e!525246 (get!14270 (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113075 c!97263) b!935428))

(assert (= (and d!113075 (not c!97263)) b!935429))

(assert (=> b!935428 m!869085))

(assert (=> b!935428 m!869081))

(declare-fun m!869425 () Bool)

(assert (=> b!935428 m!869425))

(assert (=> b!935429 m!869085))

(assert (=> b!935429 m!869081))

(declare-fun m!869427 () Bool)

(assert (=> b!935429 m!869427))

(assert (=> b!935151 d!113075))

(declare-fun d!113077 () Bool)

(assert (=> d!113077 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19106)))

(declare-fun lt!421531 () Unit!31463)

(declare-fun choose!39 (array!56253 (_ BitVec 32) (_ BitVec 32)) Unit!31463)

(assert (=> d!113077 (= lt!421531 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113077 (bvslt (size!27529 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113077 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421531)))

(declare-fun bs!26225 () Bool)

(assert (= bs!26225 d!113077))

(assert (=> bs!26225 m!869097))

(declare-fun m!869429 () Bool)

(assert (=> bs!26225 m!869429))

(assert (=> b!935151 d!113077))

(declare-fun d!113079 () Bool)

(declare-fun get!14271 (Option!491) V!31863)

(assert (=> d!113079 (= (apply!818 lt!421335 k0!1099) (get!14271 (getValueByKey!485 (toList!6039 lt!421335) k0!1099)))))

(declare-fun bs!26226 () Bool)

(assert (= bs!26226 d!113079))

(declare-fun m!869431 () Bool)

(assert (=> bs!26226 m!869431))

(assert (=> bs!26226 m!869431))

(declare-fun m!869433 () Bool)

(assert (=> bs!26226 m!869433))

(assert (=> b!935134 d!113079))

(declare-fun d!113081 () Bool)

(assert (=> d!113081 (= (validKeyInArray!0 lt!421328) (and (not (= lt!421328 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421328 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935144 d!113081))

(declare-fun d!113083 () Bool)

(declare-fun res!629959 () Bool)

(declare-fun e!525251 () Bool)

(assert (=> d!113083 (=> res!629959 e!525251)))

(assert (=> d!113083 (= res!629959 (= (select (arr!27068 _keys!1487) lt!421336) k0!1099))))

(assert (=> d!113083 (= (arrayContainsKey!0 _keys!1487 k0!1099 lt!421336) e!525251)))

(declare-fun b!935434 () Bool)

(declare-fun e!525252 () Bool)

(assert (=> b!935434 (= e!525251 e!525252)))

(declare-fun res!629960 () Bool)

(assert (=> b!935434 (=> (not res!629960) (not e!525252))))

(assert (=> b!935434 (= res!629960 (bvslt (bvadd lt!421336 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))

(declare-fun b!935435 () Bool)

(assert (=> b!935435 (= e!525252 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd lt!421336 #b00000000000000000000000000000001)))))

(assert (= (and d!113083 (not res!629959)) b!935434))

(assert (= (and b!935434 res!629960) b!935435))

(assert (=> d!113083 m!869279))

(declare-fun m!869435 () Bool)

(assert (=> b!935435 m!869435))

(assert (=> b!935146 d!113083))

(declare-fun d!113085 () Bool)

(assert (=> d!113085 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79562 d!113085))

(declare-fun d!113087 () Bool)

(assert (=> d!113087 (= (array_inv!21126 _values!1231) (bvsge (size!27530 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79562 d!113087))

(declare-fun d!113089 () Bool)

(assert (=> d!113089 (= (array_inv!21127 _keys!1487) (bvsge (size!27529 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79562 d!113089))

(declare-fun d!113091 () Bool)

(assert (=> d!113091 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935136 d!113091))

(declare-fun d!113093 () Bool)

(declare-fun e!525254 () Bool)

(assert (=> d!113093 e!525254))

(declare-fun res!629961 () Bool)

(assert (=> d!113093 (=> res!629961 e!525254)))

(declare-fun lt!421535 () Bool)

(assert (=> d!113093 (= res!629961 (not lt!421535))))

(declare-fun lt!421532 () Bool)

(assert (=> d!113093 (= lt!421535 lt!421532)))

(declare-fun lt!421533 () Unit!31463)

(declare-fun e!525253 () Unit!31463)

(assert (=> d!113093 (= lt!421533 e!525253)))

(declare-fun c!97264 () Bool)

(assert (=> d!113093 (= c!97264 lt!421532)))

(assert (=> d!113093 (= lt!421532 (containsKey!449 (toList!6039 lt!421335) k0!1099))))

(assert (=> d!113093 (= (contains!5042 lt!421335 k0!1099) lt!421535)))

(declare-fun b!935436 () Bool)

(declare-fun lt!421534 () Unit!31463)

(assert (=> b!935436 (= e!525253 lt!421534)))

(assert (=> b!935436 (= lt!421534 (lemmaContainsKeyImpliesGetValueByKeyDefined!344 (toList!6039 lt!421335) k0!1099))))

(assert (=> b!935436 (isDefined!357 (getValueByKey!485 (toList!6039 lt!421335) k0!1099))))

(declare-fun b!935437 () Bool)

(declare-fun Unit!31468 () Unit!31463)

(assert (=> b!935437 (= e!525253 Unit!31468)))

(declare-fun b!935438 () Bool)

(assert (=> b!935438 (= e!525254 (isDefined!357 (getValueByKey!485 (toList!6039 lt!421335) k0!1099)))))

(assert (= (and d!113093 c!97264) b!935436))

(assert (= (and d!113093 (not c!97264)) b!935437))

(assert (= (and d!113093 (not res!629961)) b!935438))

(declare-fun m!869437 () Bool)

(assert (=> d!113093 m!869437))

(declare-fun m!869439 () Bool)

(assert (=> b!935436 m!869439))

(assert (=> b!935436 m!869431))

(assert (=> b!935436 m!869431))

(declare-fun m!869441 () Bool)

(assert (=> b!935436 m!869441))

(assert (=> b!935438 m!869431))

(assert (=> b!935438 m!869431))

(assert (=> b!935438 m!869441))

(assert (=> b!935138 d!113093))

(declare-fun b!935439 () Bool)

(declare-fun e!525264 () ListLongMap!12047)

(declare-fun call!40726 () ListLongMap!12047)

(assert (=> b!935439 (= e!525264 (+!2839 call!40726 (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935440 () Bool)

(declare-fun e!525260 () Unit!31463)

(declare-fun Unit!31469 () Unit!31463)

(assert (=> b!935440 (= e!525260 Unit!31469)))

(declare-fun b!935441 () Bool)

(declare-fun e!525262 () ListLongMap!12047)

(declare-fun call!40732 () ListLongMap!12047)

(assert (=> b!935441 (= e!525262 call!40732)))

(declare-fun b!935442 () Bool)

(declare-fun e!525266 () Bool)

(declare-fun e!525259 () Bool)

(assert (=> b!935442 (= e!525266 e!525259)))

(declare-fun res!629962 () Bool)

(declare-fun call!40730 () Bool)

(assert (=> b!935442 (= res!629962 call!40730)))

(assert (=> b!935442 (=> (not res!629962) (not e!525259))))

(declare-fun b!935443 () Bool)

(declare-fun c!97270 () Bool)

(assert (=> b!935443 (= c!97270 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525255 () ListLongMap!12047)

(assert (=> b!935443 (= e!525262 e!525255)))

(declare-fun b!935444 () Bool)

(declare-fun e!525265 () Bool)

(declare-fun lt!421546 () ListLongMap!12047)

(assert (=> b!935444 (= e!525265 (= (apply!818 lt!421546 (select (arr!27068 _keys!1487) from!1844)) (get!14268 (select (arr!27069 _values!1231) from!1844) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935444 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27530 _values!1231)))))

(assert (=> b!935444 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27529 _keys!1487)))))

(declare-fun b!935445 () Bool)

(declare-fun e!525256 () Bool)

(assert (=> b!935445 (= e!525256 e!525266)))

(declare-fun c!97269 () Bool)

(assert (=> b!935445 (= c!97269 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935446 () Bool)

(declare-fun res!629965 () Bool)

(assert (=> b!935446 (=> (not res!629965) (not e!525256))))

(declare-fun e!525263 () Bool)

(assert (=> b!935446 (= res!629965 e!525263)))

(declare-fun res!629966 () Bool)

(assert (=> b!935446 (=> res!629966 e!525263)))

(declare-fun e!525261 () Bool)

(assert (=> b!935446 (= res!629966 (not e!525261))))

(declare-fun res!629969 () Bool)

(assert (=> b!935446 (=> (not res!629969) (not e!525261))))

(assert (=> b!935446 (= res!629969 (bvslt from!1844 (size!27529 _keys!1487)))))

(declare-fun bm!40723 () Bool)

(declare-fun call!40731 () ListLongMap!12047)

(declare-fun call!40728 () ListLongMap!12047)

(assert (=> bm!40723 (= call!40731 call!40728)))

(declare-fun b!935447 () Bool)

(assert (=> b!935447 (= e!525255 call!40732)))

(declare-fun bm!40724 () Bool)

(declare-fun call!40729 () Bool)

(assert (=> bm!40724 (= call!40729 (contains!5042 lt!421546 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!113095 () Bool)

(assert (=> d!113095 e!525256))

(declare-fun res!629964 () Bool)

(assert (=> d!113095 (=> (not res!629964) (not e!525256))))

(assert (=> d!113095 (= res!629964 (or (bvsge from!1844 (size!27529 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27529 _keys!1487)))))))

(declare-fun lt!421544 () ListLongMap!12047)

(assert (=> d!113095 (= lt!421546 lt!421544)))

(declare-fun lt!421553 () Unit!31463)

(assert (=> d!113095 (= lt!421553 e!525260)))

(declare-fun c!97266 () Bool)

(declare-fun e!525267 () Bool)

(assert (=> d!113095 (= c!97266 e!525267)))

(declare-fun res!629967 () Bool)

(assert (=> d!113095 (=> (not res!629967) (not e!525267))))

(assert (=> d!113095 (= res!629967 (bvslt from!1844 (size!27529 _keys!1487)))))

(assert (=> d!113095 (= lt!421544 e!525264)))

(declare-fun c!97265 () Bool)

(assert (=> d!113095 (= c!97265 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113095 (validMask!0 mask!1881)))

(assert (=> d!113095 (= (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421546)))

(declare-fun b!935448 () Bool)

(declare-fun lt!421536 () Unit!31463)

(assert (=> b!935448 (= e!525260 lt!421536)))

(declare-fun lt!421556 () ListLongMap!12047)

(assert (=> b!935448 (= lt!421556 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421550 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421541 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421541 (select (arr!27068 _keys!1487) from!1844))))

(declare-fun lt!421557 () Unit!31463)

(assert (=> b!935448 (= lt!421557 (addStillContains!528 lt!421556 lt!421550 zeroValue!1173 lt!421541))))

(assert (=> b!935448 (contains!5042 (+!2839 lt!421556 (tuple2!13361 lt!421550 zeroValue!1173)) lt!421541)))

(declare-fun lt!421548 () Unit!31463)

(assert (=> b!935448 (= lt!421548 lt!421557)))

(declare-fun lt!421551 () ListLongMap!12047)

(assert (=> b!935448 (= lt!421551 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421549 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421549 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421537 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421537 (select (arr!27068 _keys!1487) from!1844))))

(declare-fun lt!421555 () Unit!31463)

(assert (=> b!935448 (= lt!421555 (addApplyDifferent!416 lt!421551 lt!421549 minValue!1173 lt!421537))))

(assert (=> b!935448 (= (apply!818 (+!2839 lt!421551 (tuple2!13361 lt!421549 minValue!1173)) lt!421537) (apply!818 lt!421551 lt!421537))))

(declare-fun lt!421543 () Unit!31463)

(assert (=> b!935448 (= lt!421543 lt!421555)))

(declare-fun lt!421538 () ListLongMap!12047)

(assert (=> b!935448 (= lt!421538 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421540 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421545 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421545 (select (arr!27068 _keys!1487) from!1844))))

(declare-fun lt!421554 () Unit!31463)

(assert (=> b!935448 (= lt!421554 (addApplyDifferent!416 lt!421538 lt!421540 zeroValue!1173 lt!421545))))

(assert (=> b!935448 (= (apply!818 (+!2839 lt!421538 (tuple2!13361 lt!421540 zeroValue!1173)) lt!421545) (apply!818 lt!421538 lt!421545))))

(declare-fun lt!421539 () Unit!31463)

(assert (=> b!935448 (= lt!421539 lt!421554)))

(declare-fun lt!421542 () ListLongMap!12047)

(assert (=> b!935448 (= lt!421542 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421547 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421547 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421552 () (_ BitVec 64))

(assert (=> b!935448 (= lt!421552 (select (arr!27068 _keys!1487) from!1844))))

(assert (=> b!935448 (= lt!421536 (addApplyDifferent!416 lt!421542 lt!421547 minValue!1173 lt!421552))))

(assert (=> b!935448 (= (apply!818 (+!2839 lt!421542 (tuple2!13361 lt!421547 minValue!1173)) lt!421552) (apply!818 lt!421542 lt!421552))))

(declare-fun b!935449 () Bool)

(assert (=> b!935449 (= e!525266 (not call!40730))))

(declare-fun b!935450 () Bool)

(declare-fun e!525258 () Bool)

(assert (=> b!935450 (= e!525258 (not call!40729))))

(declare-fun bm!40725 () Bool)

(assert (=> bm!40725 (= call!40728 (getCurrentListMapNoExtraKeys!3338 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935451 () Bool)

(declare-fun e!525257 () Bool)

(assert (=> b!935451 (= e!525257 (= (apply!818 lt!421546 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!935452 () Bool)

(assert (=> b!935452 (= e!525263 e!525265)))

(declare-fun res!629970 () Bool)

(assert (=> b!935452 (=> (not res!629970) (not e!525265))))

(assert (=> b!935452 (= res!629970 (contains!5042 lt!421546 (select (arr!27068 _keys!1487) from!1844)))))

(assert (=> b!935452 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27529 _keys!1487)))))

(declare-fun b!935453 () Bool)

(declare-fun res!629963 () Bool)

(assert (=> b!935453 (=> (not res!629963) (not e!525256))))

(assert (=> b!935453 (= res!629963 e!525258)))

(declare-fun c!97268 () Bool)

(assert (=> b!935453 (= c!97268 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40726 () Bool)

(assert (=> bm!40726 (= call!40732 call!40726)))

(declare-fun bm!40727 () Bool)

(declare-fun call!40727 () ListLongMap!12047)

(assert (=> bm!40727 (= call!40727 call!40731)))

(declare-fun bm!40728 () Bool)

(assert (=> bm!40728 (= call!40730 (contains!5042 lt!421546 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935454 () Bool)

(assert (=> b!935454 (= e!525255 call!40727)))

(declare-fun b!935455 () Bool)

(assert (=> b!935455 (= e!525259 (= (apply!818 lt!421546 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun c!97267 () Bool)

(declare-fun bm!40729 () Bool)

(assert (=> bm!40729 (= call!40726 (+!2839 (ite c!97265 call!40728 (ite c!97267 call!40731 call!40727)) (ite (or c!97265 c!97267) (tuple2!13361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935456 () Bool)

(assert (=> b!935456 (= e!525264 e!525262)))

(assert (=> b!935456 (= c!97267 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935457 () Bool)

(assert (=> b!935457 (= e!525261 (validKeyInArray!0 (select (arr!27068 _keys!1487) from!1844)))))

(declare-fun b!935458 () Bool)

(assert (=> b!935458 (= e!525267 (validKeyInArray!0 (select (arr!27068 _keys!1487) from!1844)))))

(declare-fun b!935459 () Bool)

(assert (=> b!935459 (= e!525258 e!525257)))

(declare-fun res!629968 () Bool)

(assert (=> b!935459 (= res!629968 call!40729)))

(assert (=> b!935459 (=> (not res!629968) (not e!525257))))

(assert (= (and d!113095 c!97265) b!935439))

(assert (= (and d!113095 (not c!97265)) b!935456))

(assert (= (and b!935456 c!97267) b!935441))

(assert (= (and b!935456 (not c!97267)) b!935443))

(assert (= (and b!935443 c!97270) b!935447))

(assert (= (and b!935443 (not c!97270)) b!935454))

(assert (= (or b!935447 b!935454) bm!40727))

(assert (= (or b!935441 bm!40727) bm!40723))

(assert (= (or b!935441 b!935447) bm!40726))

(assert (= (or b!935439 bm!40723) bm!40725))

(assert (= (or b!935439 bm!40726) bm!40729))

(assert (= (and d!113095 res!629967) b!935458))

(assert (= (and d!113095 c!97266) b!935448))

(assert (= (and d!113095 (not c!97266)) b!935440))

(assert (= (and d!113095 res!629964) b!935446))

(assert (= (and b!935446 res!629969) b!935457))

(assert (= (and b!935446 (not res!629966)) b!935452))

(assert (= (and b!935452 res!629970) b!935444))

(assert (= (and b!935446 res!629965) b!935453))

(assert (= (and b!935453 c!97268) b!935459))

(assert (= (and b!935453 (not c!97268)) b!935450))

(assert (= (and b!935459 res!629968) b!935451))

(assert (= (or b!935459 b!935450) bm!40724))

(assert (= (and b!935453 res!629963) b!935445))

(assert (= (and b!935445 c!97269) b!935442))

(assert (= (and b!935445 (not c!97269)) b!935449))

(assert (= (and b!935442 res!629962) b!935455))

(assert (= (or b!935442 b!935449) bm!40728))

(declare-fun b_lambda!14049 () Bool)

(assert (=> (not b_lambda!14049) (not b!935444)))

(assert (=> b!935444 t!27307))

(declare-fun b_and!28905 () Bool)

(assert (= b_and!28903 (and (=> t!27307 result!11941) b_and!28905)))

(assert (=> d!113095 m!869103))

(declare-fun m!869443 () Bool)

(assert (=> bm!40729 m!869443))

(declare-fun m!869445 () Bool)

(assert (=> b!935455 m!869445))

(declare-fun m!869447 () Bool)

(assert (=> b!935451 m!869447))

(declare-fun m!869449 () Bool)

(assert (=> b!935444 m!869449))

(assert (=> b!935444 m!869449))

(assert (=> b!935444 m!869081))

(declare-fun m!869451 () Bool)

(assert (=> b!935444 m!869451))

(assert (=> b!935444 m!869081))

(declare-fun m!869453 () Bool)

(assert (=> b!935444 m!869453))

(declare-fun m!869455 () Bool)

(assert (=> b!935444 m!869455))

(assert (=> b!935444 m!869453))

(declare-fun m!869457 () Bool)

(assert (=> bm!40725 m!869457))

(declare-fun m!869459 () Bool)

(assert (=> bm!40728 m!869459))

(assert (=> b!935458 m!869453))

(assert (=> b!935458 m!869453))

(declare-fun m!869461 () Bool)

(assert (=> b!935458 m!869461))

(declare-fun m!869463 () Bool)

(assert (=> b!935439 m!869463))

(declare-fun m!869465 () Bool)

(assert (=> bm!40724 m!869465))

(declare-fun m!869467 () Bool)

(assert (=> b!935448 m!869467))

(declare-fun m!869469 () Bool)

(assert (=> b!935448 m!869469))

(declare-fun m!869471 () Bool)

(assert (=> b!935448 m!869471))

(declare-fun m!869473 () Bool)

(assert (=> b!935448 m!869473))

(declare-fun m!869475 () Bool)

(assert (=> b!935448 m!869475))

(assert (=> b!935448 m!869457))

(declare-fun m!869477 () Bool)

(assert (=> b!935448 m!869477))

(declare-fun m!869479 () Bool)

(assert (=> b!935448 m!869479))

(declare-fun m!869481 () Bool)

(assert (=> b!935448 m!869481))

(assert (=> b!935448 m!869453))

(assert (=> b!935448 m!869467))

(declare-fun m!869483 () Bool)

(assert (=> b!935448 m!869483))

(declare-fun m!869485 () Bool)

(assert (=> b!935448 m!869485))

(declare-fun m!869487 () Bool)

(assert (=> b!935448 m!869487))

(assert (=> b!935448 m!869481))

(declare-fun m!869489 () Bool)

(assert (=> b!935448 m!869489))

(assert (=> b!935448 m!869485))

(declare-fun m!869491 () Bool)

(assert (=> b!935448 m!869491))

(declare-fun m!869493 () Bool)

(assert (=> b!935448 m!869493))

(assert (=> b!935448 m!869477))

(declare-fun m!869495 () Bool)

(assert (=> b!935448 m!869495))

(assert (=> b!935452 m!869453))

(assert (=> b!935452 m!869453))

(declare-fun m!869497 () Bool)

(assert (=> b!935452 m!869497))

(assert (=> b!935457 m!869453))

(assert (=> b!935457 m!869453))

(assert (=> b!935457 m!869461))

(assert (=> b!935138 d!113095))

(declare-fun d!113097 () Bool)

(declare-fun res!629971 () Bool)

(declare-fun e!525268 () Bool)

(assert (=> d!113097 (=> res!629971 e!525268)))

(assert (=> d!113097 (= res!629971 (= (select (arr!27068 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113097 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525268)))

(declare-fun b!935460 () Bool)

(declare-fun e!525269 () Bool)

(assert (=> b!935460 (= e!525268 e!525269)))

(declare-fun res!629972 () Bool)

(assert (=> b!935460 (=> (not res!629972) (not e!525269))))

(assert (=> b!935460 (= res!629972 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))

(declare-fun b!935461 () Bool)

(assert (=> b!935461 (= e!525269 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113097 (not res!629971)) b!935460))

(assert (= (and b!935460 res!629972) b!935461))

(assert (=> d!113097 m!869453))

(declare-fun m!869499 () Bool)

(assert (=> b!935461 m!869499))

(assert (=> b!935137 d!113097))

(declare-fun d!113099 () Bool)

(declare-fun res!629977 () Bool)

(declare-fun e!525274 () Bool)

(assert (=> d!113099 (=> res!629977 e!525274)))

(assert (=> d!113099 (= res!629977 ((_ is Nil!19106) Nil!19106))))

(assert (=> d!113099 (= (noDuplicate!1361 Nil!19106) e!525274)))

(declare-fun b!935466 () Bool)

(declare-fun e!525275 () Bool)

(assert (=> b!935466 (= e!525274 e!525275)))

(declare-fun res!629978 () Bool)

(assert (=> b!935466 (=> (not res!629978) (not e!525275))))

(assert (=> b!935466 (= res!629978 (not (contains!5043 (t!27309 Nil!19106) (h!20251 Nil!19106))))))

(declare-fun b!935467 () Bool)

(assert (=> b!935467 (= e!525275 (noDuplicate!1361 (t!27309 Nil!19106)))))

(assert (= (and d!113099 (not res!629977)) b!935466))

(assert (= (and b!935466 res!629978) b!935467))

(declare-fun m!869501 () Bool)

(assert (=> b!935466 m!869501))

(declare-fun m!869503 () Bool)

(assert (=> b!935467 m!869503))

(assert (=> b!935147 d!113099))

(declare-fun b!935475 () Bool)

(declare-fun e!525281 () Bool)

(assert (=> b!935475 (= e!525281 tp_is_empty!20173)))

(declare-fun mapIsEmpty!32037 () Bool)

(declare-fun mapRes!32037 () Bool)

(assert (=> mapIsEmpty!32037 mapRes!32037))

(declare-fun b!935474 () Bool)

(declare-fun e!525280 () Bool)

(assert (=> b!935474 (= e!525280 tp_is_empty!20173)))

(declare-fun mapNonEmpty!32037 () Bool)

(declare-fun tp!61464 () Bool)

(assert (=> mapNonEmpty!32037 (= mapRes!32037 (and tp!61464 e!525280))))

(declare-fun mapValue!32037 () ValueCell!9605)

(declare-fun mapKey!32037 () (_ BitVec 32))

(declare-fun mapRest!32037 () (Array (_ BitVec 32) ValueCell!9605))

(assert (=> mapNonEmpty!32037 (= mapRest!32028 (store mapRest!32037 mapKey!32037 mapValue!32037))))

(declare-fun condMapEmpty!32037 () Bool)

(declare-fun mapDefault!32037 () ValueCell!9605)

(assert (=> mapNonEmpty!32028 (= condMapEmpty!32037 (= mapRest!32028 ((as const (Array (_ BitVec 32) ValueCell!9605)) mapDefault!32037)))))

(assert (=> mapNonEmpty!32028 (= tp!61449 (and e!525281 mapRes!32037))))

(assert (= (and mapNonEmpty!32028 condMapEmpty!32037) mapIsEmpty!32037))

(assert (= (and mapNonEmpty!32028 (not condMapEmpty!32037)) mapNonEmpty!32037))

(assert (= (and mapNonEmpty!32037 ((_ is ValueCellFull!9605) mapValue!32037)) b!935474))

(assert (= (and mapNonEmpty!32028 ((_ is ValueCellFull!9605) mapDefault!32037)) b!935475))

(declare-fun m!869505 () Bool)

(assert (=> mapNonEmpty!32037 m!869505))

(declare-fun b_lambda!14051 () Bool)

(assert (= b_lambda!14043 (or (and start!79562 b_free!17665) b_lambda!14051)))

(declare-fun b_lambda!14053 () Bool)

(assert (= b_lambda!14047 (or (and start!79562 b_free!17665) b_lambda!14053)))

(declare-fun b_lambda!14055 () Bool)

(assert (= b_lambda!14049 (or (and start!79562 b_free!17665) b_lambda!14055)))

(declare-fun b_lambda!14057 () Bool)

(assert (= b_lambda!14045 (or (and start!79562 b_free!17665) b_lambda!14057)))

(check-sat (not d!113077) (not bm!40716) (not b_next!17665) (not d!113059) (not b!935285) (not b!935283) (not b!935452) (not b!935414) (not b_lambda!14057) (not bm!40714) (not b!935389) b_and!28905 (not b!935428) (not b!935422) (not b!935350) tp_is_empty!20173 (not b_lambda!14051) (not b!935406) (not bm!40721) (not d!113095) (not bm!40717) (not b!935423) (not b!935377) (not d!113057) (not b!935359) (not b!935362) (not d!113067) (not b_lambda!14055) (not b!935293) (not d!113093) (not mapNonEmpty!32037) (not b!935413) (not b!935307) (not bm!40720) (not bm!40690) (not b!935467) (not b!935399) (not b!935444) (not b!935398) (not b!935461) (not b!935451) (not b!935366) (not bm!40725) (not b!935368) (not b!935466) (not bm!40728) (not b!935302) (not b!935438) (not bm!40724) (not bm!40722) (not b!935369) (not bm!40710) (not b!935392) (not bm!40713) (not bm!40693) (not b!935435) (not b!935455) (not b_lambda!14041) (not b!935393) (not bm!40729) (not b!935363) (not d!113071) (not d!113079) (not b!935396) (not d!113061) (not b!935420) (not d!113065) (not bm!40709) (not d!113055) (not b!935439) (not b!935385) (not b!935448) (not b!935457) (not b!935305) (not b_lambda!14053) (not b!935355) (not d!113051) (not d!113073) (not b!935436) (not b!935411) (not b!935286) (not d!113063) (not b!935407) (not b!935380) (not b!935458) (not b!935379) (not b!935410) (not b!935429))
(check-sat b_and!28905 (not b_next!17665))
