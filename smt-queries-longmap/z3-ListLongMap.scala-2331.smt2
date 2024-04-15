; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37434 () Bool)

(assert start!37434)

(declare-fun b_free!8575 () Bool)

(declare-fun b_next!8575 () Bool)

(assert (=> start!37434 (= b_free!8575 (not b_next!8575))))

(declare-fun tp!30440 () Bool)

(declare-fun b_and!15791 () Bool)

(assert (=> start!37434 (= tp!30440 b_and!15791)))

(declare-fun b!381081 () Bool)

(declare-fun res!216542 () Bool)

(declare-fun e!231685 () Bool)

(assert (=> b!381081 (=> (not res!216542) (not e!231685))))

(declare-datatypes ((array!22343 0))(
  ( (array!22344 (arr!10640 (Array (_ BitVec 32) (_ BitVec 64))) (size!10993 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22343)

(declare-datatypes ((List!6049 0))(
  ( (Nil!6046) (Cons!6045 (h!6901 (_ BitVec 64)) (t!11190 List!6049)) )
))
(declare-fun arrayNoDuplicates!0 (array!22343 (_ BitVec 32) List!6049) Bool)

(assert (=> b!381081 (= res!216542 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6046))))

(declare-fun mapIsEmpty!15399 () Bool)

(declare-fun mapRes!15399 () Bool)

(assert (=> mapIsEmpty!15399 mapRes!15399))

(declare-fun b!381083 () Bool)

(declare-fun e!231689 () Bool)

(declare-fun e!231687 () Bool)

(assert (=> b!381083 (= e!231689 (not e!231687))))

(declare-fun res!216551 () Bool)

(assert (=> b!381083 (=> res!216551 e!231687)))

(declare-fun lt!178489 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381083 (= res!216551 (or (and (not lt!178489) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178489) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178489)))))

(assert (=> b!381083 (= lt!178489 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13403 0))(
  ( (V!13404 (val!4656 Int)) )
))
(declare-datatypes ((ValueCell!4268 0))(
  ( (ValueCellFull!4268 (v!6847 V!13403)) (EmptyCell!4268) )
))
(declare-datatypes ((array!22345 0))(
  ( (array!22346 (arr!10641 (Array (_ BitVec 32) ValueCell!4268)) (size!10994 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22345)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13403)

(declare-datatypes ((tuple2!6222 0))(
  ( (tuple2!6223 (_1!3122 (_ BitVec 64)) (_2!3122 V!13403)) )
))
(declare-datatypes ((List!6050 0))(
  ( (Nil!6047) (Cons!6046 (h!6902 tuple2!6222) (t!11191 List!6050)) )
))
(declare-datatypes ((ListLongMap!5125 0))(
  ( (ListLongMap!5126 (toList!2578 List!6050)) )
))
(declare-fun lt!178491 () ListLongMap!5125)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13403)

(declare-fun getCurrentListMap!1968 (array!22343 array!22345 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) Int) ListLongMap!5125)

(assert (=> b!381083 (= lt!178491 (getCurrentListMap!1968 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178494 () array!22343)

(declare-fun lt!178492 () ListLongMap!5125)

(declare-fun lt!178497 () array!22345)

(assert (=> b!381083 (= lt!178492 (getCurrentListMap!1968 lt!178494 lt!178497 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178496 () ListLongMap!5125)

(declare-fun lt!178490 () ListLongMap!5125)

(assert (=> b!381083 (and (= lt!178496 lt!178490) (= lt!178490 lt!178496))))

(declare-fun v!373 () V!13403)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!178495 () ListLongMap!5125)

(declare-fun +!942 (ListLongMap!5125 tuple2!6222) ListLongMap!5125)

(assert (=> b!381083 (= lt!178490 (+!942 lt!178495 (tuple2!6223 k0!778 v!373)))))

(declare-datatypes ((Unit!11742 0))(
  ( (Unit!11743) )
))
(declare-fun lt!178493 () Unit!11742)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!161 (array!22343 array!22345 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) (_ BitVec 64) V!13403 (_ BitVec 32) Int) Unit!11742)

(assert (=> b!381083 (= lt!178493 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!161 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!833 (array!22343 array!22345 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) Int) ListLongMap!5125)

(assert (=> b!381083 (= lt!178496 (getCurrentListMapNoExtraKeys!833 lt!178494 lt!178497 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381083 (= lt!178497 (array!22346 (store (arr!10641 _values!506) i!548 (ValueCellFull!4268 v!373)) (size!10994 _values!506)))))

(assert (=> b!381083 (= lt!178495 (getCurrentListMapNoExtraKeys!833 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381084 () Bool)

(declare-fun e!231688 () Bool)

(declare-fun tp_is_empty!9223 () Bool)

(assert (=> b!381084 (= e!231688 tp_is_empty!9223)))

(declare-fun b!381085 () Bool)

(declare-fun e!231684 () Bool)

(assert (=> b!381085 (= e!231684 (and e!231688 mapRes!15399))))

(declare-fun condMapEmpty!15399 () Bool)

(declare-fun mapDefault!15399 () ValueCell!4268)

(assert (=> b!381085 (= condMapEmpty!15399 (= (arr!10641 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4268)) mapDefault!15399)))))

(declare-fun mapNonEmpty!15399 () Bool)

(declare-fun tp!30441 () Bool)

(declare-fun e!231686 () Bool)

(assert (=> mapNonEmpty!15399 (= mapRes!15399 (and tp!30441 e!231686))))

(declare-fun mapKey!15399 () (_ BitVec 32))

(declare-fun mapRest!15399 () (Array (_ BitVec 32) ValueCell!4268))

(declare-fun mapValue!15399 () ValueCell!4268)

(assert (=> mapNonEmpty!15399 (= (arr!10641 _values!506) (store mapRest!15399 mapKey!15399 mapValue!15399))))

(declare-fun b!381086 () Bool)

(declare-fun res!216544 () Bool)

(assert (=> b!381086 (=> (not res!216544) (not e!231685))))

(assert (=> b!381086 (= res!216544 (and (= (size!10994 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10993 _keys!658) (size!10994 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381082 () Bool)

(declare-fun res!216541 () Bool)

(assert (=> b!381082 (=> (not res!216541) (not e!231685))))

(assert (=> b!381082 (= res!216541 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10993 _keys!658))))))

(declare-fun res!216549 () Bool)

(assert (=> start!37434 (=> (not res!216549) (not e!231685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37434 (= res!216549 (validMask!0 mask!970))))

(assert (=> start!37434 e!231685))

(declare-fun array_inv!7836 (array!22345) Bool)

(assert (=> start!37434 (and (array_inv!7836 _values!506) e!231684)))

(assert (=> start!37434 tp!30440))

(assert (=> start!37434 true))

(assert (=> start!37434 tp_is_empty!9223))

(declare-fun array_inv!7837 (array!22343) Bool)

(assert (=> start!37434 (array_inv!7837 _keys!658)))

(declare-fun b!381087 () Bool)

(declare-fun res!216545 () Bool)

(assert (=> b!381087 (=> (not res!216545) (not e!231685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22343 (_ BitVec 32)) Bool)

(assert (=> b!381087 (= res!216545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381088 () Bool)

(assert (=> b!381088 (= e!231685 e!231689)))

(declare-fun res!216550 () Bool)

(assert (=> b!381088 (=> (not res!216550) (not e!231689))))

(assert (=> b!381088 (= res!216550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178494 mask!970))))

(assert (=> b!381088 (= lt!178494 (array!22344 (store (arr!10640 _keys!658) i!548 k0!778) (size!10993 _keys!658)))))

(declare-fun b!381089 () Bool)

(assert (=> b!381089 (= e!231686 tp_is_empty!9223)))

(declare-fun b!381090 () Bool)

(assert (=> b!381090 (= e!231687 true)))

(assert (=> b!381090 (= lt!178492 lt!178496)))

(declare-fun b!381091 () Bool)

(declare-fun res!216543 () Bool)

(assert (=> b!381091 (=> (not res!216543) (not e!231685))))

(assert (=> b!381091 (= res!216543 (or (= (select (arr!10640 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10640 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381092 () Bool)

(declare-fun res!216547 () Bool)

(assert (=> b!381092 (=> (not res!216547) (not e!231685))))

(declare-fun arrayContainsKey!0 (array!22343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381092 (= res!216547 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381093 () Bool)

(declare-fun res!216546 () Bool)

(assert (=> b!381093 (=> (not res!216546) (not e!231685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381093 (= res!216546 (validKeyInArray!0 k0!778))))

(declare-fun b!381094 () Bool)

(declare-fun res!216548 () Bool)

(assert (=> b!381094 (=> (not res!216548) (not e!231689))))

(assert (=> b!381094 (= res!216548 (arrayNoDuplicates!0 lt!178494 #b00000000000000000000000000000000 Nil!6046))))

(assert (= (and start!37434 res!216549) b!381086))

(assert (= (and b!381086 res!216544) b!381087))

(assert (= (and b!381087 res!216545) b!381081))

(assert (= (and b!381081 res!216542) b!381082))

(assert (= (and b!381082 res!216541) b!381093))

(assert (= (and b!381093 res!216546) b!381091))

(assert (= (and b!381091 res!216543) b!381092))

(assert (= (and b!381092 res!216547) b!381088))

(assert (= (and b!381088 res!216550) b!381094))

(assert (= (and b!381094 res!216548) b!381083))

(assert (= (and b!381083 (not res!216551)) b!381090))

(assert (= (and b!381085 condMapEmpty!15399) mapIsEmpty!15399))

(assert (= (and b!381085 (not condMapEmpty!15399)) mapNonEmpty!15399))

(get-info :version)

(assert (= (and mapNonEmpty!15399 ((_ is ValueCellFull!4268) mapValue!15399)) b!381089))

(assert (= (and b!381085 ((_ is ValueCellFull!4268) mapDefault!15399)) b!381084))

(assert (= start!37434 b!381085))

(declare-fun m!377555 () Bool)

(assert (=> b!381088 m!377555))

(declare-fun m!377557 () Bool)

(assert (=> b!381088 m!377557))

(declare-fun m!377559 () Bool)

(assert (=> b!381083 m!377559))

(declare-fun m!377561 () Bool)

(assert (=> b!381083 m!377561))

(declare-fun m!377563 () Bool)

(assert (=> b!381083 m!377563))

(declare-fun m!377565 () Bool)

(assert (=> b!381083 m!377565))

(declare-fun m!377567 () Bool)

(assert (=> b!381083 m!377567))

(declare-fun m!377569 () Bool)

(assert (=> b!381083 m!377569))

(declare-fun m!377571 () Bool)

(assert (=> b!381083 m!377571))

(declare-fun m!377573 () Bool)

(assert (=> b!381092 m!377573))

(declare-fun m!377575 () Bool)

(assert (=> start!37434 m!377575))

(declare-fun m!377577 () Bool)

(assert (=> start!37434 m!377577))

(declare-fun m!377579 () Bool)

(assert (=> start!37434 m!377579))

(declare-fun m!377581 () Bool)

(assert (=> b!381081 m!377581))

(declare-fun m!377583 () Bool)

(assert (=> b!381093 m!377583))

(declare-fun m!377585 () Bool)

(assert (=> b!381087 m!377585))

(declare-fun m!377587 () Bool)

(assert (=> mapNonEmpty!15399 m!377587))

(declare-fun m!377589 () Bool)

(assert (=> b!381094 m!377589))

(declare-fun m!377591 () Bool)

(assert (=> b!381091 m!377591))

(check-sat (not b!381083) b_and!15791 (not b_next!8575) (not b!381092) (not b!381087) (not b!381088) (not b!381093) (not b!381094) (not b!381081) tp_is_empty!9223 (not mapNonEmpty!15399) (not start!37434))
(check-sat b_and!15791 (not b_next!8575))
