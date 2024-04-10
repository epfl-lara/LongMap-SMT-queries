; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20342 () Bool)

(assert start!20342)

(declare-fun b_free!5001 () Bool)

(declare-fun b_next!5001 () Bool)

(assert (=> start!20342 (= b_free!5001 (not b_next!5001))))

(declare-fun tp!18035 () Bool)

(declare-fun b_and!11747 () Bool)

(assert (=> start!20342 (= tp!18035 b_and!11747)))

(declare-fun b!200646 () Bool)

(declare-fun e!131559 () Bool)

(declare-fun e!131563 () Bool)

(declare-fun mapRes!8354 () Bool)

(assert (=> b!200646 (= e!131559 (and e!131563 mapRes!8354))))

(declare-fun condMapEmpty!8354 () Bool)

(declare-datatypes ((V!6123 0))(
  ( (V!6124 (val!2473 Int)) )
))
(declare-datatypes ((ValueCell!2085 0))(
  ( (ValueCellFull!2085 (v!4443 V!6123)) (EmptyCell!2085) )
))
(declare-datatypes ((array!8945 0))(
  ( (array!8946 (arr!4223 (Array (_ BitVec 32) ValueCell!2085)) (size!4548 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8945)

(declare-fun mapDefault!8354 () ValueCell!2085)

(assert (=> b!200646 (= condMapEmpty!8354 (= (arr!4223 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2085)) mapDefault!8354)))))

(declare-fun b!200647 () Bool)

(declare-fun e!131562 () Bool)

(declare-fun e!131560 () Bool)

(assert (=> b!200647 (= e!131562 (not e!131560))))

(declare-fun res!95661 () Bool)

(assert (=> b!200647 (=> res!95661 e!131560)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200647 (= res!95661 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6123)

(declare-datatypes ((array!8947 0))(
  ( (array!8948 (arr!4224 (Array (_ BitVec 32) (_ BitVec 64))) (size!4549 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8947)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3738 0))(
  ( (tuple2!3739 (_1!1880 (_ BitVec 64)) (_2!1880 V!6123)) )
))
(declare-datatypes ((List!2655 0))(
  ( (Nil!2652) (Cons!2651 (h!3293 tuple2!3738) (t!7586 List!2655)) )
))
(declare-datatypes ((ListLongMap!2651 0))(
  ( (ListLongMap!2652 (toList!1341 List!2655)) )
))
(declare-fun lt!99314 () ListLongMap!2651)

(declare-fun minValue!615 () V!6123)

(declare-fun getCurrentListMap!931 (array!8947 array!8945 (_ BitVec 32) (_ BitVec 32) V!6123 V!6123 (_ BitVec 32) Int) ListLongMap!2651)

(assert (=> b!200647 (= lt!99314 (getCurrentListMap!931 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99313 () array!8945)

(declare-fun lt!99312 () ListLongMap!2651)

(assert (=> b!200647 (= lt!99312 (getCurrentListMap!931 _keys!825 lt!99313 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99325 () ListLongMap!2651)

(declare-fun lt!99318 () ListLongMap!2651)

(assert (=> b!200647 (and (= lt!99325 lt!99318) (= lt!99318 lt!99325))))

(declare-fun lt!99316 () ListLongMap!2651)

(declare-fun lt!99315 () tuple2!3738)

(declare-fun +!368 (ListLongMap!2651 tuple2!3738) ListLongMap!2651)

(assert (=> b!200647 (= lt!99318 (+!368 lt!99316 lt!99315))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6123)

(assert (=> b!200647 (= lt!99315 (tuple2!3739 k0!843 v!520))))

(declare-datatypes ((Unit!6036 0))(
  ( (Unit!6037) )
))
(declare-fun lt!99327 () Unit!6036)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!44 (array!8947 array!8945 (_ BitVec 32) (_ BitVec 32) V!6123 V!6123 (_ BitVec 32) (_ BitVec 64) V!6123 (_ BitVec 32) Int) Unit!6036)

(assert (=> b!200647 (= lt!99327 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!44 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!305 (array!8947 array!8945 (_ BitVec 32) (_ BitVec 32) V!6123 V!6123 (_ BitVec 32) Int) ListLongMap!2651)

(assert (=> b!200647 (= lt!99325 (getCurrentListMapNoExtraKeys!305 _keys!825 lt!99313 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200647 (= lt!99313 (array!8946 (store (arr!4223 _values!649) i!601 (ValueCellFull!2085 v!520)) (size!4548 _values!649)))))

(assert (=> b!200647 (= lt!99316 (getCurrentListMapNoExtraKeys!305 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200648 () Bool)

(declare-fun res!95665 () Bool)

(assert (=> b!200648 (=> (not res!95665) (not e!131562))))

(declare-datatypes ((List!2656 0))(
  ( (Nil!2653) (Cons!2652 (h!3294 (_ BitVec 64)) (t!7587 List!2656)) )
))
(declare-fun arrayNoDuplicates!0 (array!8947 (_ BitVec 32) List!2656) Bool)

(assert (=> b!200648 (= res!95665 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2653))))

(declare-fun res!95659 () Bool)

(assert (=> start!20342 (=> (not res!95659) (not e!131562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20342 (= res!95659 (validMask!0 mask!1149))))

(assert (=> start!20342 e!131562))

(declare-fun array_inv!2779 (array!8945) Bool)

(assert (=> start!20342 (and (array_inv!2779 _values!649) e!131559)))

(assert (=> start!20342 true))

(declare-fun tp_is_empty!4857 () Bool)

(assert (=> start!20342 tp_is_empty!4857))

(declare-fun array_inv!2780 (array!8947) Bool)

(assert (=> start!20342 (array_inv!2780 _keys!825)))

(assert (=> start!20342 tp!18035))

(declare-fun b!200649 () Bool)

(declare-fun e!131561 () Bool)

(assert (=> b!200649 (= e!131561 true)))

(declare-fun lt!99320 () tuple2!3738)

(declare-fun lt!99319 () ListLongMap!2651)

(declare-fun lt!99326 () ListLongMap!2651)

(assert (=> b!200649 (= (+!368 lt!99326 lt!99320) (+!368 lt!99319 lt!99315))))

(declare-fun lt!99322 () ListLongMap!2651)

(declare-fun lt!99317 () Unit!6036)

(declare-fun addCommutativeForDiffKeys!90 (ListLongMap!2651 (_ BitVec 64) V!6123 (_ BitVec 64) V!6123) Unit!6036)

(assert (=> b!200649 (= lt!99317 (addCommutativeForDiffKeys!90 lt!99322 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8354 () Bool)

(declare-fun tp!18034 () Bool)

(declare-fun e!131564 () Bool)

(assert (=> mapNonEmpty!8354 (= mapRes!8354 (and tp!18034 e!131564))))

(declare-fun mapValue!8354 () ValueCell!2085)

(declare-fun mapRest!8354 () (Array (_ BitVec 32) ValueCell!2085))

(declare-fun mapKey!8354 () (_ BitVec 32))

(assert (=> mapNonEmpty!8354 (= (arr!4223 _values!649) (store mapRest!8354 mapKey!8354 mapValue!8354))))

(declare-fun b!200650 () Bool)

(declare-fun res!95663 () Bool)

(assert (=> b!200650 (=> (not res!95663) (not e!131562))))

(assert (=> b!200650 (= res!95663 (= (select (arr!4224 _keys!825) i!601) k0!843))))

(declare-fun b!200651 () Bool)

(assert (=> b!200651 (= e!131563 tp_is_empty!4857)))

(declare-fun b!200652 () Bool)

(declare-fun res!95657 () Bool)

(assert (=> b!200652 (=> (not res!95657) (not e!131562))))

(assert (=> b!200652 (= res!95657 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4549 _keys!825))))))

(declare-fun b!200653 () Bool)

(assert (=> b!200653 (= e!131560 e!131561)))

(declare-fun res!95664 () Bool)

(assert (=> b!200653 (=> res!95664 e!131561)))

(assert (=> b!200653 (= res!95664 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99323 () ListLongMap!2651)

(assert (=> b!200653 (= lt!99323 lt!99326)))

(assert (=> b!200653 (= lt!99326 (+!368 lt!99322 lt!99315))))

(declare-fun lt!99324 () Unit!6036)

(assert (=> b!200653 (= lt!99324 (addCommutativeForDiffKeys!90 lt!99316 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!200653 (= lt!99312 (+!368 lt!99323 lt!99320))))

(declare-fun lt!99321 () tuple2!3738)

(assert (=> b!200653 (= lt!99323 (+!368 lt!99318 lt!99321))))

(assert (=> b!200653 (= lt!99314 lt!99319)))

(assert (=> b!200653 (= lt!99319 (+!368 lt!99322 lt!99320))))

(assert (=> b!200653 (= lt!99322 (+!368 lt!99316 lt!99321))))

(assert (=> b!200653 (= lt!99312 (+!368 (+!368 lt!99325 lt!99321) lt!99320))))

(assert (=> b!200653 (= lt!99320 (tuple2!3739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200653 (= lt!99321 (tuple2!3739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200654 () Bool)

(declare-fun res!95658 () Bool)

(assert (=> b!200654 (=> (not res!95658) (not e!131562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200654 (= res!95658 (validKeyInArray!0 k0!843))))

(declare-fun b!200655 () Bool)

(declare-fun res!95660 () Bool)

(assert (=> b!200655 (=> (not res!95660) (not e!131562))))

(assert (=> b!200655 (= res!95660 (and (= (size!4548 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4549 _keys!825) (size!4548 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200656 () Bool)

(declare-fun res!95662 () Bool)

(assert (=> b!200656 (=> (not res!95662) (not e!131562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8947 (_ BitVec 32)) Bool)

(assert (=> b!200656 (= res!95662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200657 () Bool)

(assert (=> b!200657 (= e!131564 tp_is_empty!4857)))

(declare-fun mapIsEmpty!8354 () Bool)

(assert (=> mapIsEmpty!8354 mapRes!8354))

(assert (= (and start!20342 res!95659) b!200655))

(assert (= (and b!200655 res!95660) b!200656))

(assert (= (and b!200656 res!95662) b!200648))

(assert (= (and b!200648 res!95665) b!200652))

(assert (= (and b!200652 res!95657) b!200654))

(assert (= (and b!200654 res!95658) b!200650))

(assert (= (and b!200650 res!95663) b!200647))

(assert (= (and b!200647 (not res!95661)) b!200653))

(assert (= (and b!200653 (not res!95664)) b!200649))

(assert (= (and b!200646 condMapEmpty!8354) mapIsEmpty!8354))

(assert (= (and b!200646 (not condMapEmpty!8354)) mapNonEmpty!8354))

(get-info :version)

(assert (= (and mapNonEmpty!8354 ((_ is ValueCellFull!2085) mapValue!8354)) b!200657))

(assert (= (and b!200646 ((_ is ValueCellFull!2085) mapDefault!8354)) b!200651))

(assert (= start!20342 b!200646))

(declare-fun m!227219 () Bool)

(assert (=> mapNonEmpty!8354 m!227219))

(declare-fun m!227221 () Bool)

(assert (=> b!200647 m!227221))

(declare-fun m!227223 () Bool)

(assert (=> b!200647 m!227223))

(declare-fun m!227225 () Bool)

(assert (=> b!200647 m!227225))

(declare-fun m!227227 () Bool)

(assert (=> b!200647 m!227227))

(declare-fun m!227229 () Bool)

(assert (=> b!200647 m!227229))

(declare-fun m!227231 () Bool)

(assert (=> b!200647 m!227231))

(declare-fun m!227233 () Bool)

(assert (=> b!200647 m!227233))

(declare-fun m!227235 () Bool)

(assert (=> start!20342 m!227235))

(declare-fun m!227237 () Bool)

(assert (=> start!20342 m!227237))

(declare-fun m!227239 () Bool)

(assert (=> start!20342 m!227239))

(declare-fun m!227241 () Bool)

(assert (=> b!200656 m!227241))

(declare-fun m!227243 () Bool)

(assert (=> b!200653 m!227243))

(declare-fun m!227245 () Bool)

(assert (=> b!200653 m!227245))

(declare-fun m!227247 () Bool)

(assert (=> b!200653 m!227247))

(declare-fun m!227249 () Bool)

(assert (=> b!200653 m!227249))

(declare-fun m!227251 () Bool)

(assert (=> b!200653 m!227251))

(declare-fun m!227253 () Bool)

(assert (=> b!200653 m!227253))

(declare-fun m!227255 () Bool)

(assert (=> b!200653 m!227255))

(assert (=> b!200653 m!227243))

(declare-fun m!227257 () Bool)

(assert (=> b!200653 m!227257))

(declare-fun m!227259 () Bool)

(assert (=> b!200650 m!227259))

(declare-fun m!227261 () Bool)

(assert (=> b!200648 m!227261))

(declare-fun m!227263 () Bool)

(assert (=> b!200654 m!227263))

(declare-fun m!227265 () Bool)

(assert (=> b!200649 m!227265))

(declare-fun m!227267 () Bool)

(assert (=> b!200649 m!227267))

(declare-fun m!227269 () Bool)

(assert (=> b!200649 m!227269))

(check-sat (not b!200653) tp_is_empty!4857 (not mapNonEmpty!8354) b_and!11747 (not b!200648) (not start!20342) (not b_next!5001) (not b!200654) (not b!200647) (not b!200656) (not b!200649))
(check-sat b_and!11747 (not b_next!5001))
