; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37584 () Bool)

(assert start!37584)

(declare-fun b_free!8725 () Bool)

(declare-fun b_next!8725 () Bool)

(assert (=> start!37584 (= b_free!8725 (not b_next!8725))))

(declare-fun tp!30890 () Bool)

(declare-fun b_and!15981 () Bool)

(assert (=> start!37584 (= tp!30890 b_and!15981)))

(declare-fun b!384462 () Bool)

(declare-fun e!233415 () Bool)

(declare-fun tp_is_empty!9373 () Bool)

(assert (=> b!384462 (= e!233415 tp_is_empty!9373)))

(declare-fun mapIsEmpty!15624 () Bool)

(declare-fun mapRes!15624 () Bool)

(assert (=> mapIsEmpty!15624 mapRes!15624))

(declare-fun b!384463 () Bool)

(declare-fun e!233410 () Bool)

(declare-fun e!233412 () Bool)

(assert (=> b!384463 (= e!233410 (not e!233412))))

(declare-fun res!219153 () Bool)

(assert (=> b!384463 (=> res!219153 e!233412)))

(declare-fun lt!180961 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384463 (= res!219153 (or (and (not lt!180961) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180961) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180961)))))

(assert (=> b!384463 (= lt!180961 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13603 0))(
  ( (V!13604 (val!4731 Int)) )
))
(declare-datatypes ((ValueCell!4343 0))(
  ( (ValueCellFull!4343 (v!6929 V!13603)) (EmptyCell!4343) )
))
(declare-datatypes ((array!22640 0))(
  ( (array!22641 (arr!10788 (Array (_ BitVec 32) ValueCell!4343)) (size!11140 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22640)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13603)

(declare-datatypes ((array!22642 0))(
  ( (array!22643 (arr!10789 (Array (_ BitVec 32) (_ BitVec 64))) (size!11141 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22642)

(declare-datatypes ((tuple2!6244 0))(
  ( (tuple2!6245 (_1!3133 (_ BitVec 64)) (_2!3133 V!13603)) )
))
(declare-datatypes ((List!6080 0))(
  ( (Nil!6077) (Cons!6076 (h!6932 tuple2!6244) (t!11222 List!6080)) )
))
(declare-datatypes ((ListLongMap!5159 0))(
  ( (ListLongMap!5160 (toList!2595 List!6080)) )
))
(declare-fun lt!180966 () ListLongMap!5159)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13603)

(declare-fun getCurrentListMap!2025 (array!22642 array!22640 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) Int) ListLongMap!5159)

(assert (=> b!384463 (= lt!180966 (getCurrentListMap!2025 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180962 () ListLongMap!5159)

(declare-fun lt!180969 () array!22642)

(declare-fun lt!180970 () array!22640)

(assert (=> b!384463 (= lt!180962 (getCurrentListMap!2025 lt!180969 lt!180970 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180967 () ListLongMap!5159)

(declare-fun lt!180964 () ListLongMap!5159)

(assert (=> b!384463 (and (= lt!180967 lt!180964) (= lt!180964 lt!180967))))

(declare-fun lt!180968 () ListLongMap!5159)

(declare-fun lt!180965 () tuple2!6244)

(declare-fun +!987 (ListLongMap!5159 tuple2!6244) ListLongMap!5159)

(assert (=> b!384463 (= lt!180964 (+!987 lt!180968 lt!180965))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13603)

(assert (=> b!384463 (= lt!180965 (tuple2!6245 k0!778 v!373))))

(declare-datatypes ((Unit!11845 0))(
  ( (Unit!11846) )
))
(declare-fun lt!180963 () Unit!11845)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!212 (array!22642 array!22640 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) (_ BitVec 64) V!13603 (_ BitVec 32) Int) Unit!11845)

(assert (=> b!384463 (= lt!180963 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!212 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!872 (array!22642 array!22640 (_ BitVec 32) (_ BitVec 32) V!13603 V!13603 (_ BitVec 32) Int) ListLongMap!5159)

(assert (=> b!384463 (= lt!180967 (getCurrentListMapNoExtraKeys!872 lt!180969 lt!180970 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384463 (= lt!180970 (array!22641 (store (arr!10788 _values!506) i!548 (ValueCellFull!4343 v!373)) (size!11140 _values!506)))))

(assert (=> b!384463 (= lt!180968 (getCurrentListMapNoExtraKeys!872 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384464 () Bool)

(declare-fun res!219161 () Bool)

(declare-fun e!233413 () Bool)

(assert (=> b!384464 (=> (not res!219161) (not e!233413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22642 (_ BitVec 32)) Bool)

(assert (=> b!384464 (= res!219161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384465 () Bool)

(declare-fun e!233411 () Bool)

(declare-fun e!233409 () Bool)

(assert (=> b!384465 (= e!233411 (and e!233409 mapRes!15624))))

(declare-fun condMapEmpty!15624 () Bool)

(declare-fun mapDefault!15624 () ValueCell!4343)

(assert (=> b!384465 (= condMapEmpty!15624 (= (arr!10788 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4343)) mapDefault!15624)))))

(declare-fun b!384466 () Bool)

(declare-fun res!219154 () Bool)

(assert (=> b!384466 (=> (not res!219154) (not e!233413))))

(declare-fun arrayContainsKey!0 (array!22642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384466 (= res!219154 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384467 () Bool)

(declare-fun res!219151 () Bool)

(assert (=> b!384467 (=> (not res!219151) (not e!233413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384467 (= res!219151 (validKeyInArray!0 k0!778))))

(declare-fun b!384468 () Bool)

(assert (=> b!384468 (= e!233409 tp_is_empty!9373)))

(declare-fun b!384469 () Bool)

(assert (=> b!384469 (= e!233412 true)))

(declare-fun lt!180960 () ListLongMap!5159)

(assert (=> b!384469 (= lt!180960 (+!987 lt!180966 lt!180965))))

(assert (=> b!384469 (= lt!180962 lt!180967)))

(declare-fun b!384470 () Bool)

(declare-fun res!219158 () Bool)

(assert (=> b!384470 (=> (not res!219158) (not e!233413))))

(assert (=> b!384470 (= res!219158 (and (= (size!11140 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11141 _keys!658) (size!11140 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!219160 () Bool)

(assert (=> start!37584 (=> (not res!219160) (not e!233413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37584 (= res!219160 (validMask!0 mask!970))))

(assert (=> start!37584 e!233413))

(declare-fun array_inv!7982 (array!22640) Bool)

(assert (=> start!37584 (and (array_inv!7982 _values!506) e!233411)))

(assert (=> start!37584 tp!30890))

(assert (=> start!37584 true))

(assert (=> start!37584 tp_is_empty!9373))

(declare-fun array_inv!7983 (array!22642) Bool)

(assert (=> start!37584 (array_inv!7983 _keys!658)))

(declare-fun b!384471 () Bool)

(assert (=> b!384471 (= e!233413 e!233410)))

(declare-fun res!219157 () Bool)

(assert (=> b!384471 (=> (not res!219157) (not e!233410))))

(assert (=> b!384471 (= res!219157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180969 mask!970))))

(assert (=> b!384471 (= lt!180969 (array!22643 (store (arr!10789 _keys!658) i!548 k0!778) (size!11141 _keys!658)))))

(declare-fun b!384472 () Bool)

(declare-fun res!219159 () Bool)

(assert (=> b!384472 (=> (not res!219159) (not e!233413))))

(declare-datatypes ((List!6081 0))(
  ( (Nil!6078) (Cons!6077 (h!6933 (_ BitVec 64)) (t!11223 List!6081)) )
))
(declare-fun arrayNoDuplicates!0 (array!22642 (_ BitVec 32) List!6081) Bool)

(assert (=> b!384472 (= res!219159 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6078))))

(declare-fun b!384473 () Bool)

(declare-fun res!219152 () Bool)

(assert (=> b!384473 (=> (not res!219152) (not e!233410))))

(assert (=> b!384473 (= res!219152 (arrayNoDuplicates!0 lt!180969 #b00000000000000000000000000000000 Nil!6078))))

(declare-fun b!384474 () Bool)

(declare-fun res!219156 () Bool)

(assert (=> b!384474 (=> (not res!219156) (not e!233413))))

(assert (=> b!384474 (= res!219156 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11141 _keys!658))))))

(declare-fun b!384475 () Bool)

(declare-fun res!219155 () Bool)

(assert (=> b!384475 (=> (not res!219155) (not e!233413))))

(assert (=> b!384475 (= res!219155 (or (= (select (arr!10789 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10789 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15624 () Bool)

(declare-fun tp!30891 () Bool)

(assert (=> mapNonEmpty!15624 (= mapRes!15624 (and tp!30891 e!233415))))

(declare-fun mapRest!15624 () (Array (_ BitVec 32) ValueCell!4343))

(declare-fun mapValue!15624 () ValueCell!4343)

(declare-fun mapKey!15624 () (_ BitVec 32))

(assert (=> mapNonEmpty!15624 (= (arr!10788 _values!506) (store mapRest!15624 mapKey!15624 mapValue!15624))))

(assert (= (and start!37584 res!219160) b!384470))

(assert (= (and b!384470 res!219158) b!384464))

(assert (= (and b!384464 res!219161) b!384472))

(assert (= (and b!384472 res!219159) b!384474))

(assert (= (and b!384474 res!219156) b!384467))

(assert (= (and b!384467 res!219151) b!384475))

(assert (= (and b!384475 res!219155) b!384466))

(assert (= (and b!384466 res!219154) b!384471))

(assert (= (and b!384471 res!219157) b!384473))

(assert (= (and b!384473 res!219152) b!384463))

(assert (= (and b!384463 (not res!219153)) b!384469))

(assert (= (and b!384465 condMapEmpty!15624) mapIsEmpty!15624))

(assert (= (and b!384465 (not condMapEmpty!15624)) mapNonEmpty!15624))

(get-info :version)

(assert (= (and mapNonEmpty!15624 ((_ is ValueCellFull!4343) mapValue!15624)) b!384462))

(assert (= (and b!384465 ((_ is ValueCellFull!4343) mapDefault!15624)) b!384468))

(assert (= start!37584 b!384465))

(declare-fun m!381425 () Bool)

(assert (=> b!384475 m!381425))

(declare-fun m!381427 () Bool)

(assert (=> b!384466 m!381427))

(declare-fun m!381429 () Bool)

(assert (=> b!384473 m!381429))

(declare-fun m!381431 () Bool)

(assert (=> b!384472 m!381431))

(declare-fun m!381433 () Bool)

(assert (=> b!384467 m!381433))

(declare-fun m!381435 () Bool)

(assert (=> b!384469 m!381435))

(declare-fun m!381437 () Bool)

(assert (=> b!384464 m!381437))

(declare-fun m!381439 () Bool)

(assert (=> mapNonEmpty!15624 m!381439))

(declare-fun m!381441 () Bool)

(assert (=> start!37584 m!381441))

(declare-fun m!381443 () Bool)

(assert (=> start!37584 m!381443))

(declare-fun m!381445 () Bool)

(assert (=> start!37584 m!381445))

(declare-fun m!381447 () Bool)

(assert (=> b!384471 m!381447))

(declare-fun m!381449 () Bool)

(assert (=> b!384471 m!381449))

(declare-fun m!381451 () Bool)

(assert (=> b!384463 m!381451))

(declare-fun m!381453 () Bool)

(assert (=> b!384463 m!381453))

(declare-fun m!381455 () Bool)

(assert (=> b!384463 m!381455))

(declare-fun m!381457 () Bool)

(assert (=> b!384463 m!381457))

(declare-fun m!381459 () Bool)

(assert (=> b!384463 m!381459))

(declare-fun m!381461 () Bool)

(assert (=> b!384463 m!381461))

(declare-fun m!381463 () Bool)

(assert (=> b!384463 m!381463))

(check-sat (not b!384469) (not b!384463) (not b!384466) (not b!384464) (not b!384472) (not b!384467) (not b!384471) (not start!37584) b_and!15981 (not b!384473) tp_is_empty!9373 (not mapNonEmpty!15624) (not b_next!8725))
(check-sat b_and!15981 (not b_next!8725))
