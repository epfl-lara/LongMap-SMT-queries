; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82040 () Bool)

(assert start!82040)

(declare-fun b_free!18447 () Bool)

(declare-fun b_next!18447 () Bool)

(assert (=> start!82040 (= b_free!18447 (not b_next!18447))))

(declare-fun tp!64152 () Bool)

(declare-fun b_and!29935 () Bool)

(assert (=> start!82040 (= tp!64152 b_and!29935)))

(declare-fun res!640573 () Bool)

(declare-fun e!539154 () Bool)

(assert (=> start!82040 (=> (not res!640573) (not e!539154))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82040 (= res!640573 (validMask!0 mask!1823))))

(assert (=> start!82040 e!539154))

(assert (=> start!82040 true))

(declare-fun tp_is_empty!21063 () Bool)

(assert (=> start!82040 tp_is_empty!21063))

(declare-datatypes ((array!58225 0))(
  ( (array!58226 (arr!27991 (Array (_ BitVec 32) (_ BitVec 64))) (size!28470 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58225)

(declare-fun array_inv!21717 (array!58225) Bool)

(assert (=> start!82040 (array_inv!21717 _keys!1441)))

(declare-datatypes ((V!33067 0))(
  ( (V!33068 (val!10582 Int)) )
))
(declare-datatypes ((ValueCell!10050 0))(
  ( (ValueCellFull!10050 (v!13138 V!33067)) (EmptyCell!10050) )
))
(declare-datatypes ((array!58227 0))(
  ( (array!58228 (arr!27992 (Array (_ BitVec 32) ValueCell!10050)) (size!28471 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58227)

(declare-fun e!539151 () Bool)

(declare-fun array_inv!21718 (array!58227) Bool)

(assert (=> start!82040 (and (array_inv!21718 _values!1197) e!539151)))

(assert (=> start!82040 tp!64152))

(declare-fun b!956755 () Bool)

(declare-fun res!640572 () Bool)

(assert (=> b!956755 (=> (not res!640572) (not e!539154))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956755 (= res!640572 (validKeyInArray!0 (select (arr!27991 _keys!1441) i!735)))))

(declare-fun b!956756 () Bool)

(declare-fun res!640578 () Bool)

(assert (=> b!956756 (=> (not res!640578) (not e!539154))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!33067)

(declare-fun minValue!1139 () V!33067)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13694 0))(
  ( (tuple2!13695 (_1!6858 (_ BitVec 64)) (_2!6858 V!33067)) )
))
(declare-datatypes ((List!19493 0))(
  ( (Nil!19490) (Cons!19489 (h!20651 tuple2!13694) (t!27856 List!19493)) )
))
(declare-datatypes ((ListLongMap!12391 0))(
  ( (ListLongMap!12392 (toList!6211 List!19493)) )
))
(declare-fun contains!5310 (ListLongMap!12391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3444 (array!58225 array!58227 (_ BitVec 32) (_ BitVec 32) V!33067 V!33067 (_ BitVec 32) Int) ListLongMap!12391)

(assert (=> b!956756 (= res!640578 (contains!5310 (getCurrentListMap!3444 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27991 _keys!1441) i!735)))))

(declare-fun b!956757 () Bool)

(assert (=> b!956757 (= e!539154 (not true))))

(assert (=> b!956757 (contains!5310 (getCurrentListMap!3444 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27991 _keys!1441) i!735))))

(declare-datatypes ((Unit!32141 0))(
  ( (Unit!32142) )
))
(declare-fun lt!430250 () Unit!32141)

(declare-fun lemmaInListMapFromThenFromZero!23 (array!58225 array!58227 (_ BitVec 32) (_ BitVec 32) V!33067 V!33067 (_ BitVec 32) (_ BitVec 32) Int) Unit!32141)

(assert (=> b!956757 (= lt!430250 (lemmaInListMapFromThenFromZero!23 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapIsEmpty!33559 () Bool)

(declare-fun mapRes!33559 () Bool)

(assert (=> mapIsEmpty!33559 mapRes!33559))

(declare-fun b!956758 () Bool)

(declare-fun res!640574 () Bool)

(assert (=> b!956758 (=> (not res!640574) (not e!539154))))

(assert (=> b!956758 (= res!640574 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28470 _keys!1441))))))

(declare-fun b!956759 () Bool)

(declare-fun res!640576 () Bool)

(assert (=> b!956759 (=> (not res!640576) (not e!539154))))

(assert (=> b!956759 (= res!640576 (and (= (size!28471 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28470 _keys!1441) (size!28471 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956760 () Bool)

(declare-fun res!640575 () Bool)

(assert (=> b!956760 (=> (not res!640575) (not e!539154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58225 (_ BitVec 32)) Bool)

(assert (=> b!956760 (= res!640575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956761 () Bool)

(declare-fun e!539155 () Bool)

(assert (=> b!956761 (= e!539151 (and e!539155 mapRes!33559))))

(declare-fun condMapEmpty!33559 () Bool)

(declare-fun mapDefault!33559 () ValueCell!10050)

(assert (=> b!956761 (= condMapEmpty!33559 (= (arr!27992 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10050)) mapDefault!33559)))))

(declare-fun mapNonEmpty!33559 () Bool)

(declare-fun tp!64151 () Bool)

(declare-fun e!539153 () Bool)

(assert (=> mapNonEmpty!33559 (= mapRes!33559 (and tp!64151 e!539153))))

(declare-fun mapValue!33559 () ValueCell!10050)

(declare-fun mapRest!33559 () (Array (_ BitVec 32) ValueCell!10050))

(declare-fun mapKey!33559 () (_ BitVec 32))

(assert (=> mapNonEmpty!33559 (= (arr!27992 _values!1197) (store mapRest!33559 mapKey!33559 mapValue!33559))))

(declare-fun b!956762 () Bool)

(assert (=> b!956762 (= e!539155 tp_is_empty!21063)))

(declare-fun b!956763 () Bool)

(assert (=> b!956763 (= e!539153 tp_is_empty!21063)))

(declare-fun b!956764 () Bool)

(declare-fun res!640577 () Bool)

(assert (=> b!956764 (=> (not res!640577) (not e!539154))))

(declare-datatypes ((List!19494 0))(
  ( (Nil!19491) (Cons!19490 (h!20652 (_ BitVec 64)) (t!27857 List!19494)) )
))
(declare-fun arrayNoDuplicates!0 (array!58225 (_ BitVec 32) List!19494) Bool)

(assert (=> b!956764 (= res!640577 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19491))))

(assert (= (and start!82040 res!640573) b!956759))

(assert (= (and b!956759 res!640576) b!956760))

(assert (= (and b!956760 res!640575) b!956764))

(assert (= (and b!956764 res!640577) b!956758))

(assert (= (and b!956758 res!640574) b!956755))

(assert (= (and b!956755 res!640572) b!956756))

(assert (= (and b!956756 res!640578) b!956757))

(assert (= (and b!956761 condMapEmpty!33559) mapIsEmpty!33559))

(assert (= (and b!956761 (not condMapEmpty!33559)) mapNonEmpty!33559))

(get-info :version)

(assert (= (and mapNonEmpty!33559 ((_ is ValueCellFull!10050) mapValue!33559)) b!956763))

(assert (= (and b!956761 ((_ is ValueCellFull!10050) mapDefault!33559)) b!956762))

(assert (= start!82040 b!956761))

(declare-fun m!887943 () Bool)

(assert (=> b!956760 m!887943))

(declare-fun m!887945 () Bool)

(assert (=> b!956756 m!887945))

(declare-fun m!887947 () Bool)

(assert (=> b!956756 m!887947))

(assert (=> b!956756 m!887945))

(assert (=> b!956756 m!887947))

(declare-fun m!887949 () Bool)

(assert (=> b!956756 m!887949))

(declare-fun m!887951 () Bool)

(assert (=> mapNonEmpty!33559 m!887951))

(assert (=> b!956755 m!887947))

(assert (=> b!956755 m!887947))

(declare-fun m!887953 () Bool)

(assert (=> b!956755 m!887953))

(declare-fun m!887955 () Bool)

(assert (=> b!956757 m!887955))

(assert (=> b!956757 m!887947))

(assert (=> b!956757 m!887955))

(assert (=> b!956757 m!887947))

(declare-fun m!887957 () Bool)

(assert (=> b!956757 m!887957))

(declare-fun m!887959 () Bool)

(assert (=> b!956757 m!887959))

(declare-fun m!887961 () Bool)

(assert (=> b!956764 m!887961))

(declare-fun m!887963 () Bool)

(assert (=> start!82040 m!887963))

(declare-fun m!887965 () Bool)

(assert (=> start!82040 m!887965))

(declare-fun m!887967 () Bool)

(assert (=> start!82040 m!887967))

(check-sat (not b_next!18447) (not start!82040) (not b!956760) (not b!956757) (not b!956756) (not mapNonEmpty!33559) (not b!956764) tp_is_empty!21063 b_and!29935 (not b!956755))
(check-sat b_and!29935 (not b_next!18447))
