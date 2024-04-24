; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72484 () Bool)

(assert start!72484)

(declare-fun b!838742 () Bool)

(declare-fun e!468250 () Bool)

(assert (=> b!838742 (= e!468250 false)))

(declare-fun lt!380978 () Bool)

(declare-datatypes ((array!47033 0))(
  ( (array!47034 (arr!22543 (Array (_ BitVec 32) (_ BitVec 64))) (size!22984 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47033)

(declare-datatypes ((List!15945 0))(
  ( (Nil!15942) (Cons!15941 (h!17078 (_ BitVec 64)) (t!22308 List!15945)) )
))
(declare-fun arrayNoDuplicates!0 (array!47033 (_ BitVec 32) List!15945) Bool)

(assert (=> b!838742 (= lt!380978 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15942))))

(declare-fun res!570120 () Bool)

(assert (=> start!72484 (=> (not res!570120) (not e!468250))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72484 (= res!570120 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22984 _keys!868))))))

(assert (=> start!72484 e!468250))

(assert (=> start!72484 true))

(declare-fun array_inv!18010 (array!47033) Bool)

(assert (=> start!72484 (array_inv!18010 _keys!868)))

(declare-datatypes ((V!25537 0))(
  ( (V!25538 (val!7731 Int)) )
))
(declare-datatypes ((ValueCell!7244 0))(
  ( (ValueCellFull!7244 (v!10156 V!25537)) (EmptyCell!7244) )
))
(declare-datatypes ((array!47035 0))(
  ( (array!47036 (arr!22544 (Array (_ BitVec 32) ValueCell!7244)) (size!22985 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47035)

(declare-fun e!468247 () Bool)

(declare-fun array_inv!18011 (array!47035) Bool)

(assert (=> start!72484 (and (array_inv!18011 _values!688) e!468247)))

(declare-fun b!838743 () Bool)

(declare-fun e!468248 () Bool)

(declare-fun tp_is_empty!15367 () Bool)

(assert (=> b!838743 (= e!468248 tp_is_empty!15367)))

(declare-fun b!838744 () Bool)

(declare-fun res!570118 () Bool)

(assert (=> b!838744 (=> (not res!570118) (not e!468250))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838744 (= res!570118 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24650 () Bool)

(declare-fun mapRes!24650 () Bool)

(declare-fun tp!47645 () Bool)

(assert (=> mapNonEmpty!24650 (= mapRes!24650 (and tp!47645 e!468248))))

(declare-fun mapRest!24650 () (Array (_ BitVec 32) ValueCell!7244))

(declare-fun mapValue!24650 () ValueCell!7244)

(declare-fun mapKey!24650 () (_ BitVec 32))

(assert (=> mapNonEmpty!24650 (= (arr!22544 _values!688) (store mapRest!24650 mapKey!24650 mapValue!24650))))

(declare-fun b!838745 () Bool)

(declare-fun e!468249 () Bool)

(assert (=> b!838745 (= e!468247 (and e!468249 mapRes!24650))))

(declare-fun condMapEmpty!24650 () Bool)

(declare-fun mapDefault!24650 () ValueCell!7244)

(assert (=> b!838745 (= condMapEmpty!24650 (= (arr!22544 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7244)) mapDefault!24650)))))

(declare-fun b!838746 () Bool)

(assert (=> b!838746 (= e!468249 tp_is_empty!15367)))

(declare-fun b!838747 () Bool)

(declare-fun res!570119 () Bool)

(assert (=> b!838747 (=> (not res!570119) (not e!468250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47033 (_ BitVec 32)) Bool)

(assert (=> b!838747 (= res!570119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24650 () Bool)

(assert (=> mapIsEmpty!24650 mapRes!24650))

(declare-fun b!838748 () Bool)

(declare-fun res!570121 () Bool)

(assert (=> b!838748 (=> (not res!570121) (not e!468250))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838748 (= res!570121 (and (= (size!22985 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22984 _keys!868) (size!22985 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72484 res!570120) b!838744))

(assert (= (and b!838744 res!570118) b!838748))

(assert (= (and b!838748 res!570121) b!838747))

(assert (= (and b!838747 res!570119) b!838742))

(assert (= (and b!838745 condMapEmpty!24650) mapIsEmpty!24650))

(assert (= (and b!838745 (not condMapEmpty!24650)) mapNonEmpty!24650))

(get-info :version)

(assert (= (and mapNonEmpty!24650 ((_ is ValueCellFull!7244) mapValue!24650)) b!838743))

(assert (= (and b!838745 ((_ is ValueCellFull!7244) mapDefault!24650)) b!838746))

(assert (= start!72484 b!838745))

(declare-fun m!783809 () Bool)

(assert (=> b!838747 m!783809))

(declare-fun m!783811 () Bool)

(assert (=> mapNonEmpty!24650 m!783811))

(declare-fun m!783813 () Bool)

(assert (=> b!838744 m!783813))

(declare-fun m!783815 () Bool)

(assert (=> b!838742 m!783815))

(declare-fun m!783817 () Bool)

(assert (=> start!72484 m!783817))

(declare-fun m!783819 () Bool)

(assert (=> start!72484 m!783819))

(check-sat (not start!72484) tp_is_empty!15367 (not b!838744) (not b!838742) (not mapNonEmpty!24650) (not b!838747))
(check-sat)
