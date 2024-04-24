; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36984 () Bool)

(assert start!36984)

(declare-fun b_free!8125 () Bool)

(declare-fun b_next!8125 () Bool)

(assert (=> start!36984 (= b_free!8125 (not b_next!8125))))

(declare-fun tp!29090 () Bool)

(declare-fun b_and!15381 () Bool)

(assert (=> start!36984 (= tp!29090 b_and!15381)))

(declare-fun b!371428 () Bool)

(declare-fun res!208818 () Bool)

(declare-fun e!226703 () Bool)

(assert (=> b!371428 (=> (not res!208818) (not e!226703))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12803 0))(
  ( (V!12804 (val!4431 Int)) )
))
(declare-datatypes ((ValueCell!4043 0))(
  ( (ValueCellFull!4043 (v!6629 V!12803)) (EmptyCell!4043) )
))
(declare-datatypes ((array!21472 0))(
  ( (array!21473 (arr!10204 (Array (_ BitVec 32) ValueCell!4043)) (size!10556 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21472)

(declare-datatypes ((array!21474 0))(
  ( (array!21475 (arr!10205 (Array (_ BitVec 32) (_ BitVec 64))) (size!10557 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21474)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!371428 (= res!208818 (and (= (size!10556 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10557 _keys!658) (size!10556 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371429 () Bool)

(declare-fun res!208823 () Bool)

(assert (=> b!371429 (=> (not res!208823) (not e!226703))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371429 (= res!208823 (validKeyInArray!0 k0!778))))

(declare-fun b!371430 () Bool)

(declare-fun e!226702 () Bool)

(declare-fun tp_is_empty!8773 () Bool)

(assert (=> b!371430 (= e!226702 tp_is_empty!8773)))

(declare-fun b!371431 () Bool)

(declare-fun e!226707 () Bool)

(assert (=> b!371431 (= e!226703 e!226707)))

(declare-fun res!208824 () Bool)

(assert (=> b!371431 (=> (not res!208824) (not e!226707))))

(declare-fun lt!170320 () array!21474)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21474 (_ BitVec 32)) Bool)

(assert (=> b!371431 (= res!208824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170320 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371431 (= lt!170320 (array!21475 (store (arr!10205 _keys!658) i!548 k0!778) (size!10557 _keys!658)))))

(declare-fun res!208826 () Bool)

(assert (=> start!36984 (=> (not res!208826) (not e!226703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36984 (= res!208826 (validMask!0 mask!970))))

(assert (=> start!36984 e!226703))

(declare-fun e!226705 () Bool)

(declare-fun array_inv!7564 (array!21472) Bool)

(assert (=> start!36984 (and (array_inv!7564 _values!506) e!226705)))

(assert (=> start!36984 tp!29090))

(assert (=> start!36984 true))

(assert (=> start!36984 tp_is_empty!8773))

(declare-fun array_inv!7565 (array!21474) Bool)

(assert (=> start!36984 (array_inv!7565 _keys!658)))

(declare-fun b!371432 () Bool)

(assert (=> b!371432 (= e!226707 (not true))))

(declare-datatypes ((tuple2!5776 0))(
  ( (tuple2!5777 (_1!2899 (_ BitVec 64)) (_2!2899 V!12803)) )
))
(declare-datatypes ((List!5616 0))(
  ( (Nil!5613) (Cons!5612 (h!6468 tuple2!5776) (t!10758 List!5616)) )
))
(declare-datatypes ((ListLongMap!4691 0))(
  ( (ListLongMap!4692 (toList!2361 List!5616)) )
))
(declare-fun lt!170322 () ListLongMap!4691)

(declare-fun lt!170319 () ListLongMap!4691)

(assert (=> b!371432 (and (= lt!170322 lt!170319) (= lt!170319 lt!170322))))

(declare-fun v!373 () V!12803)

(declare-fun lt!170321 () ListLongMap!4691)

(declare-fun +!757 (ListLongMap!4691 tuple2!5776) ListLongMap!4691)

(assert (=> b!371432 (= lt!170319 (+!757 lt!170321 (tuple2!5777 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11405 0))(
  ( (Unit!11406) )
))
(declare-fun lt!170323 () Unit!11405)

(declare-fun zeroValue!472 () V!12803)

(declare-fun minValue!472 () V!12803)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!10 (array!21474 array!21472 (_ BitVec 32) (_ BitVec 32) V!12803 V!12803 (_ BitVec 32) (_ BitVec 64) V!12803 (_ BitVec 32) Int) Unit!11405)

(assert (=> b!371432 (= lt!170323 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!10 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!670 (array!21474 array!21472 (_ BitVec 32) (_ BitVec 32) V!12803 V!12803 (_ BitVec 32) Int) ListLongMap!4691)

(assert (=> b!371432 (= lt!170322 (getCurrentListMapNoExtraKeys!670 lt!170320 (array!21473 (store (arr!10204 _values!506) i!548 (ValueCellFull!4043 v!373)) (size!10556 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371432 (= lt!170321 (getCurrentListMapNoExtraKeys!670 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371433 () Bool)

(declare-fun res!208820 () Bool)

(assert (=> b!371433 (=> (not res!208820) (not e!226707))))

(declare-datatypes ((List!5617 0))(
  ( (Nil!5614) (Cons!5613 (h!6469 (_ BitVec 64)) (t!10759 List!5617)) )
))
(declare-fun arrayNoDuplicates!0 (array!21474 (_ BitVec 32) List!5617) Bool)

(assert (=> b!371433 (= res!208820 (arrayNoDuplicates!0 lt!170320 #b00000000000000000000000000000000 Nil!5614))))

(declare-fun b!371434 () Bool)

(declare-fun res!208819 () Bool)

(assert (=> b!371434 (=> (not res!208819) (not e!226703))))

(assert (=> b!371434 (= res!208819 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5614))))

(declare-fun b!371435 () Bool)

(declare-fun res!208817 () Bool)

(assert (=> b!371435 (=> (not res!208817) (not e!226703))))

(assert (=> b!371435 (= res!208817 (or (= (select (arr!10205 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10205 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14724 () Bool)

(declare-fun mapRes!14724 () Bool)

(assert (=> mapIsEmpty!14724 mapRes!14724))

(declare-fun b!371436 () Bool)

(declare-fun res!208822 () Bool)

(assert (=> b!371436 (=> (not res!208822) (not e!226703))))

(assert (=> b!371436 (= res!208822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14724 () Bool)

(declare-fun tp!29091 () Bool)

(assert (=> mapNonEmpty!14724 (= mapRes!14724 (and tp!29091 e!226702))))

(declare-fun mapKey!14724 () (_ BitVec 32))

(declare-fun mapRest!14724 () (Array (_ BitVec 32) ValueCell!4043))

(declare-fun mapValue!14724 () ValueCell!4043)

(assert (=> mapNonEmpty!14724 (= (arr!10204 _values!506) (store mapRest!14724 mapKey!14724 mapValue!14724))))

(declare-fun b!371437 () Bool)

(declare-fun res!208825 () Bool)

(assert (=> b!371437 (=> (not res!208825) (not e!226703))))

(declare-fun arrayContainsKey!0 (array!21474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371437 (= res!208825 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371438 () Bool)

(declare-fun res!208821 () Bool)

(assert (=> b!371438 (=> (not res!208821) (not e!226703))))

(assert (=> b!371438 (= res!208821 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10557 _keys!658))))))

(declare-fun b!371439 () Bool)

(declare-fun e!226704 () Bool)

(assert (=> b!371439 (= e!226704 tp_is_empty!8773)))

(declare-fun b!371440 () Bool)

(assert (=> b!371440 (= e!226705 (and e!226704 mapRes!14724))))

(declare-fun condMapEmpty!14724 () Bool)

(declare-fun mapDefault!14724 () ValueCell!4043)

(assert (=> b!371440 (= condMapEmpty!14724 (= (arr!10204 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4043)) mapDefault!14724)))))

(assert (= (and start!36984 res!208826) b!371428))

(assert (= (and b!371428 res!208818) b!371436))

(assert (= (and b!371436 res!208822) b!371434))

(assert (= (and b!371434 res!208819) b!371438))

(assert (= (and b!371438 res!208821) b!371429))

(assert (= (and b!371429 res!208823) b!371435))

(assert (= (and b!371435 res!208817) b!371437))

(assert (= (and b!371437 res!208825) b!371431))

(assert (= (and b!371431 res!208824) b!371433))

(assert (= (and b!371433 res!208820) b!371432))

(assert (= (and b!371440 condMapEmpty!14724) mapIsEmpty!14724))

(assert (= (and b!371440 (not condMapEmpty!14724)) mapNonEmpty!14724))

(get-info :version)

(assert (= (and mapNonEmpty!14724 ((_ is ValueCellFull!4043) mapValue!14724)) b!371430))

(assert (= (and b!371440 ((_ is ValueCellFull!4043) mapDefault!14724)) b!371439))

(assert (= start!36984 b!371440))

(declare-fun m!367673 () Bool)

(assert (=> mapNonEmpty!14724 m!367673))

(declare-fun m!367675 () Bool)

(assert (=> b!371433 m!367675))

(declare-fun m!367677 () Bool)

(assert (=> start!36984 m!367677))

(declare-fun m!367679 () Bool)

(assert (=> start!36984 m!367679))

(declare-fun m!367681 () Bool)

(assert (=> start!36984 m!367681))

(declare-fun m!367683 () Bool)

(assert (=> b!371429 m!367683))

(declare-fun m!367685 () Bool)

(assert (=> b!371434 m!367685))

(declare-fun m!367687 () Bool)

(assert (=> b!371435 m!367687))

(declare-fun m!367689 () Bool)

(assert (=> b!371437 m!367689))

(declare-fun m!367691 () Bool)

(assert (=> b!371436 m!367691))

(declare-fun m!367693 () Bool)

(assert (=> b!371432 m!367693))

(declare-fun m!367695 () Bool)

(assert (=> b!371432 m!367695))

(declare-fun m!367697 () Bool)

(assert (=> b!371432 m!367697))

(declare-fun m!367699 () Bool)

(assert (=> b!371432 m!367699))

(declare-fun m!367701 () Bool)

(assert (=> b!371432 m!367701))

(declare-fun m!367703 () Bool)

(assert (=> b!371431 m!367703))

(declare-fun m!367705 () Bool)

(assert (=> b!371431 m!367705))

(check-sat (not mapNonEmpty!14724) (not b!371436) (not b!371432) b_and!15381 (not b!371429) (not start!36984) (not b!371433) (not b_next!8125) tp_is_empty!8773 (not b!371434) (not b!371431) (not b!371437))
(check-sat b_and!15381 (not b_next!8125))
