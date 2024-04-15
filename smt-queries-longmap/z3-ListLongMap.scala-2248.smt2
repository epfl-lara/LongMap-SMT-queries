; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36936 () Bool)

(assert start!36936)

(declare-fun b_free!8077 () Bool)

(declare-fun b_next!8077 () Bool)

(assert (=> start!36936 (= b_free!8077 (not b_next!8077))))

(declare-fun tp!28947 () Bool)

(declare-fun b_and!15293 () Bool)

(assert (=> start!36936 (= tp!28947 b_and!15293)))

(declare-fun b!370270 () Bool)

(declare-fun res!207975 () Bool)

(declare-fun e!226130 () Bool)

(assert (=> b!370270 (=> (not res!207975) (not e!226130))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!12739 0))(
  ( (V!12740 (val!4407 Int)) )
))
(declare-datatypes ((ValueCell!4019 0))(
  ( (ValueCellFull!4019 (v!6598 V!12739)) (EmptyCell!4019) )
))
(declare-datatypes ((array!21379 0))(
  ( (array!21380 (arr!10158 (Array (_ BitVec 32) ValueCell!4019)) (size!10511 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21379)

(declare-datatypes ((array!21381 0))(
  ( (array!21382 (arr!10159 (Array (_ BitVec 32) (_ BitVec 64))) (size!10512 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21381)

(assert (=> b!370270 (= res!207975 (and (= (size!10511 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10512 _keys!658) (size!10511 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370271 () Bool)

(declare-fun e!226132 () Bool)

(declare-fun tp_is_empty!8725 () Bool)

(assert (=> b!370271 (= e!226132 tp_is_empty!8725)))

(declare-fun b!370272 () Bool)

(declare-fun res!207971 () Bool)

(declare-fun e!226131 () Bool)

(assert (=> b!370272 (=> (not res!207971) (not e!226131))))

(declare-fun lt!169758 () array!21381)

(declare-datatypes ((List!5648 0))(
  ( (Nil!5645) (Cons!5644 (h!6500 (_ BitVec 64)) (t!10789 List!5648)) )
))
(declare-fun arrayNoDuplicates!0 (array!21381 (_ BitVec 32) List!5648) Bool)

(assert (=> b!370272 (= res!207971 (arrayNoDuplicates!0 lt!169758 #b00000000000000000000000000000000 Nil!5645))))

(declare-fun b!370273 () Bool)

(declare-fun res!207980 () Bool)

(assert (=> b!370273 (=> (not res!207980) (not e!226130))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370273 (= res!207980 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10512 _keys!658))))))

(declare-fun mapIsEmpty!14652 () Bool)

(declare-fun mapRes!14652 () Bool)

(assert (=> mapIsEmpty!14652 mapRes!14652))

(declare-fun b!370274 () Bool)

(declare-fun res!207979 () Bool)

(assert (=> b!370274 (=> (not res!207979) (not e!226130))))

(assert (=> b!370274 (= res!207979 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5645))))

(declare-fun b!370275 () Bool)

(declare-fun e!226129 () Bool)

(assert (=> b!370275 (= e!226129 tp_is_empty!8725)))

(declare-fun b!370276 () Bool)

(declare-fun res!207972 () Bool)

(assert (=> b!370276 (=> (not res!207972) (not e!226130))))

(assert (=> b!370276 (= res!207972 (or (= (select (arr!10159 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10159 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370277 () Bool)

(declare-fun res!207978 () Bool)

(assert (=> b!370277 (=> (not res!207978) (not e!226130))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370277 (= res!207978 (validKeyInArray!0 k0!778))))

(declare-fun b!370278 () Bool)

(assert (=> b!370278 (= e!226130 e!226131)))

(declare-fun res!207976 () Bool)

(assert (=> b!370278 (=> (not res!207976) (not e!226131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21381 (_ BitVec 32)) Bool)

(assert (=> b!370278 (= res!207976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169758 mask!970))))

(assert (=> b!370278 (= lt!169758 (array!21382 (store (arr!10159 _keys!658) i!548 k0!778) (size!10512 _keys!658)))))

(declare-fun res!207973 () Bool)

(assert (=> start!36936 (=> (not res!207973) (not e!226130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36936 (= res!207973 (validMask!0 mask!970))))

(assert (=> start!36936 e!226130))

(declare-fun e!226128 () Bool)

(declare-fun array_inv!7514 (array!21379) Bool)

(assert (=> start!36936 (and (array_inv!7514 _values!506) e!226128)))

(assert (=> start!36936 tp!28947))

(assert (=> start!36936 true))

(assert (=> start!36936 tp_is_empty!8725))

(declare-fun array_inv!7515 (array!21381) Bool)

(assert (=> start!36936 (array_inv!7515 _keys!658)))

(declare-fun b!370279 () Bool)

(declare-fun res!207974 () Bool)

(assert (=> b!370279 (=> (not res!207974) (not e!226130))))

(declare-fun arrayContainsKey!0 (array!21381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370279 (= res!207974 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370280 () Bool)

(declare-fun res!207977 () Bool)

(assert (=> b!370280 (=> (not res!207977) (not e!226130))))

(assert (=> b!370280 (= res!207977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370281 () Bool)

(assert (=> b!370281 (= e!226131 false)))

(declare-datatypes ((tuple2!5816 0))(
  ( (tuple2!5817 (_1!2919 (_ BitVec 64)) (_2!2919 V!12739)) )
))
(declare-datatypes ((List!5649 0))(
  ( (Nil!5646) (Cons!5645 (h!6501 tuple2!5816) (t!10790 List!5649)) )
))
(declare-datatypes ((ListLongMap!4719 0))(
  ( (ListLongMap!4720 (toList!2375 List!5649)) )
))
(declare-fun lt!169757 () ListLongMap!4719)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12739)

(declare-fun v!373 () V!12739)

(declare-fun minValue!472 () V!12739)

(declare-fun getCurrentListMapNoExtraKeys!666 (array!21381 array!21379 (_ BitVec 32) (_ BitVec 32) V!12739 V!12739 (_ BitVec 32) Int) ListLongMap!4719)

(assert (=> b!370281 (= lt!169757 (getCurrentListMapNoExtraKeys!666 lt!169758 (array!21380 (store (arr!10158 _values!506) i!548 (ValueCellFull!4019 v!373)) (size!10511 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169756 () ListLongMap!4719)

(assert (=> b!370281 (= lt!169756 (getCurrentListMapNoExtraKeys!666 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370282 () Bool)

(assert (=> b!370282 (= e!226128 (and e!226129 mapRes!14652))))

(declare-fun condMapEmpty!14652 () Bool)

(declare-fun mapDefault!14652 () ValueCell!4019)

(assert (=> b!370282 (= condMapEmpty!14652 (= (arr!10158 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4019)) mapDefault!14652)))))

(declare-fun mapNonEmpty!14652 () Bool)

(declare-fun tp!28946 () Bool)

(assert (=> mapNonEmpty!14652 (= mapRes!14652 (and tp!28946 e!226132))))

(declare-fun mapValue!14652 () ValueCell!4019)

(declare-fun mapKey!14652 () (_ BitVec 32))

(declare-fun mapRest!14652 () (Array (_ BitVec 32) ValueCell!4019))

(assert (=> mapNonEmpty!14652 (= (arr!10158 _values!506) (store mapRest!14652 mapKey!14652 mapValue!14652))))

(assert (= (and start!36936 res!207973) b!370270))

(assert (= (and b!370270 res!207975) b!370280))

(assert (= (and b!370280 res!207977) b!370274))

(assert (= (and b!370274 res!207979) b!370273))

(assert (= (and b!370273 res!207980) b!370277))

(assert (= (and b!370277 res!207978) b!370276))

(assert (= (and b!370276 res!207972) b!370279))

(assert (= (and b!370279 res!207974) b!370278))

(assert (= (and b!370278 res!207976) b!370272))

(assert (= (and b!370272 res!207971) b!370281))

(assert (= (and b!370282 condMapEmpty!14652) mapIsEmpty!14652))

(assert (= (and b!370282 (not condMapEmpty!14652)) mapNonEmpty!14652))

(get-info :version)

(assert (= (and mapNonEmpty!14652 ((_ is ValueCellFull!4019) mapValue!14652)) b!370271))

(assert (= (and b!370282 ((_ is ValueCellFull!4019) mapDefault!14652)) b!370275))

(assert (= start!36936 b!370282))

(declare-fun m!365939 () Bool)

(assert (=> start!36936 m!365939))

(declare-fun m!365941 () Bool)

(assert (=> start!36936 m!365941))

(declare-fun m!365943 () Bool)

(assert (=> start!36936 m!365943))

(declare-fun m!365945 () Bool)

(assert (=> b!370274 m!365945))

(declare-fun m!365947 () Bool)

(assert (=> b!370280 m!365947))

(declare-fun m!365949 () Bool)

(assert (=> mapNonEmpty!14652 m!365949))

(declare-fun m!365951 () Bool)

(assert (=> b!370272 m!365951))

(declare-fun m!365953 () Bool)

(assert (=> b!370276 m!365953))

(declare-fun m!365955 () Bool)

(assert (=> b!370279 m!365955))

(declare-fun m!365957 () Bool)

(assert (=> b!370281 m!365957))

(declare-fun m!365959 () Bool)

(assert (=> b!370281 m!365959))

(declare-fun m!365961 () Bool)

(assert (=> b!370281 m!365961))

(declare-fun m!365963 () Bool)

(assert (=> b!370277 m!365963))

(declare-fun m!365965 () Bool)

(assert (=> b!370278 m!365965))

(declare-fun m!365967 () Bool)

(assert (=> b!370278 m!365967))

(check-sat b_and!15293 (not b!370272) (not b!370281) (not b!370274) (not start!36936) tp_is_empty!8725 (not mapNonEmpty!14652) (not b!370278) (not b!370280) (not b_next!8077) (not b!370277) (not b!370279))
(check-sat b_and!15293 (not b_next!8077))
