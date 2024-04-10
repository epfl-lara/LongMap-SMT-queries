; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78692 () Bool)

(assert start!78692)

(declare-fun b_free!16905 () Bool)

(declare-fun b_next!16905 () Bool)

(assert (=> start!78692 (= b_free!16905 (not b_next!16905))))

(declare-fun tp!59155 () Bool)

(declare-fun b_and!27547 () Bool)

(assert (=> start!78692 (= tp!59155 b_and!27547)))

(declare-fun b!917632 () Bool)

(declare-fun res!618640 () Bool)

(declare-fun e!515164 () Bool)

(assert (=> b!917632 (=> (not res!618640) (not e!515164))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917632 (= res!618640 (validKeyInArray!0 k0!1099))))

(declare-fun b!917633 () Bool)

(declare-fun res!618641 () Bool)

(declare-fun e!515167 () Bool)

(assert (=> b!917633 (=> (not res!618641) (not e!515167))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54812 0))(
  ( (array!54813 (arr!26351 (Array (_ BitVec 32) (_ BitVec 64))) (size!26810 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54812)

(assert (=> b!917633 (= res!618641 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26810 _keys!1487))))))

(declare-fun b!917634 () Bool)

(declare-fun res!618642 () Bool)

(assert (=> b!917634 (=> (not res!618642) (not e!515164))))

(assert (=> b!917634 (= res!618642 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917635 () Bool)

(declare-fun res!618645 () Bool)

(assert (=> b!917635 (=> (not res!618645) (not e!515164))))

(declare-datatypes ((V!30849 0))(
  ( (V!30850 (val!9757 Int)) )
))
(declare-fun v!791 () V!30849)

(declare-datatypes ((tuple2!12674 0))(
  ( (tuple2!12675 (_1!6348 (_ BitVec 64)) (_2!6348 V!30849)) )
))
(declare-datatypes ((List!18483 0))(
  ( (Nil!18480) (Cons!18479 (h!19625 tuple2!12674) (t!26118 List!18483)) )
))
(declare-datatypes ((ListLongMap!11371 0))(
  ( (ListLongMap!11372 (toList!5701 List!18483)) )
))
(declare-fun lt!412055 () ListLongMap!11371)

(declare-fun apply!553 (ListLongMap!11371 (_ BitVec 64)) V!30849)

(assert (=> b!917635 (= res!618645 (= (apply!553 lt!412055 k0!1099) v!791))))

(declare-fun b!917636 () Bool)

(declare-fun e!515162 () Bool)

(assert (=> b!917636 (= e!515162 (not true))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!412056 () (_ BitVec 64))

(declare-datatypes ((ValueCell!9225 0))(
  ( (ValueCellFull!9225 (v!12275 V!30849)) (EmptyCell!9225) )
))
(declare-datatypes ((array!54814 0))(
  ( (array!54815 (arr!26352 (Array (_ BitVec 32) ValueCell!9225)) (size!26811 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54814)

(declare-fun zeroValue!1173 () V!30849)

(declare-fun minValue!1173 () V!30849)

(declare-fun getCurrentListMap!2959 (array!54812 array!54814 (_ BitVec 32) (_ BitVec 32) V!30849 V!30849 (_ BitVec 32) Int) ListLongMap!11371)

(declare-fun +!2616 (ListLongMap!11371 tuple2!12674) ListLongMap!11371)

(declare-fun get!13807 (ValueCell!9225 V!30849) V!30849)

(declare-fun dynLambda!1405 (Int (_ BitVec 64)) V!30849)

(assert (=> b!917636 (= (getCurrentListMap!2959 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2616 (getCurrentListMap!2959 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12675 lt!412056 (get!13807 (select (arr!26352 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1405 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30980 0))(
  ( (Unit!30981) )
))
(declare-fun lt!412057 () Unit!30980)

(declare-fun lemmaListMapRecursiveValidKeyArray!6 (array!54812 array!54814 (_ BitVec 32) (_ BitVec 32) V!30849 V!30849 (_ BitVec 32) Int) Unit!30980)

(assert (=> b!917636 (= lt!412057 (lemmaListMapRecursiveValidKeyArray!6 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917637 () Bool)

(declare-fun res!618648 () Bool)

(assert (=> b!917637 (=> (not res!618648) (not e!515167))))

(declare-datatypes ((List!18484 0))(
  ( (Nil!18481) (Cons!18480 (h!19626 (_ BitVec 64)) (t!26119 List!18484)) )
))
(declare-fun arrayNoDuplicates!0 (array!54812 (_ BitVec 32) List!18484) Bool)

(assert (=> b!917637 (= res!618648 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18481))))

(declare-fun b!917638 () Bool)

(assert (=> b!917638 (= e!515167 e!515164)))

(declare-fun res!618649 () Bool)

(assert (=> b!917638 (=> (not res!618649) (not e!515164))))

(declare-fun contains!4752 (ListLongMap!11371 (_ BitVec 64)) Bool)

(assert (=> b!917638 (= res!618649 (contains!4752 lt!412055 k0!1099))))

(assert (=> b!917638 (= lt!412055 (getCurrentListMap!2959 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917639 () Bool)

(declare-fun e!515165 () Bool)

(declare-fun tp_is_empty!19413 () Bool)

(assert (=> b!917639 (= e!515165 tp_is_empty!19413)))

(declare-fun b!917640 () Bool)

(declare-fun res!618643 () Bool)

(assert (=> b!917640 (=> (not res!618643) (not e!515167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54812 (_ BitVec 32)) Bool)

(assert (=> b!917640 (= res!618643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917641 () Bool)

(assert (=> b!917641 (= e!515164 e!515162)))

(declare-fun res!618647 () Bool)

(assert (=> b!917641 (=> (not res!618647) (not e!515162))))

(assert (=> b!917641 (= res!618647 (validKeyInArray!0 lt!412056))))

(assert (=> b!917641 (= lt!412056 (select (arr!26351 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!30876 () Bool)

(declare-fun mapRes!30876 () Bool)

(assert (=> mapIsEmpty!30876 mapRes!30876))

(declare-fun res!618646 () Bool)

(assert (=> start!78692 (=> (not res!618646) (not e!515167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78692 (= res!618646 (validMask!0 mask!1881))))

(assert (=> start!78692 e!515167))

(assert (=> start!78692 true))

(assert (=> start!78692 tp_is_empty!19413))

(declare-fun e!515163 () Bool)

(declare-fun array_inv!20550 (array!54814) Bool)

(assert (=> start!78692 (and (array_inv!20550 _values!1231) e!515163)))

(assert (=> start!78692 tp!59155))

(declare-fun array_inv!20551 (array!54812) Bool)

(assert (=> start!78692 (array_inv!20551 _keys!1487)))

(declare-fun b!917642 () Bool)

(assert (=> b!917642 (= e!515163 (and e!515165 mapRes!30876))))

(declare-fun condMapEmpty!30876 () Bool)

(declare-fun mapDefault!30876 () ValueCell!9225)

(assert (=> b!917642 (= condMapEmpty!30876 (= (arr!26352 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9225)) mapDefault!30876)))))

(declare-fun mapNonEmpty!30876 () Bool)

(declare-fun tp!59156 () Bool)

(declare-fun e!515166 () Bool)

(assert (=> mapNonEmpty!30876 (= mapRes!30876 (and tp!59156 e!515166))))

(declare-fun mapValue!30876 () ValueCell!9225)

(declare-fun mapKey!30876 () (_ BitVec 32))

(declare-fun mapRest!30876 () (Array (_ BitVec 32) ValueCell!9225))

(assert (=> mapNonEmpty!30876 (= (arr!26352 _values!1231) (store mapRest!30876 mapKey!30876 mapValue!30876))))

(declare-fun b!917643 () Bool)

(assert (=> b!917643 (= e!515166 tp_is_empty!19413)))

(declare-fun b!917644 () Bool)

(declare-fun res!618644 () Bool)

(assert (=> b!917644 (=> (not res!618644) (not e!515167))))

(assert (=> b!917644 (= res!618644 (and (= (size!26811 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26810 _keys!1487) (size!26811 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78692 res!618646) b!917644))

(assert (= (and b!917644 res!618644) b!917640))

(assert (= (and b!917640 res!618643) b!917637))

(assert (= (and b!917637 res!618648) b!917633))

(assert (= (and b!917633 res!618641) b!917638))

(assert (= (and b!917638 res!618649) b!917635))

(assert (= (and b!917635 res!618645) b!917634))

(assert (= (and b!917634 res!618642) b!917632))

(assert (= (and b!917632 res!618640) b!917641))

(assert (= (and b!917641 res!618647) b!917636))

(assert (= (and b!917642 condMapEmpty!30876) mapIsEmpty!30876))

(assert (= (and b!917642 (not condMapEmpty!30876)) mapNonEmpty!30876))

(get-info :version)

(assert (= (and mapNonEmpty!30876 ((_ is ValueCellFull!9225) mapValue!30876)) b!917643))

(assert (= (and b!917642 ((_ is ValueCellFull!9225) mapDefault!30876)) b!917639))

(assert (= start!78692 b!917642))

(declare-fun b_lambda!13407 () Bool)

(assert (=> (not b_lambda!13407) (not b!917636)))

(declare-fun t!26117 () Bool)

(declare-fun tb!5485 () Bool)

(assert (=> (and start!78692 (= defaultEntry!1235 defaultEntry!1235) t!26117) tb!5485))

(declare-fun result!10793 () Bool)

(assert (=> tb!5485 (= result!10793 tp_is_empty!19413)))

(assert (=> b!917636 t!26117))

(declare-fun b_and!27549 () Bool)

(assert (= b_and!27547 (and (=> t!26117 result!10793) b_and!27549)))

(declare-fun m!851363 () Bool)

(assert (=> b!917640 m!851363))

(declare-fun m!851365 () Bool)

(assert (=> start!78692 m!851365))

(declare-fun m!851367 () Bool)

(assert (=> start!78692 m!851367))

(declare-fun m!851369 () Bool)

(assert (=> start!78692 m!851369))

(declare-fun m!851371 () Bool)

(assert (=> b!917641 m!851371))

(declare-fun m!851373 () Bool)

(assert (=> b!917641 m!851373))

(declare-fun m!851375 () Bool)

(assert (=> b!917638 m!851375))

(declare-fun m!851377 () Bool)

(assert (=> b!917638 m!851377))

(declare-fun m!851379 () Bool)

(assert (=> b!917635 m!851379))

(declare-fun m!851381 () Bool)

(assert (=> b!917632 m!851381))

(declare-fun m!851383 () Bool)

(assert (=> mapNonEmpty!30876 m!851383))

(declare-fun m!851385 () Bool)

(assert (=> b!917637 m!851385))

(declare-fun m!851387 () Bool)

(assert (=> b!917636 m!851387))

(declare-fun m!851389 () Bool)

(assert (=> b!917636 m!851389))

(declare-fun m!851391 () Bool)

(assert (=> b!917636 m!851391))

(declare-fun m!851393 () Bool)

(assert (=> b!917636 m!851393))

(assert (=> b!917636 m!851391))

(assert (=> b!917636 m!851393))

(declare-fun m!851395 () Bool)

(assert (=> b!917636 m!851395))

(declare-fun m!851397 () Bool)

(assert (=> b!917636 m!851397))

(assert (=> b!917636 m!851387))

(declare-fun m!851399 () Bool)

(assert (=> b!917636 m!851399))

(check-sat (not start!78692) (not b!917641) (not mapNonEmpty!30876) (not b!917635) (not b!917632) tp_is_empty!19413 (not b!917640) (not b_lambda!13407) (not b_next!16905) (not b!917636) (not b!917638) b_and!27549 (not b!917637))
(check-sat b_and!27549 (not b_next!16905))
