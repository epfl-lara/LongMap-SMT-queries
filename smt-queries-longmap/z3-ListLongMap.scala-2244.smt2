; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36912 () Bool)

(assert start!36912)

(declare-fun b_free!8053 () Bool)

(declare-fun b_next!8053 () Bool)

(assert (=> start!36912 (= b_free!8053 (not b_next!8053))))

(declare-fun tp!28875 () Bool)

(declare-fun b_and!15309 () Bool)

(assert (=> start!36912 (= tp!28875 b_and!15309)))

(declare-fun b!370024 () Bool)

(declare-fun e!226059 () Bool)

(declare-fun e!226055 () Bool)

(declare-fun mapRes!14616 () Bool)

(assert (=> b!370024 (= e!226059 (and e!226055 mapRes!14616))))

(declare-fun condMapEmpty!14616 () Bool)

(declare-datatypes ((V!12707 0))(
  ( (V!12708 (val!4395 Int)) )
))
(declare-datatypes ((ValueCell!4007 0))(
  ( (ValueCellFull!4007 (v!6593 V!12707)) (EmptyCell!4007) )
))
(declare-datatypes ((array!21330 0))(
  ( (array!21331 (arr!10133 (Array (_ BitVec 32) ValueCell!4007)) (size!10485 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21330)

(declare-fun mapDefault!14616 () ValueCell!4007)

(assert (=> b!370024 (= condMapEmpty!14616 (= (arr!10133 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4007)) mapDefault!14616)))))

(declare-fun b!370025 () Bool)

(declare-fun e!226058 () Bool)

(declare-fun e!226054 () Bool)

(assert (=> b!370025 (= e!226058 e!226054)))

(declare-fun res!207737 () Bool)

(assert (=> b!370025 (=> (not res!207737) (not e!226054))))

(declare-datatypes ((array!21332 0))(
  ( (array!21333 (arr!10134 (Array (_ BitVec 32) (_ BitVec 64))) (size!10486 (_ BitVec 32))) )
))
(declare-fun lt!169903 () array!21332)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21332 (_ BitVec 32)) Bool)

(assert (=> b!370025 (= res!207737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169903 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21332)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370025 (= lt!169903 (array!21333 (store (arr!10134 _keys!658) i!548 k0!778) (size!10486 _keys!658)))))

(declare-fun b!370026 () Bool)

(declare-fun res!207738 () Bool)

(assert (=> b!370026 (=> (not res!207738) (not e!226058))))

(declare-fun arrayContainsKey!0 (array!21332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370026 (= res!207738 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370027 () Bool)

(assert (=> b!370027 (= e!226054 false)))

(declare-fun zeroValue!472 () V!12707)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12707)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5736 0))(
  ( (tuple2!5737 (_1!2879 (_ BitVec 64)) (_2!2879 V!12707)) )
))
(declare-datatypes ((List!5563 0))(
  ( (Nil!5560) (Cons!5559 (h!6415 tuple2!5736) (t!10705 List!5563)) )
))
(declare-datatypes ((ListLongMap!4651 0))(
  ( (ListLongMap!4652 (toList!2341 List!5563)) )
))
(declare-fun lt!169901 () ListLongMap!4651)

(declare-fun minValue!472 () V!12707)

(declare-fun getCurrentListMapNoExtraKeys!650 (array!21332 array!21330 (_ BitVec 32) (_ BitVec 32) V!12707 V!12707 (_ BitVec 32) Int) ListLongMap!4651)

(assert (=> b!370027 (= lt!169901 (getCurrentListMapNoExtraKeys!650 lt!169903 (array!21331 (store (arr!10133 _values!506) i!548 (ValueCellFull!4007 v!373)) (size!10485 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169902 () ListLongMap!4651)

(assert (=> b!370027 (= lt!169902 (getCurrentListMapNoExtraKeys!650 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370028 () Bool)

(declare-fun res!207746 () Bool)

(assert (=> b!370028 (=> (not res!207746) (not e!226058))))

(assert (=> b!370028 (= res!207746 (and (= (size!10485 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10486 _keys!658) (size!10485 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370029 () Bool)

(declare-fun e!226056 () Bool)

(declare-fun tp_is_empty!8701 () Bool)

(assert (=> b!370029 (= e!226056 tp_is_empty!8701)))

(declare-fun b!370030 () Bool)

(declare-fun res!207742 () Bool)

(assert (=> b!370030 (=> (not res!207742) (not e!226058))))

(declare-datatypes ((List!5564 0))(
  ( (Nil!5561) (Cons!5560 (h!6416 (_ BitVec 64)) (t!10706 List!5564)) )
))
(declare-fun arrayNoDuplicates!0 (array!21332 (_ BitVec 32) List!5564) Bool)

(assert (=> b!370030 (= res!207742 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5561))))

(declare-fun b!370031 () Bool)

(declare-fun res!207745 () Bool)

(assert (=> b!370031 (=> (not res!207745) (not e!226058))))

(assert (=> b!370031 (= res!207745 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10486 _keys!658))))))

(declare-fun b!370032 () Bool)

(declare-fun res!207743 () Bool)

(assert (=> b!370032 (=> (not res!207743) (not e!226058))))

(assert (=> b!370032 (= res!207743 (or (= (select (arr!10134 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10134 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370033 () Bool)

(assert (=> b!370033 (= e!226055 tp_is_empty!8701)))

(declare-fun b!370034 () Bool)

(declare-fun res!207744 () Bool)

(assert (=> b!370034 (=> (not res!207744) (not e!226058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370034 (= res!207744 (validKeyInArray!0 k0!778))))

(declare-fun b!370035 () Bool)

(declare-fun res!207739 () Bool)

(assert (=> b!370035 (=> (not res!207739) (not e!226054))))

(assert (=> b!370035 (= res!207739 (arrayNoDuplicates!0 lt!169903 #b00000000000000000000000000000000 Nil!5561))))

(declare-fun res!207740 () Bool)

(assert (=> start!36912 (=> (not res!207740) (not e!226058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36912 (= res!207740 (validMask!0 mask!970))))

(assert (=> start!36912 e!226058))

(declare-fun array_inv!7520 (array!21330) Bool)

(assert (=> start!36912 (and (array_inv!7520 _values!506) e!226059)))

(assert (=> start!36912 tp!28875))

(assert (=> start!36912 true))

(assert (=> start!36912 tp_is_empty!8701))

(declare-fun array_inv!7521 (array!21332) Bool)

(assert (=> start!36912 (array_inv!7521 _keys!658)))

(declare-fun mapNonEmpty!14616 () Bool)

(declare-fun tp!28874 () Bool)

(assert (=> mapNonEmpty!14616 (= mapRes!14616 (and tp!28874 e!226056))))

(declare-fun mapValue!14616 () ValueCell!4007)

(declare-fun mapKey!14616 () (_ BitVec 32))

(declare-fun mapRest!14616 () (Array (_ BitVec 32) ValueCell!4007))

(assert (=> mapNonEmpty!14616 (= (arr!10133 _values!506) (store mapRest!14616 mapKey!14616 mapValue!14616))))

(declare-fun mapIsEmpty!14616 () Bool)

(assert (=> mapIsEmpty!14616 mapRes!14616))

(declare-fun b!370036 () Bool)

(declare-fun res!207741 () Bool)

(assert (=> b!370036 (=> (not res!207741) (not e!226058))))

(assert (=> b!370036 (= res!207741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36912 res!207740) b!370028))

(assert (= (and b!370028 res!207746) b!370036))

(assert (= (and b!370036 res!207741) b!370030))

(assert (= (and b!370030 res!207742) b!370031))

(assert (= (and b!370031 res!207745) b!370034))

(assert (= (and b!370034 res!207744) b!370032))

(assert (= (and b!370032 res!207743) b!370026))

(assert (= (and b!370026 res!207738) b!370025))

(assert (= (and b!370025 res!207737) b!370035))

(assert (= (and b!370035 res!207739) b!370027))

(assert (= (and b!370024 condMapEmpty!14616) mapIsEmpty!14616))

(assert (= (and b!370024 (not condMapEmpty!14616)) mapNonEmpty!14616))

(get-info :version)

(assert (= (and mapNonEmpty!14616 ((_ is ValueCellFull!4007) mapValue!14616)) b!370029))

(assert (= (and b!370024 ((_ is ValueCellFull!4007) mapDefault!14616)) b!370033))

(assert (= start!36912 b!370024))

(declare-fun m!366533 () Bool)

(assert (=> b!370035 m!366533))

(declare-fun m!366535 () Bool)

(assert (=> b!370026 m!366535))

(declare-fun m!366537 () Bool)

(assert (=> b!370027 m!366537))

(declare-fun m!366539 () Bool)

(assert (=> b!370027 m!366539))

(declare-fun m!366541 () Bool)

(assert (=> b!370027 m!366541))

(declare-fun m!366543 () Bool)

(assert (=> b!370034 m!366543))

(declare-fun m!366545 () Bool)

(assert (=> start!36912 m!366545))

(declare-fun m!366547 () Bool)

(assert (=> start!36912 m!366547))

(declare-fun m!366549 () Bool)

(assert (=> start!36912 m!366549))

(declare-fun m!366551 () Bool)

(assert (=> mapNonEmpty!14616 m!366551))

(declare-fun m!366553 () Bool)

(assert (=> b!370030 m!366553))

(declare-fun m!366555 () Bool)

(assert (=> b!370036 m!366555))

(declare-fun m!366557 () Bool)

(assert (=> b!370025 m!366557))

(declare-fun m!366559 () Bool)

(assert (=> b!370025 m!366559))

(declare-fun m!366561 () Bool)

(assert (=> b!370032 m!366561))

(check-sat (not b!370027) (not b!370025) tp_is_empty!8701 (not b_next!8053) (not b!370036) (not b!370030) (not b!370034) (not start!36912) (not mapNonEmpty!14616) (not b!370035) b_and!15309 (not b!370026))
(check-sat b_and!15309 (not b_next!8053))
