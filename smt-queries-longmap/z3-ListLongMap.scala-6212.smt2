; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79388 () Bool)

(assert start!79388)

(declare-fun b_free!17593 () Bool)

(declare-fun b_next!17593 () Bool)

(assert (=> start!79388 (= b_free!17593 (not b_next!17593))))

(declare-fun tp!61224 () Bool)

(declare-fun b_and!28719 () Bool)

(assert (=> start!79388 (= tp!61224 b_and!28719)))

(declare-fun mapNonEmpty!31911 () Bool)

(declare-fun mapRes!31911 () Bool)

(declare-fun tp!61223 () Bool)

(declare-fun e!523845 () Bool)

(assert (=> mapNonEmpty!31911 (= mapRes!31911 (and tp!61223 e!523845))))

(declare-datatypes ((V!31767 0))(
  ( (V!31768 (val!10101 Int)) )
))
(declare-datatypes ((ValueCell!9569 0))(
  ( (ValueCellFull!9569 (v!12619 V!31767)) (EmptyCell!9569) )
))
(declare-fun mapRest!31911 () (Array (_ BitVec 32) ValueCell!9569))

(declare-datatypes ((array!56105 0))(
  ( (array!56106 (arr!26997 (Array (_ BitVec 32) ValueCell!9569)) (size!27458 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56105)

(declare-fun mapKey!31911 () (_ BitVec 32))

(declare-fun mapValue!31911 () ValueCell!9569)

(assert (=> mapNonEmpty!31911 (= (arr!26997 _values!1231) (store mapRest!31911 mapKey!31911 mapValue!31911))))

(declare-fun res!628389 () Bool)

(declare-fun e!523842 () Bool)

(assert (=> start!79388 (=> (not res!628389) (not e!523842))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79388 (= res!628389 (validMask!0 mask!1881))))

(assert (=> start!79388 e!523842))

(assert (=> start!79388 true))

(declare-fun tp_is_empty!20101 () Bool)

(assert (=> start!79388 tp_is_empty!20101))

(declare-fun e!523846 () Bool)

(declare-fun array_inv!21080 (array!56105) Bool)

(assert (=> start!79388 (and (array_inv!21080 _values!1231) e!523846)))

(assert (=> start!79388 tp!61224))

(declare-datatypes ((array!56107 0))(
  ( (array!56108 (arr!26998 (Array (_ BitVec 32) (_ BitVec 64))) (size!27459 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56107)

(declare-fun array_inv!21081 (array!56107) Bool)

(assert (=> start!79388 (array_inv!21081 _keys!1487)))

(declare-fun b!932903 () Bool)

(declare-fun e!523847 () Bool)

(assert (=> b!932903 (= e!523846 (and e!523847 mapRes!31911))))

(declare-fun condMapEmpty!31911 () Bool)

(declare-fun mapDefault!31911 () ValueCell!9569)

(assert (=> b!932903 (= condMapEmpty!31911 (= (arr!26997 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9569)) mapDefault!31911)))))

(declare-fun b!932904 () Bool)

(declare-fun res!628385 () Bool)

(declare-fun e!523841 () Bool)

(assert (=> b!932904 (=> (not res!628385) (not e!523841))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932904 (= res!628385 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932905 () Bool)

(declare-fun res!628386 () Bool)

(assert (=> b!932905 (=> (not res!628386) (not e!523841))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31767)

(declare-datatypes ((tuple2!13294 0))(
  ( (tuple2!13295 (_1!6658 (_ BitVec 64)) (_2!6658 V!31767)) )
))
(declare-datatypes ((List!19044 0))(
  ( (Nil!19041) (Cons!19040 (h!20186 tuple2!13294) (t!27172 List!19044)) )
))
(declare-datatypes ((ListLongMap!11981 0))(
  ( (ListLongMap!11982 (toList!6006 List!19044)) )
))
(declare-fun lt!420015 () ListLongMap!11981)

(declare-fun apply!795 (ListLongMap!11981 (_ BitVec 64)) V!31767)

(assert (=> b!932905 (= res!628386 (= (apply!795 lt!420015 k0!1099) v!791))))

(declare-fun b!932906 () Bool)

(declare-fun e!523843 () Bool)

(assert (=> b!932906 (= e!523841 e!523843)))

(declare-fun res!628390 () Bool)

(assert (=> b!932906 (=> (not res!628390) (not e!523843))))

(declare-fun lt!420018 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932906 (= res!628390 (validKeyInArray!0 lt!420018))))

(assert (=> b!932906 (= lt!420018 (select (arr!26998 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932907 () Bool)

(declare-fun res!628388 () Bool)

(assert (=> b!932907 (=> (not res!628388) (not e!523842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56107 (_ BitVec 32)) Bool)

(assert (=> b!932907 (= res!628388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31911 () Bool)

(assert (=> mapIsEmpty!31911 mapRes!31911))

(declare-fun b!932908 () Bool)

(declare-fun res!628392 () Bool)

(assert (=> b!932908 (=> (not res!628392) (not e!523842))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!932908 (= res!628392 (and (= (size!27458 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27459 _keys!1487) (size!27458 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932909 () Bool)

(declare-fun res!628391 () Bool)

(assert (=> b!932909 (=> (not res!628391) (not e!523841))))

(assert (=> b!932909 (= res!628391 (validKeyInArray!0 k0!1099))))

(declare-fun b!932910 () Bool)

(assert (=> b!932910 (= e!523842 e!523841)))

(declare-fun res!628387 () Bool)

(assert (=> b!932910 (=> (not res!628387) (not e!523841))))

(declare-fun contains!5003 (ListLongMap!11981 (_ BitVec 64)) Bool)

(assert (=> b!932910 (= res!628387 (contains!5003 lt!420015 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31767)

(declare-fun minValue!1173 () V!31767)

(declare-fun getCurrentListMap!3178 (array!56107 array!56105 (_ BitVec 32) (_ BitVec 32) V!31767 V!31767 (_ BitVec 32) Int) ListLongMap!11981)

(assert (=> b!932910 (= lt!420015 (getCurrentListMap!3178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932911 () Bool)

(assert (=> b!932911 (= e!523845 tp_is_empty!20101)))

(declare-fun b!932912 () Bool)

(declare-fun res!628393 () Bool)

(assert (=> b!932912 (=> (not res!628393) (not e!523842))))

(declare-datatypes ((List!19045 0))(
  ( (Nil!19042) (Cons!19041 (h!20187 (_ BitVec 64)) (t!27173 List!19045)) )
))
(declare-fun arrayNoDuplicates!0 (array!56107 (_ BitVec 32) List!19045) Bool)

(assert (=> b!932912 (= res!628393 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19042))))

(declare-fun b!932913 () Bool)

(assert (=> b!932913 (= e!523847 tp_is_empty!20101)))

(declare-fun b!932914 () Bool)

(assert (=> b!932914 (= e!523843 (not true))))

(assert (=> b!932914 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19042)))

(declare-datatypes ((Unit!31396 0))(
  ( (Unit!31397) )
))
(declare-fun lt!420016 () Unit!31396)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56107 (_ BitVec 32) (_ BitVec 32)) Unit!31396)

(assert (=> b!932914 (= lt!420016 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420012 () tuple2!13294)

(declare-fun +!2813 (ListLongMap!11981 tuple2!13294) ListLongMap!11981)

(assert (=> b!932914 (contains!5003 (+!2813 lt!420015 lt!420012) k0!1099)))

(declare-fun lt!420017 () Unit!31396)

(declare-fun lt!420014 () V!31767)

(declare-fun addStillContains!502 (ListLongMap!11981 (_ BitVec 64) V!31767 (_ BitVec 64)) Unit!31396)

(assert (=> b!932914 (= lt!420017 (addStillContains!502 lt!420015 lt!420018 lt!420014 k0!1099))))

(assert (=> b!932914 (= (getCurrentListMap!3178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2813 (getCurrentListMap!3178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420012))))

(assert (=> b!932914 (= lt!420012 (tuple2!13295 lt!420018 lt!420014))))

(declare-fun get!14209 (ValueCell!9569 V!31767) V!31767)

(declare-fun dynLambda!1569 (Int (_ BitVec 64)) V!31767)

(assert (=> b!932914 (= lt!420014 (get!14209 (select (arr!26997 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1569 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420013 () Unit!31396)

(declare-fun lemmaListMapRecursiveValidKeyArray!177 (array!56107 array!56105 (_ BitVec 32) (_ BitVec 32) V!31767 V!31767 (_ BitVec 32) Int) Unit!31396)

(assert (=> b!932914 (= lt!420013 (lemmaListMapRecursiveValidKeyArray!177 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932915 () Bool)

(declare-fun res!628394 () Bool)

(assert (=> b!932915 (=> (not res!628394) (not e!523842))))

(assert (=> b!932915 (= res!628394 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27459 _keys!1487))))))

(assert (= (and start!79388 res!628389) b!932908))

(assert (= (and b!932908 res!628392) b!932907))

(assert (= (and b!932907 res!628388) b!932912))

(assert (= (and b!932912 res!628393) b!932915))

(assert (= (and b!932915 res!628394) b!932910))

(assert (= (and b!932910 res!628387) b!932905))

(assert (= (and b!932905 res!628386) b!932904))

(assert (= (and b!932904 res!628385) b!932909))

(assert (= (and b!932909 res!628391) b!932906))

(assert (= (and b!932906 res!628390) b!932914))

(assert (= (and b!932903 condMapEmpty!31911) mapIsEmpty!31911))

(assert (= (and b!932903 (not condMapEmpty!31911)) mapNonEmpty!31911))

(get-info :version)

(assert (= (and mapNonEmpty!31911 ((_ is ValueCellFull!9569) mapValue!31911)) b!932911))

(assert (= (and b!932903 ((_ is ValueCellFull!9569) mapDefault!31911)) b!932913))

(assert (= start!79388 b!932903))

(declare-fun b_lambda!13909 () Bool)

(assert (=> (not b_lambda!13909) (not b!932914)))

(declare-fun t!27171 () Bool)

(declare-fun tb!5979 () Bool)

(assert (=> (and start!79388 (= defaultEntry!1235 defaultEntry!1235) t!27171) tb!5979))

(declare-fun result!11791 () Bool)

(assert (=> tb!5979 (= result!11791 tp_is_empty!20101)))

(assert (=> b!932914 t!27171))

(declare-fun b_and!28721 () Bool)

(assert (= b_and!28719 (and (=> t!27171 result!11791) b_and!28721)))

(declare-fun m!866465 () Bool)

(assert (=> b!932906 m!866465))

(declare-fun m!866467 () Bool)

(assert (=> b!932906 m!866467))

(declare-fun m!866469 () Bool)

(assert (=> b!932907 m!866469))

(declare-fun m!866471 () Bool)

(assert (=> mapNonEmpty!31911 m!866471))

(declare-fun m!866473 () Bool)

(assert (=> b!932909 m!866473))

(declare-fun m!866475 () Bool)

(assert (=> b!932912 m!866475))

(declare-fun m!866477 () Bool)

(assert (=> b!932914 m!866477))

(declare-fun m!866479 () Bool)

(assert (=> b!932914 m!866479))

(declare-fun m!866481 () Bool)

(assert (=> b!932914 m!866481))

(assert (=> b!932914 m!866477))

(assert (=> b!932914 m!866479))

(declare-fun m!866483 () Bool)

(assert (=> b!932914 m!866483))

(declare-fun m!866485 () Bool)

(assert (=> b!932914 m!866485))

(declare-fun m!866487 () Bool)

(assert (=> b!932914 m!866487))

(assert (=> b!932914 m!866481))

(declare-fun m!866489 () Bool)

(assert (=> b!932914 m!866489))

(declare-fun m!866491 () Bool)

(assert (=> b!932914 m!866491))

(declare-fun m!866493 () Bool)

(assert (=> b!932914 m!866493))

(declare-fun m!866495 () Bool)

(assert (=> b!932914 m!866495))

(declare-fun m!866497 () Bool)

(assert (=> b!932914 m!866497))

(assert (=> b!932914 m!866493))

(declare-fun m!866499 () Bool)

(assert (=> b!932914 m!866499))

(declare-fun m!866501 () Bool)

(assert (=> b!932910 m!866501))

(declare-fun m!866503 () Bool)

(assert (=> b!932910 m!866503))

(declare-fun m!866505 () Bool)

(assert (=> b!932905 m!866505))

(declare-fun m!866507 () Bool)

(assert (=> start!79388 m!866507))

(declare-fun m!866509 () Bool)

(assert (=> start!79388 m!866509))

(declare-fun m!866511 () Bool)

(assert (=> start!79388 m!866511))

(check-sat (not b!932914) (not start!79388) b_and!28721 (not b!932912) (not b!932909) (not b!932906) (not b!932907) (not b_next!17593) (not b!932910) (not b_lambda!13909) (not mapNonEmpty!31911) tp_is_empty!20101 (not b!932905))
(check-sat b_and!28721 (not b_next!17593))
