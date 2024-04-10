; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81838 () Bool)

(assert start!81838)

(declare-fun b_free!18333 () Bool)

(declare-fun b_next!18333 () Bool)

(assert (=> start!81838 (= b_free!18333 (not b_next!18333))))

(declare-fun tp!63698 () Bool)

(declare-fun b_and!29819 () Bool)

(assert (=> start!81838 (= tp!63698 b_and!29819)))

(declare-fun b!954373 () Bool)

(declare-fun res!639096 () Bool)

(declare-fun e!537684 () Bool)

(assert (=> b!954373 (=> (not res!639096) (not e!537684))))

(declare-datatypes ((array!57867 0))(
  ( (array!57868 (arr!27813 (Array (_ BitVec 32) (_ BitVec 64))) (size!28292 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57867)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954373 (= res!639096 (validKeyInArray!0 (select (arr!27813 _keys!1441) i!735)))))

(declare-fun b!954374 () Bool)

(declare-fun res!639094 () Bool)

(assert (=> b!954374 (=> (not res!639094) (not e!537684))))

(assert (=> b!954374 (= res!639094 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28292 _keys!1441))))))

(declare-fun b!954375 () Bool)

(declare-fun res!639091 () Bool)

(assert (=> b!954375 (=> (not res!639091) (not e!537684))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32819 0))(
  ( (V!32820 (val!10489 Int)) )
))
(declare-datatypes ((ValueCell!9957 0))(
  ( (ValueCellFull!9957 (v!13044 V!32819)) (EmptyCell!9957) )
))
(declare-datatypes ((array!57869 0))(
  ( (array!57870 (arr!27814 (Array (_ BitVec 32) ValueCell!9957)) (size!28293 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57869)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954375 (= res!639091 (and (= (size!28293 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28292 _keys!1441) (size!28293 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954376 () Bool)

(declare-fun e!537685 () Bool)

(declare-fun tp_is_empty!20877 () Bool)

(assert (=> b!954376 (= e!537685 tp_is_empty!20877)))

(declare-fun res!639095 () Bool)

(assert (=> start!81838 (=> (not res!639095) (not e!537684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81838 (= res!639095 (validMask!0 mask!1823))))

(assert (=> start!81838 e!537684))

(assert (=> start!81838 true))

(assert (=> start!81838 tp_is_empty!20877))

(declare-fun array_inv!21593 (array!57867) Bool)

(assert (=> start!81838 (array_inv!21593 _keys!1441)))

(declare-fun e!537686 () Bool)

(declare-fun array_inv!21594 (array!57869) Bool)

(assert (=> start!81838 (and (array_inv!21594 _values!1197) e!537686)))

(assert (=> start!81838 tp!63698))

(declare-fun b!954377 () Bool)

(assert (=> b!954377 (= e!537684 false)))

(declare-fun zeroValue!1139 () V!32819)

(declare-fun lt!429893 () Bool)

(declare-fun minValue!1139 () V!32819)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13614 0))(
  ( (tuple2!13615 (_1!6818 (_ BitVec 64)) (_2!6818 V!32819)) )
))
(declare-datatypes ((List!19394 0))(
  ( (Nil!19391) (Cons!19390 (h!20552 tuple2!13614) (t!27755 List!19394)) )
))
(declare-datatypes ((ListLongMap!12311 0))(
  ( (ListLongMap!12312 (toList!6171 List!19394)) )
))
(declare-fun contains!5269 (ListLongMap!12311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3404 (array!57867 array!57869 (_ BitVec 32) (_ BitVec 32) V!32819 V!32819 (_ BitVec 32) Int) ListLongMap!12311)

(assert (=> b!954377 (= lt!429893 (contains!5269 (getCurrentListMap!3404 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27813 _keys!1441) i!735)))))

(declare-fun b!954378 () Bool)

(declare-fun res!639093 () Bool)

(assert (=> b!954378 (=> (not res!639093) (not e!537684))))

(declare-datatypes ((List!19395 0))(
  ( (Nil!19392) (Cons!19391 (h!20553 (_ BitVec 64)) (t!27756 List!19395)) )
))
(declare-fun arrayNoDuplicates!0 (array!57867 (_ BitVec 32) List!19395) Bool)

(assert (=> b!954378 (= res!639093 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19392))))

(declare-fun mapNonEmpty!33277 () Bool)

(declare-fun mapRes!33277 () Bool)

(declare-fun tp!63699 () Bool)

(declare-fun e!537687 () Bool)

(assert (=> mapNonEmpty!33277 (= mapRes!33277 (and tp!63699 e!537687))))

(declare-fun mapRest!33277 () (Array (_ BitVec 32) ValueCell!9957))

(declare-fun mapKey!33277 () (_ BitVec 32))

(declare-fun mapValue!33277 () ValueCell!9957)

(assert (=> mapNonEmpty!33277 (= (arr!27814 _values!1197) (store mapRest!33277 mapKey!33277 mapValue!33277))))

(declare-fun b!954379 () Bool)

(assert (=> b!954379 (= e!537686 (and e!537685 mapRes!33277))))

(declare-fun condMapEmpty!33277 () Bool)

(declare-fun mapDefault!33277 () ValueCell!9957)

(assert (=> b!954379 (= condMapEmpty!33277 (= (arr!27814 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9957)) mapDefault!33277)))))

(declare-fun b!954380 () Bool)

(assert (=> b!954380 (= e!537687 tp_is_empty!20877)))

(declare-fun b!954381 () Bool)

(declare-fun res!639092 () Bool)

(assert (=> b!954381 (=> (not res!639092) (not e!537684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57867 (_ BitVec 32)) Bool)

(assert (=> b!954381 (= res!639092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33277 () Bool)

(assert (=> mapIsEmpty!33277 mapRes!33277))

(assert (= (and start!81838 res!639095) b!954375))

(assert (= (and b!954375 res!639091) b!954381))

(assert (= (and b!954381 res!639092) b!954378))

(assert (= (and b!954378 res!639093) b!954374))

(assert (= (and b!954374 res!639094) b!954373))

(assert (= (and b!954373 res!639096) b!954377))

(assert (= (and b!954379 condMapEmpty!33277) mapIsEmpty!33277))

(assert (= (and b!954379 (not condMapEmpty!33277)) mapNonEmpty!33277))

(get-info :version)

(assert (= (and mapNonEmpty!33277 ((_ is ValueCellFull!9957) mapValue!33277)) b!954380))

(assert (= (and b!954379 ((_ is ValueCellFull!9957) mapDefault!33277)) b!954376))

(assert (= start!81838 b!954379))

(declare-fun m!886123 () Bool)

(assert (=> b!954373 m!886123))

(assert (=> b!954373 m!886123))

(declare-fun m!886125 () Bool)

(assert (=> b!954373 m!886125))

(declare-fun m!886127 () Bool)

(assert (=> mapNonEmpty!33277 m!886127))

(declare-fun m!886129 () Bool)

(assert (=> b!954378 m!886129))

(declare-fun m!886131 () Bool)

(assert (=> b!954381 m!886131))

(declare-fun m!886133 () Bool)

(assert (=> b!954377 m!886133))

(assert (=> b!954377 m!886123))

(assert (=> b!954377 m!886133))

(assert (=> b!954377 m!886123))

(declare-fun m!886135 () Bool)

(assert (=> b!954377 m!886135))

(declare-fun m!886137 () Bool)

(assert (=> start!81838 m!886137))

(declare-fun m!886139 () Bool)

(assert (=> start!81838 m!886139))

(declare-fun m!886141 () Bool)

(assert (=> start!81838 m!886141))

(check-sat tp_is_empty!20877 (not b!954378) (not b!954377) (not start!81838) (not b_next!18333) (not b!954381) (not mapNonEmpty!33277) (not b!954373) b_and!29819)
(check-sat b_and!29819 (not b_next!18333))
