; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111352 () Bool)

(assert start!111352)

(declare-fun b_free!30009 () Bool)

(declare-fun b_next!30009 () Bool)

(assert (=> start!111352 (= b_free!30009 (not b_next!30009))))

(declare-fun tp!105503 () Bool)

(declare-fun b_and!48229 () Bool)

(assert (=> start!111352 (= tp!105503 b_and!48229)))

(declare-fun b!1317628 () Bool)

(declare-fun res!874487 () Bool)

(declare-fun e!751906 () Bool)

(assert (=> b!1317628 (=> (not res!874487) (not e!751906))))

(declare-datatypes ((array!88612 0))(
  ( (array!88613 (arr!42780 (Array (_ BitVec 32) (_ BitVec 64))) (size!43330 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88612)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88612 (_ BitVec 32)) Bool)

(assert (=> b!1317628 (= res!874487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317630 () Bool)

(declare-fun e!751907 () Bool)

(declare-fun tp_is_empty!35829 () Bool)

(assert (=> b!1317630 (= e!751907 tp_is_empty!35829)))

(declare-fun b!1317631 () Bool)

(declare-fun e!751909 () Bool)

(assert (=> b!1317631 (= e!751909 tp_is_empty!35829)))

(declare-fun mapNonEmpty!55391 () Bool)

(declare-fun mapRes!55391 () Bool)

(declare-fun tp!105502 () Bool)

(assert (=> mapNonEmpty!55391 (= mapRes!55391 (and tp!105502 e!751907))))

(declare-fun mapKey!55391 () (_ BitVec 32))

(declare-datatypes ((V!52875 0))(
  ( (V!52876 (val!17989 Int)) )
))
(declare-datatypes ((ValueCell!17016 0))(
  ( (ValueCellFull!17016 (v!20619 V!52875)) (EmptyCell!17016) )
))
(declare-datatypes ((array!88614 0))(
  ( (array!88615 (arr!42781 (Array (_ BitVec 32) ValueCell!17016)) (size!43331 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88614)

(declare-fun mapValue!55391 () ValueCell!17016)

(declare-fun mapRest!55391 () (Array (_ BitVec 32) ValueCell!17016))

(assert (=> mapNonEmpty!55391 (= (arr!42781 _values!1337) (store mapRest!55391 mapKey!55391 mapValue!55391))))

(declare-fun b!1317632 () Bool)

(assert (=> b!1317632 (= e!751906 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52875)

(declare-fun minValue!1279 () V!52875)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun lt!586389 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23154 0))(
  ( (tuple2!23155 (_1!11588 (_ BitVec 64)) (_2!11588 V!52875)) )
))
(declare-datatypes ((List!30312 0))(
  ( (Nil!30309) (Cons!30308 (h!31517 tuple2!23154) (t!43920 List!30312)) )
))
(declare-datatypes ((ListLongMap!20811 0))(
  ( (ListLongMap!20812 (toList!10421 List!30312)) )
))
(declare-fun contains!8576 (ListLongMap!20811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5434 (array!88612 array!88614 (_ BitVec 32) (_ BitVec 32) V!52875 V!52875 (_ BitVec 32) Int) ListLongMap!20811)

(assert (=> b!1317632 (= lt!586389 (contains!8576 (getCurrentListMap!5434 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!874488 () Bool)

(assert (=> start!111352 (=> (not res!874488) (not e!751906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111352 (= res!874488 (validMask!0 mask!2019))))

(assert (=> start!111352 e!751906))

(declare-fun array_inv!32311 (array!88612) Bool)

(assert (=> start!111352 (array_inv!32311 _keys!1609)))

(assert (=> start!111352 true))

(assert (=> start!111352 tp_is_empty!35829))

(declare-fun e!751905 () Bool)

(declare-fun array_inv!32312 (array!88614) Bool)

(assert (=> start!111352 (and (array_inv!32312 _values!1337) e!751905)))

(assert (=> start!111352 tp!105503))

(declare-fun b!1317629 () Bool)

(declare-fun res!874490 () Bool)

(assert (=> b!1317629 (=> (not res!874490) (not e!751906))))

(assert (=> b!1317629 (= res!874490 (and (= (size!43331 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43330 _keys!1609) (size!43331 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55391 () Bool)

(assert (=> mapIsEmpty!55391 mapRes!55391))

(declare-fun b!1317633 () Bool)

(declare-fun res!874489 () Bool)

(assert (=> b!1317633 (=> (not res!874489) (not e!751906))))

(assert (=> b!1317633 (= res!874489 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43330 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317634 () Bool)

(declare-fun res!874486 () Bool)

(assert (=> b!1317634 (=> (not res!874486) (not e!751906))))

(declare-datatypes ((List!30313 0))(
  ( (Nil!30310) (Cons!30309 (h!31518 (_ BitVec 64)) (t!43921 List!30313)) )
))
(declare-fun arrayNoDuplicates!0 (array!88612 (_ BitVec 32) List!30313) Bool)

(assert (=> b!1317634 (= res!874486 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30310))))

(declare-fun b!1317635 () Bool)

(assert (=> b!1317635 (= e!751905 (and e!751909 mapRes!55391))))

(declare-fun condMapEmpty!55391 () Bool)

(declare-fun mapDefault!55391 () ValueCell!17016)

(assert (=> b!1317635 (= condMapEmpty!55391 (= (arr!42781 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17016)) mapDefault!55391)))))

(assert (= (and start!111352 res!874488) b!1317629))

(assert (= (and b!1317629 res!874490) b!1317628))

(assert (= (and b!1317628 res!874487) b!1317634))

(assert (= (and b!1317634 res!874486) b!1317633))

(assert (= (and b!1317633 res!874489) b!1317632))

(assert (= (and b!1317635 condMapEmpty!55391) mapIsEmpty!55391))

(assert (= (and b!1317635 (not condMapEmpty!55391)) mapNonEmpty!55391))

(get-info :version)

(assert (= (and mapNonEmpty!55391 ((_ is ValueCellFull!17016) mapValue!55391)) b!1317630))

(assert (= (and b!1317635 ((_ is ValueCellFull!17016) mapDefault!55391)) b!1317631))

(assert (= start!111352 b!1317635))

(declare-fun m!1205419 () Bool)

(assert (=> mapNonEmpty!55391 m!1205419))

(declare-fun m!1205421 () Bool)

(assert (=> b!1317634 m!1205421))

(declare-fun m!1205423 () Bool)

(assert (=> b!1317632 m!1205423))

(assert (=> b!1317632 m!1205423))

(declare-fun m!1205425 () Bool)

(assert (=> b!1317632 m!1205425))

(declare-fun m!1205427 () Bool)

(assert (=> start!111352 m!1205427))

(declare-fun m!1205429 () Bool)

(assert (=> start!111352 m!1205429))

(declare-fun m!1205431 () Bool)

(assert (=> start!111352 m!1205431))

(declare-fun m!1205433 () Bool)

(assert (=> b!1317628 m!1205433))

(check-sat (not start!111352) tp_is_empty!35829 (not b!1317628) (not b!1317632) (not b!1317634) (not mapNonEmpty!55391) (not b_next!30009) b_and!48229)
(check-sat b_and!48229 (not b_next!30009))
