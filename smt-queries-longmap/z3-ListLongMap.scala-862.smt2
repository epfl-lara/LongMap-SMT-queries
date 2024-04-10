; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20270 () Bool)

(assert start!20270)

(declare-fun b_free!4929 () Bool)

(declare-fun b_next!4929 () Bool)

(assert (=> start!20270 (= b_free!4929 (not b_next!4929))))

(declare-fun tp!17819 () Bool)

(declare-fun b_and!11675 () Bool)

(assert (=> start!20270 (= tp!17819 b_and!11675)))

(declare-fun b!199484 () Bool)

(declare-fun res!94819 () Bool)

(declare-fun e!130946 () Bool)

(assert (=> b!199484 (=> (not res!94819) (not e!130946))))

(declare-datatypes ((array!8811 0))(
  ( (array!8812 (arr!4156 (Array (_ BitVec 32) (_ BitVec 64))) (size!4481 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8811)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8811 (_ BitVec 32)) Bool)

(assert (=> b!199484 (= res!94819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199485 () Bool)

(assert (=> b!199485 (= e!130946 (not true))))

(declare-datatypes ((V!6027 0))(
  ( (V!6028 (val!2437 Int)) )
))
(declare-datatypes ((tuple2!3686 0))(
  ( (tuple2!3687 (_1!1854 (_ BitVec 64)) (_2!1854 V!6027)) )
))
(declare-datatypes ((List!2604 0))(
  ( (Nil!2601) (Cons!2600 (h!3242 tuple2!3686) (t!7535 List!2604)) )
))
(declare-datatypes ((ListLongMap!2599 0))(
  ( (ListLongMap!2600 (toList!1315 List!2604)) )
))
(declare-fun lt!98345 () ListLongMap!2599)

(declare-datatypes ((ValueCell!2049 0))(
  ( (ValueCellFull!2049 (v!4407 V!6027)) (EmptyCell!2049) )
))
(declare-datatypes ((array!8813 0))(
  ( (array!8814 (arr!4157 (Array (_ BitVec 32) ValueCell!2049)) (size!4482 (_ BitVec 32))) )
))
(declare-fun lt!98344 () array!8813)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6027)

(declare-fun zeroValue!615 () V!6027)

(declare-fun getCurrentListMap!906 (array!8811 array!8813 (_ BitVec 32) (_ BitVec 32) V!6027 V!6027 (_ BitVec 32) Int) ListLongMap!2599)

(assert (=> b!199485 (= lt!98345 (getCurrentListMap!906 _keys!825 lt!98344 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98349 () ListLongMap!2599)

(declare-fun lt!98346 () ListLongMap!2599)

(assert (=> b!199485 (and (= lt!98349 lt!98346) (= lt!98346 lt!98349))))

(declare-fun lt!98348 () ListLongMap!2599)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6027)

(declare-fun +!342 (ListLongMap!2599 tuple2!3686) ListLongMap!2599)

(assert (=> b!199485 (= lt!98346 (+!342 lt!98348 (tuple2!3687 k0!843 v!520)))))

(declare-fun _values!649 () array!8813)

(declare-datatypes ((Unit!5986 0))(
  ( (Unit!5987) )
))
(declare-fun lt!98347 () Unit!5986)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!19 (array!8811 array!8813 (_ BitVec 32) (_ BitVec 32) V!6027 V!6027 (_ BitVec 32) (_ BitVec 64) V!6027 (_ BitVec 32) Int) Unit!5986)

(assert (=> b!199485 (= lt!98347 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!19 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!280 (array!8811 array!8813 (_ BitVec 32) (_ BitVec 32) V!6027 V!6027 (_ BitVec 32) Int) ListLongMap!2599)

(assert (=> b!199485 (= lt!98349 (getCurrentListMapNoExtraKeys!280 _keys!825 lt!98344 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199485 (= lt!98344 (array!8814 (store (arr!4157 _values!649) i!601 (ValueCellFull!2049 v!520)) (size!4482 _values!649)))))

(assert (=> b!199485 (= lt!98348 (getCurrentListMapNoExtraKeys!280 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8246 () Bool)

(declare-fun mapRes!8246 () Bool)

(assert (=> mapIsEmpty!8246 mapRes!8246))

(declare-fun b!199486 () Bool)

(declare-fun res!94825 () Bool)

(assert (=> b!199486 (=> (not res!94825) (not e!130946))))

(assert (=> b!199486 (= res!94825 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4481 _keys!825))))))

(declare-fun res!94822 () Bool)

(assert (=> start!20270 (=> (not res!94822) (not e!130946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20270 (= res!94822 (validMask!0 mask!1149))))

(assert (=> start!20270 e!130946))

(declare-fun e!130948 () Bool)

(declare-fun array_inv!2729 (array!8813) Bool)

(assert (=> start!20270 (and (array_inv!2729 _values!649) e!130948)))

(assert (=> start!20270 true))

(declare-fun tp_is_empty!4785 () Bool)

(assert (=> start!20270 tp_is_empty!4785))

(declare-fun array_inv!2730 (array!8811) Bool)

(assert (=> start!20270 (array_inv!2730 _keys!825)))

(assert (=> start!20270 tp!17819))

(declare-fun b!199487 () Bool)

(declare-fun e!130947 () Bool)

(assert (=> b!199487 (= e!130947 tp_is_empty!4785)))

(declare-fun b!199488 () Bool)

(declare-fun res!94823 () Bool)

(assert (=> b!199488 (=> (not res!94823) (not e!130946))))

(assert (=> b!199488 (= res!94823 (= (select (arr!4156 _keys!825) i!601) k0!843))))

(declare-fun b!199489 () Bool)

(declare-fun e!130945 () Bool)

(assert (=> b!199489 (= e!130945 tp_is_empty!4785)))

(declare-fun b!199490 () Bool)

(assert (=> b!199490 (= e!130948 (and e!130945 mapRes!8246))))

(declare-fun condMapEmpty!8246 () Bool)

(declare-fun mapDefault!8246 () ValueCell!2049)

(assert (=> b!199490 (= condMapEmpty!8246 (= (arr!4157 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2049)) mapDefault!8246)))))

(declare-fun b!199491 () Bool)

(declare-fun res!94820 () Bool)

(assert (=> b!199491 (=> (not res!94820) (not e!130946))))

(assert (=> b!199491 (= res!94820 (and (= (size!4482 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4481 _keys!825) (size!4482 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8246 () Bool)

(declare-fun tp!17818 () Bool)

(assert (=> mapNonEmpty!8246 (= mapRes!8246 (and tp!17818 e!130947))))

(declare-fun mapKey!8246 () (_ BitVec 32))

(declare-fun mapRest!8246 () (Array (_ BitVec 32) ValueCell!2049))

(declare-fun mapValue!8246 () ValueCell!2049)

(assert (=> mapNonEmpty!8246 (= (arr!4157 _values!649) (store mapRest!8246 mapKey!8246 mapValue!8246))))

(declare-fun b!199492 () Bool)

(declare-fun res!94821 () Bool)

(assert (=> b!199492 (=> (not res!94821) (not e!130946))))

(declare-datatypes ((List!2605 0))(
  ( (Nil!2602) (Cons!2601 (h!3243 (_ BitVec 64)) (t!7536 List!2605)) )
))
(declare-fun arrayNoDuplicates!0 (array!8811 (_ BitVec 32) List!2605) Bool)

(assert (=> b!199492 (= res!94821 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2602))))

(declare-fun b!199493 () Bool)

(declare-fun res!94824 () Bool)

(assert (=> b!199493 (=> (not res!94824) (not e!130946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199493 (= res!94824 (validKeyInArray!0 k0!843))))

(assert (= (and start!20270 res!94822) b!199491))

(assert (= (and b!199491 res!94820) b!199484))

(assert (= (and b!199484 res!94819) b!199492))

(assert (= (and b!199492 res!94821) b!199486))

(assert (= (and b!199486 res!94825) b!199493))

(assert (= (and b!199493 res!94824) b!199488))

(assert (= (and b!199488 res!94823) b!199485))

(assert (= (and b!199490 condMapEmpty!8246) mapIsEmpty!8246))

(assert (= (and b!199490 (not condMapEmpty!8246)) mapNonEmpty!8246))

(get-info :version)

(assert (= (and mapNonEmpty!8246 ((_ is ValueCellFull!2049) mapValue!8246)) b!199487))

(assert (= (and b!199490 ((_ is ValueCellFull!2049) mapDefault!8246)) b!199489))

(assert (= start!20270 b!199490))

(declare-fun m!225947 () Bool)

(assert (=> b!199484 m!225947))

(declare-fun m!225949 () Bool)

(assert (=> b!199488 m!225949))

(declare-fun m!225951 () Bool)

(assert (=> b!199492 m!225951))

(declare-fun m!225953 () Bool)

(assert (=> b!199493 m!225953))

(declare-fun m!225955 () Bool)

(assert (=> b!199485 m!225955))

(declare-fun m!225957 () Bool)

(assert (=> b!199485 m!225957))

(declare-fun m!225959 () Bool)

(assert (=> b!199485 m!225959))

(declare-fun m!225961 () Bool)

(assert (=> b!199485 m!225961))

(declare-fun m!225963 () Bool)

(assert (=> b!199485 m!225963))

(declare-fun m!225965 () Bool)

(assert (=> b!199485 m!225965))

(declare-fun m!225967 () Bool)

(assert (=> start!20270 m!225967))

(declare-fun m!225969 () Bool)

(assert (=> start!20270 m!225969))

(declare-fun m!225971 () Bool)

(assert (=> start!20270 m!225971))

(declare-fun m!225973 () Bool)

(assert (=> mapNonEmpty!8246 m!225973))

(check-sat (not b!199485) (not start!20270) tp_is_empty!4785 b_and!11675 (not b_next!4929) (not b!199492) (not mapNonEmpty!8246) (not b!199484) (not b!199493))
(check-sat b_and!11675 (not b_next!4929))
