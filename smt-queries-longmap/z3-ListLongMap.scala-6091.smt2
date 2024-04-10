; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78656 () Bool)

(assert start!78656)

(declare-fun b_free!16869 () Bool)

(declare-fun b_next!16869 () Bool)

(assert (=> start!78656 (= b_free!16869 (not b_next!16869))))

(declare-fun tp!59048 () Bool)

(declare-fun b_and!27491 () Bool)

(assert (=> start!78656 (= tp!59048 b_and!27491)))

(declare-fun b!916998 () Bool)

(declare-fun res!618189 () Bool)

(declare-fun e!514810 () Bool)

(assert (=> b!916998 (=> (not res!618189) (not e!514810))))

(declare-datatypes ((array!54740 0))(
  ( (array!54741 (arr!26315 (Array (_ BitVec 32) (_ BitVec 64))) (size!26774 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54740)

(declare-datatypes ((List!18453 0))(
  ( (Nil!18450) (Cons!18449 (h!19595 (_ BitVec 64)) (t!26066 List!18453)) )
))
(declare-fun arrayNoDuplicates!0 (array!54740 (_ BitVec 32) List!18453) Bool)

(assert (=> b!916998 (= res!618189 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18450))))

(declare-fun b!916999 () Bool)

(declare-fun e!514806 () Bool)

(declare-fun tp_is_empty!19377 () Bool)

(assert (=> b!916999 (= e!514806 tp_is_empty!19377)))

(declare-fun b!917000 () Bool)

(declare-fun res!618193 () Bool)

(assert (=> b!917000 (=> (not res!618193) (not e!514810))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917000 (= res!618193 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26774 _keys!1487))))))

(declare-fun res!618192 () Bool)

(assert (=> start!78656 (=> (not res!618192) (not e!514810))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78656 (= res!618192 (validMask!0 mask!1881))))

(assert (=> start!78656 e!514810))

(assert (=> start!78656 true))

(declare-datatypes ((V!30801 0))(
  ( (V!30802 (val!9739 Int)) )
))
(declare-datatypes ((ValueCell!9207 0))(
  ( (ValueCellFull!9207 (v!12257 V!30801)) (EmptyCell!9207) )
))
(declare-datatypes ((array!54742 0))(
  ( (array!54743 (arr!26316 (Array (_ BitVec 32) ValueCell!9207)) (size!26775 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54742)

(declare-fun e!514805 () Bool)

(declare-fun array_inv!20520 (array!54742) Bool)

(assert (=> start!78656 (and (array_inv!20520 _values!1231) e!514805)))

(assert (=> start!78656 tp!59048))

(declare-fun array_inv!20521 (array!54740) Bool)

(assert (=> start!78656 (array_inv!20521 _keys!1487)))

(assert (=> start!78656 tp_is_empty!19377))

(declare-fun mapIsEmpty!30822 () Bool)

(declare-fun mapRes!30822 () Bool)

(assert (=> mapIsEmpty!30822 mapRes!30822))

(declare-fun b!917001 () Bool)

(declare-fun e!514808 () Bool)

(assert (=> b!917001 (= e!514808 tp_is_empty!19377)))

(declare-fun b!917002 () Bool)

(declare-fun res!618191 () Bool)

(assert (=> b!917002 (=> (not res!618191) (not e!514810))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917002 (= res!618191 (and (= (size!26775 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26774 _keys!1487) (size!26775 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30822 () Bool)

(declare-fun tp!59047 () Bool)

(assert (=> mapNonEmpty!30822 (= mapRes!30822 (and tp!59047 e!514806))))

(declare-fun mapValue!30822 () ValueCell!9207)

(declare-fun mapKey!30822 () (_ BitVec 32))

(declare-fun mapRest!30822 () (Array (_ BitVec 32) ValueCell!9207))

(assert (=> mapNonEmpty!30822 (= (arr!26316 _values!1231) (store mapRest!30822 mapKey!30822 mapValue!30822))))

(declare-fun b!917003 () Bool)

(declare-fun e!514809 () Bool)

(assert (=> b!917003 (= e!514809 false)))

(declare-fun lt!411915 () V!30801)

(declare-datatypes ((tuple2!12642 0))(
  ( (tuple2!12643 (_1!6332 (_ BitVec 64)) (_2!6332 V!30801)) )
))
(declare-datatypes ((List!18454 0))(
  ( (Nil!18451) (Cons!18450 (h!19596 tuple2!12642) (t!26067 List!18454)) )
))
(declare-datatypes ((ListLongMap!11339 0))(
  ( (ListLongMap!11340 (toList!5685 List!18454)) )
))
(declare-fun lt!411916 () ListLongMap!11339)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!540 (ListLongMap!11339 (_ BitVec 64)) V!30801)

(assert (=> b!917003 (= lt!411915 (apply!540 lt!411916 k0!1099))))

(declare-fun b!917004 () Bool)

(declare-fun res!618188 () Bool)

(assert (=> b!917004 (=> (not res!618188) (not e!514810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54740 (_ BitVec 32)) Bool)

(assert (=> b!917004 (= res!618188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917005 () Bool)

(assert (=> b!917005 (= e!514805 (and e!514808 mapRes!30822))))

(declare-fun condMapEmpty!30822 () Bool)

(declare-fun mapDefault!30822 () ValueCell!9207)

(assert (=> b!917005 (= condMapEmpty!30822 (= (arr!26316 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9207)) mapDefault!30822)))))

(declare-fun b!917006 () Bool)

(assert (=> b!917006 (= e!514810 e!514809)))

(declare-fun res!618190 () Bool)

(assert (=> b!917006 (=> (not res!618190) (not e!514809))))

(declare-fun contains!4737 (ListLongMap!11339 (_ BitVec 64)) Bool)

(assert (=> b!917006 (= res!618190 (contains!4737 lt!411916 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30801)

(declare-fun minValue!1173 () V!30801)

(declare-fun getCurrentListMap!2944 (array!54740 array!54742 (_ BitVec 32) (_ BitVec 32) V!30801 V!30801 (_ BitVec 32) Int) ListLongMap!11339)

(assert (=> b!917006 (= lt!411916 (getCurrentListMap!2944 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78656 res!618192) b!917002))

(assert (= (and b!917002 res!618191) b!917004))

(assert (= (and b!917004 res!618188) b!916998))

(assert (= (and b!916998 res!618189) b!917000))

(assert (= (and b!917000 res!618193) b!917006))

(assert (= (and b!917006 res!618190) b!917003))

(assert (= (and b!917005 condMapEmpty!30822) mapIsEmpty!30822))

(assert (= (and b!917005 (not condMapEmpty!30822)) mapNonEmpty!30822))

(get-info :version)

(assert (= (and mapNonEmpty!30822 ((_ is ValueCellFull!9207) mapValue!30822)) b!916999))

(assert (= (and b!917005 ((_ is ValueCellFull!9207) mapDefault!30822)) b!917001))

(assert (= start!78656 b!917005))

(declare-fun m!850839 () Bool)

(assert (=> b!917006 m!850839))

(declare-fun m!850841 () Bool)

(assert (=> b!917006 m!850841))

(declare-fun m!850843 () Bool)

(assert (=> mapNonEmpty!30822 m!850843))

(declare-fun m!850845 () Bool)

(assert (=> b!917003 m!850845))

(declare-fun m!850847 () Bool)

(assert (=> b!917004 m!850847))

(declare-fun m!850849 () Bool)

(assert (=> b!916998 m!850849))

(declare-fun m!850851 () Bool)

(assert (=> start!78656 m!850851))

(declare-fun m!850853 () Bool)

(assert (=> start!78656 m!850853))

(declare-fun m!850855 () Bool)

(assert (=> start!78656 m!850855))

(check-sat (not b!917003) (not start!78656) (not mapNonEmpty!30822) tp_is_empty!19377 (not b!917004) (not b_next!16869) (not b!917006) b_and!27491 (not b!916998))
(check-sat b_and!27491 (not b_next!16869))
