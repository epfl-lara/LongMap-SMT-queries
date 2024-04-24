; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38930 () Bool)

(assert start!38930)

(declare-fun b!407551 () Bool)

(declare-fun res!235668 () Bool)

(declare-fun e!244740 () Bool)

(assert (=> b!407551 (=> (not res!235668) (not e!244740))))

(declare-datatypes ((array!24604 0))(
  ( (array!24605 (arr!11751 (Array (_ BitVec 32) (_ BitVec 64))) (size!12103 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24604)

(declare-datatypes ((List!6693 0))(
  ( (Nil!6690) (Cons!6689 (h!7545 (_ BitVec 64)) (t!11859 List!6693)) )
))
(declare-fun arrayNoDuplicates!0 (array!24604 (_ BitVec 32) List!6693) Bool)

(assert (=> b!407551 (= res!235668 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6690))))

(declare-fun b!407552 () Bool)

(declare-fun e!244739 () Bool)

(declare-fun tp_is_empty!10363 () Bool)

(assert (=> b!407552 (= e!244739 tp_is_empty!10363)))

(declare-fun b!407553 () Bool)

(declare-fun res!235674 () Bool)

(assert (=> b!407553 (=> (not res!235674) (not e!244740))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14923 0))(
  ( (V!14924 (val!5226 Int)) )
))
(declare-datatypes ((ValueCell!4838 0))(
  ( (ValueCellFull!4838 (v!7474 V!14923)) (EmptyCell!4838) )
))
(declare-datatypes ((array!24606 0))(
  ( (array!24607 (arr!11752 (Array (_ BitVec 32) ValueCell!4838)) (size!12104 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24606)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!407553 (= res!235674 (and (= (size!12104 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12103 _keys!709) (size!12104 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407554 () Bool)

(declare-fun e!244742 () Bool)

(assert (=> b!407554 (= e!244740 e!244742)))

(declare-fun res!235665 () Bool)

(assert (=> b!407554 (=> (not res!235665) (not e!244742))))

(declare-fun lt!188688 () array!24604)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24604 (_ BitVec 32)) Bool)

(assert (=> b!407554 (= res!235665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188688 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407554 (= lt!188688 (array!24605 (store (arr!11751 _keys!709) i!563 k0!794) (size!12103 _keys!709)))))

(declare-fun res!235670 () Bool)

(assert (=> start!38930 (=> (not res!235670) (not e!244740))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38930 (= res!235670 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12103 _keys!709))))))

(assert (=> start!38930 e!244740))

(assert (=> start!38930 true))

(declare-fun e!244743 () Bool)

(declare-fun array_inv!8660 (array!24606) Bool)

(assert (=> start!38930 (and (array_inv!8660 _values!549) e!244743)))

(declare-fun array_inv!8661 (array!24604) Bool)

(assert (=> start!38930 (array_inv!8661 _keys!709)))

(declare-fun b!407555 () Bool)

(declare-fun res!235667 () Bool)

(assert (=> b!407555 (=> (not res!235667) (not e!244740))))

(assert (=> b!407555 (= res!235667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407556 () Bool)

(declare-fun res!235669 () Bool)

(assert (=> b!407556 (=> (not res!235669) (not e!244740))))

(assert (=> b!407556 (= res!235669 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12103 _keys!709))))))

(declare-fun mapNonEmpty!17166 () Bool)

(declare-fun mapRes!17166 () Bool)

(declare-fun tp!33285 () Bool)

(declare-fun e!244744 () Bool)

(assert (=> mapNonEmpty!17166 (= mapRes!17166 (and tp!33285 e!244744))))

(declare-fun mapKey!17166 () (_ BitVec 32))

(declare-fun mapRest!17166 () (Array (_ BitVec 32) ValueCell!4838))

(declare-fun mapValue!17166 () ValueCell!4838)

(assert (=> mapNonEmpty!17166 (= (arr!11752 _values!549) (store mapRest!17166 mapKey!17166 mapValue!17166))))

(declare-fun b!407557 () Bool)

(declare-fun res!235666 () Bool)

(assert (=> b!407557 (=> (not res!235666) (not e!244740))))

(assert (=> b!407557 (= res!235666 (or (= (select (arr!11751 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11751 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407558 () Bool)

(assert (=> b!407558 (= e!244744 tp_is_empty!10363)))

(declare-fun mapIsEmpty!17166 () Bool)

(assert (=> mapIsEmpty!17166 mapRes!17166))

(declare-fun b!407559 () Bool)

(declare-fun res!235672 () Bool)

(assert (=> b!407559 (=> (not res!235672) (not e!244740))))

(declare-fun arrayContainsKey!0 (array!24604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407559 (= res!235672 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407560 () Bool)

(assert (=> b!407560 (= e!244743 (and e!244739 mapRes!17166))))

(declare-fun condMapEmpty!17166 () Bool)

(declare-fun mapDefault!17166 () ValueCell!4838)

(assert (=> b!407560 (= condMapEmpty!17166 (= (arr!11752 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4838)) mapDefault!17166)))))

(declare-fun b!407561 () Bool)

(declare-fun res!235673 () Bool)

(assert (=> b!407561 (=> (not res!235673) (not e!244740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407561 (= res!235673 (validMask!0 mask!1025))))

(declare-fun b!407562 () Bool)

(assert (=> b!407562 (= e!244742 false)))

(declare-fun lt!188687 () Bool)

(assert (=> b!407562 (= lt!188687 (arrayNoDuplicates!0 lt!188688 #b00000000000000000000000000000000 Nil!6690))))

(declare-fun b!407563 () Bool)

(declare-fun res!235671 () Bool)

(assert (=> b!407563 (=> (not res!235671) (not e!244740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407563 (= res!235671 (validKeyInArray!0 k0!794))))

(assert (= (and start!38930 res!235670) b!407561))

(assert (= (and b!407561 res!235673) b!407553))

(assert (= (and b!407553 res!235674) b!407555))

(assert (= (and b!407555 res!235667) b!407551))

(assert (= (and b!407551 res!235668) b!407556))

(assert (= (and b!407556 res!235669) b!407563))

(assert (= (and b!407563 res!235671) b!407557))

(assert (= (and b!407557 res!235666) b!407559))

(assert (= (and b!407559 res!235672) b!407554))

(assert (= (and b!407554 res!235665) b!407562))

(assert (= (and b!407560 condMapEmpty!17166) mapIsEmpty!17166))

(assert (= (and b!407560 (not condMapEmpty!17166)) mapNonEmpty!17166))

(get-info :version)

(assert (= (and mapNonEmpty!17166 ((_ is ValueCellFull!4838) mapValue!17166)) b!407558))

(assert (= (and b!407560 ((_ is ValueCellFull!4838) mapDefault!17166)) b!407552))

(assert (= start!38930 b!407560))

(declare-fun m!399453 () Bool)

(assert (=> b!407554 m!399453))

(declare-fun m!399455 () Bool)

(assert (=> b!407554 m!399455))

(declare-fun m!399457 () Bool)

(assert (=> b!407559 m!399457))

(declare-fun m!399459 () Bool)

(assert (=> mapNonEmpty!17166 m!399459))

(declare-fun m!399461 () Bool)

(assert (=> b!407563 m!399461))

(declare-fun m!399463 () Bool)

(assert (=> b!407555 m!399463))

(declare-fun m!399465 () Bool)

(assert (=> b!407557 m!399465))

(declare-fun m!399467 () Bool)

(assert (=> b!407562 m!399467))

(declare-fun m!399469 () Bool)

(assert (=> b!407561 m!399469))

(declare-fun m!399471 () Bool)

(assert (=> b!407551 m!399471))

(declare-fun m!399473 () Bool)

(assert (=> start!38930 m!399473))

(declare-fun m!399475 () Bool)

(assert (=> start!38930 m!399475))

(check-sat (not b!407562) (not start!38930) (not b!407561) (not b!407563) (not mapNonEmpty!17166) (not b!407551) (not b!407554) (not b!407555) tp_is_empty!10363 (not b!407559))
(check-sat)
