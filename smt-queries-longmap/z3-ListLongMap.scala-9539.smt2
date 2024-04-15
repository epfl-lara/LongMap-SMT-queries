; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113096 () Bool)

(assert start!113096)

(declare-fun b_free!31147 () Bool)

(declare-fun b_next!31147 () Bool)

(assert (=> start!113096 (= b_free!31147 (not b_next!31147))))

(declare-fun tp!109247 () Bool)

(declare-fun b_and!50183 () Bool)

(assert (=> start!113096 (= tp!109247 b_and!50183)))

(declare-fun b!1340617 () Bool)

(declare-fun e!763546 () Bool)

(declare-fun tp_is_empty!37147 () Bool)

(assert (=> b!1340617 (= e!763546 tp_is_empty!37147)))

(declare-fun b!1340618 () Bool)

(declare-fun res!889353 () Bool)

(declare-fun e!763550 () Bool)

(assert (=> b!1340618 (=> (not res!889353) (not e!763550))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340618 (= res!889353 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340619 () Bool)

(declare-fun e!763549 () Bool)

(assert (=> b!1340619 (= e!763549 tp_is_empty!37147)))

(declare-fun b!1340620 () Bool)

(declare-fun res!889352 () Bool)

(assert (=> b!1340620 (=> (not res!889352) (not e!763550))))

(declare-datatypes ((V!54633 0))(
  ( (V!54634 (val!18648 Int)) )
))
(declare-fun minValue!1245 () V!54633)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91089 0))(
  ( (array!91090 (arr!44001 (Array (_ BitVec 32) (_ BitVec 64))) (size!44553 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91089)

(declare-fun zeroValue!1245 () V!54633)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17675 0))(
  ( (ValueCellFull!17675 (v!21295 V!54633)) (EmptyCell!17675) )
))
(declare-datatypes ((array!91091 0))(
  ( (array!91092 (arr!44002 (Array (_ BitVec 32) ValueCell!17675)) (size!44554 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91091)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24060 0))(
  ( (tuple2!24061 (_1!12041 (_ BitVec 64)) (_2!12041 V!54633)) )
))
(declare-datatypes ((List!31211 0))(
  ( (Nil!31208) (Cons!31207 (h!32416 tuple2!24060) (t!45561 List!31211)) )
))
(declare-datatypes ((ListLongMap!21717 0))(
  ( (ListLongMap!21718 (toList!10874 List!31211)) )
))
(declare-fun contains!8979 (ListLongMap!21717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5727 (array!91089 array!91091 (_ BitVec 32) (_ BitVec 32) V!54633 V!54633 (_ BitVec 32) Int) ListLongMap!21717)

(assert (=> b!1340620 (= res!889352 (contains!8979 (getCurrentListMap!5727 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340621 () Bool)

(declare-fun res!889360 () Bool)

(assert (=> b!1340621 (=> (not res!889360) (not e!763550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91089 (_ BitVec 32)) Bool)

(assert (=> b!1340621 (= res!889360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340622 () Bool)

(assert (=> b!1340622 (= e!763550 (not true))))

(declare-fun lt!593840 () ListLongMap!21717)

(assert (=> b!1340622 (contains!8979 lt!593840 k0!1142)))

(declare-datatypes ((Unit!43806 0))(
  ( (Unit!43807) )
))
(declare-fun lt!593841 () Unit!43806)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!321 ((_ BitVec 64) (_ BitVec 64) V!54633 ListLongMap!21717) Unit!43806)

(assert (=> b!1340622 (= lt!593841 (lemmaInListMapAfterAddingDiffThenInBefore!321 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593840))))

(declare-fun +!4782 (ListLongMap!21717 tuple2!24060) ListLongMap!21717)

(declare-fun getCurrentListMapNoExtraKeys!6425 (array!91089 array!91091 (_ BitVec 32) (_ BitVec 32) V!54633 V!54633 (_ BitVec 32) Int) ListLongMap!21717)

(declare-fun get!22204 (ValueCell!17675 V!54633) V!54633)

(declare-fun dynLambda!3712 (Int (_ BitVec 64)) V!54633)

(assert (=> b!1340622 (= lt!593840 (+!4782 (getCurrentListMapNoExtraKeys!6425 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24061 (select (arr!44001 _keys!1571) from!1960) (get!22204 (select (arr!44002 _values!1303) from!1960) (dynLambda!3712 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340623 () Bool)

(declare-fun e!763547 () Bool)

(declare-fun mapRes!57427 () Bool)

(assert (=> b!1340623 (= e!763547 (and e!763549 mapRes!57427))))

(declare-fun condMapEmpty!57427 () Bool)

(declare-fun mapDefault!57427 () ValueCell!17675)

(assert (=> b!1340623 (= condMapEmpty!57427 (= (arr!44002 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17675)) mapDefault!57427)))))

(declare-fun b!1340624 () Bool)

(declare-fun res!889355 () Bool)

(assert (=> b!1340624 (=> (not res!889355) (not e!763550))))

(assert (=> b!1340624 (= res!889355 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44553 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57427 () Bool)

(assert (=> mapIsEmpty!57427 mapRes!57427))

(declare-fun b!1340625 () Bool)

(declare-fun res!889357 () Bool)

(assert (=> b!1340625 (=> (not res!889357) (not e!763550))))

(declare-datatypes ((List!31212 0))(
  ( (Nil!31209) (Cons!31208 (h!32417 (_ BitVec 64)) (t!45562 List!31212)) )
))
(declare-fun arrayNoDuplicates!0 (array!91089 (_ BitVec 32) List!31212) Bool)

(assert (=> b!1340625 (= res!889357 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31209))))

(declare-fun b!1340626 () Bool)

(declare-fun res!889359 () Bool)

(assert (=> b!1340626 (=> (not res!889359) (not e!763550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340626 (= res!889359 (validKeyInArray!0 (select (arr!44001 _keys!1571) from!1960)))))

(declare-fun b!1340627 () Bool)

(declare-fun res!889358 () Bool)

(assert (=> b!1340627 (=> (not res!889358) (not e!763550))))

(assert (=> b!1340627 (= res!889358 (and (= (size!44554 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44553 _keys!1571) (size!44554 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340628 () Bool)

(declare-fun res!889354 () Bool)

(assert (=> b!1340628 (=> (not res!889354) (not e!763550))))

(assert (=> b!1340628 (= res!889354 (not (= (select (arr!44001 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!889356 () Bool)

(assert (=> start!113096 (=> (not res!889356) (not e!763550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113096 (= res!889356 (validMask!0 mask!1977))))

(assert (=> start!113096 e!763550))

(assert (=> start!113096 tp_is_empty!37147))

(assert (=> start!113096 true))

(declare-fun array_inv!33367 (array!91089) Bool)

(assert (=> start!113096 (array_inv!33367 _keys!1571)))

(declare-fun array_inv!33368 (array!91091) Bool)

(assert (=> start!113096 (and (array_inv!33368 _values!1303) e!763547)))

(assert (=> start!113096 tp!109247))

(declare-fun mapNonEmpty!57427 () Bool)

(declare-fun tp!109246 () Bool)

(assert (=> mapNonEmpty!57427 (= mapRes!57427 (and tp!109246 e!763546))))

(declare-fun mapKey!57427 () (_ BitVec 32))

(declare-fun mapValue!57427 () ValueCell!17675)

(declare-fun mapRest!57427 () (Array (_ BitVec 32) ValueCell!17675))

(assert (=> mapNonEmpty!57427 (= (arr!44002 _values!1303) (store mapRest!57427 mapKey!57427 mapValue!57427))))

(assert (= (and start!113096 res!889356) b!1340627))

(assert (= (and b!1340627 res!889358) b!1340621))

(assert (= (and b!1340621 res!889360) b!1340625))

(assert (= (and b!1340625 res!889357) b!1340624))

(assert (= (and b!1340624 res!889355) b!1340620))

(assert (= (and b!1340620 res!889352) b!1340628))

(assert (= (and b!1340628 res!889354) b!1340626))

(assert (= (and b!1340626 res!889359) b!1340618))

(assert (= (and b!1340618 res!889353) b!1340622))

(assert (= (and b!1340623 condMapEmpty!57427) mapIsEmpty!57427))

(assert (= (and b!1340623 (not condMapEmpty!57427)) mapNonEmpty!57427))

(get-info :version)

(assert (= (and mapNonEmpty!57427 ((_ is ValueCellFull!17675) mapValue!57427)) b!1340617))

(assert (= (and b!1340623 ((_ is ValueCellFull!17675) mapDefault!57427)) b!1340619))

(assert (= start!113096 b!1340623))

(declare-fun b_lambda!24313 () Bool)

(assert (=> (not b_lambda!24313) (not b!1340622)))

(declare-fun t!45560 () Bool)

(declare-fun tb!12153 () Bool)

(assert (=> (and start!113096 (= defaultEntry!1306 defaultEntry!1306) t!45560) tb!12153))

(declare-fun result!25405 () Bool)

(assert (=> tb!12153 (= result!25405 tp_is_empty!37147)))

(assert (=> b!1340622 t!45560))

(declare-fun b_and!50185 () Bool)

(assert (= b_and!50183 (and (=> t!45560 result!25405) b_and!50185)))

(declare-fun m!1227901 () Bool)

(assert (=> b!1340626 m!1227901))

(assert (=> b!1340626 m!1227901))

(declare-fun m!1227903 () Bool)

(assert (=> b!1340626 m!1227903))

(declare-fun m!1227905 () Bool)

(assert (=> mapNonEmpty!57427 m!1227905))

(declare-fun m!1227907 () Bool)

(assert (=> start!113096 m!1227907))

(declare-fun m!1227909 () Bool)

(assert (=> start!113096 m!1227909))

(declare-fun m!1227911 () Bool)

(assert (=> start!113096 m!1227911))

(assert (=> b!1340628 m!1227901))

(declare-fun m!1227913 () Bool)

(assert (=> b!1340621 m!1227913))

(declare-fun m!1227915 () Bool)

(assert (=> b!1340620 m!1227915))

(assert (=> b!1340620 m!1227915))

(declare-fun m!1227917 () Bool)

(assert (=> b!1340620 m!1227917))

(declare-fun m!1227919 () Bool)

(assert (=> b!1340625 m!1227919))

(declare-fun m!1227921 () Bool)

(assert (=> b!1340622 m!1227921))

(declare-fun m!1227923 () Bool)

(assert (=> b!1340622 m!1227923))

(declare-fun m!1227925 () Bool)

(assert (=> b!1340622 m!1227925))

(declare-fun m!1227927 () Bool)

(assert (=> b!1340622 m!1227927))

(declare-fun m!1227929 () Bool)

(assert (=> b!1340622 m!1227929))

(declare-fun m!1227931 () Bool)

(assert (=> b!1340622 m!1227931))

(assert (=> b!1340622 m!1227921))

(declare-fun m!1227933 () Bool)

(assert (=> b!1340622 m!1227933))

(assert (=> b!1340622 m!1227925))

(assert (=> b!1340622 m!1227927))

(assert (=> b!1340622 m!1227901))

(check-sat (not b_next!31147) tp_is_empty!37147 (not start!113096) (not b!1340621) (not b!1340625) b_and!50185 (not mapNonEmpty!57427) (not b_lambda!24313) (not b!1340626) (not b!1340622) (not b!1340620))
(check-sat b_and!50185 (not b_next!31147))
