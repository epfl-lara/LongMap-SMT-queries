; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79078 () Bool)

(assert start!79078)

(declare-fun b_free!17291 () Bool)

(declare-fun b_next!17291 () Bool)

(assert (=> start!79078 (= b_free!17291 (not b_next!17291))))

(declare-fun tp!60313 () Bool)

(declare-fun b_and!28319 () Bool)

(assert (=> start!79078 (= tp!60313 b_and!28319)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!520660 () Bool)

(declare-fun b!927437 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!55560 0))(
  ( (array!55561 (arr!26725 (Array (_ BitVec 32) (_ BitVec 64))) (size!27184 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55560)

(declare-fun arrayContainsKey!0 (array!55560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927437 (= e!520660 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!927438 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927438 (= e!520660 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927439 () Bool)

(declare-fun e!520668 () Bool)

(declare-fun e!520669 () Bool)

(assert (=> b!927439 (= e!520668 e!520669)))

(declare-fun res!624690 () Bool)

(assert (=> b!927439 (=> (not res!624690) (not e!520669))))

(assert (=> b!927439 (= res!624690 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27184 _keys!1487)))))

(declare-datatypes ((Unit!31367 0))(
  ( (Unit!31368) )
))
(declare-fun lt!418009 () Unit!31367)

(declare-fun e!520663 () Unit!31367)

(assert (=> b!927439 (= lt!418009 e!520663)))

(declare-fun c!96869 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927439 (= c!96869 (validKeyInArray!0 k!1099))))

(declare-fun b!927440 () Bool)

(declare-fun e!520665 () Bool)

(declare-fun tp_is_empty!19799 () Bool)

(assert (=> b!927440 (= e!520665 tp_is_empty!19799)))

(declare-datatypes ((V!31363 0))(
  ( (V!31364 (val!9950 Int)) )
))
(declare-fun v!791 () V!31363)

(declare-fun e!520664 () Bool)

(declare-datatypes ((tuple2!12990 0))(
  ( (tuple2!12991 (_1!6506 (_ BitVec 64)) (_2!6506 V!31363)) )
))
(declare-datatypes ((List!18791 0))(
  ( (Nil!18788) (Cons!18787 (h!19933 tuple2!12990) (t!26812 List!18791)) )
))
(declare-datatypes ((ListLongMap!11687 0))(
  ( (ListLongMap!11688 (toList!5859 List!18791)) )
))
(declare-fun lt!418017 () ListLongMap!11687)

(declare-fun b!927441 () Bool)

(declare-fun apply!689 (ListLongMap!11687 (_ BitVec 64)) V!31363)

(assert (=> b!927441 (= e!520664 (= (apply!689 lt!418017 k!1099) v!791))))

(declare-fun res!624699 () Bool)

(declare-fun e!520661 () Bool)

(assert (=> start!79078 (=> (not res!624699) (not e!520661))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79078 (= res!624699 (validMask!0 mask!1881))))

(assert (=> start!79078 e!520661))

(assert (=> start!79078 true))

(assert (=> start!79078 tp_is_empty!19799))

(declare-datatypes ((ValueCell!9418 0))(
  ( (ValueCellFull!9418 (v!12468 V!31363)) (EmptyCell!9418) )
))
(declare-datatypes ((array!55562 0))(
  ( (array!55563 (arr!26726 (Array (_ BitVec 32) ValueCell!9418)) (size!27185 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55562)

(declare-fun e!520657 () Bool)

(declare-fun array_inv!20812 (array!55562) Bool)

(assert (=> start!79078 (and (array_inv!20812 _values!1231) e!520657)))

(assert (=> start!79078 tp!60313))

(declare-fun array_inv!20813 (array!55560) Bool)

(assert (=> start!79078 (array_inv!20813 _keys!1487)))

(declare-fun b!927442 () Bool)

(declare-fun e!520667 () Bool)

(assert (=> b!927442 (= e!520667 e!520668)))

(declare-fun res!624696 () Bool)

(assert (=> b!927442 (=> (not res!624696) (not e!520668))))

(declare-fun lt!418010 () V!31363)

(assert (=> b!927442 (= res!624696 (and (= lt!418010 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418023 () ListLongMap!11687)

(assert (=> b!927442 (= lt!418010 (apply!689 lt!418023 k!1099))))

(declare-fun mapNonEmpty!31455 () Bool)

(declare-fun mapRes!31455 () Bool)

(declare-fun tp!60314 () Bool)

(assert (=> mapNonEmpty!31455 (= mapRes!31455 (and tp!60314 e!520665))))

(declare-fun mapValue!31455 () ValueCell!9418)

(declare-fun mapRest!31455 () (Array (_ BitVec 32) ValueCell!9418))

(declare-fun mapKey!31455 () (_ BitVec 32))

(assert (=> mapNonEmpty!31455 (= (arr!26726 _values!1231) (store mapRest!31455 mapKey!31455 mapValue!31455))))

(declare-fun mapIsEmpty!31455 () Bool)

(assert (=> mapIsEmpty!31455 mapRes!31455))

(declare-fun b!927443 () Bool)

(declare-fun res!624693 () Bool)

(assert (=> b!927443 (=> (not res!624693) (not e!520661))))

(declare-datatypes ((List!18792 0))(
  ( (Nil!18789) (Cons!18788 (h!19934 (_ BitVec 64)) (t!26813 List!18792)) )
))
(declare-fun arrayNoDuplicates!0 (array!55560 (_ BitVec 32) List!18792) Bool)

(assert (=> b!927443 (= res!624693 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18789))))

(declare-fun b!927444 () Bool)

(declare-fun res!624692 () Bool)

(assert (=> b!927444 (=> (not res!624692) (not e!520661))))

(assert (=> b!927444 (= res!624692 (and (= (size!27185 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27184 _keys!1487) (size!27185 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927445 () Bool)

(declare-fun res!624691 () Bool)

(declare-fun e!520658 () Bool)

(assert (=> b!927445 (=> (not res!624691) (not e!520658))))

(declare-fun lt!418016 () ListLongMap!11687)

(assert (=> b!927445 (= res!624691 (= (apply!689 lt!418016 k!1099) v!791))))

(declare-fun b!927446 () Bool)

(declare-fun e!520666 () Unit!31367)

(assert (=> b!927446 (= e!520663 e!520666)))

(declare-fun lt!418013 () (_ BitVec 64))

(assert (=> b!927446 (= lt!418013 (select (arr!26725 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96868 () Bool)

(assert (=> b!927446 (= c!96868 (validKeyInArray!0 lt!418013))))

(declare-fun b!927447 () Bool)

(declare-fun res!624700 () Bool)

(assert (=> b!927447 (=> (not res!624700) (not e!520661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55560 (_ BitVec 32)) Bool)

(assert (=> b!927447 (= res!624700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927448 () Bool)

(assert (=> b!927448 (= e!520661 e!520667)))

(declare-fun res!624697 () Bool)

(assert (=> b!927448 (=> (not res!624697) (not e!520667))))

(declare-fun contains!4917 (ListLongMap!11687 (_ BitVec 64)) Bool)

(assert (=> b!927448 (= res!624697 (contains!4917 lt!418023 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31363)

(declare-fun minValue!1173 () V!31363)

(declare-fun getCurrentListMap!3108 (array!55560 array!55562 (_ BitVec 32) (_ BitVec 32) V!31363 V!31363 (_ BitVec 32) Int) ListLongMap!11687)

(assert (=> b!927448 (= lt!418023 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927449 () Bool)

(assert (=> b!927449 (= e!520658 (not true))))

(assert (=> b!927449 e!520664))

(declare-fun res!624695 () Bool)

(assert (=> b!927449 (=> (not res!624695) (not e!520664))))

(assert (=> b!927449 (= res!624695 (contains!4917 lt!418017 k!1099))))

(assert (=> b!927449 (= lt!418017 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418019 () Unit!31367)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!89 (array!55560 array!55562 (_ BitVec 32) (_ BitVec 32) V!31363 V!31363 (_ BitVec 64) V!31363 (_ BitVec 32) Int) Unit!31367)

(assert (=> b!927449 (= lt!418019 (lemmaListMapApplyFromThenApplyFromZero!89 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927450 () Bool)

(declare-fun Unit!31369 () Unit!31367)

(assert (=> b!927450 (= e!520663 Unit!31369)))

(declare-fun b!927451 () Bool)

(declare-fun lt!418022 () ListLongMap!11687)

(assert (=> b!927451 (= (apply!689 lt!418022 k!1099) lt!418010)))

(declare-fun lt!418018 () Unit!31367)

(declare-fun lt!418015 () V!31363)

(declare-fun addApplyDifferent!404 (ListLongMap!11687 (_ BitVec 64) V!31363 (_ BitVec 64)) Unit!31367)

(assert (=> b!927451 (= lt!418018 (addApplyDifferent!404 lt!418023 lt!418013 lt!418015 k!1099))))

(assert (=> b!927451 (not (= lt!418013 k!1099))))

(declare-fun lt!418021 () Unit!31367)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55560 (_ BitVec 64) (_ BitVec 32) List!18792) Unit!31367)

(assert (=> b!927451 (= lt!418021 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18789))))

(assert (=> b!927451 e!520660))

(declare-fun c!96870 () Bool)

(assert (=> b!927451 (= c!96870 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418011 () Unit!31367)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!255 (array!55560 array!55562 (_ BitVec 32) (_ BitVec 32) V!31363 V!31363 (_ BitVec 64) (_ BitVec 32) Int) Unit!31367)

(assert (=> b!927451 (= lt!418011 (lemmaListMapContainsThenArrayContainsFrom!255 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927451 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18789)))

(declare-fun lt!418020 () Unit!31367)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55560 (_ BitVec 32) (_ BitVec 32)) Unit!31367)

(assert (=> b!927451 (= lt!418020 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927451 (contains!4917 lt!418022 k!1099)))

(declare-fun lt!418012 () tuple2!12990)

(declare-fun +!2748 (ListLongMap!11687 tuple2!12990) ListLongMap!11687)

(assert (=> b!927451 (= lt!418022 (+!2748 lt!418023 lt!418012))))

(declare-fun lt!418024 () Unit!31367)

(declare-fun addStillContains!472 (ListLongMap!11687 (_ BitVec 64) V!31363 (_ BitVec 64)) Unit!31367)

(assert (=> b!927451 (= lt!418024 (addStillContains!472 lt!418023 lt!418013 lt!418015 k!1099))))

(assert (=> b!927451 (= (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2748 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418012))))

(assert (=> b!927451 (= lt!418012 (tuple2!12991 lt!418013 lt!418015))))

(declare-fun get!14067 (ValueCell!9418 V!31363) V!31363)

(declare-fun dynLambda!1537 (Int (_ BitVec 64)) V!31363)

(assert (=> b!927451 (= lt!418015 (get!14067 (select (arr!26726 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1537 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418014 () Unit!31367)

(declare-fun lemmaListMapRecursiveValidKeyArray!138 (array!55560 array!55562 (_ BitVec 32) (_ BitVec 32) V!31363 V!31363 (_ BitVec 32) Int) Unit!31367)

(assert (=> b!927451 (= lt!418014 (lemmaListMapRecursiveValidKeyArray!138 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927451 (= e!520666 lt!418018)))

(declare-fun b!927452 () Bool)

(declare-fun Unit!31370 () Unit!31367)

(assert (=> b!927452 (= e!520666 Unit!31370)))

(declare-fun b!927453 () Bool)

(assert (=> b!927453 (= e!520669 e!520658)))

(declare-fun res!624698 () Bool)

(assert (=> b!927453 (=> (not res!624698) (not e!520658))))

(assert (=> b!927453 (= res!624698 (contains!4917 lt!418016 k!1099))))

(assert (=> b!927453 (= lt!418016 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927454 () Bool)

(declare-fun e!520659 () Bool)

(assert (=> b!927454 (= e!520657 (and e!520659 mapRes!31455))))

(declare-fun condMapEmpty!31455 () Bool)

(declare-fun mapDefault!31455 () ValueCell!9418)

