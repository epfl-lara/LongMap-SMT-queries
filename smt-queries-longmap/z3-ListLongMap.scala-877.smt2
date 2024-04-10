; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20360 () Bool)

(assert start!20360)

(declare-fun b_free!5019 () Bool)

(declare-fun b_next!5019 () Bool)

(assert (=> start!20360 (= b_free!5019 (not b_next!5019))))

(declare-fun tp!18088 () Bool)

(declare-fun b_and!11765 () Bool)

(assert (=> start!20360 (= tp!18088 b_and!11765)))

(declare-fun b!200970 () Bool)

(declare-fun e!131750 () Bool)

(declare-fun e!131749 () Bool)

(assert (=> b!200970 (= e!131750 (not e!131749))))

(declare-fun res!95907 () Bool)

(assert (=> b!200970 (=> res!95907 e!131749)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200970 (= res!95907 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6147 0))(
  ( (V!6148 (val!2482 Int)) )
))
(declare-datatypes ((ValueCell!2094 0))(
  ( (ValueCellFull!2094 (v!4452 V!6147)) (EmptyCell!2094) )
))
(declare-datatypes ((array!8979 0))(
  ( (array!8980 (arr!4240 (Array (_ BitVec 32) ValueCell!2094)) (size!4565 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8979)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6147)

(declare-datatypes ((array!8981 0))(
  ( (array!8982 (arr!4241 (Array (_ BitVec 32) (_ BitVec 64))) (size!4566 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8981)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3754 0))(
  ( (tuple2!3755 (_1!1888 (_ BitVec 64)) (_2!1888 V!6147)) )
))
(declare-datatypes ((List!2670 0))(
  ( (Nil!2667) (Cons!2666 (h!3308 tuple2!3754) (t!7601 List!2670)) )
))
(declare-datatypes ((ListLongMap!2667 0))(
  ( (ListLongMap!2668 (toList!1349 List!2670)) )
))
(declare-fun lt!99759 () ListLongMap!2667)

(declare-fun minValue!615 () V!6147)

(declare-fun getCurrentListMap!938 (array!8981 array!8979 (_ BitVec 32) (_ BitVec 32) V!6147 V!6147 (_ BitVec 32) Int) ListLongMap!2667)

(assert (=> b!200970 (= lt!99759 (getCurrentListMap!938 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99754 () array!8979)

(declare-fun lt!99744 () ListLongMap!2667)

(assert (=> b!200970 (= lt!99744 (getCurrentListMap!938 _keys!825 lt!99754 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99752 () ListLongMap!2667)

(declare-fun lt!99757 () ListLongMap!2667)

(assert (=> b!200970 (and (= lt!99752 lt!99757) (= lt!99757 lt!99752))))

(declare-fun lt!99751 () ListLongMap!2667)

(declare-fun lt!99746 () tuple2!3754)

(declare-fun +!376 (ListLongMap!2667 tuple2!3754) ListLongMap!2667)

(assert (=> b!200970 (= lt!99757 (+!376 lt!99751 lt!99746))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6147)

(assert (=> b!200970 (= lt!99746 (tuple2!3755 k0!843 v!520))))

(declare-datatypes ((Unit!6052 0))(
  ( (Unit!6053) )
))
(declare-fun lt!99749 () Unit!6052)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!51 (array!8981 array!8979 (_ BitVec 32) (_ BitVec 32) V!6147 V!6147 (_ BitVec 32) (_ BitVec 64) V!6147 (_ BitVec 32) Int) Unit!6052)

(assert (=> b!200970 (= lt!99749 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!51 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!312 (array!8981 array!8979 (_ BitVec 32) (_ BitVec 32) V!6147 V!6147 (_ BitVec 32) Int) ListLongMap!2667)

(assert (=> b!200970 (= lt!99752 (getCurrentListMapNoExtraKeys!312 _keys!825 lt!99754 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200970 (= lt!99754 (array!8980 (store (arr!4240 _values!649) i!601 (ValueCellFull!2094 v!520)) (size!4565 _values!649)))))

(assert (=> b!200970 (= lt!99751 (getCurrentListMapNoExtraKeys!312 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200971 () Bool)

(declare-fun e!131748 () Bool)

(assert (=> b!200971 (= e!131749 e!131748)))

(declare-fun res!95902 () Bool)

(assert (=> b!200971 (=> res!95902 e!131748)))

(assert (=> b!200971 (= res!95902 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99745 () ListLongMap!2667)

(declare-fun lt!99753 () ListLongMap!2667)

(assert (=> b!200971 (= lt!99745 lt!99753)))

(declare-fun lt!99758 () ListLongMap!2667)

(assert (=> b!200971 (= lt!99753 (+!376 lt!99758 lt!99746))))

(declare-fun lt!99747 () Unit!6052)

(declare-fun addCommutativeForDiffKeys!97 (ListLongMap!2667 (_ BitVec 64) V!6147 (_ BitVec 64) V!6147) Unit!6052)

(assert (=> b!200971 (= lt!99747 (addCommutativeForDiffKeys!97 lt!99751 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99750 () tuple2!3754)

(assert (=> b!200971 (= lt!99744 (+!376 lt!99745 lt!99750))))

(declare-fun lt!99748 () tuple2!3754)

(assert (=> b!200971 (= lt!99745 (+!376 lt!99757 lt!99748))))

(declare-fun lt!99756 () ListLongMap!2667)

(assert (=> b!200971 (= lt!99759 lt!99756)))

(assert (=> b!200971 (= lt!99756 (+!376 lt!99758 lt!99750))))

(assert (=> b!200971 (= lt!99758 (+!376 lt!99751 lt!99748))))

(assert (=> b!200971 (= lt!99744 (+!376 (+!376 lt!99752 lt!99748) lt!99750))))

(assert (=> b!200971 (= lt!99750 (tuple2!3755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200971 (= lt!99748 (tuple2!3755 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200973 () Bool)

(declare-fun e!131752 () Bool)

(declare-fun tp_is_empty!4875 () Bool)

(assert (=> b!200973 (= e!131752 tp_is_empty!4875)))

(declare-fun b!200974 () Bool)

(declare-fun res!95904 () Bool)

(assert (=> b!200974 (=> (not res!95904) (not e!131750))))

(assert (=> b!200974 (= res!95904 (and (= (size!4565 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4566 _keys!825) (size!4565 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200975 () Bool)

(declare-fun res!95906 () Bool)

(assert (=> b!200975 (=> (not res!95906) (not e!131750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8981 (_ BitVec 32)) Bool)

(assert (=> b!200975 (= res!95906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200976 () Bool)

(declare-fun res!95905 () Bool)

(assert (=> b!200976 (=> (not res!95905) (not e!131750))))

(assert (=> b!200976 (= res!95905 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4566 _keys!825))))))

(declare-fun mapNonEmpty!8381 () Bool)

(declare-fun mapRes!8381 () Bool)

(declare-fun tp!18089 () Bool)

(assert (=> mapNonEmpty!8381 (= mapRes!8381 (and tp!18089 e!131752))))

(declare-fun mapRest!8381 () (Array (_ BitVec 32) ValueCell!2094))

(declare-fun mapValue!8381 () ValueCell!2094)

(declare-fun mapKey!8381 () (_ BitVec 32))

(assert (=> mapNonEmpty!8381 (= (arr!4240 _values!649) (store mapRest!8381 mapKey!8381 mapValue!8381))))

(declare-fun b!200977 () Bool)

(declare-fun res!95908 () Bool)

(assert (=> b!200977 (=> (not res!95908) (not e!131750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200977 (= res!95908 (validKeyInArray!0 k0!843))))

(declare-fun b!200978 () Bool)

(declare-fun res!95901 () Bool)

(assert (=> b!200978 (=> (not res!95901) (not e!131750))))

(assert (=> b!200978 (= res!95901 (= (select (arr!4241 _keys!825) i!601) k0!843))))

(declare-fun b!200979 () Bool)

(declare-fun e!131751 () Bool)

(assert (=> b!200979 (= e!131751 tp_is_empty!4875)))

(declare-fun mapIsEmpty!8381 () Bool)

(assert (=> mapIsEmpty!8381 mapRes!8381))

(declare-fun b!200980 () Bool)

(declare-fun e!131753 () Bool)

(assert (=> b!200980 (= e!131753 (and e!131751 mapRes!8381))))

(declare-fun condMapEmpty!8381 () Bool)

(declare-fun mapDefault!8381 () ValueCell!2094)

(assert (=> b!200980 (= condMapEmpty!8381 (= (arr!4240 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2094)) mapDefault!8381)))))

(declare-fun b!200981 () Bool)

(assert (=> b!200981 (= e!131748 true)))

(assert (=> b!200981 (= (+!376 lt!99753 lt!99750) (+!376 lt!99756 lt!99746))))

(declare-fun lt!99755 () Unit!6052)

(assert (=> b!200981 (= lt!99755 (addCommutativeForDiffKeys!97 lt!99758 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200972 () Bool)

(declare-fun res!95900 () Bool)

(assert (=> b!200972 (=> (not res!95900) (not e!131750))))

(declare-datatypes ((List!2671 0))(
  ( (Nil!2668) (Cons!2667 (h!3309 (_ BitVec 64)) (t!7602 List!2671)) )
))
(declare-fun arrayNoDuplicates!0 (array!8981 (_ BitVec 32) List!2671) Bool)

(assert (=> b!200972 (= res!95900 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2668))))

(declare-fun res!95903 () Bool)

(assert (=> start!20360 (=> (not res!95903) (not e!131750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20360 (= res!95903 (validMask!0 mask!1149))))

(assert (=> start!20360 e!131750))

(declare-fun array_inv!2789 (array!8979) Bool)

(assert (=> start!20360 (and (array_inv!2789 _values!649) e!131753)))

(assert (=> start!20360 true))

(assert (=> start!20360 tp_is_empty!4875))

(declare-fun array_inv!2790 (array!8981) Bool)

(assert (=> start!20360 (array_inv!2790 _keys!825)))

(assert (=> start!20360 tp!18088))

(assert (= (and start!20360 res!95903) b!200974))

(assert (= (and b!200974 res!95904) b!200975))

(assert (= (and b!200975 res!95906) b!200972))

(assert (= (and b!200972 res!95900) b!200976))

(assert (= (and b!200976 res!95905) b!200977))

(assert (= (and b!200977 res!95908) b!200978))

(assert (= (and b!200978 res!95901) b!200970))

(assert (= (and b!200970 (not res!95907)) b!200971))

(assert (= (and b!200971 (not res!95902)) b!200981))

(assert (= (and b!200980 condMapEmpty!8381) mapIsEmpty!8381))

(assert (= (and b!200980 (not condMapEmpty!8381)) mapNonEmpty!8381))

(get-info :version)

(assert (= (and mapNonEmpty!8381 ((_ is ValueCellFull!2094) mapValue!8381)) b!200973))

(assert (= (and b!200980 ((_ is ValueCellFull!2094) mapDefault!8381)) b!200979))

(assert (= start!20360 b!200980))

(declare-fun m!227687 () Bool)

(assert (=> b!200970 m!227687))

(declare-fun m!227689 () Bool)

(assert (=> b!200970 m!227689))

(declare-fun m!227691 () Bool)

(assert (=> b!200970 m!227691))

(declare-fun m!227693 () Bool)

(assert (=> b!200970 m!227693))

(declare-fun m!227695 () Bool)

(assert (=> b!200970 m!227695))

(declare-fun m!227697 () Bool)

(assert (=> b!200970 m!227697))

(declare-fun m!227699 () Bool)

(assert (=> b!200970 m!227699))

(declare-fun m!227701 () Bool)

(assert (=> b!200975 m!227701))

(declare-fun m!227703 () Bool)

(assert (=> b!200972 m!227703))

(declare-fun m!227705 () Bool)

(assert (=> b!200971 m!227705))

(declare-fun m!227707 () Bool)

(assert (=> b!200971 m!227707))

(declare-fun m!227709 () Bool)

(assert (=> b!200971 m!227709))

(declare-fun m!227711 () Bool)

(assert (=> b!200971 m!227711))

(declare-fun m!227713 () Bool)

(assert (=> b!200971 m!227713))

(declare-fun m!227715 () Bool)

(assert (=> b!200971 m!227715))

(declare-fun m!227717 () Bool)

(assert (=> b!200971 m!227717))

(declare-fun m!227719 () Bool)

(assert (=> b!200971 m!227719))

(assert (=> b!200971 m!227717))

(declare-fun m!227721 () Bool)

(assert (=> b!200981 m!227721))

(declare-fun m!227723 () Bool)

(assert (=> b!200981 m!227723))

(declare-fun m!227725 () Bool)

(assert (=> b!200981 m!227725))

(declare-fun m!227727 () Bool)

(assert (=> b!200977 m!227727))

(declare-fun m!227729 () Bool)

(assert (=> start!20360 m!227729))

(declare-fun m!227731 () Bool)

(assert (=> start!20360 m!227731))

(declare-fun m!227733 () Bool)

(assert (=> start!20360 m!227733))

(declare-fun m!227735 () Bool)

(assert (=> b!200978 m!227735))

(declare-fun m!227737 () Bool)

(assert (=> mapNonEmpty!8381 m!227737))

(check-sat (not b!200971) (not mapNonEmpty!8381) tp_is_empty!4875 (not b!200975) (not b!200972) (not b!200981) (not start!20360) (not b_next!5019) b_and!11765 (not b!200970) (not b!200977))
(check-sat b_and!11765 (not b_next!5019))
