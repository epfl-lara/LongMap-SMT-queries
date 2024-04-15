; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79610 () Bool)

(assert start!79610)

(declare-fun b_free!17677 () Bool)

(declare-fun b_next!17677 () Bool)

(assert (=> start!79610 (= b_free!17677 (not b_next!17677))))

(declare-fun tp!61487 () Bool)

(declare-fun b_and!28919 () Bool)

(assert (=> start!79610 (= tp!61487 b_and!28919)))

(declare-fun b!935674 () Bool)

(declare-fun res!630119 () Bool)

(declare-fun e!525385 () Bool)

(assert (=> b!935674 (=> (not res!630119) (not e!525385))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31879 0))(
  ( (V!31880 (val!10143 Int)) )
))
(declare-fun v!791 () V!31879)

(declare-datatypes ((tuple2!13370 0))(
  ( (tuple2!13371 (_1!6696 (_ BitVec 64)) (_2!6696 V!31879)) )
))
(declare-datatypes ((List!19118 0))(
  ( (Nil!19115) (Cons!19114 (h!20260 tuple2!13370) (t!27330 List!19118)) )
))
(declare-datatypes ((ListLongMap!12057 0))(
  ( (ListLongMap!12058 (toList!6044 List!19118)) )
))
(declare-fun lt!421664 () ListLongMap!12057)

(declare-fun apply!823 (ListLongMap!12057 (_ BitVec 64)) V!31879)

(assert (=> b!935674 (= res!630119 (= (apply!823 lt!421664 k0!1099) v!791))))

(declare-fun b!935675 () Bool)

(declare-fun res!630117 () Bool)

(declare-fun e!525379 () Bool)

(assert (=> b!935675 (=> (not res!630117) (not e!525379))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56279 0))(
  ( (array!56280 (arr!27080 (Array (_ BitVec 32) (_ BitVec 64))) (size!27541 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56279)

(assert (=> b!935675 (= res!630117 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27541 _keys!1487))))))

(declare-fun b!935677 () Bool)

(declare-fun e!525383 () Bool)

(declare-fun tp_is_empty!20185 () Bool)

(assert (=> b!935677 (= e!525383 tp_is_empty!20185)))

(declare-fun b!935678 () Bool)

(declare-fun e!525381 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!935678 (= e!525381 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935679 () Bool)

(declare-fun e!525386 () Bool)

(assert (=> b!935679 (= e!525386 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27541 _keys!1487))))))

(declare-fun lt!421659 () (_ BitVec 64))

(assert (=> b!935679 (not (= lt!421659 k0!1099))))

(declare-datatypes ((Unit!31472 0))(
  ( (Unit!31473) )
))
(declare-fun lt!421665 () Unit!31472)

(declare-datatypes ((List!19119 0))(
  ( (Nil!19116) (Cons!19115 (h!20261 (_ BitVec 64)) (t!27331 List!19119)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56279 (_ BitVec 64) (_ BitVec 32) List!19119) Unit!31472)

(assert (=> b!935679 (= lt!421665 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19116))))

(assert (=> b!935679 e!525381))

(declare-fun c!97282 () Bool)

(assert (=> b!935679 (= c!97282 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9611 0))(
  ( (ValueCellFull!9611 (v!12667 V!31879)) (EmptyCell!9611) )
))
(declare-datatypes ((array!56281 0))(
  ( (array!56282 (arr!27081 (Array (_ BitVec 32) ValueCell!9611)) (size!27542 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56281)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31879)

(declare-fun lt!421660 () Unit!31472)

(declare-fun minValue!1173 () V!31879)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!288 (array!56279 array!56281 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 64) (_ BitVec 32) Int) Unit!31472)

(assert (=> b!935679 (= lt!421660 (lemmaListMapContainsThenArrayContainsFrom!288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56279 (_ BitVec 32) List!19119) Bool)

(assert (=> b!935679 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19116)))

(declare-fun lt!421663 () Unit!31472)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56279 (_ BitVec 32) (_ BitVec 32)) Unit!31472)

(assert (=> b!935679 (= lt!421663 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421658 () tuple2!13370)

(declare-fun contains!5049 (ListLongMap!12057 (_ BitVec 64)) Bool)

(declare-fun +!2841 (ListLongMap!12057 tuple2!13370) ListLongMap!12057)

(assert (=> b!935679 (contains!5049 (+!2841 lt!421664 lt!421658) k0!1099)))

(declare-fun lt!421662 () V!31879)

(declare-fun lt!421661 () Unit!31472)

(declare-fun addStillContains!530 (ListLongMap!12057 (_ BitVec 64) V!31879 (_ BitVec 64)) Unit!31472)

(assert (=> b!935679 (= lt!421661 (addStillContains!530 lt!421664 lt!421659 lt!421662 k0!1099))))

(declare-fun getCurrentListMap!3211 (array!56279 array!56281 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 32) Int) ListLongMap!12057)

(assert (=> b!935679 (= (getCurrentListMap!3211 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2841 (getCurrentListMap!3211 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421658))))

(assert (=> b!935679 (= lt!421658 (tuple2!13371 lt!421659 lt!421662))))

(declare-fun get!14277 (ValueCell!9611 V!31879) V!31879)

(declare-fun dynLambda!1597 (Int (_ BitVec 64)) V!31879)

(assert (=> b!935679 (= lt!421662 (get!14277 (select (arr!27081 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1597 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421657 () Unit!31472)

(declare-fun lemmaListMapRecursiveValidKeyArray!205 (array!56279 array!56281 (_ BitVec 32) (_ BitVec 32) V!31879 V!31879 (_ BitVec 32) Int) Unit!31472)

(assert (=> b!935679 (= lt!421657 (lemmaListMapRecursiveValidKeyArray!205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935680 () Bool)

(declare-fun e!525382 () Bool)

(declare-fun e!525384 () Bool)

(declare-fun mapRes!32049 () Bool)

(assert (=> b!935680 (= e!525382 (and e!525384 mapRes!32049))))

(declare-fun condMapEmpty!32049 () Bool)

(declare-fun mapDefault!32049 () ValueCell!9611)

(assert (=> b!935680 (= condMapEmpty!32049 (= (arr!27081 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9611)) mapDefault!32049)))))

(declare-fun b!935681 () Bool)

(declare-fun res!630121 () Bool)

(assert (=> b!935681 (=> (not res!630121) (not e!525385))))

(assert (=> b!935681 (= res!630121 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935682 () Bool)

(declare-fun res!630123 () Bool)

(assert (=> b!935682 (=> (not res!630123) (not e!525385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935682 (= res!630123 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!32049 () Bool)

(declare-fun tp!61488 () Bool)

(assert (=> mapNonEmpty!32049 (= mapRes!32049 (and tp!61488 e!525383))))

(declare-fun mapKey!32049 () (_ BitVec 32))

(declare-fun mapValue!32049 () ValueCell!9611)

(declare-fun mapRest!32049 () (Array (_ BitVec 32) ValueCell!9611))

(assert (=> mapNonEmpty!32049 (= (arr!27081 _values!1231) (store mapRest!32049 mapKey!32049 mapValue!32049))))

(declare-fun mapIsEmpty!32049 () Bool)

(assert (=> mapIsEmpty!32049 mapRes!32049))

(declare-fun b!935683 () Bool)

(declare-fun res!630124 () Bool)

(assert (=> b!935683 (=> (not res!630124) (not e!525379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56279 (_ BitVec 32)) Bool)

(assert (=> b!935683 (= res!630124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935684 () Bool)

(declare-fun res!630122 () Bool)

(assert (=> b!935684 (=> (not res!630122) (not e!525379))))

(assert (=> b!935684 (= res!630122 (and (= (size!27542 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27541 _keys!1487) (size!27542 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935685 () Bool)

(assert (=> b!935685 (= e!525379 e!525385)))

(declare-fun res!630118 () Bool)

(assert (=> b!935685 (=> (not res!630118) (not e!525385))))

(assert (=> b!935685 (= res!630118 (contains!5049 lt!421664 k0!1099))))

(assert (=> b!935685 (= lt!421664 (getCurrentListMap!3211 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935686 () Bool)

(declare-fun arrayContainsKey!0 (array!56279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935686 (= e!525381 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935676 () Bool)

(declare-fun res!630120 () Bool)

(assert (=> b!935676 (=> (not res!630120) (not e!525379))))

(assert (=> b!935676 (= res!630120 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19116))))

(declare-fun res!630116 () Bool)

(assert (=> start!79610 (=> (not res!630116) (not e!525379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79610 (= res!630116 (validMask!0 mask!1881))))

(assert (=> start!79610 e!525379))

(assert (=> start!79610 true))

(assert (=> start!79610 tp_is_empty!20185))

(declare-fun array_inv!21134 (array!56281) Bool)

(assert (=> start!79610 (and (array_inv!21134 _values!1231) e!525382)))

(assert (=> start!79610 tp!61487))

(declare-fun array_inv!21135 (array!56279) Bool)

(assert (=> start!79610 (array_inv!21135 _keys!1487)))

(declare-fun b!935687 () Bool)

(assert (=> b!935687 (= e!525384 tp_is_empty!20185)))

(declare-fun b!935688 () Bool)

(assert (=> b!935688 (= e!525385 e!525386)))

(declare-fun res!630125 () Bool)

(assert (=> b!935688 (=> (not res!630125) (not e!525386))))

(assert (=> b!935688 (= res!630125 (validKeyInArray!0 lt!421659))))

(assert (=> b!935688 (= lt!421659 (select (arr!27080 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!79610 res!630116) b!935684))

(assert (= (and b!935684 res!630122) b!935683))

(assert (= (and b!935683 res!630124) b!935676))

(assert (= (and b!935676 res!630120) b!935675))

(assert (= (and b!935675 res!630117) b!935685))

(assert (= (and b!935685 res!630118) b!935674))

(assert (= (and b!935674 res!630119) b!935681))

(assert (= (and b!935681 res!630121) b!935682))

(assert (= (and b!935682 res!630123) b!935688))

(assert (= (and b!935688 res!630125) b!935679))

(assert (= (and b!935679 c!97282) b!935686))

(assert (= (and b!935679 (not c!97282)) b!935678))

(assert (= (and b!935680 condMapEmpty!32049) mapIsEmpty!32049))

(assert (= (and b!935680 (not condMapEmpty!32049)) mapNonEmpty!32049))

(get-info :version)

(assert (= (and mapNonEmpty!32049 ((_ is ValueCellFull!9611) mapValue!32049)) b!935677))

(assert (= (and b!935680 ((_ is ValueCellFull!9611) mapDefault!32049)) b!935687))

(assert (= start!79610 b!935680))

(declare-fun b_lambda!14065 () Bool)

(assert (=> (not b_lambda!14065) (not b!935679)))

(declare-fun t!27329 () Bool)

(declare-fun tb!6063 () Bool)

(assert (=> (and start!79610 (= defaultEntry!1235 defaultEntry!1235) t!27329) tb!6063))

(declare-fun result!11967 () Bool)

(assert (=> tb!6063 (= result!11967 tp_is_empty!20185)))

(assert (=> b!935679 t!27329))

(declare-fun b_and!28921 () Bool)

(assert (= b_and!28919 (and (=> t!27329 result!11967) b_and!28921)))

(declare-fun m!869681 () Bool)

(assert (=> mapNonEmpty!32049 m!869681))

(declare-fun m!869683 () Bool)

(assert (=> start!79610 m!869683))

(declare-fun m!869685 () Bool)

(assert (=> start!79610 m!869685))

(declare-fun m!869687 () Bool)

(assert (=> start!79610 m!869687))

(declare-fun m!869689 () Bool)

(assert (=> b!935682 m!869689))

(declare-fun m!869691 () Bool)

(assert (=> b!935683 m!869691))

(declare-fun m!869693 () Bool)

(assert (=> b!935676 m!869693))

(declare-fun m!869695 () Bool)

(assert (=> b!935679 m!869695))

(declare-fun m!869697 () Bool)

(assert (=> b!935679 m!869697))

(declare-fun m!869699 () Bool)

(assert (=> b!935679 m!869699))

(declare-fun m!869701 () Bool)

(assert (=> b!935679 m!869701))

(assert (=> b!935679 m!869695))

(assert (=> b!935679 m!869699))

(assert (=> b!935679 m!869701))

(declare-fun m!869703 () Bool)

(assert (=> b!935679 m!869703))

(declare-fun m!869705 () Bool)

(assert (=> b!935679 m!869705))

(declare-fun m!869707 () Bool)

(assert (=> b!935679 m!869707))

(declare-fun m!869709 () Bool)

(assert (=> b!935679 m!869709))

(declare-fun m!869711 () Bool)

(assert (=> b!935679 m!869711))

(declare-fun m!869713 () Bool)

(assert (=> b!935679 m!869713))

(declare-fun m!869715 () Bool)

(assert (=> b!935679 m!869715))

(declare-fun m!869717 () Bool)

(assert (=> b!935679 m!869717))

(declare-fun m!869719 () Bool)

(assert (=> b!935679 m!869719))

(assert (=> b!935679 m!869717))

(declare-fun m!869721 () Bool)

(assert (=> b!935679 m!869721))

(declare-fun m!869723 () Bool)

(assert (=> b!935674 m!869723))

(declare-fun m!869725 () Bool)

(assert (=> b!935686 m!869725))

(declare-fun m!869727 () Bool)

(assert (=> b!935688 m!869727))

(declare-fun m!869729 () Bool)

(assert (=> b!935688 m!869729))

(declare-fun m!869731 () Bool)

(assert (=> b!935685 m!869731))

(declare-fun m!869733 () Bool)

(assert (=> b!935685 m!869733))

(check-sat (not b!935688) (not start!79610) b_and!28921 (not b!935676) tp_is_empty!20185 (not b_lambda!14065) (not b!935686) (not b!935685) (not b!935679) (not b!935674) (not b!935682) (not b!935683) (not mapNonEmpty!32049) (not b_next!17677))
(check-sat b_and!28921 (not b_next!17677))
