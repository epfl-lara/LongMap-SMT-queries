; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20602 () Bool)

(assert start!20602)

(declare-fun b_free!5257 () Bool)

(declare-fun b_next!5257 () Bool)

(assert (=> start!20602 (= b_free!5257 (not b_next!5257))))

(declare-fun tp!18803 () Bool)

(declare-fun b_and!12017 () Bool)

(assert (=> start!20602 (= tp!18803 b_and!12017)))

(declare-fun res!99153 () Bool)

(declare-fun e!134271 () Bool)

(assert (=> start!20602 (=> (not res!99153) (not e!134271))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20602 (= res!99153 (validMask!0 mask!1149))))

(assert (=> start!20602 e!134271))

(declare-datatypes ((V!6465 0))(
  ( (V!6466 (val!2601 Int)) )
))
(declare-datatypes ((ValueCell!2213 0))(
  ( (ValueCellFull!2213 (v!4572 V!6465)) (EmptyCell!2213) )
))
(declare-datatypes ((array!9435 0))(
  ( (array!9436 (arr!4468 (Array (_ BitVec 32) ValueCell!2213)) (size!4793 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9435)

(declare-fun e!134273 () Bool)

(declare-fun array_inv!2925 (array!9435) Bool)

(assert (=> start!20602 (and (array_inv!2925 _values!649) e!134273)))

(assert (=> start!20602 true))

(declare-fun tp_is_empty!5113 () Bool)

(assert (=> start!20602 tp_is_empty!5113))

(declare-datatypes ((array!9437 0))(
  ( (array!9438 (arr!4469 (Array (_ BitVec 32) (_ BitVec 64))) (size!4794 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9437)

(declare-fun array_inv!2926 (array!9437) Bool)

(assert (=> start!20602 (array_inv!2926 _keys!825)))

(assert (=> start!20602 tp!18803))

(declare-fun b!205319 () Bool)

(declare-fun res!99154 () Bool)

(assert (=> b!205319 (=> (not res!99154) (not e!134271))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205319 (= res!99154 (and (= (size!4793 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4794 _keys!825) (size!4793 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205320 () Bool)

(declare-fun res!99160 () Bool)

(assert (=> b!205320 (=> (not res!99160) (not e!134271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9437 (_ BitVec 32)) Bool)

(assert (=> b!205320 (= res!99160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205321 () Bool)

(declare-fun e!134275 () Bool)

(declare-fun mapRes!8738 () Bool)

(assert (=> b!205321 (= e!134273 (and e!134275 mapRes!8738))))

(declare-fun condMapEmpty!8738 () Bool)

(declare-fun mapDefault!8738 () ValueCell!2213)

(assert (=> b!205321 (= condMapEmpty!8738 (= (arr!4468 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2213)) mapDefault!8738)))))

(declare-fun b!205322 () Bool)

(declare-fun res!99158 () Bool)

(assert (=> b!205322 (=> (not res!99158) (not e!134271))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205322 (= res!99158 (validKeyInArray!0 k0!843))))

(declare-fun b!205323 () Bool)

(declare-fun e!134276 () Bool)

(assert (=> b!205323 (= e!134276 tp_is_empty!5113)))

(declare-fun mapNonEmpty!8738 () Bool)

(declare-fun tp!18802 () Bool)

(assert (=> mapNonEmpty!8738 (= mapRes!8738 (and tp!18802 e!134276))))

(declare-fun mapValue!8738 () ValueCell!2213)

(declare-fun mapKey!8738 () (_ BitVec 32))

(declare-fun mapRest!8738 () (Array (_ BitVec 32) ValueCell!2213))

(assert (=> mapNonEmpty!8738 (= (arr!4468 _values!649) (store mapRest!8738 mapKey!8738 mapValue!8738))))

(declare-fun b!205324 () Bool)

(declare-fun e!134274 () Bool)

(assert (=> b!205324 (= e!134271 (not e!134274))))

(declare-fun res!99152 () Bool)

(assert (=> b!205324 (=> res!99152 e!134274)))

(assert (=> b!205324 (= res!99152 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3894 0))(
  ( (tuple2!3895 (_1!1958 (_ BitVec 64)) (_2!1958 V!6465)) )
))
(declare-datatypes ((List!2787 0))(
  ( (Nil!2784) (Cons!2783 (h!3425 tuple2!3894) (t!7710 List!2787)) )
))
(declare-datatypes ((ListLongMap!2809 0))(
  ( (ListLongMap!2810 (toList!1420 List!2787)) )
))
(declare-fun lt!104464 () ListLongMap!2809)

(declare-fun zeroValue!615 () V!6465)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6465)

(declare-fun getCurrentListMap!994 (array!9437 array!9435 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) Int) ListLongMap!2809)

(assert (=> b!205324 (= lt!104464 (getCurrentListMap!994 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104466 () array!9435)

(declare-fun lt!104468 () ListLongMap!2809)

(assert (=> b!205324 (= lt!104468 (getCurrentListMap!994 _keys!825 lt!104466 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104472 () ListLongMap!2809)

(declare-fun lt!104463 () ListLongMap!2809)

(assert (=> b!205324 (and (= lt!104472 lt!104463) (= lt!104463 lt!104472))))

(declare-fun lt!104469 () ListLongMap!2809)

(declare-fun lt!104465 () tuple2!3894)

(declare-fun +!474 (ListLongMap!2809 tuple2!3894) ListLongMap!2809)

(assert (=> b!205324 (= lt!104463 (+!474 lt!104469 lt!104465))))

(declare-fun v!520 () V!6465)

(assert (=> b!205324 (= lt!104465 (tuple2!3895 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6226 0))(
  ( (Unit!6227) )
))
(declare-fun lt!104474 () Unit!6226)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!130 (array!9437 array!9435 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) (_ BitVec 64) V!6465 (_ BitVec 32) Int) Unit!6226)

(assert (=> b!205324 (= lt!104474 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!130 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!387 (array!9437 array!9435 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) Int) ListLongMap!2809)

(assert (=> b!205324 (= lt!104472 (getCurrentListMapNoExtraKeys!387 _keys!825 lt!104466 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205324 (= lt!104466 (array!9436 (store (arr!4468 _values!649) i!601 (ValueCellFull!2213 v!520)) (size!4793 _values!649)))))

(assert (=> b!205324 (= lt!104469 (getCurrentListMapNoExtraKeys!387 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205325 () Bool)

(assert (=> b!205325 (= e!134275 tp_is_empty!5113)))

(declare-fun mapIsEmpty!8738 () Bool)

(assert (=> mapIsEmpty!8738 mapRes!8738))

(declare-fun b!205326 () Bool)

(declare-fun res!99157 () Bool)

(assert (=> b!205326 (=> (not res!99157) (not e!134271))))

(declare-datatypes ((List!2788 0))(
  ( (Nil!2785) (Cons!2784 (h!3426 (_ BitVec 64)) (t!7711 List!2788)) )
))
(declare-fun arrayNoDuplicates!0 (array!9437 (_ BitVec 32) List!2788) Bool)

(assert (=> b!205326 (= res!99157 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2785))))

(declare-fun b!205327 () Bool)

(declare-fun res!99156 () Bool)

(assert (=> b!205327 (=> (not res!99156) (not e!134271))))

(assert (=> b!205327 (= res!99156 (= (select (arr!4469 _keys!825) i!601) k0!843))))

(declare-fun b!205328 () Bool)

(declare-fun res!99159 () Bool)

(assert (=> b!205328 (=> (not res!99159) (not e!134271))))

(assert (=> b!205328 (= res!99159 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4794 _keys!825))))))

(declare-fun b!205329 () Bool)

(declare-fun e!134272 () Bool)

(assert (=> b!205329 (= e!134274 e!134272)))

(declare-fun res!99155 () Bool)

(assert (=> b!205329 (=> res!99155 e!134272)))

(assert (=> b!205329 (= res!99155 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104470 () ListLongMap!2809)

(assert (=> b!205329 (= lt!104464 lt!104470)))

(declare-fun lt!104473 () tuple2!3894)

(assert (=> b!205329 (= lt!104470 (+!474 lt!104469 lt!104473))))

(declare-fun lt!104471 () ListLongMap!2809)

(assert (=> b!205329 (= lt!104468 lt!104471)))

(assert (=> b!205329 (= lt!104471 (+!474 lt!104463 lt!104473))))

(assert (=> b!205329 (= lt!104468 (+!474 lt!104472 lt!104473))))

(assert (=> b!205329 (= lt!104473 (tuple2!3895 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205330 () Bool)

(assert (=> b!205330 (= e!134272 true)))

(assert (=> b!205330 (= lt!104471 (+!474 lt!104470 lt!104465))))

(declare-fun lt!104467 () Unit!6226)

(declare-fun addCommutativeForDiffKeys!179 (ListLongMap!2809 (_ BitVec 64) V!6465 (_ BitVec 64) V!6465) Unit!6226)

(assert (=> b!205330 (= lt!104467 (addCommutativeForDiffKeys!179 lt!104469 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20602 res!99153) b!205319))

(assert (= (and b!205319 res!99154) b!205320))

(assert (= (and b!205320 res!99160) b!205326))

(assert (= (and b!205326 res!99157) b!205328))

(assert (= (and b!205328 res!99159) b!205322))

(assert (= (and b!205322 res!99158) b!205327))

(assert (= (and b!205327 res!99156) b!205324))

(assert (= (and b!205324 (not res!99152)) b!205329))

(assert (= (and b!205329 (not res!99155)) b!205330))

(assert (= (and b!205321 condMapEmpty!8738) mapIsEmpty!8738))

(assert (= (and b!205321 (not condMapEmpty!8738)) mapNonEmpty!8738))

(get-info :version)

(assert (= (and mapNonEmpty!8738 ((_ is ValueCellFull!2213) mapValue!8738)) b!205323))

(assert (= (and b!205321 ((_ is ValueCellFull!2213) mapDefault!8738)) b!205325))

(assert (= start!20602 b!205321))

(declare-fun m!233061 () Bool)

(assert (=> start!20602 m!233061))

(declare-fun m!233063 () Bool)

(assert (=> start!20602 m!233063))

(declare-fun m!233065 () Bool)

(assert (=> start!20602 m!233065))

(declare-fun m!233067 () Bool)

(assert (=> b!205326 m!233067))

(declare-fun m!233069 () Bool)

(assert (=> b!205329 m!233069))

(declare-fun m!233071 () Bool)

(assert (=> b!205329 m!233071))

(declare-fun m!233073 () Bool)

(assert (=> b!205329 m!233073))

(declare-fun m!233075 () Bool)

(assert (=> b!205327 m!233075))

(declare-fun m!233077 () Bool)

(assert (=> mapNonEmpty!8738 m!233077))

(declare-fun m!233079 () Bool)

(assert (=> b!205320 m!233079))

(declare-fun m!233081 () Bool)

(assert (=> b!205324 m!233081))

(declare-fun m!233083 () Bool)

(assert (=> b!205324 m!233083))

(declare-fun m!233085 () Bool)

(assert (=> b!205324 m!233085))

(declare-fun m!233087 () Bool)

(assert (=> b!205324 m!233087))

(declare-fun m!233089 () Bool)

(assert (=> b!205324 m!233089))

(declare-fun m!233091 () Bool)

(assert (=> b!205324 m!233091))

(declare-fun m!233093 () Bool)

(assert (=> b!205324 m!233093))

(declare-fun m!233095 () Bool)

(assert (=> b!205322 m!233095))

(declare-fun m!233097 () Bool)

(assert (=> b!205330 m!233097))

(declare-fun m!233099 () Bool)

(assert (=> b!205330 m!233099))

(check-sat tp_is_empty!5113 (not b!205322) (not mapNonEmpty!8738) (not b!205326) b_and!12017 (not b!205324) (not start!20602) (not b!205330) (not b!205329) (not b_next!5257) (not b!205320))
(check-sat b_and!12017 (not b_next!5257))
