; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77574 () Bool)

(assert start!77574)

(declare-fun b_free!16177 () Bool)

(declare-fun b_next!16177 () Bool)

(assert (=> start!77574 (= b_free!16177 (not b_next!16177))))

(declare-fun tp!56793 () Bool)

(declare-fun b_and!26517 () Bool)

(assert (=> start!77574 (= tp!56793 b_and!26517)))

(declare-fun b!903988 () Bool)

(declare-fun res!609987 () Bool)

(declare-fun e!506522 () Bool)

(assert (=> b!903988 (=> (not res!609987) (not e!506522))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53219 0))(
  ( (array!53220 (arr!25569 (Array (_ BitVec 32) (_ BitVec 64))) (size!26030 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53219)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!903988 (= res!609987 (and (= (select (arr!25569 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903989 () Bool)

(declare-fun e!506526 () Bool)

(declare-fun e!506528 () Bool)

(assert (=> b!903989 (= e!506526 e!506528)))

(declare-fun res!609988 () Bool)

(assert (=> b!903989 (=> res!609988 e!506528)))

(declare-datatypes ((V!29759 0))(
  ( (V!29760 (val!9348 Int)) )
))
(declare-datatypes ((tuple2!12168 0))(
  ( (tuple2!12169 (_1!6095 (_ BitVec 64)) (_2!6095 V!29759)) )
))
(declare-datatypes ((List!17972 0))(
  ( (Nil!17969) (Cons!17968 (h!19114 tuple2!12168) (t!25346 List!17972)) )
))
(declare-datatypes ((ListLongMap!10855 0))(
  ( (ListLongMap!10856 (toList!5443 List!17972)) )
))
(declare-fun lt!407947 () ListLongMap!10855)

(declare-fun contains!4453 (ListLongMap!10855 (_ BitVec 64)) Bool)

(assert (=> b!903989 (= res!609988 (not (contains!4453 lt!407947 k0!1033)))))

(declare-datatypes ((ValueCell!8816 0))(
  ( (ValueCellFull!8816 (v!11852 V!29759)) (EmptyCell!8816) )
))
(declare-datatypes ((array!53221 0))(
  ( (array!53222 (arr!25570 (Array (_ BitVec 32) ValueCell!8816)) (size!26031 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53221)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29759)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29759)

(declare-fun getCurrentListMap!2657 (array!53219 array!53221 (_ BitVec 32) (_ BitVec 32) V!29759 V!29759 (_ BitVec 32) Int) ListLongMap!10855)

(assert (=> b!903989 (= lt!407947 (getCurrentListMap!2657 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!903990 () Bool)

(declare-fun res!609990 () Bool)

(assert (=> b!903990 (=> (not res!609990) (not e!506522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53219 (_ BitVec 32)) Bool)

(assert (=> b!903990 (= res!609990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903991 () Bool)

(declare-fun e!506523 () Bool)

(declare-fun tp_is_empty!18595 () Bool)

(assert (=> b!903991 (= e!506523 tp_is_empty!18595)))

(declare-fun b!903992 () Bool)

(assert (=> b!903992 (= e!506528 true)))

(declare-fun lt!407946 () V!29759)

(declare-fun apply!427 (ListLongMap!10855 (_ BitVec 64)) V!29759)

(assert (=> b!903992 (= lt!407946 (apply!427 lt!407947 k0!1033))))

(declare-fun b!903993 () Bool)

(declare-fun e!506527 () Bool)

(declare-fun mapRes!29605 () Bool)

(assert (=> b!903993 (= e!506527 (and e!506523 mapRes!29605))))

(declare-fun condMapEmpty!29605 () Bool)

(declare-fun mapDefault!29605 () ValueCell!8816)

(assert (=> b!903993 (= condMapEmpty!29605 (= (arr!25570 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8816)) mapDefault!29605)))))

(declare-fun b!903994 () Bool)

(declare-fun e!506524 () Bool)

(assert (=> b!903994 (= e!506524 tp_is_empty!18595)))

(declare-fun b!903995 () Bool)

(declare-fun res!609986 () Bool)

(assert (=> b!903995 (=> (not res!609986) (not e!506522))))

(assert (=> b!903995 (= res!609986 (contains!4453 (getCurrentListMap!2657 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903996 () Bool)

(declare-fun res!609985 () Bool)

(assert (=> b!903996 (=> (not res!609985) (not e!506522))))

(assert (=> b!903996 (= res!609985 (and (= (size!26031 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26030 _keys!1386) (size!26031 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29605 () Bool)

(assert (=> mapIsEmpty!29605 mapRes!29605))

(declare-fun b!903997 () Bool)

(declare-fun res!609982 () Bool)

(assert (=> b!903997 (=> (not res!609982) (not e!506522))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903997 (= res!609982 (inRange!0 i!717 mask!1756))))

(declare-fun b!903998 () Bool)

(assert (=> b!903998 (= e!506522 (not e!506526))))

(declare-fun res!609983 () Bool)

(assert (=> b!903998 (=> res!609983 e!506526)))

(assert (=> b!903998 (= res!609983 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26030 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903998 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30602 0))(
  ( (Unit!30603) )
))
(declare-fun lt!407945 () Unit!30602)

(declare-fun lemmaKeyInListMapIsInArray!183 (array!53219 array!53221 (_ BitVec 32) (_ BitVec 32) V!29759 V!29759 (_ BitVec 64) Int) Unit!30602)

(assert (=> b!903998 (= lt!407945 (lemmaKeyInListMapIsInArray!183 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903999 () Bool)

(declare-fun res!609984 () Bool)

(assert (=> b!903999 (=> (not res!609984) (not e!506522))))

(declare-datatypes ((List!17973 0))(
  ( (Nil!17970) (Cons!17969 (h!19115 (_ BitVec 64)) (t!25347 List!17973)) )
))
(declare-fun arrayNoDuplicates!0 (array!53219 (_ BitVec 32) List!17973) Bool)

(assert (=> b!903999 (= res!609984 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17970))))

(declare-fun mapNonEmpty!29605 () Bool)

(declare-fun tp!56794 () Bool)

(assert (=> mapNonEmpty!29605 (= mapRes!29605 (and tp!56794 e!506524))))

(declare-fun mapRest!29605 () (Array (_ BitVec 32) ValueCell!8816))

(declare-fun mapKey!29605 () (_ BitVec 32))

(declare-fun mapValue!29605 () ValueCell!8816)

(assert (=> mapNonEmpty!29605 (= (arr!25570 _values!1152) (store mapRest!29605 mapKey!29605 mapValue!29605))))

(declare-fun res!609989 () Bool)

(assert (=> start!77574 (=> (not res!609989) (not e!506522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77574 (= res!609989 (validMask!0 mask!1756))))

(assert (=> start!77574 e!506522))

(declare-fun array_inv!20094 (array!53221) Bool)

(assert (=> start!77574 (and (array_inv!20094 _values!1152) e!506527)))

(assert (=> start!77574 tp!56793))

(assert (=> start!77574 true))

(assert (=> start!77574 tp_is_empty!18595))

(declare-fun array_inv!20095 (array!53219) Bool)

(assert (=> start!77574 (array_inv!20095 _keys!1386)))

(assert (= (and start!77574 res!609989) b!903996))

(assert (= (and b!903996 res!609985) b!903990))

(assert (= (and b!903990 res!609990) b!903999))

(assert (= (and b!903999 res!609984) b!903995))

(assert (= (and b!903995 res!609986) b!903997))

(assert (= (and b!903997 res!609982) b!903988))

(assert (= (and b!903988 res!609987) b!903998))

(assert (= (and b!903998 (not res!609983)) b!903989))

(assert (= (and b!903989 (not res!609988)) b!903992))

(assert (= (and b!903993 condMapEmpty!29605) mapIsEmpty!29605))

(assert (= (and b!903993 (not condMapEmpty!29605)) mapNonEmpty!29605))

(get-info :version)

(assert (= (and mapNonEmpty!29605 ((_ is ValueCellFull!8816) mapValue!29605)) b!903994))

(assert (= (and b!903993 ((_ is ValueCellFull!8816) mapDefault!29605)) b!903991))

(assert (= start!77574 b!903993))

(declare-fun m!838997 () Bool)

(assert (=> b!903992 m!838997))

(declare-fun m!838999 () Bool)

(assert (=> start!77574 m!838999))

(declare-fun m!839001 () Bool)

(assert (=> start!77574 m!839001))

(declare-fun m!839003 () Bool)

(assert (=> start!77574 m!839003))

(declare-fun m!839005 () Bool)

(assert (=> b!903990 m!839005))

(declare-fun m!839007 () Bool)

(assert (=> b!903999 m!839007))

(declare-fun m!839009 () Bool)

(assert (=> b!903997 m!839009))

(declare-fun m!839011 () Bool)

(assert (=> b!903998 m!839011))

(declare-fun m!839013 () Bool)

(assert (=> b!903998 m!839013))

(declare-fun m!839015 () Bool)

(assert (=> b!903988 m!839015))

(declare-fun m!839017 () Bool)

(assert (=> b!903989 m!839017))

(declare-fun m!839019 () Bool)

(assert (=> b!903989 m!839019))

(declare-fun m!839021 () Bool)

(assert (=> b!903995 m!839021))

(assert (=> b!903995 m!839021))

(declare-fun m!839023 () Bool)

(assert (=> b!903995 m!839023))

(declare-fun m!839025 () Bool)

(assert (=> mapNonEmpty!29605 m!839025))

(check-sat tp_is_empty!18595 b_and!26517 (not b!903992) (not start!77574) (not b!903990) (not b_next!16177) (not b!903995) (not b!903999) (not b!903989) (not b!903997) (not mapNonEmpty!29605) (not b!903998))
(check-sat b_and!26517 (not b_next!16177))
