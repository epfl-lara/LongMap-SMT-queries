; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20408 () Bool)

(assert start!20408)

(declare-fun b_free!5067 () Bool)

(declare-fun b_next!5067 () Bool)

(assert (=> start!20408 (= b_free!5067 (not b_next!5067))))

(declare-fun tp!18232 () Bool)

(declare-fun b_and!11813 () Bool)

(assert (=> start!20408 (= tp!18232 b_and!11813)))

(declare-fun b!201834 () Bool)

(declare-fun res!96555 () Bool)

(declare-fun e!132254 () Bool)

(assert (=> b!201834 (=> (not res!96555) (not e!132254))))

(declare-datatypes ((array!9075 0))(
  ( (array!9076 (arr!4288 (Array (_ BitVec 32) (_ BitVec 64))) (size!4613 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9075)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9075 (_ BitVec 32)) Bool)

(assert (=> b!201834 (= res!96555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201835 () Bool)

(declare-fun res!96552 () Bool)

(assert (=> b!201835 (=> (not res!96552) (not e!132254))))

(declare-datatypes ((List!2708 0))(
  ( (Nil!2705) (Cons!2704 (h!3346 (_ BitVec 64)) (t!7639 List!2708)) )
))
(declare-fun arrayNoDuplicates!0 (array!9075 (_ BitVec 32) List!2708) Bool)

(assert (=> b!201835 (= res!96552 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2705))))

(declare-fun b!201836 () Bool)

(declare-fun e!132251 () Bool)

(declare-fun e!132256 () Bool)

(declare-fun mapRes!8453 () Bool)

(assert (=> b!201836 (= e!132251 (and e!132256 mapRes!8453))))

(declare-fun condMapEmpty!8453 () Bool)

(declare-datatypes ((V!6211 0))(
  ( (V!6212 (val!2506 Int)) )
))
(declare-datatypes ((ValueCell!2118 0))(
  ( (ValueCellFull!2118 (v!4476 V!6211)) (EmptyCell!2118) )
))
(declare-datatypes ((array!9077 0))(
  ( (array!9078 (arr!4289 (Array (_ BitVec 32) ValueCell!2118)) (size!4614 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9077)

(declare-fun mapDefault!8453 () ValueCell!2118)

(assert (=> b!201836 (= condMapEmpty!8453 (= (arr!4289 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2118)) mapDefault!8453)))))

(declare-fun b!201837 () Bool)

(declare-fun tp_is_empty!4923 () Bool)

(assert (=> b!201837 (= e!132256 tp_is_empty!4923)))

(declare-fun b!201839 () Bool)

(declare-fun res!96550 () Bool)

(assert (=> b!201839 (=> (not res!96550) (not e!132254))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201839 (= res!96550 (= (select (arr!4288 _keys!825) i!601) k0!843))))

(declare-fun b!201840 () Bool)

(declare-fun res!96548 () Bool)

(assert (=> b!201840 (=> (not res!96548) (not e!132254))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201840 (= res!96548 (and (= (size!4614 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4613 _keys!825) (size!4614 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8453 () Bool)

(assert (=> mapIsEmpty!8453 mapRes!8453))

(declare-fun b!201841 () Bool)

(declare-fun e!132255 () Bool)

(assert (=> b!201841 (= e!132255 tp_is_empty!4923)))

(declare-fun b!201842 () Bool)

(declare-fun e!132252 () Bool)

(declare-fun e!132253 () Bool)

(assert (=> b!201842 (= e!132252 e!132253)))

(declare-fun res!96553 () Bool)

(assert (=> b!201842 (=> res!96553 e!132253)))

(assert (=> b!201842 (= res!96553 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3798 0))(
  ( (tuple2!3799 (_1!1910 (_ BitVec 64)) (_2!1910 V!6211)) )
))
(declare-datatypes ((List!2709 0))(
  ( (Nil!2706) (Cons!2705 (h!3347 tuple2!3798) (t!7640 List!2709)) )
))
(declare-datatypes ((ListLongMap!2711 0))(
  ( (ListLongMap!2712 (toList!1371 List!2709)) )
))
(declare-fun lt!100896 () ListLongMap!2711)

(declare-fun lt!100906 () ListLongMap!2711)

(assert (=> b!201842 (= lt!100896 lt!100906)))

(declare-fun lt!100911 () ListLongMap!2711)

(declare-fun lt!100910 () tuple2!3798)

(declare-fun +!398 (ListLongMap!2711 tuple2!3798) ListLongMap!2711)

(assert (=> b!201842 (= lt!100906 (+!398 lt!100911 lt!100910))))

(declare-datatypes ((Unit!6096 0))(
  ( (Unit!6097) )
))
(declare-fun lt!100897 () Unit!6096)

(declare-fun lt!100907 () ListLongMap!2711)

(declare-fun v!520 () V!6211)

(declare-fun zeroValue!615 () V!6211)

(declare-fun addCommutativeForDiffKeys!119 (ListLongMap!2711 (_ BitVec 64) V!6211 (_ BitVec 64) V!6211) Unit!6096)

(assert (=> b!201842 (= lt!100897 (addCommutativeForDiffKeys!119 lt!100907 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100902 () ListLongMap!2711)

(declare-fun lt!100908 () tuple2!3798)

(assert (=> b!201842 (= lt!100902 (+!398 lt!100896 lt!100908))))

(declare-fun lt!100899 () ListLongMap!2711)

(declare-fun lt!100909 () tuple2!3798)

(assert (=> b!201842 (= lt!100896 (+!398 lt!100899 lt!100909))))

(declare-fun lt!100904 () ListLongMap!2711)

(declare-fun lt!100900 () ListLongMap!2711)

(assert (=> b!201842 (= lt!100904 lt!100900)))

(assert (=> b!201842 (= lt!100900 (+!398 lt!100911 lt!100908))))

(assert (=> b!201842 (= lt!100911 (+!398 lt!100907 lt!100909))))

(declare-fun lt!100903 () ListLongMap!2711)

(assert (=> b!201842 (= lt!100902 (+!398 (+!398 lt!100903 lt!100909) lt!100908))))

(declare-fun minValue!615 () V!6211)

(assert (=> b!201842 (= lt!100908 (tuple2!3799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201842 (= lt!100909 (tuple2!3799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8453 () Bool)

(declare-fun tp!18233 () Bool)

(assert (=> mapNonEmpty!8453 (= mapRes!8453 (and tp!18233 e!132255))))

(declare-fun mapKey!8453 () (_ BitVec 32))

(declare-fun mapRest!8453 () (Array (_ BitVec 32) ValueCell!2118))

(declare-fun mapValue!8453 () ValueCell!2118)

(assert (=> mapNonEmpty!8453 (= (arr!4289 _values!649) (store mapRest!8453 mapKey!8453 mapValue!8453))))

(declare-fun b!201843 () Bool)

(assert (=> b!201843 (= e!132254 (not e!132252))))

(declare-fun res!96554 () Bool)

(assert (=> b!201843 (=> res!96554 e!132252)))

(assert (=> b!201843 (= res!96554 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!956 (array!9075 array!9077 (_ BitVec 32) (_ BitVec 32) V!6211 V!6211 (_ BitVec 32) Int) ListLongMap!2711)

(assert (=> b!201843 (= lt!100904 (getCurrentListMap!956 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100898 () array!9077)

(assert (=> b!201843 (= lt!100902 (getCurrentListMap!956 _keys!825 lt!100898 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201843 (and (= lt!100903 lt!100899) (= lt!100899 lt!100903))))

(assert (=> b!201843 (= lt!100899 (+!398 lt!100907 lt!100910))))

(assert (=> b!201843 (= lt!100910 (tuple2!3799 k0!843 v!520))))

(declare-fun lt!100905 () Unit!6096)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!69 (array!9075 array!9077 (_ BitVec 32) (_ BitVec 32) V!6211 V!6211 (_ BitVec 32) (_ BitVec 64) V!6211 (_ BitVec 32) Int) Unit!6096)

(assert (=> b!201843 (= lt!100905 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!69 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!330 (array!9075 array!9077 (_ BitVec 32) (_ BitVec 32) V!6211 V!6211 (_ BitVec 32) Int) ListLongMap!2711)

(assert (=> b!201843 (= lt!100903 (getCurrentListMapNoExtraKeys!330 _keys!825 lt!100898 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201843 (= lt!100898 (array!9078 (store (arr!4289 _values!649) i!601 (ValueCellFull!2118 v!520)) (size!4614 _values!649)))))

(assert (=> b!201843 (= lt!100907 (getCurrentListMapNoExtraKeys!330 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!96556 () Bool)

(assert (=> start!20408 (=> (not res!96556) (not e!132254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20408 (= res!96556 (validMask!0 mask!1149))))

(assert (=> start!20408 e!132254))

(declare-fun array_inv!2829 (array!9077) Bool)

(assert (=> start!20408 (and (array_inv!2829 _values!649) e!132251)))

(assert (=> start!20408 true))

(assert (=> start!20408 tp_is_empty!4923))

(declare-fun array_inv!2830 (array!9075) Bool)

(assert (=> start!20408 (array_inv!2830 _keys!825)))

(assert (=> start!20408 tp!18232))

(declare-fun b!201838 () Bool)

(declare-fun res!96549 () Bool)

(assert (=> b!201838 (=> (not res!96549) (not e!132254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201838 (= res!96549 (validKeyInArray!0 k0!843))))

(declare-fun b!201844 () Bool)

(assert (=> b!201844 (= e!132253 true)))

(assert (=> b!201844 (= (+!398 lt!100906 lt!100908) (+!398 lt!100900 lt!100910))))

(declare-fun lt!100901 () Unit!6096)

(assert (=> b!201844 (= lt!100901 (addCommutativeForDiffKeys!119 lt!100911 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201845 () Bool)

(declare-fun res!96551 () Bool)

(assert (=> b!201845 (=> (not res!96551) (not e!132254))))

(assert (=> b!201845 (= res!96551 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4613 _keys!825))))))

(assert (= (and start!20408 res!96556) b!201840))

(assert (= (and b!201840 res!96548) b!201834))

(assert (= (and b!201834 res!96555) b!201835))

(assert (= (and b!201835 res!96552) b!201845))

(assert (= (and b!201845 res!96551) b!201838))

(assert (= (and b!201838 res!96549) b!201839))

(assert (= (and b!201839 res!96550) b!201843))

(assert (= (and b!201843 (not res!96554)) b!201842))

(assert (= (and b!201842 (not res!96553)) b!201844))

(assert (= (and b!201836 condMapEmpty!8453) mapIsEmpty!8453))

(assert (= (and b!201836 (not condMapEmpty!8453)) mapNonEmpty!8453))

(get-info :version)

(assert (= (and mapNonEmpty!8453 ((_ is ValueCellFull!2118) mapValue!8453)) b!201841))

(assert (= (and b!201836 ((_ is ValueCellFull!2118) mapDefault!8453)) b!201837))

(assert (= start!20408 b!201836))

(declare-fun m!228935 () Bool)

(assert (=> b!201839 m!228935))

(declare-fun m!228937 () Bool)

(assert (=> b!201838 m!228937))

(declare-fun m!228939 () Bool)

(assert (=> b!201835 m!228939))

(declare-fun m!228941 () Bool)

(assert (=> b!201834 m!228941))

(declare-fun m!228943 () Bool)

(assert (=> start!20408 m!228943))

(declare-fun m!228945 () Bool)

(assert (=> start!20408 m!228945))

(declare-fun m!228947 () Bool)

(assert (=> start!20408 m!228947))

(declare-fun m!228949 () Bool)

(assert (=> mapNonEmpty!8453 m!228949))

(declare-fun m!228951 () Bool)

(assert (=> b!201842 m!228951))

(declare-fun m!228953 () Bool)

(assert (=> b!201842 m!228953))

(declare-fun m!228955 () Bool)

(assert (=> b!201842 m!228955))

(declare-fun m!228957 () Bool)

(assert (=> b!201842 m!228957))

(declare-fun m!228959 () Bool)

(assert (=> b!201842 m!228959))

(declare-fun m!228961 () Bool)

(assert (=> b!201842 m!228961))

(declare-fun m!228963 () Bool)

(assert (=> b!201842 m!228963))

(assert (=> b!201842 m!228951))

(declare-fun m!228965 () Bool)

(assert (=> b!201842 m!228965))

(declare-fun m!228967 () Bool)

(assert (=> b!201844 m!228967))

(declare-fun m!228969 () Bool)

(assert (=> b!201844 m!228969))

(declare-fun m!228971 () Bool)

(assert (=> b!201844 m!228971))

(declare-fun m!228973 () Bool)

(assert (=> b!201843 m!228973))

(declare-fun m!228975 () Bool)

(assert (=> b!201843 m!228975))

(declare-fun m!228977 () Bool)

(assert (=> b!201843 m!228977))

(declare-fun m!228979 () Bool)

(assert (=> b!201843 m!228979))

(declare-fun m!228981 () Bool)

(assert (=> b!201843 m!228981))

(declare-fun m!228983 () Bool)

(assert (=> b!201843 m!228983))

(declare-fun m!228985 () Bool)

(assert (=> b!201843 m!228985))

(check-sat (not b!201834) tp_is_empty!4923 (not b!201843) b_and!11813 (not b!201844) (not mapNonEmpty!8453) (not b!201838) (not b!201842) (not start!20408) (not b!201835) (not b_next!5067))
(check-sat b_and!11813 (not b_next!5067))
