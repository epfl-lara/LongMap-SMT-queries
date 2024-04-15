; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77798 () Bool)

(assert start!77798)

(declare-fun b_free!16375 () Bool)

(declare-fun b_next!16375 () Bool)

(assert (=> start!77798 (= b_free!16375 (not b_next!16375))))

(declare-fun tp!57391 () Bool)

(declare-fun b_and!26881 () Bool)

(assert (=> start!77798 (= tp!57391 b_and!26881)))

(declare-fun b!908111 () Bool)

(declare-fun e!508951 () Bool)

(declare-fun e!508949 () Bool)

(assert (=> b!908111 (= e!508951 (not e!508949))))

(declare-fun res!612967 () Bool)

(assert (=> b!908111 (=> res!612967 e!508949)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53599 0))(
  ( (array!53600 (arr!25758 (Array (_ BitVec 32) (_ BitVec 64))) (size!26219 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53599)

(assert (=> b!908111 (= res!612967 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26219 _keys!1386))))))

(declare-datatypes ((V!30023 0))(
  ( (V!30024 (val!9447 Int)) )
))
(declare-datatypes ((ValueCell!8915 0))(
  ( (ValueCellFull!8915 (v!11953 V!30023)) (EmptyCell!8915) )
))
(declare-datatypes ((array!53601 0))(
  ( (array!53602 (arr!25759 (Array (_ BitVec 32) ValueCell!8915)) (size!26220 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53601)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409448 () V!30023)

(declare-fun get!13561 (ValueCell!8915 V!30023) V!30023)

(declare-fun dynLambda!1367 (Int (_ BitVec 64)) V!30023)

(assert (=> b!908111 (= lt!409448 (get!13561 (select (arr!25759 _values!1152) i!717) (dynLambda!1367 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908111 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30023)

(declare-datatypes ((Unit!30756 0))(
  ( (Unit!30757) )
))
(declare-fun lt!409445 () Unit!30756)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30023)

(declare-fun lemmaKeyInListMapIsInArray!243 (array!53599 array!53601 (_ BitVec 32) (_ BitVec 32) V!30023 V!30023 (_ BitVec 64) Int) Unit!30756)

(assert (=> b!908111 (= lt!409445 (lemmaKeyInListMapIsInArray!243 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29905 () Bool)

(declare-fun mapRes!29905 () Bool)

(assert (=> mapIsEmpty!29905 mapRes!29905))

(declare-fun b!908112 () Bool)

(declare-fun e!508953 () Bool)

(declare-fun tp_is_empty!18793 () Bool)

(assert (=> b!908112 (= e!508953 tp_is_empty!18793)))

(declare-fun res!612968 () Bool)

(declare-fun e!508948 () Bool)

(assert (=> start!77798 (=> (not res!612968) (not e!508948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77798 (= res!612968 (validMask!0 mask!1756))))

(assert (=> start!77798 e!508948))

(declare-fun e!508952 () Bool)

(declare-fun array_inv!20206 (array!53601) Bool)

(assert (=> start!77798 (and (array_inv!20206 _values!1152) e!508952)))

(assert (=> start!77798 tp!57391))

(assert (=> start!77798 true))

(assert (=> start!77798 tp_is_empty!18793))

(declare-fun array_inv!20207 (array!53599) Bool)

(assert (=> start!77798 (array_inv!20207 _keys!1386)))

(declare-fun b!908113 () Bool)

(declare-fun res!612972 () Bool)

(assert (=> b!908113 (=> (not res!612972) (not e!508948))))

(assert (=> b!908113 (= res!612972 (and (= (size!26220 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26219 _keys!1386) (size!26220 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908114 () Bool)

(declare-fun res!612966 () Bool)

(declare-fun e!508950 () Bool)

(assert (=> b!908114 (=> res!612966 e!508950)))

(declare-datatypes ((tuple2!12338 0))(
  ( (tuple2!12339 (_1!6180 (_ BitVec 64)) (_2!6180 V!30023)) )
))
(declare-datatypes ((List!18122 0))(
  ( (Nil!18119) (Cons!18118 (h!19264 tuple2!12338) (t!25660 List!18122)) )
))
(declare-datatypes ((ListLongMap!11025 0))(
  ( (ListLongMap!11026 (toList!5528 List!18122)) )
))
(declare-fun lt!409449 () ListLongMap!11025)

(declare-fun apply!501 (ListLongMap!11025 (_ BitVec 64)) V!30023)

(assert (=> b!908114 (= res!612966 (not (= (apply!501 lt!409449 k0!1033) lt!409448)))))

(declare-fun b!908115 () Bool)

(declare-fun res!612964 () Bool)

(assert (=> b!908115 (=> (not res!612964) (not e!508951))))

(assert (=> b!908115 (= res!612964 (and (= (select (arr!25758 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908116 () Bool)

(declare-fun res!612971 () Bool)

(assert (=> b!908116 (=> (not res!612971) (not e!508951))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908116 (= res!612971 (inRange!0 i!717 mask!1756))))

(declare-fun b!908117 () Bool)

(declare-fun e!508955 () Bool)

(assert (=> b!908117 (= e!508955 tp_is_empty!18793)))

(declare-fun b!908118 () Bool)

(assert (=> b!908118 (= e!508948 e!508951)))

(declare-fun res!612970 () Bool)

(assert (=> b!908118 (=> (not res!612970) (not e!508951))))

(declare-fun lt!409447 () ListLongMap!11025)

(declare-fun contains!4528 (ListLongMap!11025 (_ BitVec 64)) Bool)

(assert (=> b!908118 (= res!612970 (contains!4528 lt!409447 k0!1033))))

(declare-fun getCurrentListMap!2731 (array!53599 array!53601 (_ BitVec 32) (_ BitVec 32) V!30023 V!30023 (_ BitVec 32) Int) ListLongMap!11025)

(assert (=> b!908118 (= lt!409447 (getCurrentListMap!2731 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!29905 () Bool)

(declare-fun tp!57390 () Bool)

(assert (=> mapNonEmpty!29905 (= mapRes!29905 (and tp!57390 e!508953))))

(declare-fun mapValue!29905 () ValueCell!8915)

(declare-fun mapKey!29905 () (_ BitVec 32))

(declare-fun mapRest!29905 () (Array (_ BitVec 32) ValueCell!8915))

(assert (=> mapNonEmpty!29905 (= (arr!25759 _values!1152) (store mapRest!29905 mapKey!29905 mapValue!29905))))

(declare-fun b!908119 () Bool)

(declare-fun res!612965 () Bool)

(assert (=> b!908119 (=> (not res!612965) (not e!508948))))

(declare-datatypes ((List!18123 0))(
  ( (Nil!18120) (Cons!18119 (h!19265 (_ BitVec 64)) (t!25661 List!18123)) )
))
(declare-fun arrayNoDuplicates!0 (array!53599 (_ BitVec 32) List!18123) Bool)

(assert (=> b!908119 (= res!612965 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18120))))

(declare-fun b!908120 () Bool)

(assert (=> b!908120 (= e!508950 true)))

(assert (=> b!908120 (= (apply!501 lt!409447 k0!1033) lt!409448)))

(declare-fun lt!409446 () Unit!30756)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!59 (array!53599 array!53601 (_ BitVec 32) (_ BitVec 32) V!30023 V!30023 (_ BitVec 64) V!30023 (_ BitVec 32) Int) Unit!30756)

(assert (=> b!908120 (= lt!409446 (lemmaListMapApplyFromThenApplyFromZero!59 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409448 i!717 defaultEntry!1160))))

(declare-fun b!908121 () Bool)

(declare-fun res!612973 () Bool)

(assert (=> b!908121 (=> (not res!612973) (not e!508948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53599 (_ BitVec 32)) Bool)

(assert (=> b!908121 (= res!612973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908122 () Bool)

(assert (=> b!908122 (= e!508949 e!508950)))

(declare-fun res!612969 () Bool)

(assert (=> b!908122 (=> res!612969 e!508950)))

(assert (=> b!908122 (= res!612969 (not (contains!4528 lt!409449 k0!1033)))))

(assert (=> b!908122 (= lt!409449 (getCurrentListMap!2731 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908123 () Bool)

(assert (=> b!908123 (= e!508952 (and e!508955 mapRes!29905))))

(declare-fun condMapEmpty!29905 () Bool)

(declare-fun mapDefault!29905 () ValueCell!8915)

(assert (=> b!908123 (= condMapEmpty!29905 (= (arr!25759 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8915)) mapDefault!29905)))))

(assert (= (and start!77798 res!612968) b!908113))

(assert (= (and b!908113 res!612972) b!908121))

(assert (= (and b!908121 res!612973) b!908119))

(assert (= (and b!908119 res!612965) b!908118))

(assert (= (and b!908118 res!612970) b!908116))

(assert (= (and b!908116 res!612971) b!908115))

(assert (= (and b!908115 res!612964) b!908111))

(assert (= (and b!908111 (not res!612967)) b!908122))

(assert (= (and b!908122 (not res!612969)) b!908114))

(assert (= (and b!908114 (not res!612966)) b!908120))

(assert (= (and b!908123 condMapEmpty!29905) mapIsEmpty!29905))

(assert (= (and b!908123 (not condMapEmpty!29905)) mapNonEmpty!29905))

(get-info :version)

(assert (= (and mapNonEmpty!29905 ((_ is ValueCellFull!8915) mapValue!29905)) b!908112))

(assert (= (and b!908123 ((_ is ValueCellFull!8915) mapDefault!29905)) b!908117))

(assert (= start!77798 b!908123))

(declare-fun b_lambda!13241 () Bool)

(assert (=> (not b_lambda!13241) (not b!908111)))

(declare-fun t!25659 () Bool)

(declare-fun tb!5389 () Bool)

(assert (=> (and start!77798 (= defaultEntry!1160 defaultEntry!1160) t!25659) tb!5389))

(declare-fun result!10583 () Bool)

(assert (=> tb!5389 (= result!10583 tp_is_empty!18793)))

(assert (=> b!908111 t!25659))

(declare-fun b_and!26883 () Bool)

(assert (= b_and!26881 (and (=> t!25659 result!10583) b_and!26883)))

(declare-fun m!842931 () Bool)

(assert (=> b!908114 m!842931))

(declare-fun m!842933 () Bool)

(assert (=> b!908120 m!842933))

(declare-fun m!842935 () Bool)

(assert (=> b!908120 m!842935))

(declare-fun m!842937 () Bool)

(assert (=> b!908118 m!842937))

(declare-fun m!842939 () Bool)

(assert (=> b!908118 m!842939))

(declare-fun m!842941 () Bool)

(assert (=> b!908119 m!842941))

(declare-fun m!842943 () Bool)

(assert (=> start!77798 m!842943))

(declare-fun m!842945 () Bool)

(assert (=> start!77798 m!842945))

(declare-fun m!842947 () Bool)

(assert (=> start!77798 m!842947))

(declare-fun m!842949 () Bool)

(assert (=> b!908121 m!842949))

(declare-fun m!842951 () Bool)

(assert (=> b!908122 m!842951))

(declare-fun m!842953 () Bool)

(assert (=> b!908122 m!842953))

(declare-fun m!842955 () Bool)

(assert (=> b!908115 m!842955))

(declare-fun m!842957 () Bool)

(assert (=> b!908116 m!842957))

(declare-fun m!842959 () Bool)

(assert (=> b!908111 m!842959))

(declare-fun m!842961 () Bool)

(assert (=> b!908111 m!842961))

(declare-fun m!842963 () Bool)

(assert (=> b!908111 m!842963))

(declare-fun m!842965 () Bool)

(assert (=> b!908111 m!842965))

(assert (=> b!908111 m!842959))

(assert (=> b!908111 m!842963))

(declare-fun m!842967 () Bool)

(assert (=> b!908111 m!842967))

(declare-fun m!842969 () Bool)

(assert (=> mapNonEmpty!29905 m!842969))

(check-sat (not start!77798) (not b_next!16375) (not mapNonEmpty!29905) b_and!26883 (not b!908122) (not b!908118) (not b!908119) (not b!908121) (not b!908114) (not b!908120) (not b!908111) (not b!908116) tp_is_empty!18793 (not b_lambda!13241))
(check-sat b_and!26883 (not b_next!16375))
