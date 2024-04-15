; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72310 () Bool)

(assert start!72310)

(declare-fun b!837726 () Bool)

(declare-fun res!569737 () Bool)

(declare-fun e!467608 () Bool)

(assert (=> b!837726 (=> (not res!569737) (not e!467608))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47021 0))(
  ( (array!47022 (arr!22542 (Array (_ BitVec 32) (_ BitVec 64))) (size!22984 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47021)

(declare-datatypes ((V!25553 0))(
  ( (V!25554 (val!7737 Int)) )
))
(declare-datatypes ((ValueCell!7250 0))(
  ( (ValueCellFull!7250 (v!10156 V!25553)) (EmptyCell!7250) )
))
(declare-datatypes ((array!47023 0))(
  ( (array!47024 (arr!22543 (Array (_ BitVec 32) ValueCell!7250)) (size!22985 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47023)

(assert (=> b!837726 (= res!569737 (and (= (size!22985 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22984 _keys!868) (size!22985 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837727 () Bool)

(declare-fun e!467610 () Bool)

(declare-fun tp_is_empty!15379 () Bool)

(assert (=> b!837727 (= e!467610 tp_is_empty!15379)))

(declare-fun res!569736 () Bool)

(assert (=> start!72310 (=> (not res!569736) (not e!467608))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72310 (= res!569736 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22984 _keys!868))))))

(assert (=> start!72310 e!467608))

(assert (=> start!72310 true))

(declare-fun array_inv!18032 (array!47021) Bool)

(assert (=> start!72310 (array_inv!18032 _keys!868)))

(declare-fun e!467606 () Bool)

(declare-fun array_inv!18033 (array!47023) Bool)

(assert (=> start!72310 (and (array_inv!18033 _values!688) e!467606)))

(declare-fun b!837728 () Bool)

(declare-fun e!467607 () Bool)

(assert (=> b!837728 (= e!467607 tp_is_empty!15379)))

(declare-fun mapIsEmpty!24668 () Bool)

(declare-fun mapRes!24668 () Bool)

(assert (=> mapIsEmpty!24668 mapRes!24668))

(declare-fun b!837729 () Bool)

(declare-fun res!569739 () Bool)

(assert (=> b!837729 (=> (not res!569739) (not e!467608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837729 (= res!569739 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24668 () Bool)

(declare-fun tp!47663 () Bool)

(assert (=> mapNonEmpty!24668 (= mapRes!24668 (and tp!47663 e!467607))))

(declare-fun mapRest!24668 () (Array (_ BitVec 32) ValueCell!7250))

(declare-fun mapValue!24668 () ValueCell!7250)

(declare-fun mapKey!24668 () (_ BitVec 32))

(assert (=> mapNonEmpty!24668 (= (arr!22543 _values!688) (store mapRest!24668 mapKey!24668 mapValue!24668))))

(declare-fun b!837730 () Bool)

(assert (=> b!837730 (= e!467608 false)))

(declare-fun lt!380399 () Bool)

(declare-datatypes ((List!16041 0))(
  ( (Nil!16038) (Cons!16037 (h!17168 (_ BitVec 64)) (t!22403 List!16041)) )
))
(declare-fun arrayNoDuplicates!0 (array!47021 (_ BitVec 32) List!16041) Bool)

(assert (=> b!837730 (= lt!380399 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16038))))

(declare-fun b!837731 () Bool)

(declare-fun res!569738 () Bool)

(assert (=> b!837731 (=> (not res!569738) (not e!467608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47021 (_ BitVec 32)) Bool)

(assert (=> b!837731 (= res!569738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837732 () Bool)

(assert (=> b!837732 (= e!467606 (and e!467610 mapRes!24668))))

(declare-fun condMapEmpty!24668 () Bool)

(declare-fun mapDefault!24668 () ValueCell!7250)

(assert (=> b!837732 (= condMapEmpty!24668 (= (arr!22543 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7250)) mapDefault!24668)))))

(assert (= (and start!72310 res!569736) b!837729))

(assert (= (and b!837729 res!569739) b!837726))

(assert (= (and b!837726 res!569737) b!837731))

(assert (= (and b!837731 res!569738) b!837730))

(assert (= (and b!837732 condMapEmpty!24668) mapIsEmpty!24668))

(assert (= (and b!837732 (not condMapEmpty!24668)) mapNonEmpty!24668))

(get-info :version)

(assert (= (and mapNonEmpty!24668 ((_ is ValueCellFull!7250) mapValue!24668)) b!837728))

(assert (= (and b!837732 ((_ is ValueCellFull!7250) mapDefault!24668)) b!837727))

(assert (= start!72310 b!837732))

(declare-fun m!781835 () Bool)

(assert (=> mapNonEmpty!24668 m!781835))

(declare-fun m!781837 () Bool)

(assert (=> b!837731 m!781837))

(declare-fun m!781839 () Bool)

(assert (=> b!837729 m!781839))

(declare-fun m!781841 () Bool)

(assert (=> b!837730 m!781841))

(declare-fun m!781843 () Bool)

(assert (=> start!72310 m!781843))

(declare-fun m!781845 () Bool)

(assert (=> start!72310 m!781845))

(check-sat (not b!837731) (not mapNonEmpty!24668) (not b!837730) (not start!72310) (not b!837729) tp_is_empty!15379)
(check-sat)
