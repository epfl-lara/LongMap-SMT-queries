; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78762 () Bool)

(assert start!78762)

(declare-fun b_free!16993 () Bool)

(declare-fun b_next!16993 () Bool)

(assert (=> start!78762 (= b_free!16993 (not b_next!16993))))

(declare-fun tp!59421 () Bool)

(declare-fun b_and!27697 () Bool)

(assert (=> start!78762 (= tp!59421 b_and!27697)))

(declare-fun b!919197 () Bool)

(declare-fun res!619852 () Bool)

(declare-fun e!515940 () Bool)

(assert (=> b!919197 (=> (not res!619852) (not e!515940))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30967 0))(
  ( (V!30968 (val!9801 Int)) )
))
(declare-datatypes ((tuple2!12788 0))(
  ( (tuple2!12789 (_1!6405 (_ BitVec 64)) (_2!6405 V!30967)) )
))
(declare-datatypes ((List!18574 0))(
  ( (Nil!18571) (Cons!18570 (h!19716 tuple2!12788) (t!26288 List!18574)) )
))
(declare-datatypes ((ListLongMap!11475 0))(
  ( (ListLongMap!11476 (toList!5753 List!18574)) )
))
(declare-fun lt!412467 () ListLongMap!11475)

(declare-fun v!791 () V!30967)

(declare-fun apply!582 (ListLongMap!11475 (_ BitVec 64)) V!30967)

(assert (=> b!919197 (= res!619852 (= (apply!582 lt!412467 k0!1099) v!791))))

(declare-fun res!619859 () Bool)

(declare-fun e!515937 () Bool)

(assert (=> start!78762 (=> (not res!619859) (not e!515937))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78762 (= res!619859 (validMask!0 mask!1881))))

(assert (=> start!78762 e!515937))

(assert (=> start!78762 true))

(declare-fun tp_is_empty!19501 () Bool)

(assert (=> start!78762 tp_is_empty!19501))

(declare-datatypes ((ValueCell!9269 0))(
  ( (ValueCellFull!9269 (v!12318 V!30967)) (EmptyCell!9269) )
))
(declare-datatypes ((array!54965 0))(
  ( (array!54966 (arr!26428 (Array (_ BitVec 32) ValueCell!9269)) (size!26889 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54965)

(declare-fun e!515943 () Bool)

(declare-fun array_inv!20680 (array!54965) Bool)

(assert (=> start!78762 (and (array_inv!20680 _values!1231) e!515943)))

(assert (=> start!78762 tp!59421))

(declare-datatypes ((array!54967 0))(
  ( (array!54968 (arr!26429 (Array (_ BitVec 32) (_ BitVec 64))) (size!26890 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54967)

(declare-fun array_inv!20681 (array!54967) Bool)

(assert (=> start!78762 (array_inv!20681 _keys!1487)))

(declare-fun mapIsEmpty!31008 () Bool)

(declare-fun mapRes!31008 () Bool)

(assert (=> mapIsEmpty!31008 mapRes!31008))

(declare-fun b!919198 () Bool)

(declare-fun e!515941 () Bool)

(assert (=> b!919198 (= e!515941 tp_is_empty!19501)))

(declare-fun b!919199 () Bool)

(declare-fun res!619853 () Bool)

(assert (=> b!919199 (=> (not res!619853) (not e!515937))))

(declare-datatypes ((List!18575 0))(
  ( (Nil!18572) (Cons!18571 (h!19717 (_ BitVec 64)) (t!26289 List!18575)) )
))
(declare-fun arrayNoDuplicates!0 (array!54967 (_ BitVec 32) List!18575) Bool)

(assert (=> b!919199 (= res!619853 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18572))))

(declare-fun mapNonEmpty!31008 () Bool)

(declare-fun tp!59420 () Bool)

(assert (=> mapNonEmpty!31008 (= mapRes!31008 (and tp!59420 e!515941))))

(declare-fun mapValue!31008 () ValueCell!9269)

(declare-fun mapRest!31008 () (Array (_ BitVec 32) ValueCell!9269))

(declare-fun mapKey!31008 () (_ BitVec 32))

(assert (=> mapNonEmpty!31008 (= (arr!26428 _values!1231) (store mapRest!31008 mapKey!31008 mapValue!31008))))

(declare-fun b!919200 () Bool)

(assert (=> b!919200 (= e!515937 e!515940)))

(declare-fun res!619857 () Bool)

(assert (=> b!919200 (=> (not res!619857) (not e!515940))))

(declare-fun contains!4753 (ListLongMap!11475 (_ BitVec 64)) Bool)

(assert (=> b!919200 (= res!619857 (contains!4753 lt!412467 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30967)

(declare-fun minValue!1173 () V!30967)

(declare-fun getCurrentListMap!2945 (array!54967 array!54965 (_ BitVec 32) (_ BitVec 32) V!30967 V!30967 (_ BitVec 32) Int) ListLongMap!11475)

(assert (=> b!919200 (= lt!412467 (getCurrentListMap!2945 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919201 () Bool)

(declare-fun e!515942 () Bool)

(assert (=> b!919201 (= e!515942 tp_is_empty!19501)))

(declare-fun b!919202 () Bool)

(declare-fun e!515938 () Bool)

(assert (=> b!919202 (= e!515940 e!515938)))

(declare-fun res!619855 () Bool)

(assert (=> b!919202 (=> (not res!619855) (not e!515938))))

(declare-fun lt!412469 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919202 (= res!619855 (validKeyInArray!0 lt!412469))))

(assert (=> b!919202 (= lt!412469 (select (arr!26429 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919203 () Bool)

(declare-fun res!619851 () Bool)

(assert (=> b!919203 (=> (not res!619851) (not e!515937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54967 (_ BitVec 32)) Bool)

(assert (=> b!919203 (= res!619851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919204 () Bool)

(assert (=> b!919204 (= e!515943 (and e!515942 mapRes!31008))))

(declare-fun condMapEmpty!31008 () Bool)

(declare-fun mapDefault!31008 () ValueCell!9269)

(assert (=> b!919204 (= condMapEmpty!31008 (= (arr!26428 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9269)) mapDefault!31008)))))

(declare-fun b!919205 () Bool)

(declare-fun res!619854 () Bool)

(assert (=> b!919205 (=> (not res!619854) (not e!515940))))

(assert (=> b!919205 (= res!619854 (validKeyInArray!0 k0!1099))))

(declare-fun b!919206 () Bool)

(declare-fun res!619856 () Bool)

(assert (=> b!919206 (=> (not res!619856) (not e!515937))))

(assert (=> b!919206 (= res!619856 (and (= (size!26889 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26890 _keys!1487) (size!26889 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919207 () Bool)

(assert (=> b!919207 (= e!515938 (not true))))

(assert (=> b!919207 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18572)))

(declare-datatypes ((Unit!30952 0))(
  ( (Unit!30953) )
))
(declare-fun lt!412471 () Unit!30952)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54967 (_ BitVec 32) (_ BitVec 32)) Unit!30952)

(assert (=> b!919207 (= lt!412471 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412472 () tuple2!12788)

(declare-fun +!2670 (ListLongMap!11475 tuple2!12788) ListLongMap!11475)

(assert (=> b!919207 (contains!4753 (+!2670 lt!412467 lt!412472) k0!1099)))

(declare-fun lt!412468 () Unit!30952)

(declare-fun lt!412466 () V!30967)

(declare-fun addStillContains!367 (ListLongMap!11475 (_ BitVec 64) V!30967 (_ BitVec 64)) Unit!30952)

(assert (=> b!919207 (= lt!412468 (addStillContains!367 lt!412467 lt!412469 lt!412466 k0!1099))))

(assert (=> b!919207 (= (getCurrentListMap!2945 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2670 (getCurrentListMap!2945 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412472))))

(assert (=> b!919207 (= lt!412472 (tuple2!12789 lt!412469 lt!412466))))

(declare-fun get!13863 (ValueCell!9269 V!30967) V!30967)

(declare-fun dynLambda!1426 (Int (_ BitVec 64)) V!30967)

(assert (=> b!919207 (= lt!412466 (get!13863 (select (arr!26428 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1426 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412470 () Unit!30952)

(declare-fun lemmaListMapRecursiveValidKeyArray!34 (array!54967 array!54965 (_ BitVec 32) (_ BitVec 32) V!30967 V!30967 (_ BitVec 32) Int) Unit!30952)

(assert (=> b!919207 (= lt!412470 (lemmaListMapRecursiveValidKeyArray!34 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919208 () Bool)

(declare-fun res!619850 () Bool)

(assert (=> b!919208 (=> (not res!619850) (not e!515937))))

(assert (=> b!919208 (= res!619850 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26890 _keys!1487))))))

(declare-fun b!919209 () Bool)

(declare-fun res!619858 () Bool)

(assert (=> b!919209 (=> (not res!619858) (not e!515940))))

(assert (=> b!919209 (= res!619858 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78762 res!619859) b!919206))

(assert (= (and b!919206 res!619856) b!919203))

(assert (= (and b!919203 res!619851) b!919199))

(assert (= (and b!919199 res!619853) b!919208))

(assert (= (and b!919208 res!619850) b!919200))

(assert (= (and b!919200 res!619857) b!919197))

(assert (= (and b!919197 res!619852) b!919209))

(assert (= (and b!919209 res!619858) b!919205))

(assert (= (and b!919205 res!619854) b!919202))

(assert (= (and b!919202 res!619855) b!919207))

(assert (= (and b!919204 condMapEmpty!31008) mapIsEmpty!31008))

(assert (= (and b!919204 (not condMapEmpty!31008)) mapNonEmpty!31008))

(get-info :version)

(assert (= (and mapNonEmpty!31008 ((_ is ValueCellFull!9269) mapValue!31008)) b!919198))

(assert (= (and b!919204 ((_ is ValueCellFull!9269) mapDefault!31008)) b!919201))

(assert (= start!78762 b!919204))

(declare-fun b_lambda!13477 () Bool)

(assert (=> (not b_lambda!13477) (not b!919207)))

(declare-fun t!26287 () Bool)

(declare-fun tb!5565 () Bool)

(assert (=> (and start!78762 (= defaultEntry!1235 defaultEntry!1235) t!26287) tb!5565))

(declare-fun result!10961 () Bool)

(assert (=> tb!5565 (= result!10961 tp_is_empty!19501)))

(assert (=> b!919207 t!26287))

(declare-fun b_and!27699 () Bool)

(assert (= b_and!27697 (and (=> t!26287 result!10961) b_and!27699)))

(declare-fun m!852457 () Bool)

(assert (=> b!919202 m!852457))

(declare-fun m!852459 () Bool)

(assert (=> b!919202 m!852459))

(declare-fun m!852461 () Bool)

(assert (=> b!919207 m!852461))

(declare-fun m!852463 () Bool)

(assert (=> b!919207 m!852463))

(declare-fun m!852465 () Bool)

(assert (=> b!919207 m!852465))

(declare-fun m!852467 () Bool)

(assert (=> b!919207 m!852467))

(declare-fun m!852469 () Bool)

(assert (=> b!919207 m!852469))

(declare-fun m!852471 () Bool)

(assert (=> b!919207 m!852471))

(assert (=> b!919207 m!852465))

(assert (=> b!919207 m!852467))

(declare-fun m!852473 () Bool)

(assert (=> b!919207 m!852473))

(declare-fun m!852475 () Bool)

(assert (=> b!919207 m!852475))

(assert (=> b!919207 m!852461))

(declare-fun m!852477 () Bool)

(assert (=> b!919207 m!852477))

(declare-fun m!852479 () Bool)

(assert (=> b!919207 m!852479))

(declare-fun m!852481 () Bool)

(assert (=> b!919207 m!852481))

(assert (=> b!919207 m!852469))

(declare-fun m!852483 () Bool)

(assert (=> b!919207 m!852483))

(declare-fun m!852485 () Bool)

(assert (=> b!919205 m!852485))

(declare-fun m!852487 () Bool)

(assert (=> b!919199 m!852487))

(declare-fun m!852489 () Bool)

(assert (=> b!919200 m!852489))

(declare-fun m!852491 () Bool)

(assert (=> b!919200 m!852491))

(declare-fun m!852493 () Bool)

(assert (=> b!919197 m!852493))

(declare-fun m!852495 () Bool)

(assert (=> b!919203 m!852495))

(declare-fun m!852497 () Bool)

(assert (=> mapNonEmpty!31008 m!852497))

(declare-fun m!852499 () Bool)

(assert (=> start!78762 m!852499))

(declare-fun m!852501 () Bool)

(assert (=> start!78762 m!852501))

(declare-fun m!852503 () Bool)

(assert (=> start!78762 m!852503))

(check-sat (not b!919199) tp_is_empty!19501 (not b!919197) b_and!27699 (not b_lambda!13477) (not b!919202) (not b!919203) (not mapNonEmpty!31008) (not b!919200) (not b!919207) (not b_next!16993) (not start!78762) (not b!919205))
(check-sat b_and!27699 (not b_next!16993))
