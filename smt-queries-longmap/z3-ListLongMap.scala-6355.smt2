; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81848 () Bool)

(assert start!81848)

(declare-fun b_free!18361 () Bool)

(declare-fun b_next!18361 () Bool)

(assert (=> start!81848 (= b_free!18361 (not b_next!18361))))

(declare-fun tp!63784 () Bool)

(declare-fun b_and!29821 () Bool)

(assert (=> start!81848 (= tp!63784 b_and!29821)))

(declare-fun mapNonEmpty!33319 () Bool)

(declare-fun mapRes!33319 () Bool)

(declare-fun tp!63783 () Bool)

(declare-fun e!537747 () Bool)

(assert (=> mapNonEmpty!33319 (= mapRes!33319 (and tp!63783 e!537747))))

(declare-fun mapKey!33319 () (_ BitVec 32))

(declare-datatypes ((V!32857 0))(
  ( (V!32858 (val!10503 Int)) )
))
(declare-datatypes ((ValueCell!9971 0))(
  ( (ValueCellFull!9971 (v!13057 V!32857)) (EmptyCell!9971) )
))
(declare-fun mapValue!33319 () ValueCell!9971)

(declare-datatypes ((array!57880 0))(
  ( (array!57881 (arr!27820 (Array (_ BitVec 32) ValueCell!9971)) (size!28301 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57880)

(declare-fun mapRest!33319 () (Array (_ BitVec 32) ValueCell!9971))

(assert (=> mapNonEmpty!33319 (= (arr!27820 _values!1197) (store mapRest!33319 mapKey!33319 mapValue!33319))))

(declare-fun b!954512 () Bool)

(declare-fun tp_is_empty!20905 () Bool)

(assert (=> b!954512 (= e!537747 tp_is_empty!20905)))

(declare-fun b!954513 () Bool)

(declare-fun res!639236 () Bool)

(declare-fun e!537750 () Bool)

(assert (=> b!954513 (=> (not res!639236) (not e!537750))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57882 0))(
  ( (array!57883 (arr!27821 (Array (_ BitVec 32) (_ BitVec 64))) (size!28302 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57882)

(assert (=> b!954513 (= res!639236 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28302 _keys!1441))))))

(declare-fun b!954514 () Bool)

(declare-fun res!639233 () Bool)

(assert (=> b!954514 (=> (not res!639233) (not e!537750))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57882 (_ BitVec 32)) Bool)

(assert (=> b!954514 (= res!639233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954515 () Bool)

(declare-fun e!537749 () Bool)

(declare-fun e!537748 () Bool)

(assert (=> b!954515 (= e!537749 (and e!537748 mapRes!33319))))

(declare-fun condMapEmpty!33319 () Bool)

(declare-fun mapDefault!33319 () ValueCell!9971)

(assert (=> b!954515 (= condMapEmpty!33319 (= (arr!27820 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9971)) mapDefault!33319)))))

(declare-fun b!954517 () Bool)

(declare-fun res!639238 () Bool)

(assert (=> b!954517 (=> (not res!639238) (not e!537750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954517 (= res!639238 (validKeyInArray!0 (select (arr!27821 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33319 () Bool)

(assert (=> mapIsEmpty!33319 mapRes!33319))

(declare-fun b!954518 () Bool)

(declare-fun res!639235 () Bool)

(assert (=> b!954518 (=> (not res!639235) (not e!537750))))

(declare-datatypes ((List!19418 0))(
  ( (Nil!19415) (Cons!19414 (h!20576 (_ BitVec 64)) (t!27770 List!19418)) )
))
(declare-fun arrayNoDuplicates!0 (array!57882 (_ BitVec 32) List!19418) Bool)

(assert (=> b!954518 (= res!639235 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19415))))

(declare-fun res!639237 () Bool)

(assert (=> start!81848 (=> (not res!639237) (not e!537750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81848 (= res!639237 (validMask!0 mask!1823))))

(assert (=> start!81848 e!537750))

(assert (=> start!81848 true))

(assert (=> start!81848 tp_is_empty!20905))

(declare-fun array_inv!21657 (array!57882) Bool)

(assert (=> start!81848 (array_inv!21657 _keys!1441)))

(declare-fun array_inv!21658 (array!57880) Bool)

(assert (=> start!81848 (and (array_inv!21658 _values!1197) e!537749)))

(assert (=> start!81848 tp!63784))

(declare-fun b!954516 () Bool)

(assert (=> b!954516 (= e!537750 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32857)

(declare-fun lt!429699 () Bool)

(declare-fun minValue!1139 () V!32857)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13676 0))(
  ( (tuple2!13677 (_1!6849 (_ BitVec 64)) (_2!6849 V!32857)) )
))
(declare-datatypes ((List!19419 0))(
  ( (Nil!19416) (Cons!19415 (h!20577 tuple2!13676) (t!27771 List!19419)) )
))
(declare-datatypes ((ListLongMap!12363 0))(
  ( (ListLongMap!12364 (toList!6197 List!19419)) )
))
(declare-fun contains!5238 (ListLongMap!12363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3359 (array!57882 array!57880 (_ BitVec 32) (_ BitVec 32) V!32857 V!32857 (_ BitVec 32) Int) ListLongMap!12363)

(assert (=> b!954516 (= lt!429699 (contains!5238 (getCurrentListMap!3359 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27821 _keys!1441) i!735)))))

(declare-fun b!954519 () Bool)

(declare-fun res!639234 () Bool)

(assert (=> b!954519 (=> (not res!639234) (not e!537750))))

(assert (=> b!954519 (= res!639234 (and (= (size!28301 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28302 _keys!1441) (size!28301 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954520 () Bool)

(assert (=> b!954520 (= e!537748 tp_is_empty!20905)))

(assert (= (and start!81848 res!639237) b!954519))

(assert (= (and b!954519 res!639234) b!954514))

(assert (= (and b!954514 res!639233) b!954518))

(assert (= (and b!954518 res!639235) b!954513))

(assert (= (and b!954513 res!639236) b!954517))

(assert (= (and b!954517 res!639238) b!954516))

(assert (= (and b!954515 condMapEmpty!33319) mapIsEmpty!33319))

(assert (= (and b!954515 (not condMapEmpty!33319)) mapNonEmpty!33319))

(get-info :version)

(assert (= (and mapNonEmpty!33319 ((_ is ValueCellFull!9971) mapValue!33319)) b!954512))

(assert (= (and b!954515 ((_ is ValueCellFull!9971) mapDefault!33319)) b!954520))

(assert (= start!81848 b!954515))

(declare-fun m!885645 () Bool)

(assert (=> start!81848 m!885645))

(declare-fun m!885647 () Bool)

(assert (=> start!81848 m!885647))

(declare-fun m!885649 () Bool)

(assert (=> start!81848 m!885649))

(declare-fun m!885651 () Bool)

(assert (=> b!954517 m!885651))

(assert (=> b!954517 m!885651))

(declare-fun m!885653 () Bool)

(assert (=> b!954517 m!885653))

(declare-fun m!885655 () Bool)

(assert (=> b!954516 m!885655))

(assert (=> b!954516 m!885651))

(assert (=> b!954516 m!885655))

(assert (=> b!954516 m!885651))

(declare-fun m!885657 () Bool)

(assert (=> b!954516 m!885657))

(declare-fun m!885659 () Bool)

(assert (=> mapNonEmpty!33319 m!885659))

(declare-fun m!885661 () Bool)

(assert (=> b!954514 m!885661))

(declare-fun m!885663 () Bool)

(assert (=> b!954518 m!885663))

(check-sat (not start!81848) b_and!29821 (not b!954516) (not mapNonEmpty!33319) (not b!954514) (not b!954517) (not b_next!18361) tp_is_empty!20905 (not b!954518))
(check-sat b_and!29821 (not b_next!18361))
