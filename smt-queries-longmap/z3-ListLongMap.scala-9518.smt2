; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113194 () Bool)

(assert start!113194)

(declare-fun res!888908 () Bool)

(declare-fun e!763479 () Bool)

(assert (=> start!113194 (=> (not res!888908) (not e!763479))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113194 (= res!888908 (validMask!0 mask!1977))))

(assert (=> start!113194 e!763479))

(assert (=> start!113194 true))

(declare-datatypes ((V!54465 0))(
  ( (V!54466 (val!18585 Int)) )
))
(declare-datatypes ((ValueCell!17612 0))(
  ( (ValueCellFull!17612 (v!21228 V!54465)) (EmptyCell!17612) )
))
(declare-datatypes ((array!91027 0))(
  ( (array!91028 (arr!43965 (Array (_ BitVec 32) ValueCell!17612)) (size!44516 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91027)

(declare-fun e!763477 () Bool)

(declare-fun array_inv!33417 (array!91027) Bool)

(assert (=> start!113194 (and (array_inv!33417 _values!1303) e!763477)))

(declare-datatypes ((array!91029 0))(
  ( (array!91030 (arr!43966 (Array (_ BitVec 32) (_ BitVec 64))) (size!44517 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91029)

(declare-fun array_inv!33418 (array!91029) Bool)

(assert (=> start!113194 (array_inv!33418 _keys!1571)))

(declare-fun b!1340402 () Bool)

(declare-fun e!763480 () Bool)

(declare-fun mapRes!57238 () Bool)

(assert (=> b!1340402 (= e!763477 (and e!763480 mapRes!57238))))

(declare-fun condMapEmpty!57238 () Bool)

(declare-fun mapDefault!57238 () ValueCell!17612)

(assert (=> b!1340402 (= condMapEmpty!57238 (= (arr!43965 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17612)) mapDefault!57238)))))

(declare-fun b!1340403 () Bool)

(assert (=> b!1340403 (= e!763479 false)))

(declare-fun lt!594311 () Bool)

(declare-datatypes ((List!31143 0))(
  ( (Nil!31140) (Cons!31139 (h!32357 (_ BitVec 64)) (t!45467 List!31143)) )
))
(declare-fun arrayNoDuplicates!0 (array!91029 (_ BitVec 32) List!31143) Bool)

(assert (=> b!1340403 (= lt!594311 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31140))))

(declare-fun mapIsEmpty!57238 () Bool)

(assert (=> mapIsEmpty!57238 mapRes!57238))

(declare-fun b!1340404 () Bool)

(declare-fun res!888906 () Bool)

(assert (=> b!1340404 (=> (not res!888906) (not e!763479))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340404 (= res!888906 (and (= (size!44516 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44517 _keys!1571) (size!44516 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340405 () Bool)

(declare-fun tp_is_empty!37021 () Bool)

(assert (=> b!1340405 (= e!763480 tp_is_empty!37021)))

(declare-fun b!1340406 () Bool)

(declare-fun res!888907 () Bool)

(assert (=> b!1340406 (=> (not res!888907) (not e!763479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91029 (_ BitVec 32)) Bool)

(assert (=> b!1340406 (= res!888907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340407 () Bool)

(declare-fun e!763481 () Bool)

(assert (=> b!1340407 (= e!763481 tp_is_empty!37021)))

(declare-fun mapNonEmpty!57238 () Bool)

(declare-fun tp!108937 () Bool)

(assert (=> mapNonEmpty!57238 (= mapRes!57238 (and tp!108937 e!763481))))

(declare-fun mapValue!57238 () ValueCell!17612)

(declare-fun mapKey!57238 () (_ BitVec 32))

(declare-fun mapRest!57238 () (Array (_ BitVec 32) ValueCell!17612))

(assert (=> mapNonEmpty!57238 (= (arr!43965 _values!1303) (store mapRest!57238 mapKey!57238 mapValue!57238))))

(assert (= (and start!113194 res!888908) b!1340404))

(assert (= (and b!1340404 res!888906) b!1340406))

(assert (= (and b!1340406 res!888907) b!1340403))

(assert (= (and b!1340402 condMapEmpty!57238) mapIsEmpty!57238))

(assert (= (and b!1340402 (not condMapEmpty!57238)) mapNonEmpty!57238))

(get-info :version)

(assert (= (and mapNonEmpty!57238 ((_ is ValueCellFull!17612) mapValue!57238)) b!1340407))

(assert (= (and b!1340402 ((_ is ValueCellFull!17612) mapDefault!57238)) b!1340405))

(assert (= start!113194 b!1340402))

(declare-fun m!1228875 () Bool)

(assert (=> start!113194 m!1228875))

(declare-fun m!1228877 () Bool)

(assert (=> start!113194 m!1228877))

(declare-fun m!1228879 () Bool)

(assert (=> start!113194 m!1228879))

(declare-fun m!1228881 () Bool)

(assert (=> b!1340403 m!1228881))

(declare-fun m!1228883 () Bool)

(assert (=> b!1340406 m!1228883))

(declare-fun m!1228885 () Bool)

(assert (=> mapNonEmpty!57238 m!1228885))

(check-sat (not mapNonEmpty!57238) tp_is_empty!37021 (not start!113194) (not b!1340406) (not b!1340403))
(check-sat)
