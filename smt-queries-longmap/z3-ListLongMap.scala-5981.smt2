; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77694 () Bool)

(assert start!77694)

(declare-fun b_free!16297 () Bool)

(declare-fun b_next!16297 () Bool)

(assert (=> start!77694 (= b_free!16297 (not b_next!16297))))

(declare-fun tp!57153 () Bool)

(declare-fun b_and!26721 () Bool)

(assert (=> start!77694 (= tp!57153 b_and!26721)))

(declare-fun b!906360 () Bool)

(declare-fun e!507911 () Bool)

(declare-fun tp_is_empty!18715 () Bool)

(assert (=> b!906360 (= e!507911 tp_is_empty!18715)))

(declare-fun b!906361 () Bool)

(declare-fun e!507916 () Bool)

(assert (=> b!906361 (= e!507916 true)))

(declare-datatypes ((V!29919 0))(
  ( (V!29920 (val!9408 Int)) )
))
(declare-datatypes ((tuple2!12266 0))(
  ( (tuple2!12267 (_1!6144 (_ BitVec 64)) (_2!6144 V!29919)) )
))
(declare-datatypes ((List!18054 0))(
  ( (Nil!18051) (Cons!18050 (h!19196 tuple2!12266) (t!25514 List!18054)) )
))
(declare-datatypes ((ListLongMap!10953 0))(
  ( (ListLongMap!10954 (toList!5492 List!18054)) )
))
(declare-fun lt!408745 () ListLongMap!10953)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408744 () V!29919)

(declare-fun apply!468 (ListLongMap!10953 (_ BitVec 64)) V!29919)

(assert (=> b!906361 (= (apply!468 lt!408745 k0!1033) lt!408744)))

(declare-datatypes ((ValueCell!8876 0))(
  ( (ValueCellFull!8876 (v!11912 V!29919)) (EmptyCell!8876) )
))
(declare-datatypes ((array!53445 0))(
  ( (array!53446 (arr!25682 (Array (_ BitVec 32) ValueCell!8876)) (size!26143 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53445)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29919)

(declare-datatypes ((Unit!30684 0))(
  ( (Unit!30685) )
))
(declare-fun lt!408743 () Unit!30684)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29919)

(declare-datatypes ((array!53447 0))(
  ( (array!53448 (arr!25683 (Array (_ BitVec 32) (_ BitVec 64))) (size!26144 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53447)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!29 (array!53447 array!53445 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 64) V!29919 (_ BitVec 32) Int) Unit!30684)

(assert (=> b!906361 (= lt!408743 (lemmaListMapApplyFromThenApplyFromZero!29 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408744 i!717 defaultEntry!1160))))

(declare-fun b!906362 () Bool)

(declare-fun res!611730 () Bool)

(declare-fun e!507915 () Bool)

(assert (=> b!906362 (=> (not res!611730) (not e!507915))))

(assert (=> b!906362 (= res!611730 (and (= (select (arr!25683 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906363 () Bool)

(declare-fun e!507912 () Bool)

(assert (=> b!906363 (= e!507915 (not e!507912))))

(declare-fun res!611732 () Bool)

(assert (=> b!906363 (=> res!611732 e!507912)))

(assert (=> b!906363 (= res!611732 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26144 _keys!1386))))))

(declare-fun get!13506 (ValueCell!8876 V!29919) V!29919)

(declare-fun dynLambda!1341 (Int (_ BitVec 64)) V!29919)

(assert (=> b!906363 (= lt!408744 (get!13506 (select (arr!25682 _values!1152) i!717) (dynLambda!1341 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906363 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408742 () Unit!30684)

(declare-fun lemmaKeyInListMapIsInArray!217 (array!53447 array!53445 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 64) Int) Unit!30684)

(assert (=> b!906363 (= lt!408742 (lemmaKeyInListMapIsInArray!217 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906364 () Bool)

(declare-fun res!611734 () Bool)

(declare-fun e!507917 () Bool)

(assert (=> b!906364 (=> (not res!611734) (not e!507917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53447 (_ BitVec 32)) Bool)

(assert (=> b!906364 (= res!611734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906365 () Bool)

(assert (=> b!906365 (= e!507912 e!507916)))

(declare-fun res!611738 () Bool)

(assert (=> b!906365 (=> res!611738 e!507916)))

(declare-fun lt!408741 () ListLongMap!10953)

(declare-fun contains!4498 (ListLongMap!10953 (_ BitVec 64)) Bool)

(assert (=> b!906365 (= res!611738 (not (contains!4498 lt!408741 k0!1033)))))

(declare-fun getCurrentListMap!2702 (array!53447 array!53445 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 32) Int) ListLongMap!10953)

(assert (=> b!906365 (= lt!408741 (getCurrentListMap!2702 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29785 () Bool)

(declare-fun mapRes!29785 () Bool)

(assert (=> mapIsEmpty!29785 mapRes!29785))

(declare-fun b!906366 () Bool)

(declare-fun res!611735 () Bool)

(assert (=> b!906366 (=> (not res!611735) (not e!507917))))

(declare-datatypes ((List!18055 0))(
  ( (Nil!18052) (Cons!18051 (h!19197 (_ BitVec 64)) (t!25515 List!18055)) )
))
(declare-fun arrayNoDuplicates!0 (array!53447 (_ BitVec 32) List!18055) Bool)

(assert (=> b!906366 (= res!611735 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18052))))

(declare-fun b!906367 () Bool)

(declare-fun e!507910 () Bool)

(assert (=> b!906367 (= e!507910 (and e!507911 mapRes!29785))))

(declare-fun condMapEmpty!29785 () Bool)

(declare-fun mapDefault!29785 () ValueCell!8876)

(assert (=> b!906367 (= condMapEmpty!29785 (= (arr!25682 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8876)) mapDefault!29785)))))

(declare-fun b!906368 () Bool)

(declare-fun e!507913 () Bool)

(assert (=> b!906368 (= e!507913 tp_is_empty!18715)))

(declare-fun res!611737 () Bool)

(assert (=> start!77694 (=> (not res!611737) (not e!507917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77694 (= res!611737 (validMask!0 mask!1756))))

(assert (=> start!77694 e!507917))

(declare-fun array_inv!20156 (array!53445) Bool)

(assert (=> start!77694 (and (array_inv!20156 _values!1152) e!507910)))

(assert (=> start!77694 tp!57153))

(assert (=> start!77694 true))

(assert (=> start!77694 tp_is_empty!18715))

(declare-fun array_inv!20157 (array!53447) Bool)

(assert (=> start!77694 (array_inv!20157 _keys!1386)))

(declare-fun mapNonEmpty!29785 () Bool)

(declare-fun tp!57154 () Bool)

(assert (=> mapNonEmpty!29785 (= mapRes!29785 (and tp!57154 e!507913))))

(declare-fun mapKey!29785 () (_ BitVec 32))

(declare-fun mapValue!29785 () ValueCell!8876)

(declare-fun mapRest!29785 () (Array (_ BitVec 32) ValueCell!8876))

(assert (=> mapNonEmpty!29785 (= (arr!25682 _values!1152) (store mapRest!29785 mapKey!29785 mapValue!29785))))

(declare-fun b!906369 () Bool)

(declare-fun res!611733 () Bool)

(assert (=> b!906369 (=> (not res!611733) (not e!507917))))

(assert (=> b!906369 (= res!611733 (and (= (size!26143 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26144 _keys!1386) (size!26143 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906370 () Bool)

(declare-fun res!611731 () Bool)

(assert (=> b!906370 (=> res!611731 e!507916)))

(assert (=> b!906370 (= res!611731 (not (= (apply!468 lt!408741 k0!1033) lt!408744)))))

(declare-fun b!906371 () Bool)

(declare-fun res!611736 () Bool)

(assert (=> b!906371 (=> (not res!611736) (not e!507915))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906371 (= res!611736 (inRange!0 i!717 mask!1756))))

(declare-fun b!906372 () Bool)

(assert (=> b!906372 (= e!507917 e!507915)))

(declare-fun res!611739 () Bool)

(assert (=> b!906372 (=> (not res!611739) (not e!507915))))

(assert (=> b!906372 (= res!611739 (contains!4498 lt!408745 k0!1033))))

(assert (=> b!906372 (= lt!408745 (getCurrentListMap!2702 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!77694 res!611737) b!906369))

(assert (= (and b!906369 res!611733) b!906364))

(assert (= (and b!906364 res!611734) b!906366))

(assert (= (and b!906366 res!611735) b!906372))

(assert (= (and b!906372 res!611739) b!906371))

(assert (= (and b!906371 res!611736) b!906362))

(assert (= (and b!906362 res!611730) b!906363))

(assert (= (and b!906363 (not res!611732)) b!906365))

(assert (= (and b!906365 (not res!611738)) b!906370))

(assert (= (and b!906370 (not res!611731)) b!906361))

(assert (= (and b!906367 condMapEmpty!29785) mapIsEmpty!29785))

(assert (= (and b!906367 (not condMapEmpty!29785)) mapNonEmpty!29785))

(get-info :version)

(assert (= (and mapNonEmpty!29785 ((_ is ValueCellFull!8876) mapValue!29785)) b!906368))

(assert (= (and b!906367 ((_ is ValueCellFull!8876) mapDefault!29785)) b!906360))

(assert (= start!77694 b!906367))

(declare-fun b_lambda!13153 () Bool)

(assert (=> (not b_lambda!13153) (not b!906363)))

(declare-fun t!25513 () Bool)

(declare-fun tb!5311 () Bool)

(assert (=> (and start!77694 (= defaultEntry!1160 defaultEntry!1160) t!25513) tb!5311))

(declare-fun result!10425 () Bool)

(assert (=> tb!5311 (= result!10425 tp_is_empty!18715)))

(assert (=> b!906363 t!25513))

(declare-fun b_and!26723 () Bool)

(assert (= b_and!26721 (and (=> t!25513 result!10425) b_and!26723)))

(declare-fun m!841217 () Bool)

(assert (=> b!906371 m!841217))

(declare-fun m!841219 () Bool)

(assert (=> mapNonEmpty!29785 m!841219))

(declare-fun m!841221 () Bool)

(assert (=> b!906365 m!841221))

(declare-fun m!841223 () Bool)

(assert (=> b!906365 m!841223))

(declare-fun m!841225 () Bool)

(assert (=> b!906362 m!841225))

(declare-fun m!841227 () Bool)

(assert (=> b!906370 m!841227))

(declare-fun m!841229 () Bool)

(assert (=> b!906363 m!841229))

(declare-fun m!841231 () Bool)

(assert (=> b!906363 m!841231))

(declare-fun m!841233 () Bool)

(assert (=> b!906363 m!841233))

(declare-fun m!841235 () Bool)

(assert (=> b!906363 m!841235))

(assert (=> b!906363 m!841229))

(assert (=> b!906363 m!841233))

(declare-fun m!841237 () Bool)

(assert (=> b!906363 m!841237))

(declare-fun m!841239 () Bool)

(assert (=> b!906366 m!841239))

(declare-fun m!841241 () Bool)

(assert (=> start!77694 m!841241))

(declare-fun m!841243 () Bool)

(assert (=> start!77694 m!841243))

(declare-fun m!841245 () Bool)

(assert (=> start!77694 m!841245))

(declare-fun m!841247 () Bool)

(assert (=> b!906361 m!841247))

(declare-fun m!841249 () Bool)

(assert (=> b!906361 m!841249))

(declare-fun m!841251 () Bool)

(assert (=> b!906364 m!841251))

(declare-fun m!841253 () Bool)

(assert (=> b!906372 m!841253))

(declare-fun m!841255 () Bool)

(assert (=> b!906372 m!841255))

(check-sat (not b!906366) (not b!906370) (not b!906371) (not b!906361) (not start!77694) (not b!906372) b_and!26723 (not b_next!16297) (not mapNonEmpty!29785) (not b!906364) (not b!906363) tp_is_empty!18715 (not b_lambda!13153) (not b!906365))
(check-sat b_and!26723 (not b_next!16297))
