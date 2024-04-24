; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36840 () Bool)

(assert start!36840)

(declare-fun b_free!7981 () Bool)

(declare-fun b_next!7981 () Bool)

(assert (=> start!36840 (= b_free!7981 (not b_next!7981))))

(declare-fun tp!28658 () Bool)

(declare-fun b_and!15237 () Bool)

(assert (=> start!36840 (= tp!28658 b_and!15237)))

(declare-fun mapIsEmpty!14508 () Bool)

(declare-fun mapRes!14508 () Bool)

(assert (=> mapIsEmpty!14508 mapRes!14508))

(declare-fun b!368620 () Bool)

(declare-fun e!225410 () Bool)

(declare-fun e!225406 () Bool)

(assert (=> b!368620 (= e!225410 e!225406)))

(declare-fun res!206657 () Bool)

(assert (=> b!368620 (=> (not res!206657) (not e!225406))))

(declare-datatypes ((array!21194 0))(
  ( (array!21195 (arr!10065 (Array (_ BitVec 32) (_ BitVec 64))) (size!10417 (_ BitVec 32))) )
))
(declare-fun lt!169585 () array!21194)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21194 (_ BitVec 32)) Bool)

(assert (=> b!368620 (= res!206657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169585 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21194)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368620 (= lt!169585 (array!21195 (store (arr!10065 _keys!658) i!548 k0!778) (size!10417 _keys!658)))))

(declare-fun res!206666 () Bool)

(assert (=> start!36840 (=> (not res!206666) (not e!225410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36840 (= res!206666 (validMask!0 mask!970))))

(assert (=> start!36840 e!225410))

(assert (=> start!36840 true))

(declare-datatypes ((V!12611 0))(
  ( (V!12612 (val!4359 Int)) )
))
(declare-datatypes ((ValueCell!3971 0))(
  ( (ValueCellFull!3971 (v!6557 V!12611)) (EmptyCell!3971) )
))
(declare-datatypes ((array!21196 0))(
  ( (array!21197 (arr!10066 (Array (_ BitVec 32) ValueCell!3971)) (size!10418 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21196)

(declare-fun e!225411 () Bool)

(declare-fun array_inv!7474 (array!21196) Bool)

(assert (=> start!36840 (and (array_inv!7474 _values!506) e!225411)))

(assert (=> start!36840 tp!28658))

(declare-fun tp_is_empty!8629 () Bool)

(assert (=> start!36840 tp_is_empty!8629))

(declare-fun array_inv!7475 (array!21194) Bool)

(assert (=> start!36840 (array_inv!7475 _keys!658)))

(declare-fun b!368621 () Bool)

(assert (=> b!368621 (= e!225406 (bvsgt #b00000000000000000000000000000000 (size!10417 _keys!658)))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5694 0))(
  ( (tuple2!5695 (_1!2858 (_ BitVec 64)) (_2!2858 V!12611)) )
))
(declare-datatypes ((List!5517 0))(
  ( (Nil!5514) (Cons!5513 (h!6369 tuple2!5694) (t!10659 List!5517)) )
))
(declare-datatypes ((ListLongMap!4609 0))(
  ( (ListLongMap!4610 (toList!2320 List!5517)) )
))
(declare-fun lt!169584 () ListLongMap!4609)

(declare-fun zeroValue!472 () V!12611)

(declare-fun minValue!472 () V!12611)

(declare-fun getCurrentListMapNoExtraKeys!629 (array!21194 array!21196 (_ BitVec 32) (_ BitVec 32) V!12611 V!12611 (_ BitVec 32) Int) ListLongMap!4609)

(assert (=> b!368621 (= lt!169584 (getCurrentListMapNoExtraKeys!629 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368622 () Bool)

(declare-fun res!206663 () Bool)

(assert (=> b!368622 (=> (not res!206663) (not e!225410))))

(assert (=> b!368622 (= res!206663 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10417 _keys!658))))))

(declare-fun b!368623 () Bool)

(declare-fun res!206665 () Bool)

(assert (=> b!368623 (=> (not res!206665) (not e!225410))))

(assert (=> b!368623 (= res!206665 (and (= (size!10418 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10417 _keys!658) (size!10418 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368624 () Bool)

(declare-fun res!206661 () Bool)

(assert (=> b!368624 (=> (not res!206661) (not e!225410))))

(assert (=> b!368624 (= res!206661 (or (= (select (arr!10065 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10065 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368625 () Bool)

(declare-fun res!206660 () Bool)

(assert (=> b!368625 (=> (not res!206660) (not e!225410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368625 (= res!206660 (validKeyInArray!0 k0!778))))

(declare-fun b!368626 () Bool)

(declare-fun e!225409 () Bool)

(assert (=> b!368626 (= e!225409 tp_is_empty!8629)))

(declare-fun b!368627 () Bool)

(declare-fun res!206664 () Bool)

(assert (=> b!368627 (=> (not res!206664) (not e!225410))))

(declare-datatypes ((List!5518 0))(
  ( (Nil!5515) (Cons!5514 (h!6370 (_ BitVec 64)) (t!10660 List!5518)) )
))
(declare-fun arrayNoDuplicates!0 (array!21194 (_ BitVec 32) List!5518) Bool)

(assert (=> b!368627 (= res!206664 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5515))))

(declare-fun b!368628 () Bool)

(declare-fun res!206659 () Bool)

(assert (=> b!368628 (=> (not res!206659) (not e!225406))))

(assert (=> b!368628 (= res!206659 (arrayNoDuplicates!0 lt!169585 #b00000000000000000000000000000000 Nil!5515))))

(declare-fun mapNonEmpty!14508 () Bool)

(declare-fun tp!28659 () Bool)

(assert (=> mapNonEmpty!14508 (= mapRes!14508 (and tp!28659 e!225409))))

(declare-fun mapValue!14508 () ValueCell!3971)

(declare-fun mapKey!14508 () (_ BitVec 32))

(declare-fun mapRest!14508 () (Array (_ BitVec 32) ValueCell!3971))

(assert (=> mapNonEmpty!14508 (= (arr!10066 _values!506) (store mapRest!14508 mapKey!14508 mapValue!14508))))

(declare-fun b!368629 () Bool)

(declare-fun res!206662 () Bool)

(assert (=> b!368629 (=> (not res!206662) (not e!225410))))

(assert (=> b!368629 (= res!206662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368630 () Bool)

(declare-fun e!225407 () Bool)

(assert (=> b!368630 (= e!225407 tp_is_empty!8629)))

(declare-fun b!368631 () Bool)

(declare-fun res!206658 () Bool)

(assert (=> b!368631 (=> (not res!206658) (not e!225410))))

(declare-fun arrayContainsKey!0 (array!21194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368631 (= res!206658 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368632 () Bool)

(assert (=> b!368632 (= e!225411 (and e!225407 mapRes!14508))))

(declare-fun condMapEmpty!14508 () Bool)

(declare-fun mapDefault!14508 () ValueCell!3971)

(assert (=> b!368632 (= condMapEmpty!14508 (= (arr!10066 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3971)) mapDefault!14508)))))

(assert (= (and start!36840 res!206666) b!368623))

(assert (= (and b!368623 res!206665) b!368629))

(assert (= (and b!368629 res!206662) b!368627))

(assert (= (and b!368627 res!206664) b!368622))

(assert (= (and b!368622 res!206663) b!368625))

(assert (= (and b!368625 res!206660) b!368624))

(assert (= (and b!368624 res!206661) b!368631))

(assert (= (and b!368631 res!206658) b!368620))

(assert (= (and b!368620 res!206657) b!368628))

(assert (= (and b!368628 res!206659) b!368621))

(assert (= (and b!368632 condMapEmpty!14508) mapIsEmpty!14508))

(assert (= (and b!368632 (not condMapEmpty!14508)) mapNonEmpty!14508))

(get-info :version)

(assert (= (and mapNonEmpty!14508 ((_ is ValueCellFull!3971) mapValue!14508)) b!368626))

(assert (= (and b!368632 ((_ is ValueCellFull!3971) mapDefault!14508)) b!368630))

(assert (= start!36840 b!368632))

(declare-fun m!365465 () Bool)

(assert (=> start!36840 m!365465))

(declare-fun m!365467 () Bool)

(assert (=> start!36840 m!365467))

(declare-fun m!365469 () Bool)

(assert (=> start!36840 m!365469))

(declare-fun m!365471 () Bool)

(assert (=> b!368628 m!365471))

(declare-fun m!365473 () Bool)

(assert (=> b!368621 m!365473))

(declare-fun m!365475 () Bool)

(assert (=> b!368629 m!365475))

(declare-fun m!365477 () Bool)

(assert (=> b!368620 m!365477))

(declare-fun m!365479 () Bool)

(assert (=> b!368620 m!365479))

(declare-fun m!365481 () Bool)

(assert (=> mapNonEmpty!14508 m!365481))

(declare-fun m!365483 () Bool)

(assert (=> b!368627 m!365483))

(declare-fun m!365485 () Bool)

(assert (=> b!368631 m!365485))

(declare-fun m!365487 () Bool)

(assert (=> b!368624 m!365487))

(declare-fun m!365489 () Bool)

(assert (=> b!368625 m!365489))

(check-sat (not b!368628) (not b!368621) b_and!15237 (not b!368627) (not b!368631) tp_is_empty!8629 (not b!368625) (not b!368620) (not start!36840) (not b!368629) (not b_next!7981) (not mapNonEmpty!14508))
(check-sat b_and!15237 (not b_next!7981))
