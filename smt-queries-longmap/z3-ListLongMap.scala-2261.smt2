; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37014 () Bool)

(assert start!37014)

(declare-fun b_free!8155 () Bool)

(declare-fun b_next!8155 () Bool)

(assert (=> start!37014 (= b_free!8155 (not b_next!8155))))

(declare-fun tp!29180 () Bool)

(declare-fun b_and!15371 () Bool)

(assert (=> start!37014 (= tp!29180 b_and!15371)))

(declare-fun b!371791 () Bool)

(declare-fun e!226834 () Bool)

(declare-fun tp_is_empty!8803 () Bool)

(assert (=> b!371791 (= e!226834 tp_is_empty!8803)))

(declare-fun mapIsEmpty!14769 () Bool)

(declare-fun mapRes!14769 () Bool)

(assert (=> mapIsEmpty!14769 mapRes!14769))

(declare-fun mapNonEmpty!14769 () Bool)

(declare-fun tp!29181 () Bool)

(declare-fun e!226833 () Bool)

(assert (=> mapNonEmpty!14769 (= mapRes!14769 (and tp!29181 e!226833))))

(declare-datatypes ((V!12843 0))(
  ( (V!12844 (val!4446 Int)) )
))
(declare-datatypes ((ValueCell!4058 0))(
  ( (ValueCellFull!4058 (v!6637 V!12843)) (EmptyCell!4058) )
))
(declare-datatypes ((array!21531 0))(
  ( (array!21532 (arr!10234 (Array (_ BitVec 32) ValueCell!4058)) (size!10587 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21531)

(declare-fun mapKey!14769 () (_ BitVec 32))

(declare-fun mapValue!14769 () ValueCell!4058)

(declare-fun mapRest!14769 () (Array (_ BitVec 32) ValueCell!4058))

(assert (=> mapNonEmpty!14769 (= (arr!10234 _values!506) (store mapRest!14769 mapKey!14769 mapValue!14769))))

(declare-fun b!371792 () Bool)

(assert (=> b!371792 (= e!226833 tp_is_empty!8803)))

(declare-fun b!371793 () Bool)

(declare-fun res!209144 () Bool)

(declare-fun e!226830 () Bool)

(assert (=> b!371793 (=> (not res!209144) (not e!226830))))

(declare-datatypes ((array!21533 0))(
  ( (array!21534 (arr!10235 (Array (_ BitVec 32) (_ BitVec 64))) (size!10588 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21533)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21533 (_ BitVec 32)) Bool)

(assert (=> b!371793 (= res!209144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!209145 () Bool)

(assert (=> start!37014 (=> (not res!209145) (not e!226830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37014 (= res!209145 (validMask!0 mask!970))))

(assert (=> start!37014 e!226830))

(declare-fun e!226832 () Bool)

(declare-fun array_inv!7560 (array!21531) Bool)

(assert (=> start!37014 (and (array_inv!7560 _values!506) e!226832)))

(assert (=> start!37014 tp!29180))

(assert (=> start!37014 true))

(assert (=> start!37014 tp_is_empty!8803))

(declare-fun array_inv!7561 (array!21533) Bool)

(assert (=> start!37014 (array_inv!7561 _keys!658)))

(declare-fun b!371794 () Bool)

(declare-fun res!209142 () Bool)

(assert (=> b!371794 (=> (not res!209142) (not e!226830))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371794 (= res!209142 (and (= (size!10587 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10588 _keys!658) (size!10587 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371795 () Bool)

(declare-fun res!209143 () Bool)

(assert (=> b!371795 (=> (not res!209143) (not e!226830))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371795 (= res!209143 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10588 _keys!658))))))

(declare-fun b!371796 () Bool)

(declare-fun res!209150 () Bool)

(assert (=> b!371796 (=> (not res!209150) (not e!226830))))

(assert (=> b!371796 (= res!209150 (or (= (select (arr!10235 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10235 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371797 () Bool)

(assert (=> b!371797 (= e!226832 (and e!226834 mapRes!14769))))

(declare-fun condMapEmpty!14769 () Bool)

(declare-fun mapDefault!14769 () ValueCell!4058)

(assert (=> b!371797 (= condMapEmpty!14769 (= (arr!10234 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4058)) mapDefault!14769)))))

(declare-fun b!371798 () Bool)

(declare-fun e!226835 () Bool)

(assert (=> b!371798 (= e!226830 e!226835)))

(declare-fun res!209149 () Bool)

(assert (=> b!371798 (=> (not res!209149) (not e!226835))))

(declare-fun lt!170315 () array!21533)

(assert (=> b!371798 (= res!209149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170315 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!371798 (= lt!170315 (array!21534 (store (arr!10235 _keys!658) i!548 k0!778) (size!10588 _keys!658)))))

(declare-fun b!371799 () Bool)

(declare-fun res!209147 () Bool)

(assert (=> b!371799 (=> (not res!209147) (not e!226835))))

(declare-datatypes ((List!5710 0))(
  ( (Nil!5707) (Cons!5706 (h!6562 (_ BitVec 64)) (t!10851 List!5710)) )
))
(declare-fun arrayNoDuplicates!0 (array!21533 (_ BitVec 32) List!5710) Bool)

(assert (=> b!371799 (= res!209147 (arrayNoDuplicates!0 lt!170315 #b00000000000000000000000000000000 Nil!5707))))

(declare-fun b!371800 () Bool)

(declare-fun res!209148 () Bool)

(assert (=> b!371800 (=> (not res!209148) (not e!226830))))

(assert (=> b!371800 (= res!209148 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5707))))

(declare-fun b!371801 () Bool)

(declare-fun res!209141 () Bool)

(assert (=> b!371801 (=> (not res!209141) (not e!226830))))

(declare-fun arrayContainsKey!0 (array!21533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371801 (= res!209141 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371802 () Bool)

(assert (=> b!371802 (= e!226835 (not true))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12843)

(declare-datatypes ((tuple2!5874 0))(
  ( (tuple2!5875 (_1!2948 (_ BitVec 64)) (_2!2948 V!12843)) )
))
(declare-datatypes ((List!5711 0))(
  ( (Nil!5708) (Cons!5707 (h!6563 tuple2!5874) (t!10852 List!5711)) )
))
(declare-datatypes ((ListLongMap!4777 0))(
  ( (ListLongMap!4778 (toList!2404 List!5711)) )
))
(declare-fun lt!170319 () ListLongMap!4777)

(declare-fun lt!170316 () array!21531)

(declare-fun minValue!472 () V!12843)

(declare-fun getCurrentListMap!1830 (array!21533 array!21531 (_ BitVec 32) (_ BitVec 32) V!12843 V!12843 (_ BitVec 32) Int) ListLongMap!4777)

(assert (=> b!371802 (= lt!170319 (getCurrentListMap!1830 lt!170315 lt!170316 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170317 () ListLongMap!4777)

(declare-fun lt!170318 () ListLongMap!4777)

(assert (=> b!371802 (and (= lt!170317 lt!170318) (= lt!170318 lt!170317))))

(declare-fun v!373 () V!12843)

(declare-fun lt!170314 () ListLongMap!4777)

(declare-fun +!772 (ListLongMap!4777 tuple2!5874) ListLongMap!4777)

(assert (=> b!371802 (= lt!170318 (+!772 lt!170314 (tuple2!5875 k0!778 v!373)))))

(declare-datatypes ((Unit!11420 0))(
  ( (Unit!11421) )
))
(declare-fun lt!170313 () Unit!11420)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!23 (array!21533 array!21531 (_ BitVec 32) (_ BitVec 32) V!12843 V!12843 (_ BitVec 32) (_ BitVec 64) V!12843 (_ BitVec 32) Int) Unit!11420)

(assert (=> b!371802 (= lt!170313 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!23 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!695 (array!21533 array!21531 (_ BitVec 32) (_ BitVec 32) V!12843 V!12843 (_ BitVec 32) Int) ListLongMap!4777)

(assert (=> b!371802 (= lt!170317 (getCurrentListMapNoExtraKeys!695 lt!170315 lt!170316 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371802 (= lt!170316 (array!21532 (store (arr!10234 _values!506) i!548 (ValueCellFull!4058 v!373)) (size!10587 _values!506)))))

(assert (=> b!371802 (= lt!170314 (getCurrentListMapNoExtraKeys!695 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371803 () Bool)

(declare-fun res!209146 () Bool)

(assert (=> b!371803 (=> (not res!209146) (not e!226830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371803 (= res!209146 (validKeyInArray!0 k0!778))))

(assert (= (and start!37014 res!209145) b!371794))

(assert (= (and b!371794 res!209142) b!371793))

(assert (= (and b!371793 res!209144) b!371800))

(assert (= (and b!371800 res!209148) b!371795))

(assert (= (and b!371795 res!209143) b!371803))

(assert (= (and b!371803 res!209146) b!371796))

(assert (= (and b!371796 res!209150) b!371801))

(assert (= (and b!371801 res!209141) b!371798))

(assert (= (and b!371798 res!209149) b!371799))

(assert (= (and b!371799 res!209147) b!371802))

(assert (= (and b!371797 condMapEmpty!14769) mapIsEmpty!14769))

(assert (= (and b!371797 (not condMapEmpty!14769)) mapNonEmpty!14769))

(get-info :version)

(assert (= (and mapNonEmpty!14769 ((_ is ValueCellFull!4058) mapValue!14769)) b!371792))

(assert (= (and b!371797 ((_ is ValueCellFull!4058) mapDefault!14769)) b!371791))

(assert (= start!37014 b!371797))

(declare-fun m!367235 () Bool)

(assert (=> b!371802 m!367235))

(declare-fun m!367237 () Bool)

(assert (=> b!371802 m!367237))

(declare-fun m!367239 () Bool)

(assert (=> b!371802 m!367239))

(declare-fun m!367241 () Bool)

(assert (=> b!371802 m!367241))

(declare-fun m!367243 () Bool)

(assert (=> b!371802 m!367243))

(declare-fun m!367245 () Bool)

(assert (=> b!371802 m!367245))

(declare-fun m!367247 () Bool)

(assert (=> b!371796 m!367247))

(declare-fun m!367249 () Bool)

(assert (=> b!371801 m!367249))

(declare-fun m!367251 () Bool)

(assert (=> mapNonEmpty!14769 m!367251))

(declare-fun m!367253 () Bool)

(assert (=> b!371803 m!367253))

(declare-fun m!367255 () Bool)

(assert (=> b!371800 m!367255))

(declare-fun m!367257 () Bool)

(assert (=> start!37014 m!367257))

(declare-fun m!367259 () Bool)

(assert (=> start!37014 m!367259))

(declare-fun m!367261 () Bool)

(assert (=> start!37014 m!367261))

(declare-fun m!367263 () Bool)

(assert (=> b!371799 m!367263))

(declare-fun m!367265 () Bool)

(assert (=> b!371793 m!367265))

(declare-fun m!367267 () Bool)

(assert (=> b!371798 m!367267))

(declare-fun m!367269 () Bool)

(assert (=> b!371798 m!367269))

(check-sat (not b!371793) (not start!37014) (not mapNonEmpty!14769) (not b_next!8155) (not b!371800) (not b!371802) (not b!371798) (not b!371803) (not b!371801) b_and!15371 (not b!371799) tp_is_empty!8803)
(check-sat b_and!15371 (not b_next!8155))
