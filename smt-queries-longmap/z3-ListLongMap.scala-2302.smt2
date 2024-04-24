; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37260 () Bool)

(assert start!37260)

(declare-fun b_free!8401 () Bool)

(declare-fun b_next!8401 () Bool)

(assert (=> start!37260 (= b_free!8401 (not b_next!8401))))

(declare-fun tp!29918 () Bool)

(declare-fun b_and!15657 () Bool)

(assert (=> start!37260 (= tp!29918 b_and!15657)))

(declare-fun b!377417 () Bool)

(declare-fun e!229777 () Bool)

(declare-fun e!229782 () Bool)

(assert (=> b!377417 (= e!229777 e!229782)))

(declare-fun res!213572 () Bool)

(assert (=> b!377417 (=> res!213572 e!229782)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!377417 (= res!213572 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13171 0))(
  ( (V!13172 (val!4569 Int)) )
))
(declare-datatypes ((tuple2!5998 0))(
  ( (tuple2!5999 (_1!3010 (_ BitVec 64)) (_2!3010 V!13171)) )
))
(declare-datatypes ((List!5838 0))(
  ( (Nil!5835) (Cons!5834 (h!6690 tuple2!5998) (t!10980 List!5838)) )
))
(declare-datatypes ((ListLongMap!4913 0))(
  ( (ListLongMap!4914 (toList!2472 List!5838)) )
))
(declare-fun lt!175549 () ListLongMap!4913)

(declare-fun lt!175547 () ListLongMap!4913)

(assert (=> b!377417 (= lt!175549 lt!175547)))

(declare-fun lt!175543 () ListLongMap!4913)

(declare-fun lt!175544 () tuple2!5998)

(declare-fun +!868 (ListLongMap!4913 tuple2!5998) ListLongMap!4913)

(assert (=> b!377417 (= lt!175547 (+!868 lt!175543 lt!175544))))

(declare-fun lt!175548 () ListLongMap!4913)

(declare-fun lt!175542 () ListLongMap!4913)

(assert (=> b!377417 (= lt!175548 lt!175542)))

(declare-fun lt!175537 () ListLongMap!4913)

(assert (=> b!377417 (= lt!175542 (+!868 lt!175537 lt!175544))))

(declare-fun lt!175540 () ListLongMap!4913)

(assert (=> b!377417 (= lt!175549 (+!868 lt!175540 lt!175544))))

(declare-fun zeroValue!472 () V!13171)

(assert (=> b!377417 (= lt!175544 (tuple2!5999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377418 () Bool)

(declare-fun res!213564 () Bool)

(declare-fun e!229780 () Bool)

(assert (=> b!377418 (=> (not res!213564) (not e!229780))))

(declare-datatypes ((array!22014 0))(
  ( (array!22015 (arr!10475 (Array (_ BitVec 32) (_ BitVec 64))) (size!10827 (_ BitVec 32))) )
))
(declare-fun lt!175546 () array!22014)

(declare-datatypes ((List!5839 0))(
  ( (Nil!5836) (Cons!5835 (h!6691 (_ BitVec 64)) (t!10981 List!5839)) )
))
(declare-fun arrayNoDuplicates!0 (array!22014 (_ BitVec 32) List!5839) Bool)

(assert (=> b!377418 (= res!213564 (arrayNoDuplicates!0 lt!175546 #b00000000000000000000000000000000 Nil!5836))))

(declare-fun b!377419 () Bool)

(assert (=> b!377419 (= e!229782 true)))

(declare-fun lt!175539 () tuple2!5998)

(assert (=> b!377419 (= lt!175547 (+!868 lt!175542 lt!175539))))

(declare-fun v!373 () V!13171)

(declare-datatypes ((Unit!11621 0))(
  ( (Unit!11622) )
))
(declare-fun lt!175541 () Unit!11621)

(declare-fun addCommutativeForDiffKeys!286 (ListLongMap!4913 (_ BitVec 64) V!13171 (_ BitVec 64) V!13171) Unit!11621)

(assert (=> b!377419 (= lt!175541 (addCommutativeForDiffKeys!286 lt!175537 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377420 () Bool)

(declare-fun res!213575 () Bool)

(declare-fun e!229775 () Bool)

(assert (=> b!377420 (=> (not res!213575) (not e!229775))))

(declare-fun _keys!658 () array!22014)

(declare-fun arrayContainsKey!0 (array!22014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377420 (= res!213575 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377421 () Bool)

(declare-fun res!213571 () Bool)

(assert (=> b!377421 (=> (not res!213571) (not e!229775))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22014 (_ BitVec 32)) Bool)

(assert (=> b!377421 (= res!213571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377422 () Bool)

(declare-fun res!213567 () Bool)

(assert (=> b!377422 (=> (not res!213567) (not e!229775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377422 (= res!213567 (validKeyInArray!0 k0!778))))

(declare-fun b!377423 () Bool)

(declare-fun res!213569 () Bool)

(assert (=> b!377423 (=> (not res!213569) (not e!229775))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377423 (= res!213569 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10827 _keys!658))))))

(declare-fun res!213573 () Bool)

(assert (=> start!37260 (=> (not res!213573) (not e!229775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37260 (= res!213573 (validMask!0 mask!970))))

(assert (=> start!37260 e!229775))

(declare-datatypes ((ValueCell!4181 0))(
  ( (ValueCellFull!4181 (v!6767 V!13171)) (EmptyCell!4181) )
))
(declare-datatypes ((array!22016 0))(
  ( (array!22017 (arr!10476 (Array (_ BitVec 32) ValueCell!4181)) (size!10828 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22016)

(declare-fun e!229781 () Bool)

(declare-fun array_inv!7770 (array!22016) Bool)

(assert (=> start!37260 (and (array_inv!7770 _values!506) e!229781)))

(assert (=> start!37260 tp!29918))

(assert (=> start!37260 true))

(declare-fun tp_is_empty!9049 () Bool)

(assert (=> start!37260 tp_is_empty!9049))

(declare-fun array_inv!7771 (array!22014) Bool)

(assert (=> start!37260 (array_inv!7771 _keys!658)))

(declare-fun mapIsEmpty!15138 () Bool)

(declare-fun mapRes!15138 () Bool)

(assert (=> mapIsEmpty!15138 mapRes!15138))

(declare-fun mapNonEmpty!15138 () Bool)

(declare-fun tp!29919 () Bool)

(declare-fun e!229776 () Bool)

(assert (=> mapNonEmpty!15138 (= mapRes!15138 (and tp!29919 e!229776))))

(declare-fun mapRest!15138 () (Array (_ BitVec 32) ValueCell!4181))

(declare-fun mapKey!15138 () (_ BitVec 32))

(declare-fun mapValue!15138 () ValueCell!4181)

(assert (=> mapNonEmpty!15138 (= (arr!10476 _values!506) (store mapRest!15138 mapKey!15138 mapValue!15138))))

(declare-fun b!377424 () Bool)

(assert (=> b!377424 (= e!229780 (not e!229777))))

(declare-fun res!213566 () Bool)

(assert (=> b!377424 (=> res!213566 e!229777)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377424 (= res!213566 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13171)

(declare-fun getCurrentListMap!1918 (array!22014 array!22016 (_ BitVec 32) (_ BitVec 32) V!13171 V!13171 (_ BitVec 32) Int) ListLongMap!4913)

(assert (=> b!377424 (= lt!175548 (getCurrentListMap!1918 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175545 () array!22016)

(assert (=> b!377424 (= lt!175549 (getCurrentListMap!1918 lt!175546 lt!175545 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377424 (and (= lt!175540 lt!175543) (= lt!175543 lt!175540))))

(assert (=> b!377424 (= lt!175543 (+!868 lt!175537 lt!175539))))

(assert (=> b!377424 (= lt!175539 (tuple2!5999 k0!778 v!373))))

(declare-fun lt!175538 () Unit!11621)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!105 (array!22014 array!22016 (_ BitVec 32) (_ BitVec 32) V!13171 V!13171 (_ BitVec 32) (_ BitVec 64) V!13171 (_ BitVec 32) Int) Unit!11621)

(assert (=> b!377424 (= lt!175538 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!105 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!765 (array!22014 array!22016 (_ BitVec 32) (_ BitVec 32) V!13171 V!13171 (_ BitVec 32) Int) ListLongMap!4913)

(assert (=> b!377424 (= lt!175540 (getCurrentListMapNoExtraKeys!765 lt!175546 lt!175545 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377424 (= lt!175545 (array!22017 (store (arr!10476 _values!506) i!548 (ValueCellFull!4181 v!373)) (size!10828 _values!506)))))

(assert (=> b!377424 (= lt!175537 (getCurrentListMapNoExtraKeys!765 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377425 () Bool)

(declare-fun e!229779 () Bool)

(assert (=> b!377425 (= e!229779 tp_is_empty!9049)))

(declare-fun b!377426 () Bool)

(declare-fun res!213568 () Bool)

(assert (=> b!377426 (=> (not res!213568) (not e!229775))))

(assert (=> b!377426 (= res!213568 (and (= (size!10828 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10827 _keys!658) (size!10828 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377427 () Bool)

(declare-fun res!213574 () Bool)

(assert (=> b!377427 (=> (not res!213574) (not e!229775))))

(assert (=> b!377427 (= res!213574 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5836))))

(declare-fun b!377428 () Bool)

(declare-fun res!213565 () Bool)

(assert (=> b!377428 (=> (not res!213565) (not e!229775))))

(assert (=> b!377428 (= res!213565 (or (= (select (arr!10475 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10475 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377429 () Bool)

(assert (=> b!377429 (= e!229776 tp_is_empty!9049)))

(declare-fun b!377430 () Bool)

(assert (=> b!377430 (= e!229775 e!229780)))

(declare-fun res!213570 () Bool)

(assert (=> b!377430 (=> (not res!213570) (not e!229780))))

(assert (=> b!377430 (= res!213570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175546 mask!970))))

(assert (=> b!377430 (= lt!175546 (array!22015 (store (arr!10475 _keys!658) i!548 k0!778) (size!10827 _keys!658)))))

(declare-fun b!377431 () Bool)

(assert (=> b!377431 (= e!229781 (and e!229779 mapRes!15138))))

(declare-fun condMapEmpty!15138 () Bool)

(declare-fun mapDefault!15138 () ValueCell!4181)

(assert (=> b!377431 (= condMapEmpty!15138 (= (arr!10476 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4181)) mapDefault!15138)))))

(assert (= (and start!37260 res!213573) b!377426))

(assert (= (and b!377426 res!213568) b!377421))

(assert (= (and b!377421 res!213571) b!377427))

(assert (= (and b!377427 res!213574) b!377423))

(assert (= (and b!377423 res!213569) b!377422))

(assert (= (and b!377422 res!213567) b!377428))

(assert (= (and b!377428 res!213565) b!377420))

(assert (= (and b!377420 res!213575) b!377430))

(assert (= (and b!377430 res!213570) b!377418))

(assert (= (and b!377418 res!213564) b!377424))

(assert (= (and b!377424 (not res!213566)) b!377417))

(assert (= (and b!377417 (not res!213572)) b!377419))

(assert (= (and b!377431 condMapEmpty!15138) mapIsEmpty!15138))

(assert (= (and b!377431 (not condMapEmpty!15138)) mapNonEmpty!15138))

(get-info :version)

(assert (= (and mapNonEmpty!15138 ((_ is ValueCellFull!4181) mapValue!15138)) b!377429))

(assert (= (and b!377431 ((_ is ValueCellFull!4181) mapDefault!15138)) b!377425))

(assert (= start!37260 b!377431))

(declare-fun m!374465 () Bool)

(assert (=> b!377419 m!374465))

(declare-fun m!374467 () Bool)

(assert (=> b!377419 m!374467))

(declare-fun m!374469 () Bool)

(assert (=> b!377427 m!374469))

(declare-fun m!374471 () Bool)

(assert (=> b!377422 m!374471))

(declare-fun m!374473 () Bool)

(assert (=> mapNonEmpty!15138 m!374473))

(declare-fun m!374475 () Bool)

(assert (=> b!377424 m!374475))

(declare-fun m!374477 () Bool)

(assert (=> b!377424 m!374477))

(declare-fun m!374479 () Bool)

(assert (=> b!377424 m!374479))

(declare-fun m!374481 () Bool)

(assert (=> b!377424 m!374481))

(declare-fun m!374483 () Bool)

(assert (=> b!377424 m!374483))

(declare-fun m!374485 () Bool)

(assert (=> b!377424 m!374485))

(declare-fun m!374487 () Bool)

(assert (=> b!377424 m!374487))

(declare-fun m!374489 () Bool)

(assert (=> b!377420 m!374489))

(declare-fun m!374491 () Bool)

(assert (=> b!377417 m!374491))

(declare-fun m!374493 () Bool)

(assert (=> b!377417 m!374493))

(declare-fun m!374495 () Bool)

(assert (=> b!377417 m!374495))

(declare-fun m!374497 () Bool)

(assert (=> b!377428 m!374497))

(declare-fun m!374499 () Bool)

(assert (=> b!377421 m!374499))

(declare-fun m!374501 () Bool)

(assert (=> b!377430 m!374501))

(declare-fun m!374503 () Bool)

(assert (=> b!377430 m!374503))

(declare-fun m!374505 () Bool)

(assert (=> start!37260 m!374505))

(declare-fun m!374507 () Bool)

(assert (=> start!37260 m!374507))

(declare-fun m!374509 () Bool)

(assert (=> start!37260 m!374509))

(declare-fun m!374511 () Bool)

(assert (=> b!377418 m!374511))

(check-sat b_and!15657 (not mapNonEmpty!15138) (not b!377421) (not b!377424) (not b!377427) tp_is_empty!9049 (not b_next!8401) (not b!377420) (not b!377430) (not b!377417) (not b!377422) (not b!377419) (not b!377418) (not start!37260))
(check-sat b_and!15657 (not b_next!8401))
