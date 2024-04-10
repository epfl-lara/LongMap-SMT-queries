; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79108 () Bool)

(assert start!79108)

(declare-fun b_free!17321 () Bool)

(declare-fun b_next!17321 () Bool)

(assert (=> start!79108 (= b_free!17321 (not b_next!17321))))

(declare-fun tp!60403 () Bool)

(declare-fun b_and!28379 () Bool)

(assert (=> start!79108 (= tp!60403 b_and!28379)))

(declare-fun b!928367 () Bool)

(declare-datatypes ((Unit!31419 0))(
  ( (Unit!31420) )
))
(declare-fun e!521243 () Unit!31419)

(declare-fun Unit!31421 () Unit!31419)

(assert (=> b!928367 (= e!521243 Unit!31421)))

(declare-fun b!928368 () Bool)

(declare-fun e!521252 () Bool)

(declare-fun e!521250 () Bool)

(assert (=> b!928368 (= e!521252 e!521250)))

(declare-fun res!625185 () Bool)

(assert (=> b!928368 (=> (not res!625185) (not e!521250))))

(declare-datatypes ((V!31403 0))(
  ( (V!31404 (val!9965 Int)) )
))
(declare-datatypes ((tuple2!13018 0))(
  ( (tuple2!13019 (_1!6520 (_ BitVec 64)) (_2!6520 V!31403)) )
))
(declare-datatypes ((List!18816 0))(
  ( (Nil!18813) (Cons!18812 (h!19958 tuple2!13018) (t!26867 List!18816)) )
))
(declare-datatypes ((ListLongMap!11715 0))(
  ( (ListLongMap!11716 (toList!5873 List!18816)) )
))
(declare-fun lt!418743 () ListLongMap!11715)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4930 (ListLongMap!11715 (_ BitVec 64)) Bool)

(assert (=> b!928368 (= res!625185 (contains!4930 lt!418743 k!1099))))

(declare-datatypes ((array!55618 0))(
  ( (array!55619 (arr!26754 (Array (_ BitVec 32) (_ BitVec 64))) (size!27213 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55618)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9433 0))(
  ( (ValueCellFull!9433 (v!12483 V!31403)) (EmptyCell!9433) )
))
(declare-datatypes ((array!55620 0))(
  ( (array!55621 (arr!26755 (Array (_ BitVec 32) ValueCell!9433)) (size!27214 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55620)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31403)

(declare-fun minValue!1173 () V!31403)

(declare-fun getCurrentListMap!3121 (array!55618 array!55620 (_ BitVec 32) (_ BitVec 32) V!31403 V!31403 (_ BitVec 32) Int) ListLongMap!11715)

(assert (=> b!928368 (= lt!418743 (getCurrentListMap!3121 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31500 () Bool)

(declare-fun mapRes!31500 () Bool)

(declare-fun tp!60404 () Bool)

(declare-fun e!521249 () Bool)

(assert (=> mapNonEmpty!31500 (= mapRes!31500 (and tp!60404 e!521249))))

(declare-fun mapRest!31500 () (Array (_ BitVec 32) ValueCell!9433))

(declare-fun mapKey!31500 () (_ BitVec 32))

(declare-fun mapValue!31500 () ValueCell!9433)

(assert (=> mapNonEmpty!31500 (= (arr!26755 _values!1231) (store mapRest!31500 mapKey!31500 mapValue!31500))))

(declare-fun b!928369 () Bool)

(declare-fun e!521242 () Bool)

(assert (=> b!928369 (= e!521242 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928370 () Bool)

(declare-fun arrayContainsKey!0 (array!55618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928370 (= e!521242 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!928371 () Bool)

(declare-fun lt!418740 () ListLongMap!11715)

(declare-fun lt!418736 () V!31403)

(declare-fun apply!703 (ListLongMap!11715 (_ BitVec 64)) V!31403)

(assert (=> b!928371 (= (apply!703 lt!418740 k!1099) lt!418736)))

(declare-fun lt!418739 () (_ BitVec 64))

(declare-fun lt!418734 () V!31403)

(declare-fun lt!418741 () Unit!31419)

(declare-fun lt!418733 () ListLongMap!11715)

(declare-fun addApplyDifferent!415 (ListLongMap!11715 (_ BitVec 64) V!31403 (_ BitVec 64)) Unit!31419)

(assert (=> b!928371 (= lt!418741 (addApplyDifferent!415 lt!418733 lt!418739 lt!418734 k!1099))))

(assert (=> b!928371 (not (= lt!418739 k!1099))))

(declare-fun lt!418731 () Unit!31419)

(declare-datatypes ((List!18817 0))(
  ( (Nil!18814) (Cons!18813 (h!19959 (_ BitVec 64)) (t!26868 List!18817)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55618 (_ BitVec 64) (_ BitVec 32) List!18817) Unit!31419)

(assert (=> b!928371 (= lt!418731 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18814))))

(assert (=> b!928371 e!521242))

(declare-fun c!97003 () Bool)

(assert (=> b!928371 (= c!97003 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418732 () Unit!31419)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!266 (array!55618 array!55620 (_ BitVec 32) (_ BitVec 32) V!31403 V!31403 (_ BitVec 64) (_ BitVec 32) Int) Unit!31419)

(assert (=> b!928371 (= lt!418732 (lemmaListMapContainsThenArrayContainsFrom!266 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55618 (_ BitVec 32) List!18817) Bool)

(assert (=> b!928371 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18814)))

(declare-fun lt!418735 () Unit!31419)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55618 (_ BitVec 32) (_ BitVec 32)) Unit!31419)

(assert (=> b!928371 (= lt!418735 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928371 (contains!4930 lt!418740 k!1099)))

(declare-fun lt!418742 () tuple2!13018)

(declare-fun +!2759 (ListLongMap!11715 tuple2!13018) ListLongMap!11715)

(assert (=> b!928371 (= lt!418740 (+!2759 lt!418733 lt!418742))))

(declare-fun lt!418738 () Unit!31419)

(declare-fun addStillContains!483 (ListLongMap!11715 (_ BitVec 64) V!31403 (_ BitVec 64)) Unit!31419)

(assert (=> b!928371 (= lt!418738 (addStillContains!483 lt!418733 lt!418739 lt!418734 k!1099))))

(assert (=> b!928371 (= (getCurrentListMap!3121 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2759 (getCurrentListMap!3121 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418742))))

(assert (=> b!928371 (= lt!418742 (tuple2!13019 lt!418739 lt!418734))))

(declare-fun get!14088 (ValueCell!9433 V!31403) V!31403)

(declare-fun dynLambda!1548 (Int (_ BitVec 64)) V!31403)

(assert (=> b!928371 (= lt!418734 (get!14088 (select (arr!26755 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1548 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418744 () Unit!31419)

(declare-fun lemmaListMapRecursiveValidKeyArray!149 (array!55618 array!55620 (_ BitVec 32) (_ BitVec 32) V!31403 V!31403 (_ BitVec 32) Int) Unit!31419)

(assert (=> b!928371 (= lt!418744 (lemmaListMapRecursiveValidKeyArray!149 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!521245 () Unit!31419)

(assert (=> b!928371 (= e!521245 lt!418741)))

(declare-fun b!928372 () Bool)

(declare-fun res!625188 () Bool)

(declare-fun e!521248 () Bool)

(assert (=> b!928372 (=> (not res!625188) (not e!521248))))

(assert (=> b!928372 (= res!625188 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27213 _keys!1487))))))

(declare-fun b!928373 () Bool)

(declare-fun res!625187 () Bool)

(assert (=> b!928373 (=> (not res!625187) (not e!521250))))

(declare-fun v!791 () V!31403)

(assert (=> b!928373 (= res!625187 (= (apply!703 lt!418743 k!1099) v!791))))

(declare-fun b!928374 () Bool)

(declare-fun lt!418737 () ListLongMap!11715)

(declare-fun e!521251 () Bool)

(assert (=> b!928374 (= e!521251 (= (apply!703 lt!418737 k!1099) v!791))))

(declare-fun b!928375 () Bool)

(declare-fun tp_is_empty!19829 () Bool)

(assert (=> b!928375 (= e!521249 tp_is_empty!19829)))

(declare-fun b!928376 () Bool)

(declare-fun Unit!31422 () Unit!31419)

(assert (=> b!928376 (= e!521245 Unit!31422)))

(declare-fun b!928377 () Bool)

(assert (=> b!928377 (= e!521243 e!521245)))

(assert (=> b!928377 (= lt!418739 (select (arr!26754 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97004 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928377 (= c!97004 (validKeyInArray!0 lt!418739))))

(declare-fun b!928378 () Bool)

(assert (=> b!928378 (= e!521250 (not (bvsle #b00000000000000000000000000000000 (size!27213 _keys!1487))))))

(assert (=> b!928378 e!521251))

(declare-fun res!625193 () Bool)

(assert (=> b!928378 (=> (not res!625193) (not e!521251))))

(assert (=> b!928378 (= res!625193 (contains!4930 lt!418737 k!1099))))

(assert (=> b!928378 (= lt!418737 (getCurrentListMap!3121 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418730 () Unit!31419)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!100 (array!55618 array!55620 (_ BitVec 32) (_ BitVec 32) V!31403 V!31403 (_ BitVec 64) V!31403 (_ BitVec 32) Int) Unit!31419)

(assert (=> b!928378 (= lt!418730 (lemmaListMapApplyFromThenApplyFromZero!100 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928379 () Bool)

(declare-fun res!625191 () Bool)

(assert (=> b!928379 (=> (not res!625191) (not e!521248))))

(assert (=> b!928379 (= res!625191 (and (= (size!27214 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27213 _keys!1487) (size!27214 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928380 () Bool)

(declare-fun res!625192 () Bool)

(assert (=> b!928380 (=> (not res!625192) (not e!521248))))

(assert (=> b!928380 (= res!625192 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18814))))

(declare-fun b!928381 () Bool)

(declare-fun e!521253 () Bool)

(assert (=> b!928381 (= e!521248 e!521253)))

(declare-fun res!625189 () Bool)

(assert (=> b!928381 (=> (not res!625189) (not e!521253))))

(assert (=> b!928381 (= res!625189 (contains!4930 lt!418733 k!1099))))

(assert (=> b!928381 (= lt!418733 (getCurrentListMap!3121 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928382 () Bool)

(declare-fun e!521244 () Bool)

(declare-fun e!521246 () Bool)

(assert (=> b!928382 (= e!521244 (and e!521246 mapRes!31500))))

(declare-fun condMapEmpty!31500 () Bool)

(declare-fun mapDefault!31500 () ValueCell!9433)

