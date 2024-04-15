; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111368 () Bool)

(assert start!111368)

(declare-fun b_free!30025 () Bool)

(declare-fun b_next!30025 () Bool)

(assert (=> start!111368 (= b_free!30025 (not b_next!30025))))

(declare-fun tp!105551 () Bool)

(declare-fun b_and!48227 () Bool)

(assert (=> start!111368 (= tp!105551 b_and!48227)))

(declare-fun res!874577 () Bool)

(declare-fun e!751994 () Bool)

(assert (=> start!111368 (=> (not res!874577) (not e!751994))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111368 (= res!874577 (validMask!0 mask!2019))))

(assert (=> start!111368 e!751994))

(declare-datatypes ((array!88559 0))(
  ( (array!88560 (arr!42754 (Array (_ BitVec 32) (_ BitVec 64))) (size!43306 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88559)

(declare-fun array_inv!32467 (array!88559) Bool)

(assert (=> start!111368 (array_inv!32467 _keys!1609)))

(assert (=> start!111368 true))

(declare-fun tp_is_empty!35845 () Bool)

(assert (=> start!111368 tp_is_empty!35845))

(declare-datatypes ((V!52897 0))(
  ( (V!52898 (val!17997 Int)) )
))
(declare-datatypes ((ValueCell!17024 0))(
  ( (ValueCellFull!17024 (v!20626 V!52897)) (EmptyCell!17024) )
))
(declare-datatypes ((array!88561 0))(
  ( (array!88562 (arr!42755 (Array (_ BitVec 32) ValueCell!17024)) (size!43307 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88561)

(declare-fun e!751995 () Bool)

(declare-fun array_inv!32468 (array!88561) Bool)

(assert (=> start!111368 (and (array_inv!32468 _values!1337) e!751995)))

(assert (=> start!111368 tp!105551))

(declare-fun b!1317750 () Bool)

(declare-fun e!751993 () Bool)

(declare-fun mapRes!55415 () Bool)

(assert (=> b!1317750 (= e!751995 (and e!751993 mapRes!55415))))

(declare-fun condMapEmpty!55415 () Bool)

(declare-fun mapDefault!55415 () ValueCell!17024)

(assert (=> b!1317750 (= condMapEmpty!55415 (= (arr!42755 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17024)) mapDefault!55415)))))

(declare-fun b!1317751 () Bool)

(declare-fun res!874581 () Bool)

(assert (=> b!1317751 (=> (not res!874581) (not e!751994))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317751 (= res!874581 (and (= (size!43307 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43306 _keys!1609) (size!43307 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317752 () Bool)

(declare-fun e!751996 () Bool)

(assert (=> b!1317752 (= e!751996 tp_is_empty!35845)))

(declare-fun mapIsEmpty!55415 () Bool)

(assert (=> mapIsEmpty!55415 mapRes!55415))

(declare-fun b!1317753 () Bool)

(assert (=> b!1317753 (= e!751994 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52897)

(declare-fun minValue!1279 () V!52897)

(declare-fun lt!586227 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23244 0))(
  ( (tuple2!23245 (_1!11633 (_ BitVec 64)) (_2!11633 V!52897)) )
))
(declare-datatypes ((List!30383 0))(
  ( (Nil!30380) (Cons!30379 (h!31588 tuple2!23244) (t!43983 List!30383)) )
))
(declare-datatypes ((ListLongMap!20901 0))(
  ( (ListLongMap!20902 (toList!10466 List!30383)) )
))
(declare-fun contains!8549 (ListLongMap!20901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5361 (array!88559 array!88561 (_ BitVec 32) (_ BitVec 32) V!52897 V!52897 (_ BitVec 32) Int) ListLongMap!20901)

(assert (=> b!1317753 (= lt!586227 (contains!8549 (getCurrentListMap!5361 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1317754 () Bool)

(declare-fun res!874579 () Bool)

(assert (=> b!1317754 (=> (not res!874579) (not e!751994))))

(declare-datatypes ((List!30384 0))(
  ( (Nil!30381) (Cons!30380 (h!31589 (_ BitVec 64)) (t!43984 List!30384)) )
))
(declare-fun arrayNoDuplicates!0 (array!88559 (_ BitVec 32) List!30384) Bool)

(assert (=> b!1317754 (= res!874579 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30381))))

(declare-fun b!1317755 () Bool)

(assert (=> b!1317755 (= e!751993 tp_is_empty!35845)))

(declare-fun b!1317756 () Bool)

(declare-fun res!874580 () Bool)

(assert (=> b!1317756 (=> (not res!874580) (not e!751994))))

(assert (=> b!1317756 (= res!874580 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43306 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55415 () Bool)

(declare-fun tp!105552 () Bool)

(assert (=> mapNonEmpty!55415 (= mapRes!55415 (and tp!105552 e!751996))))

(declare-fun mapRest!55415 () (Array (_ BitVec 32) ValueCell!17024))

(declare-fun mapKey!55415 () (_ BitVec 32))

(declare-fun mapValue!55415 () ValueCell!17024)

(assert (=> mapNonEmpty!55415 (= (arr!42755 _values!1337) (store mapRest!55415 mapKey!55415 mapValue!55415))))

(declare-fun b!1317757 () Bool)

(declare-fun res!874578 () Bool)

(assert (=> b!1317757 (=> (not res!874578) (not e!751994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88559 (_ BitVec 32)) Bool)

(assert (=> b!1317757 (= res!874578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111368 res!874577) b!1317751))

(assert (= (and b!1317751 res!874581) b!1317757))

(assert (= (and b!1317757 res!874578) b!1317754))

(assert (= (and b!1317754 res!874579) b!1317756))

(assert (= (and b!1317756 res!874580) b!1317753))

(assert (= (and b!1317750 condMapEmpty!55415) mapIsEmpty!55415))

(assert (= (and b!1317750 (not condMapEmpty!55415)) mapNonEmpty!55415))

(get-info :version)

(assert (= (and mapNonEmpty!55415 ((_ is ValueCellFull!17024) mapValue!55415)) b!1317752))

(assert (= (and b!1317750 ((_ is ValueCellFull!17024) mapDefault!55415)) b!1317755))

(assert (= start!111368 b!1317750))

(declare-fun m!1205031 () Bool)

(assert (=> b!1317754 m!1205031))

(declare-fun m!1205033 () Bool)

(assert (=> b!1317753 m!1205033))

(assert (=> b!1317753 m!1205033))

(declare-fun m!1205035 () Bool)

(assert (=> b!1317753 m!1205035))

(declare-fun m!1205037 () Bool)

(assert (=> start!111368 m!1205037))

(declare-fun m!1205039 () Bool)

(assert (=> start!111368 m!1205039))

(declare-fun m!1205041 () Bool)

(assert (=> start!111368 m!1205041))

(declare-fun m!1205043 () Bool)

(assert (=> b!1317757 m!1205043))

(declare-fun m!1205045 () Bool)

(assert (=> mapNonEmpty!55415 m!1205045))

(check-sat tp_is_empty!35845 b_and!48227 (not start!111368) (not b!1317754) (not b_next!30025) (not b!1317753) (not mapNonEmpty!55415) (not b!1317757))
(check-sat b_and!48227 (not b_next!30025))
