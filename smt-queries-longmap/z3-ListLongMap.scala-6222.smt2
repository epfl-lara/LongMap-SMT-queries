; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79500 () Bool)

(assert start!79500)

(declare-fun b_free!17655 () Bool)

(declare-fun b_next!17655 () Bool)

(assert (=> start!79500 (= b_free!17655 (not b_next!17655))))

(declare-fun tp!61412 () Bool)

(declare-fun b_and!28877 () Bool)

(assert (=> start!79500 (= tp!61412 b_and!28877)))

(declare-fun b!934705 () Bool)

(declare-fun e!524826 () Bool)

(declare-fun e!524819 () Bool)

(declare-fun mapRes!32007 () Bool)

(assert (=> b!934705 (= e!524826 (and e!524819 mapRes!32007))))

(declare-fun condMapEmpty!32007 () Bool)

(declare-datatypes ((V!31849 0))(
  ( (V!31850 (val!10132 Int)) )
))
(declare-datatypes ((ValueCell!9600 0))(
  ( (ValueCellFull!9600 (v!12652 V!31849)) (EmptyCell!9600) )
))
(declare-datatypes ((array!56264 0))(
  ( (array!56265 (arr!27075 (Array (_ BitVec 32) ValueCell!9600)) (size!27534 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56264)

(declare-fun mapDefault!32007 () ValueCell!9600)

(assert (=> b!934705 (= condMapEmpty!32007 (= (arr!27075 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9600)) mapDefault!32007)))))

(declare-fun b!934706 () Bool)

(declare-fun tp_is_empty!20163 () Bool)

(assert (=> b!934706 (= e!524819 tp_is_empty!20163)))

(declare-fun b!934707 () Bool)

(declare-fun e!524824 () Bool)

(declare-datatypes ((List!19074 0))(
  ( (Nil!19071) (Cons!19070 (h!20216 (_ BitVec 64)) (t!27273 List!19074)) )
))
(declare-fun noDuplicate!1349 (List!19074) Bool)

(assert (=> b!934707 (= e!524824 (noDuplicate!1349 Nil!19071))))

(declare-fun b!934708 () Bool)

(declare-fun res!629524 () Bool)

(declare-fun e!524825 () Bool)

(assert (=> b!934708 (=> (not res!629524) (not e!524825))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31849)

(declare-datatypes ((tuple2!13294 0))(
  ( (tuple2!13295 (_1!6658 (_ BitVec 64)) (_2!6658 V!31849)) )
))
(declare-datatypes ((List!19075 0))(
  ( (Nil!19072) (Cons!19071 (h!20217 tuple2!13294) (t!27274 List!19075)) )
))
(declare-datatypes ((ListLongMap!11991 0))(
  ( (ListLongMap!11992 (toList!6011 List!19075)) )
))
(declare-fun lt!421116 () ListLongMap!11991)

(declare-fun apply!814 (ListLongMap!11991 (_ BitVec 64)) V!31849)

(assert (=> b!934708 (= res!629524 (= (apply!814 lt!421116 k0!1099) v!791))))

(declare-fun b!934709 () Bool)

(declare-fun res!629520 () Bool)

(declare-fun e!524822 () Bool)

(assert (=> b!934709 (=> (not res!629520) (not e!524822))))

(declare-datatypes ((array!56266 0))(
  ( (array!56267 (arr!27076 (Array (_ BitVec 32) (_ BitVec 64))) (size!27535 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56266)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!934709 (= res!629520 (and (= (size!27534 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27535 _keys!1487) (size!27534 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934710 () Bool)

(declare-fun e!524823 () Bool)

(assert (=> b!934710 (= e!524823 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934711 () Bool)

(declare-fun res!629522 () Bool)

(assert (=> b!934711 (=> (not res!629522) (not e!524825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934711 (= res!629522 (validKeyInArray!0 k0!1099))))

(declare-fun b!934713 () Bool)

(declare-fun e!524821 () Bool)

(assert (=> b!934713 (= e!524825 e!524821)))

(declare-fun res!629523 () Bool)

(assert (=> b!934713 (=> (not res!629523) (not e!524821))))

(declare-fun lt!421115 () (_ BitVec 64))

(assert (=> b!934713 (= res!629523 (validKeyInArray!0 lt!421115))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934713 (= lt!421115 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!32007 () Bool)

(assert (=> mapIsEmpty!32007 mapRes!32007))

(declare-fun b!934714 () Bool)

(declare-fun res!629521 () Bool)

(assert (=> b!934714 (=> (not res!629521) (not e!524822))))

(declare-fun arrayNoDuplicates!0 (array!56266 (_ BitVec 32) List!19074) Bool)

(assert (=> b!934714 (= res!629521 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19071))))

(declare-fun b!934715 () Bool)

(declare-fun res!629519 () Bool)

(assert (=> b!934715 (=> (not res!629519) (not e!524825))))

(assert (=> b!934715 (= res!629519 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934716 () Bool)

(declare-fun res!629516 () Bool)

(assert (=> b!934716 (=> (not res!629516) (not e!524822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56266 (_ BitVec 32)) Bool)

(assert (=> b!934716 (= res!629516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934717 () Bool)

(assert (=> b!934717 (= e!524821 (not e!524824))))

(declare-fun res!629518 () Bool)

(assert (=> b!934717 (=> res!629518 e!524824)))

(assert (=> b!934717 (= res!629518 (or (bvsge (size!27535 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487))))))

(assert (=> b!934717 e!524823))

(declare-fun c!97173 () Bool)

(assert (=> b!934717 (= c!97173 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31536 0))(
  ( (Unit!31537) )
))
(declare-fun lt!421112 () Unit!31536)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31849)

(declare-fun minValue!1173 () V!31849)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!280 (array!56266 array!56264 (_ BitVec 32) (_ BitVec 32) V!31849 V!31849 (_ BitVec 64) (_ BitVec 32) Int) Unit!31536)

(assert (=> b!934717 (= lt!421112 (lemmaListMapContainsThenArrayContainsFrom!280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934717 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19071)))

(declare-fun lt!421113 () Unit!31536)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56266 (_ BitVec 32) (_ BitVec 32)) Unit!31536)

(assert (=> b!934717 (= lt!421113 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421117 () tuple2!13294)

(declare-fun contains!5061 (ListLongMap!11991 (_ BitVec 64)) Bool)

(declare-fun +!2808 (ListLongMap!11991 tuple2!13294) ListLongMap!11991)

(assert (=> b!934717 (contains!5061 (+!2808 lt!421116 lt!421117) k0!1099)))

(declare-fun lt!421114 () V!31849)

(declare-fun lt!421119 () Unit!31536)

(declare-fun addStillContains!527 (ListLongMap!11991 (_ BitVec 64) V!31849 (_ BitVec 64)) Unit!31536)

(assert (=> b!934717 (= lt!421119 (addStillContains!527 lt!421116 lt!421115 lt!421114 k0!1099))))

(declare-fun getCurrentListMap!3248 (array!56266 array!56264 (_ BitVec 32) (_ BitVec 32) V!31849 V!31849 (_ BitVec 32) Int) ListLongMap!11991)

(assert (=> b!934717 (= (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2808 (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421117))))

(assert (=> b!934717 (= lt!421117 (tuple2!13295 lt!421115 lt!421114))))

(declare-fun get!14255 (ValueCell!9600 V!31849) V!31849)

(declare-fun dynLambda!1597 (Int (_ BitVec 64)) V!31849)

(assert (=> b!934717 (= lt!421114 (get!14255 (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421118 () Unit!31536)

(declare-fun lemmaListMapRecursiveValidKeyArray!198 (array!56266 array!56264 (_ BitVec 32) (_ BitVec 32) V!31849 V!31849 (_ BitVec 32) Int) Unit!31536)

(assert (=> b!934717 (= lt!421118 (lemmaListMapRecursiveValidKeyArray!198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934718 () Bool)

(assert (=> b!934718 (= e!524822 e!524825)))

(declare-fun res!629517 () Bool)

(assert (=> b!934718 (=> (not res!629517) (not e!524825))))

(assert (=> b!934718 (= res!629517 (contains!5061 lt!421116 k0!1099))))

(assert (=> b!934718 (= lt!421116 (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!32007 () Bool)

(declare-fun tp!61411 () Bool)

(declare-fun e!524820 () Bool)

(assert (=> mapNonEmpty!32007 (= mapRes!32007 (and tp!61411 e!524820))))

(declare-fun mapKey!32007 () (_ BitVec 32))

(declare-fun mapValue!32007 () ValueCell!9600)

(declare-fun mapRest!32007 () (Array (_ BitVec 32) ValueCell!9600))

(assert (=> mapNonEmpty!32007 (= (arr!27075 _values!1231) (store mapRest!32007 mapKey!32007 mapValue!32007))))

(declare-fun b!934719 () Bool)

(assert (=> b!934719 (= e!524820 tp_is_empty!20163)))

(declare-fun b!934720 () Bool)

(declare-fun res!629515 () Bool)

(assert (=> b!934720 (=> (not res!629515) (not e!524822))))

(assert (=> b!934720 (= res!629515 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27535 _keys!1487))))))

(declare-fun res!629514 () Bool)

(assert (=> start!79500 (=> (not res!629514) (not e!524822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79500 (= res!629514 (validMask!0 mask!1881))))

(assert (=> start!79500 e!524822))

(assert (=> start!79500 true))

(assert (=> start!79500 tp_is_empty!20163))

(declare-fun array_inv!21070 (array!56264) Bool)

(assert (=> start!79500 (and (array_inv!21070 _values!1231) e!524826)))

(assert (=> start!79500 tp!61412))

(declare-fun array_inv!21071 (array!56266) Bool)

(assert (=> start!79500 (array_inv!21071 _keys!1487)))

(declare-fun b!934712 () Bool)

(declare-fun arrayContainsKey!0 (array!56266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934712 (= e!524823 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79500 res!629514) b!934709))

(assert (= (and b!934709 res!629520) b!934716))

(assert (= (and b!934716 res!629516) b!934714))

(assert (= (and b!934714 res!629521) b!934720))

(assert (= (and b!934720 res!629515) b!934718))

(assert (= (and b!934718 res!629517) b!934708))

(assert (= (and b!934708 res!629524) b!934715))

(assert (= (and b!934715 res!629519) b!934711))

(assert (= (and b!934711 res!629522) b!934713))

(assert (= (and b!934713 res!629523) b!934717))

(assert (= (and b!934717 c!97173) b!934712))

(assert (= (and b!934717 (not c!97173)) b!934710))

(assert (= (and b!934717 (not res!629518)) b!934707))

(assert (= (and b!934705 condMapEmpty!32007) mapIsEmpty!32007))

(assert (= (and b!934705 (not condMapEmpty!32007)) mapNonEmpty!32007))

(get-info :version)

(assert (= (and mapNonEmpty!32007 ((_ is ValueCellFull!9600) mapValue!32007)) b!934719))

(assert (= (and b!934705 ((_ is ValueCellFull!9600) mapDefault!32007)) b!934706))

(assert (= start!79500 b!934705))

(declare-fun b_lambda!14007 () Bool)

(assert (=> (not b_lambda!14007) (not b!934717)))

(declare-fun t!27272 () Bool)

(declare-fun tb!6049 () Bool)

(assert (=> (and start!79500 (= defaultEntry!1235 defaultEntry!1235) t!27272) tb!6049))

(declare-fun result!11925 () Bool)

(assert (=> tb!6049 (= result!11925 tp_is_empty!20163)))

(assert (=> b!934717 t!27272))

(declare-fun b_and!28879 () Bool)

(assert (= b_and!28877 (and (=> t!27272 result!11925) b_and!28879)))

(declare-fun m!869025 () Bool)

(assert (=> b!934713 m!869025))

(declare-fun m!869027 () Bool)

(assert (=> b!934713 m!869027))

(declare-fun m!869029 () Bool)

(assert (=> b!934708 m!869029))

(declare-fun m!869031 () Bool)

(assert (=> b!934712 m!869031))

(declare-fun m!869033 () Bool)

(assert (=> b!934717 m!869033))

(declare-fun m!869035 () Bool)

(assert (=> b!934717 m!869035))

(declare-fun m!869037 () Bool)

(assert (=> b!934717 m!869037))

(assert (=> b!934717 m!869035))

(declare-fun m!869039 () Bool)

(assert (=> b!934717 m!869039))

(declare-fun m!869041 () Bool)

(assert (=> b!934717 m!869041))

(declare-fun m!869043 () Bool)

(assert (=> b!934717 m!869043))

(assert (=> b!934717 m!869037))

(declare-fun m!869045 () Bool)

(assert (=> b!934717 m!869045))

(declare-fun m!869047 () Bool)

(assert (=> b!934717 m!869047))

(declare-fun m!869049 () Bool)

(assert (=> b!934717 m!869049))

(declare-fun m!869051 () Bool)

(assert (=> b!934717 m!869051))

(declare-fun m!869053 () Bool)

(assert (=> b!934717 m!869053))

(declare-fun m!869055 () Bool)

(assert (=> b!934717 m!869055))

(assert (=> b!934717 m!869043))

(assert (=> b!934717 m!869053))

(declare-fun m!869057 () Bool)

(assert (=> b!934717 m!869057))

(declare-fun m!869059 () Bool)

(assert (=> mapNonEmpty!32007 m!869059))

(declare-fun m!869061 () Bool)

(assert (=> start!79500 m!869061))

(declare-fun m!869063 () Bool)

(assert (=> start!79500 m!869063))

(declare-fun m!869065 () Bool)

(assert (=> start!79500 m!869065))

(declare-fun m!869067 () Bool)

(assert (=> b!934716 m!869067))

(declare-fun m!869069 () Bool)

(assert (=> b!934711 m!869069))

(declare-fun m!869071 () Bool)

(assert (=> b!934707 m!869071))

(declare-fun m!869073 () Bool)

(assert (=> b!934718 m!869073))

(declare-fun m!869075 () Bool)

(assert (=> b!934718 m!869075))

(declare-fun m!869077 () Bool)

(assert (=> b!934714 m!869077))

(check-sat (not b!934716) tp_is_empty!20163 (not b!934718) (not b!934717) (not b_lambda!14007) (not b_next!17655) (not mapNonEmpty!32007) (not start!79500) (not b!934708) (not b!934707) (not b!934712) b_and!28879 (not b!934714) (not b!934711) (not b!934713))
(check-sat b_and!28879 (not b_next!17655))
(get-model)

(declare-fun b_lambda!14011 () Bool)

(assert (= b_lambda!14007 (or (and start!79500 b_free!17655) b_lambda!14011)))

(check-sat (not b_lambda!14011) (not b!934716) tp_is_empty!20163 (not b!934718) (not b!934717) (not b_next!17655) (not mapNonEmpty!32007) (not start!79500) (not b!934708) (not b!934707) (not b!934712) b_and!28879 (not b!934714) (not b!934711) (not b!934713))
(check-sat b_and!28879 (not b_next!17655))
(get-model)

(declare-fun call!40649 () ListLongMap!11991)

(declare-fun bm!40644 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3300 (array!56266 array!56264 (_ BitVec 32) (_ BitVec 32) V!31849 V!31849 (_ BitVec 32) Int) ListLongMap!11991)

(assert (=> bm!40644 (= call!40649 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun bm!40645 () Bool)

(declare-fun call!40651 () ListLongMap!11991)

(assert (=> bm!40645 (= call!40651 call!40649)))

(declare-fun bm!40646 () Bool)

(declare-fun call!40652 () Bool)

(declare-fun lt!421192 () ListLongMap!11991)

(assert (=> bm!40646 (= call!40652 (contains!5061 lt!421192 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934815 () Bool)

(declare-fun e!524882 () Unit!31536)

(declare-fun Unit!31538 () Unit!31536)

(assert (=> b!934815 (= e!524882 Unit!31538)))

(declare-fun d!113147 () Bool)

(declare-fun e!524889 () Bool)

(assert (=> d!113147 e!524889))

(declare-fun res!629576 () Bool)

(assert (=> d!113147 (=> (not res!629576) (not e!524889))))

(assert (=> d!113147 (= res!629576 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)))))))

(declare-fun lt!421204 () ListLongMap!11991)

(assert (=> d!113147 (= lt!421192 lt!421204)))

(declare-fun lt!421203 () Unit!31536)

(assert (=> d!113147 (= lt!421203 e!524882)))

(declare-fun c!97189 () Bool)

(declare-fun e!524887 () Bool)

(assert (=> d!113147 (= c!97189 e!524887)))

(declare-fun res!629581 () Bool)

(assert (=> d!113147 (=> (not res!629581) (not e!524887))))

(assert (=> d!113147 (= res!629581 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)))))

(declare-fun e!524886 () ListLongMap!11991)

(assert (=> d!113147 (= lt!421204 e!524886)))

(declare-fun c!97193 () Bool)

(assert (=> d!113147 (= c!97193 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113147 (validMask!0 mask!1881)))

(assert (=> d!113147 (= (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421192)))

(declare-fun b!934816 () Bool)

(declare-fun e!524890 () Bool)

(declare-fun e!524892 () Bool)

(assert (=> b!934816 (= e!524890 e!524892)))

(declare-fun res!629580 () Bool)

(assert (=> b!934816 (=> (not res!629580) (not e!524892))))

(assert (=> b!934816 (= res!629580 (contains!5061 lt!421192 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!934816 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)))))

(declare-fun b!934817 () Bool)

(declare-fun e!524885 () Bool)

(declare-fun e!524891 () Bool)

(assert (=> b!934817 (= e!524885 e!524891)))

(declare-fun res!629579 () Bool)

(assert (=> b!934817 (= res!629579 call!40652)))

(assert (=> b!934817 (=> (not res!629579) (not e!524891))))

(declare-fun b!934818 () Bool)

(declare-fun e!524880 () Bool)

(declare-fun e!524888 () Bool)

(assert (=> b!934818 (= e!524880 e!524888)))

(declare-fun res!629583 () Bool)

(declare-fun call!40647 () Bool)

(assert (=> b!934818 (= res!629583 call!40647)))

(assert (=> b!934818 (=> (not res!629583) (not e!524888))))

(declare-fun b!934819 () Bool)

(assert (=> b!934819 (= e!524887 (validKeyInArray!0 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934820 () Bool)

(assert (=> b!934820 (= e!524891 (= (apply!814 lt!421192 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934821 () Bool)

(declare-fun e!524883 () ListLongMap!11991)

(declare-fun call!40648 () ListLongMap!11991)

(assert (=> b!934821 (= e!524883 call!40648)))

(declare-fun bm!40647 () Bool)

(assert (=> bm!40647 (= call!40647 (contains!5061 lt!421192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934822 () Bool)

(assert (=> b!934822 (= e!524888 (= (apply!814 lt!421192 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934823 () Bool)

(declare-fun e!524884 () Bool)

(assert (=> b!934823 (= e!524884 (validKeyInArray!0 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934824 () Bool)

(declare-fun res!629577 () Bool)

(assert (=> b!934824 (=> (not res!629577) (not e!524889))))

(assert (=> b!934824 (= res!629577 e!524880)))

(declare-fun c!97190 () Bool)

(assert (=> b!934824 (= c!97190 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934825 () Bool)

(declare-fun call!40653 () ListLongMap!11991)

(assert (=> b!934825 (= e!524883 call!40653)))

(declare-fun b!934826 () Bool)

(declare-fun e!524881 () ListLongMap!11991)

(assert (=> b!934826 (= e!524886 e!524881)))

(declare-fun c!97194 () Bool)

(assert (=> b!934826 (= c!97194 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934827 () Bool)

(assert (=> b!934827 (= e!524885 (not call!40652))))

(declare-fun b!934828 () Bool)

(assert (=> b!934828 (= e!524881 call!40648)))

(declare-fun b!934829 () Bool)

(assert (=> b!934829 (= e!524889 e!524885)))

(declare-fun c!97191 () Bool)

(assert (=> b!934829 (= c!97191 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934830 () Bool)

(declare-fun call!40650 () ListLongMap!11991)

(assert (=> b!934830 (= e!524886 (+!2808 call!40650 (tuple2!13295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934831 () Bool)

(declare-fun lt!421197 () Unit!31536)

(assert (=> b!934831 (= e!524882 lt!421197)))

(declare-fun lt!421205 () ListLongMap!11991)

(assert (=> b!934831 (= lt!421205 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421195 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421195 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421194 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421194 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421208 () Unit!31536)

(assert (=> b!934831 (= lt!421208 (addStillContains!527 lt!421205 lt!421195 zeroValue!1173 lt!421194))))

(assert (=> b!934831 (contains!5061 (+!2808 lt!421205 (tuple2!13295 lt!421195 zeroValue!1173)) lt!421194)))

(declare-fun lt!421191 () Unit!31536)

(assert (=> b!934831 (= lt!421191 lt!421208)))

(declare-fun lt!421189 () ListLongMap!11991)

(assert (=> b!934831 (= lt!421189 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421202 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421202 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421200 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421200 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421199 () Unit!31536)

(declare-fun addApplyDifferent!419 (ListLongMap!11991 (_ BitVec 64) V!31849 (_ BitVec 64)) Unit!31536)

(assert (=> b!934831 (= lt!421199 (addApplyDifferent!419 lt!421189 lt!421202 minValue!1173 lt!421200))))

(assert (=> b!934831 (= (apply!814 (+!2808 lt!421189 (tuple2!13295 lt!421202 minValue!1173)) lt!421200) (apply!814 lt!421189 lt!421200))))

(declare-fun lt!421209 () Unit!31536)

(assert (=> b!934831 (= lt!421209 lt!421199)))

(declare-fun lt!421196 () ListLongMap!11991)

(assert (=> b!934831 (= lt!421196 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421193 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421190 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421190 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421207 () Unit!31536)

(assert (=> b!934831 (= lt!421207 (addApplyDifferent!419 lt!421196 lt!421193 zeroValue!1173 lt!421190))))

(assert (=> b!934831 (= (apply!814 (+!2808 lt!421196 (tuple2!13295 lt!421193 zeroValue!1173)) lt!421190) (apply!814 lt!421196 lt!421190))))

(declare-fun lt!421201 () Unit!31536)

(assert (=> b!934831 (= lt!421201 lt!421207)))

(declare-fun lt!421198 () ListLongMap!11991)

(assert (=> b!934831 (= lt!421198 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421206 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421188 () (_ BitVec 64))

(assert (=> b!934831 (= lt!421188 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!934831 (= lt!421197 (addApplyDifferent!419 lt!421198 lt!421206 minValue!1173 lt!421188))))

(assert (=> b!934831 (= (apply!814 (+!2808 lt!421198 (tuple2!13295 lt!421206 minValue!1173)) lt!421188) (apply!814 lt!421198 lt!421188))))

(declare-fun b!934832 () Bool)

(declare-fun res!629578 () Bool)

(assert (=> b!934832 (=> (not res!629578) (not e!524889))))

(assert (=> b!934832 (= res!629578 e!524890)))

(declare-fun res!629584 () Bool)

(assert (=> b!934832 (=> res!629584 e!524890)))

(assert (=> b!934832 (= res!629584 (not e!524884))))

(declare-fun res!629582 () Bool)

(assert (=> b!934832 (=> (not res!629582) (not e!524884))))

(assert (=> b!934832 (= res!629582 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)))))

(declare-fun bm!40648 () Bool)

(assert (=> bm!40648 (= call!40648 call!40650)))

(declare-fun b!934833 () Bool)

(assert (=> b!934833 (= e!524880 (not call!40647))))

(declare-fun bm!40649 () Bool)

(assert (=> bm!40649 (= call!40653 call!40651)))

(declare-fun b!934834 () Bool)

(assert (=> b!934834 (= e!524892 (= (apply!814 lt!421192 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14255 (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934834 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27534 _values!1231)))))

(assert (=> b!934834 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)))))

(declare-fun b!934835 () Bool)

(declare-fun c!97192 () Bool)

(assert (=> b!934835 (= c!97192 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934835 (= e!524881 e!524883)))

(declare-fun bm!40650 () Bool)

(assert (=> bm!40650 (= call!40650 (+!2808 (ite c!97193 call!40649 (ite c!97194 call!40651 call!40653)) (ite (or c!97193 c!97194) (tuple2!13295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113147 c!97193) b!934830))

(assert (= (and d!113147 (not c!97193)) b!934826))

(assert (= (and b!934826 c!97194) b!934828))

(assert (= (and b!934826 (not c!97194)) b!934835))

(assert (= (and b!934835 c!97192) b!934821))

(assert (= (and b!934835 (not c!97192)) b!934825))

(assert (= (or b!934821 b!934825) bm!40649))

(assert (= (or b!934828 bm!40649) bm!40645))

(assert (= (or b!934828 b!934821) bm!40648))

(assert (= (or b!934830 bm!40645) bm!40644))

(assert (= (or b!934830 bm!40648) bm!40650))

(assert (= (and d!113147 res!629581) b!934819))

(assert (= (and d!113147 c!97189) b!934831))

(assert (= (and d!113147 (not c!97189)) b!934815))

(assert (= (and d!113147 res!629576) b!934832))

(assert (= (and b!934832 res!629582) b!934823))

(assert (= (and b!934832 (not res!629584)) b!934816))

(assert (= (and b!934816 res!629580) b!934834))

(assert (= (and b!934832 res!629578) b!934824))

(assert (= (and b!934824 c!97190) b!934818))

(assert (= (and b!934824 (not c!97190)) b!934833))

(assert (= (and b!934818 res!629583) b!934822))

(assert (= (or b!934818 b!934833) bm!40647))

(assert (= (and b!934824 res!629577) b!934829))

(assert (= (and b!934829 c!97191) b!934817))

(assert (= (and b!934829 (not c!97191)) b!934827))

(assert (= (and b!934817 res!629579) b!934820))

(assert (= (or b!934817 b!934827) bm!40646))

(declare-fun b_lambda!14013 () Bool)

(assert (=> (not b_lambda!14013) (not b!934834)))

(assert (=> b!934834 t!27272))

(declare-fun b_and!28885 () Bool)

(assert (= b_and!28879 (and (=> t!27272 result!11925) b_and!28885)))

(declare-fun m!869133 () Bool)

(assert (=> bm!40650 m!869133))

(assert (=> b!934819 m!869027))

(assert (=> b!934819 m!869027))

(declare-fun m!869135 () Bool)

(assert (=> b!934819 m!869135))

(assert (=> b!934823 m!869027))

(assert (=> b!934823 m!869027))

(assert (=> b!934823 m!869135))

(declare-fun m!869137 () Bool)

(assert (=> b!934820 m!869137))

(declare-fun m!869139 () Bool)

(assert (=> bm!40646 m!869139))

(declare-fun m!869141 () Bool)

(assert (=> bm!40644 m!869141))

(declare-fun m!869143 () Bool)

(assert (=> b!934830 m!869143))

(assert (=> b!934816 m!869027))

(assert (=> b!934816 m!869027))

(declare-fun m!869145 () Bool)

(assert (=> b!934816 m!869145))

(declare-fun m!869147 () Bool)

(assert (=> b!934831 m!869147))

(declare-fun m!869149 () Bool)

(assert (=> b!934831 m!869149))

(declare-fun m!869151 () Bool)

(assert (=> b!934831 m!869151))

(declare-fun m!869153 () Bool)

(assert (=> b!934831 m!869153))

(declare-fun m!869155 () Bool)

(assert (=> b!934831 m!869155))

(declare-fun m!869157 () Bool)

(assert (=> b!934831 m!869157))

(declare-fun m!869159 () Bool)

(assert (=> b!934831 m!869159))

(declare-fun m!869161 () Bool)

(assert (=> b!934831 m!869161))

(assert (=> b!934831 m!869141))

(declare-fun m!869163 () Bool)

(assert (=> b!934831 m!869163))

(declare-fun m!869165 () Bool)

(assert (=> b!934831 m!869165))

(assert (=> b!934831 m!869163))

(declare-fun m!869167 () Bool)

(assert (=> b!934831 m!869167))

(assert (=> b!934831 m!869027))

(assert (=> b!934831 m!869153))

(assert (=> b!934831 m!869149))

(declare-fun m!869169 () Bool)

(assert (=> b!934831 m!869169))

(declare-fun m!869171 () Bool)

(assert (=> b!934831 m!869171))

(declare-fun m!869173 () Bool)

(assert (=> b!934831 m!869173))

(assert (=> b!934831 m!869159))

(declare-fun m!869175 () Bool)

(assert (=> b!934831 m!869175))

(declare-fun m!869177 () Bool)

(assert (=> b!934822 m!869177))

(assert (=> d!113147 m!869061))

(declare-fun m!869179 () Bool)

(assert (=> bm!40647 m!869179))

(assert (=> b!934834 m!869043))

(assert (=> b!934834 m!869037))

(assert (=> b!934834 m!869045))

(assert (=> b!934834 m!869027))

(declare-fun m!869181 () Bool)

(assert (=> b!934834 m!869181))

(assert (=> b!934834 m!869027))

(assert (=> b!934834 m!869043))

(assert (=> b!934834 m!869037))

(assert (=> b!934717 d!113147))

(declare-fun call!40656 () ListLongMap!11991)

(declare-fun bm!40651 () Bool)

(assert (=> bm!40651 (= call!40656 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun bm!40652 () Bool)

(declare-fun call!40658 () ListLongMap!11991)

(assert (=> bm!40652 (= call!40658 call!40656)))

(declare-fun bm!40653 () Bool)

(declare-fun call!40659 () Bool)

(declare-fun lt!421214 () ListLongMap!11991)

(assert (=> bm!40653 (= call!40659 (contains!5061 lt!421214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934836 () Bool)

(declare-fun e!524895 () Unit!31536)

(declare-fun Unit!31539 () Unit!31536)

(assert (=> b!934836 (= e!524895 Unit!31539)))

(declare-fun d!113149 () Bool)

(declare-fun e!524902 () Bool)

(assert (=> d!113149 e!524902))

(declare-fun res!629585 () Bool)

(assert (=> d!113149 (=> (not res!629585) (not e!524902))))

(assert (=> d!113149 (= res!629585 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27535 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27535 _keys!1487)))))))

(declare-fun lt!421226 () ListLongMap!11991)

(assert (=> d!113149 (= lt!421214 lt!421226)))

(declare-fun lt!421225 () Unit!31536)

(assert (=> d!113149 (= lt!421225 e!524895)))

(declare-fun c!97195 () Bool)

(declare-fun e!524900 () Bool)

(assert (=> d!113149 (= c!97195 e!524900)))

(declare-fun res!629590 () Bool)

(assert (=> d!113149 (=> (not res!629590) (not e!524900))))

(assert (=> d!113149 (= res!629590 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27535 _keys!1487)))))

(declare-fun e!524899 () ListLongMap!11991)

(assert (=> d!113149 (= lt!421226 e!524899)))

(declare-fun c!97199 () Bool)

(assert (=> d!113149 (= c!97199 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113149 (validMask!0 mask!1881)))

(assert (=> d!113149 (= (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421214)))

(declare-fun b!934837 () Bool)

(declare-fun e!524903 () Bool)

(declare-fun e!524905 () Bool)

(assert (=> b!934837 (= e!524903 e!524905)))

(declare-fun res!629589 () Bool)

(assert (=> b!934837 (=> (not res!629589) (not e!524905))))

(assert (=> b!934837 (= res!629589 (contains!5061 lt!421214 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!934837 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27535 _keys!1487)))))

(declare-fun b!934838 () Bool)

(declare-fun e!524898 () Bool)

(declare-fun e!524904 () Bool)

(assert (=> b!934838 (= e!524898 e!524904)))

(declare-fun res!629588 () Bool)

(assert (=> b!934838 (= res!629588 call!40659)))

(assert (=> b!934838 (=> (not res!629588) (not e!524904))))

(declare-fun b!934839 () Bool)

(declare-fun e!524893 () Bool)

(declare-fun e!524901 () Bool)

(assert (=> b!934839 (= e!524893 e!524901)))

(declare-fun res!629592 () Bool)

(declare-fun call!40654 () Bool)

(assert (=> b!934839 (= res!629592 call!40654)))

(assert (=> b!934839 (=> (not res!629592) (not e!524901))))

(declare-fun b!934840 () Bool)

(assert (=> b!934840 (= e!524900 (validKeyInArray!0 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!934841 () Bool)

(assert (=> b!934841 (= e!524904 (= (apply!814 lt!421214 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934842 () Bool)

(declare-fun e!524896 () ListLongMap!11991)

(declare-fun call!40655 () ListLongMap!11991)

(assert (=> b!934842 (= e!524896 call!40655)))

(declare-fun bm!40654 () Bool)

(assert (=> bm!40654 (= call!40654 (contains!5061 lt!421214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934843 () Bool)

(assert (=> b!934843 (= e!524901 (= (apply!814 lt!421214 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934844 () Bool)

(declare-fun e!524897 () Bool)

(assert (=> b!934844 (= e!524897 (validKeyInArray!0 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!934845 () Bool)

(declare-fun res!629586 () Bool)

(assert (=> b!934845 (=> (not res!629586) (not e!524902))))

(assert (=> b!934845 (= res!629586 e!524893)))

(declare-fun c!97196 () Bool)

(assert (=> b!934845 (= c!97196 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934846 () Bool)

(declare-fun call!40660 () ListLongMap!11991)

(assert (=> b!934846 (= e!524896 call!40660)))

(declare-fun b!934847 () Bool)

(declare-fun e!524894 () ListLongMap!11991)

(assert (=> b!934847 (= e!524899 e!524894)))

(declare-fun c!97200 () Bool)

(assert (=> b!934847 (= c!97200 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934848 () Bool)

(assert (=> b!934848 (= e!524898 (not call!40659))))

(declare-fun b!934849 () Bool)

(assert (=> b!934849 (= e!524894 call!40655)))

(declare-fun b!934850 () Bool)

(assert (=> b!934850 (= e!524902 e!524898)))

(declare-fun c!97197 () Bool)

(assert (=> b!934850 (= c!97197 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934851 () Bool)

(declare-fun call!40657 () ListLongMap!11991)

(assert (=> b!934851 (= e!524899 (+!2808 call!40657 (tuple2!13295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934852 () Bool)

(declare-fun lt!421219 () Unit!31536)

(assert (=> b!934852 (= e!524895 lt!421219)))

(declare-fun lt!421227 () ListLongMap!11991)

(assert (=> b!934852 (= lt!421227 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421217 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421216 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421216 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421230 () Unit!31536)

(assert (=> b!934852 (= lt!421230 (addStillContains!527 lt!421227 lt!421217 zeroValue!1173 lt!421216))))

(assert (=> b!934852 (contains!5061 (+!2808 lt!421227 (tuple2!13295 lt!421217 zeroValue!1173)) lt!421216)))

(declare-fun lt!421213 () Unit!31536)

(assert (=> b!934852 (= lt!421213 lt!421230)))

(declare-fun lt!421211 () ListLongMap!11991)

(assert (=> b!934852 (= lt!421211 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421224 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421224 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421222 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421222 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421221 () Unit!31536)

(assert (=> b!934852 (= lt!421221 (addApplyDifferent!419 lt!421211 lt!421224 minValue!1173 lt!421222))))

(assert (=> b!934852 (= (apply!814 (+!2808 lt!421211 (tuple2!13295 lt!421224 minValue!1173)) lt!421222) (apply!814 lt!421211 lt!421222))))

(declare-fun lt!421231 () Unit!31536)

(assert (=> b!934852 (= lt!421231 lt!421221)))

(declare-fun lt!421218 () ListLongMap!11991)

(assert (=> b!934852 (= lt!421218 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421215 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421212 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421212 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421229 () Unit!31536)

(assert (=> b!934852 (= lt!421229 (addApplyDifferent!419 lt!421218 lt!421215 zeroValue!1173 lt!421212))))

(assert (=> b!934852 (= (apply!814 (+!2808 lt!421218 (tuple2!13295 lt!421215 zeroValue!1173)) lt!421212) (apply!814 lt!421218 lt!421212))))

(declare-fun lt!421223 () Unit!31536)

(assert (=> b!934852 (= lt!421223 lt!421229)))

(declare-fun lt!421220 () ListLongMap!11991)

(assert (=> b!934852 (= lt!421220 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421228 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421228 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421210 () (_ BitVec 64))

(assert (=> b!934852 (= lt!421210 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!934852 (= lt!421219 (addApplyDifferent!419 lt!421220 lt!421228 minValue!1173 lt!421210))))

(assert (=> b!934852 (= (apply!814 (+!2808 lt!421220 (tuple2!13295 lt!421228 minValue!1173)) lt!421210) (apply!814 lt!421220 lt!421210))))

(declare-fun b!934853 () Bool)

(declare-fun res!629587 () Bool)

(assert (=> b!934853 (=> (not res!629587) (not e!524902))))

(assert (=> b!934853 (= res!629587 e!524903)))

(declare-fun res!629593 () Bool)

(assert (=> b!934853 (=> res!629593 e!524903)))

(assert (=> b!934853 (= res!629593 (not e!524897))))

(declare-fun res!629591 () Bool)

(assert (=> b!934853 (=> (not res!629591) (not e!524897))))

(assert (=> b!934853 (= res!629591 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27535 _keys!1487)))))

(declare-fun bm!40655 () Bool)

(assert (=> bm!40655 (= call!40655 call!40657)))

(declare-fun b!934854 () Bool)

(assert (=> b!934854 (= e!524893 (not call!40654))))

(declare-fun bm!40656 () Bool)

(assert (=> bm!40656 (= call!40660 call!40658)))

(declare-fun b!934855 () Bool)

(assert (=> b!934855 (= e!524905 (= (apply!814 lt!421214 (select (arr!27076 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14255 (select (arr!27075 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934855 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27534 _values!1231)))))

(assert (=> b!934855 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27535 _keys!1487)))))

(declare-fun b!934856 () Bool)

(declare-fun c!97198 () Bool)

(assert (=> b!934856 (= c!97198 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934856 (= e!524894 e!524896)))

(declare-fun bm!40657 () Bool)

(assert (=> bm!40657 (= call!40657 (+!2808 (ite c!97199 call!40656 (ite c!97200 call!40658 call!40660)) (ite (or c!97199 c!97200) (tuple2!13295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113149 c!97199) b!934851))

(assert (= (and d!113149 (not c!97199)) b!934847))

(assert (= (and b!934847 c!97200) b!934849))

(assert (= (and b!934847 (not c!97200)) b!934856))

(assert (= (and b!934856 c!97198) b!934842))

(assert (= (and b!934856 (not c!97198)) b!934846))

(assert (= (or b!934842 b!934846) bm!40656))

(assert (= (or b!934849 bm!40656) bm!40652))

(assert (= (or b!934849 b!934842) bm!40655))

(assert (= (or b!934851 bm!40652) bm!40651))

(assert (= (or b!934851 bm!40655) bm!40657))

(assert (= (and d!113149 res!629590) b!934840))

(assert (= (and d!113149 c!97195) b!934852))

(assert (= (and d!113149 (not c!97195)) b!934836))

(assert (= (and d!113149 res!629585) b!934853))

(assert (= (and b!934853 res!629591) b!934844))

(assert (= (and b!934853 (not res!629593)) b!934837))

(assert (= (and b!934837 res!629589) b!934855))

(assert (= (and b!934853 res!629587) b!934845))

(assert (= (and b!934845 c!97196) b!934839))

(assert (= (and b!934845 (not c!97196)) b!934854))

(assert (= (and b!934839 res!629592) b!934843))

(assert (= (or b!934839 b!934854) bm!40654))

(assert (= (and b!934845 res!629586) b!934850))

(assert (= (and b!934850 c!97197) b!934838))

(assert (= (and b!934850 (not c!97197)) b!934848))

(assert (= (and b!934838 res!629588) b!934841))

(assert (= (or b!934838 b!934848) bm!40653))

(declare-fun b_lambda!14015 () Bool)

(assert (=> (not b_lambda!14015) (not b!934855)))

(assert (=> b!934855 t!27272))

(declare-fun b_and!28887 () Bool)

(assert (= b_and!28885 (and (=> t!27272 result!11925) b_and!28887)))

(declare-fun m!869183 () Bool)

(assert (=> bm!40657 m!869183))

(declare-fun m!869185 () Bool)

(assert (=> b!934840 m!869185))

(assert (=> b!934840 m!869185))

(declare-fun m!869187 () Bool)

(assert (=> b!934840 m!869187))

(assert (=> b!934844 m!869185))

(assert (=> b!934844 m!869185))

(assert (=> b!934844 m!869187))

(declare-fun m!869189 () Bool)

(assert (=> b!934841 m!869189))

(declare-fun m!869191 () Bool)

(assert (=> bm!40653 m!869191))

(declare-fun m!869193 () Bool)

(assert (=> bm!40651 m!869193))

(declare-fun m!869195 () Bool)

(assert (=> b!934851 m!869195))

(assert (=> b!934837 m!869185))

(assert (=> b!934837 m!869185))

(declare-fun m!869197 () Bool)

(assert (=> b!934837 m!869197))

(declare-fun m!869199 () Bool)

(assert (=> b!934852 m!869199))

(declare-fun m!869201 () Bool)

(assert (=> b!934852 m!869201))

(declare-fun m!869203 () Bool)

(assert (=> b!934852 m!869203))

(declare-fun m!869205 () Bool)

(assert (=> b!934852 m!869205))

(declare-fun m!869207 () Bool)

(assert (=> b!934852 m!869207))

(declare-fun m!869209 () Bool)

(assert (=> b!934852 m!869209))

(declare-fun m!869211 () Bool)

(assert (=> b!934852 m!869211))

(declare-fun m!869213 () Bool)

(assert (=> b!934852 m!869213))

(assert (=> b!934852 m!869193))

(declare-fun m!869215 () Bool)

(assert (=> b!934852 m!869215))

(declare-fun m!869217 () Bool)

(assert (=> b!934852 m!869217))

(assert (=> b!934852 m!869215))

(declare-fun m!869219 () Bool)

(assert (=> b!934852 m!869219))

(assert (=> b!934852 m!869185))

(assert (=> b!934852 m!869205))

(assert (=> b!934852 m!869201))

(declare-fun m!869221 () Bool)

(assert (=> b!934852 m!869221))

(declare-fun m!869223 () Bool)

(assert (=> b!934852 m!869223))

(declare-fun m!869225 () Bool)

(assert (=> b!934852 m!869225))

(assert (=> b!934852 m!869211))

(declare-fun m!869227 () Bool)

(assert (=> b!934852 m!869227))

(declare-fun m!869229 () Bool)

(assert (=> b!934843 m!869229))

(assert (=> d!113149 m!869061))

(declare-fun m!869231 () Bool)

(assert (=> bm!40654 m!869231))

(declare-fun m!869233 () Bool)

(assert (=> b!934855 m!869233))

(assert (=> b!934855 m!869037))

(declare-fun m!869235 () Bool)

(assert (=> b!934855 m!869235))

(assert (=> b!934855 m!869185))

(declare-fun m!869237 () Bool)

(assert (=> b!934855 m!869237))

(assert (=> b!934855 m!869185))

(assert (=> b!934855 m!869233))

(assert (=> b!934855 m!869037))

(assert (=> b!934717 d!113149))

(declare-fun d!113151 () Bool)

(declare-fun e!524908 () Bool)

(assert (=> d!113151 e!524908))

(declare-fun res!629599 () Bool)

(assert (=> d!113151 (=> (not res!629599) (not e!524908))))

(declare-fun lt!421241 () ListLongMap!11991)

(assert (=> d!113151 (= res!629599 (contains!5061 lt!421241 (_1!6658 lt!421117)))))

(declare-fun lt!421242 () List!19075)

(assert (=> d!113151 (= lt!421241 (ListLongMap!11992 lt!421242))))

(declare-fun lt!421243 () Unit!31536)

(declare-fun lt!421240 () Unit!31536)

(assert (=> d!113151 (= lt!421243 lt!421240)))

(declare-datatypes ((Option!486 0))(
  ( (Some!485 (v!12654 V!31849)) (None!484) )
))
(declare-fun getValueByKey!480 (List!19075 (_ BitVec 64)) Option!486)

(assert (=> d!113151 (= (getValueByKey!480 lt!421242 (_1!6658 lt!421117)) (Some!485 (_2!6658 lt!421117)))))

(declare-fun lemmaContainsTupThenGetReturnValue!256 (List!19075 (_ BitVec 64) V!31849) Unit!31536)

(assert (=> d!113151 (= lt!421240 (lemmaContainsTupThenGetReturnValue!256 lt!421242 (_1!6658 lt!421117) (_2!6658 lt!421117)))))

(declare-fun insertStrictlySorted!313 (List!19075 (_ BitVec 64) V!31849) List!19075)

(assert (=> d!113151 (= lt!421242 (insertStrictlySorted!313 (toList!6011 (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6658 lt!421117) (_2!6658 lt!421117)))))

(assert (=> d!113151 (= (+!2808 (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421117) lt!421241)))

(declare-fun b!934861 () Bool)

(declare-fun res!629598 () Bool)

(assert (=> b!934861 (=> (not res!629598) (not e!524908))))

(assert (=> b!934861 (= res!629598 (= (getValueByKey!480 (toList!6011 lt!421241) (_1!6658 lt!421117)) (Some!485 (_2!6658 lt!421117))))))

(declare-fun b!934862 () Bool)

(declare-fun contains!5063 (List!19075 tuple2!13294) Bool)

(assert (=> b!934862 (= e!524908 (contains!5063 (toList!6011 lt!421241) lt!421117))))

(assert (= (and d!113151 res!629599) b!934861))

(assert (= (and b!934861 res!629598) b!934862))

(declare-fun m!869239 () Bool)

(assert (=> d!113151 m!869239))

(declare-fun m!869241 () Bool)

(assert (=> d!113151 m!869241))

(declare-fun m!869243 () Bool)

(assert (=> d!113151 m!869243))

(declare-fun m!869245 () Bool)

(assert (=> d!113151 m!869245))

(declare-fun m!869247 () Bool)

(assert (=> b!934861 m!869247))

(declare-fun m!869249 () Bool)

(assert (=> b!934862 m!869249))

(assert (=> b!934717 d!113151))

(declare-fun d!113153 () Bool)

(declare-fun e!524909 () Bool)

(assert (=> d!113153 e!524909))

(declare-fun res!629601 () Bool)

(assert (=> d!113153 (=> (not res!629601) (not e!524909))))

(declare-fun lt!421245 () ListLongMap!11991)

(assert (=> d!113153 (= res!629601 (contains!5061 lt!421245 (_1!6658 lt!421117)))))

(declare-fun lt!421246 () List!19075)

(assert (=> d!113153 (= lt!421245 (ListLongMap!11992 lt!421246))))

(declare-fun lt!421247 () Unit!31536)

(declare-fun lt!421244 () Unit!31536)

(assert (=> d!113153 (= lt!421247 lt!421244)))

(assert (=> d!113153 (= (getValueByKey!480 lt!421246 (_1!6658 lt!421117)) (Some!485 (_2!6658 lt!421117)))))

(assert (=> d!113153 (= lt!421244 (lemmaContainsTupThenGetReturnValue!256 lt!421246 (_1!6658 lt!421117) (_2!6658 lt!421117)))))

(assert (=> d!113153 (= lt!421246 (insertStrictlySorted!313 (toList!6011 lt!421116) (_1!6658 lt!421117) (_2!6658 lt!421117)))))

(assert (=> d!113153 (= (+!2808 lt!421116 lt!421117) lt!421245)))

(declare-fun b!934863 () Bool)

(declare-fun res!629600 () Bool)

(assert (=> b!934863 (=> (not res!629600) (not e!524909))))

(assert (=> b!934863 (= res!629600 (= (getValueByKey!480 (toList!6011 lt!421245) (_1!6658 lt!421117)) (Some!485 (_2!6658 lt!421117))))))

(declare-fun b!934864 () Bool)

(assert (=> b!934864 (= e!524909 (contains!5063 (toList!6011 lt!421245) lt!421117))))

(assert (= (and d!113153 res!629601) b!934863))

(assert (= (and b!934863 res!629600) b!934864))

(declare-fun m!869251 () Bool)

(assert (=> d!113153 m!869251))

(declare-fun m!869253 () Bool)

(assert (=> d!113153 m!869253))

(declare-fun m!869255 () Bool)

(assert (=> d!113153 m!869255))

(declare-fun m!869257 () Bool)

(assert (=> d!113153 m!869257))

(declare-fun m!869259 () Bool)

(assert (=> b!934863 m!869259))

(declare-fun m!869261 () Bool)

(assert (=> b!934864 m!869261))

(assert (=> b!934717 d!113153))

(declare-fun d!113155 () Bool)

(declare-fun e!524912 () Bool)

(assert (=> d!113155 e!524912))

(declare-fun c!97203 () Bool)

(assert (=> d!113155 (= c!97203 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421250 () Unit!31536)

(declare-fun choose!1544 (array!56266 array!56264 (_ BitVec 32) (_ BitVec 32) V!31849 V!31849 (_ BitVec 64) (_ BitVec 32) Int) Unit!31536)

(assert (=> d!113155 (= lt!421250 (choose!1544 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113155 (validMask!0 mask!1881)))

(assert (=> d!113155 (= (lemmaListMapContainsThenArrayContainsFrom!280 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421250)))

(declare-fun b!934869 () Bool)

(assert (=> b!934869 (= e!524912 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934870 () Bool)

(assert (=> b!934870 (= e!524912 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113155 c!97203) b!934869))

(assert (= (and d!113155 (not c!97203)) b!934870))

(declare-fun m!869263 () Bool)

(assert (=> d!113155 m!869263))

(assert (=> d!113155 m!869061))

(assert (=> b!934869 m!869031))

(assert (=> b!934717 d!113155))

(declare-fun d!113157 () Bool)

(assert (=> d!113157 (contains!5061 (+!2808 lt!421116 (tuple2!13295 lt!421115 lt!421114)) k0!1099)))

(declare-fun lt!421253 () Unit!31536)

(declare-fun choose!1545 (ListLongMap!11991 (_ BitVec 64) V!31849 (_ BitVec 64)) Unit!31536)

(assert (=> d!113157 (= lt!421253 (choose!1545 lt!421116 lt!421115 lt!421114 k0!1099))))

(assert (=> d!113157 (contains!5061 lt!421116 k0!1099)))

(assert (=> d!113157 (= (addStillContains!527 lt!421116 lt!421115 lt!421114 k0!1099) lt!421253)))

(declare-fun bs!26245 () Bool)

(assert (= bs!26245 d!113157))

(declare-fun m!869265 () Bool)

(assert (=> bs!26245 m!869265))

(assert (=> bs!26245 m!869265))

(declare-fun m!869267 () Bool)

(assert (=> bs!26245 m!869267))

(declare-fun m!869269 () Bool)

(assert (=> bs!26245 m!869269))

(assert (=> bs!26245 m!869073))

(assert (=> b!934717 d!113157))

(declare-fun d!113159 () Bool)

(declare-fun e!524915 () Bool)

(assert (=> d!113159 e!524915))

(declare-fun res!629604 () Bool)

(assert (=> d!113159 (=> (not res!629604) (not e!524915))))

(assert (=> d!113159 (= res!629604 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27534 _values!1231))))))

(declare-fun lt!421256 () Unit!31536)

(declare-fun choose!1546 (array!56266 array!56264 (_ BitVec 32) (_ BitVec 32) V!31849 V!31849 (_ BitVec 32) Int) Unit!31536)

(assert (=> d!113159 (= lt!421256 (choose!1546 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113159 (validMask!0 mask!1881)))

(assert (=> d!113159 (= (lemmaListMapRecursiveValidKeyArray!198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421256)))

(declare-fun b!934874 () Bool)

(assert (=> b!934874 (= e!524915 (= (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2808 (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13295 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14255 (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113159 res!629604) b!934874))

(declare-fun b_lambda!14017 () Bool)

(assert (=> (not b_lambda!14017) (not b!934874)))

(assert (=> b!934874 t!27272))

(declare-fun b_and!28889 () Bool)

(assert (= b_and!28887 (and (=> t!27272 result!11925) b_and!28889)))

(declare-fun m!869271 () Bool)

(assert (=> d!113159 m!869271))

(assert (=> d!113159 m!869061))

(declare-fun m!869273 () Bool)

(assert (=> b!934874 m!869273))

(assert (=> b!934874 m!869043))

(assert (=> b!934874 m!869037))

(assert (=> b!934874 m!869045))

(assert (=> b!934874 m!869043))

(assert (=> b!934874 m!869037))

(assert (=> b!934874 m!869027))

(assert (=> b!934874 m!869273))

(declare-fun m!869275 () Bool)

(assert (=> b!934874 m!869275))

(assert (=> b!934874 m!869047))

(assert (=> b!934717 d!113159))

(declare-fun d!113161 () Bool)

(declare-fun e!524920 () Bool)

(assert (=> d!113161 e!524920))

(declare-fun res!629607 () Bool)

(assert (=> d!113161 (=> res!629607 e!524920)))

(declare-fun lt!421265 () Bool)

(assert (=> d!113161 (= res!629607 (not lt!421265))))

(declare-fun lt!421267 () Bool)

(assert (=> d!113161 (= lt!421265 lt!421267)))

(declare-fun lt!421268 () Unit!31536)

(declare-fun e!524921 () Unit!31536)

(assert (=> d!113161 (= lt!421268 e!524921)))

(declare-fun c!97206 () Bool)

(assert (=> d!113161 (= c!97206 lt!421267)))

(declare-fun containsKey!447 (List!19075 (_ BitVec 64)) Bool)

(assert (=> d!113161 (= lt!421267 (containsKey!447 (toList!6011 (+!2808 lt!421116 lt!421117)) k0!1099))))

(assert (=> d!113161 (= (contains!5061 (+!2808 lt!421116 lt!421117) k0!1099) lt!421265)))

(declare-fun b!934881 () Bool)

(declare-fun lt!421266 () Unit!31536)

(assert (=> b!934881 (= e!524921 lt!421266)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!343 (List!19075 (_ BitVec 64)) Unit!31536)

(assert (=> b!934881 (= lt!421266 (lemmaContainsKeyImpliesGetValueByKeyDefined!343 (toList!6011 (+!2808 lt!421116 lt!421117)) k0!1099))))

(declare-fun isDefined!352 (Option!486) Bool)

(assert (=> b!934881 (isDefined!352 (getValueByKey!480 (toList!6011 (+!2808 lt!421116 lt!421117)) k0!1099))))

(declare-fun b!934882 () Bool)

(declare-fun Unit!31540 () Unit!31536)

(assert (=> b!934882 (= e!524921 Unit!31540)))

(declare-fun b!934883 () Bool)

(assert (=> b!934883 (= e!524920 (isDefined!352 (getValueByKey!480 (toList!6011 (+!2808 lt!421116 lt!421117)) k0!1099)))))

(assert (= (and d!113161 c!97206) b!934881))

(assert (= (and d!113161 (not c!97206)) b!934882))

(assert (= (and d!113161 (not res!629607)) b!934883))

(declare-fun m!869277 () Bool)

(assert (=> d!113161 m!869277))

(declare-fun m!869279 () Bool)

(assert (=> b!934881 m!869279))

(declare-fun m!869281 () Bool)

(assert (=> b!934881 m!869281))

(assert (=> b!934881 m!869281))

(declare-fun m!869283 () Bool)

(assert (=> b!934881 m!869283))

(assert (=> b!934883 m!869281))

(assert (=> b!934883 m!869281))

(assert (=> b!934883 m!869283))

(assert (=> b!934717 d!113161))

(declare-fun d!113163 () Bool)

(declare-fun res!629616 () Bool)

(declare-fun e!524930 () Bool)

(assert (=> d!113163 (=> res!629616 e!524930)))

(assert (=> d!113163 (= res!629616 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)))))

(assert (=> d!113163 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19071) e!524930)))

(declare-fun b!934894 () Bool)

(declare-fun e!524932 () Bool)

(declare-fun call!40663 () Bool)

(assert (=> b!934894 (= e!524932 call!40663)))

(declare-fun b!934895 () Bool)

(declare-fun e!524931 () Bool)

(declare-fun contains!5064 (List!19074 (_ BitVec 64)) Bool)

(assert (=> b!934895 (= e!524931 (contains!5064 Nil!19071 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934896 () Bool)

(declare-fun e!524933 () Bool)

(assert (=> b!934896 (= e!524930 e!524933)))

(declare-fun res!629614 () Bool)

(assert (=> b!934896 (=> (not res!629614) (not e!524933))))

(assert (=> b!934896 (= res!629614 (not e!524931))))

(declare-fun res!629615 () Bool)

(assert (=> b!934896 (=> (not res!629615) (not e!524931))))

(assert (=> b!934896 (= res!629615 (validKeyInArray!0 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934897 () Bool)

(assert (=> b!934897 (= e!524932 call!40663)))

(declare-fun c!97209 () Bool)

(declare-fun bm!40660 () Bool)

(assert (=> bm!40660 (= call!40663 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97209 (Cons!19070 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19071) Nil!19071)))))

(declare-fun b!934898 () Bool)

(assert (=> b!934898 (= e!524933 e!524932)))

(assert (=> b!934898 (= c!97209 (validKeyInArray!0 (select (arr!27076 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113163 (not res!629616)) b!934896))

(assert (= (and b!934896 res!629615) b!934895))

(assert (= (and b!934896 res!629614) b!934898))

(assert (= (and b!934898 c!97209) b!934894))

(assert (= (and b!934898 (not c!97209)) b!934897))

(assert (= (or b!934894 b!934897) bm!40660))

(assert (=> b!934895 m!869027))

(assert (=> b!934895 m!869027))

(declare-fun m!869285 () Bool)

(assert (=> b!934895 m!869285))

(assert (=> b!934896 m!869027))

(assert (=> b!934896 m!869027))

(assert (=> b!934896 m!869135))

(assert (=> bm!40660 m!869027))

(declare-fun m!869287 () Bool)

(assert (=> bm!40660 m!869287))

(assert (=> b!934898 m!869027))

(assert (=> b!934898 m!869027))

(assert (=> b!934898 m!869135))

(assert (=> b!934717 d!113163))

(declare-fun d!113165 () Bool)

(declare-fun c!97212 () Bool)

(assert (=> d!113165 (= c!97212 ((_ is ValueCellFull!9600) (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!524936 () V!31849)

(assert (=> d!113165 (= (get!14255 (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!524936)))

(declare-fun b!934903 () Bool)

(declare-fun get!14256 (ValueCell!9600 V!31849) V!31849)

(assert (=> b!934903 (= e!524936 (get!14256 (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!934904 () Bool)

(declare-fun get!14257 (ValueCell!9600 V!31849) V!31849)

(assert (=> b!934904 (= e!524936 (get!14257 (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113165 c!97212) b!934903))

(assert (= (and d!113165 (not c!97212)) b!934904))

(assert (=> b!934903 m!869043))

(assert (=> b!934903 m!869037))

(declare-fun m!869289 () Bool)

(assert (=> b!934903 m!869289))

(assert (=> b!934904 m!869043))

(assert (=> b!934904 m!869037))

(declare-fun m!869291 () Bool)

(assert (=> b!934904 m!869291))

(assert (=> b!934717 d!113165))

(declare-fun d!113167 () Bool)

(assert (=> d!113167 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19071)))

(declare-fun lt!421271 () Unit!31536)

(declare-fun choose!39 (array!56266 (_ BitVec 32) (_ BitVec 32)) Unit!31536)

(assert (=> d!113167 (= lt!421271 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113167 (bvslt (size!27535 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113167 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421271)))

(declare-fun bs!26246 () Bool)

(assert (= bs!26246 d!113167))

(assert (=> bs!26246 m!869049))

(declare-fun m!869293 () Bool)

(assert (=> bs!26246 m!869293))

(assert (=> b!934717 d!113167))

(declare-fun d!113169 () Bool)

(assert (=> d!113169 (= (validKeyInArray!0 lt!421115) (and (not (= lt!421115 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421115 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934713 d!113169))

(declare-fun d!113171 () Bool)

(declare-fun get!14258 (Option!486) V!31849)

(assert (=> d!113171 (= (apply!814 lt!421116 k0!1099) (get!14258 (getValueByKey!480 (toList!6011 lt!421116) k0!1099)))))

(declare-fun bs!26247 () Bool)

(assert (= bs!26247 d!113171))

(declare-fun m!869295 () Bool)

(assert (=> bs!26247 m!869295))

(assert (=> bs!26247 m!869295))

(declare-fun m!869297 () Bool)

(assert (=> bs!26247 m!869297))

(assert (=> b!934708 d!113171))

(declare-fun d!113173 () Bool)

(declare-fun e!524937 () Bool)

(assert (=> d!113173 e!524937))

(declare-fun res!629617 () Bool)

(assert (=> d!113173 (=> res!629617 e!524937)))

(declare-fun lt!421272 () Bool)

(assert (=> d!113173 (= res!629617 (not lt!421272))))

(declare-fun lt!421274 () Bool)

(assert (=> d!113173 (= lt!421272 lt!421274)))

(declare-fun lt!421275 () Unit!31536)

(declare-fun e!524938 () Unit!31536)

(assert (=> d!113173 (= lt!421275 e!524938)))

(declare-fun c!97213 () Bool)

(assert (=> d!113173 (= c!97213 lt!421274)))

(assert (=> d!113173 (= lt!421274 (containsKey!447 (toList!6011 lt!421116) k0!1099))))

(assert (=> d!113173 (= (contains!5061 lt!421116 k0!1099) lt!421272)))

(declare-fun b!934905 () Bool)

(declare-fun lt!421273 () Unit!31536)

(assert (=> b!934905 (= e!524938 lt!421273)))

(assert (=> b!934905 (= lt!421273 (lemmaContainsKeyImpliesGetValueByKeyDefined!343 (toList!6011 lt!421116) k0!1099))))

(assert (=> b!934905 (isDefined!352 (getValueByKey!480 (toList!6011 lt!421116) k0!1099))))

(declare-fun b!934906 () Bool)

(declare-fun Unit!31541 () Unit!31536)

(assert (=> b!934906 (= e!524938 Unit!31541)))

(declare-fun b!934907 () Bool)

(assert (=> b!934907 (= e!524937 (isDefined!352 (getValueByKey!480 (toList!6011 lt!421116) k0!1099)))))

(assert (= (and d!113173 c!97213) b!934905))

(assert (= (and d!113173 (not c!97213)) b!934906))

(assert (= (and d!113173 (not res!629617)) b!934907))

(declare-fun m!869299 () Bool)

(assert (=> d!113173 m!869299))

(declare-fun m!869301 () Bool)

(assert (=> b!934905 m!869301))

(assert (=> b!934905 m!869295))

(assert (=> b!934905 m!869295))

(declare-fun m!869303 () Bool)

(assert (=> b!934905 m!869303))

(assert (=> b!934907 m!869295))

(assert (=> b!934907 m!869295))

(assert (=> b!934907 m!869303))

(assert (=> b!934718 d!113173))

(declare-fun call!40666 () ListLongMap!11991)

(declare-fun bm!40661 () Bool)

(assert (=> bm!40661 (= call!40666 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun bm!40662 () Bool)

(declare-fun call!40668 () ListLongMap!11991)

(assert (=> bm!40662 (= call!40668 call!40666)))

(declare-fun bm!40663 () Bool)

(declare-fun call!40669 () Bool)

(declare-fun lt!421280 () ListLongMap!11991)

(assert (=> bm!40663 (= call!40669 (contains!5061 lt!421280 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934908 () Bool)

(declare-fun e!524941 () Unit!31536)

(declare-fun Unit!31542 () Unit!31536)

(assert (=> b!934908 (= e!524941 Unit!31542)))

(declare-fun d!113175 () Bool)

(declare-fun e!524948 () Bool)

(assert (=> d!113175 e!524948))

(declare-fun res!629618 () Bool)

(assert (=> d!113175 (=> (not res!629618) (not e!524948))))

(assert (=> d!113175 (= res!629618 (or (bvsge from!1844 (size!27535 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27535 _keys!1487)))))))

(declare-fun lt!421292 () ListLongMap!11991)

(assert (=> d!113175 (= lt!421280 lt!421292)))

(declare-fun lt!421291 () Unit!31536)

(assert (=> d!113175 (= lt!421291 e!524941)))

(declare-fun c!97214 () Bool)

(declare-fun e!524946 () Bool)

(assert (=> d!113175 (= c!97214 e!524946)))

(declare-fun res!629623 () Bool)

(assert (=> d!113175 (=> (not res!629623) (not e!524946))))

(assert (=> d!113175 (= res!629623 (bvslt from!1844 (size!27535 _keys!1487)))))

(declare-fun e!524945 () ListLongMap!11991)

(assert (=> d!113175 (= lt!421292 e!524945)))

(declare-fun c!97218 () Bool)

(assert (=> d!113175 (= c!97218 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113175 (validMask!0 mask!1881)))

(assert (=> d!113175 (= (getCurrentListMap!3248 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421280)))

(declare-fun b!934909 () Bool)

(declare-fun e!524949 () Bool)

(declare-fun e!524951 () Bool)

(assert (=> b!934909 (= e!524949 e!524951)))

(declare-fun res!629622 () Bool)

(assert (=> b!934909 (=> (not res!629622) (not e!524951))))

(assert (=> b!934909 (= res!629622 (contains!5061 lt!421280 (select (arr!27076 _keys!1487) from!1844)))))

(assert (=> b!934909 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27535 _keys!1487)))))

(declare-fun b!934910 () Bool)

(declare-fun e!524944 () Bool)

(declare-fun e!524950 () Bool)

(assert (=> b!934910 (= e!524944 e!524950)))

(declare-fun res!629621 () Bool)

(assert (=> b!934910 (= res!629621 call!40669)))

(assert (=> b!934910 (=> (not res!629621) (not e!524950))))

(declare-fun b!934911 () Bool)

(declare-fun e!524939 () Bool)

(declare-fun e!524947 () Bool)

(assert (=> b!934911 (= e!524939 e!524947)))

(declare-fun res!629625 () Bool)

(declare-fun call!40664 () Bool)

(assert (=> b!934911 (= res!629625 call!40664)))

(assert (=> b!934911 (=> (not res!629625) (not e!524947))))

(declare-fun b!934912 () Bool)

(assert (=> b!934912 (= e!524946 (validKeyInArray!0 (select (arr!27076 _keys!1487) from!1844)))))

(declare-fun b!934913 () Bool)

(assert (=> b!934913 (= e!524950 (= (apply!814 lt!421280 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934914 () Bool)

(declare-fun e!524942 () ListLongMap!11991)

(declare-fun call!40665 () ListLongMap!11991)

(assert (=> b!934914 (= e!524942 call!40665)))

(declare-fun bm!40664 () Bool)

(assert (=> bm!40664 (= call!40664 (contains!5061 lt!421280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934915 () Bool)

(assert (=> b!934915 (= e!524947 (= (apply!814 lt!421280 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934916 () Bool)

(declare-fun e!524943 () Bool)

(assert (=> b!934916 (= e!524943 (validKeyInArray!0 (select (arr!27076 _keys!1487) from!1844)))))

(declare-fun b!934917 () Bool)

(declare-fun res!629619 () Bool)

(assert (=> b!934917 (=> (not res!629619) (not e!524948))))

(assert (=> b!934917 (= res!629619 e!524939)))

(declare-fun c!97215 () Bool)

(assert (=> b!934917 (= c!97215 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934918 () Bool)

(declare-fun call!40670 () ListLongMap!11991)

(assert (=> b!934918 (= e!524942 call!40670)))

(declare-fun b!934919 () Bool)

(declare-fun e!524940 () ListLongMap!11991)

(assert (=> b!934919 (= e!524945 e!524940)))

(declare-fun c!97219 () Bool)

(assert (=> b!934919 (= c!97219 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934920 () Bool)

(assert (=> b!934920 (= e!524944 (not call!40669))))

(declare-fun b!934921 () Bool)

(assert (=> b!934921 (= e!524940 call!40665)))

(declare-fun b!934922 () Bool)

(assert (=> b!934922 (= e!524948 e!524944)))

(declare-fun c!97216 () Bool)

(assert (=> b!934922 (= c!97216 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934923 () Bool)

(declare-fun call!40667 () ListLongMap!11991)

(assert (=> b!934923 (= e!524945 (+!2808 call!40667 (tuple2!13295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934924 () Bool)

(declare-fun lt!421285 () Unit!31536)

(assert (=> b!934924 (= e!524941 lt!421285)))

(declare-fun lt!421293 () ListLongMap!11991)

(assert (=> b!934924 (= lt!421293 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421283 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421282 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421282 (select (arr!27076 _keys!1487) from!1844))))

(declare-fun lt!421296 () Unit!31536)

(assert (=> b!934924 (= lt!421296 (addStillContains!527 lt!421293 lt!421283 zeroValue!1173 lt!421282))))

(assert (=> b!934924 (contains!5061 (+!2808 lt!421293 (tuple2!13295 lt!421283 zeroValue!1173)) lt!421282)))

(declare-fun lt!421279 () Unit!31536)

(assert (=> b!934924 (= lt!421279 lt!421296)))

(declare-fun lt!421277 () ListLongMap!11991)

(assert (=> b!934924 (= lt!421277 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421290 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421290 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421288 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421288 (select (arr!27076 _keys!1487) from!1844))))

(declare-fun lt!421287 () Unit!31536)

(assert (=> b!934924 (= lt!421287 (addApplyDifferent!419 lt!421277 lt!421290 minValue!1173 lt!421288))))

(assert (=> b!934924 (= (apply!814 (+!2808 lt!421277 (tuple2!13295 lt!421290 minValue!1173)) lt!421288) (apply!814 lt!421277 lt!421288))))

(declare-fun lt!421297 () Unit!31536)

(assert (=> b!934924 (= lt!421297 lt!421287)))

(declare-fun lt!421284 () ListLongMap!11991)

(assert (=> b!934924 (= lt!421284 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421281 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421281 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421278 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421278 (select (arr!27076 _keys!1487) from!1844))))

(declare-fun lt!421295 () Unit!31536)

(assert (=> b!934924 (= lt!421295 (addApplyDifferent!419 lt!421284 lt!421281 zeroValue!1173 lt!421278))))

(assert (=> b!934924 (= (apply!814 (+!2808 lt!421284 (tuple2!13295 lt!421281 zeroValue!1173)) lt!421278) (apply!814 lt!421284 lt!421278))))

(declare-fun lt!421289 () Unit!31536)

(assert (=> b!934924 (= lt!421289 lt!421295)))

(declare-fun lt!421286 () ListLongMap!11991)

(assert (=> b!934924 (= lt!421286 (getCurrentListMapNoExtraKeys!3300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421294 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421276 () (_ BitVec 64))

(assert (=> b!934924 (= lt!421276 (select (arr!27076 _keys!1487) from!1844))))

(assert (=> b!934924 (= lt!421285 (addApplyDifferent!419 lt!421286 lt!421294 minValue!1173 lt!421276))))

(assert (=> b!934924 (= (apply!814 (+!2808 lt!421286 (tuple2!13295 lt!421294 minValue!1173)) lt!421276) (apply!814 lt!421286 lt!421276))))

(declare-fun b!934925 () Bool)

(declare-fun res!629620 () Bool)

(assert (=> b!934925 (=> (not res!629620) (not e!524948))))

(assert (=> b!934925 (= res!629620 e!524949)))

(declare-fun res!629626 () Bool)

(assert (=> b!934925 (=> res!629626 e!524949)))

(assert (=> b!934925 (= res!629626 (not e!524943))))

(declare-fun res!629624 () Bool)

(assert (=> b!934925 (=> (not res!629624) (not e!524943))))

(assert (=> b!934925 (= res!629624 (bvslt from!1844 (size!27535 _keys!1487)))))

(declare-fun bm!40665 () Bool)

(assert (=> bm!40665 (= call!40665 call!40667)))

(declare-fun b!934926 () Bool)

(assert (=> b!934926 (= e!524939 (not call!40664))))

(declare-fun bm!40666 () Bool)

(assert (=> bm!40666 (= call!40670 call!40668)))

(declare-fun b!934927 () Bool)

(assert (=> b!934927 (= e!524951 (= (apply!814 lt!421280 (select (arr!27076 _keys!1487) from!1844)) (get!14255 (select (arr!27075 _values!1231) from!1844) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934927 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27534 _values!1231)))))

(assert (=> b!934927 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27535 _keys!1487)))))

(declare-fun b!934928 () Bool)

(declare-fun c!97217 () Bool)

(assert (=> b!934928 (= c!97217 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934928 (= e!524940 e!524942)))

(declare-fun bm!40667 () Bool)

(assert (=> bm!40667 (= call!40667 (+!2808 (ite c!97218 call!40666 (ite c!97219 call!40668 call!40670)) (ite (or c!97218 c!97219) (tuple2!13295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113175 c!97218) b!934923))

(assert (= (and d!113175 (not c!97218)) b!934919))

(assert (= (and b!934919 c!97219) b!934921))

(assert (= (and b!934919 (not c!97219)) b!934928))

(assert (= (and b!934928 c!97217) b!934914))

(assert (= (and b!934928 (not c!97217)) b!934918))

(assert (= (or b!934914 b!934918) bm!40666))

(assert (= (or b!934921 bm!40666) bm!40662))

(assert (= (or b!934921 b!934914) bm!40665))

(assert (= (or b!934923 bm!40662) bm!40661))

(assert (= (or b!934923 bm!40665) bm!40667))

(assert (= (and d!113175 res!629623) b!934912))

(assert (= (and d!113175 c!97214) b!934924))

(assert (= (and d!113175 (not c!97214)) b!934908))

(assert (= (and d!113175 res!629618) b!934925))

(assert (= (and b!934925 res!629624) b!934916))

(assert (= (and b!934925 (not res!629626)) b!934909))

(assert (= (and b!934909 res!629622) b!934927))

(assert (= (and b!934925 res!629620) b!934917))

(assert (= (and b!934917 c!97215) b!934911))

(assert (= (and b!934917 (not c!97215)) b!934926))

(assert (= (and b!934911 res!629625) b!934915))

(assert (= (or b!934911 b!934926) bm!40664))

(assert (= (and b!934917 res!629619) b!934922))

(assert (= (and b!934922 c!97216) b!934910))

(assert (= (and b!934922 (not c!97216)) b!934920))

(assert (= (and b!934910 res!629621) b!934913))

(assert (= (or b!934910 b!934920) bm!40663))

(declare-fun b_lambda!14019 () Bool)

(assert (=> (not b_lambda!14019) (not b!934927)))

(assert (=> b!934927 t!27272))

(declare-fun b_and!28891 () Bool)

(assert (= b_and!28889 (and (=> t!27272 result!11925) b_and!28891)))

(declare-fun m!869305 () Bool)

(assert (=> bm!40667 m!869305))

(declare-fun m!869307 () Bool)

(assert (=> b!934912 m!869307))

(assert (=> b!934912 m!869307))

(declare-fun m!869309 () Bool)

(assert (=> b!934912 m!869309))

(assert (=> b!934916 m!869307))

(assert (=> b!934916 m!869307))

(assert (=> b!934916 m!869309))

(declare-fun m!869311 () Bool)

(assert (=> b!934913 m!869311))

(declare-fun m!869313 () Bool)

(assert (=> bm!40663 m!869313))

(declare-fun m!869315 () Bool)

(assert (=> bm!40661 m!869315))

(declare-fun m!869317 () Bool)

(assert (=> b!934923 m!869317))

(assert (=> b!934909 m!869307))

(assert (=> b!934909 m!869307))

(declare-fun m!869319 () Bool)

(assert (=> b!934909 m!869319))

(declare-fun m!869321 () Bool)

(assert (=> b!934924 m!869321))

(declare-fun m!869323 () Bool)

(assert (=> b!934924 m!869323))

(declare-fun m!869325 () Bool)

(assert (=> b!934924 m!869325))

(declare-fun m!869327 () Bool)

(assert (=> b!934924 m!869327))

(declare-fun m!869329 () Bool)

(assert (=> b!934924 m!869329))

(declare-fun m!869331 () Bool)

(assert (=> b!934924 m!869331))

(declare-fun m!869333 () Bool)

(assert (=> b!934924 m!869333))

(declare-fun m!869335 () Bool)

(assert (=> b!934924 m!869335))

(assert (=> b!934924 m!869315))

(declare-fun m!869337 () Bool)

(assert (=> b!934924 m!869337))

(declare-fun m!869339 () Bool)

(assert (=> b!934924 m!869339))

(assert (=> b!934924 m!869337))

(declare-fun m!869341 () Bool)

(assert (=> b!934924 m!869341))

(assert (=> b!934924 m!869307))

(assert (=> b!934924 m!869327))

(assert (=> b!934924 m!869323))

(declare-fun m!869343 () Bool)

(assert (=> b!934924 m!869343))

(declare-fun m!869345 () Bool)

(assert (=> b!934924 m!869345))

(declare-fun m!869347 () Bool)

(assert (=> b!934924 m!869347))

(assert (=> b!934924 m!869333))

(declare-fun m!869349 () Bool)

(assert (=> b!934924 m!869349))

(declare-fun m!869351 () Bool)

(assert (=> b!934915 m!869351))

(assert (=> d!113175 m!869061))

(declare-fun m!869353 () Bool)

(assert (=> bm!40664 m!869353))

(declare-fun m!869355 () Bool)

(assert (=> b!934927 m!869355))

(assert (=> b!934927 m!869037))

(declare-fun m!869357 () Bool)

(assert (=> b!934927 m!869357))

(assert (=> b!934927 m!869307))

(declare-fun m!869359 () Bool)

(assert (=> b!934927 m!869359))

(assert (=> b!934927 m!869307))

(assert (=> b!934927 m!869355))

(assert (=> b!934927 m!869037))

(assert (=> b!934718 d!113175))

(declare-fun bm!40670 () Bool)

(declare-fun call!40673 () Bool)

(assert (=> bm!40670 (= call!40673 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!934937 () Bool)

(declare-fun e!524960 () Bool)

(declare-fun e!524959 () Bool)

(assert (=> b!934937 (= e!524960 e!524959)))

(declare-fun lt!421306 () (_ BitVec 64))

(assert (=> b!934937 (= lt!421306 (select (arr!27076 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421304 () Unit!31536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56266 (_ BitVec 64) (_ BitVec 32)) Unit!31536)

(assert (=> b!934937 (= lt!421304 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421306 #b00000000000000000000000000000000))))

(assert (=> b!934937 (arrayContainsKey!0 _keys!1487 lt!421306 #b00000000000000000000000000000000)))

(declare-fun lt!421305 () Unit!31536)

(assert (=> b!934937 (= lt!421305 lt!421304)))

(declare-fun res!629632 () Bool)

(declare-datatypes ((SeekEntryResult!8978 0))(
  ( (MissingZero!8978 (index!38283 (_ BitVec 32))) (Found!8978 (index!38284 (_ BitVec 32))) (Intermediate!8978 (undefined!9790 Bool) (index!38285 (_ BitVec 32)) (x!80175 (_ BitVec 32))) (Undefined!8978) (MissingVacant!8978 (index!38286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56266 (_ BitVec 32)) SeekEntryResult!8978)

(assert (=> b!934937 (= res!629632 (= (seekEntryOrOpen!0 (select (arr!27076 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8978 #b00000000000000000000000000000000)))))

(assert (=> b!934937 (=> (not res!629632) (not e!524959))))

(declare-fun d!113177 () Bool)

(declare-fun res!629631 () Bool)

(declare-fun e!524958 () Bool)

(assert (=> d!113177 (=> res!629631 e!524958)))

(assert (=> d!113177 (= res!629631 (bvsge #b00000000000000000000000000000000 (size!27535 _keys!1487)))))

(assert (=> d!113177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!524958)))

(declare-fun b!934938 () Bool)

(assert (=> b!934938 (= e!524959 call!40673)))

(declare-fun b!934939 () Bool)

(assert (=> b!934939 (= e!524958 e!524960)))

(declare-fun c!97222 () Bool)

(assert (=> b!934939 (= c!97222 (validKeyInArray!0 (select (arr!27076 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934940 () Bool)

(assert (=> b!934940 (= e!524960 call!40673)))

(assert (= (and d!113177 (not res!629631)) b!934939))

(assert (= (and b!934939 c!97222) b!934937))

(assert (= (and b!934939 (not c!97222)) b!934940))

(assert (= (and b!934937 res!629632) b!934938))

(assert (= (or b!934938 b!934940) bm!40670))

(declare-fun m!869361 () Bool)

(assert (=> bm!40670 m!869361))

(declare-fun m!869363 () Bool)

(assert (=> b!934937 m!869363))

(declare-fun m!869365 () Bool)

(assert (=> b!934937 m!869365))

(declare-fun m!869367 () Bool)

(assert (=> b!934937 m!869367))

(assert (=> b!934937 m!869363))

(declare-fun m!869369 () Bool)

(assert (=> b!934937 m!869369))

(assert (=> b!934939 m!869363))

(assert (=> b!934939 m!869363))

(declare-fun m!869371 () Bool)

(assert (=> b!934939 m!869371))

(assert (=> b!934716 d!113177))

(declare-fun d!113179 () Bool)

(declare-fun res!629637 () Bool)

(declare-fun e!524965 () Bool)

(assert (=> d!113179 (=> res!629637 e!524965)))

(assert (=> d!113179 (= res!629637 (= (select (arr!27076 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113179 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!524965)))

(declare-fun b!934945 () Bool)

(declare-fun e!524966 () Bool)

(assert (=> b!934945 (= e!524965 e!524966)))

(declare-fun res!629638 () Bool)

(assert (=> b!934945 (=> (not res!629638) (not e!524966))))

(assert (=> b!934945 (= res!629638 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487)))))

(declare-fun b!934946 () Bool)

(assert (=> b!934946 (= e!524966 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113179 (not res!629637)) b!934945))

(assert (= (and b!934945 res!629638) b!934946))

(assert (=> d!113179 m!869307))

(declare-fun m!869373 () Bool)

(assert (=> b!934946 m!869373))

(assert (=> b!934712 d!113179))

(declare-fun d!113181 () Bool)

(declare-fun res!629643 () Bool)

(declare-fun e!524971 () Bool)

(assert (=> d!113181 (=> res!629643 e!524971)))

(assert (=> d!113181 (= res!629643 ((_ is Nil!19071) Nil!19071))))

(assert (=> d!113181 (= (noDuplicate!1349 Nil!19071) e!524971)))

(declare-fun b!934951 () Bool)

(declare-fun e!524972 () Bool)

(assert (=> b!934951 (= e!524971 e!524972)))

(declare-fun res!629644 () Bool)

(assert (=> b!934951 (=> (not res!629644) (not e!524972))))

(assert (=> b!934951 (= res!629644 (not (contains!5064 (t!27273 Nil!19071) (h!20216 Nil!19071))))))

(declare-fun b!934952 () Bool)

(assert (=> b!934952 (= e!524972 (noDuplicate!1349 (t!27273 Nil!19071)))))

(assert (= (and d!113181 (not res!629643)) b!934951))

(assert (= (and b!934951 res!629644) b!934952))

(declare-fun m!869375 () Bool)

(assert (=> b!934951 m!869375))

(declare-fun m!869377 () Bool)

(assert (=> b!934952 m!869377))

(assert (=> b!934707 d!113181))

(declare-fun d!113183 () Bool)

(assert (=> d!113183 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934711 d!113183))

(declare-fun d!113185 () Bool)

(declare-fun res!629647 () Bool)

(declare-fun e!524973 () Bool)

(assert (=> d!113185 (=> res!629647 e!524973)))

(assert (=> d!113185 (= res!629647 (bvsge #b00000000000000000000000000000000 (size!27535 _keys!1487)))))

(assert (=> d!113185 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19071) e!524973)))

(declare-fun b!934953 () Bool)

(declare-fun e!524975 () Bool)

(declare-fun call!40674 () Bool)

(assert (=> b!934953 (= e!524975 call!40674)))

(declare-fun b!934954 () Bool)

(declare-fun e!524974 () Bool)

(assert (=> b!934954 (= e!524974 (contains!5064 Nil!19071 (select (arr!27076 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934955 () Bool)

(declare-fun e!524976 () Bool)

(assert (=> b!934955 (= e!524973 e!524976)))

(declare-fun res!629645 () Bool)

(assert (=> b!934955 (=> (not res!629645) (not e!524976))))

(assert (=> b!934955 (= res!629645 (not e!524974))))

(declare-fun res!629646 () Bool)

(assert (=> b!934955 (=> (not res!629646) (not e!524974))))

(assert (=> b!934955 (= res!629646 (validKeyInArray!0 (select (arr!27076 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934956 () Bool)

(assert (=> b!934956 (= e!524975 call!40674)))

(declare-fun bm!40671 () Bool)

(declare-fun c!97223 () Bool)

(assert (=> bm!40671 (= call!40674 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97223 (Cons!19070 (select (arr!27076 _keys!1487) #b00000000000000000000000000000000) Nil!19071) Nil!19071)))))

(declare-fun b!934957 () Bool)

(assert (=> b!934957 (= e!524976 e!524975)))

(assert (=> b!934957 (= c!97223 (validKeyInArray!0 (select (arr!27076 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113185 (not res!629647)) b!934955))

(assert (= (and b!934955 res!629646) b!934954))

(assert (= (and b!934955 res!629645) b!934957))

(assert (= (and b!934957 c!97223) b!934953))

(assert (= (and b!934957 (not c!97223)) b!934956))

(assert (= (or b!934953 b!934956) bm!40671))

(assert (=> b!934954 m!869363))

(assert (=> b!934954 m!869363))

(declare-fun m!869379 () Bool)

(assert (=> b!934954 m!869379))

(assert (=> b!934955 m!869363))

(assert (=> b!934955 m!869363))

(assert (=> b!934955 m!869371))

(assert (=> bm!40671 m!869363))

(declare-fun m!869381 () Bool)

(assert (=> bm!40671 m!869381))

(assert (=> b!934957 m!869363))

(assert (=> b!934957 m!869363))

(assert (=> b!934957 m!869371))

(assert (=> b!934714 d!113185))

(declare-fun d!113187 () Bool)

(assert (=> d!113187 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79500 d!113187))

(declare-fun d!113189 () Bool)

(assert (=> d!113189 (= (array_inv!21070 _values!1231) (bvsge (size!27534 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79500 d!113189))

(declare-fun d!113191 () Bool)

(assert (=> d!113191 (= (array_inv!21071 _keys!1487) (bvsge (size!27535 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79500 d!113191))

(declare-fun b!934964 () Bool)

(declare-fun e!524981 () Bool)

(assert (=> b!934964 (= e!524981 tp_is_empty!20163)))

(declare-fun condMapEmpty!32013 () Bool)

(declare-fun mapDefault!32013 () ValueCell!9600)

(assert (=> mapNonEmpty!32007 (= condMapEmpty!32013 (= mapRest!32007 ((as const (Array (_ BitVec 32) ValueCell!9600)) mapDefault!32013)))))

(declare-fun e!524982 () Bool)

(declare-fun mapRes!32013 () Bool)

(assert (=> mapNonEmpty!32007 (= tp!61411 (and e!524982 mapRes!32013))))

(declare-fun b!934965 () Bool)

(assert (=> b!934965 (= e!524982 tp_is_empty!20163)))

(declare-fun mapIsEmpty!32013 () Bool)

(assert (=> mapIsEmpty!32013 mapRes!32013))

(declare-fun mapNonEmpty!32013 () Bool)

(declare-fun tp!61421 () Bool)

(assert (=> mapNonEmpty!32013 (= mapRes!32013 (and tp!61421 e!524981))))

(declare-fun mapValue!32013 () ValueCell!9600)

(declare-fun mapKey!32013 () (_ BitVec 32))

(declare-fun mapRest!32013 () (Array (_ BitVec 32) ValueCell!9600))

(assert (=> mapNonEmpty!32013 (= mapRest!32007 (store mapRest!32013 mapKey!32013 mapValue!32013))))

(assert (= (and mapNonEmpty!32007 condMapEmpty!32013) mapIsEmpty!32013))

(assert (= (and mapNonEmpty!32007 (not condMapEmpty!32013)) mapNonEmpty!32013))

(assert (= (and mapNonEmpty!32013 ((_ is ValueCellFull!9600) mapValue!32013)) b!934964))

(assert (= (and mapNonEmpty!32007 ((_ is ValueCellFull!9600) mapDefault!32013)) b!934965))

(declare-fun m!869383 () Bool)

(assert (=> mapNonEmpty!32013 m!869383))

(declare-fun b_lambda!14021 () Bool)

(assert (= b_lambda!14017 (or (and start!79500 b_free!17655) b_lambda!14021)))

(declare-fun b_lambda!14023 () Bool)

(assert (= b_lambda!14013 (or (and start!79500 b_free!17655) b_lambda!14023)))

(declare-fun b_lambda!14025 () Bool)

(assert (= b_lambda!14015 (or (and start!79500 b_free!17655) b_lambda!14025)))

(declare-fun b_lambda!14027 () Bool)

(assert (= b_lambda!14019 (or (and start!79500 b_free!17655) b_lambda!14027)))

(check-sat (not b!934957) (not b!934903) (not b!934955) (not b!934874) (not bm!40664) (not b!934861) (not b!934841) (not d!113157) (not b!934834) (not b!934896) (not bm!40646) b_and!28891 (not b!934869) (not d!113155) (not b!934816) (not bm!40670) (not b!934904) (not b!934883) (not b!934830) (not b!934952) (not b!934840) (not bm!40661) (not b_lambda!14011) (not bm!40667) (not b!934916) (not b_lambda!14023) (not mapNonEmpty!32013) (not b!934913) (not b_lambda!14027) (not bm!40651) (not b_lambda!14021) (not b!934863) (not d!113175) (not d!113173) (not b!934937) (not b!934823) (not b!934905) (not d!113153) (not bm!40654) (not b!934844) tp_is_empty!20163 (not b!934819) (not bm!40657) (not b!934907) (not b!934923) (not b!934954) (not b!934924) (not b!934864) (not b!934852) (not b!934831) (not d!113159) (not b!934895) (not d!113147) (not d!113151) (not d!113149) (not d!113167) (not b_next!17655) (not d!113171) (not b!934915) (not b!934837) (not bm!40647) (not b!934951) (not b!934909) (not bm!40650) (not b!934820) (not b!934898) (not b!934822) (not b!934939) (not bm!40671) (not b!934855) (not b!934862) (not b!934927) (not b!934881) (not bm!40644) (not b!934843) (not b!934946) (not b!934851) (not bm!40653) (not bm!40660) (not d!113161) (not b_lambda!14025) (not b!934912) (not bm!40663))
(check-sat b_and!28891 (not b_next!17655))
