; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82106 () Bool)

(assert start!82106)

(declare-fun b_free!18433 () Bool)

(declare-fun b_next!18433 () Bool)

(assert (=> start!82106 (= b_free!18433 (not b_next!18433))))

(declare-fun tp!64000 () Bool)

(declare-fun b_and!29929 () Bool)

(assert (=> start!82106 (= tp!64000 b_and!29929)))

(declare-fun b!956700 () Bool)

(declare-fun res!640414 () Bool)

(declare-fun e!539020 () Bool)

(assert (=> b!956700 (=> (not res!640414) (not e!539020))))

(declare-datatypes ((array!58104 0))(
  ( (array!58105 (arr!27927 (Array (_ BitVec 32) (_ BitVec 64))) (size!28407 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58104)

(declare-datatypes ((List!19454 0))(
  ( (Nil!19451) (Cons!19450 (h!20618 (_ BitVec 64)) (t!27807 List!19454)) )
))
(declare-fun arrayNoDuplicates!0 (array!58104 (_ BitVec 32) List!19454) Bool)

(assert (=> b!956700 (= res!640414 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19451))))

(declare-fun b!956701 () Bool)

(declare-fun e!539019 () Bool)

(declare-fun tp_is_empty!20977 () Bool)

(assert (=> b!956701 (= e!539019 tp_is_empty!20977)))

(declare-fun mapNonEmpty!33427 () Bool)

(declare-fun mapRes!33427 () Bool)

(declare-fun tp!63999 () Bool)

(assert (=> mapNonEmpty!33427 (= mapRes!33427 (and tp!63999 e!539019))))

(declare-datatypes ((V!32953 0))(
  ( (V!32954 (val!10539 Int)) )
))
(declare-datatypes ((ValueCell!10007 0))(
  ( (ValueCellFull!10007 (v!13091 V!32953)) (EmptyCell!10007) )
))
(declare-fun mapRest!33427 () (Array (_ BitVec 32) ValueCell!10007))

(declare-datatypes ((array!58106 0))(
  ( (array!58107 (arr!27928 (Array (_ BitVec 32) ValueCell!10007)) (size!28408 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58106)

(declare-fun mapValue!33427 () ValueCell!10007)

(declare-fun mapKey!33427 () (_ BitVec 32))

(assert (=> mapNonEmpty!33427 (= (arr!27928 _values!1197) (store mapRest!33427 mapKey!33427 mapValue!33427))))

(declare-fun mapIsEmpty!33427 () Bool)

(assert (=> mapIsEmpty!33427 mapRes!33427))

(declare-fun b!956702 () Bool)

(declare-fun res!640410 () Bool)

(assert (=> b!956702 (=> (not res!640410) (not e!539020))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32953)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32953)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13672 0))(
  ( (tuple2!13673 (_1!6847 (_ BitVec 64)) (_2!6847 V!32953)) )
))
(declare-datatypes ((List!19455 0))(
  ( (Nil!19452) (Cons!19451 (h!20619 tuple2!13672) (t!27808 List!19455)) )
))
(declare-datatypes ((ListLongMap!12371 0))(
  ( (ListLongMap!12372 (toList!6201 List!19455)) )
))
(declare-fun contains!5310 (ListLongMap!12371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3434 (array!58104 array!58106 (_ BitVec 32) (_ BitVec 32) V!32953 V!32953 (_ BitVec 32) Int) ListLongMap!12371)

(assert (=> b!956702 (= res!640410 (contains!5310 (getCurrentListMap!3434 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27927 _keys!1441) i!735)))))

(declare-fun b!956703 () Bool)

(declare-fun res!640411 () Bool)

(assert (=> b!956703 (=> (not res!640411) (not e!539020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956703 (= res!640411 (validKeyInArray!0 (select (arr!27927 _keys!1441) i!735)))))

(declare-fun res!640409 () Bool)

(assert (=> start!82106 (=> (not res!640409) (not e!539020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82106 (= res!640409 (validMask!0 mask!1823))))

(assert (=> start!82106 e!539020))

(assert (=> start!82106 true))

(assert (=> start!82106 tp_is_empty!20977))

(declare-fun array_inv!21747 (array!58104) Bool)

(assert (=> start!82106 (array_inv!21747 _keys!1441)))

(declare-fun e!539017 () Bool)

(declare-fun array_inv!21748 (array!58106) Bool)

(assert (=> start!82106 (and (array_inv!21748 _values!1197) e!539017)))

(assert (=> start!82106 tp!64000))

(declare-fun b!956704 () Bool)

(declare-fun res!640413 () Bool)

(assert (=> b!956704 (=> (not res!640413) (not e!539020))))

(assert (=> b!956704 (= res!640413 (and (= (size!28408 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28407 _keys!1441) (size!28408 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956705 () Bool)

(declare-fun res!640415 () Bool)

(assert (=> b!956705 (=> (not res!640415) (not e!539020))))

(assert (=> b!956705 (= res!640415 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28407 _keys!1441))))))

(declare-fun b!956706 () Bool)

(declare-fun res!640412 () Bool)

(assert (=> b!956706 (=> (not res!640412) (not e!539020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58104 (_ BitVec 32)) Bool)

(assert (=> b!956706 (= res!640412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956707 () Bool)

(declare-fun e!539018 () Bool)

(assert (=> b!956707 (= e!539017 (and e!539018 mapRes!33427))))

(declare-fun condMapEmpty!33427 () Bool)

(declare-fun mapDefault!33427 () ValueCell!10007)

(assert (=> b!956707 (= condMapEmpty!33427 (= (arr!27928 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10007)) mapDefault!33427)))))

(declare-fun b!956708 () Bool)

(assert (=> b!956708 (= e!539020 (not (bvsle #b00000000000000000000000000000000 (size!28407 _keys!1441))))))

(assert (=> b!956708 (contains!5310 (getCurrentListMap!3434 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27927 _keys!1441) i!735))))

(declare-datatypes ((Unit!32104 0))(
  ( (Unit!32105) )
))
(declare-fun lt!430404 () Unit!32104)

(declare-fun lemmaInListMapFromThenFromZero!17 (array!58104 array!58106 (_ BitVec 32) (_ BitVec 32) V!32953 V!32953 (_ BitVec 32) (_ BitVec 32) Int) Unit!32104)

(assert (=> b!956708 (= lt!430404 (lemmaInListMapFromThenFromZero!17 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956709 () Bool)

(assert (=> b!956709 (= e!539018 tp_is_empty!20977)))

(assert (= (and start!82106 res!640409) b!956704))

(assert (= (and b!956704 res!640413) b!956706))

(assert (= (and b!956706 res!640412) b!956700))

(assert (= (and b!956700 res!640414) b!956705))

(assert (= (and b!956705 res!640415) b!956703))

(assert (= (and b!956703 res!640411) b!956702))

(assert (= (and b!956702 res!640410) b!956708))

(assert (= (and b!956707 condMapEmpty!33427) mapIsEmpty!33427))

(assert (= (and b!956707 (not condMapEmpty!33427)) mapNonEmpty!33427))

(get-info :version)

(assert (= (and mapNonEmpty!33427 ((_ is ValueCellFull!10007) mapValue!33427)) b!956701))

(assert (= (and b!956707 ((_ is ValueCellFull!10007) mapDefault!33427)) b!956709))

(assert (= start!82106 b!956707))

(declare-fun m!888561 () Bool)

(assert (=> b!956708 m!888561))

(declare-fun m!888563 () Bool)

(assert (=> b!956708 m!888563))

(assert (=> b!956708 m!888561))

(assert (=> b!956708 m!888563))

(declare-fun m!888565 () Bool)

(assert (=> b!956708 m!888565))

(declare-fun m!888567 () Bool)

(assert (=> b!956708 m!888567))

(declare-fun m!888569 () Bool)

(assert (=> b!956706 m!888569))

(declare-fun m!888571 () Bool)

(assert (=> b!956702 m!888571))

(assert (=> b!956702 m!888563))

(assert (=> b!956702 m!888571))

(assert (=> b!956702 m!888563))

(declare-fun m!888573 () Bool)

(assert (=> b!956702 m!888573))

(assert (=> b!956703 m!888563))

(assert (=> b!956703 m!888563))

(declare-fun m!888575 () Bool)

(assert (=> b!956703 m!888575))

(declare-fun m!888577 () Bool)

(assert (=> b!956700 m!888577))

(declare-fun m!888579 () Bool)

(assert (=> mapNonEmpty!33427 m!888579))

(declare-fun m!888581 () Bool)

(assert (=> start!82106 m!888581))

(declare-fun m!888583 () Bool)

(assert (=> start!82106 m!888583))

(declare-fun m!888585 () Bool)

(assert (=> start!82106 m!888585))

(check-sat (not b_next!18433) (not mapNonEmpty!33427) (not b!956706) (not start!82106) (not b!956708) (not b!956700) tp_is_empty!20977 b_and!29929 (not b!956703) (not b!956702))
(check-sat b_and!29929 (not b_next!18433))
