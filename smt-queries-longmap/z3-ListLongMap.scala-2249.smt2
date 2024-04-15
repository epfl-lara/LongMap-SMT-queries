; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36942 () Bool)

(assert start!36942)

(declare-fun b_free!8083 () Bool)

(declare-fun b_next!8083 () Bool)

(assert (=> start!36942 (= b_free!8083 (not b_next!8083))))

(declare-fun tp!28964 () Bool)

(declare-fun b_and!15299 () Bool)

(assert (=> start!36942 (= tp!28964 b_and!15299)))

(declare-fun b!370387 () Bool)

(declare-fun e!226187 () Bool)

(declare-fun e!226185 () Bool)

(declare-fun mapRes!14661 () Bool)

(assert (=> b!370387 (= e!226187 (and e!226185 mapRes!14661))))

(declare-fun condMapEmpty!14661 () Bool)

(declare-datatypes ((V!12747 0))(
  ( (V!12748 (val!4410 Int)) )
))
(declare-datatypes ((ValueCell!4022 0))(
  ( (ValueCellFull!4022 (v!6601 V!12747)) (EmptyCell!4022) )
))
(declare-datatypes ((array!21389 0))(
  ( (array!21390 (arr!10163 (Array (_ BitVec 32) ValueCell!4022)) (size!10516 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21389)

(declare-fun mapDefault!14661 () ValueCell!4022)

(assert (=> b!370387 (= condMapEmpty!14661 (= (arr!10163 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4022)) mapDefault!14661)))))

(declare-fun b!370388 () Bool)

(declare-fun e!226183 () Bool)

(declare-fun tp_is_empty!8731 () Bool)

(assert (=> b!370388 (= e!226183 tp_is_empty!8731)))

(declare-fun mapNonEmpty!14661 () Bool)

(declare-fun tp!28965 () Bool)

(assert (=> mapNonEmpty!14661 (= mapRes!14661 (and tp!28965 e!226183))))

(declare-fun mapValue!14661 () ValueCell!4022)

(declare-fun mapRest!14661 () (Array (_ BitVec 32) ValueCell!4022))

(declare-fun mapKey!14661 () (_ BitVec 32))

(assert (=> mapNonEmpty!14661 (= (arr!10163 _values!506) (store mapRest!14661 mapKey!14661 mapValue!14661))))

(declare-fun b!370390 () Bool)

(declare-fun res!208061 () Bool)

(declare-fun e!226184 () Bool)

(assert (=> b!370390 (=> (not res!208061) (not e!226184))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370390 (= res!208061 (validKeyInArray!0 k0!778))))

(declare-fun b!370391 () Bool)

(declare-fun res!208070 () Bool)

(assert (=> b!370391 (=> (not res!208070) (not e!226184))))

(declare-datatypes ((array!21391 0))(
  ( (array!21392 (arr!10164 (Array (_ BitVec 32) (_ BitVec 64))) (size!10517 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21391)

(declare-fun arrayContainsKey!0 (array!21391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370391 (= res!208070 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370392 () Bool)

(assert (=> b!370392 (= e!226185 tp_is_empty!8731)))

(declare-fun b!370393 () Bool)

(declare-fun e!226182 () Bool)

(assert (=> b!370393 (= e!226182 false)))

(declare-datatypes ((tuple2!5820 0))(
  ( (tuple2!5821 (_1!2921 (_ BitVec 64)) (_2!2921 V!12747)) )
))
(declare-datatypes ((List!5652 0))(
  ( (Nil!5649) (Cons!5648 (h!6504 tuple2!5820) (t!10793 List!5652)) )
))
(declare-datatypes ((ListLongMap!4723 0))(
  ( (ListLongMap!4724 (toList!2377 List!5652)) )
))
(declare-fun lt!169784 () ListLongMap!4723)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169783 () array!21391)

(declare-fun zeroValue!472 () V!12747)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12747)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12747)

(declare-fun getCurrentListMapNoExtraKeys!668 (array!21391 array!21389 (_ BitVec 32) (_ BitVec 32) V!12747 V!12747 (_ BitVec 32) Int) ListLongMap!4723)

(assert (=> b!370393 (= lt!169784 (getCurrentListMapNoExtraKeys!668 lt!169783 (array!21390 (store (arr!10163 _values!506) i!548 (ValueCellFull!4022 v!373)) (size!10516 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169785 () ListLongMap!4723)

(assert (=> b!370393 (= lt!169785 (getCurrentListMapNoExtraKeys!668 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370394 () Bool)

(declare-fun res!208067 () Bool)

(assert (=> b!370394 (=> (not res!208067) (not e!226184))))

(assert (=> b!370394 (= res!208067 (and (= (size!10516 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10517 _keys!658) (size!10516 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370395 () Bool)

(declare-fun res!208065 () Bool)

(assert (=> b!370395 (=> (not res!208065) (not e!226184))))

(declare-datatypes ((List!5653 0))(
  ( (Nil!5650) (Cons!5649 (h!6505 (_ BitVec 64)) (t!10794 List!5653)) )
))
(declare-fun arrayNoDuplicates!0 (array!21391 (_ BitVec 32) List!5653) Bool)

(assert (=> b!370395 (= res!208065 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5650))))

(declare-fun b!370396 () Bool)

(declare-fun res!208066 () Bool)

(assert (=> b!370396 (=> (not res!208066) (not e!226184))))

(assert (=> b!370396 (= res!208066 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10517 _keys!658))))))

(declare-fun mapIsEmpty!14661 () Bool)

(assert (=> mapIsEmpty!14661 mapRes!14661))

(declare-fun b!370397 () Bool)

(declare-fun res!208062 () Bool)

(assert (=> b!370397 (=> (not res!208062) (not e!226184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21391 (_ BitVec 32)) Bool)

(assert (=> b!370397 (= res!208062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!208069 () Bool)

(assert (=> start!36942 (=> (not res!208069) (not e!226184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36942 (= res!208069 (validMask!0 mask!970))))

(assert (=> start!36942 e!226184))

(declare-fun array_inv!7518 (array!21389) Bool)

(assert (=> start!36942 (and (array_inv!7518 _values!506) e!226187)))

(assert (=> start!36942 tp!28964))

(assert (=> start!36942 true))

(assert (=> start!36942 tp_is_empty!8731))

(declare-fun array_inv!7519 (array!21391) Bool)

(assert (=> start!36942 (array_inv!7519 _keys!658)))

(declare-fun b!370389 () Bool)

(declare-fun res!208064 () Bool)

(assert (=> b!370389 (=> (not res!208064) (not e!226184))))

(assert (=> b!370389 (= res!208064 (or (= (select (arr!10164 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10164 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370398 () Bool)

(assert (=> b!370398 (= e!226184 e!226182)))

(declare-fun res!208063 () Bool)

(assert (=> b!370398 (=> (not res!208063) (not e!226182))))

(assert (=> b!370398 (= res!208063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169783 mask!970))))

(assert (=> b!370398 (= lt!169783 (array!21392 (store (arr!10164 _keys!658) i!548 k0!778) (size!10517 _keys!658)))))

(declare-fun b!370399 () Bool)

(declare-fun res!208068 () Bool)

(assert (=> b!370399 (=> (not res!208068) (not e!226182))))

(assert (=> b!370399 (= res!208068 (arrayNoDuplicates!0 lt!169783 #b00000000000000000000000000000000 Nil!5650))))

(assert (= (and start!36942 res!208069) b!370394))

(assert (= (and b!370394 res!208067) b!370397))

(assert (= (and b!370397 res!208062) b!370395))

(assert (= (and b!370395 res!208065) b!370396))

(assert (= (and b!370396 res!208066) b!370390))

(assert (= (and b!370390 res!208061) b!370389))

(assert (= (and b!370389 res!208064) b!370391))

(assert (= (and b!370391 res!208070) b!370398))

(assert (= (and b!370398 res!208063) b!370399))

(assert (= (and b!370399 res!208068) b!370393))

(assert (= (and b!370387 condMapEmpty!14661) mapIsEmpty!14661))

(assert (= (and b!370387 (not condMapEmpty!14661)) mapNonEmpty!14661))

(get-info :version)

(assert (= (and mapNonEmpty!14661 ((_ is ValueCellFull!4022) mapValue!14661)) b!370388))

(assert (= (and b!370387 ((_ is ValueCellFull!4022) mapDefault!14661)) b!370392))

(assert (= start!36942 b!370387))

(declare-fun m!366029 () Bool)

(assert (=> start!36942 m!366029))

(declare-fun m!366031 () Bool)

(assert (=> start!36942 m!366031))

(declare-fun m!366033 () Bool)

(assert (=> start!36942 m!366033))

(declare-fun m!366035 () Bool)

(assert (=> b!370390 m!366035))

(declare-fun m!366037 () Bool)

(assert (=> b!370398 m!366037))

(declare-fun m!366039 () Bool)

(assert (=> b!370398 m!366039))

(declare-fun m!366041 () Bool)

(assert (=> b!370391 m!366041))

(declare-fun m!366043 () Bool)

(assert (=> b!370393 m!366043))

(declare-fun m!366045 () Bool)

(assert (=> b!370393 m!366045))

(declare-fun m!366047 () Bool)

(assert (=> b!370393 m!366047))

(declare-fun m!366049 () Bool)

(assert (=> b!370389 m!366049))

(declare-fun m!366051 () Bool)

(assert (=> b!370395 m!366051))

(declare-fun m!366053 () Bool)

(assert (=> b!370397 m!366053))

(declare-fun m!366055 () Bool)

(assert (=> b!370399 m!366055))

(declare-fun m!366057 () Bool)

(assert (=> mapNonEmpty!14661 m!366057))

(check-sat (not start!36942) b_and!15299 (not b_next!8083) (not mapNonEmpty!14661) (not b!370390) (not b!370391) tp_is_empty!8731 (not b!370398) (not b!370395) (not b!370393) (not b!370397) (not b!370399))
(check-sat b_and!15299 (not b_next!8083))
