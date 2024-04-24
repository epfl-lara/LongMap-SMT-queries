; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77972 () Bool)

(assert start!77972)

(declare-fun b_free!16363 () Bool)

(declare-fun b_next!16363 () Bool)

(assert (=> start!77972 (= b_free!16363 (not b_next!16363))))

(declare-fun tp!57355 () Bool)

(declare-fun b_and!26893 () Bool)

(assert (=> start!77972 (= tp!57355 b_and!26893)))

(declare-fun b!909007 () Bool)

(declare-fun e!509536 () Bool)

(declare-fun e!509538 () Bool)

(assert (=> b!909007 (= e!509536 e!509538)))

(declare-fun res!613243 () Bool)

(assert (=> b!909007 (=> res!613243 e!509538)))

(declare-datatypes ((V!30007 0))(
  ( (V!30008 (val!9441 Int)) )
))
(declare-datatypes ((tuple2!12238 0))(
  ( (tuple2!12239 (_1!6130 (_ BitVec 64)) (_2!6130 V!30007)) )
))
(declare-datatypes ((List!18066 0))(
  ( (Nil!18063) (Cons!18062 (h!19214 tuple2!12238) (t!25593 List!18066)) )
))
(declare-datatypes ((ListLongMap!10937 0))(
  ( (ListLongMap!10938 (toList!5484 List!18066)) )
))
(declare-fun lt!409953 () ListLongMap!10937)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4538 (ListLongMap!10937 (_ BitVec 64)) Bool)

(assert (=> b!909007 (= res!613243 (not (contains!4538 lt!409953 k0!1033)))))

(declare-datatypes ((ValueCell!8909 0))(
  ( (ValueCellFull!8909 (v!11945 V!30007)) (EmptyCell!8909) )
))
(declare-datatypes ((array!53639 0))(
  ( (array!53640 (arr!25773 (Array (_ BitVec 32) ValueCell!8909)) (size!26233 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53639)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30007)

(declare-datatypes ((array!53641 0))(
  ( (array!53642 (arr!25774 (Array (_ BitVec 32) (_ BitVec 64))) (size!26234 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53641)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30007)

(declare-fun getCurrentListMap!2748 (array!53641 array!53639 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 32) Int) ListLongMap!10937)

(assert (=> b!909007 (= lt!409953 (getCurrentListMap!2748 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!909008 () Bool)

(declare-fun res!613238 () Bool)

(declare-fun e!509540 () Bool)

(assert (=> b!909008 (=> (not res!613238) (not e!509540))))

(assert (=> b!909008 (= res!613238 (and (= (size!26233 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26234 _keys!1386) (size!26233 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909009 () Bool)

(declare-fun e!509534 () Bool)

(declare-fun e!509541 () Bool)

(declare-fun mapRes!29887 () Bool)

(assert (=> b!909009 (= e!509534 (and e!509541 mapRes!29887))))

(declare-fun condMapEmpty!29887 () Bool)

(declare-fun mapDefault!29887 () ValueCell!8909)

(assert (=> b!909009 (= condMapEmpty!29887 (= (arr!25773 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8909)) mapDefault!29887)))))

(declare-fun mapIsEmpty!29887 () Bool)

(assert (=> mapIsEmpty!29887 mapRes!29887))

(declare-fun b!909010 () Bool)

(declare-fun res!613241 () Bool)

(assert (=> b!909010 (=> res!613241 e!509538)))

(declare-fun lt!409955 () V!30007)

(declare-fun apply!501 (ListLongMap!10937 (_ BitVec 64)) V!30007)

(assert (=> b!909010 (= res!613241 (not (= (apply!501 lt!409953 k0!1033) lt!409955)))))

(declare-fun b!909011 () Bool)

(declare-fun res!613244 () Bool)

(declare-fun e!509539 () Bool)

(assert (=> b!909011 (=> (not res!613244) (not e!509539))))

(assert (=> b!909011 (= res!613244 (and (= (select (arr!25774 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!909012 () Bool)

(declare-fun e!509535 () Bool)

(declare-fun tp_is_empty!18781 () Bool)

(assert (=> b!909012 (= e!509535 tp_is_empty!18781)))

(declare-fun res!613239 () Bool)

(assert (=> start!77972 (=> (not res!613239) (not e!509540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77972 (= res!613239 (validMask!0 mask!1756))))

(assert (=> start!77972 e!509540))

(declare-fun array_inv!20236 (array!53639) Bool)

(assert (=> start!77972 (and (array_inv!20236 _values!1152) e!509534)))

(assert (=> start!77972 tp!57355))

(assert (=> start!77972 true))

(assert (=> start!77972 tp_is_empty!18781))

(declare-fun array_inv!20237 (array!53641) Bool)

(assert (=> start!77972 (array_inv!20237 _keys!1386)))

(declare-fun b!909013 () Bool)

(assert (=> b!909013 (= e!509538 true)))

(declare-fun lt!409956 () ListLongMap!10937)

(assert (=> b!909013 (= (apply!501 lt!409956 k0!1033) lt!409955)))

(declare-datatypes ((Unit!30810 0))(
  ( (Unit!30811) )
))
(declare-fun lt!409954 () Unit!30810)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!48 (array!53641 array!53639 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 64) V!30007 (_ BitVec 32) Int) Unit!30810)

(assert (=> b!909013 (= lt!409954 (lemmaListMapApplyFromThenApplyFromZero!48 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409955 i!717 defaultEntry!1160))))

(declare-fun b!909014 () Bool)

(assert (=> b!909014 (= e!509541 tp_is_empty!18781)))

(declare-fun b!909015 () Bool)

(declare-fun res!613240 () Bool)

(assert (=> b!909015 (=> (not res!613240) (not e!509540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53641 (_ BitVec 32)) Bool)

(assert (=> b!909015 (= res!613240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909016 () Bool)

(assert (=> b!909016 (= e!509539 (not e!509536))))

(declare-fun res!613245 () Bool)

(assert (=> b!909016 (=> res!613245 e!509536)))

(assert (=> b!909016 (= res!613245 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26234 _keys!1386))))))

(declare-fun get!13575 (ValueCell!8909 V!30007) V!30007)

(declare-fun dynLambda!1386 (Int (_ BitVec 64)) V!30007)

(assert (=> b!909016 (= lt!409955 (get!13575 (select (arr!25773 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909016 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409952 () Unit!30810)

(declare-fun lemmaKeyInListMapIsInArray!245 (array!53641 array!53639 (_ BitVec 32) (_ BitVec 32) V!30007 V!30007 (_ BitVec 64) Int) Unit!30810)

(assert (=> b!909016 (= lt!409952 (lemmaKeyInListMapIsInArray!245 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!909017 () Bool)

(assert (=> b!909017 (= e!509540 e!509539)))

(declare-fun res!613247 () Bool)

(assert (=> b!909017 (=> (not res!613247) (not e!509539))))

(assert (=> b!909017 (= res!613247 (contains!4538 lt!409956 k0!1033))))

(assert (=> b!909017 (= lt!409956 (getCurrentListMap!2748 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!909018 () Bool)

(declare-fun res!613246 () Bool)

(assert (=> b!909018 (=> (not res!613246) (not e!509540))))

(declare-datatypes ((List!18067 0))(
  ( (Nil!18064) (Cons!18063 (h!19215 (_ BitVec 64)) (t!25594 List!18067)) )
))
(declare-fun arrayNoDuplicates!0 (array!53641 (_ BitVec 32) List!18067) Bool)

(assert (=> b!909018 (= res!613246 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18064))))

(declare-fun mapNonEmpty!29887 () Bool)

(declare-fun tp!57354 () Bool)

(assert (=> mapNonEmpty!29887 (= mapRes!29887 (and tp!57354 e!509535))))

(declare-fun mapKey!29887 () (_ BitVec 32))

(declare-fun mapValue!29887 () ValueCell!8909)

(declare-fun mapRest!29887 () (Array (_ BitVec 32) ValueCell!8909))

(assert (=> mapNonEmpty!29887 (= (arr!25773 _values!1152) (store mapRest!29887 mapKey!29887 mapValue!29887))))

(declare-fun b!909019 () Bool)

(declare-fun res!613242 () Bool)

(assert (=> b!909019 (=> (not res!613242) (not e!509539))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909019 (= res!613242 (inRange!0 i!717 mask!1756))))

(assert (= (and start!77972 res!613239) b!909008))

(assert (= (and b!909008 res!613238) b!909015))

(assert (= (and b!909015 res!613240) b!909018))

(assert (= (and b!909018 res!613246) b!909017))

(assert (= (and b!909017 res!613247) b!909019))

(assert (= (and b!909019 res!613242) b!909011))

(assert (= (and b!909011 res!613244) b!909016))

(assert (= (and b!909016 (not res!613245)) b!909007))

(assert (= (and b!909007 (not res!613243)) b!909010))

(assert (= (and b!909010 (not res!613241)) b!909013))

(assert (= (and b!909009 condMapEmpty!29887) mapIsEmpty!29887))

(assert (= (and b!909009 (not condMapEmpty!29887)) mapNonEmpty!29887))

(get-info :version)

(assert (= (and mapNonEmpty!29887 ((_ is ValueCellFull!8909) mapValue!29887)) b!909012))

(assert (= (and b!909009 ((_ is ValueCellFull!8909) mapDefault!29887)) b!909014))

(assert (= start!77972 b!909009))

(declare-fun b_lambda!13261 () Bool)

(assert (=> (not b_lambda!13261) (not b!909016)))

(declare-fun t!25592 () Bool)

(declare-fun tb!5377 () Bool)

(assert (=> (and start!77972 (= defaultEntry!1160 defaultEntry!1160) t!25592) tb!5377))

(declare-fun result!10559 () Bool)

(assert (=> tb!5377 (= result!10559 tp_is_empty!18781)))

(assert (=> b!909016 t!25592))

(declare-fun b_and!26895 () Bool)

(assert (= b_and!26893 (and (=> t!25592 result!10559) b_and!26895)))

(declare-fun m!844743 () Bool)

(assert (=> b!909007 m!844743))

(declare-fun m!844745 () Bool)

(assert (=> b!909007 m!844745))

(declare-fun m!844747 () Bool)

(assert (=> b!909016 m!844747))

(declare-fun m!844749 () Bool)

(assert (=> b!909016 m!844749))

(declare-fun m!844751 () Bool)

(assert (=> b!909016 m!844751))

(declare-fun m!844753 () Bool)

(assert (=> b!909016 m!844753))

(assert (=> b!909016 m!844747))

(assert (=> b!909016 m!844751))

(declare-fun m!844755 () Bool)

(assert (=> b!909016 m!844755))

(declare-fun m!844757 () Bool)

(assert (=> start!77972 m!844757))

(declare-fun m!844759 () Bool)

(assert (=> start!77972 m!844759))

(declare-fun m!844761 () Bool)

(assert (=> start!77972 m!844761))

(declare-fun m!844763 () Bool)

(assert (=> b!909019 m!844763))

(declare-fun m!844765 () Bool)

(assert (=> b!909011 m!844765))

(declare-fun m!844767 () Bool)

(assert (=> b!909017 m!844767))

(declare-fun m!844769 () Bool)

(assert (=> b!909017 m!844769))

(declare-fun m!844771 () Bool)

(assert (=> mapNonEmpty!29887 m!844771))

(declare-fun m!844773 () Bool)

(assert (=> b!909015 m!844773))

(declare-fun m!844775 () Bool)

(assert (=> b!909018 m!844775))

(declare-fun m!844777 () Bool)

(assert (=> b!909010 m!844777))

(declare-fun m!844779 () Bool)

(assert (=> b!909013 m!844779))

(declare-fun m!844781 () Bool)

(assert (=> b!909013 m!844781))

(check-sat (not b_lambda!13261) (not b!909013) (not b!909016) (not b!909007) (not mapNonEmpty!29887) (not start!77972) (not b!909018) (not b!909017) b_and!26895 (not b!909019) (not b_next!16363) tp_is_empty!18781 (not b!909010) (not b!909015))
(check-sat b_and!26895 (not b_next!16363))
