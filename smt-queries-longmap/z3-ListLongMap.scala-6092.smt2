; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78828 () Bool)

(assert start!78828)

(declare-fun b_free!16873 () Bool)

(declare-fun b_next!16873 () Bool)

(assert (=> start!78828 (= b_free!16873 (not b_next!16873))))

(declare-fun tp!59060 () Bool)

(declare-fun b_and!27505 () Bool)

(assert (=> start!78828 (= tp!59060 b_and!27505)))

(declare-fun res!618568 () Bool)

(declare-fun e!515427 () Bool)

(assert (=> start!78828 (=> (not res!618568) (not e!515427))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78828 (= res!618568 (validMask!0 mask!1881))))

(assert (=> start!78828 e!515427))

(assert (=> start!78828 true))

(declare-datatypes ((V!30807 0))(
  ( (V!30808 (val!9741 Int)) )
))
(declare-datatypes ((ValueCell!9209 0))(
  ( (ValueCellFull!9209 (v!12256 V!30807)) (EmptyCell!9209) )
))
(declare-datatypes ((array!54795 0))(
  ( (array!54796 (arr!26338 (Array (_ BitVec 32) ValueCell!9209)) (size!26798 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54795)

(declare-fun e!515428 () Bool)

(declare-fun array_inv!20640 (array!54795) Bool)

(assert (=> start!78828 (and (array_inv!20640 _values!1231) e!515428)))

(assert (=> start!78828 tp!59060))

(declare-datatypes ((array!54797 0))(
  ( (array!54798 (arr!26339 (Array (_ BitVec 32) (_ BitVec 64))) (size!26799 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54797)

(declare-fun array_inv!20641 (array!54797) Bool)

(assert (=> start!78828 (array_inv!20641 _keys!1487)))

(declare-fun tp_is_empty!19381 () Bool)

(assert (=> start!78828 tp_is_empty!19381))

(declare-fun b!917955 () Bool)

(declare-fun e!515425 () Bool)

(declare-fun mapRes!30828 () Bool)

(assert (=> b!917955 (= e!515428 (and e!515425 mapRes!30828))))

(declare-fun condMapEmpty!30828 () Bool)

(declare-fun mapDefault!30828 () ValueCell!9209)

(assert (=> b!917955 (= condMapEmpty!30828 (= (arr!26338 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9209)) mapDefault!30828)))))

(declare-fun b!917956 () Bool)

(declare-fun res!618571 () Bool)

(assert (=> b!917956 (=> (not res!618571) (not e!515427))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917956 (= res!618571 (and (= (size!26798 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26799 _keys!1487) (size!26798 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30828 () Bool)

(assert (=> mapIsEmpty!30828 mapRes!30828))

(declare-fun mapNonEmpty!30828 () Bool)

(declare-fun tp!59061 () Bool)

(declare-fun e!515426 () Bool)

(assert (=> mapNonEmpty!30828 (= mapRes!30828 (and tp!59061 e!515426))))

(declare-fun mapValue!30828 () ValueCell!9209)

(declare-fun mapRest!30828 () (Array (_ BitVec 32) ValueCell!9209))

(declare-fun mapKey!30828 () (_ BitVec 32))

(assert (=> mapNonEmpty!30828 (= (arr!26338 _values!1231) (store mapRest!30828 mapKey!30828 mapValue!30828))))

(declare-fun b!917957 () Bool)

(declare-fun e!515424 () Bool)

(assert (=> b!917957 (= e!515424 false)))

(declare-fun lt!412289 () V!30807)

(declare-datatypes ((tuple2!12612 0))(
  ( (tuple2!12613 (_1!6317 (_ BitVec 64)) (_2!6317 V!30807)) )
))
(declare-datatypes ((List!18435 0))(
  ( (Nil!18432) (Cons!18431 (h!19583 tuple2!12612) (t!26040 List!18435)) )
))
(declare-datatypes ((ListLongMap!11311 0))(
  ( (ListLongMap!11312 (toList!5671 List!18435)) )
))
(declare-fun lt!412288 () ListLongMap!11311)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!552 (ListLongMap!11311 (_ BitVec 64)) V!30807)

(assert (=> b!917957 (= lt!412289 (apply!552 lt!412288 k0!1099))))

(declare-fun b!917958 () Bool)

(declare-fun res!618570 () Bool)

(assert (=> b!917958 (=> (not res!618570) (not e!515427))))

(declare-datatypes ((List!18436 0))(
  ( (Nil!18433) (Cons!18432 (h!19584 (_ BitVec 64)) (t!26041 List!18436)) )
))
(declare-fun arrayNoDuplicates!0 (array!54797 (_ BitVec 32) List!18436) Bool)

(assert (=> b!917958 (= res!618570 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18433))))

(declare-fun b!917959 () Bool)

(assert (=> b!917959 (= e!515426 tp_is_empty!19381)))

(declare-fun b!917960 () Bool)

(assert (=> b!917960 (= e!515427 e!515424)))

(declare-fun res!618572 () Bool)

(assert (=> b!917960 (=> (not res!618572) (not e!515424))))

(declare-fun contains!4729 (ListLongMap!11311 (_ BitVec 64)) Bool)

(assert (=> b!917960 (= res!618572 (contains!4729 lt!412288 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30807)

(declare-fun minValue!1173 () V!30807)

(declare-fun getCurrentListMap!2926 (array!54797 array!54795 (_ BitVec 32) (_ BitVec 32) V!30807 V!30807 (_ BitVec 32) Int) ListLongMap!11311)

(assert (=> b!917960 (= lt!412288 (getCurrentListMap!2926 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917961 () Bool)

(declare-fun res!618569 () Bool)

(assert (=> b!917961 (=> (not res!618569) (not e!515427))))

(assert (=> b!917961 (= res!618569 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26799 _keys!1487))))))

(declare-fun b!917962 () Bool)

(assert (=> b!917962 (= e!515425 tp_is_empty!19381)))

(declare-fun b!917963 () Bool)

(declare-fun res!618573 () Bool)

(assert (=> b!917963 (=> (not res!618573) (not e!515427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54797 (_ BitVec 32)) Bool)

(assert (=> b!917963 (= res!618573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78828 res!618568) b!917956))

(assert (= (and b!917956 res!618571) b!917963))

(assert (= (and b!917963 res!618573) b!917958))

(assert (= (and b!917958 res!618570) b!917961))

(assert (= (and b!917961 res!618569) b!917960))

(assert (= (and b!917960 res!618572) b!917957))

(assert (= (and b!917955 condMapEmpty!30828) mapIsEmpty!30828))

(assert (= (and b!917955 (not condMapEmpty!30828)) mapNonEmpty!30828))

(get-info :version)

(assert (= (and mapNonEmpty!30828 ((_ is ValueCellFull!9209) mapValue!30828)) b!917959))

(assert (= (and b!917955 ((_ is ValueCellFull!9209) mapDefault!30828)) b!917962))

(assert (= start!78828 b!917955))

(declare-fun m!852169 () Bool)

(assert (=> b!917963 m!852169))

(declare-fun m!852171 () Bool)

(assert (=> start!78828 m!852171))

(declare-fun m!852173 () Bool)

(assert (=> start!78828 m!852173))

(declare-fun m!852175 () Bool)

(assert (=> start!78828 m!852175))

(declare-fun m!852177 () Bool)

(assert (=> b!917958 m!852177))

(declare-fun m!852179 () Bool)

(assert (=> mapNonEmpty!30828 m!852179))

(declare-fun m!852181 () Bool)

(assert (=> b!917957 m!852181))

(declare-fun m!852183 () Bool)

(assert (=> b!917960 m!852183))

(declare-fun m!852185 () Bool)

(assert (=> b!917960 m!852185))

(check-sat (not start!78828) (not b_next!16873) (not b!917963) (not b!917957) b_and!27505 tp_is_empty!19381 (not b!917960) (not mapNonEmpty!30828) (not b!917958))
(check-sat b_and!27505 (not b_next!16873))
