; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78552 () Bool)

(assert start!78552)

(declare-fun b_free!16783 () Bool)

(declare-fun b_next!16783 () Bool)

(assert (=> start!78552 (= b_free!16783 (not b_next!16783))))

(declare-fun tp!58791 () Bool)

(declare-fun b_and!27379 () Bool)

(assert (=> start!78552 (= tp!58791 b_and!27379)))

(declare-fun b!915650 () Bool)

(declare-fun e!513948 () Bool)

(assert (=> b!915650 (= e!513948 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30687 0))(
  ( (V!30688 (val!9696 Int)) )
))
(declare-datatypes ((ValueCell!9164 0))(
  ( (ValueCellFull!9164 (v!12213 V!30687)) (EmptyCell!9164) )
))
(declare-datatypes ((array!54563 0))(
  ( (array!54564 (arr!26227 (Array (_ BitVec 32) ValueCell!9164)) (size!26688 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54563)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411491 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!54565 0))(
  ( (array!54566 (arr!26228 (Array (_ BitVec 32) (_ BitVec 64))) (size!26689 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54565)

(declare-fun zeroValue!1173 () V!30687)

(declare-fun minValue!1173 () V!30687)

(declare-datatypes ((tuple2!12628 0))(
  ( (tuple2!12629 (_1!6325 (_ BitVec 64)) (_2!6325 V!30687)) )
))
(declare-datatypes ((List!18426 0))(
  ( (Nil!18423) (Cons!18422 (h!19568 tuple2!12628) (t!26030 List!18426)) )
))
(declare-datatypes ((ListLongMap!11315 0))(
  ( (ListLongMap!11316 (toList!5673 List!18426)) )
))
(declare-fun contains!4683 (ListLongMap!11315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2872 (array!54565 array!54563 (_ BitVec 32) (_ BitVec 32) V!30687 V!30687 (_ BitVec 32) Int) ListLongMap!11315)

(assert (=> b!915650 (= lt!411491 (contains!4683 (getCurrentListMap!2872 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun res!617360 () Bool)

(assert (=> start!78552 (=> (not res!617360) (not e!513948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78552 (= res!617360 (validMask!0 mask!1881))))

(assert (=> start!78552 e!513948))

(assert (=> start!78552 true))

(declare-fun e!513947 () Bool)

(declare-fun array_inv!20548 (array!54563) Bool)

(assert (=> start!78552 (and (array_inv!20548 _values!1231) e!513947)))

(assert (=> start!78552 tp!58791))

(declare-fun array_inv!20549 (array!54565) Bool)

(assert (=> start!78552 (array_inv!20549 _keys!1487)))

(declare-fun tp_is_empty!19291 () Bool)

(assert (=> start!78552 tp_is_empty!19291))

(declare-fun b!915651 () Bool)

(declare-fun res!617359 () Bool)

(assert (=> b!915651 (=> (not res!617359) (not e!513948))))

(declare-datatypes ((List!18427 0))(
  ( (Nil!18424) (Cons!18423 (h!19569 (_ BitVec 64)) (t!26031 List!18427)) )
))
(declare-fun arrayNoDuplicates!0 (array!54565 (_ BitVec 32) List!18427) Bool)

(assert (=> b!915651 (= res!617359 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18424))))

(declare-fun mapNonEmpty!30693 () Bool)

(declare-fun mapRes!30693 () Bool)

(declare-fun tp!58790 () Bool)

(declare-fun e!513945 () Bool)

(assert (=> mapNonEmpty!30693 (= mapRes!30693 (and tp!58790 e!513945))))

(declare-fun mapKey!30693 () (_ BitVec 32))

(declare-fun mapRest!30693 () (Array (_ BitVec 32) ValueCell!9164))

(declare-fun mapValue!30693 () ValueCell!9164)

(assert (=> mapNonEmpty!30693 (= (arr!26227 _values!1231) (store mapRest!30693 mapKey!30693 mapValue!30693))))

(declare-fun b!915652 () Bool)

(assert (=> b!915652 (= e!513945 tp_is_empty!19291)))

(declare-fun mapIsEmpty!30693 () Bool)

(assert (=> mapIsEmpty!30693 mapRes!30693))

(declare-fun b!915653 () Bool)

(declare-fun res!617357 () Bool)

(assert (=> b!915653 (=> (not res!617357) (not e!513948))))

(assert (=> b!915653 (= res!617357 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26689 _keys!1487))))))

(declare-fun b!915654 () Bool)

(declare-fun res!617358 () Bool)

(assert (=> b!915654 (=> (not res!617358) (not e!513948))))

(assert (=> b!915654 (= res!617358 (and (= (size!26688 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26689 _keys!1487) (size!26688 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915655 () Bool)

(declare-fun e!513946 () Bool)

(assert (=> b!915655 (= e!513947 (and e!513946 mapRes!30693))))

(declare-fun condMapEmpty!30693 () Bool)

(declare-fun mapDefault!30693 () ValueCell!9164)

(assert (=> b!915655 (= condMapEmpty!30693 (= (arr!26227 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9164)) mapDefault!30693)))))

(declare-fun b!915656 () Bool)

(declare-fun res!617356 () Bool)

(assert (=> b!915656 (=> (not res!617356) (not e!513948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54565 (_ BitVec 32)) Bool)

(assert (=> b!915656 (= res!617356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915657 () Bool)

(assert (=> b!915657 (= e!513946 tp_is_empty!19291)))

(assert (= (and start!78552 res!617360) b!915654))

(assert (= (and b!915654 res!617358) b!915656))

(assert (= (and b!915656 res!617356) b!915651))

(assert (= (and b!915651 res!617359) b!915653))

(assert (= (and b!915653 res!617357) b!915650))

(assert (= (and b!915655 condMapEmpty!30693) mapIsEmpty!30693))

(assert (= (and b!915655 (not condMapEmpty!30693)) mapNonEmpty!30693))

(get-info :version)

(assert (= (and mapNonEmpty!30693 ((_ is ValueCellFull!9164) mapValue!30693)) b!915652))

(assert (= (and b!915655 ((_ is ValueCellFull!9164) mapDefault!30693)) b!915657))

(assert (= start!78552 b!915655))

(declare-fun m!849349 () Bool)

(assert (=> b!915651 m!849349))

(declare-fun m!849351 () Bool)

(assert (=> mapNonEmpty!30693 m!849351))

(declare-fun m!849353 () Bool)

(assert (=> b!915650 m!849353))

(assert (=> b!915650 m!849353))

(declare-fun m!849355 () Bool)

(assert (=> b!915650 m!849355))

(declare-fun m!849357 () Bool)

(assert (=> b!915656 m!849357))

(declare-fun m!849359 () Bool)

(assert (=> start!78552 m!849359))

(declare-fun m!849361 () Bool)

(assert (=> start!78552 m!849361))

(declare-fun m!849363 () Bool)

(assert (=> start!78552 m!849363))

(check-sat (not b!915656) (not b_next!16783) (not b!915651) (not mapNonEmpty!30693) (not b!915650) tp_is_empty!19291 b_and!27379 (not start!78552))
(check-sat b_and!27379 (not b_next!16783))
