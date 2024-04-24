; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79044 () Bool)

(assert start!79044)

(declare-fun b_free!17089 () Bool)

(declare-fun b_next!17089 () Bool)

(assert (=> start!79044 (= b_free!17089 (not b_next!17089))))

(declare-fun tp!59709 () Bool)

(declare-fun b_and!27925 () Bool)

(assert (=> start!79044 (= tp!59709 b_and!27925)))

(declare-fun b!922716 () Bool)

(declare-fun e!517844 () Bool)

(declare-fun tp_is_empty!19597 () Bool)

(assert (=> b!922716 (= e!517844 tp_is_empty!19597)))

(declare-fun b!922717 () Bool)

(declare-fun e!517845 () Bool)

(declare-fun e!517841 () Bool)

(assert (=> b!922717 (= e!517845 e!517841)))

(declare-fun res!621988 () Bool)

(assert (=> b!922717 (=> (not res!621988) (not e!517841))))

(declare-datatypes ((V!31095 0))(
  ( (V!31096 (val!9849 Int)) )
))
(declare-datatypes ((tuple2!12798 0))(
  ( (tuple2!12799 (_1!6410 (_ BitVec 64)) (_2!6410 V!31095)) )
))
(declare-datatypes ((List!18615 0))(
  ( (Nil!18612) (Cons!18611 (h!19763 tuple2!12798) (t!26426 List!18615)) )
))
(declare-datatypes ((ListLongMap!11497 0))(
  ( (ListLongMap!11498 (toList!5764 List!18615)) )
))
(declare-fun lt!414241 () ListLongMap!11497)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4838 (ListLongMap!11497 (_ BitVec 64)) Bool)

(assert (=> b!922717 (= res!621988 (contains!4838 lt!414241 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9317 0))(
  ( (ValueCellFull!9317 (v!12364 V!31095)) (EmptyCell!9317) )
))
(declare-datatypes ((array!55219 0))(
  ( (array!55220 (arr!26550 (Array (_ BitVec 32) ValueCell!9317)) (size!27010 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55219)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!55221 0))(
  ( (array!55222 (arr!26551 (Array (_ BitVec 32) (_ BitVec 64))) (size!27011 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55221)

(declare-fun zeroValue!1173 () V!31095)

(declare-fun minValue!1173 () V!31095)

(declare-fun getCurrentListMap!3016 (array!55221 array!55219 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 32) Int) ListLongMap!11497)

(assert (=> b!922717 (= lt!414241 (getCurrentListMap!3016 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun e!517846 () Bool)

(declare-fun b!922718 () Bool)

(declare-fun arrayContainsKey!0 (array!55221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922718 (= e!517846 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922719 () Bool)

(declare-fun res!621990 () Bool)

(assert (=> b!922719 (=> (not res!621990) (not e!517841))))

(declare-fun v!791 () V!31095)

(declare-fun apply!624 (ListLongMap!11497 (_ BitVec 64)) V!31095)

(assert (=> b!922719 (= res!621990 (= (apply!624 lt!414241 k0!1099) v!791))))

(declare-fun b!922720 () Bool)

(declare-fun e!517842 () Bool)

(declare-fun e!517843 () Bool)

(declare-fun mapRes!31152 () Bool)

(assert (=> b!922720 (= e!517842 (and e!517843 mapRes!31152))))

(declare-fun condMapEmpty!31152 () Bool)

(declare-fun mapDefault!31152 () ValueCell!9317)

(assert (=> b!922720 (= condMapEmpty!31152 (= (arr!26550 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9317)) mapDefault!31152)))))

(declare-fun b!922721 () Bool)

(declare-fun res!621987 () Bool)

(assert (=> b!922721 (=> (not res!621987) (not e!517845))))

(assert (=> b!922721 (= res!621987 (and (= (size!27010 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27011 _keys!1487) (size!27010 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!621992 () Bool)

(assert (=> start!79044 (=> (not res!621992) (not e!517845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79044 (= res!621992 (validMask!0 mask!1881))))

(assert (=> start!79044 e!517845))

(assert (=> start!79044 true))

(assert (=> start!79044 tp_is_empty!19597))

(declare-fun array_inv!20784 (array!55219) Bool)

(assert (=> start!79044 (and (array_inv!20784 _values!1231) e!517842)))

(assert (=> start!79044 tp!59709))

(declare-fun array_inv!20785 (array!55221) Bool)

(assert (=> start!79044 (array_inv!20785 _keys!1487)))

(declare-fun b!922722 () Bool)

(declare-fun e!517840 () Bool)

(assert (=> b!922722 (= e!517840 (not true))))

(declare-fun lt!414244 () (_ BitVec 64))

(assert (=> b!922722 (not (= lt!414244 k0!1099))))

(declare-datatypes ((Unit!31096 0))(
  ( (Unit!31097) )
))
(declare-fun lt!414245 () Unit!31096)

(declare-datatypes ((List!18616 0))(
  ( (Nil!18613) (Cons!18612 (h!19764 (_ BitVec 64)) (t!26427 List!18616)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55221 (_ BitVec 64) (_ BitVec 32) List!18616) Unit!31096)

(assert (=> b!922722 (= lt!414245 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18613))))

(assert (=> b!922722 e!517846))

(declare-fun c!96417 () Bool)

(assert (=> b!922722 (= c!96417 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414242 () Unit!31096)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!183 (array!55221 array!55219 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 64) (_ BitVec 32) Int) Unit!31096)

(assert (=> b!922722 (= lt!414242 (lemmaListMapContainsThenArrayContainsFrom!183 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55221 (_ BitVec 32) List!18616) Bool)

(assert (=> b!922722 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18613)))

(declare-fun lt!414238 () Unit!31096)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55221 (_ BitVec 32) (_ BitVec 32)) Unit!31096)

(assert (=> b!922722 (= lt!414238 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414243 () tuple2!12798)

(declare-fun +!2692 (ListLongMap!11497 tuple2!12798) ListLongMap!11497)

(assert (=> b!922722 (contains!4838 (+!2692 lt!414241 lt!414243) k0!1099)))

(declare-fun lt!414239 () V!31095)

(declare-fun lt!414237 () Unit!31096)

(declare-fun addStillContains!401 (ListLongMap!11497 (_ BitVec 64) V!31095 (_ BitVec 64)) Unit!31096)

(assert (=> b!922722 (= lt!414237 (addStillContains!401 lt!414241 lt!414244 lt!414239 k0!1099))))

(assert (=> b!922722 (= (getCurrentListMap!3016 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2692 (getCurrentListMap!3016 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414243))))

(assert (=> b!922722 (= lt!414243 (tuple2!12799 lt!414244 lt!414239))))

(declare-fun get!13957 (ValueCell!9317 V!31095) V!31095)

(declare-fun dynLambda!1489 (Int (_ BitVec 64)) V!31095)

(assert (=> b!922722 (= lt!414239 (get!13957 (select (arr!26550 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1489 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414240 () Unit!31096)

(declare-fun lemmaListMapRecursiveValidKeyArray!72 (array!55221 array!55219 (_ BitVec 32) (_ BitVec 32) V!31095 V!31095 (_ BitVec 32) Int) Unit!31096)

(assert (=> b!922722 (= lt!414240 (lemmaListMapRecursiveValidKeyArray!72 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922723 () Bool)

(declare-fun res!621995 () Bool)

(assert (=> b!922723 (=> (not res!621995) (not e!517841))))

(assert (=> b!922723 (= res!621995 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922724 () Bool)

(assert (=> b!922724 (= e!517843 tp_is_empty!19597)))

(declare-fun b!922725 () Bool)

(declare-fun res!621993 () Bool)

(assert (=> b!922725 (=> (not res!621993) (not e!517845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55221 (_ BitVec 32)) Bool)

(assert (=> b!922725 (= res!621993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31152 () Bool)

(assert (=> mapIsEmpty!31152 mapRes!31152))

(declare-fun b!922726 () Bool)

(declare-fun res!621989 () Bool)

(assert (=> b!922726 (=> (not res!621989) (not e!517845))))

(assert (=> b!922726 (= res!621989 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27011 _keys!1487))))))

(declare-fun b!922727 () Bool)

(declare-fun res!621991 () Bool)

(assert (=> b!922727 (=> (not res!621991) (not e!517845))))

(assert (=> b!922727 (= res!621991 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18613))))

(declare-fun b!922728 () Bool)

(assert (=> b!922728 (= e!517846 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922729 () Bool)

(declare-fun res!621994 () Bool)

(assert (=> b!922729 (=> (not res!621994) (not e!517841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922729 (= res!621994 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31152 () Bool)

(declare-fun tp!59708 () Bool)

(assert (=> mapNonEmpty!31152 (= mapRes!31152 (and tp!59708 e!517844))))

(declare-fun mapRest!31152 () (Array (_ BitVec 32) ValueCell!9317))

(declare-fun mapKey!31152 () (_ BitVec 32))

(declare-fun mapValue!31152 () ValueCell!9317)

(assert (=> mapNonEmpty!31152 (= (arr!26550 _values!1231) (store mapRest!31152 mapKey!31152 mapValue!31152))))

(declare-fun b!922730 () Bool)

(assert (=> b!922730 (= e!517841 e!517840)))

(declare-fun res!621996 () Bool)

(assert (=> b!922730 (=> (not res!621996) (not e!517840))))

(assert (=> b!922730 (= res!621996 (validKeyInArray!0 lt!414244))))

(assert (=> b!922730 (= lt!414244 (select (arr!26551 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!79044 res!621992) b!922721))

(assert (= (and b!922721 res!621987) b!922725))

(assert (= (and b!922725 res!621993) b!922727))

(assert (= (and b!922727 res!621991) b!922726))

(assert (= (and b!922726 res!621989) b!922717))

(assert (= (and b!922717 res!621988) b!922719))

(assert (= (and b!922719 res!621990) b!922723))

(assert (= (and b!922723 res!621995) b!922729))

(assert (= (and b!922729 res!621994) b!922730))

(assert (= (and b!922730 res!621996) b!922722))

(assert (= (and b!922722 c!96417) b!922718))

(assert (= (and b!922722 (not c!96417)) b!922728))

(assert (= (and b!922720 condMapEmpty!31152) mapIsEmpty!31152))

(assert (= (and b!922720 (not condMapEmpty!31152)) mapNonEmpty!31152))

(get-info :version)

(assert (= (and mapNonEmpty!31152 ((_ is ValueCellFull!9317) mapValue!31152)) b!922716))

(assert (= (and b!922720 ((_ is ValueCellFull!9317) mapDefault!31152)) b!922724))

(assert (= start!79044 b!922720))

(declare-fun b_lambda!13605 () Bool)

(assert (=> (not b_lambda!13605) (not b!922722)))

(declare-fun t!26425 () Bool)

(declare-fun tb!5661 () Bool)

(assert (=> (and start!79044 (= defaultEntry!1235 defaultEntry!1235) t!26425) tb!5661))

(declare-fun result!11153 () Bool)

(assert (=> tb!5661 (= result!11153 tp_is_empty!19597)))

(assert (=> b!922722 t!26425))

(declare-fun b_and!27927 () Bool)

(assert (= b_and!27925 (and (=> t!26425 result!11153) b_and!27927)))

(declare-fun m!857083 () Bool)

(assert (=> start!79044 m!857083))

(declare-fun m!857085 () Bool)

(assert (=> start!79044 m!857085))

(declare-fun m!857087 () Bool)

(assert (=> start!79044 m!857087))

(declare-fun m!857089 () Bool)

(assert (=> b!922718 m!857089))

(declare-fun m!857091 () Bool)

(assert (=> b!922719 m!857091))

(declare-fun m!857093 () Bool)

(assert (=> b!922730 m!857093))

(declare-fun m!857095 () Bool)

(assert (=> b!922730 m!857095))

(declare-fun m!857097 () Bool)

(assert (=> b!922729 m!857097))

(declare-fun m!857099 () Bool)

(assert (=> b!922727 m!857099))

(declare-fun m!857101 () Bool)

(assert (=> mapNonEmpty!31152 m!857101))

(declare-fun m!857103 () Bool)

(assert (=> b!922725 m!857103))

(declare-fun m!857105 () Bool)

(assert (=> b!922717 m!857105))

(declare-fun m!857107 () Bool)

(assert (=> b!922717 m!857107))

(declare-fun m!857109 () Bool)

(assert (=> b!922722 m!857109))

(declare-fun m!857111 () Bool)

(assert (=> b!922722 m!857111))

(declare-fun m!857113 () Bool)

(assert (=> b!922722 m!857113))

(declare-fun m!857115 () Bool)

(assert (=> b!922722 m!857115))

(declare-fun m!857117 () Bool)

(assert (=> b!922722 m!857117))

(declare-fun m!857119 () Bool)

(assert (=> b!922722 m!857119))

(declare-fun m!857121 () Bool)

(assert (=> b!922722 m!857121))

(assert (=> b!922722 m!857113))

(assert (=> b!922722 m!857119))

(declare-fun m!857123 () Bool)

(assert (=> b!922722 m!857123))

(declare-fun m!857125 () Bool)

(assert (=> b!922722 m!857125))

(declare-fun m!857127 () Bool)

(assert (=> b!922722 m!857127))

(declare-fun m!857129 () Bool)

(assert (=> b!922722 m!857129))

(declare-fun m!857131 () Bool)

(assert (=> b!922722 m!857131))

(assert (=> b!922722 m!857109))

(declare-fun m!857133 () Bool)

(assert (=> b!922722 m!857133))

(assert (=> b!922722 m!857115))

(declare-fun m!857135 () Bool)

(assert (=> b!922722 m!857135))

(check-sat (not b!922727) (not start!79044) (not b_lambda!13605) (not b!922722) b_and!27927 (not b!922718) (not mapNonEmpty!31152) (not b!922717) (not b_next!17089) (not b!922730) (not b!922719) tp_is_empty!19597 (not b!922725) (not b!922729))
(check-sat b_and!27927 (not b_next!17089))
