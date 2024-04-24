; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113188 () Bool)

(assert start!113188)

(declare-fun b!1340348 () Bool)

(declare-fun res!888879 () Bool)

(declare-fun e!763434 () Bool)

(assert (=> b!1340348 (=> (not res!888879) (not e!763434))))

(declare-datatypes ((array!91015 0))(
  ( (array!91016 (arr!43959 (Array (_ BitVec 32) (_ BitVec 64))) (size!44510 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91015)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91015 (_ BitVec 32)) Bool)

(assert (=> b!1340348 (= res!888879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57229 () Bool)

(declare-fun mapRes!57229 () Bool)

(declare-fun tp!108928 () Bool)

(declare-fun e!763432 () Bool)

(assert (=> mapNonEmpty!57229 (= mapRes!57229 (and tp!108928 e!763432))))

(declare-fun mapKey!57229 () (_ BitVec 32))

(declare-datatypes ((V!54457 0))(
  ( (V!54458 (val!18582 Int)) )
))
(declare-datatypes ((ValueCell!17609 0))(
  ( (ValueCellFull!17609 (v!21225 V!54457)) (EmptyCell!17609) )
))
(declare-fun mapValue!57229 () ValueCell!17609)

(declare-fun mapRest!57229 () (Array (_ BitVec 32) ValueCell!17609))

(declare-datatypes ((array!91017 0))(
  ( (array!91018 (arr!43960 (Array (_ BitVec 32) ValueCell!17609)) (size!44511 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91017)

(assert (=> mapNonEmpty!57229 (= (arr!43960 _values!1303) (store mapRest!57229 mapKey!57229 mapValue!57229))))

(declare-fun b!1340349 () Bool)

(assert (=> b!1340349 (= e!763434 false)))

(declare-fun lt!594302 () Bool)

(declare-datatypes ((List!31140 0))(
  ( (Nil!31137) (Cons!31136 (h!32354 (_ BitVec 64)) (t!45464 List!31140)) )
))
(declare-fun arrayNoDuplicates!0 (array!91015 (_ BitVec 32) List!31140) Bool)

(assert (=> b!1340349 (= lt!594302 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31137))))

(declare-fun b!1340350 () Bool)

(declare-fun tp_is_empty!37015 () Bool)

(assert (=> b!1340350 (= e!763432 tp_is_empty!37015)))

(declare-fun b!1340351 () Bool)

(declare-fun res!888880 () Bool)

(assert (=> b!1340351 (=> (not res!888880) (not e!763434))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340351 (= res!888880 (and (= (size!44511 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44510 _keys!1571) (size!44511 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888881 () Bool)

(assert (=> start!113188 (=> (not res!888881) (not e!763434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113188 (= res!888881 (validMask!0 mask!1977))))

(assert (=> start!113188 e!763434))

(assert (=> start!113188 true))

(declare-fun e!763436 () Bool)

(declare-fun array_inv!33415 (array!91017) Bool)

(assert (=> start!113188 (and (array_inv!33415 _values!1303) e!763436)))

(declare-fun array_inv!33416 (array!91015) Bool)

(assert (=> start!113188 (array_inv!33416 _keys!1571)))

(declare-fun b!1340352 () Bool)

(declare-fun e!763435 () Bool)

(assert (=> b!1340352 (= e!763435 tp_is_empty!37015)))

(declare-fun b!1340353 () Bool)

(assert (=> b!1340353 (= e!763436 (and e!763435 mapRes!57229))))

(declare-fun condMapEmpty!57229 () Bool)

(declare-fun mapDefault!57229 () ValueCell!17609)

(assert (=> b!1340353 (= condMapEmpty!57229 (= (arr!43960 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17609)) mapDefault!57229)))))

(declare-fun mapIsEmpty!57229 () Bool)

(assert (=> mapIsEmpty!57229 mapRes!57229))

(assert (= (and start!113188 res!888881) b!1340351))

(assert (= (and b!1340351 res!888880) b!1340348))

(assert (= (and b!1340348 res!888879) b!1340349))

(assert (= (and b!1340353 condMapEmpty!57229) mapIsEmpty!57229))

(assert (= (and b!1340353 (not condMapEmpty!57229)) mapNonEmpty!57229))

(get-info :version)

(assert (= (and mapNonEmpty!57229 ((_ is ValueCellFull!17609) mapValue!57229)) b!1340350))

(assert (= (and b!1340353 ((_ is ValueCellFull!17609) mapDefault!57229)) b!1340352))

(assert (= start!113188 b!1340353))

(declare-fun m!1228839 () Bool)

(assert (=> b!1340348 m!1228839))

(declare-fun m!1228841 () Bool)

(assert (=> mapNonEmpty!57229 m!1228841))

(declare-fun m!1228843 () Bool)

(assert (=> b!1340349 m!1228843))

(declare-fun m!1228845 () Bool)

(assert (=> start!113188 m!1228845))

(declare-fun m!1228847 () Bool)

(assert (=> start!113188 m!1228847))

(declare-fun m!1228849 () Bool)

(assert (=> start!113188 m!1228849))

(check-sat (not start!113188) (not b!1340349) tp_is_empty!37015 (not b!1340348) (not mapNonEmpty!57229))
(check-sat)
