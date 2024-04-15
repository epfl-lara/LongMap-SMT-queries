; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20482 () Bool)

(assert start!20482)

(declare-fun b_free!5137 () Bool)

(declare-fun b_next!5137 () Bool)

(assert (=> start!20482 (= b_free!5137 (not b_next!5137))))

(declare-fun tp!18442 () Bool)

(declare-fun b_and!11857 () Bool)

(assert (=> start!20482 (= tp!18442 b_and!11857)))

(declare-fun b!202956 () Bool)

(declare-fun res!97412 () Bool)

(declare-fun e!132890 () Bool)

(assert (=> b!202956 (=> (not res!97412) (not e!132890))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202956 (= res!97412 (validKeyInArray!0 k0!843))))

(declare-fun b!202957 () Bool)

(declare-fun res!97413 () Bool)

(assert (=> b!202957 (=> (not res!97413) (not e!132890))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9197 0))(
  ( (array!9198 (arr!4348 (Array (_ BitVec 32) (_ BitVec 64))) (size!4674 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9197)

(assert (=> b!202957 (= res!97413 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4674 _keys!825))))))

(declare-fun res!97411 () Bool)

(assert (=> start!20482 (=> (not res!97411) (not e!132890))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20482 (= res!97411 (validMask!0 mask!1149))))

(assert (=> start!20482 e!132890))

(declare-datatypes ((V!6305 0))(
  ( (V!6306 (val!2541 Int)) )
))
(declare-datatypes ((ValueCell!2153 0))(
  ( (ValueCellFull!2153 (v!4505 V!6305)) (EmptyCell!2153) )
))
(declare-datatypes ((array!9199 0))(
  ( (array!9200 (arr!4349 (Array (_ BitVec 32) ValueCell!2153)) (size!4675 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9199)

(declare-fun e!132888 () Bool)

(declare-fun array_inv!2851 (array!9199) Bool)

(assert (=> start!20482 (and (array_inv!2851 _values!649) e!132888)))

(assert (=> start!20482 true))

(declare-fun tp_is_empty!4993 () Bool)

(assert (=> start!20482 tp_is_empty!4993))

(declare-fun array_inv!2852 (array!9197) Bool)

(assert (=> start!20482 (array_inv!2852 _keys!825)))

(assert (=> start!20482 tp!18442))

(declare-fun b!202958 () Bool)

(declare-fun e!132885 () Bool)

(assert (=> b!202958 (= e!132890 (not e!132885))))

(declare-fun res!97410 () Bool)

(assert (=> b!202958 (=> res!97410 e!132885)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202958 (= res!97410 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6305)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3830 0))(
  ( (tuple2!3831 (_1!1926 (_ BitVec 64)) (_2!1926 V!6305)) )
))
(declare-datatypes ((List!2743 0))(
  ( (Nil!2740) (Cons!2739 (h!3381 tuple2!3830) (t!7665 List!2743)) )
))
(declare-datatypes ((ListLongMap!2733 0))(
  ( (ListLongMap!2734 (toList!1382 List!2743)) )
))
(declare-fun lt!102110 () ListLongMap!2733)

(declare-fun minValue!615 () V!6305)

(declare-fun getCurrentListMap!936 (array!9197 array!9199 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) Int) ListLongMap!2733)

(assert (=> b!202958 (= lt!102110 (getCurrentListMap!936 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102103 () array!9199)

(declare-fun lt!102106 () ListLongMap!2733)

(assert (=> b!202958 (= lt!102106 (getCurrentListMap!936 _keys!825 lt!102103 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102105 () ListLongMap!2733)

(declare-fun lt!102104 () ListLongMap!2733)

(assert (=> b!202958 (and (= lt!102105 lt!102104) (= lt!102104 lt!102105))))

(declare-fun lt!102102 () ListLongMap!2733)

(declare-fun lt!102108 () tuple2!3830)

(declare-fun +!431 (ListLongMap!2733 tuple2!3830) ListLongMap!2733)

(assert (=> b!202958 (= lt!102104 (+!431 lt!102102 lt!102108))))

(declare-fun v!520 () V!6305)

(assert (=> b!202958 (= lt!102108 (tuple2!3831 k0!843 v!520))))

(declare-datatypes ((Unit!6112 0))(
  ( (Unit!6113) )
))
(declare-fun lt!102099 () Unit!6112)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!95 (array!9197 array!9199 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) (_ BitVec 64) V!6305 (_ BitVec 32) Int) Unit!6112)

(assert (=> b!202958 (= lt!102099 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!95 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!346 (array!9197 array!9199 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) Int) ListLongMap!2733)

(assert (=> b!202958 (= lt!102105 (getCurrentListMapNoExtraKeys!346 _keys!825 lt!102103 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202958 (= lt!102103 (array!9200 (store (arr!4349 _values!649) i!601 (ValueCellFull!2153 v!520)) (size!4675 _values!649)))))

(assert (=> b!202958 (= lt!102102 (getCurrentListMapNoExtraKeys!346 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8558 () Bool)

(declare-fun mapRes!8558 () Bool)

(assert (=> mapIsEmpty!8558 mapRes!8558))

(declare-fun b!202959 () Bool)

(declare-fun res!97414 () Bool)

(assert (=> b!202959 (=> (not res!97414) (not e!132890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9197 (_ BitVec 32)) Bool)

(assert (=> b!202959 (= res!97414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202960 () Bool)

(declare-fun res!97407 () Bool)

(assert (=> b!202960 (=> (not res!97407) (not e!132890))))

(declare-datatypes ((List!2744 0))(
  ( (Nil!2741) (Cons!2740 (h!3382 (_ BitVec 64)) (t!7666 List!2744)) )
))
(declare-fun arrayNoDuplicates!0 (array!9197 (_ BitVec 32) List!2744) Bool)

(assert (=> b!202960 (= res!97407 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2741))))

(declare-fun b!202961 () Bool)

(declare-fun res!97409 () Bool)

(assert (=> b!202961 (=> (not res!97409) (not e!132890))))

(assert (=> b!202961 (= res!97409 (= (select (arr!4348 _keys!825) i!601) k0!843))))

(declare-fun b!202962 () Bool)

(declare-fun e!132889 () Bool)

(assert (=> b!202962 (= e!132889 tp_is_empty!4993)))

(declare-fun b!202963 () Bool)

(declare-fun e!132887 () Bool)

(assert (=> b!202963 (= e!132885 e!132887)))

(declare-fun res!97415 () Bool)

(assert (=> b!202963 (=> res!97415 e!132887)))

(assert (=> b!202963 (= res!97415 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102100 () ListLongMap!2733)

(assert (=> b!202963 (= lt!102106 lt!102100)))

(declare-fun lt!102101 () tuple2!3830)

(assert (=> b!202963 (= lt!102100 (+!431 lt!102104 lt!102101))))

(declare-fun lt!102107 () ListLongMap!2733)

(assert (=> b!202963 (= lt!102110 lt!102107)))

(assert (=> b!202963 (= lt!102107 (+!431 lt!102102 lt!102101))))

(assert (=> b!202963 (= lt!102106 (+!431 lt!102105 lt!102101))))

(assert (=> b!202963 (= lt!102101 (tuple2!3831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202964 () Bool)

(declare-fun e!132886 () Bool)

(assert (=> b!202964 (= e!132886 tp_is_empty!4993)))

(declare-fun b!202965 () Bool)

(declare-fun res!97408 () Bool)

(assert (=> b!202965 (=> (not res!97408) (not e!132890))))

(assert (=> b!202965 (= res!97408 (and (= (size!4675 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4674 _keys!825) (size!4675 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8558 () Bool)

(declare-fun tp!18443 () Bool)

(assert (=> mapNonEmpty!8558 (= mapRes!8558 (and tp!18443 e!132889))))

(declare-fun mapKey!8558 () (_ BitVec 32))

(declare-fun mapValue!8558 () ValueCell!2153)

(declare-fun mapRest!8558 () (Array (_ BitVec 32) ValueCell!2153))

(assert (=> mapNonEmpty!8558 (= (arr!4349 _values!649) (store mapRest!8558 mapKey!8558 mapValue!8558))))

(declare-fun b!202966 () Bool)

(assert (=> b!202966 (= e!132887 true)))

(assert (=> b!202966 (= lt!102100 (+!431 lt!102107 lt!102108))))

(declare-fun lt!102109 () Unit!6112)

(declare-fun addCommutativeForDiffKeys!131 (ListLongMap!2733 (_ BitVec 64) V!6305 (_ BitVec 64) V!6305) Unit!6112)

(assert (=> b!202966 (= lt!102109 (addCommutativeForDiffKeys!131 lt!102102 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202967 () Bool)

(assert (=> b!202967 (= e!132888 (and e!132886 mapRes!8558))))

(declare-fun condMapEmpty!8558 () Bool)

(declare-fun mapDefault!8558 () ValueCell!2153)

(assert (=> b!202967 (= condMapEmpty!8558 (= (arr!4349 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2153)) mapDefault!8558)))))

(assert (= (and start!20482 res!97411) b!202965))

(assert (= (and b!202965 res!97408) b!202959))

(assert (= (and b!202959 res!97414) b!202960))

(assert (= (and b!202960 res!97407) b!202957))

(assert (= (and b!202957 res!97413) b!202956))

(assert (= (and b!202956 res!97412) b!202961))

(assert (= (and b!202961 res!97409) b!202958))

(assert (= (and b!202958 (not res!97410)) b!202963))

(assert (= (and b!202963 (not res!97415)) b!202966))

(assert (= (and b!202967 condMapEmpty!8558) mapIsEmpty!8558))

(assert (= (and b!202967 (not condMapEmpty!8558)) mapNonEmpty!8558))

(get-info :version)

(assert (= (and mapNonEmpty!8558 ((_ is ValueCellFull!2153) mapValue!8558)) b!202962))

(assert (= (and b!202967 ((_ is ValueCellFull!2153) mapDefault!8558)) b!202964))

(assert (= start!20482 b!202967))

(declare-fun m!229875 () Bool)

(assert (=> start!20482 m!229875))

(declare-fun m!229877 () Bool)

(assert (=> start!20482 m!229877))

(declare-fun m!229879 () Bool)

(assert (=> start!20482 m!229879))

(declare-fun m!229881 () Bool)

(assert (=> b!202963 m!229881))

(declare-fun m!229883 () Bool)

(assert (=> b!202963 m!229883))

(declare-fun m!229885 () Bool)

(assert (=> b!202963 m!229885))

(declare-fun m!229887 () Bool)

(assert (=> b!202959 m!229887))

(declare-fun m!229889 () Bool)

(assert (=> b!202966 m!229889))

(declare-fun m!229891 () Bool)

(assert (=> b!202966 m!229891))

(declare-fun m!229893 () Bool)

(assert (=> b!202960 m!229893))

(declare-fun m!229895 () Bool)

(assert (=> b!202956 m!229895))

(declare-fun m!229897 () Bool)

(assert (=> mapNonEmpty!8558 m!229897))

(declare-fun m!229899 () Bool)

(assert (=> b!202961 m!229899))

(declare-fun m!229901 () Bool)

(assert (=> b!202958 m!229901))

(declare-fun m!229903 () Bool)

(assert (=> b!202958 m!229903))

(declare-fun m!229905 () Bool)

(assert (=> b!202958 m!229905))

(declare-fun m!229907 () Bool)

(assert (=> b!202958 m!229907))

(declare-fun m!229909 () Bool)

(assert (=> b!202958 m!229909))

(declare-fun m!229911 () Bool)

(assert (=> b!202958 m!229911))

(declare-fun m!229913 () Bool)

(assert (=> b!202958 m!229913))

(check-sat (not b!202960) (not b!202958) (not b_next!5137) b_and!11857 (not b!202963) tp_is_empty!4993 (not mapNonEmpty!8558) (not start!20482) (not b!202956) (not b!202966) (not b!202959))
(check-sat b_and!11857 (not b_next!5137))
