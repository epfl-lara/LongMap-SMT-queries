; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113260 () Bool)

(assert start!113260)

(declare-fun b_free!31087 () Bool)

(declare-fun b_next!31087 () Bool)

(assert (=> start!113260 (= b_free!31087 (not b_next!31087))))

(declare-fun tp!109065 () Bool)

(declare-fun b_and!50119 () Bool)

(assert (=> start!113260 (= tp!109065 b_and!50119)))

(declare-fun b!1341063 () Bool)

(declare-fun e!763976 () Bool)

(assert (=> b!1341063 (= e!763976 false)))

(declare-datatypes ((V!54553 0))(
  ( (V!54554 (val!18618 Int)) )
))
(declare-fun minValue!1245 () V!54553)

(declare-fun lt!594401 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91151 0))(
  ( (array!91152 (arr!44027 (Array (_ BitVec 32) (_ BitVec 64))) (size!44578 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91151)

(declare-fun zeroValue!1245 () V!54553)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17645 0))(
  ( (ValueCellFull!17645 (v!21261 V!54553)) (EmptyCell!17645) )
))
(declare-datatypes ((array!91153 0))(
  ( (array!91154 (arr!44028 (Array (_ BitVec 32) ValueCell!17645)) (size!44579 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91153)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24018 0))(
  ( (tuple2!24019 (_1!12020 (_ BitVec 64)) (_2!12020 V!54553)) )
))
(declare-datatypes ((List!31174 0))(
  ( (Nil!31171) (Cons!31170 (h!32388 tuple2!24018) (t!45498 List!31174)) )
))
(declare-datatypes ((ListLongMap!21683 0))(
  ( (ListLongMap!21684 (toList!10857 List!31174)) )
))
(declare-fun contains!9045 (ListLongMap!21683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5810 (array!91151 array!91153 (_ BitVec 32) (_ BitVec 32) V!54553 V!54553 (_ BitVec 32) Int) ListLongMap!21683)

(assert (=> b!1341063 (= lt!594401 (contains!9045 (getCurrentListMap!5810 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341064 () Bool)

(declare-fun e!763975 () Bool)

(declare-fun e!763973 () Bool)

(declare-fun mapRes!57337 () Bool)

(assert (=> b!1341064 (= e!763975 (and e!763973 mapRes!57337))))

(declare-fun condMapEmpty!57337 () Bool)

(declare-fun mapDefault!57337 () ValueCell!17645)

(assert (=> b!1341064 (= condMapEmpty!57337 (= (arr!44028 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17645)) mapDefault!57337)))))

(declare-fun res!889274 () Bool)

(assert (=> start!113260 (=> (not res!889274) (not e!763976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113260 (= res!889274 (validMask!0 mask!1977))))

(assert (=> start!113260 e!763976))

(declare-fun tp_is_empty!37087 () Bool)

(assert (=> start!113260 tp_is_empty!37087))

(assert (=> start!113260 true))

(declare-fun array_inv!33463 (array!91151) Bool)

(assert (=> start!113260 (array_inv!33463 _keys!1571)))

(declare-fun array_inv!33464 (array!91153) Bool)

(assert (=> start!113260 (and (array_inv!33464 _values!1303) e!763975)))

(assert (=> start!113260 tp!109065))

(declare-fun b!1341065 () Bool)

(declare-fun res!889271 () Bool)

(assert (=> b!1341065 (=> (not res!889271) (not e!763976))))

(assert (=> b!1341065 (= res!889271 (and (= (size!44579 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44578 _keys!1571) (size!44579 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341066 () Bool)

(declare-fun res!889272 () Bool)

(assert (=> b!1341066 (=> (not res!889272) (not e!763976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91151 (_ BitVec 32)) Bool)

(assert (=> b!1341066 (= res!889272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341067 () Bool)

(declare-fun res!889273 () Bool)

(assert (=> b!1341067 (=> (not res!889273) (not e!763976))))

(declare-datatypes ((List!31175 0))(
  ( (Nil!31172) (Cons!31171 (h!32389 (_ BitVec 64)) (t!45499 List!31175)) )
))
(declare-fun arrayNoDuplicates!0 (array!91151 (_ BitVec 32) List!31175) Bool)

(assert (=> b!1341067 (= res!889273 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31172))))

(declare-fun b!1341068 () Bool)

(declare-fun e!763972 () Bool)

(assert (=> b!1341068 (= e!763972 tp_is_empty!37087)))

(declare-fun b!1341069 () Bool)

(assert (=> b!1341069 (= e!763973 tp_is_empty!37087)))

(declare-fun b!1341070 () Bool)

(declare-fun res!889270 () Bool)

(assert (=> b!1341070 (=> (not res!889270) (not e!763976))))

(assert (=> b!1341070 (= res!889270 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44578 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57337 () Bool)

(declare-fun tp!109066 () Bool)

(assert (=> mapNonEmpty!57337 (= mapRes!57337 (and tp!109066 e!763972))))

(declare-fun mapValue!57337 () ValueCell!17645)

(declare-fun mapKey!57337 () (_ BitVec 32))

(declare-fun mapRest!57337 () (Array (_ BitVec 32) ValueCell!17645))

(assert (=> mapNonEmpty!57337 (= (arr!44028 _values!1303) (store mapRest!57337 mapKey!57337 mapValue!57337))))

(declare-fun mapIsEmpty!57337 () Bool)

(assert (=> mapIsEmpty!57337 mapRes!57337))

(assert (= (and start!113260 res!889274) b!1341065))

(assert (= (and b!1341065 res!889271) b!1341066))

(assert (= (and b!1341066 res!889272) b!1341067))

(assert (= (and b!1341067 res!889273) b!1341070))

(assert (= (and b!1341070 res!889270) b!1341063))

(assert (= (and b!1341064 condMapEmpty!57337) mapIsEmpty!57337))

(assert (= (and b!1341064 (not condMapEmpty!57337)) mapNonEmpty!57337))

(get-info :version)

(assert (= (and mapNonEmpty!57337 ((_ is ValueCellFull!17645) mapValue!57337)) b!1341068))

(assert (= (and b!1341064 ((_ is ValueCellFull!17645) mapDefault!57337)) b!1341069))

(assert (= start!113260 b!1341064))

(declare-fun m!1229307 () Bool)

(assert (=> b!1341063 m!1229307))

(assert (=> b!1341063 m!1229307))

(declare-fun m!1229309 () Bool)

(assert (=> b!1341063 m!1229309))

(declare-fun m!1229311 () Bool)

(assert (=> start!113260 m!1229311))

(declare-fun m!1229313 () Bool)

(assert (=> start!113260 m!1229313))

(declare-fun m!1229315 () Bool)

(assert (=> start!113260 m!1229315))

(declare-fun m!1229317 () Bool)

(assert (=> mapNonEmpty!57337 m!1229317))

(declare-fun m!1229319 () Bool)

(assert (=> b!1341066 m!1229319))

(declare-fun m!1229321 () Bool)

(assert (=> b!1341067 m!1229321))

(check-sat b_and!50119 tp_is_empty!37087 (not b!1341066) (not b!1341063) (not b_next!31087) (not mapNonEmpty!57337) (not start!113260) (not b!1341067))
(check-sat b_and!50119 (not b_next!31087))
