; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79568 () Bool)

(assert start!79568)

(declare-fun b_free!17587 () Bool)

(declare-fun b_next!17587 () Bool)

(assert (=> start!79568 (= b_free!17587 (not b_next!17587))))

(declare-fun tp!61205 () Bool)

(declare-fun b_and!28743 () Bool)

(assert (=> start!79568 (= tp!61205 b_and!28743)))

(declare-fun b!933922 () Bool)

(declare-fun e!524514 () Bool)

(declare-fun e!524511 () Bool)

(assert (=> b!933922 (= e!524514 e!524511)))

(declare-fun res!628755 () Bool)

(assert (=> b!933922 (=> (not res!628755) (not e!524511))))

(declare-datatypes ((V!31759 0))(
  ( (V!31760 (val!10098 Int)) )
))
(declare-datatypes ((tuple2!13224 0))(
  ( (tuple2!13225 (_1!6623 (_ BitVec 64)) (_2!6623 V!31759)) )
))
(declare-datatypes ((List!19007 0))(
  ( (Nil!19004) (Cons!19003 (h!20155 tuple2!13224) (t!27130 List!19007)) )
))
(declare-datatypes ((ListLongMap!11923 0))(
  ( (ListLongMap!11924 (toList!5977 List!19007)) )
))
(declare-fun lt!420551 () ListLongMap!11923)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5042 (ListLongMap!11923 (_ BitVec 64)) Bool)

(assert (=> b!933922 (= res!628755 (contains!5042 lt!420551 k0!1099))))

(declare-datatypes ((array!56183 0))(
  ( (array!56184 (arr!27031 (Array (_ BitVec 32) (_ BitVec 64))) (size!27491 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56183)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9566 0))(
  ( (ValueCellFull!9566 (v!12614 V!31759)) (EmptyCell!9566) )
))
(declare-datatypes ((array!56185 0))(
  ( (array!56186 (arr!27032 (Array (_ BitVec 32) ValueCell!9566)) (size!27492 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56185)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31759)

(declare-fun minValue!1173 () V!31759)

(declare-fun getCurrentListMap!3219 (array!56183 array!56185 (_ BitVec 32) (_ BitVec 32) V!31759 V!31759 (_ BitVec 32) Int) ListLongMap!11923)

(assert (=> b!933922 (= lt!420551 (getCurrentListMap!3219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933923 () Bool)

(declare-fun e!524513 () Bool)

(declare-fun e!524512 () Bool)

(declare-fun mapRes!31902 () Bool)

(assert (=> b!933923 (= e!524513 (and e!524512 mapRes!31902))))

(declare-fun condMapEmpty!31902 () Bool)

(declare-fun mapDefault!31902 () ValueCell!9566)

(assert (=> b!933923 (= condMapEmpty!31902 (= (arr!27032 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9566)) mapDefault!31902)))))

(declare-fun b!933924 () Bool)

(declare-fun res!628757 () Bool)

(assert (=> b!933924 (=> (not res!628757) (not e!524514))))

(assert (=> b!933924 (= res!628757 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27491 _keys!1487))))))

(declare-fun b!933925 () Bool)

(declare-fun res!628756 () Bool)

(assert (=> b!933925 (=> (not res!628756) (not e!524511))))

(assert (=> b!933925 (= res!628756 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933926 () Bool)

(declare-fun e!524508 () Bool)

(assert (=> b!933926 (= e!524508 (not true))))

(declare-datatypes ((List!19008 0))(
  ( (Nil!19005) (Cons!19004 (h!20156 (_ BitVec 64)) (t!27131 List!19008)) )
))
(declare-fun arrayNoDuplicates!0 (array!56183 (_ BitVec 32) List!19008) Bool)

(assert (=> b!933926 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19005)))

(declare-datatypes ((Unit!31480 0))(
  ( (Unit!31481) )
))
(declare-fun lt!420552 () Unit!31480)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56183 (_ BitVec 32) (_ BitVec 32)) Unit!31480)

(assert (=> b!933926 (= lt!420552 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420547 () tuple2!13224)

(declare-fun +!2805 (ListLongMap!11923 tuple2!13224) ListLongMap!11923)

(assert (=> b!933926 (contains!5042 (+!2805 lt!420551 lt!420547) k0!1099)))

(declare-fun lt!420548 () V!31759)

(declare-fun lt!420546 () (_ BitVec 64))

(declare-fun lt!420550 () Unit!31480)

(declare-fun addStillContains!508 (ListLongMap!11923 (_ BitVec 64) V!31759 (_ BitVec 64)) Unit!31480)

(assert (=> b!933926 (= lt!420550 (addStillContains!508 lt!420551 lt!420546 lt!420548 k0!1099))))

(assert (=> b!933926 (= (getCurrentListMap!3219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2805 (getCurrentListMap!3219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420547))))

(assert (=> b!933926 (= lt!420547 (tuple2!13225 lt!420546 lt!420548))))

(declare-fun get!14239 (ValueCell!9566 V!31759) V!31759)

(declare-fun dynLambda!1602 (Int (_ BitVec 64)) V!31759)

(assert (=> b!933926 (= lt!420548 (get!14239 (select (arr!27032 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1602 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420549 () Unit!31480)

(declare-fun lemmaListMapRecursiveValidKeyArray!185 (array!56183 array!56185 (_ BitVec 32) (_ BitVec 32) V!31759 V!31759 (_ BitVec 32) Int) Unit!31480)

(assert (=> b!933926 (= lt!420549 (lemmaListMapRecursiveValidKeyArray!185 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933927 () Bool)

(declare-fun res!628750 () Bool)

(assert (=> b!933927 (=> (not res!628750) (not e!524511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933927 (= res!628750 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31902 () Bool)

(declare-fun tp!61206 () Bool)

(declare-fun e!524509 () Bool)

(assert (=> mapNonEmpty!31902 (= mapRes!31902 (and tp!61206 e!524509))))

(declare-fun mapRest!31902 () (Array (_ BitVec 32) ValueCell!9566))

(declare-fun mapValue!31902 () ValueCell!9566)

(declare-fun mapKey!31902 () (_ BitVec 32))

(assert (=> mapNonEmpty!31902 (= (arr!27032 _values!1231) (store mapRest!31902 mapKey!31902 mapValue!31902))))

(declare-fun b!933928 () Bool)

(declare-fun res!628754 () Bool)

(assert (=> b!933928 (=> (not res!628754) (not e!524511))))

(declare-fun v!791 () V!31759)

(declare-fun apply!803 (ListLongMap!11923 (_ BitVec 64)) V!31759)

(assert (=> b!933928 (= res!628754 (= (apply!803 lt!420551 k0!1099) v!791))))

(declare-fun b!933929 () Bool)

(declare-fun tp_is_empty!20095 () Bool)

(assert (=> b!933929 (= e!524512 tp_is_empty!20095)))

(declare-fun b!933930 () Bool)

(declare-fun res!628752 () Bool)

(assert (=> b!933930 (=> (not res!628752) (not e!524514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56183 (_ BitVec 32)) Bool)

(assert (=> b!933930 (= res!628752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933931 () Bool)

(assert (=> b!933931 (= e!524509 tp_is_empty!20095)))

(declare-fun res!628753 () Bool)

(assert (=> start!79568 (=> (not res!628753) (not e!524514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79568 (= res!628753 (validMask!0 mask!1881))))

(assert (=> start!79568 e!524514))

(assert (=> start!79568 true))

(assert (=> start!79568 tp_is_empty!20095))

(declare-fun array_inv!21130 (array!56185) Bool)

(assert (=> start!79568 (and (array_inv!21130 _values!1231) e!524513)))

(assert (=> start!79568 tp!61205))

(declare-fun array_inv!21131 (array!56183) Bool)

(assert (=> start!79568 (array_inv!21131 _keys!1487)))

(declare-fun b!933932 () Bool)

(assert (=> b!933932 (= e!524511 e!524508)))

(declare-fun res!628751 () Bool)

(assert (=> b!933932 (=> (not res!628751) (not e!524508))))

(assert (=> b!933932 (= res!628751 (validKeyInArray!0 lt!420546))))

(assert (=> b!933932 (= lt!420546 (select (arr!27031 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31902 () Bool)

(assert (=> mapIsEmpty!31902 mapRes!31902))

(declare-fun b!933933 () Bool)

(declare-fun res!628758 () Bool)

(assert (=> b!933933 (=> (not res!628758) (not e!524514))))

(assert (=> b!933933 (= res!628758 (and (= (size!27492 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27491 _keys!1487) (size!27492 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933934 () Bool)

(declare-fun res!628749 () Bool)

(assert (=> b!933934 (=> (not res!628749) (not e!524514))))

(assert (=> b!933934 (= res!628749 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19005))))

(assert (= (and start!79568 res!628753) b!933933))

(assert (= (and b!933933 res!628758) b!933930))

(assert (= (and b!933930 res!628752) b!933934))

(assert (= (and b!933934 res!628749) b!933924))

(assert (= (and b!933924 res!628757) b!933922))

(assert (= (and b!933922 res!628755) b!933928))

(assert (= (and b!933928 res!628754) b!933925))

(assert (= (and b!933925 res!628756) b!933927))

(assert (= (and b!933927 res!628750) b!933932))

(assert (= (and b!933932 res!628751) b!933926))

(assert (= (and b!933923 condMapEmpty!31902) mapIsEmpty!31902))

(assert (= (and b!933923 (not condMapEmpty!31902)) mapNonEmpty!31902))

(get-info :version)

(assert (= (and mapNonEmpty!31902 ((_ is ValueCellFull!9566) mapValue!31902)) b!933931))

(assert (= (and b!933923 ((_ is ValueCellFull!9566) mapDefault!31902)) b!933929))

(assert (= start!79568 b!933923))

(declare-fun b_lambda!13935 () Bool)

(assert (=> (not b_lambda!13935) (not b!933926)))

(declare-fun t!27129 () Bool)

(declare-fun tb!5973 () Bool)

(assert (=> (and start!79568 (= defaultEntry!1235 defaultEntry!1235) t!27129) tb!5973))

(declare-fun result!11779 () Bool)

(assert (=> tb!5973 (= result!11779 tp_is_empty!20095)))

(assert (=> b!933926 t!27129))

(declare-fun b_and!28745 () Bool)

(assert (= b_and!28743 (and (=> t!27129 result!11779) b_and!28745)))

(declare-fun m!868373 () Bool)

(assert (=> b!933930 m!868373))

(declare-fun m!868375 () Bool)

(assert (=> b!933926 m!868375))

(declare-fun m!868377 () Bool)

(assert (=> b!933926 m!868377))

(declare-fun m!868379 () Bool)

(assert (=> b!933926 m!868379))

(declare-fun m!868381 () Bool)

(assert (=> b!933926 m!868381))

(assert (=> b!933926 m!868377))

(declare-fun m!868383 () Bool)

(assert (=> b!933926 m!868383))

(declare-fun m!868385 () Bool)

(assert (=> b!933926 m!868385))

(assert (=> b!933926 m!868375))

(assert (=> b!933926 m!868381))

(declare-fun m!868387 () Bool)

(assert (=> b!933926 m!868387))

(declare-fun m!868389 () Bool)

(assert (=> b!933926 m!868389))

(declare-fun m!868391 () Bool)

(assert (=> b!933926 m!868391))

(declare-fun m!868393 () Bool)

(assert (=> b!933926 m!868393))

(declare-fun m!868395 () Bool)

(assert (=> b!933926 m!868395))

(assert (=> b!933926 m!868383))

(declare-fun m!868397 () Bool)

(assert (=> b!933926 m!868397))

(declare-fun m!868399 () Bool)

(assert (=> b!933927 m!868399))

(declare-fun m!868401 () Bool)

(assert (=> b!933928 m!868401))

(declare-fun m!868403 () Bool)

(assert (=> b!933934 m!868403))

(declare-fun m!868405 () Bool)

(assert (=> start!79568 m!868405))

(declare-fun m!868407 () Bool)

(assert (=> start!79568 m!868407))

(declare-fun m!868409 () Bool)

(assert (=> start!79568 m!868409))

(declare-fun m!868411 () Bool)

(assert (=> b!933922 m!868411))

(declare-fun m!868413 () Bool)

(assert (=> b!933922 m!868413))

(declare-fun m!868415 () Bool)

(assert (=> mapNonEmpty!31902 m!868415))

(declare-fun m!868417 () Bool)

(assert (=> b!933932 m!868417))

(declare-fun m!868419 () Bool)

(assert (=> b!933932 m!868419))

(check-sat (not b!933926) (not b_next!17587) (not b!933932) (not mapNonEmpty!31902) (not b!933927) (not b!933922) (not b!933928) (not b!933930) tp_is_empty!20095 b_and!28745 (not start!79568) (not b_lambda!13935) (not b!933934))
(check-sat b_and!28745 (not b_next!17587))
