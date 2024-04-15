; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37584 () Bool)

(assert start!37584)

(declare-fun b_free!8725 () Bool)

(declare-fun b_next!8725 () Bool)

(assert (=> start!37584 (= b_free!8725 (not b_next!8725))))

(declare-fun tp!30891 () Bool)

(declare-fun b_and!15941 () Bool)

(assert (=> start!37584 (= tp!30891 b_and!15941)))

(declare-fun b!384240 () Bool)

(declare-fun res!219031 () Bool)

(declare-fun e!233271 () Bool)

(assert (=> b!384240 (=> (not res!219031) (not e!233271))))

(declare-datatypes ((array!22635 0))(
  ( (array!22636 (arr!10786 (Array (_ BitVec 32) (_ BitVec 64))) (size!11139 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22635)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22635 (_ BitVec 32)) Bool)

(assert (=> b!384240 (= res!219031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!219026 () Bool)

(assert (=> start!37584 (=> (not res!219026) (not e!233271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37584 (= res!219026 (validMask!0 mask!970))))

(assert (=> start!37584 e!233271))

(declare-datatypes ((V!13603 0))(
  ( (V!13604 (val!4731 Int)) )
))
(declare-datatypes ((ValueCell!4343 0))(
  ( (ValueCellFull!4343 (v!6922 V!13603)) (EmptyCell!4343) )
))
(declare-datatypes ((array!22637 0))(
  ( (array!22638 (arr!10787 (Array (_ BitVec 32) ValueCell!4343)) (size!11140 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22637)

(declare-fun e!233268 () Bool)

(declare-fun array_inv!7940 (array!22637) Bool)

(assert (=> start!37584 (and (array_inv!7940 _values!506) e!233268)))

(assert (=> start!37584 tp!30891))

(assert (=> start!37584 true))

(declare-fun tp_is_empty!9373 () Bool)

(assert (=> start!37584 tp_is_empty!9373))

(declare-fun array_inv!7941 (array!22635) Bool)

(assert (=> start!37584 (array_inv!7941 _keys!658)))

(declare-fun b!384241 () Bool)

(declare-fun res!219030 () Bool)

(declare-fun e!233269 () Bool)

(assert (=> b!384241 (=> (not res!219030) (not e!233269))))

(declare-fun lt!180713 () array!22635)

(declare-datatypes ((List!6174 0))(
  ( (Nil!6171) (Cons!6170 (h!7026 (_ BitVec 64)) (t!11315 List!6174)) )
))
(declare-fun arrayNoDuplicates!0 (array!22635 (_ BitVec 32) List!6174) Bool)

(assert (=> b!384241 (= res!219030 (arrayNoDuplicates!0 lt!180713 #b00000000000000000000000000000000 Nil!6171))))

(declare-fun b!384242 () Bool)

(declare-fun e!233270 () Bool)

(assert (=> b!384242 (= e!233270 tp_is_empty!9373)))

(declare-fun b!384243 () Bool)

(declare-fun res!219035 () Bool)

(assert (=> b!384243 (=> (not res!219035) (not e!233271))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384243 (= res!219035 (or (= (select (arr!10786 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10786 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384244 () Bool)

(declare-fun res!219033 () Bool)

(assert (=> b!384244 (=> (not res!219033) (not e!233271))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384244 (= res!219033 (validKeyInArray!0 k0!778))))

(declare-fun b!384245 () Bool)

(declare-fun e!233273 () Bool)

(assert (=> b!384245 (= e!233273 tp_is_empty!9373)))

(declare-fun b!384246 () Bool)

(assert (=> b!384246 (= e!233271 e!233269)))

(declare-fun res!219034 () Bool)

(assert (=> b!384246 (=> (not res!219034) (not e!233269))))

(assert (=> b!384246 (= res!219034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180713 mask!970))))

(assert (=> b!384246 (= lt!180713 (array!22636 (store (arr!10786 _keys!658) i!548 k0!778) (size!11139 _keys!658)))))

(declare-fun b!384247 () Bool)

(declare-fun mapRes!15624 () Bool)

(assert (=> b!384247 (= e!233268 (and e!233273 mapRes!15624))))

(declare-fun condMapEmpty!15624 () Bool)

(declare-fun mapDefault!15624 () ValueCell!4343)

(assert (=> b!384247 (= condMapEmpty!15624 (= (arr!10787 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4343)) mapDefault!15624)))))

(declare-fun b!384248 () Bool)

(declare-fun e!233267 () Bool)

(assert (=> b!384248 (= e!233267 true)))

(declare-datatypes ((tuple2!6350 0))(
  ( (tuple2!6351 (_1!3186 (_ BitVec 64)) (_2!3186 V!13603)) )
))
(declare-datatypes ((List!6175 0))(
  ( (Nil!6172) (Cons!6171 (h!7027 tuple2!6350) (t!11316 List!6175)) )
))
(declare-datatypes ((ListLongMap!5253 0))(
  ( (ListLongMap!5254 (toList!2642 List!6175)) )
))
(declare-fun lt!180711 () ListLongMap!5253)

(declare-fun lt!180708 () ListLongMap!5253)

(declare-fun lt!180710 () tuple2!6350)

(declare-fun +!999 (ListLongMap!5253 tuple2!6350) ListLongMap!5253)

(assert (=> b!384248 (= lt!180711 (+!999 lt!180708 lt!180710))))

(declare-fun lt!180715 () ListLongMap!5253)

(declare-fun lt!180709 () ListLongMap!5253)

(assert (=> b!384248 (= lt!180715 lt!180709)))

(declare-fun b!384249 () Bool)

(declare-fun res!219025 () Bool)

(assert (=> b!384249 (=> (not res!219025) (not e!233271))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384249 (= res!219025 (and (= (size!11140 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11139 _keys!658) (size!11140 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384250 () Bool)

(declare-fun res!219029 () Bool)

(assert (=> b!384250 (=> (not res!219029) (not e!233271))))

(assert (=> b!384250 (= res!219029 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6171))))

(declare-fun b!384251 () Bool)

(declare-fun res!219028 () Bool)

(assert (=> b!384251 (=> (not res!219028) (not e!233271))))

(assert (=> b!384251 (= res!219028 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11139 _keys!658))))))

(declare-fun mapIsEmpty!15624 () Bool)

(assert (=> mapIsEmpty!15624 mapRes!15624))

(declare-fun b!384252 () Bool)

(assert (=> b!384252 (= e!233269 (not e!233267))))

(declare-fun res!219032 () Bool)

(assert (=> b!384252 (=> res!219032 e!233267)))

(declare-fun lt!180716 () Bool)

(assert (=> b!384252 (= res!219032 (or (and (not lt!180716) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180716) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180716)))))

(assert (=> b!384252 (= lt!180716 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13603)

(declare-fun minValue!472 () V!13603)

(declare-fun getCurrentListMap!2019 (array!22635 array!22637 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) Int) ListLongMap!5253)

(assert (=> b!384252 (= lt!180708 (getCurrentListMap!2019 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180717 () array!22637)

(assert (=> b!384252 (= lt!180715 (getCurrentListMap!2019 lt!180713 lt!180717 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180714 () ListLongMap!5253)

(assert (=> b!384252 (and (= lt!180709 lt!180714) (= lt!180714 lt!180709))))

(declare-fun lt!180712 () ListLongMap!5253)

(assert (=> b!384252 (= lt!180714 (+!999 lt!180712 lt!180710))))

(declare-fun v!373 () V!13603)

(assert (=> b!384252 (= lt!180710 (tuple2!6351 k0!778 v!373))))

(declare-datatypes ((Unit!11844 0))(
  ( (Unit!11845) )
))
(declare-fun lt!180707 () Unit!11844)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!212 (array!22635 array!22637 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) (_ BitVec 64) V!13603 (_ BitVec 32) Int) Unit!11844)

(assert (=> b!384252 (= lt!180707 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!212 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!884 (array!22635 array!22637 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) Int) ListLongMap!5253)

(assert (=> b!384252 (= lt!180709 (getCurrentListMapNoExtraKeys!884 lt!180713 lt!180717 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384252 (= lt!180717 (array!22638 (store (arr!10787 _values!506) i!548 (ValueCellFull!4343 v!373)) (size!11140 _values!506)))))

(assert (=> b!384252 (= lt!180712 (getCurrentListMapNoExtraKeys!884 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384253 () Bool)

(declare-fun res!219027 () Bool)

(assert (=> b!384253 (=> (not res!219027) (not e!233271))))

(declare-fun arrayContainsKey!0 (array!22635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384253 (= res!219027 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15624 () Bool)

(declare-fun tp!30890 () Bool)

(assert (=> mapNonEmpty!15624 (= mapRes!15624 (and tp!30890 e!233270))))

(declare-fun mapValue!15624 () ValueCell!4343)

(declare-fun mapRest!15624 () (Array (_ BitVec 32) ValueCell!4343))

(declare-fun mapKey!15624 () (_ BitVec 32))

(assert (=> mapNonEmpty!15624 (= (arr!10787 _values!506) (store mapRest!15624 mapKey!15624 mapValue!15624))))

(assert (= (and start!37584 res!219026) b!384249))

(assert (= (and b!384249 res!219025) b!384240))

(assert (= (and b!384240 res!219031) b!384250))

(assert (= (and b!384250 res!219029) b!384251))

(assert (= (and b!384251 res!219028) b!384244))

(assert (= (and b!384244 res!219033) b!384243))

(assert (= (and b!384243 res!219035) b!384253))

(assert (= (and b!384253 res!219027) b!384246))

(assert (= (and b!384246 res!219034) b!384241))

(assert (= (and b!384241 res!219030) b!384252))

(assert (= (and b!384252 (not res!219032)) b!384248))

(assert (= (and b!384247 condMapEmpty!15624) mapIsEmpty!15624))

(assert (= (and b!384247 (not condMapEmpty!15624)) mapNonEmpty!15624))

(get-info :version)

(assert (= (and mapNonEmpty!15624 ((_ is ValueCellFull!4343) mapValue!15624)) b!384242))

(assert (= (and b!384247 ((_ is ValueCellFull!4343) mapDefault!15624)) b!384245))

(assert (= start!37584 b!384247))

(declare-fun m!380471 () Bool)

(assert (=> b!384250 m!380471))

(declare-fun m!380473 () Bool)

(assert (=> b!384244 m!380473))

(declare-fun m!380475 () Bool)

(assert (=> b!384252 m!380475))

(declare-fun m!380477 () Bool)

(assert (=> b!384252 m!380477))

(declare-fun m!380479 () Bool)

(assert (=> b!384252 m!380479))

(declare-fun m!380481 () Bool)

(assert (=> b!384252 m!380481))

(declare-fun m!380483 () Bool)

(assert (=> b!384252 m!380483))

(declare-fun m!380485 () Bool)

(assert (=> b!384252 m!380485))

(declare-fun m!380487 () Bool)

(assert (=> b!384252 m!380487))

(declare-fun m!380489 () Bool)

(assert (=> b!384240 m!380489))

(declare-fun m!380491 () Bool)

(assert (=> b!384253 m!380491))

(declare-fun m!380493 () Bool)

(assert (=> b!384243 m!380493))

(declare-fun m!380495 () Bool)

(assert (=> start!37584 m!380495))

(declare-fun m!380497 () Bool)

(assert (=> start!37584 m!380497))

(declare-fun m!380499 () Bool)

(assert (=> start!37584 m!380499))

(declare-fun m!380501 () Bool)

(assert (=> b!384246 m!380501))

(declare-fun m!380503 () Bool)

(assert (=> b!384246 m!380503))

(declare-fun m!380505 () Bool)

(assert (=> b!384241 m!380505))

(declare-fun m!380507 () Bool)

(assert (=> b!384248 m!380507))

(declare-fun m!380509 () Bool)

(assert (=> mapNonEmpty!15624 m!380509))

(check-sat (not b!384248) (not start!37584) (not b!384241) (not b!384246) (not b!384253) (not b!384244) (not b!384240) b_and!15941 tp_is_empty!9373 (not b!384252) (not b_next!8725) (not b!384250) (not mapNonEmpty!15624))
(check-sat b_and!15941 (not b_next!8725))
