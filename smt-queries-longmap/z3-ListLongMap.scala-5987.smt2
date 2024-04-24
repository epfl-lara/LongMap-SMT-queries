; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77916 () Bool)

(assert start!77916)

(declare-fun b_free!16333 () Bool)

(declare-fun b_next!16333 () Bool)

(assert (=> start!77916 (= b_free!16333 (not b_next!16333))))

(declare-fun tp!57261 () Bool)

(declare-fun b_and!26829 () Bool)

(assert (=> start!77916 (= tp!57261 b_and!26829)))

(declare-fun b!908240 () Bool)

(declare-fun e!509072 () Bool)

(declare-fun e!509075 () Bool)

(assert (=> b!908240 (= e!509072 e!509075)))

(declare-fun res!612725 () Bool)

(assert (=> b!908240 (=> res!612725 e!509075)))

(declare-datatypes ((V!29967 0))(
  ( (V!29968 (val!9426 Int)) )
))
(declare-datatypes ((tuple2!12208 0))(
  ( (tuple2!12209 (_1!6115 (_ BitVec 64)) (_2!6115 V!29967)) )
))
(declare-datatypes ((List!18041 0))(
  ( (Nil!18038) (Cons!18037 (h!19189 tuple2!12208) (t!25538 List!18041)) )
))
(declare-datatypes ((ListLongMap!10907 0))(
  ( (ListLongMap!10908 (toList!5469 List!18041)) )
))
(declare-fun lt!409609 () ListLongMap!10907)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4522 (ListLongMap!10907 (_ BitVec 64)) Bool)

(assert (=> b!908240 (= res!612725 (not (contains!4522 lt!409609 k0!1033)))))

(declare-datatypes ((ValueCell!8894 0))(
  ( (ValueCellFull!8894 (v!11928 V!29967)) (EmptyCell!8894) )
))
(declare-datatypes ((array!53577 0))(
  ( (array!53578 (arr!25743 (Array (_ BitVec 32) ValueCell!8894)) (size!26203 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53577)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53579 0))(
  ( (array!53580 (arr!25744 (Array (_ BitVec 32) (_ BitVec 64))) (size!26204 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53579)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29967)

(declare-fun zeroValue!1094 () V!29967)

(declare-fun getCurrentListMap!2733 (array!53579 array!53577 (_ BitVec 32) (_ BitVec 32) V!29967 V!29967 (_ BitVec 32) Int) ListLongMap!10907)

(assert (=> b!908240 (= lt!409609 (getCurrentListMap!2733 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29839 () Bool)

(declare-fun mapRes!29839 () Bool)

(assert (=> mapIsEmpty!29839 mapRes!29839))

(declare-fun b!908241 () Bool)

(declare-fun res!612724 () Bool)

(declare-fun e!509077 () Bool)

(assert (=> b!908241 (=> (not res!612724) (not e!509077))))

(declare-datatypes ((List!18042 0))(
  ( (Nil!18039) (Cons!18038 (h!19190 (_ BitVec 64)) (t!25539 List!18042)) )
))
(declare-fun arrayNoDuplicates!0 (array!53579 (_ BitVec 32) List!18042) Bool)

(assert (=> b!908241 (= res!612724 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18039))))

(declare-fun b!908242 () Bool)

(declare-fun res!612733 () Bool)

(assert (=> b!908242 (=> res!612733 e!509075)))

(declare-fun lt!409608 () V!29967)

(declare-fun apply!488 (ListLongMap!10907 (_ BitVec 64)) V!29967)

(assert (=> b!908242 (= res!612733 (not (= (apply!488 lt!409609 k0!1033) lt!409608)))))

(declare-fun b!908243 () Bool)

(declare-fun e!509073 () Bool)

(assert (=> b!908243 (= e!509077 e!509073)))

(declare-fun res!612726 () Bool)

(assert (=> b!908243 (=> (not res!612726) (not e!509073))))

(declare-fun lt!409611 () ListLongMap!10907)

(assert (=> b!908243 (= res!612726 (contains!4522 lt!409611 k0!1033))))

(assert (=> b!908243 (= lt!409611 (getCurrentListMap!2733 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908244 () Bool)

(declare-fun e!509078 () Bool)

(declare-fun tp_is_empty!18751 () Bool)

(assert (=> b!908244 (= e!509078 tp_is_empty!18751)))

(declare-fun b!908245 () Bool)

(declare-fun res!612727 () Bool)

(assert (=> b!908245 (=> (not res!612727) (not e!509073))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908245 (= res!612727 (inRange!0 i!717 mask!1756))))

(declare-fun res!612732 () Bool)

(assert (=> start!77916 (=> (not res!612732) (not e!509077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77916 (= res!612732 (validMask!0 mask!1756))))

(assert (=> start!77916 e!509077))

(declare-fun e!509074 () Bool)

(declare-fun array_inv!20214 (array!53577) Bool)

(assert (=> start!77916 (and (array_inv!20214 _values!1152) e!509074)))

(assert (=> start!77916 tp!57261))

(assert (=> start!77916 true))

(assert (=> start!77916 tp_is_empty!18751))

(declare-fun array_inv!20215 (array!53579) Bool)

(assert (=> start!77916 (array_inv!20215 _keys!1386)))

(declare-fun mapNonEmpty!29839 () Bool)

(declare-fun tp!57262 () Bool)

(declare-fun e!509076 () Bool)

(assert (=> mapNonEmpty!29839 (= mapRes!29839 (and tp!57262 e!509076))))

(declare-fun mapRest!29839 () (Array (_ BitVec 32) ValueCell!8894))

(declare-fun mapValue!29839 () ValueCell!8894)

(declare-fun mapKey!29839 () (_ BitVec 32))

(assert (=> mapNonEmpty!29839 (= (arr!25743 _values!1152) (store mapRest!29839 mapKey!29839 mapValue!29839))))

(declare-fun b!908246 () Bool)

(declare-fun res!612729 () Bool)

(assert (=> b!908246 (=> (not res!612729) (not e!509073))))

(assert (=> b!908246 (= res!612729 (and (= (select (arr!25744 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908247 () Bool)

(assert (=> b!908247 (= e!509075 true)))

(assert (=> b!908247 (= (apply!488 lt!409611 k0!1033) lt!409608)))

(declare-datatypes ((Unit!30788 0))(
  ( (Unit!30789) )
))
(declare-fun lt!409612 () Unit!30788)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!39 (array!53579 array!53577 (_ BitVec 32) (_ BitVec 32) V!29967 V!29967 (_ BitVec 64) V!29967 (_ BitVec 32) Int) Unit!30788)

(assert (=> b!908247 (= lt!409612 (lemmaListMapApplyFromThenApplyFromZero!39 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409608 i!717 defaultEntry!1160))))

(declare-fun b!908248 () Bool)

(assert (=> b!908248 (= e!509074 (and e!509078 mapRes!29839))))

(declare-fun condMapEmpty!29839 () Bool)

(declare-fun mapDefault!29839 () ValueCell!8894)

(assert (=> b!908248 (= condMapEmpty!29839 (= (arr!25743 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8894)) mapDefault!29839)))))

(declare-fun b!908249 () Bool)

(assert (=> b!908249 (= e!509073 (not e!509072))))

(declare-fun res!612731 () Bool)

(assert (=> b!908249 (=> res!612731 e!509072)))

(assert (=> b!908249 (= res!612731 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26204 _keys!1386))))))

(declare-fun get!13553 (ValueCell!8894 V!29967) V!29967)

(declare-fun dynLambda!1377 (Int (_ BitVec 64)) V!29967)

(assert (=> b!908249 (= lt!409608 (get!13553 (select (arr!25743 _values!1152) i!717) (dynLambda!1377 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908249 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409610 () Unit!30788)

(declare-fun lemmaKeyInListMapIsInArray!236 (array!53579 array!53577 (_ BitVec 32) (_ BitVec 32) V!29967 V!29967 (_ BitVec 64) Int) Unit!30788)

(assert (=> b!908249 (= lt!409610 (lemmaKeyInListMapIsInArray!236 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908250 () Bool)

(declare-fun res!612728 () Bool)

(assert (=> b!908250 (=> (not res!612728) (not e!509077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53579 (_ BitVec 32)) Bool)

(assert (=> b!908250 (= res!612728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908251 () Bool)

(assert (=> b!908251 (= e!509076 tp_is_empty!18751)))

(declare-fun b!908252 () Bool)

(declare-fun res!612730 () Bool)

(assert (=> b!908252 (=> (not res!612730) (not e!509077))))

(assert (=> b!908252 (= res!612730 (and (= (size!26203 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26204 _keys!1386) (size!26203 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77916 res!612732) b!908252))

(assert (= (and b!908252 res!612730) b!908250))

(assert (= (and b!908250 res!612728) b!908241))

(assert (= (and b!908241 res!612724) b!908243))

(assert (= (and b!908243 res!612726) b!908245))

(assert (= (and b!908245 res!612727) b!908246))

(assert (= (and b!908246 res!612729) b!908249))

(assert (= (and b!908249 (not res!612731)) b!908240))

(assert (= (and b!908240 (not res!612725)) b!908242))

(assert (= (and b!908242 (not res!612733)) b!908247))

(assert (= (and b!908248 condMapEmpty!29839) mapIsEmpty!29839))

(assert (= (and b!908248 (not condMapEmpty!29839)) mapNonEmpty!29839))

(get-info :version)

(assert (= (and mapNonEmpty!29839 ((_ is ValueCellFull!8894) mapValue!29839)) b!908251))

(assert (= (and b!908248 ((_ is ValueCellFull!8894) mapDefault!29839)) b!908244))

(assert (= start!77916 b!908248))

(declare-fun b_lambda!13221 () Bool)

(assert (=> (not b_lambda!13221) (not b!908249)))

(declare-fun t!25537 () Bool)

(declare-fun tb!5347 () Bool)

(assert (=> (and start!77916 (= defaultEntry!1160 defaultEntry!1160) t!25537) tb!5347))

(declare-fun result!10497 () Bool)

(assert (=> tb!5347 (= result!10497 tp_is_empty!18751)))

(assert (=> b!908249 t!25537))

(declare-fun b_and!26831 () Bool)

(assert (= b_and!26829 (and (=> t!25537 result!10497) b_and!26831)))

(declare-fun m!843989 () Bool)

(assert (=> b!908246 m!843989))

(declare-fun m!843991 () Bool)

(assert (=> b!908245 m!843991))

(declare-fun m!843993 () Bool)

(assert (=> mapNonEmpty!29839 m!843993))

(declare-fun m!843995 () Bool)

(assert (=> b!908242 m!843995))

(declare-fun m!843997 () Bool)

(assert (=> b!908250 m!843997))

(declare-fun m!843999 () Bool)

(assert (=> start!77916 m!843999))

(declare-fun m!844001 () Bool)

(assert (=> start!77916 m!844001))

(declare-fun m!844003 () Bool)

(assert (=> start!77916 m!844003))

(declare-fun m!844005 () Bool)

(assert (=> b!908243 m!844005))

(declare-fun m!844007 () Bool)

(assert (=> b!908243 m!844007))

(declare-fun m!844009 () Bool)

(assert (=> b!908249 m!844009))

(declare-fun m!844011 () Bool)

(assert (=> b!908249 m!844011))

(declare-fun m!844013 () Bool)

(assert (=> b!908249 m!844013))

(declare-fun m!844015 () Bool)

(assert (=> b!908249 m!844015))

(assert (=> b!908249 m!844009))

(assert (=> b!908249 m!844013))

(declare-fun m!844017 () Bool)

(assert (=> b!908249 m!844017))

(declare-fun m!844019 () Bool)

(assert (=> b!908240 m!844019))

(declare-fun m!844021 () Bool)

(assert (=> b!908240 m!844021))

(declare-fun m!844023 () Bool)

(assert (=> b!908247 m!844023))

(declare-fun m!844025 () Bool)

(assert (=> b!908247 m!844025))

(declare-fun m!844027 () Bool)

(assert (=> b!908241 m!844027))

(check-sat b_and!26831 (not b!908242) tp_is_empty!18751 (not b!908250) (not mapNonEmpty!29839) (not b!908243) (not b!908249) (not b!908241) (not b!908245) (not b!908247) (not b_next!16333) (not start!77916) (not b_lambda!13221) (not b!908240))
(check-sat b_and!26831 (not b_next!16333))
