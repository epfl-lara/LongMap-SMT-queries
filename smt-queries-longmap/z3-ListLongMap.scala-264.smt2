; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4326 () Bool)

(assert start!4326)

(declare-fun b_free!1171 () Bool)

(declare-fun b_next!1171 () Bool)

(assert (=> start!4326 (= b_free!1171 (not b_next!1171))))

(declare-fun tp!4941 () Bool)

(declare-fun b_and!1977 () Bool)

(assert (=> start!4326 (= tp!4941 b_and!1977)))

(declare-fun b!33270 () Bool)

(declare-fun e!21126 () Bool)

(declare-fun e!21125 () Bool)

(assert (=> b!33270 (= e!21126 e!21125)))

(declare-fun res!20224 () Bool)

(assert (=> b!33270 (=> (not res!20224) (not e!21125))))

(declare-datatypes ((V!1859 0))(
  ( (V!1860 (val!789 Int)) )
))
(declare-datatypes ((tuple2!1268 0))(
  ( (tuple2!1269 (_1!645 (_ BitVec 64)) (_2!645 V!1859)) )
))
(declare-datatypes ((List!862 0))(
  ( (Nil!859) (Cons!858 (h!1425 tuple2!1268) (t!3555 List!862)) )
))
(declare-datatypes ((ListLongMap!839 0))(
  ( (ListLongMap!840 (toList!435 List!862)) )
))
(declare-fun lt!12096 () ListLongMap!839)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!380 (ListLongMap!839 (_ BitVec 64)) Bool)

(assert (=> b!33270 (= res!20224 (not (contains!380 lt!12096 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!563 0))(
  ( (ValueCellFull!563 (v!1881 V!1859)) (EmptyCell!563) )
))
(declare-datatypes ((array!2247 0))(
  ( (array!2248 (arr!1074 (Array (_ BitVec 32) ValueCell!563)) (size!1175 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2247)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2249 0))(
  ( (array!2250 (arr!1075 (Array (_ BitVec 32) (_ BitVec 64))) (size!1176 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2249)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1859)

(declare-fun minValue!1443 () V!1859)

(declare-fun getCurrentListMap!258 (array!2249 array!2247 (_ BitVec 32) (_ BitVec 32) V!1859 V!1859 (_ BitVec 32) Int) ListLongMap!839)

(assert (=> b!33270 (= lt!12096 (getCurrentListMap!258 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33271 () Bool)

(declare-fun e!21124 () Bool)

(declare-fun e!21128 () Bool)

(declare-fun mapRes!1825 () Bool)

(assert (=> b!33271 (= e!21124 (and e!21128 mapRes!1825))))

(declare-fun condMapEmpty!1825 () Bool)

(declare-fun mapDefault!1825 () ValueCell!563)

(assert (=> b!33271 (= condMapEmpty!1825 (= (arr!1074 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!563)) mapDefault!1825)))))

(declare-fun b!33272 () Bool)

(declare-fun res!20223 () Bool)

(assert (=> b!33272 (=> (not res!20223) (not e!21125))))

(declare-fun arrayContainsKey!0 (array!2249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33272 (= res!20223 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33273 () Bool)

(declare-fun res!20221 () Bool)

(assert (=> b!33273 (=> (not res!20221) (not e!21126))))

(assert (=> b!33273 (= res!20221 (and (= (size!1175 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1176 _keys!1833) (size!1175 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33274 () Bool)

(declare-fun e!21129 () Bool)

(declare-fun tp_is_empty!1525 () Bool)

(assert (=> b!33274 (= e!21129 tp_is_empty!1525)))

(declare-fun mapIsEmpty!1825 () Bool)

(assert (=> mapIsEmpty!1825 mapRes!1825))

(declare-fun mapNonEmpty!1825 () Bool)

(declare-fun tp!4942 () Bool)

(assert (=> mapNonEmpty!1825 (= mapRes!1825 (and tp!4942 e!21129))))

(declare-fun mapValue!1825 () ValueCell!563)

(declare-fun mapKey!1825 () (_ BitVec 32))

(declare-fun mapRest!1825 () (Array (_ BitVec 32) ValueCell!563))

(assert (=> mapNonEmpty!1825 (= (arr!1074 _values!1501) (store mapRest!1825 mapKey!1825 mapValue!1825))))

(declare-fun b!33275 () Bool)

(declare-fun res!20220 () Bool)

(assert (=> b!33275 (=> (not res!20220) (not e!21126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33275 (= res!20220 (validKeyInArray!0 k0!1304))))

(declare-fun res!20226 () Bool)

(assert (=> start!4326 (=> (not res!20226) (not e!21126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4326 (= res!20226 (validMask!0 mask!2294))))

(assert (=> start!4326 e!21126))

(assert (=> start!4326 true))

(assert (=> start!4326 tp!4941))

(declare-fun array_inv!735 (array!2247) Bool)

(assert (=> start!4326 (and (array_inv!735 _values!1501) e!21124)))

(declare-fun array_inv!736 (array!2249) Bool)

(assert (=> start!4326 (array_inv!736 _keys!1833)))

(assert (=> start!4326 tp_is_empty!1525))

(declare-fun b!33276 () Bool)

(assert (=> b!33276 (= e!21125 (not (= (size!1176 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((SeekEntryResult!124 0))(
  ( (MissingZero!124 (index!2618 (_ BitVec 32))) (Found!124 (index!2619 (_ BitVec 32))) (Intermediate!124 (undefined!936 Bool) (index!2620 (_ BitVec 32)) (x!6808 (_ BitVec 32))) (Undefined!124) (MissingVacant!124 (index!2621 (_ BitVec 32))) )
))
(declare-fun lt!12095 () SeekEntryResult!124)

(declare-fun lt!12097 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33276 (and ((_ is Found!124) lt!12095) (= (index!2619 lt!12095) lt!12097))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2249 (_ BitVec 32)) SeekEntryResult!124)

(assert (=> b!33276 (= lt!12095 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!748 0))(
  ( (Unit!749) )
))
(declare-fun lt!12094 () Unit!748)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2249 (_ BitVec 32)) Unit!748)

(assert (=> b!33276 (= lt!12094 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12097 _keys!1833 mask!2294))))

(assert (=> b!33276 (contains!380 lt!12096 (select (arr!1075 _keys!1833) lt!12097))))

(declare-fun lt!12093 () Unit!748)

(declare-fun lemmaValidKeyInArrayIsInListMap!58 (array!2249 array!2247 (_ BitVec 32) (_ BitVec 32) V!1859 V!1859 (_ BitVec 32) Int) Unit!748)

(assert (=> b!33276 (= lt!12093 (lemmaValidKeyInArrayIsInListMap!58 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12097 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2249 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33276 (= lt!12097 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33277 () Bool)

(declare-fun res!20225 () Bool)

(assert (=> b!33277 (=> (not res!20225) (not e!21126))))

(declare-datatypes ((List!863 0))(
  ( (Nil!860) (Cons!859 (h!1426 (_ BitVec 64)) (t!3556 List!863)) )
))
(declare-fun arrayNoDuplicates!0 (array!2249 (_ BitVec 32) List!863) Bool)

(assert (=> b!33277 (= res!20225 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!860))))

(declare-fun b!33278 () Bool)

(declare-fun res!20222 () Bool)

(assert (=> b!33278 (=> (not res!20222) (not e!21126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2249 (_ BitVec 32)) Bool)

(assert (=> b!33278 (= res!20222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33279 () Bool)

(assert (=> b!33279 (= e!21128 tp_is_empty!1525)))

(assert (= (and start!4326 res!20226) b!33273))

(assert (= (and b!33273 res!20221) b!33278))

(assert (= (and b!33278 res!20222) b!33277))

(assert (= (and b!33277 res!20225) b!33275))

(assert (= (and b!33275 res!20220) b!33270))

(assert (= (and b!33270 res!20224) b!33272))

(assert (= (and b!33272 res!20223) b!33276))

(assert (= (and b!33271 condMapEmpty!1825) mapIsEmpty!1825))

(assert (= (and b!33271 (not condMapEmpty!1825)) mapNonEmpty!1825))

(assert (= (and mapNonEmpty!1825 ((_ is ValueCellFull!563) mapValue!1825)) b!33274))

(assert (= (and b!33271 ((_ is ValueCellFull!563) mapDefault!1825)) b!33279))

(assert (= start!4326 b!33271))

(declare-fun m!26587 () Bool)

(assert (=> b!33276 m!26587))

(declare-fun m!26589 () Bool)

(assert (=> b!33276 m!26589))

(declare-fun m!26591 () Bool)

(assert (=> b!33276 m!26591))

(declare-fun m!26593 () Bool)

(assert (=> b!33276 m!26593))

(declare-fun m!26595 () Bool)

(assert (=> b!33276 m!26595))

(declare-fun m!26597 () Bool)

(assert (=> b!33276 m!26597))

(assert (=> b!33276 m!26589))

(declare-fun m!26599 () Bool)

(assert (=> b!33278 m!26599))

(declare-fun m!26601 () Bool)

(assert (=> b!33275 m!26601))

(declare-fun m!26603 () Bool)

(assert (=> b!33277 m!26603))

(declare-fun m!26605 () Bool)

(assert (=> b!33270 m!26605))

(declare-fun m!26607 () Bool)

(assert (=> b!33270 m!26607))

(declare-fun m!26609 () Bool)

(assert (=> start!4326 m!26609))

(declare-fun m!26611 () Bool)

(assert (=> start!4326 m!26611))

(declare-fun m!26613 () Bool)

(assert (=> start!4326 m!26613))

(declare-fun m!26615 () Bool)

(assert (=> mapNonEmpty!1825 m!26615))

(declare-fun m!26617 () Bool)

(assert (=> b!33272 m!26617))

(check-sat (not b!33278) (not b!33275) (not b_next!1171) b_and!1977 (not start!4326) (not b!33270) (not b!33276) (not mapNonEmpty!1825) (not b!33272) tp_is_empty!1525 (not b!33277))
(check-sat b_and!1977 (not b_next!1171))
