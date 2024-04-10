; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79022 () Bool)

(assert start!79022)

(declare-fun b_free!17235 () Bool)

(declare-fun b_next!17235 () Bool)

(assert (=> start!79022 (= b_free!17235 (not b_next!17235))))

(declare-fun tp!60146 () Bool)

(declare-fun b_and!28207 () Bool)

(assert (=> start!79022 (= tp!60146 b_and!28207)))

(declare-fun b!925701 () Bool)

(declare-datatypes ((Unit!31283 0))(
  ( (Unit!31284) )
))
(declare-fun e!519575 () Unit!31283)

(declare-fun Unit!31285 () Unit!31283)

(assert (=> b!925701 (= e!519575 Unit!31285)))

(declare-fun b!925702 () Bool)

(declare-fun e!519571 () Bool)

(declare-fun tp_is_empty!19743 () Bool)

(assert (=> b!925702 (= e!519571 tp_is_empty!19743)))

(declare-fun b!925703 () Bool)

(declare-fun e!519568 () Bool)

(declare-fun e!519565 () Bool)

(assert (=> b!925703 (= e!519568 e!519565)))

(declare-fun res!623766 () Bool)

(assert (=> b!925703 (=> (not res!623766) (not e!519565))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55452 0))(
  ( (array!55453 (arr!26671 (Array (_ BitVec 32) (_ BitVec 64))) (size!27130 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55452)

(assert (=> b!925703 (= res!623766 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27130 _keys!1487)))))

(declare-fun lt!416669 () Unit!31283)

(assert (=> b!925703 (= lt!416669 e!519575)))

(declare-fun c!96618 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925703 (= c!96618 (validKeyInArray!0 k0!1099))))

(declare-fun b!925704 () Bool)

(declare-datatypes ((V!31289 0))(
  ( (V!31290 (val!9922 Int)) )
))
(declare-datatypes ((tuple2!12940 0))(
  ( (tuple2!12941 (_1!6481 (_ BitVec 64)) (_2!6481 V!31289)) )
))
(declare-datatypes ((List!18741 0))(
  ( (Nil!18738) (Cons!18737 (h!19883 tuple2!12940) (t!26706 List!18741)) )
))
(declare-datatypes ((ListLongMap!11637 0))(
  ( (ListLongMap!11638 (toList!5834 List!18741)) )
))
(declare-fun lt!416674 () ListLongMap!11637)

(declare-fun lt!416670 () V!31289)

(declare-fun apply!664 (ListLongMap!11637 (_ BitVec 64)) V!31289)

(assert (=> b!925704 (= (apply!664 lt!416674 k0!1099) lt!416670)))

(declare-fun lt!416667 () ListLongMap!11637)

(declare-fun lt!416677 () Unit!31283)

(declare-fun lt!416676 () (_ BitVec 64))

(declare-fun lt!416665 () V!31289)

(declare-fun addApplyDifferent!384 (ListLongMap!11637 (_ BitVec 64) V!31289 (_ BitVec 64)) Unit!31283)

(assert (=> b!925704 (= lt!416677 (addApplyDifferent!384 lt!416667 lt!416676 lt!416665 k0!1099))))

(assert (=> b!925704 (not (= lt!416676 k0!1099))))

(declare-fun lt!416675 () Unit!31283)

(declare-datatypes ((List!18742 0))(
  ( (Nil!18739) (Cons!18738 (h!19884 (_ BitVec 64)) (t!26707 List!18742)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55452 (_ BitVec 64) (_ BitVec 32) List!18742) Unit!31283)

(assert (=> b!925704 (= lt!416675 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18739))))

(declare-fun e!519567 () Bool)

(assert (=> b!925704 e!519567))

(declare-fun c!96616 () Bool)

(assert (=> b!925704 (= c!96616 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!416672 () Unit!31283)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9390 0))(
  ( (ValueCellFull!9390 (v!12440 V!31289)) (EmptyCell!9390) )
))
(declare-datatypes ((array!55454 0))(
  ( (array!55455 (arr!26672 (Array (_ BitVec 32) ValueCell!9390)) (size!27131 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55454)

(declare-fun zeroValue!1173 () V!31289)

(declare-fun minValue!1173 () V!31289)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!235 (array!55452 array!55454 (_ BitVec 32) (_ BitVec 32) V!31289 V!31289 (_ BitVec 64) (_ BitVec 32) Int) Unit!31283)

(assert (=> b!925704 (= lt!416672 (lemmaListMapContainsThenArrayContainsFrom!235 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55452 (_ BitVec 32) List!18742) Bool)

(assert (=> b!925704 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18739)))

(declare-fun lt!416679 () Unit!31283)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55452 (_ BitVec 32) (_ BitVec 32)) Unit!31283)

(assert (=> b!925704 (= lt!416679 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4893 (ListLongMap!11637 (_ BitVec 64)) Bool)

(assert (=> b!925704 (contains!4893 lt!416674 k0!1099)))

(declare-fun lt!416673 () tuple2!12940)

(declare-fun +!2728 (ListLongMap!11637 tuple2!12940) ListLongMap!11637)

(assert (=> b!925704 (= lt!416674 (+!2728 lt!416667 lt!416673))))

(declare-fun lt!416668 () Unit!31283)

(declare-fun addStillContains!452 (ListLongMap!11637 (_ BitVec 64) V!31289 (_ BitVec 64)) Unit!31283)

(assert (=> b!925704 (= lt!416668 (addStillContains!452 lt!416667 lt!416676 lt!416665 k0!1099))))

(declare-fun getCurrentListMap!3084 (array!55452 array!55454 (_ BitVec 32) (_ BitVec 32) V!31289 V!31289 (_ BitVec 32) Int) ListLongMap!11637)

(assert (=> b!925704 (= (getCurrentListMap!3084 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2728 (getCurrentListMap!3084 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416673))))

(assert (=> b!925704 (= lt!416673 (tuple2!12941 lt!416676 lt!416665))))

(declare-fun get!14029 (ValueCell!9390 V!31289) V!31289)

(declare-fun dynLambda!1517 (Int (_ BitVec 64)) V!31289)

(assert (=> b!925704 (= lt!416665 (get!14029 (select (arr!26672 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1517 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416678 () Unit!31283)

(declare-fun lemmaListMapRecursiveValidKeyArray!118 (array!55452 array!55454 (_ BitVec 32) (_ BitVec 32) V!31289 V!31289 (_ BitVec 32) Int) Unit!31283)

(assert (=> b!925704 (= lt!416678 (lemmaListMapRecursiveValidKeyArray!118 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519572 () Unit!31283)

(assert (=> b!925704 (= e!519572 lt!416677)))

(declare-fun b!925705 () Bool)

(declare-fun res!623776 () Bool)

(declare-fun e!519566 () Bool)

(assert (=> b!925705 (=> (not res!623776) (not e!519566))))

(assert (=> b!925705 (= res!623776 (and (= (size!27131 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27130 _keys!1487) (size!27131 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925706 () Bool)

(declare-fun e!519574 () Bool)

(assert (=> b!925706 (= e!519566 e!519574)))

(declare-fun res!623773 () Bool)

(assert (=> b!925706 (=> (not res!623773) (not e!519574))))

(assert (=> b!925706 (= res!623773 (contains!4893 lt!416667 k0!1099))))

(assert (=> b!925706 (= lt!416667 (getCurrentListMap!3084 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925707 () Bool)

(declare-fun e!519573 () Bool)

(assert (=> b!925707 (= e!519565 e!519573)))

(declare-fun res!623767 () Bool)

(assert (=> b!925707 (=> (not res!623767) (not e!519573))))

(declare-fun lt!416671 () ListLongMap!11637)

(assert (=> b!925707 (= res!623767 (contains!4893 lt!416671 k0!1099))))

(assert (=> b!925707 (= lt!416671 (getCurrentListMap!3084 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925708 () Bool)

(declare-fun e!519569 () Bool)

(assert (=> b!925708 (= e!519569 tp_is_empty!19743)))

(declare-fun b!925709 () Bool)

(declare-fun res!623768 () Bool)

(assert (=> b!925709 (=> (not res!623768) (not e!519566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55452 (_ BitVec 32)) Bool)

(assert (=> b!925709 (= res!623768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925711 () Bool)

(declare-fun arrayContainsKey!0 (array!55452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925711 (= e!519567 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925712 () Bool)

(declare-fun res!623770 () Bool)

(assert (=> b!925712 (=> (not res!623770) (not e!519573))))

(declare-fun v!791 () V!31289)

(assert (=> b!925712 (= res!623770 (= (apply!664 lt!416671 k0!1099) v!791))))

(declare-fun b!925713 () Bool)

(declare-fun res!623775 () Bool)

(assert (=> b!925713 (=> (not res!623775) (not e!519566))))

(assert (=> b!925713 (= res!623775 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18739))))

(declare-fun b!925714 () Bool)

(declare-fun e!519576 () Bool)

(declare-fun mapRes!31371 () Bool)

(assert (=> b!925714 (= e!519576 (and e!519569 mapRes!31371))))

(declare-fun condMapEmpty!31371 () Bool)

(declare-fun mapDefault!31371 () ValueCell!9390)

(assert (=> b!925714 (= condMapEmpty!31371 (= (arr!26672 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9390)) mapDefault!31371)))))

(declare-fun b!925715 () Bool)

(declare-fun Unit!31286 () Unit!31283)

(assert (=> b!925715 (= e!519572 Unit!31286)))

(declare-fun b!925716 () Bool)

(assert (=> b!925716 (= e!519573 (not true))))

(declare-fun e!519570 () Bool)

(assert (=> b!925716 e!519570))

(declare-fun res!623769 () Bool)

(assert (=> b!925716 (=> (not res!623769) (not e!519570))))

(declare-fun lt!416666 () ListLongMap!11637)

(assert (=> b!925716 (= res!623769 (contains!4893 lt!416666 k0!1099))))

(assert (=> b!925716 (= lt!416666 (getCurrentListMap!3084 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416680 () Unit!31283)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!73 (array!55452 array!55454 (_ BitVec 32) (_ BitVec 32) V!31289 V!31289 (_ BitVec 64) V!31289 (_ BitVec 32) Int) Unit!31283)

(assert (=> b!925716 (= lt!416680 (lemmaListMapApplyFromThenApplyFromZero!73 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925717 () Bool)

(assert (=> b!925717 (= e!519570 (= (apply!664 lt!416666 k0!1099) v!791))))

(declare-fun mapIsEmpty!31371 () Bool)

(assert (=> mapIsEmpty!31371 mapRes!31371))

(declare-fun b!925718 () Bool)

(assert (=> b!925718 (= e!519575 e!519572)))

(assert (=> b!925718 (= lt!416676 (select (arr!26671 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96617 () Bool)

(assert (=> b!925718 (= c!96617 (validKeyInArray!0 lt!416676))))

(declare-fun b!925719 () Bool)

(declare-fun res!623772 () Bool)

(assert (=> b!925719 (=> (not res!623772) (not e!519566))))

(assert (=> b!925719 (= res!623772 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27130 _keys!1487))))))

(declare-fun b!925720 () Bool)

(assert (=> b!925720 (= e!519567 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!31371 () Bool)

(declare-fun tp!60145 () Bool)

(assert (=> mapNonEmpty!31371 (= mapRes!31371 (and tp!60145 e!519571))))

(declare-fun mapRest!31371 () (Array (_ BitVec 32) ValueCell!9390))

(declare-fun mapValue!31371 () ValueCell!9390)

(declare-fun mapKey!31371 () (_ BitVec 32))

(assert (=> mapNonEmpty!31371 (= (arr!26672 _values!1231) (store mapRest!31371 mapKey!31371 mapValue!31371))))

(declare-fun res!623771 () Bool)

(assert (=> start!79022 (=> (not res!623771) (not e!519566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79022 (= res!623771 (validMask!0 mask!1881))))

(assert (=> start!79022 e!519566))

(assert (=> start!79022 true))

(assert (=> start!79022 tp_is_empty!19743))

(declare-fun array_inv!20772 (array!55454) Bool)

(assert (=> start!79022 (and (array_inv!20772 _values!1231) e!519576)))

(assert (=> start!79022 tp!60146))

(declare-fun array_inv!20773 (array!55452) Bool)

(assert (=> start!79022 (array_inv!20773 _keys!1487)))

(declare-fun b!925710 () Bool)

(assert (=> b!925710 (= e!519574 e!519568)))

(declare-fun res!623774 () Bool)

(assert (=> b!925710 (=> (not res!623774) (not e!519568))))

(assert (=> b!925710 (= res!623774 (and (= lt!416670 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925710 (= lt!416670 (apply!664 lt!416667 k0!1099))))

(assert (= (and start!79022 res!623771) b!925705))

(assert (= (and b!925705 res!623776) b!925709))

(assert (= (and b!925709 res!623768) b!925713))

(assert (= (and b!925713 res!623775) b!925719))

(assert (= (and b!925719 res!623772) b!925706))

(assert (= (and b!925706 res!623773) b!925710))

(assert (= (and b!925710 res!623774) b!925703))

(assert (= (and b!925703 c!96618) b!925718))

(assert (= (and b!925703 (not c!96618)) b!925701))

(assert (= (and b!925718 c!96617) b!925704))

(assert (= (and b!925718 (not c!96617)) b!925715))

(assert (= (and b!925704 c!96616) b!925711))

(assert (= (and b!925704 (not c!96616)) b!925720))

(assert (= (and b!925703 res!623766) b!925707))

(assert (= (and b!925707 res!623767) b!925712))

(assert (= (and b!925712 res!623770) b!925716))

(assert (= (and b!925716 res!623769) b!925717))

(assert (= (and b!925714 condMapEmpty!31371) mapIsEmpty!31371))

(assert (= (and b!925714 (not condMapEmpty!31371)) mapNonEmpty!31371))

(get-info :version)

(assert (= (and mapNonEmpty!31371 ((_ is ValueCellFull!9390) mapValue!31371)) b!925702))

(assert (= (and b!925714 ((_ is ValueCellFull!9390) mapDefault!31371)) b!925708))

(assert (= start!79022 b!925714))

(declare-fun b_lambda!13737 () Bool)

(assert (=> (not b_lambda!13737) (not b!925704)))

(declare-fun t!26705 () Bool)

(declare-fun tb!5815 () Bool)

(assert (=> (and start!79022 (= defaultEntry!1235 defaultEntry!1235) t!26705) tb!5815))

(declare-fun result!11453 () Bool)

(assert (=> tb!5815 (= result!11453 tp_is_empty!19743)))

(assert (=> b!925704 t!26705))

(declare-fun b_and!28209 () Bool)

(assert (= b_and!28207 (and (=> t!26705 result!11453) b_and!28209)))

(declare-fun m!860155 () Bool)

(assert (=> b!925710 m!860155))

(declare-fun m!860157 () Bool)

(assert (=> b!925717 m!860157))

(declare-fun m!860159 () Bool)

(assert (=> b!925707 m!860159))

(declare-fun m!860161 () Bool)

(assert (=> b!925707 m!860161))

(declare-fun m!860163 () Bool)

(assert (=> start!79022 m!860163))

(declare-fun m!860165 () Bool)

(assert (=> start!79022 m!860165))

(declare-fun m!860167 () Bool)

(assert (=> start!79022 m!860167))

(declare-fun m!860169 () Bool)

(assert (=> b!925718 m!860169))

(declare-fun m!860171 () Bool)

(assert (=> b!925718 m!860171))

(declare-fun m!860173 () Bool)

(assert (=> b!925709 m!860173))

(declare-fun m!860175 () Bool)

(assert (=> b!925703 m!860175))

(declare-fun m!860177 () Bool)

(assert (=> b!925713 m!860177))

(declare-fun m!860179 () Bool)

(assert (=> b!925711 m!860179))

(declare-fun m!860181 () Bool)

(assert (=> b!925716 m!860181))

(declare-fun m!860183 () Bool)

(assert (=> b!925716 m!860183))

(declare-fun m!860185 () Bool)

(assert (=> b!925716 m!860185))

(declare-fun m!860187 () Bool)

(assert (=> mapNonEmpty!31371 m!860187))

(declare-fun m!860189 () Bool)

(assert (=> b!925704 m!860189))

(declare-fun m!860191 () Bool)

(assert (=> b!925704 m!860191))

(declare-fun m!860193 () Bool)

(assert (=> b!925704 m!860193))

(declare-fun m!860195 () Bool)

(assert (=> b!925704 m!860195))

(declare-fun m!860197 () Bool)

(assert (=> b!925704 m!860197))

(declare-fun m!860199 () Bool)

(assert (=> b!925704 m!860199))

(assert (=> b!925704 m!860197))

(declare-fun m!860201 () Bool)

(assert (=> b!925704 m!860201))

(assert (=> b!925704 m!860161))

(declare-fun m!860203 () Bool)

(assert (=> b!925704 m!860203))

(declare-fun m!860205 () Bool)

(assert (=> b!925704 m!860205))

(declare-fun m!860207 () Bool)

(assert (=> b!925704 m!860207))

(assert (=> b!925704 m!860199))

(declare-fun m!860209 () Bool)

(assert (=> b!925704 m!860209))

(declare-fun m!860211 () Bool)

(assert (=> b!925704 m!860211))

(assert (=> b!925704 m!860191))

(declare-fun m!860213 () Bool)

(assert (=> b!925704 m!860213))

(declare-fun m!860215 () Bool)

(assert (=> b!925704 m!860215))

(declare-fun m!860217 () Bool)

(assert (=> b!925704 m!860217))

(declare-fun m!860219 () Bool)

(assert (=> b!925706 m!860219))

(declare-fun m!860221 () Bool)

(assert (=> b!925706 m!860221))

(declare-fun m!860223 () Bool)

(assert (=> b!925712 m!860223))

(check-sat (not b!925709) (not b!925711) (not b!925710) (not b!925713) (not b!925718) (not b!925707) (not start!79022) (not b!925716) b_and!28209 (not b!925704) tp_is_empty!19743 (not b_next!17235) (not b!925703) (not b!925712) (not b!925706) (not b_lambda!13737) (not mapNonEmpty!31371) (not b!925717))
(check-sat b_and!28209 (not b_next!17235))
