; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79550 () Bool)

(assert start!79550)

(declare-fun b_free!17569 () Bool)

(declare-fun b_next!17569 () Bool)

(assert (=> start!79550 (= b_free!17569 (not b_next!17569))))

(declare-fun tp!61151 () Bool)

(declare-fun b_and!28707 () Bool)

(assert (=> start!79550 (= tp!61151 b_and!28707)))

(declare-fun b!933553 () Bool)

(declare-fun e!524320 () Bool)

(assert (=> b!933553 (= e!524320 (not true))))

(declare-datatypes ((array!56147 0))(
  ( (array!56148 (arr!27013 (Array (_ BitVec 32) (_ BitVec 64))) (size!27473 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56147)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18989 0))(
  ( (Nil!18986) (Cons!18985 (h!20137 (_ BitVec 64)) (t!27094 List!18989)) )
))
(declare-fun arrayNoDuplicates!0 (array!56147 (_ BitVec 32) List!18989) Bool)

(assert (=> b!933553 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18986)))

(declare-datatypes ((Unit!31462 0))(
  ( (Unit!31463) )
))
(declare-fun lt!420363 () Unit!31462)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56147 (_ BitVec 32) (_ BitVec 32)) Unit!31462)

(assert (=> b!933553 (= lt!420363 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31735 0))(
  ( (V!31736 (val!10089 Int)) )
))
(declare-datatypes ((tuple2!13206 0))(
  ( (tuple2!13207 (_1!6614 (_ BitVec 64)) (_2!6614 V!31735)) )
))
(declare-datatypes ((List!18990 0))(
  ( (Nil!18987) (Cons!18986 (h!20138 tuple2!13206) (t!27095 List!18990)) )
))
(declare-datatypes ((ListLongMap!11905 0))(
  ( (ListLongMap!11906 (toList!5968 List!18990)) )
))
(declare-fun lt!420361 () ListLongMap!11905)

(declare-fun lt!420359 () tuple2!13206)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5033 (ListLongMap!11905 (_ BitVec 64)) Bool)

(declare-fun +!2796 (ListLongMap!11905 tuple2!13206) ListLongMap!11905)

(assert (=> b!933553 (contains!5033 (+!2796 lt!420361 lt!420359) k0!1099)))

(declare-fun lt!420358 () (_ BitVec 64))

(declare-fun lt!420360 () Unit!31462)

(declare-fun lt!420362 () V!31735)

(declare-fun addStillContains!499 (ListLongMap!11905 (_ BitVec 64) V!31735 (_ BitVec 64)) Unit!31462)

(assert (=> b!933553 (= lt!420360 (addStillContains!499 lt!420361 lt!420358 lt!420362 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9557 0))(
  ( (ValueCellFull!9557 (v!12605 V!31735)) (EmptyCell!9557) )
))
(declare-datatypes ((array!56149 0))(
  ( (array!56150 (arr!27014 (Array (_ BitVec 32) ValueCell!9557)) (size!27474 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56149)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31735)

(declare-fun minValue!1173 () V!31735)

(declare-fun getCurrentListMap!3210 (array!56147 array!56149 (_ BitVec 32) (_ BitVec 32) V!31735 V!31735 (_ BitVec 32) Int) ListLongMap!11905)

(assert (=> b!933553 (= (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2796 (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420359))))

(assert (=> b!933553 (= lt!420359 (tuple2!13207 lt!420358 lt!420362))))

(declare-fun get!14224 (ValueCell!9557 V!31735) V!31735)

(declare-fun dynLambda!1593 (Int (_ BitVec 64)) V!31735)

(assert (=> b!933553 (= lt!420362 (get!14224 (select (arr!27014 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1593 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420357 () Unit!31462)

(declare-fun lemmaListMapRecursiveValidKeyArray!176 (array!56147 array!56149 (_ BitVec 32) (_ BitVec 32) V!31735 V!31735 (_ BitVec 32) Int) Unit!31462)

(assert (=> b!933553 (= lt!420357 (lemmaListMapRecursiveValidKeyArray!176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933555 () Bool)

(declare-fun res!628482 () Bool)

(declare-fun e!524324 () Bool)

(assert (=> b!933555 (=> (not res!628482) (not e!524324))))

(assert (=> b!933555 (= res!628482 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933556 () Bool)

(declare-fun res!628483 () Bool)

(declare-fun e!524322 () Bool)

(assert (=> b!933556 (=> (not res!628483) (not e!524322))))

(assert (=> b!933556 (= res!628483 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27473 _keys!1487))))))

(declare-fun b!933557 () Bool)

(declare-fun res!628481 () Bool)

(assert (=> b!933557 (=> (not res!628481) (not e!524324))))

(declare-fun v!791 () V!31735)

(declare-fun apply!796 (ListLongMap!11905 (_ BitVec 64)) V!31735)

(assert (=> b!933557 (= res!628481 (= (apply!796 lt!420361 k0!1099) v!791))))

(declare-fun b!933558 () Bool)

(assert (=> b!933558 (= e!524324 e!524320)))

(declare-fun res!628488 () Bool)

(assert (=> b!933558 (=> (not res!628488) (not e!524320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933558 (= res!628488 (validKeyInArray!0 lt!420358))))

(assert (=> b!933558 (= lt!420358 (select (arr!27013 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933559 () Bool)

(declare-fun res!628484 () Bool)

(assert (=> b!933559 (=> (not res!628484) (not e!524322))))

(assert (=> b!933559 (= res!628484 (and (= (size!27474 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27473 _keys!1487) (size!27474 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933560 () Bool)

(assert (=> b!933560 (= e!524322 e!524324)))

(declare-fun res!628487 () Bool)

(assert (=> b!933560 (=> (not res!628487) (not e!524324))))

(assert (=> b!933560 (= res!628487 (contains!5033 lt!420361 k0!1099))))

(assert (=> b!933560 (= lt!420361 (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933561 () Bool)

(declare-fun e!524321 () Bool)

(declare-fun tp_is_empty!20077 () Bool)

(assert (=> b!933561 (= e!524321 tp_is_empty!20077)))

(declare-fun b!933562 () Bool)

(declare-fun res!628480 () Bool)

(assert (=> b!933562 (=> (not res!628480) (not e!524322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56147 (_ BitVec 32)) Bool)

(assert (=> b!933562 (= res!628480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31875 () Bool)

(declare-fun mapRes!31875 () Bool)

(assert (=> mapIsEmpty!31875 mapRes!31875))

(declare-fun res!628479 () Bool)

(assert (=> start!79550 (=> (not res!628479) (not e!524322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79550 (= res!628479 (validMask!0 mask!1881))))

(assert (=> start!79550 e!524322))

(assert (=> start!79550 true))

(assert (=> start!79550 tp_is_empty!20077))

(declare-fun e!524325 () Bool)

(declare-fun array_inv!21112 (array!56149) Bool)

(assert (=> start!79550 (and (array_inv!21112 _values!1231) e!524325)))

(assert (=> start!79550 tp!61151))

(declare-fun array_inv!21113 (array!56147) Bool)

(assert (=> start!79550 (array_inv!21113 _keys!1487)))

(declare-fun b!933554 () Bool)

(declare-fun res!628485 () Bool)

(assert (=> b!933554 (=> (not res!628485) (not e!524324))))

(assert (=> b!933554 (= res!628485 (validKeyInArray!0 k0!1099))))

(declare-fun b!933563 () Bool)

(declare-fun res!628486 () Bool)

(assert (=> b!933563 (=> (not res!628486) (not e!524322))))

(assert (=> b!933563 (= res!628486 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18986))))

(declare-fun b!933564 () Bool)

(declare-fun e!524319 () Bool)

(assert (=> b!933564 (= e!524319 tp_is_empty!20077)))

(declare-fun mapNonEmpty!31875 () Bool)

(declare-fun tp!61152 () Bool)

(assert (=> mapNonEmpty!31875 (= mapRes!31875 (and tp!61152 e!524319))))

(declare-fun mapRest!31875 () (Array (_ BitVec 32) ValueCell!9557))

(declare-fun mapKey!31875 () (_ BitVec 32))

(declare-fun mapValue!31875 () ValueCell!9557)

(assert (=> mapNonEmpty!31875 (= (arr!27014 _values!1231) (store mapRest!31875 mapKey!31875 mapValue!31875))))

(declare-fun b!933565 () Bool)

(assert (=> b!933565 (= e!524325 (and e!524321 mapRes!31875))))

(declare-fun condMapEmpty!31875 () Bool)

(declare-fun mapDefault!31875 () ValueCell!9557)

(assert (=> b!933565 (= condMapEmpty!31875 (= (arr!27014 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9557)) mapDefault!31875)))))

(assert (= (and start!79550 res!628479) b!933559))

(assert (= (and b!933559 res!628484) b!933562))

(assert (= (and b!933562 res!628480) b!933563))

(assert (= (and b!933563 res!628486) b!933556))

(assert (= (and b!933556 res!628483) b!933560))

(assert (= (and b!933560 res!628487) b!933557))

(assert (= (and b!933557 res!628481) b!933555))

(assert (= (and b!933555 res!628482) b!933554))

(assert (= (and b!933554 res!628485) b!933558))

(assert (= (and b!933558 res!628488) b!933553))

(assert (= (and b!933565 condMapEmpty!31875) mapIsEmpty!31875))

(assert (= (and b!933565 (not condMapEmpty!31875)) mapNonEmpty!31875))

(get-info :version)

(assert (= (and mapNonEmpty!31875 ((_ is ValueCellFull!9557) mapValue!31875)) b!933564))

(assert (= (and b!933565 ((_ is ValueCellFull!9557) mapDefault!31875)) b!933561))

(assert (= start!79550 b!933565))

(declare-fun b_lambda!13917 () Bool)

(assert (=> (not b_lambda!13917) (not b!933553)))

(declare-fun t!27093 () Bool)

(declare-fun tb!5955 () Bool)

(assert (=> (and start!79550 (= defaultEntry!1235 defaultEntry!1235) t!27093) tb!5955))

(declare-fun result!11743 () Bool)

(assert (=> tb!5955 (= result!11743 tp_is_empty!20077)))

(assert (=> b!933553 t!27093))

(declare-fun b_and!28709 () Bool)

(assert (= b_and!28707 (and (=> t!27093 result!11743) b_and!28709)))

(declare-fun m!867941 () Bool)

(assert (=> start!79550 m!867941))

(declare-fun m!867943 () Bool)

(assert (=> start!79550 m!867943))

(declare-fun m!867945 () Bool)

(assert (=> start!79550 m!867945))

(declare-fun m!867947 () Bool)

(assert (=> b!933558 m!867947))

(declare-fun m!867949 () Bool)

(assert (=> b!933558 m!867949))

(declare-fun m!867951 () Bool)

(assert (=> b!933563 m!867951))

(declare-fun m!867953 () Bool)

(assert (=> b!933553 m!867953))

(declare-fun m!867955 () Bool)

(assert (=> b!933553 m!867955))

(declare-fun m!867957 () Bool)

(assert (=> b!933553 m!867957))

(declare-fun m!867959 () Bool)

(assert (=> b!933553 m!867959))

(declare-fun m!867961 () Bool)

(assert (=> b!933553 m!867961))

(declare-fun m!867963 () Bool)

(assert (=> b!933553 m!867963))

(declare-fun m!867965 () Bool)

(assert (=> b!933553 m!867965))

(declare-fun m!867967 () Bool)

(assert (=> b!933553 m!867967))

(declare-fun m!867969 () Bool)

(assert (=> b!933553 m!867969))

(declare-fun m!867971 () Bool)

(assert (=> b!933553 m!867971))

(assert (=> b!933553 m!867953))

(assert (=> b!933553 m!867963))

(assert (=> b!933553 m!867965))

(declare-fun m!867973 () Bool)

(assert (=> b!933553 m!867973))

(assert (=> b!933553 m!867957))

(declare-fun m!867975 () Bool)

(assert (=> b!933553 m!867975))

(declare-fun m!867977 () Bool)

(assert (=> b!933560 m!867977))

(declare-fun m!867979 () Bool)

(assert (=> b!933560 m!867979))

(declare-fun m!867981 () Bool)

(assert (=> b!933562 m!867981))

(declare-fun m!867983 () Bool)

(assert (=> b!933554 m!867983))

(declare-fun m!867985 () Bool)

(assert (=> mapNonEmpty!31875 m!867985))

(declare-fun m!867987 () Bool)

(assert (=> b!933557 m!867987))

(check-sat (not b!933563) (not b!933558) (not b!933553) (not b!933560) (not mapNonEmpty!31875) b_and!28709 (not start!79550) (not b!933557) (not b_lambda!13917) (not b!933562) (not b_next!17569) tp_is_empty!20077 (not b!933554))
(check-sat b_and!28709 (not b_next!17569))
