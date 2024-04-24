; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78780 () Bool)

(assert start!78780)

(declare-fun b_free!16825 () Bool)

(declare-fun b_next!16825 () Bool)

(assert (=> start!78780 (= b_free!16825 (not b_next!16825))))

(declare-fun tp!58916 () Bool)

(declare-fun b_and!27457 () Bool)

(assert (=> start!78780 (= tp!58916 b_and!27457)))

(declare-fun mapIsEmpty!30756 () Bool)

(declare-fun mapRes!30756 () Bool)

(assert (=> mapIsEmpty!30756 mapRes!30756))

(declare-fun b!917307 () Bool)

(declare-fun e!514996 () Bool)

(assert (=> b!917307 (= e!514996 false)))

(declare-datatypes ((V!30743 0))(
  ( (V!30744 (val!9717 Int)) )
))
(declare-fun lt!412144 () V!30743)

(declare-datatypes ((tuple2!12572 0))(
  ( (tuple2!12573 (_1!6297 (_ BitVec 64)) (_2!6297 V!30743)) )
))
(declare-datatypes ((List!18402 0))(
  ( (Nil!18399) (Cons!18398 (h!19550 tuple2!12572) (t!26007 List!18402)) )
))
(declare-datatypes ((ListLongMap!11271 0))(
  ( (ListLongMap!11272 (toList!5651 List!18402)) )
))
(declare-fun lt!412145 () ListLongMap!11271)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!537 (ListLongMap!11271 (_ BitVec 64)) V!30743)

(assert (=> b!917307 (= lt!412144 (apply!537 lt!412145 k0!1099))))

(declare-fun b!917308 () Bool)

(declare-fun e!514995 () Bool)

(declare-fun tp_is_empty!19333 () Bool)

(assert (=> b!917308 (= e!514995 tp_is_empty!19333)))

(declare-fun b!917309 () Bool)

(declare-fun res!618137 () Bool)

(declare-fun e!514994 () Bool)

(assert (=> b!917309 (=> (not res!618137) (not e!514994))))

(declare-datatypes ((array!54703 0))(
  ( (array!54704 (arr!26292 (Array (_ BitVec 32) (_ BitVec 64))) (size!26752 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54703)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9185 0))(
  ( (ValueCellFull!9185 (v!12232 V!30743)) (EmptyCell!9185) )
))
(declare-datatypes ((array!54705 0))(
  ( (array!54706 (arr!26293 (Array (_ BitVec 32) ValueCell!9185)) (size!26753 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54705)

(assert (=> b!917309 (= res!618137 (and (= (size!26753 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26752 _keys!1487) (size!26753 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30756 () Bool)

(declare-fun tp!58917 () Bool)

(declare-fun e!514992 () Bool)

(assert (=> mapNonEmpty!30756 (= mapRes!30756 (and tp!58917 e!514992))))

(declare-fun mapKey!30756 () (_ BitVec 32))

(declare-fun mapRest!30756 () (Array (_ BitVec 32) ValueCell!9185))

(declare-fun mapValue!30756 () ValueCell!9185)

(assert (=> mapNonEmpty!30756 (= (arr!26293 _values!1231) (store mapRest!30756 mapKey!30756 mapValue!30756))))

(declare-fun b!917310 () Bool)

(declare-fun res!618136 () Bool)

(assert (=> b!917310 (=> (not res!618136) (not e!514994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54703 (_ BitVec 32)) Bool)

(assert (=> b!917310 (= res!618136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917311 () Bool)

(assert (=> b!917311 (= e!514992 tp_is_empty!19333)))

(declare-fun b!917313 () Bool)

(assert (=> b!917313 (= e!514994 e!514996)))

(declare-fun res!618138 () Bool)

(assert (=> b!917313 (=> (not res!618138) (not e!514996))))

(declare-fun contains!4713 (ListLongMap!11271 (_ BitVec 64)) Bool)

(assert (=> b!917313 (= res!618138 (contains!4713 lt!412145 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30743)

(declare-fun minValue!1173 () V!30743)

(declare-fun getCurrentListMap!2910 (array!54703 array!54705 (_ BitVec 32) (_ BitVec 32) V!30743 V!30743 (_ BitVec 32) Int) ListLongMap!11271)

(assert (=> b!917313 (= lt!412145 (getCurrentListMap!2910 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917314 () Bool)

(declare-fun res!618139 () Bool)

(assert (=> b!917314 (=> (not res!618139) (not e!514994))))

(assert (=> b!917314 (= res!618139 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26752 _keys!1487))))))

(declare-fun b!917315 () Bool)

(declare-fun res!618140 () Bool)

(assert (=> b!917315 (=> (not res!618140) (not e!514994))))

(declare-datatypes ((List!18403 0))(
  ( (Nil!18400) (Cons!18399 (h!19551 (_ BitVec 64)) (t!26008 List!18403)) )
))
(declare-fun arrayNoDuplicates!0 (array!54703 (_ BitVec 32) List!18403) Bool)

(assert (=> b!917315 (= res!618140 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18400))))

(declare-fun res!618141 () Bool)

(assert (=> start!78780 (=> (not res!618141) (not e!514994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78780 (= res!618141 (validMask!0 mask!1881))))

(assert (=> start!78780 e!514994))

(assert (=> start!78780 true))

(declare-fun e!514991 () Bool)

(declare-fun array_inv!20610 (array!54705) Bool)

(assert (=> start!78780 (and (array_inv!20610 _values!1231) e!514991)))

(assert (=> start!78780 tp!58916))

(declare-fun array_inv!20611 (array!54703) Bool)

(assert (=> start!78780 (array_inv!20611 _keys!1487)))

(assert (=> start!78780 tp_is_empty!19333))

(declare-fun b!917312 () Bool)

(assert (=> b!917312 (= e!514991 (and e!514995 mapRes!30756))))

(declare-fun condMapEmpty!30756 () Bool)

(declare-fun mapDefault!30756 () ValueCell!9185)

(assert (=> b!917312 (= condMapEmpty!30756 (= (arr!26293 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9185)) mapDefault!30756)))))

(assert (= (and start!78780 res!618141) b!917309))

(assert (= (and b!917309 res!618137) b!917310))

(assert (= (and b!917310 res!618136) b!917315))

(assert (= (and b!917315 res!618140) b!917314))

(assert (= (and b!917314 res!618139) b!917313))

(assert (= (and b!917313 res!618138) b!917307))

(assert (= (and b!917312 condMapEmpty!30756) mapIsEmpty!30756))

(assert (= (and b!917312 (not condMapEmpty!30756)) mapNonEmpty!30756))

(get-info :version)

(assert (= (and mapNonEmpty!30756 ((_ is ValueCellFull!9185) mapValue!30756)) b!917311))

(assert (= (and b!917312 ((_ is ValueCellFull!9185) mapDefault!30756)) b!917308))

(assert (= start!78780 b!917312))

(declare-fun m!851737 () Bool)

(assert (=> b!917315 m!851737))

(declare-fun m!851739 () Bool)

(assert (=> mapNonEmpty!30756 m!851739))

(declare-fun m!851741 () Bool)

(assert (=> b!917310 m!851741))

(declare-fun m!851743 () Bool)

(assert (=> start!78780 m!851743))

(declare-fun m!851745 () Bool)

(assert (=> start!78780 m!851745))

(declare-fun m!851747 () Bool)

(assert (=> start!78780 m!851747))

(declare-fun m!851749 () Bool)

(assert (=> b!917307 m!851749))

(declare-fun m!851751 () Bool)

(assert (=> b!917313 m!851751))

(declare-fun m!851753 () Bool)

(assert (=> b!917313 m!851753))

(check-sat b_and!27457 (not start!78780) (not mapNonEmpty!30756) (not b!917315) tp_is_empty!19333 (not b!917313) (not b_next!16825) (not b!917310) (not b!917307))
(check-sat b_and!27457 (not b_next!16825))
