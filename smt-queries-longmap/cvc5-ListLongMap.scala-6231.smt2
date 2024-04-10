; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79658 () Bool)

(assert start!79658)

(declare-fun b_free!17707 () Bool)

(declare-fun b_next!17707 () Bool)

(assert (=> start!79658 (= b_free!17707 (not b_next!17707))))

(declare-fun tp!61577 () Bool)

(declare-fun b_and!29005 () Bool)

(assert (=> start!79658 (= tp!61577 b_and!29005)))

(declare-fun b!936638 () Bool)

(declare-fun res!630617 () Bool)

(declare-fun e!525929 () Bool)

(assert (=> b!936638 (=> (not res!630617) (not e!525929))))

(declare-datatypes ((array!56370 0))(
  ( (array!56371 (arr!27125 (Array (_ BitVec 32) (_ BitVec 64))) (size!27584 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56370)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31919 0))(
  ( (V!31920 (val!10158 Int)) )
))
(declare-datatypes ((ValueCell!9626 0))(
  ( (ValueCellFull!9626 (v!12683 V!31919)) (EmptyCell!9626) )
))
(declare-datatypes ((array!56372 0))(
  ( (array!56373 (arr!27126 (Array (_ BitVec 32) ValueCell!9626)) (size!27585 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56372)

(assert (=> b!936638 (= res!630617 (and (= (size!27585 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27584 _keys!1487) (size!27585 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!936639 () Bool)

(declare-fun e!525932 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936639 (= e!525932 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!936640 () Bool)

(declare-fun res!630620 () Bool)

(assert (=> b!936640 (=> (not res!630620) (not e!525929))))

(declare-datatypes ((List!19119 0))(
  ( (Nil!19116) (Cons!19115 (h!20261 (_ BitVec 64)) (t!27370 List!19119)) )
))
(declare-fun arrayNoDuplicates!0 (array!56370 (_ BitVec 32) List!19119) Bool)

(assert (=> b!936640 (= res!630620 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19116))))

(declare-fun b!936641 () Bool)

(declare-fun e!525933 () Bool)

(declare-fun e!525928 () Bool)

(assert (=> b!936641 (= e!525933 e!525928)))

(declare-fun res!630618 () Bool)

(assert (=> b!936641 (=> (not res!630618) (not e!525928))))

(declare-fun lt!422382 () V!31919)

(declare-fun v!791 () V!31919)

(assert (=> b!936641 (= res!630618 (and (= lt!422382 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13340 0))(
  ( (tuple2!13341 (_1!6681 (_ BitVec 64)) (_2!6681 V!31919)) )
))
(declare-datatypes ((List!19120 0))(
  ( (Nil!19117) (Cons!19116 (h!20262 tuple2!13340) (t!27371 List!19120)) )
))
(declare-datatypes ((ListLongMap!12037 0))(
  ( (ListLongMap!12038 (toList!6034 List!19120)) )
))
(declare-fun lt!422380 () ListLongMap!12037)

(declare-fun apply!836 (ListLongMap!12037 (_ BitVec 64)) V!31919)

(assert (=> b!936641 (= lt!422382 (apply!836 lt!422380 k!1099))))

(declare-fun b!936642 () Bool)

(assert (=> b!936642 (= e!525932 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936643 () Bool)

(declare-datatypes ((Unit!31598 0))(
  ( (Unit!31599) )
))
(declare-fun e!525930 () Unit!31598)

(declare-fun Unit!31600 () Unit!31598)

(assert (=> b!936643 (= e!525930 Unit!31600)))

(declare-fun b!936644 () Bool)

(assert (=> b!936644 (= e!525928 false)))

(declare-fun lt!422384 () Unit!31598)

(declare-fun e!525936 () Unit!31598)

(assert (=> b!936644 (= lt!422384 e!525936)))

(declare-fun c!97434 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936644 (= c!97434 (validKeyInArray!0 k!1099))))

(declare-fun b!936645 () Bool)

(declare-fun res!630616 () Bool)

(assert (=> b!936645 (=> (not res!630616) (not e!525929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56370 (_ BitVec 32)) Bool)

(assert (=> b!936645 (= res!630616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936646 () Bool)

(declare-fun lt!422385 () ListLongMap!12037)

(assert (=> b!936646 (= (apply!836 lt!422385 k!1099) lt!422382)))

(declare-fun lt!422389 () V!31919)

(declare-fun lt!422381 () Unit!31598)

(declare-fun lt!422378 () (_ BitVec 64))

(declare-fun addApplyDifferent!424 (ListLongMap!12037 (_ BitVec 64) V!31919 (_ BitVec 64)) Unit!31598)

(assert (=> b!936646 (= lt!422381 (addApplyDifferent!424 lt!422380 lt!422378 lt!422389 k!1099))))

(assert (=> b!936646 (not (= lt!422378 k!1099))))

(declare-fun lt!422390 () Unit!31598)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56370 (_ BitVec 64) (_ BitVec 32) List!19119) Unit!31598)

(assert (=> b!936646 (= lt!422390 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19116))))

(assert (=> b!936646 e!525932))

(declare-fun c!97432 () Bool)

(assert (=> b!936646 (= c!97432 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!422379 () Unit!31598)

(declare-fun zeroValue!1173 () V!31919)

(declare-fun minValue!1173 () V!31919)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!297 (array!56370 array!56372 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 64) (_ BitVec 32) Int) Unit!31598)

(assert (=> b!936646 (= lt!422379 (lemmaListMapContainsThenArrayContainsFrom!297 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936646 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19116)))

(declare-fun lt!422386 () Unit!31598)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56370 (_ BitVec 32) (_ BitVec 32)) Unit!31598)

(assert (=> b!936646 (= lt!422386 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5094 (ListLongMap!12037 (_ BitVec 64)) Bool)

(assert (=> b!936646 (contains!5094 lt!422385 k!1099)))

(declare-fun lt!422388 () tuple2!13340)

(declare-fun +!2825 (ListLongMap!12037 tuple2!13340) ListLongMap!12037)

(assert (=> b!936646 (= lt!422385 (+!2825 lt!422380 lt!422388))))

(declare-fun lt!422387 () Unit!31598)

(declare-fun addStillContains!544 (ListLongMap!12037 (_ BitVec 64) V!31919 (_ BitVec 64)) Unit!31598)

(assert (=> b!936646 (= lt!422387 (addStillContains!544 lt!422380 lt!422378 lt!422389 k!1099))))

(declare-fun getCurrentListMap!3270 (array!56370 array!56372 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 32) Int) ListLongMap!12037)

(assert (=> b!936646 (= (getCurrentListMap!3270 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2825 (getCurrentListMap!3270 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422388))))

(assert (=> b!936646 (= lt!422388 (tuple2!13341 lt!422378 lt!422389))))

(declare-fun get!14299 (ValueCell!9626 V!31919) V!31919)

(declare-fun dynLambda!1614 (Int (_ BitVec 64)) V!31919)

(assert (=> b!936646 (= lt!422389 (get!14299 (select (arr!27126 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1614 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422383 () Unit!31598)

(declare-fun lemmaListMapRecursiveValidKeyArray!215 (array!56370 array!56372 (_ BitVec 32) (_ BitVec 32) V!31919 V!31919 (_ BitVec 32) Int) Unit!31598)

(assert (=> b!936646 (= lt!422383 (lemmaListMapRecursiveValidKeyArray!215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936646 (= e!525930 lt!422381)))

(declare-fun b!936647 () Bool)

(assert (=> b!936647 (= e!525929 e!525933)))

(declare-fun res!630621 () Bool)

(assert (=> b!936647 (=> (not res!630621) (not e!525933))))

(assert (=> b!936647 (= res!630621 (contains!5094 lt!422380 k!1099))))

(assert (=> b!936647 (= lt!422380 (getCurrentListMap!3270 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!630619 () Bool)

(assert (=> start!79658 (=> (not res!630619) (not e!525929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79658 (= res!630619 (validMask!0 mask!1881))))

(assert (=> start!79658 e!525929))

(assert (=> start!79658 true))

(declare-fun tp_is_empty!20215 () Bool)

(assert (=> start!79658 tp_is_empty!20215))

(declare-fun e!525934 () Bool)

(declare-fun array_inv!21104 (array!56372) Bool)

(assert (=> start!79658 (and (array_inv!21104 _values!1231) e!525934)))

(assert (=> start!79658 tp!61577))

(declare-fun array_inv!21105 (array!56370) Bool)

(assert (=> start!79658 (array_inv!21105 _keys!1487)))

(declare-fun b!936648 () Bool)

(declare-fun e!525935 () Bool)

(assert (=> b!936648 (= e!525935 tp_is_empty!20215)))

(declare-fun mapIsEmpty!32094 () Bool)

(declare-fun mapRes!32094 () Bool)

(assert (=> mapIsEmpty!32094 mapRes!32094))

(declare-fun b!936649 () Bool)

(assert (=> b!936649 (= e!525936 e!525930)))

(assert (=> b!936649 (= lt!422378 (select (arr!27125 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97433 () Bool)

(assert (=> b!936649 (= c!97433 (validKeyInArray!0 lt!422378))))

(declare-fun mapNonEmpty!32094 () Bool)

(declare-fun tp!61576 () Bool)

(assert (=> mapNonEmpty!32094 (= mapRes!32094 (and tp!61576 e!525935))))

(declare-fun mapKey!32094 () (_ BitVec 32))

(declare-fun mapRest!32094 () (Array (_ BitVec 32) ValueCell!9626))

(declare-fun mapValue!32094 () ValueCell!9626)

(assert (=> mapNonEmpty!32094 (= (arr!27126 _values!1231) (store mapRest!32094 mapKey!32094 mapValue!32094))))

(declare-fun b!936650 () Bool)

(declare-fun Unit!31601 () Unit!31598)

(assert (=> b!936650 (= e!525936 Unit!31601)))

(declare-fun b!936651 () Bool)

(declare-fun res!630622 () Bool)

(assert (=> b!936651 (=> (not res!630622) (not e!525929))))

(assert (=> b!936651 (= res!630622 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27584 _keys!1487))))))

(declare-fun b!936652 () Bool)

(declare-fun e!525931 () Bool)

(assert (=> b!936652 (= e!525934 (and e!525931 mapRes!32094))))

(declare-fun condMapEmpty!32094 () Bool)

(declare-fun mapDefault!32094 () ValueCell!9626)

