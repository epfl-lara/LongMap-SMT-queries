; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20564 () Bool)

(assert start!20564)

(declare-fun b_free!5223 () Bool)

(declare-fun b_next!5223 () Bool)

(assert (=> start!20564 (= b_free!5223 (not b_next!5223))))

(declare-fun tp!18701 () Bool)

(declare-fun b_and!11969 () Bool)

(assert (=> start!20564 (= tp!18701 b_and!11969)))

(declare-fun res!98674 () Bool)

(declare-fun e!133892 () Bool)

(assert (=> start!20564 (=> (not res!98674) (not e!133892))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20564 (= res!98674 (validMask!0 mask!1149))))

(assert (=> start!20564 e!133892))

(declare-datatypes ((V!6419 0))(
  ( (V!6420 (val!2584 Int)) )
))
(declare-datatypes ((ValueCell!2196 0))(
  ( (ValueCellFull!2196 (v!4554 V!6419)) (EmptyCell!2196) )
))
(declare-datatypes ((array!9375 0))(
  ( (array!9376 (arr!4438 (Array (_ BitVec 32) ValueCell!2196)) (size!4763 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9375)

(declare-fun e!133893 () Bool)

(declare-fun array_inv!2929 (array!9375) Bool)

(assert (=> start!20564 (and (array_inv!2929 _values!649) e!133893)))

(assert (=> start!20564 true))

(declare-fun tp_is_empty!5079 () Bool)

(assert (=> start!20564 tp_is_empty!5079))

(declare-datatypes ((array!9377 0))(
  ( (array!9378 (arr!4439 (Array (_ BitVec 32) (_ BitVec 64))) (size!4764 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9377)

(declare-fun array_inv!2930 (array!9377) Bool)

(assert (=> start!20564 (array_inv!2930 _keys!825)))

(assert (=> start!20564 tp!18701))

(declare-fun mapNonEmpty!8687 () Bool)

(declare-fun mapRes!8687 () Bool)

(declare-fun tp!18700 () Bool)

(declare-fun e!133890 () Bool)

(assert (=> mapNonEmpty!8687 (= mapRes!8687 (and tp!18700 e!133890))))

(declare-fun mapValue!8687 () ValueCell!2196)

(declare-fun mapRest!8687 () (Array (_ BitVec 32) ValueCell!2196))

(declare-fun mapKey!8687 () (_ BitVec 32))

(assert (=> mapNonEmpty!8687 (= (arr!4438 _values!649) (store mapRest!8687 mapKey!8687 mapValue!8687))))

(declare-fun mapIsEmpty!8687 () Bool)

(assert (=> mapIsEmpty!8687 mapRes!8687))

(declare-fun b!204660 () Bool)

(declare-fun res!98680 () Bool)

(assert (=> b!204660 (=> (not res!98680) (not e!133892))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204660 (= res!98680 (and (= (size!4763 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4764 _keys!825) (size!4763 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204661 () Bool)

(declare-fun res!98679 () Bool)

(assert (=> b!204661 (=> (not res!98679) (not e!133892))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204661 (= res!98679 (validKeyInArray!0 k0!843))))

(declare-fun b!204662 () Bool)

(declare-fun e!133891 () Bool)

(declare-fun e!133894 () Bool)

(assert (=> b!204662 (= e!133891 e!133894)))

(declare-fun res!98678 () Bool)

(assert (=> b!204662 (=> res!98678 e!133894)))

(assert (=> b!204662 (= res!98678 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3918 0))(
  ( (tuple2!3919 (_1!1970 (_ BitVec 64)) (_2!1970 V!6419)) )
))
(declare-datatypes ((List!2816 0))(
  ( (Nil!2813) (Cons!2812 (h!3454 tuple2!3918) (t!7747 List!2816)) )
))
(declare-datatypes ((ListLongMap!2831 0))(
  ( (ListLongMap!2832 (toList!1431 List!2816)) )
))
(declare-fun lt!103802 () ListLongMap!2831)

(declare-fun lt!103801 () ListLongMap!2831)

(assert (=> b!204662 (= lt!103802 lt!103801)))

(declare-fun lt!103793 () ListLongMap!2831)

(declare-fun lt!103795 () tuple2!3918)

(declare-fun +!458 (ListLongMap!2831 tuple2!3918) ListLongMap!2831)

(assert (=> b!204662 (= lt!103801 (+!458 lt!103793 lt!103795))))

(declare-fun lt!103799 () ListLongMap!2831)

(declare-fun lt!103796 () ListLongMap!2831)

(assert (=> b!204662 (= lt!103799 lt!103796)))

(declare-fun lt!103797 () ListLongMap!2831)

(assert (=> b!204662 (= lt!103796 (+!458 lt!103797 lt!103795))))

(declare-fun lt!103798 () ListLongMap!2831)

(assert (=> b!204662 (= lt!103799 (+!458 lt!103798 lt!103795))))

(declare-fun minValue!615 () V!6419)

(assert (=> b!204662 (= lt!103795 (tuple2!3919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204663 () Bool)

(declare-fun res!98673 () Bool)

(assert (=> b!204663 (=> (not res!98673) (not e!133892))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204663 (= res!98673 (= (select (arr!4439 _keys!825) i!601) k0!843))))

(declare-fun b!204664 () Bool)

(declare-fun e!133895 () Bool)

(assert (=> b!204664 (= e!133893 (and e!133895 mapRes!8687))))

(declare-fun condMapEmpty!8687 () Bool)

(declare-fun mapDefault!8687 () ValueCell!2196)

(assert (=> b!204664 (= condMapEmpty!8687 (= (arr!4438 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2196)) mapDefault!8687)))))

(declare-fun b!204665 () Bool)

(assert (=> b!204665 (= e!133894 true)))

(declare-fun lt!103803 () tuple2!3918)

(assert (=> b!204665 (= lt!103796 (+!458 lt!103801 lt!103803))))

(declare-datatypes ((Unit!6208 0))(
  ( (Unit!6209) )
))
(declare-fun lt!103800 () Unit!6208)

(declare-fun v!520 () V!6419)

(declare-fun addCommutativeForDiffKeys!164 (ListLongMap!2831 (_ BitVec 64) V!6419 (_ BitVec 64) V!6419) Unit!6208)

(assert (=> b!204665 (= lt!103800 (addCommutativeForDiffKeys!164 lt!103793 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204666 () Bool)

(assert (=> b!204666 (= e!133895 tp_is_empty!5079)))

(declare-fun b!204667 () Bool)

(declare-fun res!98675 () Bool)

(assert (=> b!204667 (=> (not res!98675) (not e!133892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9377 (_ BitVec 32)) Bool)

(assert (=> b!204667 (= res!98675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204668 () Bool)

(assert (=> b!204668 (= e!133892 (not e!133891))))

(declare-fun res!98677 () Bool)

(assert (=> b!204668 (=> res!98677 e!133891)))

(assert (=> b!204668 (= res!98677 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6419)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1004 (array!9377 array!9375 (_ BitVec 32) (_ BitVec 32) V!6419 V!6419 (_ BitVec 32) Int) ListLongMap!2831)

(assert (=> b!204668 (= lt!103802 (getCurrentListMap!1004 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103794 () array!9375)

(assert (=> b!204668 (= lt!103799 (getCurrentListMap!1004 _keys!825 lt!103794 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204668 (and (= lt!103798 lt!103797) (= lt!103797 lt!103798))))

(assert (=> b!204668 (= lt!103797 (+!458 lt!103793 lt!103803))))

(assert (=> b!204668 (= lt!103803 (tuple2!3919 k0!843 v!520))))

(declare-fun lt!103792 () Unit!6208)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!117 (array!9377 array!9375 (_ BitVec 32) (_ BitVec 32) V!6419 V!6419 (_ BitVec 32) (_ BitVec 64) V!6419 (_ BitVec 32) Int) Unit!6208)

(assert (=> b!204668 (= lt!103792 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!117 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!378 (array!9377 array!9375 (_ BitVec 32) (_ BitVec 32) V!6419 V!6419 (_ BitVec 32) Int) ListLongMap!2831)

(assert (=> b!204668 (= lt!103798 (getCurrentListMapNoExtraKeys!378 _keys!825 lt!103794 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204668 (= lt!103794 (array!9376 (store (arr!4438 _values!649) i!601 (ValueCellFull!2196 v!520)) (size!4763 _values!649)))))

(assert (=> b!204668 (= lt!103793 (getCurrentListMapNoExtraKeys!378 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204669 () Bool)

(declare-fun res!98676 () Bool)

(assert (=> b!204669 (=> (not res!98676) (not e!133892))))

(assert (=> b!204669 (= res!98676 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4764 _keys!825))))))

(declare-fun b!204670 () Bool)

(declare-fun res!98672 () Bool)

(assert (=> b!204670 (=> (not res!98672) (not e!133892))))

(declare-datatypes ((List!2817 0))(
  ( (Nil!2814) (Cons!2813 (h!3455 (_ BitVec 64)) (t!7748 List!2817)) )
))
(declare-fun arrayNoDuplicates!0 (array!9377 (_ BitVec 32) List!2817) Bool)

(assert (=> b!204670 (= res!98672 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2814))))

(declare-fun b!204671 () Bool)

(assert (=> b!204671 (= e!133890 tp_is_empty!5079)))

(assert (= (and start!20564 res!98674) b!204660))

(assert (= (and b!204660 res!98680) b!204667))

(assert (= (and b!204667 res!98675) b!204670))

(assert (= (and b!204670 res!98672) b!204669))

(assert (= (and b!204669 res!98676) b!204661))

(assert (= (and b!204661 res!98679) b!204663))

(assert (= (and b!204663 res!98673) b!204668))

(assert (= (and b!204668 (not res!98677)) b!204662))

(assert (= (and b!204662 (not res!98678)) b!204665))

(assert (= (and b!204664 condMapEmpty!8687) mapIsEmpty!8687))

(assert (= (and b!204664 (not condMapEmpty!8687)) mapNonEmpty!8687))

(get-info :version)

(assert (= (and mapNonEmpty!8687 ((_ is ValueCellFull!2196) mapValue!8687)) b!204671))

(assert (= (and b!204664 ((_ is ValueCellFull!2196) mapDefault!8687)) b!204666))

(assert (= start!20564 b!204664))

(declare-fun m!232199 () Bool)

(assert (=> mapNonEmpty!8687 m!232199))

(declare-fun m!232201 () Bool)

(assert (=> b!204662 m!232201))

(declare-fun m!232203 () Bool)

(assert (=> b!204662 m!232203))

(declare-fun m!232205 () Bool)

(assert (=> b!204662 m!232205))

(declare-fun m!232207 () Bool)

(assert (=> b!204665 m!232207))

(declare-fun m!232209 () Bool)

(assert (=> b!204665 m!232209))

(declare-fun m!232211 () Bool)

(assert (=> start!20564 m!232211))

(declare-fun m!232213 () Bool)

(assert (=> start!20564 m!232213))

(declare-fun m!232215 () Bool)

(assert (=> start!20564 m!232215))

(declare-fun m!232217 () Bool)

(assert (=> b!204670 m!232217))

(declare-fun m!232219 () Bool)

(assert (=> b!204663 m!232219))

(declare-fun m!232221 () Bool)

(assert (=> b!204667 m!232221))

(declare-fun m!232223 () Bool)

(assert (=> b!204661 m!232223))

(declare-fun m!232225 () Bool)

(assert (=> b!204668 m!232225))

(declare-fun m!232227 () Bool)

(assert (=> b!204668 m!232227))

(declare-fun m!232229 () Bool)

(assert (=> b!204668 m!232229))

(declare-fun m!232231 () Bool)

(assert (=> b!204668 m!232231))

(declare-fun m!232233 () Bool)

(assert (=> b!204668 m!232233))

(declare-fun m!232235 () Bool)

(assert (=> b!204668 m!232235))

(declare-fun m!232237 () Bool)

(assert (=> b!204668 m!232237))

(check-sat (not b!204661) (not mapNonEmpty!8687) (not b!204662) (not b_next!5223) (not b!204670) (not b!204667) b_and!11969 (not b!204665) (not start!20564) (not b!204668) tp_is_empty!5079)
(check-sat b_and!11969 (not b_next!5223))
