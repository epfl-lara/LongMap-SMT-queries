; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111776 () Bool)

(assert start!111776)

(declare-fun b_free!30433 () Bool)

(declare-fun b_next!30433 () Bool)

(assert (=> start!111776 (= b_free!30433 (not b_next!30433))))

(declare-fun tp!106775 () Bool)

(declare-fun b_and!48953 () Bool)

(assert (=> start!111776 (= tp!106775 b_and!48953)))

(declare-fun mapNonEmpty!56027 () Bool)

(declare-fun mapRes!56027 () Bool)

(declare-fun tp!106776 () Bool)

(declare-fun e!755054 () Bool)

(assert (=> mapNonEmpty!56027 (= mapRes!56027 (and tp!106776 e!755054))))

(declare-datatypes ((V!53441 0))(
  ( (V!53442 (val!18201 Int)) )
))
(declare-datatypes ((ValueCell!17228 0))(
  ( (ValueCellFull!17228 (v!20830 V!53441)) (EmptyCell!17228) )
))
(declare-fun mapValue!56027 () ValueCell!17228)

(declare-datatypes ((array!89349 0))(
  ( (array!89350 (arr!43149 (Array (_ BitVec 32) ValueCell!17228)) (size!43701 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89349)

(declare-fun mapRest!56027 () (Array (_ BitVec 32) ValueCell!17228))

(declare-fun mapKey!56027 () (_ BitVec 32))

(assert (=> mapNonEmpty!56027 (= (arr!43149 _values!1337) (store mapRest!56027 mapKey!56027 mapValue!56027))))

(declare-fun b!1324449 () Bool)

(declare-fun e!755055 () Bool)

(declare-fun tp_is_empty!36253 () Bool)

(assert (=> b!1324449 (= e!755055 tp_is_empty!36253)))

(declare-fun b!1324450 () Bool)

(declare-fun res!879123 () Bool)

(declare-fun e!755052 () Bool)

(assert (=> b!1324450 (=> (not res!879123) (not e!755052))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89351 0))(
  ( (array!89352 (arr!43150 (Array (_ BitVec 32) (_ BitVec 64))) (size!43702 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89351)

(assert (=> b!1324450 (= res!879123 (and (= (size!43701 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43702 _keys!1609) (size!43701 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324451 () Bool)

(declare-fun res!879122 () Bool)

(assert (=> b!1324451 (=> (not res!879122) (not e!755052))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324451 (= res!879122 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43702 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324452 () Bool)

(assert (=> b!1324452 (= e!755052 false)))

(declare-fun zeroValue!1279 () V!53441)

(declare-fun minValue!1279 () V!53441)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589287 () Bool)

(declare-datatypes ((tuple2!23538 0))(
  ( (tuple2!23539 (_1!11780 (_ BitVec 64)) (_2!11780 V!53441)) )
))
(declare-datatypes ((List!30670 0))(
  ( (Nil!30667) (Cons!30666 (h!31875 tuple2!23538) (t!44588 List!30670)) )
))
(declare-datatypes ((ListLongMap!21195 0))(
  ( (ListLongMap!21196 (toList!10613 List!30670)) )
))
(declare-fun contains!8696 (ListLongMap!21195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5492 (array!89351 array!89349 (_ BitVec 32) (_ BitVec 32) V!53441 V!53441 (_ BitVec 32) Int) ListLongMap!21195)

(assert (=> b!1324452 (= lt!589287 (contains!8696 (getCurrentListMap!5492 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324453 () Bool)

(declare-fun res!879125 () Bool)

(assert (=> b!1324453 (=> (not res!879125) (not e!755052))))

(declare-datatypes ((List!30671 0))(
  ( (Nil!30668) (Cons!30667 (h!31876 (_ BitVec 64)) (t!44589 List!30671)) )
))
(declare-fun arrayNoDuplicates!0 (array!89351 (_ BitVec 32) List!30671) Bool)

(assert (=> b!1324453 (= res!879125 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30668))))

(declare-fun mapIsEmpty!56027 () Bool)

(assert (=> mapIsEmpty!56027 mapRes!56027))

(declare-fun res!879126 () Bool)

(assert (=> start!111776 (=> (not res!879126) (not e!755052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111776 (= res!879126 (validMask!0 mask!2019))))

(assert (=> start!111776 e!755052))

(declare-fun array_inv!32759 (array!89351) Bool)

(assert (=> start!111776 (array_inv!32759 _keys!1609)))

(assert (=> start!111776 true))

(assert (=> start!111776 tp_is_empty!36253))

(declare-fun e!755053 () Bool)

(declare-fun array_inv!32760 (array!89349) Bool)

(assert (=> start!111776 (and (array_inv!32760 _values!1337) e!755053)))

(assert (=> start!111776 tp!106775))

(declare-fun b!1324454 () Bool)

(declare-fun res!879124 () Bool)

(assert (=> b!1324454 (=> (not res!879124) (not e!755052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89351 (_ BitVec 32)) Bool)

(assert (=> b!1324454 (= res!879124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324455 () Bool)

(assert (=> b!1324455 (= e!755054 tp_is_empty!36253)))

(declare-fun b!1324456 () Bool)

(assert (=> b!1324456 (= e!755053 (and e!755055 mapRes!56027))))

(declare-fun condMapEmpty!56027 () Bool)

(declare-fun mapDefault!56027 () ValueCell!17228)

(assert (=> b!1324456 (= condMapEmpty!56027 (= (arr!43149 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17228)) mapDefault!56027)))))

(assert (= (and start!111776 res!879126) b!1324450))

(assert (= (and b!1324450 res!879123) b!1324454))

(assert (= (and b!1324454 res!879124) b!1324453))

(assert (= (and b!1324453 res!879125) b!1324451))

(assert (= (and b!1324451 res!879122) b!1324452))

(assert (= (and b!1324456 condMapEmpty!56027) mapIsEmpty!56027))

(assert (= (and b!1324456 (not condMapEmpty!56027)) mapNonEmpty!56027))

(get-info :version)

(assert (= (and mapNonEmpty!56027 ((_ is ValueCellFull!17228) mapValue!56027)) b!1324455))

(assert (= (and b!1324456 ((_ is ValueCellFull!17228) mapDefault!56027)) b!1324449))

(assert (= start!111776 b!1324456))

(declare-fun m!1212831 () Bool)

(assert (=> start!111776 m!1212831))

(declare-fun m!1212833 () Bool)

(assert (=> start!111776 m!1212833))

(declare-fun m!1212835 () Bool)

(assert (=> start!111776 m!1212835))

(declare-fun m!1212837 () Bool)

(assert (=> b!1324453 m!1212837))

(declare-fun m!1212839 () Bool)

(assert (=> b!1324454 m!1212839))

(declare-fun m!1212841 () Bool)

(assert (=> mapNonEmpty!56027 m!1212841))

(declare-fun m!1212843 () Bool)

(assert (=> b!1324452 m!1212843))

(assert (=> b!1324452 m!1212843))

(declare-fun m!1212845 () Bool)

(assert (=> b!1324452 m!1212845))

(check-sat (not b!1324452) tp_is_empty!36253 (not b!1324453) (not b!1324454) (not mapNonEmpty!56027) b_and!48953 (not start!111776) (not b_next!30433))
(check-sat b_and!48953 (not b_next!30433))
