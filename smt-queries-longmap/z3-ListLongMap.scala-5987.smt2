; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77730 () Bool)

(assert start!77730)

(declare-fun b_free!16333 () Bool)

(declare-fun b_next!16333 () Bool)

(assert (=> start!77730 (= b_free!16333 (not b_next!16333))))

(declare-fun tp!57261 () Bool)

(declare-fun b_and!26793 () Bool)

(assert (=> start!77730 (= tp!57261 b_and!26793)))

(declare-fun b!907098 () Bool)

(declare-fun e!508346 () Bool)

(declare-fun e!508342 () Bool)

(assert (=> b!907098 (= e!508346 e!508342)))

(declare-fun res!612271 () Bool)

(assert (=> b!907098 (=> (not res!612271) (not e!508342))))

(declare-datatypes ((V!29967 0))(
  ( (V!29968 (val!9426 Int)) )
))
(declare-datatypes ((tuple2!12298 0))(
  ( (tuple2!12299 (_1!6160 (_ BitVec 64)) (_2!6160 V!29967)) )
))
(declare-datatypes ((List!18084 0))(
  ( (Nil!18081) (Cons!18080 (h!19226 tuple2!12298) (t!25580 List!18084)) )
))
(declare-datatypes ((ListLongMap!10985 0))(
  ( (ListLongMap!10986 (toList!5508 List!18084)) )
))
(declare-fun lt!409015 () ListLongMap!10985)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4511 (ListLongMap!10985 (_ BitVec 64)) Bool)

(assert (=> b!907098 (= res!612271 (contains!4511 lt!409015 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29967)

(declare-datatypes ((ValueCell!8894 0))(
  ( (ValueCellFull!8894 (v!11930 V!29967)) (EmptyCell!8894) )
))
(declare-datatypes ((array!53515 0))(
  ( (array!53516 (arr!25717 (Array (_ BitVec 32) ValueCell!8894)) (size!26178 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53515)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29967)

(declare-datatypes ((array!53517 0))(
  ( (array!53518 (arr!25718 (Array (_ BitVec 32) (_ BitVec 64))) (size!26179 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53517)

(declare-fun getCurrentListMap!2715 (array!53517 array!53515 (_ BitVec 32) (_ BitVec 32) V!29967 V!29967 (_ BitVec 32) Int) ListLongMap!10985)

(assert (=> b!907098 (= lt!409015 (getCurrentListMap!2715 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907099 () Bool)

(declare-fun res!612270 () Bool)

(assert (=> b!907099 (=> (not res!612270) (not e!508346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53517 (_ BitVec 32)) Bool)

(assert (=> b!907099 (= res!612270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907100 () Bool)

(declare-fun e!508343 () Bool)

(declare-fun tp_is_empty!18751 () Bool)

(assert (=> b!907100 (= e!508343 tp_is_empty!18751)))

(declare-fun b!907101 () Bool)

(declare-fun res!612277 () Bool)

(assert (=> b!907101 (=> (not res!612277) (not e!508346))))

(declare-datatypes ((List!18085 0))(
  ( (Nil!18082) (Cons!18081 (h!19227 (_ BitVec 64)) (t!25581 List!18085)) )
))
(declare-fun arrayNoDuplicates!0 (array!53517 (_ BitVec 32) List!18085) Bool)

(assert (=> b!907101 (= res!612277 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18082))))

(declare-fun b!907102 () Bool)

(declare-fun res!612276 () Bool)

(assert (=> b!907102 (=> (not res!612276) (not e!508342))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!907102 (= res!612276 (and (= (select (arr!25718 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907103 () Bool)

(declare-fun res!612273 () Bool)

(assert (=> b!907103 (=> (not res!612273) (not e!508346))))

(assert (=> b!907103 (= res!612273 (and (= (size!26178 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26179 _keys!1386) (size!26178 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29839 () Bool)

(declare-fun mapRes!29839 () Bool)

(assert (=> mapIsEmpty!29839 mapRes!29839))

(declare-fun b!907104 () Bool)

(declare-fun e!508345 () Bool)

(assert (=> b!907104 (= e!508345 tp_is_empty!18751)))

(declare-fun b!907105 () Bool)

(declare-fun e!508344 () Bool)

(declare-fun e!508348 () Bool)

(assert (=> b!907105 (= e!508344 e!508348)))

(declare-fun res!612275 () Bool)

(assert (=> b!907105 (=> res!612275 e!508348)))

(declare-fun lt!409014 () ListLongMap!10985)

(assert (=> b!907105 (= res!612275 (not (contains!4511 lt!409014 k0!1033)))))

(assert (=> b!907105 (= lt!409014 (getCurrentListMap!2715 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907106 () Bool)

(declare-fun res!612278 () Bool)

(assert (=> b!907106 (=> res!612278 e!508348)))

(declare-fun lt!409013 () V!29967)

(declare-fun apply!483 (ListLongMap!10985 (_ BitVec 64)) V!29967)

(assert (=> b!907106 (= res!612278 (not (= (apply!483 lt!409014 k0!1033) lt!409013)))))

(declare-fun b!907107 () Bool)

(declare-fun res!612274 () Bool)

(assert (=> b!907107 (=> (not res!612274) (not e!508342))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907107 (= res!612274 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29839 () Bool)

(declare-fun tp!57262 () Bool)

(assert (=> mapNonEmpty!29839 (= mapRes!29839 (and tp!57262 e!508345))))

(declare-fun mapRest!29839 () (Array (_ BitVec 32) ValueCell!8894))

(declare-fun mapValue!29839 () ValueCell!8894)

(declare-fun mapKey!29839 () (_ BitVec 32))

(assert (=> mapNonEmpty!29839 (= (arr!25717 _values!1152) (store mapRest!29839 mapKey!29839 mapValue!29839))))

(declare-fun b!907108 () Bool)

(assert (=> b!907108 (= e!508348 true)))

(assert (=> b!907108 (= (apply!483 lt!409015 k0!1033) lt!409013)))

(declare-datatypes ((Unit!30716 0))(
  ( (Unit!30717) )
))
(declare-fun lt!409011 () Unit!30716)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!44 (array!53517 array!53515 (_ BitVec 32) (_ BitVec 32) V!29967 V!29967 (_ BitVec 64) V!29967 (_ BitVec 32) Int) Unit!30716)

(assert (=> b!907108 (= lt!409011 (lemmaListMapApplyFromThenApplyFromZero!44 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409013 i!717 defaultEntry!1160))))

(declare-fun res!612272 () Bool)

(assert (=> start!77730 (=> (not res!612272) (not e!508346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77730 (= res!612272 (validMask!0 mask!1756))))

(assert (=> start!77730 e!508346))

(declare-fun e!508349 () Bool)

(declare-fun array_inv!20180 (array!53515) Bool)

(assert (=> start!77730 (and (array_inv!20180 _values!1152) e!508349)))

(assert (=> start!77730 tp!57261))

(assert (=> start!77730 true))

(assert (=> start!77730 tp_is_empty!18751))

(declare-fun array_inv!20181 (array!53517) Bool)

(assert (=> start!77730 (array_inv!20181 _keys!1386)))

(declare-fun b!907109 () Bool)

(assert (=> b!907109 (= e!508342 (not e!508344))))

(declare-fun res!612279 () Bool)

(assert (=> b!907109 (=> res!612279 e!508344)))

(assert (=> b!907109 (= res!612279 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26179 _keys!1386))))))

(declare-fun get!13530 (ValueCell!8894 V!29967) V!29967)

(declare-fun dynLambda!1353 (Int (_ BitVec 64)) V!29967)

(assert (=> b!907109 (= lt!409013 (get!13530 (select (arr!25717 _values!1152) i!717) (dynLambda!1353 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907109 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409012 () Unit!30716)

(declare-fun lemmaKeyInListMapIsInArray!229 (array!53517 array!53515 (_ BitVec 32) (_ BitVec 32) V!29967 V!29967 (_ BitVec 64) Int) Unit!30716)

(assert (=> b!907109 (= lt!409012 (lemmaKeyInListMapIsInArray!229 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907110 () Bool)

(assert (=> b!907110 (= e!508349 (and e!508343 mapRes!29839))))

(declare-fun condMapEmpty!29839 () Bool)

(declare-fun mapDefault!29839 () ValueCell!8894)

(assert (=> b!907110 (= condMapEmpty!29839 (= (arr!25717 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8894)) mapDefault!29839)))))

(assert (= (and start!77730 res!612272) b!907103))

(assert (= (and b!907103 res!612273) b!907099))

(assert (= (and b!907099 res!612270) b!907101))

(assert (= (and b!907101 res!612277) b!907098))

(assert (= (and b!907098 res!612271) b!907107))

(assert (= (and b!907107 res!612274) b!907102))

(assert (= (and b!907102 res!612276) b!907109))

(assert (= (and b!907109 (not res!612279)) b!907105))

(assert (= (and b!907105 (not res!612275)) b!907106))

(assert (= (and b!907106 (not res!612278)) b!907108))

(assert (= (and b!907110 condMapEmpty!29839) mapIsEmpty!29839))

(assert (= (and b!907110 (not condMapEmpty!29839)) mapNonEmpty!29839))

(get-info :version)

(assert (= (and mapNonEmpty!29839 ((_ is ValueCellFull!8894) mapValue!29839)) b!907104))

(assert (= (and b!907110 ((_ is ValueCellFull!8894) mapDefault!29839)) b!907100))

(assert (= start!77730 b!907110))

(declare-fun b_lambda!13189 () Bool)

(assert (=> (not b_lambda!13189) (not b!907109)))

(declare-fun t!25579 () Bool)

(declare-fun tb!5347 () Bool)

(assert (=> (and start!77730 (= defaultEntry!1160 defaultEntry!1160) t!25579) tb!5347))

(declare-fun result!10497 () Bool)

(assert (=> tb!5347 (= result!10497 tp_is_empty!18751)))

(assert (=> b!907109 t!25579))

(declare-fun b_and!26795 () Bool)

(assert (= b_and!26793 (and (=> t!25579 result!10497) b_and!26795)))

(declare-fun m!841937 () Bool)

(assert (=> b!907109 m!841937))

(declare-fun m!841939 () Bool)

(assert (=> b!907109 m!841939))

(declare-fun m!841941 () Bool)

(assert (=> b!907109 m!841941))

(declare-fun m!841943 () Bool)

(assert (=> b!907109 m!841943))

(assert (=> b!907109 m!841937))

(assert (=> b!907109 m!841941))

(declare-fun m!841945 () Bool)

(assert (=> b!907109 m!841945))

(declare-fun m!841947 () Bool)

(assert (=> b!907099 m!841947))

(declare-fun m!841949 () Bool)

(assert (=> b!907098 m!841949))

(declare-fun m!841951 () Bool)

(assert (=> b!907098 m!841951))

(declare-fun m!841953 () Bool)

(assert (=> b!907106 m!841953))

(declare-fun m!841955 () Bool)

(assert (=> b!907102 m!841955))

(declare-fun m!841957 () Bool)

(assert (=> start!77730 m!841957))

(declare-fun m!841959 () Bool)

(assert (=> start!77730 m!841959))

(declare-fun m!841961 () Bool)

(assert (=> start!77730 m!841961))

(declare-fun m!841963 () Bool)

(assert (=> b!907101 m!841963))

(declare-fun m!841965 () Bool)

(assert (=> b!907105 m!841965))

(declare-fun m!841967 () Bool)

(assert (=> b!907105 m!841967))

(declare-fun m!841969 () Bool)

(assert (=> mapNonEmpty!29839 m!841969))

(declare-fun m!841971 () Bool)

(assert (=> b!907108 m!841971))

(declare-fun m!841973 () Bool)

(assert (=> b!907108 m!841973))

(declare-fun m!841975 () Bool)

(assert (=> b!907107 m!841975))

(check-sat (not b!907098) (not mapNonEmpty!29839) (not b!907108) (not start!77730) (not b_next!16333) (not b_lambda!13189) (not b!907099) (not b!907107) (not b!907105) (not b!907101) (not b!907106) (not b!907109) b_and!26795 tp_is_empty!18751)
(check-sat b_and!26795 (not b_next!16333))
