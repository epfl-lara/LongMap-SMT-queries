; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111866 () Bool)

(assert start!111866)

(declare-fun b_free!30465 () Bool)

(declare-fun b_next!30465 () Bool)

(assert (=> start!111866 (= b_free!30465 (not b_next!30465))))

(declare-fun tp!106875 () Bool)

(declare-fun b_and!49025 () Bool)

(assert (=> start!111866 (= tp!106875 b_and!49025)))

(declare-fun b!1325418 () Bool)

(declare-fun res!879663 () Bool)

(declare-fun e!755587 () Bool)

(assert (=> b!1325418 (=> (not res!879663) (not e!755587))))

(declare-datatypes ((array!89478 0))(
  ( (array!89479 (arr!43212 (Array (_ BitVec 32) (_ BitVec 64))) (size!43762 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89478)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53483 0))(
  ( (V!53484 (val!18217 Int)) )
))
(declare-fun zeroValue!1279 () V!53483)

(declare-datatypes ((ValueCell!17244 0))(
  ( (ValueCellFull!17244 (v!20850 V!53483)) (EmptyCell!17244) )
))
(declare-datatypes ((array!89480 0))(
  ( (array!89481 (arr!43213 (Array (_ BitVec 32) ValueCell!17244)) (size!43763 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89480)

(declare-fun minValue!1279 () V!53483)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((tuple2!23492 0))(
  ( (tuple2!23493 (_1!11757 (_ BitVec 64)) (_2!11757 V!53483)) )
))
(declare-datatypes ((List!30632 0))(
  ( (Nil!30629) (Cons!30628 (h!31837 tuple2!23492) (t!44568 List!30632)) )
))
(declare-datatypes ((ListLongMap!21149 0))(
  ( (ListLongMap!21150 (toList!10590 List!30632)) )
))
(declare-fun contains!8747 (ListLongMap!21149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5586 (array!89478 array!89480 (_ BitVec 32) (_ BitVec 32) V!53483 V!53483 (_ BitVec 32) Int) ListLongMap!21149)

(assert (=> b!1325418 (= res!879663 (contains!8747 (getCurrentListMap!5586 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325419 () Bool)

(declare-fun res!879664 () Bool)

(assert (=> b!1325419 (=> (not res!879664) (not e!755587))))

(assert (=> b!1325419 (= res!879664 (not (= (select (arr!43212 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!56079 () Bool)

(declare-fun mapRes!56079 () Bool)

(assert (=> mapIsEmpty!56079 mapRes!56079))

(declare-fun b!1325420 () Bool)

(declare-fun e!755586 () Bool)

(declare-fun e!755583 () Bool)

(assert (=> b!1325420 (= e!755586 (and e!755583 mapRes!56079))))

(declare-fun condMapEmpty!56079 () Bool)

(declare-fun mapDefault!56079 () ValueCell!17244)

(assert (=> b!1325420 (= condMapEmpty!56079 (= (arr!43213 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17244)) mapDefault!56079)))))

(declare-fun b!1325421 () Bool)

(declare-fun tp_is_empty!36285 () Bool)

(assert (=> b!1325421 (= e!755583 tp_is_empty!36285)))

(declare-fun b!1325422 () Bool)

(declare-fun res!879660 () Bool)

(assert (=> b!1325422 (=> (not res!879660) (not e!755587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325422 (= res!879660 (validKeyInArray!0 (select (arr!43212 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!56079 () Bool)

(declare-fun tp!106874 () Bool)

(declare-fun e!755585 () Bool)

(assert (=> mapNonEmpty!56079 (= mapRes!56079 (and tp!106874 e!755585))))

(declare-fun mapRest!56079 () (Array (_ BitVec 32) ValueCell!17244))

(declare-fun mapValue!56079 () ValueCell!17244)

(declare-fun mapKey!56079 () (_ BitVec 32))

(assert (=> mapNonEmpty!56079 (= (arr!43213 _values!1337) (store mapRest!56079 mapKey!56079 mapValue!56079))))

(declare-fun b!1325423 () Bool)

(declare-fun res!879662 () Bool)

(assert (=> b!1325423 (=> (not res!879662) (not e!755587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89478 (_ BitVec 32)) Bool)

(assert (=> b!1325423 (= res!879662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325424 () Bool)

(declare-fun res!879659 () Bool)

(assert (=> b!1325424 (=> (not res!879659) (not e!755587))))

(declare-datatypes ((List!30633 0))(
  ( (Nil!30630) (Cons!30629 (h!31838 (_ BitVec 64)) (t!44569 List!30633)) )
))
(declare-fun arrayNoDuplicates!0 (array!89478 (_ BitVec 32) List!30633) Bool)

(assert (=> b!1325424 (= res!879659 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30630))))

(declare-fun b!1325425 () Bool)

(assert (=> b!1325425 (= e!755587 false)))

(declare-fun lt!589782 () Bool)

(declare-fun +!4613 (ListLongMap!21149 tuple2!23492) ListLongMap!21149)

(declare-fun getCurrentListMapNoExtraKeys!6251 (array!89478 array!89480 (_ BitVec 32) (_ BitVec 32) V!53483 V!53483 (_ BitVec 32) Int) ListLongMap!21149)

(declare-fun get!21762 (ValueCell!17244 V!53483) V!53483)

(declare-fun dynLambda!3552 (Int (_ BitVec 64)) V!53483)

(assert (=> b!1325425 (= lt!589782 (contains!8747 (+!4613 (+!4613 (+!4613 (getCurrentListMapNoExtraKeys!6251 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23493 (select (arr!43212 _keys!1609) from!2000) (get!21762 (select (arr!43213 _values!1337) from!2000) (dynLambda!3552 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun b!1325426 () Bool)

(declare-fun res!879658 () Bool)

(assert (=> b!1325426 (=> (not res!879658) (not e!755587))))

(assert (=> b!1325426 (= res!879658 (and (= (size!43763 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43762 _keys!1609) (size!43763 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325427 () Bool)

(declare-fun res!879661 () Bool)

(assert (=> b!1325427 (=> (not res!879661) (not e!755587))))

(assert (=> b!1325427 (= res!879661 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43762 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325428 () Bool)

(assert (=> b!1325428 (= e!755585 tp_is_empty!36285)))

(declare-fun res!879657 () Bool)

(assert (=> start!111866 (=> (not res!879657) (not e!755587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111866 (= res!879657 (validMask!0 mask!2019))))

(assert (=> start!111866 e!755587))

(declare-fun array_inv!32617 (array!89478) Bool)

(assert (=> start!111866 (array_inv!32617 _keys!1609)))

(assert (=> start!111866 true))

(assert (=> start!111866 tp_is_empty!36285))

(declare-fun array_inv!32618 (array!89480) Bool)

(assert (=> start!111866 (and (array_inv!32618 _values!1337) e!755586)))

(assert (=> start!111866 tp!106875))

(assert (= (and start!111866 res!879657) b!1325426))

(assert (= (and b!1325426 res!879658) b!1325423))

(assert (= (and b!1325423 res!879662) b!1325424))

(assert (= (and b!1325424 res!879659) b!1325427))

(assert (= (and b!1325427 res!879661) b!1325418))

(assert (= (and b!1325418 res!879663) b!1325419))

(assert (= (and b!1325419 res!879664) b!1325422))

(assert (= (and b!1325422 res!879660) b!1325425))

(assert (= (and b!1325420 condMapEmpty!56079) mapIsEmpty!56079))

(assert (= (and b!1325420 (not condMapEmpty!56079)) mapNonEmpty!56079))

(get-info :version)

(assert (= (and mapNonEmpty!56079 ((_ is ValueCellFull!17244) mapValue!56079)) b!1325428))

(assert (= (and b!1325420 ((_ is ValueCellFull!17244) mapDefault!56079)) b!1325421))

(assert (= start!111866 b!1325420))

(declare-fun b_lambda!23743 () Bool)

(assert (=> (not b_lambda!23743) (not b!1325425)))

(declare-fun t!44567 () Bool)

(declare-fun tb!11739 () Bool)

(assert (=> (and start!111866 (= defaultEntry!1340 defaultEntry!1340) t!44567) tb!11739))

(declare-fun result!24535 () Bool)

(assert (=> tb!11739 (= result!24535 tp_is_empty!36285)))

(assert (=> b!1325425 t!44567))

(declare-fun b_and!49027 () Bool)

(assert (= b_and!49025 (and (=> t!44567 result!24535) b_and!49027)))

(declare-fun m!1214305 () Bool)

(assert (=> b!1325418 m!1214305))

(assert (=> b!1325418 m!1214305))

(declare-fun m!1214307 () Bool)

(assert (=> b!1325418 m!1214307))

(declare-fun m!1214309 () Bool)

(assert (=> b!1325422 m!1214309))

(assert (=> b!1325422 m!1214309))

(declare-fun m!1214311 () Bool)

(assert (=> b!1325422 m!1214311))

(assert (=> b!1325419 m!1214309))

(declare-fun m!1214313 () Bool)

(assert (=> b!1325424 m!1214313))

(declare-fun m!1214315 () Bool)

(assert (=> start!111866 m!1214315))

(declare-fun m!1214317 () Bool)

(assert (=> start!111866 m!1214317))

(declare-fun m!1214319 () Bool)

(assert (=> start!111866 m!1214319))

(declare-fun m!1214321 () Bool)

(assert (=> b!1325425 m!1214321))

(declare-fun m!1214323 () Bool)

(assert (=> b!1325425 m!1214323))

(assert (=> b!1325425 m!1214321))

(declare-fun m!1214325 () Bool)

(assert (=> b!1325425 m!1214325))

(declare-fun m!1214327 () Bool)

(assert (=> b!1325425 m!1214327))

(declare-fun m!1214329 () Bool)

(assert (=> b!1325425 m!1214329))

(declare-fun m!1214331 () Bool)

(assert (=> b!1325425 m!1214331))

(assert (=> b!1325425 m!1214325))

(declare-fun m!1214333 () Bool)

(assert (=> b!1325425 m!1214333))

(assert (=> b!1325425 m!1214309))

(assert (=> b!1325425 m!1214333))

(assert (=> b!1325425 m!1214327))

(assert (=> b!1325425 m!1214331))

(assert (=> b!1325425 m!1214323))

(declare-fun m!1214335 () Bool)

(assert (=> b!1325425 m!1214335))

(declare-fun m!1214337 () Bool)

(assert (=> mapNonEmpty!56079 m!1214337))

(declare-fun m!1214339 () Bool)

(assert (=> b!1325423 m!1214339))

(check-sat (not mapNonEmpty!56079) tp_is_empty!36285 (not b!1325425) (not start!111866) (not b!1325418) (not b_next!30465) (not b!1325422) (not b!1325423) b_and!49027 (not b_lambda!23743) (not b!1325424))
(check-sat b_and!49027 (not b_next!30465))
