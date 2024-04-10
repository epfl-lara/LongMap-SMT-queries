; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20570 () Bool)

(assert start!20570)

(declare-fun b_free!5229 () Bool)

(declare-fun b_next!5229 () Bool)

(assert (=> start!20570 (= b_free!5229 (not b_next!5229))))

(declare-fun tp!18719 () Bool)

(declare-fun b_and!11975 () Bool)

(assert (=> start!20570 (= tp!18719 b_and!11975)))

(declare-fun mapIsEmpty!8696 () Bool)

(declare-fun mapRes!8696 () Bool)

(assert (=> mapIsEmpty!8696 mapRes!8696))

(declare-fun mapNonEmpty!8696 () Bool)

(declare-fun tp!18718 () Bool)

(declare-fun e!133956 () Bool)

(assert (=> mapNonEmpty!8696 (= mapRes!8696 (and tp!18718 e!133956))))

(declare-datatypes ((V!6427 0))(
  ( (V!6428 (val!2587 Int)) )
))
(declare-datatypes ((ValueCell!2199 0))(
  ( (ValueCellFull!2199 (v!4557 V!6427)) (EmptyCell!2199) )
))
(declare-fun mapRest!8696 () (Array (_ BitVec 32) ValueCell!2199))

(declare-fun mapKey!8696 () (_ BitVec 32))

(declare-fun mapValue!8696 () ValueCell!2199)

(declare-datatypes ((array!9385 0))(
  ( (array!9386 (arr!4443 (Array (_ BitVec 32) ValueCell!2199)) (size!4768 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9385)

(assert (=> mapNonEmpty!8696 (= (arr!4443 _values!649) (store mapRest!8696 mapKey!8696 mapValue!8696))))

(declare-fun b!204768 () Bool)

(declare-fun e!133953 () Bool)

(declare-fun e!133952 () Bool)

(assert (=> b!204768 (= e!133953 (and e!133952 mapRes!8696))))

(declare-fun condMapEmpty!8696 () Bool)

(declare-fun mapDefault!8696 () ValueCell!2199)

(assert (=> b!204768 (= condMapEmpty!8696 (= (arr!4443 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2199)) mapDefault!8696)))))

(declare-fun b!204769 () Bool)

(declare-fun tp_is_empty!5085 () Bool)

(assert (=> b!204769 (= e!133956 tp_is_empty!5085)))

(declare-fun b!204770 () Bool)

(declare-fun e!133958 () Bool)

(declare-fun e!133954 () Bool)

(assert (=> b!204770 (= e!133958 (not e!133954))))

(declare-fun res!98761 () Bool)

(assert (=> b!204770 (=> res!98761 e!133954)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204770 (= res!98761 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3922 0))(
  ( (tuple2!3923 (_1!1972 (_ BitVec 64)) (_2!1972 V!6427)) )
))
(declare-datatypes ((List!2820 0))(
  ( (Nil!2817) (Cons!2816 (h!3458 tuple2!3922) (t!7751 List!2820)) )
))
(declare-datatypes ((ListLongMap!2835 0))(
  ( (ListLongMap!2836 (toList!1433 List!2820)) )
))
(declare-fun lt!103900 () ListLongMap!2835)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6427)

(declare-datatypes ((array!9387 0))(
  ( (array!9388 (arr!4444 (Array (_ BitVec 32) (_ BitVec 64))) (size!4769 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9387)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6427)

(declare-fun getCurrentListMap!1006 (array!9387 array!9385 (_ BitVec 32) (_ BitVec 32) V!6427 V!6427 (_ BitVec 32) Int) ListLongMap!2835)

(assert (=> b!204770 (= lt!103900 (getCurrentListMap!1006 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103911 () ListLongMap!2835)

(declare-fun lt!103903 () array!9385)

(assert (=> b!204770 (= lt!103911 (getCurrentListMap!1006 _keys!825 lt!103903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103906 () ListLongMap!2835)

(declare-fun lt!103910 () ListLongMap!2835)

(assert (=> b!204770 (and (= lt!103906 lt!103910) (= lt!103910 lt!103906))))

(declare-fun lt!103902 () ListLongMap!2835)

(declare-fun lt!103905 () tuple2!3922)

(declare-fun +!460 (ListLongMap!2835 tuple2!3922) ListLongMap!2835)

(assert (=> b!204770 (= lt!103910 (+!460 lt!103902 lt!103905))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6427)

(assert (=> b!204770 (= lt!103905 (tuple2!3923 k0!843 v!520))))

(declare-datatypes ((Unit!6212 0))(
  ( (Unit!6213) )
))
(declare-fun lt!103907 () Unit!6212)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!119 (array!9387 array!9385 (_ BitVec 32) (_ BitVec 32) V!6427 V!6427 (_ BitVec 32) (_ BitVec 64) V!6427 (_ BitVec 32) Int) Unit!6212)

(assert (=> b!204770 (= lt!103907 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!119 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!380 (array!9387 array!9385 (_ BitVec 32) (_ BitVec 32) V!6427 V!6427 (_ BitVec 32) Int) ListLongMap!2835)

(assert (=> b!204770 (= lt!103906 (getCurrentListMapNoExtraKeys!380 _keys!825 lt!103903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204770 (= lt!103903 (array!9386 (store (arr!4443 _values!649) i!601 (ValueCellFull!2199 v!520)) (size!4768 _values!649)))))

(assert (=> b!204770 (= lt!103902 (getCurrentListMapNoExtraKeys!380 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204771 () Bool)

(declare-fun e!133957 () Bool)

(assert (=> b!204771 (= e!133957 true)))

(declare-fun lt!103904 () ListLongMap!2835)

(declare-fun lt!103901 () ListLongMap!2835)

(assert (=> b!204771 (= lt!103904 (+!460 lt!103901 lt!103905))))

(declare-fun lt!103908 () Unit!6212)

(declare-fun addCommutativeForDiffKeys!166 (ListLongMap!2835 (_ BitVec 64) V!6427 (_ BitVec 64) V!6427) Unit!6212)

(assert (=> b!204771 (= lt!103908 (addCommutativeForDiffKeys!166 lt!103902 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204772 () Bool)

(assert (=> b!204772 (= e!133954 e!133957)))

(declare-fun res!98757 () Bool)

(assert (=> b!204772 (=> res!98757 e!133957)))

(assert (=> b!204772 (= res!98757 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204772 (= lt!103900 lt!103901)))

(declare-fun lt!103909 () tuple2!3922)

(assert (=> b!204772 (= lt!103901 (+!460 lt!103902 lt!103909))))

(assert (=> b!204772 (= lt!103911 lt!103904)))

(assert (=> b!204772 (= lt!103904 (+!460 lt!103910 lt!103909))))

(assert (=> b!204772 (= lt!103911 (+!460 lt!103906 lt!103909))))

(assert (=> b!204772 (= lt!103909 (tuple2!3923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204773 () Bool)

(declare-fun res!98755 () Bool)

(assert (=> b!204773 (=> (not res!98755) (not e!133958))))

(assert (=> b!204773 (= res!98755 (= (select (arr!4444 _keys!825) i!601) k0!843))))

(declare-fun res!98753 () Bool)

(assert (=> start!20570 (=> (not res!98753) (not e!133958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20570 (= res!98753 (validMask!0 mask!1149))))

(assert (=> start!20570 e!133958))

(declare-fun array_inv!2933 (array!9385) Bool)

(assert (=> start!20570 (and (array_inv!2933 _values!649) e!133953)))

(assert (=> start!20570 true))

(assert (=> start!20570 tp_is_empty!5085))

(declare-fun array_inv!2934 (array!9387) Bool)

(assert (=> start!20570 (array_inv!2934 _keys!825)))

(assert (=> start!20570 tp!18719))

(declare-fun b!204774 () Bool)

(assert (=> b!204774 (= e!133952 tp_is_empty!5085)))

(declare-fun b!204775 () Bool)

(declare-fun res!98756 () Bool)

(assert (=> b!204775 (=> (not res!98756) (not e!133958))))

(assert (=> b!204775 (= res!98756 (and (= (size!4768 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4769 _keys!825) (size!4768 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204776 () Bool)

(declare-fun res!98759 () Bool)

(assert (=> b!204776 (=> (not res!98759) (not e!133958))))

(declare-datatypes ((List!2821 0))(
  ( (Nil!2818) (Cons!2817 (h!3459 (_ BitVec 64)) (t!7752 List!2821)) )
))
(declare-fun arrayNoDuplicates!0 (array!9387 (_ BitVec 32) List!2821) Bool)

(assert (=> b!204776 (= res!98759 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2818))))

(declare-fun b!204777 () Bool)

(declare-fun res!98754 () Bool)

(assert (=> b!204777 (=> (not res!98754) (not e!133958))))

(assert (=> b!204777 (= res!98754 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4769 _keys!825))))))

(declare-fun b!204778 () Bool)

(declare-fun res!98760 () Bool)

(assert (=> b!204778 (=> (not res!98760) (not e!133958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9387 (_ BitVec 32)) Bool)

(assert (=> b!204778 (= res!98760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204779 () Bool)

(declare-fun res!98758 () Bool)

(assert (=> b!204779 (=> (not res!98758) (not e!133958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204779 (= res!98758 (validKeyInArray!0 k0!843))))

(assert (= (and start!20570 res!98753) b!204775))

(assert (= (and b!204775 res!98756) b!204778))

(assert (= (and b!204778 res!98760) b!204776))

(assert (= (and b!204776 res!98759) b!204777))

(assert (= (and b!204777 res!98754) b!204779))

(assert (= (and b!204779 res!98758) b!204773))

(assert (= (and b!204773 res!98755) b!204770))

(assert (= (and b!204770 (not res!98761)) b!204772))

(assert (= (and b!204772 (not res!98757)) b!204771))

(assert (= (and b!204768 condMapEmpty!8696) mapIsEmpty!8696))

(assert (= (and b!204768 (not condMapEmpty!8696)) mapNonEmpty!8696))

(get-info :version)

(assert (= (and mapNonEmpty!8696 ((_ is ValueCellFull!2199) mapValue!8696)) b!204769))

(assert (= (and b!204768 ((_ is ValueCellFull!2199) mapDefault!8696)) b!204774))

(assert (= start!20570 b!204768))

(declare-fun m!232319 () Bool)

(assert (=> b!204779 m!232319))

(declare-fun m!232321 () Bool)

(assert (=> start!20570 m!232321))

(declare-fun m!232323 () Bool)

(assert (=> start!20570 m!232323))

(declare-fun m!232325 () Bool)

(assert (=> start!20570 m!232325))

(declare-fun m!232327 () Bool)

(assert (=> b!204771 m!232327))

(declare-fun m!232329 () Bool)

(assert (=> b!204771 m!232329))

(declare-fun m!232331 () Bool)

(assert (=> b!204773 m!232331))

(declare-fun m!232333 () Bool)

(assert (=> mapNonEmpty!8696 m!232333))

(declare-fun m!232335 () Bool)

(assert (=> b!204772 m!232335))

(declare-fun m!232337 () Bool)

(assert (=> b!204772 m!232337))

(declare-fun m!232339 () Bool)

(assert (=> b!204772 m!232339))

(declare-fun m!232341 () Bool)

(assert (=> b!204770 m!232341))

(declare-fun m!232343 () Bool)

(assert (=> b!204770 m!232343))

(declare-fun m!232345 () Bool)

(assert (=> b!204770 m!232345))

(declare-fun m!232347 () Bool)

(assert (=> b!204770 m!232347))

(declare-fun m!232349 () Bool)

(assert (=> b!204770 m!232349))

(declare-fun m!232351 () Bool)

(assert (=> b!204770 m!232351))

(declare-fun m!232353 () Bool)

(assert (=> b!204770 m!232353))

(declare-fun m!232355 () Bool)

(assert (=> b!204776 m!232355))

(declare-fun m!232357 () Bool)

(assert (=> b!204778 m!232357))

(check-sat (not b!204778) (not b!204770) (not b!204771) (not b!204779) (not mapNonEmpty!8696) (not start!20570) (not b!204776) (not b!204772) b_and!11975 (not b_next!5229) tp_is_empty!5085)
(check-sat b_and!11975 (not b_next!5229))
