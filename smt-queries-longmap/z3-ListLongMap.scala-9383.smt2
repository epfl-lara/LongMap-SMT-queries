; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111958 () Bool)

(assert start!111958)

(declare-fun b_free!30391 () Bool)

(declare-fun b_next!30391 () Bool)

(assert (=> start!111958 (= b_free!30391 (not b_next!30391))))

(declare-fun tp!106649 () Bool)

(declare-fun b_and!48931 () Bool)

(assert (=> start!111958 (= tp!106649 b_and!48931)))

(declare-fun b!1325287 () Bool)

(declare-fun e!755614 () Bool)

(declare-fun e!755616 () Bool)

(declare-fun mapRes!55964 () Bool)

(assert (=> b!1325287 (= e!755614 (and e!755616 mapRes!55964))))

(declare-fun condMapEmpty!55964 () Bool)

(declare-datatypes ((V!53385 0))(
  ( (V!53386 (val!18180 Int)) )
))
(declare-datatypes ((ValueCell!17207 0))(
  ( (ValueCellFull!17207 (v!20805 V!53385)) (EmptyCell!17207) )
))
(declare-datatypes ((array!89427 0))(
  ( (array!89428 (arr!43183 (Array (_ BitVec 32) ValueCell!17207)) (size!43734 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89427)

(declare-fun mapDefault!55964 () ValueCell!17207)

(assert (=> b!1325287 (= condMapEmpty!55964 (= (arr!43183 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17207)) mapDefault!55964)))))

(declare-fun b!1325288 () Bool)

(declare-fun res!879327 () Bool)

(declare-fun e!755615 () Bool)

(assert (=> b!1325288 (=> (not res!879327) (not e!755615))))

(declare-datatypes ((array!89429 0))(
  ( (array!89430 (arr!43184 (Array (_ BitVec 32) (_ BitVec 64))) (size!43735 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89429)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325288 (= res!879327 (and (= (size!43734 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43735 _keys!1609) (size!43734 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!879329 () Bool)

(assert (=> start!111958 (=> (not res!879329) (not e!755615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111958 (= res!879329 (validMask!0 mask!2019))))

(assert (=> start!111958 e!755615))

(declare-fun array_inv!32875 (array!89429) Bool)

(assert (=> start!111958 (array_inv!32875 _keys!1609)))

(assert (=> start!111958 true))

(declare-fun tp_is_empty!36211 () Bool)

(assert (=> start!111958 tp_is_empty!36211))

(declare-fun array_inv!32876 (array!89427) Bool)

(assert (=> start!111958 (and (array_inv!32876 _values!1337) e!755614)))

(assert (=> start!111958 tp!106649))

(declare-fun mapNonEmpty!55964 () Bool)

(declare-fun tp!106648 () Bool)

(declare-fun e!755617 () Bool)

(assert (=> mapNonEmpty!55964 (= mapRes!55964 (and tp!106648 e!755617))))

(declare-fun mapKey!55964 () (_ BitVec 32))

(declare-fun mapValue!55964 () ValueCell!17207)

(declare-fun mapRest!55964 () (Array (_ BitVec 32) ValueCell!17207))

(assert (=> mapNonEmpty!55964 (= (arr!43183 _values!1337) (store mapRest!55964 mapKey!55964 mapValue!55964))))

(declare-fun b!1325289 () Bool)

(declare-fun res!879330 () Bool)

(assert (=> b!1325289 (=> (not res!879330) (not e!755615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89429 (_ BitVec 32)) Bool)

(assert (=> b!1325289 (= res!879330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325290 () Bool)

(declare-fun res!879331 () Bool)

(assert (=> b!1325290 (=> (not res!879331) (not e!755615))))

(declare-datatypes ((List!30628 0))(
  ( (Nil!30625) (Cons!30624 (h!31842 (_ BitVec 64)) (t!44546 List!30628)) )
))
(declare-fun arrayNoDuplicates!0 (array!89429 (_ BitVec 32) List!30628) Bool)

(assert (=> b!1325290 (= res!879331 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30625))))

(declare-fun b!1325291 () Bool)

(assert (=> b!1325291 (= e!755617 tp_is_empty!36211)))

(declare-fun mapIsEmpty!55964 () Bool)

(assert (=> mapIsEmpty!55964 mapRes!55964))

(declare-fun b!1325292 () Bool)

(assert (=> b!1325292 (= e!755615 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53385)

(declare-fun lt!589895 () Bool)

(declare-fun minValue!1279 () V!53385)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23478 0))(
  ( (tuple2!23479 (_1!11750 (_ BitVec 64)) (_2!11750 V!53385)) )
))
(declare-datatypes ((List!30629 0))(
  ( (Nil!30626) (Cons!30625 (h!31843 tuple2!23478) (t!44547 List!30629)) )
))
(declare-datatypes ((ListLongMap!21143 0))(
  ( (ListLongMap!21144 (toList!10587 List!30629)) )
))
(declare-fun contains!8754 (ListLongMap!21143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5570 (array!89429 array!89427 (_ BitVec 32) (_ BitVec 32) V!53385 V!53385 (_ BitVec 32) Int) ListLongMap!21143)

(assert (=> b!1325292 (= lt!589895 (contains!8754 (getCurrentListMap!5570 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325293 () Bool)

(declare-fun res!879328 () Bool)

(assert (=> b!1325293 (=> (not res!879328) (not e!755615))))

(assert (=> b!1325293 (= res!879328 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43735 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325294 () Bool)

(assert (=> b!1325294 (= e!755616 tp_is_empty!36211)))

(assert (= (and start!111958 res!879329) b!1325288))

(assert (= (and b!1325288 res!879327) b!1325289))

(assert (= (and b!1325289 res!879330) b!1325290))

(assert (= (and b!1325290 res!879331) b!1325293))

(assert (= (and b!1325293 res!879328) b!1325292))

(assert (= (and b!1325287 condMapEmpty!55964) mapIsEmpty!55964))

(assert (= (and b!1325287 (not condMapEmpty!55964)) mapNonEmpty!55964))

(get-info :version)

(assert (= (and mapNonEmpty!55964 ((_ is ValueCellFull!17207) mapValue!55964)) b!1325291))

(assert (= (and b!1325287 ((_ is ValueCellFull!17207) mapDefault!55964)) b!1325294))

(assert (= start!111958 b!1325287))

(declare-fun m!1214597 () Bool)

(assert (=> b!1325292 m!1214597))

(assert (=> b!1325292 m!1214597))

(declare-fun m!1214599 () Bool)

(assert (=> b!1325292 m!1214599))

(declare-fun m!1214601 () Bool)

(assert (=> start!111958 m!1214601))

(declare-fun m!1214603 () Bool)

(assert (=> start!111958 m!1214603))

(declare-fun m!1214605 () Bool)

(assert (=> start!111958 m!1214605))

(declare-fun m!1214607 () Bool)

(assert (=> mapNonEmpty!55964 m!1214607))

(declare-fun m!1214609 () Bool)

(assert (=> b!1325290 m!1214609))

(declare-fun m!1214611 () Bool)

(assert (=> b!1325289 m!1214611))

(check-sat (not b!1325289) (not b_next!30391) tp_is_empty!36211 b_and!48931 (not b!1325290) (not b!1325292) (not mapNonEmpty!55964) (not start!111958))
(check-sat b_and!48931 (not b_next!30391))
