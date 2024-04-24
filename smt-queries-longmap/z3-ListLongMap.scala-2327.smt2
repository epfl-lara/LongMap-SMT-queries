; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37410 () Bool)

(assert start!37410)

(declare-fun b_free!8551 () Bool)

(declare-fun b_next!8551 () Bool)

(assert (=> start!37410 (= b_free!8551 (not b_next!8551))))

(declare-fun tp!30368 () Bool)

(declare-fun b_and!15807 () Bool)

(assert (=> start!37410 (= tp!30368 b_and!15807)))

(declare-fun b!380799 () Bool)

(declare-fun e!231574 () Bool)

(declare-fun e!231576 () Bool)

(assert (=> b!380799 (= e!231574 e!231576)))

(declare-fun res!216275 () Bool)

(assert (=> b!380799 (=> (not res!216275) (not e!231576))))

(declare-datatypes ((array!22298 0))(
  ( (array!22299 (arr!10617 (Array (_ BitVec 32) (_ BitVec 64))) (size!10969 (_ BitVec 32))) )
))
(declare-fun lt!178421 () array!22298)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22298 (_ BitVec 32)) Bool)

(assert (=> b!380799 (= res!216275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178421 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22298)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380799 (= lt!178421 (array!22299 (store (arr!10617 _keys!658) i!548 k0!778) (size!10969 _keys!658)))))

(declare-fun b!380800 () Bool)

(declare-fun e!231578 () Bool)

(declare-fun e!231573 () Bool)

(declare-fun mapRes!15363 () Bool)

(assert (=> b!380800 (= e!231578 (and e!231573 mapRes!15363))))

(declare-fun condMapEmpty!15363 () Bool)

(declare-datatypes ((V!13371 0))(
  ( (V!13372 (val!4644 Int)) )
))
(declare-datatypes ((ValueCell!4256 0))(
  ( (ValueCellFull!4256 (v!6842 V!13371)) (EmptyCell!4256) )
))
(declare-datatypes ((array!22300 0))(
  ( (array!22301 (arr!10618 (Array (_ BitVec 32) ValueCell!4256)) (size!10970 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22300)

(declare-fun mapDefault!15363 () ValueCell!4256)

(assert (=> b!380800 (= condMapEmpty!15363 (= (arr!10618 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4256)) mapDefault!15363)))))

(declare-fun b!380801 () Bool)

(declare-fun res!216279 () Bool)

(assert (=> b!380801 (=> (not res!216279) (not e!231574))))

(declare-datatypes ((List!5943 0))(
  ( (Nil!5940) (Cons!5939 (h!6795 (_ BitVec 64)) (t!11085 List!5943)) )
))
(declare-fun arrayNoDuplicates!0 (array!22298 (_ BitVec 32) List!5943) Bool)

(assert (=> b!380801 (= res!216279 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5940))))

(declare-fun b!380802 () Bool)

(declare-fun e!231579 () Bool)

(declare-fun tp_is_empty!9199 () Bool)

(assert (=> b!380802 (= e!231579 tp_is_empty!9199)))

(declare-fun b!380803 () Bool)

(declare-fun res!216272 () Bool)

(assert (=> b!380803 (=> (not res!216272) (not e!231574))))

(assert (=> b!380803 (= res!216272 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10969 _keys!658))))))

(declare-fun b!380805 () Bool)

(declare-fun res!216277 () Bool)

(assert (=> b!380805 (=> (not res!216277) (not e!231574))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380805 (= res!216277 (and (= (size!10970 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10969 _keys!658) (size!10970 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380806 () Bool)

(declare-fun res!216280 () Bool)

(assert (=> b!380806 (=> (not res!216280) (not e!231574))))

(assert (=> b!380806 (= res!216280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15363 () Bool)

(declare-fun tp!30369 () Bool)

(assert (=> mapNonEmpty!15363 (= mapRes!15363 (and tp!30369 e!231579))))

(declare-fun mapRest!15363 () (Array (_ BitVec 32) ValueCell!4256))

(declare-fun mapValue!15363 () ValueCell!4256)

(declare-fun mapKey!15363 () (_ BitVec 32))

(assert (=> mapNonEmpty!15363 (= (arr!10618 _values!506) (store mapRest!15363 mapKey!15363 mapValue!15363))))

(declare-fun b!380807 () Bool)

(declare-fun res!216274 () Bool)

(assert (=> b!380807 (=> (not res!216274) (not e!231574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380807 (= res!216274 (validKeyInArray!0 k0!778))))

(declare-fun b!380808 () Bool)

(assert (=> b!380808 (= e!231573 tp_is_empty!9199)))

(declare-fun b!380809 () Bool)

(declare-fun res!216271 () Bool)

(assert (=> b!380809 (=> (not res!216271) (not e!231576))))

(assert (=> b!380809 (= res!216271 (arrayNoDuplicates!0 lt!178421 #b00000000000000000000000000000000 Nil!5940))))

(declare-fun b!380810 () Bool)

(declare-fun res!216273 () Bool)

(assert (=> b!380810 (=> (not res!216273) (not e!231574))))

(declare-fun arrayContainsKey!0 (array!22298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380810 (= res!216273 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15363 () Bool)

(assert (=> mapIsEmpty!15363 mapRes!15363))

(declare-fun b!380804 () Bool)

(declare-fun e!231577 () Bool)

(assert (=> b!380804 (= e!231577 true)))

(declare-datatypes ((tuple2!6106 0))(
  ( (tuple2!6107 (_1!3064 (_ BitVec 64)) (_2!3064 V!13371)) )
))
(declare-datatypes ((List!5944 0))(
  ( (Nil!5941) (Cons!5940 (h!6796 tuple2!6106) (t!11086 List!5944)) )
))
(declare-datatypes ((ListLongMap!5021 0))(
  ( (ListLongMap!5022 (toList!2526 List!5944)) )
))
(declare-fun lt!178426 () ListLongMap!5021)

(declare-fun lt!178419 () ListLongMap!5021)

(assert (=> b!380804 (= lt!178426 lt!178419)))

(declare-fun res!216278 () Bool)

(assert (=> start!37410 (=> (not res!216278) (not e!231574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37410 (= res!216278 (validMask!0 mask!970))))

(assert (=> start!37410 e!231574))

(declare-fun array_inv!7860 (array!22300) Bool)

(assert (=> start!37410 (and (array_inv!7860 _values!506) e!231578)))

(assert (=> start!37410 tp!30368))

(assert (=> start!37410 true))

(assert (=> start!37410 tp_is_empty!9199))

(declare-fun array_inv!7861 (array!22298) Bool)

(assert (=> start!37410 (array_inv!7861 _keys!658)))

(declare-fun b!380811 () Bool)

(assert (=> b!380811 (= e!231576 (not e!231577))))

(declare-fun res!216276 () Bool)

(assert (=> b!380811 (=> res!216276 e!231577)))

(declare-fun lt!178420 () Bool)

(assert (=> b!380811 (= res!216276 (or (and (not lt!178420) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178420) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178420)))))

(assert (=> b!380811 (= lt!178420 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!178424 () ListLongMap!5021)

(declare-fun zeroValue!472 () V!13371)

(declare-fun minValue!472 () V!13371)

(declare-fun getCurrentListMap!1964 (array!22298 array!22300 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) Int) ListLongMap!5021)

(assert (=> b!380811 (= lt!178424 (getCurrentListMap!1964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178423 () array!22300)

(assert (=> b!380811 (= lt!178426 (getCurrentListMap!1964 lt!178421 lt!178423 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178422 () ListLongMap!5021)

(assert (=> b!380811 (and (= lt!178419 lt!178422) (= lt!178422 lt!178419))))

(declare-fun v!373 () V!13371)

(declare-fun lt!178418 () ListLongMap!5021)

(declare-fun +!922 (ListLongMap!5021 tuple2!6106) ListLongMap!5021)

(assert (=> b!380811 (= lt!178422 (+!922 lt!178418 (tuple2!6107 k0!778 v!373)))))

(declare-datatypes ((Unit!11723 0))(
  ( (Unit!11724) )
))
(declare-fun lt!178425 () Unit!11723)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!151 (array!22298 array!22300 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) (_ BitVec 64) V!13371 (_ BitVec 32) Int) Unit!11723)

(assert (=> b!380811 (= lt!178425 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!151 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!811 (array!22298 array!22300 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) Int) ListLongMap!5021)

(assert (=> b!380811 (= lt!178419 (getCurrentListMapNoExtraKeys!811 lt!178421 lt!178423 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380811 (= lt!178423 (array!22301 (store (arr!10618 _values!506) i!548 (ValueCellFull!4256 v!373)) (size!10970 _values!506)))))

(assert (=> b!380811 (= lt!178418 (getCurrentListMapNoExtraKeys!811 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380812 () Bool)

(declare-fun res!216281 () Bool)

(assert (=> b!380812 (=> (not res!216281) (not e!231574))))

(assert (=> b!380812 (= res!216281 (or (= (select (arr!10617 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10617 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37410 res!216278) b!380805))

(assert (= (and b!380805 res!216277) b!380806))

(assert (= (and b!380806 res!216280) b!380801))

(assert (= (and b!380801 res!216279) b!380803))

(assert (= (and b!380803 res!216272) b!380807))

(assert (= (and b!380807 res!216274) b!380812))

(assert (= (and b!380812 res!216281) b!380810))

(assert (= (and b!380810 res!216273) b!380799))

(assert (= (and b!380799 res!216275) b!380809))

(assert (= (and b!380809 res!216271) b!380811))

(assert (= (and b!380811 (not res!216276)) b!380804))

(assert (= (and b!380800 condMapEmpty!15363) mapIsEmpty!15363))

(assert (= (and b!380800 (not condMapEmpty!15363)) mapNonEmpty!15363))

(get-info :version)

(assert (= (and mapNonEmpty!15363 ((_ is ValueCellFull!4256) mapValue!15363)) b!380802))

(assert (= (and b!380800 ((_ is ValueCellFull!4256) mapDefault!15363)) b!380808))

(assert (= start!37410 b!380800))

(declare-fun m!378053 () Bool)

(assert (=> b!380812 m!378053))

(declare-fun m!378055 () Bool)

(assert (=> b!380810 m!378055))

(declare-fun m!378057 () Bool)

(assert (=> start!37410 m!378057))

(declare-fun m!378059 () Bool)

(assert (=> start!37410 m!378059))

(declare-fun m!378061 () Bool)

(assert (=> start!37410 m!378061))

(declare-fun m!378063 () Bool)

(assert (=> b!380807 m!378063))

(declare-fun m!378065 () Bool)

(assert (=> b!380799 m!378065))

(declare-fun m!378067 () Bool)

(assert (=> b!380799 m!378067))

(declare-fun m!378069 () Bool)

(assert (=> mapNonEmpty!15363 m!378069))

(declare-fun m!378071 () Bool)

(assert (=> b!380809 m!378071))

(declare-fun m!378073 () Bool)

(assert (=> b!380806 m!378073))

(declare-fun m!378075 () Bool)

(assert (=> b!380811 m!378075))

(declare-fun m!378077 () Bool)

(assert (=> b!380811 m!378077))

(declare-fun m!378079 () Bool)

(assert (=> b!380811 m!378079))

(declare-fun m!378081 () Bool)

(assert (=> b!380811 m!378081))

(declare-fun m!378083 () Bool)

(assert (=> b!380811 m!378083))

(declare-fun m!378085 () Bool)

(assert (=> b!380811 m!378085))

(declare-fun m!378087 () Bool)

(assert (=> b!380811 m!378087))

(declare-fun m!378089 () Bool)

(assert (=> b!380801 m!378089))

(check-sat (not start!37410) (not b!380807) (not b!380799) (not mapNonEmpty!15363) (not b!380806) (not b!380811) b_and!15807 (not b!380810) tp_is_empty!9199 (not b!380809) (not b_next!8551) (not b!380801))
(check-sat b_and!15807 (not b_next!8551))
