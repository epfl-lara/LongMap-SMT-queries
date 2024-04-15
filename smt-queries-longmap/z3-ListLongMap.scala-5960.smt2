; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77568 () Bool)

(assert start!77568)

(declare-fun b_free!16171 () Bool)

(declare-fun b_next!16171 () Bool)

(assert (=> start!77568 (= b_free!16171 (not b_next!16171))))

(declare-fun tp!56775 () Bool)

(declare-fun b_and!26511 () Bool)

(assert (=> start!77568 (= tp!56775 b_and!26511)))

(declare-fun b!903880 () Bool)

(declare-fun e!506459 () Bool)

(declare-fun tp_is_empty!18589 () Bool)

(assert (=> b!903880 (= e!506459 tp_is_empty!18589)))

(declare-fun b!903881 () Bool)

(declare-fun res!609906 () Bool)

(declare-fun e!506463 () Bool)

(assert (=> b!903881 (=> (not res!609906) (not e!506463))))

(declare-datatypes ((array!53209 0))(
  ( (array!53210 (arr!25564 (Array (_ BitVec 32) (_ BitVec 64))) (size!26025 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53209)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53209 (_ BitVec 32)) Bool)

(assert (=> b!903881 (= res!609906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903882 () Bool)

(declare-fun res!609901 () Bool)

(assert (=> b!903882 (=> (not res!609901) (not e!506463))))

(declare-datatypes ((V!29751 0))(
  ( (V!29752 (val!9345 Int)) )
))
(declare-datatypes ((ValueCell!8813 0))(
  ( (ValueCellFull!8813 (v!11849 V!29751)) (EmptyCell!8813) )
))
(declare-datatypes ((array!53211 0))(
  ( (array!53212 (arr!25565 (Array (_ BitVec 32) ValueCell!8813)) (size!26026 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53211)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29751)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29751)

(declare-datatypes ((tuple2!12166 0))(
  ( (tuple2!12167 (_1!6094 (_ BitVec 64)) (_2!6094 V!29751)) )
))
(declare-datatypes ((List!17970 0))(
  ( (Nil!17967) (Cons!17966 (h!19112 tuple2!12166) (t!25344 List!17970)) )
))
(declare-datatypes ((ListLongMap!10853 0))(
  ( (ListLongMap!10854 (toList!5442 List!17970)) )
))
(declare-fun contains!4452 (ListLongMap!10853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2656 (array!53209 array!53211 (_ BitVec 32) (_ BitVec 32) V!29751 V!29751 (_ BitVec 32) Int) ListLongMap!10853)

(assert (=> b!903882 (= res!609901 (contains!4452 (getCurrentListMap!2656 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!29596 () Bool)

(declare-fun mapRes!29596 () Bool)

(declare-fun tp!56776 () Bool)

(declare-fun e!506461 () Bool)

(assert (=> mapNonEmpty!29596 (= mapRes!29596 (and tp!56776 e!506461))))

(declare-fun mapRest!29596 () (Array (_ BitVec 32) ValueCell!8813))

(declare-fun mapKey!29596 () (_ BitVec 32))

(declare-fun mapValue!29596 () ValueCell!8813)

(assert (=> mapNonEmpty!29596 (= (arr!25565 _values!1152) (store mapRest!29596 mapKey!29596 mapValue!29596))))

(declare-fun mapIsEmpty!29596 () Bool)

(assert (=> mapIsEmpty!29596 mapRes!29596))

(declare-fun b!903883 () Bool)

(declare-fun e!506460 () Bool)

(declare-fun e!506462 () Bool)

(assert (=> b!903883 (= e!506460 e!506462)))

(declare-fun res!609903 () Bool)

(assert (=> b!903883 (=> res!609903 e!506462)))

(declare-fun lt!407920 () ListLongMap!10853)

(assert (=> b!903883 (= res!609903 (not (contains!4452 lt!407920 k0!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!903883 (= lt!407920 (getCurrentListMap!2656 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!903884 () Bool)

(declare-fun res!609902 () Bool)

(assert (=> b!903884 (=> (not res!609902) (not e!506463))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903884 (= res!609902 (inRange!0 i!717 mask!1756))))

(declare-fun b!903885 () Bool)

(assert (=> b!903885 (= e!506461 tp_is_empty!18589)))

(declare-fun b!903886 () Bool)

(assert (=> b!903886 (= e!506462 true)))

(declare-fun lt!407918 () V!29751)

(declare-fun apply!426 (ListLongMap!10853 (_ BitVec 64)) V!29751)

(assert (=> b!903886 (= lt!407918 (apply!426 lt!407920 k0!1033))))

(declare-fun b!903887 () Bool)

(declare-fun res!609908 () Bool)

(assert (=> b!903887 (=> (not res!609908) (not e!506463))))

(assert (=> b!903887 (= res!609908 (and (= (select (arr!25564 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903889 () Bool)

(declare-fun e!506464 () Bool)

(assert (=> b!903889 (= e!506464 (and e!506459 mapRes!29596))))

(declare-fun condMapEmpty!29596 () Bool)

(declare-fun mapDefault!29596 () ValueCell!8813)

(assert (=> b!903889 (= condMapEmpty!29596 (= (arr!25565 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8813)) mapDefault!29596)))))

(declare-fun b!903890 () Bool)

(declare-fun res!609905 () Bool)

(assert (=> b!903890 (=> (not res!609905) (not e!506463))))

(declare-datatypes ((List!17971 0))(
  ( (Nil!17968) (Cons!17967 (h!19113 (_ BitVec 64)) (t!25345 List!17971)) )
))
(declare-fun arrayNoDuplicates!0 (array!53209 (_ BitVec 32) List!17971) Bool)

(assert (=> b!903890 (= res!609905 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17968))))

(declare-fun b!903891 () Bool)

(assert (=> b!903891 (= e!506463 (not e!506460))))

(declare-fun res!609904 () Bool)

(assert (=> b!903891 (=> res!609904 e!506460)))

(assert (=> b!903891 (= res!609904 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26025 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903891 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30600 0))(
  ( (Unit!30601) )
))
(declare-fun lt!407919 () Unit!30600)

(declare-fun lemmaKeyInListMapIsInArray!182 (array!53209 array!53211 (_ BitVec 32) (_ BitVec 32) V!29751 V!29751 (_ BitVec 64) Int) Unit!30600)

(assert (=> b!903891 (= lt!407919 (lemmaKeyInListMapIsInArray!182 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903888 () Bool)

(declare-fun res!609909 () Bool)

(assert (=> b!903888 (=> (not res!609909) (not e!506463))))

(assert (=> b!903888 (= res!609909 (and (= (size!26026 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26025 _keys!1386) (size!26026 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609907 () Bool)

(assert (=> start!77568 (=> (not res!609907) (not e!506463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77568 (= res!609907 (validMask!0 mask!1756))))

(assert (=> start!77568 e!506463))

(declare-fun array_inv!20092 (array!53211) Bool)

(assert (=> start!77568 (and (array_inv!20092 _values!1152) e!506464)))

(assert (=> start!77568 tp!56775))

(assert (=> start!77568 true))

(assert (=> start!77568 tp_is_empty!18589))

(declare-fun array_inv!20093 (array!53209) Bool)

(assert (=> start!77568 (array_inv!20093 _keys!1386)))

(assert (= (and start!77568 res!609907) b!903888))

(assert (= (and b!903888 res!609909) b!903881))

(assert (= (and b!903881 res!609906) b!903890))

(assert (= (and b!903890 res!609905) b!903882))

(assert (= (and b!903882 res!609901) b!903884))

(assert (= (and b!903884 res!609902) b!903887))

(assert (= (and b!903887 res!609908) b!903891))

(assert (= (and b!903891 (not res!609904)) b!903883))

(assert (= (and b!903883 (not res!609903)) b!903886))

(assert (= (and b!903889 condMapEmpty!29596) mapIsEmpty!29596))

(assert (= (and b!903889 (not condMapEmpty!29596)) mapNonEmpty!29596))

(get-info :version)

(assert (= (and mapNonEmpty!29596 ((_ is ValueCellFull!8813) mapValue!29596)) b!903885))

(assert (= (and b!903889 ((_ is ValueCellFull!8813) mapDefault!29596)) b!903880))

(assert (= start!77568 b!903889))

(declare-fun m!838907 () Bool)

(assert (=> b!903881 m!838907))

(declare-fun m!838909 () Bool)

(assert (=> b!903887 m!838909))

(declare-fun m!838911 () Bool)

(assert (=> b!903890 m!838911))

(declare-fun m!838913 () Bool)

(assert (=> mapNonEmpty!29596 m!838913))

(declare-fun m!838915 () Bool)

(assert (=> start!77568 m!838915))

(declare-fun m!838917 () Bool)

(assert (=> start!77568 m!838917))

(declare-fun m!838919 () Bool)

(assert (=> start!77568 m!838919))

(declare-fun m!838921 () Bool)

(assert (=> b!903884 m!838921))

(declare-fun m!838923 () Bool)

(assert (=> b!903883 m!838923))

(declare-fun m!838925 () Bool)

(assert (=> b!903883 m!838925))

(declare-fun m!838927 () Bool)

(assert (=> b!903891 m!838927))

(declare-fun m!838929 () Bool)

(assert (=> b!903891 m!838929))

(declare-fun m!838931 () Bool)

(assert (=> b!903886 m!838931))

(declare-fun m!838933 () Bool)

(assert (=> b!903882 m!838933))

(assert (=> b!903882 m!838933))

(declare-fun m!838935 () Bool)

(assert (=> b!903882 m!838935))

(check-sat (not b!903882) (not b_next!16171) (not b!903886) (not mapNonEmpty!29596) (not b!903891) tp_is_empty!18589 (not b!903883) (not start!77568) b_and!26511 (not b!903890) (not b!903884) (not b!903881))
(check-sat b_and!26511 (not b_next!16171))
