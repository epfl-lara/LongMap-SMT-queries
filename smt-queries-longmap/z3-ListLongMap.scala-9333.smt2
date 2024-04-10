; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111436 () Bool)

(assert start!111436)

(declare-fun b_free!30093 () Bool)

(declare-fun b_next!30093 () Bool)

(assert (=> start!111436 (= b_free!30093 (not b_next!30093))))

(declare-fun tp!105754 () Bool)

(declare-fun b_and!48345 () Bool)

(assert (=> start!111436 (= tp!105754 b_and!48345)))

(declare-fun b!1318845 () Bool)

(declare-fun e!752538 () Bool)

(declare-fun e!752536 () Bool)

(declare-fun mapRes!55517 () Bool)

(assert (=> b!1318845 (= e!752538 (and e!752536 mapRes!55517))))

(declare-fun condMapEmpty!55517 () Bool)

(declare-datatypes ((V!52987 0))(
  ( (V!52988 (val!18031 Int)) )
))
(declare-datatypes ((ValueCell!17058 0))(
  ( (ValueCellFull!17058 (v!20661 V!52987)) (EmptyCell!17058) )
))
(declare-datatypes ((array!88768 0))(
  ( (array!88769 (arr!42858 (Array (_ BitVec 32) ValueCell!17058)) (size!43408 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88768)

(declare-fun mapDefault!55517 () ValueCell!17058)

(assert (=> b!1318845 (= condMapEmpty!55517 (= (arr!42858 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17058)) mapDefault!55517)))))

(declare-fun b!1318846 () Bool)

(declare-fun tp_is_empty!35913 () Bool)

(assert (=> b!1318846 (= e!752536 tp_is_empty!35913)))

(declare-fun res!875297 () Bool)

(declare-fun e!752539 () Bool)

(assert (=> start!111436 (=> (not res!875297) (not e!752539))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111436 (= res!875297 (validMask!0 mask!2019))))

(assert (=> start!111436 e!752539))

(declare-datatypes ((array!88770 0))(
  ( (array!88771 (arr!42859 (Array (_ BitVec 32) (_ BitVec 64))) (size!43409 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88770)

(declare-fun array_inv!32361 (array!88770) Bool)

(assert (=> start!111436 (array_inv!32361 _keys!1609)))

(assert (=> start!111436 true))

(assert (=> start!111436 tp_is_empty!35913))

(declare-fun array_inv!32362 (array!88768) Bool)

(assert (=> start!111436 (and (array_inv!32362 _values!1337) e!752538)))

(assert (=> start!111436 tp!105754))

(declare-fun b!1318847 () Bool)

(declare-fun res!875293 () Bool)

(assert (=> b!1318847 (=> (not res!875293) (not e!752539))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318847 (= res!875293 (validKeyInArray!0 (select (arr!42859 _keys!1609) from!2000)))))

(declare-fun b!1318848 () Bool)

(declare-fun res!875295 () Bool)

(assert (=> b!1318848 (=> (not res!875295) (not e!752539))))

(declare-datatypes ((List!30358 0))(
  ( (Nil!30355) (Cons!30354 (h!31563 (_ BitVec 64)) (t!44000 List!30358)) )
))
(declare-fun arrayNoDuplicates!0 (array!88770 (_ BitVec 32) List!30358) Bool)

(assert (=> b!1318848 (= res!875295 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30355))))

(declare-fun b!1318849 () Bool)

(declare-fun res!875296 () Bool)

(assert (=> b!1318849 (=> (not res!875296) (not e!752539))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318849 (= res!875296 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43409 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55517 () Bool)

(assert (=> mapIsEmpty!55517 mapRes!55517))

(declare-fun b!1318850 () Bool)

(declare-fun e!752537 () Bool)

(assert (=> b!1318850 (= e!752537 tp_is_empty!35913)))

(declare-fun b!1318851 () Bool)

(declare-fun res!875299 () Bool)

(assert (=> b!1318851 (=> (not res!875299) (not e!752539))))

(assert (=> b!1318851 (= res!875299 (and (= (size!43408 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43409 _keys!1609) (size!43408 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318852 () Bool)

(assert (=> b!1318852 (= e!752539 (not true))))

(declare-datatypes ((tuple2!23202 0))(
  ( (tuple2!23203 (_1!11612 (_ BitVec 64)) (_2!11612 V!52987)) )
))
(declare-datatypes ((List!30359 0))(
  ( (Nil!30356) (Cons!30355 (h!31564 tuple2!23202) (t!44001 List!30359)) )
))
(declare-datatypes ((ListLongMap!20859 0))(
  ( (ListLongMap!20860 (toList!10445 List!30359)) )
))
(declare-fun lt!586539 () ListLongMap!20859)

(declare-fun contains!8600 (ListLongMap!20859 (_ BitVec 64)) Bool)

(assert (=> b!1318852 (contains!8600 lt!586539 k0!1164)))

(declare-datatypes ((Unit!43432 0))(
  ( (Unit!43433) )
))
(declare-fun lt!586538 () Unit!43432)

(declare-fun minValue!1279 () V!52987)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!102 ((_ BitVec 64) (_ BitVec 64) V!52987 ListLongMap!20859) Unit!43432)

(assert (=> b!1318852 (= lt!586538 (lemmaInListMapAfterAddingDiffThenInBefore!102 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586539))))

(declare-fun zeroValue!1279 () V!52987)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4506 (ListLongMap!20859 tuple2!23202) ListLongMap!20859)

(declare-fun getCurrentListMapNoExtraKeys!6141 (array!88770 array!88768 (_ BitVec 32) (_ BitVec 32) V!52987 V!52987 (_ BitVec 32) Int) ListLongMap!20859)

(declare-fun get!21528 (ValueCell!17058 V!52987) V!52987)

(declare-fun dynLambda!3445 (Int (_ BitVec 64)) V!52987)

(assert (=> b!1318852 (= lt!586539 (+!4506 (+!4506 (getCurrentListMapNoExtraKeys!6141 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23203 (select (arr!42859 _keys!1609) from!2000) (get!21528 (select (arr!42858 _values!1337) from!2000) (dynLambda!3445 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!55517 () Bool)

(declare-fun tp!105755 () Bool)

(assert (=> mapNonEmpty!55517 (= mapRes!55517 (and tp!105755 e!752537))))

(declare-fun mapKey!55517 () (_ BitVec 32))

(declare-fun mapValue!55517 () ValueCell!17058)

(declare-fun mapRest!55517 () (Array (_ BitVec 32) ValueCell!17058))

(assert (=> mapNonEmpty!55517 (= (arr!42858 _values!1337) (store mapRest!55517 mapKey!55517 mapValue!55517))))

(declare-fun b!1318853 () Bool)

(declare-fun res!875298 () Bool)

(assert (=> b!1318853 (=> (not res!875298) (not e!752539))))

(assert (=> b!1318853 (= res!875298 (not (= (select (arr!42859 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318854 () Bool)

(declare-fun res!875294 () Bool)

(assert (=> b!1318854 (=> (not res!875294) (not e!752539))))

(declare-fun getCurrentListMap!5458 (array!88770 array!88768 (_ BitVec 32) (_ BitVec 32) V!52987 V!52987 (_ BitVec 32) Int) ListLongMap!20859)

(assert (=> b!1318854 (= res!875294 (contains!8600 (getCurrentListMap!5458 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318855 () Bool)

(declare-fun res!875300 () Bool)

(assert (=> b!1318855 (=> (not res!875300) (not e!752539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88770 (_ BitVec 32)) Bool)

(assert (=> b!1318855 (= res!875300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111436 res!875297) b!1318851))

(assert (= (and b!1318851 res!875299) b!1318855))

(assert (= (and b!1318855 res!875300) b!1318848))

(assert (= (and b!1318848 res!875295) b!1318849))

(assert (= (and b!1318849 res!875296) b!1318854))

(assert (= (and b!1318854 res!875294) b!1318853))

(assert (= (and b!1318853 res!875298) b!1318847))

(assert (= (and b!1318847 res!875293) b!1318852))

(assert (= (and b!1318845 condMapEmpty!55517) mapIsEmpty!55517))

(assert (= (and b!1318845 (not condMapEmpty!55517)) mapNonEmpty!55517))

(get-info :version)

(assert (= (and mapNonEmpty!55517 ((_ is ValueCellFull!17058) mapValue!55517)) b!1318850))

(assert (= (and b!1318845 ((_ is ValueCellFull!17058) mapDefault!55517)) b!1318846))

(assert (= start!111436 b!1318845))

(declare-fun b_lambda!23419 () Bool)

(assert (=> (not b_lambda!23419) (not b!1318852)))

(declare-fun t!43999 () Bool)

(declare-fun tb!11445 () Bool)

(assert (=> (and start!111436 (= defaultEntry!1340 defaultEntry!1340) t!43999) tb!11445))

(declare-fun result!23945 () Bool)

(assert (=> tb!11445 (= result!23945 tp_is_empty!35913)))

(assert (=> b!1318852 t!43999))

(declare-fun b_and!48347 () Bool)

(assert (= b_and!48345 (and (=> t!43999 result!23945) b_and!48347)))

(declare-fun m!1206423 () Bool)

(assert (=> b!1318853 m!1206423))

(declare-fun m!1206425 () Bool)

(assert (=> b!1318852 m!1206425))

(declare-fun m!1206427 () Bool)

(assert (=> b!1318852 m!1206427))

(declare-fun m!1206429 () Bool)

(assert (=> b!1318852 m!1206429))

(assert (=> b!1318852 m!1206427))

(declare-fun m!1206431 () Bool)

(assert (=> b!1318852 m!1206431))

(declare-fun m!1206433 () Bool)

(assert (=> b!1318852 m!1206433))

(declare-fun m!1206435 () Bool)

(assert (=> b!1318852 m!1206435))

(assert (=> b!1318852 m!1206431))

(declare-fun m!1206437 () Bool)

(assert (=> b!1318852 m!1206437))

(assert (=> b!1318852 m!1206435))

(assert (=> b!1318852 m!1206429))

(declare-fun m!1206439 () Bool)

(assert (=> b!1318852 m!1206439))

(assert (=> b!1318852 m!1206423))

(declare-fun m!1206441 () Bool)

(assert (=> start!111436 m!1206441))

(declare-fun m!1206443 () Bool)

(assert (=> start!111436 m!1206443))

(declare-fun m!1206445 () Bool)

(assert (=> start!111436 m!1206445))

(declare-fun m!1206447 () Bool)

(assert (=> b!1318855 m!1206447))

(declare-fun m!1206449 () Bool)

(assert (=> b!1318854 m!1206449))

(assert (=> b!1318854 m!1206449))

(declare-fun m!1206451 () Bool)

(assert (=> b!1318854 m!1206451))

(assert (=> b!1318847 m!1206423))

(assert (=> b!1318847 m!1206423))

(declare-fun m!1206453 () Bool)

(assert (=> b!1318847 m!1206453))

(declare-fun m!1206455 () Bool)

(assert (=> mapNonEmpty!55517 m!1206455))

(declare-fun m!1206457 () Bool)

(assert (=> b!1318848 m!1206457))

(check-sat (not b!1318852) (not mapNonEmpty!55517) (not b!1318847) (not b!1318855) (not start!111436) tp_is_empty!35913 (not b_next!30093) (not b!1318854) (not b_lambda!23419) (not b!1318848) b_and!48347)
(check-sat b_and!48347 (not b_next!30093))
