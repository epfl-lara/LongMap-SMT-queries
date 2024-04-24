; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38462 () Bool)

(assert start!38462)

(declare-fun mapIsEmpty!16464 () Bool)

(declare-fun mapRes!16464 () Bool)

(assert (=> mapIsEmpty!16464 mapRes!16464))

(declare-fun b!397129 () Bool)

(declare-fun res!227998 () Bool)

(declare-fun e!240206 () Bool)

(assert (=> b!397129 (=> (not res!227998) (not e!240206))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397129 (= res!227998 (validKeyInArray!0 k0!794))))

(declare-fun b!397130 () Bool)

(declare-fun res!228004 () Bool)

(assert (=> b!397130 (=> (not res!228004) (not e!240206))))

(declare-datatypes ((array!23690 0))(
  ( (array!23691 (arr!11294 (Array (_ BitVec 32) (_ BitVec 64))) (size!11646 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23690)

(declare-datatypes ((List!6408 0))(
  ( (Nil!6405) (Cons!6404 (h!7260 (_ BitVec 64)) (t!11574 List!6408)) )
))
(declare-fun arrayNoDuplicates!0 (array!23690 (_ BitVec 32) List!6408) Bool)

(assert (=> b!397130 (= res!228004 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6405))))

(declare-fun b!397131 () Bool)

(declare-fun e!240204 () Bool)

(assert (=> b!397131 (= e!240206 e!240204)))

(declare-fun res!227997 () Bool)

(assert (=> b!397131 (=> (not res!227997) (not e!240204))))

(declare-fun lt!187284 () array!23690)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23690 (_ BitVec 32)) Bool)

(assert (=> b!397131 (= res!227997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187284 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397131 (= lt!187284 (array!23691 (store (arr!11294 _keys!709) i!563 k0!794) (size!11646 _keys!709)))))

(declare-fun b!397132 () Bool)

(declare-fun e!240203 () Bool)

(declare-fun tp_is_empty!9895 () Bool)

(assert (=> b!397132 (= e!240203 tp_is_empty!9895)))

(declare-fun b!397133 () Bool)

(declare-fun res!228000 () Bool)

(assert (=> b!397133 (=> (not res!228000) (not e!240206))))

(assert (=> b!397133 (= res!228000 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11646 _keys!709))))))

(declare-fun b!397135 () Bool)

(declare-fun res!227999 () Bool)

(assert (=> b!397135 (=> (not res!227999) (not e!240206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397135 (= res!227999 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16464 () Bool)

(declare-fun tp!32259 () Bool)

(assert (=> mapNonEmpty!16464 (= mapRes!16464 (and tp!32259 e!240203))))

(declare-datatypes ((V!14299 0))(
  ( (V!14300 (val!4992 Int)) )
))
(declare-datatypes ((ValueCell!4604 0))(
  ( (ValueCellFull!4604 (v!7240 V!14299)) (EmptyCell!4604) )
))
(declare-fun mapRest!16464 () (Array (_ BitVec 32) ValueCell!4604))

(declare-fun mapKey!16464 () (_ BitVec 32))

(declare-datatypes ((array!23692 0))(
  ( (array!23693 (arr!11295 (Array (_ BitVec 32) ValueCell!4604)) (size!11647 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23692)

(declare-fun mapValue!16464 () ValueCell!4604)

(assert (=> mapNonEmpty!16464 (= (arr!11295 _values!549) (store mapRest!16464 mapKey!16464 mapValue!16464))))

(declare-fun b!397136 () Bool)

(assert (=> b!397136 (= e!240204 false)))

(declare-fun lt!187283 () Bool)

(assert (=> b!397136 (= lt!187283 (arrayNoDuplicates!0 lt!187284 #b00000000000000000000000000000000 Nil!6405))))

(declare-fun b!397137 () Bool)

(declare-fun e!240205 () Bool)

(assert (=> b!397137 (= e!240205 tp_is_empty!9895)))

(declare-fun b!397138 () Bool)

(declare-fun res!228003 () Bool)

(assert (=> b!397138 (=> (not res!228003) (not e!240206))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397138 (= res!228003 (and (= (size!11647 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11646 _keys!709) (size!11647 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397139 () Bool)

(declare-fun res!228006 () Bool)

(assert (=> b!397139 (=> (not res!228006) (not e!240206))))

(assert (=> b!397139 (= res!228006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397140 () Bool)

(declare-fun res!228001 () Bool)

(assert (=> b!397140 (=> (not res!228001) (not e!240206))))

(assert (=> b!397140 (= res!228001 (or (= (select (arr!11294 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11294 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397141 () Bool)

(declare-fun res!228002 () Bool)

(assert (=> b!397141 (=> (not res!228002) (not e!240206))))

(declare-fun arrayContainsKey!0 (array!23690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397141 (= res!228002 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397134 () Bool)

(declare-fun e!240208 () Bool)

(assert (=> b!397134 (= e!240208 (and e!240205 mapRes!16464))))

(declare-fun condMapEmpty!16464 () Bool)

(declare-fun mapDefault!16464 () ValueCell!4604)

(assert (=> b!397134 (= condMapEmpty!16464 (= (arr!11295 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4604)) mapDefault!16464)))))

(declare-fun res!228005 () Bool)

(assert (=> start!38462 (=> (not res!228005) (not e!240206))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38462 (= res!228005 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11646 _keys!709))))))

(assert (=> start!38462 e!240206))

(assert (=> start!38462 true))

(declare-fun array_inv!8346 (array!23692) Bool)

(assert (=> start!38462 (and (array_inv!8346 _values!549) e!240208)))

(declare-fun array_inv!8347 (array!23690) Bool)

(assert (=> start!38462 (array_inv!8347 _keys!709)))

(assert (= (and start!38462 res!228005) b!397135))

(assert (= (and b!397135 res!227999) b!397138))

(assert (= (and b!397138 res!228003) b!397139))

(assert (= (and b!397139 res!228006) b!397130))

(assert (= (and b!397130 res!228004) b!397133))

(assert (= (and b!397133 res!228000) b!397129))

(assert (= (and b!397129 res!227998) b!397140))

(assert (= (and b!397140 res!228001) b!397141))

(assert (= (and b!397141 res!228002) b!397131))

(assert (= (and b!397131 res!227997) b!397136))

(assert (= (and b!397134 condMapEmpty!16464) mapIsEmpty!16464))

(assert (= (and b!397134 (not condMapEmpty!16464)) mapNonEmpty!16464))

(get-info :version)

(assert (= (and mapNonEmpty!16464 ((_ is ValueCellFull!4604) mapValue!16464)) b!397132))

(assert (= (and b!397134 ((_ is ValueCellFull!4604) mapDefault!16464)) b!397137))

(assert (= start!38462 b!397134))

(declare-fun m!392757 () Bool)

(assert (=> b!397141 m!392757))

(declare-fun m!392759 () Bool)

(assert (=> b!397140 m!392759))

(declare-fun m!392761 () Bool)

(assert (=> b!397131 m!392761))

(declare-fun m!392763 () Bool)

(assert (=> b!397131 m!392763))

(declare-fun m!392765 () Bool)

(assert (=> start!38462 m!392765))

(declare-fun m!392767 () Bool)

(assert (=> start!38462 m!392767))

(declare-fun m!392769 () Bool)

(assert (=> b!397139 m!392769))

(declare-fun m!392771 () Bool)

(assert (=> b!397135 m!392771))

(declare-fun m!392773 () Bool)

(assert (=> b!397129 m!392773))

(declare-fun m!392775 () Bool)

(assert (=> b!397136 m!392775))

(declare-fun m!392777 () Bool)

(assert (=> b!397130 m!392777))

(declare-fun m!392779 () Bool)

(assert (=> mapNonEmpty!16464 m!392779))

(check-sat (not b!397141) (not mapNonEmpty!16464) (not b!397136) (not b!397131) (not b!397129) (not b!397135) (not b!397130) (not start!38462) tp_is_empty!9895 (not b!397139))
(check-sat)
