; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82020 () Bool)

(assert start!82020)

(declare-fun b_free!18445 () Bool)

(declare-fun b_next!18445 () Bool)

(assert (=> start!82020 (= b_free!18445 (not b_next!18445))))

(declare-fun tp!64146 () Bool)

(declare-fun b_and!29907 () Bool)

(assert (=> start!82020 (= tp!64146 b_and!29907)))

(declare-fun b!956486 () Bool)

(declare-fun res!640447 () Bool)

(declare-fun e!538989 () Bool)

(assert (=> b!956486 (=> (not res!640447) (not e!538989))))

(declare-datatypes ((array!58166 0))(
  ( (array!58167 (arr!27962 (Array (_ BitVec 32) (_ BitVec 64))) (size!28443 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58166)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956486 (= res!640447 (validKeyInArray!0 (select (arr!27962 _keys!1441) i!735)))))

(declare-fun b!956487 () Bool)

(declare-fun res!640445 () Bool)

(assert (=> b!956487 (=> (not res!640445) (not e!538989))))

(declare-datatypes ((List!19503 0))(
  ( (Nil!19500) (Cons!19499 (h!20661 (_ BitVec 64)) (t!27857 List!19503)) )
))
(declare-fun arrayNoDuplicates!0 (array!58166 (_ BitVec 32) List!19503) Bool)

(assert (=> b!956487 (= res!640445 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19500))))

(declare-fun b!956488 () Bool)

(declare-fun res!640443 () Bool)

(assert (=> b!956488 (=> (not res!640443) (not e!538989))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33065 0))(
  ( (V!33066 (val!10581 Int)) )
))
(declare-datatypes ((ValueCell!10049 0))(
  ( (ValueCellFull!10049 (v!13136 V!33065)) (EmptyCell!10049) )
))
(declare-datatypes ((array!58168 0))(
  ( (array!58169 (arr!27963 (Array (_ BitVec 32) ValueCell!10049)) (size!28444 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58168)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956488 (= res!640443 (and (= (size!28444 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28443 _keys!1441) (size!28444 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956489 () Bool)

(declare-fun res!640441 () Bool)

(assert (=> b!956489 (=> (not res!640441) (not e!538989))))

(declare-fun zeroValue!1139 () V!33065)

(declare-fun minValue!1139 () V!33065)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13744 0))(
  ( (tuple2!13745 (_1!6883 (_ BitVec 64)) (_2!6883 V!33065)) )
))
(declare-datatypes ((List!19504 0))(
  ( (Nil!19501) (Cons!19500 (h!20662 tuple2!13744) (t!27858 List!19504)) )
))
(declare-datatypes ((ListLongMap!12431 0))(
  ( (ListLongMap!12432 (toList!6231 List!19504)) )
))
(declare-fun contains!5273 (ListLongMap!12431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3393 (array!58166 array!58168 (_ BitVec 32) (_ BitVec 32) V!33065 V!33065 (_ BitVec 32) Int) ListLongMap!12431)

(assert (=> b!956489 (= res!640441 (contains!5273 (getCurrentListMap!3393 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27962 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33556 () Bool)

(declare-fun mapRes!33556 () Bool)

(declare-fun tp!64147 () Bool)

(declare-fun e!538988 () Bool)

(assert (=> mapNonEmpty!33556 (= mapRes!33556 (and tp!64147 e!538988))))

(declare-fun mapKey!33556 () (_ BitVec 32))

(declare-fun mapRest!33556 () (Array (_ BitVec 32) ValueCell!10049))

(declare-fun mapValue!33556 () ValueCell!10049)

(assert (=> mapNonEmpty!33556 (= (arr!27963 _values!1197) (store mapRest!33556 mapKey!33556 mapValue!33556))))

(declare-fun b!956490 () Bool)

(declare-fun e!538990 () Bool)

(declare-fun e!538992 () Bool)

(assert (=> b!956490 (= e!538990 (and e!538992 mapRes!33556))))

(declare-fun condMapEmpty!33556 () Bool)

(declare-fun mapDefault!33556 () ValueCell!10049)

(assert (=> b!956490 (= condMapEmpty!33556 (= (arr!27963 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10049)) mapDefault!33556)))))

(declare-fun res!640442 () Bool)

(assert (=> start!82020 (=> (not res!640442) (not e!538989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82020 (= res!640442 (validMask!0 mask!1823))))

(assert (=> start!82020 e!538989))

(assert (=> start!82020 true))

(declare-fun tp_is_empty!21061 () Bool)

(assert (=> start!82020 tp_is_empty!21061))

(declare-fun array_inv!21757 (array!58166) Bool)

(assert (=> start!82020 (array_inv!21757 _keys!1441)))

(declare-fun array_inv!21758 (array!58168) Bool)

(assert (=> start!82020 (and (array_inv!21758 _values!1197) e!538990)))

(assert (=> start!82020 tp!64146))

(declare-fun b!956491 () Bool)

(declare-fun res!640446 () Bool)

(assert (=> b!956491 (=> (not res!640446) (not e!538989))))

(assert (=> b!956491 (= res!640446 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28443 _keys!1441))))))

(declare-fun mapIsEmpty!33556 () Bool)

(assert (=> mapIsEmpty!33556 mapRes!33556))

(declare-fun b!956492 () Bool)

(assert (=> b!956492 (= e!538989 (not true))))

(assert (=> b!956492 (contains!5273 (getCurrentListMap!3393 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27962 _keys!1441) i!735))))

(declare-datatypes ((Unit!32006 0))(
  ( (Unit!32007) )
))
(declare-fun lt!430011 () Unit!32006)

(declare-fun lemmaInListMapFromThenFromZero!20 (array!58166 array!58168 (_ BitVec 32) (_ BitVec 32) V!33065 V!33065 (_ BitVec 32) (_ BitVec 32) Int) Unit!32006)

(assert (=> b!956492 (= lt!430011 (lemmaInListMapFromThenFromZero!20 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956493 () Bool)

(assert (=> b!956493 (= e!538992 tp_is_empty!21061)))

(declare-fun b!956494 () Bool)

(assert (=> b!956494 (= e!538988 tp_is_empty!21061)))

(declare-fun b!956495 () Bool)

(declare-fun res!640444 () Bool)

(assert (=> b!956495 (=> (not res!640444) (not e!538989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58166 (_ BitVec 32)) Bool)

(assert (=> b!956495 (= res!640444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82020 res!640442) b!956488))

(assert (= (and b!956488 res!640443) b!956495))

(assert (= (and b!956495 res!640444) b!956487))

(assert (= (and b!956487 res!640445) b!956491))

(assert (= (and b!956491 res!640446) b!956486))

(assert (= (and b!956486 res!640447) b!956489))

(assert (= (and b!956489 res!640441) b!956492))

(assert (= (and b!956490 condMapEmpty!33556) mapIsEmpty!33556))

(assert (= (and b!956490 (not condMapEmpty!33556)) mapNonEmpty!33556))

(get-info :version)

(assert (= (and mapNonEmpty!33556 ((_ is ValueCellFull!10049) mapValue!33556)) b!956494))

(assert (= (and b!956490 ((_ is ValueCellFull!10049) mapDefault!33556)) b!956493))

(assert (= start!82020 b!956490))

(declare-fun m!887159 () Bool)

(assert (=> start!82020 m!887159))

(declare-fun m!887161 () Bool)

(assert (=> start!82020 m!887161))

(declare-fun m!887163 () Bool)

(assert (=> start!82020 m!887163))

(declare-fun m!887165 () Bool)

(assert (=> b!956495 m!887165))

(declare-fun m!887167 () Bool)

(assert (=> b!956489 m!887167))

(declare-fun m!887169 () Bool)

(assert (=> b!956489 m!887169))

(assert (=> b!956489 m!887167))

(assert (=> b!956489 m!887169))

(declare-fun m!887171 () Bool)

(assert (=> b!956489 m!887171))

(assert (=> b!956486 m!887169))

(assert (=> b!956486 m!887169))

(declare-fun m!887173 () Bool)

(assert (=> b!956486 m!887173))

(declare-fun m!887175 () Bool)

(assert (=> mapNonEmpty!33556 m!887175))

(declare-fun m!887177 () Bool)

(assert (=> b!956492 m!887177))

(assert (=> b!956492 m!887169))

(assert (=> b!956492 m!887177))

(assert (=> b!956492 m!887169))

(declare-fun m!887179 () Bool)

(assert (=> b!956492 m!887179))

(declare-fun m!887181 () Bool)

(assert (=> b!956492 m!887181))

(declare-fun m!887183 () Bool)

(assert (=> b!956487 m!887183))

(check-sat (not b!956487) (not b!956486) tp_is_empty!21061 (not b!956492) (not b!956489) (not mapNonEmpty!33556) (not b!956495) b_and!29907 (not start!82020) (not b_next!18445))
(check-sat b_and!29907 (not b_next!18445))
