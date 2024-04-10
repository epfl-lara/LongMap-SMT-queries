; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37054 () Bool)

(assert start!37054)

(declare-fun b_free!8181 () Bool)

(declare-fun b_next!8181 () Bool)

(assert (=> start!37054 (= b_free!8181 (not b_next!8181))))

(declare-fun tp!29259 () Bool)

(declare-fun b_and!15423 () Bool)

(assert (=> start!37054 (= tp!29259 b_and!15423)))

(declare-fun b!372569 () Bool)

(declare-fun res!209668 () Bool)

(declare-fun e!227238 () Bool)

(assert (=> b!372569 (=> (not res!209668) (not e!227238))))

(declare-datatypes ((array!21599 0))(
  ( (array!21600 (arr!10268 (Array (_ BitVec 32) (_ BitVec 64))) (size!10620 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21599)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372569 (= res!209668 (or (= (select (arr!10268 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10268 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372570 () Bool)

(declare-fun e!227243 () Bool)

(declare-fun e!227240 () Bool)

(declare-fun mapRes!14808 () Bool)

(assert (=> b!372570 (= e!227243 (and e!227240 mapRes!14808))))

(declare-fun condMapEmpty!14808 () Bool)

(declare-datatypes ((V!12877 0))(
  ( (V!12878 (val!4459 Int)) )
))
(declare-datatypes ((ValueCell!4071 0))(
  ( (ValueCellFull!4071 (v!6656 V!12877)) (EmptyCell!4071) )
))
(declare-datatypes ((array!21601 0))(
  ( (array!21602 (arr!10269 (Array (_ BitVec 32) ValueCell!4071)) (size!10621 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21601)

(declare-fun mapDefault!14808 () ValueCell!4071)

(assert (=> b!372570 (= condMapEmpty!14808 (= (arr!10269 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4071)) mapDefault!14808)))))

(declare-fun b!372571 () Bool)

(declare-fun e!227239 () Bool)

(assert (=> b!372571 (= e!227238 e!227239)))

(declare-fun res!209661 () Bool)

(assert (=> b!372571 (=> (not res!209661) (not e!227239))))

(declare-fun lt!170824 () array!21599)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21599 (_ BitVec 32)) Bool)

(assert (=> b!372571 (= res!209661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170824 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!372571 (= lt!170824 (array!21600 (store (arr!10268 _keys!658) i!548 k0!778) (size!10620 _keys!658)))))

(declare-fun b!372572 () Bool)

(declare-fun res!209665 () Bool)

(assert (=> b!372572 (=> (not res!209665) (not e!227238))))

(assert (=> b!372572 (= res!209665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372573 () Bool)

(declare-fun tp_is_empty!8829 () Bool)

(assert (=> b!372573 (= e!227240 tp_is_empty!8829)))

(declare-fun mapIsEmpty!14808 () Bool)

(assert (=> mapIsEmpty!14808 mapRes!14808))

(declare-fun res!209664 () Bool)

(assert (=> start!37054 (=> (not res!209664) (not e!227238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37054 (= res!209664 (validMask!0 mask!970))))

(assert (=> start!37054 e!227238))

(declare-fun array_inv!7570 (array!21601) Bool)

(assert (=> start!37054 (and (array_inv!7570 _values!506) e!227243)))

(assert (=> start!37054 tp!29259))

(assert (=> start!37054 true))

(assert (=> start!37054 tp_is_empty!8829))

(declare-fun array_inv!7571 (array!21599) Bool)

(assert (=> start!37054 (array_inv!7571 _keys!658)))

(declare-fun b!372574 () Bool)

(declare-fun res!209662 () Bool)

(assert (=> b!372574 (=> (not res!209662) (not e!227238))))

(declare-fun arrayContainsKey!0 (array!21599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372574 (= res!209662 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372575 () Bool)

(assert (=> b!372575 (= e!227239 (not true))))

(declare-datatypes ((tuple2!5910 0))(
  ( (tuple2!5911 (_1!2966 (_ BitVec 64)) (_2!2966 V!12877)) )
))
(declare-datatypes ((List!5756 0))(
  ( (Nil!5753) (Cons!5752 (h!6608 tuple2!5910) (t!10906 List!5756)) )
))
(declare-datatypes ((ListLongMap!4823 0))(
  ( (ListLongMap!4824 (toList!2427 List!5756)) )
))
(declare-fun lt!170823 () ListLongMap!4823)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170825 () array!21601)

(declare-fun zeroValue!472 () V!12877)

(declare-fun minValue!472 () V!12877)

(declare-fun getCurrentListMap!1870 (array!21599 array!21601 (_ BitVec 32) (_ BitVec 32) V!12877 V!12877 (_ BitVec 32) Int) ListLongMap!4823)

(assert (=> b!372575 (= lt!170823 (getCurrentListMap!1870 lt!170824 lt!170825 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170822 () ListLongMap!4823)

(declare-fun lt!170821 () ListLongMap!4823)

(assert (=> b!372575 (and (= lt!170822 lt!170821) (= lt!170821 lt!170822))))

(declare-fun v!373 () V!12877)

(declare-fun lt!170826 () ListLongMap!4823)

(declare-fun +!773 (ListLongMap!4823 tuple2!5910) ListLongMap!4823)

(assert (=> b!372575 (= lt!170821 (+!773 lt!170826 (tuple2!5911 k0!778 v!373)))))

(declare-datatypes ((Unit!11452 0))(
  ( (Unit!11453) )
))
(declare-fun lt!170820 () Unit!11452)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!28 (array!21599 array!21601 (_ BitVec 32) (_ BitVec 32) V!12877 V!12877 (_ BitVec 32) (_ BitVec 64) V!12877 (_ BitVec 32) Int) Unit!11452)

(assert (=> b!372575 (= lt!170820 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!28 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!704 (array!21599 array!21601 (_ BitVec 32) (_ BitVec 32) V!12877 V!12877 (_ BitVec 32) Int) ListLongMap!4823)

(assert (=> b!372575 (= lt!170822 (getCurrentListMapNoExtraKeys!704 lt!170824 lt!170825 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372575 (= lt!170825 (array!21602 (store (arr!10269 _values!506) i!548 (ValueCellFull!4071 v!373)) (size!10621 _values!506)))))

(assert (=> b!372575 (= lt!170826 (getCurrentListMapNoExtraKeys!704 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14808 () Bool)

(declare-fun tp!29258 () Bool)

(declare-fun e!227241 () Bool)

(assert (=> mapNonEmpty!14808 (= mapRes!14808 (and tp!29258 e!227241))))

(declare-fun mapRest!14808 () (Array (_ BitVec 32) ValueCell!4071))

(declare-fun mapValue!14808 () ValueCell!4071)

(declare-fun mapKey!14808 () (_ BitVec 32))

(assert (=> mapNonEmpty!14808 (= (arr!10269 _values!506) (store mapRest!14808 mapKey!14808 mapValue!14808))))

(declare-fun b!372576 () Bool)

(assert (=> b!372576 (= e!227241 tp_is_empty!8829)))

(declare-fun b!372577 () Bool)

(declare-fun res!209660 () Bool)

(assert (=> b!372577 (=> (not res!209660) (not e!227238))))

(assert (=> b!372577 (= res!209660 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10620 _keys!658))))))

(declare-fun b!372578 () Bool)

(declare-fun res!209667 () Bool)

(assert (=> b!372578 (=> (not res!209667) (not e!227238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372578 (= res!209667 (validKeyInArray!0 k0!778))))

(declare-fun b!372579 () Bool)

(declare-fun res!209663 () Bool)

(assert (=> b!372579 (=> (not res!209663) (not e!227239))))

(declare-datatypes ((List!5757 0))(
  ( (Nil!5754) (Cons!5753 (h!6609 (_ BitVec 64)) (t!10907 List!5757)) )
))
(declare-fun arrayNoDuplicates!0 (array!21599 (_ BitVec 32) List!5757) Bool)

(assert (=> b!372579 (= res!209663 (arrayNoDuplicates!0 lt!170824 #b00000000000000000000000000000000 Nil!5754))))

(declare-fun b!372580 () Bool)

(declare-fun res!209669 () Bool)

(assert (=> b!372580 (=> (not res!209669) (not e!227238))))

(assert (=> b!372580 (= res!209669 (and (= (size!10621 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10620 _keys!658) (size!10621 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372581 () Bool)

(declare-fun res!209666 () Bool)

(assert (=> b!372581 (=> (not res!209666) (not e!227238))))

(assert (=> b!372581 (= res!209666 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5754))))

(assert (= (and start!37054 res!209664) b!372580))

(assert (= (and b!372580 res!209669) b!372572))

(assert (= (and b!372572 res!209665) b!372581))

(assert (= (and b!372581 res!209666) b!372577))

(assert (= (and b!372577 res!209660) b!372578))

(assert (= (and b!372578 res!209667) b!372569))

(assert (= (and b!372569 res!209668) b!372574))

(assert (= (and b!372574 res!209662) b!372571))

(assert (= (and b!372571 res!209661) b!372579))

(assert (= (and b!372579 res!209663) b!372575))

(assert (= (and b!372570 condMapEmpty!14808) mapIsEmpty!14808))

(assert (= (and b!372570 (not condMapEmpty!14808)) mapNonEmpty!14808))

(get-info :version)

(assert (= (and mapNonEmpty!14808 ((_ is ValueCellFull!4071) mapValue!14808)) b!372576))

(assert (= (and b!372570 ((_ is ValueCellFull!4071) mapDefault!14808)) b!372573))

(assert (= start!37054 b!372570))

(declare-fun m!368427 () Bool)

(assert (=> b!372578 m!368427))

(declare-fun m!368429 () Bool)

(assert (=> b!372579 m!368429))

(declare-fun m!368431 () Bool)

(assert (=> b!372571 m!368431))

(declare-fun m!368433 () Bool)

(assert (=> b!372571 m!368433))

(declare-fun m!368435 () Bool)

(assert (=> mapNonEmpty!14808 m!368435))

(declare-fun m!368437 () Bool)

(assert (=> b!372581 m!368437))

(declare-fun m!368439 () Bool)

(assert (=> b!372569 m!368439))

(declare-fun m!368441 () Bool)

(assert (=> b!372575 m!368441))

(declare-fun m!368443 () Bool)

(assert (=> b!372575 m!368443))

(declare-fun m!368445 () Bool)

(assert (=> b!372575 m!368445))

(declare-fun m!368447 () Bool)

(assert (=> b!372575 m!368447))

(declare-fun m!368449 () Bool)

(assert (=> b!372575 m!368449))

(declare-fun m!368451 () Bool)

(assert (=> b!372575 m!368451))

(declare-fun m!368453 () Bool)

(assert (=> start!37054 m!368453))

(declare-fun m!368455 () Bool)

(assert (=> start!37054 m!368455))

(declare-fun m!368457 () Bool)

(assert (=> start!37054 m!368457))

(declare-fun m!368459 () Bool)

(assert (=> b!372572 m!368459))

(declare-fun m!368461 () Bool)

(assert (=> b!372574 m!368461))

(check-sat (not b!372578) (not b_next!8181) (not mapNonEmpty!14808) (not b!372581) (not b!372575) tp_is_empty!8829 (not b!372572) (not b!372574) (not b!372579) (not start!37054) (not b!372571) b_and!15423)
(check-sat b_and!15423 (not b_next!8181))
