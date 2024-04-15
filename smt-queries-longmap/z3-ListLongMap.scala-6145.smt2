; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78960 () Bool)

(assert start!78960)

(declare-fun b_free!17191 () Bool)

(declare-fun b_next!17191 () Bool)

(assert (=> start!78960 (= b_free!17191 (not b_next!17191))))

(declare-fun tp!60014 () Bool)

(declare-fun b_and!28093 () Bool)

(assert (=> start!78960 (= tp!60014 b_and!28093)))

(declare-fun b!924166 () Bool)

(declare-fun e!518595 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!924166 (= e!518595 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924167 () Bool)

(declare-datatypes ((Unit!31125 0))(
  ( (Unit!31126) )
))
(declare-fun e!518594 () Unit!31125)

(declare-fun e!518596 () Unit!31125)

(assert (=> b!924167 (= e!518594 e!518596)))

(declare-fun lt!415412 () (_ BitVec 64))

(declare-datatypes ((array!55343 0))(
  ( (array!55344 (arr!26617 (Array (_ BitVec 32) (_ BitVec 64))) (size!27078 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55343)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!924167 (= lt!415412 (select (arr!26617 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96354 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924167 (= c!96354 (validKeyInArray!0 lt!415412))))

(declare-fun b!924168 () Bool)

(declare-fun e!518604 () Bool)

(declare-fun e!518602 () Bool)

(assert (=> b!924168 (= e!518604 e!518602)))

(declare-fun res!623003 () Bool)

(assert (=> b!924168 (=> (not res!623003) (not e!518602))))

(assert (=> b!924168 (= res!623003 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27078 _keys!1487)))))

(declare-fun lt!415407 () Unit!31125)

(assert (=> b!924168 (= lt!415407 e!518594)))

(declare-fun c!96353 () Bool)

(assert (=> b!924168 (= c!96353 (validKeyInArray!0 k0!1099))))

(declare-fun res!622999 () Bool)

(declare-fun e!518601 () Bool)

(assert (=> start!78960 (=> (not res!622999) (not e!518601))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78960 (= res!622999 (validMask!0 mask!1881))))

(assert (=> start!78960 e!518601))

(assert (=> start!78960 true))

(declare-fun tp_is_empty!19699 () Bool)

(assert (=> start!78960 tp_is_empty!19699))

(declare-datatypes ((V!31231 0))(
  ( (V!31232 (val!9900 Int)) )
))
(declare-datatypes ((ValueCell!9368 0))(
  ( (ValueCellFull!9368 (v!12417 V!31231)) (EmptyCell!9368) )
))
(declare-datatypes ((array!55345 0))(
  ( (array!55346 (arr!26618 (Array (_ BitVec 32) ValueCell!9368)) (size!27079 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55345)

(declare-fun e!518603 () Bool)

(declare-fun array_inv!20816 (array!55345) Bool)

(assert (=> start!78960 (and (array_inv!20816 _values!1231) e!518603)))

(assert (=> start!78960 tp!60014))

(declare-fun array_inv!20817 (array!55343) Bool)

(assert (=> start!78960 (array_inv!20817 _keys!1487)))

(declare-fun b!924169 () Bool)

(declare-fun e!518600 () Bool)

(assert (=> b!924169 (= e!518600 tp_is_empty!19699)))

(declare-fun mapIsEmpty!31305 () Bool)

(declare-fun mapRes!31305 () Bool)

(assert (=> mapIsEmpty!31305 mapRes!31305))

(declare-fun b!924170 () Bool)

(declare-fun res!623001 () Bool)

(assert (=> b!924170 (=> (not res!623001) (not e!518601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55343 (_ BitVec 32)) Bool)

(assert (=> b!924170 (= res!623001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924171 () Bool)

(declare-fun res!623004 () Bool)

(assert (=> b!924171 (=> (not res!623004) (not e!518601))))

(assert (=> b!924171 (= res!623004 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27078 _keys!1487))))))

(declare-fun b!924172 () Bool)

(declare-fun res!623005 () Bool)

(assert (=> b!924172 (=> (not res!623005) (not e!518601))))

(assert (=> b!924172 (= res!623005 (and (= (size!27079 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27078 _keys!1487) (size!27079 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924173 () Bool)

(declare-fun e!518599 () Bool)

(assert (=> b!924173 (= e!518601 e!518599)))

(declare-fun res!622998 () Bool)

(assert (=> b!924173 (=> (not res!622998) (not e!518599))))

(declare-datatypes ((tuple2!12962 0))(
  ( (tuple2!12963 (_1!6492 (_ BitVec 64)) (_2!6492 V!31231)) )
))
(declare-datatypes ((List!18741 0))(
  ( (Nil!18738) (Cons!18737 (h!19883 tuple2!12962) (t!26653 List!18741)) )
))
(declare-datatypes ((ListLongMap!11649 0))(
  ( (ListLongMap!11650 (toList!5840 List!18741)) )
))
(declare-fun lt!415418 () ListLongMap!11649)

(declare-fun contains!4853 (ListLongMap!11649 (_ BitVec 64)) Bool)

(assert (=> b!924173 (= res!622998 (contains!4853 lt!415418 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31231)

(declare-fun minValue!1173 () V!31231)

(declare-fun getCurrentListMap!3027 (array!55343 array!55345 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 32) Int) ListLongMap!11649)

(assert (=> b!924173 (= lt!415418 (getCurrentListMap!3027 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924174 () Bool)

(declare-fun Unit!31127 () Unit!31125)

(assert (=> b!924174 (= e!518596 Unit!31127)))

(declare-fun b!924175 () Bool)

(declare-fun lt!415411 () ListLongMap!11649)

(declare-fun lt!415415 () V!31231)

(declare-fun apply!651 (ListLongMap!11649 (_ BitVec 64)) V!31231)

(assert (=> b!924175 (= (apply!651 lt!415411 k0!1099) lt!415415)))

(declare-fun lt!415421 () V!31231)

(declare-fun lt!415408 () Unit!31125)

(declare-fun addApplyDifferent!368 (ListLongMap!11649 (_ BitVec 64) V!31231 (_ BitVec 64)) Unit!31125)

(assert (=> b!924175 (= lt!415408 (addApplyDifferent!368 lt!415418 lt!415412 lt!415421 k0!1099))))

(assert (=> b!924175 (not (= lt!415412 k0!1099))))

(declare-fun lt!415410 () Unit!31125)

(declare-datatypes ((List!18742 0))(
  ( (Nil!18739) (Cons!18738 (h!19884 (_ BitVec 64)) (t!26654 List!18742)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55343 (_ BitVec 64) (_ BitVec 32) List!18742) Unit!31125)

(assert (=> b!924175 (= lt!415410 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18739))))

(assert (=> b!924175 e!518595))

(declare-fun c!96355 () Bool)

(assert (=> b!924175 (= c!96355 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415417 () Unit!31125)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!228 (array!55343 array!55345 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 64) (_ BitVec 32) Int) Unit!31125)

(assert (=> b!924175 (= lt!415417 (lemmaListMapContainsThenArrayContainsFrom!228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55343 (_ BitVec 32) List!18742) Bool)

(assert (=> b!924175 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18739)))

(declare-fun lt!415414 () Unit!31125)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55343 (_ BitVec 32) (_ BitVec 32)) Unit!31125)

(assert (=> b!924175 (= lt!415414 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924175 (contains!4853 lt!415411 k0!1099)))

(declare-fun lt!415413 () tuple2!12962)

(declare-fun +!2740 (ListLongMap!11649 tuple2!12962) ListLongMap!11649)

(assert (=> b!924175 (= lt!415411 (+!2740 lt!415418 lt!415413))))

(declare-fun lt!415420 () Unit!31125)

(declare-fun addStillContains!437 (ListLongMap!11649 (_ BitVec 64) V!31231 (_ BitVec 64)) Unit!31125)

(assert (=> b!924175 (= lt!415420 (addStillContains!437 lt!415418 lt!415412 lt!415421 k0!1099))))

(assert (=> b!924175 (= (getCurrentListMap!3027 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2740 (getCurrentListMap!3027 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415413))))

(assert (=> b!924175 (= lt!415413 (tuple2!12963 lt!415412 lt!415421))))

(declare-fun get!13999 (ValueCell!9368 V!31231) V!31231)

(declare-fun dynLambda!1496 (Int (_ BitVec 64)) V!31231)

(assert (=> b!924175 (= lt!415421 (get!13999 (select (arr!26618 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1496 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415419 () Unit!31125)

(declare-fun lemmaListMapRecursiveValidKeyArray!104 (array!55343 array!55345 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 32) Int) Unit!31125)

(assert (=> b!924175 (= lt!415419 (lemmaListMapRecursiveValidKeyArray!104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924175 (= e!518596 lt!415408)))

(declare-fun b!924176 () Bool)

(declare-fun e!518598 () Bool)

(assert (=> b!924176 (= e!518602 e!518598)))

(declare-fun res!623006 () Bool)

(assert (=> b!924176 (=> (not res!623006) (not e!518598))))

(declare-fun lt!415416 () ListLongMap!11649)

(assert (=> b!924176 (= res!623006 (contains!4853 lt!415416 k0!1099))))

(assert (=> b!924176 (= lt!415416 (getCurrentListMap!3027 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924177 () Bool)

(declare-fun e!518593 () Bool)

(assert (=> b!924177 (= e!518603 (and e!518593 mapRes!31305))))

(declare-fun condMapEmpty!31305 () Bool)

(declare-fun mapDefault!31305 () ValueCell!9368)

(assert (=> b!924177 (= condMapEmpty!31305 (= (arr!26618 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9368)) mapDefault!31305)))))

(declare-fun mapNonEmpty!31305 () Bool)

(declare-fun tp!60015 () Bool)

(assert (=> mapNonEmpty!31305 (= mapRes!31305 (and tp!60015 e!518600))))

(declare-fun mapKey!31305 () (_ BitVec 32))

(declare-fun mapRest!31305 () (Array (_ BitVec 32) ValueCell!9368))

(declare-fun mapValue!31305 () ValueCell!9368)

(assert (=> mapNonEmpty!31305 (= (arr!26618 _values!1231) (store mapRest!31305 mapKey!31305 mapValue!31305))))

(declare-fun b!924178 () Bool)

(declare-fun arrayContainsKey!0 (array!55343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924178 (= e!518595 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!924179 () Bool)

(assert (=> b!924179 (= e!518599 e!518604)))

(declare-fun res!623002 () Bool)

(assert (=> b!924179 (=> (not res!623002) (not e!518604))))

(declare-fun v!791 () V!31231)

(assert (=> b!924179 (= res!623002 (and (= lt!415415 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924179 (= lt!415415 (apply!651 lt!415418 k0!1099))))

(declare-fun b!924180 () Bool)

(declare-fun res!623000 () Bool)

(assert (=> b!924180 (=> (not res!623000) (not e!518601))))

(assert (=> b!924180 (= res!623000 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18739))))

(declare-fun b!924181 () Bool)

(assert (=> b!924181 (= e!518593 tp_is_empty!19699)))

(declare-fun b!924182 () Bool)

(assert (=> b!924182 (= e!518598 false)))

(declare-fun lt!415409 () V!31231)

(assert (=> b!924182 (= lt!415409 (apply!651 lt!415416 k0!1099))))

(declare-fun b!924183 () Bool)

(declare-fun Unit!31128 () Unit!31125)

(assert (=> b!924183 (= e!518594 Unit!31128)))

(assert (= (and start!78960 res!622999) b!924172))

(assert (= (and b!924172 res!623005) b!924170))

(assert (= (and b!924170 res!623001) b!924180))

(assert (= (and b!924180 res!623000) b!924171))

(assert (= (and b!924171 res!623004) b!924173))

(assert (= (and b!924173 res!622998) b!924179))

(assert (= (and b!924179 res!623002) b!924168))

(assert (= (and b!924168 c!96353) b!924167))

(assert (= (and b!924168 (not c!96353)) b!924183))

(assert (= (and b!924167 c!96354) b!924175))

(assert (= (and b!924167 (not c!96354)) b!924174))

(assert (= (and b!924175 c!96355) b!924178))

(assert (= (and b!924175 (not c!96355)) b!924166))

(assert (= (and b!924168 res!623003) b!924176))

(assert (= (and b!924176 res!623006) b!924182))

(assert (= (and b!924177 condMapEmpty!31305) mapIsEmpty!31305))

(assert (= (and b!924177 (not condMapEmpty!31305)) mapNonEmpty!31305))

(get-info :version)

(assert (= (and mapNonEmpty!31305 ((_ is ValueCellFull!9368) mapValue!31305)) b!924169))

(assert (= (and b!924177 ((_ is ValueCellFull!9368) mapDefault!31305)) b!924181))

(assert (= start!78960 b!924177))

(declare-fun b_lambda!13675 () Bool)

(assert (=> (not b_lambda!13675) (not b!924175)))

(declare-fun t!26652 () Bool)

(declare-fun tb!5763 () Bool)

(assert (=> (and start!78960 (= defaultEntry!1235 defaultEntry!1235) t!26652) tb!5763))

(declare-fun result!11357 () Bool)

(assert (=> tb!5763 (= result!11357 tp_is_empty!19699)))

(assert (=> b!924175 t!26652))

(declare-fun b_and!28095 () Bool)

(assert (= b_and!28093 (and (=> t!26652 result!11357) b_and!28095)))

(declare-fun m!857953 () Bool)

(assert (=> b!924168 m!857953))

(declare-fun m!857955 () Bool)

(assert (=> b!924178 m!857955))

(declare-fun m!857957 () Bool)

(assert (=> b!924179 m!857957))

(declare-fun m!857959 () Bool)

(assert (=> start!78960 m!857959))

(declare-fun m!857961 () Bool)

(assert (=> start!78960 m!857961))

(declare-fun m!857963 () Bool)

(assert (=> start!78960 m!857963))

(declare-fun m!857965 () Bool)

(assert (=> b!924173 m!857965))

(declare-fun m!857967 () Bool)

(assert (=> b!924173 m!857967))

(declare-fun m!857969 () Bool)

(assert (=> b!924170 m!857969))

(declare-fun m!857971 () Bool)

(assert (=> b!924175 m!857971))

(declare-fun m!857973 () Bool)

(assert (=> b!924175 m!857973))

(declare-fun m!857975 () Bool)

(assert (=> b!924175 m!857975))

(declare-fun m!857977 () Bool)

(assert (=> b!924175 m!857977))

(declare-fun m!857979 () Bool)

(assert (=> b!924175 m!857979))

(declare-fun m!857981 () Bool)

(assert (=> b!924175 m!857981))

(declare-fun m!857983 () Bool)

(assert (=> b!924175 m!857983))

(assert (=> b!924175 m!857979))

(assert (=> b!924175 m!857983))

(declare-fun m!857985 () Bool)

(assert (=> b!924175 m!857985))

(declare-fun m!857987 () Bool)

(assert (=> b!924175 m!857987))

(declare-fun m!857989 () Bool)

(assert (=> b!924175 m!857989))

(declare-fun m!857991 () Bool)

(assert (=> b!924175 m!857991))

(declare-fun m!857993 () Bool)

(assert (=> b!924175 m!857993))

(declare-fun m!857995 () Bool)

(assert (=> b!924175 m!857995))

(assert (=> b!924175 m!857971))

(declare-fun m!857997 () Bool)

(assert (=> b!924175 m!857997))

(declare-fun m!857999 () Bool)

(assert (=> b!924175 m!857999))

(declare-fun m!858001 () Bool)

(assert (=> b!924175 m!858001))

(declare-fun m!858003 () Bool)

(assert (=> b!924167 m!858003))

(declare-fun m!858005 () Bool)

(assert (=> b!924167 m!858005))

(declare-fun m!858007 () Bool)

(assert (=> b!924176 m!858007))

(assert (=> b!924176 m!857995))

(declare-fun m!858009 () Bool)

(assert (=> b!924180 m!858009))

(declare-fun m!858011 () Bool)

(assert (=> b!924182 m!858011))

(declare-fun m!858013 () Bool)

(assert (=> mapNonEmpty!31305 m!858013))

(check-sat (not start!78960) (not b!924179) (not b!924180) (not b!924167) (not mapNonEmpty!31305) b_and!28095 (not b_lambda!13675) (not b!924168) (not b_next!17191) (not b!924182) (not b!924173) (not b!924175) tp_is_empty!19699 (not b!924178) (not b!924170) (not b!924176))
(check-sat b_and!28095 (not b_next!17191))
