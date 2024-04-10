; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78932 () Bool)

(assert start!78932)

(declare-fun b_free!17145 () Bool)

(declare-fun b_next!17145 () Bool)

(assert (=> start!78932 (= b_free!17145 (not b_next!17145))))

(declare-fun tp!59876 () Bool)

(declare-fun b_and!28027 () Bool)

(assert (=> start!78932 (= tp!59876 b_and!28027)))

(declare-fun b!923129 () Bool)

(declare-fun res!622486 () Bool)

(declare-fun e!517933 () Bool)

(assert (=> b!923129 (=> (not res!622486) (not e!517933))))

(declare-datatypes ((array!55282 0))(
  ( (array!55283 (arr!26586 (Array (_ BitVec 32) (_ BitVec 64))) (size!27045 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55282)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31169 0))(
  ( (V!31170 (val!9877 Int)) )
))
(declare-datatypes ((ValueCell!9345 0))(
  ( (ValueCellFull!9345 (v!12395 V!31169)) (EmptyCell!9345) )
))
(declare-datatypes ((array!55284 0))(
  ( (array!55285 (arr!26587 (Array (_ BitVec 32) ValueCell!9345)) (size!27046 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55284)

(assert (=> b!923129 (= res!622486 (and (= (size!27046 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27045 _keys!1487) (size!27046 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31236 () Bool)

(declare-fun mapRes!31236 () Bool)

(declare-fun tp!59875 () Bool)

(declare-fun e!517930 () Bool)

(assert (=> mapNonEmpty!31236 (= mapRes!31236 (and tp!59875 e!517930))))

(declare-fun mapValue!31236 () ValueCell!9345)

(declare-fun mapRest!31236 () (Array (_ BitVec 32) ValueCell!9345))

(declare-fun mapKey!31236 () (_ BitVec 32))

(assert (=> mapNonEmpty!31236 (= (arr!26587 _values!1231) (store mapRest!31236 mapKey!31236 mapValue!31236))))

(declare-fun b!923130 () Bool)

(declare-fun res!622492 () Bool)

(assert (=> b!923130 (=> (not res!622492) (not e!517933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55282 (_ BitVec 32)) Bool)

(assert (=> b!923130 (= res!622492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31236 () Bool)

(assert (=> mapIsEmpty!31236 mapRes!31236))

(declare-fun b!923131 () Bool)

(declare-fun tp_is_empty!19653 () Bool)

(assert (=> b!923131 (= e!517930 tp_is_empty!19653)))

(declare-fun b!923132 () Bool)

(declare-fun res!622488 () Bool)

(declare-fun e!517931 () Bool)

(assert (=> b!923132 (=> (not res!622488) (not e!517931))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31169)

(declare-datatypes ((tuple2!12854 0))(
  ( (tuple2!12855 (_1!6438 (_ BitVec 64)) (_2!6438 V!31169)) )
))
(declare-datatypes ((List!18660 0))(
  ( (Nil!18657) (Cons!18656 (h!19802 tuple2!12854) (t!26535 List!18660)) )
))
(declare-datatypes ((ListLongMap!11551 0))(
  ( (ListLongMap!11552 (toList!5791 List!18660)) )
))
(declare-fun lt!414640 () ListLongMap!11551)

(declare-fun apply!622 (ListLongMap!11551 (_ BitVec 64)) V!31169)

(assert (=> b!923132 (= res!622488 (= (apply!622 lt!414640 k0!1099) v!791))))

(declare-fun b!923133 () Bool)

(declare-fun e!517935 () Bool)

(assert (=> b!923133 (= e!517935 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923134 () Bool)

(declare-fun e!517929 () Bool)

(declare-fun e!517932 () Bool)

(assert (=> b!923134 (= e!517929 (and e!517932 mapRes!31236))))

(declare-fun condMapEmpty!31236 () Bool)

(declare-fun mapDefault!31236 () ValueCell!9345)

(assert (=> b!923134 (= condMapEmpty!31236 (= (arr!26587 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9345)) mapDefault!31236)))))

(declare-fun b!923135 () Bool)

(declare-fun e!517936 () Bool)

(assert (=> b!923135 (= e!517931 e!517936)))

(declare-fun res!622490 () Bool)

(assert (=> b!923135 (=> (not res!622490) (not e!517936))))

(declare-fun lt!414639 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923135 (= res!622490 (validKeyInArray!0 lt!414639))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923135 (= lt!414639 (select (arr!26586 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923137 () Bool)

(declare-fun res!622491 () Bool)

(assert (=> b!923137 (=> (not res!622491) (not e!517933))))

(declare-datatypes ((List!18661 0))(
  ( (Nil!18658) (Cons!18657 (h!19803 (_ BitVec 64)) (t!26536 List!18661)) )
))
(declare-fun arrayNoDuplicates!0 (array!55282 (_ BitVec 32) List!18661) Bool)

(assert (=> b!923137 (= res!622491 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18658))))

(declare-fun b!923138 () Bool)

(declare-fun arrayContainsKey!0 (array!55282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923138 (= e!517935 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923139 () Bool)

(declare-fun res!622489 () Bool)

(assert (=> b!923139 (=> (not res!622489) (not e!517931))))

(assert (=> b!923139 (= res!622489 (validKeyInArray!0 k0!1099))))

(declare-fun b!923140 () Bool)

(assert (=> b!923140 (= e!517932 tp_is_empty!19653)))

(declare-fun b!923141 () Bool)

(declare-fun res!622483 () Bool)

(assert (=> b!923141 (=> (not res!622483) (not e!517931))))

(assert (=> b!923141 (= res!622483 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923142 () Bool)

(assert (=> b!923142 (= e!517933 e!517931)))

(declare-fun res!622484 () Bool)

(assert (=> b!923142 (=> (not res!622484) (not e!517931))))

(declare-fun contains!4854 (ListLongMap!11551 (_ BitVec 64)) Bool)

(assert (=> b!923142 (= res!622484 (contains!4854 lt!414640 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31169)

(declare-fun minValue!1173 () V!31169)

(declare-fun getCurrentListMap!3045 (array!55282 array!55284 (_ BitVec 32) (_ BitVec 32) V!31169 V!31169 (_ BitVec 32) Int) ListLongMap!11551)

(assert (=> b!923142 (= lt!414640 (getCurrentListMap!3045 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923143 () Bool)

(declare-fun res!622487 () Bool)

(assert (=> b!923143 (=> (not res!622487) (not e!517933))))

(assert (=> b!923143 (= res!622487 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27045 _keys!1487))))))

(declare-fun res!622485 () Bool)

(assert (=> start!78932 (=> (not res!622485) (not e!517933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78932 (= res!622485 (validMask!0 mask!1881))))

(assert (=> start!78932 e!517933))

(assert (=> start!78932 true))

(assert (=> start!78932 tp_is_empty!19653))

(declare-fun array_inv!20706 (array!55284) Bool)

(assert (=> start!78932 (and (array_inv!20706 _values!1231) e!517929)))

(assert (=> start!78932 tp!59876))

(declare-fun array_inv!20707 (array!55282) Bool)

(assert (=> start!78932 (array_inv!20707 _keys!1487)))

(declare-fun b!923136 () Bool)

(assert (=> b!923136 (= e!517936 (not true))))

(assert (=> b!923136 (not (= lt!414639 k0!1099))))

(declare-datatypes ((Unit!31138 0))(
  ( (Unit!31139) )
))
(declare-fun lt!414638 () Unit!31138)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55282 (_ BitVec 64) (_ BitVec 32) List!18661) Unit!31138)

(assert (=> b!923136 (= lt!414638 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18658))))

(assert (=> b!923136 e!517935))

(declare-fun c!96219 () Bool)

(assert (=> b!923136 (= c!96219 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414634 () Unit!31138)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!202 (array!55282 array!55284 (_ BitVec 32) (_ BitVec 32) V!31169 V!31169 (_ BitVec 64) (_ BitVec 32) Int) Unit!31138)

(assert (=> b!923136 (= lt!414634 (lemmaListMapContainsThenArrayContainsFrom!202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923136 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18658)))

(declare-fun lt!414632 () Unit!31138)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55282 (_ BitVec 32) (_ BitVec 32)) Unit!31138)

(assert (=> b!923136 (= lt!414632 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414637 () tuple2!12854)

(declare-fun +!2695 (ListLongMap!11551 tuple2!12854) ListLongMap!11551)

(assert (=> b!923136 (contains!4854 (+!2695 lt!414640 lt!414637) k0!1099)))

(declare-fun lt!414636 () V!31169)

(declare-fun lt!414633 () Unit!31138)

(declare-fun addStillContains!419 (ListLongMap!11551 (_ BitVec 64) V!31169 (_ BitVec 64)) Unit!31138)

(assert (=> b!923136 (= lt!414633 (addStillContains!419 lt!414640 lt!414639 lt!414636 k0!1099))))

(assert (=> b!923136 (= (getCurrentListMap!3045 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2695 (getCurrentListMap!3045 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414637))))

(assert (=> b!923136 (= lt!414637 (tuple2!12855 lt!414639 lt!414636))))

(declare-fun get!13966 (ValueCell!9345 V!31169) V!31169)

(declare-fun dynLambda!1484 (Int (_ BitVec 64)) V!31169)

(assert (=> b!923136 (= lt!414636 (get!13966 (select (arr!26587 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1484 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414635 () Unit!31138)

(declare-fun lemmaListMapRecursiveValidKeyArray!85 (array!55282 array!55284 (_ BitVec 32) (_ BitVec 32) V!31169 V!31169 (_ BitVec 32) Int) Unit!31138)

(assert (=> b!923136 (= lt!414635 (lemmaListMapRecursiveValidKeyArray!85 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78932 res!622485) b!923129))

(assert (= (and b!923129 res!622486) b!923130))

(assert (= (and b!923130 res!622492) b!923137))

(assert (= (and b!923137 res!622491) b!923143))

(assert (= (and b!923143 res!622487) b!923142))

(assert (= (and b!923142 res!622484) b!923132))

(assert (= (and b!923132 res!622488) b!923141))

(assert (= (and b!923141 res!622483) b!923139))

(assert (= (and b!923139 res!622489) b!923135))

(assert (= (and b!923135 res!622490) b!923136))

(assert (= (and b!923136 c!96219) b!923138))

(assert (= (and b!923136 (not c!96219)) b!923133))

(assert (= (and b!923134 condMapEmpty!31236) mapIsEmpty!31236))

(assert (= (and b!923134 (not condMapEmpty!31236)) mapNonEmpty!31236))

(get-info :version)

(assert (= (and mapNonEmpty!31236 ((_ is ValueCellFull!9345) mapValue!31236)) b!923131))

(assert (= (and b!923134 ((_ is ValueCellFull!9345) mapDefault!31236)) b!923140))

(assert (= start!78932 b!923134))

(declare-fun b_lambda!13647 () Bool)

(assert (=> (not b_lambda!13647) (not b!923136)))

(declare-fun t!26534 () Bool)

(declare-fun tb!5725 () Bool)

(assert (=> (and start!78932 (= defaultEntry!1235 defaultEntry!1235) t!26534) tb!5725))

(declare-fun result!11273 () Bool)

(assert (=> tb!5725 (= result!11273 tp_is_empty!19653)))

(assert (=> b!923136 t!26534))

(declare-fun b_and!28029 () Bool)

(assert (= b_and!28027 (and (=> t!26534 result!11273) b_and!28029)))

(declare-fun m!857301 () Bool)

(assert (=> b!923135 m!857301))

(declare-fun m!857303 () Bool)

(assert (=> b!923135 m!857303))

(declare-fun m!857305 () Bool)

(assert (=> b!923139 m!857305))

(declare-fun m!857307 () Bool)

(assert (=> b!923136 m!857307))

(declare-fun m!857309 () Bool)

(assert (=> b!923136 m!857309))

(declare-fun m!857311 () Bool)

(assert (=> b!923136 m!857311))

(declare-fun m!857313 () Bool)

(assert (=> b!923136 m!857313))

(declare-fun m!857315 () Bool)

(assert (=> b!923136 m!857315))

(declare-fun m!857317 () Bool)

(assert (=> b!923136 m!857317))

(assert (=> b!923136 m!857311))

(assert (=> b!923136 m!857317))

(declare-fun m!857319 () Bool)

(assert (=> b!923136 m!857319))

(declare-fun m!857321 () Bool)

(assert (=> b!923136 m!857321))

(declare-fun m!857323 () Bool)

(assert (=> b!923136 m!857323))

(declare-fun m!857325 () Bool)

(assert (=> b!923136 m!857325))

(declare-fun m!857327 () Bool)

(assert (=> b!923136 m!857327))

(assert (=> b!923136 m!857309))

(declare-fun m!857329 () Bool)

(assert (=> b!923136 m!857329))

(declare-fun m!857331 () Bool)

(assert (=> b!923136 m!857331))

(assert (=> b!923136 m!857313))

(declare-fun m!857333 () Bool)

(assert (=> b!923136 m!857333))

(declare-fun m!857335 () Bool)

(assert (=> start!78932 m!857335))

(declare-fun m!857337 () Bool)

(assert (=> start!78932 m!857337))

(declare-fun m!857339 () Bool)

(assert (=> start!78932 m!857339))

(declare-fun m!857341 () Bool)

(assert (=> b!923137 m!857341))

(declare-fun m!857343 () Bool)

(assert (=> b!923138 m!857343))

(declare-fun m!857345 () Bool)

(assert (=> b!923132 m!857345))

(declare-fun m!857347 () Bool)

(assert (=> b!923142 m!857347))

(declare-fun m!857349 () Bool)

(assert (=> b!923142 m!857349))

(declare-fun m!857351 () Bool)

(assert (=> b!923130 m!857351))

(declare-fun m!857353 () Bool)

(assert (=> mapNonEmpty!31236 m!857353))

(check-sat (not b!923132) (not b!923135) (not b!923138) (not b_lambda!13647) (not b!923137) (not mapNonEmpty!31236) (not b_next!17145) b_and!28029 (not b!923136) tp_is_empty!19653 (not b!923139) (not start!78932) (not b!923142) (not b!923130))
(check-sat b_and!28029 (not b_next!17145))
