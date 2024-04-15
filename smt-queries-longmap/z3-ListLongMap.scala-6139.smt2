; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78924 () Bool)

(assert start!78924)

(declare-fun b_free!17155 () Bool)

(declare-fun b_next!17155 () Bool)

(assert (=> start!78924 (= b_free!17155 (not b_next!17155))))

(declare-fun tp!59907 () Bool)

(declare-fun b_and!28021 () Bool)

(assert (=> start!78924 (= tp!59907 b_and!28021)))

(declare-fun b!923158 () Bool)

(declare-fun e!517953 () Bool)

(declare-fun e!517946 () Bool)

(declare-fun mapRes!31251 () Bool)

(assert (=> b!923158 (= e!517953 (and e!517946 mapRes!31251))))

(declare-fun condMapEmpty!31251 () Bool)

(declare-datatypes ((V!31183 0))(
  ( (V!31184 (val!9882 Int)) )
))
(declare-datatypes ((ValueCell!9350 0))(
  ( (ValueCellFull!9350 (v!12399 V!31183)) (EmptyCell!9350) )
))
(declare-datatypes ((array!55271 0))(
  ( (array!55272 (arr!26581 (Array (_ BitVec 32) ValueCell!9350)) (size!27042 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55271)

(declare-fun mapDefault!31251 () ValueCell!9350)

(assert (=> b!923158 (= condMapEmpty!31251 (= (arr!26581 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9350)) mapDefault!31251)))))

(declare-fun b!923159 () Bool)

(declare-datatypes ((Unit!31064 0))(
  ( (Unit!31065) )
))
(declare-fun e!517945 () Unit!31064)

(declare-fun Unit!31066 () Unit!31064)

(assert (=> b!923159 (= e!517945 Unit!31066)))

(declare-fun mapIsEmpty!31251 () Bool)

(assert (=> mapIsEmpty!31251 mapRes!31251))

(declare-fun b!923160 () Bool)

(declare-fun res!622519 () Bool)

(declare-fun e!517949 () Bool)

(assert (=> b!923160 (=> (not res!622519) (not e!517949))))

(declare-datatypes ((array!55273 0))(
  ( (array!55274 (arr!26582 (Array (_ BitVec 32) (_ BitVec 64))) (size!27043 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55273)

(declare-datatypes ((List!18707 0))(
  ( (Nil!18704) (Cons!18703 (h!19849 (_ BitVec 64)) (t!26583 List!18707)) )
))
(declare-fun arrayNoDuplicates!0 (array!55273 (_ BitVec 32) List!18707) Bool)

(assert (=> b!923160 (= res!622519 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18704))))

(declare-fun b!923162 () Bool)

(declare-fun e!517947 () Bool)

(declare-fun e!517956 () Bool)

(assert (=> b!923162 (= e!517947 e!517956)))

(declare-fun res!622515 () Bool)

(assert (=> b!923162 (=> (not res!622515) (not e!517956))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31183)

(declare-fun lt!414610 () V!31183)

(assert (=> b!923162 (= res!622515 (and (= lt!414610 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12926 0))(
  ( (tuple2!12927 (_1!6474 (_ BitVec 64)) (_2!6474 V!31183)) )
))
(declare-datatypes ((List!18708 0))(
  ( (Nil!18705) (Cons!18704 (h!19850 tuple2!12926) (t!26584 List!18708)) )
))
(declare-datatypes ((ListLongMap!11613 0))(
  ( (ListLongMap!11614 (toList!5822 List!18708)) )
))
(declare-fun lt!414604 () ListLongMap!11613)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!635 (ListLongMap!11613 (_ BitVec 64)) V!31183)

(assert (=> b!923162 (= lt!414610 (apply!635 lt!414604 k0!1099))))

(declare-fun b!923163 () Bool)

(declare-fun lt!414607 () ListLongMap!11613)

(assert (=> b!923163 (= (apply!635 lt!414607 k0!1099) lt!414610)))

(declare-fun lt!414600 () (_ BitVec 64))

(declare-fun lt!414603 () Unit!31064)

(declare-fun lt!414599 () V!31183)

(declare-fun addApplyDifferent!353 (ListLongMap!11613 (_ BitVec 64) V!31183 (_ BitVec 64)) Unit!31064)

(assert (=> b!923163 (= lt!414603 (addApplyDifferent!353 lt!414604 lt!414600 lt!414599 k0!1099))))

(assert (=> b!923163 (not (= lt!414600 k0!1099))))

(declare-fun lt!414611 () Unit!31064)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55273 (_ BitVec 64) (_ BitVec 32) List!18707) Unit!31064)

(assert (=> b!923163 (= lt!414611 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18704))))

(declare-fun e!517955 () Bool)

(assert (=> b!923163 e!517955))

(declare-fun c!96193 () Bool)

(assert (=> b!923163 (= c!96193 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414598 () Unit!31064)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31183)

(declare-fun minValue!1173 () V!31183)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!213 (array!55273 array!55271 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 64) (_ BitVec 32) Int) Unit!31064)

(assert (=> b!923163 (= lt!414598 (lemmaListMapContainsThenArrayContainsFrom!213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923163 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18704)))

(declare-fun lt!414608 () Unit!31064)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55273 (_ BitVec 32) (_ BitVec 32)) Unit!31064)

(assert (=> b!923163 (= lt!414608 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4836 (ListLongMap!11613 (_ BitVec 64)) Bool)

(assert (=> b!923163 (contains!4836 lt!414607 k0!1099)))

(declare-fun lt!414606 () tuple2!12926)

(declare-fun +!2725 (ListLongMap!11613 tuple2!12926) ListLongMap!11613)

(assert (=> b!923163 (= lt!414607 (+!2725 lt!414604 lt!414606))))

(declare-fun lt!414602 () Unit!31064)

(declare-fun addStillContains!422 (ListLongMap!11613 (_ BitVec 64) V!31183 (_ BitVec 64)) Unit!31064)

(assert (=> b!923163 (= lt!414602 (addStillContains!422 lt!414604 lt!414600 lt!414599 k0!1099))))

(declare-fun getCurrentListMap!3010 (array!55273 array!55271 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 32) Int) ListLongMap!11613)

(assert (=> b!923163 (= (getCurrentListMap!3010 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2725 (getCurrentListMap!3010 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414606))))

(assert (=> b!923163 (= lt!414606 (tuple2!12927 lt!414600 lt!414599))))

(declare-fun get!13972 (ValueCell!9350 V!31183) V!31183)

(declare-fun dynLambda!1481 (Int (_ BitVec 64)) V!31183)

(assert (=> b!923163 (= lt!414599 (get!13972 (select (arr!26581 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1481 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414601 () Unit!31064)

(declare-fun lemmaListMapRecursiveValidKeyArray!89 (array!55273 array!55271 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 32) Int) Unit!31064)

(assert (=> b!923163 (= lt!414601 (lemmaListMapRecursiveValidKeyArray!89 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923163 (= e!517945 lt!414603)))

(declare-fun b!923164 () Bool)

(declare-fun res!622518 () Bool)

(assert (=> b!923164 (=> (not res!622518) (not e!517949))))

(assert (=> b!923164 (= res!622518 (and (= (size!27042 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27043 _keys!1487) (size!27042 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923165 () Bool)

(declare-fun e!517954 () Bool)

(assert (=> b!923165 (= e!517956 e!517954)))

(declare-fun res!622517 () Bool)

(assert (=> b!923165 (=> (not res!622517) (not e!517954))))

(assert (=> b!923165 (= res!622517 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27043 _keys!1487)))))

(declare-fun lt!414597 () Unit!31064)

(declare-fun e!517950 () Unit!31064)

(assert (=> b!923165 (= lt!414597 e!517950)))

(declare-fun c!96192 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923165 (= c!96192 (validKeyInArray!0 k0!1099))))

(declare-fun b!923166 () Bool)

(declare-fun e!517951 () Bool)

(declare-fun tp_is_empty!19663 () Bool)

(assert (=> b!923166 (= e!517951 tp_is_empty!19663)))

(declare-fun b!923167 () Bool)

(assert (=> b!923167 (= e!517950 e!517945)))

(assert (=> b!923167 (= lt!414600 (select (arr!26582 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96191 () Bool)

(assert (=> b!923167 (= c!96191 (validKeyInArray!0 lt!414600))))

(declare-fun b!923168 () Bool)

(declare-fun res!622516 () Bool)

(assert (=> b!923168 (=> (not res!622516) (not e!517949))))

(assert (=> b!923168 (= res!622516 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27043 _keys!1487))))))

(declare-fun b!923169 () Bool)

(declare-fun e!517952 () Bool)

(assert (=> b!923169 (= e!517954 e!517952)))

(declare-fun res!622520 () Bool)

(assert (=> b!923169 (=> (not res!622520) (not e!517952))))

(declare-fun lt!414609 () ListLongMap!11613)

(assert (=> b!923169 (= res!622520 (contains!4836 lt!414609 k0!1099))))

(assert (=> b!923169 (= lt!414609 (getCurrentListMap!3010 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31251 () Bool)

(declare-fun tp!59906 () Bool)

(assert (=> mapNonEmpty!31251 (= mapRes!31251 (and tp!59906 e!517951))))

(declare-fun mapKey!31251 () (_ BitVec 32))

(declare-fun mapValue!31251 () ValueCell!9350)

(declare-fun mapRest!31251 () (Array (_ BitVec 32) ValueCell!9350))

(assert (=> mapNonEmpty!31251 (= (arr!26581 _values!1231) (store mapRest!31251 mapKey!31251 mapValue!31251))))

(declare-fun b!923170 () Bool)

(assert (=> b!923170 (= e!517949 e!517947)))

(declare-fun res!622512 () Bool)

(assert (=> b!923170 (=> (not res!622512) (not e!517947))))

(assert (=> b!923170 (= res!622512 (contains!4836 lt!414604 k0!1099))))

(assert (=> b!923170 (= lt!414604 (getCurrentListMap!3010 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923171 () Bool)

(declare-fun arrayContainsKey!0 (array!55273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923171 (= e!517955 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!622514 () Bool)

(assert (=> start!78924 (=> (not res!622514) (not e!517949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78924 (= res!622514 (validMask!0 mask!1881))))

(assert (=> start!78924 e!517949))

(assert (=> start!78924 true))

(assert (=> start!78924 tp_is_empty!19663))

(declare-fun array_inv!20788 (array!55271) Bool)

(assert (=> start!78924 (and (array_inv!20788 _values!1231) e!517953)))

(assert (=> start!78924 tp!59907))

(declare-fun array_inv!20789 (array!55273) Bool)

(assert (=> start!78924 (array_inv!20789 _keys!1487)))

(declare-fun b!923161 () Bool)

(assert (=> b!923161 (= e!517955 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923172 () Bool)

(declare-fun Unit!31067 () Unit!31064)

(assert (=> b!923172 (= e!517950 Unit!31067)))

(declare-fun b!923173 () Bool)

(assert (=> b!923173 (= e!517952 false)))

(declare-fun lt!414605 () V!31183)

(assert (=> b!923173 (= lt!414605 (apply!635 lt!414609 k0!1099))))

(declare-fun b!923174 () Bool)

(assert (=> b!923174 (= e!517946 tp_is_empty!19663)))

(declare-fun b!923175 () Bool)

(declare-fun res!622513 () Bool)

(assert (=> b!923175 (=> (not res!622513) (not e!517949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55273 (_ BitVec 32)) Bool)

(assert (=> b!923175 (= res!622513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78924 res!622514) b!923164))

(assert (= (and b!923164 res!622518) b!923175))

(assert (= (and b!923175 res!622513) b!923160))

(assert (= (and b!923160 res!622519) b!923168))

(assert (= (and b!923168 res!622516) b!923170))

(assert (= (and b!923170 res!622512) b!923162))

(assert (= (and b!923162 res!622515) b!923165))

(assert (= (and b!923165 c!96192) b!923167))

(assert (= (and b!923165 (not c!96192)) b!923172))

(assert (= (and b!923167 c!96191) b!923163))

(assert (= (and b!923167 (not c!96191)) b!923159))

(assert (= (and b!923163 c!96193) b!923171))

(assert (= (and b!923163 (not c!96193)) b!923161))

(assert (= (and b!923165 res!622517) b!923169))

(assert (= (and b!923169 res!622520) b!923173))

(assert (= (and b!923158 condMapEmpty!31251) mapIsEmpty!31251))

(assert (= (and b!923158 (not condMapEmpty!31251)) mapNonEmpty!31251))

(get-info :version)

(assert (= (and mapNonEmpty!31251 ((_ is ValueCellFull!9350) mapValue!31251)) b!923166))

(assert (= (and b!923158 ((_ is ValueCellFull!9350) mapDefault!31251)) b!923174))

(assert (= start!78924 b!923158))

(declare-fun b_lambda!13639 () Bool)

(assert (=> (not b_lambda!13639) (not b!923163)))

(declare-fun t!26582 () Bool)

(declare-fun tb!5727 () Bool)

(assert (=> (and start!78924 (= defaultEntry!1235 defaultEntry!1235) t!26582) tb!5727))

(declare-fun result!11285 () Bool)

(assert (=> tb!5727 (= result!11285 tp_is_empty!19663)))

(assert (=> b!923163 t!26582))

(declare-fun b_and!28023 () Bool)

(assert (= b_and!28021 (and (=> t!26582 result!11285) b_and!28023)))

(declare-fun m!856837 () Bool)

(assert (=> b!923160 m!856837))

(declare-fun m!856839 () Bool)

(assert (=> b!923175 m!856839))

(declare-fun m!856841 () Bool)

(assert (=> mapNonEmpty!31251 m!856841))

(declare-fun m!856843 () Bool)

(assert (=> b!923173 m!856843))

(declare-fun m!856845 () Bool)

(assert (=> start!78924 m!856845))

(declare-fun m!856847 () Bool)

(assert (=> start!78924 m!856847))

(declare-fun m!856849 () Bool)

(assert (=> start!78924 m!856849))

(declare-fun m!856851 () Bool)

(assert (=> b!923165 m!856851))

(declare-fun m!856853 () Bool)

(assert (=> b!923167 m!856853))

(declare-fun m!856855 () Bool)

(assert (=> b!923167 m!856855))

(declare-fun m!856857 () Bool)

(assert (=> b!923171 m!856857))

(declare-fun m!856859 () Bool)

(assert (=> b!923163 m!856859))

(declare-fun m!856861 () Bool)

(assert (=> b!923163 m!856861))

(declare-fun m!856863 () Bool)

(assert (=> b!923163 m!856863))

(declare-fun m!856865 () Bool)

(assert (=> b!923163 m!856865))

(declare-fun m!856867 () Bool)

(assert (=> b!923163 m!856867))

(assert (=> b!923163 m!856861))

(assert (=> b!923163 m!856865))

(declare-fun m!856869 () Bool)

(assert (=> b!923163 m!856869))

(declare-fun m!856871 () Bool)

(assert (=> b!923163 m!856871))

(declare-fun m!856873 () Bool)

(assert (=> b!923163 m!856873))

(declare-fun m!856875 () Bool)

(assert (=> b!923163 m!856875))

(declare-fun m!856877 () Bool)

(assert (=> b!923163 m!856877))

(declare-fun m!856879 () Bool)

(assert (=> b!923163 m!856879))

(declare-fun m!856881 () Bool)

(assert (=> b!923163 m!856881))

(declare-fun m!856883 () Bool)

(assert (=> b!923163 m!856883))

(assert (=> b!923163 m!856875))

(declare-fun m!856885 () Bool)

(assert (=> b!923163 m!856885))

(declare-fun m!856887 () Bool)

(assert (=> b!923163 m!856887))

(declare-fun m!856889 () Bool)

(assert (=> b!923163 m!856889))

(declare-fun m!856891 () Bool)

(assert (=> b!923170 m!856891))

(declare-fun m!856893 () Bool)

(assert (=> b!923170 m!856893))

(declare-fun m!856895 () Bool)

(assert (=> b!923169 m!856895))

(assert (=> b!923169 m!856871))

(declare-fun m!856897 () Bool)

(assert (=> b!923162 m!856897))

(check-sat tp_is_empty!19663 (not b!923173) (not b!923170) (not mapNonEmpty!31251) (not b!923163) (not b_next!17155) (not start!78924) (not b!923162) (not b!923160) (not b!923167) (not b!923175) (not b_lambda!13639) (not b!923171) (not b!923165) (not b!923169) b_and!28023)
(check-sat b_and!28023 (not b_next!17155))
