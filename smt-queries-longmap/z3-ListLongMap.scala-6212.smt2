; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79574 () Bool)

(assert start!79574)

(declare-fun b_free!17593 () Bool)

(declare-fun b_next!17593 () Bool)

(assert (=> start!79574 (= b_free!17593 (not b_next!17593))))

(declare-fun tp!61224 () Bool)

(declare-fun b_and!28755 () Bool)

(assert (=> start!79574 (= tp!61224 b_and!28755)))

(declare-fun b!934045 () Bool)

(declare-fun e!524573 () Bool)

(declare-fun e!524572 () Bool)

(assert (=> b!934045 (= e!524573 e!524572)))

(declare-fun res!628842 () Bool)

(assert (=> b!934045 (=> (not res!628842) (not e!524572))))

(declare-datatypes ((V!31767 0))(
  ( (V!31768 (val!10101 Int)) )
))
(declare-datatypes ((tuple2!13228 0))(
  ( (tuple2!13229 (_1!6625 (_ BitVec 64)) (_2!6625 V!31767)) )
))
(declare-datatypes ((List!19012 0))(
  ( (Nil!19009) (Cons!19008 (h!20160 tuple2!13228) (t!27141 List!19012)) )
))
(declare-datatypes ((ListLongMap!11927 0))(
  ( (ListLongMap!11928 (toList!5979 List!19012)) )
))
(declare-fun lt!420613 () ListLongMap!11927)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5044 (ListLongMap!11927 (_ BitVec 64)) Bool)

(assert (=> b!934045 (= res!628842 (contains!5044 lt!420613 k0!1099))))

(declare-datatypes ((array!56195 0))(
  ( (array!56196 (arr!27037 (Array (_ BitVec 32) (_ BitVec 64))) (size!27497 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56195)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9569 0))(
  ( (ValueCellFull!9569 (v!12617 V!31767)) (EmptyCell!9569) )
))
(declare-datatypes ((array!56197 0))(
  ( (array!56198 (arr!27038 (Array (_ BitVec 32) ValueCell!9569)) (size!27498 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56197)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31767)

(declare-fun minValue!1173 () V!31767)

(declare-fun getCurrentListMap!3221 (array!56195 array!56197 (_ BitVec 32) (_ BitVec 32) V!31767 V!31767 (_ BitVec 32) Int) ListLongMap!11927)

(assert (=> b!934045 (= lt!420613 (getCurrentListMap!3221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934046 () Bool)

(declare-fun e!524571 () Bool)

(declare-fun tp_is_empty!20101 () Bool)

(assert (=> b!934046 (= e!524571 tp_is_empty!20101)))

(declare-fun b!934047 () Bool)

(declare-fun res!628848 () Bool)

(assert (=> b!934047 (=> (not res!628848) (not e!524573))))

(assert (=> b!934047 (= res!628848 (and (= (size!27498 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27497 _keys!1487) (size!27498 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934048 () Bool)

(declare-fun res!628846 () Bool)

(assert (=> b!934048 (=> (not res!628846) (not e!524572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934048 (= res!628846 (validKeyInArray!0 k0!1099))))

(declare-fun b!934049 () Bool)

(declare-fun res!628847 () Bool)

(assert (=> b!934049 (=> (not res!628847) (not e!524572))))

(declare-fun v!791 () V!31767)

(declare-fun apply!805 (ListLongMap!11927 (_ BitVec 64)) V!31767)

(assert (=> b!934049 (= res!628847 (= (apply!805 lt!420613 k0!1099) v!791))))

(declare-fun b!934050 () Bool)

(declare-fun e!524577 () Bool)

(assert (=> b!934050 (= e!524577 tp_is_empty!20101)))

(declare-fun mapNonEmpty!31911 () Bool)

(declare-fun mapRes!31911 () Bool)

(declare-fun tp!61223 () Bool)

(assert (=> mapNonEmpty!31911 (= mapRes!31911 (and tp!61223 e!524571))))

(declare-fun mapValue!31911 () ValueCell!9569)

(declare-fun mapRest!31911 () (Array (_ BitVec 32) ValueCell!9569))

(declare-fun mapKey!31911 () (_ BitVec 32))

(assert (=> mapNonEmpty!31911 (= (arr!27038 _values!1231) (store mapRest!31911 mapKey!31911 mapValue!31911))))

(declare-fun res!628840 () Bool)

(assert (=> start!79574 (=> (not res!628840) (not e!524573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79574 (= res!628840 (validMask!0 mask!1881))))

(assert (=> start!79574 e!524573))

(assert (=> start!79574 true))

(assert (=> start!79574 tp_is_empty!20101))

(declare-fun e!524576 () Bool)

(declare-fun array_inv!21134 (array!56197) Bool)

(assert (=> start!79574 (and (array_inv!21134 _values!1231) e!524576)))

(assert (=> start!79574 tp!61224))

(declare-fun array_inv!21135 (array!56195) Bool)

(assert (=> start!79574 (array_inv!21135 _keys!1487)))

(declare-fun b!934051 () Bool)

(declare-fun res!628844 () Bool)

(assert (=> b!934051 (=> (not res!628844) (not e!524573))))

(declare-datatypes ((List!19013 0))(
  ( (Nil!19010) (Cons!19009 (h!20161 (_ BitVec 64)) (t!27142 List!19013)) )
))
(declare-fun arrayNoDuplicates!0 (array!56195 (_ BitVec 32) List!19013) Bool)

(assert (=> b!934051 (= res!628844 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19010))))

(declare-fun b!934052 () Bool)

(declare-fun e!524574 () Bool)

(assert (=> b!934052 (= e!524574 (not true))))

(assert (=> b!934052 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19010)))

(declare-datatypes ((Unit!31484 0))(
  ( (Unit!31485) )
))
(declare-fun lt!420609 () Unit!31484)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56195 (_ BitVec 32) (_ BitVec 32)) Unit!31484)

(assert (=> b!934052 (= lt!420609 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420615 () tuple2!13228)

(declare-fun +!2807 (ListLongMap!11927 tuple2!13228) ListLongMap!11927)

(assert (=> b!934052 (contains!5044 (+!2807 lt!420613 lt!420615) k0!1099)))

(declare-fun lt!420612 () (_ BitVec 64))

(declare-fun lt!420610 () V!31767)

(declare-fun lt!420611 () Unit!31484)

(declare-fun addStillContains!510 (ListLongMap!11927 (_ BitVec 64) V!31767 (_ BitVec 64)) Unit!31484)

(assert (=> b!934052 (= lt!420611 (addStillContains!510 lt!420613 lt!420612 lt!420610 k0!1099))))

(assert (=> b!934052 (= (getCurrentListMap!3221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2807 (getCurrentListMap!3221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420615))))

(assert (=> b!934052 (= lt!420615 (tuple2!13229 lt!420612 lt!420610))))

(declare-fun get!14243 (ValueCell!9569 V!31767) V!31767)

(declare-fun dynLambda!1604 (Int (_ BitVec 64)) V!31767)

(assert (=> b!934052 (= lt!420610 (get!14243 (select (arr!27038 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1604 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420614 () Unit!31484)

(declare-fun lemmaListMapRecursiveValidKeyArray!187 (array!56195 array!56197 (_ BitVec 32) (_ BitVec 32) V!31767 V!31767 (_ BitVec 32) Int) Unit!31484)

(assert (=> b!934052 (= lt!420614 (lemmaListMapRecursiveValidKeyArray!187 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31911 () Bool)

(assert (=> mapIsEmpty!31911 mapRes!31911))

(declare-fun b!934053 () Bool)

(declare-fun res!628845 () Bool)

(assert (=> b!934053 (=> (not res!628845) (not e!524573))))

(assert (=> b!934053 (= res!628845 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27497 _keys!1487))))))

(declare-fun b!934054 () Bool)

(declare-fun res!628839 () Bool)

(assert (=> b!934054 (=> (not res!628839) (not e!524573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56195 (_ BitVec 32)) Bool)

(assert (=> b!934054 (= res!628839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934055 () Bool)

(assert (=> b!934055 (= e!524572 e!524574)))

(declare-fun res!628843 () Bool)

(assert (=> b!934055 (=> (not res!628843) (not e!524574))))

(assert (=> b!934055 (= res!628843 (validKeyInArray!0 lt!420612))))

(assert (=> b!934055 (= lt!420612 (select (arr!27037 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934056 () Bool)

(declare-fun res!628841 () Bool)

(assert (=> b!934056 (=> (not res!628841) (not e!524572))))

(assert (=> b!934056 (= res!628841 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934057 () Bool)

(assert (=> b!934057 (= e!524576 (and e!524577 mapRes!31911))))

(declare-fun condMapEmpty!31911 () Bool)

(declare-fun mapDefault!31911 () ValueCell!9569)

(assert (=> b!934057 (= condMapEmpty!31911 (= (arr!27038 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9569)) mapDefault!31911)))))

(assert (= (and start!79574 res!628840) b!934047))

(assert (= (and b!934047 res!628848) b!934054))

(assert (= (and b!934054 res!628839) b!934051))

(assert (= (and b!934051 res!628844) b!934053))

(assert (= (and b!934053 res!628845) b!934045))

(assert (= (and b!934045 res!628842) b!934049))

(assert (= (and b!934049 res!628847) b!934056))

(assert (= (and b!934056 res!628841) b!934048))

(assert (= (and b!934048 res!628846) b!934055))

(assert (= (and b!934055 res!628843) b!934052))

(assert (= (and b!934057 condMapEmpty!31911) mapIsEmpty!31911))

(assert (= (and b!934057 (not condMapEmpty!31911)) mapNonEmpty!31911))

(get-info :version)

(assert (= (and mapNonEmpty!31911 ((_ is ValueCellFull!9569) mapValue!31911)) b!934046))

(assert (= (and b!934057 ((_ is ValueCellFull!9569) mapDefault!31911)) b!934050))

(assert (= start!79574 b!934057))

(declare-fun b_lambda!13941 () Bool)

(assert (=> (not b_lambda!13941) (not b!934052)))

(declare-fun t!27140 () Bool)

(declare-fun tb!5979 () Bool)

(assert (=> (and start!79574 (= defaultEntry!1235 defaultEntry!1235) t!27140) tb!5979))

(declare-fun result!11791 () Bool)

(assert (=> tb!5979 (= result!11791 tp_is_empty!20101)))

(assert (=> b!934052 t!27140))

(declare-fun b_and!28757 () Bool)

(assert (= b_and!28755 (and (=> t!27140 result!11791) b_and!28757)))

(declare-fun m!868517 () Bool)

(assert (=> b!934054 m!868517))

(declare-fun m!868519 () Bool)

(assert (=> b!934051 m!868519))

(declare-fun m!868521 () Bool)

(assert (=> b!934052 m!868521))

(declare-fun m!868523 () Bool)

(assert (=> b!934052 m!868523))

(assert (=> b!934052 m!868523))

(declare-fun m!868525 () Bool)

(assert (=> b!934052 m!868525))

(declare-fun m!868527 () Bool)

(assert (=> b!934052 m!868527))

(declare-fun m!868529 () Bool)

(assert (=> b!934052 m!868529))

(declare-fun m!868531 () Bool)

(assert (=> b!934052 m!868531))

(declare-fun m!868533 () Bool)

(assert (=> b!934052 m!868533))

(declare-fun m!868535 () Bool)

(assert (=> b!934052 m!868535))

(declare-fun m!868537 () Bool)

(assert (=> b!934052 m!868537))

(declare-fun m!868539 () Bool)

(assert (=> b!934052 m!868539))

(declare-fun m!868541 () Bool)

(assert (=> b!934052 m!868541))

(assert (=> b!934052 m!868525))

(assert (=> b!934052 m!868535))

(assert (=> b!934052 m!868539))

(declare-fun m!868543 () Bool)

(assert (=> b!934052 m!868543))

(declare-fun m!868545 () Bool)

(assert (=> b!934055 m!868545))

(declare-fun m!868547 () Bool)

(assert (=> b!934055 m!868547))

(declare-fun m!868549 () Bool)

(assert (=> b!934045 m!868549))

(declare-fun m!868551 () Bool)

(assert (=> b!934045 m!868551))

(declare-fun m!868553 () Bool)

(assert (=> b!934048 m!868553))

(declare-fun m!868555 () Bool)

(assert (=> start!79574 m!868555))

(declare-fun m!868557 () Bool)

(assert (=> start!79574 m!868557))

(declare-fun m!868559 () Bool)

(assert (=> start!79574 m!868559))

(declare-fun m!868561 () Bool)

(assert (=> mapNonEmpty!31911 m!868561))

(declare-fun m!868563 () Bool)

(assert (=> b!934049 m!868563))

(check-sat (not b!934045) (not b!934052) (not b_lambda!13941) (not start!79574) b_and!28757 (not b!934048) (not b!934055) (not b!934049) (not b_next!17593) (not mapNonEmpty!31911) tp_is_empty!20101 (not b!934051) (not b!934054))
(check-sat b_and!28757 (not b_next!17593))
