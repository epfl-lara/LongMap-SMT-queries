; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79052 () Bool)

(assert start!79052)

(declare-fun b_free!17265 () Bool)

(declare-fun b_next!17265 () Bool)

(assert (=> start!79052 (= b_free!17265 (not b_next!17265))))

(declare-fun tp!60235 () Bool)

(declare-fun b_and!28267 () Bool)

(assert (=> start!79052 (= tp!60235 b_and!28267)))

(declare-fun b!926631 () Bool)

(declare-datatypes ((V!31329 0))(
  ( (V!31330 (val!9937 Int)) )
))
(declare-datatypes ((tuple2!12966 0))(
  ( (tuple2!12967 (_1!6494 (_ BitVec 64)) (_2!6494 V!31329)) )
))
(declare-datatypes ((List!18767 0))(
  ( (Nil!18764) (Cons!18763 (h!19909 tuple2!12966) (t!26762 List!18767)) )
))
(declare-datatypes ((ListLongMap!11663 0))(
  ( (ListLongMap!11664 (toList!5847 List!18767)) )
))
(declare-fun lt!417394 () ListLongMap!11663)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!417386 () V!31329)

(declare-fun apply!677 (ListLongMap!11663 (_ BitVec 64)) V!31329)

(assert (=> b!926631 (= (apply!677 lt!417394 k0!1099) lt!417386)))

(declare-fun lt!417395 () (_ BitVec 64))

(declare-fun lt!417397 () V!31329)

(declare-datatypes ((Unit!31329 0))(
  ( (Unit!31330) )
))
(declare-fun lt!417387 () Unit!31329)

(declare-fun lt!417388 () ListLongMap!11663)

(declare-fun addApplyDifferent!396 (ListLongMap!11663 (_ BitVec 64) V!31329 (_ BitVec 64)) Unit!31329)

(assert (=> b!926631 (= lt!417387 (addApplyDifferent!396 lt!417388 lt!417395 lt!417397 k0!1099))))

(assert (=> b!926631 (not (= lt!417395 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417398 () Unit!31329)

(declare-datatypes ((array!55510 0))(
  ( (array!55511 (arr!26700 (Array (_ BitVec 32) (_ BitVec 64))) (size!27159 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55510)

(declare-datatypes ((List!18768 0))(
  ( (Nil!18765) (Cons!18764 (h!19910 (_ BitVec 64)) (t!26763 List!18768)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55510 (_ BitVec 64) (_ BitVec 32) List!18768) Unit!31329)

(assert (=> b!926631 (= lt!417398 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18765))))

(declare-fun e!520162 () Bool)

(assert (=> b!926631 e!520162))

(declare-fun c!96753 () Bool)

(assert (=> b!926631 (= c!96753 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!417385 () Unit!31329)

(declare-datatypes ((ValueCell!9405 0))(
  ( (ValueCellFull!9405 (v!12455 V!31329)) (EmptyCell!9405) )
))
(declare-datatypes ((array!55512 0))(
  ( (array!55513 (arr!26701 (Array (_ BitVec 32) ValueCell!9405)) (size!27160 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55512)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31329)

(declare-fun minValue!1173 () V!31329)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!247 (array!55510 array!55512 (_ BitVec 32) (_ BitVec 32) V!31329 V!31329 (_ BitVec 64) (_ BitVec 32) Int) Unit!31329)

(assert (=> b!926631 (= lt!417385 (lemmaListMapContainsThenArrayContainsFrom!247 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55510 (_ BitVec 32) List!18768) Bool)

(assert (=> b!926631 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18765)))

(declare-fun lt!417396 () Unit!31329)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55510 (_ BitVec 32) (_ BitVec 32)) Unit!31329)

(assert (=> b!926631 (= lt!417396 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4906 (ListLongMap!11663 (_ BitVec 64)) Bool)

(assert (=> b!926631 (contains!4906 lt!417394 k0!1099)))

(declare-fun lt!417391 () tuple2!12966)

(declare-fun +!2740 (ListLongMap!11663 tuple2!12966) ListLongMap!11663)

(assert (=> b!926631 (= lt!417394 (+!2740 lt!417388 lt!417391))))

(declare-fun lt!417399 () Unit!31329)

(declare-fun addStillContains!464 (ListLongMap!11663 (_ BitVec 64) V!31329 (_ BitVec 64)) Unit!31329)

(assert (=> b!926631 (= lt!417399 (addStillContains!464 lt!417388 lt!417395 lt!417397 k0!1099))))

(declare-fun getCurrentListMap!3097 (array!55510 array!55512 (_ BitVec 32) (_ BitVec 32) V!31329 V!31329 (_ BitVec 32) Int) ListLongMap!11663)

(assert (=> b!926631 (= (getCurrentListMap!3097 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2740 (getCurrentListMap!3097 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417391))))

(assert (=> b!926631 (= lt!417391 (tuple2!12967 lt!417395 lt!417397))))

(declare-fun get!14051 (ValueCell!9405 V!31329) V!31329)

(declare-fun dynLambda!1529 (Int (_ BitVec 64)) V!31329)

(assert (=> b!926631 (= lt!417397 (get!14051 (select (arr!26701 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1529 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417393 () Unit!31329)

(declare-fun lemmaListMapRecursiveValidKeyArray!130 (array!55510 array!55512 (_ BitVec 32) (_ BitVec 32) V!31329 V!31329 (_ BitVec 32) Int) Unit!31329)

(assert (=> b!926631 (= lt!417393 (lemmaListMapRecursiveValidKeyArray!130 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520159 () Unit!31329)

(assert (=> b!926631 (= e!520159 lt!417387)))

(declare-fun b!926632 () Bool)

(declare-fun res!624270 () Bool)

(declare-fun e!520156 () Bool)

(assert (=> b!926632 (=> (not res!624270) (not e!520156))))

(declare-fun v!791 () V!31329)

(declare-fun lt!417400 () ListLongMap!11663)

(assert (=> b!926632 (= res!624270 (= (apply!677 lt!417400 k0!1099) v!791))))

(declare-fun mapNonEmpty!31416 () Bool)

(declare-fun mapRes!31416 () Bool)

(declare-fun tp!60236 () Bool)

(declare-fun e!520150 () Bool)

(assert (=> mapNonEmpty!31416 (= mapRes!31416 (and tp!60236 e!520150))))

(declare-fun mapRest!31416 () (Array (_ BitVec 32) ValueCell!9405))

(declare-fun mapKey!31416 () (_ BitVec 32))

(declare-fun mapValue!31416 () ValueCell!9405)

(assert (=> mapNonEmpty!31416 (= (arr!26701 _values!1231) (store mapRest!31416 mapKey!31416 mapValue!31416))))

(declare-fun b!926634 () Bool)

(declare-fun e!520160 () Bool)

(declare-fun e!520157 () Bool)

(assert (=> b!926634 (= e!520160 e!520157)))

(declare-fun res!624261 () Bool)

(assert (=> b!926634 (=> (not res!624261) (not e!520157))))

(assert (=> b!926634 (= res!624261 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27159 _keys!1487)))))

(declare-fun lt!417392 () Unit!31329)

(declare-fun e!520154 () Unit!31329)

(assert (=> b!926634 (= lt!417392 e!520154)))

(declare-fun c!96751 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926634 (= c!96751 (validKeyInArray!0 k0!1099))))

(declare-fun b!926635 () Bool)

(assert (=> b!926635 (= e!520157 e!520156)))

(declare-fun res!624263 () Bool)

(assert (=> b!926635 (=> (not res!624263) (not e!520156))))

(assert (=> b!926635 (= res!624263 (contains!4906 lt!417400 k0!1099))))

(assert (=> b!926635 (= lt!417400 (getCurrentListMap!3097 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926636 () Bool)

(declare-fun e!520152 () Bool)

(declare-fun e!520155 () Bool)

(assert (=> b!926636 (= e!520152 (and e!520155 mapRes!31416))))

(declare-fun condMapEmpty!31416 () Bool)

(declare-fun mapDefault!31416 () ValueCell!9405)

(assert (=> b!926636 (= condMapEmpty!31416 (= (arr!26701 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9405)) mapDefault!31416)))))

(declare-fun b!926637 () Bool)

(declare-fun e!520161 () Bool)

(assert (=> b!926637 (= e!520161 e!520160)))

(declare-fun res!624266 () Bool)

(assert (=> b!926637 (=> (not res!624266) (not e!520160))))

(assert (=> b!926637 (= res!624266 (and (= lt!417386 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926637 (= lt!417386 (apply!677 lt!417388 k0!1099))))

(declare-fun b!926638 () Bool)

(declare-fun res!624264 () Bool)

(declare-fun e!520158 () Bool)

(assert (=> b!926638 (=> (not res!624264) (not e!520158))))

(assert (=> b!926638 (= res!624264 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27159 _keys!1487))))))

(declare-fun b!926639 () Bool)

(declare-fun tp_is_empty!19773 () Bool)

(assert (=> b!926639 (= e!520155 tp_is_empty!19773)))

(declare-fun b!926640 () Bool)

(declare-fun Unit!31331 () Unit!31329)

(assert (=> b!926640 (= e!520154 Unit!31331)))

(declare-fun b!926641 () Bool)

(declare-fun Unit!31332 () Unit!31329)

(assert (=> b!926641 (= e!520159 Unit!31332)))

(declare-fun b!926642 () Bool)

(assert (=> b!926642 (= e!520154 e!520159)))

(assert (=> b!926642 (= lt!417395 (select (arr!26700 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96752 () Bool)

(assert (=> b!926642 (= c!96752 (validKeyInArray!0 lt!417395))))

(declare-fun b!926643 () Bool)

(declare-fun res!624268 () Bool)

(assert (=> b!926643 (=> (not res!624268) (not e!520158))))

(assert (=> b!926643 (= res!624268 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18765))))

(declare-fun lt!417389 () ListLongMap!11663)

(declare-fun b!926644 () Bool)

(declare-fun e!520153 () Bool)

(assert (=> b!926644 (= e!520153 (= (apply!677 lt!417389 k0!1099) v!791))))

(declare-fun b!926645 () Bool)

(declare-fun res!624262 () Bool)

(assert (=> b!926645 (=> (not res!624262) (not e!520158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55510 (_ BitVec 32)) Bool)

(assert (=> b!926645 (= res!624262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!624271 () Bool)

(assert (=> start!79052 (=> (not res!624271) (not e!520158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79052 (= res!624271 (validMask!0 mask!1881))))

(assert (=> start!79052 e!520158))

(assert (=> start!79052 true))

(assert (=> start!79052 tp_is_empty!19773))

(declare-fun array_inv!20794 (array!55512) Bool)

(assert (=> start!79052 (and (array_inv!20794 _values!1231) e!520152)))

(assert (=> start!79052 tp!60235))

(declare-fun array_inv!20795 (array!55510) Bool)

(assert (=> start!79052 (array_inv!20795 _keys!1487)))

(declare-fun b!926633 () Bool)

(declare-fun arrayContainsKey!0 (array!55510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926633 (= e!520162 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926646 () Bool)

(assert (=> b!926646 (= e!520150 tp_is_empty!19773)))

(declare-fun mapIsEmpty!31416 () Bool)

(assert (=> mapIsEmpty!31416 mapRes!31416))

(declare-fun b!926647 () Bool)

(assert (=> b!926647 (= e!520158 e!520161)))

(declare-fun res!624265 () Bool)

(assert (=> b!926647 (=> (not res!624265) (not e!520161))))

(assert (=> b!926647 (= res!624265 (contains!4906 lt!417388 k0!1099))))

(assert (=> b!926647 (= lt!417388 (getCurrentListMap!3097 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926648 () Bool)

(declare-fun res!624269 () Bool)

(assert (=> b!926648 (=> (not res!624269) (not e!520158))))

(assert (=> b!926648 (= res!624269 (and (= (size!27160 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27159 _keys!1487) (size!27160 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926649 () Bool)

(assert (=> b!926649 (= e!520156 (not (bvsle #b00000000000000000000000000000000 (size!27159 _keys!1487))))))

(assert (=> b!926649 e!520153))

(declare-fun res!624267 () Bool)

(assert (=> b!926649 (=> (not res!624267) (not e!520153))))

(assert (=> b!926649 (= res!624267 (contains!4906 lt!417389 k0!1099))))

(assert (=> b!926649 (= lt!417389 (getCurrentListMap!3097 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417390 () Unit!31329)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!81 (array!55510 array!55512 (_ BitVec 32) (_ BitVec 32) V!31329 V!31329 (_ BitVec 64) V!31329 (_ BitVec 32) Int) Unit!31329)

(assert (=> b!926649 (= lt!417390 (lemmaListMapApplyFromThenApplyFromZero!81 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926650 () Bool)

(assert (=> b!926650 (= e!520162 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!79052 res!624271) b!926648))

(assert (= (and b!926648 res!624269) b!926645))

(assert (= (and b!926645 res!624262) b!926643))

(assert (= (and b!926643 res!624268) b!926638))

(assert (= (and b!926638 res!624264) b!926647))

(assert (= (and b!926647 res!624265) b!926637))

(assert (= (and b!926637 res!624266) b!926634))

(assert (= (and b!926634 c!96751) b!926642))

(assert (= (and b!926634 (not c!96751)) b!926640))

(assert (= (and b!926642 c!96752) b!926631))

(assert (= (and b!926642 (not c!96752)) b!926641))

(assert (= (and b!926631 c!96753) b!926633))

(assert (= (and b!926631 (not c!96753)) b!926650))

(assert (= (and b!926634 res!624261) b!926635))

(assert (= (and b!926635 res!624263) b!926632))

(assert (= (and b!926632 res!624270) b!926649))

(assert (= (and b!926649 res!624267) b!926644))

(assert (= (and b!926636 condMapEmpty!31416) mapIsEmpty!31416))

(assert (= (and b!926636 (not condMapEmpty!31416)) mapNonEmpty!31416))

(get-info :version)

(assert (= (and mapNonEmpty!31416 ((_ is ValueCellFull!9405) mapValue!31416)) b!926646))

(assert (= (and b!926636 ((_ is ValueCellFull!9405) mapDefault!31416)) b!926639))

(assert (= start!79052 b!926636))

(declare-fun b_lambda!13767 () Bool)

(assert (=> (not b_lambda!13767) (not b!926631)))

(declare-fun t!26761 () Bool)

(declare-fun tb!5845 () Bool)

(assert (=> (and start!79052 (= defaultEntry!1235 defaultEntry!1235) t!26761) tb!5845))

(declare-fun result!11513 () Bool)

(assert (=> tb!5845 (= result!11513 tp_is_empty!19773)))

(assert (=> b!926631 t!26761))

(declare-fun b_and!28269 () Bool)

(assert (= b_and!28267 (and (=> t!26761 result!11513) b_and!28269)))

(declare-fun m!861205 () Bool)

(assert (=> b!926637 m!861205))

(declare-fun m!861207 () Bool)

(assert (=> b!926635 m!861207))

(declare-fun m!861209 () Bool)

(assert (=> b!926635 m!861209))

(declare-fun m!861211 () Bool)

(assert (=> b!926644 m!861211))

(declare-fun m!861213 () Bool)

(assert (=> b!926645 m!861213))

(declare-fun m!861215 () Bool)

(assert (=> mapNonEmpty!31416 m!861215))

(declare-fun m!861217 () Bool)

(assert (=> b!926631 m!861217))

(declare-fun m!861219 () Bool)

(assert (=> b!926631 m!861219))

(declare-fun m!861221 () Bool)

(assert (=> b!926631 m!861221))

(declare-fun m!861223 () Bool)

(assert (=> b!926631 m!861223))

(declare-fun m!861225 () Bool)

(assert (=> b!926631 m!861225))

(declare-fun m!861227 () Bool)

(assert (=> b!926631 m!861227))

(declare-fun m!861229 () Bool)

(assert (=> b!926631 m!861229))

(declare-fun m!861231 () Bool)

(assert (=> b!926631 m!861231))

(assert (=> b!926631 m!861223))

(assert (=> b!926631 m!861229))

(declare-fun m!861233 () Bool)

(assert (=> b!926631 m!861233))

(assert (=> b!926631 m!861209))

(declare-fun m!861235 () Bool)

(assert (=> b!926631 m!861235))

(assert (=> b!926631 m!861225))

(declare-fun m!861237 () Bool)

(assert (=> b!926631 m!861237))

(declare-fun m!861239 () Bool)

(assert (=> b!926631 m!861239))

(declare-fun m!861241 () Bool)

(assert (=> b!926631 m!861241))

(declare-fun m!861243 () Bool)

(assert (=> b!926631 m!861243))

(declare-fun m!861245 () Bool)

(assert (=> b!926631 m!861245))

(declare-fun m!861247 () Bool)

(assert (=> b!926642 m!861247))

(declare-fun m!861249 () Bool)

(assert (=> b!926642 m!861249))

(declare-fun m!861251 () Bool)

(assert (=> b!926634 m!861251))

(declare-fun m!861253 () Bool)

(assert (=> b!926633 m!861253))

(declare-fun m!861255 () Bool)

(assert (=> start!79052 m!861255))

(declare-fun m!861257 () Bool)

(assert (=> start!79052 m!861257))

(declare-fun m!861259 () Bool)

(assert (=> start!79052 m!861259))

(declare-fun m!861261 () Bool)

(assert (=> b!926632 m!861261))

(declare-fun m!861263 () Bool)

(assert (=> b!926643 m!861263))

(declare-fun m!861265 () Bool)

(assert (=> b!926647 m!861265))

(declare-fun m!861267 () Bool)

(assert (=> b!926647 m!861267))

(declare-fun m!861269 () Bool)

(assert (=> b!926649 m!861269))

(declare-fun m!861271 () Bool)

(assert (=> b!926649 m!861271))

(declare-fun m!861273 () Bool)

(assert (=> b!926649 m!861273))

(check-sat (not b!926649) (not b!926647) (not b!926632) (not b!926644) (not b!926631) (not b_lambda!13767) (not b_next!17265) (not b!926633) (not b!926637) b_and!28269 (not b!926645) (not b!926642) (not mapNonEmpty!31416) (not b!926635) (not b!926634) (not b!926643) tp_is_empty!19773 (not start!79052))
(check-sat b_and!28269 (not b_next!17265))
