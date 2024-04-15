; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112884 () Bool)

(assert start!112884)

(declare-fun mapNonEmpty!57160 () Bool)

(declare-fun mapRes!57160 () Bool)

(declare-fun tp!108860 () Bool)

(declare-fun e!762192 () Bool)

(assert (=> mapNonEmpty!57160 (= mapRes!57160 (and tp!108860 e!762192))))

(declare-datatypes ((V!54409 0))(
  ( (V!54410 (val!18564 Int)) )
))
(declare-datatypes ((ValueCell!17591 0))(
  ( (ValueCellFull!17591 (v!21210 V!54409)) (EmptyCell!17591) )
))
(declare-fun mapValue!57160 () ValueCell!17591)

(declare-fun mapKey!57160 () (_ BitVec 32))

(declare-fun mapRest!57160 () (Array (_ BitVec 32) ValueCell!17591))

(declare-datatypes ((array!90763 0))(
  ( (array!90764 (arr!43843 (Array (_ BitVec 32) ValueCell!17591)) (size!44395 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90763)

(assert (=> mapNonEmpty!57160 (= (arr!43843 _values!1303) (store mapRest!57160 mapKey!57160 mapValue!57160))))

(declare-fun mapIsEmpty!57160 () Bool)

(assert (=> mapIsEmpty!57160 mapRes!57160))

(declare-fun b!1338543 () Bool)

(declare-fun e!762194 () Bool)

(declare-fun tp_is_empty!36979 () Bool)

(assert (=> b!1338543 (= e!762194 tp_is_empty!36979)))

(declare-fun b!1338544 () Bool)

(declare-fun e!762193 () Bool)

(assert (=> b!1338544 (= e!762193 (and e!762194 mapRes!57160))))

(declare-fun condMapEmpty!57160 () Bool)

(declare-fun mapDefault!57160 () ValueCell!17591)

(assert (=> b!1338544 (= condMapEmpty!57160 (= (arr!43843 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17591)) mapDefault!57160)))))

(declare-fun res!888122 () Bool)

(declare-fun e!762195 () Bool)

(assert (=> start!112884 (=> (not res!888122) (not e!762195))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112884 (= res!888122 (validMask!0 mask!1977))))

(assert (=> start!112884 e!762195))

(assert (=> start!112884 true))

(declare-fun array_inv!33257 (array!90763) Bool)

(assert (=> start!112884 (and (array_inv!33257 _values!1303) e!762193)))

(declare-datatypes ((array!90765 0))(
  ( (array!90766 (arr!43844 (Array (_ BitVec 32) (_ BitVec 64))) (size!44396 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90765)

(declare-fun array_inv!33258 (array!90765) Bool)

(assert (=> start!112884 (array_inv!33258 _keys!1571)))

(declare-fun b!1338545 () Bool)

(assert (=> b!1338545 (= e!762192 tp_is_empty!36979)))

(declare-fun b!1338546 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338546 (= e!762195 (and (= (size!44395 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44396 _keys!1571) (size!44395 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (not (= (size!44396 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)))))))

(assert (= (and start!112884 res!888122) b!1338546))

(assert (= (and b!1338544 condMapEmpty!57160) mapIsEmpty!57160))

(assert (= (and b!1338544 (not condMapEmpty!57160)) mapNonEmpty!57160))

(get-info :version)

(assert (= (and mapNonEmpty!57160 ((_ is ValueCellFull!17591) mapValue!57160)) b!1338545))

(assert (= (and b!1338544 ((_ is ValueCellFull!17591) mapDefault!57160)) b!1338543))

(assert (= start!112884 b!1338544))

(declare-fun m!1226457 () Bool)

(assert (=> mapNonEmpty!57160 m!1226457))

(declare-fun m!1226459 () Bool)

(assert (=> start!112884 m!1226459))

(declare-fun m!1226461 () Bool)

(assert (=> start!112884 m!1226461))

(declare-fun m!1226463 () Bool)

(assert (=> start!112884 m!1226463))

(check-sat (not start!112884) (not mapNonEmpty!57160) tp_is_empty!36979)
(check-sat)
