; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20626 () Bool)

(assert start!20626)

(declare-fun b_free!5281 () Bool)

(declare-fun b_next!5281 () Bool)

(assert (=> start!20626 (= b_free!5281 (not b_next!5281))))

(declare-fun tp!18875 () Bool)

(declare-fun b_and!12041 () Bool)

(assert (=> start!20626 (= tp!18875 b_and!12041)))

(declare-fun b!205751 () Bool)

(declare-fun e!134524 () Bool)

(assert (=> b!205751 (= e!134524 true)))

(declare-datatypes ((V!6497 0))(
  ( (V!6498 (val!2613 Int)) )
))
(declare-datatypes ((tuple2!3912 0))(
  ( (tuple2!3913 (_1!1967 (_ BitVec 64)) (_2!1967 V!6497)) )
))
(declare-datatypes ((List!2804 0))(
  ( (Nil!2801) (Cons!2800 (h!3442 tuple2!3912) (t!7727 List!2804)) )
))
(declare-datatypes ((ListLongMap!2827 0))(
  ( (ListLongMap!2828 (toList!1429 List!2804)) )
))
(declare-fun lt!104900 () ListLongMap!2827)

(declare-fun lt!104906 () ListLongMap!2827)

(declare-fun lt!104902 () tuple2!3912)

(declare-fun +!483 (ListLongMap!2827 tuple2!3912) ListLongMap!2827)

(assert (=> b!205751 (= lt!104900 (+!483 lt!104906 lt!104902))))

(declare-fun lt!104896 () ListLongMap!2827)

(declare-datatypes ((Unit!6244 0))(
  ( (Unit!6245) )
))
(declare-fun lt!104898 () Unit!6244)

(declare-fun minValue!615 () V!6497)

(declare-fun v!520 () V!6497)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!187 (ListLongMap!2827 (_ BitVec 64) V!6497 (_ BitVec 64) V!6497) Unit!6244)

(assert (=> b!205751 (= lt!104898 (addCommutativeForDiffKeys!187 lt!104896 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205752 () Bool)

(declare-fun res!99480 () Bool)

(declare-fun e!134525 () Bool)

(assert (=> b!205752 (=> (not res!99480) (not e!134525))))

(declare-datatypes ((array!9481 0))(
  ( (array!9482 (arr!4491 (Array (_ BitVec 32) (_ BitVec 64))) (size!4816 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9481)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205752 (= res!99480 (= (select (arr!4491 _keys!825) i!601) k0!843))))

(declare-fun b!205753 () Bool)

(declare-fun res!99476 () Bool)

(assert (=> b!205753 (=> (not res!99476) (not e!134525))))

(assert (=> b!205753 (= res!99476 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4816 _keys!825))))))

(declare-fun b!205754 () Bool)

(declare-fun e!134528 () Bool)

(declare-fun tp_is_empty!5137 () Bool)

(assert (=> b!205754 (= e!134528 tp_is_empty!5137)))

(declare-fun mapIsEmpty!8774 () Bool)

(declare-fun mapRes!8774 () Bool)

(assert (=> mapIsEmpty!8774 mapRes!8774))

(declare-fun mapNonEmpty!8774 () Bool)

(declare-fun tp!18874 () Bool)

(declare-fun e!134523 () Bool)

(assert (=> mapNonEmpty!8774 (= mapRes!8774 (and tp!18874 e!134523))))

(declare-datatypes ((ValueCell!2225 0))(
  ( (ValueCellFull!2225 (v!4584 V!6497)) (EmptyCell!2225) )
))
(declare-datatypes ((array!9483 0))(
  ( (array!9484 (arr!4492 (Array (_ BitVec 32) ValueCell!2225)) (size!4817 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9483)

(declare-fun mapRest!8774 () (Array (_ BitVec 32) ValueCell!2225))

(declare-fun mapKey!8774 () (_ BitVec 32))

(declare-fun mapValue!8774 () ValueCell!2225)

(assert (=> mapNonEmpty!8774 (= (arr!4492 _values!649) (store mapRest!8774 mapKey!8774 mapValue!8774))))

(declare-fun b!205755 () Bool)

(declare-fun res!99484 () Bool)

(assert (=> b!205755 (=> (not res!99484) (not e!134525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205755 (= res!99484 (validKeyInArray!0 k0!843))))

(declare-fun b!205756 () Bool)

(declare-fun res!99479 () Bool)

(assert (=> b!205756 (=> (not res!99479) (not e!134525))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205756 (= res!99479 (and (= (size!4817 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4816 _keys!825) (size!4817 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205758 () Bool)

(declare-fun res!99481 () Bool)

(assert (=> b!205758 (=> (not res!99481) (not e!134525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9481 (_ BitVec 32)) Bool)

(assert (=> b!205758 (= res!99481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205759 () Bool)

(declare-fun res!99482 () Bool)

(assert (=> b!205759 (=> (not res!99482) (not e!134525))))

(declare-datatypes ((List!2805 0))(
  ( (Nil!2802) (Cons!2801 (h!3443 (_ BitVec 64)) (t!7728 List!2805)) )
))
(declare-fun arrayNoDuplicates!0 (array!9481 (_ BitVec 32) List!2805) Bool)

(assert (=> b!205759 (= res!99482 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2802))))

(declare-fun b!205760 () Bool)

(declare-fun e!134522 () Bool)

(assert (=> b!205760 (= e!134522 (and e!134528 mapRes!8774))))

(declare-fun condMapEmpty!8774 () Bool)

(declare-fun mapDefault!8774 () ValueCell!2225)

(assert (=> b!205760 (= condMapEmpty!8774 (= (arr!4492 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2225)) mapDefault!8774)))))

(declare-fun b!205761 () Bool)

(declare-fun e!134526 () Bool)

(assert (=> b!205761 (= e!134525 (not e!134526))))

(declare-fun res!99483 () Bool)

(assert (=> b!205761 (=> res!99483 e!134526)))

(assert (=> b!205761 (= res!99483 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6497)

(declare-fun lt!104901 () ListLongMap!2827)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1002 (array!9481 array!9483 (_ BitVec 32) (_ BitVec 32) V!6497 V!6497 (_ BitVec 32) Int) ListLongMap!2827)

(assert (=> b!205761 (= lt!104901 (getCurrentListMap!1002 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104904 () ListLongMap!2827)

(declare-fun lt!104903 () array!9483)

(assert (=> b!205761 (= lt!104904 (getCurrentListMap!1002 _keys!825 lt!104903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104899 () ListLongMap!2827)

(declare-fun lt!104895 () ListLongMap!2827)

(assert (=> b!205761 (and (= lt!104899 lt!104895) (= lt!104895 lt!104899))))

(assert (=> b!205761 (= lt!104895 (+!483 lt!104896 lt!104902))))

(assert (=> b!205761 (= lt!104902 (tuple2!3913 k0!843 v!520))))

(declare-fun lt!104897 () Unit!6244)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!138 (array!9481 array!9483 (_ BitVec 32) (_ BitVec 32) V!6497 V!6497 (_ BitVec 32) (_ BitVec 64) V!6497 (_ BitVec 32) Int) Unit!6244)

(assert (=> b!205761 (= lt!104897 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!138 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!395 (array!9481 array!9483 (_ BitVec 32) (_ BitVec 32) V!6497 V!6497 (_ BitVec 32) Int) ListLongMap!2827)

(assert (=> b!205761 (= lt!104899 (getCurrentListMapNoExtraKeys!395 _keys!825 lt!104903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205761 (= lt!104903 (array!9484 (store (arr!4492 _values!649) i!601 (ValueCellFull!2225 v!520)) (size!4817 _values!649)))))

(assert (=> b!205761 (= lt!104896 (getCurrentListMapNoExtraKeys!395 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205762 () Bool)

(assert (=> b!205762 (= e!134526 e!134524)))

(declare-fun res!99478 () Bool)

(assert (=> b!205762 (=> res!99478 e!134524)))

(assert (=> b!205762 (= res!99478 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205762 (= lt!104901 lt!104906)))

(declare-fun lt!104905 () tuple2!3912)

(assert (=> b!205762 (= lt!104906 (+!483 lt!104896 lt!104905))))

(assert (=> b!205762 (= lt!104904 lt!104900)))

(assert (=> b!205762 (= lt!104900 (+!483 lt!104895 lt!104905))))

(assert (=> b!205762 (= lt!104904 (+!483 lt!104899 lt!104905))))

(assert (=> b!205762 (= lt!104905 (tuple2!3913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205757 () Bool)

(assert (=> b!205757 (= e!134523 tp_is_empty!5137)))

(declare-fun res!99477 () Bool)

(assert (=> start!20626 (=> (not res!99477) (not e!134525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20626 (= res!99477 (validMask!0 mask!1149))))

(assert (=> start!20626 e!134525))

(declare-fun array_inv!2941 (array!9483) Bool)

(assert (=> start!20626 (and (array_inv!2941 _values!649) e!134522)))

(assert (=> start!20626 true))

(assert (=> start!20626 tp_is_empty!5137))

(declare-fun array_inv!2942 (array!9481) Bool)

(assert (=> start!20626 (array_inv!2942 _keys!825)))

(assert (=> start!20626 tp!18875))

(assert (= (and start!20626 res!99477) b!205756))

(assert (= (and b!205756 res!99479) b!205758))

(assert (= (and b!205758 res!99481) b!205759))

(assert (= (and b!205759 res!99482) b!205753))

(assert (= (and b!205753 res!99476) b!205755))

(assert (= (and b!205755 res!99484) b!205752))

(assert (= (and b!205752 res!99480) b!205761))

(assert (= (and b!205761 (not res!99483)) b!205762))

(assert (= (and b!205762 (not res!99478)) b!205751))

(assert (= (and b!205760 condMapEmpty!8774) mapIsEmpty!8774))

(assert (= (and b!205760 (not condMapEmpty!8774)) mapNonEmpty!8774))

(get-info :version)

(assert (= (and mapNonEmpty!8774 ((_ is ValueCellFull!2225) mapValue!8774)) b!205757))

(assert (= (and b!205760 ((_ is ValueCellFull!2225) mapDefault!8774)) b!205754))

(assert (= start!20626 b!205760))

(declare-fun m!233541 () Bool)

(assert (=> mapNonEmpty!8774 m!233541))

(declare-fun m!233543 () Bool)

(assert (=> b!205759 m!233543))

(declare-fun m!233545 () Bool)

(assert (=> b!205752 m!233545))

(declare-fun m!233547 () Bool)

(assert (=> start!20626 m!233547))

(declare-fun m!233549 () Bool)

(assert (=> start!20626 m!233549))

(declare-fun m!233551 () Bool)

(assert (=> start!20626 m!233551))

(declare-fun m!233553 () Bool)

(assert (=> b!205762 m!233553))

(declare-fun m!233555 () Bool)

(assert (=> b!205762 m!233555))

(declare-fun m!233557 () Bool)

(assert (=> b!205762 m!233557))

(declare-fun m!233559 () Bool)

(assert (=> b!205755 m!233559))

(declare-fun m!233561 () Bool)

(assert (=> b!205751 m!233561))

(declare-fun m!233563 () Bool)

(assert (=> b!205751 m!233563))

(declare-fun m!233565 () Bool)

(assert (=> b!205758 m!233565))

(declare-fun m!233567 () Bool)

(assert (=> b!205761 m!233567))

(declare-fun m!233569 () Bool)

(assert (=> b!205761 m!233569))

(declare-fun m!233571 () Bool)

(assert (=> b!205761 m!233571))

(declare-fun m!233573 () Bool)

(assert (=> b!205761 m!233573))

(declare-fun m!233575 () Bool)

(assert (=> b!205761 m!233575))

(declare-fun m!233577 () Bool)

(assert (=> b!205761 m!233577))

(declare-fun m!233579 () Bool)

(assert (=> b!205761 m!233579))

(check-sat (not b!205751) (not b!205758) b_and!12041 (not b_next!5281) (not b!205759) tp_is_empty!5137 (not mapNonEmpty!8774) (not b!205762) (not b!205761) (not start!20626) (not b!205755))
(check-sat b_and!12041 (not b_next!5281))
