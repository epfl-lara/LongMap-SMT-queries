; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113224 () Bool)

(assert start!113224)

(declare-fun res!889041 () Bool)

(declare-fun e!763705 () Bool)

(assert (=> start!113224 (=> (not res!889041) (not e!763705))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113224 (= res!889041 (validMask!0 mask!1977))))

(assert (=> start!113224 e!763705))

(assert (=> start!113224 true))

(declare-datatypes ((V!54505 0))(
  ( (V!54506 (val!18600 Int)) )
))
(declare-datatypes ((ValueCell!17627 0))(
  ( (ValueCellFull!17627 (v!21243 V!54505)) (EmptyCell!17627) )
))
(declare-datatypes ((array!91081 0))(
  ( (array!91082 (arr!43992 (Array (_ BitVec 32) ValueCell!17627)) (size!44543 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91081)

(declare-fun e!763704 () Bool)

(declare-fun array_inv!33435 (array!91081) Bool)

(assert (=> start!113224 (and (array_inv!33435 _values!1303) e!763704)))

(declare-datatypes ((array!91083 0))(
  ( (array!91084 (arr!43993 (Array (_ BitVec 32) (_ BitVec 64))) (size!44544 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91083)

(declare-fun array_inv!33436 (array!91083) Bool)

(assert (=> start!113224 (array_inv!33436 _keys!1571)))

(declare-fun b!1340672 () Bool)

(declare-fun res!889043 () Bool)

(assert (=> b!1340672 (=> (not res!889043) (not e!763705))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340672 (= res!889043 (and (= (size!44543 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44544 _keys!1571) (size!44543 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57283 () Bool)

(declare-fun mapRes!57283 () Bool)

(declare-fun tp!108982 () Bool)

(declare-fun e!763702 () Bool)

(assert (=> mapNonEmpty!57283 (= mapRes!57283 (and tp!108982 e!763702))))

(declare-fun mapRest!57283 () (Array (_ BitVec 32) ValueCell!17627))

(declare-fun mapKey!57283 () (_ BitVec 32))

(declare-fun mapValue!57283 () ValueCell!17627)

(assert (=> mapNonEmpty!57283 (= (arr!43992 _values!1303) (store mapRest!57283 mapKey!57283 mapValue!57283))))

(declare-fun b!1340673 () Bool)

(declare-fun tp_is_empty!37051 () Bool)

(assert (=> b!1340673 (= e!763702 tp_is_empty!37051)))

(declare-fun b!1340674 () Bool)

(assert (=> b!1340674 (= e!763705 false)))

(declare-fun lt!594356 () Bool)

(declare-datatypes ((List!31150 0))(
  ( (Nil!31147) (Cons!31146 (h!32364 (_ BitVec 64)) (t!45474 List!31150)) )
))
(declare-fun arrayNoDuplicates!0 (array!91083 (_ BitVec 32) List!31150) Bool)

(assert (=> b!1340674 (= lt!594356 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31147))))

(declare-fun b!1340675 () Bool)

(declare-fun res!889042 () Bool)

(assert (=> b!1340675 (=> (not res!889042) (not e!763705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91083 (_ BitVec 32)) Bool)

(assert (=> b!1340675 (= res!889042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340676 () Bool)

(declare-fun e!763703 () Bool)

(assert (=> b!1340676 (= e!763704 (and e!763703 mapRes!57283))))

(declare-fun condMapEmpty!57283 () Bool)

(declare-fun mapDefault!57283 () ValueCell!17627)

(assert (=> b!1340676 (= condMapEmpty!57283 (= (arr!43992 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17627)) mapDefault!57283)))))

(declare-fun b!1340677 () Bool)

(assert (=> b!1340677 (= e!763703 tp_is_empty!37051)))

(declare-fun mapIsEmpty!57283 () Bool)

(assert (=> mapIsEmpty!57283 mapRes!57283))

(assert (= (and start!113224 res!889041) b!1340672))

(assert (= (and b!1340672 res!889043) b!1340675))

(assert (= (and b!1340675 res!889042) b!1340674))

(assert (= (and b!1340676 condMapEmpty!57283) mapIsEmpty!57283))

(assert (= (and b!1340676 (not condMapEmpty!57283)) mapNonEmpty!57283))

(get-info :version)

(assert (= (and mapNonEmpty!57283 ((_ is ValueCellFull!17627) mapValue!57283)) b!1340673))

(assert (= (and b!1340676 ((_ is ValueCellFull!17627) mapDefault!57283)) b!1340677))

(assert (= start!113224 b!1340676))

(declare-fun m!1229055 () Bool)

(assert (=> start!113224 m!1229055))

(declare-fun m!1229057 () Bool)

(assert (=> start!113224 m!1229057))

(declare-fun m!1229059 () Bool)

(assert (=> start!113224 m!1229059))

(declare-fun m!1229061 () Bool)

(assert (=> mapNonEmpty!57283 m!1229061))

(declare-fun m!1229063 () Bool)

(assert (=> b!1340674 m!1229063))

(declare-fun m!1229065 () Bool)

(assert (=> b!1340675 m!1229065))

(check-sat (not mapNonEmpty!57283) (not b!1340675) (not start!113224) tp_is_empty!37051 (not b!1340674))
(check-sat)
