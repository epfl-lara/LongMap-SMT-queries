; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108112 () Bool)

(assert start!108112)

(declare-fun b_free!27825 () Bool)

(declare-fun b_next!27825 () Bool)

(assert (=> start!108112 (= b_free!27825 (not b_next!27825))))

(declare-fun tp!98429 () Bool)

(declare-fun b_and!45881 () Bool)

(assert (=> start!108112 (= tp!98429 b_and!45881)))

(declare-fun b!1276733 () Bool)

(declare-fun e!729093 () Bool)

(declare-fun tp_is_empty!33375 () Bool)

(assert (=> b!1276733 (= e!729093 tp_is_empty!33375)))

(declare-fun res!848454 () Bool)

(declare-fun e!729095 () Bool)

(assert (=> start!108112 (=> (not res!848454) (not e!729095))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108112 (= res!848454 (validMask!0 mask!1805))))

(assert (=> start!108112 e!729095))

(assert (=> start!108112 true))

(assert (=> start!108112 tp!98429))

(assert (=> start!108112 tp_is_empty!33375))

(declare-datatypes ((V!49603 0))(
  ( (V!49604 (val!16762 Int)) )
))
(declare-datatypes ((ValueCell!15789 0))(
  ( (ValueCellFull!15789 (v!19359 V!49603)) (EmptyCell!15789) )
))
(declare-datatypes ((array!83842 0))(
  ( (array!83843 (arr!40432 (Array (_ BitVec 32) ValueCell!15789)) (size!40982 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83842)

(declare-fun e!729096 () Bool)

(declare-fun array_inv!30725 (array!83842) Bool)

(assert (=> start!108112 (and (array_inv!30725 _values!1187) e!729096)))

(declare-datatypes ((array!83844 0))(
  ( (array!83845 (arr!40433 (Array (_ BitVec 32) (_ BitVec 64))) (size!40983 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83844)

(declare-fun array_inv!30726 (array!83844) Bool)

(assert (=> start!108112 (array_inv!30726 _keys!1427)))

(declare-fun b!1276734 () Bool)

(declare-fun res!848452 () Bool)

(assert (=> b!1276734 (=> (not res!848452) (not e!729095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83844 (_ BitVec 32)) Bool)

(assert (=> b!1276734 (= res!848452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276735 () Bool)

(declare-fun res!848451 () Bool)

(assert (=> b!1276735 (=> (not res!848451) (not e!729095))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276735 (= res!848451 (and (= (size!40982 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40983 _keys!1427) (size!40982 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276736 () Bool)

(assert (=> b!1276736 (= e!729095 false)))

(declare-fun lt!575530 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49603)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49603)

(declare-datatypes ((tuple2!21496 0))(
  ( (tuple2!21497 (_1!10759 (_ BitVec 64)) (_2!10759 V!49603)) )
))
(declare-datatypes ((List!28671 0))(
  ( (Nil!28668) (Cons!28667 (h!29876 tuple2!21496) (t!42207 List!28671)) )
))
(declare-datatypes ((ListLongMap!19153 0))(
  ( (ListLongMap!19154 (toList!9592 List!28671)) )
))
(declare-fun contains!7701 (ListLongMap!19153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4676 (array!83844 array!83842 (_ BitVec 32) (_ BitVec 32) V!49603 V!49603 (_ BitVec 32) Int) ListLongMap!19153)

(assert (=> b!1276736 (= lt!575530 (contains!7701 (getCurrentListMap!4676 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276737 () Bool)

(declare-fun e!729092 () Bool)

(assert (=> b!1276737 (= e!729092 tp_is_empty!33375)))

(declare-fun b!1276738 () Bool)

(declare-fun mapRes!51593 () Bool)

(assert (=> b!1276738 (= e!729096 (and e!729092 mapRes!51593))))

(declare-fun condMapEmpty!51593 () Bool)

(declare-fun mapDefault!51593 () ValueCell!15789)

(assert (=> b!1276738 (= condMapEmpty!51593 (= (arr!40432 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15789)) mapDefault!51593)))))

(declare-fun b!1276739 () Bool)

(declare-fun res!848453 () Bool)

(assert (=> b!1276739 (=> (not res!848453) (not e!729095))))

(declare-datatypes ((List!28672 0))(
  ( (Nil!28669) (Cons!28668 (h!29877 (_ BitVec 64)) (t!42208 List!28672)) )
))
(declare-fun arrayNoDuplicates!0 (array!83844 (_ BitVec 32) List!28672) Bool)

(assert (=> b!1276739 (= res!848453 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28669))))

(declare-fun mapNonEmpty!51593 () Bool)

(declare-fun tp!98428 () Bool)

(assert (=> mapNonEmpty!51593 (= mapRes!51593 (and tp!98428 e!729093))))

(declare-fun mapRest!51593 () (Array (_ BitVec 32) ValueCell!15789))

(declare-fun mapKey!51593 () (_ BitVec 32))

(declare-fun mapValue!51593 () ValueCell!15789)

(assert (=> mapNonEmpty!51593 (= (arr!40432 _values!1187) (store mapRest!51593 mapKey!51593 mapValue!51593))))

(declare-fun mapIsEmpty!51593 () Bool)

(assert (=> mapIsEmpty!51593 mapRes!51593))

(assert (= (and start!108112 res!848454) b!1276735))

(assert (= (and b!1276735 res!848451) b!1276734))

(assert (= (and b!1276734 res!848452) b!1276739))

(assert (= (and b!1276739 res!848453) b!1276736))

(assert (= (and b!1276738 condMapEmpty!51593) mapIsEmpty!51593))

(assert (= (and b!1276738 (not condMapEmpty!51593)) mapNonEmpty!51593))

(get-info :version)

(assert (= (and mapNonEmpty!51593 ((_ is ValueCellFull!15789) mapValue!51593)) b!1276733))

(assert (= (and b!1276738 ((_ is ValueCellFull!15789) mapDefault!51593)) b!1276737))

(assert (= start!108112 b!1276738))

(declare-fun m!1172577 () Bool)

(assert (=> b!1276736 m!1172577))

(assert (=> b!1276736 m!1172577))

(declare-fun m!1172579 () Bool)

(assert (=> b!1276736 m!1172579))

(declare-fun m!1172581 () Bool)

(assert (=> b!1276734 m!1172581))

(declare-fun m!1172583 () Bool)

(assert (=> b!1276739 m!1172583))

(declare-fun m!1172585 () Bool)

(assert (=> start!108112 m!1172585))

(declare-fun m!1172587 () Bool)

(assert (=> start!108112 m!1172587))

(declare-fun m!1172589 () Bool)

(assert (=> start!108112 m!1172589))

(declare-fun m!1172591 () Bool)

(assert (=> mapNonEmpty!51593 m!1172591))

(check-sat (not start!108112) b_and!45881 (not b!1276739) (not b_next!27825) tp_is_empty!33375 (not mapNonEmpty!51593) (not b!1276734) (not b!1276736))
(check-sat b_and!45881 (not b_next!27825))
