; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37014 () Bool)

(assert start!37014)

(declare-fun b_free!8155 () Bool)

(declare-fun b_next!8155 () Bool)

(assert (=> start!37014 (= b_free!8155 (not b_next!8155))))

(declare-fun tp!29180 () Bool)

(declare-fun b_and!15411 () Bool)

(assert (=> start!37014 (= tp!29180 b_and!15411)))

(declare-fun mapIsEmpty!14769 () Bool)

(declare-fun mapRes!14769 () Bool)

(assert (=> mapIsEmpty!14769 mapRes!14769))

(declare-fun b!372013 () Bool)

(declare-fun res!209273 () Bool)

(declare-fun e!226976 () Bool)

(assert (=> b!372013 (=> (not res!209273) (not e!226976))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372013 (= res!209273 (validKeyInArray!0 k0!778))))

(declare-fun b!372014 () Bool)

(declare-fun res!209272 () Bool)

(assert (=> b!372014 (=> (not res!209272) (not e!226976))))

(declare-datatypes ((array!21530 0))(
  ( (array!21531 (arr!10233 (Array (_ BitVec 32) (_ BitVec 64))) (size!10585 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21530)

(declare-fun arrayContainsKey!0 (array!21530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372014 (= res!209272 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372015 () Bool)

(declare-fun e!226972 () Bool)

(assert (=> b!372015 (= e!226972 (not true))))

(declare-datatypes ((V!12843 0))(
  ( (V!12844 (val!4446 Int)) )
))
(declare-datatypes ((ValueCell!4058 0))(
  ( (ValueCellFull!4058 (v!6644 V!12843)) (EmptyCell!4058) )
))
(declare-datatypes ((array!21532 0))(
  ( (array!21533 (arr!10234 (Array (_ BitVec 32) ValueCell!4058)) (size!10586 (_ BitVec 32))) )
))
(declare-fun lt!170567 () array!21532)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12843)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun lt!170570 () array!21530)

(declare-datatypes ((tuple2!5798 0))(
  ( (tuple2!5799 (_1!2910 (_ BitVec 64)) (_2!2910 V!12843)) )
))
(declare-datatypes ((List!5639 0))(
  ( (Nil!5636) (Cons!5635 (h!6491 tuple2!5798) (t!10781 List!5639)) )
))
(declare-datatypes ((ListLongMap!4713 0))(
  ( (ListLongMap!4714 (toList!2372 List!5639)) )
))
(declare-fun lt!170571 () ListLongMap!4713)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12843)

(declare-fun getCurrentListMap!1834 (array!21530 array!21532 (_ BitVec 32) (_ BitVec 32) V!12843 V!12843 (_ BitVec 32) Int) ListLongMap!4713)

(assert (=> b!372015 (= lt!170571 (getCurrentListMap!1834 lt!170570 lt!170567 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170566 () ListLongMap!4713)

(declare-fun lt!170568 () ListLongMap!4713)

(assert (=> b!372015 (and (= lt!170566 lt!170568) (= lt!170568 lt!170566))))

(declare-fun lt!170569 () ListLongMap!4713)

(declare-fun v!373 () V!12843)

(declare-fun +!768 (ListLongMap!4713 tuple2!5798) ListLongMap!4713)

(assert (=> b!372015 (= lt!170568 (+!768 lt!170569 (tuple2!5799 k0!778 v!373)))))

(declare-fun _values!506 () array!21532)

(declare-datatypes ((Unit!11427 0))(
  ( (Unit!11428) )
))
(declare-fun lt!170572 () Unit!11427)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!21 (array!21530 array!21532 (_ BitVec 32) (_ BitVec 32) V!12843 V!12843 (_ BitVec 32) (_ BitVec 64) V!12843 (_ BitVec 32) Int) Unit!11427)

(assert (=> b!372015 (= lt!170572 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!21 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!681 (array!21530 array!21532 (_ BitVec 32) (_ BitVec 32) V!12843 V!12843 (_ BitVec 32) Int) ListLongMap!4713)

(assert (=> b!372015 (= lt!170566 (getCurrentListMapNoExtraKeys!681 lt!170570 lt!170567 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372015 (= lt!170567 (array!21533 (store (arr!10234 _values!506) i!548 (ValueCellFull!4058 v!373)) (size!10586 _values!506)))))

(assert (=> b!372015 (= lt!170569 (getCurrentListMapNoExtraKeys!681 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14769 () Bool)

(declare-fun tp!29181 () Bool)

(declare-fun e!226973 () Bool)

(assert (=> mapNonEmpty!14769 (= mapRes!14769 (and tp!29181 e!226973))))

(declare-fun mapKey!14769 () (_ BitVec 32))

(declare-fun mapValue!14769 () ValueCell!4058)

(declare-fun mapRest!14769 () (Array (_ BitVec 32) ValueCell!4058))

(assert (=> mapNonEmpty!14769 (= (arr!10234 _values!506) (store mapRest!14769 mapKey!14769 mapValue!14769))))

(declare-fun b!372016 () Bool)

(declare-fun tp_is_empty!8803 () Bool)

(assert (=> b!372016 (= e!226973 tp_is_empty!8803)))

(declare-fun b!372017 () Bool)

(declare-fun res!209270 () Bool)

(assert (=> b!372017 (=> (not res!209270) (not e!226976))))

(declare-datatypes ((List!5640 0))(
  ( (Nil!5637) (Cons!5636 (h!6492 (_ BitVec 64)) (t!10782 List!5640)) )
))
(declare-fun arrayNoDuplicates!0 (array!21530 (_ BitVec 32) List!5640) Bool)

(assert (=> b!372017 (= res!209270 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5637))))

(declare-fun b!372018 () Bool)

(declare-fun e!226974 () Bool)

(assert (=> b!372018 (= e!226974 tp_is_empty!8803)))

(declare-fun b!372019 () Bool)

(assert (=> b!372019 (= e!226976 e!226972)))

(declare-fun res!209268 () Bool)

(assert (=> b!372019 (=> (not res!209268) (not e!226972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21530 (_ BitVec 32)) Bool)

(assert (=> b!372019 (= res!209268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170570 mask!970))))

(assert (=> b!372019 (= lt!170570 (array!21531 (store (arr!10233 _keys!658) i!548 k0!778) (size!10585 _keys!658)))))

(declare-fun b!372020 () Bool)

(declare-fun e!226977 () Bool)

(assert (=> b!372020 (= e!226977 (and e!226974 mapRes!14769))))

(declare-fun condMapEmpty!14769 () Bool)

(declare-fun mapDefault!14769 () ValueCell!4058)

(assert (=> b!372020 (= condMapEmpty!14769 (= (arr!10234 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4058)) mapDefault!14769)))))

(declare-fun b!372021 () Bool)

(declare-fun res!209271 () Bool)

(assert (=> b!372021 (=> (not res!209271) (not e!226976))))

(assert (=> b!372021 (= res!209271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372022 () Bool)

(declare-fun res!209276 () Bool)

(assert (=> b!372022 (=> (not res!209276) (not e!226972))))

(assert (=> b!372022 (= res!209276 (arrayNoDuplicates!0 lt!170570 #b00000000000000000000000000000000 Nil!5637))))

(declare-fun b!372023 () Bool)

(declare-fun res!209275 () Bool)

(assert (=> b!372023 (=> (not res!209275) (not e!226976))))

(assert (=> b!372023 (= res!209275 (or (= (select (arr!10233 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10233 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!209269 () Bool)

(assert (=> start!37014 (=> (not res!209269) (not e!226976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37014 (= res!209269 (validMask!0 mask!970))))

(assert (=> start!37014 e!226976))

(declare-fun array_inv!7586 (array!21532) Bool)

(assert (=> start!37014 (and (array_inv!7586 _values!506) e!226977)))

(assert (=> start!37014 tp!29180))

(assert (=> start!37014 true))

(assert (=> start!37014 tp_is_empty!8803))

(declare-fun array_inv!7587 (array!21530) Bool)

(assert (=> start!37014 (array_inv!7587 _keys!658)))

(declare-fun b!372024 () Bool)

(declare-fun res!209267 () Bool)

(assert (=> b!372024 (=> (not res!209267) (not e!226976))))

(assert (=> b!372024 (= res!209267 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10585 _keys!658))))))

(declare-fun b!372025 () Bool)

(declare-fun res!209274 () Bool)

(assert (=> b!372025 (=> (not res!209274) (not e!226976))))

(assert (=> b!372025 (= res!209274 (and (= (size!10586 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10585 _keys!658) (size!10586 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37014 res!209269) b!372025))

(assert (= (and b!372025 res!209274) b!372021))

(assert (= (and b!372021 res!209271) b!372017))

(assert (= (and b!372017 res!209270) b!372024))

(assert (= (and b!372024 res!209267) b!372013))

(assert (= (and b!372013 res!209273) b!372023))

(assert (= (and b!372023 res!209275) b!372014))

(assert (= (and b!372014 res!209272) b!372019))

(assert (= (and b!372019 res!209268) b!372022))

(assert (= (and b!372022 res!209276) b!372015))

(assert (= (and b!372020 condMapEmpty!14769) mapIsEmpty!14769))

(assert (= (and b!372020 (not condMapEmpty!14769)) mapNonEmpty!14769))

(get-info :version)

(assert (= (and mapNonEmpty!14769 ((_ is ValueCellFull!4058) mapValue!14769)) b!372016))

(assert (= (and b!372020 ((_ is ValueCellFull!4058) mapDefault!14769)) b!372018))

(assert (= start!37014 b!372020))

(declare-fun m!368189 () Bool)

(assert (=> b!372019 m!368189))

(declare-fun m!368191 () Bool)

(assert (=> b!372019 m!368191))

(declare-fun m!368193 () Bool)

(assert (=> b!372014 m!368193))

(declare-fun m!368195 () Bool)

(assert (=> b!372017 m!368195))

(declare-fun m!368197 () Bool)

(assert (=> b!372023 m!368197))

(declare-fun m!368199 () Bool)

(assert (=> start!37014 m!368199))

(declare-fun m!368201 () Bool)

(assert (=> start!37014 m!368201))

(declare-fun m!368203 () Bool)

(assert (=> start!37014 m!368203))

(declare-fun m!368205 () Bool)

(assert (=> b!372013 m!368205))

(declare-fun m!368207 () Bool)

(assert (=> mapNonEmpty!14769 m!368207))

(declare-fun m!368209 () Bool)

(assert (=> b!372021 m!368209))

(declare-fun m!368211 () Bool)

(assert (=> b!372022 m!368211))

(declare-fun m!368213 () Bool)

(assert (=> b!372015 m!368213))

(declare-fun m!368215 () Bool)

(assert (=> b!372015 m!368215))

(declare-fun m!368217 () Bool)

(assert (=> b!372015 m!368217))

(declare-fun m!368219 () Bool)

(assert (=> b!372015 m!368219))

(declare-fun m!368221 () Bool)

(assert (=> b!372015 m!368221))

(declare-fun m!368223 () Bool)

(assert (=> b!372015 m!368223))

(check-sat (not b!372014) b_and!15411 (not b!372019) (not b!372022) (not b_next!8155) (not b!372015) tp_is_empty!8803 (not b!372017) (not mapNonEmpty!14769) (not b!372013) (not b!372021) (not start!37014))
(check-sat b_and!15411 (not b_next!8155))
