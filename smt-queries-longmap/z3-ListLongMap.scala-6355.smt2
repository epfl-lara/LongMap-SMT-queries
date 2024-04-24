; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82034 () Bool)

(assert start!82034)

(declare-fun b_free!18361 () Bool)

(declare-fun b_next!18361 () Bool)

(assert (=> start!82034 (= b_free!18361 (not b_next!18361))))

(declare-fun tp!63784 () Bool)

(declare-fun b_and!29857 () Bool)

(assert (=> start!82034 (= tp!63784 b_and!29857)))

(declare-fun b!955654 () Bool)

(declare-fun e!538476 () Bool)

(declare-fun tp_is_empty!20905 () Bool)

(assert (=> b!955654 (= e!538476 tp_is_empty!20905)))

(declare-fun b!955655 () Bool)

(declare-fun e!538479 () Bool)

(assert (=> b!955655 (= e!538479 tp_is_empty!20905)))

(declare-fun b!955656 () Bool)

(declare-fun res!639689 () Bool)

(declare-fun e!538480 () Bool)

(assert (=> b!955656 (=> (not res!639689) (not e!538480))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57970 0))(
  ( (array!57971 (arr!27860 (Array (_ BitVec 32) (_ BitVec 64))) (size!28340 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57970)

(assert (=> b!955656 (= res!639689 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28340 _keys!1441))))))

(declare-fun b!955657 () Bool)

(declare-fun res!639690 () Bool)

(assert (=> b!955657 (=> (not res!639690) (not e!538480))))

(declare-datatypes ((List!19405 0))(
  ( (Nil!19402) (Cons!19401 (h!20569 (_ BitVec 64)) (t!27758 List!19405)) )
))
(declare-fun arrayNoDuplicates!0 (array!57970 (_ BitVec 32) List!19405) Bool)

(assert (=> b!955657 (= res!639690 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19402))))

(declare-fun b!955658 () Bool)

(declare-fun e!538477 () Bool)

(declare-fun mapRes!33319 () Bool)

(assert (=> b!955658 (= e!538477 (and e!538479 mapRes!33319))))

(declare-fun condMapEmpty!33319 () Bool)

(declare-datatypes ((V!32857 0))(
  ( (V!32858 (val!10503 Int)) )
))
(declare-datatypes ((ValueCell!9971 0))(
  ( (ValueCellFull!9971 (v!13055 V!32857)) (EmptyCell!9971) )
))
(declare-datatypes ((array!57972 0))(
  ( (array!57973 (arr!27861 (Array (_ BitVec 32) ValueCell!9971)) (size!28341 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57972)

(declare-fun mapDefault!33319 () ValueCell!9971)

(assert (=> b!955658 (= condMapEmpty!33319 (= (arr!27861 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9971)) mapDefault!33319)))))

(declare-fun b!955659 () Bool)

(assert (=> b!955659 (= e!538480 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32857)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun lt!430296 () Bool)

(declare-fun minValue!1139 () V!32857)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13618 0))(
  ( (tuple2!13619 (_1!6820 (_ BitVec 64)) (_2!6820 V!32857)) )
))
(declare-datatypes ((List!19406 0))(
  ( (Nil!19403) (Cons!19402 (h!20570 tuple2!13618) (t!27759 List!19406)) )
))
(declare-datatypes ((ListLongMap!12317 0))(
  ( (ListLongMap!12318 (toList!6174 List!19406)) )
))
(declare-fun contains!5283 (ListLongMap!12317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3407 (array!57970 array!57972 (_ BitVec 32) (_ BitVec 32) V!32857 V!32857 (_ BitVec 32) Int) ListLongMap!12317)

(assert (=> b!955659 (= lt!430296 (contains!5283 (getCurrentListMap!3407 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27860 _keys!1441) i!735)))))

(declare-fun b!955660 () Bool)

(declare-fun res!639691 () Bool)

(assert (=> b!955660 (=> (not res!639691) (not e!538480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955660 (= res!639691 (validKeyInArray!0 (select (arr!27860 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33319 () Bool)

(assert (=> mapIsEmpty!33319 mapRes!33319))

(declare-fun mapNonEmpty!33319 () Bool)

(declare-fun tp!63783 () Bool)

(assert (=> mapNonEmpty!33319 (= mapRes!33319 (and tp!63783 e!538476))))

(declare-fun mapRest!33319 () (Array (_ BitVec 32) ValueCell!9971))

(declare-fun mapValue!33319 () ValueCell!9971)

(declare-fun mapKey!33319 () (_ BitVec 32))

(assert (=> mapNonEmpty!33319 (= (arr!27861 _values!1197) (store mapRest!33319 mapKey!33319 mapValue!33319))))

(declare-fun b!955661 () Bool)

(declare-fun res!639692 () Bool)

(assert (=> b!955661 (=> (not res!639692) (not e!538480))))

(assert (=> b!955661 (= res!639692 (and (= (size!28341 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28340 _keys!1441) (size!28341 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639687 () Bool)

(assert (=> start!82034 (=> (not res!639687) (not e!538480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82034 (= res!639687 (validMask!0 mask!1823))))

(assert (=> start!82034 e!538480))

(assert (=> start!82034 true))

(assert (=> start!82034 tp_is_empty!20905))

(declare-fun array_inv!21703 (array!57970) Bool)

(assert (=> start!82034 (array_inv!21703 _keys!1441)))

(declare-fun array_inv!21704 (array!57972) Bool)

(assert (=> start!82034 (and (array_inv!21704 _values!1197) e!538477)))

(assert (=> start!82034 tp!63784))

(declare-fun b!955662 () Bool)

(declare-fun res!639688 () Bool)

(assert (=> b!955662 (=> (not res!639688) (not e!538480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57970 (_ BitVec 32)) Bool)

(assert (=> b!955662 (= res!639688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82034 res!639687) b!955661))

(assert (= (and b!955661 res!639692) b!955662))

(assert (= (and b!955662 res!639688) b!955657))

(assert (= (and b!955657 res!639690) b!955656))

(assert (= (and b!955656 res!639689) b!955660))

(assert (= (and b!955660 res!639691) b!955659))

(assert (= (and b!955658 condMapEmpty!33319) mapIsEmpty!33319))

(assert (= (and b!955658 (not condMapEmpty!33319)) mapNonEmpty!33319))

(get-info :version)

(assert (= (and mapNonEmpty!33319 ((_ is ValueCellFull!9971) mapValue!33319)) b!955654))

(assert (= (and b!955658 ((_ is ValueCellFull!9971) mapDefault!33319)) b!955655))

(assert (= start!82034 b!955658))

(declare-fun m!887697 () Bool)

(assert (=> start!82034 m!887697))

(declare-fun m!887699 () Bool)

(assert (=> start!82034 m!887699))

(declare-fun m!887701 () Bool)

(assert (=> start!82034 m!887701))

(declare-fun m!887703 () Bool)

(assert (=> b!955662 m!887703))

(declare-fun m!887705 () Bool)

(assert (=> b!955657 m!887705))

(declare-fun m!887707 () Bool)

(assert (=> mapNonEmpty!33319 m!887707))

(declare-fun m!887709 () Bool)

(assert (=> b!955660 m!887709))

(assert (=> b!955660 m!887709))

(declare-fun m!887711 () Bool)

(assert (=> b!955660 m!887711))

(declare-fun m!887713 () Bool)

(assert (=> b!955659 m!887713))

(assert (=> b!955659 m!887709))

(assert (=> b!955659 m!887713))

(assert (=> b!955659 m!887709))

(declare-fun m!887715 () Bool)

(assert (=> b!955659 m!887715))

(check-sat (not b!955662) b_and!29857 tp_is_empty!20905 (not b!955659) (not b_next!18361) (not b!955657) (not start!82034) (not mapNonEmpty!33319) (not b!955660))
(check-sat b_and!29857 (not b_next!18361))
