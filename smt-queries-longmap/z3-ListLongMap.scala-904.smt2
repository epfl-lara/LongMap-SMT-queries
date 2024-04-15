; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20524 () Bool)

(assert start!20524)

(declare-fun b_free!5179 () Bool)

(declare-fun b_next!5179 () Bool)

(assert (=> start!20524 (= b_free!5179 (not b_next!5179))))

(declare-fun tp!18569 () Bool)

(declare-fun b_and!11899 () Bool)

(assert (=> start!20524 (= tp!18569 b_and!11899)))

(declare-fun b!203712 () Bool)

(declare-fun e!133331 () Bool)

(declare-fun e!133327 () Bool)

(assert (=> b!203712 (= e!133331 (not e!133327))))

(declare-fun res!97978 () Bool)

(assert (=> b!203712 (=> res!97978 e!133327)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203712 (= res!97978 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6361 0))(
  ( (V!6362 (val!2562 Int)) )
))
(declare-fun zeroValue!615 () V!6361)

(declare-datatypes ((array!9277 0))(
  ( (array!9278 (arr!4388 (Array (_ BitVec 32) (_ BitVec 64))) (size!4714 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9277)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6361)

(declare-datatypes ((tuple2!3864 0))(
  ( (tuple2!3865 (_1!1943 (_ BitVec 64)) (_2!1943 V!6361)) )
))
(declare-datatypes ((List!2773 0))(
  ( (Nil!2770) (Cons!2769 (h!3411 tuple2!3864) (t!7695 List!2773)) )
))
(declare-datatypes ((ListLongMap!2767 0))(
  ( (ListLongMap!2768 (toList!1399 List!2773)) )
))
(declare-fun lt!102861 () ListLongMap!2767)

(declare-datatypes ((ValueCell!2174 0))(
  ( (ValueCellFull!2174 (v!4526 V!6361)) (EmptyCell!2174) )
))
(declare-datatypes ((array!9279 0))(
  ( (array!9280 (arr!4389 (Array (_ BitVec 32) ValueCell!2174)) (size!4715 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9279)

(declare-fun getCurrentListMap!949 (array!9277 array!9279 (_ BitVec 32) (_ BitVec 32) V!6361 V!6361 (_ BitVec 32) Int) ListLongMap!2767)

(assert (=> b!203712 (= lt!102861 (getCurrentListMap!949 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102862 () array!9279)

(declare-fun lt!102859 () ListLongMap!2767)

(assert (=> b!203712 (= lt!102859 (getCurrentListMap!949 _keys!825 lt!102862 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102857 () ListLongMap!2767)

(declare-fun lt!102864 () ListLongMap!2767)

(assert (=> b!203712 (and (= lt!102857 lt!102864) (= lt!102864 lt!102857))))

(declare-fun lt!102860 () ListLongMap!2767)

(declare-fun lt!102865 () tuple2!3864)

(declare-fun +!448 (ListLongMap!2767 tuple2!3864) ListLongMap!2767)

(assert (=> b!203712 (= lt!102864 (+!448 lt!102860 lt!102865))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6361)

(assert (=> b!203712 (= lt!102865 (tuple2!3865 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6142 0))(
  ( (Unit!6143) )
))
(declare-fun lt!102855 () Unit!6142)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!108 (array!9277 array!9279 (_ BitVec 32) (_ BitVec 32) V!6361 V!6361 (_ BitVec 32) (_ BitVec 64) V!6361 (_ BitVec 32) Int) Unit!6142)

(assert (=> b!203712 (= lt!102855 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!108 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!359 (array!9277 array!9279 (_ BitVec 32) (_ BitVec 32) V!6361 V!6361 (_ BitVec 32) Int) ListLongMap!2767)

(assert (=> b!203712 (= lt!102857 (getCurrentListMapNoExtraKeys!359 _keys!825 lt!102862 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203712 (= lt!102862 (array!9280 (store (arr!4389 _values!649) i!601 (ValueCellFull!2174 v!520)) (size!4715 _values!649)))))

(assert (=> b!203712 (= lt!102860 (getCurrentListMapNoExtraKeys!359 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203713 () Bool)

(declare-fun res!97981 () Bool)

(assert (=> b!203713 (=> (not res!97981) (not e!133331))))

(assert (=> b!203713 (= res!97981 (= (select (arr!4388 _keys!825) i!601) k0!843))))

(declare-fun b!203714 () Bool)

(declare-fun e!133328 () Bool)

(declare-fun tp_is_empty!5035 () Bool)

(assert (=> b!203714 (= e!133328 tp_is_empty!5035)))

(declare-fun b!203715 () Bool)

(declare-fun e!133326 () Bool)

(declare-fun e!133329 () Bool)

(declare-fun mapRes!8621 () Bool)

(assert (=> b!203715 (= e!133326 (and e!133329 mapRes!8621))))

(declare-fun condMapEmpty!8621 () Bool)

(declare-fun mapDefault!8621 () ValueCell!2174)

(assert (=> b!203715 (= condMapEmpty!8621 (= (arr!4389 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2174)) mapDefault!8621)))))

(declare-fun mapIsEmpty!8621 () Bool)

(assert (=> mapIsEmpty!8621 mapRes!8621))

(declare-fun b!203716 () Bool)

(declare-fun res!97982 () Bool)

(assert (=> b!203716 (=> (not res!97982) (not e!133331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203716 (= res!97982 (validKeyInArray!0 k0!843))))

(declare-fun b!203717 () Bool)

(declare-fun res!97980 () Bool)

(assert (=> b!203717 (=> (not res!97980) (not e!133331))))

(declare-datatypes ((List!2774 0))(
  ( (Nil!2771) (Cons!2770 (h!3412 (_ BitVec 64)) (t!7696 List!2774)) )
))
(declare-fun arrayNoDuplicates!0 (array!9277 (_ BitVec 32) List!2774) Bool)

(assert (=> b!203717 (= res!97980 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2771))))

(declare-fun b!203718 () Bool)

(declare-fun res!97977 () Bool)

(assert (=> b!203718 (=> (not res!97977) (not e!133331))))

(assert (=> b!203718 (= res!97977 (and (= (size!4715 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4714 _keys!825) (size!4715 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203719 () Bool)

(declare-fun res!97974 () Bool)

(assert (=> b!203719 (=> (not res!97974) (not e!133331))))

(assert (=> b!203719 (= res!97974 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4714 _keys!825))))))

(declare-fun b!203720 () Bool)

(declare-fun res!97976 () Bool)

(assert (=> b!203720 (=> (not res!97976) (not e!133331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9277 (_ BitVec 32)) Bool)

(assert (=> b!203720 (= res!97976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203721 () Bool)

(declare-fun e!133330 () Bool)

(assert (=> b!203721 (= e!133330 true)))

(declare-fun lt!102856 () ListLongMap!2767)

(declare-fun lt!102858 () ListLongMap!2767)

(assert (=> b!203721 (= lt!102856 (+!448 lt!102858 lt!102865))))

(declare-fun lt!102866 () Unit!6142)

(declare-fun addCommutativeForDiffKeys!145 (ListLongMap!2767 (_ BitVec 64) V!6361 (_ BitVec 64) V!6361) Unit!6142)

(assert (=> b!203721 (= lt!102866 (addCommutativeForDiffKeys!145 lt!102860 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203722 () Bool)

(assert (=> b!203722 (= e!133327 e!133330)))

(declare-fun res!97979 () Bool)

(assert (=> b!203722 (=> res!97979 e!133330)))

(assert (=> b!203722 (= res!97979 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203722 (= lt!102859 lt!102856)))

(declare-fun lt!102863 () tuple2!3864)

(assert (=> b!203722 (= lt!102856 (+!448 lt!102864 lt!102863))))

(assert (=> b!203722 (= lt!102861 lt!102858)))

(assert (=> b!203722 (= lt!102858 (+!448 lt!102860 lt!102863))))

(assert (=> b!203722 (= lt!102859 (+!448 lt!102857 lt!102863))))

(assert (=> b!203722 (= lt!102863 (tuple2!3865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8621 () Bool)

(declare-fun tp!18568 () Bool)

(assert (=> mapNonEmpty!8621 (= mapRes!8621 (and tp!18568 e!133328))))

(declare-fun mapRest!8621 () (Array (_ BitVec 32) ValueCell!2174))

(declare-fun mapValue!8621 () ValueCell!2174)

(declare-fun mapKey!8621 () (_ BitVec 32))

(assert (=> mapNonEmpty!8621 (= (arr!4389 _values!649) (store mapRest!8621 mapKey!8621 mapValue!8621))))

(declare-fun b!203723 () Bool)

(assert (=> b!203723 (= e!133329 tp_is_empty!5035)))

(declare-fun res!97975 () Bool)

(assert (=> start!20524 (=> (not res!97975) (not e!133331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20524 (= res!97975 (validMask!0 mask!1149))))

(assert (=> start!20524 e!133331))

(declare-fun array_inv!2877 (array!9279) Bool)

(assert (=> start!20524 (and (array_inv!2877 _values!649) e!133326)))

(assert (=> start!20524 true))

(assert (=> start!20524 tp_is_empty!5035))

(declare-fun array_inv!2878 (array!9277) Bool)

(assert (=> start!20524 (array_inv!2878 _keys!825)))

(assert (=> start!20524 tp!18569))

(assert (= (and start!20524 res!97975) b!203718))

(assert (= (and b!203718 res!97977) b!203720))

(assert (= (and b!203720 res!97976) b!203717))

(assert (= (and b!203717 res!97980) b!203719))

(assert (= (and b!203719 res!97974) b!203716))

(assert (= (and b!203716 res!97982) b!203713))

(assert (= (and b!203713 res!97981) b!203712))

(assert (= (and b!203712 (not res!97978)) b!203722))

(assert (= (and b!203722 (not res!97979)) b!203721))

(assert (= (and b!203715 condMapEmpty!8621) mapIsEmpty!8621))

(assert (= (and b!203715 (not condMapEmpty!8621)) mapNonEmpty!8621))

(get-info :version)

(assert (= (and mapNonEmpty!8621 ((_ is ValueCellFull!2174) mapValue!8621)) b!203714))

(assert (= (and b!203715 ((_ is ValueCellFull!2174) mapDefault!8621)) b!203723))

(assert (= start!20524 b!203715))

(declare-fun m!230715 () Bool)

(assert (=> start!20524 m!230715))

(declare-fun m!230717 () Bool)

(assert (=> start!20524 m!230717))

(declare-fun m!230719 () Bool)

(assert (=> start!20524 m!230719))

(declare-fun m!230721 () Bool)

(assert (=> b!203713 m!230721))

(declare-fun m!230723 () Bool)

(assert (=> b!203712 m!230723))

(declare-fun m!230725 () Bool)

(assert (=> b!203712 m!230725))

(declare-fun m!230727 () Bool)

(assert (=> b!203712 m!230727))

(declare-fun m!230729 () Bool)

(assert (=> b!203712 m!230729))

(declare-fun m!230731 () Bool)

(assert (=> b!203712 m!230731))

(declare-fun m!230733 () Bool)

(assert (=> b!203712 m!230733))

(declare-fun m!230735 () Bool)

(assert (=> b!203712 m!230735))

(declare-fun m!230737 () Bool)

(assert (=> b!203722 m!230737))

(declare-fun m!230739 () Bool)

(assert (=> b!203722 m!230739))

(declare-fun m!230741 () Bool)

(assert (=> b!203722 m!230741))

(declare-fun m!230743 () Bool)

(assert (=> b!203716 m!230743))

(declare-fun m!230745 () Bool)

(assert (=> mapNonEmpty!8621 m!230745))

(declare-fun m!230747 () Bool)

(assert (=> b!203717 m!230747))

(declare-fun m!230749 () Bool)

(assert (=> b!203720 m!230749))

(declare-fun m!230751 () Bool)

(assert (=> b!203721 m!230751))

(declare-fun m!230753 () Bool)

(assert (=> b!203721 m!230753))

(check-sat (not b!203716) (not b_next!5179) (not b!203712) (not b!203721) (not b!203717) (not mapNonEmpty!8621) (not b!203722) (not b!203720) b_and!11899 (not start!20524) tp_is_empty!5035)
(check-sat b_and!11899 (not b_next!5179))
