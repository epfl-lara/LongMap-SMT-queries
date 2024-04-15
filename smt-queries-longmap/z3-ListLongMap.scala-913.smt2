; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20578 () Bool)

(assert start!20578)

(declare-fun b_free!5233 () Bool)

(declare-fun b_next!5233 () Bool)

(assert (=> start!20578 (= b_free!5233 (not b_next!5233))))

(declare-fun tp!18730 () Bool)

(declare-fun b_and!11953 () Bool)

(assert (=> start!20578 (= tp!18730 b_and!11953)))

(declare-fun b!204693 () Bool)

(declare-fun res!98714 () Bool)

(declare-fun e!133898 () Bool)

(assert (=> b!204693 (=> (not res!98714) (not e!133898))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204693 (= res!98714 (validKeyInArray!0 k0!843))))

(declare-fun res!98718 () Bool)

(assert (=> start!20578 (=> (not res!98718) (not e!133898))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20578 (= res!98718 (validMask!0 mask!1149))))

(assert (=> start!20578 e!133898))

(declare-datatypes ((V!6433 0))(
  ( (V!6434 (val!2589 Int)) )
))
(declare-datatypes ((ValueCell!2201 0))(
  ( (ValueCellFull!2201 (v!4553 V!6433)) (EmptyCell!2201) )
))
(declare-datatypes ((array!9383 0))(
  ( (array!9384 (arr!4441 (Array (_ BitVec 32) ValueCell!2201)) (size!4767 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9383)

(declare-fun e!133895 () Bool)

(declare-fun array_inv!2921 (array!9383) Bool)

(assert (=> start!20578 (and (array_inv!2921 _values!649) e!133895)))

(assert (=> start!20578 true))

(declare-fun tp_is_empty!5089 () Bool)

(assert (=> start!20578 tp_is_empty!5089))

(declare-datatypes ((array!9385 0))(
  ( (array!9386 (arr!4442 (Array (_ BitVec 32) (_ BitVec 64))) (size!4768 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9385)

(declare-fun array_inv!2922 (array!9385) Bool)

(assert (=> start!20578 (array_inv!2922 _keys!825)))

(assert (=> start!20578 tp!18730))

(declare-fun b!204694 () Bool)

(declare-fun e!133899 () Bool)

(declare-fun mapRes!8702 () Bool)

(assert (=> b!204694 (= e!133895 (and e!133899 mapRes!8702))))

(declare-fun condMapEmpty!8702 () Bool)

(declare-fun mapDefault!8702 () ValueCell!2201)

(assert (=> b!204694 (= condMapEmpty!8702 (= (arr!4441 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2201)) mapDefault!8702)))))

(declare-fun b!204695 () Bool)

(declare-fun res!98717 () Bool)

(assert (=> b!204695 (=> (not res!98717) (not e!133898))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204695 (= res!98717 (= (select (arr!4442 _keys!825) i!601) k0!843))))

(declare-fun b!204696 () Bool)

(declare-fun res!98713 () Bool)

(assert (=> b!204696 (=> (not res!98713) (not e!133898))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204696 (= res!98713 (and (= (size!4767 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4768 _keys!825) (size!4767 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204697 () Bool)

(assert (=> b!204697 (= e!133899 tp_is_empty!5089)))

(declare-fun b!204698 () Bool)

(declare-fun e!133893 () Bool)

(assert (=> b!204698 (= e!133898 (not e!133893))))

(declare-fun res!98716 () Bool)

(assert (=> b!204698 (=> res!98716 e!133893)))

(assert (=> b!204698 (= res!98716 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3912 0))(
  ( (tuple2!3913 (_1!1967 (_ BitVec 64)) (_2!1967 V!6433)) )
))
(declare-datatypes ((List!2815 0))(
  ( (Nil!2812) (Cons!2811 (h!3453 tuple2!3912) (t!7737 List!2815)) )
))
(declare-datatypes ((ListLongMap!2815 0))(
  ( (ListLongMap!2816 (toList!1423 List!2815)) )
))
(declare-fun lt!103796 () ListLongMap!2815)

(declare-fun zeroValue!615 () V!6433)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6433)

(declare-fun getCurrentListMap!968 (array!9385 array!9383 (_ BitVec 32) (_ BitVec 32) V!6433 V!6433 (_ BitVec 32) Int) ListLongMap!2815)

(assert (=> b!204698 (= lt!103796 (getCurrentListMap!968 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103802 () ListLongMap!2815)

(declare-fun lt!103792 () array!9383)

(assert (=> b!204698 (= lt!103802 (getCurrentListMap!968 _keys!825 lt!103792 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103794 () ListLongMap!2815)

(declare-fun lt!103793 () ListLongMap!2815)

(assert (=> b!204698 (and (= lt!103794 lt!103793) (= lt!103793 lt!103794))))

(declare-fun lt!103798 () ListLongMap!2815)

(declare-fun lt!103799 () tuple2!3912)

(declare-fun +!472 (ListLongMap!2815 tuple2!3912) ListLongMap!2815)

(assert (=> b!204698 (= lt!103793 (+!472 lt!103798 lt!103799))))

(declare-fun v!520 () V!6433)

(assert (=> b!204698 (= lt!103799 (tuple2!3913 k0!843 v!520))))

(declare-datatypes ((Unit!6186 0))(
  ( (Unit!6187) )
))
(declare-fun lt!103800 () Unit!6186)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!127 (array!9385 array!9383 (_ BitVec 32) (_ BitVec 32) V!6433 V!6433 (_ BitVec 32) (_ BitVec 64) V!6433 (_ BitVec 32) Int) Unit!6186)

(assert (=> b!204698 (= lt!103800 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!127 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!378 (array!9385 array!9383 (_ BitVec 32) (_ BitVec 32) V!6433 V!6433 (_ BitVec 32) Int) ListLongMap!2815)

(assert (=> b!204698 (= lt!103794 (getCurrentListMapNoExtraKeys!378 _keys!825 lt!103792 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204698 (= lt!103792 (array!9384 (store (arr!4441 _values!649) i!601 (ValueCellFull!2201 v!520)) (size!4767 _values!649)))))

(assert (=> b!204698 (= lt!103798 (getCurrentListMapNoExtraKeys!378 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204699 () Bool)

(declare-fun e!133897 () Bool)

(assert (=> b!204699 (= e!133897 tp_is_empty!5089)))

(declare-fun b!204700 () Bool)

(declare-fun e!133894 () Bool)

(assert (=> b!204700 (= e!133894 true)))

(declare-fun lt!103801 () ListLongMap!2815)

(declare-fun lt!103795 () ListLongMap!2815)

(assert (=> b!204700 (= lt!103801 (+!472 lt!103795 lt!103799))))

(declare-fun lt!103791 () Unit!6186)

(declare-fun addCommutativeForDiffKeys!161 (ListLongMap!2815 (_ BitVec 64) V!6433 (_ BitVec 64) V!6433) Unit!6186)

(assert (=> b!204700 (= lt!103791 (addCommutativeForDiffKeys!161 lt!103798 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204701 () Bool)

(declare-fun res!98712 () Bool)

(assert (=> b!204701 (=> (not res!98712) (not e!133898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9385 (_ BitVec 32)) Bool)

(assert (=> b!204701 (= res!98712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204702 () Bool)

(declare-fun res!98720 () Bool)

(assert (=> b!204702 (=> (not res!98720) (not e!133898))))

(declare-datatypes ((List!2816 0))(
  ( (Nil!2813) (Cons!2812 (h!3454 (_ BitVec 64)) (t!7738 List!2816)) )
))
(declare-fun arrayNoDuplicates!0 (array!9385 (_ BitVec 32) List!2816) Bool)

(assert (=> b!204702 (= res!98720 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2813))))

(declare-fun b!204703 () Bool)

(declare-fun res!98715 () Bool)

(assert (=> b!204703 (=> (not res!98715) (not e!133898))))

(assert (=> b!204703 (= res!98715 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4768 _keys!825))))))

(declare-fun mapNonEmpty!8702 () Bool)

(declare-fun tp!18731 () Bool)

(assert (=> mapNonEmpty!8702 (= mapRes!8702 (and tp!18731 e!133897))))

(declare-fun mapRest!8702 () (Array (_ BitVec 32) ValueCell!2201))

(declare-fun mapKey!8702 () (_ BitVec 32))

(declare-fun mapValue!8702 () ValueCell!2201)

(assert (=> mapNonEmpty!8702 (= (arr!4441 _values!649) (store mapRest!8702 mapKey!8702 mapValue!8702))))

(declare-fun b!204704 () Bool)

(assert (=> b!204704 (= e!133893 e!133894)))

(declare-fun res!98719 () Bool)

(assert (=> b!204704 (=> res!98719 e!133894)))

(assert (=> b!204704 (= res!98719 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204704 (= lt!103796 lt!103795)))

(declare-fun lt!103797 () tuple2!3912)

(assert (=> b!204704 (= lt!103795 (+!472 lt!103798 lt!103797))))

(assert (=> b!204704 (= lt!103802 lt!103801)))

(assert (=> b!204704 (= lt!103801 (+!472 lt!103793 lt!103797))))

(assert (=> b!204704 (= lt!103802 (+!472 lt!103794 lt!103797))))

(assert (=> b!204704 (= lt!103797 (tuple2!3913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8702 () Bool)

(assert (=> mapIsEmpty!8702 mapRes!8702))

(assert (= (and start!20578 res!98718) b!204696))

(assert (= (and b!204696 res!98713) b!204701))

(assert (= (and b!204701 res!98712) b!204702))

(assert (= (and b!204702 res!98720) b!204703))

(assert (= (and b!204703 res!98715) b!204693))

(assert (= (and b!204693 res!98714) b!204695))

(assert (= (and b!204695 res!98717) b!204698))

(assert (= (and b!204698 (not res!98716)) b!204704))

(assert (= (and b!204704 (not res!98719)) b!204700))

(assert (= (and b!204694 condMapEmpty!8702) mapIsEmpty!8702))

(assert (= (and b!204694 (not condMapEmpty!8702)) mapNonEmpty!8702))

(get-info :version)

(assert (= (and mapNonEmpty!8702 ((_ is ValueCellFull!2201) mapValue!8702)) b!204699))

(assert (= (and b!204694 ((_ is ValueCellFull!2201) mapDefault!8702)) b!204697))

(assert (= start!20578 b!204694))

(declare-fun m!231783 () Bool)

(assert (=> mapNonEmpty!8702 m!231783))

(declare-fun m!231785 () Bool)

(assert (=> b!204704 m!231785))

(declare-fun m!231787 () Bool)

(assert (=> b!204704 m!231787))

(declare-fun m!231789 () Bool)

(assert (=> b!204704 m!231789))

(declare-fun m!231791 () Bool)

(assert (=> start!20578 m!231791))

(declare-fun m!231793 () Bool)

(assert (=> start!20578 m!231793))

(declare-fun m!231795 () Bool)

(assert (=> start!20578 m!231795))

(declare-fun m!231797 () Bool)

(assert (=> b!204695 m!231797))

(declare-fun m!231799 () Bool)

(assert (=> b!204701 m!231799))

(declare-fun m!231801 () Bool)

(assert (=> b!204698 m!231801))

(declare-fun m!231803 () Bool)

(assert (=> b!204698 m!231803))

(declare-fun m!231805 () Bool)

(assert (=> b!204698 m!231805))

(declare-fun m!231807 () Bool)

(assert (=> b!204698 m!231807))

(declare-fun m!231809 () Bool)

(assert (=> b!204698 m!231809))

(declare-fun m!231811 () Bool)

(assert (=> b!204698 m!231811))

(declare-fun m!231813 () Bool)

(assert (=> b!204698 m!231813))

(declare-fun m!231815 () Bool)

(assert (=> b!204693 m!231815))

(declare-fun m!231817 () Bool)

(assert (=> b!204700 m!231817))

(declare-fun m!231819 () Bool)

(assert (=> b!204700 m!231819))

(declare-fun m!231821 () Bool)

(assert (=> b!204702 m!231821))

(check-sat b_and!11953 (not b!204701) (not b_next!5233) tp_is_empty!5089 (not b!204704) (not start!20578) (not b!204698) (not b!204700) (not b!204693) (not mapNonEmpty!8702) (not b!204702))
(check-sat b_and!11953 (not b_next!5233))
