; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131814 () Bool)

(assert start!131814)

(declare-fun b!1543281 () Bool)

(declare-fun e!858833 () Bool)

(assert (=> b!1543281 (= e!858833 false)))

(declare-fun lt!665957 () Bool)

(declare-datatypes ((array!102832 0))(
  ( (array!102833 (arr!49618 (Array (_ BitVec 32) (_ BitVec 64))) (size!50168 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102832)

(declare-datatypes ((List!35915 0))(
  ( (Nil!35912) (Cons!35911 (h!37356 (_ BitVec 64)) (t!50609 List!35915)) )
))
(declare-fun arrayNoDuplicates!0 (array!102832 (_ BitVec 32) List!35915) Bool)

(assert (=> b!1543281 (= lt!665957 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35912))))

(declare-fun b!1543282 () Bool)

(declare-fun e!858834 () Bool)

(declare-fun e!858830 () Bool)

(declare-fun mapRes!58408 () Bool)

(assert (=> b!1543282 (= e!858834 (and e!858830 mapRes!58408))))

(declare-fun condMapEmpty!58408 () Bool)

(declare-datatypes ((V!58847 0))(
  ( (V!58848 (val!18979 Int)) )
))
(declare-datatypes ((ValueCell!17991 0))(
  ( (ValueCellFull!17991 (v!21780 V!58847)) (EmptyCell!17991) )
))
(declare-datatypes ((array!102834 0))(
  ( (array!102835 (arr!49619 (Array (_ BitVec 32) ValueCell!17991)) (size!50169 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102834)

(declare-fun mapDefault!58408 () ValueCell!17991)

(assert (=> b!1543282 (= condMapEmpty!58408 (= (arr!49619 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17991)) mapDefault!58408)))))

(declare-fun mapNonEmpty!58408 () Bool)

(declare-fun tp!110935 () Bool)

(declare-fun e!858831 () Bool)

(assert (=> mapNonEmpty!58408 (= mapRes!58408 (and tp!110935 e!858831))))

(declare-fun mapRest!58408 () (Array (_ BitVec 32) ValueCell!17991))

(declare-fun mapValue!58408 () ValueCell!17991)

(declare-fun mapKey!58408 () (_ BitVec 32))

(assert (=> mapNonEmpty!58408 (= (arr!49619 _values!470) (store mapRest!58408 mapKey!58408 mapValue!58408))))

(declare-fun res!1058914 () Bool)

(assert (=> start!131814 (=> (not res!1058914) (not e!858833))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131814 (= res!1058914 (validMask!0 mask!926))))

(assert (=> start!131814 e!858833))

(assert (=> start!131814 true))

(declare-fun array_inv!38603 (array!102834) Bool)

(assert (=> start!131814 (and (array_inv!38603 _values!470) e!858834)))

(declare-fun array_inv!38604 (array!102832) Bool)

(assert (=> start!131814 (array_inv!38604 _keys!618)))

(declare-fun b!1543283 () Bool)

(declare-fun res!1058915 () Bool)

(assert (=> b!1543283 (=> (not res!1058915) (not e!858833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102832 (_ BitVec 32)) Bool)

(assert (=> b!1543283 (= res!1058915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543284 () Bool)

(declare-fun tp_is_empty!37803 () Bool)

(assert (=> b!1543284 (= e!858831 tp_is_empty!37803)))

(declare-fun mapIsEmpty!58408 () Bool)

(assert (=> mapIsEmpty!58408 mapRes!58408))

(declare-fun b!1543285 () Bool)

(declare-fun res!1058916 () Bool)

(assert (=> b!1543285 (=> (not res!1058916) (not e!858833))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543285 (= res!1058916 (and (= (size!50169 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50168 _keys!618) (size!50169 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543286 () Bool)

(assert (=> b!1543286 (= e!858830 tp_is_empty!37803)))

(assert (= (and start!131814 res!1058914) b!1543285))

(assert (= (and b!1543285 res!1058916) b!1543283))

(assert (= (and b!1543283 res!1058915) b!1543281))

(assert (= (and b!1543282 condMapEmpty!58408) mapIsEmpty!58408))

(assert (= (and b!1543282 (not condMapEmpty!58408)) mapNonEmpty!58408))

(get-info :version)

(assert (= (and mapNonEmpty!58408 ((_ is ValueCellFull!17991) mapValue!58408)) b!1543284))

(assert (= (and b!1543282 ((_ is ValueCellFull!17991) mapDefault!58408)) b!1543286))

(assert (= start!131814 b!1543282))

(declare-fun m!1424641 () Bool)

(assert (=> b!1543281 m!1424641))

(declare-fun m!1424643 () Bool)

(assert (=> mapNonEmpty!58408 m!1424643))

(declare-fun m!1424645 () Bool)

(assert (=> start!131814 m!1424645))

(declare-fun m!1424647 () Bool)

(assert (=> start!131814 m!1424647))

(declare-fun m!1424649 () Bool)

(assert (=> start!131814 m!1424649))

(declare-fun m!1424651 () Bool)

(assert (=> b!1543283 m!1424651))

(check-sat (not b!1543281) tp_is_empty!37803 (not mapNonEmpty!58408) (not start!131814) (not b!1543283))
(check-sat)
