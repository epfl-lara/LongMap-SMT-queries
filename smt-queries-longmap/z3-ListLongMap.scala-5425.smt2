; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72316 () Bool)

(assert start!72316)

(declare-fun b!837789 () Bool)

(declare-fun e!467652 () Bool)

(declare-fun tp_is_empty!15385 () Bool)

(assert (=> b!837789 (= e!467652 tp_is_empty!15385)))

(declare-fun b!837790 () Bool)

(declare-fun res!569775 () Bool)

(declare-fun e!467655 () Bool)

(assert (=> b!837790 (=> (not res!569775) (not e!467655))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47033 0))(
  ( (array!47034 (arr!22548 (Array (_ BitVec 32) (_ BitVec 64))) (size!22990 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47033)

(declare-datatypes ((V!25561 0))(
  ( (V!25562 (val!7740 Int)) )
))
(declare-datatypes ((ValueCell!7253 0))(
  ( (ValueCellFull!7253 (v!10159 V!25561)) (EmptyCell!7253) )
))
(declare-datatypes ((array!47035 0))(
  ( (array!47036 (arr!22549 (Array (_ BitVec 32) ValueCell!7253)) (size!22991 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47035)

(assert (=> b!837790 (= res!569775 (and (= (size!22991 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22990 _keys!868) (size!22991 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837791 () Bool)

(declare-fun e!467651 () Bool)

(assert (=> b!837791 (= e!467651 tp_is_empty!15385)))

(declare-fun b!837792 () Bool)

(declare-fun e!467653 () Bool)

(declare-fun mapRes!24677 () Bool)

(assert (=> b!837792 (= e!467653 (and e!467651 mapRes!24677))))

(declare-fun condMapEmpty!24677 () Bool)

(declare-fun mapDefault!24677 () ValueCell!7253)

(assert (=> b!837792 (= condMapEmpty!24677 (= (arr!22549 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7253)) mapDefault!24677)))))

(declare-fun mapIsEmpty!24677 () Bool)

(assert (=> mapIsEmpty!24677 mapRes!24677))

(declare-fun mapNonEmpty!24677 () Bool)

(declare-fun tp!47672 () Bool)

(assert (=> mapNonEmpty!24677 (= mapRes!24677 (and tp!47672 e!467652))))

(declare-fun mapRest!24677 () (Array (_ BitVec 32) ValueCell!7253))

(declare-fun mapKey!24677 () (_ BitVec 32))

(declare-fun mapValue!24677 () ValueCell!7253)

(assert (=> mapNonEmpty!24677 (= (arr!22549 _values!688) (store mapRest!24677 mapKey!24677 mapValue!24677))))

(declare-fun b!837794 () Bool)

(assert (=> b!837794 (= e!467655 false)))

(declare-fun lt!380408 () Bool)

(declare-datatypes ((List!16044 0))(
  ( (Nil!16041) (Cons!16040 (h!17171 (_ BitVec 64)) (t!22406 List!16044)) )
))
(declare-fun arrayNoDuplicates!0 (array!47033 (_ BitVec 32) List!16044) Bool)

(assert (=> b!837794 (= lt!380408 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16041))))

(declare-fun b!837795 () Bool)

(declare-fun res!569774 () Bool)

(assert (=> b!837795 (=> (not res!569774) (not e!467655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837795 (= res!569774 (validMask!0 mask!1196))))

(declare-fun b!837793 () Bool)

(declare-fun res!569773 () Bool)

(assert (=> b!837793 (=> (not res!569773) (not e!467655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47033 (_ BitVec 32)) Bool)

(assert (=> b!837793 (= res!569773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!569772 () Bool)

(assert (=> start!72316 (=> (not res!569772) (not e!467655))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72316 (= res!569772 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22990 _keys!868))))))

(assert (=> start!72316 e!467655))

(assert (=> start!72316 true))

(declare-fun array_inv!18036 (array!47033) Bool)

(assert (=> start!72316 (array_inv!18036 _keys!868)))

(declare-fun array_inv!18037 (array!47035) Bool)

(assert (=> start!72316 (and (array_inv!18037 _values!688) e!467653)))

(assert (= (and start!72316 res!569772) b!837795))

(assert (= (and b!837795 res!569774) b!837790))

(assert (= (and b!837790 res!569775) b!837793))

(assert (= (and b!837793 res!569773) b!837794))

(assert (= (and b!837792 condMapEmpty!24677) mapIsEmpty!24677))

(assert (= (and b!837792 (not condMapEmpty!24677)) mapNonEmpty!24677))

(get-info :version)

(assert (= (and mapNonEmpty!24677 ((_ is ValueCellFull!7253) mapValue!24677)) b!837789))

(assert (= (and b!837792 ((_ is ValueCellFull!7253) mapDefault!24677)) b!837791))

(assert (= start!72316 b!837792))

(declare-fun m!781871 () Bool)

(assert (=> b!837793 m!781871))

(declare-fun m!781873 () Bool)

(assert (=> b!837794 m!781873))

(declare-fun m!781875 () Bool)

(assert (=> b!837795 m!781875))

(declare-fun m!781877 () Bool)

(assert (=> mapNonEmpty!24677 m!781877))

(declare-fun m!781879 () Bool)

(assert (=> start!72316 m!781879))

(declare-fun m!781881 () Bool)

(assert (=> start!72316 m!781881))

(check-sat (not b!837793) tp_is_empty!15385 (not b!837795) (not b!837794) (not start!72316) (not mapNonEmpty!24677))
(check-sat)
