; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83908 () Bool)

(assert start!83908)

(declare-fun b!980607 () Bool)

(declare-fun e!552709 () Bool)

(declare-fun tp_is_empty!22729 () Bool)

(assert (=> b!980607 (= e!552709 tp_is_empty!22729)))

(declare-fun mapIsEmpty!36122 () Bool)

(declare-fun mapRes!36122 () Bool)

(assert (=> mapIsEmpty!36122 mapRes!36122))

(declare-fun b!980608 () Bool)

(declare-fun e!552710 () Bool)

(assert (=> b!980608 (= e!552710 tp_is_empty!22729)))

(declare-fun b!980609 () Bool)

(declare-fun e!552706 () Bool)

(assert (=> b!980609 (= e!552706 false)))

(declare-fun lt!435375 () Bool)

(declare-datatypes ((array!61392 0))(
  ( (array!61393 (arr!29554 (Array (_ BitVec 32) (_ BitVec 64))) (size!30035 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61392)

(declare-datatypes ((List!20536 0))(
  ( (Nil!20533) (Cons!20532 (h!21694 (_ BitVec 64)) (t!29210 List!20536)) )
))
(declare-fun arrayNoDuplicates!0 (array!61392 (_ BitVec 32) List!20536) Bool)

(assert (=> b!980609 (= lt!435375 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20533))))

(declare-fun mapNonEmpty!36122 () Bool)

(declare-fun tp!68636 () Bool)

(assert (=> mapNonEmpty!36122 (= mapRes!36122 (and tp!68636 e!552710))))

(declare-fun mapKey!36122 () (_ BitVec 32))

(declare-datatypes ((V!35289 0))(
  ( (V!35290 (val!11415 Int)) )
))
(declare-datatypes ((ValueCell!10883 0))(
  ( (ValueCellFull!10883 (v!13976 V!35289)) (EmptyCell!10883) )
))
(declare-datatypes ((array!61394 0))(
  ( (array!61395 (arr!29555 (Array (_ BitVec 32) ValueCell!10883)) (size!30036 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61394)

(declare-fun mapRest!36122 () (Array (_ BitVec 32) ValueCell!10883))

(declare-fun mapValue!36122 () ValueCell!10883)

(assert (=> mapNonEmpty!36122 (= (arr!29555 _values!1278) (store mapRest!36122 mapKey!36122 mapValue!36122))))

(declare-fun b!980606 () Bool)

(declare-fun e!552708 () Bool)

(assert (=> b!980606 (= e!552708 (and e!552709 mapRes!36122))))

(declare-fun condMapEmpty!36122 () Bool)

(declare-fun mapDefault!36122 () ValueCell!10883)

(assert (=> b!980606 (= condMapEmpty!36122 (= (arr!29555 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10883)) mapDefault!36122)))))

(declare-fun res!656306 () Bool)

(assert (=> start!83908 (=> (not res!656306) (not e!552706))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83908 (= res!656306 (validMask!0 mask!1948))))

(assert (=> start!83908 e!552706))

(assert (=> start!83908 true))

(declare-fun array_inv!22873 (array!61394) Bool)

(assert (=> start!83908 (and (array_inv!22873 _values!1278) e!552708)))

(declare-fun array_inv!22874 (array!61392) Bool)

(assert (=> start!83908 (array_inv!22874 _keys!1544)))

(declare-fun b!980610 () Bool)

(declare-fun res!656305 () Bool)

(assert (=> b!980610 (=> (not res!656305) (not e!552706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61392 (_ BitVec 32)) Bool)

(assert (=> b!980610 (= res!656305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980611 () Bool)

(declare-fun res!656307 () Bool)

(assert (=> b!980611 (=> (not res!656307) (not e!552706))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980611 (= res!656307 (and (= (size!30036 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30035 _keys!1544) (size!30036 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83908 res!656306) b!980611))

(assert (= (and b!980611 res!656307) b!980610))

(assert (= (and b!980610 res!656305) b!980609))

(assert (= (and b!980606 condMapEmpty!36122) mapIsEmpty!36122))

(assert (= (and b!980606 (not condMapEmpty!36122)) mapNonEmpty!36122))

(get-info :version)

(assert (= (and mapNonEmpty!36122 ((_ is ValueCellFull!10883) mapValue!36122)) b!980608))

(assert (= (and b!980606 ((_ is ValueCellFull!10883) mapDefault!36122)) b!980607))

(assert (= start!83908 b!980606))

(declare-fun m!907661 () Bool)

(assert (=> b!980609 m!907661))

(declare-fun m!907663 () Bool)

(assert (=> mapNonEmpty!36122 m!907663))

(declare-fun m!907665 () Bool)

(assert (=> start!83908 m!907665))

(declare-fun m!907667 () Bool)

(assert (=> start!83908 m!907667))

(declare-fun m!907669 () Bool)

(assert (=> start!83908 m!907669))

(declare-fun m!907671 () Bool)

(assert (=> b!980610 m!907671))

(check-sat (not b!980610) tp_is_empty!22729 (not mapNonEmpty!36122) (not b!980609) (not start!83908))
(check-sat)
