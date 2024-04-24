; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36966 () Bool)

(assert start!36966)

(declare-fun b_free!8107 () Bool)

(declare-fun b_next!8107 () Bool)

(assert (=> start!36966 (= b_free!8107 (not b_next!8107))))

(declare-fun tp!29037 () Bool)

(declare-fun b_and!15363 () Bool)

(assert (=> start!36966 (= tp!29037 b_and!15363)))

(declare-fun b!371077 () Bool)

(declare-fun res!208553 () Bool)

(declare-fun e!226543 () Bool)

(assert (=> b!371077 (=> (not res!208553) (not e!226543))))

(declare-datatypes ((array!21436 0))(
  ( (array!21437 (arr!10186 (Array (_ BitVec 32) (_ BitVec 64))) (size!10538 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21436)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371077 (= res!208553 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371078 () Bool)

(declare-fun res!208555 () Bool)

(assert (=> b!371078 (=> (not res!208555) (not e!226543))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21436 (_ BitVec 32)) Bool)

(assert (=> b!371078 (= res!208555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371079 () Bool)

(declare-fun res!208547 () Bool)

(declare-fun e!226545 () Bool)

(assert (=> b!371079 (=> (not res!208547) (not e!226545))))

(declare-fun lt!170186 () array!21436)

(declare-datatypes ((List!5603 0))(
  ( (Nil!5600) (Cons!5599 (h!6455 (_ BitVec 64)) (t!10745 List!5603)) )
))
(declare-fun arrayNoDuplicates!0 (array!21436 (_ BitVec 32) List!5603) Bool)

(assert (=> b!371079 (= res!208547 (arrayNoDuplicates!0 lt!170186 #b00000000000000000000000000000000 Nil!5600))))

(declare-fun mapIsEmpty!14697 () Bool)

(declare-fun mapRes!14697 () Bool)

(assert (=> mapIsEmpty!14697 mapRes!14697))

(declare-fun b!371080 () Bool)

(declare-fun e!226540 () Bool)

(declare-fun e!226542 () Bool)

(assert (=> b!371080 (= e!226540 (and e!226542 mapRes!14697))))

(declare-fun condMapEmpty!14697 () Bool)

(declare-datatypes ((V!12779 0))(
  ( (V!12780 (val!4422 Int)) )
))
(declare-datatypes ((ValueCell!4034 0))(
  ( (ValueCellFull!4034 (v!6620 V!12779)) (EmptyCell!4034) )
))
(declare-datatypes ((array!21438 0))(
  ( (array!21439 (arr!10187 (Array (_ BitVec 32) ValueCell!4034)) (size!10539 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21438)

(declare-fun mapDefault!14697 () ValueCell!4034)

(assert (=> b!371080 (= condMapEmpty!14697 (= (arr!10187 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4034)) mapDefault!14697)))))

(declare-fun b!371081 () Bool)

(declare-fun res!208549 () Bool)

(assert (=> b!371081 (=> (not res!208549) (not e!226543))))

(assert (=> b!371081 (= res!208549 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5600))))

(declare-fun b!371082 () Bool)

(declare-fun res!208551 () Bool)

(assert (=> b!371082 (=> (not res!208551) (not e!226543))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371082 (= res!208551 (or (= (select (arr!10186 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10186 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!208556 () Bool)

(assert (=> start!36966 (=> (not res!208556) (not e!226543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36966 (= res!208556 (validMask!0 mask!970))))

(assert (=> start!36966 e!226543))

(declare-fun array_inv!7554 (array!21438) Bool)

(assert (=> start!36966 (and (array_inv!7554 _values!506) e!226540)))

(assert (=> start!36966 tp!29037))

(assert (=> start!36966 true))

(declare-fun tp_is_empty!8755 () Bool)

(assert (=> start!36966 tp_is_empty!8755))

(declare-fun array_inv!7555 (array!21436) Bool)

(assert (=> start!36966 (array_inv!7555 _keys!658)))

(declare-fun b!371083 () Bool)

(assert (=> b!371083 (= e!226545 (not true))))

(declare-datatypes ((tuple2!5766 0))(
  ( (tuple2!5767 (_1!2894 (_ BitVec 64)) (_2!2894 V!12779)) )
))
(declare-datatypes ((List!5604 0))(
  ( (Nil!5601) (Cons!5600 (h!6456 tuple2!5766) (t!10746 List!5604)) )
))
(declare-datatypes ((ListLongMap!4681 0))(
  ( (ListLongMap!4682 (toList!2356 List!5604)) )
))
(declare-fun lt!170188 () ListLongMap!4681)

(declare-fun lt!170185 () ListLongMap!4681)

(assert (=> b!371083 (and (= lt!170188 lt!170185) (= lt!170185 lt!170188))))

(declare-fun lt!170184 () ListLongMap!4681)

(declare-fun v!373 () V!12779)

(declare-fun +!752 (ListLongMap!4681 tuple2!5766) ListLongMap!4681)

(assert (=> b!371083 (= lt!170185 (+!752 lt!170184 (tuple2!5767 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11395 0))(
  ( (Unit!11396) )
))
(declare-fun lt!170187 () Unit!11395)

(declare-fun zeroValue!472 () V!12779)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun minValue!472 () V!12779)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!5 (array!21436 array!21438 (_ BitVec 32) (_ BitVec 32) V!12779 V!12779 (_ BitVec 32) (_ BitVec 64) V!12779 (_ BitVec 32) Int) Unit!11395)

(assert (=> b!371083 (= lt!170187 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!5 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!665 (array!21436 array!21438 (_ BitVec 32) (_ BitVec 32) V!12779 V!12779 (_ BitVec 32) Int) ListLongMap!4681)

(assert (=> b!371083 (= lt!170188 (getCurrentListMapNoExtraKeys!665 lt!170186 (array!21439 (store (arr!10187 _values!506) i!548 (ValueCellFull!4034 v!373)) (size!10539 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371083 (= lt!170184 (getCurrentListMapNoExtraKeys!665 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14697 () Bool)

(declare-fun tp!29036 () Bool)

(declare-fun e!226541 () Bool)

(assert (=> mapNonEmpty!14697 (= mapRes!14697 (and tp!29036 e!226541))))

(declare-fun mapRest!14697 () (Array (_ BitVec 32) ValueCell!4034))

(declare-fun mapValue!14697 () ValueCell!4034)

(declare-fun mapKey!14697 () (_ BitVec 32))

(assert (=> mapNonEmpty!14697 (= (arr!10187 _values!506) (store mapRest!14697 mapKey!14697 mapValue!14697))))

(declare-fun b!371084 () Bool)

(assert (=> b!371084 (= e!226542 tp_is_empty!8755)))

(declare-fun b!371085 () Bool)

(declare-fun res!208550 () Bool)

(assert (=> b!371085 (=> (not res!208550) (not e!226543))))

(assert (=> b!371085 (= res!208550 (and (= (size!10539 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10538 _keys!658) (size!10539 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371086 () Bool)

(assert (=> b!371086 (= e!226541 tp_is_empty!8755)))

(declare-fun b!371087 () Bool)

(declare-fun res!208554 () Bool)

(assert (=> b!371087 (=> (not res!208554) (not e!226543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371087 (= res!208554 (validKeyInArray!0 k0!778))))

(declare-fun b!371088 () Bool)

(declare-fun res!208548 () Bool)

(assert (=> b!371088 (=> (not res!208548) (not e!226543))))

(assert (=> b!371088 (= res!208548 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10538 _keys!658))))))

(declare-fun b!371089 () Bool)

(assert (=> b!371089 (= e!226543 e!226545)))

(declare-fun res!208552 () Bool)

(assert (=> b!371089 (=> (not res!208552) (not e!226545))))

(assert (=> b!371089 (= res!208552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170186 mask!970))))

(assert (=> b!371089 (= lt!170186 (array!21437 (store (arr!10186 _keys!658) i!548 k0!778) (size!10538 _keys!658)))))

(assert (= (and start!36966 res!208556) b!371085))

(assert (= (and b!371085 res!208550) b!371078))

(assert (= (and b!371078 res!208555) b!371081))

(assert (= (and b!371081 res!208549) b!371088))

(assert (= (and b!371088 res!208548) b!371087))

(assert (= (and b!371087 res!208554) b!371082))

(assert (= (and b!371082 res!208551) b!371077))

(assert (= (and b!371077 res!208553) b!371089))

(assert (= (and b!371089 res!208552) b!371079))

(assert (= (and b!371079 res!208547) b!371083))

(assert (= (and b!371080 condMapEmpty!14697) mapIsEmpty!14697))

(assert (= (and b!371080 (not condMapEmpty!14697)) mapNonEmpty!14697))

(get-info :version)

(assert (= (and mapNonEmpty!14697 ((_ is ValueCellFull!4034) mapValue!14697)) b!371086))

(assert (= (and b!371080 ((_ is ValueCellFull!4034) mapDefault!14697)) b!371084))

(assert (= start!36966 b!371080))

(declare-fun m!367367 () Bool)

(assert (=> b!371089 m!367367))

(declare-fun m!367369 () Bool)

(assert (=> b!371089 m!367369))

(declare-fun m!367371 () Bool)

(assert (=> b!371081 m!367371))

(declare-fun m!367373 () Bool)

(assert (=> b!371079 m!367373))

(declare-fun m!367375 () Bool)

(assert (=> b!371078 m!367375))

(declare-fun m!367377 () Bool)

(assert (=> start!36966 m!367377))

(declare-fun m!367379 () Bool)

(assert (=> start!36966 m!367379))

(declare-fun m!367381 () Bool)

(assert (=> start!36966 m!367381))

(declare-fun m!367383 () Bool)

(assert (=> b!371083 m!367383))

(declare-fun m!367385 () Bool)

(assert (=> b!371083 m!367385))

(declare-fun m!367387 () Bool)

(assert (=> b!371083 m!367387))

(declare-fun m!367389 () Bool)

(assert (=> b!371083 m!367389))

(declare-fun m!367391 () Bool)

(assert (=> b!371083 m!367391))

(declare-fun m!367393 () Bool)

(assert (=> b!371087 m!367393))

(declare-fun m!367395 () Bool)

(assert (=> mapNonEmpty!14697 m!367395))

(declare-fun m!367397 () Bool)

(assert (=> b!371077 m!367397))

(declare-fun m!367399 () Bool)

(assert (=> b!371082 m!367399))

(check-sat (not b!371089) (not b!371081) (not start!36966) (not b!371078) b_and!15363 (not b!371079) (not b_next!8107) tp_is_empty!8755 (not b!371083) (not mapNonEmpty!14697) (not b!371087) (not b!371077))
(check-sat b_and!15363 (not b_next!8107))
