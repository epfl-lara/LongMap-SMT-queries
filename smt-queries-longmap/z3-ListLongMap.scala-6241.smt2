; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80038 () Bool)

(assert start!80038)

(declare-fun b_free!17767 () Bool)

(declare-fun b_next!17767 () Bool)

(assert (=> start!80038 (= b_free!17767 (not b_next!17767))))

(declare-fun tp!61766 () Bool)

(declare-fun b_and!29183 () Bool)

(assert (=> start!80038 (= tp!61766 b_and!29183)))

(declare-fun b!940171 () Bool)

(declare-fun e!528138 () Bool)

(declare-fun e!528143 () Bool)

(assert (=> b!940171 (= e!528138 e!528143)))

(declare-fun res!632138 () Bool)

(assert (=> b!940171 (=> (not res!632138) (not e!528143))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56543 0))(
  ( (array!56544 (arr!27205 (Array (_ BitVec 32) (_ BitVec 64))) (size!27665 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56543)

(assert (=> b!940171 (= res!632138 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27665 _keys!1487)))))

(declare-datatypes ((Unit!31722 0))(
  ( (Unit!31723) )
))
(declare-fun lt!424777 () Unit!31722)

(declare-fun e!528140 () Unit!31722)

(assert (=> b!940171 (= lt!424777 e!528140)))

(declare-fun c!98265 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!940171 (= c!98265 (validKeyInArray!0 k0!1099))))

(declare-fun b!940172 () Bool)

(declare-fun res!632134 () Bool)

(declare-fun e!528144 () Bool)

(assert (=> b!940172 (=> (not res!632134) (not e!528144))))

(assert (=> b!940172 (= res!632134 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27665 _keys!1487))))))

(declare-fun b!940173 () Bool)

(declare-fun res!632133 () Bool)

(assert (=> b!940173 (=> (not res!632133) (not e!528144))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31999 0))(
  ( (V!32000 (val!10188 Int)) )
))
(declare-datatypes ((ValueCell!9656 0))(
  ( (ValueCellFull!9656 (v!12716 V!31999)) (EmptyCell!9656) )
))
(declare-datatypes ((array!56545 0))(
  ( (array!56546 (arr!27206 (Array (_ BitVec 32) ValueCell!9656)) (size!27666 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56545)

(assert (=> b!940173 (= res!632133 (and (= (size!27666 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27665 _keys!1487) (size!27666 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!940174 () Bool)

(declare-fun e!528145 () Bool)

(assert (=> b!940174 (= e!528145 e!528138)))

(declare-fun res!632142 () Bool)

(assert (=> b!940174 (=> (not res!632142) (not e!528138))))

(declare-fun v!791 () V!31999)

(declare-fun lt!424775 () V!31999)

(assert (=> b!940174 (= res!632142 (and (= lt!424775 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13376 0))(
  ( (tuple2!13377 (_1!6699 (_ BitVec 64)) (_2!6699 V!31999)) )
))
(declare-datatypes ((List!19155 0))(
  ( (Nil!19152) (Cons!19151 (h!20303 tuple2!13376) (t!27458 List!19155)) )
))
(declare-datatypes ((ListLongMap!12075 0))(
  ( (ListLongMap!12076 (toList!6053 List!19155)) )
))
(declare-fun lt!424784 () ListLongMap!12075)

(declare-fun apply!869 (ListLongMap!12075 (_ BitVec 64)) V!31999)

(assert (=> b!940174 (= lt!424775 (apply!869 lt!424784 k0!1099))))

(declare-fun b!940175 () Bool)

(declare-fun res!632136 () Bool)

(declare-fun e!528146 () Bool)

(assert (=> b!940175 (=> (not res!632136) (not e!528146))))

(declare-fun lt!424786 () ListLongMap!12075)

(assert (=> b!940175 (= res!632136 (= (apply!869 lt!424786 k0!1099) v!791))))

(declare-fun b!940177 () Bool)

(declare-fun e!528142 () Unit!31722)

(assert (=> b!940177 (= e!528140 e!528142)))

(declare-fun lt!424783 () (_ BitVec 64))

(assert (=> b!940177 (= lt!424783 (select (arr!27205 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!98266 () Bool)

(assert (=> b!940177 (= c!98266 (validKeyInArray!0 lt!424783))))

(declare-fun b!940178 () Bool)

(assert (=> b!940178 (= e!528144 e!528145)))

(declare-fun res!632137 () Bool)

(assert (=> b!940178 (=> (not res!632137) (not e!528145))))

(declare-fun contains!5127 (ListLongMap!12075 (_ BitVec 64)) Bool)

(assert (=> b!940178 (= res!632137 (contains!5127 lt!424784 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31999)

(declare-fun minValue!1173 () V!31999)

(declare-fun getCurrentListMap!3288 (array!56543 array!56545 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 32) Int) ListLongMap!12075)

(assert (=> b!940178 (= lt!424784 (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!32192 () Bool)

(declare-fun mapRes!32192 () Bool)

(declare-fun tp!61765 () Bool)

(declare-fun e!528139 () Bool)

(assert (=> mapNonEmpty!32192 (= mapRes!32192 (and tp!61765 e!528139))))

(declare-fun mapKey!32192 () (_ BitVec 32))

(declare-fun mapValue!32192 () ValueCell!9656)

(declare-fun mapRest!32192 () (Array (_ BitVec 32) ValueCell!9656))

(assert (=> mapNonEmpty!32192 (= (arr!27206 _values!1231) (store mapRest!32192 mapKey!32192 mapValue!32192))))

(declare-fun b!940179 () Bool)

(declare-fun res!632141 () Bool)

(assert (=> b!940179 (=> (not res!632141) (not e!528144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56543 (_ BitVec 32)) Bool)

(assert (=> b!940179 (= res!632141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!940180 () Bool)

(assert (=> b!940180 (= e!528143 e!528146)))

(declare-fun res!632135 () Bool)

(assert (=> b!940180 (=> (not res!632135) (not e!528146))))

(assert (=> b!940180 (= res!632135 (contains!5127 lt!424786 k0!1099))))

(assert (=> b!940180 (= lt!424786 (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!940181 () Bool)

(declare-fun res!632140 () Bool)

(assert (=> b!940181 (=> (not res!632140) (not e!528144))))

(declare-datatypes ((List!19156 0))(
  ( (Nil!19153) (Cons!19152 (h!20304 (_ BitVec 64)) (t!27459 List!19156)) )
))
(declare-fun arrayNoDuplicates!0 (array!56543 (_ BitVec 32) List!19156) Bool)

(assert (=> b!940181 (= res!632140 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19153))))

(declare-fun b!940182 () Bool)

(declare-fun e!528147 () Bool)

(declare-fun e!528150 () Bool)

(assert (=> b!940182 (= e!528147 (and e!528150 mapRes!32192))))

(declare-fun condMapEmpty!32192 () Bool)

(declare-fun mapDefault!32192 () ValueCell!9656)

(assert (=> b!940182 (= condMapEmpty!32192 (= (arr!27206 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9656)) mapDefault!32192)))))

(declare-fun b!940183 () Bool)

(declare-fun Unit!31724 () Unit!31722)

(assert (=> b!940183 (= e!528142 Unit!31724)))

(declare-fun b!940184 () Bool)

(declare-fun lt!424787 () ListLongMap!12075)

(assert (=> b!940184 (= (apply!869 lt!424787 k0!1099) lt!424775)))

(declare-fun lt!424785 () Unit!31722)

(declare-fun lt!424772 () V!31999)

(declare-fun addApplyDifferent!443 (ListLongMap!12075 (_ BitVec 64) V!31999 (_ BitVec 64)) Unit!31722)

(assert (=> b!940184 (= lt!424785 (addApplyDifferent!443 lt!424784 lt!424783 lt!424772 k0!1099))))

(assert (=> b!940184 (not (= lt!424783 k0!1099))))

(declare-fun lt!424776 () Unit!31722)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56543 (_ BitVec 64) (_ BitVec 32) List!19156) Unit!31722)

(assert (=> b!940184 (= lt!424776 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19153))))

(declare-fun e!528149 () Bool)

(assert (=> b!940184 e!528149))

(declare-fun c!98264 () Bool)

(assert (=> b!940184 (= c!98264 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424782 () Unit!31722)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!313 (array!56543 array!56545 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 64) (_ BitVec 32) Int) Unit!31722)

(assert (=> b!940184 (= lt!424782 (lemmaListMapContainsThenArrayContainsFrom!313 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!940184 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19153)))

(declare-fun lt!424773 () Unit!31722)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56543 (_ BitVec 32) (_ BitVec 32)) Unit!31722)

(assert (=> b!940184 (= lt!424773 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!940184 (contains!5127 lt!424787 k0!1099)))

(declare-fun lt!424780 () tuple2!13376)

(declare-fun +!2859 (ListLongMap!12075 tuple2!13376) ListLongMap!12075)

(assert (=> b!940184 (= lt!424787 (+!2859 lt!424784 lt!424780))))

(declare-fun lt!424771 () Unit!31722)

(declare-fun addStillContains!562 (ListLongMap!12075 (_ BitVec 64) V!31999 (_ BitVec 64)) Unit!31722)

(assert (=> b!940184 (= lt!424771 (addStillContains!562 lt!424784 lt!424783 lt!424772 k0!1099))))

(assert (=> b!940184 (= (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2859 (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424780))))

(assert (=> b!940184 (= lt!424780 (tuple2!13377 lt!424783 lt!424772))))

(declare-fun get!14371 (ValueCell!9656 V!31999) V!31999)

(declare-fun dynLambda!1656 (Int (_ BitVec 64)) V!31999)

(assert (=> b!940184 (= lt!424772 (get!14371 (select (arr!27206 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1656 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424774 () Unit!31722)

(declare-fun lemmaListMapRecursiveValidKeyArray!239 (array!56543 array!56545 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 32) Int) Unit!31722)

(assert (=> b!940184 (= lt!424774 (lemmaListMapRecursiveValidKeyArray!239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!940184 (= e!528142 lt!424785)))

(declare-fun b!940185 () Bool)

(assert (=> b!940185 (= e!528149 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!940176 () Bool)

(declare-fun tp_is_empty!20275 () Bool)

(assert (=> b!940176 (= e!528139 tp_is_empty!20275)))

(declare-fun res!632139 () Bool)

(assert (=> start!80038 (=> (not res!632139) (not e!528144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!80038 (= res!632139 (validMask!0 mask!1881))))

(assert (=> start!80038 e!528144))

(assert (=> start!80038 true))

(assert (=> start!80038 tp_is_empty!20275))

(declare-fun array_inv!21242 (array!56545) Bool)

(assert (=> start!80038 (and (array_inv!21242 _values!1231) e!528147)))

(assert (=> start!80038 tp!61766))

(declare-fun array_inv!21243 (array!56543) Bool)

(assert (=> start!80038 (array_inv!21243 _keys!1487)))

(declare-fun b!940186 () Bool)

(assert (=> b!940186 (= e!528146 (not true))))

(declare-fun lt!424779 () V!31999)

(declare-fun lt!424778 () ListLongMap!12075)

(assert (=> b!940186 (= lt!424779 (apply!869 lt!424778 k0!1099))))

(declare-fun e!528148 () Bool)

(assert (=> b!940186 e!528148))

(declare-fun res!632132 () Bool)

(assert (=> b!940186 (=> (not res!632132) (not e!528148))))

(assert (=> b!940186 (= res!632132 (contains!5127 lt!424778 k0!1099))))

(assert (=> b!940186 (= lt!424778 (getCurrentListMap!3288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!424781 () Unit!31722)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!108 (array!56543 array!56545 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 64) V!31999 (_ BitVec 32) Int) Unit!31722)

(assert (=> b!940186 (= lt!424781 (lemmaListMapApplyFromThenApplyFromZero!108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!940187 () Bool)

(assert (=> b!940187 (= e!528148 (= (apply!869 lt!424778 k0!1099) v!791))))

(declare-fun b!940188 () Bool)

(assert (=> b!940188 (= e!528150 tp_is_empty!20275)))

(declare-fun mapIsEmpty!32192 () Bool)

(assert (=> mapIsEmpty!32192 mapRes!32192))

(declare-fun b!940189 () Bool)

(declare-fun Unit!31725 () Unit!31722)

(assert (=> b!940189 (= e!528140 Unit!31725)))

(declare-fun b!940190 () Bool)

(declare-fun arrayContainsKey!0 (array!56543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940190 (= e!528149 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!80038 res!632139) b!940173))

(assert (= (and b!940173 res!632133) b!940179))

(assert (= (and b!940179 res!632141) b!940181))

(assert (= (and b!940181 res!632140) b!940172))

(assert (= (and b!940172 res!632134) b!940178))

(assert (= (and b!940178 res!632137) b!940174))

(assert (= (and b!940174 res!632142) b!940171))

(assert (= (and b!940171 c!98265) b!940177))

(assert (= (and b!940171 (not c!98265)) b!940189))

(assert (= (and b!940177 c!98266) b!940184))

(assert (= (and b!940177 (not c!98266)) b!940183))

(assert (= (and b!940184 c!98264) b!940190))

(assert (= (and b!940184 (not c!98264)) b!940185))

(assert (= (and b!940171 res!632138) b!940180))

(assert (= (and b!940180 res!632135) b!940175))

(assert (= (and b!940175 res!632136) b!940186))

(assert (= (and b!940186 res!632132) b!940187))

(assert (= (and b!940182 condMapEmpty!32192) mapIsEmpty!32192))

(assert (= (and b!940182 (not condMapEmpty!32192)) mapNonEmpty!32192))

(get-info :version)

(assert (= (and mapNonEmpty!32192 ((_ is ValueCellFull!9656) mapValue!32192)) b!940176))

(assert (= (and b!940182 ((_ is ValueCellFull!9656) mapDefault!32192)) b!940188))

(assert (= start!80038 b!940182))

(declare-fun b_lambda!14287 () Bool)

(assert (=> (not b_lambda!14287) (not b!940184)))

(declare-fun t!27457 () Bool)

(declare-fun tb!6153 () Bool)

(assert (=> (and start!80038 (= defaultEntry!1235 defaultEntry!1235) t!27457) tb!6153))

(declare-fun result!12151 () Bool)

(assert (=> tb!6153 (= result!12151 tp_is_empty!20275)))

(assert (=> b!940184 t!27457))

(declare-fun b_and!29185 () Bool)

(assert (= b_and!29183 (and (=> t!27457 result!12151) b_and!29185)))

(declare-fun m!876387 () Bool)

(assert (=> b!940175 m!876387))

(declare-fun m!876389 () Bool)

(assert (=> b!940177 m!876389))

(declare-fun m!876391 () Bool)

(assert (=> b!940177 m!876391))

(declare-fun m!876393 () Bool)

(assert (=> b!940190 m!876393))

(declare-fun m!876395 () Bool)

(assert (=> b!940171 m!876395))

(declare-fun m!876397 () Bool)

(assert (=> b!940179 m!876397))

(declare-fun m!876399 () Bool)

(assert (=> mapNonEmpty!32192 m!876399))

(declare-fun m!876401 () Bool)

(assert (=> b!940178 m!876401))

(declare-fun m!876403 () Bool)

(assert (=> b!940178 m!876403))

(declare-fun m!876405 () Bool)

(assert (=> b!940174 m!876405))

(declare-fun m!876407 () Bool)

(assert (=> b!940186 m!876407))

(declare-fun m!876409 () Bool)

(assert (=> b!940186 m!876409))

(declare-fun m!876411 () Bool)

(assert (=> b!940186 m!876411))

(declare-fun m!876413 () Bool)

(assert (=> b!940186 m!876413))

(declare-fun m!876415 () Bool)

(assert (=> b!940181 m!876415))

(assert (=> b!940187 m!876407))

(declare-fun m!876417 () Bool)

(assert (=> start!80038 m!876417))

(declare-fun m!876419 () Bool)

(assert (=> start!80038 m!876419))

(declare-fun m!876421 () Bool)

(assert (=> start!80038 m!876421))

(declare-fun m!876423 () Bool)

(assert (=> b!940184 m!876423))

(declare-fun m!876425 () Bool)

(assert (=> b!940184 m!876425))

(declare-fun m!876427 () Bool)

(assert (=> b!940184 m!876427))

(declare-fun m!876429 () Bool)

(assert (=> b!940184 m!876429))

(declare-fun m!876431 () Bool)

(assert (=> b!940184 m!876431))

(declare-fun m!876433 () Bool)

(assert (=> b!940184 m!876433))

(declare-fun m!876435 () Bool)

(assert (=> b!940184 m!876435))

(declare-fun m!876437 () Bool)

(assert (=> b!940184 m!876437))

(declare-fun m!876439 () Bool)

(assert (=> b!940184 m!876439))

(assert (=> b!940184 m!876431))

(assert (=> b!940184 m!876435))

(declare-fun m!876441 () Bool)

(assert (=> b!940184 m!876441))

(declare-fun m!876443 () Bool)

(assert (=> b!940184 m!876443))

(declare-fun m!876445 () Bool)

(assert (=> b!940184 m!876445))

(declare-fun m!876447 () Bool)

(assert (=> b!940184 m!876447))

(declare-fun m!876449 () Bool)

(assert (=> b!940184 m!876449))

(declare-fun m!876451 () Bool)

(assert (=> b!940184 m!876451))

(assert (=> b!940184 m!876437))

(declare-fun m!876453 () Bool)

(assert (=> b!940184 m!876453))

(declare-fun m!876455 () Bool)

(assert (=> b!940180 m!876455))

(assert (=> b!940180 m!876443))

(check-sat (not b!940187) (not b!940178) (not b!940180) (not b!940175) (not b!940184) (not b!940181) (not b!940186) b_and!29185 (not start!80038) (not mapNonEmpty!32192) (not b_lambda!14287) (not b!940177) (not b!940190) (not b!940179) (not b_next!17767) (not b!940171) tp_is_empty!20275 (not b!940174))
(check-sat b_and!29185 (not b_next!17767))
