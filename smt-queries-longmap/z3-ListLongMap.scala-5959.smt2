; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77748 () Bool)

(assert start!77748)

(declare-fun b_free!16165 () Bool)

(declare-fun b_next!16165 () Bool)

(assert (=> start!77748 (= b_free!16165 (not b_next!16165))))

(declare-fun tp!56757 () Bool)

(declare-fun b_and!26541 () Bool)

(assert (=> start!77748 (= tp!56757 b_and!26541)))

(declare-fun mapIsEmpty!29587 () Bool)

(declare-fun mapRes!29587 () Bool)

(assert (=> mapIsEmpty!29587 mapRes!29587))

(declare-fun b!904914 () Bool)

(declare-fun res!610280 () Bool)

(declare-fun e!507128 () Bool)

(assert (=> b!904914 (=> (not res!610280) (not e!507128))))

(declare-datatypes ((array!53257 0))(
  ( (array!53258 (arr!25583 (Array (_ BitVec 32) (_ BitVec 64))) (size!26043 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53257)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53257 (_ BitVec 32)) Bool)

(assert (=> b!904914 (= res!610280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904915 () Bool)

(declare-fun res!610279 () Bool)

(assert (=> b!904915 (=> (not res!610279) (not e!507128))))

(declare-datatypes ((V!29743 0))(
  ( (V!29744 (val!9342 Int)) )
))
(declare-datatypes ((ValueCell!8810 0))(
  ( (ValueCellFull!8810 (v!11844 V!29743)) (EmptyCell!8810) )
))
(declare-datatypes ((array!53259 0))(
  ( (array!53260 (arr!25584 (Array (_ BitVec 32) ValueCell!8810)) (size!26044 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53259)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!904915 (= res!610279 (and (= (size!26044 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26043 _keys!1386) (size!26044 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904916 () Bool)

(declare-fun res!610277 () Bool)

(assert (=> b!904916 (=> (not res!610277) (not e!507128))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904916 (= res!610277 (inRange!0 i!717 mask!1756))))

(declare-fun res!610281 () Bool)

(assert (=> start!77748 (=> (not res!610281) (not e!507128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77748 (= res!610281 (validMask!0 mask!1756))))

(assert (=> start!77748 e!507128))

(declare-fun e!507131 () Bool)

(declare-fun array_inv!20110 (array!53259) Bool)

(assert (=> start!77748 (and (array_inv!20110 _values!1152) e!507131)))

(assert (=> start!77748 tp!56757))

(assert (=> start!77748 true))

(declare-fun tp_is_empty!18583 () Bool)

(assert (=> start!77748 tp_is_empty!18583))

(declare-fun array_inv!20111 (array!53257) Bool)

(assert (=> start!77748 (array_inv!20111 _keys!1386)))

(declare-fun b!904917 () Bool)

(declare-fun e!507130 () Bool)

(assert (=> b!904917 (= e!507128 (not e!507130))))

(declare-fun res!610275 () Bool)

(assert (=> b!904917 (=> res!610275 e!507130)))

(assert (=> b!904917 (= res!610275 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26043 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904917 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29743)

(declare-fun minValue!1094 () V!29743)

(declare-datatypes ((Unit!30660 0))(
  ( (Unit!30661) )
))
(declare-fun lt!408490 () Unit!30660)

(declare-fun lemmaKeyInListMapIsInArray!177 (array!53257 array!53259 (_ BitVec 32) (_ BitVec 32) V!29743 V!29743 (_ BitVec 64) Int) Unit!30660)

(assert (=> b!904917 (= lt!408490 (lemmaKeyInListMapIsInArray!177 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904918 () Bool)

(declare-fun res!610276 () Bool)

(assert (=> b!904918 (=> (not res!610276) (not e!507128))))

(assert (=> b!904918 (= res!610276 (and (= (select (arr!25583 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904919 () Bool)

(declare-fun e!507127 () Bool)

(assert (=> b!904919 (= e!507127 tp_is_empty!18583)))

(declare-fun b!904920 () Bool)

(declare-fun res!610274 () Bool)

(assert (=> b!904920 (=> (not res!610274) (not e!507128))))

(declare-datatypes ((tuple2!12066 0))(
  ( (tuple2!12067 (_1!6044 (_ BitVec 64)) (_2!6044 V!29743)) )
))
(declare-datatypes ((List!17918 0))(
  ( (Nil!17915) (Cons!17914 (h!19066 tuple2!12066) (t!25293 List!17918)) )
))
(declare-datatypes ((ListLongMap!10765 0))(
  ( (ListLongMap!10766 (toList!5398 List!17918)) )
))
(declare-fun contains!4456 (ListLongMap!10765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2667 (array!53257 array!53259 (_ BitVec 32) (_ BitVec 32) V!29743 V!29743 (_ BitVec 32) Int) ListLongMap!10765)

(assert (=> b!904920 (= res!610274 (contains!4456 (getCurrentListMap!2667 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904921 () Bool)

(declare-fun e!507132 () Bool)

(assert (=> b!904921 (= e!507132 tp_is_empty!18583)))

(declare-fun b!904922 () Bool)

(declare-fun res!610278 () Bool)

(assert (=> b!904922 (=> (not res!610278) (not e!507128))))

(declare-datatypes ((List!17919 0))(
  ( (Nil!17916) (Cons!17915 (h!19067 (_ BitVec 64)) (t!25294 List!17919)) )
))
(declare-fun arrayNoDuplicates!0 (array!53257 (_ BitVec 32) List!17919) Bool)

(assert (=> b!904922 (= res!610278 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17916))))

(declare-fun b!904923 () Bool)

(declare-fun e!507126 () Bool)

(assert (=> b!904923 (= e!507126 true)))

(declare-fun lt!408488 () V!29743)

(declare-fun lt!408489 () ListLongMap!10765)

(declare-fun apply!426 (ListLongMap!10765 (_ BitVec 64)) V!29743)

(assert (=> b!904923 (= lt!408488 (apply!426 lt!408489 k0!1033))))

(declare-fun b!904924 () Bool)

(assert (=> b!904924 (= e!507131 (and e!507132 mapRes!29587))))

(declare-fun condMapEmpty!29587 () Bool)

(declare-fun mapDefault!29587 () ValueCell!8810)

(assert (=> b!904924 (= condMapEmpty!29587 (= (arr!25584 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8810)) mapDefault!29587)))))

(declare-fun mapNonEmpty!29587 () Bool)

(declare-fun tp!56758 () Bool)

(assert (=> mapNonEmpty!29587 (= mapRes!29587 (and tp!56758 e!507127))))

(declare-fun mapKey!29587 () (_ BitVec 32))

(declare-fun mapRest!29587 () (Array (_ BitVec 32) ValueCell!8810))

(declare-fun mapValue!29587 () ValueCell!8810)

(assert (=> mapNonEmpty!29587 (= (arr!25584 _values!1152) (store mapRest!29587 mapKey!29587 mapValue!29587))))

(declare-fun b!904925 () Bool)

(assert (=> b!904925 (= e!507130 e!507126)))

(declare-fun res!610282 () Bool)

(assert (=> b!904925 (=> res!610282 e!507126)))

(assert (=> b!904925 (= res!610282 (not (contains!4456 lt!408489 k0!1033)))))

(assert (=> b!904925 (= lt!408489 (getCurrentListMap!2667 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77748 res!610281) b!904915))

(assert (= (and b!904915 res!610279) b!904914))

(assert (= (and b!904914 res!610280) b!904922))

(assert (= (and b!904922 res!610278) b!904920))

(assert (= (and b!904920 res!610274) b!904916))

(assert (= (and b!904916 res!610277) b!904918))

(assert (= (and b!904918 res!610276) b!904917))

(assert (= (and b!904917 (not res!610275)) b!904925))

(assert (= (and b!904925 (not res!610282)) b!904923))

(assert (= (and b!904924 condMapEmpty!29587) mapIsEmpty!29587))

(assert (= (and b!904924 (not condMapEmpty!29587)) mapNonEmpty!29587))

(get-info :version)

(assert (= (and mapNonEmpty!29587 ((_ is ValueCellFull!8810) mapValue!29587)) b!904919))

(assert (= (and b!904924 ((_ is ValueCellFull!8810) mapDefault!29587)) b!904921))

(assert (= start!77748 b!904924))

(declare-fun m!840869 () Bool)

(assert (=> b!904920 m!840869))

(assert (=> b!904920 m!840869))

(declare-fun m!840871 () Bool)

(assert (=> b!904920 m!840871))

(declare-fun m!840873 () Bool)

(assert (=> start!77748 m!840873))

(declare-fun m!840875 () Bool)

(assert (=> start!77748 m!840875))

(declare-fun m!840877 () Bool)

(assert (=> start!77748 m!840877))

(declare-fun m!840879 () Bool)

(assert (=> mapNonEmpty!29587 m!840879))

(declare-fun m!840881 () Bool)

(assert (=> b!904917 m!840881))

(declare-fun m!840883 () Bool)

(assert (=> b!904917 m!840883))

(declare-fun m!840885 () Bool)

(assert (=> b!904922 m!840885))

(declare-fun m!840887 () Bool)

(assert (=> b!904923 m!840887))

(declare-fun m!840889 () Bool)

(assert (=> b!904914 m!840889))

(declare-fun m!840891 () Bool)

(assert (=> b!904916 m!840891))

(declare-fun m!840893 () Bool)

(assert (=> b!904925 m!840893))

(declare-fun m!840895 () Bool)

(assert (=> b!904925 m!840895))

(declare-fun m!840897 () Bool)

(assert (=> b!904918 m!840897))

(check-sat b_and!26541 (not b!904914) (not b!904923) (not b!904920) (not b!904925) (not b!904916) (not start!77748) tp_is_empty!18583 (not b_next!16165) (not mapNonEmpty!29587) (not b!904922) (not b!904917))
(check-sat b_and!26541 (not b_next!16165))
