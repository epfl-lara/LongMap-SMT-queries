; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20572 () Bool)

(assert start!20572)

(declare-fun b_free!5227 () Bool)

(declare-fun b_next!5227 () Bool)

(assert (=> start!20572 (= b_free!5227 (not b_next!5227))))

(declare-fun tp!18713 () Bool)

(declare-fun b_and!11947 () Bool)

(assert (=> start!20572 (= tp!18713 b_and!11947)))

(declare-fun b!204585 () Bool)

(declare-fun e!133836 () Bool)

(declare-fun e!133831 () Bool)

(assert (=> b!204585 (= e!133836 e!133831)))

(declare-fun res!98634 () Bool)

(assert (=> b!204585 (=> res!98634 e!133831)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!204585 (= res!98634 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6425 0))(
  ( (V!6426 (val!2586 Int)) )
))
(declare-datatypes ((tuple2!3906 0))(
  ( (tuple2!3907 (_1!1964 (_ BitVec 64)) (_2!1964 V!6425)) )
))
(declare-datatypes ((List!2809 0))(
  ( (Nil!2806) (Cons!2805 (h!3447 tuple2!3906) (t!7731 List!2809)) )
))
(declare-datatypes ((ListLongMap!2809 0))(
  ( (ListLongMap!2810 (toList!1420 List!2809)) )
))
(declare-fun lt!103683 () ListLongMap!2809)

(declare-fun lt!103685 () ListLongMap!2809)

(assert (=> b!204585 (= lt!103683 lt!103685)))

(declare-fun lt!103693 () ListLongMap!2809)

(declare-fun lt!103688 () tuple2!3906)

(declare-fun +!469 (ListLongMap!2809 tuple2!3906) ListLongMap!2809)

(assert (=> b!204585 (= lt!103685 (+!469 lt!103693 lt!103688))))

(declare-fun lt!103687 () ListLongMap!2809)

(declare-fun lt!103689 () ListLongMap!2809)

(assert (=> b!204585 (= lt!103687 lt!103689)))

(declare-fun lt!103690 () ListLongMap!2809)

(assert (=> b!204585 (= lt!103689 (+!469 lt!103690 lt!103688))))

(declare-fun lt!103692 () ListLongMap!2809)

(assert (=> b!204585 (= lt!103687 (+!469 lt!103692 lt!103688))))

(declare-fun minValue!615 () V!6425)

(assert (=> b!204585 (= lt!103688 (tuple2!3907 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204586 () Bool)

(declare-fun e!133834 () Bool)

(declare-fun tp_is_empty!5083 () Bool)

(assert (=> b!204586 (= e!133834 tp_is_empty!5083)))

(declare-fun mapIsEmpty!8693 () Bool)

(declare-fun mapRes!8693 () Bool)

(assert (=> mapIsEmpty!8693 mapRes!8693))

(declare-fun b!204587 () Bool)

(declare-fun res!98632 () Bool)

(declare-fun e!133832 () Bool)

(assert (=> b!204587 (=> (not res!98632) (not e!133832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204587 (= res!98632 (validKeyInArray!0 k0!843))))

(declare-fun b!204588 () Bool)

(declare-fun res!98637 () Bool)

(assert (=> b!204588 (=> (not res!98637) (not e!133832))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9371 0))(
  ( (array!9372 (arr!4435 (Array (_ BitVec 32) (_ BitVec 64))) (size!4761 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9371)

(assert (=> b!204588 (= res!98637 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4761 _keys!825))))))

(declare-fun b!204589 () Bool)

(assert (=> b!204589 (= e!133832 (not e!133836))))

(declare-fun res!98639 () Bool)

(assert (=> b!204589 (=> res!98639 e!133836)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204589 (= res!98639 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2198 0))(
  ( (ValueCellFull!2198 (v!4550 V!6425)) (EmptyCell!2198) )
))
(declare-datatypes ((array!9373 0))(
  ( (array!9374 (arr!4436 (Array (_ BitVec 32) ValueCell!2198)) (size!4762 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9373)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6425)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!965 (array!9371 array!9373 (_ BitVec 32) (_ BitVec 32) V!6425 V!6425 (_ BitVec 32) Int) ListLongMap!2809)

(assert (=> b!204589 (= lt!103683 (getCurrentListMap!965 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103684 () array!9373)

(assert (=> b!204589 (= lt!103687 (getCurrentListMap!965 _keys!825 lt!103684 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204589 (and (= lt!103692 lt!103690) (= lt!103690 lt!103692))))

(declare-fun lt!103694 () tuple2!3906)

(assert (=> b!204589 (= lt!103690 (+!469 lt!103693 lt!103694))))

(declare-fun v!520 () V!6425)

(assert (=> b!204589 (= lt!103694 (tuple2!3907 k0!843 v!520))))

(declare-datatypes ((Unit!6180 0))(
  ( (Unit!6181) )
))
(declare-fun lt!103691 () Unit!6180)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!124 (array!9371 array!9373 (_ BitVec 32) (_ BitVec 32) V!6425 V!6425 (_ BitVec 32) (_ BitVec 64) V!6425 (_ BitVec 32) Int) Unit!6180)

(assert (=> b!204589 (= lt!103691 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!124 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!375 (array!9371 array!9373 (_ BitVec 32) (_ BitVec 32) V!6425 V!6425 (_ BitVec 32) Int) ListLongMap!2809)

(assert (=> b!204589 (= lt!103692 (getCurrentListMapNoExtraKeys!375 _keys!825 lt!103684 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204589 (= lt!103684 (array!9374 (store (arr!4436 _values!649) i!601 (ValueCellFull!2198 v!520)) (size!4762 _values!649)))))

(assert (=> b!204589 (= lt!103693 (getCurrentListMapNoExtraKeys!375 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8693 () Bool)

(declare-fun tp!18712 () Bool)

(declare-fun e!133833 () Bool)

(assert (=> mapNonEmpty!8693 (= mapRes!8693 (and tp!18712 e!133833))))

(declare-fun mapValue!8693 () ValueCell!2198)

(declare-fun mapKey!8693 () (_ BitVec 32))

(declare-fun mapRest!8693 () (Array (_ BitVec 32) ValueCell!2198))

(assert (=> mapNonEmpty!8693 (= (arr!4436 _values!649) (store mapRest!8693 mapKey!8693 mapValue!8693))))

(declare-fun b!204590 () Bool)

(assert (=> b!204590 (= e!133833 tp_is_empty!5083)))

(declare-fun b!204591 () Bool)

(declare-fun res!98635 () Bool)

(assert (=> b!204591 (=> (not res!98635) (not e!133832))))

(assert (=> b!204591 (= res!98635 (and (= (size!4762 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4761 _keys!825) (size!4762 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!98638 () Bool)

(assert (=> start!20572 (=> (not res!98638) (not e!133832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20572 (= res!98638 (validMask!0 mask!1149))))

(assert (=> start!20572 e!133832))

(declare-fun e!133830 () Bool)

(declare-fun array_inv!2915 (array!9373) Bool)

(assert (=> start!20572 (and (array_inv!2915 _values!649) e!133830)))

(assert (=> start!20572 true))

(assert (=> start!20572 tp_is_empty!5083))

(declare-fun array_inv!2916 (array!9371) Bool)

(assert (=> start!20572 (array_inv!2916 _keys!825)))

(assert (=> start!20572 tp!18713))

(declare-fun b!204592 () Bool)

(declare-fun res!98633 () Bool)

(assert (=> b!204592 (=> (not res!98633) (not e!133832))))

(declare-datatypes ((List!2810 0))(
  ( (Nil!2807) (Cons!2806 (h!3448 (_ BitVec 64)) (t!7732 List!2810)) )
))
(declare-fun arrayNoDuplicates!0 (array!9371 (_ BitVec 32) List!2810) Bool)

(assert (=> b!204592 (= res!98633 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2807))))

(declare-fun b!204593 () Bool)

(assert (=> b!204593 (= e!133831 true)))

(assert (=> b!204593 (= lt!103689 (+!469 lt!103685 lt!103694))))

(declare-fun lt!103686 () Unit!6180)

(declare-fun addCommutativeForDiffKeys!159 (ListLongMap!2809 (_ BitVec 64) V!6425 (_ BitVec 64) V!6425) Unit!6180)

(assert (=> b!204593 (= lt!103686 (addCommutativeForDiffKeys!159 lt!103693 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204594 () Bool)

(declare-fun res!98631 () Bool)

(assert (=> b!204594 (=> (not res!98631) (not e!133832))))

(assert (=> b!204594 (= res!98631 (= (select (arr!4435 _keys!825) i!601) k0!843))))

(declare-fun b!204595 () Bool)

(assert (=> b!204595 (= e!133830 (and e!133834 mapRes!8693))))

(declare-fun condMapEmpty!8693 () Bool)

(declare-fun mapDefault!8693 () ValueCell!2198)

(assert (=> b!204595 (= condMapEmpty!8693 (= (arr!4436 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2198)) mapDefault!8693)))))

(declare-fun b!204596 () Bool)

(declare-fun res!98636 () Bool)

(assert (=> b!204596 (=> (not res!98636) (not e!133832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9371 (_ BitVec 32)) Bool)

(assert (=> b!204596 (= res!98636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20572 res!98638) b!204591))

(assert (= (and b!204591 res!98635) b!204596))

(assert (= (and b!204596 res!98636) b!204592))

(assert (= (and b!204592 res!98633) b!204588))

(assert (= (and b!204588 res!98637) b!204587))

(assert (= (and b!204587 res!98632) b!204594))

(assert (= (and b!204594 res!98631) b!204589))

(assert (= (and b!204589 (not res!98639)) b!204585))

(assert (= (and b!204585 (not res!98634)) b!204593))

(assert (= (and b!204595 condMapEmpty!8693) mapIsEmpty!8693))

(assert (= (and b!204595 (not condMapEmpty!8693)) mapNonEmpty!8693))

(get-info :version)

(assert (= (and mapNonEmpty!8693 ((_ is ValueCellFull!2198) mapValue!8693)) b!204590))

(assert (= (and b!204595 ((_ is ValueCellFull!2198) mapDefault!8693)) b!204586))

(assert (= start!20572 b!204595))

(declare-fun m!231663 () Bool)

(assert (=> b!204592 m!231663))

(declare-fun m!231665 () Bool)

(assert (=> b!204585 m!231665))

(declare-fun m!231667 () Bool)

(assert (=> b!204585 m!231667))

(declare-fun m!231669 () Bool)

(assert (=> b!204585 m!231669))

(declare-fun m!231671 () Bool)

(assert (=> b!204596 m!231671))

(declare-fun m!231673 () Bool)

(assert (=> b!204589 m!231673))

(declare-fun m!231675 () Bool)

(assert (=> b!204589 m!231675))

(declare-fun m!231677 () Bool)

(assert (=> b!204589 m!231677))

(declare-fun m!231679 () Bool)

(assert (=> b!204589 m!231679))

(declare-fun m!231681 () Bool)

(assert (=> b!204589 m!231681))

(declare-fun m!231683 () Bool)

(assert (=> b!204589 m!231683))

(declare-fun m!231685 () Bool)

(assert (=> b!204589 m!231685))

(declare-fun m!231687 () Bool)

(assert (=> start!20572 m!231687))

(declare-fun m!231689 () Bool)

(assert (=> start!20572 m!231689))

(declare-fun m!231691 () Bool)

(assert (=> start!20572 m!231691))

(declare-fun m!231693 () Bool)

(assert (=> b!204593 m!231693))

(declare-fun m!231695 () Bool)

(assert (=> b!204593 m!231695))

(declare-fun m!231697 () Bool)

(assert (=> b!204587 m!231697))

(declare-fun m!231699 () Bool)

(assert (=> b!204594 m!231699))

(declare-fun m!231701 () Bool)

(assert (=> mapNonEmpty!8693 m!231701))

(check-sat (not b!204587) (not b!204592) (not b!204589) (not mapNonEmpty!8693) (not b!204596) b_and!11947 tp_is_empty!5083 (not start!20572) (not b!204593) (not b!204585) (not b_next!5227))
(check-sat b_and!11947 (not b_next!5227))
