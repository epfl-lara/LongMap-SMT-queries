; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82004 () Bool)

(assert start!82004)

(declare-fun b_free!18331 () Bool)

(declare-fun b_next!18331 () Bool)

(assert (=> start!82004 (= b_free!18331 (not b_next!18331))))

(declare-fun tp!63694 () Bool)

(declare-fun b_and!29827 () Bool)

(assert (=> start!82004 (= tp!63694 b_and!29827)))

(declare-fun b!955249 () Bool)

(declare-fun e!538253 () Bool)

(declare-fun e!538254 () Bool)

(declare-fun mapRes!33274 () Bool)

(assert (=> b!955249 (= e!538253 (and e!538254 mapRes!33274))))

(declare-fun condMapEmpty!33274 () Bool)

(declare-datatypes ((V!32817 0))(
  ( (V!32818 (val!10488 Int)) )
))
(declare-datatypes ((ValueCell!9956 0))(
  ( (ValueCellFull!9956 (v!13040 V!32817)) (EmptyCell!9956) )
))
(declare-datatypes ((array!57910 0))(
  ( (array!57911 (arr!27830 (Array (_ BitVec 32) ValueCell!9956)) (size!28310 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57910)

(declare-fun mapDefault!33274 () ValueCell!9956)

(assert (=> b!955249 (= condMapEmpty!33274 (= (arr!27830 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9956)) mapDefault!33274)))))

(declare-fun mapIsEmpty!33274 () Bool)

(assert (=> mapIsEmpty!33274 mapRes!33274))

(declare-fun b!955250 () Bool)

(declare-fun res!639422 () Bool)

(declare-fun e!538252 () Bool)

(assert (=> b!955250 (=> (not res!639422) (not e!538252))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57912 0))(
  ( (array!57913 (arr!27831 (Array (_ BitVec 32) (_ BitVec 64))) (size!28311 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57912)

(assert (=> b!955250 (= res!639422 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28311 _keys!1441))))))

(declare-fun b!955251 () Bool)

(declare-fun res!639419 () Bool)

(assert (=> b!955251 (=> (not res!639419) (not e!538252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955251 (= res!639419 (validKeyInArray!0 (select (arr!27831 _keys!1441) i!735)))))

(declare-fun b!955252 () Bool)

(declare-fun tp_is_empty!20875 () Bool)

(assert (=> b!955252 (= e!538254 tp_is_empty!20875)))

(declare-fun b!955253 () Bool)

(declare-fun res!639417 () Bool)

(assert (=> b!955253 (=> (not res!639417) (not e!538252))))

(declare-datatypes ((List!19382 0))(
  ( (Nil!19379) (Cons!19378 (h!20546 (_ BitVec 64)) (t!27735 List!19382)) )
))
(declare-fun arrayNoDuplicates!0 (array!57912 (_ BitVec 32) List!19382) Bool)

(assert (=> b!955253 (= res!639417 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19379))))

(declare-fun b!955254 () Bool)

(assert (=> b!955254 (= e!538252 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32817)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun lt!430251 () Bool)

(declare-fun minValue!1139 () V!32817)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13592 0))(
  ( (tuple2!13593 (_1!6807 (_ BitVec 64)) (_2!6807 V!32817)) )
))
(declare-datatypes ((List!19383 0))(
  ( (Nil!19380) (Cons!19379 (h!20547 tuple2!13592) (t!27736 List!19383)) )
))
(declare-datatypes ((ListLongMap!12291 0))(
  ( (ListLongMap!12292 (toList!6161 List!19383)) )
))
(declare-fun contains!5270 (ListLongMap!12291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3394 (array!57912 array!57910 (_ BitVec 32) (_ BitVec 32) V!32817 V!32817 (_ BitVec 32) Int) ListLongMap!12291)

(assert (=> b!955254 (= lt!430251 (contains!5270 (getCurrentListMap!3394 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27831 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33274 () Bool)

(declare-fun tp!63693 () Bool)

(declare-fun e!538251 () Bool)

(assert (=> mapNonEmpty!33274 (= mapRes!33274 (and tp!63693 e!538251))))

(declare-fun mapKey!33274 () (_ BitVec 32))

(declare-fun mapRest!33274 () (Array (_ BitVec 32) ValueCell!9956))

(declare-fun mapValue!33274 () ValueCell!9956)

(assert (=> mapNonEmpty!33274 (= (arr!27830 _values!1197) (store mapRest!33274 mapKey!33274 mapValue!33274))))

(declare-fun res!639418 () Bool)

(assert (=> start!82004 (=> (not res!639418) (not e!538252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82004 (= res!639418 (validMask!0 mask!1823))))

(assert (=> start!82004 e!538252))

(assert (=> start!82004 true))

(assert (=> start!82004 tp_is_empty!20875))

(declare-fun array_inv!21677 (array!57912) Bool)

(assert (=> start!82004 (array_inv!21677 _keys!1441)))

(declare-fun array_inv!21678 (array!57910) Bool)

(assert (=> start!82004 (and (array_inv!21678 _values!1197) e!538253)))

(assert (=> start!82004 tp!63694))

(declare-fun b!955255 () Bool)

(declare-fun res!639421 () Bool)

(assert (=> b!955255 (=> (not res!639421) (not e!538252))))

(assert (=> b!955255 (= res!639421 (and (= (size!28310 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28311 _keys!1441) (size!28310 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955256 () Bool)

(assert (=> b!955256 (= e!538251 tp_is_empty!20875)))

(declare-fun b!955257 () Bool)

(declare-fun res!639420 () Bool)

(assert (=> b!955257 (=> (not res!639420) (not e!538252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57912 (_ BitVec 32)) Bool)

(assert (=> b!955257 (= res!639420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82004 res!639418) b!955255))

(assert (= (and b!955255 res!639421) b!955257))

(assert (= (and b!955257 res!639420) b!955253))

(assert (= (and b!955253 res!639417) b!955250))

(assert (= (and b!955250 res!639422) b!955251))

(assert (= (and b!955251 res!639419) b!955254))

(assert (= (and b!955249 condMapEmpty!33274) mapIsEmpty!33274))

(assert (= (and b!955249 (not condMapEmpty!33274)) mapNonEmpty!33274))

(get-info :version)

(assert (= (and mapNonEmpty!33274 ((_ is ValueCellFull!9956) mapValue!33274)) b!955256))

(assert (= (and b!955249 ((_ is ValueCellFull!9956) mapDefault!33274)) b!955252))

(assert (= start!82004 b!955249))

(declare-fun m!887397 () Bool)

(assert (=> b!955254 m!887397))

(declare-fun m!887399 () Bool)

(assert (=> b!955254 m!887399))

(assert (=> b!955254 m!887397))

(assert (=> b!955254 m!887399))

(declare-fun m!887401 () Bool)

(assert (=> b!955254 m!887401))

(declare-fun m!887403 () Bool)

(assert (=> start!82004 m!887403))

(declare-fun m!887405 () Bool)

(assert (=> start!82004 m!887405))

(declare-fun m!887407 () Bool)

(assert (=> start!82004 m!887407))

(declare-fun m!887409 () Bool)

(assert (=> mapNonEmpty!33274 m!887409))

(declare-fun m!887411 () Bool)

(assert (=> b!955253 m!887411))

(declare-fun m!887413 () Bool)

(assert (=> b!955257 m!887413))

(assert (=> b!955251 m!887399))

(assert (=> b!955251 m!887399))

(declare-fun m!887415 () Bool)

(assert (=> b!955251 m!887415))

(check-sat b_and!29827 (not b!955253) (not b!955251) (not start!82004) (not mapNonEmpty!33274) (not b_next!18331) tp_is_empty!20875 (not b!955254) (not b!955257))
(check-sat b_and!29827 (not b_next!18331))
