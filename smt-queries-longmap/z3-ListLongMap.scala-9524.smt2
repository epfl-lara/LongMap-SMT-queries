; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113006 () Bool)

(assert start!113006)

(declare-fun b!1339357 () Bool)

(declare-fun res!888522 () Bool)

(declare-fun e!762873 () Bool)

(assert (=> b!1339357 (=> (not res!888522) (not e!762873))))

(declare-datatypes ((array!90919 0))(
  ( (array!90920 (arr!43916 (Array (_ BitVec 32) (_ BitVec 64))) (size!44468 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90919)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90919 (_ BitVec 32)) Bool)

(assert (=> b!1339357 (= res!888522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!888523 () Bool)

(assert (=> start!113006 (=> (not res!888523) (not e!762873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113006 (= res!888523 (validMask!0 mask!1977))))

(assert (=> start!113006 e!762873))

(assert (=> start!113006 true))

(declare-datatypes ((V!54513 0))(
  ( (V!54514 (val!18603 Int)) )
))
(declare-datatypes ((ValueCell!17630 0))(
  ( (ValueCellFull!17630 (v!21250 V!54513)) (EmptyCell!17630) )
))
(declare-datatypes ((array!90921 0))(
  ( (array!90922 (arr!43917 (Array (_ BitVec 32) ValueCell!17630)) (size!44469 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90921)

(declare-fun e!762874 () Bool)

(declare-fun array_inv!33307 (array!90921) Bool)

(assert (=> start!113006 (and (array_inv!33307 _values!1303) e!762874)))

(declare-fun array_inv!33308 (array!90919) Bool)

(assert (=> start!113006 (array_inv!33308 _keys!1571)))

(declare-fun mapNonEmpty!57292 () Bool)

(declare-fun mapRes!57292 () Bool)

(declare-fun tp!108992 () Bool)

(declare-fun e!762875 () Bool)

(assert (=> mapNonEmpty!57292 (= mapRes!57292 (and tp!108992 e!762875))))

(declare-fun mapRest!57292 () (Array (_ BitVec 32) ValueCell!17630))

(declare-fun mapKey!57292 () (_ BitVec 32))

(declare-fun mapValue!57292 () ValueCell!17630)

(assert (=> mapNonEmpty!57292 (= (arr!43917 _values!1303) (store mapRest!57292 mapKey!57292 mapValue!57292))))

(declare-fun b!1339358 () Bool)

(declare-fun e!762871 () Bool)

(declare-fun tp_is_empty!37057 () Bool)

(assert (=> b!1339358 (= e!762871 tp_is_empty!37057)))

(declare-fun b!1339359 () Bool)

(assert (=> b!1339359 (= e!762873 false)))

(declare-fun lt!593703 () Bool)

(declare-datatypes ((List!31154 0))(
  ( (Nil!31151) (Cons!31150 (h!32359 (_ BitVec 64)) (t!45478 List!31154)) )
))
(declare-fun arrayNoDuplicates!0 (array!90919 (_ BitVec 32) List!31154) Bool)

(assert (=> b!1339359 (= lt!593703 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31151))))

(declare-fun b!1339360 () Bool)

(assert (=> b!1339360 (= e!762874 (and e!762871 mapRes!57292))))

(declare-fun condMapEmpty!57292 () Bool)

(declare-fun mapDefault!57292 () ValueCell!17630)

(assert (=> b!1339360 (= condMapEmpty!57292 (= (arr!43917 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17630)) mapDefault!57292)))))

(declare-fun mapIsEmpty!57292 () Bool)

(assert (=> mapIsEmpty!57292 mapRes!57292))

(declare-fun b!1339361 () Bool)

(declare-fun res!888521 () Bool)

(assert (=> b!1339361 (=> (not res!888521) (not e!762873))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339361 (= res!888521 (and (= (size!44469 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44468 _keys!1571) (size!44469 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339362 () Bool)

(assert (=> b!1339362 (= e!762875 tp_is_empty!37057)))

(assert (= (and start!113006 res!888523) b!1339361))

(assert (= (and b!1339361 res!888521) b!1339357))

(assert (= (and b!1339357 res!888522) b!1339359))

(assert (= (and b!1339360 condMapEmpty!57292) mapIsEmpty!57292))

(assert (= (and b!1339360 (not condMapEmpty!57292)) mapNonEmpty!57292))

(get-info :version)

(assert (= (and mapNonEmpty!57292 ((_ is ValueCellFull!17630) mapValue!57292)) b!1339362))

(assert (= (and b!1339360 ((_ is ValueCellFull!17630) mapDefault!57292)) b!1339358))

(assert (= start!113006 b!1339360))

(declare-fun m!1226977 () Bool)

(assert (=> b!1339357 m!1226977))

(declare-fun m!1226979 () Bool)

(assert (=> start!113006 m!1226979))

(declare-fun m!1226981 () Bool)

(assert (=> start!113006 m!1226981))

(declare-fun m!1226983 () Bool)

(assert (=> start!113006 m!1226983))

(declare-fun m!1226985 () Bool)

(assert (=> mapNonEmpty!57292 m!1226985))

(declare-fun m!1226987 () Bool)

(assert (=> b!1339359 m!1226987))

(check-sat tp_is_empty!37057 (not b!1339359) (not start!113006) (not b!1339357) (not mapNonEmpty!57292))
(check-sat)
