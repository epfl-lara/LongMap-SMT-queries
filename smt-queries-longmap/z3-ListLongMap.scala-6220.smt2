; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79468 () Bool)

(assert start!79468)

(declare-fun b_free!17641 () Bool)

(declare-fun b_next!17641 () Bool)

(assert (=> start!79468 (= b_free!17641 (not b_next!17641))))

(declare-fun tp!61371 () Bool)

(declare-fun b_and!28823 () Bool)

(assert (=> start!79468 (= tp!61371 b_and!28823)))

(declare-fun b!934132 () Bool)

(declare-fun e!524497 () Bool)

(declare-fun tp_is_empty!20149 () Bool)

(assert (=> b!934132 (= e!524497 tp_is_empty!20149)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!524503 () Bool)

(declare-fun b!934133 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!56201 0))(
  ( (array!56202 (arr!27044 (Array (_ BitVec 32) (_ BitVec 64))) (size!27505 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56201)

(declare-fun arrayContainsKey!0 (array!56201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934133 (= e!524503 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31986 () Bool)

(declare-fun mapRes!31986 () Bool)

(assert (=> mapIsEmpty!31986 mapRes!31986))

(declare-fun b!934134 () Bool)

(declare-fun res!629193 () Bool)

(declare-fun e!524500 () Bool)

(assert (=> b!934134 (=> (not res!629193) (not e!524500))))

(assert (=> b!934134 (= res!629193 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27505 _keys!1487))))))

(declare-fun b!934135 () Bool)

(declare-fun res!629191 () Bool)

(assert (=> b!934135 (=> (not res!629191) (not e!524500))))

(declare-datatypes ((List!19085 0))(
  ( (Nil!19082) (Cons!19081 (h!20227 (_ BitVec 64)) (t!27261 List!19085)) )
))
(declare-fun arrayNoDuplicates!0 (array!56201 (_ BitVec 32) List!19085) Bool)

(assert (=> b!934135 (= res!629191 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19082))))

(declare-fun b!934136 () Bool)

(declare-fun e!524504 () Bool)

(assert (=> b!934136 (= e!524500 e!524504)))

(declare-fun res!629196 () Bool)

(assert (=> b!934136 (=> (not res!629196) (not e!524504))))

(declare-datatypes ((V!31831 0))(
  ( (V!31832 (val!10125 Int)) )
))
(declare-datatypes ((tuple2!13338 0))(
  ( (tuple2!13339 (_1!6680 (_ BitVec 64)) (_2!6680 V!31831)) )
))
(declare-datatypes ((List!19086 0))(
  ( (Nil!19083) (Cons!19082 (h!20228 tuple2!13338) (t!27262 List!19086)) )
))
(declare-datatypes ((ListLongMap!12025 0))(
  ( (ListLongMap!12026 (toList!6028 List!19086)) )
))
(declare-fun lt!420708 () ListLongMap!12025)

(declare-fun contains!5026 (ListLongMap!12025 (_ BitVec 64)) Bool)

(assert (=> b!934136 (= res!629196 (contains!5026 lt!420708 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9593 0))(
  ( (ValueCellFull!9593 (v!12644 V!31831)) (EmptyCell!9593) )
))
(declare-datatypes ((array!56203 0))(
  ( (array!56204 (arr!27045 (Array (_ BitVec 32) ValueCell!9593)) (size!27506 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56203)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31831)

(declare-fun minValue!1173 () V!31831)

(declare-fun getCurrentListMap!3199 (array!56201 array!56203 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 32) Int) ListLongMap!12025)

(assert (=> b!934136 (= lt!420708 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934137 () Bool)

(declare-fun res!629190 () Bool)

(assert (=> b!934137 (=> (not res!629190) (not e!524504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934137 (= res!629190 (validKeyInArray!0 k0!1099))))

(declare-fun b!934138 () Bool)

(declare-fun e!524498 () Bool)

(assert (=> b!934138 (= e!524498 (not true))))

(assert (=> b!934138 e!524503))

(declare-fun c!97087 () Bool)

(assert (=> b!934138 (= c!97087 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31435 0))(
  ( (Unit!31436) )
))
(declare-fun lt!420715 () Unit!31435)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!277 (array!56201 array!56203 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 64) (_ BitVec 32) Int) Unit!31435)

(assert (=> b!934138 (= lt!420715 (lemmaListMapContainsThenArrayContainsFrom!277 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934138 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19082)))

(declare-fun lt!420713 () Unit!31435)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56201 (_ BitVec 32) (_ BitVec 32)) Unit!31435)

(assert (=> b!934138 (= lt!420713 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420712 () tuple2!13338)

(declare-fun +!2830 (ListLongMap!12025 tuple2!13338) ListLongMap!12025)

(assert (=> b!934138 (contains!5026 (+!2830 lt!420708 lt!420712) k0!1099)))

(declare-fun lt!420709 () (_ BitVec 64))

(declare-fun lt!420710 () V!31831)

(declare-fun lt!420714 () Unit!31435)

(declare-fun addStillContains!519 (ListLongMap!12025 (_ BitVec 64) V!31831 (_ BitVec 64)) Unit!31435)

(assert (=> b!934138 (= lt!420714 (addStillContains!519 lt!420708 lt!420709 lt!420710 k0!1099))))

(assert (=> b!934138 (= (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2830 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420712))))

(assert (=> b!934138 (= lt!420712 (tuple2!13339 lt!420709 lt!420710))))

(declare-fun get!14245 (ValueCell!9593 V!31831) V!31831)

(declare-fun dynLambda!1586 (Int (_ BitVec 64)) V!31831)

(assert (=> b!934138 (= lt!420710 (get!14245 (select (arr!27045 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420711 () Unit!31435)

(declare-fun lemmaListMapRecursiveValidKeyArray!194 (array!56201 array!56203 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 32) Int) Unit!31435)

(assert (=> b!934138 (= lt!420711 (lemmaListMapRecursiveValidKeyArray!194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934139 () Bool)

(declare-fun e!524502 () Bool)

(assert (=> b!934139 (= e!524502 tp_is_empty!20149)))

(declare-fun mapNonEmpty!31986 () Bool)

(declare-fun tp!61370 () Bool)

(assert (=> mapNonEmpty!31986 (= mapRes!31986 (and tp!61370 e!524502))))

(declare-fun mapRest!31986 () (Array (_ BitVec 32) ValueCell!9593))

(declare-fun mapValue!31986 () ValueCell!9593)

(declare-fun mapKey!31986 () (_ BitVec 32))

(assert (=> mapNonEmpty!31986 (= (arr!27045 _values!1231) (store mapRest!31986 mapKey!31986 mapValue!31986))))

(declare-fun b!934141 () Bool)

(declare-fun res!629189 () Bool)

(assert (=> b!934141 (=> (not res!629189) (not e!524504))))

(assert (=> b!934141 (= res!629189 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934142 () Bool)

(declare-fun res!629195 () Bool)

(assert (=> b!934142 (=> (not res!629195) (not e!524500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56201 (_ BitVec 32)) Bool)

(assert (=> b!934142 (= res!629195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934143 () Bool)

(declare-fun res!629198 () Bool)

(assert (=> b!934143 (=> (not res!629198) (not e!524504))))

(declare-fun v!791 () V!31831)

(declare-fun apply!810 (ListLongMap!12025 (_ BitVec 64)) V!31831)

(assert (=> b!934143 (= res!629198 (= (apply!810 lt!420708 k0!1099) v!791))))

(declare-fun b!934144 () Bool)

(assert (=> b!934144 (= e!524504 e!524498)))

(declare-fun res!629194 () Bool)

(assert (=> b!934144 (=> (not res!629194) (not e!524498))))

(assert (=> b!934144 (= res!629194 (validKeyInArray!0 lt!420709))))

(assert (=> b!934144 (= lt!420709 (select (arr!27044 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!629192 () Bool)

(assert (=> start!79468 (=> (not res!629192) (not e!524500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79468 (= res!629192 (validMask!0 mask!1881))))

(assert (=> start!79468 e!524500))

(assert (=> start!79468 true))

(assert (=> start!79468 tp_is_empty!20149))

(declare-fun e!524501 () Bool)

(declare-fun array_inv!21110 (array!56203) Bool)

(assert (=> start!79468 (and (array_inv!21110 _values!1231) e!524501)))

(assert (=> start!79468 tp!61371))

(declare-fun array_inv!21111 (array!56201) Bool)

(assert (=> start!79468 (array_inv!21111 _keys!1487)))

(declare-fun b!934140 () Bool)

(assert (=> b!934140 (= e!524503 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934145 () Bool)

(assert (=> b!934145 (= e!524501 (and e!524497 mapRes!31986))))

(declare-fun condMapEmpty!31986 () Bool)

(declare-fun mapDefault!31986 () ValueCell!9593)

(assert (=> b!934145 (= condMapEmpty!31986 (= (arr!27045 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9593)) mapDefault!31986)))))

(declare-fun b!934146 () Bool)

(declare-fun res!629197 () Bool)

(assert (=> b!934146 (=> (not res!629197) (not e!524500))))

(assert (=> b!934146 (= res!629197 (and (= (size!27506 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27505 _keys!1487) (size!27506 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79468 res!629192) b!934146))

(assert (= (and b!934146 res!629197) b!934142))

(assert (= (and b!934142 res!629195) b!934135))

(assert (= (and b!934135 res!629191) b!934134))

(assert (= (and b!934134 res!629193) b!934136))

(assert (= (and b!934136 res!629196) b!934143))

(assert (= (and b!934143 res!629198) b!934141))

(assert (= (and b!934141 res!629189) b!934137))

(assert (= (and b!934137 res!629190) b!934144))

(assert (= (and b!934144 res!629194) b!934138))

(assert (= (and b!934138 c!97087) b!934133))

(assert (= (and b!934138 (not c!97087)) b!934140))

(assert (= (and b!934145 condMapEmpty!31986) mapIsEmpty!31986))

(assert (= (and b!934145 (not condMapEmpty!31986)) mapNonEmpty!31986))

(get-info :version)

(assert (= (and mapNonEmpty!31986 ((_ is ValueCellFull!9593) mapValue!31986)) b!934139))

(assert (= (and b!934145 ((_ is ValueCellFull!9593) mapDefault!31986)) b!934132))

(assert (= start!79468 b!934145))

(declare-fun b_lambda!13975 () Bool)

(assert (=> (not b_lambda!13975) (not b!934138)))

(declare-fun t!27260 () Bool)

(declare-fun tb!6027 () Bool)

(assert (=> (and start!79468 (= defaultEntry!1235 defaultEntry!1235) t!27260) tb!6027))

(declare-fun result!11889 () Bool)

(assert (=> tb!6027 (= result!11889 tp_is_empty!20149)))

(assert (=> b!934138 t!27260))

(declare-fun b_and!28825 () Bool)

(assert (= b_and!28823 (and (=> t!27260 result!11889) b_and!28825)))

(declare-fun m!867901 () Bool)

(assert (=> start!79468 m!867901))

(declare-fun m!867903 () Bool)

(assert (=> start!79468 m!867903))

(declare-fun m!867905 () Bool)

(assert (=> start!79468 m!867905))

(declare-fun m!867907 () Bool)

(assert (=> b!934137 m!867907))

(declare-fun m!867909 () Bool)

(assert (=> b!934138 m!867909))

(declare-fun m!867911 () Bool)

(assert (=> b!934138 m!867911))

(declare-fun m!867913 () Bool)

(assert (=> b!934138 m!867913))

(declare-fun m!867915 () Bool)

(assert (=> b!934138 m!867915))

(declare-fun m!867917 () Bool)

(assert (=> b!934138 m!867917))

(declare-fun m!867919 () Bool)

(assert (=> b!934138 m!867919))

(assert (=> b!934138 m!867917))

(assert (=> b!934138 m!867919))

(declare-fun m!867921 () Bool)

(assert (=> b!934138 m!867921))

(declare-fun m!867923 () Bool)

(assert (=> b!934138 m!867923))

(declare-fun m!867925 () Bool)

(assert (=> b!934138 m!867925))

(declare-fun m!867927 () Bool)

(assert (=> b!934138 m!867927))

(assert (=> b!934138 m!867915))

(declare-fun m!867929 () Bool)

(assert (=> b!934138 m!867929))

(declare-fun m!867931 () Bool)

(assert (=> b!934138 m!867931))

(assert (=> b!934138 m!867909))

(declare-fun m!867933 () Bool)

(assert (=> b!934138 m!867933))

(declare-fun m!867935 () Bool)

(assert (=> b!934143 m!867935))

(declare-fun m!867937 () Bool)

(assert (=> b!934142 m!867937))

(declare-fun m!867939 () Bool)

(assert (=> b!934136 m!867939))

(declare-fun m!867941 () Bool)

(assert (=> b!934136 m!867941))

(declare-fun m!867943 () Bool)

(assert (=> b!934135 m!867943))

(declare-fun m!867945 () Bool)

(assert (=> b!934133 m!867945))

(declare-fun m!867947 () Bool)

(assert (=> b!934144 m!867947))

(declare-fun m!867949 () Bool)

(assert (=> b!934144 m!867949))

(declare-fun m!867951 () Bool)

(assert (=> mapNonEmpty!31986 m!867951))

(check-sat (not b!934136) tp_is_empty!20149 (not b_next!17641) (not mapNonEmpty!31986) (not b!934135) (not start!79468) b_and!28825 (not b!934133) (not b!934142) (not b!934144) (not b!934138) (not b_lambda!13975) (not b!934143) (not b!934137))
(check-sat b_and!28825 (not b_next!17641))
