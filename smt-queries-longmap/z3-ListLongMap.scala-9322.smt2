; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111592 () Bool)

(assert start!111592)

(declare-fun b_free!30025 () Bool)

(declare-fun b_next!30025 () Bool)

(assert (=> start!111592 (= b_free!30025 (not b_next!30025))))

(declare-fun tp!105551 () Bool)

(declare-fun b_and!48247 () Bool)

(assert (=> start!111592 (= tp!105551 b_and!48247)))

(declare-fun b!1319119 () Bool)

(declare-fun res!875125 () Bool)

(declare-fun e!752871 () Bool)

(assert (=> b!1319119 (=> (not res!875125) (not e!752871))))

(declare-datatypes ((array!88711 0))(
  ( (array!88712 (arr!42825 (Array (_ BitVec 32) (_ BitVec 64))) (size!43376 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88711)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52897 0))(
  ( (V!52898 (val!17997 Int)) )
))
(declare-datatypes ((ValueCell!17024 0))(
  ( (ValueCellFull!17024 (v!20622 V!52897)) (EmptyCell!17024) )
))
(declare-datatypes ((array!88713 0))(
  ( (array!88714 (arr!42826 (Array (_ BitVec 32) ValueCell!17024)) (size!43377 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88713)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319119 (= res!875125 (and (= (size!43377 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43376 _keys!1609) (size!43377 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319120 () Bool)

(declare-fun e!752868 () Bool)

(declare-fun e!752872 () Bool)

(declare-fun mapRes!55415 () Bool)

(assert (=> b!1319120 (= e!752868 (and e!752872 mapRes!55415))))

(declare-fun condMapEmpty!55415 () Bool)

(declare-fun mapDefault!55415 () ValueCell!17024)

(assert (=> b!1319120 (= condMapEmpty!55415 (= (arr!42826 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17024)) mapDefault!55415)))))

(declare-fun b!1319121 () Bool)

(declare-fun res!875127 () Bool)

(assert (=> b!1319121 (=> (not res!875127) (not e!752871))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319121 (= res!875127 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43376 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319122 () Bool)

(declare-fun tp_is_empty!35845 () Bool)

(assert (=> b!1319122 (= e!752872 tp_is_empty!35845)))

(declare-fun mapIsEmpty!55415 () Bool)

(assert (=> mapIsEmpty!55415 mapRes!55415))

(declare-fun b!1319123 () Bool)

(declare-fun res!875128 () Bool)

(assert (=> b!1319123 (=> (not res!875128) (not e!752871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88711 (_ BitVec 32)) Bool)

(assert (=> b!1319123 (= res!875128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319124 () Bool)

(declare-fun res!875124 () Bool)

(assert (=> b!1319124 (=> (not res!875124) (not e!752871))))

(declare-datatypes ((List!30357 0))(
  ( (Nil!30354) (Cons!30353 (h!31571 (_ BitVec 64)) (t!43957 List!30357)) )
))
(declare-fun arrayNoDuplicates!0 (array!88711 (_ BitVec 32) List!30357) Bool)

(assert (=> b!1319124 (= res!875124 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30354))))

(declare-fun b!1319125 () Bool)

(declare-fun e!752869 () Bool)

(assert (=> b!1319125 (= e!752869 tp_is_empty!35845)))

(declare-fun res!875126 () Bool)

(assert (=> start!111592 (=> (not res!875126) (not e!752871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111592 (= res!875126 (validMask!0 mask!2019))))

(assert (=> start!111592 e!752871))

(declare-fun array_inv!32615 (array!88711) Bool)

(assert (=> start!111592 (array_inv!32615 _keys!1609)))

(assert (=> start!111592 true))

(assert (=> start!111592 tp_is_empty!35845))

(declare-fun array_inv!32616 (array!88713) Bool)

(assert (=> start!111592 (and (array_inv!32616 _values!1337) e!752868)))

(assert (=> start!111592 tp!105551))

(declare-fun b!1319126 () Bool)

(assert (=> b!1319126 (= e!752871 false)))

(declare-fun zeroValue!1279 () V!52897)

(declare-fun minValue!1279 () V!52897)

(declare-fun lt!586889 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23194 0))(
  ( (tuple2!23195 (_1!11608 (_ BitVec 64)) (_2!11608 V!52897)) )
))
(declare-datatypes ((List!30358 0))(
  ( (Nil!30355) (Cons!30354 (h!31572 tuple2!23194) (t!43958 List!30358)) )
))
(declare-datatypes ((ListLongMap!20859 0))(
  ( (ListLongMap!20860 (toList!10445 List!30358)) )
))
(declare-fun contains!8612 (ListLongMap!20859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5449 (array!88711 array!88713 (_ BitVec 32) (_ BitVec 32) V!52897 V!52897 (_ BitVec 32) Int) ListLongMap!20859)

(assert (=> b!1319126 (= lt!586889 (contains!8612 (getCurrentListMap!5449 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55415 () Bool)

(declare-fun tp!105550 () Bool)

(assert (=> mapNonEmpty!55415 (= mapRes!55415 (and tp!105550 e!752869))))

(declare-fun mapKey!55415 () (_ BitVec 32))

(declare-fun mapRest!55415 () (Array (_ BitVec 32) ValueCell!17024))

(declare-fun mapValue!55415 () ValueCell!17024)

(assert (=> mapNonEmpty!55415 (= (arr!42826 _values!1337) (store mapRest!55415 mapKey!55415 mapValue!55415))))

(assert (= (and start!111592 res!875126) b!1319119))

(assert (= (and b!1319119 res!875125) b!1319123))

(assert (= (and b!1319123 res!875128) b!1319124))

(assert (= (and b!1319124 res!875124) b!1319121))

(assert (= (and b!1319121 res!875127) b!1319126))

(assert (= (and b!1319120 condMapEmpty!55415) mapIsEmpty!55415))

(assert (= (and b!1319120 (not condMapEmpty!55415)) mapNonEmpty!55415))

(get-info :version)

(assert (= (and mapNonEmpty!55415 ((_ is ValueCellFull!17024) mapValue!55415)) b!1319125))

(assert (= (and b!1319120 ((_ is ValueCellFull!17024) mapDefault!55415)) b!1319122))

(assert (= start!111592 b!1319120))

(declare-fun m!1207145 () Bool)

(assert (=> start!111592 m!1207145))

(declare-fun m!1207147 () Bool)

(assert (=> start!111592 m!1207147))

(declare-fun m!1207149 () Bool)

(assert (=> start!111592 m!1207149))

(declare-fun m!1207151 () Bool)

(assert (=> b!1319124 m!1207151))

(declare-fun m!1207153 () Bool)

(assert (=> mapNonEmpty!55415 m!1207153))

(declare-fun m!1207155 () Bool)

(assert (=> b!1319123 m!1207155))

(declare-fun m!1207157 () Bool)

(assert (=> b!1319126 m!1207157))

(assert (=> b!1319126 m!1207157))

(declare-fun m!1207159 () Bool)

(assert (=> b!1319126 m!1207159))

(check-sat (not b!1319126) (not b!1319124) (not b_next!30025) (not start!111592) b_and!48247 (not mapNonEmpty!55415) (not b!1319123) tp_is_empty!35845)
(check-sat b_and!48247 (not b_next!30025))
