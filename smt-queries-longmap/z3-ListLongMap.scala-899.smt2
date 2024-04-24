; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20494 () Bool)

(assert start!20494)

(declare-fun b_free!5149 () Bool)

(declare-fun b_next!5149 () Bool)

(assert (=> start!20494 (= b_free!5149 (not b_next!5149))))

(declare-fun tp!18478 () Bool)

(declare-fun b_and!11909 () Bool)

(assert (=> start!20494 (= tp!18478 b_and!11909)))

(declare-fun b!203366 () Bool)

(declare-fun e!133139 () Bool)

(declare-fun e!133142 () Bool)

(assert (=> b!203366 (= e!133139 e!133142)))

(declare-fun res!97688 () Bool)

(assert (=> b!203366 (=> res!97688 e!133142)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203366 (= res!97688 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6321 0))(
  ( (V!6322 (val!2547 Int)) )
))
(declare-datatypes ((tuple2!3800 0))(
  ( (tuple2!3801 (_1!1911 (_ BitVec 64)) (_2!1911 V!6321)) )
))
(declare-datatypes ((List!2701 0))(
  ( (Nil!2698) (Cons!2697 (h!3339 tuple2!3800) (t!7624 List!2701)) )
))
(declare-datatypes ((ListLongMap!2715 0))(
  ( (ListLongMap!2716 (toList!1373 List!2701)) )
))
(declare-fun lt!102562 () ListLongMap!2715)

(declare-fun lt!102564 () ListLongMap!2715)

(assert (=> b!203366 (= lt!102562 lt!102564)))

(declare-fun lt!102565 () ListLongMap!2715)

(declare-fun lt!102557 () tuple2!3800)

(declare-fun +!427 (ListLongMap!2715 tuple2!3800) ListLongMap!2715)

(assert (=> b!203366 (= lt!102564 (+!427 lt!102565 lt!102557))))

(declare-fun lt!102563 () ListLongMap!2715)

(declare-fun lt!102558 () ListLongMap!2715)

(assert (=> b!203366 (= lt!102563 lt!102558)))

(declare-fun lt!102559 () ListLongMap!2715)

(assert (=> b!203366 (= lt!102558 (+!427 lt!102559 lt!102557))))

(declare-fun lt!102560 () ListLongMap!2715)

(assert (=> b!203366 (= lt!102562 (+!427 lt!102560 lt!102557))))

(declare-fun zeroValue!615 () V!6321)

(assert (=> b!203366 (= lt!102557 (tuple2!3801 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203367 () Bool)

(declare-fun e!133141 () Bool)

(declare-fun tp_is_empty!5005 () Bool)

(assert (=> b!203367 (= e!133141 tp_is_empty!5005)))

(declare-fun b!203368 () Bool)

(declare-fun res!97685 () Bool)

(declare-fun e!133137 () Bool)

(assert (=> b!203368 (=> (not res!97685) (not e!133137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203368 (= res!97685 (validKeyInArray!0 k0!843))))

(declare-fun b!203369 () Bool)

(declare-fun e!133140 () Bool)

(declare-fun mapRes!8576 () Bool)

(assert (=> b!203369 (= e!133140 (and e!133141 mapRes!8576))))

(declare-fun condMapEmpty!8576 () Bool)

(declare-datatypes ((ValueCell!2159 0))(
  ( (ValueCellFull!2159 (v!4518 V!6321)) (EmptyCell!2159) )
))
(declare-datatypes ((array!9221 0))(
  ( (array!9222 (arr!4361 (Array (_ BitVec 32) ValueCell!2159)) (size!4686 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9221)

(declare-fun mapDefault!8576 () ValueCell!2159)

(assert (=> b!203369 (= condMapEmpty!8576 (= (arr!4361 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2159)) mapDefault!8576)))))

(declare-fun b!203370 () Bool)

(declare-fun res!97686 () Bool)

(assert (=> b!203370 (=> (not res!97686) (not e!133137))))

(declare-datatypes ((array!9223 0))(
  ( (array!9224 (arr!4362 (Array (_ BitVec 32) (_ BitVec 64))) (size!4687 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9223)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203370 (= res!97686 (and (= (size!4686 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4687 _keys!825) (size!4686 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203371 () Bool)

(declare-fun res!97693 () Bool)

(assert (=> b!203371 (=> (not res!97693) (not e!133137))))

(declare-datatypes ((List!2702 0))(
  ( (Nil!2699) (Cons!2698 (h!3340 (_ BitVec 64)) (t!7625 List!2702)) )
))
(declare-fun arrayNoDuplicates!0 (array!9223 (_ BitVec 32) List!2702) Bool)

(assert (=> b!203371 (= res!97693 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2699))))

(declare-fun b!203372 () Bool)

(assert (=> b!203372 (= e!133137 (not e!133139))))

(declare-fun res!97691 () Bool)

(assert (=> b!203372 (=> res!97691 e!133139)))

(assert (=> b!203372 (= res!97691 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6321)

(declare-fun getCurrentListMap!955 (array!9223 array!9221 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) Int) ListLongMap!2715)

(assert (=> b!203372 (= lt!102563 (getCurrentListMap!955 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102555 () array!9221)

(assert (=> b!203372 (= lt!102562 (getCurrentListMap!955 _keys!825 lt!102555 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203372 (and (= lt!102560 lt!102565) (= lt!102565 lt!102560))))

(declare-fun lt!102566 () tuple2!3800)

(assert (=> b!203372 (= lt!102565 (+!427 lt!102559 lt!102566))))

(declare-fun v!520 () V!6321)

(assert (=> b!203372 (= lt!102566 (tuple2!3801 k0!843 v!520))))

(declare-datatypes ((Unit!6138 0))(
  ( (Unit!6139) )
))
(declare-fun lt!102561 () Unit!6138)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!91 (array!9223 array!9221 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) (_ BitVec 64) V!6321 (_ BitVec 32) Int) Unit!6138)

(assert (=> b!203372 (= lt!102561 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!91 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!348 (array!9223 array!9221 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) Int) ListLongMap!2715)

(assert (=> b!203372 (= lt!102560 (getCurrentListMapNoExtraKeys!348 _keys!825 lt!102555 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203372 (= lt!102555 (array!9222 (store (arr!4361 _values!649) i!601 (ValueCellFull!2159 v!520)) (size!4686 _values!649)))))

(assert (=> b!203372 (= lt!102559 (getCurrentListMapNoExtraKeys!348 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203373 () Bool)

(declare-fun res!97689 () Bool)

(assert (=> b!203373 (=> (not res!97689) (not e!133137))))

(assert (=> b!203373 (= res!97689 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4687 _keys!825))))))

(declare-fun b!203374 () Bool)

(declare-fun e!133138 () Bool)

(assert (=> b!203374 (= e!133138 tp_is_empty!5005)))

(declare-fun res!97690 () Bool)

(assert (=> start!20494 (=> (not res!97690) (not e!133137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20494 (= res!97690 (validMask!0 mask!1149))))

(assert (=> start!20494 e!133137))

(declare-fun array_inv!2849 (array!9221) Bool)

(assert (=> start!20494 (and (array_inv!2849 _values!649) e!133140)))

(assert (=> start!20494 true))

(assert (=> start!20494 tp_is_empty!5005))

(declare-fun array_inv!2850 (array!9223) Bool)

(assert (=> start!20494 (array_inv!2850 _keys!825)))

(assert (=> start!20494 tp!18478))

(declare-fun b!203375 () Bool)

(assert (=> b!203375 (= e!133142 (bvsle #b00000000000000000000000000000000 (size!4687 _keys!825)))))

(assert (=> b!203375 (= lt!102564 (+!427 lt!102558 lt!102566))))

(declare-fun lt!102556 () Unit!6138)

(declare-fun addCommutativeForDiffKeys!144 (ListLongMap!2715 (_ BitVec 64) V!6321 (_ BitVec 64) V!6321) Unit!6138)

(assert (=> b!203375 (= lt!102556 (addCommutativeForDiffKeys!144 lt!102559 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203376 () Bool)

(declare-fun res!97692 () Bool)

(assert (=> b!203376 (=> (not res!97692) (not e!133137))))

(assert (=> b!203376 (= res!97692 (= (select (arr!4362 _keys!825) i!601) k0!843))))

(declare-fun b!203377 () Bool)

(declare-fun res!97687 () Bool)

(assert (=> b!203377 (=> (not res!97687) (not e!133137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9223 (_ BitVec 32)) Bool)

(assert (=> b!203377 (= res!97687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8576 () Bool)

(assert (=> mapIsEmpty!8576 mapRes!8576))

(declare-fun mapNonEmpty!8576 () Bool)

(declare-fun tp!18479 () Bool)

(assert (=> mapNonEmpty!8576 (= mapRes!8576 (and tp!18479 e!133138))))

(declare-fun mapValue!8576 () ValueCell!2159)

(declare-fun mapKey!8576 () (_ BitVec 32))

(declare-fun mapRest!8576 () (Array (_ BitVec 32) ValueCell!2159))

(assert (=> mapNonEmpty!8576 (= (arr!4361 _values!649) (store mapRest!8576 mapKey!8576 mapValue!8576))))

(assert (= (and start!20494 res!97690) b!203370))

(assert (= (and b!203370 res!97686) b!203377))

(assert (= (and b!203377 res!97687) b!203371))

(assert (= (and b!203371 res!97693) b!203373))

(assert (= (and b!203373 res!97689) b!203368))

(assert (= (and b!203368 res!97685) b!203376))

(assert (= (and b!203376 res!97692) b!203372))

(assert (= (and b!203372 (not res!97691)) b!203366))

(assert (= (and b!203366 (not res!97688)) b!203375))

(assert (= (and b!203369 condMapEmpty!8576) mapIsEmpty!8576))

(assert (= (and b!203369 (not condMapEmpty!8576)) mapNonEmpty!8576))

(get-info :version)

(assert (= (and mapNonEmpty!8576 ((_ is ValueCellFull!2159) mapValue!8576)) b!203374))

(assert (= (and b!203369 ((_ is ValueCellFull!2159) mapDefault!8576)) b!203367))

(assert (= start!20494 b!203369))

(declare-fun m!230913 () Bool)

(assert (=> b!203377 m!230913))

(declare-fun m!230915 () Bool)

(assert (=> start!20494 m!230915))

(declare-fun m!230917 () Bool)

(assert (=> start!20494 m!230917))

(declare-fun m!230919 () Bool)

(assert (=> start!20494 m!230919))

(declare-fun m!230921 () Bool)

(assert (=> b!203376 m!230921))

(declare-fun m!230923 () Bool)

(assert (=> b!203375 m!230923))

(declare-fun m!230925 () Bool)

(assert (=> b!203375 m!230925))

(declare-fun m!230927 () Bool)

(assert (=> b!203371 m!230927))

(declare-fun m!230929 () Bool)

(assert (=> mapNonEmpty!8576 m!230929))

(declare-fun m!230931 () Bool)

(assert (=> b!203372 m!230931))

(declare-fun m!230933 () Bool)

(assert (=> b!203372 m!230933))

(declare-fun m!230935 () Bool)

(assert (=> b!203372 m!230935))

(declare-fun m!230937 () Bool)

(assert (=> b!203372 m!230937))

(declare-fun m!230939 () Bool)

(assert (=> b!203372 m!230939))

(declare-fun m!230941 () Bool)

(assert (=> b!203372 m!230941))

(declare-fun m!230943 () Bool)

(assert (=> b!203372 m!230943))

(declare-fun m!230945 () Bool)

(assert (=> b!203366 m!230945))

(declare-fun m!230947 () Bool)

(assert (=> b!203366 m!230947))

(declare-fun m!230949 () Bool)

(assert (=> b!203366 m!230949))

(declare-fun m!230951 () Bool)

(assert (=> b!203368 m!230951))

(check-sat (not b_next!5149) tp_is_empty!5005 b_and!11909 (not b!203377) (not b!203371) (not b!203368) (not b!203366) (not mapNonEmpty!8576) (not b!203372) (not b!203375) (not start!20494))
(check-sat b_and!11909 (not b_next!5149))
