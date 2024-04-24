; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113200 () Bool)

(assert start!113200)

(declare-fun b!1340456 () Bool)

(declare-fun e!763522 () Bool)

(declare-fun tp_is_empty!37027 () Bool)

(assert (=> b!1340456 (= e!763522 tp_is_empty!37027)))

(declare-fun b!1340457 () Bool)

(declare-fun e!763523 () Bool)

(declare-fun mapRes!57247 () Bool)

(assert (=> b!1340457 (= e!763523 (and e!763522 mapRes!57247))))

(declare-fun condMapEmpty!57247 () Bool)

(declare-datatypes ((V!54473 0))(
  ( (V!54474 (val!18588 Int)) )
))
(declare-datatypes ((ValueCell!17615 0))(
  ( (ValueCellFull!17615 (v!21231 V!54473)) (EmptyCell!17615) )
))
(declare-datatypes ((array!91039 0))(
  ( (array!91040 (arr!43971 (Array (_ BitVec 32) ValueCell!17615)) (size!44522 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91039)

(declare-fun mapDefault!57247 () ValueCell!17615)

(assert (=> b!1340457 (= condMapEmpty!57247 (= (arr!43971 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17615)) mapDefault!57247)))))

(declare-fun mapNonEmpty!57247 () Bool)

(declare-fun tp!108946 () Bool)

(declare-fun e!763524 () Bool)

(assert (=> mapNonEmpty!57247 (= mapRes!57247 (and tp!108946 e!763524))))

(declare-fun mapValue!57247 () ValueCell!17615)

(declare-fun mapRest!57247 () (Array (_ BitVec 32) ValueCell!17615))

(declare-fun mapKey!57247 () (_ BitVec 32))

(assert (=> mapNonEmpty!57247 (= (arr!43971 _values!1303) (store mapRest!57247 mapKey!57247 mapValue!57247))))

(declare-fun mapIsEmpty!57247 () Bool)

(assert (=> mapIsEmpty!57247 mapRes!57247))

(declare-fun b!1340459 () Bool)

(declare-fun res!888934 () Bool)

(declare-fun e!763526 () Bool)

(assert (=> b!1340459 (=> (not res!888934) (not e!763526))))

(declare-datatypes ((array!91041 0))(
  ( (array!91042 (arr!43972 (Array (_ BitVec 32) (_ BitVec 64))) (size!44523 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91041)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91041 (_ BitVec 32)) Bool)

(assert (=> b!1340459 (= res!888934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340460 () Bool)

(assert (=> b!1340460 (= e!763526 false)))

(declare-fun lt!594320 () Bool)

(declare-datatypes ((List!31144 0))(
  ( (Nil!31141) (Cons!31140 (h!32358 (_ BitVec 64)) (t!45468 List!31144)) )
))
(declare-fun arrayNoDuplicates!0 (array!91041 (_ BitVec 32) List!31144) Bool)

(assert (=> b!1340460 (= lt!594320 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31141))))

(declare-fun b!1340461 () Bool)

(declare-fun res!888933 () Bool)

(assert (=> b!1340461 (=> (not res!888933) (not e!763526))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340461 (= res!888933 (and (= (size!44522 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44523 _keys!1571) (size!44522 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888935 () Bool)

(assert (=> start!113200 (=> (not res!888935) (not e!763526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113200 (= res!888935 (validMask!0 mask!1977))))

(assert (=> start!113200 e!763526))

(assert (=> start!113200 true))

(declare-fun array_inv!33419 (array!91039) Bool)

(assert (=> start!113200 (and (array_inv!33419 _values!1303) e!763523)))

(declare-fun array_inv!33420 (array!91041) Bool)

(assert (=> start!113200 (array_inv!33420 _keys!1571)))

(declare-fun b!1340458 () Bool)

(assert (=> b!1340458 (= e!763524 tp_is_empty!37027)))

(assert (= (and start!113200 res!888935) b!1340461))

(assert (= (and b!1340461 res!888933) b!1340459))

(assert (= (and b!1340459 res!888934) b!1340460))

(assert (= (and b!1340457 condMapEmpty!57247) mapIsEmpty!57247))

(assert (= (and b!1340457 (not condMapEmpty!57247)) mapNonEmpty!57247))

(get-info :version)

(assert (= (and mapNonEmpty!57247 ((_ is ValueCellFull!17615) mapValue!57247)) b!1340458))

(assert (= (and b!1340457 ((_ is ValueCellFull!17615) mapDefault!57247)) b!1340456))

(assert (= start!113200 b!1340457))

(declare-fun m!1228911 () Bool)

(assert (=> mapNonEmpty!57247 m!1228911))

(declare-fun m!1228913 () Bool)

(assert (=> b!1340459 m!1228913))

(declare-fun m!1228915 () Bool)

(assert (=> b!1340460 m!1228915))

(declare-fun m!1228917 () Bool)

(assert (=> start!113200 m!1228917))

(declare-fun m!1228919 () Bool)

(assert (=> start!113200 m!1228919))

(declare-fun m!1228921 () Bool)

(assert (=> start!113200 m!1228921))

(check-sat (not b!1340460) (not b!1340459) (not mapNonEmpty!57247) tp_is_empty!37027 (not start!113200))
(check-sat)
