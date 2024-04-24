; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78816 () Bool)

(assert start!78816)

(declare-fun b_free!16861 () Bool)

(declare-fun b_next!16861 () Bool)

(assert (=> start!78816 (= b_free!16861 (not b_next!16861))))

(declare-fun tp!59024 () Bool)

(declare-fun b_and!27493 () Bool)

(assert (=> start!78816 (= tp!59024 b_and!27493)))

(declare-fun b!917793 () Bool)

(declare-fun e!515318 () Bool)

(assert (=> b!917793 (= e!515318 false)))

(declare-datatypes ((V!30791 0))(
  ( (V!30792 (val!9735 Int)) )
))
(declare-fun lt!412253 () V!30791)

(declare-datatypes ((tuple2!12604 0))(
  ( (tuple2!12605 (_1!6313 (_ BitVec 64)) (_2!6313 V!30791)) )
))
(declare-datatypes ((List!18428 0))(
  ( (Nil!18425) (Cons!18424 (h!19576 tuple2!12604) (t!26033 List!18428)) )
))
(declare-datatypes ((ListLongMap!11303 0))(
  ( (ListLongMap!11304 (toList!5667 List!18428)) )
))
(declare-fun lt!412252 () ListLongMap!11303)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!549 (ListLongMap!11303 (_ BitVec 64)) V!30791)

(assert (=> b!917793 (= lt!412253 (apply!549 lt!412252 k0!1099))))

(declare-fun b!917794 () Bool)

(declare-fun e!515319 () Bool)

(declare-fun tp_is_empty!19369 () Bool)

(assert (=> b!917794 (= e!515319 tp_is_empty!19369)))

(declare-fun mapIsEmpty!30810 () Bool)

(declare-fun mapRes!30810 () Bool)

(assert (=> mapIsEmpty!30810 mapRes!30810))

(declare-fun res!618465 () Bool)

(declare-fun e!515320 () Bool)

(assert (=> start!78816 (=> (not res!618465) (not e!515320))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78816 (= res!618465 (validMask!0 mask!1881))))

(assert (=> start!78816 e!515320))

(assert (=> start!78816 true))

(declare-datatypes ((ValueCell!9203 0))(
  ( (ValueCellFull!9203 (v!12250 V!30791)) (EmptyCell!9203) )
))
(declare-datatypes ((array!54771 0))(
  ( (array!54772 (arr!26326 (Array (_ BitVec 32) ValueCell!9203)) (size!26786 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54771)

(declare-fun e!515315 () Bool)

(declare-fun array_inv!20634 (array!54771) Bool)

(assert (=> start!78816 (and (array_inv!20634 _values!1231) e!515315)))

(assert (=> start!78816 tp!59024))

(declare-datatypes ((array!54773 0))(
  ( (array!54774 (arr!26327 (Array (_ BitVec 32) (_ BitVec 64))) (size!26787 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54773)

(declare-fun array_inv!20635 (array!54773) Bool)

(assert (=> start!78816 (array_inv!20635 _keys!1487)))

(assert (=> start!78816 tp_is_empty!19369))

(declare-fun b!917795 () Bool)

(declare-fun res!618461 () Bool)

(assert (=> b!917795 (=> (not res!618461) (not e!515320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54773 (_ BitVec 32)) Bool)

(assert (=> b!917795 (= res!618461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917796 () Bool)

(declare-fun res!618464 () Bool)

(assert (=> b!917796 (=> (not res!618464) (not e!515320))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917796 (= res!618464 (and (= (size!26786 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26787 _keys!1487) (size!26786 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917797 () Bool)

(declare-fun res!618463 () Bool)

(assert (=> b!917797 (=> (not res!618463) (not e!515320))))

(declare-datatypes ((List!18429 0))(
  ( (Nil!18426) (Cons!18425 (h!19577 (_ BitVec 64)) (t!26034 List!18429)) )
))
(declare-fun arrayNoDuplicates!0 (array!54773 (_ BitVec 32) List!18429) Bool)

(assert (=> b!917797 (= res!618463 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18426))))

(declare-fun mapNonEmpty!30810 () Bool)

(declare-fun tp!59025 () Bool)

(declare-fun e!515316 () Bool)

(assert (=> mapNonEmpty!30810 (= mapRes!30810 (and tp!59025 e!515316))))

(declare-fun mapValue!30810 () ValueCell!9203)

(declare-fun mapRest!30810 () (Array (_ BitVec 32) ValueCell!9203))

(declare-fun mapKey!30810 () (_ BitVec 32))

(assert (=> mapNonEmpty!30810 (= (arr!26326 _values!1231) (store mapRest!30810 mapKey!30810 mapValue!30810))))

(declare-fun b!917798 () Bool)

(assert (=> b!917798 (= e!515316 tp_is_empty!19369)))

(declare-fun b!917799 () Bool)

(assert (=> b!917799 (= e!515320 e!515318)))

(declare-fun res!618460 () Bool)

(assert (=> b!917799 (=> (not res!618460) (not e!515318))))

(declare-fun contains!4725 (ListLongMap!11303 (_ BitVec 64)) Bool)

(assert (=> b!917799 (= res!618460 (contains!4725 lt!412252 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30791)

(declare-fun minValue!1173 () V!30791)

(declare-fun getCurrentListMap!2922 (array!54773 array!54771 (_ BitVec 32) (_ BitVec 32) V!30791 V!30791 (_ BitVec 32) Int) ListLongMap!11303)

(assert (=> b!917799 (= lt!412252 (getCurrentListMap!2922 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917800 () Bool)

(assert (=> b!917800 (= e!515315 (and e!515319 mapRes!30810))))

(declare-fun condMapEmpty!30810 () Bool)

(declare-fun mapDefault!30810 () ValueCell!9203)

(assert (=> b!917800 (= condMapEmpty!30810 (= (arr!26326 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9203)) mapDefault!30810)))))

(declare-fun b!917801 () Bool)

(declare-fun res!618462 () Bool)

(assert (=> b!917801 (=> (not res!618462) (not e!515320))))

(assert (=> b!917801 (= res!618462 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26787 _keys!1487))))))

(assert (= (and start!78816 res!618465) b!917796))

(assert (= (and b!917796 res!618464) b!917795))

(assert (= (and b!917795 res!618461) b!917797))

(assert (= (and b!917797 res!618463) b!917801))

(assert (= (and b!917801 res!618462) b!917799))

(assert (= (and b!917799 res!618460) b!917793))

(assert (= (and b!917800 condMapEmpty!30810) mapIsEmpty!30810))

(assert (= (and b!917800 (not condMapEmpty!30810)) mapNonEmpty!30810))

(get-info :version)

(assert (= (and mapNonEmpty!30810 ((_ is ValueCellFull!9203) mapValue!30810)) b!917798))

(assert (= (and b!917800 ((_ is ValueCellFull!9203) mapDefault!30810)) b!917794))

(assert (= start!78816 b!917800))

(declare-fun m!852061 () Bool)

(assert (=> b!917795 m!852061))

(declare-fun m!852063 () Bool)

(assert (=> b!917799 m!852063))

(declare-fun m!852065 () Bool)

(assert (=> b!917799 m!852065))

(declare-fun m!852067 () Bool)

(assert (=> b!917793 m!852067))

(declare-fun m!852069 () Bool)

(assert (=> b!917797 m!852069))

(declare-fun m!852071 () Bool)

(assert (=> mapNonEmpty!30810 m!852071))

(declare-fun m!852073 () Bool)

(assert (=> start!78816 m!852073))

(declare-fun m!852075 () Bool)

(assert (=> start!78816 m!852075))

(declare-fun m!852077 () Bool)

(assert (=> start!78816 m!852077))

(check-sat (not b!917799) (not b!917797) (not b!917793) (not b!917795) (not start!78816) b_and!27493 (not b_next!16861) (not mapNonEmpty!30810) tp_is_empty!19369)
(check-sat b_and!27493 (not b_next!16861))
