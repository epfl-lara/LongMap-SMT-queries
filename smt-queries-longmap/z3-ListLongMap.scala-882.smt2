; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20392 () Bool)

(assert start!20392)

(declare-fun b_free!5047 () Bool)

(declare-fun b_next!5047 () Bool)

(assert (=> start!20392 (= b_free!5047 (not b_next!5047))))

(declare-fun tp!18172 () Bool)

(declare-fun b_and!11807 () Bool)

(assert (=> start!20392 (= tp!18172 b_and!11807)))

(declare-fun b!201521 () Bool)

(declare-fun res!96306 () Bool)

(declare-fun e!132071 () Bool)

(assert (=> b!201521 (=> (not res!96306) (not e!132071))))

(declare-datatypes ((array!9029 0))(
  ( (array!9030 (arr!4265 (Array (_ BitVec 32) (_ BitVec 64))) (size!4590 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9029)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201521 (= res!96306 (= (select (arr!4265 _keys!825) i!601) k0!843))))

(declare-fun b!201523 () Bool)

(declare-fun e!132067 () Bool)

(declare-fun e!132065 () Bool)

(declare-fun mapRes!8423 () Bool)

(assert (=> b!201523 (= e!132067 (and e!132065 mapRes!8423))))

(declare-fun condMapEmpty!8423 () Bool)

(declare-datatypes ((V!6185 0))(
  ( (V!6186 (val!2496 Int)) )
))
(declare-datatypes ((ValueCell!2108 0))(
  ( (ValueCellFull!2108 (v!4467 V!6185)) (EmptyCell!2108) )
))
(declare-datatypes ((array!9031 0))(
  ( (array!9032 (arr!4266 (Array (_ BitVec 32) ValueCell!2108)) (size!4591 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9031)

(declare-fun mapDefault!8423 () ValueCell!2108)

(assert (=> b!201523 (= condMapEmpty!8423 (= (arr!4266 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2108)) mapDefault!8423)))))

(declare-fun mapNonEmpty!8423 () Bool)

(declare-fun tp!18173 () Bool)

(declare-fun e!132069 () Bool)

(assert (=> mapNonEmpty!8423 (= mapRes!8423 (and tp!18173 e!132069))))

(declare-fun mapRest!8423 () (Array (_ BitVec 32) ValueCell!2108))

(declare-fun mapKey!8423 () (_ BitVec 32))

(declare-fun mapValue!8423 () ValueCell!2108)

(assert (=> mapNonEmpty!8423 (= (arr!4266 _values!649) (store mapRest!8423 mapKey!8423 mapValue!8423))))

(declare-fun mapIsEmpty!8423 () Bool)

(assert (=> mapIsEmpty!8423 mapRes!8423))

(declare-fun b!201524 () Bool)

(declare-fun e!132068 () Bool)

(declare-fun e!132070 () Bool)

(assert (=> b!201524 (= e!132068 e!132070)))

(declare-fun res!96301 () Bool)

(assert (=> b!201524 (=> res!96301 e!132070)))

(assert (=> b!201524 (= res!96301 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3716 0))(
  ( (tuple2!3717 (_1!1869 (_ BitVec 64)) (_2!1869 V!6185)) )
))
(declare-datatypes ((List!2627 0))(
  ( (Nil!2624) (Cons!2623 (h!3265 tuple2!3716) (t!7550 List!2627)) )
))
(declare-datatypes ((ListLongMap!2631 0))(
  ( (ListLongMap!2632 (toList!1331 List!2627)) )
))
(declare-fun lt!100490 () ListLongMap!2631)

(declare-fun lt!100488 () ListLongMap!2631)

(assert (=> b!201524 (= lt!100490 lt!100488)))

(declare-fun lt!100489 () ListLongMap!2631)

(declare-fun lt!100480 () tuple2!3716)

(declare-fun +!385 (ListLongMap!2631 tuple2!3716) ListLongMap!2631)

(assert (=> b!201524 (= lt!100488 (+!385 lt!100489 lt!100480))))

(declare-fun lt!100478 () ListLongMap!2631)

(declare-fun v!520 () V!6185)

(declare-fun zeroValue!615 () V!6185)

(declare-datatypes ((Unit!6054 0))(
  ( (Unit!6055) )
))
(declare-fun lt!100487 () Unit!6054)

(declare-fun addCommutativeForDiffKeys!108 (ListLongMap!2631 (_ BitVec 64) V!6185 (_ BitVec 64) V!6185) Unit!6054)

(assert (=> b!201524 (= lt!100487 (addCommutativeForDiffKeys!108 lt!100478 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100481 () ListLongMap!2631)

(declare-fun lt!100476 () tuple2!3716)

(assert (=> b!201524 (= lt!100481 (+!385 lt!100490 lt!100476))))

(declare-fun lt!100484 () ListLongMap!2631)

(declare-fun lt!100486 () tuple2!3716)

(assert (=> b!201524 (= lt!100490 (+!385 lt!100484 lt!100486))))

(declare-fun lt!100479 () ListLongMap!2631)

(declare-fun lt!100477 () ListLongMap!2631)

(assert (=> b!201524 (= lt!100479 lt!100477)))

(assert (=> b!201524 (= lt!100477 (+!385 lt!100489 lt!100476))))

(assert (=> b!201524 (= lt!100489 (+!385 lt!100478 lt!100486))))

(declare-fun lt!100485 () ListLongMap!2631)

(assert (=> b!201524 (= lt!100481 (+!385 (+!385 lt!100485 lt!100486) lt!100476))))

(declare-fun minValue!615 () V!6185)

(assert (=> b!201524 (= lt!100476 (tuple2!3717 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201524 (= lt!100486 (tuple2!3717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201525 () Bool)

(assert (=> b!201525 (= e!132071 (not e!132068))))

(declare-fun res!96307 () Bool)

(assert (=> b!201525 (=> res!96307 e!132068)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201525 (= res!96307 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!921 (array!9029 array!9031 (_ BitVec 32) (_ BitVec 32) V!6185 V!6185 (_ BitVec 32) Int) ListLongMap!2631)

(assert (=> b!201525 (= lt!100479 (getCurrentListMap!921 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100482 () array!9031)

(assert (=> b!201525 (= lt!100481 (getCurrentListMap!921 _keys!825 lt!100482 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201525 (and (= lt!100485 lt!100484) (= lt!100484 lt!100485))))

(assert (=> b!201525 (= lt!100484 (+!385 lt!100478 lt!100480))))

(assert (=> b!201525 (= lt!100480 (tuple2!3717 k0!843 v!520))))

(declare-fun lt!100483 () Unit!6054)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!57 (array!9029 array!9031 (_ BitVec 32) (_ BitVec 32) V!6185 V!6185 (_ BitVec 32) (_ BitVec 64) V!6185 (_ BitVec 32) Int) Unit!6054)

(assert (=> b!201525 (= lt!100483 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!57 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!314 (array!9029 array!9031 (_ BitVec 32) (_ BitVec 32) V!6185 V!6185 (_ BitVec 32) Int) ListLongMap!2631)

(assert (=> b!201525 (= lt!100485 (getCurrentListMapNoExtraKeys!314 _keys!825 lt!100482 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201525 (= lt!100482 (array!9032 (store (arr!4266 _values!649) i!601 (ValueCellFull!2108 v!520)) (size!4591 _values!649)))))

(assert (=> b!201525 (= lt!100478 (getCurrentListMapNoExtraKeys!314 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201526 () Bool)

(declare-fun res!96305 () Bool)

(assert (=> b!201526 (=> (not res!96305) (not e!132071))))

(assert (=> b!201526 (= res!96305 (and (= (size!4591 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4590 _keys!825) (size!4591 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201527 () Bool)

(declare-fun res!96303 () Bool)

(assert (=> b!201527 (=> (not res!96303) (not e!132071))))

(declare-datatypes ((List!2628 0))(
  ( (Nil!2625) (Cons!2624 (h!3266 (_ BitVec 64)) (t!7551 List!2628)) )
))
(declare-fun arrayNoDuplicates!0 (array!9029 (_ BitVec 32) List!2628) Bool)

(assert (=> b!201527 (= res!96303 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2625))))

(declare-fun b!201528 () Bool)

(declare-fun res!96304 () Bool)

(assert (=> b!201528 (=> (not res!96304) (not e!132071))))

(assert (=> b!201528 (= res!96304 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4590 _keys!825))))))

(declare-fun b!201529 () Bool)

(declare-fun res!96300 () Bool)

(assert (=> b!201529 (=> (not res!96300) (not e!132071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9029 (_ BitVec 32)) Bool)

(assert (=> b!201529 (= res!96300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201530 () Bool)

(declare-fun tp_is_empty!4903 () Bool)

(assert (=> b!201530 (= e!132069 tp_is_empty!4903)))

(declare-fun res!96302 () Bool)

(assert (=> start!20392 (=> (not res!96302) (not e!132071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20392 (= res!96302 (validMask!0 mask!1149))))

(assert (=> start!20392 e!132071))

(declare-fun array_inv!2779 (array!9031) Bool)

(assert (=> start!20392 (and (array_inv!2779 _values!649) e!132067)))

(assert (=> start!20392 true))

(assert (=> start!20392 tp_is_empty!4903))

(declare-fun array_inv!2780 (array!9029) Bool)

(assert (=> start!20392 (array_inv!2780 _keys!825)))

(assert (=> start!20392 tp!18172))

(declare-fun b!201522 () Bool)

(assert (=> b!201522 (= e!132065 tp_is_empty!4903)))

(declare-fun b!201531 () Bool)

(assert (=> b!201531 (= e!132070 true)))

(assert (=> b!201531 (= (+!385 lt!100488 lt!100476) (+!385 lt!100477 lt!100480))))

(declare-fun lt!100475 () Unit!6054)

(assert (=> b!201531 (= lt!100475 (addCommutativeForDiffKeys!108 lt!100489 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201532 () Bool)

(declare-fun res!96299 () Bool)

(assert (=> b!201532 (=> (not res!96299) (not e!132071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201532 (= res!96299 (validKeyInArray!0 k0!843))))

(assert (= (and start!20392 res!96302) b!201526))

(assert (= (and b!201526 res!96305) b!201529))

(assert (= (and b!201529 res!96300) b!201527))

(assert (= (and b!201527 res!96303) b!201528))

(assert (= (and b!201528 res!96304) b!201532))

(assert (= (and b!201532 res!96299) b!201521))

(assert (= (and b!201521 res!96306) b!201525))

(assert (= (and b!201525 (not res!96307)) b!201524))

(assert (= (and b!201524 (not res!96301)) b!201531))

(assert (= (and b!201523 condMapEmpty!8423) mapIsEmpty!8423))

(assert (= (and b!201523 (not condMapEmpty!8423)) mapNonEmpty!8423))

(get-info :version)

(assert (= (and mapNonEmpty!8423 ((_ is ValueCellFull!2108) mapValue!8423)) b!201530))

(assert (= (and b!201523 ((_ is ValueCellFull!2108) mapDefault!8423)) b!201522))

(assert (= start!20392 b!201523))

(declare-fun m!228597 () Bool)

(assert (=> b!201521 m!228597))

(declare-fun m!228599 () Bool)

(assert (=> b!201529 m!228599))

(declare-fun m!228601 () Bool)

(assert (=> b!201525 m!228601))

(declare-fun m!228603 () Bool)

(assert (=> b!201525 m!228603))

(declare-fun m!228605 () Bool)

(assert (=> b!201525 m!228605))

(declare-fun m!228607 () Bool)

(assert (=> b!201525 m!228607))

(declare-fun m!228609 () Bool)

(assert (=> b!201525 m!228609))

(declare-fun m!228611 () Bool)

(assert (=> b!201525 m!228611))

(declare-fun m!228613 () Bool)

(assert (=> b!201525 m!228613))

(declare-fun m!228615 () Bool)

(assert (=> b!201531 m!228615))

(declare-fun m!228617 () Bool)

(assert (=> b!201531 m!228617))

(declare-fun m!228619 () Bool)

(assert (=> b!201531 m!228619))

(declare-fun m!228621 () Bool)

(assert (=> b!201524 m!228621))

(declare-fun m!228623 () Bool)

(assert (=> b!201524 m!228623))

(declare-fun m!228625 () Bool)

(assert (=> b!201524 m!228625))

(declare-fun m!228627 () Bool)

(assert (=> b!201524 m!228627))

(declare-fun m!228629 () Bool)

(assert (=> b!201524 m!228629))

(declare-fun m!228631 () Bool)

(assert (=> b!201524 m!228631))

(assert (=> b!201524 m!228627))

(declare-fun m!228633 () Bool)

(assert (=> b!201524 m!228633))

(declare-fun m!228635 () Bool)

(assert (=> b!201524 m!228635))

(declare-fun m!228637 () Bool)

(assert (=> b!201532 m!228637))

(declare-fun m!228639 () Bool)

(assert (=> start!20392 m!228639))

(declare-fun m!228641 () Bool)

(assert (=> start!20392 m!228641))

(declare-fun m!228643 () Bool)

(assert (=> start!20392 m!228643))

(declare-fun m!228645 () Bool)

(assert (=> b!201527 m!228645))

(declare-fun m!228647 () Bool)

(assert (=> mapNonEmpty!8423 m!228647))

(check-sat tp_is_empty!4903 b_and!11807 (not b!201532) (not b!201524) (not mapNonEmpty!8423) (not b!201525) (not b!201531) (not b_next!5047) (not b!201527) (not b!201529) (not start!20392))
(check-sat b_and!11807 (not b_next!5047))
