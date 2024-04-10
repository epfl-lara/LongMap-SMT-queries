; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78614 () Bool)

(assert start!78614)

(declare-fun b_free!16827 () Bool)

(declare-fun b_next!16827 () Bool)

(assert (=> start!78614 (= b_free!16827 (not b_next!16827))))

(declare-fun tp!58922 () Bool)

(declare-fun b_and!27449 () Bool)

(assert (=> start!78614 (= tp!58922 b_and!27449)))

(declare-fun b!916431 () Bool)

(declare-fun e!514431 () Bool)

(declare-fun tp_is_empty!19335 () Bool)

(assert (=> b!916431 (= e!514431 tp_is_empty!19335)))

(declare-fun b!916432 () Bool)

(declare-fun res!617811 () Bool)

(declare-fun e!514432 () Bool)

(assert (=> b!916432 (=> (not res!617811) (not e!514432))))

(declare-datatypes ((array!54658 0))(
  ( (array!54659 (arr!26274 (Array (_ BitVec 32) (_ BitVec 64))) (size!26733 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54658)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54658 (_ BitVec 32)) Bool)

(assert (=> b!916432 (= res!617811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916433 () Bool)

(declare-fun e!514430 () Bool)

(assert (=> b!916433 (= e!514430 tp_is_empty!19335)))

(declare-fun b!916434 () Bool)

(declare-fun res!617813 () Bool)

(assert (=> b!916434 (=> (not res!617813) (not e!514432))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30745 0))(
  ( (V!30746 (val!9718 Int)) )
))
(declare-datatypes ((ValueCell!9186 0))(
  ( (ValueCellFull!9186 (v!12236 V!30745)) (EmptyCell!9186) )
))
(declare-datatypes ((array!54660 0))(
  ( (array!54661 (arr!26275 (Array (_ BitVec 32) ValueCell!9186)) (size!26734 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54660)

(assert (=> b!916434 (= res!617813 (and (= (size!26734 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26733 _keys!1487) (size!26734 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30759 () Bool)

(declare-fun mapRes!30759 () Bool)

(assert (=> mapIsEmpty!30759 mapRes!30759))

(declare-fun res!617815 () Bool)

(assert (=> start!78614 (=> (not res!617815) (not e!514432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78614 (= res!617815 (validMask!0 mask!1881))))

(assert (=> start!78614 e!514432))

(assert (=> start!78614 true))

(declare-fun e!514429 () Bool)

(declare-fun array_inv!20494 (array!54660) Bool)

(assert (=> start!78614 (and (array_inv!20494 _values!1231) e!514429)))

(assert (=> start!78614 tp!58922))

(declare-fun array_inv!20495 (array!54658) Bool)

(assert (=> start!78614 (array_inv!20495 _keys!1487)))

(assert (=> start!78614 tp_is_empty!19335))

(declare-fun mapNonEmpty!30759 () Bool)

(declare-fun tp!58921 () Bool)

(assert (=> mapNonEmpty!30759 (= mapRes!30759 (and tp!58921 e!514430))))

(declare-fun mapValue!30759 () ValueCell!9186)

(declare-fun mapKey!30759 () (_ BitVec 32))

(declare-fun mapRest!30759 () (Array (_ BitVec 32) ValueCell!9186))

(assert (=> mapNonEmpty!30759 (= (arr!26275 _values!1231) (store mapRest!30759 mapKey!30759 mapValue!30759))))

(declare-fun b!916435 () Bool)

(declare-fun e!514428 () Bool)

(assert (=> b!916435 (= e!514432 e!514428)))

(declare-fun res!617814 () Bool)

(assert (=> b!916435 (=> (not res!617814) (not e!514428))))

(declare-datatypes ((tuple2!12608 0))(
  ( (tuple2!12609 (_1!6315 (_ BitVec 64)) (_2!6315 V!30745)) )
))
(declare-datatypes ((List!18419 0))(
  ( (Nil!18416) (Cons!18415 (h!19561 tuple2!12608) (t!26032 List!18419)) )
))
(declare-datatypes ((ListLongMap!11305 0))(
  ( (ListLongMap!11306 (toList!5668 List!18419)) )
))
(declare-fun lt!411789 () ListLongMap!11305)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4722 (ListLongMap!11305 (_ BitVec 64)) Bool)

(assert (=> b!916435 (= res!617814 (contains!4722 lt!411789 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30745)

(declare-fun minValue!1173 () V!30745)

(declare-fun getCurrentListMap!2929 (array!54658 array!54660 (_ BitVec 32) (_ BitVec 32) V!30745 V!30745 (_ BitVec 32) Int) ListLongMap!11305)

(assert (=> b!916435 (= lt!411789 (getCurrentListMap!2929 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916436 () Bool)

(declare-fun res!617812 () Bool)

(assert (=> b!916436 (=> (not res!617812) (not e!514432))))

(declare-datatypes ((List!18420 0))(
  ( (Nil!18417) (Cons!18416 (h!19562 (_ BitVec 64)) (t!26033 List!18420)) )
))
(declare-fun arrayNoDuplicates!0 (array!54658 (_ BitVec 32) List!18420) Bool)

(assert (=> b!916436 (= res!617812 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18417))))

(declare-fun b!916437 () Bool)

(assert (=> b!916437 (= e!514429 (and e!514431 mapRes!30759))))

(declare-fun condMapEmpty!30759 () Bool)

(declare-fun mapDefault!30759 () ValueCell!9186)

(assert (=> b!916437 (= condMapEmpty!30759 (= (arr!26275 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9186)) mapDefault!30759)))))

(declare-fun b!916438 () Bool)

(declare-fun res!617810 () Bool)

(assert (=> b!916438 (=> (not res!617810) (not e!514432))))

(assert (=> b!916438 (= res!617810 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26733 _keys!1487))))))

(declare-fun b!916439 () Bool)

(assert (=> b!916439 (= e!514428 false)))

(declare-fun lt!411790 () V!30745)

(declare-fun apply!527 (ListLongMap!11305 (_ BitVec 64)) V!30745)

(assert (=> b!916439 (= lt!411790 (apply!527 lt!411789 k0!1099))))

(assert (= (and start!78614 res!617815) b!916434))

(assert (= (and b!916434 res!617813) b!916432))

(assert (= (and b!916432 res!617811) b!916436))

(assert (= (and b!916436 res!617812) b!916438))

(assert (= (and b!916438 res!617810) b!916435))

(assert (= (and b!916435 res!617814) b!916439))

(assert (= (and b!916437 condMapEmpty!30759) mapIsEmpty!30759))

(assert (= (and b!916437 (not condMapEmpty!30759)) mapNonEmpty!30759))

(get-info :version)

(assert (= (and mapNonEmpty!30759 ((_ is ValueCellFull!9186) mapValue!30759)) b!916433))

(assert (= (and b!916437 ((_ is ValueCellFull!9186) mapDefault!30759)) b!916431))

(assert (= start!78614 b!916437))

(declare-fun m!850461 () Bool)

(assert (=> start!78614 m!850461))

(declare-fun m!850463 () Bool)

(assert (=> start!78614 m!850463))

(declare-fun m!850465 () Bool)

(assert (=> start!78614 m!850465))

(declare-fun m!850467 () Bool)

(assert (=> b!916435 m!850467))

(declare-fun m!850469 () Bool)

(assert (=> b!916435 m!850469))

(declare-fun m!850471 () Bool)

(assert (=> mapNonEmpty!30759 m!850471))

(declare-fun m!850473 () Bool)

(assert (=> b!916439 m!850473))

(declare-fun m!850475 () Bool)

(assert (=> b!916432 m!850475))

(declare-fun m!850477 () Bool)

(assert (=> b!916436 m!850477))

(check-sat (not mapNonEmpty!30759) (not b!916436) (not b_next!16827) (not start!78614) (not b!916439) tp_is_empty!19335 b_and!27449 (not b!916435) (not b!916432))
(check-sat b_and!27449 (not b_next!16827))
