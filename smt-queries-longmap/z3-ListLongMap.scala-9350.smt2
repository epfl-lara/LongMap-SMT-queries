; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111538 () Bool)

(assert start!111538)

(declare-fun b_free!30195 () Bool)

(declare-fun b_next!30195 () Bool)

(assert (=> start!111538 (= b_free!30195 (not b_next!30195))))

(declare-fun tp!106060 () Bool)

(declare-fun b_and!48549 () Bool)

(assert (=> start!111538 (= tp!106060 b_and!48549)))

(declare-fun b!1320630 () Bool)

(declare-fun res!876518 () Bool)

(declare-fun e!753303 () Bool)

(assert (=> b!1320630 (=> (not res!876518) (not e!753303))))

(declare-datatypes ((array!88960 0))(
  ( (array!88961 (arr!42954 (Array (_ BitVec 32) (_ BitVec 64))) (size!43504 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88960)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320630 (= res!876518 (validKeyInArray!0 (select (arr!42954 _keys!1609) from!2000)))))

(declare-fun b!1320631 () Bool)

(declare-fun e!753301 () Bool)

(declare-fun tp_is_empty!36015 () Bool)

(assert (=> b!1320631 (= e!753301 tp_is_empty!36015)))

(declare-fun b!1320632 () Bool)

(declare-fun res!876517 () Bool)

(assert (=> b!1320632 (=> (not res!876517) (not e!753303))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53123 0))(
  ( (V!53124 (val!18082 Int)) )
))
(declare-datatypes ((ValueCell!17109 0))(
  ( (ValueCellFull!17109 (v!20712 V!53123)) (EmptyCell!17109) )
))
(declare-datatypes ((array!88962 0))(
  ( (array!88963 (arr!42955 (Array (_ BitVec 32) ValueCell!17109)) (size!43505 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88962)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320632 (= res!876517 (and (= (size!43505 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43504 _keys!1609) (size!43505 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320633 () Bool)

(assert (=> b!1320633 (= e!753303 (not true))))

(declare-datatypes ((tuple2!23284 0))(
  ( (tuple2!23285 (_1!11653 (_ BitVec 64)) (_2!11653 V!53123)) )
))
(declare-datatypes ((List!30434 0))(
  ( (Nil!30431) (Cons!30430 (h!31639 tuple2!23284) (t!44178 List!30434)) )
))
(declare-datatypes ((ListLongMap!20941 0))(
  ( (ListLongMap!20942 (toList!10486 List!30434)) )
))
(declare-fun lt!587018 () ListLongMap!20941)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8641 (ListLongMap!20941 (_ BitVec 64)) Bool)

(assert (=> b!1320633 (contains!8641 lt!587018 k0!1164)))

(declare-fun zeroValue!1279 () V!53123)

(declare-datatypes ((Unit!43510 0))(
  ( (Unit!43511) )
))
(declare-fun lt!587016 () Unit!43510)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!141 ((_ BitVec 64) (_ BitVec 64) V!53123 ListLongMap!20941) Unit!43510)

(assert (=> b!1320633 (= lt!587016 (lemmaInListMapAfterAddingDiffThenInBefore!141 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587018))))

(declare-fun lt!587019 () ListLongMap!20941)

(assert (=> b!1320633 (contains!8641 lt!587019 k0!1164)))

(declare-fun minValue!1279 () V!53123)

(declare-fun lt!587017 () Unit!43510)

(assert (=> b!1320633 (= lt!587017 (lemmaInListMapAfterAddingDiffThenInBefore!141 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587019))))

(declare-fun +!4545 (ListLongMap!20941 tuple2!23284) ListLongMap!20941)

(assert (=> b!1320633 (= lt!587019 (+!4545 lt!587018 (tuple2!23285 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6180 (array!88960 array!88962 (_ BitVec 32) (_ BitVec 32) V!53123 V!53123 (_ BitVec 32) Int) ListLongMap!20941)

(declare-fun get!21601 (ValueCell!17109 V!53123) V!53123)

(declare-fun dynLambda!3484 (Int (_ BitVec 64)) V!53123)

(assert (=> b!1320633 (= lt!587018 (+!4545 (getCurrentListMapNoExtraKeys!6180 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23285 (select (arr!42954 _keys!1609) from!2000) (get!21601 (select (arr!42955 _values!1337) from!2000) (dynLambda!3484 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!55670 () Bool)

(declare-fun mapRes!55670 () Bool)

(declare-fun tp!106061 () Bool)

(declare-fun e!753300 () Bool)

(assert (=> mapNonEmpty!55670 (= mapRes!55670 (and tp!106061 e!753300))))

(declare-fun mapKey!55670 () (_ BitVec 32))

(declare-fun mapValue!55670 () ValueCell!17109)

(declare-fun mapRest!55670 () (Array (_ BitVec 32) ValueCell!17109))

(assert (=> mapNonEmpty!55670 (= (arr!42955 _values!1337) (store mapRest!55670 mapKey!55670 mapValue!55670))))

(declare-fun mapIsEmpty!55670 () Bool)

(assert (=> mapIsEmpty!55670 mapRes!55670))

(declare-fun b!1320634 () Bool)

(declare-fun res!876521 () Bool)

(assert (=> b!1320634 (=> (not res!876521) (not e!753303))))

(assert (=> b!1320634 (= res!876521 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43504 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320635 () Bool)

(assert (=> b!1320635 (= e!753300 tp_is_empty!36015)))

(declare-fun b!1320637 () Bool)

(declare-fun res!876524 () Bool)

(assert (=> b!1320637 (=> (not res!876524) (not e!753303))))

(declare-datatypes ((List!30435 0))(
  ( (Nil!30432) (Cons!30431 (h!31640 (_ BitVec 64)) (t!44179 List!30435)) )
))
(declare-fun arrayNoDuplicates!0 (array!88960 (_ BitVec 32) List!30435) Bool)

(assert (=> b!1320637 (= res!876524 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30432))))

(declare-fun b!1320638 () Bool)

(declare-fun e!753302 () Bool)

(assert (=> b!1320638 (= e!753302 (and e!753301 mapRes!55670))))

(declare-fun condMapEmpty!55670 () Bool)

(declare-fun mapDefault!55670 () ValueCell!17109)

(assert (=> b!1320638 (= condMapEmpty!55670 (= (arr!42955 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17109)) mapDefault!55670)))))

(declare-fun b!1320639 () Bool)

(declare-fun res!876522 () Bool)

(assert (=> b!1320639 (=> (not res!876522) (not e!753303))))

(declare-fun getCurrentListMap!5490 (array!88960 array!88962 (_ BitVec 32) (_ BitVec 32) V!53123 V!53123 (_ BitVec 32) Int) ListLongMap!20941)

(assert (=> b!1320639 (= res!876522 (contains!8641 (getCurrentListMap!5490 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320640 () Bool)

(declare-fun res!876519 () Bool)

(assert (=> b!1320640 (=> (not res!876519) (not e!753303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88960 (_ BitVec 32)) Bool)

(assert (=> b!1320640 (= res!876519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320636 () Bool)

(declare-fun res!876520 () Bool)

(assert (=> b!1320636 (=> (not res!876520) (not e!753303))))

(assert (=> b!1320636 (= res!876520 (not (= (select (arr!42954 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!876523 () Bool)

(assert (=> start!111538 (=> (not res!876523) (not e!753303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111538 (= res!876523 (validMask!0 mask!2019))))

(assert (=> start!111538 e!753303))

(declare-fun array_inv!32429 (array!88960) Bool)

(assert (=> start!111538 (array_inv!32429 _keys!1609)))

(assert (=> start!111538 true))

(assert (=> start!111538 tp_is_empty!36015))

(declare-fun array_inv!32430 (array!88962) Bool)

(assert (=> start!111538 (and (array_inv!32430 _values!1337) e!753302)))

(assert (=> start!111538 tp!106060))

(assert (= (and start!111538 res!876523) b!1320632))

(assert (= (and b!1320632 res!876517) b!1320640))

(assert (= (and b!1320640 res!876519) b!1320637))

(assert (= (and b!1320637 res!876524) b!1320634))

(assert (= (and b!1320634 res!876521) b!1320639))

(assert (= (and b!1320639 res!876522) b!1320636))

(assert (= (and b!1320636 res!876520) b!1320630))

(assert (= (and b!1320630 res!876518) b!1320633))

(assert (= (and b!1320638 condMapEmpty!55670) mapIsEmpty!55670))

(assert (= (and b!1320638 (not condMapEmpty!55670)) mapNonEmpty!55670))

(get-info :version)

(assert (= (and mapNonEmpty!55670 ((_ is ValueCellFull!17109) mapValue!55670)) b!1320635))

(assert (= (and b!1320638 ((_ is ValueCellFull!17109) mapDefault!55670)) b!1320631))

(assert (= start!111538 b!1320638))

(declare-fun b_lambda!23521 () Bool)

(assert (=> (not b_lambda!23521) (not b!1320633)))

(declare-fun t!44177 () Bool)

(declare-fun tb!11547 () Bool)

(assert (=> (and start!111538 (= defaultEntry!1340 defaultEntry!1340) t!44177) tb!11547))

(declare-fun result!24149 () Bool)

(assert (=> tb!11547 (= result!24149 tp_is_empty!36015)))

(assert (=> b!1320633 t!44177))

(declare-fun b_and!48551 () Bool)

(assert (= b_and!48549 (and (=> t!44177 result!24149) b_and!48551)))

(declare-fun m!1208371 () Bool)

(assert (=> b!1320630 m!1208371))

(assert (=> b!1320630 m!1208371))

(declare-fun m!1208373 () Bool)

(assert (=> b!1320630 m!1208373))

(declare-fun m!1208375 () Bool)

(assert (=> b!1320633 m!1208375))

(assert (=> b!1320633 m!1208375))

(declare-fun m!1208377 () Bool)

(assert (=> b!1320633 m!1208377))

(declare-fun m!1208379 () Bool)

(assert (=> b!1320633 m!1208379))

(assert (=> b!1320633 m!1208379))

(declare-fun m!1208381 () Bool)

(assert (=> b!1320633 m!1208381))

(declare-fun m!1208383 () Bool)

(assert (=> b!1320633 m!1208383))

(declare-fun m!1208385 () Bool)

(assert (=> b!1320633 m!1208385))

(assert (=> b!1320633 m!1208371))

(declare-fun m!1208387 () Bool)

(assert (=> b!1320633 m!1208387))

(assert (=> b!1320633 m!1208381))

(declare-fun m!1208389 () Bool)

(assert (=> b!1320633 m!1208389))

(declare-fun m!1208391 () Bool)

(assert (=> b!1320633 m!1208391))

(declare-fun m!1208393 () Bool)

(assert (=> b!1320633 m!1208393))

(declare-fun m!1208395 () Bool)

(assert (=> b!1320640 m!1208395))

(declare-fun m!1208397 () Bool)

(assert (=> b!1320639 m!1208397))

(assert (=> b!1320639 m!1208397))

(declare-fun m!1208399 () Bool)

(assert (=> b!1320639 m!1208399))

(declare-fun m!1208401 () Bool)

(assert (=> mapNonEmpty!55670 m!1208401))

(declare-fun m!1208403 () Bool)

(assert (=> start!111538 m!1208403))

(declare-fun m!1208405 () Bool)

(assert (=> start!111538 m!1208405))

(declare-fun m!1208407 () Bool)

(assert (=> start!111538 m!1208407))

(declare-fun m!1208409 () Bool)

(assert (=> b!1320637 m!1208409))

(assert (=> b!1320636 m!1208371))

(check-sat b_and!48551 (not b!1320639) (not b!1320633) tp_is_empty!36015 (not b_lambda!23521) (not mapNonEmpty!55670) (not b!1320630) (not b!1320637) (not b_next!30195) (not start!111538) (not b!1320640))
(check-sat b_and!48551 (not b_next!30195))
