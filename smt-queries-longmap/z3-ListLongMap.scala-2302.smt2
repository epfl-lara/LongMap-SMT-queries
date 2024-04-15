; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37260 () Bool)

(assert start!37260)

(declare-fun b_free!8401 () Bool)

(declare-fun b_next!8401 () Bool)

(assert (=> start!37260 (= b_free!8401 (not b_next!8401))))

(declare-fun tp!29918 () Bool)

(declare-fun b_and!15617 () Bool)

(assert (=> start!37260 (= tp!29918 b_and!15617)))

(declare-fun mapNonEmpty!15138 () Bool)

(declare-fun mapRes!15138 () Bool)

(declare-fun tp!29919 () Bool)

(declare-fun e!229638 () Bool)

(assert (=> mapNonEmpty!15138 (= mapRes!15138 (and tp!29919 e!229638))))

(declare-datatypes ((V!13171 0))(
  ( (V!13172 (val!4569 Int)) )
))
(declare-datatypes ((ValueCell!4181 0))(
  ( (ValueCellFull!4181 (v!6760 V!13171)) (EmptyCell!4181) )
))
(declare-datatypes ((array!22009 0))(
  ( (array!22010 (arr!10473 (Array (_ BitVec 32) ValueCell!4181)) (size!10826 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22009)

(declare-fun mapKey!15138 () (_ BitVec 32))

(declare-fun mapValue!15138 () ValueCell!4181)

(declare-fun mapRest!15138 () (Array (_ BitVec 32) ValueCell!4181))

(assert (=> mapNonEmpty!15138 (= (arr!10473 _values!506) (store mapRest!15138 mapKey!15138 mapValue!15138))))

(declare-fun b!377195 () Bool)

(declare-fun e!229636 () Bool)

(assert (=> b!377195 (= e!229636 true)))

(declare-datatypes ((tuple2!6074 0))(
  ( (tuple2!6075 (_1!3048 (_ BitVec 64)) (_2!3048 V!13171)) )
))
(declare-datatypes ((List!5903 0))(
  ( (Nil!5900) (Cons!5899 (h!6755 tuple2!6074) (t!11044 List!5903)) )
))
(declare-datatypes ((ListLongMap!4977 0))(
  ( (ListLongMap!4978 (toList!2504 List!5903)) )
))
(declare-fun lt!175288 () ListLongMap!4977)

(declare-fun lt!175287 () ListLongMap!4977)

(declare-fun lt!175294 () tuple2!6074)

(declare-fun +!872 (ListLongMap!4977 tuple2!6074) ListLongMap!4977)

(assert (=> b!377195 (= lt!175288 (+!872 lt!175287 lt!175294))))

(declare-datatypes ((Unit!11614 0))(
  ( (Unit!11615) )
))
(declare-fun lt!175290 () Unit!11614)

(declare-fun v!373 () V!13171)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13171)

(declare-fun lt!175295 () ListLongMap!4977)

(declare-fun addCommutativeForDiffKeys!279 (ListLongMap!4977 (_ BitVec 64) V!13171 (_ BitVec 64) V!13171) Unit!11614)

(assert (=> b!377195 (= lt!175290 (addCommutativeForDiffKeys!279 lt!175295 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377196 () Bool)

(declare-fun e!229635 () Bool)

(declare-fun e!229633 () Bool)

(assert (=> b!377196 (= e!229635 e!229633)))

(declare-fun res!213448 () Bool)

(assert (=> b!377196 (=> (not res!213448) (not e!229633))))

(declare-datatypes ((array!22011 0))(
  ( (array!22012 (arr!10474 (Array (_ BitVec 32) (_ BitVec 64))) (size!10827 (_ BitVec 32))) )
))
(declare-fun lt!175293 () array!22011)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22011 (_ BitVec 32)) Bool)

(assert (=> b!377196 (= res!213448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175293 mask!970))))

(declare-fun _keys!658 () array!22011)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377196 (= lt!175293 (array!22012 (store (arr!10474 _keys!658) i!548 k0!778) (size!10827 _keys!658)))))

(declare-fun b!377197 () Bool)

(declare-fun res!213443 () Bool)

(assert (=> b!377197 (=> (not res!213443) (not e!229635))))

(declare-fun arrayContainsKey!0 (array!22011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377197 (= res!213443 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377198 () Bool)

(declare-fun res!213439 () Bool)

(assert (=> b!377198 (=> (not res!213439) (not e!229635))))

(declare-datatypes ((List!5904 0))(
  ( (Nil!5901) (Cons!5900 (h!6756 (_ BitVec 64)) (t!11045 List!5904)) )
))
(declare-fun arrayNoDuplicates!0 (array!22011 (_ BitVec 32) List!5904) Bool)

(assert (=> b!377198 (= res!213439 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5901))))

(declare-fun b!377200 () Bool)

(declare-fun e!229634 () Bool)

(assert (=> b!377200 (= e!229633 (not e!229634))))

(declare-fun res!213441 () Bool)

(assert (=> b!377200 (=> res!213441 e!229634)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377200 (= res!213441 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!175292 () ListLongMap!4977)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13171)

(declare-fun getCurrentListMap!1913 (array!22011 array!22009 (_ BitVec 32) (_ BitVec 32) V!13171 V!13171 (_ BitVec 32) Int) ListLongMap!4977)

(assert (=> b!377200 (= lt!175292 (getCurrentListMap!1913 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175291 () ListLongMap!4977)

(declare-fun lt!175296 () array!22009)

(assert (=> b!377200 (= lt!175291 (getCurrentListMap!1913 lt!175293 lt!175296 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175286 () ListLongMap!4977)

(declare-fun lt!175289 () ListLongMap!4977)

(assert (=> b!377200 (and (= lt!175286 lt!175289) (= lt!175289 lt!175286))))

(assert (=> b!377200 (= lt!175289 (+!872 lt!175295 lt!175294))))

(assert (=> b!377200 (= lt!175294 (tuple2!6075 k0!778 v!373))))

(declare-fun lt!175285 () Unit!11614)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!106 (array!22011 array!22009 (_ BitVec 32) (_ BitVec 32) V!13171 V!13171 (_ BitVec 32) (_ BitVec 64) V!13171 (_ BitVec 32) Int) Unit!11614)

(assert (=> b!377200 (= lt!175285 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!106 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!778 (array!22011 array!22009 (_ BitVec 32) (_ BitVec 32) V!13171 V!13171 (_ BitVec 32) Int) ListLongMap!4977)

(assert (=> b!377200 (= lt!175286 (getCurrentListMapNoExtraKeys!778 lt!175293 lt!175296 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377200 (= lt!175296 (array!22010 (store (arr!10473 _values!506) i!548 (ValueCellFull!4181 v!373)) (size!10826 _values!506)))))

(assert (=> b!377200 (= lt!175295 (getCurrentListMapNoExtraKeys!778 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377201 () Bool)

(declare-fun res!213446 () Bool)

(assert (=> b!377201 (=> (not res!213446) (not e!229635))))

(assert (=> b!377201 (= res!213446 (and (= (size!10826 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10827 _keys!658) (size!10826 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377202 () Bool)

(declare-fun tp_is_empty!9049 () Bool)

(assert (=> b!377202 (= e!229638 tp_is_empty!9049)))

(declare-fun b!377203 () Bool)

(declare-fun res!213438 () Bool)

(assert (=> b!377203 (=> (not res!213438) (not e!229633))))

(assert (=> b!377203 (= res!213438 (arrayNoDuplicates!0 lt!175293 #b00000000000000000000000000000000 Nil!5901))))

(declare-fun b!377204 () Bool)

(declare-fun e!229640 () Bool)

(declare-fun e!229637 () Bool)

(assert (=> b!377204 (= e!229640 (and e!229637 mapRes!15138))))

(declare-fun condMapEmpty!15138 () Bool)

(declare-fun mapDefault!15138 () ValueCell!4181)

(assert (=> b!377204 (= condMapEmpty!15138 (= (arr!10473 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4181)) mapDefault!15138)))))

(declare-fun b!377205 () Bool)

(assert (=> b!377205 (= e!229637 tp_is_empty!9049)))

(declare-fun b!377206 () Bool)

(assert (=> b!377206 (= e!229634 e!229636)))

(declare-fun res!213447 () Bool)

(assert (=> b!377206 (=> res!213447 e!229636)))

(assert (=> b!377206 (= res!213447 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377206 (= lt!175291 lt!175288)))

(declare-fun lt!175284 () tuple2!6074)

(assert (=> b!377206 (= lt!175288 (+!872 lt!175289 lt!175284))))

(assert (=> b!377206 (= lt!175292 lt!175287)))

(assert (=> b!377206 (= lt!175287 (+!872 lt!175295 lt!175284))))

(assert (=> b!377206 (= lt!175291 (+!872 lt!175286 lt!175284))))

(assert (=> b!377206 (= lt!175284 (tuple2!6075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377207 () Bool)

(declare-fun res!213445 () Bool)

(assert (=> b!377207 (=> (not res!213445) (not e!229635))))

(assert (=> b!377207 (= res!213445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377208 () Bool)

(declare-fun res!213444 () Bool)

(assert (=> b!377208 (=> (not res!213444) (not e!229635))))

(assert (=> b!377208 (= res!213444 (or (= (select (arr!10474 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10474 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377199 () Bool)

(declare-fun res!213442 () Bool)

(assert (=> b!377199 (=> (not res!213442) (not e!229635))))

(assert (=> b!377199 (= res!213442 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10827 _keys!658))))))

(declare-fun res!213449 () Bool)

(assert (=> start!37260 (=> (not res!213449) (not e!229635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37260 (= res!213449 (validMask!0 mask!970))))

(assert (=> start!37260 e!229635))

(declare-fun array_inv!7716 (array!22009) Bool)

(assert (=> start!37260 (and (array_inv!7716 _values!506) e!229640)))

(assert (=> start!37260 tp!29918))

(assert (=> start!37260 true))

(assert (=> start!37260 tp_is_empty!9049))

(declare-fun array_inv!7717 (array!22011) Bool)

(assert (=> start!37260 (array_inv!7717 _keys!658)))

(declare-fun b!377209 () Bool)

(declare-fun res!213440 () Bool)

(assert (=> b!377209 (=> (not res!213440) (not e!229635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377209 (= res!213440 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15138 () Bool)

(assert (=> mapIsEmpty!15138 mapRes!15138))

(assert (= (and start!37260 res!213449) b!377201))

(assert (= (and b!377201 res!213446) b!377207))

(assert (= (and b!377207 res!213445) b!377198))

(assert (= (and b!377198 res!213439) b!377199))

(assert (= (and b!377199 res!213442) b!377209))

(assert (= (and b!377209 res!213440) b!377208))

(assert (= (and b!377208 res!213444) b!377197))

(assert (= (and b!377197 res!213443) b!377196))

(assert (= (and b!377196 res!213448) b!377203))

(assert (= (and b!377203 res!213438) b!377200))

(assert (= (and b!377200 (not res!213441)) b!377206))

(assert (= (and b!377206 (not res!213447)) b!377195))

(assert (= (and b!377204 condMapEmpty!15138) mapIsEmpty!15138))

(assert (= (and b!377204 (not condMapEmpty!15138)) mapNonEmpty!15138))

(get-info :version)

(assert (= (and mapNonEmpty!15138 ((_ is ValueCellFull!4181) mapValue!15138)) b!377202))

(assert (= (and b!377204 ((_ is ValueCellFull!4181) mapDefault!15138)) b!377205))

(assert (= start!37260 b!377204))

(declare-fun m!373511 () Bool)

(assert (=> mapNonEmpty!15138 m!373511))

(declare-fun m!373513 () Bool)

(assert (=> b!377195 m!373513))

(declare-fun m!373515 () Bool)

(assert (=> b!377195 m!373515))

(declare-fun m!373517 () Bool)

(assert (=> b!377208 m!373517))

(declare-fun m!373519 () Bool)

(assert (=> b!377209 m!373519))

(declare-fun m!373521 () Bool)

(assert (=> b!377196 m!373521))

(declare-fun m!373523 () Bool)

(assert (=> b!377196 m!373523))

(declare-fun m!373525 () Bool)

(assert (=> b!377197 m!373525))

(declare-fun m!373527 () Bool)

(assert (=> b!377206 m!373527))

(declare-fun m!373529 () Bool)

(assert (=> b!377206 m!373529))

(declare-fun m!373531 () Bool)

(assert (=> b!377206 m!373531))

(declare-fun m!373533 () Bool)

(assert (=> start!37260 m!373533))

(declare-fun m!373535 () Bool)

(assert (=> start!37260 m!373535))

(declare-fun m!373537 () Bool)

(assert (=> start!37260 m!373537))

(declare-fun m!373539 () Bool)

(assert (=> b!377198 m!373539))

(declare-fun m!373541 () Bool)

(assert (=> b!377203 m!373541))

(declare-fun m!373543 () Bool)

(assert (=> b!377207 m!373543))

(declare-fun m!373545 () Bool)

(assert (=> b!377200 m!373545))

(declare-fun m!373547 () Bool)

(assert (=> b!377200 m!373547))

(declare-fun m!373549 () Bool)

(assert (=> b!377200 m!373549))

(declare-fun m!373551 () Bool)

(assert (=> b!377200 m!373551))

(declare-fun m!373553 () Bool)

(assert (=> b!377200 m!373553))

(declare-fun m!373555 () Bool)

(assert (=> b!377200 m!373555))

(declare-fun m!373557 () Bool)

(assert (=> b!377200 m!373557))

(check-sat tp_is_empty!9049 (not b!377196) (not b!377195) (not mapNonEmpty!15138) (not b!377209) (not start!37260) (not b!377206) (not b!377203) b_and!15617 (not b!377200) (not b_next!8401) (not b!377197) (not b!377207) (not b!377198))
(check-sat b_and!15617 (not b_next!8401))
