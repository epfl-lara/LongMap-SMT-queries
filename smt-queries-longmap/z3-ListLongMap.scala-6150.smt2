; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79176 () Bool)

(assert start!79176)

(declare-fun b_free!17221 () Bool)

(declare-fun b_next!17221 () Bool)

(assert (=> start!79176 (= b_free!17221 (not b_next!17221))))

(declare-fun tp!60105 () Bool)

(declare-fun b_and!28189 () Bool)

(assert (=> start!79176 (= tp!60105 b_and!28189)))

(declare-fun b!926170 () Bool)

(declare-fun e!519878 () Bool)

(declare-fun e!519880 () Bool)

(declare-fun mapRes!31350 () Bool)

(assert (=> b!926170 (= e!519878 (and e!519880 mapRes!31350))))

(declare-fun condMapEmpty!31350 () Bool)

(declare-datatypes ((V!31271 0))(
  ( (V!31272 (val!9915 Int)) )
))
(declare-datatypes ((ValueCell!9383 0))(
  ( (ValueCellFull!9383 (v!12430 V!31271)) (EmptyCell!9383) )
))
(declare-datatypes ((array!55477 0))(
  ( (array!55478 (arr!26679 (Array (_ BitVec 32) ValueCell!9383)) (size!27139 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55477)

(declare-fun mapDefault!31350 () ValueCell!9383)

(assert (=> b!926170 (= condMapEmpty!31350 (= (arr!26679 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9383)) mapDefault!31350)))))

(declare-fun b!926171 () Bool)

(declare-fun res!623889 () Bool)

(declare-fun e!519874 () Bool)

(assert (=> b!926171 (=> (not res!623889) (not e!519874))))

(declare-datatypes ((array!55479 0))(
  ( (array!55480 (arr!26680 (Array (_ BitVec 32) (_ BitVec 64))) (size!27140 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55479)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55479 (_ BitVec 32)) Bool)

(assert (=> b!926171 (= res!623889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926172 () Bool)

(declare-fun res!623882 () Bool)

(assert (=> b!926172 (=> (not res!623882) (not e!519874))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!926172 (= res!623882 (and (= (size!27139 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27140 _keys!1487) (size!27139 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926173 () Bool)

(declare-fun tp_is_empty!19729 () Bool)

(assert (=> b!926173 (= e!519880 tp_is_empty!19729)))

(declare-fun b!926174 () Bool)

(declare-datatypes ((Unit!31255 0))(
  ( (Unit!31256) )
))
(declare-fun e!519876 () Unit!31255)

(declare-fun Unit!31257 () Unit!31255)

(assert (=> b!926174 (= e!519876 Unit!31257)))

(declare-fun b!926175 () Bool)

(declare-fun res!623884 () Bool)

(declare-fun e!519877 () Bool)

(assert (=> b!926175 (=> (not res!623884) (not e!519877))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31271)

(declare-datatypes ((tuple2!12914 0))(
  ( (tuple2!12915 (_1!6468 (_ BitVec 64)) (_2!6468 V!31271)) )
))
(declare-datatypes ((List!18725 0))(
  ( (Nil!18722) (Cons!18721 (h!19873 tuple2!12914) (t!26668 List!18725)) )
))
(declare-datatypes ((ListLongMap!11613 0))(
  ( (ListLongMap!11614 (toList!5822 List!18725)) )
))
(declare-fun lt!416703 () ListLongMap!11613)

(declare-fun apply!673 (ListLongMap!11613 (_ BitVec 64)) V!31271)

(assert (=> b!926175 (= res!623884 (= (apply!673 lt!416703 k0!1099) v!791))))

(declare-fun b!926176 () Bool)

(declare-fun e!519879 () Bool)

(declare-fun e!519881 () Bool)

(assert (=> b!926176 (= e!519879 e!519881)))

(declare-fun res!623887 () Bool)

(assert (=> b!926176 (=> (not res!623887) (not e!519881))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!416704 () V!31271)

(assert (=> b!926176 (= res!623887 (and (= lt!416704 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!416699 () ListLongMap!11613)

(assert (=> b!926176 (= lt!416704 (apply!673 lt!416699 k0!1099))))

(declare-fun mapIsEmpty!31350 () Bool)

(assert (=> mapIsEmpty!31350 mapRes!31350))

(declare-fun b!926177 () Bool)

(assert (=> b!926177 (= e!519874 e!519879)))

(declare-fun res!623883 () Bool)

(assert (=> b!926177 (=> (not res!623883) (not e!519879))))

(declare-fun contains!4894 (ListLongMap!11613 (_ BitVec 64)) Bool)

(assert (=> b!926177 (= res!623883 (contains!4894 lt!416699 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31271)

(declare-fun minValue!1173 () V!31271)

(declare-fun getCurrentListMap!3072 (array!55479 array!55477 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 32) Int) ListLongMap!11613)

(assert (=> b!926177 (= lt!416699 (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!623880 () Bool)

(assert (=> start!79176 (=> (not res!623880) (not e!519874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79176 (= res!623880 (validMask!0 mask!1881))))

(assert (=> start!79176 e!519874))

(assert (=> start!79176 true))

(assert (=> start!79176 tp_is_empty!19729))

(declare-fun array_inv!20876 (array!55477) Bool)

(assert (=> start!79176 (and (array_inv!20876 _values!1231) e!519878)))

(assert (=> start!79176 tp!60105))

(declare-fun array_inv!20877 (array!55479) Bool)

(assert (=> start!79176 (array_inv!20877 _keys!1487)))

(declare-fun e!519875 () Bool)

(declare-fun b!926178 () Bool)

(declare-fun arrayContainsKey!0 (array!55479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926178 (= e!519875 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926179 () Bool)

(declare-fun res!623881 () Bool)

(assert (=> b!926179 (=> (not res!623881) (not e!519874))))

(declare-datatypes ((List!18726 0))(
  ( (Nil!18723) (Cons!18722 (h!19874 (_ BitVec 64)) (t!26669 List!18726)) )
))
(declare-fun arrayNoDuplicates!0 (array!55479 (_ BitVec 32) List!18726) Bool)

(assert (=> b!926179 (= res!623881 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18723))))

(declare-fun b!926180 () Bool)

(declare-fun res!623885 () Bool)

(assert (=> b!926180 (=> (not res!623885) (not e!519874))))

(assert (=> b!926180 (= res!623885 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27140 _keys!1487))))))

(declare-fun b!926181 () Bool)

(declare-fun lt!416695 () ListLongMap!11613)

(assert (=> b!926181 (= (apply!673 lt!416695 k0!1099) lt!416704)))

(declare-fun lt!416698 () V!31271)

(declare-fun lt!416696 () Unit!31255)

(declare-fun lt!416702 () (_ BitVec 64))

(declare-fun addApplyDifferent!374 (ListLongMap!11613 (_ BitVec 64) V!31271 (_ BitVec 64)) Unit!31255)

(assert (=> b!926181 (= lt!416696 (addApplyDifferent!374 lt!416699 lt!416702 lt!416698 k0!1099))))

(assert (=> b!926181 (not (= lt!416702 k0!1099))))

(declare-fun lt!416692 () Unit!31255)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55479 (_ BitVec 64) (_ BitVec 32) List!18726) Unit!31255)

(assert (=> b!926181 (= lt!416692 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18723))))

(assert (=> b!926181 e!519875))

(declare-fun c!96835 () Bool)

(assert (=> b!926181 (= c!96835 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416697 () Unit!31255)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!229 (array!55479 array!55477 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 64) (_ BitVec 32) Int) Unit!31255)

(assert (=> b!926181 (= lt!416697 (lemmaListMapContainsThenArrayContainsFrom!229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926181 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18723)))

(declare-fun lt!416690 () Unit!31255)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55479 (_ BitVec 32) (_ BitVec 32)) Unit!31255)

(assert (=> b!926181 (= lt!416690 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926181 (contains!4894 lt!416695 k0!1099)))

(declare-fun lt!416694 () tuple2!12914)

(declare-fun +!2738 (ListLongMap!11613 tuple2!12914) ListLongMap!11613)

(assert (=> b!926181 (= lt!416695 (+!2738 lt!416699 lt!416694))))

(declare-fun lt!416705 () Unit!31255)

(declare-fun addStillContains!447 (ListLongMap!11613 (_ BitVec 64) V!31271 (_ BitVec 64)) Unit!31255)

(assert (=> b!926181 (= lt!416705 (addStillContains!447 lt!416699 lt!416702 lt!416698 k0!1099))))

(assert (=> b!926181 (= (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2738 (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416694))))

(assert (=> b!926181 (= lt!416694 (tuple2!12915 lt!416702 lt!416698))))

(declare-fun get!14047 (ValueCell!9383 V!31271) V!31271)

(declare-fun dynLambda!1535 (Int (_ BitVec 64)) V!31271)

(assert (=> b!926181 (= lt!416698 (get!14047 (select (arr!26679 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1535 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416701 () Unit!31255)

(declare-fun lemmaListMapRecursiveValidKeyArray!118 (array!55479 array!55477 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 32) Int) Unit!31255)

(assert (=> b!926181 (= lt!416701 (lemmaListMapRecursiveValidKeyArray!118 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519886 () Unit!31255)

(assert (=> b!926181 (= e!519886 lt!416696)))

(declare-fun b!926182 () Bool)

(assert (=> b!926182 (= e!519876 e!519886)))

(assert (=> b!926182 (= lt!416702 (select (arr!26680 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96836 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926182 (= c!96836 (validKeyInArray!0 lt!416702))))

(declare-fun b!926183 () Bool)

(assert (=> b!926183 (= e!519875 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926184 () Bool)

(declare-fun e!519882 () Bool)

(assert (=> b!926184 (= e!519881 e!519882)))

(declare-fun res!623888 () Bool)

(assert (=> b!926184 (=> (not res!623888) (not e!519882))))

(assert (=> b!926184 (= res!623888 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27140 _keys!1487)))))

(declare-fun lt!416693 () Unit!31255)

(assert (=> b!926184 (= lt!416693 e!519876)))

(declare-fun c!96837 () Bool)

(assert (=> b!926184 (= c!96837 (validKeyInArray!0 k0!1099))))

(declare-fun e!519884 () Bool)

(declare-fun b!926185 () Bool)

(declare-fun lt!416700 () ListLongMap!11613)

(assert (=> b!926185 (= e!519884 (= (apply!673 lt!416700 k0!1099) v!791))))

(declare-fun b!926186 () Bool)

(assert (=> b!926186 (= e!519877 (not true))))

(assert (=> b!926186 e!519884))

(declare-fun res!623879 () Bool)

(assert (=> b!926186 (=> (not res!623879) (not e!519884))))

(assert (=> b!926186 (= res!623879 (contains!4894 lt!416700 k0!1099))))

(assert (=> b!926186 (= lt!416700 (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416691 () Unit!31255)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!69 (array!55479 array!55477 (_ BitVec 32) (_ BitVec 32) V!31271 V!31271 (_ BitVec 64) V!31271 (_ BitVec 32) Int) Unit!31255)

(assert (=> b!926186 (= lt!416691 (lemmaListMapApplyFromThenApplyFromZero!69 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31350 () Bool)

(declare-fun tp!60104 () Bool)

(declare-fun e!519885 () Bool)

(assert (=> mapNonEmpty!31350 (= mapRes!31350 (and tp!60104 e!519885))))

(declare-fun mapKey!31350 () (_ BitVec 32))

(declare-fun mapValue!31350 () ValueCell!9383)

(declare-fun mapRest!31350 () (Array (_ BitVec 32) ValueCell!9383))

(assert (=> mapNonEmpty!31350 (= (arr!26679 _values!1231) (store mapRest!31350 mapKey!31350 mapValue!31350))))

(declare-fun b!926187 () Bool)

(declare-fun Unit!31258 () Unit!31255)

(assert (=> b!926187 (= e!519886 Unit!31258)))

(declare-fun b!926188 () Bool)

(assert (=> b!926188 (= e!519882 e!519877)))

(declare-fun res!623886 () Bool)

(assert (=> b!926188 (=> (not res!623886) (not e!519877))))

(assert (=> b!926188 (= res!623886 (contains!4894 lt!416703 k0!1099))))

(assert (=> b!926188 (= lt!416703 (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926189 () Bool)

(assert (=> b!926189 (= e!519885 tp_is_empty!19729)))

(assert (= (and start!79176 res!623880) b!926172))

(assert (= (and b!926172 res!623882) b!926171))

(assert (= (and b!926171 res!623889) b!926179))

(assert (= (and b!926179 res!623881) b!926180))

(assert (= (and b!926180 res!623885) b!926177))

(assert (= (and b!926177 res!623883) b!926176))

(assert (= (and b!926176 res!623887) b!926184))

(assert (= (and b!926184 c!96837) b!926182))

(assert (= (and b!926184 (not c!96837)) b!926174))

(assert (= (and b!926182 c!96836) b!926181))

(assert (= (and b!926182 (not c!96836)) b!926187))

(assert (= (and b!926181 c!96835) b!926178))

(assert (= (and b!926181 (not c!96835)) b!926183))

(assert (= (and b!926184 res!623888) b!926188))

(assert (= (and b!926188 res!623886) b!926175))

(assert (= (and b!926175 res!623884) b!926186))

(assert (= (and b!926186 res!623879) b!926185))

(assert (= (and b!926170 condMapEmpty!31350) mapIsEmpty!31350))

(assert (= (and b!926170 (not condMapEmpty!31350)) mapNonEmpty!31350))

(get-info :version)

(assert (= (and mapNonEmpty!31350 ((_ is ValueCellFull!9383) mapValue!31350)) b!926189))

(assert (= (and b!926170 ((_ is ValueCellFull!9383) mapDefault!31350)) b!926173))

(assert (= start!79176 b!926170))

(declare-fun b_lambda!13737 () Bool)

(assert (=> (not b_lambda!13737) (not b!926181)))

(declare-fun t!26667 () Bool)

(declare-fun tb!5793 () Bool)

(assert (=> (and start!79176 (= defaultEntry!1235 defaultEntry!1235) t!26667) tb!5793))

(declare-fun result!11417 () Bool)

(assert (=> tb!5793 (= result!11417 tp_is_empty!19729)))

(assert (=> b!926181 t!26667))

(declare-fun b_and!28191 () Bool)

(assert (= b_and!28189 (and (=> t!26667 result!11417) b_and!28191)))

(declare-fun m!860959 () Bool)

(assert (=> b!926184 m!860959))

(declare-fun m!860961 () Bool)

(assert (=> b!926177 m!860961))

(declare-fun m!860963 () Bool)

(assert (=> b!926177 m!860963))

(declare-fun m!860965 () Bool)

(assert (=> b!926175 m!860965))

(declare-fun m!860967 () Bool)

(assert (=> b!926178 m!860967))

(declare-fun m!860969 () Bool)

(assert (=> b!926181 m!860969))

(declare-fun m!860971 () Bool)

(assert (=> b!926181 m!860971))

(declare-fun m!860973 () Bool)

(assert (=> b!926181 m!860973))

(declare-fun m!860975 () Bool)

(assert (=> b!926181 m!860975))

(declare-fun m!860977 () Bool)

(assert (=> b!926181 m!860977))

(declare-fun m!860979 () Bool)

(assert (=> b!926181 m!860979))

(declare-fun m!860981 () Bool)

(assert (=> b!926181 m!860981))

(declare-fun m!860983 () Bool)

(assert (=> b!926181 m!860983))

(declare-fun m!860985 () Bool)

(assert (=> b!926181 m!860985))

(declare-fun m!860987 () Bool)

(assert (=> b!926181 m!860987))

(declare-fun m!860989 () Bool)

(assert (=> b!926181 m!860989))

(declare-fun m!860991 () Bool)

(assert (=> b!926181 m!860991))

(declare-fun m!860993 () Bool)

(assert (=> b!926181 m!860993))

(declare-fun m!860995 () Bool)

(assert (=> b!926181 m!860995))

(assert (=> b!926181 m!860973))

(assert (=> b!926181 m!860977))

(declare-fun m!860997 () Bool)

(assert (=> b!926181 m!860997))

(assert (=> b!926181 m!860985))

(declare-fun m!860999 () Bool)

(assert (=> b!926181 m!860999))

(declare-fun m!861001 () Bool)

(assert (=> b!926179 m!861001))

(declare-fun m!861003 () Bool)

(assert (=> mapNonEmpty!31350 m!861003))

(declare-fun m!861005 () Bool)

(assert (=> b!926188 m!861005))

(assert (=> b!926188 m!860983))

(declare-fun m!861007 () Bool)

(assert (=> start!79176 m!861007))

(declare-fun m!861009 () Bool)

(assert (=> start!79176 m!861009))

(declare-fun m!861011 () Bool)

(assert (=> start!79176 m!861011))

(declare-fun m!861013 () Bool)

(assert (=> b!926171 m!861013))

(declare-fun m!861015 () Bool)

(assert (=> b!926176 m!861015))

(declare-fun m!861017 () Bool)

(assert (=> b!926185 m!861017))

(declare-fun m!861019 () Bool)

(assert (=> b!926182 m!861019))

(declare-fun m!861021 () Bool)

(assert (=> b!926182 m!861021))

(declare-fun m!861023 () Bool)

(assert (=> b!926186 m!861023))

(declare-fun m!861025 () Bool)

(assert (=> b!926186 m!861025))

(declare-fun m!861027 () Bool)

(assert (=> b!926186 m!861027))

(check-sat (not b!926182) (not b!926186) (not b_lambda!13737) (not b!926177) (not b!926181) (not b!926175) (not b!926179) (not mapNonEmpty!31350) (not start!79176) (not b_next!17221) (not b!926185) (not b!926188) tp_is_empty!19729 (not b!926178) (not b!926171) (not b!926184) (not b!926176) b_and!28191)
(check-sat b_and!28191 (not b_next!17221))
