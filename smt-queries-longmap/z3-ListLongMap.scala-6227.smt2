; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79802 () Bool)

(assert start!79802)

(declare-fun b_free!17683 () Bool)

(declare-fun b_next!17683 () Bool)

(assert (=> start!79802 (= b_free!17683 (not b_next!17683))))

(declare-fun tp!61505 () Bool)

(declare-fun b_and!28967 () Bool)

(assert (=> start!79802 (= tp!61505 b_and!28967)))

(declare-fun b!936957 () Bool)

(declare-fun res!630662 () Bool)

(declare-fun e!526181 () Bool)

(assert (=> b!936957 (=> (not res!630662) (not e!526181))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56375 0))(
  ( (array!56376 (arr!27123 (Array (_ BitVec 32) (_ BitVec 64))) (size!27583 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56375)

(assert (=> b!936957 (= res!630662 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27583 _keys!1487))))))

(declare-fun mapNonEmpty!32058 () Bool)

(declare-fun mapRes!32058 () Bool)

(declare-fun tp!61506 () Bool)

(declare-fun e!526182 () Bool)

(assert (=> mapNonEmpty!32058 (= mapRes!32058 (and tp!61506 e!526182))))

(declare-fun mapKey!32058 () (_ BitVec 32))

(declare-datatypes ((V!31887 0))(
  ( (V!31888 (val!10146 Int)) )
))
(declare-datatypes ((ValueCell!9614 0))(
  ( (ValueCellFull!9614 (v!12668 V!31887)) (EmptyCell!9614) )
))
(declare-fun mapRest!32058 () (Array (_ BitVec 32) ValueCell!9614))

(declare-fun mapValue!32058 () ValueCell!9614)

(declare-datatypes ((array!56377 0))(
  ( (array!56378 (arr!27124 (Array (_ BitVec 32) ValueCell!9614)) (size!27584 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56377)

(assert (=> mapNonEmpty!32058 (= (arr!27124 _values!1231) (store mapRest!32058 mapKey!32058 mapValue!32058))))

(declare-fun b!936958 () Bool)

(declare-fun res!630668 () Bool)

(assert (=> b!936958 (=> (not res!630668) (not e!526181))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56375 (_ BitVec 32)) Bool)

(assert (=> b!936958 (= res!630668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936959 () Bool)

(declare-fun e!526184 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936959 (= e!526184 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936960 () Bool)

(declare-fun e!526183 () Bool)

(assert (=> b!936960 (= e!526181 e!526183)))

(declare-fun res!630666 () Bool)

(assert (=> b!936960 (=> (not res!630666) (not e!526183))))

(declare-datatypes ((tuple2!13304 0))(
  ( (tuple2!13305 (_1!6663 (_ BitVec 64)) (_2!6663 V!31887)) )
))
(declare-datatypes ((List!19084 0))(
  ( (Nil!19081) (Cons!19080 (h!20232 tuple2!13304) (t!27303 List!19084)) )
))
(declare-datatypes ((ListLongMap!12003 0))(
  ( (ListLongMap!12004 (toList!6017 List!19084)) )
))
(declare-fun lt!422338 () ListLongMap!12003)

(declare-fun contains!5090 (ListLongMap!12003 (_ BitVec 64)) Bool)

(assert (=> b!936960 (= res!630666 (contains!5090 lt!422338 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31887)

(declare-fun minValue!1173 () V!31887)

(declare-fun getCurrentListMap!3255 (array!56375 array!56377 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 32) Int) ListLongMap!12003)

(assert (=> b!936960 (= lt!422338 (getCurrentListMap!3255 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936961 () Bool)

(declare-fun e!526186 () Bool)

(declare-fun e!526185 () Bool)

(assert (=> b!936961 (= e!526186 (and e!526185 mapRes!32058))))

(declare-fun condMapEmpty!32058 () Bool)

(declare-fun mapDefault!32058 () ValueCell!9614)

(assert (=> b!936961 (= condMapEmpty!32058 (= (arr!27124 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9614)) mapDefault!32058)))))

(declare-fun b!936962 () Bool)

(declare-fun res!630660 () Bool)

(assert (=> b!936962 (=> (not res!630660) (not e!526183))))

(declare-fun v!791 () V!31887)

(declare-fun apply!837 (ListLongMap!12003 (_ BitVec 64)) V!31887)

(assert (=> b!936962 (= res!630660 (= (apply!837 lt!422338 k0!1099) v!791))))

(declare-fun b!936963 () Bool)

(declare-fun res!630667 () Bool)

(assert (=> b!936963 (=> (not res!630667) (not e!526183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936963 (= res!630667 (validKeyInArray!0 k0!1099))))

(declare-fun b!936964 () Bool)

(declare-fun tp_is_empty!20191 () Bool)

(assert (=> b!936964 (= e!526182 tp_is_empty!20191)))

(declare-fun mapIsEmpty!32058 () Bool)

(assert (=> mapIsEmpty!32058 mapRes!32058))

(declare-fun b!936965 () Bool)

(assert (=> b!936965 (= e!526184 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936966 () Bool)

(assert (=> b!936966 (= e!526185 tp_is_empty!20191)))

(declare-fun b!936967 () Bool)

(declare-fun e!526187 () Bool)

(assert (=> b!936967 (= e!526183 e!526187)))

(declare-fun res!630665 () Bool)

(assert (=> b!936967 (=> (not res!630665) (not e!526187))))

(declare-fun lt!422339 () (_ BitVec 64))

(assert (=> b!936967 (= res!630665 (validKeyInArray!0 lt!422339))))

(assert (=> b!936967 (= lt!422339 (select (arr!27123 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!936968 () Bool)

(declare-fun res!630664 () Bool)

(assert (=> b!936968 (=> (not res!630664) (not e!526181))))

(declare-datatypes ((List!19085 0))(
  ( (Nil!19082) (Cons!19081 (h!20233 (_ BitVec 64)) (t!27304 List!19085)) )
))
(declare-fun arrayNoDuplicates!0 (array!56375 (_ BitVec 32) List!19085) Bool)

(assert (=> b!936968 (= res!630664 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19082))))

(declare-fun b!936969 () Bool)

(declare-fun res!630669 () Bool)

(assert (=> b!936969 (=> (not res!630669) (not e!526183))))

(assert (=> b!936969 (= res!630669 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!630661 () Bool)

(assert (=> start!79802 (=> (not res!630661) (not e!526181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79802 (= res!630661 (validMask!0 mask!1881))))

(assert (=> start!79802 e!526181))

(assert (=> start!79802 true))

(assert (=> start!79802 tp_is_empty!20191))

(declare-fun array_inv!21184 (array!56377) Bool)

(assert (=> start!79802 (and (array_inv!21184 _values!1231) e!526186)))

(assert (=> start!79802 tp!61505))

(declare-fun array_inv!21185 (array!56375) Bool)

(assert (=> start!79802 (array_inv!21185 _keys!1487)))

(declare-fun b!936970 () Bool)

(declare-fun res!630663 () Bool)

(assert (=> b!936970 (=> (not res!630663) (not e!526181))))

(assert (=> b!936970 (= res!630663 (and (= (size!27584 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27583 _keys!1487) (size!27584 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936971 () Bool)

(assert (=> b!936971 (= e!526187 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27584 _values!1231))))))

(assert (=> b!936971 (not (= lt!422339 k0!1099))))

(declare-datatypes ((Unit!31558 0))(
  ( (Unit!31559) )
))
(declare-fun lt!422343 () Unit!31558)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56375 (_ BitVec 64) (_ BitVec 32) List!19085) Unit!31558)

(assert (=> b!936971 (= lt!422343 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19082))))

(assert (=> b!936971 e!526184))

(declare-fun c!97638 () Bool)

(assert (=> b!936971 (= c!97638 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422337 () Unit!31558)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!288 (array!56375 array!56377 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 64) (_ BitVec 32) Int) Unit!31558)

(assert (=> b!936971 (= lt!422337 (lemmaListMapContainsThenArrayContainsFrom!288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936971 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19082)))

(declare-fun lt!422336 () Unit!31558)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56375 (_ BitVec 32) (_ BitVec 32)) Unit!31558)

(assert (=> b!936971 (= lt!422336 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!422341 () tuple2!13304)

(declare-fun +!2834 (ListLongMap!12003 tuple2!13304) ListLongMap!12003)

(assert (=> b!936971 (contains!5090 (+!2834 lt!422338 lt!422341) k0!1099)))

(declare-fun lt!422335 () V!31887)

(declare-fun lt!422340 () Unit!31558)

(declare-fun addStillContains!537 (ListLongMap!12003 (_ BitVec 64) V!31887 (_ BitVec 64)) Unit!31558)

(assert (=> b!936971 (= lt!422340 (addStillContains!537 lt!422338 lt!422339 lt!422335 k0!1099))))

(assert (=> b!936971 (= (getCurrentListMap!3255 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2834 (getCurrentListMap!3255 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422341))))

(assert (=> b!936971 (= lt!422341 (tuple2!13305 lt!422339 lt!422335))))

(declare-fun get!14312 (ValueCell!9614 V!31887) V!31887)

(declare-fun dynLambda!1631 (Int (_ BitVec 64)) V!31887)

(assert (=> b!936971 (= lt!422335 (get!14312 (select (arr!27124 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422342 () Unit!31558)

(declare-fun lemmaListMapRecursiveValidKeyArray!214 (array!56375 array!56377 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 32) Int) Unit!31558)

(assert (=> b!936971 (= lt!422342 (lemmaListMapRecursiveValidKeyArray!214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79802 res!630661) b!936970))

(assert (= (and b!936970 res!630663) b!936958))

(assert (= (and b!936958 res!630668) b!936968))

(assert (= (and b!936968 res!630664) b!936957))

(assert (= (and b!936957 res!630662) b!936960))

(assert (= (and b!936960 res!630666) b!936962))

(assert (= (and b!936962 res!630660) b!936969))

(assert (= (and b!936969 res!630669) b!936963))

(assert (= (and b!936963 res!630667) b!936967))

(assert (= (and b!936967 res!630665) b!936971))

(assert (= (and b!936971 c!97638) b!936959))

(assert (= (and b!936971 (not c!97638)) b!936965))

(assert (= (and b!936961 condMapEmpty!32058) mapIsEmpty!32058))

(assert (= (and b!936961 (not condMapEmpty!32058)) mapNonEmpty!32058))

(get-info :version)

(assert (= (and mapNonEmpty!32058 ((_ is ValueCellFull!9614) mapValue!32058)) b!936964))

(assert (= (and b!936961 ((_ is ValueCellFull!9614) mapDefault!32058)) b!936966))

(assert (= start!79802 b!936961))

(declare-fun b_lambda!14103 () Bool)

(assert (=> (not b_lambda!14103) (not b!936971)))

(declare-fun t!27302 () Bool)

(declare-fun tb!6069 () Bool)

(assert (=> (and start!79802 (= defaultEntry!1235 defaultEntry!1235) t!27302) tb!6069))

(declare-fun result!11979 () Bool)

(assert (=> tb!6069 (= result!11979 tp_is_empty!20191)))

(assert (=> b!936971 t!27302))

(declare-fun b_and!28969 () Bool)

(assert (= b_and!28967 (and (=> t!27302 result!11979) b_and!28969)))

(declare-fun m!871895 () Bool)

(assert (=> b!936968 m!871895))

(declare-fun m!871897 () Bool)

(assert (=> b!936959 m!871897))

(declare-fun m!871899 () Bool)

(assert (=> b!936958 m!871899))

(declare-fun m!871901 () Bool)

(assert (=> b!936960 m!871901))

(declare-fun m!871903 () Bool)

(assert (=> b!936960 m!871903))

(declare-fun m!871905 () Bool)

(assert (=> b!936971 m!871905))

(declare-fun m!871907 () Bool)

(assert (=> b!936971 m!871907))

(declare-fun m!871909 () Bool)

(assert (=> b!936971 m!871909))

(declare-fun m!871911 () Bool)

(assert (=> b!936971 m!871911))

(assert (=> b!936971 m!871905))

(declare-fun m!871913 () Bool)

(assert (=> b!936971 m!871913))

(declare-fun m!871915 () Bool)

(assert (=> b!936971 m!871915))

(assert (=> b!936971 m!871911))

(assert (=> b!936971 m!871913))

(declare-fun m!871917 () Bool)

(assert (=> b!936971 m!871917))

(declare-fun m!871919 () Bool)

(assert (=> b!936971 m!871919))

(declare-fun m!871921 () Bool)

(assert (=> b!936971 m!871921))

(declare-fun m!871923 () Bool)

(assert (=> b!936971 m!871923))

(declare-fun m!871925 () Bool)

(assert (=> b!936971 m!871925))

(declare-fun m!871927 () Bool)

(assert (=> b!936971 m!871927))

(declare-fun m!871929 () Bool)

(assert (=> b!936971 m!871929))

(assert (=> b!936971 m!871925))

(declare-fun m!871931 () Bool)

(assert (=> b!936971 m!871931))

(declare-fun m!871933 () Bool)

(assert (=> start!79802 m!871933))

(declare-fun m!871935 () Bool)

(assert (=> start!79802 m!871935))

(declare-fun m!871937 () Bool)

(assert (=> start!79802 m!871937))

(declare-fun m!871939 () Bool)

(assert (=> mapNonEmpty!32058 m!871939))

(declare-fun m!871941 () Bool)

(assert (=> b!936963 m!871941))

(declare-fun m!871943 () Bool)

(assert (=> b!936967 m!871943))

(declare-fun m!871945 () Bool)

(assert (=> b!936967 m!871945))

(declare-fun m!871947 () Bool)

(assert (=> b!936962 m!871947))

(check-sat (not b_lambda!14103) (not b!936960) (not start!79802) (not b!936962) (not mapNonEmpty!32058) (not b_next!17683) (not b!936971) (not b!936967) tp_is_empty!20191 (not b!936958) b_and!28969 (not b!936959) (not b!936968) (not b!936963))
(check-sat b_and!28969 (not b_next!17683))
