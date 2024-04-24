; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113218 () Bool)

(assert start!113218)

(declare-fun b!1340618 () Bool)

(declare-fun res!889016 () Bool)

(declare-fun e!763659 () Bool)

(assert (=> b!1340618 (=> (not res!889016) (not e!763659))))

(declare-datatypes ((array!91069 0))(
  ( (array!91070 (arr!43986 (Array (_ BitVec 32) (_ BitVec 64))) (size!44537 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91069)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54497 0))(
  ( (V!54498 (val!18597 Int)) )
))
(declare-datatypes ((ValueCell!17624 0))(
  ( (ValueCellFull!17624 (v!21240 V!54497)) (EmptyCell!17624) )
))
(declare-datatypes ((array!91071 0))(
  ( (array!91072 (arr!43987 (Array (_ BitVec 32) ValueCell!17624)) (size!44538 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91071)

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1340618 (= res!889016 (and (= (size!44538 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44537 _keys!1571) (size!44538 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57274 () Bool)

(declare-fun mapRes!57274 () Bool)

(assert (=> mapIsEmpty!57274 mapRes!57274))

(declare-fun b!1340619 () Bool)

(declare-fun e!763661 () Bool)

(declare-fun tp_is_empty!37045 () Bool)

(assert (=> b!1340619 (= e!763661 tp_is_empty!37045)))

(declare-fun b!1340620 () Bool)

(declare-fun res!889015 () Bool)

(assert (=> b!1340620 (=> (not res!889015) (not e!763659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91069 (_ BitVec 32)) Bool)

(assert (=> b!1340620 (= res!889015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340621 () Bool)

(assert (=> b!1340621 (= e!763659 false)))

(declare-fun lt!594347 () Bool)

(declare-datatypes ((List!31148 0))(
  ( (Nil!31145) (Cons!31144 (h!32362 (_ BitVec 64)) (t!45472 List!31148)) )
))
(declare-fun arrayNoDuplicates!0 (array!91069 (_ BitVec 32) List!31148) Bool)

(assert (=> b!1340621 (= lt!594347 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31145))))

(declare-fun b!1340622 () Bool)

(declare-fun e!763658 () Bool)

(declare-fun e!763657 () Bool)

(assert (=> b!1340622 (= e!763658 (and e!763657 mapRes!57274))))

(declare-fun condMapEmpty!57274 () Bool)

(declare-fun mapDefault!57274 () ValueCell!17624)

(assert (=> b!1340622 (= condMapEmpty!57274 (= (arr!43987 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17624)) mapDefault!57274)))))

(declare-fun b!1340623 () Bool)

(assert (=> b!1340623 (= e!763657 tp_is_empty!37045)))

(declare-fun mapNonEmpty!57274 () Bool)

(declare-fun tp!108973 () Bool)

(assert (=> mapNonEmpty!57274 (= mapRes!57274 (and tp!108973 e!763661))))

(declare-fun mapKey!57274 () (_ BitVec 32))

(declare-fun mapRest!57274 () (Array (_ BitVec 32) ValueCell!17624))

(declare-fun mapValue!57274 () ValueCell!17624)

(assert (=> mapNonEmpty!57274 (= (arr!43987 _values!1303) (store mapRest!57274 mapKey!57274 mapValue!57274))))

(declare-fun res!889014 () Bool)

(assert (=> start!113218 (=> (not res!889014) (not e!763659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113218 (= res!889014 (validMask!0 mask!1977))))

(assert (=> start!113218 e!763659))

(assert (=> start!113218 true))

(declare-fun array_inv!33431 (array!91071) Bool)

(assert (=> start!113218 (and (array_inv!33431 _values!1303) e!763658)))

(declare-fun array_inv!33432 (array!91069) Bool)

(assert (=> start!113218 (array_inv!33432 _keys!1571)))

(assert (= (and start!113218 res!889014) b!1340618))

(assert (= (and b!1340618 res!889016) b!1340620))

(assert (= (and b!1340620 res!889015) b!1340621))

(assert (= (and b!1340622 condMapEmpty!57274) mapIsEmpty!57274))

(assert (= (and b!1340622 (not condMapEmpty!57274)) mapNonEmpty!57274))

(get-info :version)

(assert (= (and mapNonEmpty!57274 ((_ is ValueCellFull!17624) mapValue!57274)) b!1340619))

(assert (= (and b!1340622 ((_ is ValueCellFull!17624) mapDefault!57274)) b!1340623))

(assert (= start!113218 b!1340622))

(declare-fun m!1229019 () Bool)

(assert (=> b!1340620 m!1229019))

(declare-fun m!1229021 () Bool)

(assert (=> b!1340621 m!1229021))

(declare-fun m!1229023 () Bool)

(assert (=> mapNonEmpty!57274 m!1229023))

(declare-fun m!1229025 () Bool)

(assert (=> start!113218 m!1229025))

(declare-fun m!1229027 () Bool)

(assert (=> start!113218 m!1229027))

(declare-fun m!1229029 () Bool)

(assert (=> start!113218 m!1229029))

(check-sat (not b!1340621) (not start!113218) (not b!1340620) (not mapNonEmpty!57274) tp_is_empty!37045)
(check-sat)
