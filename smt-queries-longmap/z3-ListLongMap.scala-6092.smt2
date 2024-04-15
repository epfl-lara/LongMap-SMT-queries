; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78642 () Bool)

(assert start!78642)

(declare-fun b_free!16873 () Bool)

(declare-fun b_next!16873 () Bool)

(assert (=> start!78642 (= b_free!16873 (not b_next!16873))))

(declare-fun tp!59060 () Bool)

(declare-fun b_and!27469 () Bool)

(assert (=> start!78642 (= tp!59060 b_and!27469)))

(declare-fun b!916813 () Bool)

(declare-fun e!514696 () Bool)

(declare-fun e!514698 () Bool)

(declare-fun mapRes!30828 () Bool)

(assert (=> b!916813 (= e!514696 (and e!514698 mapRes!30828))))

(declare-fun condMapEmpty!30828 () Bool)

(declare-datatypes ((V!30807 0))(
  ( (V!30808 (val!9741 Int)) )
))
(declare-datatypes ((ValueCell!9209 0))(
  ( (ValueCellFull!9209 (v!12258 V!30807)) (EmptyCell!9209) )
))
(declare-datatypes ((array!54737 0))(
  ( (array!54738 (arr!26314 (Array (_ BitVec 32) ValueCell!9209)) (size!26775 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54737)

(declare-fun mapDefault!30828 () ValueCell!9209)

(assert (=> b!916813 (= condMapEmpty!30828 (= (arr!26314 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9209)) mapDefault!30828)))))

(declare-fun res!618118 () Bool)

(declare-fun e!514693 () Bool)

(assert (=> start!78642 (=> (not res!618118) (not e!514693))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78642 (= res!618118 (validMask!0 mask!1881))))

(assert (=> start!78642 e!514693))

(assert (=> start!78642 true))

(declare-fun array_inv!20600 (array!54737) Bool)

(assert (=> start!78642 (and (array_inv!20600 _values!1231) e!514696)))

(assert (=> start!78642 tp!59060))

(declare-datatypes ((array!54739 0))(
  ( (array!54740 (arr!26315 (Array (_ BitVec 32) (_ BitVec 64))) (size!26776 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54739)

(declare-fun array_inv!20601 (array!54739) Bool)

(assert (=> start!78642 (array_inv!20601 _keys!1487)))

(declare-fun tp_is_empty!19381 () Bool)

(assert (=> start!78642 tp_is_empty!19381))

(declare-fun b!916814 () Bool)

(declare-fun res!618114 () Bool)

(assert (=> b!916814 (=> (not res!618114) (not e!514693))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916814 (= res!618114 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26776 _keys!1487))))))

(declare-fun b!916815 () Bool)

(declare-fun res!618117 () Bool)

(assert (=> b!916815 (=> (not res!618117) (not e!514693))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916815 (= res!618117 (and (= (size!26775 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26776 _keys!1487) (size!26775 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30828 () Bool)

(declare-fun tp!59061 () Bool)

(declare-fun e!514697 () Bool)

(assert (=> mapNonEmpty!30828 (= mapRes!30828 (and tp!59061 e!514697))))

(declare-fun mapRest!30828 () (Array (_ BitVec 32) ValueCell!9209))

(declare-fun mapKey!30828 () (_ BitVec 32))

(declare-fun mapValue!30828 () ValueCell!9209)

(assert (=> mapNonEmpty!30828 (= (arr!26314 _values!1231) (store mapRest!30828 mapKey!30828 mapValue!30828))))

(declare-fun b!916816 () Bool)

(declare-fun e!514695 () Bool)

(assert (=> b!916816 (= e!514695 false)))

(declare-fun lt!411692 () V!30807)

(declare-datatypes ((tuple2!12692 0))(
  ( (tuple2!12693 (_1!6357 (_ BitVec 64)) (_2!6357 V!30807)) )
))
(declare-datatypes ((List!18482 0))(
  ( (Nil!18479) (Cons!18478 (h!19624 tuple2!12692) (t!26086 List!18482)) )
))
(declare-datatypes ((ListLongMap!11379 0))(
  ( (ListLongMap!11380 (toList!5705 List!18482)) )
))
(declare-fun lt!411691 () ListLongMap!11379)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!546 (ListLongMap!11379 (_ BitVec 64)) V!30807)

(assert (=> b!916816 (= lt!411692 (apply!546 lt!411691 k0!1099))))

(declare-fun b!916817 () Bool)

(assert (=> b!916817 (= e!514697 tp_is_empty!19381)))

(declare-fun b!916818 () Bool)

(declare-fun res!618116 () Bool)

(assert (=> b!916818 (=> (not res!618116) (not e!514693))))

(declare-datatypes ((List!18483 0))(
  ( (Nil!18480) (Cons!18479 (h!19625 (_ BitVec 64)) (t!26087 List!18483)) )
))
(declare-fun arrayNoDuplicates!0 (array!54739 (_ BitVec 32) List!18483) Bool)

(assert (=> b!916818 (= res!618116 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18480))))

(declare-fun b!916819 () Bool)

(assert (=> b!916819 (= e!514698 tp_is_empty!19381)))

(declare-fun mapIsEmpty!30828 () Bool)

(assert (=> mapIsEmpty!30828 mapRes!30828))

(declare-fun b!916820 () Bool)

(assert (=> b!916820 (= e!514693 e!514695)))

(declare-fun res!618119 () Bool)

(assert (=> b!916820 (=> (not res!618119) (not e!514695))))

(declare-fun contains!4712 (ListLongMap!11379 (_ BitVec 64)) Bool)

(assert (=> b!916820 (= res!618119 (contains!4712 lt!411691 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30807)

(declare-fun minValue!1173 () V!30807)

(declare-fun getCurrentListMap!2901 (array!54739 array!54737 (_ BitVec 32) (_ BitVec 32) V!30807 V!30807 (_ BitVec 32) Int) ListLongMap!11379)

(assert (=> b!916820 (= lt!411691 (getCurrentListMap!2901 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916821 () Bool)

(declare-fun res!618115 () Bool)

(assert (=> b!916821 (=> (not res!618115) (not e!514693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54739 (_ BitVec 32)) Bool)

(assert (=> b!916821 (= res!618115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78642 res!618118) b!916815))

(assert (= (and b!916815 res!618117) b!916821))

(assert (= (and b!916821 res!618115) b!916818))

(assert (= (and b!916818 res!618116) b!916814))

(assert (= (and b!916814 res!618114) b!916820))

(assert (= (and b!916820 res!618119) b!916816))

(assert (= (and b!916813 condMapEmpty!30828) mapIsEmpty!30828))

(assert (= (and b!916813 (not condMapEmpty!30828)) mapNonEmpty!30828))

(get-info :version)

(assert (= (and mapNonEmpty!30828 ((_ is ValueCellFull!9209) mapValue!30828)) b!916817))

(assert (= (and b!916813 ((_ is ValueCellFull!9209) mapDefault!30828)) b!916819))

(assert (= start!78642 b!916813))

(declare-fun m!850117 () Bool)

(assert (=> b!916820 m!850117))

(declare-fun m!850119 () Bool)

(assert (=> b!916820 m!850119))

(declare-fun m!850121 () Bool)

(assert (=> mapNonEmpty!30828 m!850121))

(declare-fun m!850123 () Bool)

(assert (=> b!916821 m!850123))

(declare-fun m!850125 () Bool)

(assert (=> start!78642 m!850125))

(declare-fun m!850127 () Bool)

(assert (=> start!78642 m!850127))

(declare-fun m!850129 () Bool)

(assert (=> start!78642 m!850129))

(declare-fun m!850131 () Bool)

(assert (=> b!916818 m!850131))

(declare-fun m!850133 () Bool)

(assert (=> b!916816 m!850133))

(check-sat (not b!916820) (not mapNonEmpty!30828) (not b!916818) (not b!916816) (not b_next!16873) b_and!27469 (not b!916821) tp_is_empty!19381 (not start!78642))
(check-sat b_and!27469 (not b_next!16873))
