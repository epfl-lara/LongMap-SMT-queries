; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36864 () Bool)

(assert start!36864)

(declare-fun b_free!8005 () Bool)

(declare-fun b_next!8005 () Bool)

(assert (=> start!36864 (= b_free!8005 (not b_next!8005))))

(declare-fun tp!28730 () Bool)

(declare-fun b_and!15261 () Bool)

(assert (=> start!36864 (= tp!28730 b_and!15261)))

(declare-fun res!207020 () Bool)

(declare-fun e!225624 () Bool)

(assert (=> start!36864 (=> (not res!207020) (not e!225624))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36864 (= res!207020 (validMask!0 mask!970))))

(assert (=> start!36864 e!225624))

(declare-datatypes ((V!12643 0))(
  ( (V!12644 (val!4371 Int)) )
))
(declare-datatypes ((ValueCell!3983 0))(
  ( (ValueCellFull!3983 (v!6569 V!12643)) (EmptyCell!3983) )
))
(declare-datatypes ((array!21240 0))(
  ( (array!21241 (arr!10088 (Array (_ BitVec 32) ValueCell!3983)) (size!10440 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21240)

(declare-fun e!225623 () Bool)

(declare-fun array_inv!7486 (array!21240) Bool)

(assert (=> start!36864 (and (array_inv!7486 _values!506) e!225623)))

(assert (=> start!36864 tp!28730))

(assert (=> start!36864 true))

(declare-fun tp_is_empty!8653 () Bool)

(assert (=> start!36864 tp_is_empty!8653))

(declare-datatypes ((array!21242 0))(
  ( (array!21243 (arr!10089 (Array (_ BitVec 32) (_ BitVec 64))) (size!10441 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21242)

(declare-fun array_inv!7487 (array!21242) Bool)

(assert (=> start!36864 (array_inv!7487 _keys!658)))

(declare-fun b!369088 () Bool)

(declare-fun res!207026 () Bool)

(assert (=> b!369088 (=> (not res!207026) (not e!225624))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369088 (= res!207026 (or (= (select (arr!10089 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10089 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369089 () Bool)

(declare-fun res!207018 () Bool)

(declare-fun e!225626 () Bool)

(assert (=> b!369089 (=> (not res!207018) (not e!225626))))

(declare-fun lt!169685 () array!21242)

(declare-datatypes ((List!5534 0))(
  ( (Nil!5531) (Cons!5530 (h!6386 (_ BitVec 64)) (t!10676 List!5534)) )
))
(declare-fun arrayNoDuplicates!0 (array!21242 (_ BitVec 32) List!5534) Bool)

(assert (=> b!369089 (= res!207018 (arrayNoDuplicates!0 lt!169685 #b00000000000000000000000000000000 Nil!5531))))

(declare-fun b!369090 () Bool)

(declare-fun res!207017 () Bool)

(assert (=> b!369090 (=> (not res!207017) (not e!225624))))

(assert (=> b!369090 (= res!207017 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5531))))

(declare-fun b!369091 () Bool)

(declare-fun e!225622 () Bool)

(declare-fun mapRes!14544 () Bool)

(assert (=> b!369091 (= e!225623 (and e!225622 mapRes!14544))))

(declare-fun condMapEmpty!14544 () Bool)

(declare-fun mapDefault!14544 () ValueCell!3983)

(assert (=> b!369091 (= condMapEmpty!14544 (= (arr!10088 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3983)) mapDefault!14544)))))

(declare-fun b!369092 () Bool)

(declare-fun e!225627 () Bool)

(assert (=> b!369092 (= e!225627 tp_is_empty!8653)))

(declare-fun b!369093 () Bool)

(declare-fun res!207024 () Bool)

(assert (=> b!369093 (=> (not res!207024) (not e!225624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21242 (_ BitVec 32)) Bool)

(assert (=> b!369093 (= res!207024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369094 () Bool)

(declare-fun res!207025 () Bool)

(assert (=> b!369094 (=> (not res!207025) (not e!225624))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369094 (= res!207025 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14544 () Bool)

(declare-fun tp!28731 () Bool)

(assert (=> mapNonEmpty!14544 (= mapRes!14544 (and tp!28731 e!225627))))

(declare-fun mapRest!14544 () (Array (_ BitVec 32) ValueCell!3983))

(declare-fun mapValue!14544 () ValueCell!3983)

(declare-fun mapKey!14544 () (_ BitVec 32))

(assert (=> mapNonEmpty!14544 (= (arr!10088 _values!506) (store mapRest!14544 mapKey!14544 mapValue!14544))))

(declare-fun b!369095 () Bool)

(declare-fun res!207023 () Bool)

(assert (=> b!369095 (=> (not res!207023) (not e!225624))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369095 (= res!207023 (and (= (size!10440 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10441 _keys!658) (size!10440 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14544 () Bool)

(assert (=> mapIsEmpty!14544 mapRes!14544))

(declare-fun b!369096 () Bool)

(assert (=> b!369096 (= e!225622 tp_is_empty!8653)))

(declare-fun b!369097 () Bool)

(assert (=> b!369097 (= e!225626 false)))

(declare-datatypes ((tuple2!5708 0))(
  ( (tuple2!5709 (_1!2865 (_ BitVec 64)) (_2!2865 V!12643)) )
))
(declare-datatypes ((List!5535 0))(
  ( (Nil!5532) (Cons!5531 (h!6387 tuple2!5708) (t!10677 List!5535)) )
))
(declare-datatypes ((ListLongMap!4623 0))(
  ( (ListLongMap!4624 (toList!2327 List!5535)) )
))
(declare-fun lt!169686 () ListLongMap!4623)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12643)

(declare-fun v!373 () V!12643)

(declare-fun minValue!472 () V!12643)

(declare-fun getCurrentListMapNoExtraKeys!636 (array!21242 array!21240 (_ BitVec 32) (_ BitVec 32) V!12643 V!12643 (_ BitVec 32) Int) ListLongMap!4623)

(assert (=> b!369097 (= lt!169686 (getCurrentListMapNoExtraKeys!636 lt!169685 (array!21241 (store (arr!10088 _values!506) i!548 (ValueCellFull!3983 v!373)) (size!10440 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169687 () ListLongMap!4623)

(assert (=> b!369097 (= lt!169687 (getCurrentListMapNoExtraKeys!636 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369098 () Bool)

(assert (=> b!369098 (= e!225624 e!225626)))

(declare-fun res!207022 () Bool)

(assert (=> b!369098 (=> (not res!207022) (not e!225626))))

(assert (=> b!369098 (= res!207022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169685 mask!970))))

(assert (=> b!369098 (= lt!169685 (array!21243 (store (arr!10089 _keys!658) i!548 k0!778) (size!10441 _keys!658)))))

(declare-fun b!369099 () Bool)

(declare-fun res!207021 () Bool)

(assert (=> b!369099 (=> (not res!207021) (not e!225624))))

(declare-fun arrayContainsKey!0 (array!21242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369099 (= res!207021 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369100 () Bool)

(declare-fun res!207019 () Bool)

(assert (=> b!369100 (=> (not res!207019) (not e!225624))))

(assert (=> b!369100 (= res!207019 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10441 _keys!658))))))

(assert (= (and start!36864 res!207020) b!369095))

(assert (= (and b!369095 res!207023) b!369093))

(assert (= (and b!369093 res!207024) b!369090))

(assert (= (and b!369090 res!207017) b!369100))

(assert (= (and b!369100 res!207019) b!369094))

(assert (= (and b!369094 res!207025) b!369088))

(assert (= (and b!369088 res!207026) b!369099))

(assert (= (and b!369099 res!207021) b!369098))

(assert (= (and b!369098 res!207022) b!369089))

(assert (= (and b!369089 res!207018) b!369097))

(assert (= (and b!369091 condMapEmpty!14544) mapIsEmpty!14544))

(assert (= (and b!369091 (not condMapEmpty!14544)) mapNonEmpty!14544))

(get-info :version)

(assert (= (and mapNonEmpty!14544 ((_ is ValueCellFull!3983) mapValue!14544)) b!369092))

(assert (= (and b!369091 ((_ is ValueCellFull!3983) mapDefault!14544)) b!369096))

(assert (= start!36864 b!369091))

(declare-fun m!365813 () Bool)

(assert (=> b!369099 m!365813))

(declare-fun m!365815 () Bool)

(assert (=> b!369088 m!365815))

(declare-fun m!365817 () Bool)

(assert (=> mapNonEmpty!14544 m!365817))

(declare-fun m!365819 () Bool)

(assert (=> b!369089 m!365819))

(declare-fun m!365821 () Bool)

(assert (=> start!36864 m!365821))

(declare-fun m!365823 () Bool)

(assert (=> start!36864 m!365823))

(declare-fun m!365825 () Bool)

(assert (=> start!36864 m!365825))

(declare-fun m!365827 () Bool)

(assert (=> b!369098 m!365827))

(declare-fun m!365829 () Bool)

(assert (=> b!369098 m!365829))

(declare-fun m!365831 () Bool)

(assert (=> b!369097 m!365831))

(declare-fun m!365833 () Bool)

(assert (=> b!369097 m!365833))

(declare-fun m!365835 () Bool)

(assert (=> b!369097 m!365835))

(declare-fun m!365837 () Bool)

(assert (=> b!369094 m!365837))

(declare-fun m!365839 () Bool)

(assert (=> b!369090 m!365839))

(declare-fun m!365841 () Bool)

(assert (=> b!369093 m!365841))

(check-sat tp_is_empty!8653 (not mapNonEmpty!14544) (not b!369093) (not b!369090) (not b!369098) b_and!15261 (not b!369097) (not b_next!8005) (not b!369089) (not start!36864) (not b!369094) (not b!369099))
(check-sat b_and!15261 (not b_next!8005))
