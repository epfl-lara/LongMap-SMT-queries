; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40300 () Bool)

(assert start!40300)

(declare-fun b!442641 () Bool)

(declare-fun res!262207 () Bool)

(declare-fun e!260524 () Bool)

(assert (=> b!442641 (=> (not res!262207) (not e!260524))))

(declare-datatypes ((array!27242 0))(
  ( (array!27243 (arr!13069 (Array (_ BitVec 32) (_ BitVec 64))) (size!13421 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27242)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27242 (_ BitVec 32)) Bool)

(assert (=> b!442641 (= res!262207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442642 () Bool)

(assert (=> b!442642 (= e!260524 false)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!203253 () Bool)

(assert (=> b!442642 (= lt!203253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!27243 (store (arr!13069 _keys!709) i!563 k0!794) (size!13421 _keys!709)) mask!1025))))

(declare-fun b!442643 () Bool)

(declare-fun res!262203 () Bool)

(assert (=> b!442643 (=> (not res!262203) (not e!260524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442643 (= res!262203 (validMask!0 mask!1025))))

(declare-fun res!262206 () Bool)

(assert (=> start!40300 (=> (not res!262206) (not e!260524))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40300 (= res!262206 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13421 _keys!709))))))

(assert (=> start!40300 e!260524))

(assert (=> start!40300 true))

(declare-datatypes ((V!16723 0))(
  ( (V!16724 (val!5901 Int)) )
))
(declare-datatypes ((ValueCell!5513 0))(
  ( (ValueCellFull!5513 (v!8153 V!16723)) (EmptyCell!5513) )
))
(declare-datatypes ((array!27244 0))(
  ( (array!27245 (arr!13070 (Array (_ BitVec 32) ValueCell!5513)) (size!13422 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27244)

(declare-fun e!260526 () Bool)

(declare-fun array_inv!9546 (array!27244) Bool)

(assert (=> start!40300 (and (array_inv!9546 _values!549) e!260526)))

(declare-fun array_inv!9547 (array!27242) Bool)

(assert (=> start!40300 (array_inv!9547 _keys!709)))

(declare-fun b!442644 () Bool)

(declare-fun res!262200 () Bool)

(assert (=> b!442644 (=> (not res!262200) (not e!260524))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442644 (= res!262200 (and (= (size!13422 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13421 _keys!709) (size!13422 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19194 () Bool)

(declare-fun mapRes!19194 () Bool)

(declare-fun tp!37176 () Bool)

(declare-fun e!260528 () Bool)

(assert (=> mapNonEmpty!19194 (= mapRes!19194 (and tp!37176 e!260528))))

(declare-fun mapRest!19194 () (Array (_ BitVec 32) ValueCell!5513))

(declare-fun mapKey!19194 () (_ BitVec 32))

(declare-fun mapValue!19194 () ValueCell!5513)

(assert (=> mapNonEmpty!19194 (= (arr!13070 _values!549) (store mapRest!19194 mapKey!19194 mapValue!19194))))

(declare-fun b!442645 () Bool)

(declare-fun e!260527 () Bool)

(declare-fun tp_is_empty!11713 () Bool)

(assert (=> b!442645 (= e!260527 tp_is_empty!11713)))

(declare-fun b!442646 () Bool)

(declare-fun res!262202 () Bool)

(assert (=> b!442646 (=> (not res!262202) (not e!260524))))

(declare-fun arrayContainsKey!0 (array!27242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442646 (= res!262202 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442647 () Bool)

(declare-fun res!262205 () Bool)

(assert (=> b!442647 (=> (not res!262205) (not e!260524))))

(assert (=> b!442647 (= res!262205 (or (= (select (arr!13069 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13069 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442648 () Bool)

(declare-fun res!262208 () Bool)

(assert (=> b!442648 (=> (not res!262208) (not e!260524))))

(assert (=> b!442648 (= res!262208 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13421 _keys!709))))))

(declare-fun b!442649 () Bool)

(assert (=> b!442649 (= e!260528 tp_is_empty!11713)))

(declare-fun mapIsEmpty!19194 () Bool)

(assert (=> mapIsEmpty!19194 mapRes!19194))

(declare-fun b!442650 () Bool)

(declare-fun res!262201 () Bool)

(assert (=> b!442650 (=> (not res!262201) (not e!260524))))

(declare-datatypes ((List!7746 0))(
  ( (Nil!7743) (Cons!7742 (h!8598 (_ BitVec 64)) (t!13496 List!7746)) )
))
(declare-fun arrayNoDuplicates!0 (array!27242 (_ BitVec 32) List!7746) Bool)

(assert (=> b!442650 (= res!262201 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7743))))

(declare-fun b!442651 () Bool)

(declare-fun res!262204 () Bool)

(assert (=> b!442651 (=> (not res!262204) (not e!260524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442651 (= res!262204 (validKeyInArray!0 k0!794))))

(declare-fun b!442652 () Bool)

(assert (=> b!442652 (= e!260526 (and e!260527 mapRes!19194))))

(declare-fun condMapEmpty!19194 () Bool)

(declare-fun mapDefault!19194 () ValueCell!5513)

(assert (=> b!442652 (= condMapEmpty!19194 (= (arr!13070 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5513)) mapDefault!19194)))))

(assert (= (and start!40300 res!262206) b!442643))

(assert (= (and b!442643 res!262203) b!442644))

(assert (= (and b!442644 res!262200) b!442641))

(assert (= (and b!442641 res!262207) b!442650))

(assert (= (and b!442650 res!262201) b!442648))

(assert (= (and b!442648 res!262208) b!442651))

(assert (= (and b!442651 res!262204) b!442647))

(assert (= (and b!442647 res!262205) b!442646))

(assert (= (and b!442646 res!262202) b!442642))

(assert (= (and b!442652 condMapEmpty!19194) mapIsEmpty!19194))

(assert (= (and b!442652 (not condMapEmpty!19194)) mapNonEmpty!19194))

(get-info :version)

(assert (= (and mapNonEmpty!19194 ((_ is ValueCellFull!5513) mapValue!19194)) b!442649))

(assert (= (and b!442652 ((_ is ValueCellFull!5513) mapDefault!19194)) b!442645))

(assert (= start!40300 b!442652))

(declare-fun m!429465 () Bool)

(assert (=> b!442643 m!429465))

(declare-fun m!429467 () Bool)

(assert (=> mapNonEmpty!19194 m!429467))

(declare-fun m!429469 () Bool)

(assert (=> b!442650 m!429469))

(declare-fun m!429471 () Bool)

(assert (=> b!442646 m!429471))

(declare-fun m!429473 () Bool)

(assert (=> b!442642 m!429473))

(declare-fun m!429475 () Bool)

(assert (=> b!442642 m!429475))

(declare-fun m!429477 () Bool)

(assert (=> b!442651 m!429477))

(declare-fun m!429479 () Bool)

(assert (=> start!40300 m!429479))

(declare-fun m!429481 () Bool)

(assert (=> start!40300 m!429481))

(declare-fun m!429483 () Bool)

(assert (=> b!442641 m!429483))

(declare-fun m!429485 () Bool)

(assert (=> b!442647 m!429485))

(check-sat (not b!442650) (not mapNonEmpty!19194) (not b!442651) (not b!442646) (not start!40300) tp_is_empty!11713 (not b!442643) (not b!442641) (not b!442642))
(check-sat)
