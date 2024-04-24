; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4010 () Bool)

(assert start!4010)

(declare-fun b_free!919 () Bool)

(declare-fun b_next!919 () Bool)

(assert (=> start!4010 (= b_free!919 (not b_next!919))))

(declare-fun tp!4176 () Bool)

(declare-fun b_and!1719 () Bool)

(assert (=> start!4010 (= tp!4176 b_and!1719)))

(declare-fun mapIsEmpty!1438 () Bool)

(declare-fun mapRes!1438 () Bool)

(assert (=> mapIsEmpty!1438 mapRes!1438))

(declare-fun b!29139 () Bool)

(declare-fun res!17453 () Bool)

(declare-fun e!18819 () Bool)

(assert (=> b!29139 (=> (not res!17453) (not e!18819))))

(declare-datatypes ((array!1759 0))(
  ( (array!1760 (arr!833 (Array (_ BitVec 32) (_ BitVec 64))) (size!934 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1759)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1759 (_ BitVec 32)) Bool)

(assert (=> b!29139 (= res!17453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29140 () Bool)

(declare-fun e!18816 () Bool)

(assert (=> b!29140 (= e!18816 (not true))))

(declare-datatypes ((SeekEntryResult!82 0))(
  ( (MissingZero!82 (index!2450 (_ BitVec 32))) (Found!82 (index!2451 (_ BitVec 32))) (Intermediate!82 (undefined!894 Bool) (index!2452 (_ BitVec 32)) (x!6400 (_ BitVec 32))) (Undefined!82) (MissingVacant!82 (index!2453 (_ BitVec 32))) )
))
(declare-fun lt!11097 () SeekEntryResult!82)

(declare-fun lt!11098 () (_ BitVec 32))

(get-info :version)

(assert (=> b!29140 (and ((_ is Found!82) lt!11097) (= (index!2451 lt!11097) lt!11098))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1759 (_ BitVec 32)) SeekEntryResult!82)

(assert (=> b!29140 (= lt!11097 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!687 0))(
  ( (Unit!688) )
))
(declare-fun lt!11100 () Unit!687)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1759 (_ BitVec 32)) Unit!687)

(assert (=> b!29140 (= lt!11100 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11098 _keys!1833 mask!2294))))

(declare-datatypes ((V!1523 0))(
  ( (V!1524 (val!663 Int)) )
))
(declare-datatypes ((tuple2!1098 0))(
  ( (tuple2!1099 (_1!560 (_ BitVec 64)) (_2!560 V!1523)) )
))
(declare-datatypes ((List!687 0))(
  ( (Nil!684) (Cons!683 (h!1250 tuple2!1098) (t!3374 List!687)) )
))
(declare-datatypes ((ListLongMap!669 0))(
  ( (ListLongMap!670 (toList!350 List!687)) )
))
(declare-fun lt!11099 () ListLongMap!669)

(declare-fun contains!292 (ListLongMap!669 (_ BitVec 64)) Bool)

(assert (=> b!29140 (contains!292 lt!11099 (select (arr!833 _keys!1833) lt!11098))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!437 0))(
  ( (ValueCellFull!437 (v!1752 V!1523)) (EmptyCell!437) )
))
(declare-datatypes ((array!1761 0))(
  ( (array!1762 (arr!834 (Array (_ BitVec 32) ValueCell!437)) (size!935 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1761)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11096 () Unit!687)

(declare-fun zeroValue!1443 () V!1523)

(declare-fun minValue!1443 () V!1523)

(declare-fun lemmaValidKeyInArrayIsInListMap!33 (array!1759 array!1761 (_ BitVec 32) (_ BitVec 32) V!1523 V!1523 (_ BitVec 32) Int) Unit!687)

(assert (=> b!29140 (= lt!11096 (lemmaValidKeyInArrayIsInListMap!33 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11098 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1759 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29140 (= lt!11098 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29141 () Bool)

(declare-fun res!17454 () Bool)

(assert (=> b!29141 (=> (not res!17454) (not e!18819))))

(declare-datatypes ((List!688 0))(
  ( (Nil!685) (Cons!684 (h!1251 (_ BitVec 64)) (t!3375 List!688)) )
))
(declare-fun arrayNoDuplicates!0 (array!1759 (_ BitVec 32) List!688) Bool)

(assert (=> b!29141 (= res!17454 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!685))))

(declare-fun mapNonEmpty!1438 () Bool)

(declare-fun tp!4177 () Bool)

(declare-fun e!18817 () Bool)

(assert (=> mapNonEmpty!1438 (= mapRes!1438 (and tp!4177 e!18817))))

(declare-fun mapValue!1438 () ValueCell!437)

(declare-fun mapRest!1438 () (Array (_ BitVec 32) ValueCell!437))

(declare-fun mapKey!1438 () (_ BitVec 32))

(assert (=> mapNonEmpty!1438 (= (arr!834 _values!1501) (store mapRest!1438 mapKey!1438 mapValue!1438))))

(declare-fun b!29142 () Bool)

(declare-fun res!17458 () Bool)

(assert (=> b!29142 (=> (not res!17458) (not e!18819))))

(assert (=> b!29142 (= res!17458 (and (= (size!935 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!934 _keys!1833) (size!935 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29143 () Bool)

(declare-fun e!18818 () Bool)

(declare-fun e!18815 () Bool)

(assert (=> b!29143 (= e!18818 (and e!18815 mapRes!1438))))

(declare-fun condMapEmpty!1438 () Bool)

(declare-fun mapDefault!1438 () ValueCell!437)

(assert (=> b!29143 (= condMapEmpty!1438 (= (arr!834 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!437)) mapDefault!1438)))))

(declare-fun res!17455 () Bool)

(assert (=> start!4010 (=> (not res!17455) (not e!18819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4010 (= res!17455 (validMask!0 mask!2294))))

(assert (=> start!4010 e!18819))

(assert (=> start!4010 true))

(assert (=> start!4010 tp!4176))

(declare-fun array_inv!577 (array!1761) Bool)

(assert (=> start!4010 (and (array_inv!577 _values!1501) e!18818)))

(declare-fun array_inv!578 (array!1759) Bool)

(assert (=> start!4010 (array_inv!578 _keys!1833)))

(declare-fun tp_is_empty!1273 () Bool)

(assert (=> start!4010 tp_is_empty!1273))

(declare-fun b!29144 () Bool)

(assert (=> b!29144 (= e!18819 e!18816)))

(declare-fun res!17456 () Bool)

(assert (=> b!29144 (=> (not res!17456) (not e!18816))))

(assert (=> b!29144 (= res!17456 (not (contains!292 lt!11099 k0!1304)))))

(declare-fun getCurrentListMap!175 (array!1759 array!1761 (_ BitVec 32) (_ BitVec 32) V!1523 V!1523 (_ BitVec 32) Int) ListLongMap!669)

(assert (=> b!29144 (= lt!11099 (getCurrentListMap!175 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29145 () Bool)

(assert (=> b!29145 (= e!18817 tp_is_empty!1273)))

(declare-fun b!29146 () Bool)

(declare-fun res!17459 () Bool)

(assert (=> b!29146 (=> (not res!17459) (not e!18819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29146 (= res!17459 (validKeyInArray!0 k0!1304))))

(declare-fun b!29147 () Bool)

(declare-fun res!17457 () Bool)

(assert (=> b!29147 (=> (not res!17457) (not e!18816))))

(declare-fun arrayContainsKey!0 (array!1759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29147 (= res!17457 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29148 () Bool)

(assert (=> b!29148 (= e!18815 tp_is_empty!1273)))

(assert (= (and start!4010 res!17455) b!29142))

(assert (= (and b!29142 res!17458) b!29139))

(assert (= (and b!29139 res!17453) b!29141))

(assert (= (and b!29141 res!17454) b!29146))

(assert (= (and b!29146 res!17459) b!29144))

(assert (= (and b!29144 res!17456) b!29147))

(assert (= (and b!29147 res!17457) b!29140))

(assert (= (and b!29143 condMapEmpty!1438) mapIsEmpty!1438))

(assert (= (and b!29143 (not condMapEmpty!1438)) mapNonEmpty!1438))

(assert (= (and mapNonEmpty!1438 ((_ is ValueCellFull!437) mapValue!1438)) b!29145))

(assert (= (and b!29143 ((_ is ValueCellFull!437) mapDefault!1438)) b!29148))

(assert (= start!4010 b!29143))

(declare-fun m!23249 () Bool)

(assert (=> b!29147 m!23249))

(declare-fun m!23251 () Bool)

(assert (=> b!29144 m!23251))

(declare-fun m!23253 () Bool)

(assert (=> b!29144 m!23253))

(declare-fun m!23255 () Bool)

(assert (=> mapNonEmpty!1438 m!23255))

(declare-fun m!23257 () Bool)

(assert (=> b!29139 m!23257))

(declare-fun m!23259 () Bool)

(assert (=> start!4010 m!23259))

(declare-fun m!23261 () Bool)

(assert (=> start!4010 m!23261))

(declare-fun m!23263 () Bool)

(assert (=> start!4010 m!23263))

(declare-fun m!23265 () Bool)

(assert (=> b!29141 m!23265))

(declare-fun m!23267 () Bool)

(assert (=> b!29146 m!23267))

(declare-fun m!23269 () Bool)

(assert (=> b!29140 m!23269))

(declare-fun m!23271 () Bool)

(assert (=> b!29140 m!23271))

(declare-fun m!23273 () Bool)

(assert (=> b!29140 m!23273))

(declare-fun m!23275 () Bool)

(assert (=> b!29140 m!23275))

(declare-fun m!23277 () Bool)

(assert (=> b!29140 m!23277))

(assert (=> b!29140 m!23269))

(declare-fun m!23279 () Bool)

(assert (=> b!29140 m!23279))

(check-sat (not b!29141) (not mapNonEmpty!1438) b_and!1719 (not b!29144) (not b!29139) tp_is_empty!1273 (not b!29147) (not start!4010) (not b!29140) (not b!29146) (not b_next!919))
(check-sat b_and!1719 (not b_next!919))
