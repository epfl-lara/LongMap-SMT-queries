; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20560 () Bool)

(assert start!20560)

(declare-fun b_free!5215 () Bool)

(declare-fun b_next!5215 () Bool)

(assert (=> start!20560 (= b_free!5215 (not b_next!5215))))

(declare-fun tp!18676 () Bool)

(declare-fun b_and!11975 () Bool)

(assert (=> start!20560 (= tp!18676 b_and!11975)))

(declare-fun b!204563 () Bool)

(declare-fun e!133835 () Bool)

(assert (=> b!204563 (= e!133835 true)))

(declare-datatypes ((V!6409 0))(
  ( (V!6410 (val!2580 Int)) )
))
(declare-datatypes ((tuple2!3860 0))(
  ( (tuple2!3861 (_1!1941 (_ BitVec 64)) (_2!1941 V!6409)) )
))
(declare-datatypes ((List!2754 0))(
  ( (Nil!2751) (Cons!2750 (h!3392 tuple2!3860) (t!7677 List!2754)) )
))
(declare-datatypes ((ListLongMap!2775 0))(
  ( (ListLongMap!2776 (toList!1403 List!2754)) )
))
(declare-fun lt!103712 () ListLongMap!2775)

(declare-fun lt!103709 () ListLongMap!2775)

(declare-fun lt!103715 () tuple2!3860)

(declare-fun +!457 (ListLongMap!2775 tuple2!3860) ListLongMap!2775)

(assert (=> b!204563 (= lt!103712 (+!457 lt!103709 lt!103715))))

(declare-datatypes ((Unit!6192 0))(
  ( (Unit!6193) )
))
(declare-fun lt!103710 () Unit!6192)

(declare-fun minValue!615 () V!6409)

(declare-fun lt!103718 () ListLongMap!2775)

(declare-fun v!520 () V!6409)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!165 (ListLongMap!2775 (_ BitVec 64) V!6409 (_ BitVec 64) V!6409) Unit!6192)

(assert (=> b!204563 (= lt!103710 (addCommutativeForDiffKeys!165 lt!103718 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8675 () Bool)

(declare-fun mapRes!8675 () Bool)

(declare-fun tp!18677 () Bool)

(declare-fun e!133831 () Bool)

(assert (=> mapNonEmpty!8675 (= mapRes!8675 (and tp!18677 e!133831))))

(declare-datatypes ((ValueCell!2192 0))(
  ( (ValueCellFull!2192 (v!4551 V!6409)) (EmptyCell!2192) )
))
(declare-fun mapRest!8675 () (Array (_ BitVec 32) ValueCell!2192))

(declare-fun mapKey!8675 () (_ BitVec 32))

(declare-datatypes ((array!9351 0))(
  ( (array!9352 (arr!4426 (Array (_ BitVec 32) ValueCell!2192)) (size!4751 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9351)

(declare-fun mapValue!8675 () ValueCell!2192)

(assert (=> mapNonEmpty!8675 (= (arr!4426 _values!649) (store mapRest!8675 mapKey!8675 mapValue!8675))))

(declare-fun b!204564 () Bool)

(declare-fun e!133832 () Bool)

(declare-fun e!133829 () Bool)

(assert (=> b!204564 (= e!133832 (and e!133829 mapRes!8675))))

(declare-fun condMapEmpty!8675 () Bool)

(declare-fun mapDefault!8675 () ValueCell!2192)

(assert (=> b!204564 (= condMapEmpty!8675 (= (arr!4426 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2192)) mapDefault!8675)))))

(declare-fun b!204565 () Bool)

(declare-fun res!98590 () Bool)

(declare-fun e!133830 () Bool)

(assert (=> b!204565 (=> (not res!98590) (not e!133830))))

(declare-datatypes ((array!9353 0))(
  ( (array!9354 (arr!4427 (Array (_ BitVec 32) (_ BitVec 64))) (size!4752 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9353)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!204565 (= res!98590 (and (= (size!4751 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4752 _keys!825) (size!4751 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204566 () Bool)

(declare-fun tp_is_empty!5071 () Bool)

(assert (=> b!204566 (= e!133831 tp_is_empty!5071)))

(declare-fun b!204567 () Bool)

(declare-fun res!98591 () Bool)

(assert (=> b!204567 (=> (not res!98591) (not e!133830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204567 (= res!98591 (validKeyInArray!0 k0!843))))

(declare-fun res!98586 () Bool)

(assert (=> start!20560 (=> (not res!98586) (not e!133830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20560 (= res!98586 (validMask!0 mask!1149))))

(assert (=> start!20560 e!133830))

(declare-fun array_inv!2895 (array!9351) Bool)

(assert (=> start!20560 (and (array_inv!2895 _values!649) e!133832)))

(assert (=> start!20560 true))

(assert (=> start!20560 tp_is_empty!5071))

(declare-fun array_inv!2896 (array!9353) Bool)

(assert (=> start!20560 (array_inv!2896 _keys!825)))

(assert (=> start!20560 tp!18676))

(declare-fun b!204568 () Bool)

(declare-fun res!98593 () Bool)

(assert (=> b!204568 (=> (not res!98593) (not e!133830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9353 (_ BitVec 32)) Bool)

(assert (=> b!204568 (= res!98593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204569 () Bool)

(declare-fun e!133833 () Bool)

(assert (=> b!204569 (= e!133830 (not e!133833))))

(declare-fun res!98592 () Bool)

(assert (=> b!204569 (=> res!98592 e!133833)))

(assert (=> b!204569 (= res!98592 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!103713 () ListLongMap!2775)

(declare-fun zeroValue!615 () V!6409)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!978 (array!9353 array!9351 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) Int) ListLongMap!2775)

(assert (=> b!204569 (= lt!103713 (getCurrentListMap!978 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103714 () ListLongMap!2775)

(declare-fun lt!103708 () array!9351)

(assert (=> b!204569 (= lt!103714 (getCurrentListMap!978 _keys!825 lt!103708 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103711 () ListLongMap!2775)

(declare-fun lt!103707 () ListLongMap!2775)

(assert (=> b!204569 (and (= lt!103711 lt!103707) (= lt!103707 lt!103711))))

(assert (=> b!204569 (= lt!103707 (+!457 lt!103718 lt!103715))))

(assert (=> b!204569 (= lt!103715 (tuple2!3861 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lt!103716 () Unit!6192)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!114 (array!9353 array!9351 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) (_ BitVec 64) V!6409 (_ BitVec 32) Int) Unit!6192)

(assert (=> b!204569 (= lt!103716 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!114 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!371 (array!9353 array!9351 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) Int) ListLongMap!2775)

(assert (=> b!204569 (= lt!103711 (getCurrentListMapNoExtraKeys!371 _keys!825 lt!103708 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204569 (= lt!103708 (array!9352 (store (arr!4426 _values!649) i!601 (ValueCellFull!2192 v!520)) (size!4751 _values!649)))))

(assert (=> b!204569 (= lt!103718 (getCurrentListMapNoExtraKeys!371 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204570 () Bool)

(declare-fun res!98587 () Bool)

(assert (=> b!204570 (=> (not res!98587) (not e!133830))))

(assert (=> b!204570 (= res!98587 (= (select (arr!4427 _keys!825) i!601) k0!843))))

(declare-fun b!204571 () Bool)

(assert (=> b!204571 (= e!133829 tp_is_empty!5071)))

(declare-fun b!204572 () Bool)

(declare-fun res!98589 () Bool)

(assert (=> b!204572 (=> (not res!98589) (not e!133830))))

(declare-datatypes ((List!2755 0))(
  ( (Nil!2752) (Cons!2751 (h!3393 (_ BitVec 64)) (t!7678 List!2755)) )
))
(declare-fun arrayNoDuplicates!0 (array!9353 (_ BitVec 32) List!2755) Bool)

(assert (=> b!204572 (= res!98589 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2752))))

(declare-fun b!204573 () Bool)

(declare-fun res!98588 () Bool)

(assert (=> b!204573 (=> (not res!98588) (not e!133830))))

(assert (=> b!204573 (= res!98588 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4752 _keys!825))))))

(declare-fun b!204574 () Bool)

(assert (=> b!204574 (= e!133833 e!133835)))

(declare-fun res!98585 () Bool)

(assert (=> b!204574 (=> res!98585 e!133835)))

(assert (=> b!204574 (= res!98585 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204574 (= lt!103713 lt!103709)))

(declare-fun lt!103717 () tuple2!3860)

(assert (=> b!204574 (= lt!103709 (+!457 lt!103718 lt!103717))))

(assert (=> b!204574 (= lt!103714 lt!103712)))

(assert (=> b!204574 (= lt!103712 (+!457 lt!103707 lt!103717))))

(assert (=> b!204574 (= lt!103714 (+!457 lt!103711 lt!103717))))

(assert (=> b!204574 (= lt!103717 (tuple2!3861 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8675 () Bool)

(assert (=> mapIsEmpty!8675 mapRes!8675))

(assert (= (and start!20560 res!98586) b!204565))

(assert (= (and b!204565 res!98590) b!204568))

(assert (= (and b!204568 res!98593) b!204572))

(assert (= (and b!204572 res!98589) b!204573))

(assert (= (and b!204573 res!98588) b!204567))

(assert (= (and b!204567 res!98591) b!204570))

(assert (= (and b!204570 res!98587) b!204569))

(assert (= (and b!204569 (not res!98592)) b!204574))

(assert (= (and b!204574 (not res!98585)) b!204563))

(assert (= (and b!204564 condMapEmpty!8675) mapIsEmpty!8675))

(assert (= (and b!204564 (not condMapEmpty!8675)) mapNonEmpty!8675))

(get-info :version)

(assert (= (and mapNonEmpty!8675 ((_ is ValueCellFull!2192) mapValue!8675)) b!204566))

(assert (= (and b!204564 ((_ is ValueCellFull!2192) mapDefault!8675)) b!204571))

(assert (= start!20560 b!204564))

(declare-fun m!232221 () Bool)

(assert (=> b!204563 m!232221))

(declare-fun m!232223 () Bool)

(assert (=> b!204563 m!232223))

(declare-fun m!232225 () Bool)

(assert (=> b!204569 m!232225))

(declare-fun m!232227 () Bool)

(assert (=> b!204569 m!232227))

(declare-fun m!232229 () Bool)

(assert (=> b!204569 m!232229))

(declare-fun m!232231 () Bool)

(assert (=> b!204569 m!232231))

(declare-fun m!232233 () Bool)

(assert (=> b!204569 m!232233))

(declare-fun m!232235 () Bool)

(assert (=> b!204569 m!232235))

(declare-fun m!232237 () Bool)

(assert (=> b!204569 m!232237))

(declare-fun m!232239 () Bool)

(assert (=> b!204574 m!232239))

(declare-fun m!232241 () Bool)

(assert (=> b!204574 m!232241))

(declare-fun m!232243 () Bool)

(assert (=> b!204574 m!232243))

(declare-fun m!232245 () Bool)

(assert (=> b!204567 m!232245))

(declare-fun m!232247 () Bool)

(assert (=> mapNonEmpty!8675 m!232247))

(declare-fun m!232249 () Bool)

(assert (=> start!20560 m!232249))

(declare-fun m!232251 () Bool)

(assert (=> start!20560 m!232251))

(declare-fun m!232253 () Bool)

(assert (=> start!20560 m!232253))

(declare-fun m!232255 () Bool)

(assert (=> b!204568 m!232255))

(declare-fun m!232257 () Bool)

(assert (=> b!204570 m!232257))

(declare-fun m!232259 () Bool)

(assert (=> b!204572 m!232259))

(check-sat (not mapNonEmpty!8675) (not b!204574) b_and!11975 (not b_next!5215) (not b!204568) (not start!20560) (not b!204572) tp_is_empty!5071 (not b!204569) (not b!204567) (not b!204563))
(check-sat b_and!11975 (not b_next!5215))
