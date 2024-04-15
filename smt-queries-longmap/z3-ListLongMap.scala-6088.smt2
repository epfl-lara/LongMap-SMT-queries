; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78618 () Bool)

(assert start!78618)

(declare-fun b_free!16849 () Bool)

(declare-fun b_next!16849 () Bool)

(assert (=> start!78618 (= b_free!16849 (not b_next!16849))))

(declare-fun tp!58989 () Bool)

(declare-fun b_and!27445 () Bool)

(assert (=> start!78618 (= tp!58989 b_and!27445)))

(declare-fun mapNonEmpty!30792 () Bool)

(declare-fun mapRes!30792 () Bool)

(declare-fun tp!58988 () Bool)

(declare-fun e!514481 () Bool)

(assert (=> mapNonEmpty!30792 (= mapRes!30792 (and tp!58988 e!514481))))

(declare-datatypes ((V!30775 0))(
  ( (V!30776 (val!9729 Int)) )
))
(declare-datatypes ((ValueCell!9197 0))(
  ( (ValueCellFull!9197 (v!12246 V!30775)) (EmptyCell!9197) )
))
(declare-datatypes ((array!54691 0))(
  ( (array!54692 (arr!26291 (Array (_ BitVec 32) ValueCell!9197)) (size!26752 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54691)

(declare-fun mapValue!30792 () ValueCell!9197)

(declare-fun mapKey!30792 () (_ BitVec 32))

(declare-fun mapRest!30792 () (Array (_ BitVec 32) ValueCell!9197))

(assert (=> mapNonEmpty!30792 (= (arr!26291 _values!1231) (store mapRest!30792 mapKey!30792 mapValue!30792))))

(declare-fun b!916489 () Bool)

(declare-fun res!617902 () Bool)

(declare-fun e!514478 () Bool)

(assert (=> b!916489 (=> (not res!617902) (not e!514478))))

(declare-datatypes ((array!54693 0))(
  ( (array!54694 (arr!26292 (Array (_ BitVec 32) (_ BitVec 64))) (size!26753 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54693)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916489 (= res!617902 (and (= (size!26752 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26753 _keys!1487) (size!26752 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30792 () Bool)

(assert (=> mapIsEmpty!30792 mapRes!30792))

(declare-fun b!916490 () Bool)

(declare-fun e!514477 () Bool)

(assert (=> b!916490 (= e!514478 e!514477)))

(declare-fun res!617901 () Bool)

(assert (=> b!916490 (=> (not res!617901) (not e!514477))))

(declare-datatypes ((tuple2!12672 0))(
  ( (tuple2!12673 (_1!6347 (_ BitVec 64)) (_2!6347 V!30775)) )
))
(declare-datatypes ((List!18466 0))(
  ( (Nil!18463) (Cons!18462 (h!19608 tuple2!12672) (t!26070 List!18466)) )
))
(declare-datatypes ((ListLongMap!11359 0))(
  ( (ListLongMap!11360 (toList!5695 List!18466)) )
))
(declare-fun lt!411619 () ListLongMap!11359)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4704 (ListLongMap!11359 (_ BitVec 64)) Bool)

(assert (=> b!916490 (= res!617901 (contains!4704 lt!411619 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30775)

(declare-fun minValue!1173 () V!30775)

(declare-fun getCurrentListMap!2893 (array!54693 array!54691 (_ BitVec 32) (_ BitVec 32) V!30775 V!30775 (_ BitVec 32) Int) ListLongMap!11359)

(assert (=> b!916490 (= lt!411619 (getCurrentListMap!2893 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916491 () Bool)

(declare-fun res!617903 () Bool)

(assert (=> b!916491 (=> (not res!617903) (not e!514478))))

(assert (=> b!916491 (= res!617903 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26753 _keys!1487))))))

(declare-fun b!916492 () Bool)

(declare-fun e!514480 () Bool)

(declare-fun tp_is_empty!19357 () Bool)

(assert (=> b!916492 (= e!514480 tp_is_empty!19357)))

(declare-fun b!916493 () Bool)

(assert (=> b!916493 (= e!514477 false)))

(declare-fun lt!411620 () V!30775)

(declare-fun apply!538 (ListLongMap!11359 (_ BitVec 64)) V!30775)

(assert (=> b!916493 (= lt!411620 (apply!538 lt!411619 k0!1099))))

(declare-fun res!617899 () Bool)

(assert (=> start!78618 (=> (not res!617899) (not e!514478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78618 (= res!617899 (validMask!0 mask!1881))))

(assert (=> start!78618 e!514478))

(assert (=> start!78618 true))

(declare-fun e!514479 () Bool)

(declare-fun array_inv!20590 (array!54691) Bool)

(assert (=> start!78618 (and (array_inv!20590 _values!1231) e!514479)))

(assert (=> start!78618 tp!58989))

(declare-fun array_inv!20591 (array!54693) Bool)

(assert (=> start!78618 (array_inv!20591 _keys!1487)))

(assert (=> start!78618 tp_is_empty!19357))

(declare-fun b!916494 () Bool)

(declare-fun res!617900 () Bool)

(assert (=> b!916494 (=> (not res!617900) (not e!514478))))

(declare-datatypes ((List!18467 0))(
  ( (Nil!18464) (Cons!18463 (h!19609 (_ BitVec 64)) (t!26071 List!18467)) )
))
(declare-fun arrayNoDuplicates!0 (array!54693 (_ BitVec 32) List!18467) Bool)

(assert (=> b!916494 (= res!617900 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18464))))

(declare-fun b!916495 () Bool)

(assert (=> b!916495 (= e!514481 tp_is_empty!19357)))

(declare-fun b!916496 () Bool)

(declare-fun res!617898 () Bool)

(assert (=> b!916496 (=> (not res!617898) (not e!514478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54693 (_ BitVec 32)) Bool)

(assert (=> b!916496 (= res!617898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916497 () Bool)

(assert (=> b!916497 (= e!514479 (and e!514480 mapRes!30792))))

(declare-fun condMapEmpty!30792 () Bool)

(declare-fun mapDefault!30792 () ValueCell!9197)

(assert (=> b!916497 (= condMapEmpty!30792 (= (arr!26291 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9197)) mapDefault!30792)))))

(assert (= (and start!78618 res!617899) b!916489))

(assert (= (and b!916489 res!617902) b!916496))

(assert (= (and b!916496 res!617898) b!916494))

(assert (= (and b!916494 res!617900) b!916491))

(assert (= (and b!916491 res!617903) b!916490))

(assert (= (and b!916490 res!617901) b!916493))

(assert (= (and b!916497 condMapEmpty!30792) mapIsEmpty!30792))

(assert (= (and b!916497 (not condMapEmpty!30792)) mapNonEmpty!30792))

(get-info :version)

(assert (= (and mapNonEmpty!30792 ((_ is ValueCellFull!9197) mapValue!30792)) b!916495))

(assert (= (and b!916497 ((_ is ValueCellFull!9197) mapDefault!30792)) b!916492))

(assert (= start!78618 b!916497))

(declare-fun m!849901 () Bool)

(assert (=> start!78618 m!849901))

(declare-fun m!849903 () Bool)

(assert (=> start!78618 m!849903))

(declare-fun m!849905 () Bool)

(assert (=> start!78618 m!849905))

(declare-fun m!849907 () Bool)

(assert (=> mapNonEmpty!30792 m!849907))

(declare-fun m!849909 () Bool)

(assert (=> b!916490 m!849909))

(declare-fun m!849911 () Bool)

(assert (=> b!916490 m!849911))

(declare-fun m!849913 () Bool)

(assert (=> b!916494 m!849913))

(declare-fun m!849915 () Bool)

(assert (=> b!916496 m!849915))

(declare-fun m!849917 () Bool)

(assert (=> b!916493 m!849917))

(check-sat (not b!916496) (not b!916493) (not b!916490) (not mapNonEmpty!30792) b_and!27445 (not start!78618) (not b!916494) tp_is_empty!19357 (not b_next!16849))
(check-sat b_and!27445 (not b_next!16849))
