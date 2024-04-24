; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79706 () Bool)

(assert start!79706)

(declare-fun b_free!17659 () Bool)

(declare-fun b_next!17659 () Bool)

(assert (=> start!79706 (= b_free!17659 (not b_next!17659))))

(declare-fun tp!61428 () Bool)

(declare-fun b_and!28903 () Bool)

(assert (=> start!79706 (= tp!61428 b_and!28903)))

(declare-fun mapNonEmpty!32016 () Bool)

(declare-fun mapRes!32016 () Bool)

(declare-fun tp!61427 () Bool)

(declare-fun e!525589 () Bool)

(assert (=> mapNonEmpty!32016 (= mapRes!32016 (and tp!61427 e!525589))))

(declare-datatypes ((V!31855 0))(
  ( (V!31856 (val!10134 Int)) )
))
(declare-datatypes ((ValueCell!9602 0))(
  ( (ValueCellFull!9602 (v!12652 V!31855)) (EmptyCell!9602) )
))
(declare-datatypes ((array!56325 0))(
  ( (array!56326 (arr!27100 (Array (_ BitVec 32) ValueCell!9602)) (size!27560 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56325)

(declare-fun mapValue!32016 () ValueCell!9602)

(declare-fun mapRest!32016 () (Array (_ BitVec 32) ValueCell!9602))

(declare-fun mapKey!32016 () (_ BitVec 32))

(assert (=> mapNonEmpty!32016 (= (arr!27100 _values!1231) (store mapRest!32016 mapKey!32016 mapValue!32016))))

(declare-fun b!935905 () Bool)

(declare-fun res!630022 () Bool)

(declare-fun e!525594 () Bool)

(assert (=> b!935905 (=> (not res!630022) (not e!525594))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31855)

(declare-datatypes ((tuple2!13282 0))(
  ( (tuple2!13283 (_1!6652 (_ BitVec 64)) (_2!6652 V!31855)) )
))
(declare-datatypes ((List!19063 0))(
  ( (Nil!19060) (Cons!19059 (h!20211 tuple2!13282) (t!27258 List!19063)) )
))
(declare-datatypes ((ListLongMap!11981 0))(
  ( (ListLongMap!11982 (toList!6006 List!19063)) )
))
(declare-fun lt!421686 () ListLongMap!11981)

(declare-fun apply!828 (ListLongMap!11981 (_ BitVec 64)) V!31855)

(assert (=> b!935905 (= res!630022 (= (apply!828 lt!421686 k0!1099) v!791))))

(declare-fun b!935906 () Bool)

(declare-fun res!630026 () Bool)

(assert (=> b!935906 (=> (not res!630026) (not e!525594))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935906 (= res!630026 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935907 () Bool)

(declare-fun res!630020 () Bool)

(assert (=> b!935907 (=> (not res!630020) (not e!525594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935907 (= res!630020 (validKeyInArray!0 k0!1099))))

(declare-fun b!935908 () Bool)

(declare-fun e!525586 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!935908 (= e!525586 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935909 () Bool)

(declare-fun e!525587 () Bool)

(assert (=> b!935909 (= e!525594 e!525587)))

(declare-fun res!630027 () Bool)

(assert (=> b!935909 (=> (not res!630027) (not e!525587))))

(declare-fun lt!421684 () (_ BitVec 64))

(assert (=> b!935909 (= res!630027 (validKeyInArray!0 lt!421684))))

(declare-datatypes ((array!56327 0))(
  ( (array!56328 (arr!27101 (Array (_ BitVec 32) (_ BitVec 64))) (size!27561 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56327)

(assert (=> b!935909 (= lt!421684 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935910 () Bool)

(declare-fun res!630023 () Bool)

(declare-fun e!525590 () Bool)

(assert (=> b!935910 (=> (not res!630023) (not e!525590))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56327 (_ BitVec 32)) Bool)

(assert (=> b!935910 (= res!630023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935911 () Bool)

(declare-fun e!525591 () Bool)

(assert (=> b!935911 (= e!525587 (not e!525591))))

(declare-fun res!630021 () Bool)

(assert (=> b!935911 (=> res!630021 e!525591)))

(assert (=> b!935911 (= res!630021 (or (bvsge (size!27561 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487))))))

(assert (=> b!935911 e!525586))

(declare-fun c!97508 () Bool)

(assert (=> b!935911 (= c!97508 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31534 0))(
  ( (Unit!31535) )
))
(declare-fun lt!421688 () Unit!31534)

(declare-fun zeroValue!1173 () V!31855)

(declare-fun minValue!1173 () V!31855)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!281 (array!56327 array!56325 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 64) (_ BitVec 32) Int) Unit!31534)

(assert (=> b!935911 (= lt!421688 (lemmaListMapContainsThenArrayContainsFrom!281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19064 0))(
  ( (Nil!19061) (Cons!19060 (h!20212 (_ BitVec 64)) (t!27259 List!19064)) )
))
(declare-fun arrayNoDuplicates!0 (array!56327 (_ BitVec 32) List!19064) Bool)

(assert (=> b!935911 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19061)))

(declare-fun lt!421690 () Unit!31534)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56327 (_ BitVec 32) (_ BitVec 32)) Unit!31534)

(assert (=> b!935911 (= lt!421690 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421685 () tuple2!13282)

(declare-fun contains!5072 (ListLongMap!11981 (_ BitVec 64)) Bool)

(declare-fun +!2827 (ListLongMap!11981 tuple2!13282) ListLongMap!11981)

(assert (=> b!935911 (contains!5072 (+!2827 lt!421686 lt!421685) k0!1099)))

(declare-fun lt!421687 () V!31855)

(declare-fun lt!421689 () Unit!31534)

(declare-fun addStillContains!530 (ListLongMap!11981 (_ BitVec 64) V!31855 (_ BitVec 64)) Unit!31534)

(assert (=> b!935911 (= lt!421689 (addStillContains!530 lt!421686 lt!421684 lt!421687 k0!1099))))

(declare-fun getCurrentListMap!3245 (array!56327 array!56325 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) ListLongMap!11981)

(assert (=> b!935911 (= (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2827 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421685))))

(assert (=> b!935911 (= lt!421685 (tuple2!13283 lt!421684 lt!421687))))

(declare-fun get!14291 (ValueCell!9602 V!31855) V!31855)

(declare-fun dynLambda!1624 (Int (_ BitVec 64)) V!31855)

(assert (=> b!935911 (= lt!421687 (get!14291 (select (arr!27100 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421691 () Unit!31534)

(declare-fun lemmaListMapRecursiveValidKeyArray!207 (array!56327 array!56325 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) Unit!31534)

(assert (=> b!935911 (= lt!421691 (lemmaListMapRecursiveValidKeyArray!207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!630028 () Bool)

(assert (=> start!79706 (=> (not res!630028) (not e!525590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79706 (= res!630028 (validMask!0 mask!1881))))

(assert (=> start!79706 e!525590))

(assert (=> start!79706 true))

(declare-fun tp_is_empty!20167 () Bool)

(assert (=> start!79706 tp_is_empty!20167))

(declare-fun e!525585 () Bool)

(declare-fun array_inv!21168 (array!56325) Bool)

(assert (=> start!79706 (and (array_inv!21168 _values!1231) e!525585)))

(assert (=> start!79706 tp!61428))

(declare-fun array_inv!21169 (array!56327) Bool)

(assert (=> start!79706 (array_inv!21169 _keys!1487)))

(declare-fun b!935912 () Bool)

(assert (=> b!935912 (= e!525590 e!525594)))

(declare-fun res!630025 () Bool)

(assert (=> b!935912 (=> (not res!630025) (not e!525594))))

(assert (=> b!935912 (= res!630025 (contains!5072 lt!421686 k0!1099))))

(assert (=> b!935912 (= lt!421686 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935913 () Bool)

(declare-fun arrayContainsKey!0 (array!56327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935913 (= e!525586 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935914 () Bool)

(declare-fun e!525588 () Bool)

(assert (=> b!935914 (= e!525585 (and e!525588 mapRes!32016))))

(declare-fun condMapEmpty!32016 () Bool)

(declare-fun mapDefault!32016 () ValueCell!9602)

(assert (=> b!935914 (= condMapEmpty!32016 (= (arr!27100 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9602)) mapDefault!32016)))))

(declare-fun b!935915 () Bool)

(declare-fun res!630030 () Bool)

(assert (=> b!935915 (=> (not res!630030) (not e!525590))))

(assert (=> b!935915 (= res!630030 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19061))))

(declare-fun b!935916 () Bool)

(declare-fun res!630018 () Bool)

(assert (=> b!935916 (=> res!630018 e!525591)))

(declare-fun noDuplicate!1360 (List!19064) Bool)

(assert (=> b!935916 (= res!630018 (not (noDuplicate!1360 Nil!19061)))))

(declare-fun mapIsEmpty!32016 () Bool)

(assert (=> mapIsEmpty!32016 mapRes!32016))

(declare-fun b!935917 () Bool)

(assert (=> b!935917 (= e!525589 tp_is_empty!20167)))

(declare-fun b!935918 () Bool)

(declare-fun e!525592 () Bool)

(assert (=> b!935918 (= e!525591 e!525592)))

(declare-fun res!630024 () Bool)

(assert (=> b!935918 (=> (not res!630024) (not e!525592))))

(declare-fun contains!5073 (List!19064 (_ BitVec 64)) Bool)

(assert (=> b!935918 (= res!630024 (not (contains!5073 Nil!19061 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935919 () Bool)

(assert (=> b!935919 (= e!525592 (not (contains!5073 Nil!19061 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935920 () Bool)

(declare-fun res!630019 () Bool)

(assert (=> b!935920 (=> (not res!630019) (not e!525590))))

(assert (=> b!935920 (= res!630019 (and (= (size!27560 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27561 _keys!1487) (size!27560 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935921 () Bool)

(declare-fun res!630029 () Bool)

(assert (=> b!935921 (=> (not res!630029) (not e!525590))))

(assert (=> b!935921 (= res!630029 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27561 _keys!1487))))))

(declare-fun b!935922 () Bool)

(assert (=> b!935922 (= e!525588 tp_is_empty!20167)))

(assert (= (and start!79706 res!630028) b!935920))

(assert (= (and b!935920 res!630019) b!935910))

(assert (= (and b!935910 res!630023) b!935915))

(assert (= (and b!935915 res!630030) b!935921))

(assert (= (and b!935921 res!630029) b!935912))

(assert (= (and b!935912 res!630025) b!935905))

(assert (= (and b!935905 res!630022) b!935906))

(assert (= (and b!935906 res!630026) b!935907))

(assert (= (and b!935907 res!630020) b!935909))

(assert (= (and b!935909 res!630027) b!935911))

(assert (= (and b!935911 c!97508) b!935913))

(assert (= (and b!935911 (not c!97508)) b!935908))

(assert (= (and b!935911 (not res!630021)) b!935916))

(assert (= (and b!935916 (not res!630018)) b!935918))

(assert (= (and b!935918 res!630024) b!935919))

(assert (= (and b!935914 condMapEmpty!32016) mapIsEmpty!32016))

(assert (= (and b!935914 (not condMapEmpty!32016)) mapNonEmpty!32016))

(get-info :version)

(assert (= (and mapNonEmpty!32016 ((_ is ValueCellFull!9602) mapValue!32016)) b!935917))

(assert (= (and b!935914 ((_ is ValueCellFull!9602) mapDefault!32016)) b!935922))

(assert (= start!79706 b!935914))

(declare-fun b_lambda!14043 () Bool)

(assert (=> (not b_lambda!14043) (not b!935911)))

(declare-fun t!27257 () Bool)

(declare-fun tb!6045 () Bool)

(assert (=> (and start!79706 (= defaultEntry!1235 defaultEntry!1235) t!27257) tb!6045))

(declare-fun result!11927 () Bool)

(assert (=> tb!6045 (= result!11927 tp_is_empty!20167)))

(assert (=> b!935911 t!27257))

(declare-fun b_and!28905 () Bool)

(assert (= b_and!28903 (and (=> t!27257 result!11927) b_and!28905)))

(declare-fun m!870679 () Bool)

(assert (=> mapNonEmpty!32016 m!870679))

(declare-fun m!870681 () Bool)

(assert (=> b!935919 m!870681))

(declare-fun m!870683 () Bool)

(assert (=> b!935916 m!870683))

(declare-fun m!870685 () Bool)

(assert (=> start!79706 m!870685))

(declare-fun m!870687 () Bool)

(assert (=> start!79706 m!870687))

(declare-fun m!870689 () Bool)

(assert (=> start!79706 m!870689))

(declare-fun m!870691 () Bool)

(assert (=> b!935915 m!870691))

(declare-fun m!870693 () Bool)

(assert (=> b!935913 m!870693))

(declare-fun m!870695 () Bool)

(assert (=> b!935918 m!870695))

(declare-fun m!870697 () Bool)

(assert (=> b!935910 m!870697))

(declare-fun m!870699 () Bool)

(assert (=> b!935909 m!870699))

(declare-fun m!870701 () Bool)

(assert (=> b!935909 m!870701))

(declare-fun m!870703 () Bool)

(assert (=> b!935912 m!870703))

(declare-fun m!870705 () Bool)

(assert (=> b!935912 m!870705))

(declare-fun m!870707 () Bool)

(assert (=> b!935911 m!870707))

(declare-fun m!870709 () Bool)

(assert (=> b!935911 m!870709))

(declare-fun m!870711 () Bool)

(assert (=> b!935911 m!870711))

(declare-fun m!870713 () Bool)

(assert (=> b!935911 m!870713))

(declare-fun m!870715 () Bool)

(assert (=> b!935911 m!870715))

(declare-fun m!870717 () Bool)

(assert (=> b!935911 m!870717))

(declare-fun m!870719 () Bool)

(assert (=> b!935911 m!870719))

(assert (=> b!935911 m!870717))

(assert (=> b!935911 m!870719))

(declare-fun m!870721 () Bool)

(assert (=> b!935911 m!870721))

(declare-fun m!870723 () Bool)

(assert (=> b!935911 m!870723))

(assert (=> b!935911 m!870711))

(declare-fun m!870725 () Bool)

(assert (=> b!935911 m!870725))

(assert (=> b!935911 m!870707))

(declare-fun m!870727 () Bool)

(assert (=> b!935911 m!870727))

(declare-fun m!870729 () Bool)

(assert (=> b!935911 m!870729))

(declare-fun m!870731 () Bool)

(assert (=> b!935911 m!870731))

(declare-fun m!870733 () Bool)

(assert (=> b!935905 m!870733))

(declare-fun m!870735 () Bool)

(assert (=> b!935907 m!870735))

(check-sat (not b!935916) (not b_lambda!14043) (not mapNonEmpty!32016) (not b!935909) (not b!935919) (not b!935905) (not b!935911) (not b!935912) (not b!935907) (not start!79706) (not b!935915) (not b!935918) b_and!28905 (not b!935910) tp_is_empty!20167 (not b!935913) (not b_next!17659))
(check-sat b_and!28905 (not b_next!17659))
(get-model)

(declare-fun b_lambda!14049 () Bool)

(assert (= b_lambda!14043 (or (and start!79706 b_free!17659) b_lambda!14049)))

(check-sat (not b!935916) (not mapNonEmpty!32016) (not b!935909) (not b!935919) (not b!935905) (not b!935911) (not b!935912) (not b!935907) (not start!79706) (not b!935915) (not b!935918) b_and!28905 (not b!935910) tp_is_empty!20167 (not b_lambda!14049) (not b!935913) (not b_next!17659))
(check-sat b_and!28905 (not b_next!17659))
(get-model)

(declare-fun d!113517 () Bool)

(declare-fun res!630113 () Bool)

(declare-fun e!525659 () Bool)

(assert (=> d!113517 (=> res!630113 e!525659)))

(assert (=> d!113517 (= res!630113 (= (select (arr!27101 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113517 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525659)))

(declare-fun b!936041 () Bool)

(declare-fun e!525660 () Bool)

(assert (=> b!936041 (= e!525659 e!525660)))

(declare-fun res!630114 () Bool)

(assert (=> b!936041 (=> (not res!630114) (not e!525660))))

(assert (=> b!936041 (= res!630114 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)))))

(declare-fun b!936042 () Bool)

(assert (=> b!936042 (= e!525660 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113517 (not res!630113)) b!936041))

(assert (= (and b!936041 res!630114) b!936042))

(declare-fun m!870853 () Bool)

(assert (=> d!113517 m!870853))

(declare-fun m!870855 () Bool)

(assert (=> b!936042 m!870855))

(assert (=> b!935913 d!113517))

(declare-fun d!113519 () Bool)

(declare-fun e!525665 () Bool)

(assert (=> d!113519 e!525665))

(declare-fun res!630117 () Bool)

(assert (=> d!113519 (=> res!630117 e!525665)))

(declare-fun lt!421751 () Bool)

(assert (=> d!113519 (= res!630117 (not lt!421751))))

(declare-fun lt!421750 () Bool)

(assert (=> d!113519 (= lt!421751 lt!421750)))

(declare-fun lt!421749 () Unit!31534)

(declare-fun e!525666 () Unit!31534)

(assert (=> d!113519 (= lt!421749 e!525666)))

(declare-fun c!97517 () Bool)

(assert (=> d!113519 (= c!97517 lt!421750)))

(declare-fun containsKey!450 (List!19063 (_ BitVec 64)) Bool)

(assert (=> d!113519 (= lt!421750 (containsKey!450 (toList!6006 lt!421686) k0!1099))))

(assert (=> d!113519 (= (contains!5072 lt!421686 k0!1099) lt!421751)))

(declare-fun b!936049 () Bool)

(declare-fun lt!421748 () Unit!31534)

(assert (=> b!936049 (= e!525666 lt!421748)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!344 (List!19063 (_ BitVec 64)) Unit!31534)

(assert (=> b!936049 (= lt!421748 (lemmaContainsKeyImpliesGetValueByKeyDefined!344 (toList!6006 lt!421686) k0!1099))))

(declare-datatypes ((Option!485 0))(
  ( (Some!484 (v!12656 V!31855)) (None!483) )
))
(declare-fun isDefined!352 (Option!485) Bool)

(declare-fun getValueByKey!479 (List!19063 (_ BitVec 64)) Option!485)

(assert (=> b!936049 (isDefined!352 (getValueByKey!479 (toList!6006 lt!421686) k0!1099))))

(declare-fun b!936050 () Bool)

(declare-fun Unit!31538 () Unit!31534)

(assert (=> b!936050 (= e!525666 Unit!31538)))

(declare-fun b!936051 () Bool)

(assert (=> b!936051 (= e!525665 (isDefined!352 (getValueByKey!479 (toList!6006 lt!421686) k0!1099)))))

(assert (= (and d!113519 c!97517) b!936049))

(assert (= (and d!113519 (not c!97517)) b!936050))

(assert (= (and d!113519 (not res!630117)) b!936051))

(declare-fun m!870857 () Bool)

(assert (=> d!113519 m!870857))

(declare-fun m!870859 () Bool)

(assert (=> b!936049 m!870859))

(declare-fun m!870861 () Bool)

(assert (=> b!936049 m!870861))

(assert (=> b!936049 m!870861))

(declare-fun m!870863 () Bool)

(assert (=> b!936049 m!870863))

(assert (=> b!936051 m!870861))

(assert (=> b!936051 m!870861))

(assert (=> b!936051 m!870863))

(assert (=> b!935912 d!113519))

(declare-fun b!936094 () Bool)

(declare-fun e!525694 () Bool)

(assert (=> b!936094 (= e!525694 (validKeyInArray!0 (select (arr!27101 _keys!1487) from!1844)))))

(declare-fun b!936095 () Bool)

(declare-fun res!630139 () Bool)

(declare-fun e!525697 () Bool)

(assert (=> b!936095 (=> (not res!630139) (not e!525697))))

(declare-fun e!525704 () Bool)

(assert (=> b!936095 (= res!630139 e!525704)))

(declare-fun c!97535 () Bool)

(assert (=> b!936095 (= c!97535 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!936096 () Bool)

(declare-fun e!525693 () Bool)

(declare-fun e!525695 () Bool)

(assert (=> b!936096 (= e!525693 e!525695)))

(declare-fun res!630142 () Bool)

(assert (=> b!936096 (=> (not res!630142) (not e!525695))))

(declare-fun lt!421796 () ListLongMap!11981)

(assert (=> b!936096 (= res!630142 (contains!5072 lt!421796 (select (arr!27101 _keys!1487) from!1844)))))

(assert (=> b!936096 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27561 _keys!1487)))))

(declare-fun bm!40731 () Bool)

(declare-fun call!40737 () ListLongMap!11981)

(declare-fun call!40738 () ListLongMap!11981)

(assert (=> bm!40731 (= call!40737 call!40738)))

(declare-fun b!936097 () Bool)

(declare-fun e!525698 () ListLongMap!11981)

(declare-fun e!525703 () ListLongMap!11981)

(assert (=> b!936097 (= e!525698 e!525703)))

(declare-fun c!97530 () Bool)

(assert (=> b!936097 (= c!97530 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40732 () Bool)

(declare-fun call!40735 () Bool)

(assert (=> bm!40732 (= call!40735 (contains!5072 lt!421796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936098 () Bool)

(declare-fun e!525702 () Bool)

(declare-fun call!40739 () Bool)

(assert (=> b!936098 (= e!525702 (not call!40739))))

(declare-fun b!936099 () Bool)

(declare-fun e!525700 () Bool)

(assert (=> b!936099 (= e!525704 e!525700)))

(declare-fun res!630144 () Bool)

(assert (=> b!936099 (= res!630144 call!40735)))

(assert (=> b!936099 (=> (not res!630144) (not e!525700))))

(declare-fun b!936100 () Bool)

(assert (=> b!936100 (= e!525695 (= (apply!828 lt!421796 (select (arr!27101 _keys!1487) from!1844)) (get!14291 (select (arr!27100 _values!1231) from!1844) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936100 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27560 _values!1231)))))

(assert (=> b!936100 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27561 _keys!1487)))))

(declare-fun d!113521 () Bool)

(assert (=> d!113521 e!525697))

(declare-fun res!630136 () Bool)

(assert (=> d!113521 (=> (not res!630136) (not e!525697))))

(assert (=> d!113521 (= res!630136 (or (bvsge from!1844 (size!27561 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27561 _keys!1487)))))))

(declare-fun lt!421802 () ListLongMap!11981)

(assert (=> d!113521 (= lt!421796 lt!421802)))

(declare-fun lt!421810 () Unit!31534)

(declare-fun e!525701 () Unit!31534)

(assert (=> d!113521 (= lt!421810 e!525701)))

(declare-fun c!97533 () Bool)

(declare-fun e!525705 () Bool)

(assert (=> d!113521 (= c!97533 e!525705)))

(declare-fun res!630140 () Bool)

(assert (=> d!113521 (=> (not res!630140) (not e!525705))))

(assert (=> d!113521 (= res!630140 (bvslt from!1844 (size!27561 _keys!1487)))))

(assert (=> d!113521 (= lt!421802 e!525698)))

(declare-fun c!97532 () Bool)

(assert (=> d!113521 (= c!97532 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113521 (validMask!0 mask!1881)))

(assert (=> d!113521 (= (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421796)))

(declare-fun bm!40733 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3345 (array!56327 array!56325 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) ListLongMap!11981)

(assert (=> bm!40733 (= call!40738 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936101 () Bool)

(assert (=> b!936101 (= e!525705 (validKeyInArray!0 (select (arr!27101 _keys!1487) from!1844)))))

(declare-fun b!936102 () Bool)

(declare-fun lt!421798 () Unit!31534)

(assert (=> b!936102 (= e!525701 lt!421798)))

(declare-fun lt!421797 () ListLongMap!11981)

(assert (=> b!936102 (= lt!421797 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421817 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421811 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421811 (select (arr!27101 _keys!1487) from!1844))))

(declare-fun lt!421806 () Unit!31534)

(assert (=> b!936102 (= lt!421806 (addStillContains!530 lt!421797 lt!421817 zeroValue!1173 lt!421811))))

(assert (=> b!936102 (contains!5072 (+!2827 lt!421797 (tuple2!13283 lt!421817 zeroValue!1173)) lt!421811)))

(declare-fun lt!421809 () Unit!31534)

(assert (=> b!936102 (= lt!421809 lt!421806)))

(declare-fun lt!421813 () ListLongMap!11981)

(assert (=> b!936102 (= lt!421813 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421816 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421804 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421804 (select (arr!27101 _keys!1487) from!1844))))

(declare-fun lt!421808 () Unit!31534)

(declare-fun addApplyDifferent!419 (ListLongMap!11981 (_ BitVec 64) V!31855 (_ BitVec 64)) Unit!31534)

(assert (=> b!936102 (= lt!421808 (addApplyDifferent!419 lt!421813 lt!421816 minValue!1173 lt!421804))))

(assert (=> b!936102 (= (apply!828 (+!2827 lt!421813 (tuple2!13283 lt!421816 minValue!1173)) lt!421804) (apply!828 lt!421813 lt!421804))))

(declare-fun lt!421800 () Unit!31534)

(assert (=> b!936102 (= lt!421800 lt!421808)))

(declare-fun lt!421803 () ListLongMap!11981)

(assert (=> b!936102 (= lt!421803 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421815 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421805 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421805 (select (arr!27101 _keys!1487) from!1844))))

(declare-fun lt!421807 () Unit!31534)

(assert (=> b!936102 (= lt!421807 (addApplyDifferent!419 lt!421803 lt!421815 zeroValue!1173 lt!421805))))

(assert (=> b!936102 (= (apply!828 (+!2827 lt!421803 (tuple2!13283 lt!421815 zeroValue!1173)) lt!421805) (apply!828 lt!421803 lt!421805))))

(declare-fun lt!421799 () Unit!31534)

(assert (=> b!936102 (= lt!421799 lt!421807)))

(declare-fun lt!421801 () ListLongMap!11981)

(assert (=> b!936102 (= lt!421801 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421814 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421814 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421812 () (_ BitVec 64))

(assert (=> b!936102 (= lt!421812 (select (arr!27101 _keys!1487) from!1844))))

(assert (=> b!936102 (= lt!421798 (addApplyDifferent!419 lt!421801 lt!421814 minValue!1173 lt!421812))))

(assert (=> b!936102 (= (apply!828 (+!2827 lt!421801 (tuple2!13283 lt!421814 minValue!1173)) lt!421812) (apply!828 lt!421801 lt!421812))))

(declare-fun b!936103 () Bool)

(declare-fun call!40740 () ListLongMap!11981)

(assert (=> b!936103 (= e!525698 (+!2827 call!40740 (tuple2!13283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!936104 () Bool)

(declare-fun e!525699 () Bool)

(assert (=> b!936104 (= e!525702 e!525699)))

(declare-fun res!630143 () Bool)

(assert (=> b!936104 (= res!630143 call!40739)))

(assert (=> b!936104 (=> (not res!630143) (not e!525699))))

(declare-fun b!936105 () Bool)

(declare-fun Unit!31539 () Unit!31534)

(assert (=> b!936105 (= e!525701 Unit!31539)))

(declare-fun bm!40734 () Bool)

(declare-fun call!40734 () ListLongMap!11981)

(assert (=> bm!40734 (= call!40734 call!40740)))

(declare-fun b!936106 () Bool)

(declare-fun e!525696 () ListLongMap!11981)

(declare-fun call!40736 () ListLongMap!11981)

(assert (=> b!936106 (= e!525696 call!40736)))

(declare-fun b!936107 () Bool)

(assert (=> b!936107 (= e!525696 call!40734)))

(declare-fun b!936108 () Bool)

(declare-fun c!97531 () Bool)

(assert (=> b!936108 (= c!97531 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!936108 (= e!525703 e!525696)))

(declare-fun b!936109 () Bool)

(assert (=> b!936109 (= e!525703 call!40734)))

(declare-fun b!936110 () Bool)

(assert (=> b!936110 (= e!525704 (not call!40735))))

(declare-fun b!936111 () Bool)

(assert (=> b!936111 (= e!525697 e!525702)))

(declare-fun c!97534 () Bool)

(assert (=> b!936111 (= c!97534 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40735 () Bool)

(assert (=> bm!40735 (= call!40740 (+!2827 (ite c!97532 call!40738 (ite c!97530 call!40737 call!40736)) (ite (or c!97532 c!97530) (tuple2!13283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40736 () Bool)

(assert (=> bm!40736 (= call!40736 call!40737)))

(declare-fun b!936112 () Bool)

(assert (=> b!936112 (= e!525699 (= (apply!828 lt!421796 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!936113 () Bool)

(declare-fun res!630141 () Bool)

(assert (=> b!936113 (=> (not res!630141) (not e!525697))))

(assert (=> b!936113 (= res!630141 e!525693)))

(declare-fun res!630137 () Bool)

(assert (=> b!936113 (=> res!630137 e!525693)))

(assert (=> b!936113 (= res!630137 (not e!525694))))

(declare-fun res!630138 () Bool)

(assert (=> b!936113 (=> (not res!630138) (not e!525694))))

(assert (=> b!936113 (= res!630138 (bvslt from!1844 (size!27561 _keys!1487)))))

(declare-fun b!936114 () Bool)

(assert (=> b!936114 (= e!525700 (= (apply!828 lt!421796 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40737 () Bool)

(assert (=> bm!40737 (= call!40739 (contains!5072 lt!421796 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113521 c!97532) b!936103))

(assert (= (and d!113521 (not c!97532)) b!936097))

(assert (= (and b!936097 c!97530) b!936109))

(assert (= (and b!936097 (not c!97530)) b!936108))

(assert (= (and b!936108 c!97531) b!936107))

(assert (= (and b!936108 (not c!97531)) b!936106))

(assert (= (or b!936107 b!936106) bm!40736))

(assert (= (or b!936109 bm!40736) bm!40731))

(assert (= (or b!936109 b!936107) bm!40734))

(assert (= (or b!936103 bm!40731) bm!40733))

(assert (= (or b!936103 bm!40734) bm!40735))

(assert (= (and d!113521 res!630140) b!936101))

(assert (= (and d!113521 c!97533) b!936102))

(assert (= (and d!113521 (not c!97533)) b!936105))

(assert (= (and d!113521 res!630136) b!936113))

(assert (= (and b!936113 res!630138) b!936094))

(assert (= (and b!936113 (not res!630137)) b!936096))

(assert (= (and b!936096 res!630142) b!936100))

(assert (= (and b!936113 res!630141) b!936095))

(assert (= (and b!936095 c!97535) b!936099))

(assert (= (and b!936095 (not c!97535)) b!936110))

(assert (= (and b!936099 res!630144) b!936114))

(assert (= (or b!936099 b!936110) bm!40732))

(assert (= (and b!936095 res!630139) b!936111))

(assert (= (and b!936111 c!97534) b!936104))

(assert (= (and b!936111 (not c!97534)) b!936098))

(assert (= (and b!936104 res!630143) b!936112))

(assert (= (or b!936104 b!936098) bm!40737))

(declare-fun b_lambda!14051 () Bool)

(assert (=> (not b_lambda!14051) (not b!936100)))

(assert (=> b!936100 t!27257))

(declare-fun b_and!28915 () Bool)

(assert (= b_and!28905 (and (=> t!27257 result!11927) b_and!28915)))

(declare-fun m!870865 () Bool)

(assert (=> bm!40732 m!870865))

(assert (=> b!936096 m!870853))

(assert (=> b!936096 m!870853))

(declare-fun m!870867 () Bool)

(assert (=> b!936096 m!870867))

(assert (=> b!936094 m!870853))

(assert (=> b!936094 m!870853))

(declare-fun m!870869 () Bool)

(assert (=> b!936094 m!870869))

(declare-fun m!870871 () Bool)

(assert (=> b!936112 m!870871))

(declare-fun m!870873 () Bool)

(assert (=> b!936114 m!870873))

(assert (=> b!936100 m!870719))

(declare-fun m!870875 () Bool)

(assert (=> b!936100 m!870875))

(assert (=> b!936100 m!870853))

(declare-fun m!870877 () Bool)

(assert (=> b!936100 m!870877))

(assert (=> b!936100 m!870853))

(assert (=> b!936100 m!870875))

(assert (=> b!936100 m!870719))

(declare-fun m!870879 () Bool)

(assert (=> b!936100 m!870879))

(declare-fun m!870881 () Bool)

(assert (=> b!936103 m!870881))

(assert (=> b!936101 m!870853))

(assert (=> b!936101 m!870853))

(assert (=> b!936101 m!870869))

(declare-fun m!870883 () Bool)

(assert (=> bm!40735 m!870883))

(declare-fun m!870885 () Bool)

(assert (=> bm!40737 m!870885))

(declare-fun m!870887 () Bool)

(assert (=> b!936102 m!870887))

(declare-fun m!870889 () Bool)

(assert (=> b!936102 m!870889))

(declare-fun m!870891 () Bool)

(assert (=> b!936102 m!870891))

(declare-fun m!870893 () Bool)

(assert (=> b!936102 m!870893))

(assert (=> b!936102 m!870887))

(declare-fun m!870895 () Bool)

(assert (=> b!936102 m!870895))

(assert (=> b!936102 m!870893))

(declare-fun m!870897 () Bool)

(assert (=> b!936102 m!870897))

(declare-fun m!870899 () Bool)

(assert (=> b!936102 m!870899))

(declare-fun m!870901 () Bool)

(assert (=> b!936102 m!870901))

(declare-fun m!870903 () Bool)

(assert (=> b!936102 m!870903))

(declare-fun m!870905 () Bool)

(assert (=> b!936102 m!870905))

(declare-fun m!870907 () Bool)

(assert (=> b!936102 m!870907))

(assert (=> b!936102 m!870903))

(assert (=> b!936102 m!870853))

(declare-fun m!870909 () Bool)

(assert (=> b!936102 m!870909))

(declare-fun m!870911 () Bool)

(assert (=> b!936102 m!870911))

(declare-fun m!870913 () Bool)

(assert (=> b!936102 m!870913))

(declare-fun m!870915 () Bool)

(assert (=> b!936102 m!870915))

(assert (=> b!936102 m!870915))

(declare-fun m!870917 () Bool)

(assert (=> b!936102 m!870917))

(assert (=> bm!40733 m!870907))

(assert (=> d!113521 m!870685))

(assert (=> b!935912 d!113521))

(declare-fun d!113523 () Bool)

(assert (=> d!113523 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79706 d!113523))

(declare-fun d!113525 () Bool)

(assert (=> d!113525 (= (array_inv!21168 _values!1231) (bvsge (size!27560 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79706 d!113525))

(declare-fun d!113527 () Bool)

(assert (=> d!113527 (= (array_inv!21169 _keys!1487) (bvsge (size!27561 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79706 d!113527))

(declare-fun d!113529 () Bool)

(declare-fun e!525708 () Bool)

(assert (=> d!113529 e!525708))

(declare-fun res!630150 () Bool)

(assert (=> d!113529 (=> (not res!630150) (not e!525708))))

(declare-fun lt!421828 () ListLongMap!11981)

(assert (=> d!113529 (= res!630150 (contains!5072 lt!421828 (_1!6652 lt!421685)))))

(declare-fun lt!421827 () List!19063)

(assert (=> d!113529 (= lt!421828 (ListLongMap!11982 lt!421827))))

(declare-fun lt!421829 () Unit!31534)

(declare-fun lt!421826 () Unit!31534)

(assert (=> d!113529 (= lt!421829 lt!421826)))

(assert (=> d!113529 (= (getValueByKey!479 lt!421827 (_1!6652 lt!421685)) (Some!484 (_2!6652 lt!421685)))))

(declare-fun lemmaContainsTupThenGetReturnValue!258 (List!19063 (_ BitVec 64) V!31855) Unit!31534)

(assert (=> d!113529 (= lt!421826 (lemmaContainsTupThenGetReturnValue!258 lt!421827 (_1!6652 lt!421685) (_2!6652 lt!421685)))))

(declare-fun insertStrictlySorted!315 (List!19063 (_ BitVec 64) V!31855) List!19063)

(assert (=> d!113529 (= lt!421827 (insertStrictlySorted!315 (toList!6006 lt!421686) (_1!6652 lt!421685) (_2!6652 lt!421685)))))

(assert (=> d!113529 (= (+!2827 lt!421686 lt!421685) lt!421828)))

(declare-fun b!936119 () Bool)

(declare-fun res!630149 () Bool)

(assert (=> b!936119 (=> (not res!630149) (not e!525708))))

(assert (=> b!936119 (= res!630149 (= (getValueByKey!479 (toList!6006 lt!421828) (_1!6652 lt!421685)) (Some!484 (_2!6652 lt!421685))))))

(declare-fun b!936120 () Bool)

(declare-fun contains!5076 (List!19063 tuple2!13282) Bool)

(assert (=> b!936120 (= e!525708 (contains!5076 (toList!6006 lt!421828) lt!421685))))

(assert (= (and d!113529 res!630150) b!936119))

(assert (= (and b!936119 res!630149) b!936120))

(declare-fun m!870919 () Bool)

(assert (=> d!113529 m!870919))

(declare-fun m!870921 () Bool)

(assert (=> d!113529 m!870921))

(declare-fun m!870923 () Bool)

(assert (=> d!113529 m!870923))

(declare-fun m!870925 () Bool)

(assert (=> d!113529 m!870925))

(declare-fun m!870927 () Bool)

(assert (=> b!936119 m!870927))

(declare-fun m!870929 () Bool)

(assert (=> b!936120 m!870929))

(assert (=> b!935911 d!113529))

(declare-fun d!113531 () Bool)

(declare-fun e!525709 () Bool)

(assert (=> d!113531 e!525709))

(declare-fun res!630152 () Bool)

(assert (=> d!113531 (=> (not res!630152) (not e!525709))))

(declare-fun lt!421832 () ListLongMap!11981)

(assert (=> d!113531 (= res!630152 (contains!5072 lt!421832 (_1!6652 lt!421685)))))

(declare-fun lt!421831 () List!19063)

(assert (=> d!113531 (= lt!421832 (ListLongMap!11982 lt!421831))))

(declare-fun lt!421833 () Unit!31534)

(declare-fun lt!421830 () Unit!31534)

(assert (=> d!113531 (= lt!421833 lt!421830)))

(assert (=> d!113531 (= (getValueByKey!479 lt!421831 (_1!6652 lt!421685)) (Some!484 (_2!6652 lt!421685)))))

(assert (=> d!113531 (= lt!421830 (lemmaContainsTupThenGetReturnValue!258 lt!421831 (_1!6652 lt!421685) (_2!6652 lt!421685)))))

(assert (=> d!113531 (= lt!421831 (insertStrictlySorted!315 (toList!6006 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6652 lt!421685) (_2!6652 lt!421685)))))

(assert (=> d!113531 (= (+!2827 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421685) lt!421832)))

(declare-fun b!936121 () Bool)

(declare-fun res!630151 () Bool)

(assert (=> b!936121 (=> (not res!630151) (not e!525709))))

(assert (=> b!936121 (= res!630151 (= (getValueByKey!479 (toList!6006 lt!421832) (_1!6652 lt!421685)) (Some!484 (_2!6652 lt!421685))))))

(declare-fun b!936122 () Bool)

(assert (=> b!936122 (= e!525709 (contains!5076 (toList!6006 lt!421832) lt!421685))))

(assert (= (and d!113531 res!630152) b!936121))

(assert (= (and b!936121 res!630151) b!936122))

(declare-fun m!870931 () Bool)

(assert (=> d!113531 m!870931))

(declare-fun m!870933 () Bool)

(assert (=> d!113531 m!870933))

(declare-fun m!870935 () Bool)

(assert (=> d!113531 m!870935))

(declare-fun m!870937 () Bool)

(assert (=> d!113531 m!870937))

(declare-fun m!870939 () Bool)

(assert (=> b!936121 m!870939))

(declare-fun m!870941 () Bool)

(assert (=> b!936122 m!870941))

(assert (=> b!935911 d!113531))

(declare-fun b!936123 () Bool)

(declare-fun e!525711 () Bool)

(assert (=> b!936123 (= e!525711 (validKeyInArray!0 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!936124 () Bool)

(declare-fun res!630156 () Bool)

(declare-fun e!525714 () Bool)

(assert (=> b!936124 (=> (not res!630156) (not e!525714))))

(declare-fun e!525721 () Bool)

(assert (=> b!936124 (= res!630156 e!525721)))

(declare-fun c!97541 () Bool)

(assert (=> b!936124 (= c!97541 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!936125 () Bool)

(declare-fun e!525710 () Bool)

(declare-fun e!525712 () Bool)

(assert (=> b!936125 (= e!525710 e!525712)))

(declare-fun res!630159 () Bool)

(assert (=> b!936125 (=> (not res!630159) (not e!525712))))

(declare-fun lt!421834 () ListLongMap!11981)

(assert (=> b!936125 (= res!630159 (contains!5072 lt!421834 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!936125 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)))))

(declare-fun bm!40738 () Bool)

(declare-fun call!40744 () ListLongMap!11981)

(declare-fun call!40745 () ListLongMap!11981)

(assert (=> bm!40738 (= call!40744 call!40745)))

(declare-fun b!936126 () Bool)

(declare-fun e!525715 () ListLongMap!11981)

(declare-fun e!525720 () ListLongMap!11981)

(assert (=> b!936126 (= e!525715 e!525720)))

(declare-fun c!97536 () Bool)

(assert (=> b!936126 (= c!97536 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40739 () Bool)

(declare-fun call!40742 () Bool)

(assert (=> bm!40739 (= call!40742 (contains!5072 lt!421834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936127 () Bool)

(declare-fun e!525719 () Bool)

(declare-fun call!40746 () Bool)

(assert (=> b!936127 (= e!525719 (not call!40746))))

(declare-fun b!936128 () Bool)

(declare-fun e!525717 () Bool)

(assert (=> b!936128 (= e!525721 e!525717)))

(declare-fun res!630161 () Bool)

(assert (=> b!936128 (= res!630161 call!40742)))

(assert (=> b!936128 (=> (not res!630161) (not e!525717))))

(declare-fun b!936129 () Bool)

(assert (=> b!936129 (= e!525712 (= (apply!828 lt!421834 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14291 (select (arr!27100 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936129 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27560 _values!1231)))))

(assert (=> b!936129 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)))))

(declare-fun d!113533 () Bool)

(assert (=> d!113533 e!525714))

(declare-fun res!630153 () Bool)

(assert (=> d!113533 (=> (not res!630153) (not e!525714))))

(assert (=> d!113533 (= res!630153 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)))))))

(declare-fun lt!421840 () ListLongMap!11981)

(assert (=> d!113533 (= lt!421834 lt!421840)))

(declare-fun lt!421848 () Unit!31534)

(declare-fun e!525718 () Unit!31534)

(assert (=> d!113533 (= lt!421848 e!525718)))

(declare-fun c!97539 () Bool)

(declare-fun e!525722 () Bool)

(assert (=> d!113533 (= c!97539 e!525722)))

(declare-fun res!630157 () Bool)

(assert (=> d!113533 (=> (not res!630157) (not e!525722))))

(assert (=> d!113533 (= res!630157 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)))))

(assert (=> d!113533 (= lt!421840 e!525715)))

(declare-fun c!97538 () Bool)

(assert (=> d!113533 (= c!97538 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113533 (validMask!0 mask!1881)))

(assert (=> d!113533 (= (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421834)))

(declare-fun bm!40740 () Bool)

(assert (=> bm!40740 (= call!40745 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936130 () Bool)

(assert (=> b!936130 (= e!525722 (validKeyInArray!0 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!936131 () Bool)

(declare-fun lt!421836 () Unit!31534)

(assert (=> b!936131 (= e!525718 lt!421836)))

(declare-fun lt!421835 () ListLongMap!11981)

(assert (=> b!936131 (= lt!421835 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421855 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421849 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421849 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421844 () Unit!31534)

(assert (=> b!936131 (= lt!421844 (addStillContains!530 lt!421835 lt!421855 zeroValue!1173 lt!421849))))

(assert (=> b!936131 (contains!5072 (+!2827 lt!421835 (tuple2!13283 lt!421855 zeroValue!1173)) lt!421849)))

(declare-fun lt!421847 () Unit!31534)

(assert (=> b!936131 (= lt!421847 lt!421844)))

(declare-fun lt!421851 () ListLongMap!11981)

(assert (=> b!936131 (= lt!421851 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421854 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421854 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421842 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421842 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421846 () Unit!31534)

(assert (=> b!936131 (= lt!421846 (addApplyDifferent!419 lt!421851 lt!421854 minValue!1173 lt!421842))))

(assert (=> b!936131 (= (apply!828 (+!2827 lt!421851 (tuple2!13283 lt!421854 minValue!1173)) lt!421842) (apply!828 lt!421851 lt!421842))))

(declare-fun lt!421838 () Unit!31534)

(assert (=> b!936131 (= lt!421838 lt!421846)))

(declare-fun lt!421841 () ListLongMap!11981)

(assert (=> b!936131 (= lt!421841 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421853 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421843 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421843 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421845 () Unit!31534)

(assert (=> b!936131 (= lt!421845 (addApplyDifferent!419 lt!421841 lt!421853 zeroValue!1173 lt!421843))))

(assert (=> b!936131 (= (apply!828 (+!2827 lt!421841 (tuple2!13283 lt!421853 zeroValue!1173)) lt!421843) (apply!828 lt!421841 lt!421843))))

(declare-fun lt!421837 () Unit!31534)

(assert (=> b!936131 (= lt!421837 lt!421845)))

(declare-fun lt!421839 () ListLongMap!11981)

(assert (=> b!936131 (= lt!421839 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421852 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421850 () (_ BitVec 64))

(assert (=> b!936131 (= lt!421850 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936131 (= lt!421836 (addApplyDifferent!419 lt!421839 lt!421852 minValue!1173 lt!421850))))

(assert (=> b!936131 (= (apply!828 (+!2827 lt!421839 (tuple2!13283 lt!421852 minValue!1173)) lt!421850) (apply!828 lt!421839 lt!421850))))

(declare-fun b!936132 () Bool)

(declare-fun call!40747 () ListLongMap!11981)

(assert (=> b!936132 (= e!525715 (+!2827 call!40747 (tuple2!13283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!936133 () Bool)

(declare-fun e!525716 () Bool)

(assert (=> b!936133 (= e!525719 e!525716)))

(declare-fun res!630160 () Bool)

(assert (=> b!936133 (= res!630160 call!40746)))

(assert (=> b!936133 (=> (not res!630160) (not e!525716))))

(declare-fun b!936134 () Bool)

(declare-fun Unit!31540 () Unit!31534)

(assert (=> b!936134 (= e!525718 Unit!31540)))

(declare-fun bm!40741 () Bool)

(declare-fun call!40741 () ListLongMap!11981)

(assert (=> bm!40741 (= call!40741 call!40747)))

(declare-fun b!936135 () Bool)

(declare-fun e!525713 () ListLongMap!11981)

(declare-fun call!40743 () ListLongMap!11981)

(assert (=> b!936135 (= e!525713 call!40743)))

(declare-fun b!936136 () Bool)

(assert (=> b!936136 (= e!525713 call!40741)))

(declare-fun b!936137 () Bool)

(declare-fun c!97537 () Bool)

(assert (=> b!936137 (= c!97537 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!936137 (= e!525720 e!525713)))

(declare-fun b!936138 () Bool)

(assert (=> b!936138 (= e!525720 call!40741)))

(declare-fun b!936139 () Bool)

(assert (=> b!936139 (= e!525721 (not call!40742))))

(declare-fun b!936140 () Bool)

(assert (=> b!936140 (= e!525714 e!525719)))

(declare-fun c!97540 () Bool)

(assert (=> b!936140 (= c!97540 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40742 () Bool)

(assert (=> bm!40742 (= call!40747 (+!2827 (ite c!97538 call!40745 (ite c!97536 call!40744 call!40743)) (ite (or c!97538 c!97536) (tuple2!13283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40743 () Bool)

(assert (=> bm!40743 (= call!40743 call!40744)))

(declare-fun b!936141 () Bool)

(assert (=> b!936141 (= e!525716 (= (apply!828 lt!421834 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!936142 () Bool)

(declare-fun res!630158 () Bool)

(assert (=> b!936142 (=> (not res!630158) (not e!525714))))

(assert (=> b!936142 (= res!630158 e!525710)))

(declare-fun res!630154 () Bool)

(assert (=> b!936142 (=> res!630154 e!525710)))

(assert (=> b!936142 (= res!630154 (not e!525711))))

(declare-fun res!630155 () Bool)

(assert (=> b!936142 (=> (not res!630155) (not e!525711))))

(assert (=> b!936142 (= res!630155 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)))))

(declare-fun b!936143 () Bool)

(assert (=> b!936143 (= e!525717 (= (apply!828 lt!421834 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40744 () Bool)

(assert (=> bm!40744 (= call!40746 (contains!5072 lt!421834 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113533 c!97538) b!936132))

(assert (= (and d!113533 (not c!97538)) b!936126))

(assert (= (and b!936126 c!97536) b!936138))

(assert (= (and b!936126 (not c!97536)) b!936137))

(assert (= (and b!936137 c!97537) b!936136))

(assert (= (and b!936137 (not c!97537)) b!936135))

(assert (= (or b!936136 b!936135) bm!40743))

(assert (= (or b!936138 bm!40743) bm!40738))

(assert (= (or b!936138 b!936136) bm!40741))

(assert (= (or b!936132 bm!40738) bm!40740))

(assert (= (or b!936132 bm!40741) bm!40742))

(assert (= (and d!113533 res!630157) b!936130))

(assert (= (and d!113533 c!97539) b!936131))

(assert (= (and d!113533 (not c!97539)) b!936134))

(assert (= (and d!113533 res!630153) b!936142))

(assert (= (and b!936142 res!630155) b!936123))

(assert (= (and b!936142 (not res!630154)) b!936125))

(assert (= (and b!936125 res!630159) b!936129))

(assert (= (and b!936142 res!630158) b!936124))

(assert (= (and b!936124 c!97541) b!936128))

(assert (= (and b!936124 (not c!97541)) b!936139))

(assert (= (and b!936128 res!630161) b!936143))

(assert (= (or b!936128 b!936139) bm!40739))

(assert (= (and b!936124 res!630156) b!936140))

(assert (= (and b!936140 c!97540) b!936133))

(assert (= (and b!936140 (not c!97540)) b!936127))

(assert (= (and b!936133 res!630160) b!936141))

(assert (= (or b!936133 b!936127) bm!40744))

(declare-fun b_lambda!14053 () Bool)

(assert (=> (not b_lambda!14053) (not b!936129)))

(assert (=> b!936129 t!27257))

(declare-fun b_and!28917 () Bool)

(assert (= b_and!28915 (and (=> t!27257 result!11927) b_and!28917)))

(declare-fun m!870943 () Bool)

(assert (=> bm!40739 m!870943))

(assert (=> b!936125 m!870701))

(assert (=> b!936125 m!870701))

(declare-fun m!870945 () Bool)

(assert (=> b!936125 m!870945))

(assert (=> b!936123 m!870701))

(assert (=> b!936123 m!870701))

(declare-fun m!870947 () Bool)

(assert (=> b!936123 m!870947))

(declare-fun m!870949 () Bool)

(assert (=> b!936141 m!870949))

(declare-fun m!870951 () Bool)

(assert (=> b!936143 m!870951))

(assert (=> b!936129 m!870719))

(assert (=> b!936129 m!870717))

(assert (=> b!936129 m!870701))

(declare-fun m!870953 () Bool)

(assert (=> b!936129 m!870953))

(assert (=> b!936129 m!870701))

(assert (=> b!936129 m!870717))

(assert (=> b!936129 m!870719))

(assert (=> b!936129 m!870721))

(declare-fun m!870955 () Bool)

(assert (=> b!936132 m!870955))

(assert (=> b!936130 m!870701))

(assert (=> b!936130 m!870701))

(assert (=> b!936130 m!870947))

(declare-fun m!870957 () Bool)

(assert (=> bm!40742 m!870957))

(declare-fun m!870959 () Bool)

(assert (=> bm!40744 m!870959))

(declare-fun m!870961 () Bool)

(assert (=> b!936131 m!870961))

(declare-fun m!870963 () Bool)

(assert (=> b!936131 m!870963))

(declare-fun m!870965 () Bool)

(assert (=> b!936131 m!870965))

(declare-fun m!870967 () Bool)

(assert (=> b!936131 m!870967))

(assert (=> b!936131 m!870961))

(declare-fun m!870969 () Bool)

(assert (=> b!936131 m!870969))

(assert (=> b!936131 m!870967))

(declare-fun m!870971 () Bool)

(assert (=> b!936131 m!870971))

(declare-fun m!870973 () Bool)

(assert (=> b!936131 m!870973))

(declare-fun m!870975 () Bool)

(assert (=> b!936131 m!870975))

(declare-fun m!870977 () Bool)

(assert (=> b!936131 m!870977))

(declare-fun m!870979 () Bool)

(assert (=> b!936131 m!870979))

(declare-fun m!870981 () Bool)

(assert (=> b!936131 m!870981))

(assert (=> b!936131 m!870977))

(assert (=> b!936131 m!870701))

(declare-fun m!870983 () Bool)

(assert (=> b!936131 m!870983))

(declare-fun m!870985 () Bool)

(assert (=> b!936131 m!870985))

(declare-fun m!870987 () Bool)

(assert (=> b!936131 m!870987))

(declare-fun m!870989 () Bool)

(assert (=> b!936131 m!870989))

(assert (=> b!936131 m!870989))

(declare-fun m!870991 () Bool)

(assert (=> b!936131 m!870991))

(assert (=> bm!40740 m!870981))

(assert (=> d!113533 m!870685))

(assert (=> b!935911 d!113533))

(declare-fun b!936144 () Bool)

(declare-fun e!525724 () Bool)

(assert (=> b!936144 (= e!525724 (validKeyInArray!0 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!936145 () Bool)

(declare-fun res!630165 () Bool)

(declare-fun e!525727 () Bool)

(assert (=> b!936145 (=> (not res!630165) (not e!525727))))

(declare-fun e!525734 () Bool)

(assert (=> b!936145 (= res!630165 e!525734)))

(declare-fun c!97547 () Bool)

(assert (=> b!936145 (= c!97547 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!936146 () Bool)

(declare-fun e!525723 () Bool)

(declare-fun e!525725 () Bool)

(assert (=> b!936146 (= e!525723 e!525725)))

(declare-fun res!630168 () Bool)

(assert (=> b!936146 (=> (not res!630168) (not e!525725))))

(declare-fun lt!421856 () ListLongMap!11981)

(assert (=> b!936146 (= res!630168 (contains!5072 lt!421856 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!936146 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27561 _keys!1487)))))

(declare-fun bm!40745 () Bool)

(declare-fun call!40751 () ListLongMap!11981)

(declare-fun call!40752 () ListLongMap!11981)

(assert (=> bm!40745 (= call!40751 call!40752)))

(declare-fun b!936147 () Bool)

(declare-fun e!525728 () ListLongMap!11981)

(declare-fun e!525733 () ListLongMap!11981)

(assert (=> b!936147 (= e!525728 e!525733)))

(declare-fun c!97542 () Bool)

(assert (=> b!936147 (= c!97542 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40746 () Bool)

(declare-fun call!40749 () Bool)

(assert (=> bm!40746 (= call!40749 (contains!5072 lt!421856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936148 () Bool)

(declare-fun e!525732 () Bool)

(declare-fun call!40753 () Bool)

(assert (=> b!936148 (= e!525732 (not call!40753))))

(declare-fun b!936149 () Bool)

(declare-fun e!525730 () Bool)

(assert (=> b!936149 (= e!525734 e!525730)))

(declare-fun res!630170 () Bool)

(assert (=> b!936149 (= res!630170 call!40749)))

(assert (=> b!936149 (=> (not res!630170) (not e!525730))))

(declare-fun b!936150 () Bool)

(assert (=> b!936150 (= e!525725 (= (apply!828 lt!421856 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14291 (select (arr!27100 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!936150 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27560 _values!1231)))))

(assert (=> b!936150 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27561 _keys!1487)))))

(declare-fun d!113535 () Bool)

(assert (=> d!113535 e!525727))

(declare-fun res!630162 () Bool)

(assert (=> d!113535 (=> (not res!630162) (not e!525727))))

(assert (=> d!113535 (= res!630162 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27561 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27561 _keys!1487)))))))

(declare-fun lt!421862 () ListLongMap!11981)

(assert (=> d!113535 (= lt!421856 lt!421862)))

(declare-fun lt!421870 () Unit!31534)

(declare-fun e!525731 () Unit!31534)

(assert (=> d!113535 (= lt!421870 e!525731)))

(declare-fun c!97545 () Bool)

(declare-fun e!525735 () Bool)

(assert (=> d!113535 (= c!97545 e!525735)))

(declare-fun res!630166 () Bool)

(assert (=> d!113535 (=> (not res!630166) (not e!525735))))

(assert (=> d!113535 (= res!630166 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27561 _keys!1487)))))

(assert (=> d!113535 (= lt!421862 e!525728)))

(declare-fun c!97544 () Bool)

(assert (=> d!113535 (= c!97544 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113535 (validMask!0 mask!1881)))

(assert (=> d!113535 (= (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421856)))

(declare-fun bm!40747 () Bool)

(assert (=> bm!40747 (= call!40752 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!936151 () Bool)

(assert (=> b!936151 (= e!525735 (validKeyInArray!0 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!936152 () Bool)

(declare-fun lt!421858 () Unit!31534)

(assert (=> b!936152 (= e!525731 lt!421858)))

(declare-fun lt!421857 () ListLongMap!11981)

(assert (=> b!936152 (= lt!421857 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421877 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421871 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421871 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421866 () Unit!31534)

(assert (=> b!936152 (= lt!421866 (addStillContains!530 lt!421857 lt!421877 zeroValue!1173 lt!421871))))

(assert (=> b!936152 (contains!5072 (+!2827 lt!421857 (tuple2!13283 lt!421877 zeroValue!1173)) lt!421871)))

(declare-fun lt!421869 () Unit!31534)

(assert (=> b!936152 (= lt!421869 lt!421866)))

(declare-fun lt!421873 () ListLongMap!11981)

(assert (=> b!936152 (= lt!421873 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421876 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421876 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421864 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421864 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421868 () Unit!31534)

(assert (=> b!936152 (= lt!421868 (addApplyDifferent!419 lt!421873 lt!421876 minValue!1173 lt!421864))))

(assert (=> b!936152 (= (apply!828 (+!2827 lt!421873 (tuple2!13283 lt!421876 minValue!1173)) lt!421864) (apply!828 lt!421873 lt!421864))))

(declare-fun lt!421860 () Unit!31534)

(assert (=> b!936152 (= lt!421860 lt!421868)))

(declare-fun lt!421863 () ListLongMap!11981)

(assert (=> b!936152 (= lt!421863 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421875 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421875 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421865 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421865 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421867 () Unit!31534)

(assert (=> b!936152 (= lt!421867 (addApplyDifferent!419 lt!421863 lt!421875 zeroValue!1173 lt!421865))))

(assert (=> b!936152 (= (apply!828 (+!2827 lt!421863 (tuple2!13283 lt!421875 zeroValue!1173)) lt!421865) (apply!828 lt!421863 lt!421865))))

(declare-fun lt!421859 () Unit!31534)

(assert (=> b!936152 (= lt!421859 lt!421867)))

(declare-fun lt!421861 () ListLongMap!11981)

(assert (=> b!936152 (= lt!421861 (getCurrentListMapNoExtraKeys!3345 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421874 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421874 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421872 () (_ BitVec 64))

(assert (=> b!936152 (= lt!421872 (select (arr!27101 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!936152 (= lt!421858 (addApplyDifferent!419 lt!421861 lt!421874 minValue!1173 lt!421872))))

(assert (=> b!936152 (= (apply!828 (+!2827 lt!421861 (tuple2!13283 lt!421874 minValue!1173)) lt!421872) (apply!828 lt!421861 lt!421872))))

(declare-fun b!936153 () Bool)

(declare-fun call!40754 () ListLongMap!11981)

(assert (=> b!936153 (= e!525728 (+!2827 call!40754 (tuple2!13283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!936154 () Bool)

(declare-fun e!525729 () Bool)

(assert (=> b!936154 (= e!525732 e!525729)))

(declare-fun res!630169 () Bool)

(assert (=> b!936154 (= res!630169 call!40753)))

(assert (=> b!936154 (=> (not res!630169) (not e!525729))))

(declare-fun b!936155 () Bool)

(declare-fun Unit!31541 () Unit!31534)

(assert (=> b!936155 (= e!525731 Unit!31541)))

(declare-fun bm!40748 () Bool)

(declare-fun call!40748 () ListLongMap!11981)

(assert (=> bm!40748 (= call!40748 call!40754)))

(declare-fun b!936156 () Bool)

(declare-fun e!525726 () ListLongMap!11981)

(declare-fun call!40750 () ListLongMap!11981)

(assert (=> b!936156 (= e!525726 call!40750)))

(declare-fun b!936157 () Bool)

(assert (=> b!936157 (= e!525726 call!40748)))

(declare-fun b!936158 () Bool)

(declare-fun c!97543 () Bool)

(assert (=> b!936158 (= c!97543 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!936158 (= e!525733 e!525726)))

(declare-fun b!936159 () Bool)

(assert (=> b!936159 (= e!525733 call!40748)))

(declare-fun b!936160 () Bool)

(assert (=> b!936160 (= e!525734 (not call!40749))))

(declare-fun b!936161 () Bool)

(assert (=> b!936161 (= e!525727 e!525732)))

(declare-fun c!97546 () Bool)

(assert (=> b!936161 (= c!97546 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40749 () Bool)

(assert (=> bm!40749 (= call!40754 (+!2827 (ite c!97544 call!40752 (ite c!97542 call!40751 call!40750)) (ite (or c!97544 c!97542) (tuple2!13283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40750 () Bool)

(assert (=> bm!40750 (= call!40750 call!40751)))

(declare-fun b!936162 () Bool)

(assert (=> b!936162 (= e!525729 (= (apply!828 lt!421856 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!936163 () Bool)

(declare-fun res!630167 () Bool)

(assert (=> b!936163 (=> (not res!630167) (not e!525727))))

(assert (=> b!936163 (= res!630167 e!525723)))

(declare-fun res!630163 () Bool)

(assert (=> b!936163 (=> res!630163 e!525723)))

(assert (=> b!936163 (= res!630163 (not e!525724))))

(declare-fun res!630164 () Bool)

(assert (=> b!936163 (=> (not res!630164) (not e!525724))))

(assert (=> b!936163 (= res!630164 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27561 _keys!1487)))))

(declare-fun b!936164 () Bool)

(assert (=> b!936164 (= e!525730 (= (apply!828 lt!421856 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40751 () Bool)

(assert (=> bm!40751 (= call!40753 (contains!5072 lt!421856 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113535 c!97544) b!936153))

(assert (= (and d!113535 (not c!97544)) b!936147))

(assert (= (and b!936147 c!97542) b!936159))

(assert (= (and b!936147 (not c!97542)) b!936158))

(assert (= (and b!936158 c!97543) b!936157))

(assert (= (and b!936158 (not c!97543)) b!936156))

(assert (= (or b!936157 b!936156) bm!40750))

(assert (= (or b!936159 bm!40750) bm!40745))

(assert (= (or b!936159 b!936157) bm!40748))

(assert (= (or b!936153 bm!40745) bm!40747))

(assert (= (or b!936153 bm!40748) bm!40749))

(assert (= (and d!113535 res!630166) b!936151))

(assert (= (and d!113535 c!97545) b!936152))

(assert (= (and d!113535 (not c!97545)) b!936155))

(assert (= (and d!113535 res!630162) b!936163))

(assert (= (and b!936163 res!630164) b!936144))

(assert (= (and b!936163 (not res!630163)) b!936146))

(assert (= (and b!936146 res!630168) b!936150))

(assert (= (and b!936163 res!630167) b!936145))

(assert (= (and b!936145 c!97547) b!936149))

(assert (= (and b!936145 (not c!97547)) b!936160))

(assert (= (and b!936149 res!630170) b!936164))

(assert (= (or b!936149 b!936160) bm!40746))

(assert (= (and b!936145 res!630165) b!936161))

(assert (= (and b!936161 c!97546) b!936154))

(assert (= (and b!936161 (not c!97546)) b!936148))

(assert (= (and b!936154 res!630169) b!936162))

(assert (= (or b!936154 b!936148) bm!40751))

(declare-fun b_lambda!14055 () Bool)

(assert (=> (not b_lambda!14055) (not b!936150)))

(assert (=> b!936150 t!27257))

(declare-fun b_and!28919 () Bool)

(assert (= b_and!28917 (and (=> t!27257 result!11927) b_and!28919)))

(declare-fun m!870993 () Bool)

(assert (=> bm!40746 m!870993))

(declare-fun m!870995 () Bool)

(assert (=> b!936146 m!870995))

(assert (=> b!936146 m!870995))

(declare-fun m!870997 () Bool)

(assert (=> b!936146 m!870997))

(assert (=> b!936144 m!870995))

(assert (=> b!936144 m!870995))

(declare-fun m!870999 () Bool)

(assert (=> b!936144 m!870999))

(declare-fun m!871001 () Bool)

(assert (=> b!936162 m!871001))

(declare-fun m!871003 () Bool)

(assert (=> b!936164 m!871003))

(assert (=> b!936150 m!870719))

(declare-fun m!871005 () Bool)

(assert (=> b!936150 m!871005))

(assert (=> b!936150 m!870995))

(declare-fun m!871007 () Bool)

(assert (=> b!936150 m!871007))

(assert (=> b!936150 m!870995))

(assert (=> b!936150 m!871005))

(assert (=> b!936150 m!870719))

(declare-fun m!871009 () Bool)

(assert (=> b!936150 m!871009))

(declare-fun m!871011 () Bool)

(assert (=> b!936153 m!871011))

(assert (=> b!936151 m!870995))

(assert (=> b!936151 m!870995))

(assert (=> b!936151 m!870999))

(declare-fun m!871013 () Bool)

(assert (=> bm!40749 m!871013))

(declare-fun m!871015 () Bool)

(assert (=> bm!40751 m!871015))

(declare-fun m!871017 () Bool)

(assert (=> b!936152 m!871017))

(declare-fun m!871019 () Bool)

(assert (=> b!936152 m!871019))

(declare-fun m!871021 () Bool)

(assert (=> b!936152 m!871021))

(declare-fun m!871023 () Bool)

(assert (=> b!936152 m!871023))

(assert (=> b!936152 m!871017))

(declare-fun m!871025 () Bool)

(assert (=> b!936152 m!871025))

(assert (=> b!936152 m!871023))

(declare-fun m!871027 () Bool)

(assert (=> b!936152 m!871027))

(declare-fun m!871029 () Bool)

(assert (=> b!936152 m!871029))

(declare-fun m!871031 () Bool)

(assert (=> b!936152 m!871031))

(declare-fun m!871033 () Bool)

(assert (=> b!936152 m!871033))

(declare-fun m!871035 () Bool)

(assert (=> b!936152 m!871035))

(declare-fun m!871037 () Bool)

(assert (=> b!936152 m!871037))

(assert (=> b!936152 m!871033))

(assert (=> b!936152 m!870995))

(declare-fun m!871039 () Bool)

(assert (=> b!936152 m!871039))

(declare-fun m!871041 () Bool)

(assert (=> b!936152 m!871041))

(declare-fun m!871043 () Bool)

(assert (=> b!936152 m!871043))

(declare-fun m!871045 () Bool)

(assert (=> b!936152 m!871045))

(assert (=> b!936152 m!871045))

(declare-fun m!871047 () Bool)

(assert (=> b!936152 m!871047))

(assert (=> bm!40747 m!871037))

(assert (=> d!113535 m!870685))

(assert (=> b!935911 d!113535))

(declare-fun d!113537 () Bool)

(declare-fun e!525736 () Bool)

(assert (=> d!113537 e!525736))

(declare-fun res!630171 () Bool)

(assert (=> d!113537 (=> res!630171 e!525736)))

(declare-fun lt!421881 () Bool)

(assert (=> d!113537 (= res!630171 (not lt!421881))))

(declare-fun lt!421880 () Bool)

(assert (=> d!113537 (= lt!421881 lt!421880)))

(declare-fun lt!421879 () Unit!31534)

(declare-fun e!525737 () Unit!31534)

(assert (=> d!113537 (= lt!421879 e!525737)))

(declare-fun c!97548 () Bool)

(assert (=> d!113537 (= c!97548 lt!421880)))

(assert (=> d!113537 (= lt!421880 (containsKey!450 (toList!6006 (+!2827 lt!421686 lt!421685)) k0!1099))))

(assert (=> d!113537 (= (contains!5072 (+!2827 lt!421686 lt!421685) k0!1099) lt!421881)))

(declare-fun b!936165 () Bool)

(declare-fun lt!421878 () Unit!31534)

(assert (=> b!936165 (= e!525737 lt!421878)))

(assert (=> b!936165 (= lt!421878 (lemmaContainsKeyImpliesGetValueByKeyDefined!344 (toList!6006 (+!2827 lt!421686 lt!421685)) k0!1099))))

(assert (=> b!936165 (isDefined!352 (getValueByKey!479 (toList!6006 (+!2827 lt!421686 lt!421685)) k0!1099))))

(declare-fun b!936166 () Bool)

(declare-fun Unit!31542 () Unit!31534)

(assert (=> b!936166 (= e!525737 Unit!31542)))

(declare-fun b!936167 () Bool)

(assert (=> b!936167 (= e!525736 (isDefined!352 (getValueByKey!479 (toList!6006 (+!2827 lt!421686 lt!421685)) k0!1099)))))

(assert (= (and d!113537 c!97548) b!936165))

(assert (= (and d!113537 (not c!97548)) b!936166))

(assert (= (and d!113537 (not res!630171)) b!936167))

(declare-fun m!871049 () Bool)

(assert (=> d!113537 m!871049))

(declare-fun m!871051 () Bool)

(assert (=> b!936165 m!871051))

(declare-fun m!871053 () Bool)

(assert (=> b!936165 m!871053))

(assert (=> b!936165 m!871053))

(declare-fun m!871055 () Bool)

(assert (=> b!936165 m!871055))

(assert (=> b!936167 m!871053))

(assert (=> b!936167 m!871053))

(assert (=> b!936167 m!871055))

(assert (=> b!935911 d!113537))

(declare-fun d!113539 () Bool)

(declare-fun e!525740 () Bool)

(assert (=> d!113539 e!525740))

(declare-fun res!630174 () Bool)

(assert (=> d!113539 (=> (not res!630174) (not e!525740))))

(assert (=> d!113539 (= res!630174 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27560 _values!1231))))))

(declare-fun lt!421884 () Unit!31534)

(declare-fun choose!1553 (array!56327 array!56325 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) Unit!31534)

(assert (=> d!113539 (= lt!421884 (choose!1553 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113539 (validMask!0 mask!1881)))

(assert (=> d!113539 (= (lemmaListMapRecursiveValidKeyArray!207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421884)))

(declare-fun b!936170 () Bool)

(assert (=> b!936170 (= e!525740 (= (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2827 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13283 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14291 (select (arr!27100 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113539 res!630174) b!936170))

(declare-fun b_lambda!14057 () Bool)

(assert (=> (not b_lambda!14057) (not b!936170)))

(assert (=> b!936170 t!27257))

(declare-fun b_and!28921 () Bool)

(assert (= b_and!28919 (and (=> t!27257 result!11927) b_and!28921)))

(declare-fun m!871057 () Bool)

(assert (=> d!113539 m!871057))

(assert (=> d!113539 m!870685))

(assert (=> b!936170 m!870719))

(assert (=> b!936170 m!870717))

(assert (=> b!936170 m!870717))

(assert (=> b!936170 m!870719))

(assert (=> b!936170 m!870721))

(assert (=> b!936170 m!870701))

(declare-fun m!871059 () Bool)

(assert (=> b!936170 m!871059))

(declare-fun m!871061 () Bool)

(assert (=> b!936170 m!871061))

(assert (=> b!936170 m!870723))

(assert (=> b!936170 m!871059))

(assert (=> b!935911 d!113539))

(declare-fun b!936181 () Bool)

(declare-fun e!525752 () Bool)

(declare-fun e!525751 () Bool)

(assert (=> b!936181 (= e!525752 e!525751)))

(declare-fun c!97551 () Bool)

(assert (=> b!936181 (= c!97551 (validKeyInArray!0 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!936182 () Bool)

(declare-fun e!525750 () Bool)

(assert (=> b!936182 (= e!525750 (contains!5073 Nil!19061 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun call!40757 () Bool)

(declare-fun bm!40754 () Bool)

(assert (=> bm!40754 (= call!40757 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97551 (Cons!19060 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19061) Nil!19061)))))

(declare-fun b!936183 () Bool)

(declare-fun e!525749 () Bool)

(assert (=> b!936183 (= e!525749 e!525752)))

(declare-fun res!630183 () Bool)

(assert (=> b!936183 (=> (not res!630183) (not e!525752))))

(assert (=> b!936183 (= res!630183 (not e!525750))))

(declare-fun res!630182 () Bool)

(assert (=> b!936183 (=> (not res!630182) (not e!525750))))

(assert (=> b!936183 (= res!630182 (validKeyInArray!0 (select (arr!27101 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!936184 () Bool)

(assert (=> b!936184 (= e!525751 call!40757)))

(declare-fun b!936185 () Bool)

(assert (=> b!936185 (= e!525751 call!40757)))

(declare-fun d!113541 () Bool)

(declare-fun res!630181 () Bool)

(assert (=> d!113541 (=> res!630181 e!525749)))

(assert (=> d!113541 (= res!630181 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27561 _keys!1487)))))

(assert (=> d!113541 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19061) e!525749)))

(assert (= (and d!113541 (not res!630181)) b!936183))

(assert (= (and b!936183 res!630182) b!936182))

(assert (= (and b!936183 res!630183) b!936181))

(assert (= (and b!936181 c!97551) b!936184))

(assert (= (and b!936181 (not c!97551)) b!936185))

(assert (= (or b!936184 b!936185) bm!40754))

(assert (=> b!936181 m!870701))

(assert (=> b!936181 m!870701))

(assert (=> b!936181 m!870947))

(assert (=> b!936182 m!870701))

(assert (=> b!936182 m!870701))

(declare-fun m!871063 () Bool)

(assert (=> b!936182 m!871063))

(assert (=> bm!40754 m!870701))

(declare-fun m!871065 () Bool)

(assert (=> bm!40754 m!871065))

(assert (=> b!936183 m!870701))

(assert (=> b!936183 m!870701))

(assert (=> b!936183 m!870947))

(assert (=> b!935911 d!113541))

(declare-fun d!113543 () Bool)

(declare-fun e!525755 () Bool)

(assert (=> d!113543 e!525755))

(declare-fun c!97554 () Bool)

(assert (=> d!113543 (= c!97554 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421887 () Unit!31534)

(declare-fun choose!1554 (array!56327 array!56325 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 64) (_ BitVec 32) Int) Unit!31534)

(assert (=> d!113543 (= lt!421887 (choose!1554 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113543 (validMask!0 mask!1881)))

(assert (=> d!113543 (= (lemmaListMapContainsThenArrayContainsFrom!281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421887)))

(declare-fun b!936190 () Bool)

(assert (=> b!936190 (= e!525755 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936191 () Bool)

(assert (=> b!936191 (= e!525755 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113543 c!97554) b!936190))

(assert (= (and d!113543 (not c!97554)) b!936191))

(declare-fun m!871067 () Bool)

(assert (=> d!113543 m!871067))

(assert (=> d!113543 m!870685))

(assert (=> b!936190 m!870693))

(assert (=> b!935911 d!113543))

(declare-fun d!113545 () Bool)

(assert (=> d!113545 (contains!5072 (+!2827 lt!421686 (tuple2!13283 lt!421684 lt!421687)) k0!1099)))

(declare-fun lt!421890 () Unit!31534)

(declare-fun choose!1555 (ListLongMap!11981 (_ BitVec 64) V!31855 (_ BitVec 64)) Unit!31534)

(assert (=> d!113545 (= lt!421890 (choose!1555 lt!421686 lt!421684 lt!421687 k0!1099))))

(assert (=> d!113545 (contains!5072 lt!421686 k0!1099)))

(assert (=> d!113545 (= (addStillContains!530 lt!421686 lt!421684 lt!421687 k0!1099) lt!421890)))

(declare-fun bs!26264 () Bool)

(assert (= bs!26264 d!113545))

(declare-fun m!871069 () Bool)

(assert (=> bs!26264 m!871069))

(assert (=> bs!26264 m!871069))

(declare-fun m!871071 () Bool)

(assert (=> bs!26264 m!871071))

(declare-fun m!871073 () Bool)

(assert (=> bs!26264 m!871073))

(assert (=> bs!26264 m!870703))

(assert (=> b!935911 d!113545))

(declare-fun d!113547 () Bool)

(declare-fun c!97557 () Bool)

(assert (=> d!113547 (= c!97557 ((_ is ValueCellFull!9602) (select (arr!27100 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525758 () V!31855)

(assert (=> d!113547 (= (get!14291 (select (arr!27100 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525758)))

(declare-fun b!936197 () Bool)

(declare-fun get!14293 (ValueCell!9602 V!31855) V!31855)

(assert (=> b!936197 (= e!525758 (get!14293 (select (arr!27100 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!936198 () Bool)

(declare-fun get!14294 (ValueCell!9602 V!31855) V!31855)

(assert (=> b!936198 (= e!525758 (get!14294 (select (arr!27100 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113547 c!97557) b!936197))

(assert (= (and d!113547 (not c!97557)) b!936198))

(assert (=> b!936197 m!870717))

(assert (=> b!936197 m!870719))

(declare-fun m!871075 () Bool)

(assert (=> b!936197 m!871075))

(assert (=> b!936198 m!870717))

(assert (=> b!936198 m!870719))

(declare-fun m!871077 () Bool)

(assert (=> b!936198 m!871077))

(assert (=> b!935911 d!113547))

(declare-fun d!113549 () Bool)

(assert (=> d!113549 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19061)))

(declare-fun lt!421893 () Unit!31534)

(declare-fun choose!39 (array!56327 (_ BitVec 32) (_ BitVec 32)) Unit!31534)

(assert (=> d!113549 (= lt!421893 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113549 (bvslt (size!27561 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113549 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421893)))

(declare-fun bs!26265 () Bool)

(assert (= bs!26265 d!113549))

(assert (=> bs!26265 m!870729))

(declare-fun m!871079 () Bool)

(assert (=> bs!26265 m!871079))

(assert (=> b!935911 d!113549))

(declare-fun bm!40757 () Bool)

(declare-fun call!40760 () Bool)

(assert (=> bm!40757 (= call!40760 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!936207 () Bool)

(declare-fun e!525766 () Bool)

(assert (=> b!936207 (= e!525766 call!40760)))

(declare-fun d!113551 () Bool)

(declare-fun res!630188 () Bool)

(declare-fun e!525767 () Bool)

(assert (=> d!113551 (=> res!630188 e!525767)))

(assert (=> d!113551 (= res!630188 (bvsge #b00000000000000000000000000000000 (size!27561 _keys!1487)))))

(assert (=> d!113551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!525767)))

(declare-fun b!936208 () Bool)

(declare-fun e!525765 () Bool)

(assert (=> b!936208 (= e!525766 e!525765)))

(declare-fun lt!421902 () (_ BitVec 64))

(assert (=> b!936208 (= lt!421902 (select (arr!27101 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421901 () Unit!31534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56327 (_ BitVec 64) (_ BitVec 32)) Unit!31534)

(assert (=> b!936208 (= lt!421901 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421902 #b00000000000000000000000000000000))))

(assert (=> b!936208 (arrayContainsKey!0 _keys!1487 lt!421902 #b00000000000000000000000000000000)))

(declare-fun lt!421900 () Unit!31534)

(assert (=> b!936208 (= lt!421900 lt!421901)))

(declare-fun res!630189 () Bool)

(declare-datatypes ((SeekEntryResult!8933 0))(
  ( (MissingZero!8933 (index!38103 (_ BitVec 32))) (Found!8933 (index!38104 (_ BitVec 32))) (Intermediate!8933 (undefined!9745 Bool) (index!38105 (_ BitVec 32)) (x!80168 (_ BitVec 32))) (Undefined!8933) (MissingVacant!8933 (index!38106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56327 (_ BitVec 32)) SeekEntryResult!8933)

(assert (=> b!936208 (= res!630189 (= (seekEntryOrOpen!0 (select (arr!27101 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8933 #b00000000000000000000000000000000)))))

(assert (=> b!936208 (=> (not res!630189) (not e!525765))))

(declare-fun b!936209 () Bool)

(assert (=> b!936209 (= e!525767 e!525766)))

(declare-fun c!97560 () Bool)

(assert (=> b!936209 (= c!97560 (validKeyInArray!0 (select (arr!27101 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!936210 () Bool)

(assert (=> b!936210 (= e!525765 call!40760)))

(assert (= (and d!113551 (not res!630188)) b!936209))

(assert (= (and b!936209 c!97560) b!936208))

(assert (= (and b!936209 (not c!97560)) b!936207))

(assert (= (and b!936208 res!630189) b!936210))

(assert (= (or b!936210 b!936207) bm!40757))

(declare-fun m!871081 () Bool)

(assert (=> bm!40757 m!871081))

(declare-fun m!871083 () Bool)

(assert (=> b!936208 m!871083))

(declare-fun m!871085 () Bool)

(assert (=> b!936208 m!871085))

(declare-fun m!871087 () Bool)

(assert (=> b!936208 m!871087))

(assert (=> b!936208 m!871083))

(declare-fun m!871089 () Bool)

(assert (=> b!936208 m!871089))

(assert (=> b!936209 m!871083))

(assert (=> b!936209 m!871083))

(declare-fun m!871091 () Bool)

(assert (=> b!936209 m!871091))

(assert (=> b!935910 d!113551))

(declare-fun d!113553 () Bool)

(declare-fun lt!421905 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!406 (List!19064) (InoxSet (_ BitVec 64)))

(assert (=> d!113553 (= lt!421905 (select (content!406 Nil!19061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525772 () Bool)

(assert (=> d!113553 (= lt!421905 e!525772)))

(declare-fun res!630194 () Bool)

(assert (=> d!113553 (=> (not res!630194) (not e!525772))))

(assert (=> d!113553 (= res!630194 ((_ is Cons!19060) Nil!19061))))

(assert (=> d!113553 (= (contains!5073 Nil!19061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!421905)))

(declare-fun b!936215 () Bool)

(declare-fun e!525773 () Bool)

(assert (=> b!936215 (= e!525772 e!525773)))

(declare-fun res!630195 () Bool)

(assert (=> b!936215 (=> res!630195 e!525773)))

(assert (=> b!936215 (= res!630195 (= (h!20212 Nil!19061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936216 () Bool)

(assert (=> b!936216 (= e!525773 (contains!5073 (t!27259 Nil!19061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113553 res!630194) b!936215))

(assert (= (and b!936215 (not res!630195)) b!936216))

(declare-fun m!871093 () Bool)

(assert (=> d!113553 m!871093))

(declare-fun m!871095 () Bool)

(assert (=> d!113553 m!871095))

(declare-fun m!871097 () Bool)

(assert (=> b!936216 m!871097))

(assert (=> b!935919 d!113553))

(declare-fun d!113555 () Bool)

(assert (=> d!113555 (= (validKeyInArray!0 lt!421684) (and (not (= lt!421684 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421684 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935909 d!113555))

(declare-fun d!113557 () Bool)

(declare-fun lt!421906 () Bool)

(assert (=> d!113557 (= lt!421906 (select (content!406 Nil!19061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!525774 () Bool)

(assert (=> d!113557 (= lt!421906 e!525774)))

(declare-fun res!630196 () Bool)

(assert (=> d!113557 (=> (not res!630196) (not e!525774))))

(assert (=> d!113557 (= res!630196 ((_ is Cons!19060) Nil!19061))))

(assert (=> d!113557 (= (contains!5073 Nil!19061 #b0000000000000000000000000000000000000000000000000000000000000000) lt!421906)))

(declare-fun b!936217 () Bool)

(declare-fun e!525775 () Bool)

(assert (=> b!936217 (= e!525774 e!525775)))

(declare-fun res!630197 () Bool)

(assert (=> b!936217 (=> res!630197 e!525775)))

(assert (=> b!936217 (= res!630197 (= (h!20212 Nil!19061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!936218 () Bool)

(assert (=> b!936218 (= e!525775 (contains!5073 (t!27259 Nil!19061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113557 res!630196) b!936217))

(assert (= (and b!936217 (not res!630197)) b!936218))

(assert (=> d!113557 m!871093))

(declare-fun m!871099 () Bool)

(assert (=> d!113557 m!871099))

(declare-fun m!871101 () Bool)

(assert (=> b!936218 m!871101))

(assert (=> b!935918 d!113557))

(declare-fun d!113559 () Bool)

(assert (=> d!113559 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935907 d!113559))

(declare-fun d!113561 () Bool)

(declare-fun res!630202 () Bool)

(declare-fun e!525780 () Bool)

(assert (=> d!113561 (=> res!630202 e!525780)))

(assert (=> d!113561 (= res!630202 ((_ is Nil!19061) Nil!19061))))

(assert (=> d!113561 (= (noDuplicate!1360 Nil!19061) e!525780)))

(declare-fun b!936223 () Bool)

(declare-fun e!525781 () Bool)

(assert (=> b!936223 (= e!525780 e!525781)))

(declare-fun res!630203 () Bool)

(assert (=> b!936223 (=> (not res!630203) (not e!525781))))

(assert (=> b!936223 (= res!630203 (not (contains!5073 (t!27259 Nil!19061) (h!20212 Nil!19061))))))

(declare-fun b!936224 () Bool)

(assert (=> b!936224 (= e!525781 (noDuplicate!1360 (t!27259 Nil!19061)))))

(assert (= (and d!113561 (not res!630202)) b!936223))

(assert (= (and b!936223 res!630203) b!936224))

(declare-fun m!871103 () Bool)

(assert (=> b!936223 m!871103))

(declare-fun m!871105 () Bool)

(assert (=> b!936224 m!871105))

(assert (=> b!935916 d!113561))

(declare-fun d!113563 () Bool)

(declare-fun get!14295 (Option!485) V!31855)

(assert (=> d!113563 (= (apply!828 lt!421686 k0!1099) (get!14295 (getValueByKey!479 (toList!6006 lt!421686) k0!1099)))))

(declare-fun bs!26266 () Bool)

(assert (= bs!26266 d!113563))

(assert (=> bs!26266 m!870861))

(assert (=> bs!26266 m!870861))

(declare-fun m!871107 () Bool)

(assert (=> bs!26266 m!871107))

(assert (=> b!935905 d!113563))

(declare-fun b!936225 () Bool)

(declare-fun e!525785 () Bool)

(declare-fun e!525784 () Bool)

(assert (=> b!936225 (= e!525785 e!525784)))

(declare-fun c!97561 () Bool)

(assert (=> b!936225 (= c!97561 (validKeyInArray!0 (select (arr!27101 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!936226 () Bool)

(declare-fun e!525783 () Bool)

(assert (=> b!936226 (= e!525783 (contains!5073 Nil!19061 (select (arr!27101 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40758 () Bool)

(declare-fun call!40761 () Bool)

(assert (=> bm!40758 (= call!40761 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97561 (Cons!19060 (select (arr!27101 _keys!1487) #b00000000000000000000000000000000) Nil!19061) Nil!19061)))))

(declare-fun b!936227 () Bool)

(declare-fun e!525782 () Bool)

(assert (=> b!936227 (= e!525782 e!525785)))

(declare-fun res!630206 () Bool)

(assert (=> b!936227 (=> (not res!630206) (not e!525785))))

(assert (=> b!936227 (= res!630206 (not e!525783))))

(declare-fun res!630205 () Bool)

(assert (=> b!936227 (=> (not res!630205) (not e!525783))))

(assert (=> b!936227 (= res!630205 (validKeyInArray!0 (select (arr!27101 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!936228 () Bool)

(assert (=> b!936228 (= e!525784 call!40761)))

(declare-fun b!936229 () Bool)

(assert (=> b!936229 (= e!525784 call!40761)))

(declare-fun d!113565 () Bool)

(declare-fun res!630204 () Bool)

(assert (=> d!113565 (=> res!630204 e!525782)))

(assert (=> d!113565 (= res!630204 (bvsge #b00000000000000000000000000000000 (size!27561 _keys!1487)))))

(assert (=> d!113565 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19061) e!525782)))

(assert (= (and d!113565 (not res!630204)) b!936227))

(assert (= (and b!936227 res!630205) b!936226))

(assert (= (and b!936227 res!630206) b!936225))

(assert (= (and b!936225 c!97561) b!936228))

(assert (= (and b!936225 (not c!97561)) b!936229))

(assert (= (or b!936228 b!936229) bm!40758))

(assert (=> b!936225 m!871083))

(assert (=> b!936225 m!871083))

(assert (=> b!936225 m!871091))

(assert (=> b!936226 m!871083))

(assert (=> b!936226 m!871083))

(declare-fun m!871109 () Bool)

(assert (=> b!936226 m!871109))

(assert (=> bm!40758 m!871083))

(declare-fun m!871111 () Bool)

(assert (=> bm!40758 m!871111))

(assert (=> b!936227 m!871083))

(assert (=> b!936227 m!871083))

(assert (=> b!936227 m!871091))

(assert (=> b!935915 d!113565))

(declare-fun b!936236 () Bool)

(declare-fun e!525790 () Bool)

(assert (=> b!936236 (= e!525790 tp_is_empty!20167)))

(declare-fun condMapEmpty!32025 () Bool)

(declare-fun mapDefault!32025 () ValueCell!9602)

(assert (=> mapNonEmpty!32016 (= condMapEmpty!32025 (= mapRest!32016 ((as const (Array (_ BitVec 32) ValueCell!9602)) mapDefault!32025)))))

(declare-fun e!525791 () Bool)

(declare-fun mapRes!32025 () Bool)

(assert (=> mapNonEmpty!32016 (= tp!61427 (and e!525791 mapRes!32025))))

(declare-fun mapNonEmpty!32025 () Bool)

(declare-fun tp!61443 () Bool)

(assert (=> mapNonEmpty!32025 (= mapRes!32025 (and tp!61443 e!525790))))

(declare-fun mapKey!32025 () (_ BitVec 32))

(declare-fun mapValue!32025 () ValueCell!9602)

(declare-fun mapRest!32025 () (Array (_ BitVec 32) ValueCell!9602))

(assert (=> mapNonEmpty!32025 (= mapRest!32016 (store mapRest!32025 mapKey!32025 mapValue!32025))))

(declare-fun mapIsEmpty!32025 () Bool)

(assert (=> mapIsEmpty!32025 mapRes!32025))

(declare-fun b!936237 () Bool)

(assert (=> b!936237 (= e!525791 tp_is_empty!20167)))

(assert (= (and mapNonEmpty!32016 condMapEmpty!32025) mapIsEmpty!32025))

(assert (= (and mapNonEmpty!32016 (not condMapEmpty!32025)) mapNonEmpty!32025))

(assert (= (and mapNonEmpty!32025 ((_ is ValueCellFull!9602) mapValue!32025)) b!936236))

(assert (= (and mapNonEmpty!32016 ((_ is ValueCellFull!9602) mapDefault!32025)) b!936237))

(declare-fun m!871113 () Bool)

(assert (=> mapNonEmpty!32025 m!871113))

(declare-fun b_lambda!14059 () Bool)

(assert (= b_lambda!14051 (or (and start!79706 b_free!17659) b_lambda!14059)))

(declare-fun b_lambda!14061 () Bool)

(assert (= b_lambda!14053 (or (and start!79706 b_free!17659) b_lambda!14061)))

(declare-fun b_lambda!14063 () Bool)

(assert (= b_lambda!14055 (or (and start!79706 b_free!17659) b_lambda!14063)))

(declare-fun b_lambda!14065 () Bool)

(assert (= b_lambda!14057 (or (and start!79706 b_free!17659) b_lambda!14065)))

(check-sat (not b!936144) (not b!936162) (not b!936226) (not bm!40758) (not bm!40739) (not b!936100) (not b!936182) (not d!113537) (not bm!40735) (not d!113533) (not d!113519) (not d!113529) (not bm!40757) (not d!113553) (not b!936120) (not b!936132) (not bm!40732) (not bm!40754) (not bm!40746) (not b!936122) (not b!936167) (not b!936130) (not b!936208) (not bm!40749) (not b!936125) (not b!936181) (not b!936197) (not b_lambda!14063) (not d!113535) (not bm!40733) (not b!936151) (not d!113539) (not b!936101) (not b!936190) (not b!936121) (not b!936129) (not b!936146) (not d!113543) (not b!936123) (not b!936209) (not b!936183) (not b!936224) (not bm!40737) (not b!936112) (not b!936153) (not d!113549) (not b_lambda!14059) (not bm!40740) (not bm!40742) (not b!936150) (not bm!40744) (not d!113545) (not b!936216) (not b!936114) (not b!936102) (not b!936170) (not b!936198) (not bm!40747) (not d!113531) (not bm!40751) (not b!936042) b_and!28921 (not b!936164) (not b!936225) (not b!936094) (not b!936141) (not b!936103) (not b!936218) (not b!936143) (not b_lambda!14061) tp_is_empty!20167 (not b_lambda!14049) (not b!936051) (not b!936119) (not d!113563) (not b!936152) (not d!113557) (not mapNonEmpty!32025) (not b!936049) (not b_lambda!14065) (not b!936131) (not d!113521) (not b!936165) (not b!936227) (not b!936223) (not b!936096) (not b_next!17659))
(check-sat b_and!28921 (not b_next!17659))
