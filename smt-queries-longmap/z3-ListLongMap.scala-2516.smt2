; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38900 () Bool)

(assert start!38900)

(declare-fun b!406744 () Bool)

(declare-fun res!235096 () Bool)

(declare-fun e!244331 () Bool)

(assert (=> b!406744 (=> (not res!235096) (not e!244331))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24539 0))(
  ( (array!24540 (arr!11719 (Array (_ BitVec 32) (_ BitVec 64))) (size!12072 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24539)

(assert (=> b!406744 (= res!235096 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12072 _keys!709))))))

(declare-fun b!406745 () Bool)

(declare-fun e!244330 () Bool)

(declare-fun tp_is_empty!10333 () Bool)

(assert (=> b!406745 (= e!244330 tp_is_empty!10333)))

(declare-fun b!406746 () Bool)

(declare-fun e!244327 () Bool)

(declare-fun e!244329 () Bool)

(declare-fun mapRes!17121 () Bool)

(assert (=> b!406746 (= e!244327 (and e!244329 mapRes!17121))))

(declare-fun condMapEmpty!17121 () Bool)

(declare-datatypes ((V!14883 0))(
  ( (V!14884 (val!5211 Int)) )
))
(declare-datatypes ((ValueCell!4823 0))(
  ( (ValueCellFull!4823 (v!7452 V!14883)) (EmptyCell!4823) )
))
(declare-datatypes ((array!24541 0))(
  ( (array!24542 (arr!11720 (Array (_ BitVec 32) ValueCell!4823)) (size!12073 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24541)

(declare-fun mapDefault!17121 () ValueCell!4823)

(assert (=> b!406746 (= condMapEmpty!17121 (= (arr!11720 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4823)) mapDefault!17121)))))

(declare-fun b!406747 () Bool)

(declare-fun res!235095 () Bool)

(assert (=> b!406747 (=> (not res!235095) (not e!244331))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406747 (= res!235095 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!235091 () Bool)

(assert (=> start!38900 (=> (not res!235091) (not e!244331))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38900 (= res!235091 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12072 _keys!709))))))

(assert (=> start!38900 e!244331))

(assert (=> start!38900 true))

(declare-fun array_inv!8598 (array!24541) Bool)

(assert (=> start!38900 (and (array_inv!8598 _values!549) e!244327)))

(declare-fun array_inv!8599 (array!24539) Bool)

(assert (=> start!38900 (array_inv!8599 _keys!709)))

(declare-fun mapNonEmpty!17121 () Bool)

(declare-fun tp!33240 () Bool)

(assert (=> mapNonEmpty!17121 (= mapRes!17121 (and tp!33240 e!244330))))

(declare-fun mapValue!17121 () ValueCell!4823)

(declare-fun mapRest!17121 () (Array (_ BitVec 32) ValueCell!4823))

(declare-fun mapKey!17121 () (_ BitVec 32))

(assert (=> mapNonEmpty!17121 (= (arr!11720 _values!549) (store mapRest!17121 mapKey!17121 mapValue!17121))))

(declare-fun b!406748 () Bool)

(declare-fun res!235098 () Bool)

(assert (=> b!406748 (=> (not res!235098) (not e!244331))))

(assert (=> b!406748 (= res!235098 (or (= (select (arr!11719 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11719 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406749 () Bool)

(declare-fun e!244332 () Bool)

(assert (=> b!406749 (= e!244331 e!244332)))

(declare-fun res!235092 () Bool)

(assert (=> b!406749 (=> (not res!235092) (not e!244332))))

(declare-fun lt!188345 () array!24539)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24539 (_ BitVec 32)) Bool)

(assert (=> b!406749 (= res!235092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188345 mask!1025))))

(assert (=> b!406749 (= lt!188345 (array!24540 (store (arr!11719 _keys!709) i!563 k0!794) (size!12072 _keys!709)))))

(declare-fun b!406750 () Bool)

(declare-fun res!235097 () Bool)

(assert (=> b!406750 (=> (not res!235097) (not e!244331))))

(declare-datatypes ((List!6780 0))(
  ( (Nil!6777) (Cons!6776 (h!7632 (_ BitVec 64)) (t!11945 List!6780)) )
))
(declare-fun arrayNoDuplicates!0 (array!24539 (_ BitVec 32) List!6780) Bool)

(assert (=> b!406750 (= res!235097 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6777))))

(declare-fun b!406751 () Bool)

(assert (=> b!406751 (= e!244332 false)))

(declare-fun lt!188344 () Bool)

(assert (=> b!406751 (= lt!188344 (arrayNoDuplicates!0 lt!188345 #b00000000000000000000000000000000 Nil!6777))))

(declare-fun b!406752 () Bool)

(declare-fun res!235093 () Bool)

(assert (=> b!406752 (=> (not res!235093) (not e!244331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406752 (= res!235093 (validMask!0 mask!1025))))

(declare-fun b!406753 () Bool)

(declare-fun res!235094 () Bool)

(assert (=> b!406753 (=> (not res!235094) (not e!244331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406753 (= res!235094 (validKeyInArray!0 k0!794))))

(declare-fun b!406754 () Bool)

(assert (=> b!406754 (= e!244329 tp_is_empty!10333)))

(declare-fun b!406755 () Bool)

(declare-fun res!235089 () Bool)

(assert (=> b!406755 (=> (not res!235089) (not e!244331))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406755 (= res!235089 (and (= (size!12073 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12072 _keys!709) (size!12073 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17121 () Bool)

(assert (=> mapIsEmpty!17121 mapRes!17121))

(declare-fun b!406756 () Bool)

(declare-fun res!235090 () Bool)

(assert (=> b!406756 (=> (not res!235090) (not e!244331))))

(assert (=> b!406756 (= res!235090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38900 res!235091) b!406752))

(assert (= (and b!406752 res!235093) b!406755))

(assert (= (and b!406755 res!235089) b!406756))

(assert (= (and b!406756 res!235090) b!406750))

(assert (= (and b!406750 res!235097) b!406744))

(assert (= (and b!406744 res!235096) b!406753))

(assert (= (and b!406753 res!235094) b!406748))

(assert (= (and b!406748 res!235098) b!406747))

(assert (= (and b!406747 res!235095) b!406749))

(assert (= (and b!406749 res!235092) b!406751))

(assert (= (and b!406746 condMapEmpty!17121) mapIsEmpty!17121))

(assert (= (and b!406746 (not condMapEmpty!17121)) mapNonEmpty!17121))

(get-info :version)

(assert (= (and mapNonEmpty!17121 ((_ is ValueCellFull!4823) mapValue!17121)) b!406745))

(assert (= (and b!406746 ((_ is ValueCellFull!4823) mapDefault!17121)) b!406754))

(assert (= start!38900 b!406746))

(declare-fun m!398139 () Bool)

(assert (=> b!406753 m!398139))

(declare-fun m!398141 () Bool)

(assert (=> b!406747 m!398141))

(declare-fun m!398143 () Bool)

(assert (=> b!406756 m!398143))

(declare-fun m!398145 () Bool)

(assert (=> b!406752 m!398145))

(declare-fun m!398147 () Bool)

(assert (=> mapNonEmpty!17121 m!398147))

(declare-fun m!398149 () Bool)

(assert (=> b!406748 m!398149))

(declare-fun m!398151 () Bool)

(assert (=> start!38900 m!398151))

(declare-fun m!398153 () Bool)

(assert (=> start!38900 m!398153))

(declare-fun m!398155 () Bool)

(assert (=> b!406751 m!398155))

(declare-fun m!398157 () Bool)

(assert (=> b!406749 m!398157))

(declare-fun m!398159 () Bool)

(assert (=> b!406749 m!398159))

(declare-fun m!398161 () Bool)

(assert (=> b!406750 m!398161))

(check-sat (not b!406751) (not b!406747) (not b!406752) (not mapNonEmpty!17121) tp_is_empty!10333 (not b!406756) (not b!406753) (not b!406750) (not start!38900) (not b!406749))
(check-sat)
