; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20558 () Bool)

(assert start!20558)

(declare-fun b_free!5217 () Bool)

(declare-fun b_next!5217 () Bool)

(assert (=> start!20558 (= b_free!5217 (not b_next!5217))))

(declare-fun tp!18682 () Bool)

(declare-fun b_and!11963 () Bool)

(assert (=> start!20558 (= tp!18682 b_and!11963)))

(declare-fun b!204552 () Bool)

(declare-fun res!98591 () Bool)

(declare-fun e!133826 () Bool)

(assert (=> b!204552 (=> (not res!98591) (not e!133826))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204552 (= res!98591 (validKeyInArray!0 k0!843))))

(declare-fun b!204553 () Bool)

(declare-fun res!98598 () Bool)

(assert (=> b!204553 (=> (not res!98598) (not e!133826))))

(declare-datatypes ((array!9363 0))(
  ( (array!9364 (arr!4432 (Array (_ BitVec 32) (_ BitVec 64))) (size!4757 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9363)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204553 (= res!98598 (= (select (arr!4432 _keys!825) i!601) k0!843))))

(declare-fun b!204554 () Bool)

(declare-fun e!133829 () Bool)

(assert (=> b!204554 (= e!133826 (not e!133829))))

(declare-fun res!98592 () Bool)

(assert (=> b!204554 (=> res!98592 e!133829)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204554 (= res!98592 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6411 0))(
  ( (V!6412 (val!2581 Int)) )
))
(declare-datatypes ((ValueCell!2193 0))(
  ( (ValueCellFull!2193 (v!4551 V!6411)) (EmptyCell!2193) )
))
(declare-datatypes ((array!9365 0))(
  ( (array!9366 (arr!4433 (Array (_ BitVec 32) ValueCell!2193)) (size!4758 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9365)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3914 0))(
  ( (tuple2!3915 (_1!1968 (_ BitVec 64)) (_2!1968 V!6411)) )
))
(declare-datatypes ((List!2812 0))(
  ( (Nil!2809) (Cons!2808 (h!3450 tuple2!3914) (t!7743 List!2812)) )
))
(declare-datatypes ((ListLongMap!2827 0))(
  ( (ListLongMap!2828 (toList!1429 List!2812)) )
))
(declare-fun lt!103691 () ListLongMap!2827)

(declare-fun zeroValue!615 () V!6411)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6411)

(declare-fun getCurrentListMap!1002 (array!9363 array!9365 (_ BitVec 32) (_ BitVec 32) V!6411 V!6411 (_ BitVec 32) Int) ListLongMap!2827)

(assert (=> b!204554 (= lt!103691 (getCurrentListMap!1002 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103690 () array!9365)

(declare-fun lt!103692 () ListLongMap!2827)

(assert (=> b!204554 (= lt!103692 (getCurrentListMap!1002 _keys!825 lt!103690 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103695 () ListLongMap!2827)

(declare-fun lt!103689 () ListLongMap!2827)

(assert (=> b!204554 (and (= lt!103695 lt!103689) (= lt!103689 lt!103695))))

(declare-fun lt!103694 () ListLongMap!2827)

(declare-fun lt!103686 () tuple2!3914)

(declare-fun +!456 (ListLongMap!2827 tuple2!3914) ListLongMap!2827)

(assert (=> b!204554 (= lt!103689 (+!456 lt!103694 lt!103686))))

(declare-fun v!520 () V!6411)

(assert (=> b!204554 (= lt!103686 (tuple2!3915 k0!843 v!520))))

(declare-datatypes ((Unit!6204 0))(
  ( (Unit!6205) )
))
(declare-fun lt!103684 () Unit!6204)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!115 (array!9363 array!9365 (_ BitVec 32) (_ BitVec 32) V!6411 V!6411 (_ BitVec 32) (_ BitVec 64) V!6411 (_ BitVec 32) Int) Unit!6204)

(assert (=> b!204554 (= lt!103684 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!115 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!376 (array!9363 array!9365 (_ BitVec 32) (_ BitVec 32) V!6411 V!6411 (_ BitVec 32) Int) ListLongMap!2827)

(assert (=> b!204554 (= lt!103695 (getCurrentListMapNoExtraKeys!376 _keys!825 lt!103690 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204554 (= lt!103690 (array!9366 (store (arr!4433 _values!649) i!601 (ValueCellFull!2193 v!520)) (size!4758 _values!649)))))

(assert (=> b!204554 (= lt!103694 (getCurrentListMapNoExtraKeys!376 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204555 () Bool)

(declare-fun res!98596 () Bool)

(assert (=> b!204555 (=> (not res!98596) (not e!133826))))

(declare-datatypes ((List!2813 0))(
  ( (Nil!2810) (Cons!2809 (h!3451 (_ BitVec 64)) (t!7744 List!2813)) )
))
(declare-fun arrayNoDuplicates!0 (array!9363 (_ BitVec 32) List!2813) Bool)

(assert (=> b!204555 (= res!98596 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2810))))

(declare-fun res!98594 () Bool)

(assert (=> start!20558 (=> (not res!98594) (not e!133826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20558 (= res!98594 (validMask!0 mask!1149))))

(assert (=> start!20558 e!133826))

(declare-fun e!133830 () Bool)

(declare-fun array_inv!2925 (array!9365) Bool)

(assert (=> start!20558 (and (array_inv!2925 _values!649) e!133830)))

(assert (=> start!20558 true))

(declare-fun tp_is_empty!5073 () Bool)

(assert (=> start!20558 tp_is_empty!5073))

(declare-fun array_inv!2926 (array!9363) Bool)

(assert (=> start!20558 (array_inv!2926 _keys!825)))

(assert (=> start!20558 tp!18682))

(declare-fun b!204556 () Bool)

(declare-fun res!98593 () Bool)

(assert (=> b!204556 (=> (not res!98593) (not e!133826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9363 (_ BitVec 32)) Bool)

(assert (=> b!204556 (= res!98593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204557 () Bool)

(declare-fun e!133828 () Bool)

(assert (=> b!204557 (= e!133828 tp_is_empty!5073)))

(declare-fun b!204558 () Bool)

(declare-fun e!133831 () Bool)

(declare-fun mapRes!8678 () Bool)

(assert (=> b!204558 (= e!133830 (and e!133831 mapRes!8678))))

(declare-fun condMapEmpty!8678 () Bool)

(declare-fun mapDefault!8678 () ValueCell!2193)

(assert (=> b!204558 (= condMapEmpty!8678 (= (arr!4433 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2193)) mapDefault!8678)))))

(declare-fun b!204559 () Bool)

(declare-fun e!133827 () Bool)

(assert (=> b!204559 (= e!133829 e!133827)))

(declare-fun res!98595 () Bool)

(assert (=> b!204559 (=> res!98595 e!133827)))

(assert (=> b!204559 (= res!98595 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103685 () ListLongMap!2827)

(assert (=> b!204559 (= lt!103691 lt!103685)))

(declare-fun lt!103688 () tuple2!3914)

(assert (=> b!204559 (= lt!103685 (+!456 lt!103694 lt!103688))))

(declare-fun lt!103693 () ListLongMap!2827)

(assert (=> b!204559 (= lt!103692 lt!103693)))

(assert (=> b!204559 (= lt!103693 (+!456 lt!103689 lt!103688))))

(assert (=> b!204559 (= lt!103692 (+!456 lt!103695 lt!103688))))

(assert (=> b!204559 (= lt!103688 (tuple2!3915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204560 () Bool)

(declare-fun res!98597 () Bool)

(assert (=> b!204560 (=> (not res!98597) (not e!133826))))

(assert (=> b!204560 (= res!98597 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4757 _keys!825))))))

(declare-fun b!204561 () Bool)

(declare-fun res!98599 () Bool)

(assert (=> b!204561 (=> (not res!98599) (not e!133826))))

(assert (=> b!204561 (= res!98599 (and (= (size!4758 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4757 _keys!825) (size!4758 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8678 () Bool)

(assert (=> mapIsEmpty!8678 mapRes!8678))

(declare-fun mapNonEmpty!8678 () Bool)

(declare-fun tp!18683 () Bool)

(assert (=> mapNonEmpty!8678 (= mapRes!8678 (and tp!18683 e!133828))))

(declare-fun mapKey!8678 () (_ BitVec 32))

(declare-fun mapValue!8678 () ValueCell!2193)

(declare-fun mapRest!8678 () (Array (_ BitVec 32) ValueCell!2193))

(assert (=> mapNonEmpty!8678 (= (arr!4433 _values!649) (store mapRest!8678 mapKey!8678 mapValue!8678))))

(declare-fun b!204562 () Bool)

(assert (=> b!204562 (= e!133827 true)))

(assert (=> b!204562 (= lt!103693 (+!456 lt!103685 lt!103686))))

(declare-fun lt!103687 () Unit!6204)

(declare-fun addCommutativeForDiffKeys!162 (ListLongMap!2827 (_ BitVec 64) V!6411 (_ BitVec 64) V!6411) Unit!6204)

(assert (=> b!204562 (= lt!103687 (addCommutativeForDiffKeys!162 lt!103694 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204563 () Bool)

(assert (=> b!204563 (= e!133831 tp_is_empty!5073)))

(assert (= (and start!20558 res!98594) b!204561))

(assert (= (and b!204561 res!98599) b!204556))

(assert (= (and b!204556 res!98593) b!204555))

(assert (= (and b!204555 res!98596) b!204560))

(assert (= (and b!204560 res!98597) b!204552))

(assert (= (and b!204552 res!98591) b!204553))

(assert (= (and b!204553 res!98598) b!204554))

(assert (= (and b!204554 (not res!98592)) b!204559))

(assert (= (and b!204559 (not res!98595)) b!204562))

(assert (= (and b!204558 condMapEmpty!8678) mapIsEmpty!8678))

(assert (= (and b!204558 (not condMapEmpty!8678)) mapNonEmpty!8678))

(get-info :version)

(assert (= (and mapNonEmpty!8678 ((_ is ValueCellFull!2193) mapValue!8678)) b!204557))

(assert (= (and b!204558 ((_ is ValueCellFull!2193) mapDefault!8678)) b!204563))

(assert (= start!20558 b!204558))

(declare-fun m!232079 () Bool)

(assert (=> b!204555 m!232079))

(declare-fun m!232081 () Bool)

(assert (=> start!20558 m!232081))

(declare-fun m!232083 () Bool)

(assert (=> start!20558 m!232083))

(declare-fun m!232085 () Bool)

(assert (=> start!20558 m!232085))

(declare-fun m!232087 () Bool)

(assert (=> b!204556 m!232087))

(declare-fun m!232089 () Bool)

(assert (=> b!204553 m!232089))

(declare-fun m!232091 () Bool)

(assert (=> b!204559 m!232091))

(declare-fun m!232093 () Bool)

(assert (=> b!204559 m!232093))

(declare-fun m!232095 () Bool)

(assert (=> b!204559 m!232095))

(declare-fun m!232097 () Bool)

(assert (=> b!204554 m!232097))

(declare-fun m!232099 () Bool)

(assert (=> b!204554 m!232099))

(declare-fun m!232101 () Bool)

(assert (=> b!204554 m!232101))

(declare-fun m!232103 () Bool)

(assert (=> b!204554 m!232103))

(declare-fun m!232105 () Bool)

(assert (=> b!204554 m!232105))

(declare-fun m!232107 () Bool)

(assert (=> b!204554 m!232107))

(declare-fun m!232109 () Bool)

(assert (=> b!204554 m!232109))

(declare-fun m!232111 () Bool)

(assert (=> b!204562 m!232111))

(declare-fun m!232113 () Bool)

(assert (=> b!204562 m!232113))

(declare-fun m!232115 () Bool)

(assert (=> mapNonEmpty!8678 m!232115))

(declare-fun m!232117 () Bool)

(assert (=> b!204552 m!232117))

(check-sat (not b_next!5217) b_and!11963 (not mapNonEmpty!8678) (not b!204559) tp_is_empty!5073 (not b!204555) (not b!204554) (not start!20558) (not b!204552) (not b!204556) (not b!204562))
(check-sat b_and!11963 (not b_next!5217))
