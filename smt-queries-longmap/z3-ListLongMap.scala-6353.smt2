; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81836 () Bool)

(assert start!81836)

(declare-fun b_free!18349 () Bool)

(declare-fun b_next!18349 () Bool)

(assert (=> start!81836 (= b_free!18349 (not b_next!18349))))

(declare-fun tp!63747 () Bool)

(declare-fun b_and!29809 () Bool)

(assert (=> start!81836 (= tp!63747 b_and!29809)))

(declare-fun b!954350 () Bool)

(declare-fun res!639130 () Bool)

(declare-fun e!537659 () Bool)

(assert (=> b!954350 (=> (not res!639130) (not e!537659))))

(declare-datatypes ((array!57858 0))(
  ( (array!57859 (arr!27809 (Array (_ BitVec 32) (_ BitVec 64))) (size!28290 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57858)

(declare-datatypes ((List!19411 0))(
  ( (Nil!19408) (Cons!19407 (h!20569 (_ BitVec 64)) (t!27763 List!19411)) )
))
(declare-fun arrayNoDuplicates!0 (array!57858 (_ BitVec 32) List!19411) Bool)

(assert (=> b!954350 (= res!639130 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19408))))

(declare-fun b!954351 () Bool)

(declare-fun e!537658 () Bool)

(declare-fun tp_is_empty!20893 () Bool)

(assert (=> b!954351 (= e!537658 tp_is_empty!20893)))

(declare-fun b!954352 () Bool)

(declare-fun res!639129 () Bool)

(assert (=> b!954352 (=> (not res!639129) (not e!537659))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57858 (_ BitVec 32)) Bool)

(assert (=> b!954352 (= res!639129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954353 () Bool)

(assert (=> b!954353 (= e!537659 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32841 0))(
  ( (V!32842 (val!10497 Int)) )
))
(declare-fun zeroValue!1139 () V!32841)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9965 0))(
  ( (ValueCellFull!9965 (v!13051 V!32841)) (EmptyCell!9965) )
))
(declare-datatypes ((array!57860 0))(
  ( (array!57861 (arr!27810 (Array (_ BitVec 32) ValueCell!9965)) (size!28291 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57860)

(declare-fun lt!429681 () Bool)

(declare-fun minValue!1139 () V!32841)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13670 0))(
  ( (tuple2!13671 (_1!6846 (_ BitVec 64)) (_2!6846 V!32841)) )
))
(declare-datatypes ((List!19412 0))(
  ( (Nil!19409) (Cons!19408 (h!20570 tuple2!13670) (t!27764 List!19412)) )
))
(declare-datatypes ((ListLongMap!12357 0))(
  ( (ListLongMap!12358 (toList!6194 List!19412)) )
))
(declare-fun contains!5235 (ListLongMap!12357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3356 (array!57858 array!57860 (_ BitVec 32) (_ BitVec 32) V!32841 V!32841 (_ BitVec 32) Int) ListLongMap!12357)

(assert (=> b!954353 (= lt!429681 (contains!5235 (getCurrentListMap!3356 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27809 _keys!1441) i!735)))))

(declare-fun b!954354 () Bool)

(declare-fun res!639127 () Bool)

(assert (=> b!954354 (=> (not res!639127) (not e!537659))))

(assert (=> b!954354 (= res!639127 (and (= (size!28291 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28290 _keys!1441) (size!28291 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33301 () Bool)

(declare-fun mapRes!33301 () Bool)

(assert (=> mapIsEmpty!33301 mapRes!33301))

(declare-fun b!954355 () Bool)

(declare-fun res!639126 () Bool)

(assert (=> b!954355 (=> (not res!639126) (not e!537659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954355 (= res!639126 (validKeyInArray!0 (select (arr!27809 _keys!1441) i!735)))))

(declare-fun b!954356 () Bool)

(declare-fun e!537656 () Bool)

(declare-fun e!537660 () Bool)

(assert (=> b!954356 (= e!537656 (and e!537660 mapRes!33301))))

(declare-fun condMapEmpty!33301 () Bool)

(declare-fun mapDefault!33301 () ValueCell!9965)

(assert (=> b!954356 (= condMapEmpty!33301 (= (arr!27810 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9965)) mapDefault!33301)))))

(declare-fun b!954357 () Bool)

(assert (=> b!954357 (= e!537660 tp_is_empty!20893)))

(declare-fun b!954358 () Bool)

(declare-fun res!639125 () Bool)

(assert (=> b!954358 (=> (not res!639125) (not e!537659))))

(assert (=> b!954358 (= res!639125 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28290 _keys!1441))))))

(declare-fun res!639128 () Bool)

(assert (=> start!81836 (=> (not res!639128) (not e!537659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81836 (= res!639128 (validMask!0 mask!1823))))

(assert (=> start!81836 e!537659))

(assert (=> start!81836 true))

(assert (=> start!81836 tp_is_empty!20893))

(declare-fun array_inv!21651 (array!57858) Bool)

(assert (=> start!81836 (array_inv!21651 _keys!1441)))

(declare-fun array_inv!21652 (array!57860) Bool)

(assert (=> start!81836 (and (array_inv!21652 _values!1197) e!537656)))

(assert (=> start!81836 tp!63747))

(declare-fun mapNonEmpty!33301 () Bool)

(declare-fun tp!63748 () Bool)

(assert (=> mapNonEmpty!33301 (= mapRes!33301 (and tp!63748 e!537658))))

(declare-fun mapKey!33301 () (_ BitVec 32))

(declare-fun mapValue!33301 () ValueCell!9965)

(declare-fun mapRest!33301 () (Array (_ BitVec 32) ValueCell!9965))

(assert (=> mapNonEmpty!33301 (= (arr!27810 _values!1197) (store mapRest!33301 mapKey!33301 mapValue!33301))))

(assert (= (and start!81836 res!639128) b!954354))

(assert (= (and b!954354 res!639127) b!954352))

(assert (= (and b!954352 res!639129) b!954350))

(assert (= (and b!954350 res!639130) b!954358))

(assert (= (and b!954358 res!639125) b!954355))

(assert (= (and b!954355 res!639126) b!954353))

(assert (= (and b!954356 condMapEmpty!33301) mapIsEmpty!33301))

(assert (= (and b!954356 (not condMapEmpty!33301)) mapNonEmpty!33301))

(get-info :version)

(assert (= (and mapNonEmpty!33301 ((_ is ValueCellFull!9965) mapValue!33301)) b!954351))

(assert (= (and b!954356 ((_ is ValueCellFull!9965) mapDefault!33301)) b!954357))

(assert (= start!81836 b!954356))

(declare-fun m!885525 () Bool)

(assert (=> b!954353 m!885525))

(declare-fun m!885527 () Bool)

(assert (=> b!954353 m!885527))

(assert (=> b!954353 m!885525))

(assert (=> b!954353 m!885527))

(declare-fun m!885529 () Bool)

(assert (=> b!954353 m!885529))

(assert (=> b!954355 m!885527))

(assert (=> b!954355 m!885527))

(declare-fun m!885531 () Bool)

(assert (=> b!954355 m!885531))

(declare-fun m!885533 () Bool)

(assert (=> b!954352 m!885533))

(declare-fun m!885535 () Bool)

(assert (=> start!81836 m!885535))

(declare-fun m!885537 () Bool)

(assert (=> start!81836 m!885537))

(declare-fun m!885539 () Bool)

(assert (=> start!81836 m!885539))

(declare-fun m!885541 () Bool)

(assert (=> mapNonEmpty!33301 m!885541))

(declare-fun m!885543 () Bool)

(assert (=> b!954350 m!885543))

(check-sat (not mapNonEmpty!33301) (not b!954352) b_and!29809 (not b!954353) (not start!81836) (not b!954355) tp_is_empty!20893 (not b!954350) (not b_next!18349))
(check-sat b_and!29809 (not b_next!18349))
