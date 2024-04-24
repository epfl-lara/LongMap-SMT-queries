; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20596 () Bool)

(assert start!20596)

(declare-fun b_free!5251 () Bool)

(declare-fun b_next!5251 () Bool)

(assert (=> start!20596 (= b_free!5251 (not b_next!5251))))

(declare-fun tp!18784 () Bool)

(declare-fun b_and!12011 () Bool)

(assert (=> start!20596 (= tp!18784 b_and!12011)))

(declare-fun b!205211 () Bool)

(declare-fun e!134207 () Bool)

(assert (=> b!205211 (= e!134207 true)))

(declare-datatypes ((V!6457 0))(
  ( (V!6458 (val!2598 Int)) )
))
(declare-datatypes ((tuple2!3890 0))(
  ( (tuple2!3891 (_1!1956 (_ BitVec 64)) (_2!1956 V!6457)) )
))
(declare-datatypes ((List!2784 0))(
  ( (Nil!2781) (Cons!2780 (h!3422 tuple2!3890) (t!7707 List!2784)) )
))
(declare-datatypes ((ListLongMap!2805 0))(
  ( (ListLongMap!2806 (toList!1418 List!2784)) )
))
(declare-fun lt!104363 () ListLongMap!2805)

(declare-fun lt!104361 () ListLongMap!2805)

(declare-fun lt!104360 () tuple2!3890)

(declare-fun +!472 (ListLongMap!2805 tuple2!3890) ListLongMap!2805)

(assert (=> b!205211 (= lt!104363 (+!472 lt!104361 lt!104360))))

(declare-fun minValue!615 () V!6457)

(declare-datatypes ((Unit!6222 0))(
  ( (Unit!6223) )
))
(declare-fun lt!104359 () Unit!6222)

(declare-fun lt!104362 () ListLongMap!2805)

(declare-fun v!520 () V!6457)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!178 (ListLongMap!2805 (_ BitVec 64) V!6457 (_ BitVec 64) V!6457) Unit!6222)

(assert (=> b!205211 (= lt!104359 (addCommutativeForDiffKeys!178 lt!104362 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205212 () Bool)

(declare-fun e!134208 () Bool)

(declare-fun tp_is_empty!5107 () Bool)

(assert (=> b!205212 (= e!134208 tp_is_empty!5107)))

(declare-fun mapNonEmpty!8729 () Bool)

(declare-fun mapRes!8729 () Bool)

(declare-fun tp!18785 () Bool)

(assert (=> mapNonEmpty!8729 (= mapRes!8729 (and tp!18785 e!134208))))

(declare-datatypes ((ValueCell!2210 0))(
  ( (ValueCellFull!2210 (v!4569 V!6457)) (EmptyCell!2210) )
))
(declare-fun mapValue!8729 () ValueCell!2210)

(declare-datatypes ((array!9423 0))(
  ( (array!9424 (arr!4462 (Array (_ BitVec 32) ValueCell!2210)) (size!4787 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9423)

(declare-fun mapKey!8729 () (_ BitVec 32))

(declare-fun mapRest!8729 () (Array (_ BitVec 32) ValueCell!2210))

(assert (=> mapNonEmpty!8729 (= (arr!4462 _values!649) (store mapRest!8729 mapKey!8729 mapValue!8729))))

(declare-fun res!99077 () Bool)

(declare-fun e!134210 () Bool)

(assert (=> start!20596 (=> (not res!99077) (not e!134210))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20596 (= res!99077 (validMask!0 mask!1149))))

(assert (=> start!20596 e!134210))

(declare-fun e!134213 () Bool)

(declare-fun array_inv!2921 (array!9423) Bool)

(assert (=> start!20596 (and (array_inv!2921 _values!649) e!134213)))

(assert (=> start!20596 true))

(assert (=> start!20596 tp_is_empty!5107))

(declare-datatypes ((array!9425 0))(
  ( (array!9426 (arr!4463 (Array (_ BitVec 32) (_ BitVec 64))) (size!4788 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9425)

(declare-fun array_inv!2922 (array!9425) Bool)

(assert (=> start!20596 (array_inv!2922 _keys!825)))

(assert (=> start!20596 tp!18784))

(declare-fun b!205213 () Bool)

(declare-fun res!99072 () Bool)

(assert (=> b!205213 (=> (not res!99072) (not e!134210))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205213 (= res!99072 (= (select (arr!4463 _keys!825) i!601) k0!843))))

(declare-fun b!205214 () Bool)

(declare-fun res!99073 () Bool)

(assert (=> b!205214 (=> (not res!99073) (not e!134210))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205214 (= res!99073 (and (= (size!4787 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4788 _keys!825) (size!4787 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205215 () Bool)

(declare-fun e!134212 () Bool)

(assert (=> b!205215 (= e!134210 (not e!134212))))

(declare-fun res!99076 () Bool)

(assert (=> b!205215 (=> res!99076 e!134212)))

(assert (=> b!205215 (= res!99076 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!104365 () ListLongMap!2805)

(declare-fun zeroValue!615 () V!6457)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!992 (array!9425 array!9423 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) Int) ListLongMap!2805)

(assert (=> b!205215 (= lt!104365 (getCurrentListMap!992 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104356 () ListLongMap!2805)

(declare-fun lt!104358 () array!9423)

(assert (=> b!205215 (= lt!104356 (getCurrentListMap!992 _keys!825 lt!104358 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104355 () ListLongMap!2805)

(declare-fun lt!104357 () ListLongMap!2805)

(assert (=> b!205215 (and (= lt!104355 lt!104357) (= lt!104357 lt!104355))))

(assert (=> b!205215 (= lt!104357 (+!472 lt!104362 lt!104360))))

(assert (=> b!205215 (= lt!104360 (tuple2!3891 k0!843 v!520))))

(declare-fun lt!104364 () Unit!6222)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!128 (array!9425 array!9423 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) (_ BitVec 64) V!6457 (_ BitVec 32) Int) Unit!6222)

(assert (=> b!205215 (= lt!104364 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!128 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!385 (array!9425 array!9423 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) Int) ListLongMap!2805)

(assert (=> b!205215 (= lt!104355 (getCurrentListMapNoExtraKeys!385 _keys!825 lt!104358 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205215 (= lt!104358 (array!9424 (store (arr!4462 _values!649) i!601 (ValueCellFull!2210 v!520)) (size!4787 _values!649)))))

(assert (=> b!205215 (= lt!104362 (getCurrentListMapNoExtraKeys!385 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8729 () Bool)

(assert (=> mapIsEmpty!8729 mapRes!8729))

(declare-fun b!205216 () Bool)

(assert (=> b!205216 (= e!134212 e!134207)))

(declare-fun res!99078 () Bool)

(assert (=> b!205216 (=> res!99078 e!134207)))

(assert (=> b!205216 (= res!99078 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205216 (= lt!104365 lt!104361)))

(declare-fun lt!104366 () tuple2!3890)

(assert (=> b!205216 (= lt!104361 (+!472 lt!104362 lt!104366))))

(assert (=> b!205216 (= lt!104356 lt!104363)))

(assert (=> b!205216 (= lt!104363 (+!472 lt!104357 lt!104366))))

(assert (=> b!205216 (= lt!104356 (+!472 lt!104355 lt!104366))))

(assert (=> b!205216 (= lt!104366 (tuple2!3891 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205217 () Bool)

(declare-fun e!134211 () Bool)

(assert (=> b!205217 (= e!134211 tp_is_empty!5107)))

(declare-fun b!205218 () Bool)

(declare-fun res!99074 () Bool)

(assert (=> b!205218 (=> (not res!99074) (not e!134210))))

(assert (=> b!205218 (= res!99074 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4788 _keys!825))))))

(declare-fun b!205219 () Bool)

(declare-fun res!99079 () Bool)

(assert (=> b!205219 (=> (not res!99079) (not e!134210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9425 (_ BitVec 32)) Bool)

(assert (=> b!205219 (= res!99079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205220 () Bool)

(declare-fun res!99075 () Bool)

(assert (=> b!205220 (=> (not res!99075) (not e!134210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205220 (= res!99075 (validKeyInArray!0 k0!843))))

(declare-fun b!205221 () Bool)

(assert (=> b!205221 (= e!134213 (and e!134211 mapRes!8729))))

(declare-fun condMapEmpty!8729 () Bool)

(declare-fun mapDefault!8729 () ValueCell!2210)

(assert (=> b!205221 (= condMapEmpty!8729 (= (arr!4462 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2210)) mapDefault!8729)))))

(declare-fun b!205222 () Bool)

(declare-fun res!99071 () Bool)

(assert (=> b!205222 (=> (not res!99071) (not e!134210))))

(declare-datatypes ((List!2785 0))(
  ( (Nil!2782) (Cons!2781 (h!3423 (_ BitVec 64)) (t!7708 List!2785)) )
))
(declare-fun arrayNoDuplicates!0 (array!9425 (_ BitVec 32) List!2785) Bool)

(assert (=> b!205222 (= res!99071 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2782))))

(assert (= (and start!20596 res!99077) b!205214))

(assert (= (and b!205214 res!99073) b!205219))

(assert (= (and b!205219 res!99079) b!205222))

(assert (= (and b!205222 res!99071) b!205218))

(assert (= (and b!205218 res!99074) b!205220))

(assert (= (and b!205220 res!99075) b!205213))

(assert (= (and b!205213 res!99072) b!205215))

(assert (= (and b!205215 (not res!99076)) b!205216))

(assert (= (and b!205216 (not res!99078)) b!205211))

(assert (= (and b!205221 condMapEmpty!8729) mapIsEmpty!8729))

(assert (= (and b!205221 (not condMapEmpty!8729)) mapNonEmpty!8729))

(get-info :version)

(assert (= (and mapNonEmpty!8729 ((_ is ValueCellFull!2210) mapValue!8729)) b!205212))

(assert (= (and b!205221 ((_ is ValueCellFull!2210) mapDefault!8729)) b!205217))

(assert (= start!20596 b!205221))

(declare-fun m!232941 () Bool)

(assert (=> b!205211 m!232941))

(declare-fun m!232943 () Bool)

(assert (=> b!205211 m!232943))

(declare-fun m!232945 () Bool)

(assert (=> start!20596 m!232945))

(declare-fun m!232947 () Bool)

(assert (=> start!20596 m!232947))

(declare-fun m!232949 () Bool)

(assert (=> start!20596 m!232949))

(declare-fun m!232951 () Bool)

(assert (=> b!205215 m!232951))

(declare-fun m!232953 () Bool)

(assert (=> b!205215 m!232953))

(declare-fun m!232955 () Bool)

(assert (=> b!205215 m!232955))

(declare-fun m!232957 () Bool)

(assert (=> b!205215 m!232957))

(declare-fun m!232959 () Bool)

(assert (=> b!205215 m!232959))

(declare-fun m!232961 () Bool)

(assert (=> b!205215 m!232961))

(declare-fun m!232963 () Bool)

(assert (=> b!205215 m!232963))

(declare-fun m!232965 () Bool)

(assert (=> b!205222 m!232965))

(declare-fun m!232967 () Bool)

(assert (=> b!205220 m!232967))

(declare-fun m!232969 () Bool)

(assert (=> mapNonEmpty!8729 m!232969))

(declare-fun m!232971 () Bool)

(assert (=> b!205219 m!232971))

(declare-fun m!232973 () Bool)

(assert (=> b!205216 m!232973))

(declare-fun m!232975 () Bool)

(assert (=> b!205216 m!232975))

(declare-fun m!232977 () Bool)

(assert (=> b!205216 m!232977))

(declare-fun m!232979 () Bool)

(assert (=> b!205213 m!232979))

(check-sat (not b!205216) (not b_next!5251) (not start!20596) (not b!205222) (not b!205211) (not b!205220) tp_is_empty!5107 (not b!205215) (not mapNonEmpty!8729) (not b!205219) b_and!12011)
(check-sat b_and!12011 (not b_next!5251))
