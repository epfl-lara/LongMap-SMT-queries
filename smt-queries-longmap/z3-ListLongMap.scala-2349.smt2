; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37542 () Bool)

(assert start!37542)

(declare-fun b_free!8683 () Bool)

(declare-fun b_next!8683 () Bool)

(assert (=> start!37542 (= b_free!8683 (not b_next!8683))))

(declare-fun tp!30765 () Bool)

(declare-fun b_and!15939 () Bool)

(assert (=> start!37542 (= tp!30765 b_and!15939)))

(declare-fun mapNonEmpty!15561 () Bool)

(declare-fun mapRes!15561 () Bool)

(declare-fun tp!30764 () Bool)

(declare-fun e!232965 () Bool)

(assert (=> mapNonEmpty!15561 (= mapRes!15561 (and tp!30764 e!232965))))

(declare-datatypes ((V!13547 0))(
  ( (V!13548 (val!4710 Int)) )
))
(declare-datatypes ((ValueCell!4322 0))(
  ( (ValueCellFull!4322 (v!6908 V!13547)) (EmptyCell!4322) )
))
(declare-datatypes ((array!22558 0))(
  ( (array!22559 (arr!10747 (Array (_ BitVec 32) ValueCell!4322)) (size!11099 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22558)

(declare-fun mapKey!15561 () (_ BitVec 32))

(declare-fun mapRest!15561 () (Array (_ BitVec 32) ValueCell!4322))

(declare-fun mapValue!15561 () ValueCell!4322)

(assert (=> mapNonEmpty!15561 (= (arr!10747 _values!506) (store mapRest!15561 mapKey!15561 mapValue!15561))))

(declare-fun b!383571 () Bool)

(declare-fun res!218451 () Bool)

(declare-fun e!232963 () Bool)

(assert (=> b!383571 (=> (not res!218451) (not e!232963))))

(declare-datatypes ((array!22560 0))(
  ( (array!22561 (arr!10748 (Array (_ BitVec 32) (_ BitVec 64))) (size!11100 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22560)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383571 (= res!218451 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383572 () Bool)

(declare-fun res!218452 () Bool)

(assert (=> b!383572 (=> (not res!218452) (not e!232963))))

(declare-datatypes ((List!6053 0))(
  ( (Nil!6050) (Cons!6049 (h!6905 (_ BitVec 64)) (t!11195 List!6053)) )
))
(declare-fun arrayNoDuplicates!0 (array!22560 (_ BitVec 32) List!6053) Bool)

(assert (=> b!383572 (= res!218452 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6050))))

(declare-fun b!383573 () Bool)

(declare-fun e!232962 () Bool)

(assert (=> b!383573 (= e!232962 true)))

(declare-datatypes ((tuple2!6216 0))(
  ( (tuple2!6217 (_1!3119 (_ BitVec 64)) (_2!3119 V!13547)) )
))
(declare-datatypes ((List!6054 0))(
  ( (Nil!6051) (Cons!6050 (h!6906 tuple2!6216) (t!11196 List!6054)) )
))
(declare-datatypes ((ListLongMap!5131 0))(
  ( (ListLongMap!5132 (toList!2581 List!6054)) )
))
(declare-fun lt!180283 () ListLongMap!5131)

(declare-fun lt!180277 () ListLongMap!5131)

(declare-fun lt!180282 () tuple2!6216)

(declare-fun +!973 (ListLongMap!5131 tuple2!6216) ListLongMap!5131)

(assert (=> b!383573 (= lt!180283 (+!973 lt!180277 lt!180282))))

(declare-fun lt!180279 () ListLongMap!5131)

(declare-fun lt!180285 () ListLongMap!5131)

(assert (=> b!383573 (= lt!180279 lt!180285)))

(declare-fun b!383574 () Bool)

(declare-fun tp_is_empty!9331 () Bool)

(assert (=> b!383574 (= e!232965 tp_is_empty!9331)))

(declare-fun b!383575 () Bool)

(declare-fun res!218450 () Bool)

(assert (=> b!383575 (=> (not res!218450) (not e!232963))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383575 (= res!218450 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11100 _keys!658))))))

(declare-fun b!383576 () Bool)

(declare-fun res!218459 () Bool)

(assert (=> b!383576 (=> (not res!218459) (not e!232963))))

(assert (=> b!383576 (= res!218459 (or (= (select (arr!10748 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10748 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383577 () Bool)

(declare-fun res!218458 () Bool)

(declare-fun e!232961 () Bool)

(assert (=> b!383577 (=> (not res!218458) (not e!232961))))

(declare-fun lt!180284 () array!22560)

(assert (=> b!383577 (= res!218458 (arrayNoDuplicates!0 lt!180284 #b00000000000000000000000000000000 Nil!6050))))

(declare-fun res!218457 () Bool)

(assert (=> start!37542 (=> (not res!218457) (not e!232963))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37542 (= res!218457 (validMask!0 mask!970))))

(assert (=> start!37542 e!232963))

(declare-fun e!232964 () Bool)

(declare-fun array_inv!7954 (array!22558) Bool)

(assert (=> start!37542 (and (array_inv!7954 _values!506) e!232964)))

(assert (=> start!37542 tp!30765))

(assert (=> start!37542 true))

(assert (=> start!37542 tp_is_empty!9331))

(declare-fun array_inv!7955 (array!22560) Bool)

(assert (=> start!37542 (array_inv!7955 _keys!658)))

(declare-fun b!383578 () Bool)

(declare-fun res!218453 () Bool)

(assert (=> b!383578 (=> (not res!218453) (not e!232963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22560 (_ BitVec 32)) Bool)

(assert (=> b!383578 (= res!218453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383579 () Bool)

(assert (=> b!383579 (= e!232961 (not e!232962))))

(declare-fun res!218454 () Bool)

(assert (=> b!383579 (=> res!218454 e!232962)))

(declare-fun lt!180278 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383579 (= res!218454 (or (and (not lt!180278) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180278) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180278)))))

(assert (=> b!383579 (= lt!180278 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13547)

(declare-fun minValue!472 () V!13547)

(declare-fun getCurrentListMap!2013 (array!22560 array!22558 (_ BitVec 32) (_ BitVec 32) V!13547 V!13547 (_ BitVec 32) Int) ListLongMap!5131)

(assert (=> b!383579 (= lt!180277 (getCurrentListMap!2013 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180280 () array!22558)

(assert (=> b!383579 (= lt!180279 (getCurrentListMap!2013 lt!180284 lt!180280 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180276 () ListLongMap!5131)

(assert (=> b!383579 (and (= lt!180285 lt!180276) (= lt!180276 lt!180285))))

(declare-fun lt!180286 () ListLongMap!5131)

(assert (=> b!383579 (= lt!180276 (+!973 lt!180286 lt!180282))))

(declare-fun v!373 () V!13547)

(assert (=> b!383579 (= lt!180282 (tuple2!6217 k0!778 v!373))))

(declare-datatypes ((Unit!11821 0))(
  ( (Unit!11822) )
))
(declare-fun lt!180281 () Unit!11821)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!200 (array!22560 array!22558 (_ BitVec 32) (_ BitVec 32) V!13547 V!13547 (_ BitVec 32) (_ BitVec 64) V!13547 (_ BitVec 32) Int) Unit!11821)

(assert (=> b!383579 (= lt!180281 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!200 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!860 (array!22560 array!22558 (_ BitVec 32) (_ BitVec 32) V!13547 V!13547 (_ BitVec 32) Int) ListLongMap!5131)

(assert (=> b!383579 (= lt!180285 (getCurrentListMapNoExtraKeys!860 lt!180284 lt!180280 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383579 (= lt!180280 (array!22559 (store (arr!10747 _values!506) i!548 (ValueCellFull!4322 v!373)) (size!11099 _values!506)))))

(assert (=> b!383579 (= lt!180286 (getCurrentListMapNoExtraKeys!860 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383580 () Bool)

(declare-fun e!232959 () Bool)

(assert (=> b!383580 (= e!232959 tp_is_empty!9331)))

(declare-fun b!383581 () Bool)

(assert (=> b!383581 (= e!232963 e!232961)))

(declare-fun res!218456 () Bool)

(assert (=> b!383581 (=> (not res!218456) (not e!232961))))

(assert (=> b!383581 (= res!218456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180284 mask!970))))

(assert (=> b!383581 (= lt!180284 (array!22561 (store (arr!10748 _keys!658) i!548 k0!778) (size!11100 _keys!658)))))

(declare-fun b!383582 () Bool)

(assert (=> b!383582 (= e!232964 (and e!232959 mapRes!15561))))

(declare-fun condMapEmpty!15561 () Bool)

(declare-fun mapDefault!15561 () ValueCell!4322)

(assert (=> b!383582 (= condMapEmpty!15561 (= (arr!10747 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4322)) mapDefault!15561)))))

(declare-fun b!383583 () Bool)

(declare-fun res!218449 () Bool)

(assert (=> b!383583 (=> (not res!218449) (not e!232963))))

(assert (=> b!383583 (= res!218449 (and (= (size!11099 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11100 _keys!658) (size!11099 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15561 () Bool)

(assert (=> mapIsEmpty!15561 mapRes!15561))

(declare-fun b!383584 () Bool)

(declare-fun res!218455 () Bool)

(assert (=> b!383584 (=> (not res!218455) (not e!232963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383584 (= res!218455 (validKeyInArray!0 k0!778))))

(assert (= (and start!37542 res!218457) b!383583))

(assert (= (and b!383583 res!218449) b!383578))

(assert (= (and b!383578 res!218453) b!383572))

(assert (= (and b!383572 res!218452) b!383575))

(assert (= (and b!383575 res!218450) b!383584))

(assert (= (and b!383584 res!218455) b!383576))

(assert (= (and b!383576 res!218459) b!383571))

(assert (= (and b!383571 res!218451) b!383581))

(assert (= (and b!383581 res!218456) b!383577))

(assert (= (and b!383577 res!218458) b!383579))

(assert (= (and b!383579 (not res!218454)) b!383573))

(assert (= (and b!383582 condMapEmpty!15561) mapIsEmpty!15561))

(assert (= (and b!383582 (not condMapEmpty!15561)) mapNonEmpty!15561))

(get-info :version)

(assert (= (and mapNonEmpty!15561 ((_ is ValueCellFull!4322) mapValue!15561)) b!383574))

(assert (= (and b!383582 ((_ is ValueCellFull!4322) mapDefault!15561)) b!383580))

(assert (= start!37542 b!383582))

(declare-fun m!380585 () Bool)

(assert (=> b!383572 m!380585))

(declare-fun m!380587 () Bool)

(assert (=> b!383578 m!380587))

(declare-fun m!380589 () Bool)

(assert (=> b!383584 m!380589))

(declare-fun m!380591 () Bool)

(assert (=> b!383576 m!380591))

(declare-fun m!380593 () Bool)

(assert (=> b!383579 m!380593))

(declare-fun m!380595 () Bool)

(assert (=> b!383579 m!380595))

(declare-fun m!380597 () Bool)

(assert (=> b!383579 m!380597))

(declare-fun m!380599 () Bool)

(assert (=> b!383579 m!380599))

(declare-fun m!380601 () Bool)

(assert (=> b!383579 m!380601))

(declare-fun m!380603 () Bool)

(assert (=> b!383579 m!380603))

(declare-fun m!380605 () Bool)

(assert (=> b!383579 m!380605))

(declare-fun m!380607 () Bool)

(assert (=> mapNonEmpty!15561 m!380607))

(declare-fun m!380609 () Bool)

(assert (=> start!37542 m!380609))

(declare-fun m!380611 () Bool)

(assert (=> start!37542 m!380611))

(declare-fun m!380613 () Bool)

(assert (=> start!37542 m!380613))

(declare-fun m!380615 () Bool)

(assert (=> b!383581 m!380615))

(declare-fun m!380617 () Bool)

(assert (=> b!383581 m!380617))

(declare-fun m!380619 () Bool)

(assert (=> b!383573 m!380619))

(declare-fun m!380621 () Bool)

(assert (=> b!383577 m!380621))

(declare-fun m!380623 () Bool)

(assert (=> b!383571 m!380623))

(check-sat (not b!383571) (not b!383577) (not b!383572) (not b_next!8683) tp_is_empty!9331 (not b!383584) (not mapNonEmpty!15561) (not b!383581) (not start!37542) (not b!383573) (not b!383578) b_and!15939 (not b!383579))
(check-sat b_and!15939 (not b_next!8683))
