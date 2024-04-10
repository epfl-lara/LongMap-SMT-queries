; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3822 () Bool)

(assert start!3822)

(declare-fun b_free!777 () Bool)

(declare-fun b_next!777 () Bool)

(assert (=> start!3822 (= b_free!777 (not b_next!777))))

(declare-fun tp!3741 () Bool)

(declare-fun b_and!1581 () Bool)

(assert (=> start!3822 (= tp!3741 b_and!1581)))

(declare-fun res!15863 () Bool)

(declare-fun e!17455 () Bool)

(assert (=> start!3822 (=> (not res!15863) (not e!17455))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3822 (= res!15863 (validMask!0 mask!2294))))

(assert (=> start!3822 e!17455))

(assert (=> start!3822 true))

(assert (=> start!3822 tp!3741))

(declare-datatypes ((V!1333 0))(
  ( (V!1334 (val!592 Int)) )
))
(declare-datatypes ((ValueCell!366 0))(
  ( (ValueCellFull!366 (v!1678 V!1333)) (EmptyCell!366) )
))
(declare-datatypes ((array!1503 0))(
  ( (array!1504 (arr!708 (Array (_ BitVec 32) ValueCell!366)) (size!809 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1503)

(declare-fun e!17456 () Bool)

(declare-fun array_inv!489 (array!1503) Bool)

(assert (=> start!3822 (and (array_inv!489 _values!1501) e!17456)))

(declare-datatypes ((array!1505 0))(
  ( (array!1506 (arr!709 (Array (_ BitVec 32) (_ BitVec 64))) (size!810 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1505)

(declare-fun array_inv!490 (array!1505) Bool)

(assert (=> start!3822 (array_inv!490 _keys!1833)))

(declare-fun tp_is_empty!1131 () Bool)

(assert (=> start!3822 tp_is_empty!1131))

(declare-fun b!26747 () Bool)

(declare-fun e!17454 () Bool)

(assert (=> b!26747 (= e!17454 tp_is_empty!1131)))

(declare-fun b!26748 () Bool)

(declare-fun res!15864 () Bool)

(assert (=> b!26748 (=> (not res!15864) (not e!17455))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26748 (= res!15864 (validKeyInArray!0 k0!1304))))

(declare-fun b!26749 () Bool)

(declare-fun e!17453 () Bool)

(assert (=> b!26749 (= e!17453 tp_is_empty!1131)))

(declare-fun mapNonEmpty!1216 () Bool)

(declare-fun mapRes!1216 () Bool)

(declare-fun tp!3742 () Bool)

(assert (=> mapNonEmpty!1216 (= mapRes!1216 (and tp!3742 e!17454))))

(declare-fun mapRest!1216 () (Array (_ BitVec 32) ValueCell!366))

(declare-fun mapKey!1216 () (_ BitVec 32))

(declare-fun mapValue!1216 () ValueCell!366)

(assert (=> mapNonEmpty!1216 (= (arr!708 _values!1501) (store mapRest!1216 mapKey!1216 mapValue!1216))))

(declare-fun b!26750 () Bool)

(assert (=> b!26750 (= e!17455 false)))

(declare-fun lt!10406 () Bool)

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1333)

(declare-fun minValue!1443 () V!1333)

(declare-datatypes ((tuple2!1000 0))(
  ( (tuple2!1001 (_1!511 (_ BitVec 64)) (_2!511 V!1333)) )
))
(declare-datatypes ((List!600 0))(
  ( (Nil!597) (Cons!596 (h!1163 tuple2!1000) (t!3287 List!600)) )
))
(declare-datatypes ((ListLongMap!577 0))(
  ( (ListLongMap!578 (toList!304 List!600)) )
))
(declare-fun contains!241 (ListLongMap!577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!134 (array!1505 array!1503 (_ BitVec 32) (_ BitVec 32) V!1333 V!1333 (_ BitVec 32) Int) ListLongMap!577)

(assert (=> b!26750 (= lt!10406 (contains!241 (getCurrentListMap!134 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!26751 () Bool)

(assert (=> b!26751 (= e!17456 (and e!17453 mapRes!1216))))

(declare-fun condMapEmpty!1216 () Bool)

(declare-fun mapDefault!1216 () ValueCell!366)

(assert (=> b!26751 (= condMapEmpty!1216 (= (arr!708 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!366)) mapDefault!1216)))))

(declare-fun b!26752 () Bool)

(declare-fun res!15860 () Bool)

(assert (=> b!26752 (=> (not res!15860) (not e!17455))))

(assert (=> b!26752 (= res!15860 (and (= (size!809 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!810 _keys!1833) (size!809 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26753 () Bool)

(declare-fun res!15861 () Bool)

(assert (=> b!26753 (=> (not res!15861) (not e!17455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1505 (_ BitVec 32)) Bool)

(assert (=> b!26753 (= res!15861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26754 () Bool)

(declare-fun res!15862 () Bool)

(assert (=> b!26754 (=> (not res!15862) (not e!17455))))

(declare-datatypes ((List!601 0))(
  ( (Nil!598) (Cons!597 (h!1164 (_ BitVec 64)) (t!3288 List!601)) )
))
(declare-fun arrayNoDuplicates!0 (array!1505 (_ BitVec 32) List!601) Bool)

(assert (=> b!26754 (= res!15862 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!598))))

(declare-fun mapIsEmpty!1216 () Bool)

(assert (=> mapIsEmpty!1216 mapRes!1216))

(assert (= (and start!3822 res!15863) b!26752))

(assert (= (and b!26752 res!15860) b!26753))

(assert (= (and b!26753 res!15861) b!26754))

(assert (= (and b!26754 res!15862) b!26748))

(assert (= (and b!26748 res!15864) b!26750))

(assert (= (and b!26751 condMapEmpty!1216) mapIsEmpty!1216))

(assert (= (and b!26751 (not condMapEmpty!1216)) mapNonEmpty!1216))

(get-info :version)

(assert (= (and mapNonEmpty!1216 ((_ is ValueCellFull!366) mapValue!1216)) b!26747))

(assert (= (and b!26751 ((_ is ValueCellFull!366) mapDefault!1216)) b!26749))

(assert (= start!3822 b!26751))

(declare-fun m!21407 () Bool)

(assert (=> b!26748 m!21407))

(declare-fun m!21409 () Bool)

(assert (=> b!26754 m!21409))

(declare-fun m!21411 () Bool)

(assert (=> b!26753 m!21411))

(declare-fun m!21413 () Bool)

(assert (=> b!26750 m!21413))

(assert (=> b!26750 m!21413))

(declare-fun m!21415 () Bool)

(assert (=> b!26750 m!21415))

(declare-fun m!21417 () Bool)

(assert (=> mapNonEmpty!1216 m!21417))

(declare-fun m!21419 () Bool)

(assert (=> start!3822 m!21419))

(declare-fun m!21421 () Bool)

(assert (=> start!3822 m!21421))

(declare-fun m!21423 () Bool)

(assert (=> start!3822 m!21423))

(check-sat (not start!3822) (not mapNonEmpty!1216) (not b!26748) (not b!26750) (not b!26754) tp_is_empty!1131 (not b!26753) b_and!1581 (not b_next!777))
(check-sat b_and!1581 (not b_next!777))
