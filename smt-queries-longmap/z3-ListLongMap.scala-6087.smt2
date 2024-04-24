; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78798 () Bool)

(assert start!78798)

(declare-fun b_free!16843 () Bool)

(declare-fun b_next!16843 () Bool)

(assert (=> start!78798 (= b_free!16843 (not b_next!16843))))

(declare-fun tp!58971 () Bool)

(declare-fun b_and!27475 () Bool)

(assert (=> start!78798 (= tp!58971 b_and!27475)))

(declare-fun res!618299 () Bool)

(declare-fun e!515157 () Bool)

(assert (=> start!78798 (=> (not res!618299) (not e!515157))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78798 (= res!618299 (validMask!0 mask!1881))))

(assert (=> start!78798 e!515157))

(assert (=> start!78798 true))

(declare-datatypes ((V!30767 0))(
  ( (V!30768 (val!9726 Int)) )
))
(declare-datatypes ((ValueCell!9194 0))(
  ( (ValueCellFull!9194 (v!12241 V!30767)) (EmptyCell!9194) )
))
(declare-datatypes ((array!54737 0))(
  ( (array!54738 (arr!26309 (Array (_ BitVec 32) ValueCell!9194)) (size!26769 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54737)

(declare-fun e!515155 () Bool)

(declare-fun array_inv!20624 (array!54737) Bool)

(assert (=> start!78798 (and (array_inv!20624 _values!1231) e!515155)))

(assert (=> start!78798 tp!58971))

(declare-datatypes ((array!54739 0))(
  ( (array!54740 (arr!26310 (Array (_ BitVec 32) (_ BitVec 64))) (size!26770 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54739)

(declare-fun array_inv!20625 (array!54739) Bool)

(assert (=> start!78798 (array_inv!20625 _keys!1487)))

(declare-fun tp_is_empty!19351 () Bool)

(assert (=> start!78798 tp_is_empty!19351))

(declare-fun b!917550 () Bool)

(declare-fun e!515158 () Bool)

(assert (=> b!917550 (= e!515158 tp_is_empty!19351)))

(declare-fun b!917551 () Bool)

(declare-fun e!515156 () Bool)

(assert (=> b!917551 (= e!515156 false)))

(declare-fun lt!412199 () V!30767)

(declare-datatypes ((tuple2!12586 0))(
  ( (tuple2!12587 (_1!6304 (_ BitVec 64)) (_2!6304 V!30767)) )
))
(declare-datatypes ((List!18414 0))(
  ( (Nil!18411) (Cons!18410 (h!19562 tuple2!12586) (t!26019 List!18414)) )
))
(declare-datatypes ((ListLongMap!11285 0))(
  ( (ListLongMap!11286 (toList!5658 List!18414)) )
))
(declare-fun lt!412198 () ListLongMap!11285)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!542 (ListLongMap!11285 (_ BitVec 64)) V!30767)

(assert (=> b!917551 (= lt!412199 (apply!542 lt!412198 k0!1099))))

(declare-fun b!917552 () Bool)

(declare-fun res!618303 () Bool)

(assert (=> b!917552 (=> (not res!618303) (not e!515157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54739 (_ BitVec 32)) Bool)

(assert (=> b!917552 (= res!618303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917553 () Bool)

(declare-fun res!618300 () Bool)

(assert (=> b!917553 (=> (not res!618300) (not e!515157))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917553 (= res!618300 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26770 _keys!1487))))))

(declare-fun mapIsEmpty!30783 () Bool)

(declare-fun mapRes!30783 () Bool)

(assert (=> mapIsEmpty!30783 mapRes!30783))

(declare-fun b!917554 () Bool)

(declare-fun res!618301 () Bool)

(assert (=> b!917554 (=> (not res!618301) (not e!515157))))

(declare-datatypes ((List!18415 0))(
  ( (Nil!18412) (Cons!18411 (h!19563 (_ BitVec 64)) (t!26020 List!18415)) )
))
(declare-fun arrayNoDuplicates!0 (array!54739 (_ BitVec 32) List!18415) Bool)

(assert (=> b!917554 (= res!618301 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18412))))

(declare-fun b!917555 () Bool)

(declare-fun e!515153 () Bool)

(assert (=> b!917555 (= e!515153 tp_is_empty!19351)))

(declare-fun mapNonEmpty!30783 () Bool)

(declare-fun tp!58970 () Bool)

(assert (=> mapNonEmpty!30783 (= mapRes!30783 (and tp!58970 e!515153))))

(declare-fun mapValue!30783 () ValueCell!9194)

(declare-fun mapKey!30783 () (_ BitVec 32))

(declare-fun mapRest!30783 () (Array (_ BitVec 32) ValueCell!9194))

(assert (=> mapNonEmpty!30783 (= (arr!26309 _values!1231) (store mapRest!30783 mapKey!30783 mapValue!30783))))

(declare-fun b!917556 () Bool)

(assert (=> b!917556 (= e!515155 (and e!515158 mapRes!30783))))

(declare-fun condMapEmpty!30783 () Bool)

(declare-fun mapDefault!30783 () ValueCell!9194)

(assert (=> b!917556 (= condMapEmpty!30783 (= (arr!26309 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9194)) mapDefault!30783)))))

(declare-fun b!917557 () Bool)

(assert (=> b!917557 (= e!515157 e!515156)))

(declare-fun res!618302 () Bool)

(assert (=> b!917557 (=> (not res!618302) (not e!515156))))

(declare-fun contains!4719 (ListLongMap!11285 (_ BitVec 64)) Bool)

(assert (=> b!917557 (= res!618302 (contains!4719 lt!412198 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30767)

(declare-fun minValue!1173 () V!30767)

(declare-fun getCurrentListMap!2916 (array!54739 array!54737 (_ BitVec 32) (_ BitVec 32) V!30767 V!30767 (_ BitVec 32) Int) ListLongMap!11285)

(assert (=> b!917557 (= lt!412198 (getCurrentListMap!2916 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917558 () Bool)

(declare-fun res!618298 () Bool)

(assert (=> b!917558 (=> (not res!618298) (not e!515157))))

(assert (=> b!917558 (= res!618298 (and (= (size!26769 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26770 _keys!1487) (size!26769 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78798 res!618299) b!917558))

(assert (= (and b!917558 res!618298) b!917552))

(assert (= (and b!917552 res!618303) b!917554))

(assert (= (and b!917554 res!618301) b!917553))

(assert (= (and b!917553 res!618300) b!917557))

(assert (= (and b!917557 res!618302) b!917551))

(assert (= (and b!917556 condMapEmpty!30783) mapIsEmpty!30783))

(assert (= (and b!917556 (not condMapEmpty!30783)) mapNonEmpty!30783))

(get-info :version)

(assert (= (and mapNonEmpty!30783 ((_ is ValueCellFull!9194) mapValue!30783)) b!917555))

(assert (= (and b!917556 ((_ is ValueCellFull!9194) mapDefault!30783)) b!917550))

(assert (= start!78798 b!917556))

(declare-fun m!851899 () Bool)

(assert (=> b!917552 m!851899))

(declare-fun m!851901 () Bool)

(assert (=> b!917557 m!851901))

(declare-fun m!851903 () Bool)

(assert (=> b!917557 m!851903))

(declare-fun m!851905 () Bool)

(assert (=> start!78798 m!851905))

(declare-fun m!851907 () Bool)

(assert (=> start!78798 m!851907))

(declare-fun m!851909 () Bool)

(assert (=> start!78798 m!851909))

(declare-fun m!851911 () Bool)

(assert (=> mapNonEmpty!30783 m!851911))

(declare-fun m!851913 () Bool)

(assert (=> b!917554 m!851913))

(declare-fun m!851915 () Bool)

(assert (=> b!917551 m!851915))

(check-sat (not b!917554) (not b!917552) (not b_next!16843) tp_is_empty!19351 (not mapNonEmpty!30783) (not start!78798) (not b!917557) (not b!917551) b_and!27475)
(check-sat b_and!27475 (not b_next!16843))
