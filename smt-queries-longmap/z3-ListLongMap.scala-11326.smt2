; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131810 () Bool)

(assert start!131810)

(declare-fun b!1543382 () Bool)

(declare-fun e!858979 () Bool)

(declare-fun e!858977 () Bool)

(declare-fun mapRes!58477 () Bool)

(assert (=> b!1543382 (= e!858979 (and e!858977 mapRes!58477))))

(declare-fun condMapEmpty!58477 () Bool)

(declare-datatypes ((V!58909 0))(
  ( (V!58910 (val!19002 Int)) )
))
(declare-datatypes ((ValueCell!18014 0))(
  ( (ValueCellFull!18014 (v!21799 V!58909)) (EmptyCell!18014) )
))
(declare-datatypes ((array!102846 0))(
  ( (array!102847 (arr!49626 (Array (_ BitVec 32) ValueCell!18014)) (size!50178 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102846)

(declare-fun mapDefault!58477 () ValueCell!18014)

(assert (=> b!1543382 (= condMapEmpty!58477 (= (arr!49626 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18014)) mapDefault!58477)))))

(declare-fun res!1058992 () Bool)

(declare-fun e!858981 () Bool)

(assert (=> start!131810 (=> (not res!1058992) (not e!858981))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131810 (= res!1058992 (validMask!0 mask!926))))

(assert (=> start!131810 e!858981))

(assert (=> start!131810 true))

(declare-fun array_inv!38801 (array!102846) Bool)

(assert (=> start!131810 (and (array_inv!38801 _values!470) e!858979)))

(declare-datatypes ((array!102848 0))(
  ( (array!102849 (arr!49627 (Array (_ BitVec 32) (_ BitVec 64))) (size!50179 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102848)

(declare-fun array_inv!38802 (array!102848) Bool)

(assert (=> start!131810 (array_inv!38802 _keys!618)))

(declare-fun mapNonEmpty!58477 () Bool)

(declare-fun tp!111005 () Bool)

(declare-fun e!858980 () Bool)

(assert (=> mapNonEmpty!58477 (= mapRes!58477 (and tp!111005 e!858980))))

(declare-fun mapKey!58477 () (_ BitVec 32))

(declare-fun mapRest!58477 () (Array (_ BitVec 32) ValueCell!18014))

(declare-fun mapValue!58477 () ValueCell!18014)

(assert (=> mapNonEmpty!58477 (= (arr!49626 _values!470) (store mapRest!58477 mapKey!58477 mapValue!58477))))

(declare-fun mapIsEmpty!58477 () Bool)

(assert (=> mapIsEmpty!58477 mapRes!58477))

(declare-fun b!1543383 () Bool)

(declare-fun res!1058993 () Bool)

(assert (=> b!1543383 (=> (not res!1058993) (not e!858981))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543383 (= res!1058993 (and (= (size!50178 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50179 _keys!618) (size!50178 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543384 () Bool)

(assert (=> b!1543384 (= e!858981 false)))

(declare-fun lt!665740 () Bool)

(declare-datatypes ((List!35975 0))(
  ( (Nil!35972) (Cons!35971 (h!37417 (_ BitVec 64)) (t!50661 List!35975)) )
))
(declare-fun arrayNoDuplicates!0 (array!102848 (_ BitVec 32) List!35975) Bool)

(assert (=> b!1543384 (= lt!665740 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35972))))

(declare-fun b!1543385 () Bool)

(declare-fun tp_is_empty!37849 () Bool)

(assert (=> b!1543385 (= e!858977 tp_is_empty!37849)))

(declare-fun b!1543386 () Bool)

(assert (=> b!1543386 (= e!858980 tp_is_empty!37849)))

(declare-fun b!1543387 () Bool)

(declare-fun res!1058994 () Bool)

(assert (=> b!1543387 (=> (not res!1058994) (not e!858981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102848 (_ BitVec 32)) Bool)

(assert (=> b!1543387 (= res!1058994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131810 res!1058992) b!1543383))

(assert (= (and b!1543383 res!1058993) b!1543387))

(assert (= (and b!1543387 res!1058994) b!1543384))

(assert (= (and b!1543382 condMapEmpty!58477) mapIsEmpty!58477))

(assert (= (and b!1543382 (not condMapEmpty!58477)) mapNonEmpty!58477))

(get-info :version)

(assert (= (and mapNonEmpty!58477 ((_ is ValueCellFull!18014) mapValue!58477)) b!1543386))

(assert (= (and b!1543382 ((_ is ValueCellFull!18014) mapDefault!58477)) b!1543385))

(assert (= start!131810 b!1543382))

(declare-fun m!1424025 () Bool)

(assert (=> start!131810 m!1424025))

(declare-fun m!1424027 () Bool)

(assert (=> start!131810 m!1424027))

(declare-fun m!1424029 () Bool)

(assert (=> start!131810 m!1424029))

(declare-fun m!1424031 () Bool)

(assert (=> mapNonEmpty!58477 m!1424031))

(declare-fun m!1424033 () Bool)

(assert (=> b!1543384 m!1424033))

(declare-fun m!1424035 () Bool)

(assert (=> b!1543387 m!1424035))

(check-sat (not mapNonEmpty!58477) (not b!1543387) (not b!1543384) tp_is_empty!37849 (not start!131810))
(check-sat)
