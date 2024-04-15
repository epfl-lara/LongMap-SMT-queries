; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20632 () Bool)

(assert start!20632)

(declare-fun b_free!5287 () Bool)

(declare-fun b_next!5287 () Bool)

(assert (=> start!20632 (= b_free!5287 (not b_next!5287))))

(declare-fun tp!18892 () Bool)

(declare-fun b_and!12007 () Bool)

(assert (=> start!20632 (= tp!18892 b_and!12007)))

(declare-fun mapIsEmpty!8783 () Bool)

(declare-fun mapRes!8783 () Bool)

(assert (=> mapIsEmpty!8783 mapRes!8783))

(declare-fun mapNonEmpty!8783 () Bool)

(declare-fun tp!18893 () Bool)

(declare-fun e!134463 () Bool)

(assert (=> mapNonEmpty!8783 (= mapRes!8783 (and tp!18893 e!134463))))

(declare-datatypes ((V!6505 0))(
  ( (V!6506 (val!2616 Int)) )
))
(declare-datatypes ((ValueCell!2228 0))(
  ( (ValueCellFull!2228 (v!4580 V!6505)) (EmptyCell!2228) )
))
(declare-datatypes ((array!9483 0))(
  ( (array!9484 (arr!4491 (Array (_ BitVec 32) ValueCell!2228)) (size!4817 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9483)

(declare-fun mapValue!8783 () ValueCell!2228)

(declare-fun mapKey!8783 () (_ BitVec 32))

(declare-fun mapRest!8783 () (Array (_ BitVec 32) ValueCell!2228))

(assert (=> mapNonEmpty!8783 (= (arr!4491 _values!649) (store mapRest!8783 mapKey!8783 mapValue!8783))))

(declare-fun b!205665 () Bool)

(declare-fun tp_is_empty!5143 () Bool)

(assert (=> b!205665 (= e!134463 tp_is_empty!5143)))

(declare-fun b!205667 () Bool)

(declare-fun res!99444 () Bool)

(declare-fun e!134466 () Bool)

(assert (=> b!205667 (=> (not res!99444) (not e!134466))))

(declare-datatypes ((array!9485 0))(
  ( (array!9486 (arr!4492 (Array (_ BitVec 32) (_ BitVec 64))) (size!4818 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9485)

(declare-datatypes ((List!2854 0))(
  ( (Nil!2851) (Cons!2850 (h!3492 (_ BitVec 64)) (t!7776 List!2854)) )
))
(declare-fun arrayNoDuplicates!0 (array!9485 (_ BitVec 32) List!2854) Bool)

(assert (=> b!205667 (= res!99444 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2851))))

(declare-fun b!205668 () Bool)

(declare-fun res!99445 () Bool)

(assert (=> b!205668 (=> (not res!99445) (not e!134466))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205668 (= res!99445 (and (= (size!4817 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4818 _keys!825) (size!4817 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205669 () Bool)

(declare-fun e!134461 () Bool)

(declare-fun e!134464 () Bool)

(assert (=> b!205669 (= e!134461 (and e!134464 mapRes!8783))))

(declare-fun condMapEmpty!8783 () Bool)

(declare-fun mapDefault!8783 () ValueCell!2228)

(assert (=> b!205669 (= condMapEmpty!8783 (= (arr!4491 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2228)) mapDefault!8783)))))

(declare-fun b!205670 () Bool)

(declare-fun res!99446 () Bool)

(assert (=> b!205670 (=> (not res!99446) (not e!134466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9485 (_ BitVec 32)) Bool)

(assert (=> b!205670 (= res!99446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205671 () Bool)

(declare-fun e!134460 () Bool)

(assert (=> b!205671 (= e!134460 true)))

(declare-datatypes ((tuple2!3952 0))(
  ( (tuple2!3953 (_1!1987 (_ BitVec 64)) (_2!1987 V!6505)) )
))
(declare-datatypes ((List!2855 0))(
  ( (Nil!2852) (Cons!2851 (h!3493 tuple2!3952) (t!7777 List!2855)) )
))
(declare-datatypes ((ListLongMap!2855 0))(
  ( (ListLongMap!2856 (toList!1443 List!2855)) )
))
(declare-fun lt!104763 () ListLongMap!2855)

(declare-fun lt!104771 () ListLongMap!2855)

(declare-fun lt!104774 () tuple2!3952)

(declare-fun +!492 (ListLongMap!2855 tuple2!3952) ListLongMap!2855)

(assert (=> b!205671 (= lt!104763 (+!492 lt!104771 lt!104774))))

(declare-datatypes ((Unit!6226 0))(
  ( (Unit!6227) )
))
(declare-fun lt!104773 () Unit!6226)

(declare-fun minValue!615 () V!6505)

(declare-fun v!520 () V!6505)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!104765 () ListLongMap!2855)

(declare-fun addCommutativeForDiffKeys!179 (ListLongMap!2855 (_ BitVec 64) V!6505 (_ BitVec 64) V!6505) Unit!6226)

(assert (=> b!205671 (= lt!104773 (addCommutativeForDiffKeys!179 lt!104765 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205672 () Bool)

(declare-fun res!99447 () Bool)

(assert (=> b!205672 (=> (not res!99447) (not e!134466))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205672 (= res!99447 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4818 _keys!825))))))

(declare-fun b!205673 () Bool)

(assert (=> b!205673 (= e!134464 tp_is_empty!5143)))

(declare-fun b!205674 () Bool)

(declare-fun res!99448 () Bool)

(assert (=> b!205674 (=> (not res!99448) (not e!134466))))

(assert (=> b!205674 (= res!99448 (= (select (arr!4492 _keys!825) i!601) k0!843))))

(declare-fun res!99441 () Bool)

(assert (=> start!20632 (=> (not res!99441) (not e!134466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20632 (= res!99441 (validMask!0 mask!1149))))

(assert (=> start!20632 e!134466))

(declare-fun array_inv!2953 (array!9483) Bool)

(assert (=> start!20632 (and (array_inv!2953 _values!649) e!134461)))

(assert (=> start!20632 true))

(assert (=> start!20632 tp_is_empty!5143))

(declare-fun array_inv!2954 (array!9485) Bool)

(assert (=> start!20632 (array_inv!2954 _keys!825)))

(assert (=> start!20632 tp!18892))

(declare-fun b!205666 () Bool)

(declare-fun e!134462 () Bool)

(assert (=> b!205666 (= e!134462 e!134460)))

(declare-fun res!99443 () Bool)

(assert (=> b!205666 (=> res!99443 e!134460)))

(assert (=> b!205666 (= res!99443 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104770 () ListLongMap!2855)

(assert (=> b!205666 (= lt!104770 lt!104771)))

(declare-fun lt!104764 () tuple2!3952)

(assert (=> b!205666 (= lt!104771 (+!492 lt!104765 lt!104764))))

(declare-fun lt!104767 () ListLongMap!2855)

(assert (=> b!205666 (= lt!104767 lt!104763)))

(declare-fun lt!104769 () ListLongMap!2855)

(assert (=> b!205666 (= lt!104763 (+!492 lt!104769 lt!104764))))

(declare-fun lt!104768 () ListLongMap!2855)

(assert (=> b!205666 (= lt!104767 (+!492 lt!104768 lt!104764))))

(assert (=> b!205666 (= lt!104764 (tuple2!3953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205675 () Bool)

(declare-fun res!99449 () Bool)

(assert (=> b!205675 (=> (not res!99449) (not e!134466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205675 (= res!99449 (validKeyInArray!0 k0!843))))

(declare-fun b!205676 () Bool)

(assert (=> b!205676 (= e!134466 (not e!134462))))

(declare-fun res!99442 () Bool)

(assert (=> b!205676 (=> res!99442 e!134462)))

(assert (=> b!205676 (= res!99442 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6505)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!987 (array!9485 array!9483 (_ BitVec 32) (_ BitVec 32) V!6505 V!6505 (_ BitVec 32) Int) ListLongMap!2855)

(assert (=> b!205676 (= lt!104770 (getCurrentListMap!987 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104772 () array!9483)

(assert (=> b!205676 (= lt!104767 (getCurrentListMap!987 _keys!825 lt!104772 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205676 (and (= lt!104768 lt!104769) (= lt!104769 lt!104768))))

(assert (=> b!205676 (= lt!104769 (+!492 lt!104765 lt!104774))))

(assert (=> b!205676 (= lt!104774 (tuple2!3953 k0!843 v!520))))

(declare-fun lt!104766 () Unit!6226)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!146 (array!9485 array!9483 (_ BitVec 32) (_ BitVec 32) V!6505 V!6505 (_ BitVec 32) (_ BitVec 64) V!6505 (_ BitVec 32) Int) Unit!6226)

(assert (=> b!205676 (= lt!104766 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!146 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!397 (array!9485 array!9483 (_ BitVec 32) (_ BitVec 32) V!6505 V!6505 (_ BitVec 32) Int) ListLongMap!2855)

(assert (=> b!205676 (= lt!104768 (getCurrentListMapNoExtraKeys!397 _keys!825 lt!104772 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205676 (= lt!104772 (array!9484 (store (arr!4491 _values!649) i!601 (ValueCellFull!2228 v!520)) (size!4817 _values!649)))))

(assert (=> b!205676 (= lt!104765 (getCurrentListMapNoExtraKeys!397 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20632 res!99441) b!205668))

(assert (= (and b!205668 res!99445) b!205670))

(assert (= (and b!205670 res!99446) b!205667))

(assert (= (and b!205667 res!99444) b!205672))

(assert (= (and b!205672 res!99447) b!205675))

(assert (= (and b!205675 res!99449) b!205674))

(assert (= (and b!205674 res!99448) b!205676))

(assert (= (and b!205676 (not res!99442)) b!205666))

(assert (= (and b!205666 (not res!99443)) b!205671))

(assert (= (and b!205669 condMapEmpty!8783) mapIsEmpty!8783))

(assert (= (and b!205669 (not condMapEmpty!8783)) mapNonEmpty!8783))

(get-info :version)

(assert (= (and mapNonEmpty!8783 ((_ is ValueCellFull!2228) mapValue!8783)) b!205665))

(assert (= (and b!205669 ((_ is ValueCellFull!2228) mapDefault!8783)) b!205673))

(assert (= start!20632 b!205669))

(declare-fun m!232863 () Bool)

(assert (=> b!205666 m!232863))

(declare-fun m!232865 () Bool)

(assert (=> b!205666 m!232865))

(declare-fun m!232867 () Bool)

(assert (=> b!205666 m!232867))

(declare-fun m!232869 () Bool)

(assert (=> b!205676 m!232869))

(declare-fun m!232871 () Bool)

(assert (=> b!205676 m!232871))

(declare-fun m!232873 () Bool)

(assert (=> b!205676 m!232873))

(declare-fun m!232875 () Bool)

(assert (=> b!205676 m!232875))

(declare-fun m!232877 () Bool)

(assert (=> b!205676 m!232877))

(declare-fun m!232879 () Bool)

(assert (=> b!205676 m!232879))

(declare-fun m!232881 () Bool)

(assert (=> b!205676 m!232881))

(declare-fun m!232883 () Bool)

(assert (=> b!205670 m!232883))

(declare-fun m!232885 () Bool)

(assert (=> b!205667 m!232885))

(declare-fun m!232887 () Bool)

(assert (=> start!20632 m!232887))

(declare-fun m!232889 () Bool)

(assert (=> start!20632 m!232889))

(declare-fun m!232891 () Bool)

(assert (=> start!20632 m!232891))

(declare-fun m!232893 () Bool)

(assert (=> b!205675 m!232893))

(declare-fun m!232895 () Bool)

(assert (=> b!205671 m!232895))

(declare-fun m!232897 () Bool)

(assert (=> b!205671 m!232897))

(declare-fun m!232899 () Bool)

(assert (=> mapNonEmpty!8783 m!232899))

(declare-fun m!232901 () Bool)

(assert (=> b!205674 m!232901))

(check-sat (not b!205671) (not b_next!5287) (not b!205676) tp_is_empty!5143 (not b!205675) (not mapNonEmpty!8783) (not b!205670) (not start!20632) (not b!205667) (not b!205666) b_and!12007)
(check-sat b_and!12007 (not b_next!5287))
