; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79624 () Bool)

(assert start!79624)

(declare-fun b_free!17673 () Bool)

(declare-fun b_next!17673 () Bool)

(assert (=> start!79624 (= b_free!17673 (not b_next!17673))))

(declare-fun tp!61474 () Bool)

(declare-fun b_and!28937 () Bool)

(assert (=> start!79624 (= tp!61474 b_and!28937)))

(declare-fun b!935807 () Bool)

(declare-fun e!525475 () Bool)

(declare-fun tp_is_empty!20181 () Bool)

(assert (=> b!935807 (= e!525475 tp_is_empty!20181)))

(declare-fun b!935808 () Bool)

(declare-fun e!525481 () Bool)

(declare-fun e!525476 () Bool)

(assert (=> b!935808 (= e!525481 e!525476)))

(declare-fun res!630160 () Bool)

(assert (=> b!935808 (=> (not res!630160) (not e!525476))))

(declare-datatypes ((V!31873 0))(
  ( (V!31874 (val!10141 Int)) )
))
(declare-datatypes ((tuple2!13310 0))(
  ( (tuple2!13311 (_1!6666 (_ BitVec 64)) (_2!6666 V!31873)) )
))
(declare-datatypes ((List!19091 0))(
  ( (Nil!19088) (Cons!19087 (h!20233 tuple2!13310) (t!27308 List!19091)) )
))
(declare-datatypes ((ListLongMap!12007 0))(
  ( (ListLongMap!12008 (toList!6019 List!19091)) )
))
(declare-fun lt!421841 () ListLongMap!12007)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5078 (ListLongMap!12007 (_ BitVec 64)) Bool)

(assert (=> b!935808 (= res!630160 (contains!5078 lt!421841 k0!1099))))

(declare-datatypes ((array!56304 0))(
  ( (array!56305 (arr!27092 (Array (_ BitVec 32) (_ BitVec 64))) (size!27551 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56304)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9609 0))(
  ( (ValueCellFull!9609 (v!12666 V!31873)) (EmptyCell!9609) )
))
(declare-datatypes ((array!56306 0))(
  ( (array!56307 (arr!27093 (Array (_ BitVec 32) ValueCell!9609)) (size!27552 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56306)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31873)

(declare-fun minValue!1173 () V!31873)

(declare-fun getCurrentListMap!3256 (array!56304 array!56306 (_ BitVec 32) (_ BitVec 32) V!31873 V!31873 (_ BitVec 32) Int) ListLongMap!12007)

(assert (=> b!935808 (= lt!421841 (getCurrentListMap!3256 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935809 () Bool)

(declare-fun e!525483 () Bool)

(assert (=> b!935809 (= e!525483 tp_is_empty!20181)))

(declare-fun res!630159 () Bool)

(assert (=> start!79624 (=> (not res!630159) (not e!525481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79624 (= res!630159 (validMask!0 mask!1881))))

(assert (=> start!79624 e!525481))

(assert (=> start!79624 true))

(assert (=> start!79624 tp_is_empty!20181))

(declare-fun e!525478 () Bool)

(declare-fun array_inv!21084 (array!56306) Bool)

(assert (=> start!79624 (and (array_inv!21084 _values!1231) e!525478)))

(assert (=> start!79624 tp!61474))

(declare-fun array_inv!21085 (array!56304) Bool)

(assert (=> start!79624 (array_inv!21085 _keys!1487)))

(declare-fun b!935810 () Bool)

(declare-fun res!630165 () Bool)

(assert (=> b!935810 (=> (not res!630165) (not e!525481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56304 (_ BitVec 32)) Bool)

(assert (=> b!935810 (= res!630165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!32043 () Bool)

(declare-fun mapRes!32043 () Bool)

(declare-fun tp!61475 () Bool)

(assert (=> mapNonEmpty!32043 (= mapRes!32043 (and tp!61475 e!525475))))

(declare-fun mapKey!32043 () (_ BitVec 32))

(declare-fun mapValue!32043 () ValueCell!9609)

(declare-fun mapRest!32043 () (Array (_ BitVec 32) ValueCell!9609))

(assert (=> mapNonEmpty!32043 (= (arr!27093 _values!1231) (store mapRest!32043 mapKey!32043 mapValue!32043))))

(declare-fun b!935811 () Bool)

(assert (=> b!935811 (= e!525478 (and e!525483 mapRes!32043))))

(declare-fun condMapEmpty!32043 () Bool)

(declare-fun mapDefault!32043 () ValueCell!9609)

(assert (=> b!935811 (= condMapEmpty!32043 (= (arr!27093 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9609)) mapDefault!32043)))))

(declare-fun b!935812 () Bool)

(declare-fun res!630154 () Bool)

(assert (=> b!935812 (=> (not res!630154) (not e!525476))))

(assert (=> b!935812 (= res!630154 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935813 () Bool)

(declare-fun res!630163 () Bool)

(assert (=> b!935813 (=> (not res!630163) (not e!525481))))

(assert (=> b!935813 (= res!630163 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27551 _keys!1487))))))

(declare-fun b!935814 () Bool)

(declare-fun res!630166 () Bool)

(assert (=> b!935814 (=> (not res!630166) (not e!525476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935814 (= res!630166 (validKeyInArray!0 k0!1099))))

(declare-fun b!935815 () Bool)

(declare-fun e!525477 () Bool)

(assert (=> b!935815 (= e!525477 true)))

(declare-fun lt!421842 () Bool)

(declare-datatypes ((List!19092 0))(
  ( (Nil!19089) (Cons!19088 (h!20234 (_ BitVec 64)) (t!27309 List!19092)) )
))
(declare-fun contains!5079 (List!19092 (_ BitVec 64)) Bool)

(assert (=> b!935815 (= lt!421842 (contains!5079 Nil!19089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935816 () Bool)

(declare-fun res!630162 () Bool)

(assert (=> b!935816 (=> (not res!630162) (not e!525481))))

(declare-fun arrayNoDuplicates!0 (array!56304 (_ BitVec 32) List!19092) Bool)

(assert (=> b!935816 (= res!630162 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19089))))

(declare-fun b!935817 () Bool)

(declare-fun e!525479 () Bool)

(assert (=> b!935817 (= e!525476 e!525479)))

(declare-fun res!630158 () Bool)

(assert (=> b!935817 (=> (not res!630158) (not e!525479))))

(declare-fun lt!421844 () (_ BitVec 64))

(assert (=> b!935817 (= res!630158 (validKeyInArray!0 lt!421844))))

(assert (=> b!935817 (= lt!421844 (select (arr!27092 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935818 () Bool)

(declare-fun res!630156 () Bool)

(assert (=> b!935818 (=> (not res!630156) (not e!525476))))

(declare-fun v!791 () V!31873)

(declare-fun apply!821 (ListLongMap!12007 (_ BitVec 64)) V!31873)

(assert (=> b!935818 (= res!630156 (= (apply!821 lt!421841 k0!1099) v!791))))

(declare-fun e!525482 () Bool)

(declare-fun b!935819 () Bool)

(declare-fun arrayContainsKey!0 (array!56304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935819 (= e!525482 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935820 () Bool)

(declare-fun res!630155 () Bool)

(assert (=> b!935820 (=> res!630155 e!525477)))

(declare-fun noDuplicate!1355 (List!19092) Bool)

(assert (=> b!935820 (= res!630155 (not (noDuplicate!1355 Nil!19089)))))

(declare-fun b!935821 () Bool)

(assert (=> b!935821 (= e!525479 (not e!525477))))

(declare-fun res!630161 () Bool)

(assert (=> b!935821 (=> res!630161 e!525477)))

(assert (=> b!935821 (= res!630161 (or (bvsge (size!27551 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27551 _keys!1487))))))

(assert (=> b!935821 e!525482))

(declare-fun c!97341 () Bool)

(assert (=> b!935821 (= c!97341 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31563 0))(
  ( (Unit!31564) )
))
(declare-fun lt!421843 () Unit!31563)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!286 (array!56304 array!56306 (_ BitVec 32) (_ BitVec 32) V!31873 V!31873 (_ BitVec 64) (_ BitVec 32) Int) Unit!31563)

(assert (=> b!935821 (= lt!421843 (lemmaListMapContainsThenArrayContainsFrom!286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!935821 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19089)))

(declare-fun lt!421846 () Unit!31563)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56304 (_ BitVec 32) (_ BitVec 32)) Unit!31563)

(assert (=> b!935821 (= lt!421846 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421839 () tuple2!13310)

(declare-fun +!2814 (ListLongMap!12007 tuple2!13310) ListLongMap!12007)

(assert (=> b!935821 (contains!5078 (+!2814 lt!421841 lt!421839) k0!1099)))

(declare-fun lt!421840 () Unit!31563)

(declare-fun lt!421845 () V!31873)

(declare-fun addStillContains!533 (ListLongMap!12007 (_ BitVec 64) V!31873 (_ BitVec 64)) Unit!31563)

(assert (=> b!935821 (= lt!421840 (addStillContains!533 lt!421841 lt!421844 lt!421845 k0!1099))))

(assert (=> b!935821 (= (getCurrentListMap!3256 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2814 (getCurrentListMap!3256 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421839))))

(assert (=> b!935821 (= lt!421839 (tuple2!13311 lt!421844 lt!421845))))

(declare-fun get!14276 (ValueCell!9609 V!31873) V!31873)

(declare-fun dynLambda!1603 (Int (_ BitVec 64)) V!31873)

(assert (=> b!935821 (= lt!421845 (get!14276 (select (arr!27093 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1603 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421847 () Unit!31563)

(declare-fun lemmaListMapRecursiveValidKeyArray!204 (array!56304 array!56306 (_ BitVec 32) (_ BitVec 32) V!31873 V!31873 (_ BitVec 32) Int) Unit!31563)

(assert (=> b!935821 (= lt!421847 (lemmaListMapRecursiveValidKeyArray!204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935822 () Bool)

(declare-fun res!630157 () Bool)

(assert (=> b!935822 (=> (not res!630157) (not e!525481))))

(assert (=> b!935822 (= res!630157 (and (= (size!27552 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27551 _keys!1487) (size!27552 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32043 () Bool)

(assert (=> mapIsEmpty!32043 mapRes!32043))

(declare-fun b!935823 () Bool)

(assert (=> b!935823 (= e!525482 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935824 () Bool)

(declare-fun res!630164 () Bool)

(assert (=> b!935824 (=> res!630164 e!525477)))

(assert (=> b!935824 (= res!630164 (contains!5079 Nil!19089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!79624 res!630159) b!935822))

(assert (= (and b!935822 res!630157) b!935810))

(assert (= (and b!935810 res!630165) b!935816))

(assert (= (and b!935816 res!630162) b!935813))

(assert (= (and b!935813 res!630163) b!935808))

(assert (= (and b!935808 res!630160) b!935818))

(assert (= (and b!935818 res!630156) b!935812))

(assert (= (and b!935812 res!630154) b!935814))

(assert (= (and b!935814 res!630166) b!935817))

(assert (= (and b!935817 res!630158) b!935821))

(assert (= (and b!935821 c!97341) b!935819))

(assert (= (and b!935821 (not c!97341)) b!935823))

(assert (= (and b!935821 (not res!630161)) b!935820))

(assert (= (and b!935820 (not res!630155)) b!935824))

(assert (= (and b!935824 (not res!630164)) b!935815))

(assert (= (and b!935811 condMapEmpty!32043) mapIsEmpty!32043))

(assert (= (and b!935811 (not condMapEmpty!32043)) mapNonEmpty!32043))

(get-info :version)

(assert (= (and mapNonEmpty!32043 ((_ is ValueCellFull!9609) mapValue!32043)) b!935807))

(assert (= (and b!935811 ((_ is ValueCellFull!9609) mapDefault!32043)) b!935809))

(assert (= start!79624 b!935811))

(declare-fun b_lambda!14079 () Bool)

(assert (=> (not b_lambda!14079) (not b!935821)))

(declare-fun t!27307 () Bool)

(declare-fun tb!6067 () Bool)

(assert (=> (and start!79624 (= defaultEntry!1235 defaultEntry!1235) t!27307) tb!6067))

(declare-fun result!11967 () Bool)

(assert (=> tb!6067 (= result!11967 tp_is_empty!20181)))

(assert (=> b!935821 t!27307))

(declare-fun b_and!28939 () Bool)

(assert (= b_and!28937 (and (=> t!27307 result!11967) b_and!28939)))

(declare-fun m!870323 () Bool)

(assert (=> b!935810 m!870323))

(declare-fun m!870325 () Bool)

(assert (=> start!79624 m!870325))

(declare-fun m!870327 () Bool)

(assert (=> start!79624 m!870327))

(declare-fun m!870329 () Bool)

(assert (=> start!79624 m!870329))

(declare-fun m!870331 () Bool)

(assert (=> b!935820 m!870331))

(declare-fun m!870333 () Bool)

(assert (=> mapNonEmpty!32043 m!870333))

(declare-fun m!870335 () Bool)

(assert (=> b!935816 m!870335))

(declare-fun m!870337 () Bool)

(assert (=> b!935821 m!870337))

(declare-fun m!870339 () Bool)

(assert (=> b!935821 m!870339))

(assert (=> b!935821 m!870337))

(declare-fun m!870341 () Bool)

(assert (=> b!935821 m!870341))

(declare-fun m!870343 () Bool)

(assert (=> b!935821 m!870343))

(declare-fun m!870345 () Bool)

(assert (=> b!935821 m!870345))

(declare-fun m!870347 () Bool)

(assert (=> b!935821 m!870347))

(assert (=> b!935821 m!870345))

(assert (=> b!935821 m!870347))

(declare-fun m!870349 () Bool)

(assert (=> b!935821 m!870349))

(declare-fun m!870351 () Bool)

(assert (=> b!935821 m!870351))

(declare-fun m!870353 () Bool)

(assert (=> b!935821 m!870353))

(declare-fun m!870355 () Bool)

(assert (=> b!935821 m!870355))

(declare-fun m!870357 () Bool)

(assert (=> b!935821 m!870357))

(declare-fun m!870359 () Bool)

(assert (=> b!935821 m!870359))

(assert (=> b!935821 m!870355))

(declare-fun m!870361 () Bool)

(assert (=> b!935821 m!870361))

(declare-fun m!870363 () Bool)

(assert (=> b!935818 m!870363))

(declare-fun m!870365 () Bool)

(assert (=> b!935817 m!870365))

(declare-fun m!870367 () Bool)

(assert (=> b!935817 m!870367))

(declare-fun m!870369 () Bool)

(assert (=> b!935815 m!870369))

(declare-fun m!870371 () Bool)

(assert (=> b!935819 m!870371))

(declare-fun m!870373 () Bool)

(assert (=> b!935814 m!870373))

(declare-fun m!870375 () Bool)

(assert (=> b!935824 m!870375))

(declare-fun m!870377 () Bool)

(assert (=> b!935808 m!870377))

(declare-fun m!870379 () Bool)

(assert (=> b!935808 m!870379))

(check-sat (not b!935808) (not b_next!17673) (not b!935814) (not b!935821) (not b!935817) (not b!935816) (not start!79624) tp_is_empty!20181 (not b!935810) (not b!935815) (not mapNonEmpty!32043) (not b!935819) (not b_lambda!14079) (not b!935818) b_and!28939 (not b!935824) (not b!935820))
(check-sat b_and!28939 (not b_next!17673))
