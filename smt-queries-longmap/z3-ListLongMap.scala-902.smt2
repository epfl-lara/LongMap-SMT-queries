; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20512 () Bool)

(assert start!20512)

(declare-fun b_free!5167 () Bool)

(declare-fun b_next!5167 () Bool)

(assert (=> start!20512 (= b_free!5167 (not b_next!5167))))

(declare-fun tp!18532 () Bool)

(declare-fun b_and!11927 () Bool)

(assert (=> start!20512 (= tp!18532 b_and!11927)))

(declare-fun b!203690 () Bool)

(declare-fun e!133327 () Bool)

(declare-fun e!133326 () Bool)

(assert (=> b!203690 (= e!133327 e!133326)))

(declare-fun res!97934 () Bool)

(assert (=> b!203690 (=> res!97934 e!133326)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203690 (= res!97934 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6345 0))(
  ( (V!6346 (val!2556 Int)) )
))
(declare-datatypes ((tuple2!3818 0))(
  ( (tuple2!3819 (_1!1920 (_ BitVec 64)) (_2!1920 V!6345)) )
))
(declare-datatypes ((List!2717 0))(
  ( (Nil!2714) (Cons!2713 (h!3355 tuple2!3818) (t!7640 List!2717)) )
))
(declare-datatypes ((ListLongMap!2733 0))(
  ( (ListLongMap!2734 (toList!1382 List!2717)) )
))
(declare-fun lt!102882 () ListLongMap!2733)

(declare-fun lt!102879 () ListLongMap!2733)

(assert (=> b!203690 (= lt!102882 lt!102879)))

(declare-fun lt!102880 () ListLongMap!2733)

(declare-fun lt!102885 () tuple2!3818)

(declare-fun +!436 (ListLongMap!2733 tuple2!3818) ListLongMap!2733)

(assert (=> b!203690 (= lt!102879 (+!436 lt!102880 lt!102885))))

(declare-fun lt!102883 () ListLongMap!2733)

(declare-fun lt!102889 () ListLongMap!2733)

(assert (=> b!203690 (= lt!102883 lt!102889)))

(declare-fun lt!102881 () ListLongMap!2733)

(assert (=> b!203690 (= lt!102889 (+!436 lt!102881 lt!102885))))

(declare-fun lt!102890 () ListLongMap!2733)

(assert (=> b!203690 (= lt!102882 (+!436 lt!102890 lt!102885))))

(declare-fun zeroValue!615 () V!6345)

(assert (=> b!203690 (= lt!102885 (tuple2!3819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97932 () Bool)

(declare-fun e!133329 () Bool)

(assert (=> start!20512 (=> (not res!97932) (not e!133329))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20512 (= res!97932 (validMask!0 mask!1149))))

(assert (=> start!20512 e!133329))

(declare-datatypes ((ValueCell!2168 0))(
  ( (ValueCellFull!2168 (v!4527 V!6345)) (EmptyCell!2168) )
))
(declare-datatypes ((array!9257 0))(
  ( (array!9258 (arr!4379 (Array (_ BitVec 32) ValueCell!2168)) (size!4704 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9257)

(declare-fun e!133328 () Bool)

(declare-fun array_inv!2861 (array!9257) Bool)

(assert (=> start!20512 (and (array_inv!2861 _values!649) e!133328)))

(assert (=> start!20512 true))

(declare-fun tp_is_empty!5023 () Bool)

(assert (=> start!20512 tp_is_empty!5023))

(declare-datatypes ((array!9259 0))(
  ( (array!9260 (arr!4380 (Array (_ BitVec 32) (_ BitVec 64))) (size!4705 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9259)

(declare-fun array_inv!2862 (array!9259) Bool)

(assert (=> start!20512 (array_inv!2862 _keys!825)))

(assert (=> start!20512 tp!18532))

(declare-fun b!203691 () Bool)

(declare-fun res!97930 () Bool)

(assert (=> b!203691 (=> (not res!97930) (not e!133329))))

(declare-datatypes ((List!2718 0))(
  ( (Nil!2715) (Cons!2714 (h!3356 (_ BitVec 64)) (t!7641 List!2718)) )
))
(declare-fun arrayNoDuplicates!0 (array!9259 (_ BitVec 32) List!2718) Bool)

(assert (=> b!203691 (= res!97930 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2715))))

(declare-fun b!203692 () Bool)

(declare-fun res!97933 () Bool)

(assert (=> b!203692 (=> (not res!97933) (not e!133329))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203692 (= res!97933 (and (= (size!4704 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4705 _keys!825) (size!4704 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203693 () Bool)

(declare-fun res!97935 () Bool)

(assert (=> b!203693 (=> (not res!97935) (not e!133329))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203693 (= res!97935 (= (select (arr!4380 _keys!825) i!601) k0!843))))

(declare-fun b!203694 () Bool)

(declare-fun res!97929 () Bool)

(assert (=> b!203694 (=> (not res!97929) (not e!133329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203694 (= res!97929 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8603 () Bool)

(declare-fun mapRes!8603 () Bool)

(declare-fun tp!18533 () Bool)

(declare-fun e!133331 () Bool)

(assert (=> mapNonEmpty!8603 (= mapRes!8603 (and tp!18533 e!133331))))

(declare-fun mapRest!8603 () (Array (_ BitVec 32) ValueCell!2168))

(declare-fun mapKey!8603 () (_ BitVec 32))

(declare-fun mapValue!8603 () ValueCell!2168)

(assert (=> mapNonEmpty!8603 (= (arr!4379 _values!649) (store mapRest!8603 mapKey!8603 mapValue!8603))))

(declare-fun b!203695 () Bool)

(declare-fun e!133330 () Bool)

(assert (=> b!203695 (= e!133330 tp_is_empty!5023)))

(declare-fun b!203696 () Bool)

(declare-fun res!97936 () Bool)

(assert (=> b!203696 (=> (not res!97936) (not e!133329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9259 (_ BitVec 32)) Bool)

(assert (=> b!203696 (= res!97936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203697 () Bool)

(assert (=> b!203697 (= e!133329 (not e!133327))))

(declare-fun res!97928 () Bool)

(assert (=> b!203697 (=> res!97928 e!133327)))

(assert (=> b!203697 (= res!97928 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6345)

(declare-fun getCurrentListMap!960 (array!9259 array!9257 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) Int) ListLongMap!2733)

(assert (=> b!203697 (= lt!102883 (getCurrentListMap!960 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102887 () array!9257)

(assert (=> b!203697 (= lt!102882 (getCurrentListMap!960 _keys!825 lt!102887 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203697 (and (= lt!102890 lt!102880) (= lt!102880 lt!102890))))

(declare-fun lt!102888 () tuple2!3818)

(assert (=> b!203697 (= lt!102880 (+!436 lt!102881 lt!102888))))

(declare-fun v!520 () V!6345)

(assert (=> b!203697 (= lt!102888 (tuple2!3819 k0!843 v!520))))

(declare-datatypes ((Unit!6152 0))(
  ( (Unit!6153) )
))
(declare-fun lt!102886 () Unit!6152)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!96 (array!9259 array!9257 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) (_ BitVec 64) V!6345 (_ BitVec 32) Int) Unit!6152)

(assert (=> b!203697 (= lt!102886 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!96 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!353 (array!9259 array!9257 (_ BitVec 32) (_ BitVec 32) V!6345 V!6345 (_ BitVec 32) Int) ListLongMap!2733)

(assert (=> b!203697 (= lt!102890 (getCurrentListMapNoExtraKeys!353 _keys!825 lt!102887 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203697 (= lt!102887 (array!9258 (store (arr!4379 _values!649) i!601 (ValueCellFull!2168 v!520)) (size!4704 _values!649)))))

(assert (=> b!203697 (= lt!102881 (getCurrentListMapNoExtraKeys!353 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8603 () Bool)

(assert (=> mapIsEmpty!8603 mapRes!8603))

(declare-fun b!203698 () Bool)

(assert (=> b!203698 (= e!133326 true)))

(assert (=> b!203698 (= lt!102879 (+!436 lt!102889 lt!102888))))

(declare-fun lt!102884 () Unit!6152)

(declare-fun addCommutativeForDiffKeys!150 (ListLongMap!2733 (_ BitVec 64) V!6345 (_ BitVec 64) V!6345) Unit!6152)

(assert (=> b!203698 (= lt!102884 (addCommutativeForDiffKeys!150 lt!102881 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203699 () Bool)

(declare-fun res!97931 () Bool)

(assert (=> b!203699 (=> (not res!97931) (not e!133329))))

(assert (=> b!203699 (= res!97931 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4705 _keys!825))))))

(declare-fun b!203700 () Bool)

(assert (=> b!203700 (= e!133328 (and e!133330 mapRes!8603))))

(declare-fun condMapEmpty!8603 () Bool)

(declare-fun mapDefault!8603 () ValueCell!2168)

(assert (=> b!203700 (= condMapEmpty!8603 (= (arr!4379 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2168)) mapDefault!8603)))))

(declare-fun b!203701 () Bool)

(assert (=> b!203701 (= e!133331 tp_is_empty!5023)))

(assert (= (and start!20512 res!97932) b!203692))

(assert (= (and b!203692 res!97933) b!203696))

(assert (= (and b!203696 res!97936) b!203691))

(assert (= (and b!203691 res!97930) b!203699))

(assert (= (and b!203699 res!97931) b!203694))

(assert (= (and b!203694 res!97929) b!203693))

(assert (= (and b!203693 res!97935) b!203697))

(assert (= (and b!203697 (not res!97928)) b!203690))

(assert (= (and b!203690 (not res!97934)) b!203698))

(assert (= (and b!203700 condMapEmpty!8603) mapIsEmpty!8603))

(assert (= (and b!203700 (not condMapEmpty!8603)) mapNonEmpty!8603))

(get-info :version)

(assert (= (and mapNonEmpty!8603 ((_ is ValueCellFull!2168) mapValue!8603)) b!203701))

(assert (= (and b!203700 ((_ is ValueCellFull!2168) mapDefault!8603)) b!203695))

(assert (= start!20512 b!203700))

(declare-fun m!231273 () Bool)

(assert (=> b!203693 m!231273))

(declare-fun m!231275 () Bool)

(assert (=> mapNonEmpty!8603 m!231275))

(declare-fun m!231277 () Bool)

(assert (=> b!203698 m!231277))

(declare-fun m!231279 () Bool)

(assert (=> b!203698 m!231279))

(declare-fun m!231281 () Bool)

(assert (=> b!203690 m!231281))

(declare-fun m!231283 () Bool)

(assert (=> b!203690 m!231283))

(declare-fun m!231285 () Bool)

(assert (=> b!203690 m!231285))

(declare-fun m!231287 () Bool)

(assert (=> b!203697 m!231287))

(declare-fun m!231289 () Bool)

(assert (=> b!203697 m!231289))

(declare-fun m!231291 () Bool)

(assert (=> b!203697 m!231291))

(declare-fun m!231293 () Bool)

(assert (=> b!203697 m!231293))

(declare-fun m!231295 () Bool)

(assert (=> b!203697 m!231295))

(declare-fun m!231297 () Bool)

(assert (=> b!203697 m!231297))

(declare-fun m!231299 () Bool)

(assert (=> b!203697 m!231299))

(declare-fun m!231301 () Bool)

(assert (=> b!203696 m!231301))

(declare-fun m!231303 () Bool)

(assert (=> start!20512 m!231303))

(declare-fun m!231305 () Bool)

(assert (=> start!20512 m!231305))

(declare-fun m!231307 () Bool)

(assert (=> start!20512 m!231307))

(declare-fun m!231309 () Bool)

(assert (=> b!203694 m!231309))

(declare-fun m!231311 () Bool)

(assert (=> b!203691 m!231311))

(check-sat (not b!203694) (not start!20512) (not b!203696) (not b_next!5167) (not b!203690) b_and!11927 (not b!203697) tp_is_empty!5023 (not b!203698) (not b!203691) (not mapNonEmpty!8603))
(check-sat b_and!11927 (not b_next!5167))
