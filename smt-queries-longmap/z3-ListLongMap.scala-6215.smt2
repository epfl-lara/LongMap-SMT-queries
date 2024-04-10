; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79426 () Bool)

(assert start!79426)

(declare-fun b_free!17613 () Bool)

(declare-fun b_next!17613 () Bool)

(assert (=> start!79426 (= b_free!17613 (not b_next!17613))))

(declare-fun tp!61283 () Bool)

(declare-fun b_and!28785 () Bool)

(assert (=> start!79426 (= tp!61283 b_and!28785)))

(declare-fun mapNonEmpty!31941 () Bool)

(declare-fun mapRes!31941 () Bool)

(declare-fun tp!61282 () Bool)

(declare-fun e!524203 () Bool)

(assert (=> mapNonEmpty!31941 (= mapRes!31941 (and tp!61282 e!524203))))

(declare-datatypes ((V!31793 0))(
  ( (V!31794 (val!10111 Int)) )
))
(declare-datatypes ((ValueCell!9579 0))(
  ( (ValueCellFull!9579 (v!12630 V!31793)) (EmptyCell!9579) )
))
(declare-fun mapRest!31941 () (Array (_ BitVec 32) ValueCell!9579))

(declare-fun mapKey!31941 () (_ BitVec 32))

(declare-fun mapValue!31941 () ValueCell!9579)

(declare-datatypes ((array!56178 0))(
  ( (array!56179 (arr!27033 (Array (_ BitVec 32) ValueCell!9579)) (size!27492 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56178)

(assert (=> mapNonEmpty!31941 (= (arr!27033 _values!1231) (store mapRest!31941 mapKey!31941 mapValue!31941))))

(declare-fun mapIsEmpty!31941 () Bool)

(assert (=> mapIsEmpty!31941 mapRes!31941))

(declare-fun b!933552 () Bool)

(declare-fun res!628804 () Bool)

(declare-fun e!524201 () Bool)

(assert (=> b!933552 (=> (not res!628804) (not e!524201))))

(declare-datatypes ((array!56180 0))(
  ( (array!56181 (arr!27034 (Array (_ BitVec 32) (_ BitVec 64))) (size!27493 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56180)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56180 (_ BitVec 32)) Bool)

(assert (=> b!933552 (= res!628804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933553 () Bool)

(declare-fun res!628796 () Bool)

(declare-fun e!524199 () Bool)

(assert (=> b!933553 (=> (not res!628796) (not e!524199))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31793)

(declare-datatypes ((tuple2!13254 0))(
  ( (tuple2!13255 (_1!6638 (_ BitVec 64)) (_2!6638 V!31793)) )
))
(declare-datatypes ((List!19037 0))(
  ( (Nil!19034) (Cons!19033 (h!20179 tuple2!13254) (t!27194 List!19037)) )
))
(declare-datatypes ((ListLongMap!11951 0))(
  ( (ListLongMap!11952 (toList!5991 List!19037)) )
))
(declare-fun lt!420462 () ListLongMap!11951)

(declare-fun apply!802 (ListLongMap!11951 (_ BitVec 64)) V!31793)

(assert (=> b!933553 (= res!628796 (= (apply!802 lt!420462 k0!1099) v!791))))

(declare-fun b!933554 () Bool)

(declare-fun res!628802 () Bool)

(assert (=> b!933554 (=> (not res!628802) (not e!524201))))

(declare-datatypes ((List!19038 0))(
  ( (Nil!19035) (Cons!19034 (h!20180 (_ BitVec 64)) (t!27195 List!19038)) )
))
(declare-fun arrayNoDuplicates!0 (array!56180 (_ BitVec 32) List!19038) Bool)

(assert (=> b!933554 (= res!628802 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19035))))

(declare-fun b!933555 () Bool)

(declare-fun e!524204 () Bool)

(assert (=> b!933555 (= e!524199 e!524204)))

(declare-fun res!628798 () Bool)

(assert (=> b!933555 (=> (not res!628798) (not e!524204))))

(declare-fun lt!420460 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933555 (= res!628798 (validKeyInArray!0 lt!420460))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933555 (= lt!420460 (select (arr!27034 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933556 () Bool)

(declare-fun res!628803 () Bool)

(assert (=> b!933556 (=> (not res!628803) (not e!524201))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!933556 (= res!628803 (and (= (size!27492 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27493 _keys!1487) (size!27492 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933557 () Bool)

(assert (=> b!933557 (= e!524204 (not true))))

(assert (=> b!933557 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19035)))

(declare-datatypes ((Unit!31499 0))(
  ( (Unit!31500) )
))
(declare-fun lt!420463 () Unit!31499)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56180 (_ BitVec 32) (_ BitVec 32)) Unit!31499)

(assert (=> b!933557 (= lt!420463 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420458 () tuple2!13254)

(declare-fun contains!5040 (ListLongMap!11951 (_ BitVec 64)) Bool)

(declare-fun +!2792 (ListLongMap!11951 tuple2!13254) ListLongMap!11951)

(assert (=> b!933557 (contains!5040 (+!2792 lt!420462 lt!420458) k0!1099)))

(declare-fun lt!420459 () Unit!31499)

(declare-fun lt!420461 () V!31793)

(declare-fun addStillContains!511 (ListLongMap!11951 (_ BitVec 64) V!31793 (_ BitVec 64)) Unit!31499)

(assert (=> b!933557 (= lt!420459 (addStillContains!511 lt!420462 lt!420460 lt!420461 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31793)

(declare-fun minValue!1173 () V!31793)

(declare-fun getCurrentListMap!3229 (array!56180 array!56178 (_ BitVec 32) (_ BitVec 32) V!31793 V!31793 (_ BitVec 32) Int) ListLongMap!11951)

(assert (=> b!933557 (= (getCurrentListMap!3229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2792 (getCurrentListMap!3229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420458))))

(assert (=> b!933557 (= lt!420458 (tuple2!13255 lt!420460 lt!420461))))

(declare-fun get!14222 (ValueCell!9579 V!31793) V!31793)

(declare-fun dynLambda!1581 (Int (_ BitVec 64)) V!31793)

(assert (=> b!933557 (= lt!420461 (get!14222 (select (arr!27033 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420464 () Unit!31499)

(declare-fun lemmaListMapRecursiveValidKeyArray!182 (array!56180 array!56178 (_ BitVec 32) (_ BitVec 32) V!31793 V!31793 (_ BitVec 32) Int) Unit!31499)

(assert (=> b!933557 (= lt!420464 (lemmaListMapRecursiveValidKeyArray!182 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933558 () Bool)

(assert (=> b!933558 (= e!524201 e!524199)))

(declare-fun res!628797 () Bool)

(assert (=> b!933558 (=> (not res!628797) (not e!524199))))

(assert (=> b!933558 (= res!628797 (contains!5040 lt!420462 k0!1099))))

(assert (=> b!933558 (= lt!420462 (getCurrentListMap!3229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!628799 () Bool)

(assert (=> start!79426 (=> (not res!628799) (not e!524201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79426 (= res!628799 (validMask!0 mask!1881))))

(assert (=> start!79426 e!524201))

(assert (=> start!79426 true))

(declare-fun tp_is_empty!20121 () Bool)

(assert (=> start!79426 tp_is_empty!20121))

(declare-fun e!524200 () Bool)

(declare-fun array_inv!21044 (array!56178) Bool)

(assert (=> start!79426 (and (array_inv!21044 _values!1231) e!524200)))

(assert (=> start!79426 tp!61283))

(declare-fun array_inv!21045 (array!56180) Bool)

(assert (=> start!79426 (array_inv!21045 _keys!1487)))

(declare-fun b!933559 () Bool)

(declare-fun e!524202 () Bool)

(assert (=> b!933559 (= e!524202 tp_is_empty!20121)))

(declare-fun b!933560 () Bool)

(assert (=> b!933560 (= e!524200 (and e!524202 mapRes!31941))))

(declare-fun condMapEmpty!31941 () Bool)

(declare-fun mapDefault!31941 () ValueCell!9579)

(assert (=> b!933560 (= condMapEmpty!31941 (= (arr!27033 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9579)) mapDefault!31941)))))

(declare-fun b!933561 () Bool)

(declare-fun res!628801 () Bool)

(assert (=> b!933561 (=> (not res!628801) (not e!524199))))

(assert (=> b!933561 (= res!628801 (validKeyInArray!0 k0!1099))))

(declare-fun b!933562 () Bool)

(assert (=> b!933562 (= e!524203 tp_is_empty!20121)))

(declare-fun b!933563 () Bool)

(declare-fun res!628795 () Bool)

(assert (=> b!933563 (=> (not res!628795) (not e!524199))))

(assert (=> b!933563 (= res!628795 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933564 () Bool)

(declare-fun res!628800 () Bool)

(assert (=> b!933564 (=> (not res!628800) (not e!524201))))

(assert (=> b!933564 (= res!628800 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27493 _keys!1487))))))

(assert (= (and start!79426 res!628799) b!933556))

(assert (= (and b!933556 res!628803) b!933552))

(assert (= (and b!933552 res!628804) b!933554))

(assert (= (and b!933554 res!628802) b!933564))

(assert (= (and b!933564 res!628800) b!933558))

(assert (= (and b!933558 res!628797) b!933553))

(assert (= (and b!933553 res!628796) b!933563))

(assert (= (and b!933563 res!628795) b!933561))

(assert (= (and b!933561 res!628801) b!933555))

(assert (= (and b!933555 res!628798) b!933557))

(assert (= (and b!933560 condMapEmpty!31941) mapIsEmpty!31941))

(assert (= (and b!933560 (not condMapEmpty!31941)) mapNonEmpty!31941))

(get-info :version)

(assert (= (and mapNonEmpty!31941 ((_ is ValueCellFull!9579) mapValue!31941)) b!933562))

(assert (= (and b!933560 ((_ is ValueCellFull!9579) mapDefault!31941)) b!933559))

(assert (= start!79426 b!933560))

(declare-fun b_lambda!13947 () Bool)

(assert (=> (not b_lambda!13947) (not b!933557)))

(declare-fun t!27193 () Bool)

(declare-fun tb!6007 () Bool)

(assert (=> (and start!79426 (= defaultEntry!1235 defaultEntry!1235) t!27193) tb!6007))

(declare-fun result!11839 () Bool)

(assert (=> tb!6007 (= result!11839 tp_is_empty!20121)))

(assert (=> b!933557 t!27193))

(declare-fun b_and!28787 () Bool)

(assert (= b_and!28785 (and (=> t!27193 result!11839) b_and!28787)))

(declare-fun m!867703 () Bool)

(assert (=> b!933555 m!867703))

(declare-fun m!867705 () Bool)

(assert (=> b!933555 m!867705))

(declare-fun m!867707 () Bool)

(assert (=> b!933558 m!867707))

(declare-fun m!867709 () Bool)

(assert (=> b!933558 m!867709))

(declare-fun m!867711 () Bool)

(assert (=> b!933554 m!867711))

(declare-fun m!867713 () Bool)

(assert (=> start!79426 m!867713))

(declare-fun m!867715 () Bool)

(assert (=> start!79426 m!867715))

(declare-fun m!867717 () Bool)

(assert (=> start!79426 m!867717))

(declare-fun m!867719 () Bool)

(assert (=> b!933561 m!867719))

(declare-fun m!867721 () Bool)

(assert (=> b!933553 m!867721))

(declare-fun m!867723 () Bool)

(assert (=> b!933557 m!867723))

(declare-fun m!867725 () Bool)

(assert (=> b!933557 m!867725))

(declare-fun m!867727 () Bool)

(assert (=> b!933557 m!867727))

(assert (=> b!933557 m!867727))

(declare-fun m!867729 () Bool)

(assert (=> b!933557 m!867729))

(declare-fun m!867731 () Bool)

(assert (=> b!933557 m!867731))

(declare-fun m!867733 () Bool)

(assert (=> b!933557 m!867733))

(declare-fun m!867735 () Bool)

(assert (=> b!933557 m!867735))

(declare-fun m!867737 () Bool)

(assert (=> b!933557 m!867737))

(assert (=> b!933557 m!867723))

(declare-fun m!867739 () Bool)

(assert (=> b!933557 m!867739))

(assert (=> b!933557 m!867729))

(declare-fun m!867741 () Bool)

(assert (=> b!933557 m!867741))

(declare-fun m!867743 () Bool)

(assert (=> b!933557 m!867743))

(assert (=> b!933557 m!867741))

(declare-fun m!867745 () Bool)

(assert (=> b!933557 m!867745))

(declare-fun m!867747 () Bool)

(assert (=> b!933552 m!867747))

(declare-fun m!867749 () Bool)

(assert (=> mapNonEmpty!31941 m!867749))

(check-sat (not b!933555) (not b!933557) (not b!933561) (not b_next!17613) b_and!28787 (not b!933554) (not start!79426) (not b!933558) (not b_lambda!13947) (not b!933552) (not mapNonEmpty!31941) (not b!933553) tp_is_empty!20121)
(check-sat b_and!28787 (not b_next!17613))
