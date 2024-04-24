; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111760 () Bool)

(assert start!111760)

(declare-fun b_free!30193 () Bool)

(declare-fun b_next!30193 () Bool)

(assert (=> start!111760 (= b_free!30193 (not b_next!30193))))

(declare-fun tp!106054 () Bool)

(declare-fun b_and!48547 () Bool)

(assert (=> start!111760 (= tp!106054 b_and!48547)))

(declare-fun res!877014 () Bool)

(declare-fun e!754128 () Bool)

(assert (=> start!111760 (=> (not res!877014) (not e!754128))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111760 (= res!877014 (validMask!0 mask!2019))))

(assert (=> start!111760 e!754128))

(declare-datatypes ((array!89033 0))(
  ( (array!89034 (arr!42986 (Array (_ BitVec 32) (_ BitVec 64))) (size!43537 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89033)

(declare-fun array_inv!32729 (array!89033) Bool)

(assert (=> start!111760 (array_inv!32729 _keys!1609)))

(assert (=> start!111760 true))

(declare-fun tp_is_empty!36013 () Bool)

(assert (=> start!111760 tp_is_empty!36013))

(declare-datatypes ((V!53121 0))(
  ( (V!53122 (val!18081 Int)) )
))
(declare-datatypes ((ValueCell!17108 0))(
  ( (ValueCellFull!17108 (v!20706 V!53121)) (EmptyCell!17108) )
))
(declare-datatypes ((array!89035 0))(
  ( (array!89036 (arr!42987 (Array (_ BitVec 32) ValueCell!17108)) (size!43538 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89035)

(declare-fun e!754131 () Bool)

(declare-fun array_inv!32730 (array!89035) Bool)

(assert (=> start!111760 (and (array_inv!32730 _values!1337) e!754131)))

(assert (=> start!111760 tp!106054))

(declare-fun b!1321894 () Bool)

(declare-fun res!877011 () Bool)

(assert (=> b!1321894 (=> (not res!877011) (not e!754128))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1321894 (= res!877011 (and (= (size!43538 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43537 _keys!1609) (size!43538 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321895 () Bool)

(declare-fun res!877012 () Bool)

(assert (=> b!1321895 (=> (not res!877012) (not e!754128))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53121)

(declare-fun minValue!1279 () V!53121)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23318 0))(
  ( (tuple2!23319 (_1!11670 (_ BitVec 64)) (_2!11670 V!53121)) )
))
(declare-datatypes ((List!30473 0))(
  ( (Nil!30470) (Cons!30469 (h!31687 tuple2!23318) (t!44207 List!30473)) )
))
(declare-datatypes ((ListLongMap!20983 0))(
  ( (ListLongMap!20984 (toList!10507 List!30473)) )
))
(declare-fun contains!8674 (ListLongMap!20983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5503 (array!89033 array!89035 (_ BitVec 32) (_ BitVec 32) V!53121 V!53121 (_ BitVec 32) Int) ListLongMap!20983)

(assert (=> b!1321895 (= res!877012 (contains!8674 (getCurrentListMap!5503 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321896 () Bool)

(declare-fun res!877015 () Bool)

(assert (=> b!1321896 (=> (not res!877015) (not e!754128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321896 (= res!877015 (validKeyInArray!0 (select (arr!42986 _keys!1609) from!2000)))))

(declare-fun b!1321897 () Bool)

(declare-fun res!877013 () Bool)

(assert (=> b!1321897 (=> (not res!877013) (not e!754128))))

(declare-datatypes ((List!30474 0))(
  ( (Nil!30471) (Cons!30470 (h!31688 (_ BitVec 64)) (t!44208 List!30474)) )
))
(declare-fun arrayNoDuplicates!0 (array!89033 (_ BitVec 32) List!30474) Bool)

(assert (=> b!1321897 (= res!877013 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30471))))

(declare-fun b!1321898 () Bool)

(declare-fun e!754130 () Bool)

(assert (=> b!1321898 (= e!754130 tp_is_empty!36013)))

(declare-fun b!1321899 () Bool)

(assert (=> b!1321899 (= e!754128 (not true))))

(declare-fun lt!587481 () ListLongMap!20983)

(assert (=> b!1321899 (contains!8674 lt!587481 k0!1164)))

(declare-datatypes ((Unit!43467 0))(
  ( (Unit!43468) )
))
(declare-fun lt!587483 () Unit!43467)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!145 ((_ BitVec 64) (_ BitVec 64) V!53121 ListLongMap!20983) Unit!43467)

(assert (=> b!1321899 (= lt!587483 (lemmaInListMapAfterAddingDiffThenInBefore!145 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587481))))

(declare-fun lt!587482 () ListLongMap!20983)

(assert (=> b!1321899 (contains!8674 lt!587482 k0!1164)))

(declare-fun lt!587480 () Unit!43467)

(assert (=> b!1321899 (= lt!587480 (lemmaInListMapAfterAddingDiffThenInBefore!145 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587482))))

(declare-fun +!4590 (ListLongMap!20983 tuple2!23318) ListLongMap!20983)

(assert (=> b!1321899 (= lt!587482 (+!4590 lt!587481 (tuple2!23319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6229 (array!89033 array!89035 (_ BitVec 32) (_ BitVec 32) V!53121 V!53121 (_ BitVec 32) Int) ListLongMap!20983)

(declare-fun get!21649 (ValueCell!17108 V!53121) V!53121)

(declare-fun dynLambda!3544 (Int (_ BitVec 64)) V!53121)

(assert (=> b!1321899 (= lt!587481 (+!4590 (getCurrentListMapNoExtraKeys!6229 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23319 (select (arr!42986 _keys!1609) from!2000) (get!21649 (select (arr!42987 _values!1337) from!2000) (dynLambda!3544 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!55667 () Bool)

(declare-fun mapRes!55667 () Bool)

(assert (=> mapIsEmpty!55667 mapRes!55667))

(declare-fun b!1321900 () Bool)

(declare-fun e!754129 () Bool)

(assert (=> b!1321900 (= e!754131 (and e!754129 mapRes!55667))))

(declare-fun condMapEmpty!55667 () Bool)

(declare-fun mapDefault!55667 () ValueCell!17108)

(assert (=> b!1321900 (= condMapEmpty!55667 (= (arr!42987 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17108)) mapDefault!55667)))))

(declare-fun b!1321901 () Bool)

(declare-fun res!877018 () Bool)

(assert (=> b!1321901 (=> (not res!877018) (not e!754128))))

(assert (=> b!1321901 (= res!877018 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43537 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321902 () Bool)

(assert (=> b!1321902 (= e!754129 tp_is_empty!36013)))

(declare-fun mapNonEmpty!55667 () Bool)

(declare-fun tp!106055 () Bool)

(assert (=> mapNonEmpty!55667 (= mapRes!55667 (and tp!106055 e!754130))))

(declare-fun mapRest!55667 () (Array (_ BitVec 32) ValueCell!17108))

(declare-fun mapValue!55667 () ValueCell!17108)

(declare-fun mapKey!55667 () (_ BitVec 32))

(assert (=> mapNonEmpty!55667 (= (arr!42987 _values!1337) (store mapRest!55667 mapKey!55667 mapValue!55667))))

(declare-fun b!1321903 () Bool)

(declare-fun res!877016 () Bool)

(assert (=> b!1321903 (=> (not res!877016) (not e!754128))))

(assert (=> b!1321903 (= res!877016 (not (= (select (arr!42986 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321904 () Bool)

(declare-fun res!877017 () Bool)

(assert (=> b!1321904 (=> (not res!877017) (not e!754128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89033 (_ BitVec 32)) Bool)

(assert (=> b!1321904 (= res!877017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111760 res!877014) b!1321894))

(assert (= (and b!1321894 res!877011) b!1321904))

(assert (= (and b!1321904 res!877017) b!1321897))

(assert (= (and b!1321897 res!877013) b!1321901))

(assert (= (and b!1321901 res!877018) b!1321895))

(assert (= (and b!1321895 res!877012) b!1321903))

(assert (= (and b!1321903 res!877016) b!1321896))

(assert (= (and b!1321896 res!877015) b!1321899))

(assert (= (and b!1321900 condMapEmpty!55667) mapIsEmpty!55667))

(assert (= (and b!1321900 (not condMapEmpty!55667)) mapNonEmpty!55667))

(get-info :version)

(assert (= (and mapNonEmpty!55667 ((_ is ValueCellFull!17108) mapValue!55667)) b!1321898))

(assert (= (and b!1321900 ((_ is ValueCellFull!17108) mapDefault!55667)) b!1321902))

(assert (= start!111760 b!1321900))

(declare-fun b_lambda!23513 () Bool)

(assert (=> (not b_lambda!23513) (not b!1321899)))

(declare-fun t!44206 () Bool)

(declare-fun tb!11537 () Bool)

(assert (=> (and start!111760 (= defaultEntry!1340 defaultEntry!1340) t!44206) tb!11537))

(declare-fun result!24137 () Bool)

(assert (=> tb!11537 (= result!24137 tp_is_empty!36013)))

(assert (=> b!1321899 t!44206))

(declare-fun b_and!48549 () Bool)

(assert (= b_and!48547 (and (=> t!44206 result!24137) b_and!48549)))

(declare-fun m!1209929 () Bool)

(assert (=> b!1321903 m!1209929))

(declare-fun m!1209931 () Bool)

(assert (=> mapNonEmpty!55667 m!1209931))

(declare-fun m!1209933 () Bool)

(assert (=> b!1321904 m!1209933))

(declare-fun m!1209935 () Bool)

(assert (=> b!1321899 m!1209935))

(declare-fun m!1209937 () Bool)

(assert (=> b!1321899 m!1209937))

(declare-fun m!1209939 () Bool)

(assert (=> b!1321899 m!1209939))

(assert (=> b!1321899 m!1209937))

(declare-fun m!1209941 () Bool)

(assert (=> b!1321899 m!1209941))

(declare-fun m!1209943 () Bool)

(assert (=> b!1321899 m!1209943))

(declare-fun m!1209945 () Bool)

(assert (=> b!1321899 m!1209945))

(declare-fun m!1209947 () Bool)

(assert (=> b!1321899 m!1209947))

(declare-fun m!1209949 () Bool)

(assert (=> b!1321899 m!1209949))

(assert (=> b!1321899 m!1209939))

(declare-fun m!1209951 () Bool)

(assert (=> b!1321899 m!1209951))

(assert (=> b!1321899 m!1209929))

(assert (=> b!1321899 m!1209949))

(declare-fun m!1209953 () Bool)

(assert (=> b!1321899 m!1209953))

(declare-fun m!1209955 () Bool)

(assert (=> start!111760 m!1209955))

(declare-fun m!1209957 () Bool)

(assert (=> start!111760 m!1209957))

(declare-fun m!1209959 () Bool)

(assert (=> start!111760 m!1209959))

(declare-fun m!1209961 () Bool)

(assert (=> b!1321895 m!1209961))

(assert (=> b!1321895 m!1209961))

(declare-fun m!1209963 () Bool)

(assert (=> b!1321895 m!1209963))

(assert (=> b!1321896 m!1209929))

(assert (=> b!1321896 m!1209929))

(declare-fun m!1209965 () Bool)

(assert (=> b!1321896 m!1209965))

(declare-fun m!1209967 () Bool)

(assert (=> b!1321897 m!1209967))

(check-sat (not b_next!30193) (not b!1321904) tp_is_empty!36013 (not b!1321895) (not mapNonEmpty!55667) (not b_lambda!23513) (not b!1321897) (not start!111760) (not b!1321896) b_and!48549 (not b!1321899))
(check-sat b_and!48549 (not b_next!30193))
