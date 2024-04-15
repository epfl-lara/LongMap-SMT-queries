; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72304 () Bool)

(assert start!72304)

(declare-fun b!837663 () Bool)

(declare-fun e!467563 () Bool)

(declare-fun e!467561 () Bool)

(declare-fun mapRes!24659 () Bool)

(assert (=> b!837663 (= e!467563 (and e!467561 mapRes!24659))))

(declare-fun condMapEmpty!24659 () Bool)

(declare-datatypes ((V!25545 0))(
  ( (V!25546 (val!7734 Int)) )
))
(declare-datatypes ((ValueCell!7247 0))(
  ( (ValueCellFull!7247 (v!10153 V!25545)) (EmptyCell!7247) )
))
(declare-datatypes ((array!47009 0))(
  ( (array!47010 (arr!22536 (Array (_ BitVec 32) ValueCell!7247)) (size!22978 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47009)

(declare-fun mapDefault!24659 () ValueCell!7247)

(assert (=> b!837663 (= condMapEmpty!24659 (= (arr!22536 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7247)) mapDefault!24659)))))

(declare-fun b!837664 () Bool)

(declare-fun tp_is_empty!15373 () Bool)

(assert (=> b!837664 (= e!467561 tp_is_empty!15373)))

(declare-fun mapNonEmpty!24659 () Bool)

(declare-fun tp!47654 () Bool)

(declare-fun e!467564 () Bool)

(assert (=> mapNonEmpty!24659 (= mapRes!24659 (and tp!47654 e!467564))))

(declare-fun mapValue!24659 () ValueCell!7247)

(declare-fun mapRest!24659 () (Array (_ BitVec 32) ValueCell!7247))

(declare-fun mapKey!24659 () (_ BitVec 32))

(assert (=> mapNonEmpty!24659 (= (arr!22536 _values!688) (store mapRest!24659 mapKey!24659 mapValue!24659))))

(declare-fun b!837665 () Bool)

(declare-fun e!467565 () Bool)

(assert (=> b!837665 (= e!467565 false)))

(declare-fun lt!380390 () Bool)

(declare-datatypes ((array!47011 0))(
  ( (array!47012 (arr!22537 (Array (_ BitVec 32) (_ BitVec 64))) (size!22979 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47011)

(declare-datatypes ((List!16039 0))(
  ( (Nil!16036) (Cons!16035 (h!17166 (_ BitVec 64)) (t!22401 List!16039)) )
))
(declare-fun arrayNoDuplicates!0 (array!47011 (_ BitVec 32) List!16039) Bool)

(assert (=> b!837665 (= lt!380390 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16036))))

(declare-fun mapIsEmpty!24659 () Bool)

(assert (=> mapIsEmpty!24659 mapRes!24659))

(declare-fun res!569701 () Bool)

(assert (=> start!72304 (=> (not res!569701) (not e!467565))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72304 (= res!569701 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22979 _keys!868))))))

(assert (=> start!72304 e!467565))

(assert (=> start!72304 true))

(declare-fun array_inv!18026 (array!47011) Bool)

(assert (=> start!72304 (array_inv!18026 _keys!868)))

(declare-fun array_inv!18027 (array!47009) Bool)

(assert (=> start!72304 (and (array_inv!18027 _values!688) e!467563)))

(declare-fun b!837666 () Bool)

(declare-fun res!569700 () Bool)

(assert (=> b!837666 (=> (not res!569700) (not e!467565))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!837666 (= res!569700 (and (= (size!22978 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22979 _keys!868) (size!22978 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837667 () Bool)

(declare-fun res!569702 () Bool)

(assert (=> b!837667 (=> (not res!569702) (not e!467565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47011 (_ BitVec 32)) Bool)

(assert (=> b!837667 (= res!569702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837668 () Bool)

(declare-fun res!569703 () Bool)

(assert (=> b!837668 (=> (not res!569703) (not e!467565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837668 (= res!569703 (validMask!0 mask!1196))))

(declare-fun b!837669 () Bool)

(assert (=> b!837669 (= e!467564 tp_is_empty!15373)))

(assert (= (and start!72304 res!569701) b!837668))

(assert (= (and b!837668 res!569703) b!837666))

(assert (= (and b!837666 res!569700) b!837667))

(assert (= (and b!837667 res!569702) b!837665))

(assert (= (and b!837663 condMapEmpty!24659) mapIsEmpty!24659))

(assert (= (and b!837663 (not condMapEmpty!24659)) mapNonEmpty!24659))

(get-info :version)

(assert (= (and mapNonEmpty!24659 ((_ is ValueCellFull!7247) mapValue!24659)) b!837669))

(assert (= (and b!837663 ((_ is ValueCellFull!7247) mapDefault!24659)) b!837664))

(assert (= start!72304 b!837663))

(declare-fun m!781799 () Bool)

(assert (=> b!837668 m!781799))

(declare-fun m!781801 () Bool)

(assert (=> b!837665 m!781801))

(declare-fun m!781803 () Bool)

(assert (=> b!837667 m!781803))

(declare-fun m!781805 () Bool)

(assert (=> start!72304 m!781805))

(declare-fun m!781807 () Bool)

(assert (=> start!72304 m!781807))

(declare-fun m!781809 () Bool)

(assert (=> mapNonEmpty!24659 m!781809))

(check-sat (not start!72304) (not b!837667) tp_is_empty!15373 (not b!837665) (not b!837668) (not mapNonEmpty!24659))
(check-sat)
