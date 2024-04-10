; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78590 () Bool)

(assert start!78590)

(declare-fun b_free!16803 () Bool)

(declare-fun b_next!16803 () Bool)

(assert (=> start!78590 (= b_free!16803 (not b_next!16803))))

(declare-fun tp!58849 () Bool)

(declare-fun b_and!27425 () Bool)

(assert (=> start!78590 (= tp!58849 b_and!27425)))

(declare-fun b!916130 () Bool)

(declare-fun e!514246 () Bool)

(declare-fun tp_is_empty!19311 () Bool)

(assert (=> b!916130 (= e!514246 tp_is_empty!19311)))

(declare-fun b!916131 () Bool)

(declare-fun e!514243 () Bool)

(declare-fun e!514242 () Bool)

(declare-fun mapRes!30723 () Bool)

(assert (=> b!916131 (= e!514243 (and e!514242 mapRes!30723))))

(declare-fun condMapEmpty!30723 () Bool)

(declare-datatypes ((V!30713 0))(
  ( (V!30714 (val!9706 Int)) )
))
(declare-datatypes ((ValueCell!9174 0))(
  ( (ValueCellFull!9174 (v!12224 V!30713)) (EmptyCell!9174) )
))
(declare-datatypes ((array!54614 0))(
  ( (array!54615 (arr!26252 (Array (_ BitVec 32) ValueCell!9174)) (size!26711 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54614)

(declare-fun mapDefault!30723 () ValueCell!9174)

(assert (=> b!916131 (= condMapEmpty!30723 (= (arr!26252 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9174)) mapDefault!30723)))))

(declare-fun b!916132 () Bool)

(declare-fun e!514244 () Bool)

(assert (=> b!916132 (= e!514244 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!54616 0))(
  ( (array!54617 (arr!26253 (Array (_ BitVec 32) (_ BitVec 64))) (size!26712 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54616)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!411757 () Bool)

(declare-fun zeroValue!1173 () V!30713)

(declare-fun minValue!1173 () V!30713)

(declare-datatypes ((tuple2!12592 0))(
  ( (tuple2!12593 (_1!6307 (_ BitVec 64)) (_2!6307 V!30713)) )
))
(declare-datatypes ((List!18405 0))(
  ( (Nil!18402) (Cons!18401 (h!19547 tuple2!12592) (t!26018 List!18405)) )
))
(declare-datatypes ((ListLongMap!11289 0))(
  ( (ListLongMap!11290 (toList!5660 List!18405)) )
))
(declare-fun contains!4714 (ListLongMap!11289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2921 (array!54616 array!54614 (_ BitVec 32) (_ BitVec 32) V!30713 V!30713 (_ BitVec 32) Int) ListLongMap!11289)

(assert (=> b!916132 (= lt!411757 (contains!4714 (getCurrentListMap!2921 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916133 () Bool)

(declare-fun res!617616 () Bool)

(assert (=> b!916133 (=> (not res!617616) (not e!514244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54616 (_ BitVec 32)) Bool)

(assert (=> b!916133 (= res!617616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30723 () Bool)

(assert (=> mapIsEmpty!30723 mapRes!30723))

(declare-fun b!916134 () Bool)

(declare-fun res!617617 () Bool)

(assert (=> b!916134 (=> (not res!617617) (not e!514244))))

(declare-datatypes ((List!18406 0))(
  ( (Nil!18403) (Cons!18402 (h!19548 (_ BitVec 64)) (t!26019 List!18406)) )
))
(declare-fun arrayNoDuplicates!0 (array!54616 (_ BitVec 32) List!18406) Bool)

(assert (=> b!916134 (= res!617617 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18403))))

(declare-fun res!617619 () Bool)

(assert (=> start!78590 (=> (not res!617619) (not e!514244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78590 (= res!617619 (validMask!0 mask!1881))))

(assert (=> start!78590 e!514244))

(assert (=> start!78590 true))

(declare-fun array_inv!20478 (array!54614) Bool)

(assert (=> start!78590 (and (array_inv!20478 _values!1231) e!514243)))

(assert (=> start!78590 tp!58849))

(declare-fun array_inv!20479 (array!54616) Bool)

(assert (=> start!78590 (array_inv!20479 _keys!1487)))

(assert (=> start!78590 tp_is_empty!19311))

(declare-fun b!916129 () Bool)

(declare-fun res!617618 () Bool)

(assert (=> b!916129 (=> (not res!617618) (not e!514244))))

(assert (=> b!916129 (= res!617618 (and (= (size!26711 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26712 _keys!1487) (size!26711 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30723 () Bool)

(declare-fun tp!58850 () Bool)

(assert (=> mapNonEmpty!30723 (= mapRes!30723 (and tp!58850 e!514246))))

(declare-fun mapKey!30723 () (_ BitVec 32))

(declare-fun mapRest!30723 () (Array (_ BitVec 32) ValueCell!9174))

(declare-fun mapValue!30723 () ValueCell!9174)

(assert (=> mapNonEmpty!30723 (= (arr!26252 _values!1231) (store mapRest!30723 mapKey!30723 mapValue!30723))))

(declare-fun b!916135 () Bool)

(declare-fun res!617620 () Bool)

(assert (=> b!916135 (=> (not res!617620) (not e!514244))))

(assert (=> b!916135 (= res!617620 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26712 _keys!1487))))))

(declare-fun b!916136 () Bool)

(assert (=> b!916136 (= e!514242 tp_is_empty!19311)))

(assert (= (and start!78590 res!617619) b!916129))

(assert (= (and b!916129 res!617618) b!916133))

(assert (= (and b!916133 res!617616) b!916134))

(assert (= (and b!916134 res!617617) b!916135))

(assert (= (and b!916135 res!617620) b!916132))

(assert (= (and b!916131 condMapEmpty!30723) mapIsEmpty!30723))

(assert (= (and b!916131 (not condMapEmpty!30723)) mapNonEmpty!30723))

(get-info :version)

(assert (= (and mapNonEmpty!30723 ((_ is ValueCellFull!9174) mapValue!30723)) b!916130))

(assert (= (and b!916131 ((_ is ValueCellFull!9174) mapDefault!30723)) b!916136))

(assert (= start!78590 b!916131))

(declare-fun m!850267 () Bool)

(assert (=> start!78590 m!850267))

(declare-fun m!850269 () Bool)

(assert (=> start!78590 m!850269))

(declare-fun m!850271 () Bool)

(assert (=> start!78590 m!850271))

(declare-fun m!850273 () Bool)

(assert (=> mapNonEmpty!30723 m!850273))

(declare-fun m!850275 () Bool)

(assert (=> b!916133 m!850275))

(declare-fun m!850277 () Bool)

(assert (=> b!916134 m!850277))

(declare-fun m!850279 () Bool)

(assert (=> b!916132 m!850279))

(assert (=> b!916132 m!850279))

(declare-fun m!850281 () Bool)

(assert (=> b!916132 m!850281))

(check-sat b_and!27425 (not b!916132) (not start!78590) (not b!916133) (not b_next!16803) (not mapNonEmpty!30723) (not b!916134) tp_is_empty!19311)
(check-sat b_and!27425 (not b_next!16803))
