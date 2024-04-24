; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79080 () Bool)

(assert start!79080)

(declare-fun b_free!17125 () Bool)

(declare-fun b_next!17125 () Bool)

(assert (=> start!79080 (= b_free!17125 (not b_next!17125))))

(declare-fun tp!59816 () Bool)

(declare-fun b_and!27997 () Bool)

(assert (=> start!79080 (= tp!59816 b_and!27997)))

(declare-fun b!923562 () Bool)

(declare-fun res!622536 () Bool)

(declare-fun e!518276 () Bool)

(assert (=> b!923562 (=> (not res!622536) (not e!518276))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923562 (= res!622536 (validKeyInArray!0 k0!1099))))

(declare-fun b!923563 () Bool)

(declare-fun res!622531 () Bool)

(declare-fun e!518273 () Bool)

(assert (=> b!923563 (=> (not res!622531) (not e!518273))))

(declare-datatypes ((array!55289 0))(
  ( (array!55290 (arr!26585 (Array (_ BitVec 32) (_ BitVec 64))) (size!27045 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55289)

(declare-datatypes ((List!18646 0))(
  ( (Nil!18643) (Cons!18642 (h!19794 (_ BitVec 64)) (t!26493 List!18646)) )
))
(declare-fun arrayNoDuplicates!0 (array!55289 (_ BitVec 32) List!18646) Bool)

(assert (=> b!923563 (= res!622531 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18643))))

(declare-fun b!923564 () Bool)

(declare-fun res!622530 () Bool)

(assert (=> b!923564 (=> (not res!622530) (not e!518273))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31143 0))(
  ( (V!31144 (val!9867 Int)) )
))
(declare-datatypes ((ValueCell!9335 0))(
  ( (ValueCellFull!9335 (v!12382 V!31143)) (EmptyCell!9335) )
))
(declare-datatypes ((array!55291 0))(
  ( (array!55292 (arr!26586 (Array (_ BitVec 32) ValueCell!9335)) (size!27046 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55291)

(assert (=> b!923564 (= res!622530 (and (= (size!27046 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27045 _keys!1487) (size!27046 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923565 () Bool)

(declare-fun res!622534 () Bool)

(assert (=> b!923565 (=> (not res!622534) (not e!518276))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923565 (= res!622534 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923566 () Bool)

(declare-fun e!518278 () Bool)

(declare-fun tp_is_empty!19633 () Bool)

(assert (=> b!923566 (= e!518278 tp_is_empty!19633)))

(declare-fun b!923567 () Bool)

(assert (=> b!923567 (= e!518273 e!518276)))

(declare-fun res!622535 () Bool)

(assert (=> b!923567 (=> (not res!622535) (not e!518276))))

(declare-datatypes ((tuple2!12830 0))(
  ( (tuple2!12831 (_1!6426 (_ BitVec 64)) (_2!6426 V!31143)) )
))
(declare-datatypes ((List!18647 0))(
  ( (Nil!18644) (Cons!18643 (h!19795 tuple2!12830) (t!26494 List!18647)) )
))
(declare-datatypes ((ListLongMap!11529 0))(
  ( (ListLongMap!11530 (toList!5780 List!18647)) )
))
(declare-fun lt!414726 () ListLongMap!11529)

(declare-fun contains!4853 (ListLongMap!11529 (_ BitVec 64)) Bool)

(assert (=> b!923567 (= res!622535 (contains!4853 lt!414726 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31143)

(declare-fun minValue!1173 () V!31143)

(declare-fun getCurrentListMap!3031 (array!55289 array!55291 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 32) Int) ListLongMap!11529)

(assert (=> b!923567 (= lt!414726 (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!622528 () Bool)

(assert (=> start!79080 (=> (not res!622528) (not e!518273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79080 (= res!622528 (validMask!0 mask!1881))))

(assert (=> start!79080 e!518273))

(assert (=> start!79080 true))

(assert (=> start!79080 tp_is_empty!19633))

(declare-fun e!518275 () Bool)

(declare-fun array_inv!20806 (array!55291) Bool)

(assert (=> start!79080 (and (array_inv!20806 _values!1231) e!518275)))

(assert (=> start!79080 tp!59816))

(declare-fun array_inv!20807 (array!55289) Bool)

(assert (=> start!79080 (array_inv!20807 _keys!1487)))

(declare-fun b!923568 () Bool)

(declare-fun res!622533 () Bool)

(assert (=> b!923568 (=> (not res!622533) (not e!518276))))

(declare-fun v!791 () V!31143)

(declare-fun apply!637 (ListLongMap!11529 (_ BitVec 64)) V!31143)

(assert (=> b!923568 (= res!622533 (= (apply!637 lt!414726 k0!1099) v!791))))

(declare-fun b!923569 () Bool)

(declare-fun res!622532 () Bool)

(assert (=> b!923569 (=> (not res!622532) (not e!518273))))

(assert (=> b!923569 (= res!622532 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27045 _keys!1487))))))

(declare-fun b!923570 () Bool)

(declare-fun e!518274 () Bool)

(assert (=> b!923570 (= e!518276 e!518274)))

(declare-fun res!622529 () Bool)

(assert (=> b!923570 (=> (not res!622529) (not e!518274))))

(declare-fun lt!414728 () (_ BitVec 64))

(assert (=> b!923570 (= res!622529 (validKeyInArray!0 lt!414728))))

(assert (=> b!923570 (= lt!414728 (select (arr!26585 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923571 () Bool)

(declare-fun e!518271 () Bool)

(declare-fun arrayContainsKey!0 (array!55289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923571 (= e!518271 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923572 () Bool)

(assert (=> b!923572 (= e!518271 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31206 () Bool)

(declare-fun mapRes!31206 () Bool)

(assert (=> mapIsEmpty!31206 mapRes!31206))

(declare-fun b!923573 () Bool)

(assert (=> b!923573 (= e!518275 (and e!518278 mapRes!31206))))

(declare-fun condMapEmpty!31206 () Bool)

(declare-fun mapDefault!31206 () ValueCell!9335)

(assert (=> b!923573 (= condMapEmpty!31206 (= (arr!26586 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9335)) mapDefault!31206)))))

(declare-fun mapNonEmpty!31206 () Bool)

(declare-fun tp!59817 () Bool)

(declare-fun e!518277 () Bool)

(assert (=> mapNonEmpty!31206 (= mapRes!31206 (and tp!59817 e!518277))))

(declare-fun mapValue!31206 () ValueCell!9335)

(declare-fun mapKey!31206 () (_ BitVec 32))

(declare-fun mapRest!31206 () (Array (_ BitVec 32) ValueCell!9335))

(assert (=> mapNonEmpty!31206 (= (arr!26586 _values!1231) (store mapRest!31206 mapKey!31206 mapValue!31206))))

(declare-fun b!923574 () Bool)

(assert (=> b!923574 (= e!518277 tp_is_empty!19633)))

(declare-fun b!923575 () Bool)

(assert (=> b!923575 (= e!518274 (not true))))

(assert (=> b!923575 (not (= lt!414728 k0!1099))))

(declare-datatypes ((Unit!31124 0))(
  ( (Unit!31125) )
))
(declare-fun lt!414731 () Unit!31124)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55289 (_ BitVec 64) (_ BitVec 32) List!18646) Unit!31124)

(assert (=> b!923575 (= lt!414731 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18643))))

(assert (=> b!923575 e!518271))

(declare-fun c!96471 () Bool)

(assert (=> b!923575 (= c!96471 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414724 () Unit!31124)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!197 (array!55289 array!55291 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 64) (_ BitVec 32) Int) Unit!31124)

(assert (=> b!923575 (= lt!414724 (lemmaListMapContainsThenArrayContainsFrom!197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923575 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18643)))

(declare-fun lt!414723 () Unit!31124)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55289 (_ BitVec 32) (_ BitVec 32)) Unit!31124)

(assert (=> b!923575 (= lt!414723 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414729 () tuple2!12830)

(declare-fun +!2706 (ListLongMap!11529 tuple2!12830) ListLongMap!11529)

(assert (=> b!923575 (contains!4853 (+!2706 lt!414726 lt!414729) k0!1099)))

(declare-fun lt!414730 () Unit!31124)

(declare-fun lt!414725 () V!31143)

(declare-fun addStillContains!415 (ListLongMap!11529 (_ BitVec 64) V!31143 (_ BitVec 64)) Unit!31124)

(assert (=> b!923575 (= lt!414730 (addStillContains!415 lt!414726 lt!414728 lt!414725 k0!1099))))

(assert (=> b!923575 (= (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2706 (getCurrentListMap!3031 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414729))))

(assert (=> b!923575 (= lt!414729 (tuple2!12831 lt!414728 lt!414725))))

(declare-fun get!13983 (ValueCell!9335 V!31143) V!31143)

(declare-fun dynLambda!1503 (Int (_ BitVec 64)) V!31143)

(assert (=> b!923575 (= lt!414725 (get!13983 (select (arr!26586 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1503 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414727 () Unit!31124)

(declare-fun lemmaListMapRecursiveValidKeyArray!86 (array!55289 array!55291 (_ BitVec 32) (_ BitVec 32) V!31143 V!31143 (_ BitVec 32) Int) Unit!31124)

(assert (=> b!923575 (= lt!414727 (lemmaListMapRecursiveValidKeyArray!86 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923576 () Bool)

(declare-fun res!622527 () Bool)

(assert (=> b!923576 (=> (not res!622527) (not e!518273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55289 (_ BitVec 32)) Bool)

(assert (=> b!923576 (= res!622527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79080 res!622528) b!923564))

(assert (= (and b!923564 res!622530) b!923576))

(assert (= (and b!923576 res!622527) b!923563))

(assert (= (and b!923563 res!622531) b!923569))

(assert (= (and b!923569 res!622532) b!923567))

(assert (= (and b!923567 res!622535) b!923568))

(assert (= (and b!923568 res!622533) b!923565))

(assert (= (and b!923565 res!622534) b!923562))

(assert (= (and b!923562 res!622536) b!923570))

(assert (= (and b!923570 res!622529) b!923575))

(assert (= (and b!923575 c!96471) b!923571))

(assert (= (and b!923575 (not c!96471)) b!923572))

(assert (= (and b!923573 condMapEmpty!31206) mapIsEmpty!31206))

(assert (= (and b!923573 (not condMapEmpty!31206)) mapNonEmpty!31206))

(get-info :version)

(assert (= (and mapNonEmpty!31206 ((_ is ValueCellFull!9335) mapValue!31206)) b!923574))

(assert (= (and b!923573 ((_ is ValueCellFull!9335) mapDefault!31206)) b!923566))

(assert (= start!79080 b!923573))

(declare-fun b_lambda!13641 () Bool)

(assert (=> (not b_lambda!13641) (not b!923575)))

(declare-fun t!26492 () Bool)

(declare-fun tb!5697 () Bool)

(assert (=> (and start!79080 (= defaultEntry!1235 defaultEntry!1235) t!26492) tb!5697))

(declare-fun result!11225 () Bool)

(assert (=> tb!5697 (= result!11225 tp_is_empty!19633)))

(assert (=> b!923575 t!26492))

(declare-fun b_and!27999 () Bool)

(assert (= b_and!27997 (and (=> t!26492 result!11225) b_and!27999)))

(declare-fun m!858055 () Bool)

(assert (=> b!923575 m!858055))

(declare-fun m!858057 () Bool)

(assert (=> b!923575 m!858057))

(declare-fun m!858059 () Bool)

(assert (=> b!923575 m!858059))

(declare-fun m!858061 () Bool)

(assert (=> b!923575 m!858061))

(declare-fun m!858063 () Bool)

(assert (=> b!923575 m!858063))

(declare-fun m!858065 () Bool)

(assert (=> b!923575 m!858065))

(assert (=> b!923575 m!858059))

(assert (=> b!923575 m!858065))

(declare-fun m!858067 () Bool)

(assert (=> b!923575 m!858067))

(declare-fun m!858069 () Bool)

(assert (=> b!923575 m!858069))

(declare-fun m!858071 () Bool)

(assert (=> b!923575 m!858071))

(assert (=> b!923575 m!858055))

(declare-fun m!858073 () Bool)

(assert (=> b!923575 m!858073))

(declare-fun m!858075 () Bool)

(assert (=> b!923575 m!858075))

(declare-fun m!858077 () Bool)

(assert (=> b!923575 m!858077))

(declare-fun m!858079 () Bool)

(assert (=> b!923575 m!858079))

(assert (=> b!923575 m!858061))

(declare-fun m!858081 () Bool)

(assert (=> b!923575 m!858081))

(declare-fun m!858083 () Bool)

(assert (=> b!923568 m!858083))

(declare-fun m!858085 () Bool)

(assert (=> b!923562 m!858085))

(declare-fun m!858087 () Bool)

(assert (=> mapNonEmpty!31206 m!858087))

(declare-fun m!858089 () Bool)

(assert (=> b!923567 m!858089))

(declare-fun m!858091 () Bool)

(assert (=> b!923567 m!858091))

(declare-fun m!858093 () Bool)

(assert (=> b!923576 m!858093))

(declare-fun m!858095 () Bool)

(assert (=> b!923570 m!858095))

(declare-fun m!858097 () Bool)

(assert (=> b!923570 m!858097))

(declare-fun m!858099 () Bool)

(assert (=> start!79080 m!858099))

(declare-fun m!858101 () Bool)

(assert (=> start!79080 m!858101))

(declare-fun m!858103 () Bool)

(assert (=> start!79080 m!858103))

(declare-fun m!858105 () Bool)

(assert (=> b!923571 m!858105))

(declare-fun m!858107 () Bool)

(assert (=> b!923563 m!858107))

(check-sat (not b!923576) b_and!27999 (not b_lambda!13641) (not mapNonEmpty!31206) tp_is_empty!19633 (not start!79080) (not b!923570) (not b!923575) (not b_next!17125) (not b!923571) (not b!923562) (not b!923568) (not b!923567) (not b!923563))
(check-sat b_and!27999 (not b_next!17125))
