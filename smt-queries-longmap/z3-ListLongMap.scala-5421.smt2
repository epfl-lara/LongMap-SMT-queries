; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72312 () Bool)

(assert start!72312)

(declare-fun b!837797 () Bool)

(declare-fun e!467637 () Bool)

(declare-fun e!467634 () Bool)

(declare-fun mapRes!24644 () Bool)

(assert (=> b!837797 (= e!467637 (and e!467634 mapRes!24644))))

(declare-fun condMapEmpty!24644 () Bool)

(declare-datatypes ((V!25531 0))(
  ( (V!25532 (val!7729 Int)) )
))
(declare-datatypes ((ValueCell!7242 0))(
  ( (ValueCellFull!7242 (v!10154 V!25531)) (EmptyCell!7242) )
))
(declare-datatypes ((array!47022 0))(
  ( (array!47023 (arr!22542 (Array (_ BitVec 32) ValueCell!7242)) (size!22982 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47022)

(declare-fun mapDefault!24644 () ValueCell!7242)

(assert (=> b!837797 (= condMapEmpty!24644 (= (arr!22542 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7242)) mapDefault!24644)))))

(declare-fun b!837798 () Bool)

(declare-fun res!569753 () Bool)

(declare-fun e!467638 () Bool)

(assert (=> b!837798 (=> (not res!569753) (not e!467638))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47024 0))(
  ( (array!47025 (arr!22543 (Array (_ BitVec 32) (_ BitVec 64))) (size!22983 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47024)

(assert (=> b!837798 (= res!569753 (and (= (size!22982 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22983 _keys!868) (size!22982 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837799 () Bool)

(declare-fun res!569752 () Bool)

(assert (=> b!837799 (=> (not res!569752) (not e!467638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837799 (= res!569752 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24644 () Bool)

(assert (=> mapIsEmpty!24644 mapRes!24644))

(declare-fun b!837800 () Bool)

(declare-fun e!467635 () Bool)

(declare-fun tp_is_empty!15363 () Bool)

(assert (=> b!837800 (= e!467635 tp_is_empty!15363)))

(declare-fun b!837801 () Bool)

(assert (=> b!837801 (= e!467638 false)))

(declare-fun lt!380611 () Bool)

(declare-datatypes ((List!16038 0))(
  ( (Nil!16035) (Cons!16034 (h!17165 (_ BitVec 64)) (t!22409 List!16038)) )
))
(declare-fun arrayNoDuplicates!0 (array!47024 (_ BitVec 32) List!16038) Bool)

(assert (=> b!837801 (= lt!380611 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16035))))

(declare-fun b!837802 () Bool)

(assert (=> b!837802 (= e!467634 tp_is_empty!15363)))

(declare-fun res!569750 () Bool)

(assert (=> start!72312 (=> (not res!569750) (not e!467638))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72312 (= res!569750 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22983 _keys!868))))))

(assert (=> start!72312 e!467638))

(assert (=> start!72312 true))

(declare-fun array_inv!17964 (array!47024) Bool)

(assert (=> start!72312 (array_inv!17964 _keys!868)))

(declare-fun array_inv!17965 (array!47022) Bool)

(assert (=> start!72312 (and (array_inv!17965 _values!688) e!467637)))

(declare-fun mapNonEmpty!24644 () Bool)

(declare-fun tp!47638 () Bool)

(assert (=> mapNonEmpty!24644 (= mapRes!24644 (and tp!47638 e!467635))))

(declare-fun mapRest!24644 () (Array (_ BitVec 32) ValueCell!7242))

(declare-fun mapValue!24644 () ValueCell!7242)

(declare-fun mapKey!24644 () (_ BitVec 32))

(assert (=> mapNonEmpty!24644 (= (arr!22542 _values!688) (store mapRest!24644 mapKey!24644 mapValue!24644))))

(declare-fun b!837803 () Bool)

(declare-fun res!569751 () Bool)

(assert (=> b!837803 (=> (not res!569751) (not e!467638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47024 (_ BitVec 32)) Bool)

(assert (=> b!837803 (= res!569751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72312 res!569750) b!837799))

(assert (= (and b!837799 res!569752) b!837798))

(assert (= (and b!837798 res!569753) b!837803))

(assert (= (and b!837803 res!569751) b!837801))

(assert (= (and b!837797 condMapEmpty!24644) mapIsEmpty!24644))

(assert (= (and b!837797 (not condMapEmpty!24644)) mapNonEmpty!24644))

(get-info :version)

(assert (= (and mapNonEmpty!24644 ((_ is ValueCellFull!7242) mapValue!24644)) b!837800))

(assert (= (and b!837797 ((_ is ValueCellFull!7242) mapDefault!24644)) b!837802))

(assert (= start!72312 b!837797))

(declare-fun m!782493 () Bool)

(assert (=> b!837801 m!782493))

(declare-fun m!782495 () Bool)

(assert (=> b!837799 m!782495))

(declare-fun m!782497 () Bool)

(assert (=> mapNonEmpty!24644 m!782497))

(declare-fun m!782499 () Bool)

(assert (=> start!72312 m!782499))

(declare-fun m!782501 () Bool)

(assert (=> start!72312 m!782501))

(declare-fun m!782503 () Bool)

(assert (=> b!837803 m!782503))

(check-sat tp_is_empty!15363 (not start!72312) (not b!837799) (not mapNonEmpty!24644) (not b!837801) (not b!837803))
(check-sat)
