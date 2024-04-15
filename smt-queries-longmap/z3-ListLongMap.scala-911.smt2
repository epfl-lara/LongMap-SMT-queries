; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20566 () Bool)

(assert start!20566)

(declare-fun b_free!5221 () Bool)

(declare-fun b_next!5221 () Bool)

(assert (=> start!20566 (= b_free!5221 (not b_next!5221))))

(declare-fun tp!18695 () Bool)

(declare-fun b_and!11941 () Bool)

(assert (=> start!20566 (= tp!18695 b_and!11941)))

(declare-fun b!204477 () Bool)

(declare-fun res!98554 () Bool)

(declare-fun e!133771 () Bool)

(assert (=> b!204477 (=> (not res!98554) (not e!133771))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9359 0))(
  ( (array!9360 (arr!4429 (Array (_ BitVec 32) (_ BitVec 64))) (size!4755 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9359)

(assert (=> b!204477 (= res!98554 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4755 _keys!825))))))

(declare-fun b!204478 () Bool)

(declare-fun res!98558 () Bool)

(assert (=> b!204478 (=> (not res!98558) (not e!133771))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6417 0))(
  ( (V!6418 (val!2583 Int)) )
))
(declare-datatypes ((ValueCell!2195 0))(
  ( (ValueCellFull!2195 (v!4547 V!6417)) (EmptyCell!2195) )
))
(declare-datatypes ((array!9361 0))(
  ( (array!9362 (arr!4430 (Array (_ BitVec 32) ValueCell!2195)) (size!4756 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9361)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!204478 (= res!98558 (and (= (size!4756 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4755 _keys!825) (size!4756 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204479 () Bool)

(declare-fun e!133772 () Bool)

(declare-fun tp_is_empty!5077 () Bool)

(assert (=> b!204479 (= e!133772 tp_is_empty!5077)))

(declare-fun b!204480 () Bool)

(declare-fun res!98553 () Bool)

(assert (=> b!204480 (=> (not res!98553) (not e!133771))))

(declare-datatypes ((List!2805 0))(
  ( (Nil!2802) (Cons!2801 (h!3443 (_ BitVec 64)) (t!7727 List!2805)) )
))
(declare-fun arrayNoDuplicates!0 (array!9359 (_ BitVec 32) List!2805) Bool)

(assert (=> b!204480 (= res!98553 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2802))))

(declare-fun mapIsEmpty!8684 () Bool)

(declare-fun mapRes!8684 () Bool)

(assert (=> mapIsEmpty!8684 mapRes!8684))

(declare-fun b!204481 () Bool)

(declare-fun res!98555 () Bool)

(assert (=> b!204481 (=> (not res!98555) (not e!133771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9359 (_ BitVec 32)) Bool)

(assert (=> b!204481 (= res!98555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204482 () Bool)

(declare-fun res!98550 () Bool)

(assert (=> b!204482 (=> (not res!98550) (not e!133771))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204482 (= res!98550 (validKeyInArray!0 k0!843))))

(declare-fun b!204483 () Bool)

(declare-fun e!133770 () Bool)

(declare-fun e!133769 () Bool)

(assert (=> b!204483 (= e!133770 (and e!133769 mapRes!8684))))

(declare-fun condMapEmpty!8684 () Bool)

(declare-fun mapDefault!8684 () ValueCell!2195)

(assert (=> b!204483 (= condMapEmpty!8684 (= (arr!4430 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2195)) mapDefault!8684)))))

(declare-fun b!204484 () Bool)

(assert (=> b!204484 (= e!133769 tp_is_empty!5077)))

(declare-fun mapNonEmpty!8684 () Bool)

(declare-fun tp!18694 () Bool)

(assert (=> mapNonEmpty!8684 (= mapRes!8684 (and tp!18694 e!133772))))

(declare-fun mapKey!8684 () (_ BitVec 32))

(declare-fun mapRest!8684 () (Array (_ BitVec 32) ValueCell!2195))

(declare-fun mapValue!8684 () ValueCell!2195)

(assert (=> mapNonEmpty!8684 (= (arr!4430 _values!649) (store mapRest!8684 mapKey!8684 mapValue!8684))))

(declare-fun b!204486 () Bool)

(declare-fun res!98552 () Bool)

(assert (=> b!204486 (=> (not res!98552) (not e!133771))))

(assert (=> b!204486 (= res!98552 (= (select (arr!4429 _keys!825) i!601) k0!843))))

(declare-fun res!98557 () Bool)

(assert (=> start!20566 (=> (not res!98557) (not e!133771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20566 (= res!98557 (validMask!0 mask!1149))))

(assert (=> start!20566 e!133771))

(declare-fun array_inv!2911 (array!9361) Bool)

(assert (=> start!20566 (and (array_inv!2911 _values!649) e!133770)))

(assert (=> start!20566 true))

(assert (=> start!20566 tp_is_empty!5077))

(declare-fun array_inv!2912 (array!9359) Bool)

(assert (=> start!20566 (array_inv!2912 _keys!825)))

(assert (=> start!20566 tp!18695))

(declare-fun b!204485 () Bool)

(declare-fun e!133768 () Bool)

(assert (=> b!204485 (= e!133771 (not e!133768))))

(declare-fun res!98551 () Bool)

(assert (=> b!204485 (=> res!98551 e!133768)))

(assert (=> b!204485 (= res!98551 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3902 0))(
  ( (tuple2!3903 (_1!1962 (_ BitVec 64)) (_2!1962 V!6417)) )
))
(declare-datatypes ((List!2806 0))(
  ( (Nil!2803) (Cons!2802 (h!3444 tuple2!3902) (t!7728 List!2806)) )
))
(declare-datatypes ((ListLongMap!2805 0))(
  ( (ListLongMap!2806 (toList!1418 List!2806)) )
))
(declare-fun lt!103576 () ListLongMap!2805)

(declare-fun zeroValue!615 () V!6417)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6417)

(declare-fun getCurrentListMap!964 (array!9359 array!9361 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) Int) ListLongMap!2805)

(assert (=> b!204485 (= lt!103576 (getCurrentListMap!964 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103577 () array!9361)

(declare-fun lt!103578 () ListLongMap!2805)

(assert (=> b!204485 (= lt!103578 (getCurrentListMap!964 _keys!825 lt!103577 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103584 () ListLongMap!2805)

(declare-fun lt!103580 () ListLongMap!2805)

(assert (=> b!204485 (and (= lt!103584 lt!103580) (= lt!103580 lt!103584))))

(declare-fun lt!103581 () ListLongMap!2805)

(declare-fun lt!103586 () tuple2!3902)

(declare-fun +!467 (ListLongMap!2805 tuple2!3902) ListLongMap!2805)

(assert (=> b!204485 (= lt!103580 (+!467 lt!103581 lt!103586))))

(declare-fun v!520 () V!6417)

(assert (=> b!204485 (= lt!103586 (tuple2!3903 k0!843 v!520))))

(declare-datatypes ((Unit!6176 0))(
  ( (Unit!6177) )
))
(declare-fun lt!103583 () Unit!6176)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!123 (array!9359 array!9361 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) (_ BitVec 64) V!6417 (_ BitVec 32) Int) Unit!6176)

(assert (=> b!204485 (= lt!103583 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!123 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!374 (array!9359 array!9361 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) Int) ListLongMap!2805)

(assert (=> b!204485 (= lt!103584 (getCurrentListMapNoExtraKeys!374 _keys!825 lt!103577 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204485 (= lt!103577 (array!9362 (store (arr!4430 _values!649) i!601 (ValueCellFull!2195 v!520)) (size!4756 _values!649)))))

(assert (=> b!204485 (= lt!103581 (getCurrentListMapNoExtraKeys!374 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204487 () Bool)

(declare-fun e!133773 () Bool)

(assert (=> b!204487 (= e!133773 true)))

(declare-fun lt!103585 () ListLongMap!2805)

(declare-fun lt!103582 () ListLongMap!2805)

(assert (=> b!204487 (= lt!103585 (+!467 lt!103582 lt!103586))))

(declare-fun lt!103579 () Unit!6176)

(declare-fun addCommutativeForDiffKeys!157 (ListLongMap!2805 (_ BitVec 64) V!6417 (_ BitVec 64) V!6417) Unit!6176)

(assert (=> b!204487 (= lt!103579 (addCommutativeForDiffKeys!157 lt!103581 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204488 () Bool)

(assert (=> b!204488 (= e!133768 e!133773)))

(declare-fun res!98556 () Bool)

(assert (=> b!204488 (=> res!98556 e!133773)))

(assert (=> b!204488 (= res!98556 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204488 (= lt!103576 lt!103582)))

(declare-fun lt!103575 () tuple2!3902)

(assert (=> b!204488 (= lt!103582 (+!467 lt!103581 lt!103575))))

(assert (=> b!204488 (= lt!103578 lt!103585)))

(assert (=> b!204488 (= lt!103585 (+!467 lt!103580 lt!103575))))

(assert (=> b!204488 (= lt!103578 (+!467 lt!103584 lt!103575))))

(assert (=> b!204488 (= lt!103575 (tuple2!3903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20566 res!98557) b!204478))

(assert (= (and b!204478 res!98558) b!204481))

(assert (= (and b!204481 res!98555) b!204480))

(assert (= (and b!204480 res!98553) b!204477))

(assert (= (and b!204477 res!98554) b!204482))

(assert (= (and b!204482 res!98550) b!204486))

(assert (= (and b!204486 res!98552) b!204485))

(assert (= (and b!204485 (not res!98551)) b!204488))

(assert (= (and b!204488 (not res!98556)) b!204487))

(assert (= (and b!204483 condMapEmpty!8684) mapIsEmpty!8684))

(assert (= (and b!204483 (not condMapEmpty!8684)) mapNonEmpty!8684))

(get-info :version)

(assert (= (and mapNonEmpty!8684 ((_ is ValueCellFull!2195) mapValue!8684)) b!204479))

(assert (= (and b!204483 ((_ is ValueCellFull!2195) mapDefault!8684)) b!204484))

(assert (= start!20566 b!204483))

(declare-fun m!231543 () Bool)

(assert (=> b!204482 m!231543))

(declare-fun m!231545 () Bool)

(assert (=> start!20566 m!231545))

(declare-fun m!231547 () Bool)

(assert (=> start!20566 m!231547))

(declare-fun m!231549 () Bool)

(assert (=> start!20566 m!231549))

(declare-fun m!231551 () Bool)

(assert (=> b!204485 m!231551))

(declare-fun m!231553 () Bool)

(assert (=> b!204485 m!231553))

(declare-fun m!231555 () Bool)

(assert (=> b!204485 m!231555))

(declare-fun m!231557 () Bool)

(assert (=> b!204485 m!231557))

(declare-fun m!231559 () Bool)

(assert (=> b!204485 m!231559))

(declare-fun m!231561 () Bool)

(assert (=> b!204485 m!231561))

(declare-fun m!231563 () Bool)

(assert (=> b!204485 m!231563))

(declare-fun m!231565 () Bool)

(assert (=> b!204480 m!231565))

(declare-fun m!231567 () Bool)

(assert (=> mapNonEmpty!8684 m!231567))

(declare-fun m!231569 () Bool)

(assert (=> b!204486 m!231569))

(declare-fun m!231571 () Bool)

(assert (=> b!204488 m!231571))

(declare-fun m!231573 () Bool)

(assert (=> b!204488 m!231573))

(declare-fun m!231575 () Bool)

(assert (=> b!204488 m!231575))

(declare-fun m!231577 () Bool)

(assert (=> b!204481 m!231577))

(declare-fun m!231579 () Bool)

(assert (=> b!204487 m!231579))

(declare-fun m!231581 () Bool)

(assert (=> b!204487 m!231581))

(check-sat (not b!204487) b_and!11941 (not b!204488) (not b!204480) (not b!204485) (not b!204482) tp_is_empty!5077 (not mapNonEmpty!8684) (not b_next!5221) (not b!204481) (not start!20566))
(check-sat b_and!11941 (not b_next!5221))
