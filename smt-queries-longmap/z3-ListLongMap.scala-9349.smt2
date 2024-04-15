; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111530 () Bool)

(assert start!111530)

(declare-fun b_free!30187 () Bool)

(declare-fun b_next!30187 () Bool)

(assert (=> start!111530 (= b_free!30187 (not b_next!30187))))

(declare-fun tp!106038 () Bool)

(declare-fun b_and!48515 () Bool)

(assert (=> start!111530 (= tp!106038 b_and!48515)))

(declare-fun b!1320420 () Bool)

(declare-fun res!876395 () Bool)

(declare-fun e!753208 () Bool)

(assert (=> b!1320420 (=> (not res!876395) (not e!753208))))

(declare-datatypes ((array!88871 0))(
  ( (array!88872 (arr!42910 (Array (_ BitVec 32) (_ BitVec 64))) (size!43462 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88871)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53113 0))(
  ( (V!53114 (val!18078 Int)) )
))
(declare-fun zeroValue!1279 () V!53113)

(declare-datatypes ((ValueCell!17105 0))(
  ( (ValueCellFull!17105 (v!20707 V!53113)) (EmptyCell!17105) )
))
(declare-datatypes ((array!88873 0))(
  ( (array!88874 (arr!42911 (Array (_ BitVec 32) ValueCell!17105)) (size!43463 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88873)

(declare-fun minValue!1279 () V!53113)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23358 0))(
  ( (tuple2!23359 (_1!11690 (_ BitVec 64)) (_2!11690 V!53113)) )
))
(declare-datatypes ((List!30493 0))(
  ( (Nil!30490) (Cons!30489 (h!31698 tuple2!23358) (t!44221 List!30493)) )
))
(declare-datatypes ((ListLongMap!21015 0))(
  ( (ListLongMap!21016 (toList!10523 List!30493)) )
))
(declare-fun contains!8606 (ListLongMap!21015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5411 (array!88871 array!88873 (_ BitVec 32) (_ BitVec 32) V!53113 V!53113 (_ BitVec 32) Int) ListLongMap!21015)

(assert (=> b!1320420 (= res!876395 (contains!8606 (getCurrentListMap!5411 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320421 () Bool)

(declare-fun e!753211 () Bool)

(declare-fun tp_is_empty!36007 () Bool)

(assert (=> b!1320421 (= e!753211 tp_is_empty!36007)))

(declare-fun b!1320422 () Bool)

(declare-fun res!876398 () Bool)

(assert (=> b!1320422 (=> (not res!876398) (not e!753208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88871 (_ BitVec 32)) Bool)

(assert (=> b!1320422 (= res!876398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320423 () Bool)

(declare-fun res!876397 () Bool)

(assert (=> b!1320423 (=> (not res!876397) (not e!753208))))

(assert (=> b!1320423 (= res!876397 (not (= (select (arr!42910 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320424 () Bool)

(declare-fun e!753210 () Bool)

(assert (=> b!1320424 (= e!753210 tp_is_empty!36007)))

(declare-fun b!1320425 () Bool)

(declare-fun res!876396 () Bool)

(assert (=> b!1320425 (=> (not res!876396) (not e!753208))))

(declare-datatypes ((List!30494 0))(
  ( (Nil!30491) (Cons!30490 (h!31699 (_ BitVec 64)) (t!44222 List!30494)) )
))
(declare-fun arrayNoDuplicates!0 (array!88871 (_ BitVec 32) List!30494) Bool)

(assert (=> b!1320425 (= res!876396 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30491))))

(declare-fun mapNonEmpty!55658 () Bool)

(declare-fun mapRes!55658 () Bool)

(declare-fun tp!106037 () Bool)

(assert (=> mapNonEmpty!55658 (= mapRes!55658 (and tp!106037 e!753211))))

(declare-fun mapRest!55658 () (Array (_ BitVec 32) ValueCell!17105))

(declare-fun mapValue!55658 () ValueCell!17105)

(declare-fun mapKey!55658 () (_ BitVec 32))

(assert (=> mapNonEmpty!55658 (= (arr!42911 _values!1337) (store mapRest!55658 mapKey!55658 mapValue!55658))))

(declare-fun b!1320426 () Bool)

(assert (=> b!1320426 (= e!753208 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!586784 () ListLongMap!21015)

(assert (=> b!1320426 (contains!8606 lt!586784 k0!1164)))

(declare-datatypes ((Unit!43319 0))(
  ( (Unit!43320) )
))
(declare-fun lt!586782 () Unit!43319)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!133 ((_ BitVec 64) (_ BitVec 64) V!53113 ListLongMap!21015) Unit!43319)

(assert (=> b!1320426 (= lt!586782 (lemmaInListMapAfterAddingDiffThenInBefore!133 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586784))))

(declare-fun lt!586783 () ListLongMap!21015)

(assert (=> b!1320426 (contains!8606 lt!586783 k0!1164)))

(declare-fun lt!586785 () Unit!43319)

(assert (=> b!1320426 (= lt!586785 (lemmaInListMapAfterAddingDiffThenInBefore!133 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586783))))

(declare-fun +!4568 (ListLongMap!21015 tuple2!23358) ListLongMap!21015)

(assert (=> b!1320426 (= lt!586783 (+!4568 lt!586784 (tuple2!23359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6201 (array!88871 array!88873 (_ BitVec 32) (_ BitVec 32) V!53113 V!53113 (_ BitVec 32) Int) ListLongMap!21015)

(declare-fun get!21589 (ValueCell!17105 V!53113) V!53113)

(declare-fun dynLambda!3498 (Int (_ BitVec 64)) V!53113)

(assert (=> b!1320426 (= lt!586784 (+!4568 (getCurrentListMapNoExtraKeys!6201 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23359 (select (arr!42910 _keys!1609) from!2000) (get!21589 (select (arr!42911 _values!1337) from!2000) (dynLambda!3498 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320428 () Bool)

(declare-fun res!876392 () Bool)

(assert (=> b!1320428 (=> (not res!876392) (not e!753208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320428 (= res!876392 (validKeyInArray!0 (select (arr!42910 _keys!1609) from!2000)))))

(declare-fun b!1320429 () Bool)

(declare-fun res!876394 () Bool)

(assert (=> b!1320429 (=> (not res!876394) (not e!753208))))

(assert (=> b!1320429 (= res!876394 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43462 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320430 () Bool)

(declare-fun e!753207 () Bool)

(assert (=> b!1320430 (= e!753207 (and e!753210 mapRes!55658))))

(declare-fun condMapEmpty!55658 () Bool)

(declare-fun mapDefault!55658 () ValueCell!17105)

(assert (=> b!1320430 (= condMapEmpty!55658 (= (arr!42911 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17105)) mapDefault!55658)))))

(declare-fun mapIsEmpty!55658 () Bool)

(assert (=> mapIsEmpty!55658 mapRes!55658))

(declare-fun b!1320427 () Bool)

(declare-fun res!876393 () Bool)

(assert (=> b!1320427 (=> (not res!876393) (not e!753208))))

(assert (=> b!1320427 (= res!876393 (and (= (size!43463 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43462 _keys!1609) (size!43463 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!876399 () Bool)

(assert (=> start!111530 (=> (not res!876399) (not e!753208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111530 (= res!876399 (validMask!0 mask!2019))))

(assert (=> start!111530 e!753208))

(declare-fun array_inv!32581 (array!88871) Bool)

(assert (=> start!111530 (array_inv!32581 _keys!1609)))

(assert (=> start!111530 true))

(assert (=> start!111530 tp_is_empty!36007))

(declare-fun array_inv!32582 (array!88873) Bool)

(assert (=> start!111530 (and (array_inv!32582 _values!1337) e!753207)))

(assert (=> start!111530 tp!106038))

(assert (= (and start!111530 res!876399) b!1320427))

(assert (= (and b!1320427 res!876393) b!1320422))

(assert (= (and b!1320422 res!876398) b!1320425))

(assert (= (and b!1320425 res!876396) b!1320429))

(assert (= (and b!1320429 res!876394) b!1320420))

(assert (= (and b!1320420 res!876395) b!1320423))

(assert (= (and b!1320423 res!876397) b!1320428))

(assert (= (and b!1320428 res!876392) b!1320426))

(assert (= (and b!1320430 condMapEmpty!55658) mapIsEmpty!55658))

(assert (= (and b!1320430 (not condMapEmpty!55658)) mapNonEmpty!55658))

(get-info :version)

(assert (= (and mapNonEmpty!55658 ((_ is ValueCellFull!17105) mapValue!55658)) b!1320421))

(assert (= (and b!1320430 ((_ is ValueCellFull!17105) mapDefault!55658)) b!1320424))

(assert (= start!111530 b!1320430))

(declare-fun b_lambda!23503 () Bool)

(assert (=> (not b_lambda!23503) (not b!1320426)))

(declare-fun t!44220 () Bool)

(declare-fun tb!11531 () Bool)

(assert (=> (and start!111530 (= defaultEntry!1340 defaultEntry!1340) t!44220) tb!11531))

(declare-fun result!24125 () Bool)

(assert (=> tb!11531 (= result!24125 tp_is_empty!36007)))

(assert (=> b!1320426 t!44220))

(declare-fun b_and!48517 () Bool)

(assert (= b_and!48515 (and (=> t!44220 result!24125) b_and!48517)))

(declare-fun m!1207695 () Bool)

(assert (=> b!1320423 m!1207695))

(declare-fun m!1207697 () Bool)

(assert (=> b!1320426 m!1207697))

(declare-fun m!1207699 () Bool)

(assert (=> b!1320426 m!1207699))

(declare-fun m!1207701 () Bool)

(assert (=> b!1320426 m!1207701))

(declare-fun m!1207703 () Bool)

(assert (=> b!1320426 m!1207703))

(assert (=> b!1320426 m!1207699))

(declare-fun m!1207705 () Bool)

(assert (=> b!1320426 m!1207705))

(declare-fun m!1207707 () Bool)

(assert (=> b!1320426 m!1207707))

(declare-fun m!1207709 () Bool)

(assert (=> b!1320426 m!1207709))

(declare-fun m!1207711 () Bool)

(assert (=> b!1320426 m!1207711))

(assert (=> b!1320426 m!1207703))

(declare-fun m!1207713 () Bool)

(assert (=> b!1320426 m!1207713))

(assert (=> b!1320426 m!1207695))

(assert (=> b!1320426 m!1207711))

(declare-fun m!1207715 () Bool)

(assert (=> b!1320426 m!1207715))

(declare-fun m!1207717 () Bool)

(assert (=> start!111530 m!1207717))

(declare-fun m!1207719 () Bool)

(assert (=> start!111530 m!1207719))

(declare-fun m!1207721 () Bool)

(assert (=> start!111530 m!1207721))

(declare-fun m!1207723 () Bool)

(assert (=> b!1320425 m!1207723))

(declare-fun m!1207725 () Bool)

(assert (=> b!1320420 m!1207725))

(assert (=> b!1320420 m!1207725))

(declare-fun m!1207727 () Bool)

(assert (=> b!1320420 m!1207727))

(assert (=> b!1320428 m!1207695))

(assert (=> b!1320428 m!1207695))

(declare-fun m!1207729 () Bool)

(assert (=> b!1320428 m!1207729))

(declare-fun m!1207731 () Bool)

(assert (=> b!1320422 m!1207731))

(declare-fun m!1207733 () Bool)

(assert (=> mapNonEmpty!55658 m!1207733))

(check-sat (not b!1320422) (not b!1320426) (not start!111530) (not b_next!30187) tp_is_empty!36007 (not b!1320425) b_and!48517 (not mapNonEmpty!55658) (not b!1320420) (not b!1320428) (not b_lambda!23503))
(check-sat b_and!48517 (not b_next!30187))
