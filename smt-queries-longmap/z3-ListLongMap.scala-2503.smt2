; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38822 () Bool)

(assert start!38822)

(declare-fun b!405445 () Bool)

(declare-fun res!234048 () Bool)

(declare-fun e!243771 () Bool)

(assert (=> b!405445 (=> (not res!234048) (not e!243771))))

(declare-datatypes ((array!24390 0))(
  ( (array!24391 (arr!11644 (Array (_ BitVec 32) (_ BitVec 64))) (size!11996 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24390)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405445 (= res!234048 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405446 () Bool)

(declare-fun e!243772 () Bool)

(declare-fun e!243769 () Bool)

(declare-fun mapRes!17004 () Bool)

(assert (=> b!405446 (= e!243772 (and e!243769 mapRes!17004))))

(declare-fun condMapEmpty!17004 () Bool)

(declare-datatypes ((V!14779 0))(
  ( (V!14780 (val!5172 Int)) )
))
(declare-datatypes ((ValueCell!4784 0))(
  ( (ValueCellFull!4784 (v!7420 V!14779)) (EmptyCell!4784) )
))
(declare-datatypes ((array!24392 0))(
  ( (array!24393 (arr!11645 (Array (_ BitVec 32) ValueCell!4784)) (size!11997 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24392)

(declare-fun mapDefault!17004 () ValueCell!4784)

(assert (=> b!405446 (= condMapEmpty!17004 (= (arr!11645 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4784)) mapDefault!17004)))))

(declare-fun b!405447 () Bool)

(declare-fun res!234050 () Bool)

(assert (=> b!405447 (=> (not res!234050) (not e!243771))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!405447 (= res!234050 (and (= (size!11997 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11996 _keys!709) (size!11997 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405448 () Bool)

(declare-fun res!234045 () Bool)

(assert (=> b!405448 (=> (not res!234045) (not e!243771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405448 (= res!234045 (validKeyInArray!0 k0!794))))

(declare-fun b!405449 () Bool)

(declare-fun res!234047 () Bool)

(assert (=> b!405449 (=> (not res!234047) (not e!243771))))

(declare-datatypes ((List!6649 0))(
  ( (Nil!6646) (Cons!6645 (h!7501 (_ BitVec 64)) (t!11815 List!6649)) )
))
(declare-fun arrayNoDuplicates!0 (array!24390 (_ BitVec 32) List!6649) Bool)

(assert (=> b!405449 (= res!234047 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6646))))

(declare-fun b!405450 () Bool)

(declare-fun e!243770 () Bool)

(assert (=> b!405450 (= e!243771 e!243770)))

(declare-fun res!234054 () Bool)

(assert (=> b!405450 (=> (not res!234054) (not e!243770))))

(declare-fun lt!188364 () array!24390)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24390 (_ BitVec 32)) Bool)

(assert (=> b!405450 (= res!234054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188364 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405450 (= lt!188364 (array!24391 (store (arr!11644 _keys!709) i!563 k0!794) (size!11996 _keys!709)))))

(declare-fun b!405451 () Bool)

(declare-fun res!234046 () Bool)

(assert (=> b!405451 (=> (not res!234046) (not e!243771))))

(assert (=> b!405451 (= res!234046 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11996 _keys!709))))))

(declare-fun b!405452 () Bool)

(declare-fun res!234053 () Bool)

(assert (=> b!405452 (=> (not res!234053) (not e!243771))))

(assert (=> b!405452 (= res!234053 (or (= (select (arr!11644 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11644 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405453 () Bool)

(declare-fun e!243767 () Bool)

(declare-fun tp_is_empty!10255 () Bool)

(assert (=> b!405453 (= e!243767 tp_is_empty!10255)))

(declare-fun b!405454 () Bool)

(declare-fun res!234051 () Bool)

(assert (=> b!405454 (=> (not res!234051) (not e!243771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405454 (= res!234051 (validMask!0 mask!1025))))

(declare-fun b!405455 () Bool)

(assert (=> b!405455 (= e!243770 false)))

(declare-fun lt!188363 () Bool)

(assert (=> b!405455 (= lt!188363 (arrayNoDuplicates!0 lt!188364 #b00000000000000000000000000000000 Nil!6646))))

(declare-fun b!405456 () Bool)

(declare-fun res!234052 () Bool)

(assert (=> b!405456 (=> (not res!234052) (not e!243771))))

(assert (=> b!405456 (= res!234052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17004 () Bool)

(declare-fun tp!33123 () Bool)

(assert (=> mapNonEmpty!17004 (= mapRes!17004 (and tp!33123 e!243767))))

(declare-fun mapRest!17004 () (Array (_ BitVec 32) ValueCell!4784))

(declare-fun mapValue!17004 () ValueCell!4784)

(declare-fun mapKey!17004 () (_ BitVec 32))

(assert (=> mapNonEmpty!17004 (= (arr!11645 _values!549) (store mapRest!17004 mapKey!17004 mapValue!17004))))

(declare-fun res!234049 () Bool)

(assert (=> start!38822 (=> (not res!234049) (not e!243771))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38822 (= res!234049 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11996 _keys!709))))))

(assert (=> start!38822 e!243771))

(assert (=> start!38822 true))

(declare-fun array_inv!8602 (array!24392) Bool)

(assert (=> start!38822 (and (array_inv!8602 _values!549) e!243772)))

(declare-fun array_inv!8603 (array!24390) Bool)

(assert (=> start!38822 (array_inv!8603 _keys!709)))

(declare-fun mapIsEmpty!17004 () Bool)

(assert (=> mapIsEmpty!17004 mapRes!17004))

(declare-fun b!405457 () Bool)

(assert (=> b!405457 (= e!243769 tp_is_empty!10255)))

(assert (= (and start!38822 res!234049) b!405454))

(assert (= (and b!405454 res!234051) b!405447))

(assert (= (and b!405447 res!234050) b!405456))

(assert (= (and b!405456 res!234052) b!405449))

(assert (= (and b!405449 res!234047) b!405451))

(assert (= (and b!405451 res!234046) b!405448))

(assert (= (and b!405448 res!234045) b!405452))

(assert (= (and b!405452 res!234053) b!405445))

(assert (= (and b!405445 res!234048) b!405450))

(assert (= (and b!405450 res!234054) b!405455))

(assert (= (and b!405446 condMapEmpty!17004) mapIsEmpty!17004))

(assert (= (and b!405446 (not condMapEmpty!17004)) mapNonEmpty!17004))

(get-info :version)

(assert (= (and mapNonEmpty!17004 ((_ is ValueCellFull!4784) mapValue!17004)) b!405453))

(assert (= (and b!405446 ((_ is ValueCellFull!4784) mapDefault!17004)) b!405457))

(assert (= start!38822 b!405446))

(declare-fun m!398157 () Bool)

(assert (=> b!405448 m!398157))

(declare-fun m!398159 () Bool)

(assert (=> start!38822 m!398159))

(declare-fun m!398161 () Bool)

(assert (=> start!38822 m!398161))

(declare-fun m!398163 () Bool)

(assert (=> b!405454 m!398163))

(declare-fun m!398165 () Bool)

(assert (=> b!405456 m!398165))

(declare-fun m!398167 () Bool)

(assert (=> b!405450 m!398167))

(declare-fun m!398169 () Bool)

(assert (=> b!405450 m!398169))

(declare-fun m!398171 () Bool)

(assert (=> b!405452 m!398171))

(declare-fun m!398173 () Bool)

(assert (=> b!405455 m!398173))

(declare-fun m!398175 () Bool)

(assert (=> b!405449 m!398175))

(declare-fun m!398177 () Bool)

(assert (=> b!405445 m!398177))

(declare-fun m!398179 () Bool)

(assert (=> mapNonEmpty!17004 m!398179))

(check-sat (not b!405456) (not b!405450) (not b!405449) (not start!38822) (not mapNonEmpty!17004) (not b!405445) tp_is_empty!10255 (not b!405448) (not b!405454) (not b!405455))
(check-sat)
