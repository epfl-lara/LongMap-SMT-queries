; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78608 () Bool)

(assert start!78608)

(declare-fun b_free!16821 () Bool)

(declare-fun b_next!16821 () Bool)

(assert (=> start!78608 (= b_free!16821 (not b_next!16821))))

(declare-fun tp!58903 () Bool)

(declare-fun b_and!27443 () Bool)

(assert (=> start!78608 (= tp!58903 b_and!27443)))

(declare-fun b!916355 () Bool)

(declare-fun res!617760 () Bool)

(declare-fun e!514381 () Bool)

(assert (=> b!916355 (=> (not res!617760) (not e!514381))))

(declare-datatypes ((array!54648 0))(
  ( (array!54649 (arr!26269 (Array (_ BitVec 32) (_ BitVec 64))) (size!26728 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54648)

(declare-datatypes ((List!18415 0))(
  ( (Nil!18412) (Cons!18411 (h!19557 (_ BitVec 64)) (t!26028 List!18415)) )
))
(declare-fun arrayNoDuplicates!0 (array!54648 (_ BitVec 32) List!18415) Bool)

(assert (=> b!916355 (= res!617760 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18412))))

(declare-fun b!916356 () Bool)

(assert (=> b!916356 (= e!514381 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30737 0))(
  ( (V!30738 (val!9715 Int)) )
))
(declare-datatypes ((ValueCell!9183 0))(
  ( (ValueCellFull!9183 (v!12233 V!30737)) (EmptyCell!9183) )
))
(declare-datatypes ((array!54650 0))(
  ( (array!54651 (arr!26270 (Array (_ BitVec 32) ValueCell!9183)) (size!26729 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54650)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411775 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30737)

(declare-fun minValue!1173 () V!30737)

(declare-datatypes ((tuple2!12604 0))(
  ( (tuple2!12605 (_1!6313 (_ BitVec 64)) (_2!6313 V!30737)) )
))
(declare-datatypes ((List!18416 0))(
  ( (Nil!18413) (Cons!18412 (h!19558 tuple2!12604) (t!26029 List!18416)) )
))
(declare-datatypes ((ListLongMap!11301 0))(
  ( (ListLongMap!11302 (toList!5666 List!18416)) )
))
(declare-fun contains!4720 (ListLongMap!11301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2927 (array!54648 array!54650 (_ BitVec 32) (_ BitVec 32) V!30737 V!30737 (_ BitVec 32) Int) ListLongMap!11301)

(assert (=> b!916356 (= lt!411775 (contains!4720 (getCurrentListMap!2927 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapNonEmpty!30750 () Bool)

(declare-fun mapRes!30750 () Bool)

(declare-fun tp!58904 () Bool)

(declare-fun e!514379 () Bool)

(assert (=> mapNonEmpty!30750 (= mapRes!30750 (and tp!58904 e!514379))))

(declare-fun mapRest!30750 () (Array (_ BitVec 32) ValueCell!9183))

(declare-fun mapKey!30750 () (_ BitVec 32))

(declare-fun mapValue!30750 () ValueCell!9183)

(assert (=> mapNonEmpty!30750 (= (arr!26270 _values!1231) (store mapRest!30750 mapKey!30750 mapValue!30750))))

(declare-fun b!916357 () Bool)

(declare-fun e!514378 () Bool)

(declare-fun tp_is_empty!19329 () Bool)

(assert (=> b!916357 (= e!514378 tp_is_empty!19329)))

(declare-fun b!916358 () Bool)

(declare-fun e!514377 () Bool)

(assert (=> b!916358 (= e!514377 (and e!514378 mapRes!30750))))

(declare-fun condMapEmpty!30750 () Bool)

(declare-fun mapDefault!30750 () ValueCell!9183)

(assert (=> b!916358 (= condMapEmpty!30750 (= (arr!26270 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9183)) mapDefault!30750)))))

(declare-fun b!916359 () Bool)

(declare-fun res!617764 () Bool)

(assert (=> b!916359 (=> (not res!617764) (not e!514381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54648 (_ BitVec 32)) Bool)

(assert (=> b!916359 (= res!617764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916354 () Bool)

(assert (=> b!916354 (= e!514379 tp_is_empty!19329)))

(declare-fun res!617761 () Bool)

(assert (=> start!78608 (=> (not res!617761) (not e!514381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78608 (= res!617761 (validMask!0 mask!1881))))

(assert (=> start!78608 e!514381))

(assert (=> start!78608 true))

(declare-fun array_inv!20490 (array!54650) Bool)

(assert (=> start!78608 (and (array_inv!20490 _values!1231) e!514377)))

(assert (=> start!78608 tp!58903))

(declare-fun array_inv!20491 (array!54648) Bool)

(assert (=> start!78608 (array_inv!20491 _keys!1487)))

(assert (=> start!78608 tp_is_empty!19329))

(declare-fun b!916360 () Bool)

(declare-fun res!617763 () Bool)

(assert (=> b!916360 (=> (not res!617763) (not e!514381))))

(assert (=> b!916360 (= res!617763 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26728 _keys!1487))))))

(declare-fun mapIsEmpty!30750 () Bool)

(assert (=> mapIsEmpty!30750 mapRes!30750))

(declare-fun b!916361 () Bool)

(declare-fun res!617762 () Bool)

(assert (=> b!916361 (=> (not res!617762) (not e!514381))))

(assert (=> b!916361 (= res!617762 (and (= (size!26729 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26728 _keys!1487) (size!26729 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78608 res!617761) b!916361))

(assert (= (and b!916361 res!617762) b!916359))

(assert (= (and b!916359 res!617764) b!916355))

(assert (= (and b!916355 res!617760) b!916360))

(assert (= (and b!916360 res!617763) b!916356))

(assert (= (and b!916358 condMapEmpty!30750) mapIsEmpty!30750))

(assert (= (and b!916358 (not condMapEmpty!30750)) mapNonEmpty!30750))

(get-info :version)

(assert (= (and mapNonEmpty!30750 ((_ is ValueCellFull!9183) mapValue!30750)) b!916354))

(assert (= (and b!916358 ((_ is ValueCellFull!9183) mapDefault!30750)) b!916357))

(assert (= start!78608 b!916358))

(declare-fun m!850411 () Bool)

(assert (=> start!78608 m!850411))

(declare-fun m!850413 () Bool)

(assert (=> start!78608 m!850413))

(declare-fun m!850415 () Bool)

(assert (=> start!78608 m!850415))

(declare-fun m!850417 () Bool)

(assert (=> mapNonEmpty!30750 m!850417))

(declare-fun m!850419 () Bool)

(assert (=> b!916359 m!850419))

(declare-fun m!850421 () Bool)

(assert (=> b!916356 m!850421))

(assert (=> b!916356 m!850421))

(declare-fun m!850423 () Bool)

(assert (=> b!916356 m!850423))

(declare-fun m!850425 () Bool)

(assert (=> b!916355 m!850425))

(check-sat (not start!78608) (not b_next!16821) b_and!27443 (not b!916355) tp_is_empty!19329 (not b!916356) (not mapNonEmpty!30750) (not b!916359))
(check-sat b_and!27443 (not b_next!16821))
