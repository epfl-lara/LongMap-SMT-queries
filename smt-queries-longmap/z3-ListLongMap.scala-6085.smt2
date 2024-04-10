; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78620 () Bool)

(assert start!78620)

(declare-fun b_free!16833 () Bool)

(declare-fun b_next!16833 () Bool)

(assert (=> start!78620 (= b_free!16833 (not b_next!16833))))

(declare-fun tp!58939 () Bool)

(declare-fun b_and!27455 () Bool)

(assert (=> start!78620 (= tp!58939 b_and!27455)))

(declare-fun b!916512 () Bool)

(declare-fun e!514482 () Bool)

(assert (=> b!916512 (= e!514482 false)))

(declare-datatypes ((V!30753 0))(
  ( (V!30754 (val!9721 Int)) )
))
(declare-fun lt!411808 () V!30753)

(declare-datatypes ((tuple2!12614 0))(
  ( (tuple2!12615 (_1!6318 (_ BitVec 64)) (_2!6318 V!30753)) )
))
(declare-datatypes ((List!18424 0))(
  ( (Nil!18421) (Cons!18420 (h!19566 tuple2!12614) (t!26037 List!18424)) )
))
(declare-datatypes ((ListLongMap!11311 0))(
  ( (ListLongMap!11312 (toList!5671 List!18424)) )
))
(declare-fun lt!411807 () ListLongMap!11311)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!530 (ListLongMap!11311 (_ BitVec 64)) V!30753)

(assert (=> b!916512 (= lt!411808 (apply!530 lt!411807 k0!1099))))

(declare-fun b!916513 () Bool)

(declare-fun e!514485 () Bool)

(declare-fun tp_is_empty!19341 () Bool)

(assert (=> b!916513 (= e!514485 tp_is_empty!19341)))

(declare-fun res!617867 () Bool)

(declare-fun e!514484 () Bool)

(assert (=> start!78620 (=> (not res!617867) (not e!514484))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78620 (= res!617867 (validMask!0 mask!1881))))

(assert (=> start!78620 e!514484))

(assert (=> start!78620 true))

(declare-datatypes ((ValueCell!9189 0))(
  ( (ValueCellFull!9189 (v!12239 V!30753)) (EmptyCell!9189) )
))
(declare-datatypes ((array!54670 0))(
  ( (array!54671 (arr!26280 (Array (_ BitVec 32) ValueCell!9189)) (size!26739 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54670)

(declare-fun e!514483 () Bool)

(declare-fun array_inv!20498 (array!54670) Bool)

(assert (=> start!78620 (and (array_inv!20498 _values!1231) e!514483)))

(assert (=> start!78620 tp!58939))

(declare-datatypes ((array!54672 0))(
  ( (array!54673 (arr!26281 (Array (_ BitVec 32) (_ BitVec 64))) (size!26740 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54672)

(declare-fun array_inv!20499 (array!54672) Bool)

(assert (=> start!78620 (array_inv!20499 _keys!1487)))

(assert (=> start!78620 tp_is_empty!19341))

(declare-fun b!916514 () Bool)

(declare-fun res!617864 () Bool)

(assert (=> b!916514 (=> (not res!617864) (not e!514484))))

(declare-datatypes ((List!18425 0))(
  ( (Nil!18422) (Cons!18421 (h!19567 (_ BitVec 64)) (t!26038 List!18425)) )
))
(declare-fun arrayNoDuplicates!0 (array!54672 (_ BitVec 32) List!18425) Bool)

(assert (=> b!916514 (= res!617864 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18422))))

(declare-fun b!916515 () Bool)

(declare-fun res!617869 () Bool)

(assert (=> b!916515 (=> (not res!617869) (not e!514484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54672 (_ BitVec 32)) Bool)

(assert (=> b!916515 (= res!617869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916516 () Bool)

(declare-fun e!514481 () Bool)

(assert (=> b!916516 (= e!514481 tp_is_empty!19341)))

(declare-fun b!916517 () Bool)

(declare-fun mapRes!30768 () Bool)

(assert (=> b!916517 (= e!514483 (and e!514485 mapRes!30768))))

(declare-fun condMapEmpty!30768 () Bool)

(declare-fun mapDefault!30768 () ValueCell!9189)

(assert (=> b!916517 (= condMapEmpty!30768 (= (arr!26280 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9189)) mapDefault!30768)))))

(declare-fun b!916518 () Bool)

(assert (=> b!916518 (= e!514484 e!514482)))

(declare-fun res!617866 () Bool)

(assert (=> b!916518 (=> (not res!617866) (not e!514482))))

(declare-fun contains!4724 (ListLongMap!11311 (_ BitVec 64)) Bool)

(assert (=> b!916518 (= res!617866 (contains!4724 lt!411807 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30753)

(declare-fun minValue!1173 () V!30753)

(declare-fun getCurrentListMap!2931 (array!54672 array!54670 (_ BitVec 32) (_ BitVec 32) V!30753 V!30753 (_ BitVec 32) Int) ListLongMap!11311)

(assert (=> b!916518 (= lt!411807 (getCurrentListMap!2931 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916519 () Bool)

(declare-fun res!617865 () Bool)

(assert (=> b!916519 (=> (not res!617865) (not e!514484))))

(assert (=> b!916519 (= res!617865 (and (= (size!26739 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26740 _keys!1487) (size!26739 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30768 () Bool)

(assert (=> mapIsEmpty!30768 mapRes!30768))

(declare-fun b!916520 () Bool)

(declare-fun res!617868 () Bool)

(assert (=> b!916520 (=> (not res!617868) (not e!514484))))

(assert (=> b!916520 (= res!617868 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26740 _keys!1487))))))

(declare-fun mapNonEmpty!30768 () Bool)

(declare-fun tp!58940 () Bool)

(assert (=> mapNonEmpty!30768 (= mapRes!30768 (and tp!58940 e!514481))))

(declare-fun mapKey!30768 () (_ BitVec 32))

(declare-fun mapValue!30768 () ValueCell!9189)

(declare-fun mapRest!30768 () (Array (_ BitVec 32) ValueCell!9189))

(assert (=> mapNonEmpty!30768 (= (arr!26280 _values!1231) (store mapRest!30768 mapKey!30768 mapValue!30768))))

(assert (= (and start!78620 res!617867) b!916519))

(assert (= (and b!916519 res!617865) b!916515))

(assert (= (and b!916515 res!617869) b!916514))

(assert (= (and b!916514 res!617864) b!916520))

(assert (= (and b!916520 res!617868) b!916518))

(assert (= (and b!916518 res!617866) b!916512))

(assert (= (and b!916517 condMapEmpty!30768) mapIsEmpty!30768))

(assert (= (and b!916517 (not condMapEmpty!30768)) mapNonEmpty!30768))

(get-info :version)

(assert (= (and mapNonEmpty!30768 ((_ is ValueCellFull!9189) mapValue!30768)) b!916516))

(assert (= (and b!916517 ((_ is ValueCellFull!9189) mapDefault!30768)) b!916513))

(assert (= start!78620 b!916517))

(declare-fun m!850515 () Bool)

(assert (=> b!916515 m!850515))

(declare-fun m!850517 () Bool)

(assert (=> start!78620 m!850517))

(declare-fun m!850519 () Bool)

(assert (=> start!78620 m!850519))

(declare-fun m!850521 () Bool)

(assert (=> start!78620 m!850521))

(declare-fun m!850523 () Bool)

(assert (=> mapNonEmpty!30768 m!850523))

(declare-fun m!850525 () Bool)

(assert (=> b!916514 m!850525))

(declare-fun m!850527 () Bool)

(assert (=> b!916518 m!850527))

(declare-fun m!850529 () Bool)

(assert (=> b!916518 m!850529))

(declare-fun m!850531 () Bool)

(assert (=> b!916512 m!850531))

(check-sat b_and!27455 (not b_next!16833) tp_is_empty!19341 (not b!916515) (not b!916518) (not b!916514) (not b!916512) (not start!78620) (not mapNonEmpty!30768))
(check-sat b_and!27455 (not b_next!16833))
