; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37482 () Bool)

(assert start!37482)

(declare-fun b_free!8623 () Bool)

(declare-fun b_next!8623 () Bool)

(assert (=> start!37482 (= b_free!8623 (not b_next!8623))))

(declare-fun tp!30584 () Bool)

(declare-fun b_and!15839 () Bool)

(assert (=> start!37482 (= tp!30584 b_and!15839)))

(declare-fun b!382089 () Bool)

(declare-fun res!217334 () Bool)

(declare-fun e!232189 () Bool)

(assert (=> b!382089 (=> (not res!217334) (not e!232189))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13467 0))(
  ( (V!13468 (val!4680 Int)) )
))
(declare-datatypes ((ValueCell!4292 0))(
  ( (ValueCellFull!4292 (v!6871 V!13467)) (EmptyCell!4292) )
))
(declare-datatypes ((array!22437 0))(
  ( (array!22438 (arr!10687 (Array (_ BitVec 32) ValueCell!4292)) (size!11040 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22437)

(declare-datatypes ((array!22439 0))(
  ( (array!22440 (arr!10688 (Array (_ BitVec 32) (_ BitVec 64))) (size!11041 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22439)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382089 (= res!217334 (and (= (size!11040 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11041 _keys!658) (size!11040 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382090 () Bool)

(declare-fun e!232191 () Bool)

(declare-fun tp_is_empty!9271 () Bool)

(assert (=> b!382090 (= e!232191 tp_is_empty!9271)))

(declare-fun b!382091 () Bool)

(declare-fun e!232193 () Bool)

(assert (=> b!382091 (= e!232193 true)))

(declare-datatypes ((tuple2!6266 0))(
  ( (tuple2!6267 (_1!3144 (_ BitVec 64)) (_2!3144 V!13467)) )
))
(declare-datatypes ((List!6092 0))(
  ( (Nil!6089) (Cons!6088 (h!6944 tuple2!6266) (t!11233 List!6092)) )
))
(declare-datatypes ((ListLongMap!5169 0))(
  ( (ListLongMap!5170 (toList!2600 List!6092)) )
))
(declare-fun lt!179145 () ListLongMap!5169)

(declare-fun lt!179140 () ListLongMap!5169)

(assert (=> b!382091 (= lt!179145 lt!179140)))

(declare-fun b!382092 () Bool)

(declare-fun res!217343 () Bool)

(assert (=> b!382092 (=> (not res!217343) (not e!232189))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382092 (= res!217343 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11041 _keys!658))))))

(declare-fun b!382093 () Bool)

(declare-fun e!232188 () Bool)

(assert (=> b!382093 (= e!232188 (not e!232193))))

(declare-fun res!217341 () Bool)

(assert (=> b!382093 (=> res!217341 e!232193)))

(declare-fun lt!179139 () Bool)

(assert (=> b!382093 (= res!217341 (or (and (not lt!179139) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179139) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179139)))))

(assert (=> b!382093 (= lt!179139 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179143 () ListLongMap!5169)

(declare-fun zeroValue!472 () V!13467)

(declare-fun minValue!472 () V!13467)

(declare-fun getCurrentListMap!1986 (array!22439 array!22437 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) Int) ListLongMap!5169)

(assert (=> b!382093 (= lt!179143 (getCurrentListMap!1986 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179138 () array!22439)

(declare-fun lt!179144 () array!22437)

(assert (=> b!382093 (= lt!179145 (getCurrentListMap!1986 lt!179138 lt!179144 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179141 () ListLongMap!5169)

(assert (=> b!382093 (and (= lt!179140 lt!179141) (= lt!179141 lt!179140))))

(declare-fun v!373 () V!13467)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!179137 () ListLongMap!5169)

(declare-fun +!960 (ListLongMap!5169 tuple2!6266) ListLongMap!5169)

(assert (=> b!382093 (= lt!179141 (+!960 lt!179137 (tuple2!6267 k0!778 v!373)))))

(declare-datatypes ((Unit!11778 0))(
  ( (Unit!11779) )
))
(declare-fun lt!179142 () Unit!11778)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!179 (array!22439 array!22437 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) (_ BitVec 64) V!13467 (_ BitVec 32) Int) Unit!11778)

(assert (=> b!382093 (= lt!179142 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!179 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!851 (array!22439 array!22437 (_ BitVec 32) (_ BitVec 32) V!13467 V!13467 (_ BitVec 32) Int) ListLongMap!5169)

(assert (=> b!382093 (= lt!179140 (getCurrentListMapNoExtraKeys!851 lt!179138 lt!179144 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382093 (= lt!179144 (array!22438 (store (arr!10687 _values!506) i!548 (ValueCellFull!4292 v!373)) (size!11040 _values!506)))))

(assert (=> b!382093 (= lt!179137 (getCurrentListMapNoExtraKeys!851 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382094 () Bool)

(declare-fun res!217336 () Bool)

(assert (=> b!382094 (=> (not res!217336) (not e!232189))))

(assert (=> b!382094 (= res!217336 (or (= (select (arr!10688 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10688 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382095 () Bool)

(declare-fun res!217342 () Bool)

(assert (=> b!382095 (=> (not res!217342) (not e!232189))))

(declare-datatypes ((List!6093 0))(
  ( (Nil!6090) (Cons!6089 (h!6945 (_ BitVec 64)) (t!11234 List!6093)) )
))
(declare-fun arrayNoDuplicates!0 (array!22439 (_ BitVec 32) List!6093) Bool)

(assert (=> b!382095 (= res!217342 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6090))))

(declare-fun b!382096 () Bool)

(declare-fun res!217339 () Bool)

(assert (=> b!382096 (=> (not res!217339) (not e!232189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382096 (= res!217339 (validKeyInArray!0 k0!778))))

(declare-fun res!217335 () Bool)

(assert (=> start!37482 (=> (not res!217335) (not e!232189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37482 (= res!217335 (validMask!0 mask!970))))

(assert (=> start!37482 e!232189))

(declare-fun e!232192 () Bool)

(declare-fun array_inv!7870 (array!22437) Bool)

(assert (=> start!37482 (and (array_inv!7870 _values!506) e!232192)))

(assert (=> start!37482 tp!30584))

(assert (=> start!37482 true))

(assert (=> start!37482 tp_is_empty!9271))

(declare-fun array_inv!7871 (array!22439) Bool)

(assert (=> start!37482 (array_inv!7871 _keys!658)))

(declare-fun b!382097 () Bool)

(declare-fun e!232190 () Bool)

(declare-fun mapRes!15471 () Bool)

(assert (=> b!382097 (= e!232192 (and e!232190 mapRes!15471))))

(declare-fun condMapEmpty!15471 () Bool)

(declare-fun mapDefault!15471 () ValueCell!4292)

(assert (=> b!382097 (= condMapEmpty!15471 (= (arr!10687 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4292)) mapDefault!15471)))))

(declare-fun b!382098 () Bool)

(declare-fun res!217337 () Bool)

(assert (=> b!382098 (=> (not res!217337) (not e!232189))))

(declare-fun arrayContainsKey!0 (array!22439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382098 (= res!217337 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15471 () Bool)

(declare-fun tp!30585 () Bool)

(assert (=> mapNonEmpty!15471 (= mapRes!15471 (and tp!30585 e!232191))))

(declare-fun mapKey!15471 () (_ BitVec 32))

(declare-fun mapValue!15471 () ValueCell!4292)

(declare-fun mapRest!15471 () (Array (_ BitVec 32) ValueCell!4292))

(assert (=> mapNonEmpty!15471 (= (arr!10687 _values!506) (store mapRest!15471 mapKey!15471 mapValue!15471))))

(declare-fun b!382099 () Bool)

(assert (=> b!382099 (= e!232190 tp_is_empty!9271)))

(declare-fun b!382100 () Bool)

(declare-fun res!217340 () Bool)

(assert (=> b!382100 (=> (not res!217340) (not e!232188))))

(assert (=> b!382100 (= res!217340 (arrayNoDuplicates!0 lt!179138 #b00000000000000000000000000000000 Nil!6090))))

(declare-fun b!382101 () Bool)

(declare-fun res!217338 () Bool)

(assert (=> b!382101 (=> (not res!217338) (not e!232189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22439 (_ BitVec 32)) Bool)

(assert (=> b!382101 (= res!217338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382102 () Bool)

(assert (=> b!382102 (= e!232189 e!232188)))

(declare-fun res!217333 () Bool)

(assert (=> b!382102 (=> (not res!217333) (not e!232188))))

(assert (=> b!382102 (= res!217333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179138 mask!970))))

(assert (=> b!382102 (= lt!179138 (array!22440 (store (arr!10688 _keys!658) i!548 k0!778) (size!11041 _keys!658)))))

(declare-fun mapIsEmpty!15471 () Bool)

(assert (=> mapIsEmpty!15471 mapRes!15471))

(assert (= (and start!37482 res!217335) b!382089))

(assert (= (and b!382089 res!217334) b!382101))

(assert (= (and b!382101 res!217338) b!382095))

(assert (= (and b!382095 res!217342) b!382092))

(assert (= (and b!382092 res!217343) b!382096))

(assert (= (and b!382096 res!217339) b!382094))

(assert (= (and b!382094 res!217336) b!382098))

(assert (= (and b!382098 res!217337) b!382102))

(assert (= (and b!382102 res!217333) b!382100))

(assert (= (and b!382100 res!217340) b!382093))

(assert (= (and b!382093 (not res!217341)) b!382091))

(assert (= (and b!382097 condMapEmpty!15471) mapIsEmpty!15471))

(assert (= (and b!382097 (not condMapEmpty!15471)) mapNonEmpty!15471))

(get-info :version)

(assert (= (and mapNonEmpty!15471 ((_ is ValueCellFull!4292) mapValue!15471)) b!382090))

(assert (= (and b!382097 ((_ is ValueCellFull!4292) mapDefault!15471)) b!382099))

(assert (= start!37482 b!382097))

(declare-fun m!378467 () Bool)

(assert (=> b!382102 m!378467))

(declare-fun m!378469 () Bool)

(assert (=> b!382102 m!378469))

(declare-fun m!378471 () Bool)

(assert (=> b!382096 m!378471))

(declare-fun m!378473 () Bool)

(assert (=> b!382095 m!378473))

(declare-fun m!378475 () Bool)

(assert (=> b!382100 m!378475))

(declare-fun m!378477 () Bool)

(assert (=> mapNonEmpty!15471 m!378477))

(declare-fun m!378479 () Bool)

(assert (=> start!37482 m!378479))

(declare-fun m!378481 () Bool)

(assert (=> start!37482 m!378481))

(declare-fun m!378483 () Bool)

(assert (=> start!37482 m!378483))

(declare-fun m!378485 () Bool)

(assert (=> b!382101 m!378485))

(declare-fun m!378487 () Bool)

(assert (=> b!382093 m!378487))

(declare-fun m!378489 () Bool)

(assert (=> b!382093 m!378489))

(declare-fun m!378491 () Bool)

(assert (=> b!382093 m!378491))

(declare-fun m!378493 () Bool)

(assert (=> b!382093 m!378493))

(declare-fun m!378495 () Bool)

(assert (=> b!382093 m!378495))

(declare-fun m!378497 () Bool)

(assert (=> b!382093 m!378497))

(declare-fun m!378499 () Bool)

(assert (=> b!382093 m!378499))

(declare-fun m!378501 () Bool)

(assert (=> b!382094 m!378501))

(declare-fun m!378503 () Bool)

(assert (=> b!382098 m!378503))

(check-sat (not b!382096) (not start!37482) (not b!382102) tp_is_empty!9271 (not b!382101) b_and!15839 (not b!382100) (not b!382098) (not b!382095) (not mapNonEmpty!15471) (not b!382093) (not b_next!8623))
(check-sat b_and!15839 (not b_next!8623))
