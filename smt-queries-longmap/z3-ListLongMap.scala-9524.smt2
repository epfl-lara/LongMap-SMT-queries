; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113230 () Bool)

(assert start!113230)

(declare-fun b!1340726 () Bool)

(declare-fun e!763750 () Bool)

(declare-fun tp_is_empty!37057 () Bool)

(assert (=> b!1340726 (= e!763750 tp_is_empty!37057)))

(declare-fun b!1340727 () Bool)

(declare-fun e!763751 () Bool)

(assert (=> b!1340727 (= e!763751 tp_is_empty!37057)))

(declare-fun b!1340728 () Bool)

(declare-fun res!889070 () Bool)

(declare-fun e!763747 () Bool)

(assert (=> b!1340728 (=> (not res!889070) (not e!763747))))

(declare-datatypes ((array!91093 0))(
  ( (array!91094 (arr!43998 (Array (_ BitVec 32) (_ BitVec 64))) (size!44549 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91093)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54513 0))(
  ( (V!54514 (val!18603 Int)) )
))
(declare-datatypes ((ValueCell!17630 0))(
  ( (ValueCellFull!17630 (v!21246 V!54513)) (EmptyCell!17630) )
))
(declare-datatypes ((array!91095 0))(
  ( (array!91096 (arr!43999 (Array (_ BitVec 32) ValueCell!17630)) (size!44550 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91095)

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1340728 (= res!889070 (and (= (size!44550 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44549 _keys!1571) (size!44550 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340729 () Bool)

(declare-fun res!889069 () Bool)

(assert (=> b!1340729 (=> (not res!889069) (not e!763747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91093 (_ BitVec 32)) Bool)

(assert (=> b!1340729 (= res!889069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340730 () Bool)

(assert (=> b!1340730 (= e!763747 false)))

(declare-fun lt!594365 () Bool)

(declare-datatypes ((List!31153 0))(
  ( (Nil!31150) (Cons!31149 (h!32367 (_ BitVec 64)) (t!45477 List!31153)) )
))
(declare-fun arrayNoDuplicates!0 (array!91093 (_ BitVec 32) List!31153) Bool)

(assert (=> b!1340730 (= lt!594365 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31150))))

(declare-fun mapNonEmpty!57292 () Bool)

(declare-fun mapRes!57292 () Bool)

(declare-fun tp!108991 () Bool)

(assert (=> mapNonEmpty!57292 (= mapRes!57292 (and tp!108991 e!763751))))

(declare-fun mapValue!57292 () ValueCell!17630)

(declare-fun mapKey!57292 () (_ BitVec 32))

(declare-fun mapRest!57292 () (Array (_ BitVec 32) ValueCell!17630))

(assert (=> mapNonEmpty!57292 (= (arr!43999 _values!1303) (store mapRest!57292 mapKey!57292 mapValue!57292))))

(declare-fun res!889068 () Bool)

(assert (=> start!113230 (=> (not res!889068) (not e!763747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113230 (= res!889068 (validMask!0 mask!1977))))

(assert (=> start!113230 e!763747))

(assert (=> start!113230 true))

(declare-fun e!763749 () Bool)

(declare-fun array_inv!33441 (array!91095) Bool)

(assert (=> start!113230 (and (array_inv!33441 _values!1303) e!763749)))

(declare-fun array_inv!33442 (array!91093) Bool)

(assert (=> start!113230 (array_inv!33442 _keys!1571)))

(declare-fun b!1340731 () Bool)

(assert (=> b!1340731 (= e!763749 (and e!763750 mapRes!57292))))

(declare-fun condMapEmpty!57292 () Bool)

(declare-fun mapDefault!57292 () ValueCell!17630)

(assert (=> b!1340731 (= condMapEmpty!57292 (= (arr!43999 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17630)) mapDefault!57292)))))

(declare-fun mapIsEmpty!57292 () Bool)

(assert (=> mapIsEmpty!57292 mapRes!57292))

(assert (= (and start!113230 res!889068) b!1340728))

(assert (= (and b!1340728 res!889070) b!1340729))

(assert (= (and b!1340729 res!889069) b!1340730))

(assert (= (and b!1340731 condMapEmpty!57292) mapIsEmpty!57292))

(assert (= (and b!1340731 (not condMapEmpty!57292)) mapNonEmpty!57292))

(get-info :version)

(assert (= (and mapNonEmpty!57292 ((_ is ValueCellFull!17630) mapValue!57292)) b!1340727))

(assert (= (and b!1340731 ((_ is ValueCellFull!17630) mapDefault!57292)) b!1340726))

(assert (= start!113230 b!1340731))

(declare-fun m!1229091 () Bool)

(assert (=> b!1340729 m!1229091))

(declare-fun m!1229093 () Bool)

(assert (=> b!1340730 m!1229093))

(declare-fun m!1229095 () Bool)

(assert (=> mapNonEmpty!57292 m!1229095))

(declare-fun m!1229097 () Bool)

(assert (=> start!113230 m!1229097))

(declare-fun m!1229099 () Bool)

(assert (=> start!113230 m!1229099))

(declare-fun m!1229101 () Bool)

(assert (=> start!113230 m!1229101))

(check-sat (not start!113230) (not b!1340729) tp_is_empty!37057 (not b!1340730) (not mapNonEmpty!57292))
(check-sat)
