; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20988 () Bool)

(assert start!20988)

(declare-fun b_free!5559 () Bool)

(declare-fun b_next!5559 () Bool)

(assert (=> start!20988 (= b_free!5559 (not b_next!5559))))

(declare-fun tp!19729 () Bool)

(declare-fun b_and!12353 () Bool)

(assert (=> start!20988 (= tp!19729 b_and!12353)))

(declare-fun b!210924 () Bool)

(declare-fun e!137325 () Bool)

(declare-fun e!137328 () Bool)

(declare-fun mapRes!9212 () Bool)

(assert (=> b!210924 (= e!137325 (and e!137328 mapRes!9212))))

(declare-fun condMapEmpty!9212 () Bool)

(declare-datatypes ((V!6875 0))(
  ( (V!6876 (val!2755 Int)) )
))
(declare-datatypes ((ValueCell!2367 0))(
  ( (ValueCellFull!2367 (v!4741 V!6875)) (EmptyCell!2367) )
))
(declare-datatypes ((array!10043 0))(
  ( (array!10044 (arr!4768 (Array (_ BitVec 32) ValueCell!2367)) (size!5093 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10043)

(declare-fun mapDefault!9212 () ValueCell!2367)

(assert (=> b!210924 (= condMapEmpty!9212 (= (arr!4768 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2367)) mapDefault!9212)))))

(declare-fun b!210925 () Bool)

(declare-fun res!102970 () Bool)

(declare-fun e!137324 () Bool)

(assert (=> b!210925 (=> (not res!102970) (not e!137324))))

(declare-datatypes ((array!10045 0))(
  ( (array!10046 (arr!4769 (Array (_ BitVec 32) (_ BitVec 64))) (size!5094 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10045)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10045 (_ BitVec 32)) Bool)

(assert (=> b!210925 (= res!102970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-datatypes ((tuple2!4162 0))(
  ( (tuple2!4163 (_1!2092 (_ BitVec 64)) (_2!2092 V!6875)) )
))
(declare-datatypes ((List!3056 0))(
  ( (Nil!3053) (Cons!3052 (h!3694 tuple2!4162) (t!7995 List!3056)) )
))
(declare-datatypes ((ListLongMap!3075 0))(
  ( (ListLongMap!3076 (toList!1553 List!3056)) )
))
(declare-fun lt!108323 () ListLongMap!3075)

(declare-fun e!137326 () Bool)

(declare-fun lt!108322 () tuple2!4162)

(declare-fun b!210926 () Bool)

(declare-fun lt!108314 () ListLongMap!3075)

(declare-fun +!556 (ListLongMap!3075 tuple2!4162) ListLongMap!3075)

(assert (=> b!210926 (= e!137326 (= (+!556 lt!108314 lt!108322) lt!108323))))

(declare-fun lt!108327 () ListLongMap!3075)

(declare-fun lt!108324 () ListLongMap!3075)

(declare-fun lt!108316 () tuple2!4162)

(assert (=> b!210926 (= (+!556 lt!108327 lt!108316) (+!556 lt!108324 lt!108322))))

(declare-fun lt!108321 () ListLongMap!3075)

(declare-fun minValue!615 () V!6875)

(declare-fun v!520 () V!6875)

(declare-datatypes ((Unit!6402 0))(
  ( (Unit!6403) )
))
(declare-fun lt!108326 () Unit!6402)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!201 (ListLongMap!3075 (_ BitVec 64) V!6875 (_ BitVec 64) V!6875) Unit!6402)

(assert (=> b!210926 (= lt!108326 (addCommutativeForDiffKeys!201 lt!108321 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!210927 () Bool)

(declare-fun res!102969 () Bool)

(assert (=> b!210927 (=> (not res!102969) (not e!137324))))

(declare-datatypes ((List!3057 0))(
  ( (Nil!3054) (Cons!3053 (h!3695 (_ BitVec 64)) (t!7996 List!3057)) )
))
(declare-fun arrayNoDuplicates!0 (array!10045 (_ BitVec 32) List!3057) Bool)

(assert (=> b!210927 (= res!102969 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3054))))

(declare-fun mapNonEmpty!9212 () Bool)

(declare-fun tp!19730 () Bool)

(declare-fun e!137329 () Bool)

(assert (=> mapNonEmpty!9212 (= mapRes!9212 (and tp!19730 e!137329))))

(declare-fun mapValue!9212 () ValueCell!2367)

(declare-fun mapRest!9212 () (Array (_ BitVec 32) ValueCell!2367))

(declare-fun mapKey!9212 () (_ BitVec 32))

(assert (=> mapNonEmpty!9212 (= (arr!4768 _values!649) (store mapRest!9212 mapKey!9212 mapValue!9212))))

(declare-fun b!210928 () Bool)

(declare-fun tp_is_empty!5421 () Bool)

(assert (=> b!210928 (= e!137329 tp_is_empty!5421)))

(declare-fun res!102965 () Bool)

(assert (=> start!20988 (=> (not res!102965) (not e!137324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20988 (= res!102965 (validMask!0 mask!1149))))

(assert (=> start!20988 e!137324))

(declare-fun array_inv!3157 (array!10043) Bool)

(assert (=> start!20988 (and (array_inv!3157 _values!649) e!137325)))

(assert (=> start!20988 true))

(assert (=> start!20988 tp_is_empty!5421))

(declare-fun array_inv!3158 (array!10045) Bool)

(assert (=> start!20988 (array_inv!3158 _keys!825)))

(assert (=> start!20988 tp!19729))

(declare-fun mapIsEmpty!9212 () Bool)

(assert (=> mapIsEmpty!9212 mapRes!9212))

(declare-fun b!210929 () Bool)

(declare-fun e!137330 () Bool)

(assert (=> b!210929 (= e!137330 e!137326)))

(declare-fun res!102966 () Bool)

(assert (=> b!210929 (=> res!102966 e!137326)))

(assert (=> b!210929 (= res!102966 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108318 () ListLongMap!3075)

(assert (=> b!210929 (= lt!108318 lt!108327)))

(assert (=> b!210929 (= lt!108327 (+!556 lt!108321 lt!108322))))

(declare-fun lt!108317 () ListLongMap!3075)

(declare-fun lt!108319 () Unit!6402)

(declare-fun zeroValue!615 () V!6875)

(assert (=> b!210929 (= lt!108319 (addCommutativeForDiffKeys!201 lt!108317 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!210929 (= lt!108323 (+!556 lt!108318 lt!108316))))

(declare-fun lt!108313 () ListLongMap!3075)

(declare-fun lt!108312 () tuple2!4162)

(assert (=> b!210929 (= lt!108318 (+!556 lt!108313 lt!108312))))

(assert (=> b!210929 (= lt!108314 lt!108324)))

(assert (=> b!210929 (= lt!108324 (+!556 lt!108321 lt!108316))))

(assert (=> b!210929 (= lt!108321 (+!556 lt!108317 lt!108312))))

(declare-fun lt!108325 () ListLongMap!3075)

(assert (=> b!210929 (= lt!108323 (+!556 (+!556 lt!108325 lt!108312) lt!108316))))

(assert (=> b!210929 (= lt!108316 (tuple2!4163 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210929 (= lt!108312 (tuple2!4163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210930 () Bool)

(declare-fun res!102968 () Bool)

(assert (=> b!210930 (=> (not res!102968) (not e!137324))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210930 (= res!102968 (= (select (arr!4769 _keys!825) i!601) k0!843))))

(declare-fun b!210931 () Bool)

(declare-fun res!102973 () Bool)

(assert (=> b!210931 (=> (not res!102973) (not e!137324))))

(assert (=> b!210931 (= res!102973 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5094 _keys!825))))))

(declare-fun b!210932 () Bool)

(declare-fun res!102971 () Bool)

(assert (=> b!210932 (=> (not res!102971) (not e!137324))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210932 (= res!102971 (and (= (size!5093 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5094 _keys!825) (size!5093 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210933 () Bool)

(declare-fun res!102967 () Bool)

(assert (=> b!210933 (=> (not res!102967) (not e!137324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210933 (= res!102967 (validKeyInArray!0 k0!843))))

(declare-fun b!210934 () Bool)

(assert (=> b!210934 (= e!137324 (not e!137330))))

(declare-fun res!102972 () Bool)

(assert (=> b!210934 (=> res!102972 e!137330)))

(assert (=> b!210934 (= res!102972 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1088 (array!10045 array!10043 (_ BitVec 32) (_ BitVec 32) V!6875 V!6875 (_ BitVec 32) Int) ListLongMap!3075)

(assert (=> b!210934 (= lt!108314 (getCurrentListMap!1088 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108320 () array!10043)

(assert (=> b!210934 (= lt!108323 (getCurrentListMap!1088 _keys!825 lt!108320 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210934 (and (= lt!108325 lt!108313) (= lt!108313 lt!108325))))

(assert (=> b!210934 (= lt!108313 (+!556 lt!108317 lt!108322))))

(assert (=> b!210934 (= lt!108322 (tuple2!4163 k0!843 v!520))))

(declare-fun lt!108315 () Unit!6402)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!205 (array!10045 array!10043 (_ BitVec 32) (_ BitVec 32) V!6875 V!6875 (_ BitVec 32) (_ BitVec 64) V!6875 (_ BitVec 32) Int) Unit!6402)

(assert (=> b!210934 (= lt!108315 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!205 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!490 (array!10045 array!10043 (_ BitVec 32) (_ BitVec 32) V!6875 V!6875 (_ BitVec 32) Int) ListLongMap!3075)

(assert (=> b!210934 (= lt!108325 (getCurrentListMapNoExtraKeys!490 _keys!825 lt!108320 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210934 (= lt!108320 (array!10044 (store (arr!4768 _values!649) i!601 (ValueCellFull!2367 v!520)) (size!5093 _values!649)))))

(assert (=> b!210934 (= lt!108317 (getCurrentListMapNoExtraKeys!490 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210935 () Bool)

(assert (=> b!210935 (= e!137328 tp_is_empty!5421)))

(assert (= (and start!20988 res!102965) b!210932))

(assert (= (and b!210932 res!102971) b!210925))

(assert (= (and b!210925 res!102970) b!210927))

(assert (= (and b!210927 res!102969) b!210931))

(assert (= (and b!210931 res!102973) b!210933))

(assert (= (and b!210933 res!102967) b!210930))

(assert (= (and b!210930 res!102968) b!210934))

(assert (= (and b!210934 (not res!102972)) b!210929))

(assert (= (and b!210929 (not res!102966)) b!210926))

(assert (= (and b!210924 condMapEmpty!9212) mapIsEmpty!9212))

(assert (= (and b!210924 (not condMapEmpty!9212)) mapNonEmpty!9212))

(get-info :version)

(assert (= (and mapNonEmpty!9212 ((_ is ValueCellFull!2367) mapValue!9212)) b!210928))

(assert (= (and b!210924 ((_ is ValueCellFull!2367) mapDefault!9212)) b!210935))

(assert (= start!20988 b!210924))

(declare-fun m!238623 () Bool)

(assert (=> b!210934 m!238623))

(declare-fun m!238625 () Bool)

(assert (=> b!210934 m!238625))

(declare-fun m!238627 () Bool)

(assert (=> b!210934 m!238627))

(declare-fun m!238629 () Bool)

(assert (=> b!210934 m!238629))

(declare-fun m!238631 () Bool)

(assert (=> b!210934 m!238631))

(declare-fun m!238633 () Bool)

(assert (=> b!210934 m!238633))

(declare-fun m!238635 () Bool)

(assert (=> b!210934 m!238635))

(declare-fun m!238637 () Bool)

(assert (=> b!210926 m!238637))

(declare-fun m!238639 () Bool)

(assert (=> b!210926 m!238639))

(declare-fun m!238641 () Bool)

(assert (=> b!210926 m!238641))

(declare-fun m!238643 () Bool)

(assert (=> b!210926 m!238643))

(declare-fun m!238645 () Bool)

(assert (=> b!210925 m!238645))

(declare-fun m!238647 () Bool)

(assert (=> b!210927 m!238647))

(declare-fun m!238649 () Bool)

(assert (=> b!210929 m!238649))

(declare-fun m!238651 () Bool)

(assert (=> b!210929 m!238651))

(declare-fun m!238653 () Bool)

(assert (=> b!210929 m!238653))

(declare-fun m!238655 () Bool)

(assert (=> b!210929 m!238655))

(declare-fun m!238657 () Bool)

(assert (=> b!210929 m!238657))

(declare-fun m!238659 () Bool)

(assert (=> b!210929 m!238659))

(declare-fun m!238661 () Bool)

(assert (=> b!210929 m!238661))

(assert (=> b!210929 m!238651))

(declare-fun m!238663 () Bool)

(assert (=> b!210929 m!238663))

(declare-fun m!238665 () Bool)

(assert (=> mapNonEmpty!9212 m!238665))

(declare-fun m!238667 () Bool)

(assert (=> start!20988 m!238667))

(declare-fun m!238669 () Bool)

(assert (=> start!20988 m!238669))

(declare-fun m!238671 () Bool)

(assert (=> start!20988 m!238671))

(declare-fun m!238673 () Bool)

(assert (=> b!210933 m!238673))

(declare-fun m!238675 () Bool)

(assert (=> b!210930 m!238675))

(check-sat (not b!210927) b_and!12353 (not b!210933) (not b_next!5559) (not start!20988) (not b!210926) (not b!210934) tp_is_empty!5421 (not mapNonEmpty!9212) (not b!210929) (not b!210925))
(check-sat b_and!12353 (not b_next!5559))
