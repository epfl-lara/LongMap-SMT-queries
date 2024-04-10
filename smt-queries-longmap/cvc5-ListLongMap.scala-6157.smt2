; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79050 () Bool)

(assert start!79050)

(declare-fun b_free!17263 () Bool)

(declare-fun b_next!17263 () Bool)

(assert (=> start!79050 (= b_free!17263 (not b_next!17263))))

(declare-fun tp!60230 () Bool)

(declare-fun b_and!28263 () Bool)

(assert (=> start!79050 (= tp!60230 b_and!28263)))

(declare-fun b!926569 () Bool)

(declare-datatypes ((V!31327 0))(
  ( (V!31328 (val!9936 Int)) )
))
(declare-datatypes ((tuple2!12964 0))(
  ( (tuple2!12965 (_1!6493 (_ BitVec 64)) (_2!6493 V!31327)) )
))
(declare-datatypes ((List!18765 0))(
  ( (Nil!18762) (Cons!18761 (h!19907 tuple2!12964) (t!26758 List!18765)) )
))
(declare-datatypes ((ListLongMap!11661 0))(
  ( (ListLongMap!11662 (toList!5846 List!18765)) )
))
(declare-fun lt!417338 () ListLongMap!11661)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!417348 () V!31327)

(declare-fun apply!676 (ListLongMap!11661 (_ BitVec 64)) V!31327)

(assert (=> b!926569 (= (apply!676 lt!417338 k!1099) lt!417348)))

(declare-fun lt!417346 () (_ BitVec 64))

(declare-datatypes ((Unit!31325 0))(
  ( (Unit!31326) )
))
(declare-fun lt!417342 () Unit!31325)

(declare-fun lt!417344 () V!31327)

(declare-fun lt!417337 () ListLongMap!11661)

(declare-fun addApplyDifferent!395 (ListLongMap!11661 (_ BitVec 64) V!31327 (_ BitVec 64)) Unit!31325)

(assert (=> b!926569 (= lt!417342 (addApplyDifferent!395 lt!417337 lt!417346 lt!417344 k!1099))))

(assert (=> b!926569 (not (= lt!417346 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417341 () Unit!31325)

(declare-datatypes ((array!55506 0))(
  ( (array!55507 (arr!26698 (Array (_ BitVec 32) (_ BitVec 64))) (size!27157 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55506)

(declare-datatypes ((List!18766 0))(
  ( (Nil!18763) (Cons!18762 (h!19908 (_ BitVec 64)) (t!26759 List!18766)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55506 (_ BitVec 64) (_ BitVec 32) List!18766) Unit!31325)

(assert (=> b!926569 (= lt!417341 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18763))))

(declare-fun e!520113 () Bool)

(assert (=> b!926569 e!520113))

(declare-fun c!96743 () Bool)

(assert (=> b!926569 (= c!96743 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9404 0))(
  ( (ValueCellFull!9404 (v!12454 V!31327)) (EmptyCell!9404) )
))
(declare-datatypes ((array!55508 0))(
  ( (array!55509 (arr!26699 (Array (_ BitVec 32) ValueCell!9404)) (size!27158 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55508)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!417340 () Unit!31325)

(declare-fun zeroValue!1173 () V!31327)

(declare-fun minValue!1173 () V!31327)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!246 (array!55506 array!55508 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 64) (_ BitVec 32) Int) Unit!31325)

(assert (=> b!926569 (= lt!417340 (lemmaListMapContainsThenArrayContainsFrom!246 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55506 (_ BitVec 32) List!18766) Bool)

(assert (=> b!926569 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18763)))

(declare-fun lt!417349 () Unit!31325)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55506 (_ BitVec 32) (_ BitVec 32)) Unit!31325)

(assert (=> b!926569 (= lt!417349 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4905 (ListLongMap!11661 (_ BitVec 64)) Bool)

(assert (=> b!926569 (contains!4905 lt!417338 k!1099)))

(declare-fun lt!417345 () tuple2!12964)

(declare-fun +!2739 (ListLongMap!11661 tuple2!12964) ListLongMap!11661)

(assert (=> b!926569 (= lt!417338 (+!2739 lt!417337 lt!417345))))

(declare-fun lt!417343 () Unit!31325)

(declare-fun addStillContains!463 (ListLongMap!11661 (_ BitVec 64) V!31327 (_ BitVec 64)) Unit!31325)

(assert (=> b!926569 (= lt!417343 (addStillContains!463 lt!417337 lt!417346 lt!417344 k!1099))))

(declare-fun getCurrentListMap!3096 (array!55506 array!55508 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 32) Int) ListLongMap!11661)

(assert (=> b!926569 (= (getCurrentListMap!3096 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2739 (getCurrentListMap!3096 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417345))))

(assert (=> b!926569 (= lt!417345 (tuple2!12965 lt!417346 lt!417344))))

(declare-fun get!14050 (ValueCell!9404 V!31327) V!31327)

(declare-fun dynLambda!1528 (Int (_ BitVec 64)) V!31327)

(assert (=> b!926569 (= lt!417344 (get!14050 (select (arr!26699 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1528 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417352 () Unit!31325)

(declare-fun lemmaListMapRecursiveValidKeyArray!129 (array!55506 array!55508 (_ BitVec 32) (_ BitVec 32) V!31327 V!31327 (_ BitVec 32) Int) Unit!31325)

(assert (=> b!926569 (= lt!417352 (lemmaListMapRecursiveValidKeyArray!129 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520114 () Unit!31325)

(assert (=> b!926569 (= e!520114 lt!417342)))

(declare-fun b!926570 () Bool)

(assert (=> b!926570 (= e!520113 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926571 () Bool)

(declare-fun res!624230 () Bool)

(declare-fun e!520119 () Bool)

(assert (=> b!926571 (=> (not res!624230) (not e!520119))))

(assert (=> b!926571 (= res!624230 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18763))))

(declare-fun b!926572 () Bool)

(declare-fun Unit!31327 () Unit!31325)

(assert (=> b!926572 (= e!520114 Unit!31327)))

(declare-fun b!926573 () Bool)

(declare-fun e!520117 () Bool)

(declare-fun tp_is_empty!19771 () Bool)

(assert (=> b!926573 (= e!520117 tp_is_empty!19771)))

(declare-fun res!624233 () Bool)

(assert (=> start!79050 (=> (not res!624233) (not e!520119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79050 (= res!624233 (validMask!0 mask!1881))))

(assert (=> start!79050 e!520119))

(assert (=> start!79050 true))

(assert (=> start!79050 tp_is_empty!19771))

(declare-fun e!520123 () Bool)

(declare-fun array_inv!20792 (array!55508) Bool)

(assert (=> start!79050 (and (array_inv!20792 _values!1231) e!520123)))

(assert (=> start!79050 tp!60230))

(declare-fun array_inv!20793 (array!55506) Bool)

(assert (=> start!79050 (array_inv!20793 _keys!1487)))

(declare-fun b!926574 () Bool)

(declare-fun e!520122 () Unit!31325)

(assert (=> b!926574 (= e!520122 e!520114)))

(assert (=> b!926574 (= lt!417346 (select (arr!26698 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96742 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926574 (= c!96742 (validKeyInArray!0 lt!417346))))

(declare-fun b!926575 () Bool)

(declare-fun e!520118 () Bool)

(declare-fun e!520111 () Bool)

(assert (=> b!926575 (= e!520118 e!520111)))

(declare-fun res!624234 () Bool)

(assert (=> b!926575 (=> (not res!624234) (not e!520111))))

(assert (=> b!926575 (= res!624234 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27157 _keys!1487)))))

(declare-fun lt!417351 () Unit!31325)

(assert (=> b!926575 (= lt!417351 e!520122)))

(declare-fun c!96744 () Bool)

(assert (=> b!926575 (= c!96744 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!31413 () Bool)

(declare-fun mapRes!31413 () Bool)

(declare-fun tp!60229 () Bool)

(assert (=> mapNonEmpty!31413 (= mapRes!31413 (and tp!60229 e!520117))))

(declare-fun mapRest!31413 () (Array (_ BitVec 32) ValueCell!9404))

(declare-fun mapKey!31413 () (_ BitVec 32))

(declare-fun mapValue!31413 () ValueCell!9404)

(assert (=> mapNonEmpty!31413 (= (arr!26699 _values!1231) (store mapRest!31413 mapKey!31413 mapValue!31413))))

(declare-fun b!926576 () Bool)

(declare-fun res!624237 () Bool)

(assert (=> b!926576 (=> (not res!624237) (not e!520119))))

(assert (=> b!926576 (= res!624237 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27157 _keys!1487))))))

(declare-fun b!926577 () Bool)

(declare-fun e!520116 () Bool)

(assert (=> b!926577 (= e!520116 tp_is_empty!19771)))

(declare-fun b!926578 () Bool)

(declare-fun arrayContainsKey!0 (array!55506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926578 (= e!520113 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!926579 () Bool)

(declare-fun res!624238 () Bool)

(assert (=> b!926579 (=> (not res!624238) (not e!520119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55506 (_ BitVec 32)) Bool)

(assert (=> b!926579 (= res!624238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926580 () Bool)

(declare-fun Unit!31328 () Unit!31325)

(assert (=> b!926580 (= e!520122 Unit!31328)))

(declare-fun b!926581 () Bool)

(assert (=> b!926581 (= e!520123 (and e!520116 mapRes!31413))))

(declare-fun condMapEmpty!31413 () Bool)

(declare-fun mapDefault!31413 () ValueCell!9404)

