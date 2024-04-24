; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78804 () Bool)

(assert start!78804)

(declare-fun b_free!16849 () Bool)

(declare-fun b_next!16849 () Bool)

(assert (=> start!78804 (= b_free!16849 (not b_next!16849))))

(declare-fun tp!58989 () Bool)

(declare-fun b_and!27481 () Bool)

(assert (=> start!78804 (= tp!58989 b_and!27481)))

(declare-fun mapIsEmpty!30792 () Bool)

(declare-fun mapRes!30792 () Bool)

(assert (=> mapIsEmpty!30792 mapRes!30792))

(declare-fun b!917631 () Bool)

(declare-fun res!618353 () Bool)

(declare-fun e!515210 () Bool)

(assert (=> b!917631 (=> (not res!618353) (not e!515210))))

(declare-datatypes ((array!54749 0))(
  ( (array!54750 (arr!26315 (Array (_ BitVec 32) (_ BitVec 64))) (size!26775 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54749)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30775 0))(
  ( (V!30776 (val!9729 Int)) )
))
(declare-datatypes ((ValueCell!9197 0))(
  ( (ValueCellFull!9197 (v!12244 V!30775)) (EmptyCell!9197) )
))
(declare-datatypes ((array!54751 0))(
  ( (array!54752 (arr!26316 (Array (_ BitVec 32) ValueCell!9197)) (size!26776 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54751)

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!917631 (= res!618353 (and (= (size!26776 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26775 _keys!1487) (size!26776 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917632 () Bool)

(declare-fun e!515209 () Bool)

(assert (=> b!917632 (= e!515209 false)))

(declare-fun lt!412216 () V!30775)

(declare-datatypes ((tuple2!12592 0))(
  ( (tuple2!12593 (_1!6307 (_ BitVec 64)) (_2!6307 V!30775)) )
))
(declare-datatypes ((List!18419 0))(
  ( (Nil!18416) (Cons!18415 (h!19567 tuple2!12592) (t!26024 List!18419)) )
))
(declare-datatypes ((ListLongMap!11291 0))(
  ( (ListLongMap!11292 (toList!5661 List!18419)) )
))
(declare-fun lt!412217 () ListLongMap!11291)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!544 (ListLongMap!11291 (_ BitVec 64)) V!30775)

(assert (=> b!917632 (= lt!412216 (apply!544 lt!412217 k0!1099))))

(declare-fun b!917633 () Bool)

(declare-fun e!515212 () Bool)

(declare-fun tp_is_empty!19357 () Bool)

(assert (=> b!917633 (= e!515212 tp_is_empty!19357)))

(declare-fun b!917634 () Bool)

(declare-fun res!618352 () Bool)

(assert (=> b!917634 (=> (not res!618352) (not e!515210))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917634 (= res!618352 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26775 _keys!1487))))))

(declare-fun b!917635 () Bool)

(declare-fun e!515208 () Bool)

(assert (=> b!917635 (= e!515208 tp_is_empty!19357)))

(declare-fun res!618354 () Bool)

(assert (=> start!78804 (=> (not res!618354) (not e!515210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78804 (= res!618354 (validMask!0 mask!1881))))

(assert (=> start!78804 e!515210))

(assert (=> start!78804 true))

(declare-fun e!515211 () Bool)

(declare-fun array_inv!20628 (array!54751) Bool)

(assert (=> start!78804 (and (array_inv!20628 _values!1231) e!515211)))

(assert (=> start!78804 tp!58989))

(declare-fun array_inv!20629 (array!54749) Bool)

(assert (=> start!78804 (array_inv!20629 _keys!1487)))

(assert (=> start!78804 tp_is_empty!19357))

(declare-fun b!917636 () Bool)

(declare-fun res!618355 () Bool)

(assert (=> b!917636 (=> (not res!618355) (not e!515210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54749 (_ BitVec 32)) Bool)

(assert (=> b!917636 (= res!618355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917637 () Bool)

(declare-fun res!618356 () Bool)

(assert (=> b!917637 (=> (not res!618356) (not e!515210))))

(declare-datatypes ((List!18420 0))(
  ( (Nil!18417) (Cons!18416 (h!19568 (_ BitVec 64)) (t!26025 List!18420)) )
))
(declare-fun arrayNoDuplicates!0 (array!54749 (_ BitVec 32) List!18420) Bool)

(assert (=> b!917637 (= res!618356 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18417))))

(declare-fun b!917638 () Bool)

(assert (=> b!917638 (= e!515211 (and e!515208 mapRes!30792))))

(declare-fun condMapEmpty!30792 () Bool)

(declare-fun mapDefault!30792 () ValueCell!9197)

(assert (=> b!917638 (= condMapEmpty!30792 (= (arr!26316 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9197)) mapDefault!30792)))))

(declare-fun b!917639 () Bool)

(assert (=> b!917639 (= e!515210 e!515209)))

(declare-fun res!618357 () Bool)

(assert (=> b!917639 (=> (not res!618357) (not e!515209))))

(declare-fun contains!4721 (ListLongMap!11291 (_ BitVec 64)) Bool)

(assert (=> b!917639 (= res!618357 (contains!4721 lt!412217 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30775)

(declare-fun minValue!1173 () V!30775)

(declare-fun getCurrentListMap!2918 (array!54749 array!54751 (_ BitVec 32) (_ BitVec 32) V!30775 V!30775 (_ BitVec 32) Int) ListLongMap!11291)

(assert (=> b!917639 (= lt!412217 (getCurrentListMap!2918 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30792 () Bool)

(declare-fun tp!58988 () Bool)

(assert (=> mapNonEmpty!30792 (= mapRes!30792 (and tp!58988 e!515212))))

(declare-fun mapRest!30792 () (Array (_ BitVec 32) ValueCell!9197))

(declare-fun mapValue!30792 () ValueCell!9197)

(declare-fun mapKey!30792 () (_ BitVec 32))

(assert (=> mapNonEmpty!30792 (= (arr!26316 _values!1231) (store mapRest!30792 mapKey!30792 mapValue!30792))))

(assert (= (and start!78804 res!618354) b!917631))

(assert (= (and b!917631 res!618353) b!917636))

(assert (= (and b!917636 res!618355) b!917637))

(assert (= (and b!917637 res!618356) b!917634))

(assert (= (and b!917634 res!618352) b!917639))

(assert (= (and b!917639 res!618357) b!917632))

(assert (= (and b!917638 condMapEmpty!30792) mapIsEmpty!30792))

(assert (= (and b!917638 (not condMapEmpty!30792)) mapNonEmpty!30792))

(get-info :version)

(assert (= (and mapNonEmpty!30792 ((_ is ValueCellFull!9197) mapValue!30792)) b!917633))

(assert (= (and b!917638 ((_ is ValueCellFull!9197) mapDefault!30792)) b!917635))

(assert (= start!78804 b!917638))

(declare-fun m!851953 () Bool)

(assert (=> b!917632 m!851953))

(declare-fun m!851955 () Bool)

(assert (=> mapNonEmpty!30792 m!851955))

(declare-fun m!851957 () Bool)

(assert (=> start!78804 m!851957))

(declare-fun m!851959 () Bool)

(assert (=> start!78804 m!851959))

(declare-fun m!851961 () Bool)

(assert (=> start!78804 m!851961))

(declare-fun m!851963 () Bool)

(assert (=> b!917636 m!851963))

(declare-fun m!851965 () Bool)

(assert (=> b!917639 m!851965))

(declare-fun m!851967 () Bool)

(assert (=> b!917639 m!851967))

(declare-fun m!851969 () Bool)

(assert (=> b!917637 m!851969))

(check-sat (not b!917639) b_and!27481 (not b_next!16849) (not b!917637) (not b!917636) (not start!78804) (not b!917632) tp_is_empty!19357 (not mapNonEmpty!30792))
(check-sat b_and!27481 (not b_next!16849))
