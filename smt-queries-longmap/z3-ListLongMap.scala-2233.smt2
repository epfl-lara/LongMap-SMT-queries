; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36846 () Bool)

(assert start!36846)

(declare-fun b_free!7987 () Bool)

(declare-fun b_next!7987 () Bool)

(assert (=> start!36846 (= b_free!7987 (not b_next!7987))))

(declare-fun tp!28677 () Bool)

(declare-fun b_and!15203 () Bool)

(assert (=> start!36846 (= tp!28677 b_and!15203)))

(declare-fun b!368515 () Bool)

(declare-fun res!206625 () Bool)

(declare-fun e!225320 () Bool)

(assert (=> b!368515 (=> (not res!206625) (not e!225320))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21207 0))(
  ( (array!21208 (arr!10072 (Array (_ BitVec 32) (_ BitVec 64))) (size!10425 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21207)

(assert (=> b!368515 (= res!206625 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10425 _keys!658))))))

(declare-fun b!368516 () Bool)

(declare-fun e!225319 () Bool)

(declare-fun e!225323 () Bool)

(declare-fun mapRes!14517 () Bool)

(assert (=> b!368516 (= e!225319 (and e!225323 mapRes!14517))))

(declare-fun condMapEmpty!14517 () Bool)

(declare-datatypes ((V!12619 0))(
  ( (V!12620 (val!4362 Int)) )
))
(declare-datatypes ((ValueCell!3974 0))(
  ( (ValueCellFull!3974 (v!6553 V!12619)) (EmptyCell!3974) )
))
(declare-datatypes ((array!21209 0))(
  ( (array!21210 (arr!10073 (Array (_ BitVec 32) ValueCell!3974)) (size!10426 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21209)

(declare-fun mapDefault!14517 () ValueCell!3974)

(assert (=> b!368516 (= condMapEmpty!14517 (= (arr!10073 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3974)) mapDefault!14517)))))

(declare-fun b!368517 () Bool)

(declare-fun res!206623 () Bool)

(assert (=> b!368517 (=> (not res!206623) (not e!225320))))

(declare-datatypes ((List!5581 0))(
  ( (Nil!5578) (Cons!5577 (h!6433 (_ BitVec 64)) (t!10722 List!5581)) )
))
(declare-fun arrayNoDuplicates!0 (array!21207 (_ BitVec 32) List!5581) Bool)

(assert (=> b!368517 (= res!206623 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5578))))

(declare-fun b!368518 () Bool)

(declare-fun e!225318 () Bool)

(assert (=> b!368518 (= e!225320 e!225318)))

(declare-fun res!206621 () Bool)

(assert (=> b!368518 (=> (not res!206621) (not e!225318))))

(declare-fun lt!169352 () array!21207)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21207 (_ BitVec 32)) Bool)

(assert (=> b!368518 (= res!206621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169352 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!368518 (= lt!169352 (array!21208 (store (arr!10072 _keys!658) i!548 k0!778) (size!10425 _keys!658)))))

(declare-fun mapIsEmpty!14517 () Bool)

(assert (=> mapIsEmpty!14517 mapRes!14517))

(declare-fun b!368519 () Bool)

(declare-fun e!225321 () Bool)

(declare-fun tp_is_empty!8635 () Bool)

(assert (=> b!368519 (= e!225321 tp_is_empty!8635)))

(declare-fun mapNonEmpty!14517 () Bool)

(declare-fun tp!28676 () Bool)

(assert (=> mapNonEmpty!14517 (= mapRes!14517 (and tp!28676 e!225321))))

(declare-fun mapKey!14517 () (_ BitVec 32))

(declare-fun mapRest!14517 () (Array (_ BitVec 32) ValueCell!3974))

(declare-fun mapValue!14517 () ValueCell!3974)

(assert (=> mapNonEmpty!14517 (= (arr!10073 _values!506) (store mapRest!14517 mapKey!14517 mapValue!14517))))

(declare-fun b!368521 () Bool)

(assert (=> b!368521 (= e!225323 tp_is_empty!8635)))

(declare-fun b!368522 () Bool)

(declare-fun res!206626 () Bool)

(assert (=> b!368522 (=> (not res!206626) (not e!225320))))

(assert (=> b!368522 (= res!206626 (or (= (select (arr!10072 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10072 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368523 () Bool)

(declare-fun res!206630 () Bool)

(assert (=> b!368523 (=> (not res!206630) (not e!225320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368523 (= res!206630 (validKeyInArray!0 k0!778))))

(declare-fun b!368524 () Bool)

(declare-fun res!206622 () Bool)

(assert (=> b!368524 (=> (not res!206622) (not e!225320))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368524 (= res!206622 (and (= (size!10426 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10425 _keys!658) (size!10426 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368525 () Bool)

(declare-fun res!206624 () Bool)

(assert (=> b!368525 (=> (not res!206624) (not e!225320))))

(assert (=> b!368525 (= res!206624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368526 () Bool)

(declare-fun res!206629 () Bool)

(assert (=> b!368526 (=> (not res!206629) (not e!225320))))

(declare-fun arrayContainsKey!0 (array!21207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368526 (= res!206629 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368527 () Bool)

(assert (=> b!368527 (= e!225318 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12619)

(declare-fun v!373 () V!12619)

(declare-datatypes ((tuple2!5752 0))(
  ( (tuple2!5753 (_1!2887 (_ BitVec 64)) (_2!2887 V!12619)) )
))
(declare-datatypes ((List!5582 0))(
  ( (Nil!5579) (Cons!5578 (h!6434 tuple2!5752) (t!10723 List!5582)) )
))
(declare-datatypes ((ListLongMap!4655 0))(
  ( (ListLongMap!4656 (toList!2343 List!5582)) )
))
(declare-fun lt!169351 () ListLongMap!4655)

(declare-fun minValue!472 () V!12619)

(declare-fun getCurrentListMapNoExtraKeys!634 (array!21207 array!21209 (_ BitVec 32) (_ BitVec 32) V!12619 V!12619 (_ BitVec 32) Int) ListLongMap!4655)

(assert (=> b!368527 (= lt!169351 (getCurrentListMapNoExtraKeys!634 lt!169352 (array!21210 (store (arr!10073 _values!506) i!548 (ValueCellFull!3974 v!373)) (size!10426 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169353 () ListLongMap!4655)

(assert (=> b!368527 (= lt!169353 (getCurrentListMapNoExtraKeys!634 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368520 () Bool)

(declare-fun res!206627 () Bool)

(assert (=> b!368520 (=> (not res!206627) (not e!225318))))

(assert (=> b!368520 (= res!206627 (arrayNoDuplicates!0 lt!169352 #b00000000000000000000000000000000 Nil!5578))))

(declare-fun res!206628 () Bool)

(assert (=> start!36846 (=> (not res!206628) (not e!225320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36846 (= res!206628 (validMask!0 mask!970))))

(assert (=> start!36846 e!225320))

(declare-fun array_inv!7458 (array!21209) Bool)

(assert (=> start!36846 (and (array_inv!7458 _values!506) e!225319)))

(assert (=> start!36846 tp!28677))

(assert (=> start!36846 true))

(assert (=> start!36846 tp_is_empty!8635))

(declare-fun array_inv!7459 (array!21207) Bool)

(assert (=> start!36846 (array_inv!7459 _keys!658)))

(assert (= (and start!36846 res!206628) b!368524))

(assert (= (and b!368524 res!206622) b!368525))

(assert (= (and b!368525 res!206624) b!368517))

(assert (= (and b!368517 res!206623) b!368515))

(assert (= (and b!368515 res!206625) b!368523))

(assert (= (and b!368523 res!206630) b!368522))

(assert (= (and b!368522 res!206626) b!368526))

(assert (= (and b!368526 res!206629) b!368518))

(assert (= (and b!368518 res!206621) b!368520))

(assert (= (and b!368520 res!206627) b!368527))

(assert (= (and b!368516 condMapEmpty!14517) mapIsEmpty!14517))

(assert (= (and b!368516 (not condMapEmpty!14517)) mapNonEmpty!14517))

(get-info :version)

(assert (= (and mapNonEmpty!14517 ((_ is ValueCellFull!3974) mapValue!14517)) b!368519))

(assert (= (and b!368516 ((_ is ValueCellFull!3974) mapDefault!14517)) b!368521))

(assert (= start!36846 b!368516))

(declare-fun m!364589 () Bool)

(assert (=> b!368522 m!364589))

(declare-fun m!364591 () Bool)

(assert (=> b!368517 m!364591))

(declare-fun m!364593 () Bool)

(assert (=> start!36846 m!364593))

(declare-fun m!364595 () Bool)

(assert (=> start!36846 m!364595))

(declare-fun m!364597 () Bool)

(assert (=> start!36846 m!364597))

(declare-fun m!364599 () Bool)

(assert (=> b!368518 m!364599))

(declare-fun m!364601 () Bool)

(assert (=> b!368518 m!364601))

(declare-fun m!364603 () Bool)

(assert (=> b!368526 m!364603))

(declare-fun m!364605 () Bool)

(assert (=> b!368523 m!364605))

(declare-fun m!364607 () Bool)

(assert (=> mapNonEmpty!14517 m!364607))

(declare-fun m!364609 () Bool)

(assert (=> b!368525 m!364609))

(declare-fun m!364611 () Bool)

(assert (=> b!368527 m!364611))

(declare-fun m!364613 () Bool)

(assert (=> b!368527 m!364613))

(declare-fun m!364615 () Bool)

(assert (=> b!368527 m!364615))

(declare-fun m!364617 () Bool)

(assert (=> b!368520 m!364617))

(check-sat (not b!368526) (not mapNonEmpty!14517) tp_is_empty!8635 b_and!15203 (not b!368520) (not b!368517) (not b_next!7987) (not b!368527) (not start!36846) (not b!368518) (not b!368523) (not b!368525))
(check-sat b_and!15203 (not b_next!7987))
