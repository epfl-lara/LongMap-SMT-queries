; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79370 () Bool)

(assert start!79370)

(declare-fun b_free!17575 () Bool)

(declare-fun b_next!17575 () Bool)

(assert (=> start!79370 (= b_free!17575 (not b_next!17575))))

(declare-fun tp!61169 () Bool)

(declare-fun b_and!28683 () Bool)

(assert (=> start!79370 (= tp!61169 b_and!28683)))

(declare-fun b!932534 () Bool)

(declare-fun e!523655 () Bool)

(declare-fun e!523654 () Bool)

(assert (=> b!932534 (= e!523655 e!523654)))

(declare-fun res!628122 () Bool)

(assert (=> b!932534 (=> (not res!628122) (not e!523654))))

(declare-datatypes ((V!31743 0))(
  ( (V!31744 (val!10092 Int)) )
))
(declare-datatypes ((tuple2!13280 0))(
  ( (tuple2!13281 (_1!6651 (_ BitVec 64)) (_2!6651 V!31743)) )
))
(declare-datatypes ((List!19030 0))(
  ( (Nil!19027) (Cons!19026 (h!20172 tuple2!13280) (t!27140 List!19030)) )
))
(declare-datatypes ((ListLongMap!11967 0))(
  ( (ListLongMap!11968 (toList!5999 List!19030)) )
))
(declare-fun lt!419827 () ListLongMap!11967)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4996 (ListLongMap!11967 (_ BitVec 64)) Bool)

(assert (=> b!932534 (= res!628122 (contains!4996 lt!419827 k0!1099))))

(declare-datatypes ((array!56073 0))(
  ( (array!56074 (arr!26981 (Array (_ BitVec 32) (_ BitVec 64))) (size!27442 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56073)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9560 0))(
  ( (ValueCellFull!9560 (v!12610 V!31743)) (EmptyCell!9560) )
))
(declare-datatypes ((array!56075 0))(
  ( (array!56076 (arr!26982 (Array (_ BitVec 32) ValueCell!9560)) (size!27443 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56075)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31743)

(declare-fun minValue!1173 () V!31743)

(declare-fun getCurrentListMap!3171 (array!56073 array!56075 (_ BitVec 32) (_ BitVec 32) V!31743 V!31743 (_ BitVec 32) Int) ListLongMap!11967)

(assert (=> b!932534 (= lt!419827 (getCurrentListMap!3171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932535 () Bool)

(declare-fun e!523658 () Bool)

(declare-fun tp_is_empty!20083 () Bool)

(assert (=> b!932535 (= e!523658 tp_is_empty!20083)))

(declare-fun b!932536 () Bool)

(declare-fun res!628116 () Bool)

(assert (=> b!932536 (=> (not res!628116) (not e!523654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932536 (= res!628116 (validKeyInArray!0 k0!1099))))

(declare-fun b!932537 () Bool)

(declare-fun res!628124 () Bool)

(assert (=> b!932537 (=> (not res!628124) (not e!523655))))

(assert (=> b!932537 (= res!628124 (and (= (size!27443 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27442 _keys!1487) (size!27443 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932538 () Bool)

(declare-fun res!628119 () Bool)

(assert (=> b!932538 (=> (not res!628119) (not e!523655))))

(assert (=> b!932538 (= res!628119 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27442 _keys!1487))))))

(declare-fun res!628118 () Bool)

(assert (=> start!79370 (=> (not res!628118) (not e!523655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79370 (= res!628118 (validMask!0 mask!1881))))

(assert (=> start!79370 e!523655))

(assert (=> start!79370 true))

(assert (=> start!79370 tp_is_empty!20083))

(declare-fun e!523652 () Bool)

(declare-fun array_inv!21066 (array!56075) Bool)

(assert (=> start!79370 (and (array_inv!21066 _values!1231) e!523652)))

(assert (=> start!79370 tp!61169))

(declare-fun array_inv!21067 (array!56073) Bool)

(assert (=> start!79370 (array_inv!21067 _keys!1487)))

(declare-fun mapNonEmpty!31884 () Bool)

(declare-fun mapRes!31884 () Bool)

(declare-fun tp!61170 () Bool)

(assert (=> mapNonEmpty!31884 (= mapRes!31884 (and tp!61170 e!523658))))

(declare-fun mapKey!31884 () (_ BitVec 32))

(declare-fun mapRest!31884 () (Array (_ BitVec 32) ValueCell!9560))

(declare-fun mapValue!31884 () ValueCell!9560)

(assert (=> mapNonEmpty!31884 (= (arr!26982 _values!1231) (store mapRest!31884 mapKey!31884 mapValue!31884))))

(declare-fun b!932539 () Bool)

(declare-fun e!523657 () Bool)

(assert (=> b!932539 (= e!523652 (and e!523657 mapRes!31884))))

(declare-fun condMapEmpty!31884 () Bool)

(declare-fun mapDefault!31884 () ValueCell!9560)

(assert (=> b!932539 (= condMapEmpty!31884 (= (arr!26982 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9560)) mapDefault!31884)))))

(declare-fun b!932540 () Bool)

(declare-fun res!628120 () Bool)

(assert (=> b!932540 (=> (not res!628120) (not e!523655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56073 (_ BitVec 32)) Bool)

(assert (=> b!932540 (= res!628120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932541 () Bool)

(declare-fun res!628115 () Bool)

(assert (=> b!932541 (=> (not res!628115) (not e!523655))))

(declare-datatypes ((List!19031 0))(
  ( (Nil!19028) (Cons!19027 (h!20173 (_ BitVec 64)) (t!27141 List!19031)) )
))
(declare-fun arrayNoDuplicates!0 (array!56073 (_ BitVec 32) List!19031) Bool)

(assert (=> b!932541 (= res!628115 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19028))))

(declare-fun mapIsEmpty!31884 () Bool)

(assert (=> mapIsEmpty!31884 mapRes!31884))

(declare-fun b!932542 () Bool)

(declare-fun e!523656 () Bool)

(assert (=> b!932542 (= e!523654 e!523656)))

(declare-fun res!628117 () Bool)

(assert (=> b!932542 (=> (not res!628117) (not e!523656))))

(declare-fun lt!419825 () (_ BitVec 64))

(assert (=> b!932542 (= res!628117 (validKeyInArray!0 lt!419825))))

(assert (=> b!932542 (= lt!419825 (select (arr!26981 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932543 () Bool)

(declare-fun res!628123 () Bool)

(assert (=> b!932543 (=> (not res!628123) (not e!523654))))

(assert (=> b!932543 (= res!628123 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932544 () Bool)

(assert (=> b!932544 (= e!523656 (not true))))

(assert (=> b!932544 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19028)))

(declare-datatypes ((Unit!31382 0))(
  ( (Unit!31383) )
))
(declare-fun lt!419826 () Unit!31382)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56073 (_ BitVec 32) (_ BitVec 32)) Unit!31382)

(assert (=> b!932544 (= lt!419826 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419829 () tuple2!13280)

(declare-fun +!2806 (ListLongMap!11967 tuple2!13280) ListLongMap!11967)

(assert (=> b!932544 (contains!4996 (+!2806 lt!419827 lt!419829) k0!1099)))

(declare-fun lt!419823 () V!31743)

(declare-fun lt!419828 () Unit!31382)

(declare-fun addStillContains!495 (ListLongMap!11967 (_ BitVec 64) V!31743 (_ BitVec 64)) Unit!31382)

(assert (=> b!932544 (= lt!419828 (addStillContains!495 lt!419827 lt!419825 lt!419823 k0!1099))))

(assert (=> b!932544 (= (getCurrentListMap!3171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2806 (getCurrentListMap!3171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419829))))

(assert (=> b!932544 (= lt!419829 (tuple2!13281 lt!419825 lt!419823))))

(declare-fun get!14196 (ValueCell!9560 V!31743) V!31743)

(declare-fun dynLambda!1562 (Int (_ BitVec 64)) V!31743)

(assert (=> b!932544 (= lt!419823 (get!14196 (select (arr!26982 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1562 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419824 () Unit!31382)

(declare-fun lemmaListMapRecursiveValidKeyArray!170 (array!56073 array!56075 (_ BitVec 32) (_ BitVec 32) V!31743 V!31743 (_ BitVec 32) Int) Unit!31382)

(assert (=> b!932544 (= lt!419824 (lemmaListMapRecursiveValidKeyArray!170 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932545 () Bool)

(assert (=> b!932545 (= e!523657 tp_is_empty!20083)))

(declare-fun b!932546 () Bool)

(declare-fun res!628121 () Bool)

(assert (=> b!932546 (=> (not res!628121) (not e!523654))))

(declare-fun v!791 () V!31743)

(declare-fun apply!788 (ListLongMap!11967 (_ BitVec 64)) V!31743)

(assert (=> b!932546 (= res!628121 (= (apply!788 lt!419827 k0!1099) v!791))))

(assert (= (and start!79370 res!628118) b!932537))

(assert (= (and b!932537 res!628124) b!932540))

(assert (= (and b!932540 res!628120) b!932541))

(assert (= (and b!932541 res!628115) b!932538))

(assert (= (and b!932538 res!628119) b!932534))

(assert (= (and b!932534 res!628122) b!932546))

(assert (= (and b!932546 res!628121) b!932543))

(assert (= (and b!932543 res!628123) b!932536))

(assert (= (and b!932536 res!628116) b!932542))

(assert (= (and b!932542 res!628117) b!932544))

(assert (= (and b!932539 condMapEmpty!31884) mapIsEmpty!31884))

(assert (= (and b!932539 (not condMapEmpty!31884)) mapNonEmpty!31884))

(get-info :version)

(assert (= (and mapNonEmpty!31884 ((_ is ValueCellFull!9560) mapValue!31884)) b!932535))

(assert (= (and b!932539 ((_ is ValueCellFull!9560) mapDefault!31884)) b!932545))

(assert (= start!79370 b!932539))

(declare-fun b_lambda!13891 () Bool)

(assert (=> (not b_lambda!13891) (not b!932544)))

(declare-fun t!27139 () Bool)

(declare-fun tb!5961 () Bool)

(assert (=> (and start!79370 (= defaultEntry!1235 defaultEntry!1235) t!27139) tb!5961))

(declare-fun result!11755 () Bool)

(assert (=> tb!5961 (= result!11755 tp_is_empty!20083)))

(assert (=> b!932544 t!27139))

(declare-fun b_and!28685 () Bool)

(assert (= b_and!28683 (and (=> t!27139 result!11755) b_and!28685)))

(declare-fun m!866033 () Bool)

(assert (=> b!932536 m!866033))

(declare-fun m!866035 () Bool)

(assert (=> mapNonEmpty!31884 m!866035))

(declare-fun m!866037 () Bool)

(assert (=> b!932542 m!866037))

(declare-fun m!866039 () Bool)

(assert (=> b!932542 m!866039))

(declare-fun m!866041 () Bool)

(assert (=> start!79370 m!866041))

(declare-fun m!866043 () Bool)

(assert (=> start!79370 m!866043))

(declare-fun m!866045 () Bool)

(assert (=> start!79370 m!866045))

(declare-fun m!866047 () Bool)

(assert (=> b!932540 m!866047))

(declare-fun m!866049 () Bool)

(assert (=> b!932544 m!866049))

(declare-fun m!866051 () Bool)

(assert (=> b!932544 m!866051))

(declare-fun m!866053 () Bool)

(assert (=> b!932544 m!866053))

(declare-fun m!866055 () Bool)

(assert (=> b!932544 m!866055))

(assert (=> b!932544 m!866051))

(assert (=> b!932544 m!866055))

(declare-fun m!866057 () Bool)

(assert (=> b!932544 m!866057))

(declare-fun m!866059 () Bool)

(assert (=> b!932544 m!866059))

(declare-fun m!866061 () Bool)

(assert (=> b!932544 m!866061))

(declare-fun m!866063 () Bool)

(assert (=> b!932544 m!866063))

(declare-fun m!866065 () Bool)

(assert (=> b!932544 m!866065))

(assert (=> b!932544 m!866063))

(declare-fun m!866067 () Bool)

(assert (=> b!932544 m!866067))

(declare-fun m!866069 () Bool)

(assert (=> b!932544 m!866069))

(assert (=> b!932544 m!866053))

(declare-fun m!866071 () Bool)

(assert (=> b!932544 m!866071))

(declare-fun m!866073 () Bool)

(assert (=> b!932534 m!866073))

(declare-fun m!866075 () Bool)

(assert (=> b!932534 m!866075))

(declare-fun m!866077 () Bool)

(assert (=> b!932546 m!866077))

(declare-fun m!866079 () Bool)

(assert (=> b!932541 m!866079))

(check-sat (not b!932542) (not b_next!17575) (not b!932536) (not start!79370) (not b!932534) (not b!932541) (not b!932540) (not b!932546) b_and!28685 tp_is_empty!20083 (not b!932544) (not mapNonEmpty!31884) (not b_lambda!13891))
(check-sat b_and!28685 (not b_next!17575))
