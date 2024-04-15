; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37542 () Bool)

(assert start!37542)

(declare-fun b_free!8683 () Bool)

(declare-fun b_next!8683 () Bool)

(assert (=> start!37542 (= b_free!8683 (not b_next!8683))))

(declare-fun tp!30765 () Bool)

(declare-fun b_and!15899 () Bool)

(assert (=> start!37542 (= tp!30765 b_and!15899)))

(declare-fun b!383349 () Bool)

(declare-fun e!232818 () Bool)

(declare-fun tp_is_empty!9331 () Bool)

(assert (=> b!383349 (= e!232818 tp_is_empty!9331)))

(declare-fun b!383350 () Bool)

(declare-fun e!232822 () Bool)

(assert (=> b!383350 (= e!232822 tp_is_empty!9331)))

(declare-fun b!383351 () Bool)

(declare-fun res!218329 () Bool)

(declare-fun e!232819 () Bool)

(assert (=> b!383351 (=> (not res!218329) (not e!232819))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22553 0))(
  ( (array!22554 (arr!10745 (Array (_ BitVec 32) (_ BitVec 64))) (size!11098 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22553)

(assert (=> b!383351 (= res!218329 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11098 _keys!658))))))

(declare-fun res!218326 () Bool)

(assert (=> start!37542 (=> (not res!218326) (not e!232819))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37542 (= res!218326 (validMask!0 mask!970))))

(assert (=> start!37542 e!232819))

(declare-datatypes ((V!13547 0))(
  ( (V!13548 (val!4710 Int)) )
))
(declare-datatypes ((ValueCell!4322 0))(
  ( (ValueCellFull!4322 (v!6901 V!13547)) (EmptyCell!4322) )
))
(declare-datatypes ((array!22555 0))(
  ( (array!22556 (arr!10746 (Array (_ BitVec 32) ValueCell!4322)) (size!11099 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22555)

(declare-fun e!232817 () Bool)

(declare-fun array_inv!7912 (array!22555) Bool)

(assert (=> start!37542 (and (array_inv!7912 _values!506) e!232817)))

(assert (=> start!37542 tp!30765))

(assert (=> start!37542 true))

(assert (=> start!37542 tp_is_empty!9331))

(declare-fun array_inv!7913 (array!22553) Bool)

(assert (=> start!37542 (array_inv!7913 _keys!658)))

(declare-fun b!383352 () Bool)

(declare-fun res!218325 () Bool)

(assert (=> b!383352 (=> (not res!218325) (not e!232819))))

(declare-datatypes ((List!6142 0))(
  ( (Nil!6139) (Cons!6138 (h!6994 (_ BitVec 64)) (t!11283 List!6142)) )
))
(declare-fun arrayNoDuplicates!0 (array!22553 (_ BitVec 32) List!6142) Bool)

(assert (=> b!383352 (= res!218325 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6139))))

(declare-fun b!383353 () Bool)

(declare-fun e!232820 () Bool)

(assert (=> b!383353 (= e!232820 true)))

(declare-datatypes ((tuple2!6318 0))(
  ( (tuple2!6319 (_1!3170 (_ BitVec 64)) (_2!3170 V!13547)) )
))
(declare-datatypes ((List!6143 0))(
  ( (Nil!6140) (Cons!6139 (h!6995 tuple2!6318) (t!11284 List!6143)) )
))
(declare-datatypes ((ListLongMap!5221 0))(
  ( (ListLongMap!5222 (toList!2626 List!6143)) )
))
(declare-fun lt!180025 () ListLongMap!5221)

(declare-fun lt!180030 () ListLongMap!5221)

(declare-fun lt!180033 () tuple2!6318)

(declare-fun +!983 (ListLongMap!5221 tuple2!6318) ListLongMap!5221)

(assert (=> b!383353 (= lt!180025 (+!983 lt!180030 lt!180033))))

(declare-fun lt!180023 () ListLongMap!5221)

(declare-fun lt!180026 () ListLongMap!5221)

(assert (=> b!383353 (= lt!180023 lt!180026)))

(declare-fun b!383354 () Bool)

(declare-fun res!218332 () Bool)

(assert (=> b!383354 (=> (not res!218332) (not e!232819))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383354 (= res!218332 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383355 () Bool)

(declare-fun res!218330 () Bool)

(declare-fun e!232823 () Bool)

(assert (=> b!383355 (=> (not res!218330) (not e!232823))))

(declare-fun lt!180029 () array!22553)

(assert (=> b!383355 (= res!218330 (arrayNoDuplicates!0 lt!180029 #b00000000000000000000000000000000 Nil!6139))))

(declare-fun b!383356 () Bool)

(declare-fun res!218327 () Bool)

(assert (=> b!383356 (=> (not res!218327) (not e!232819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22553 (_ BitVec 32)) Bool)

(assert (=> b!383356 (= res!218327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383357 () Bool)

(declare-fun mapRes!15561 () Bool)

(assert (=> b!383357 (= e!232817 (and e!232822 mapRes!15561))))

(declare-fun condMapEmpty!15561 () Bool)

(declare-fun mapDefault!15561 () ValueCell!4322)

(assert (=> b!383357 (= condMapEmpty!15561 (= (arr!10746 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4322)) mapDefault!15561)))))

(declare-fun b!383358 () Bool)

(declare-fun res!218323 () Bool)

(assert (=> b!383358 (=> (not res!218323) (not e!232819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383358 (= res!218323 (validKeyInArray!0 k0!778))))

(declare-fun b!383359 () Bool)

(assert (=> b!383359 (= e!232823 (not e!232820))))

(declare-fun res!218331 () Bool)

(assert (=> b!383359 (=> res!218331 e!232820)))

(declare-fun lt!180028 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383359 (= res!218331 (or (and (not lt!180028) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180028) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180028)))))

(assert (=> b!383359 (= lt!180028 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13547)

(declare-fun minValue!472 () V!13547)

(declare-fun getCurrentListMap!2007 (array!22553 array!22555 (_ BitVec 32) (_ BitVec 32) V!13547 V!13547 (_ BitVec 32) Int) ListLongMap!5221)

(assert (=> b!383359 (= lt!180030 (getCurrentListMap!2007 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180027 () array!22555)

(assert (=> b!383359 (= lt!180023 (getCurrentListMap!2007 lt!180029 lt!180027 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180032 () ListLongMap!5221)

(assert (=> b!383359 (and (= lt!180026 lt!180032) (= lt!180032 lt!180026))))

(declare-fun lt!180024 () ListLongMap!5221)

(assert (=> b!383359 (= lt!180032 (+!983 lt!180024 lt!180033))))

(declare-fun v!373 () V!13547)

(assert (=> b!383359 (= lt!180033 (tuple2!6319 k0!778 v!373))))

(declare-datatypes ((Unit!11820 0))(
  ( (Unit!11821) )
))
(declare-fun lt!180031 () Unit!11820)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!200 (array!22553 array!22555 (_ BitVec 32) (_ BitVec 32) V!13547 V!13547 (_ BitVec 32) (_ BitVec 64) V!13547 (_ BitVec 32) Int) Unit!11820)

(assert (=> b!383359 (= lt!180031 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!200 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!872 (array!22553 array!22555 (_ BitVec 32) (_ BitVec 32) V!13547 V!13547 (_ BitVec 32) Int) ListLongMap!5221)

(assert (=> b!383359 (= lt!180026 (getCurrentListMapNoExtraKeys!872 lt!180029 lt!180027 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383359 (= lt!180027 (array!22556 (store (arr!10746 _values!506) i!548 (ValueCellFull!4322 v!373)) (size!11099 _values!506)))))

(assert (=> b!383359 (= lt!180024 (getCurrentListMapNoExtraKeys!872 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15561 () Bool)

(declare-fun tp!30764 () Bool)

(assert (=> mapNonEmpty!15561 (= mapRes!15561 (and tp!30764 e!232818))))

(declare-fun mapValue!15561 () ValueCell!4322)

(declare-fun mapKey!15561 () (_ BitVec 32))

(declare-fun mapRest!15561 () (Array (_ BitVec 32) ValueCell!4322))

(assert (=> mapNonEmpty!15561 (= (arr!10746 _values!506) (store mapRest!15561 mapKey!15561 mapValue!15561))))

(declare-fun b!383360 () Bool)

(assert (=> b!383360 (= e!232819 e!232823)))

(declare-fun res!218328 () Bool)

(assert (=> b!383360 (=> (not res!218328) (not e!232823))))

(assert (=> b!383360 (= res!218328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180029 mask!970))))

(assert (=> b!383360 (= lt!180029 (array!22554 (store (arr!10745 _keys!658) i!548 k0!778) (size!11098 _keys!658)))))

(declare-fun mapIsEmpty!15561 () Bool)

(assert (=> mapIsEmpty!15561 mapRes!15561))

(declare-fun b!383361 () Bool)

(declare-fun res!218324 () Bool)

(assert (=> b!383361 (=> (not res!218324) (not e!232819))))

(assert (=> b!383361 (= res!218324 (and (= (size!11099 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11098 _keys!658) (size!11099 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383362 () Bool)

(declare-fun res!218333 () Bool)

(assert (=> b!383362 (=> (not res!218333) (not e!232819))))

(assert (=> b!383362 (= res!218333 (or (= (select (arr!10745 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10745 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37542 res!218326) b!383361))

(assert (= (and b!383361 res!218324) b!383356))

(assert (= (and b!383356 res!218327) b!383352))

(assert (= (and b!383352 res!218325) b!383351))

(assert (= (and b!383351 res!218329) b!383358))

(assert (= (and b!383358 res!218323) b!383362))

(assert (= (and b!383362 res!218333) b!383354))

(assert (= (and b!383354 res!218332) b!383360))

(assert (= (and b!383360 res!218328) b!383355))

(assert (= (and b!383355 res!218330) b!383359))

(assert (= (and b!383359 (not res!218331)) b!383353))

(assert (= (and b!383357 condMapEmpty!15561) mapIsEmpty!15561))

(assert (= (and b!383357 (not condMapEmpty!15561)) mapNonEmpty!15561))

(get-info :version)

(assert (= (and mapNonEmpty!15561 ((_ is ValueCellFull!4322) mapValue!15561)) b!383349))

(assert (= (and b!383357 ((_ is ValueCellFull!4322) mapDefault!15561)) b!383350))

(assert (= start!37542 b!383357))

(declare-fun m!379631 () Bool)

(assert (=> b!383359 m!379631))

(declare-fun m!379633 () Bool)

(assert (=> b!383359 m!379633))

(declare-fun m!379635 () Bool)

(assert (=> b!383359 m!379635))

(declare-fun m!379637 () Bool)

(assert (=> b!383359 m!379637))

(declare-fun m!379639 () Bool)

(assert (=> b!383359 m!379639))

(declare-fun m!379641 () Bool)

(assert (=> b!383359 m!379641))

(declare-fun m!379643 () Bool)

(assert (=> b!383359 m!379643))

(declare-fun m!379645 () Bool)

(assert (=> b!383362 m!379645))

(declare-fun m!379647 () Bool)

(assert (=> b!383358 m!379647))

(declare-fun m!379649 () Bool)

(assert (=> b!383353 m!379649))

(declare-fun m!379651 () Bool)

(assert (=> b!383355 m!379651))

(declare-fun m!379653 () Bool)

(assert (=> b!383354 m!379653))

(declare-fun m!379655 () Bool)

(assert (=> mapNonEmpty!15561 m!379655))

(declare-fun m!379657 () Bool)

(assert (=> b!383360 m!379657))

(declare-fun m!379659 () Bool)

(assert (=> b!383360 m!379659))

(declare-fun m!379661 () Bool)

(assert (=> b!383352 m!379661))

(declare-fun m!379663 () Bool)

(assert (=> b!383356 m!379663))

(declare-fun m!379665 () Bool)

(assert (=> start!37542 m!379665))

(declare-fun m!379667 () Bool)

(assert (=> start!37542 m!379667))

(declare-fun m!379669 () Bool)

(assert (=> start!37542 m!379669))

(check-sat (not b!383360) (not b!383356) b_and!15899 (not b_next!8683) (not b!383359) (not start!37542) (not b!383353) (not b!383354) tp_is_empty!9331 (not b!383352) (not b!383355) (not mapNonEmpty!15561) (not b!383358))
(check-sat b_and!15899 (not b_next!8683))
