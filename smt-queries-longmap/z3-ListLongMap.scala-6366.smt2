; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81934 () Bool)

(assert start!81934)

(declare-fun b_free!18429 () Bool)

(declare-fun b_next!18429 () Bool)

(assert (=> start!81934 (= b_free!18429 (not b_next!18429))))

(declare-fun tp!63987 () Bool)

(declare-fun b_and!29915 () Bool)

(assert (=> start!81934 (= tp!63987 b_and!29915)))

(declare-fun b!955737 () Bool)

(declare-fun e!538408 () Bool)

(declare-fun e!538404 () Bool)

(declare-fun mapRes!33421 () Bool)

(assert (=> b!955737 (= e!538408 (and e!538404 mapRes!33421))))

(declare-fun condMapEmpty!33421 () Bool)

(declare-datatypes ((V!32947 0))(
  ( (V!32948 (val!10537 Int)) )
))
(declare-datatypes ((ValueCell!10005 0))(
  ( (ValueCellFull!10005 (v!13092 V!32947)) (EmptyCell!10005) )
))
(declare-datatypes ((array!58049 0))(
  ( (array!58050 (arr!27904 (Array (_ BitVec 32) ValueCell!10005)) (size!28383 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58049)

(declare-fun mapDefault!33421 () ValueCell!10005)

(assert (=> b!955737 (= condMapEmpty!33421 (= (arr!27904 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10005)) mapDefault!33421)))))

(declare-fun b!955738 () Bool)

(declare-fun res!640023 () Bool)

(declare-fun e!538407 () Bool)

(assert (=> b!955738 (=> (not res!640023) (not e!538407))))

(declare-datatypes ((array!58051 0))(
  ( (array!58052 (arr!27905 (Array (_ BitVec 32) (_ BitVec 64))) (size!28384 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58051)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58051 (_ BitVec 32)) Bool)

(assert (=> b!955738 (= res!640023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955739 () Bool)

(declare-fun res!640025 () Bool)

(assert (=> b!955739 (=> (not res!640025) (not e!538407))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32947)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32947)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13676 0))(
  ( (tuple2!13677 (_1!6849 (_ BitVec 64)) (_2!6849 V!32947)) )
))
(declare-datatypes ((List!19449 0))(
  ( (Nil!19446) (Cons!19445 (h!20607 tuple2!13676) (t!27810 List!19449)) )
))
(declare-datatypes ((ListLongMap!12373 0))(
  ( (ListLongMap!12374 (toList!6202 List!19449)) )
))
(declare-fun contains!5300 (ListLongMap!12373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3435 (array!58051 array!58049 (_ BitVec 32) (_ BitVec 32) V!32947 V!32947 (_ BitVec 32) Int) ListLongMap!12373)

(assert (=> b!955739 (= res!640025 (contains!5300 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27905 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33421 () Bool)

(assert (=> mapIsEmpty!33421 mapRes!33421))

(declare-fun b!955740 () Bool)

(declare-fun res!640027 () Bool)

(assert (=> b!955740 (=> (not res!640027) (not e!538407))))

(assert (=> b!955740 (= res!640027 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28384 _keys!1441))))))

(declare-fun mapNonEmpty!33421 () Bool)

(declare-fun tp!63986 () Bool)

(declare-fun e!538405 () Bool)

(assert (=> mapNonEmpty!33421 (= mapRes!33421 (and tp!63986 e!538405))))

(declare-fun mapRest!33421 () (Array (_ BitVec 32) ValueCell!10005))

(declare-fun mapKey!33421 () (_ BitVec 32))

(declare-fun mapValue!33421 () ValueCell!10005)

(assert (=> mapNonEmpty!33421 (= (arr!27904 _values!1197) (store mapRest!33421 mapKey!33421 mapValue!33421))))

(declare-fun b!955741 () Bool)

(declare-fun res!640029 () Bool)

(assert (=> b!955741 (=> (not res!640029) (not e!538407))))

(assert (=> b!955741 (= res!640029 (and (= (size!28383 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28384 _keys!1441) (size!28383 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955742 () Bool)

(declare-fun res!640028 () Bool)

(assert (=> b!955742 (=> (not res!640028) (not e!538407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955742 (= res!640028 (validKeyInArray!0 (select (arr!27905 _keys!1441) i!735)))))

(declare-fun res!640026 () Bool)

(assert (=> start!81934 (=> (not res!640026) (not e!538407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81934 (= res!640026 (validMask!0 mask!1823))))

(assert (=> start!81934 e!538407))

(assert (=> start!81934 true))

(declare-fun tp_is_empty!20973 () Bool)

(assert (=> start!81934 tp_is_empty!20973))

(declare-fun array_inv!21651 (array!58051) Bool)

(assert (=> start!81934 (array_inv!21651 _keys!1441)))

(declare-fun array_inv!21652 (array!58049) Bool)

(assert (=> start!81934 (and (array_inv!21652 _values!1197) e!538408)))

(assert (=> start!81934 tp!63987))

(declare-fun b!955743 () Bool)

(declare-fun res!640024 () Bool)

(assert (=> b!955743 (=> (not res!640024) (not e!538407))))

(declare-datatypes ((List!19450 0))(
  ( (Nil!19447) (Cons!19446 (h!20608 (_ BitVec 64)) (t!27811 List!19450)) )
))
(declare-fun arrayNoDuplicates!0 (array!58051 (_ BitVec 32) List!19450) Bool)

(assert (=> b!955743 (= res!640024 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19447))))

(declare-fun b!955744 () Bool)

(assert (=> b!955744 (= e!538405 tp_is_empty!20973)))

(declare-fun b!955745 () Bool)

(assert (=> b!955745 (= e!538407 (not true))))

(assert (=> b!955745 (contains!5300 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27905 _keys!1441) i!735))))

(declare-datatypes ((Unit!32125 0))(
  ( (Unit!32126) )
))
(declare-fun lt!430037 () Unit!32125)

(declare-fun lemmaInListMapFromThenFromZero!17 (array!58051 array!58049 (_ BitVec 32) (_ BitVec 32) V!32947 V!32947 (_ BitVec 32) (_ BitVec 32) Int) Unit!32125)

(assert (=> b!955745 (= lt!430037 (lemmaInListMapFromThenFromZero!17 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955746 () Bool)

(assert (=> b!955746 (= e!538404 tp_is_empty!20973)))

(assert (= (and start!81934 res!640026) b!955741))

(assert (= (and b!955741 res!640029) b!955738))

(assert (= (and b!955738 res!640023) b!955743))

(assert (= (and b!955743 res!640024) b!955740))

(assert (= (and b!955740 res!640027) b!955742))

(assert (= (and b!955742 res!640028) b!955739))

(assert (= (and b!955739 res!640025) b!955745))

(assert (= (and b!955737 condMapEmpty!33421) mapIsEmpty!33421))

(assert (= (and b!955737 (not condMapEmpty!33421)) mapNonEmpty!33421))

(get-info :version)

(assert (= (and mapNonEmpty!33421 ((_ is ValueCellFull!10005) mapValue!33421)) b!955744))

(assert (= (and b!955737 ((_ is ValueCellFull!10005) mapDefault!33421)) b!955746))

(assert (= start!81934 b!955737))

(declare-fun m!887215 () Bool)

(assert (=> b!955743 m!887215))

(declare-fun m!887217 () Bool)

(assert (=> b!955738 m!887217))

(declare-fun m!887219 () Bool)

(assert (=> start!81934 m!887219))

(declare-fun m!887221 () Bool)

(assert (=> start!81934 m!887221))

(declare-fun m!887223 () Bool)

(assert (=> start!81934 m!887223))

(declare-fun m!887225 () Bool)

(assert (=> mapNonEmpty!33421 m!887225))

(declare-fun m!887227 () Bool)

(assert (=> b!955742 m!887227))

(assert (=> b!955742 m!887227))

(declare-fun m!887229 () Bool)

(assert (=> b!955742 m!887229))

(declare-fun m!887231 () Bool)

(assert (=> b!955745 m!887231))

(assert (=> b!955745 m!887227))

(assert (=> b!955745 m!887231))

(assert (=> b!955745 m!887227))

(declare-fun m!887233 () Bool)

(assert (=> b!955745 m!887233))

(declare-fun m!887235 () Bool)

(assert (=> b!955745 m!887235))

(declare-fun m!887237 () Bool)

(assert (=> b!955739 m!887237))

(assert (=> b!955739 m!887227))

(assert (=> b!955739 m!887237))

(assert (=> b!955739 m!887227))

(declare-fun m!887239 () Bool)

(assert (=> b!955739 m!887239))

(check-sat (not mapNonEmpty!33421) tp_is_empty!20973 (not b_next!18429) (not start!81934) (not b!955738) (not b!955739) (not b!955745) b_and!29915 (not b!955742) (not b!955743))
(check-sat b_and!29915 (not b_next!18429))
