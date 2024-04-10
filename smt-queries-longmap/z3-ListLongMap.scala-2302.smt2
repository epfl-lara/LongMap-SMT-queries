; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37276 () Bool)

(assert start!37276)

(declare-fun b_free!8403 () Bool)

(declare-fun b_next!8403 () Bool)

(assert (=> start!37276 (= b_free!8403 (not b_next!8403))))

(declare-fun tp!29925 () Bool)

(declare-fun b_and!15645 () Bool)

(assert (=> start!37276 (= tp!29925 b_and!15645)))

(declare-fun b!377511 () Bool)

(declare-fun e!229831 () Bool)

(declare-fun e!229834 () Bool)

(assert (=> b!377511 (= e!229831 e!229834)))

(declare-fun res!213607 () Bool)

(assert (=> b!377511 (=> res!213607 e!229834)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!377511 (= res!213607 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13173 0))(
  ( (V!13174 (val!4570 Int)) )
))
(declare-datatypes ((tuple2!6094 0))(
  ( (tuple2!6095 (_1!3058 (_ BitVec 64)) (_2!3058 V!13173)) )
))
(declare-datatypes ((List!5934 0))(
  ( (Nil!5931) (Cons!5930 (h!6786 tuple2!6094) (t!11084 List!5934)) )
))
(declare-datatypes ((ListLongMap!5007 0))(
  ( (ListLongMap!5008 (toList!2519 List!5934)) )
))
(declare-fun lt!175559 () ListLongMap!5007)

(declare-fun lt!175569 () ListLongMap!5007)

(assert (=> b!377511 (= lt!175559 lt!175569)))

(declare-fun lt!175557 () ListLongMap!5007)

(declare-fun lt!175558 () tuple2!6094)

(declare-fun +!865 (ListLongMap!5007 tuple2!6094) ListLongMap!5007)

(assert (=> b!377511 (= lt!175569 (+!865 lt!175557 lt!175558))))

(declare-fun lt!175568 () ListLongMap!5007)

(declare-fun lt!175564 () ListLongMap!5007)

(assert (=> b!377511 (= lt!175568 lt!175564)))

(declare-fun lt!175562 () ListLongMap!5007)

(assert (=> b!377511 (= lt!175564 (+!865 lt!175562 lt!175558))))

(declare-fun lt!175561 () ListLongMap!5007)

(assert (=> b!377511 (= lt!175559 (+!865 lt!175561 lt!175558))))

(declare-fun zeroValue!472 () V!13173)

(assert (=> b!377511 (= lt!175558 (tuple2!6095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377512 () Bool)

(declare-fun e!229836 () Bool)

(assert (=> b!377512 (= e!229836 (not e!229831))))

(declare-fun res!213611 () Bool)

(assert (=> b!377512 (=> res!213611 e!229831)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377512 (= res!213611 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4182 0))(
  ( (ValueCellFull!4182 (v!6767 V!13173)) (EmptyCell!4182) )
))
(declare-datatypes ((array!22031 0))(
  ( (array!22032 (arr!10484 (Array (_ BitVec 32) ValueCell!4182)) (size!10836 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22031)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!22033 0))(
  ( (array!22034 (arr!10485 (Array (_ BitVec 32) (_ BitVec 64))) (size!10837 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22033)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13173)

(declare-fun getCurrentListMap!1949 (array!22033 array!22031 (_ BitVec 32) (_ BitVec 32) V!13173 V!13173 (_ BitVec 32) Int) ListLongMap!5007)

(assert (=> b!377512 (= lt!175568 (getCurrentListMap!1949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175560 () array!22031)

(declare-fun lt!175566 () array!22033)

(assert (=> b!377512 (= lt!175559 (getCurrentListMap!1949 lt!175566 lt!175560 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377512 (and (= lt!175561 lt!175557) (= lt!175557 lt!175561))))

(declare-fun lt!175565 () tuple2!6094)

(assert (=> b!377512 (= lt!175557 (+!865 lt!175562 lt!175565))))

(declare-fun v!373 () V!13173)

(assert (=> b!377512 (= lt!175565 (tuple2!6095 k0!778 v!373))))

(declare-datatypes ((Unit!11632 0))(
  ( (Unit!11633) )
))
(declare-fun lt!175567 () Unit!11632)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!107 (array!22033 array!22031 (_ BitVec 32) (_ BitVec 32) V!13173 V!13173 (_ BitVec 32) (_ BitVec 64) V!13173 (_ BitVec 32) Int) Unit!11632)

(assert (=> b!377512 (= lt!175567 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!107 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!783 (array!22033 array!22031 (_ BitVec 32) (_ BitVec 32) V!13173 V!13173 (_ BitVec 32) Int) ListLongMap!5007)

(assert (=> b!377512 (= lt!175561 (getCurrentListMapNoExtraKeys!783 lt!175566 lt!175560 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377512 (= lt!175560 (array!22032 (store (arr!10484 _values!506) i!548 (ValueCellFull!4182 v!373)) (size!10836 _values!506)))))

(assert (=> b!377512 (= lt!175562 (getCurrentListMapNoExtraKeys!783 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377513 () Bool)

(declare-fun e!229833 () Bool)

(declare-fun tp_is_empty!9051 () Bool)

(assert (=> b!377513 (= e!229833 tp_is_empty!9051)))

(declare-fun b!377514 () Bool)

(declare-fun res!213604 () Bool)

(declare-fun e!229835 () Bool)

(assert (=> b!377514 (=> (not res!213604) (not e!229835))))

(declare-fun arrayContainsKey!0 (array!22033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377514 (= res!213604 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377515 () Bool)

(declare-fun res!213610 () Bool)

(assert (=> b!377515 (=> (not res!213610) (not e!229835))))

(assert (=> b!377515 (= res!213610 (or (= (select (arr!10485 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10485 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377516 () Bool)

(declare-fun res!213605 () Bool)

(assert (=> b!377516 (=> (not res!213605) (not e!229835))))

(assert (=> b!377516 (= res!213605 (and (= (size!10836 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10837 _keys!658) (size!10836 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377517 () Bool)

(declare-fun res!213612 () Bool)

(assert (=> b!377517 (=> (not res!213612) (not e!229835))))

(assert (=> b!377517 (= res!213612 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10837 _keys!658))))))

(declare-fun res!213603 () Bool)

(assert (=> start!37276 (=> (not res!213603) (not e!229835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37276 (= res!213603 (validMask!0 mask!970))))

(assert (=> start!37276 e!229835))

(declare-fun e!229837 () Bool)

(declare-fun array_inv!7724 (array!22031) Bool)

(assert (=> start!37276 (and (array_inv!7724 _values!506) e!229837)))

(assert (=> start!37276 tp!29925))

(assert (=> start!37276 true))

(assert (=> start!37276 tp_is_empty!9051))

(declare-fun array_inv!7725 (array!22033) Bool)

(assert (=> start!37276 (array_inv!7725 _keys!658)))

(declare-fun mapNonEmpty!15141 () Bool)

(declare-fun mapRes!15141 () Bool)

(declare-fun tp!29924 () Bool)

(declare-fun e!229832 () Bool)

(assert (=> mapNonEmpty!15141 (= mapRes!15141 (and tp!29924 e!229832))))

(declare-fun mapKey!15141 () (_ BitVec 32))

(declare-fun mapRest!15141 () (Array (_ BitVec 32) ValueCell!4182))

(declare-fun mapValue!15141 () ValueCell!4182)

(assert (=> mapNonEmpty!15141 (= (arr!10484 _values!506) (store mapRest!15141 mapKey!15141 mapValue!15141))))

(declare-fun b!377518 () Bool)

(assert (=> b!377518 (= e!229835 e!229836)))

(declare-fun res!213609 () Bool)

(assert (=> b!377518 (=> (not res!213609) (not e!229836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22033 (_ BitVec 32)) Bool)

(assert (=> b!377518 (= res!213609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175566 mask!970))))

(assert (=> b!377518 (= lt!175566 (array!22034 (store (arr!10485 _keys!658) i!548 k0!778) (size!10837 _keys!658)))))

(declare-fun mapIsEmpty!15141 () Bool)

(assert (=> mapIsEmpty!15141 mapRes!15141))

(declare-fun b!377519 () Bool)

(assert (=> b!377519 (= e!229834 true)))

(assert (=> b!377519 (= lt!175569 (+!865 lt!175564 lt!175565))))

(declare-fun lt!175563 () Unit!11632)

(declare-fun addCommutativeForDiffKeys!273 (ListLongMap!5007 (_ BitVec 64) V!13173 (_ BitVec 64) V!13173) Unit!11632)

(assert (=> b!377519 (= lt!175563 (addCommutativeForDiffKeys!273 lt!175562 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377520 () Bool)

(assert (=> b!377520 (= e!229832 tp_is_empty!9051)))

(declare-fun b!377521 () Bool)

(assert (=> b!377521 (= e!229837 (and e!229833 mapRes!15141))))

(declare-fun condMapEmpty!15141 () Bool)

(declare-fun mapDefault!15141 () ValueCell!4182)

(assert (=> b!377521 (= condMapEmpty!15141 (= (arr!10484 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4182)) mapDefault!15141)))))

(declare-fun b!377522 () Bool)

(declare-fun res!213606 () Bool)

(assert (=> b!377522 (=> (not res!213606) (not e!229835))))

(assert (=> b!377522 (= res!213606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377523 () Bool)

(declare-fun res!213614 () Bool)

(assert (=> b!377523 (=> (not res!213614) (not e!229836))))

(declare-datatypes ((List!5935 0))(
  ( (Nil!5932) (Cons!5931 (h!6787 (_ BitVec 64)) (t!11085 List!5935)) )
))
(declare-fun arrayNoDuplicates!0 (array!22033 (_ BitVec 32) List!5935) Bool)

(assert (=> b!377523 (= res!213614 (arrayNoDuplicates!0 lt!175566 #b00000000000000000000000000000000 Nil!5932))))

(declare-fun b!377524 () Bool)

(declare-fun res!213608 () Bool)

(assert (=> b!377524 (=> (not res!213608) (not e!229835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377524 (= res!213608 (validKeyInArray!0 k0!778))))

(declare-fun b!377525 () Bool)

(declare-fun res!213613 () Bool)

(assert (=> b!377525 (=> (not res!213613) (not e!229835))))

(assert (=> b!377525 (= res!213613 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5932))))

(assert (= (and start!37276 res!213603) b!377516))

(assert (= (and b!377516 res!213605) b!377522))

(assert (= (and b!377522 res!213606) b!377525))

(assert (= (and b!377525 res!213613) b!377517))

(assert (= (and b!377517 res!213612) b!377524))

(assert (= (and b!377524 res!213608) b!377515))

(assert (= (and b!377515 res!213610) b!377514))

(assert (= (and b!377514 res!213604) b!377518))

(assert (= (and b!377518 res!213609) b!377523))

(assert (= (and b!377523 res!213614) b!377512))

(assert (= (and b!377512 (not res!213611)) b!377511))

(assert (= (and b!377511 (not res!213607)) b!377519))

(assert (= (and b!377521 condMapEmpty!15141) mapIsEmpty!15141))

(assert (= (and b!377521 (not condMapEmpty!15141)) mapNonEmpty!15141))

(get-info :version)

(assert (= (and mapNonEmpty!15141 ((_ is ValueCellFull!4182) mapValue!15141)) b!377520))

(assert (= (and b!377521 ((_ is ValueCellFull!4182) mapDefault!15141)) b!377513))

(assert (= start!37276 b!377521))

(declare-fun m!374283 () Bool)

(assert (=> b!377512 m!374283))

(declare-fun m!374285 () Bool)

(assert (=> b!377512 m!374285))

(declare-fun m!374287 () Bool)

(assert (=> b!377512 m!374287))

(declare-fun m!374289 () Bool)

(assert (=> b!377512 m!374289))

(declare-fun m!374291 () Bool)

(assert (=> b!377512 m!374291))

(declare-fun m!374293 () Bool)

(assert (=> b!377512 m!374293))

(declare-fun m!374295 () Bool)

(assert (=> b!377512 m!374295))

(declare-fun m!374297 () Bool)

(assert (=> b!377523 m!374297))

(declare-fun m!374299 () Bool)

(assert (=> b!377522 m!374299))

(declare-fun m!374301 () Bool)

(assert (=> b!377515 m!374301))

(declare-fun m!374303 () Bool)

(assert (=> b!377518 m!374303))

(declare-fun m!374305 () Bool)

(assert (=> b!377518 m!374305))

(declare-fun m!374307 () Bool)

(assert (=> start!37276 m!374307))

(declare-fun m!374309 () Bool)

(assert (=> start!37276 m!374309))

(declare-fun m!374311 () Bool)

(assert (=> start!37276 m!374311))

(declare-fun m!374313 () Bool)

(assert (=> b!377525 m!374313))

(declare-fun m!374315 () Bool)

(assert (=> mapNonEmpty!15141 m!374315))

(declare-fun m!374317 () Bool)

(assert (=> b!377511 m!374317))

(declare-fun m!374319 () Bool)

(assert (=> b!377511 m!374319))

(declare-fun m!374321 () Bool)

(assert (=> b!377511 m!374321))

(declare-fun m!374323 () Bool)

(assert (=> b!377524 m!374323))

(declare-fun m!374325 () Bool)

(assert (=> b!377514 m!374325))

(declare-fun m!374327 () Bool)

(assert (=> b!377519 m!374327))

(declare-fun m!374329 () Bool)

(assert (=> b!377519 m!374329))

(check-sat (not b!377522) (not start!37276) (not b!377524) (not b!377523) (not b!377518) (not b!377512) (not b_next!8403) (not b!377519) b_and!15645 (not mapNonEmpty!15141) (not b!377525) tp_is_empty!9051 (not b!377511) (not b!377514))
(check-sat b_and!15645 (not b_next!8403))
