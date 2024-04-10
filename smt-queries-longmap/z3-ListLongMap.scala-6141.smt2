; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78956 () Bool)

(assert start!78956)

(declare-fun b_free!17169 () Bool)

(declare-fun b_next!17169 () Bool)

(assert (=> start!78956 (= b_free!17169 (not b_next!17169))))

(declare-fun tp!59948 () Bool)

(declare-fun b_and!28075 () Bool)

(assert (=> start!78956 (= tp!59948 b_and!28075)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!518354 () Bool)

(declare-fun b!923789 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55328 0))(
  ( (array!55329 (arr!26609 (Array (_ BitVec 32) (_ BitVec 64))) (size!27068 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55328)

(declare-fun arrayContainsKey!0 (array!55328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923789 (= e!518354 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923790 () Bool)

(declare-fun res!622815 () Bool)

(declare-fun e!518347 () Bool)

(assert (=> b!923790 (=> (not res!622815) (not e!518347))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55328 (_ BitVec 32)) Bool)

(assert (=> b!923790 (= res!622815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31272 () Bool)

(declare-fun mapRes!31272 () Bool)

(declare-fun tp!59947 () Bool)

(declare-fun e!518351 () Bool)

(assert (=> mapNonEmpty!31272 (= mapRes!31272 (and tp!59947 e!518351))))

(declare-datatypes ((V!31201 0))(
  ( (V!31202 (val!9889 Int)) )
))
(declare-datatypes ((ValueCell!9357 0))(
  ( (ValueCellFull!9357 (v!12407 V!31201)) (EmptyCell!9357) )
))
(declare-fun mapValue!31272 () ValueCell!9357)

(declare-fun mapKey!31272 () (_ BitVec 32))

(declare-fun mapRest!31272 () (Array (_ BitVec 32) ValueCell!9357))

(declare-datatypes ((array!55330 0))(
  ( (array!55331 (arr!26610 (Array (_ BitVec 32) ValueCell!9357)) (size!27069 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55330)

(assert (=> mapNonEmpty!31272 (= (arr!26610 _values!1231) (store mapRest!31272 mapKey!31272 mapValue!31272))))

(declare-fun b!923791 () Bool)

(declare-datatypes ((tuple2!12878 0))(
  ( (tuple2!12879 (_1!6450 (_ BitVec 64)) (_2!6450 V!31201)) )
))
(declare-datatypes ((List!18682 0))(
  ( (Nil!18679) (Cons!18678 (h!19824 tuple2!12878) (t!26581 List!18682)) )
))
(declare-datatypes ((ListLongMap!11575 0))(
  ( (ListLongMap!11576 (toList!5803 List!18682)) )
))
(declare-fun lt!415154 () ListLongMap!11575)

(declare-fun lt!415158 () V!31201)

(declare-fun apply!633 (ListLongMap!11575 (_ BitVec 64)) V!31201)

(assert (=> b!923791 (= (apply!633 lt!415154 k0!1099) lt!415158)))

(declare-fun lt!415161 () ListLongMap!11575)

(declare-fun lt!415155 () V!31201)

(declare-datatypes ((Unit!31175 0))(
  ( (Unit!31176) )
))
(declare-fun lt!415153 () Unit!31175)

(declare-fun lt!415148 () (_ BitVec 64))

(declare-fun addApplyDifferent!359 (ListLongMap!11575 (_ BitVec 64) V!31201 (_ BitVec 64)) Unit!31175)

(assert (=> b!923791 (= lt!415153 (addApplyDifferent!359 lt!415161 lt!415148 lt!415155 k0!1099))))

(assert (=> b!923791 (not (= lt!415148 k0!1099))))

(declare-fun lt!415149 () Unit!31175)

(declare-datatypes ((List!18683 0))(
  ( (Nil!18680) (Cons!18679 (h!19825 (_ BitVec 64)) (t!26582 List!18683)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55328 (_ BitVec 64) (_ BitVec 32) List!18683) Unit!31175)

(assert (=> b!923791 (= lt!415149 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18680))))

(assert (=> b!923791 e!518354))

(declare-fun c!96320 () Bool)

(assert (=> b!923791 (= c!96320 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415150 () Unit!31175)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31201)

(declare-fun minValue!1173 () V!31201)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!210 (array!55328 array!55330 (_ BitVec 32) (_ BitVec 32) V!31201 V!31201 (_ BitVec 64) (_ BitVec 32) Int) Unit!31175)

(assert (=> b!923791 (= lt!415150 (lemmaListMapContainsThenArrayContainsFrom!210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55328 (_ BitVec 32) List!18683) Bool)

(assert (=> b!923791 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18680)))

(declare-fun lt!415162 () Unit!31175)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55328 (_ BitVec 32) (_ BitVec 32)) Unit!31175)

(assert (=> b!923791 (= lt!415162 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4865 (ListLongMap!11575 (_ BitVec 64)) Bool)

(assert (=> b!923791 (contains!4865 lt!415154 k0!1099)))

(declare-fun lt!415157 () tuple2!12878)

(declare-fun +!2703 (ListLongMap!11575 tuple2!12878) ListLongMap!11575)

(assert (=> b!923791 (= lt!415154 (+!2703 lt!415161 lt!415157))))

(declare-fun lt!415151 () Unit!31175)

(declare-fun addStillContains!427 (ListLongMap!11575 (_ BitVec 64) V!31201 (_ BitVec 64)) Unit!31175)

(assert (=> b!923791 (= lt!415151 (addStillContains!427 lt!415161 lt!415148 lt!415155 k0!1099))))

(declare-fun getCurrentListMap!3056 (array!55328 array!55330 (_ BitVec 32) (_ BitVec 32) V!31201 V!31201 (_ BitVec 32) Int) ListLongMap!11575)

(assert (=> b!923791 (= (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2703 (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415157))))

(assert (=> b!923791 (= lt!415157 (tuple2!12879 lt!415148 lt!415155))))

(declare-fun get!13982 (ValueCell!9357 V!31201) V!31201)

(declare-fun dynLambda!1492 (Int (_ BitVec 64)) V!31201)

(assert (=> b!923791 (= lt!415155 (get!13982 (select (arr!26610 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1492 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415156 () Unit!31175)

(declare-fun lemmaListMapRecursiveValidKeyArray!93 (array!55328 array!55330 (_ BitVec 32) (_ BitVec 32) V!31201 V!31201 (_ BitVec 32) Int) Unit!31175)

(assert (=> b!923791 (= lt!415156 (lemmaListMapRecursiveValidKeyArray!93 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518356 () Unit!31175)

(assert (=> b!923791 (= e!518356 lt!415153)))

(declare-fun b!923792 () Bool)

(declare-fun tp_is_empty!19677 () Bool)

(assert (=> b!923792 (= e!518351 tp_is_empty!19677)))

(declare-fun b!923794 () Bool)

(declare-fun e!518353 () Bool)

(assert (=> b!923794 (= e!518353 tp_is_empty!19677)))

(declare-fun b!923795 () Bool)

(declare-fun e!518348 () Bool)

(assert (=> b!923795 (= e!518348 false)))

(declare-fun lt!415159 () V!31201)

(declare-fun lt!415152 () ListLongMap!11575)

(assert (=> b!923795 (= lt!415159 (apply!633 lt!415152 k0!1099))))

(declare-fun b!923796 () Bool)

(declare-fun e!518355 () Bool)

(declare-fun e!518346 () Bool)

(assert (=> b!923796 (= e!518355 e!518346)))

(declare-fun res!622812 () Bool)

(assert (=> b!923796 (=> (not res!622812) (not e!518346))))

(assert (=> b!923796 (= res!622812 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27068 _keys!1487)))))

(declare-fun lt!415160 () Unit!31175)

(declare-fun e!518352 () Unit!31175)

(assert (=> b!923796 (= lt!415160 e!518352)))

(declare-fun c!96321 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923796 (= c!96321 (validKeyInArray!0 k0!1099))))

(declare-fun b!923797 () Bool)

(assert (=> b!923797 (= e!518352 e!518356)))

(assert (=> b!923797 (= lt!415148 (select (arr!26609 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96319 () Bool)

(assert (=> b!923797 (= c!96319 (validKeyInArray!0 lt!415148))))

(declare-fun b!923798 () Bool)

(assert (=> b!923798 (= e!518354 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923799 () Bool)

(declare-fun e!518345 () Bool)

(assert (=> b!923799 (= e!518345 (and e!518353 mapRes!31272))))

(declare-fun condMapEmpty!31272 () Bool)

(declare-fun mapDefault!31272 () ValueCell!9357)

(assert (=> b!923799 (= condMapEmpty!31272 (= (arr!26610 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9357)) mapDefault!31272)))))

(declare-fun b!923800 () Bool)

(declare-fun res!622819 () Bool)

(assert (=> b!923800 (=> (not res!622819) (not e!518347))))

(assert (=> b!923800 (= res!622819 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18680))))

(declare-fun b!923801 () Bool)

(declare-fun res!622816 () Bool)

(assert (=> b!923801 (=> (not res!622816) (not e!518347))))

(assert (=> b!923801 (= res!622816 (and (= (size!27069 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27068 _keys!1487) (size!27069 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31272 () Bool)

(assert (=> mapIsEmpty!31272 mapRes!31272))

(declare-fun b!923802 () Bool)

(declare-fun Unit!31177 () Unit!31175)

(assert (=> b!923802 (= e!518356 Unit!31177)))

(declare-fun b!923803 () Bool)

(declare-fun Unit!31178 () Unit!31175)

(assert (=> b!923803 (= e!518352 Unit!31178)))

(declare-fun b!923804 () Bool)

(declare-fun res!622817 () Bool)

(assert (=> b!923804 (=> (not res!622817) (not e!518347))))

(assert (=> b!923804 (= res!622817 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27068 _keys!1487))))))

(declare-fun res!622811 () Bool)

(assert (=> start!78956 (=> (not res!622811) (not e!518347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78956 (= res!622811 (validMask!0 mask!1881))))

(assert (=> start!78956 e!518347))

(assert (=> start!78956 true))

(assert (=> start!78956 tp_is_empty!19677))

(declare-fun array_inv!20724 (array!55330) Bool)

(assert (=> start!78956 (and (array_inv!20724 _values!1231) e!518345)))

(assert (=> start!78956 tp!59948))

(declare-fun array_inv!20725 (array!55328) Bool)

(assert (=> start!78956 (array_inv!20725 _keys!1487)))

(declare-fun b!923793 () Bool)

(declare-fun e!518349 () Bool)

(assert (=> b!923793 (= e!518347 e!518349)))

(declare-fun res!622814 () Bool)

(assert (=> b!923793 (=> (not res!622814) (not e!518349))))

(assert (=> b!923793 (= res!622814 (contains!4865 lt!415161 k0!1099))))

(assert (=> b!923793 (= lt!415161 (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923805 () Bool)

(assert (=> b!923805 (= e!518349 e!518355)))

(declare-fun res!622818 () Bool)

(assert (=> b!923805 (=> (not res!622818) (not e!518355))))

(declare-fun v!791 () V!31201)

(assert (=> b!923805 (= res!622818 (and (= lt!415158 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923805 (= lt!415158 (apply!633 lt!415161 k0!1099))))

(declare-fun b!923806 () Bool)

(assert (=> b!923806 (= e!518346 e!518348)))

(declare-fun res!622813 () Bool)

(assert (=> b!923806 (=> (not res!622813) (not e!518348))))

(assert (=> b!923806 (= res!622813 (contains!4865 lt!415152 k0!1099))))

(assert (=> b!923806 (= lt!415152 (getCurrentListMap!3056 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78956 res!622811) b!923801))

(assert (= (and b!923801 res!622816) b!923790))

(assert (= (and b!923790 res!622815) b!923800))

(assert (= (and b!923800 res!622819) b!923804))

(assert (= (and b!923804 res!622817) b!923793))

(assert (= (and b!923793 res!622814) b!923805))

(assert (= (and b!923805 res!622818) b!923796))

(assert (= (and b!923796 c!96321) b!923797))

(assert (= (and b!923796 (not c!96321)) b!923803))

(assert (= (and b!923797 c!96319) b!923791))

(assert (= (and b!923797 (not c!96319)) b!923802))

(assert (= (and b!923791 c!96320) b!923789))

(assert (= (and b!923791 (not c!96320)) b!923798))

(assert (= (and b!923796 res!622812) b!923806))

(assert (= (and b!923806 res!622813) b!923795))

(assert (= (and b!923799 condMapEmpty!31272) mapIsEmpty!31272))

(assert (= (and b!923799 (not condMapEmpty!31272)) mapNonEmpty!31272))

(get-info :version)

(assert (= (and mapNonEmpty!31272 ((_ is ValueCellFull!9357) mapValue!31272)) b!923792))

(assert (= (and b!923799 ((_ is ValueCellFull!9357) mapDefault!31272)) b!923794))

(assert (= start!78956 b!923799))

(declare-fun b_lambda!13671 () Bool)

(assert (=> (not b_lambda!13671) (not b!923791)))

(declare-fun t!26580 () Bool)

(declare-fun tb!5749 () Bool)

(assert (=> (and start!78956 (= defaultEntry!1235 defaultEntry!1235) t!26580) tb!5749))

(declare-fun result!11321 () Bool)

(assert (=> tb!5749 (= result!11321 tp_is_empty!19677)))

(assert (=> b!923791 t!26580))

(declare-fun b_and!28077 () Bool)

(assert (= b_and!28075 (and (=> t!26580 result!11321) b_and!28077)))

(declare-fun m!858029 () Bool)

(assert (=> b!923800 m!858029))

(declare-fun m!858031 () Bool)

(assert (=> b!923795 m!858031))

(declare-fun m!858033 () Bool)

(assert (=> b!923806 m!858033))

(declare-fun m!858035 () Bool)

(assert (=> b!923806 m!858035))

(declare-fun m!858037 () Bool)

(assert (=> b!923796 m!858037))

(declare-fun m!858039 () Bool)

(assert (=> start!78956 m!858039))

(declare-fun m!858041 () Bool)

(assert (=> start!78956 m!858041))

(declare-fun m!858043 () Bool)

(assert (=> start!78956 m!858043))

(declare-fun m!858045 () Bool)

(assert (=> b!923805 m!858045))

(declare-fun m!858047 () Bool)

(assert (=> b!923791 m!858047))

(declare-fun m!858049 () Bool)

(assert (=> b!923791 m!858049))

(declare-fun m!858051 () Bool)

(assert (=> b!923791 m!858051))

(declare-fun m!858053 () Bool)

(assert (=> b!923791 m!858053))

(declare-fun m!858055 () Bool)

(assert (=> b!923791 m!858055))

(declare-fun m!858057 () Bool)

(assert (=> b!923791 m!858057))

(assert (=> b!923791 m!858053))

(declare-fun m!858059 () Bool)

(assert (=> b!923791 m!858059))

(declare-fun m!858061 () Bool)

(assert (=> b!923791 m!858061))

(assert (=> b!923791 m!858035))

(declare-fun m!858063 () Bool)

(assert (=> b!923791 m!858063))

(declare-fun m!858065 () Bool)

(assert (=> b!923791 m!858065))

(declare-fun m!858067 () Bool)

(assert (=> b!923791 m!858067))

(declare-fun m!858069 () Bool)

(assert (=> b!923791 m!858069))

(declare-fun m!858071 () Bool)

(assert (=> b!923791 m!858071))

(assert (=> b!923791 m!858059))

(declare-fun m!858073 () Bool)

(assert (=> b!923791 m!858073))

(assert (=> b!923791 m!858055))

(declare-fun m!858075 () Bool)

(assert (=> b!923791 m!858075))

(declare-fun m!858077 () Bool)

(assert (=> b!923789 m!858077))

(declare-fun m!858079 () Bool)

(assert (=> mapNonEmpty!31272 m!858079))

(declare-fun m!858081 () Bool)

(assert (=> b!923793 m!858081))

(declare-fun m!858083 () Bool)

(assert (=> b!923793 m!858083))

(declare-fun m!858085 () Bool)

(assert (=> b!923797 m!858085))

(declare-fun m!858087 () Bool)

(assert (=> b!923797 m!858087))

(declare-fun m!858089 () Bool)

(assert (=> b!923790 m!858089))

(check-sat (not b!923800) (not b_lambda!13671) (not b!923806) (not b_next!17169) (not b!923805) (not b!923789) tp_is_empty!19677 b_and!28077 (not b!923797) (not b!923790) (not mapNonEmpty!31272) (not b!923791) (not b!923796) (not b!923793) (not b!923795) (not start!78956))
(check-sat b_and!28077 (not b_next!17169))
