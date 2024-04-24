; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79660 () Bool)

(assert start!79660)

(declare-fun b_free!17647 () Bool)

(declare-fun b_next!17647 () Bool)

(assert (=> start!79660 (= b_free!17647 (not b_next!17647))))

(declare-fun tp!61389 () Bool)

(declare-fun b_and!28871 () Bool)

(assert (=> start!79660 (= tp!61389 b_and!28871)))

(declare-fun b!935415 () Bool)

(declare-fun res!629738 () Bool)

(declare-fun e!525306 () Bool)

(assert (=> b!935415 (=> (not res!629738) (not e!525306))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935415 (= res!629738 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!629733 () Bool)

(declare-fun e!525302 () Bool)

(assert (=> start!79660 (=> (not res!629733) (not e!525302))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79660 (= res!629733 (validMask!0 mask!1881))))

(assert (=> start!79660 e!525302))

(assert (=> start!79660 true))

(declare-fun tp_is_empty!20155 () Bool)

(assert (=> start!79660 tp_is_empty!20155))

(declare-datatypes ((V!31839 0))(
  ( (V!31840 (val!10128 Int)) )
))
(declare-datatypes ((ValueCell!9596 0))(
  ( (ValueCellFull!9596 (v!12645 V!31839)) (EmptyCell!9596) )
))
(declare-datatypes ((array!56301 0))(
  ( (array!56302 (arr!27089 (Array (_ BitVec 32) ValueCell!9596)) (size!27549 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56301)

(declare-fun e!525304 () Bool)

(declare-fun array_inv!21164 (array!56301) Bool)

(assert (=> start!79660 (and (array_inv!21164 _values!1231) e!525304)))

(assert (=> start!79660 tp!61389))

(declare-datatypes ((array!56303 0))(
  ( (array!56304 (arr!27090 (Array (_ BitVec 32) (_ BitVec 64))) (size!27550 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56303)

(declare-fun array_inv!21165 (array!56303) Bool)

(assert (=> start!79660 (array_inv!21165 _keys!1487)))

(declare-fun b!935416 () Bool)

(assert (=> b!935416 (= e!525302 e!525306)))

(declare-fun res!629737 () Bool)

(assert (=> b!935416 (=> (not res!629737) (not e!525306))))

(declare-datatypes ((tuple2!13272 0))(
  ( (tuple2!13273 (_1!6647 (_ BitVec 64)) (_2!6647 V!31839)) )
))
(declare-datatypes ((List!19055 0))(
  ( (Nil!19052) (Cons!19051 (h!20203 tuple2!13272) (t!27238 List!19055)) )
))
(declare-datatypes ((ListLongMap!11971 0))(
  ( (ListLongMap!11972 (toList!6001 List!19055)) )
))
(declare-fun lt!421380 () ListLongMap!11971)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5065 (ListLongMap!11971 (_ BitVec 64)) Bool)

(assert (=> b!935416 (= res!629737 (contains!5065 lt!421380 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31839)

(declare-fun minValue!1173 () V!31839)

(declare-fun getCurrentListMap!3240 (array!56303 array!56301 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 32) Int) ListLongMap!11971)

(assert (=> b!935416 (= lt!421380 (getCurrentListMap!3240 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935417 () Bool)

(declare-fun e!525305 () Bool)

(assert (=> b!935417 (= e!525305 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935418 () Bool)

(declare-fun e!525300 () Bool)

(assert (=> b!935418 (= e!525306 e!525300)))

(declare-fun res!629736 () Bool)

(assert (=> b!935418 (=> (not res!629736) (not e!525300))))

(declare-fun lt!421381 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935418 (= res!629736 (validKeyInArray!0 lt!421381))))

(assert (=> b!935418 (= lt!421381 (select (arr!27090 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935419 () Bool)

(declare-fun res!629741 () Bool)

(assert (=> b!935419 (=> (not res!629741) (not e!525306))))

(declare-fun v!791 () V!31839)

(declare-fun apply!825 (ListLongMap!11971 (_ BitVec 64)) V!31839)

(assert (=> b!935419 (= res!629741 (= (apply!825 lt!421380 k0!1099) v!791))))

(declare-fun b!935420 () Bool)

(declare-fun res!629740 () Bool)

(assert (=> b!935420 (=> (not res!629740) (not e!525302))))

(assert (=> b!935420 (= res!629740 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27550 _keys!1487))))))

(declare-fun b!935421 () Bool)

(assert (=> b!935421 (= e!525300 (not (or (bvsge (size!27550 _keys!1487) #b01111111111111111111111111111111) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27550 _keys!1487)))))))

(assert (=> b!935421 e!525305))

(declare-fun c!97443 () Bool)

(assert (=> b!935421 (= c!97443 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31523 0))(
  ( (Unit!31524) )
))
(declare-fun lt!421378 () Unit!31523)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!278 (array!56303 array!56301 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 64) (_ BitVec 32) Int) Unit!31523)

(assert (=> b!935421 (= lt!421378 (lemmaListMapContainsThenArrayContainsFrom!278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19056 0))(
  ( (Nil!19053) (Cons!19052 (h!20204 (_ BitVec 64)) (t!27239 List!19056)) )
))
(declare-fun arrayNoDuplicates!0 (array!56303 (_ BitVec 32) List!19056) Bool)

(assert (=> b!935421 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19053)))

(declare-fun lt!421383 () Unit!31523)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56303 (_ BitVec 32) (_ BitVec 32)) Unit!31523)

(assert (=> b!935421 (= lt!421383 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421377 () tuple2!13272)

(declare-fun +!2824 (ListLongMap!11971 tuple2!13272) ListLongMap!11971)

(assert (=> b!935421 (contains!5065 (+!2824 lt!421380 lt!421377) k0!1099)))

(declare-fun lt!421382 () V!31839)

(declare-fun lt!421379 () Unit!31523)

(declare-fun addStillContains!527 (ListLongMap!11971 (_ BitVec 64) V!31839 (_ BitVec 64)) Unit!31523)

(assert (=> b!935421 (= lt!421379 (addStillContains!527 lt!421380 lt!421381 lt!421382 k0!1099))))

(assert (=> b!935421 (= (getCurrentListMap!3240 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2824 (getCurrentListMap!3240 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421377))))

(assert (=> b!935421 (= lt!421377 (tuple2!13273 lt!421381 lt!421382))))

(declare-fun get!14281 (ValueCell!9596 V!31839) V!31839)

(declare-fun dynLambda!1621 (Int (_ BitVec 64)) V!31839)

(assert (=> b!935421 (= lt!421382 (get!14281 (select (arr!27089 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421384 () Unit!31523)

(declare-fun lemmaListMapRecursiveValidKeyArray!204 (array!56303 array!56301 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 32) Int) Unit!31523)

(assert (=> b!935421 (= lt!421384 (lemmaListMapRecursiveValidKeyArray!204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31995 () Bool)

(declare-fun mapRes!31995 () Bool)

(assert (=> mapIsEmpty!31995 mapRes!31995))

(declare-fun b!935422 () Bool)

(declare-fun res!629742 () Bool)

(assert (=> b!935422 (=> (not res!629742) (not e!525306))))

(assert (=> b!935422 (= res!629742 (validKeyInArray!0 k0!1099))))

(declare-fun b!935423 () Bool)

(declare-fun e!525303 () Bool)

(assert (=> b!935423 (= e!525303 tp_is_empty!20155)))

(declare-fun mapNonEmpty!31995 () Bool)

(declare-fun tp!61388 () Bool)

(assert (=> mapNonEmpty!31995 (= mapRes!31995 (and tp!61388 e!525303))))

(declare-fun mapValue!31995 () ValueCell!9596)

(declare-fun mapKey!31995 () (_ BitVec 32))

(declare-fun mapRest!31995 () (Array (_ BitVec 32) ValueCell!9596))

(assert (=> mapNonEmpty!31995 (= (arr!27089 _values!1231) (store mapRest!31995 mapKey!31995 mapValue!31995))))

(declare-fun b!935424 () Bool)

(declare-fun arrayContainsKey!0 (array!56303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935424 (= e!525305 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935425 () Bool)

(declare-fun res!629734 () Bool)

(assert (=> b!935425 (=> (not res!629734) (not e!525302))))

(assert (=> b!935425 (= res!629734 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19053))))

(declare-fun b!935426 () Bool)

(declare-fun e!525299 () Bool)

(assert (=> b!935426 (= e!525299 tp_is_empty!20155)))

(declare-fun b!935427 () Bool)

(assert (=> b!935427 (= e!525304 (and e!525299 mapRes!31995))))

(declare-fun condMapEmpty!31995 () Bool)

(declare-fun mapDefault!31995 () ValueCell!9596)

(assert (=> b!935427 (= condMapEmpty!31995 (= (arr!27089 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9596)) mapDefault!31995)))))

(declare-fun b!935428 () Bool)

(declare-fun res!629739 () Bool)

(assert (=> b!935428 (=> (not res!629739) (not e!525302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56303 (_ BitVec 32)) Bool)

(assert (=> b!935428 (= res!629739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935429 () Bool)

(declare-fun res!629735 () Bool)

(assert (=> b!935429 (=> (not res!629735) (not e!525302))))

(assert (=> b!935429 (= res!629735 (and (= (size!27549 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27550 _keys!1487) (size!27549 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79660 res!629733) b!935429))

(assert (= (and b!935429 res!629735) b!935428))

(assert (= (and b!935428 res!629739) b!935425))

(assert (= (and b!935425 res!629734) b!935420))

(assert (= (and b!935420 res!629740) b!935416))

(assert (= (and b!935416 res!629737) b!935419))

(assert (= (and b!935419 res!629741) b!935415))

(assert (= (and b!935415 res!629738) b!935422))

(assert (= (and b!935422 res!629742) b!935418))

(assert (= (and b!935418 res!629736) b!935421))

(assert (= (and b!935421 c!97443) b!935424))

(assert (= (and b!935421 (not c!97443)) b!935417))

(assert (= (and b!935427 condMapEmpty!31995) mapIsEmpty!31995))

(assert (= (and b!935427 (not condMapEmpty!31995)) mapNonEmpty!31995))

(get-info :version)

(assert (= (and mapNonEmpty!31995 ((_ is ValueCellFull!9596) mapValue!31995)) b!935423))

(assert (= (and b!935427 ((_ is ValueCellFull!9596) mapDefault!31995)) b!935426))

(assert (= start!79660 b!935427))

(declare-fun b_lambda!14013 () Bool)

(assert (=> (not b_lambda!14013) (not b!935421)))

(declare-fun t!27237 () Bool)

(declare-fun tb!6033 () Bool)

(assert (=> (and start!79660 (= defaultEntry!1235 defaultEntry!1235) t!27237) tb!6033))

(declare-fun result!11901 () Bool)

(assert (=> tb!6033 (= result!11901 tp_is_empty!20155)))

(assert (=> b!935421 t!27237))

(declare-fun b_and!28873 () Bool)

(assert (= b_and!28871 (and (=> t!27237 result!11901) b_and!28873)))

(declare-fun m!870109 () Bool)

(assert (=> b!935422 m!870109))

(declare-fun m!870111 () Bool)

(assert (=> b!935416 m!870111))

(declare-fun m!870113 () Bool)

(assert (=> b!935416 m!870113))

(declare-fun m!870115 () Bool)

(assert (=> b!935428 m!870115))

(declare-fun m!870117 () Bool)

(assert (=> mapNonEmpty!31995 m!870117))

(declare-fun m!870119 () Bool)

(assert (=> b!935424 m!870119))

(declare-fun m!870121 () Bool)

(assert (=> b!935419 m!870121))

(declare-fun m!870123 () Bool)

(assert (=> b!935425 m!870123))

(declare-fun m!870125 () Bool)

(assert (=> b!935418 m!870125))

(declare-fun m!870127 () Bool)

(assert (=> b!935418 m!870127))

(declare-fun m!870129 () Bool)

(assert (=> start!79660 m!870129))

(declare-fun m!870131 () Bool)

(assert (=> start!79660 m!870131))

(declare-fun m!870133 () Bool)

(assert (=> start!79660 m!870133))

(declare-fun m!870135 () Bool)

(assert (=> b!935421 m!870135))

(declare-fun m!870137 () Bool)

(assert (=> b!935421 m!870137))

(declare-fun m!870139 () Bool)

(assert (=> b!935421 m!870139))

(declare-fun m!870141 () Bool)

(assert (=> b!935421 m!870141))

(assert (=> b!935421 m!870139))

(assert (=> b!935421 m!870141))

(declare-fun m!870143 () Bool)

(assert (=> b!935421 m!870143))

(declare-fun m!870145 () Bool)

(assert (=> b!935421 m!870145))

(declare-fun m!870147 () Bool)

(assert (=> b!935421 m!870147))

(declare-fun m!870149 () Bool)

(assert (=> b!935421 m!870149))

(declare-fun m!870151 () Bool)

(assert (=> b!935421 m!870151))

(declare-fun m!870153 () Bool)

(assert (=> b!935421 m!870153))

(declare-fun m!870155 () Bool)

(assert (=> b!935421 m!870155))

(assert (=> b!935421 m!870135))

(declare-fun m!870157 () Bool)

(assert (=> b!935421 m!870157))

(assert (=> b!935421 m!870151))

(declare-fun m!870159 () Bool)

(assert (=> b!935421 m!870159))

(check-sat (not mapNonEmpty!31995) (not b!935425) b_and!28873 (not b!935418) (not b!935428) (not b!935416) (not b_lambda!14013) (not b!935419) (not b_next!17647) (not start!79660) (not b!935421) tp_is_empty!20155 (not b!935424) (not b!935422))
(check-sat b_and!28873 (not b_next!17647))
