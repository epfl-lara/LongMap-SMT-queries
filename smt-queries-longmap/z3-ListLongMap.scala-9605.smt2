; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113552 () Bool)

(assert start!113552)

(declare-fun b_free!31545 () Bool)

(declare-fun b_next!31545 () Bool)

(assert (=> start!113552 (= b_free!31545 (not b_next!31545))))

(declare-fun tp!110444 () Bool)

(declare-fun b_and!50879 () Bool)

(assert (=> start!113552 (= tp!110444 b_and!50879)))

(declare-fun mapIsEmpty!58028 () Bool)

(declare-fun mapRes!58028 () Bool)

(assert (=> mapIsEmpty!58028 mapRes!58028))

(declare-fun b!1347997 () Bool)

(declare-fun e!766892 () Bool)

(declare-fun e!766889 () Bool)

(assert (=> b!1347997 (= e!766892 (and e!766889 mapRes!58028))))

(declare-fun condMapEmpty!58028 () Bool)

(declare-datatypes ((V!55163 0))(
  ( (V!55164 (val!18847 Int)) )
))
(declare-datatypes ((ValueCell!17874 0))(
  ( (ValueCellFull!17874 (v!21498 V!55163)) (EmptyCell!17874) )
))
(declare-datatypes ((array!91920 0))(
  ( (array!91921 (arr!44415 (Array (_ BitVec 32) ValueCell!17874)) (size!44965 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91920)

(declare-fun mapDefault!58028 () ValueCell!17874)

(assert (=> b!1347997 (= condMapEmpty!58028 (= (arr!44415 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17874)) mapDefault!58028)))))

(declare-fun b!1347998 () Bool)

(declare-fun res!894415 () Bool)

(declare-fun e!766888 () Bool)

(assert (=> b!1347998 (=> (not res!894415) (not e!766888))))

(declare-datatypes ((array!91922 0))(
  ( (array!91923 (arr!44416 (Array (_ BitVec 32) (_ BitVec 64))) (size!44966 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91922)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347998 (= res!894415 (validKeyInArray!0 (select (arr!44416 _keys!1571) from!1960)))))

(declare-fun res!894413 () Bool)

(assert (=> start!113552 (=> (not res!894413) (not e!766888))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113552 (= res!894413 (validMask!0 mask!1977))))

(assert (=> start!113552 e!766888))

(declare-fun tp_is_empty!37545 () Bool)

(assert (=> start!113552 tp_is_empty!37545))

(assert (=> start!113552 true))

(declare-fun array_inv!33461 (array!91922) Bool)

(assert (=> start!113552 (array_inv!33461 _keys!1571)))

(declare-fun array_inv!33462 (array!91920) Bool)

(assert (=> start!113552 (and (array_inv!33462 _values!1303) e!766892)))

(assert (=> start!113552 tp!110444))

(declare-fun mapNonEmpty!58028 () Bool)

(declare-fun tp!110443 () Bool)

(declare-fun e!766890 () Bool)

(assert (=> mapNonEmpty!58028 (= mapRes!58028 (and tp!110443 e!766890))))

(declare-fun mapRest!58028 () (Array (_ BitVec 32) ValueCell!17874))

(declare-fun mapValue!58028 () ValueCell!17874)

(declare-fun mapKey!58028 () (_ BitVec 32))

(assert (=> mapNonEmpty!58028 (= (arr!44415 _values!1303) (store mapRest!58028 mapKey!58028 mapValue!58028))))

(declare-fun b!1347999 () Bool)

(declare-fun res!894414 () Bool)

(assert (=> b!1347999 (=> (not res!894414) (not e!766888))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347999 (= res!894414 (and (= (size!44965 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44966 _keys!1571) (size!44965 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348000 () Bool)

(declare-fun res!894418 () Bool)

(assert (=> b!1348000 (=> (not res!894418) (not e!766888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91922 (_ BitVec 32)) Bool)

(assert (=> b!1348000 (= res!894418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348001 () Bool)

(assert (=> b!1348001 (= e!766890 tp_is_empty!37545)))

(declare-fun b!1348002 () Bool)

(assert (=> b!1348002 (= e!766889 tp_is_empty!37545)))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun b!1348003 () Bool)

(assert (=> b!1348003 (= e!766888 (not (not (= k0!1142 (select (arr!44416 _keys!1571) from!1960)))))))

(declare-datatypes ((tuple2!24298 0))(
  ( (tuple2!24299 (_1!12160 (_ BitVec 64)) (_2!12160 V!55163)) )
))
(declare-datatypes ((List!31453 0))(
  ( (Nil!31450) (Cons!31449 (h!32658 tuple2!24298) (t!46077 List!31453)) )
))
(declare-datatypes ((ListLongMap!21955 0))(
  ( (ListLongMap!21956 (toList!10993 List!31453)) )
))
(declare-fun lt!595893 () ListLongMap!21955)

(declare-fun contains!9171 (ListLongMap!21955 (_ BitVec 64)) Bool)

(assert (=> b!1348003 (contains!9171 lt!595893 k0!1142)))

(declare-fun zeroValue!1245 () V!55163)

(declare-datatypes ((Unit!44166 0))(
  ( (Unit!44167) )
))
(declare-fun lt!595894 () Unit!44166)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!406 ((_ BitVec 64) (_ BitVec 64) V!55163 ListLongMap!21955) Unit!44166)

(assert (=> b!1348003 (= lt!595894 (lemmaInListMapAfterAddingDiffThenInBefore!406 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595893))))

(declare-fun minValue!1245 () V!55163)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4845 (ListLongMap!21955 tuple2!24298) ListLongMap!21955)

(declare-fun getCurrentListMapNoExtraKeys!6491 (array!91922 array!91920 (_ BitVec 32) (_ BitVec 32) V!55163 V!55163 (_ BitVec 32) Int) ListLongMap!21955)

(declare-fun get!22435 (ValueCell!17874 V!55163) V!55163)

(declare-fun dynLambda!3784 (Int (_ BitVec 64)) V!55163)

(assert (=> b!1348003 (= lt!595893 (+!4845 (getCurrentListMapNoExtraKeys!6491 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24299 (select (arr!44416 _keys!1571) from!1960) (get!22435 (select (arr!44415 _values!1303) from!1960) (dynLambda!3784 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348004 () Bool)

(declare-fun res!894419 () Bool)

(assert (=> b!1348004 (=> (not res!894419) (not e!766888))))

(declare-fun getCurrentListMap!5943 (array!91922 array!91920 (_ BitVec 32) (_ BitVec 32) V!55163 V!55163 (_ BitVec 32) Int) ListLongMap!21955)

(assert (=> b!1348004 (= res!894419 (contains!9171 (getCurrentListMap!5943 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348005 () Bool)

(declare-fun res!894412 () Bool)

(assert (=> b!1348005 (=> (not res!894412) (not e!766888))))

(assert (=> b!1348005 (= res!894412 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44966 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348006 () Bool)

(declare-fun res!894417 () Bool)

(assert (=> b!1348006 (=> (not res!894417) (not e!766888))))

(declare-datatypes ((List!31454 0))(
  ( (Nil!31451) (Cons!31450 (h!32659 (_ BitVec 64)) (t!46078 List!31454)) )
))
(declare-fun arrayNoDuplicates!0 (array!91922 (_ BitVec 32) List!31454) Bool)

(assert (=> b!1348006 (= res!894417 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31451))))

(declare-fun b!1348007 () Bool)

(declare-fun res!894416 () Bool)

(assert (=> b!1348007 (=> (not res!894416) (not e!766888))))

(assert (=> b!1348007 (= res!894416 (not (= (select (arr!44416 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348008 () Bool)

(declare-fun res!894411 () Bool)

(assert (=> b!1348008 (=> (not res!894411) (not e!766888))))

(assert (=> b!1348008 (= res!894411 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113552 res!894413) b!1347999))

(assert (= (and b!1347999 res!894414) b!1348000))

(assert (= (and b!1348000 res!894418) b!1348006))

(assert (= (and b!1348006 res!894417) b!1348005))

(assert (= (and b!1348005 res!894412) b!1348004))

(assert (= (and b!1348004 res!894419) b!1348007))

(assert (= (and b!1348007 res!894416) b!1347998))

(assert (= (and b!1347998 res!894415) b!1348008))

(assert (= (and b!1348008 res!894411) b!1348003))

(assert (= (and b!1347997 condMapEmpty!58028) mapIsEmpty!58028))

(assert (= (and b!1347997 (not condMapEmpty!58028)) mapNonEmpty!58028))

(get-info :version)

(assert (= (and mapNonEmpty!58028 ((_ is ValueCellFull!17874) mapValue!58028)) b!1348001))

(assert (= (and b!1347997 ((_ is ValueCellFull!17874) mapDefault!58028)) b!1348002))

(assert (= start!113552 b!1347997))

(declare-fun b_lambda!24619 () Bool)

(assert (=> (not b_lambda!24619) (not b!1348003)))

(declare-fun t!46076 () Bool)

(declare-fun tb!12427 () Bool)

(assert (=> (and start!113552 (= defaultEntry!1306 defaultEntry!1306) t!46076) tb!12427))

(declare-fun result!25947 () Bool)

(assert (=> tb!12427 (= result!25947 tp_is_empty!37545)))

(assert (=> b!1348003 t!46076))

(declare-fun b_and!50881 () Bool)

(assert (= b_and!50879 (and (=> t!46076 result!25947) b_and!50881)))

(declare-fun m!1235025 () Bool)

(assert (=> b!1348007 m!1235025))

(declare-fun m!1235027 () Bool)

(assert (=> b!1348006 m!1235027))

(declare-fun m!1235029 () Bool)

(assert (=> b!1348000 m!1235029))

(assert (=> b!1347998 m!1235025))

(assert (=> b!1347998 m!1235025))

(declare-fun m!1235031 () Bool)

(assert (=> b!1347998 m!1235031))

(declare-fun m!1235033 () Bool)

(assert (=> start!113552 m!1235033))

(declare-fun m!1235035 () Bool)

(assert (=> start!113552 m!1235035))

(declare-fun m!1235037 () Bool)

(assert (=> start!113552 m!1235037))

(declare-fun m!1235039 () Bool)

(assert (=> mapNonEmpty!58028 m!1235039))

(declare-fun m!1235041 () Bool)

(assert (=> b!1348003 m!1235041))

(declare-fun m!1235043 () Bool)

(assert (=> b!1348003 m!1235043))

(declare-fun m!1235045 () Bool)

(assert (=> b!1348003 m!1235045))

(declare-fun m!1235047 () Bool)

(assert (=> b!1348003 m!1235047))

(assert (=> b!1348003 m!1235041))

(declare-fun m!1235049 () Bool)

(assert (=> b!1348003 m!1235049))

(assert (=> b!1348003 m!1235043))

(declare-fun m!1235051 () Bool)

(assert (=> b!1348003 m!1235051))

(assert (=> b!1348003 m!1235045))

(declare-fun m!1235053 () Bool)

(assert (=> b!1348003 m!1235053))

(assert (=> b!1348003 m!1235025))

(declare-fun m!1235055 () Bool)

(assert (=> b!1348004 m!1235055))

(assert (=> b!1348004 m!1235055))

(declare-fun m!1235057 () Bool)

(assert (=> b!1348004 m!1235057))

(check-sat tp_is_empty!37545 (not b_next!31545) (not mapNonEmpty!58028) (not start!113552) (not b!1348000) (not b_lambda!24619) (not b!1348004) b_and!50881 (not b!1348006) (not b!1347998) (not b!1348003))
(check-sat b_and!50881 (not b_next!31545))
