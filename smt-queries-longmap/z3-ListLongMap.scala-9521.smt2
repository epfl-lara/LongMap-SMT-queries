; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113212 () Bool)

(assert start!113212)

(declare-fun mapNonEmpty!57265 () Bool)

(declare-fun mapRes!57265 () Bool)

(declare-fun tp!108964 () Bool)

(declare-fun e!763613 () Bool)

(assert (=> mapNonEmpty!57265 (= mapRes!57265 (and tp!108964 e!763613))))

(declare-datatypes ((V!54489 0))(
  ( (V!54490 (val!18594 Int)) )
))
(declare-datatypes ((ValueCell!17621 0))(
  ( (ValueCellFull!17621 (v!21237 V!54489)) (EmptyCell!17621) )
))
(declare-fun mapValue!57265 () ValueCell!17621)

(declare-fun mapKey!57265 () (_ BitVec 32))

(declare-fun mapRest!57265 () (Array (_ BitVec 32) ValueCell!17621))

(declare-datatypes ((array!91059 0))(
  ( (array!91060 (arr!43981 (Array (_ BitVec 32) ValueCell!17621)) (size!44532 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91059)

(assert (=> mapNonEmpty!57265 (= (arr!43981 _values!1303) (store mapRest!57265 mapKey!57265 mapValue!57265))))

(declare-fun b!1340564 () Bool)

(declare-fun e!763614 () Bool)

(declare-fun e!763615 () Bool)

(assert (=> b!1340564 (= e!763614 (and e!763615 mapRes!57265))))

(declare-fun condMapEmpty!57265 () Bool)

(declare-fun mapDefault!57265 () ValueCell!17621)

(assert (=> b!1340564 (= condMapEmpty!57265 (= (arr!43981 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17621)) mapDefault!57265)))))

(declare-fun b!1340565 () Bool)

(declare-fun res!888987 () Bool)

(declare-fun e!763612 () Bool)

(assert (=> b!1340565 (=> (not res!888987) (not e!763612))))

(declare-datatypes ((array!91061 0))(
  ( (array!91062 (arr!43982 (Array (_ BitVec 32) (_ BitVec 64))) (size!44533 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91061)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91061 (_ BitVec 32)) Bool)

(assert (=> b!1340565 (= res!888987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!888988 () Bool)

(assert (=> start!113212 (=> (not res!888988) (not e!763612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113212 (= res!888988 (validMask!0 mask!1977))))

(assert (=> start!113212 e!763612))

(assert (=> start!113212 true))

(declare-fun array_inv!33427 (array!91059) Bool)

(assert (=> start!113212 (and (array_inv!33427 _values!1303) e!763614)))

(declare-fun array_inv!33428 (array!91061) Bool)

(assert (=> start!113212 (array_inv!33428 _keys!1571)))

(declare-fun mapIsEmpty!57265 () Bool)

(assert (=> mapIsEmpty!57265 mapRes!57265))

(declare-fun b!1340566 () Bool)

(declare-fun tp_is_empty!37039 () Bool)

(assert (=> b!1340566 (= e!763615 tp_is_empty!37039)))

(declare-fun b!1340567 () Bool)

(declare-fun res!888989 () Bool)

(assert (=> b!1340567 (=> (not res!888989) (not e!763612))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340567 (= res!888989 (and (= (size!44532 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44533 _keys!1571) (size!44532 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340568 () Bool)

(assert (=> b!1340568 (= e!763612 false)))

(declare-fun lt!594338 () Bool)

(declare-datatypes ((List!31147 0))(
  ( (Nil!31144) (Cons!31143 (h!32361 (_ BitVec 64)) (t!45471 List!31147)) )
))
(declare-fun arrayNoDuplicates!0 (array!91061 (_ BitVec 32) List!31147) Bool)

(assert (=> b!1340568 (= lt!594338 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31144))))

(declare-fun b!1340569 () Bool)

(assert (=> b!1340569 (= e!763613 tp_is_empty!37039)))

(assert (= (and start!113212 res!888988) b!1340567))

(assert (= (and b!1340567 res!888989) b!1340565))

(assert (= (and b!1340565 res!888987) b!1340568))

(assert (= (and b!1340564 condMapEmpty!57265) mapIsEmpty!57265))

(assert (= (and b!1340564 (not condMapEmpty!57265)) mapNonEmpty!57265))

(get-info :version)

(assert (= (and mapNonEmpty!57265 ((_ is ValueCellFull!17621) mapValue!57265)) b!1340569))

(assert (= (and b!1340564 ((_ is ValueCellFull!17621) mapDefault!57265)) b!1340566))

(assert (= start!113212 b!1340564))

(declare-fun m!1228983 () Bool)

(assert (=> mapNonEmpty!57265 m!1228983))

(declare-fun m!1228985 () Bool)

(assert (=> b!1340565 m!1228985))

(declare-fun m!1228987 () Bool)

(assert (=> start!113212 m!1228987))

(declare-fun m!1228989 () Bool)

(assert (=> start!113212 m!1228989))

(declare-fun m!1228991 () Bool)

(assert (=> start!113212 m!1228991))

(declare-fun m!1228993 () Bool)

(assert (=> b!1340568 m!1228993))

(check-sat (not start!113212) tp_is_empty!37039 (not b!1340565) (not mapNonEmpty!57265) (not b!1340568))
(check-sat)
