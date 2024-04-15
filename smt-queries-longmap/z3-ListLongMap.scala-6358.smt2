; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81866 () Bool)

(assert start!81866)

(declare-fun b_free!18379 () Bool)

(declare-fun b_next!18379 () Bool)

(assert (=> start!81866 (= b_free!18379 (not b_next!18379))))

(declare-fun tp!63837 () Bool)

(declare-fun b_and!29839 () Bool)

(assert (=> start!81866 (= tp!63837 b_and!29839)))

(declare-fun mapIsEmpty!33346 () Bool)

(declare-fun mapRes!33346 () Bool)

(assert (=> mapIsEmpty!33346 mapRes!33346))

(declare-fun b!954755 () Bool)

(declare-fun e!537884 () Bool)

(assert (=> b!954755 (= e!537884 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32881 0))(
  ( (V!32882 (val!10512 Int)) )
))
(declare-fun zeroValue!1139 () V!32881)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun lt!429726 () Bool)

(declare-datatypes ((array!57916 0))(
  ( (array!57917 (arr!27838 (Array (_ BitVec 32) (_ BitVec 64))) (size!28319 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57916)

(declare-datatypes ((ValueCell!9980 0))(
  ( (ValueCellFull!9980 (v!13066 V!32881)) (EmptyCell!9980) )
))
(declare-datatypes ((array!57918 0))(
  ( (array!57919 (arr!27839 (Array (_ BitVec 32) ValueCell!9980)) (size!28320 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57918)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32881)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13690 0))(
  ( (tuple2!13691 (_1!6856 (_ BitVec 64)) (_2!6856 V!32881)) )
))
(declare-datatypes ((List!19431 0))(
  ( (Nil!19428) (Cons!19427 (h!20589 tuple2!13690) (t!27783 List!19431)) )
))
(declare-datatypes ((ListLongMap!12377 0))(
  ( (ListLongMap!12378 (toList!6204 List!19431)) )
))
(declare-fun contains!5245 (ListLongMap!12377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3366 (array!57916 array!57918 (_ BitVec 32) (_ BitVec 32) V!32881 V!32881 (_ BitVec 32) Int) ListLongMap!12377)

(assert (=> b!954755 (= lt!429726 (contains!5245 (getCurrentListMap!3366 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27838 _keys!1441) i!735)))))

(declare-fun b!954756 () Bool)

(declare-fun e!537885 () Bool)

(declare-fun tp_is_empty!20923 () Bool)

(assert (=> b!954756 (= e!537885 tp_is_empty!20923)))

(declare-fun b!954757 () Bool)

(declare-fun res!639400 () Bool)

(assert (=> b!954757 (=> (not res!639400) (not e!537884))))

(declare-datatypes ((List!19432 0))(
  ( (Nil!19429) (Cons!19428 (h!20590 (_ BitVec 64)) (t!27784 List!19432)) )
))
(declare-fun arrayNoDuplicates!0 (array!57916 (_ BitVec 32) List!19432) Bool)

(assert (=> b!954757 (= res!639400 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19429))))

(declare-fun b!954758 () Bool)

(declare-fun res!639398 () Bool)

(assert (=> b!954758 (=> (not res!639398) (not e!537884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954758 (= res!639398 (validKeyInArray!0 (select (arr!27838 _keys!1441) i!735)))))

(declare-fun b!954759 () Bool)

(declare-fun e!537883 () Bool)

(assert (=> b!954759 (= e!537883 (and e!537885 mapRes!33346))))

(declare-fun condMapEmpty!33346 () Bool)

(declare-fun mapDefault!33346 () ValueCell!9980)

(assert (=> b!954759 (= condMapEmpty!33346 (= (arr!27839 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9980)) mapDefault!33346)))))

(declare-fun mapNonEmpty!33346 () Bool)

(declare-fun tp!63838 () Bool)

(declare-fun e!537882 () Bool)

(assert (=> mapNonEmpty!33346 (= mapRes!33346 (and tp!63838 e!537882))))

(declare-fun mapRest!33346 () (Array (_ BitVec 32) ValueCell!9980))

(declare-fun mapValue!33346 () ValueCell!9980)

(declare-fun mapKey!33346 () (_ BitVec 32))

(assert (=> mapNonEmpty!33346 (= (arr!27839 _values!1197) (store mapRest!33346 mapKey!33346 mapValue!33346))))

(declare-fun b!954760 () Bool)

(declare-fun res!639396 () Bool)

(assert (=> b!954760 (=> (not res!639396) (not e!537884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57916 (_ BitVec 32)) Bool)

(assert (=> b!954760 (= res!639396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639399 () Bool)

(assert (=> start!81866 (=> (not res!639399) (not e!537884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81866 (= res!639399 (validMask!0 mask!1823))))

(assert (=> start!81866 e!537884))

(assert (=> start!81866 true))

(assert (=> start!81866 tp_is_empty!20923))

(declare-fun array_inv!21669 (array!57916) Bool)

(assert (=> start!81866 (array_inv!21669 _keys!1441)))

(declare-fun array_inv!21670 (array!57918) Bool)

(assert (=> start!81866 (and (array_inv!21670 _values!1197) e!537883)))

(assert (=> start!81866 tp!63837))

(declare-fun b!954761 () Bool)

(assert (=> b!954761 (= e!537882 tp_is_empty!20923)))

(declare-fun b!954762 () Bool)

(declare-fun res!639395 () Bool)

(assert (=> b!954762 (=> (not res!639395) (not e!537884))))

(assert (=> b!954762 (= res!639395 (and (= (size!28320 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28319 _keys!1441) (size!28320 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954763 () Bool)

(declare-fun res!639397 () Bool)

(assert (=> b!954763 (=> (not res!639397) (not e!537884))))

(assert (=> b!954763 (= res!639397 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28319 _keys!1441))))))

(assert (= (and start!81866 res!639399) b!954762))

(assert (= (and b!954762 res!639395) b!954760))

(assert (= (and b!954760 res!639396) b!954757))

(assert (= (and b!954757 res!639400) b!954763))

(assert (= (and b!954763 res!639397) b!954758))

(assert (= (and b!954758 res!639398) b!954755))

(assert (= (and b!954759 condMapEmpty!33346) mapIsEmpty!33346))

(assert (= (and b!954759 (not condMapEmpty!33346)) mapNonEmpty!33346))

(get-info :version)

(assert (= (and mapNonEmpty!33346 ((_ is ValueCellFull!9980) mapValue!33346)) b!954761))

(assert (= (and b!954759 ((_ is ValueCellFull!9980) mapDefault!33346)) b!954756))

(assert (= start!81866 b!954759))

(declare-fun m!885825 () Bool)

(assert (=> b!954758 m!885825))

(assert (=> b!954758 m!885825))

(declare-fun m!885827 () Bool)

(assert (=> b!954758 m!885827))

(declare-fun m!885829 () Bool)

(assert (=> b!954755 m!885829))

(assert (=> b!954755 m!885825))

(assert (=> b!954755 m!885829))

(assert (=> b!954755 m!885825))

(declare-fun m!885831 () Bool)

(assert (=> b!954755 m!885831))

(declare-fun m!885833 () Bool)

(assert (=> b!954757 m!885833))

(declare-fun m!885835 () Bool)

(assert (=> mapNonEmpty!33346 m!885835))

(declare-fun m!885837 () Bool)

(assert (=> b!954760 m!885837))

(declare-fun m!885839 () Bool)

(assert (=> start!81866 m!885839))

(declare-fun m!885841 () Bool)

(assert (=> start!81866 m!885841))

(declare-fun m!885843 () Bool)

(assert (=> start!81866 m!885843))

(check-sat (not start!81866) (not b!954755) tp_is_empty!20923 (not b_next!18379) b_and!29839 (not mapNonEmpty!33346) (not b!954757) (not b!954760) (not b!954758))
(check-sat b_and!29839 (not b_next!18379))
