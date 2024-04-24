; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37170 () Bool)

(assert start!37170)

(declare-fun b_free!8311 () Bool)

(declare-fun b_next!8311 () Bool)

(assert (=> start!37170 (= b_free!8311 (not b_next!8311))))

(declare-fun tp!29648 () Bool)

(declare-fun b_and!15567 () Bool)

(assert (=> start!37170 (= tp!29648 b_and!15567)))

(declare-fun b!375383 () Bool)

(declare-fun res!211941 () Bool)

(declare-fun e!228699 () Bool)

(assert (=> b!375383 (=> (not res!211941) (not e!228699))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13051 0))(
  ( (V!13052 (val!4524 Int)) )
))
(declare-datatypes ((ValueCell!4136 0))(
  ( (ValueCellFull!4136 (v!6722 V!13051)) (EmptyCell!4136) )
))
(declare-datatypes ((array!21836 0))(
  ( (array!21837 (arr!10386 (Array (_ BitVec 32) ValueCell!4136)) (size!10738 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21836)

(declare-datatypes ((array!21838 0))(
  ( (array!21839 (arr!10387 (Array (_ BitVec 32) (_ BitVec 64))) (size!10739 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21838)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!375383 (= res!211941 (and (= (size!10738 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10739 _keys!658) (size!10738 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375384 () Bool)

(declare-fun res!211936 () Bool)

(assert (=> b!375384 (=> (not res!211936) (not e!228699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21838 (_ BitVec 32)) Bool)

(assert (=> b!375384 (= res!211936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375385 () Bool)

(declare-fun res!211937 () Bool)

(assert (=> b!375385 (=> (not res!211937) (not e!228699))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375385 (= res!211937 (validKeyInArray!0 k0!778))))

(declare-fun b!375386 () Bool)

(declare-fun e!228697 () Bool)

(assert (=> b!375386 (= e!228699 e!228697)))

(declare-fun res!211943 () Bool)

(assert (=> b!375386 (=> (not res!211943) (not e!228697))))

(declare-fun lt!173770 () array!21838)

(assert (=> b!375386 (= res!211943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173770 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375386 (= lt!173770 (array!21839 (store (arr!10387 _keys!658) i!548 k0!778) (size!10739 _keys!658)))))

(declare-fun res!211938 () Bool)

(assert (=> start!37170 (=> (not res!211938) (not e!228699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37170 (= res!211938 (validMask!0 mask!970))))

(assert (=> start!37170 e!228699))

(declare-fun e!228696 () Bool)

(declare-fun array_inv!7708 (array!21836) Bool)

(assert (=> start!37170 (and (array_inv!7708 _values!506) e!228696)))

(assert (=> start!37170 tp!29648))

(assert (=> start!37170 true))

(declare-fun tp_is_empty!8959 () Bool)

(assert (=> start!37170 tp_is_empty!8959))

(declare-fun array_inv!7709 (array!21838) Bool)

(assert (=> start!37170 (array_inv!7709 _keys!658)))

(declare-fun mapIsEmpty!15003 () Bool)

(declare-fun mapRes!15003 () Bool)

(assert (=> mapIsEmpty!15003 mapRes!15003))

(declare-fun b!375387 () Bool)

(declare-fun e!228698 () Bool)

(assert (=> b!375387 (= e!228696 (and e!228698 mapRes!15003))))

(declare-fun condMapEmpty!15003 () Bool)

(declare-fun mapDefault!15003 () ValueCell!4136)

(assert (=> b!375387 (= condMapEmpty!15003 (= (arr!10386 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4136)) mapDefault!15003)))))

(declare-fun b!375388 () Bool)

(declare-fun res!211940 () Bool)

(assert (=> b!375388 (=> (not res!211940) (not e!228699))))

(declare-datatypes ((List!5766 0))(
  ( (Nil!5763) (Cons!5762 (h!6618 (_ BitVec 64)) (t!10908 List!5766)) )
))
(declare-fun arrayNoDuplicates!0 (array!21838 (_ BitVec 32) List!5766) Bool)

(assert (=> b!375388 (= res!211940 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5763))))

(declare-fun b!375389 () Bool)

(declare-fun e!228700 () Bool)

(assert (=> b!375389 (= e!228697 (not e!228700))))

(declare-fun res!211946 () Bool)

(assert (=> b!375389 (=> res!211946 e!228700)))

(assert (=> b!375389 (= res!211946 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5922 0))(
  ( (tuple2!5923 (_1!2972 (_ BitVec 64)) (_2!2972 V!13051)) )
))
(declare-datatypes ((List!5767 0))(
  ( (Nil!5764) (Cons!5763 (h!6619 tuple2!5922) (t!10909 List!5767)) )
))
(declare-datatypes ((ListLongMap!4837 0))(
  ( (ListLongMap!4838 (toList!2434 List!5767)) )
))
(declare-fun lt!173754 () ListLongMap!4837)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13051)

(declare-fun minValue!472 () V!13051)

(declare-fun getCurrentListMap!1888 (array!21838 array!21836 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) Int) ListLongMap!4837)

(assert (=> b!375389 (= lt!173754 (getCurrentListMap!1888 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173769 () ListLongMap!4837)

(declare-fun lt!173763 () array!21836)

(assert (=> b!375389 (= lt!173769 (getCurrentListMap!1888 lt!173770 lt!173763 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173759 () ListLongMap!4837)

(declare-fun lt!173762 () ListLongMap!4837)

(assert (=> b!375389 (and (= lt!173759 lt!173762) (= lt!173762 lt!173759))))

(declare-fun lt!173766 () ListLongMap!4837)

(declare-fun lt!173757 () tuple2!5922)

(declare-fun +!830 (ListLongMap!4837 tuple2!5922) ListLongMap!4837)

(assert (=> b!375389 (= lt!173762 (+!830 lt!173766 lt!173757))))

(declare-fun v!373 () V!13051)

(assert (=> b!375389 (= lt!173757 (tuple2!5923 k0!778 v!373))))

(declare-datatypes ((Unit!11549 0))(
  ( (Unit!11550) )
))
(declare-fun lt!173758 () Unit!11549)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!75 (array!21838 array!21836 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) (_ BitVec 64) V!13051 (_ BitVec 32) Int) Unit!11549)

(assert (=> b!375389 (= lt!173758 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!75 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!735 (array!21838 array!21836 (_ BitVec 32) (_ BitVec 32) V!13051 V!13051 (_ BitVec 32) Int) ListLongMap!4837)

(assert (=> b!375389 (= lt!173759 (getCurrentListMapNoExtraKeys!735 lt!173770 lt!173763 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375389 (= lt!173763 (array!21837 (store (arr!10386 _values!506) i!548 (ValueCellFull!4136 v!373)) (size!10738 _values!506)))))

(assert (=> b!375389 (= lt!173766 (getCurrentListMapNoExtraKeys!735 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15003 () Bool)

(declare-fun tp!29649 () Bool)

(declare-fun e!228701 () Bool)

(assert (=> mapNonEmpty!15003 (= mapRes!15003 (and tp!29649 e!228701))))

(declare-fun mapRest!15003 () (Array (_ BitVec 32) ValueCell!4136))

(declare-fun mapValue!15003 () ValueCell!4136)

(declare-fun mapKey!15003 () (_ BitVec 32))

(assert (=> mapNonEmpty!15003 (= (arr!10386 _values!506) (store mapRest!15003 mapKey!15003 mapValue!15003))))

(declare-fun b!375390 () Bool)

(assert (=> b!375390 (= e!228698 tp_is_empty!8959)))

(declare-fun b!375391 () Bool)

(declare-fun e!228695 () Bool)

(assert (=> b!375391 (= e!228695 true)))

(declare-fun lt!173761 () tuple2!5922)

(declare-fun lt!173756 () ListLongMap!4837)

(declare-fun lt!173767 () ListLongMap!4837)

(assert (=> b!375391 (= (+!830 lt!173767 lt!173761) (+!830 lt!173756 lt!173757))))

(declare-fun lt!173760 () Unit!11549)

(declare-fun lt!173755 () ListLongMap!4837)

(declare-fun addCommutativeForDiffKeys!257 (ListLongMap!4837 (_ BitVec 64) V!13051 (_ BitVec 64) V!13051) Unit!11549)

(assert (=> b!375391 (= lt!173760 (addCommutativeForDiffKeys!257 lt!173755 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375392 () Bool)

(declare-fun res!211935 () Bool)

(assert (=> b!375392 (=> (not res!211935) (not e!228697))))

(assert (=> b!375392 (= res!211935 (arrayNoDuplicates!0 lt!173770 #b00000000000000000000000000000000 Nil!5763))))

(declare-fun b!375393 () Bool)

(declare-fun res!211944 () Bool)

(assert (=> b!375393 (=> (not res!211944) (not e!228699))))

(assert (=> b!375393 (= res!211944 (or (= (select (arr!10387 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10387 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375394 () Bool)

(assert (=> b!375394 (= e!228701 tp_is_empty!8959)))

(declare-fun b!375395 () Bool)

(declare-fun res!211942 () Bool)

(assert (=> b!375395 (=> (not res!211942) (not e!228699))))

(assert (=> b!375395 (= res!211942 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10739 _keys!658))))))

(declare-fun b!375396 () Bool)

(declare-fun res!211945 () Bool)

(assert (=> b!375396 (=> (not res!211945) (not e!228699))))

(declare-fun arrayContainsKey!0 (array!21838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375396 (= res!211945 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375397 () Bool)

(assert (=> b!375397 (= e!228700 e!228695)))

(declare-fun res!211939 () Bool)

(assert (=> b!375397 (=> res!211939 e!228695)))

(assert (=> b!375397 (= res!211939 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173768 () ListLongMap!4837)

(assert (=> b!375397 (= lt!173768 lt!173767)))

(assert (=> b!375397 (= lt!173767 (+!830 lt!173755 lt!173757))))

(declare-fun lt!173764 () Unit!11549)

(assert (=> b!375397 (= lt!173764 (addCommutativeForDiffKeys!257 lt!173766 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!375397 (= lt!173769 (+!830 lt!173768 lt!173761))))

(declare-fun lt!173765 () tuple2!5922)

(assert (=> b!375397 (= lt!173768 (+!830 lt!173762 lt!173765))))

(assert (=> b!375397 (= lt!173754 lt!173756)))

(assert (=> b!375397 (= lt!173756 (+!830 lt!173755 lt!173761))))

(assert (=> b!375397 (= lt!173755 (+!830 lt!173766 lt!173765))))

(assert (=> b!375397 (= lt!173769 (+!830 (+!830 lt!173759 lt!173765) lt!173761))))

(assert (=> b!375397 (= lt!173761 (tuple2!5923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375397 (= lt!173765 (tuple2!5923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (= (and start!37170 res!211938) b!375383))

(assert (= (and b!375383 res!211941) b!375384))

(assert (= (and b!375384 res!211936) b!375388))

(assert (= (and b!375388 res!211940) b!375395))

(assert (= (and b!375395 res!211942) b!375385))

(assert (= (and b!375385 res!211937) b!375393))

(assert (= (and b!375393 res!211944) b!375396))

(assert (= (and b!375396 res!211945) b!375386))

(assert (= (and b!375386 res!211943) b!375392))

(assert (= (and b!375392 res!211935) b!375389))

(assert (= (and b!375389 (not res!211946)) b!375397))

(assert (= (and b!375397 (not res!211939)) b!375391))

(assert (= (and b!375387 condMapEmpty!15003) mapIsEmpty!15003))

(assert (= (and b!375387 (not condMapEmpty!15003)) mapNonEmpty!15003))

(get-info :version)

(assert (= (and mapNonEmpty!15003 ((_ is ValueCellFull!4136) mapValue!15003)) b!375394))

(assert (= (and b!375387 ((_ is ValueCellFull!4136) mapDefault!15003)) b!375390))

(assert (= start!37170 b!375387))

(declare-fun m!372245 () Bool)

(assert (=> b!375385 m!372245))

(declare-fun m!372247 () Bool)

(assert (=> b!375392 m!372247))

(declare-fun m!372249 () Bool)

(assert (=> b!375388 m!372249))

(declare-fun m!372251 () Bool)

(assert (=> b!375397 m!372251))

(declare-fun m!372253 () Bool)

(assert (=> b!375397 m!372253))

(declare-fun m!372255 () Bool)

(assert (=> b!375397 m!372255))

(declare-fun m!372257 () Bool)

(assert (=> b!375397 m!372257))

(declare-fun m!372259 () Bool)

(assert (=> b!375397 m!372259))

(assert (=> b!375397 m!372259))

(declare-fun m!372261 () Bool)

(assert (=> b!375397 m!372261))

(declare-fun m!372263 () Bool)

(assert (=> b!375397 m!372263))

(declare-fun m!372265 () Bool)

(assert (=> b!375397 m!372265))

(declare-fun m!372267 () Bool)

(assert (=> b!375391 m!372267))

(declare-fun m!372269 () Bool)

(assert (=> b!375391 m!372269))

(declare-fun m!372271 () Bool)

(assert (=> b!375391 m!372271))

(declare-fun m!372273 () Bool)

(assert (=> b!375393 m!372273))

(declare-fun m!372275 () Bool)

(assert (=> mapNonEmpty!15003 m!372275))

(declare-fun m!372277 () Bool)

(assert (=> b!375389 m!372277))

(declare-fun m!372279 () Bool)

(assert (=> b!375389 m!372279))

(declare-fun m!372281 () Bool)

(assert (=> b!375389 m!372281))

(declare-fun m!372283 () Bool)

(assert (=> b!375389 m!372283))

(declare-fun m!372285 () Bool)

(assert (=> b!375389 m!372285))

(declare-fun m!372287 () Bool)

(assert (=> b!375389 m!372287))

(declare-fun m!372289 () Bool)

(assert (=> b!375389 m!372289))

(declare-fun m!372291 () Bool)

(assert (=> b!375396 m!372291))

(declare-fun m!372293 () Bool)

(assert (=> b!375386 m!372293))

(declare-fun m!372295 () Bool)

(assert (=> b!375386 m!372295))

(declare-fun m!372297 () Bool)

(assert (=> b!375384 m!372297))

(declare-fun m!372299 () Bool)

(assert (=> start!37170 m!372299))

(declare-fun m!372301 () Bool)

(assert (=> start!37170 m!372301))

(declare-fun m!372303 () Bool)

(assert (=> start!37170 m!372303))

(check-sat (not b!375391) (not b!375392) (not b_next!8311) b_and!15567 (not b!375386) (not mapNonEmpty!15003) (not b!375389) (not b!375388) (not b!375396) (not b!375397) (not b!375385) (not b!375384) tp_is_empty!8959 (not start!37170))
(check-sat b_and!15567 (not b_next!8311))
