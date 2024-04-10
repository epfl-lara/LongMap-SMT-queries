; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20066 () Bool)

(assert start!20066)

(declare-fun b!196485 () Bool)

(declare-fun res!92740 () Bool)

(declare-fun e!129416 () Bool)

(assert (=> b!196485 (=> (not res!92740) (not e!129416))))

(declare-datatypes ((array!8419 0))(
  ( (array!8420 (arr!3960 (Array (_ BitVec 32) (_ BitVec 64))) (size!4285 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8419)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8419 (_ BitVec 32)) Bool)

(assert (=> b!196485 (= res!92740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7940 () Bool)

(declare-fun mapRes!7940 () Bool)

(assert (=> mapIsEmpty!7940 mapRes!7940))

(declare-fun mapNonEmpty!7940 () Bool)

(declare-fun tp!17228 () Bool)

(declare-fun e!129419 () Bool)

(assert (=> mapNonEmpty!7940 (= mapRes!7940 (and tp!17228 e!129419))))

(declare-datatypes ((V!5755 0))(
  ( (V!5756 (val!2335 Int)) )
))
(declare-datatypes ((ValueCell!1947 0))(
  ( (ValueCellFull!1947 (v!4305 V!5755)) (EmptyCell!1947) )
))
(declare-datatypes ((array!8421 0))(
  ( (array!8422 (arr!3961 (Array (_ BitVec 32) ValueCell!1947)) (size!4286 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8421)

(declare-fun mapKey!7940 () (_ BitVec 32))

(declare-fun mapValue!7940 () ValueCell!1947)

(declare-fun mapRest!7940 () (Array (_ BitVec 32) ValueCell!1947))

(assert (=> mapNonEmpty!7940 (= (arr!3961 _values!649) (store mapRest!7940 mapKey!7940 mapValue!7940))))

(declare-fun b!196487 () Bool)

(declare-fun tp_is_empty!4581 () Bool)

(assert (=> b!196487 (= e!129419 tp_is_empty!4581)))

(declare-fun b!196488 () Bool)

(assert (=> b!196488 (= e!129416 false)))

(declare-fun lt!97626 () Bool)

(declare-datatypes ((List!2475 0))(
  ( (Nil!2472) (Cons!2471 (h!3113 (_ BitVec 64)) (t!7406 List!2475)) )
))
(declare-fun arrayNoDuplicates!0 (array!8419 (_ BitVec 32) List!2475) Bool)

(assert (=> b!196488 (= lt!97626 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2472))))

(declare-fun res!92739 () Bool)

(assert (=> start!20066 (=> (not res!92739) (not e!129416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20066 (= res!92739 (validMask!0 mask!1149))))

(assert (=> start!20066 e!129416))

(assert (=> start!20066 true))

(declare-fun e!129418 () Bool)

(declare-fun array_inv!2579 (array!8421) Bool)

(assert (=> start!20066 (and (array_inv!2579 _values!649) e!129418)))

(declare-fun array_inv!2580 (array!8419) Bool)

(assert (=> start!20066 (array_inv!2580 _keys!825)))

(declare-fun b!196486 () Bool)

(declare-fun res!92738 () Bool)

(assert (=> b!196486 (=> (not res!92738) (not e!129416))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196486 (= res!92738 (and (= (size!4286 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4285 _keys!825) (size!4286 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196489 () Bool)

(declare-fun e!129415 () Bool)

(assert (=> b!196489 (= e!129415 tp_is_empty!4581)))

(declare-fun b!196490 () Bool)

(assert (=> b!196490 (= e!129418 (and e!129415 mapRes!7940))))

(declare-fun condMapEmpty!7940 () Bool)

(declare-fun mapDefault!7940 () ValueCell!1947)

(assert (=> b!196490 (= condMapEmpty!7940 (= (arr!3961 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1947)) mapDefault!7940)))))

(assert (= (and start!20066 res!92739) b!196486))

(assert (= (and b!196486 res!92738) b!196485))

(assert (= (and b!196485 res!92740) b!196488))

(assert (= (and b!196490 condMapEmpty!7940) mapIsEmpty!7940))

(assert (= (and b!196490 (not condMapEmpty!7940)) mapNonEmpty!7940))

(get-info :version)

(assert (= (and mapNonEmpty!7940 ((_ is ValueCellFull!1947) mapValue!7940)) b!196487))

(assert (= (and b!196490 ((_ is ValueCellFull!1947) mapDefault!7940)) b!196489))

(assert (= start!20066 b!196490))

(declare-fun m!223747 () Bool)

(assert (=> b!196485 m!223747))

(declare-fun m!223749 () Bool)

(assert (=> mapNonEmpty!7940 m!223749))

(declare-fun m!223751 () Bool)

(assert (=> b!196488 m!223751))

(declare-fun m!223753 () Bool)

(assert (=> start!20066 m!223753))

(declare-fun m!223755 () Bool)

(assert (=> start!20066 m!223755))

(declare-fun m!223757 () Bool)

(assert (=> start!20066 m!223757))

(check-sat (not start!20066) tp_is_empty!4581 (not b!196485) (not mapNonEmpty!7940) (not b!196488))
(check-sat)
