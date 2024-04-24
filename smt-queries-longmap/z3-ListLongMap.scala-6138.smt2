; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79104 () Bool)

(assert start!79104)

(declare-fun b_free!17149 () Bool)

(declare-fun b_next!17149 () Bool)

(assert (=> start!79104 (= b_free!17149 (not b_next!17149))))

(declare-fun tp!59889 () Bool)

(declare-fun b_and!28045 () Bool)

(assert (=> start!79104 (= tp!59889 b_and!28045)))

(declare-fun b!924132 () Bool)

(declare-datatypes ((Unit!31144 0))(
  ( (Unit!31145) )
))
(declare-fun e!518572 () Unit!31144)

(declare-fun Unit!31146 () Unit!31144)

(assert (=> b!924132 (= e!518572 Unit!31146)))

(declare-fun b!924133 () Bool)

(declare-fun res!622893 () Bool)

(declare-fun e!518571 () Bool)

(assert (=> b!924133 (=> (not res!622893) (not e!518571))))

(declare-datatypes ((array!55337 0))(
  ( (array!55338 (arr!26609 (Array (_ BitVec 32) (_ BitVec 64))) (size!27069 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55337)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55337 (_ BitVec 32)) Bool)

(assert (=> b!924133 (= res!622893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924134 () Bool)

(declare-datatypes ((V!31175 0))(
  ( (V!31176 (val!9879 Int)) )
))
(declare-datatypes ((tuple2!12854 0))(
  ( (tuple2!12855 (_1!6438 (_ BitVec 64)) (_2!6438 V!31175)) )
))
(declare-datatypes ((List!18670 0))(
  ( (Nil!18667) (Cons!18666 (h!19818 tuple2!12854) (t!26541 List!18670)) )
))
(declare-datatypes ((ListLongMap!11553 0))(
  ( (ListLongMap!11554 (toList!5792 List!18670)) )
))
(declare-fun lt!415062 () ListLongMap!11553)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!415068 () V!31175)

(declare-fun apply!646 (ListLongMap!11553 (_ BitVec 64)) V!31175)

(assert (=> b!924134 (= (apply!646 lt!415062 k0!1099) lt!415068)))

(declare-fun lt!415073 () V!31175)

(declare-fun lt!415061 () (_ BitVec 64))

(declare-fun lt!415059 () ListLongMap!11553)

(declare-fun lt!415069 () Unit!31144)

(declare-fun addApplyDifferent!352 (ListLongMap!11553 (_ BitVec 64) V!31175 (_ BitVec 64)) Unit!31144)

(assert (=> b!924134 (= lt!415069 (addApplyDifferent!352 lt!415059 lt!415061 lt!415073 k0!1099))))

(assert (=> b!924134 (not (= lt!415061 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!415067 () Unit!31144)

(declare-datatypes ((List!18671 0))(
  ( (Nil!18668) (Cons!18667 (h!19819 (_ BitVec 64)) (t!26542 List!18671)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55337 (_ BitVec 64) (_ BitVec 32) List!18671) Unit!31144)

(assert (=> b!924134 (= lt!415067 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18668))))

(declare-fun e!518570 () Bool)

(assert (=> b!924134 e!518570))

(declare-fun c!96512 () Bool)

(assert (=> b!924134 (= c!96512 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415071 () Unit!31144)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9347 0))(
  ( (ValueCellFull!9347 (v!12394 V!31175)) (EmptyCell!9347) )
))
(declare-datatypes ((array!55339 0))(
  ( (array!55340 (arr!26610 (Array (_ BitVec 32) ValueCell!9347)) (size!27070 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55339)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31175)

(declare-fun minValue!1173 () V!31175)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!207 (array!55337 array!55339 (_ BitVec 32) (_ BitVec 32) V!31175 V!31175 (_ BitVec 64) (_ BitVec 32) Int) Unit!31144)

(assert (=> b!924134 (= lt!415071 (lemmaListMapContainsThenArrayContainsFrom!207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55337 (_ BitVec 32) List!18671) Bool)

(assert (=> b!924134 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18668)))

(declare-fun lt!415063 () Unit!31144)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55337 (_ BitVec 32) (_ BitVec 32)) Unit!31144)

(assert (=> b!924134 (= lt!415063 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4865 (ListLongMap!11553 (_ BitVec 64)) Bool)

(assert (=> b!924134 (contains!4865 lt!415062 k0!1099)))

(declare-fun lt!415060 () tuple2!12854)

(declare-fun +!2716 (ListLongMap!11553 tuple2!12854) ListLongMap!11553)

(assert (=> b!924134 (= lt!415062 (+!2716 lt!415059 lt!415060))))

(declare-fun lt!415070 () Unit!31144)

(declare-fun addStillContains!425 (ListLongMap!11553 (_ BitVec 64) V!31175 (_ BitVec 64)) Unit!31144)

(assert (=> b!924134 (= lt!415070 (addStillContains!425 lt!415059 lt!415061 lt!415073 k0!1099))))

(declare-fun getCurrentListMap!3043 (array!55337 array!55339 (_ BitVec 32) (_ BitVec 32) V!31175 V!31175 (_ BitVec 32) Int) ListLongMap!11553)

(assert (=> b!924134 (= (getCurrentListMap!3043 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2716 (getCurrentListMap!3043 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415060))))

(assert (=> b!924134 (= lt!415060 (tuple2!12855 lt!415061 lt!415073))))

(declare-fun get!14001 (ValueCell!9347 V!31175) V!31175)

(declare-fun dynLambda!1513 (Int (_ BitVec 64)) V!31175)

(assert (=> b!924134 (= lt!415073 (get!14001 (select (arr!26610 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1513 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415066 () Unit!31144)

(declare-fun lemmaListMapRecursiveValidKeyArray!96 (array!55337 array!55339 (_ BitVec 32) (_ BitVec 32) V!31175 V!31175 (_ BitVec 32) Int) Unit!31144)

(assert (=> b!924134 (= lt!415066 (lemmaListMapRecursiveValidKeyArray!96 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924134 (= e!518572 lt!415069)))

(declare-fun b!924135 () Bool)

(declare-fun res!622889 () Bool)

(assert (=> b!924135 (=> (not res!622889) (not e!518571))))

(assert (=> b!924135 (= res!622889 (and (= (size!27070 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27069 _keys!1487) (size!27070 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924136 () Bool)

(declare-fun e!518578 () Bool)

(assert (=> b!924136 (= e!518571 e!518578)))

(declare-fun res!622886 () Bool)

(assert (=> b!924136 (=> (not res!622886) (not e!518578))))

(assert (=> b!924136 (= res!622886 (contains!4865 lt!415059 k0!1099))))

(assert (=> b!924136 (= lt!415059 (getCurrentListMap!3043 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924137 () Bool)

(declare-fun e!518576 () Unit!31144)

(assert (=> b!924137 (= e!518576 e!518572)))

(assert (=> b!924137 (= lt!415061 (select (arr!26609 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96513 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924137 (= c!96513 (validKeyInArray!0 lt!415061))))

(declare-fun b!924138 () Bool)

(declare-fun e!518574 () Bool)

(assert (=> b!924138 (= e!518578 e!518574)))

(declare-fun res!622891 () Bool)

(assert (=> b!924138 (=> (not res!622891) (not e!518574))))

(declare-fun v!791 () V!31175)

(assert (=> b!924138 (= res!622891 (and (= lt!415068 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!924138 (= lt!415068 (apply!646 lt!415059 k0!1099))))

(declare-fun b!924139 () Bool)

(declare-fun e!518568 () Bool)

(declare-fun tp_is_empty!19657 () Bool)

(assert (=> b!924139 (= e!518568 tp_is_empty!19657)))

(declare-fun b!924140 () Bool)

(declare-fun e!518575 () Bool)

(assert (=> b!924140 (= e!518575 tp_is_empty!19657)))

(declare-fun res!622887 () Bool)

(assert (=> start!79104 (=> (not res!622887) (not e!518571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79104 (= res!622887 (validMask!0 mask!1881))))

(assert (=> start!79104 e!518571))

(assert (=> start!79104 true))

(assert (=> start!79104 tp_is_empty!19657))

(declare-fun e!518577 () Bool)

(declare-fun array_inv!20826 (array!55339) Bool)

(assert (=> start!79104 (and (array_inv!20826 _values!1231) e!518577)))

(assert (=> start!79104 tp!59889))

(declare-fun array_inv!20827 (array!55337) Bool)

(assert (=> start!79104 (array_inv!20827 _keys!1487)))

(declare-fun b!924141 () Bool)

(assert (=> b!924141 (= e!518570 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924142 () Bool)

(declare-fun e!518569 () Bool)

(assert (=> b!924142 (= e!518569 false)))

(declare-fun lt!415065 () V!31175)

(declare-fun lt!415064 () ListLongMap!11553)

(assert (=> b!924142 (= lt!415065 (apply!646 lt!415064 k0!1099))))

(declare-fun b!924143 () Bool)

(declare-fun res!622888 () Bool)

(assert (=> b!924143 (=> (not res!622888) (not e!518571))))

(assert (=> b!924143 (= res!622888 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27069 _keys!1487))))))

(declare-fun b!924144 () Bool)

(declare-fun mapRes!31242 () Bool)

(assert (=> b!924144 (= e!518577 (and e!518568 mapRes!31242))))

(declare-fun condMapEmpty!31242 () Bool)

(declare-fun mapDefault!31242 () ValueCell!9347)

(assert (=> b!924144 (= condMapEmpty!31242 (= (arr!26610 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9347)) mapDefault!31242)))))

(declare-fun b!924145 () Bool)

(declare-fun Unit!31147 () Unit!31144)

(assert (=> b!924145 (= e!518576 Unit!31147)))

(declare-fun mapIsEmpty!31242 () Bool)

(assert (=> mapIsEmpty!31242 mapRes!31242))

(declare-fun b!924146 () Bool)

(declare-fun e!518567 () Bool)

(assert (=> b!924146 (= e!518567 e!518569)))

(declare-fun res!622890 () Bool)

(assert (=> b!924146 (=> (not res!622890) (not e!518569))))

(assert (=> b!924146 (= res!622890 (contains!4865 lt!415064 k0!1099))))

(assert (=> b!924146 (= lt!415064 (getCurrentListMap!3043 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924147 () Bool)

(declare-fun res!622885 () Bool)

(assert (=> b!924147 (=> (not res!622885) (not e!518571))))

(assert (=> b!924147 (= res!622885 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18668))))

(declare-fun mapNonEmpty!31242 () Bool)

(declare-fun tp!59888 () Bool)

(assert (=> mapNonEmpty!31242 (= mapRes!31242 (and tp!59888 e!518575))))

(declare-fun mapRest!31242 () (Array (_ BitVec 32) ValueCell!9347))

(declare-fun mapValue!31242 () ValueCell!9347)

(declare-fun mapKey!31242 () (_ BitVec 32))

(assert (=> mapNonEmpty!31242 (= (arr!26610 _values!1231) (store mapRest!31242 mapKey!31242 mapValue!31242))))

(declare-fun b!924148 () Bool)

(assert (=> b!924148 (= e!518574 e!518567)))

(declare-fun res!622892 () Bool)

(assert (=> b!924148 (=> (not res!622892) (not e!518567))))

(assert (=> b!924148 (= res!622892 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27069 _keys!1487)))))

(declare-fun lt!415072 () Unit!31144)

(assert (=> b!924148 (= lt!415072 e!518576)))

(declare-fun c!96511 () Bool)

(assert (=> b!924148 (= c!96511 (validKeyInArray!0 k0!1099))))

(declare-fun b!924149 () Bool)

(declare-fun arrayContainsKey!0 (array!55337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924149 (= e!518570 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79104 res!622887) b!924135))

(assert (= (and b!924135 res!622889) b!924133))

(assert (= (and b!924133 res!622893) b!924147))

(assert (= (and b!924147 res!622885) b!924143))

(assert (= (and b!924143 res!622888) b!924136))

(assert (= (and b!924136 res!622886) b!924138))

(assert (= (and b!924138 res!622891) b!924148))

(assert (= (and b!924148 c!96511) b!924137))

(assert (= (and b!924148 (not c!96511)) b!924145))

(assert (= (and b!924137 c!96513) b!924134))

(assert (= (and b!924137 (not c!96513)) b!924132))

(assert (= (and b!924134 c!96512) b!924149))

(assert (= (and b!924134 (not c!96512)) b!924141))

(assert (= (and b!924148 res!622892) b!924146))

(assert (= (and b!924146 res!622890) b!924142))

(assert (= (and b!924144 condMapEmpty!31242) mapIsEmpty!31242))

(assert (= (and b!924144 (not condMapEmpty!31242)) mapNonEmpty!31242))

(get-info :version)

(assert (= (and mapNonEmpty!31242 ((_ is ValueCellFull!9347) mapValue!31242)) b!924140))

(assert (= (and b!924144 ((_ is ValueCellFull!9347) mapDefault!31242)) b!924139))

(assert (= start!79104 b!924144))

(declare-fun b_lambda!13665 () Bool)

(assert (=> (not b_lambda!13665) (not b!924134)))

(declare-fun t!26540 () Bool)

(declare-fun tb!5721 () Bool)

(assert (=> (and start!79104 (= defaultEntry!1235 defaultEntry!1235) t!26540) tb!5721))

(declare-fun result!11273 () Bool)

(assert (=> tb!5721 (= result!11273 tp_is_empty!19657)))

(assert (=> b!924134 t!26540))

(declare-fun b_and!28047 () Bool)

(assert (= b_and!28045 (and (=> t!26540 result!11273) b_and!28047)))

(declare-fun m!858703 () Bool)

(assert (=> mapNonEmpty!31242 m!858703))

(declare-fun m!858705 () Bool)

(assert (=> b!924146 m!858705))

(declare-fun m!858707 () Bool)

(assert (=> b!924146 m!858707))

(declare-fun m!858709 () Bool)

(assert (=> start!79104 m!858709))

(declare-fun m!858711 () Bool)

(assert (=> start!79104 m!858711))

(declare-fun m!858713 () Bool)

(assert (=> start!79104 m!858713))

(declare-fun m!858715 () Bool)

(assert (=> b!924134 m!858715))

(declare-fun m!858717 () Bool)

(assert (=> b!924134 m!858717))

(declare-fun m!858719 () Bool)

(assert (=> b!924134 m!858719))

(declare-fun m!858721 () Bool)

(assert (=> b!924134 m!858721))

(declare-fun m!858723 () Bool)

(assert (=> b!924134 m!858723))

(assert (=> b!924134 m!858717))

(assert (=> b!924134 m!858719))

(declare-fun m!858725 () Bool)

(assert (=> b!924134 m!858725))

(assert (=> b!924134 m!858707))

(declare-fun m!858727 () Bool)

(assert (=> b!924134 m!858727))

(declare-fun m!858729 () Bool)

(assert (=> b!924134 m!858729))

(declare-fun m!858731 () Bool)

(assert (=> b!924134 m!858731))

(declare-fun m!858733 () Bool)

(assert (=> b!924134 m!858733))

(declare-fun m!858735 () Bool)

(assert (=> b!924134 m!858735))

(assert (=> b!924134 m!858721))

(declare-fun m!858737 () Bool)

(assert (=> b!924134 m!858737))

(declare-fun m!858739 () Bool)

(assert (=> b!924134 m!858739))

(declare-fun m!858741 () Bool)

(assert (=> b!924134 m!858741))

(declare-fun m!858743 () Bool)

(assert (=> b!924134 m!858743))

(declare-fun m!858745 () Bool)

(assert (=> b!924137 m!858745))

(declare-fun m!858747 () Bool)

(assert (=> b!924137 m!858747))

(declare-fun m!858749 () Bool)

(assert (=> b!924149 m!858749))

(declare-fun m!858751 () Bool)

(assert (=> b!924147 m!858751))

(declare-fun m!858753 () Bool)

(assert (=> b!924148 m!858753))

(declare-fun m!858755 () Bool)

(assert (=> b!924138 m!858755))

(declare-fun m!858757 () Bool)

(assert (=> b!924142 m!858757))

(declare-fun m!858759 () Bool)

(assert (=> b!924136 m!858759))

(declare-fun m!858761 () Bool)

(assert (=> b!924136 m!858761))

(declare-fun m!858763 () Bool)

(assert (=> b!924133 m!858763))

(check-sat (not start!79104) (not b!924142) b_and!28047 (not b!924138) (not b!924133) (not b!924146) (not b!924134) (not b!924148) (not b!924136) (not b!924147) tp_is_empty!19657 (not b!924137) (not mapNonEmpty!31242) (not b_next!17149) (not b!924149) (not b_lambda!13665))
(check-sat b_and!28047 (not b_next!17149))
