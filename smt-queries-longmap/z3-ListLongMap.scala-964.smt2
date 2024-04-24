; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20924 () Bool)

(assert start!20924)

(declare-fun b_free!5533 () Bool)

(declare-fun b_next!5533 () Bool)

(assert (=> start!20924 (= b_free!5533 (not b_next!5533))))

(declare-fun tp!19646 () Bool)

(declare-fun b_and!12317 () Bool)

(assert (=> start!20924 (= tp!19646 b_and!12317)))

(declare-fun b!210109 () Bool)

(declare-fun res!102462 () Bool)

(declare-fun e!136844 () Bool)

(assert (=> b!210109 (=> (not res!102462) (not e!136844))))

(declare-datatypes ((array!9985 0))(
  ( (array!9986 (arr!4741 (Array (_ BitVec 32) (_ BitVec 64))) (size!5066 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9985)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9985 (_ BitVec 32)) Bool)

(assert (=> b!210109 (= res!102462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210110 () Bool)

(declare-fun e!136845 () Bool)

(declare-fun tp_is_empty!5395 () Bool)

(assert (=> b!210110 (= e!136845 tp_is_empty!5395)))

(declare-fun b!210111 () Bool)

(declare-fun e!136841 () Bool)

(assert (=> b!210111 (= e!136844 (not e!136841))))

(declare-fun res!102460 () Bool)

(assert (=> b!210111 (=> res!102460 e!136841)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210111 (= res!102460 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6841 0))(
  ( (V!6842 (val!2742 Int)) )
))
(declare-datatypes ((ValueCell!2354 0))(
  ( (ValueCellFull!2354 (v!4721 V!6841)) (EmptyCell!2354) )
))
(declare-datatypes ((array!9987 0))(
  ( (array!9988 (arr!4742 (Array (_ BitVec 32) ValueCell!2354)) (size!5067 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9987)

(declare-datatypes ((tuple2!4090 0))(
  ( (tuple2!4091 (_1!2056 (_ BitVec 64)) (_2!2056 V!6841)) )
))
(declare-datatypes ((List!2976 0))(
  ( (Nil!2973) (Cons!2972 (h!3614 tuple2!4090) (t!7903 List!2976)) )
))
(declare-datatypes ((ListLongMap!3005 0))(
  ( (ListLongMap!3006 (toList!1518 List!2976)) )
))
(declare-fun lt!107557 () ListLongMap!3005)

(declare-fun zeroValue!615 () V!6841)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6841)

(declare-fun getCurrentListMap!1058 (array!9985 array!9987 (_ BitVec 32) (_ BitVec 32) V!6841 V!6841 (_ BitVec 32) Int) ListLongMap!3005)

(assert (=> b!210111 (= lt!107557 (getCurrentListMap!1058 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107558 () array!9987)

(declare-fun lt!107559 () ListLongMap!3005)

(assert (=> b!210111 (= lt!107559 (getCurrentListMap!1058 _keys!825 lt!107558 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107556 () ListLongMap!3005)

(declare-fun lt!107554 () ListLongMap!3005)

(assert (=> b!210111 (and (= lt!107556 lt!107554) (= lt!107554 lt!107556))))

(declare-fun lt!107552 () ListLongMap!3005)

(declare-fun v!520 () V!6841)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!547 (ListLongMap!3005 tuple2!4090) ListLongMap!3005)

(assert (=> b!210111 (= lt!107554 (+!547 lt!107552 (tuple2!4091 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6374 0))(
  ( (Unit!6375) )
))
(declare-fun lt!107551 () Unit!6374)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!199 (array!9985 array!9987 (_ BitVec 32) (_ BitVec 32) V!6841 V!6841 (_ BitVec 32) (_ BitVec 64) V!6841 (_ BitVec 32) Int) Unit!6374)

(assert (=> b!210111 (= lt!107551 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!199 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!481 (array!9985 array!9987 (_ BitVec 32) (_ BitVec 32) V!6841 V!6841 (_ BitVec 32) Int) ListLongMap!3005)

(assert (=> b!210111 (= lt!107556 (getCurrentListMapNoExtraKeys!481 _keys!825 lt!107558 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210111 (= lt!107558 (array!9988 (store (arr!4742 _values!649) i!601 (ValueCellFull!2354 v!520)) (size!5067 _values!649)))))

(assert (=> b!210111 (= lt!107552 (getCurrentListMapNoExtraKeys!481 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210112 () Bool)

(declare-fun res!102463 () Bool)

(assert (=> b!210112 (=> (not res!102463) (not e!136844))))

(assert (=> b!210112 (= res!102463 (and (= (size!5067 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5066 _keys!825) (size!5067 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!102461 () Bool)

(assert (=> start!20924 (=> (not res!102461) (not e!136844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20924 (= res!102461 (validMask!0 mask!1149))))

(assert (=> start!20924 e!136844))

(declare-fun e!136839 () Bool)

(declare-fun array_inv!3111 (array!9987) Bool)

(assert (=> start!20924 (and (array_inv!3111 _values!649) e!136839)))

(assert (=> start!20924 true))

(assert (=> start!20924 tp_is_empty!5395))

(declare-fun array_inv!3112 (array!9985) Bool)

(assert (=> start!20924 (array_inv!3112 _keys!825)))

(assert (=> start!20924 tp!19646))

(declare-fun b!210113 () Bool)

(declare-fun res!102457 () Bool)

(assert (=> b!210113 (=> (not res!102457) (not e!136844))))

(assert (=> b!210113 (= res!102457 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5066 _keys!825))))))

(declare-fun b!210114 () Bool)

(declare-fun lt!107553 () tuple2!4090)

(declare-fun lt!107555 () tuple2!4090)

(assert (=> b!210114 (= e!136841 (= lt!107559 (+!547 (+!547 lt!107554 lt!107555) lt!107553)))))

(declare-fun e!136842 () Bool)

(assert (=> b!210114 e!136842))

(declare-fun res!102458 () Bool)

(assert (=> b!210114 (=> (not res!102458) (not e!136842))))

(assert (=> b!210114 (= res!102458 (= lt!107559 (+!547 (+!547 lt!107556 lt!107555) lt!107553)))))

(assert (=> b!210114 (= lt!107553 (tuple2!4091 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210114 (= lt!107555 (tuple2!4091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!9167 () Bool)

(declare-fun mapRes!9167 () Bool)

(assert (=> mapIsEmpty!9167 mapRes!9167))

(declare-fun b!210115 () Bool)

(declare-fun res!102464 () Bool)

(assert (=> b!210115 (=> (not res!102464) (not e!136844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210115 (= res!102464 (validKeyInArray!0 k0!843))))

(declare-fun b!210116 () Bool)

(declare-fun e!136840 () Bool)

(assert (=> b!210116 (= e!136840 tp_is_empty!5395)))

(declare-fun b!210117 () Bool)

(declare-fun res!102459 () Bool)

(assert (=> b!210117 (=> (not res!102459) (not e!136844))))

(assert (=> b!210117 (= res!102459 (= (select (arr!4741 _keys!825) i!601) k0!843))))

(declare-fun b!210118 () Bool)

(declare-fun res!102465 () Bool)

(assert (=> b!210118 (=> (not res!102465) (not e!136844))))

(declare-datatypes ((List!2977 0))(
  ( (Nil!2974) (Cons!2973 (h!3615 (_ BitVec 64)) (t!7904 List!2977)) )
))
(declare-fun arrayNoDuplicates!0 (array!9985 (_ BitVec 32) List!2977) Bool)

(assert (=> b!210118 (= res!102465 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2974))))

(declare-fun b!210119 () Bool)

(assert (=> b!210119 (= e!136839 (and e!136845 mapRes!9167))))

(declare-fun condMapEmpty!9167 () Bool)

(declare-fun mapDefault!9167 () ValueCell!2354)

(assert (=> b!210119 (= condMapEmpty!9167 (= (arr!4742 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2354)) mapDefault!9167)))))

(declare-fun b!210120 () Bool)

(assert (=> b!210120 (= e!136842 (= lt!107557 (+!547 (+!547 lt!107552 lt!107555) lt!107553)))))

(declare-fun mapNonEmpty!9167 () Bool)

(declare-fun tp!19645 () Bool)

(assert (=> mapNonEmpty!9167 (= mapRes!9167 (and tp!19645 e!136840))))

(declare-fun mapRest!9167 () (Array (_ BitVec 32) ValueCell!2354))

(declare-fun mapKey!9167 () (_ BitVec 32))

(declare-fun mapValue!9167 () ValueCell!2354)

(assert (=> mapNonEmpty!9167 (= (arr!4742 _values!649) (store mapRest!9167 mapKey!9167 mapValue!9167))))

(assert (= (and start!20924 res!102461) b!210112))

(assert (= (and b!210112 res!102463) b!210109))

(assert (= (and b!210109 res!102462) b!210118))

(assert (= (and b!210118 res!102465) b!210113))

(assert (= (and b!210113 res!102457) b!210115))

(assert (= (and b!210115 res!102464) b!210117))

(assert (= (and b!210117 res!102459) b!210111))

(assert (= (and b!210111 (not res!102460)) b!210114))

(assert (= (and b!210114 res!102458) b!210120))

(assert (= (and b!210119 condMapEmpty!9167) mapIsEmpty!9167))

(assert (= (and b!210119 (not condMapEmpty!9167)) mapNonEmpty!9167))

(get-info :version)

(assert (= (and mapNonEmpty!9167 ((_ is ValueCellFull!2354) mapValue!9167)) b!210116))

(assert (= (and b!210119 ((_ is ValueCellFull!2354) mapDefault!9167)) b!210110))

(assert (= start!20924 b!210119))

(declare-fun m!237683 () Bool)

(assert (=> mapNonEmpty!9167 m!237683))

(declare-fun m!237685 () Bool)

(assert (=> b!210118 m!237685))

(declare-fun m!237687 () Bool)

(assert (=> b!210120 m!237687))

(assert (=> b!210120 m!237687))

(declare-fun m!237689 () Bool)

(assert (=> b!210120 m!237689))

(declare-fun m!237691 () Bool)

(assert (=> b!210114 m!237691))

(assert (=> b!210114 m!237691))

(declare-fun m!237693 () Bool)

(assert (=> b!210114 m!237693))

(declare-fun m!237695 () Bool)

(assert (=> b!210114 m!237695))

(assert (=> b!210114 m!237695))

(declare-fun m!237697 () Bool)

(assert (=> b!210114 m!237697))

(declare-fun m!237699 () Bool)

(assert (=> b!210109 m!237699))

(declare-fun m!237701 () Bool)

(assert (=> b!210111 m!237701))

(declare-fun m!237703 () Bool)

(assert (=> b!210111 m!237703))

(declare-fun m!237705 () Bool)

(assert (=> b!210111 m!237705))

(declare-fun m!237707 () Bool)

(assert (=> b!210111 m!237707))

(declare-fun m!237709 () Bool)

(assert (=> b!210111 m!237709))

(declare-fun m!237711 () Bool)

(assert (=> b!210111 m!237711))

(declare-fun m!237713 () Bool)

(assert (=> b!210111 m!237713))

(declare-fun m!237715 () Bool)

(assert (=> b!210117 m!237715))

(declare-fun m!237717 () Bool)

(assert (=> b!210115 m!237717))

(declare-fun m!237719 () Bool)

(assert (=> start!20924 m!237719))

(declare-fun m!237721 () Bool)

(assert (=> start!20924 m!237721))

(declare-fun m!237723 () Bool)

(assert (=> start!20924 m!237723))

(check-sat (not mapNonEmpty!9167) tp_is_empty!5395 (not b!210109) (not b!210115) (not b!210114) (not b!210120) (not b!210118) (not b!210111) (not b_next!5533) (not start!20924) b_and!12317)
(check-sat b_and!12317 (not b_next!5533))
