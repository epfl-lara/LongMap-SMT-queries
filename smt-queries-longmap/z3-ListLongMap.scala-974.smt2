; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21084 () Bool)

(assert start!21084)

(declare-fun b_free!5595 () Bool)

(declare-fun b_next!5595 () Bool)

(assert (=> start!21084 (= b_free!5595 (not b_next!5595))))

(declare-fun tp!19847 () Bool)

(declare-fun b_and!12425 () Bool)

(assert (=> start!21084 (= tp!19847 b_and!12425)))

(declare-fun b!212127 () Bool)

(declare-fun res!103685 () Bool)

(declare-fun e!138042 () Bool)

(assert (=> b!212127 (=> (not res!103685) (not e!138042))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212127 (= res!103685 (validKeyInArray!0 k0!843))))

(declare-fun b!212128 () Bool)

(declare-fun res!103684 () Bool)

(assert (=> b!212128 (=> (not res!103684) (not e!138042))))

(declare-datatypes ((array!10117 0))(
  ( (array!10118 (arr!4802 (Array (_ BitVec 32) (_ BitVec 64))) (size!5127 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10117)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10117 (_ BitVec 32)) Bool)

(assert (=> b!212128 (= res!103684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!103690 () Bool)

(assert (=> start!21084 (=> (not res!103690) (not e!138042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21084 (= res!103690 (validMask!0 mask!1149))))

(assert (=> start!21084 e!138042))

(declare-datatypes ((V!6923 0))(
  ( (V!6924 (val!2773 Int)) )
))
(declare-datatypes ((ValueCell!2385 0))(
  ( (ValueCellFull!2385 (v!4771 V!6923)) (EmptyCell!2385) )
))
(declare-datatypes ((array!10119 0))(
  ( (array!10120 (arr!4803 (Array (_ BitVec 32) ValueCell!2385)) (size!5128 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10119)

(declare-fun e!138039 () Bool)

(declare-fun array_inv!3177 (array!10119) Bool)

(assert (=> start!21084 (and (array_inv!3177 _values!649) e!138039)))

(assert (=> start!21084 true))

(declare-fun tp_is_empty!5457 () Bool)

(assert (=> start!21084 tp_is_empty!5457))

(declare-fun array_inv!3178 (array!10117) Bool)

(assert (=> start!21084 (array_inv!3178 _keys!825)))

(assert (=> start!21084 tp!19847))

(declare-datatypes ((tuple2!4196 0))(
  ( (tuple2!4197 (_1!2109 (_ BitVec 64)) (_2!2109 V!6923)) )
))
(declare-fun lt!109276 () tuple2!4196)

(declare-fun b!212129 () Bool)

(declare-datatypes ((List!3086 0))(
  ( (Nil!3083) (Cons!3082 (h!3724 tuple2!4196) (t!8031 List!3086)) )
))
(declare-datatypes ((ListLongMap!3109 0))(
  ( (ListLongMap!3110 (toList!1570 List!3086)) )
))
(declare-fun lt!109273 () ListLongMap!3109)

(declare-fun e!138041 () Bool)

(declare-fun lt!109278 () ListLongMap!3109)

(declare-fun +!573 (ListLongMap!3109 tuple2!4196) ListLongMap!3109)

(assert (=> b!212129 (= e!138041 (= (+!573 lt!109278 lt!109276) lt!109273))))

(declare-fun lt!109274 () ListLongMap!3109)

(declare-fun lt!109269 () ListLongMap!3109)

(assert (=> b!212129 (= lt!109274 (+!573 lt!109269 lt!109276))))

(declare-fun v!520 () V!6923)

(declare-fun zeroValue!615 () V!6923)

(declare-datatypes ((Unit!6440 0))(
  ( (Unit!6441) )
))
(declare-fun lt!109267 () Unit!6440)

(declare-fun lt!109268 () ListLongMap!3109)

(declare-fun addCommutativeForDiffKeys!206 (ListLongMap!3109 (_ BitVec 64) V!6923 (_ BitVec 64) V!6923) Unit!6440)

(assert (=> b!212129 (= lt!109267 (addCommutativeForDiffKeys!206 lt!109268 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212130 () Bool)

(declare-fun e!138044 () Bool)

(assert (=> b!212130 (= e!138044 tp_is_empty!5457)))

(declare-fun mapIsEmpty!9275 () Bool)

(declare-fun mapRes!9275 () Bool)

(assert (=> mapIsEmpty!9275 mapRes!9275))

(declare-fun mapNonEmpty!9275 () Bool)

(declare-fun tp!19846 () Bool)

(assert (=> mapNonEmpty!9275 (= mapRes!9275 (and tp!19846 e!138044))))

(declare-fun mapRest!9275 () (Array (_ BitVec 32) ValueCell!2385))

(declare-fun mapValue!9275 () ValueCell!2385)

(declare-fun mapKey!9275 () (_ BitVec 32))

(assert (=> mapNonEmpty!9275 (= (arr!4803 _values!649) (store mapRest!9275 mapKey!9275 mapValue!9275))))

(declare-fun b!212131 () Bool)

(declare-fun e!138043 () Bool)

(assert (=> b!212131 (= e!138043 tp_is_empty!5457)))

(declare-fun b!212132 () Bool)

(declare-fun res!103686 () Bool)

(assert (=> b!212132 (=> (not res!103686) (not e!138042))))

(declare-datatypes ((List!3087 0))(
  ( (Nil!3084) (Cons!3083 (h!3725 (_ BitVec 64)) (t!8032 List!3087)) )
))
(declare-fun arrayNoDuplicates!0 (array!10117 (_ BitVec 32) List!3087) Bool)

(assert (=> b!212132 (= res!103686 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3084))))

(declare-fun b!212133 () Bool)

(assert (=> b!212133 (= e!138039 (and e!138043 mapRes!9275))))

(declare-fun condMapEmpty!9275 () Bool)

(declare-fun mapDefault!9275 () ValueCell!2385)

(assert (=> b!212133 (= condMapEmpty!9275 (= (arr!4803 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2385)) mapDefault!9275)))))

(declare-fun b!212134 () Bool)

(declare-fun res!103683 () Bool)

(assert (=> b!212134 (=> (not res!103683) (not e!138042))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212134 (= res!103683 (and (= (size!5128 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5127 _keys!825) (size!5128 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212135 () Bool)

(declare-fun res!103687 () Bool)

(assert (=> b!212135 (=> (not res!103687) (not e!138042))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212135 (= res!103687 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5127 _keys!825))))))

(declare-fun b!212136 () Bool)

(declare-fun e!138038 () Bool)

(assert (=> b!212136 (= e!138038 e!138041)))

(declare-fun res!103689 () Bool)

(assert (=> b!212136 (=> res!103689 e!138041)))

(assert (=> b!212136 (= res!103689 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!212136 (= lt!109273 lt!109274)))

(declare-fun lt!109270 () ListLongMap!3109)

(declare-fun lt!109271 () tuple2!4196)

(assert (=> b!212136 (= lt!109274 (+!573 lt!109270 lt!109271))))

(assert (=> b!212136 (= lt!109278 lt!109269)))

(assert (=> b!212136 (= lt!109269 (+!573 lt!109268 lt!109271))))

(declare-fun lt!109277 () ListLongMap!3109)

(assert (=> b!212136 (= lt!109273 (+!573 lt!109277 lt!109271))))

(assert (=> b!212136 (= lt!109271 (tuple2!4197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212137 () Bool)

(declare-fun res!103682 () Bool)

(assert (=> b!212137 (=> (not res!103682) (not e!138042))))

(assert (=> b!212137 (= res!103682 (= (select (arr!4802 _keys!825) i!601) k0!843))))

(declare-fun b!212138 () Bool)

(assert (=> b!212138 (= e!138042 (not e!138038))))

(declare-fun res!103688 () Bool)

(assert (=> b!212138 (=> res!103688 e!138038)))

(assert (=> b!212138 (= res!103688 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6923)

(declare-fun getCurrentListMap!1103 (array!10117 array!10119 (_ BitVec 32) (_ BitVec 32) V!6923 V!6923 (_ BitVec 32) Int) ListLongMap!3109)

(assert (=> b!212138 (= lt!109278 (getCurrentListMap!1103 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109272 () array!10119)

(assert (=> b!212138 (= lt!109273 (getCurrentListMap!1103 _keys!825 lt!109272 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212138 (and (= lt!109277 lt!109270) (= lt!109270 lt!109277))))

(assert (=> b!212138 (= lt!109270 (+!573 lt!109268 lt!109276))))

(assert (=> b!212138 (= lt!109276 (tuple2!4197 k0!843 v!520))))

(declare-fun lt!109275 () Unit!6440)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!220 (array!10117 array!10119 (_ BitVec 32) (_ BitVec 32) V!6923 V!6923 (_ BitVec 32) (_ BitVec 64) V!6923 (_ BitVec 32) Int) Unit!6440)

(assert (=> b!212138 (= lt!109275 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!220 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!505 (array!10117 array!10119 (_ BitVec 32) (_ BitVec 32) V!6923 V!6923 (_ BitVec 32) Int) ListLongMap!3109)

(assert (=> b!212138 (= lt!109277 (getCurrentListMapNoExtraKeys!505 _keys!825 lt!109272 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212138 (= lt!109272 (array!10120 (store (arr!4803 _values!649) i!601 (ValueCellFull!2385 v!520)) (size!5128 _values!649)))))

(assert (=> b!212138 (= lt!109268 (getCurrentListMapNoExtraKeys!505 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!21084 res!103690) b!212134))

(assert (= (and b!212134 res!103683) b!212128))

(assert (= (and b!212128 res!103684) b!212132))

(assert (= (and b!212132 res!103686) b!212135))

(assert (= (and b!212135 res!103687) b!212127))

(assert (= (and b!212127 res!103685) b!212137))

(assert (= (and b!212137 res!103682) b!212138))

(assert (= (and b!212138 (not res!103688)) b!212136))

(assert (= (and b!212136 (not res!103689)) b!212129))

(assert (= (and b!212133 condMapEmpty!9275) mapIsEmpty!9275))

(assert (= (and b!212133 (not condMapEmpty!9275)) mapNonEmpty!9275))

(get-info :version)

(assert (= (and mapNonEmpty!9275 ((_ is ValueCellFull!2385) mapValue!9275)) b!212130))

(assert (= (and b!212133 ((_ is ValueCellFull!2385) mapDefault!9275)) b!212131))

(assert (= start!21084 b!212133))

(declare-fun m!239913 () Bool)

(assert (=> b!212136 m!239913))

(declare-fun m!239915 () Bool)

(assert (=> b!212136 m!239915))

(declare-fun m!239917 () Bool)

(assert (=> b!212136 m!239917))

(declare-fun m!239919 () Bool)

(assert (=> b!212138 m!239919))

(declare-fun m!239921 () Bool)

(assert (=> b!212138 m!239921))

(declare-fun m!239923 () Bool)

(assert (=> b!212138 m!239923))

(declare-fun m!239925 () Bool)

(assert (=> b!212138 m!239925))

(declare-fun m!239927 () Bool)

(assert (=> b!212138 m!239927))

(declare-fun m!239929 () Bool)

(assert (=> b!212138 m!239929))

(declare-fun m!239931 () Bool)

(assert (=> b!212138 m!239931))

(declare-fun m!239933 () Bool)

(assert (=> mapNonEmpty!9275 m!239933))

(declare-fun m!239935 () Bool)

(assert (=> b!212127 m!239935))

(declare-fun m!239937 () Bool)

(assert (=> b!212137 m!239937))

(declare-fun m!239939 () Bool)

(assert (=> b!212128 m!239939))

(declare-fun m!239941 () Bool)

(assert (=> start!21084 m!239941))

(declare-fun m!239943 () Bool)

(assert (=> start!21084 m!239943))

(declare-fun m!239945 () Bool)

(assert (=> start!21084 m!239945))

(declare-fun m!239947 () Bool)

(assert (=> b!212129 m!239947))

(declare-fun m!239949 () Bool)

(assert (=> b!212129 m!239949))

(declare-fun m!239951 () Bool)

(assert (=> b!212129 m!239951))

(declare-fun m!239953 () Bool)

(assert (=> b!212132 m!239953))

(check-sat (not b!212128) b_and!12425 (not start!21084) (not b!212132) tp_is_empty!5457 (not b!212129) (not b!212127) (not b!212136) (not mapNonEmpty!9275) (not b_next!5595) (not b!212138))
(check-sat b_and!12425 (not b_next!5595))
