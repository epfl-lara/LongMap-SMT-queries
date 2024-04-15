; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78738 () Bool)

(assert start!78738)

(declare-fun b_free!16969 () Bool)

(declare-fun b_next!16969 () Bool)

(assert (=> start!78738 (= b_free!16969 (not b_next!16969))))

(declare-fun tp!59348 () Bool)

(declare-fun b_and!27649 () Bool)

(assert (=> start!78738 (= tp!59348 b_and!27649)))

(declare-fun b!918705 () Bool)

(declare-fun res!619495 () Bool)

(declare-fun e!515686 () Bool)

(assert (=> b!918705 (=> (not res!619495) (not e!515686))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918705 (= res!619495 (validKeyInArray!0 k0!1099))))

(declare-fun b!918706 () Bool)

(declare-fun e!515691 () Bool)

(assert (=> b!918706 (= e!515691 (not true))))

(declare-datatypes ((V!30935 0))(
  ( (V!30936 (val!9789 Int)) )
))
(declare-datatypes ((tuple2!12772 0))(
  ( (tuple2!12773 (_1!6397 (_ BitVec 64)) (_2!6397 V!30935)) )
))
(declare-datatypes ((List!18559 0))(
  ( (Nil!18556) (Cons!18555 (h!19701 tuple2!12772) (t!26249 List!18559)) )
))
(declare-datatypes ((ListLongMap!11459 0))(
  ( (ListLongMap!11460 (toList!5745 List!18559)) )
))
(declare-fun lt!412222 () ListLongMap!11459)

(declare-fun lt!412225 () tuple2!12772)

(declare-fun contains!4746 (ListLongMap!11459 (_ BitVec 64)) Bool)

(declare-fun +!2664 (ListLongMap!11459 tuple2!12772) ListLongMap!11459)

(assert (=> b!918706 (contains!4746 (+!2664 lt!412222 lt!412225) k0!1099)))

(declare-datatypes ((Unit!30940 0))(
  ( (Unit!30941) )
))
(declare-fun lt!412223 () Unit!30940)

(declare-fun lt!412226 () (_ BitVec 64))

(declare-fun lt!412224 () V!30935)

(declare-fun addStillContains!361 (ListLongMap!11459 (_ BitVec 64) V!30935 (_ BitVec 64)) Unit!30940)

(assert (=> b!918706 (= lt!412223 (addStillContains!361 lt!412222 lt!412226 lt!412224 k0!1099))))

(declare-datatypes ((array!54919 0))(
  ( (array!54920 (arr!26405 (Array (_ BitVec 32) (_ BitVec 64))) (size!26866 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54919)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9257 0))(
  ( (ValueCellFull!9257 (v!12306 V!30935)) (EmptyCell!9257) )
))
(declare-datatypes ((array!54921 0))(
  ( (array!54922 (arr!26406 (Array (_ BitVec 32) ValueCell!9257)) (size!26867 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54921)

(declare-fun zeroValue!1173 () V!30935)

(declare-fun minValue!1173 () V!30935)

(declare-fun getCurrentListMap!2938 (array!54919 array!54921 (_ BitVec 32) (_ BitVec 32) V!30935 V!30935 (_ BitVec 32) Int) ListLongMap!11459)

(assert (=> b!918706 (= (getCurrentListMap!2938 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2664 (getCurrentListMap!2938 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412225))))

(assert (=> b!918706 (= lt!412225 (tuple2!12773 lt!412226 lt!412224))))

(declare-fun get!13849 (ValueCell!9257 V!30935) V!30935)

(declare-fun dynLambda!1420 (Int (_ BitVec 64)) V!30935)

(assert (=> b!918706 (= lt!412224 (get!13849 (select (arr!26406 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1420 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412221 () Unit!30940)

(declare-fun lemmaListMapRecursiveValidKeyArray!28 (array!54919 array!54921 (_ BitVec 32) (_ BitVec 32) V!30935 V!30935 (_ BitVec 32) Int) Unit!30940)

(assert (=> b!918706 (= lt!412221 (lemmaListMapRecursiveValidKeyArray!28 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!30972 () Bool)

(declare-fun mapRes!30972 () Bool)

(declare-fun tp!59349 () Bool)

(declare-fun e!515688 () Bool)

(assert (=> mapNonEmpty!30972 (= mapRes!30972 (and tp!59349 e!515688))))

(declare-fun mapValue!30972 () ValueCell!9257)

(declare-fun mapKey!30972 () (_ BitVec 32))

(declare-fun mapRest!30972 () (Array (_ BitVec 32) ValueCell!9257))

(assert (=> mapNonEmpty!30972 (= (arr!26406 _values!1231) (store mapRest!30972 mapKey!30972 mapValue!30972))))

(declare-fun b!918707 () Bool)

(declare-fun tp_is_empty!19477 () Bool)

(assert (=> b!918707 (= e!515688 tp_is_empty!19477)))

(declare-fun b!918708 () Bool)

(declare-fun res!619498 () Bool)

(declare-fun e!515685 () Bool)

(assert (=> b!918708 (=> (not res!619498) (not e!515685))))

(declare-datatypes ((List!18560 0))(
  ( (Nil!18557) (Cons!18556 (h!19702 (_ BitVec 64)) (t!26250 List!18560)) )
))
(declare-fun arrayNoDuplicates!0 (array!54919 (_ BitVec 32) List!18560) Bool)

(assert (=> b!918708 (= res!619498 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18557))))

(declare-fun b!918709 () Bool)

(declare-fun res!619493 () Bool)

(assert (=> b!918709 (=> (not res!619493) (not e!515685))))

(assert (=> b!918709 (= res!619493 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26866 _keys!1487))))))

(declare-fun b!918710 () Bool)

(declare-fun res!619491 () Bool)

(assert (=> b!918710 (=> (not res!619491) (not e!515685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54919 (_ BitVec 32)) Bool)

(assert (=> b!918710 (= res!619491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918711 () Bool)

(assert (=> b!918711 (= e!515685 e!515686)))

(declare-fun res!619497 () Bool)

(assert (=> b!918711 (=> (not res!619497) (not e!515686))))

(assert (=> b!918711 (= res!619497 (contains!4746 lt!412222 k0!1099))))

(assert (=> b!918711 (= lt!412222 (getCurrentListMap!2938 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918712 () Bool)

(declare-fun res!619496 () Bool)

(assert (=> b!918712 (=> (not res!619496) (not e!515685))))

(assert (=> b!918712 (= res!619496 (and (= (size!26867 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26866 _keys!1487) (size!26867 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918713 () Bool)

(declare-fun res!619494 () Bool)

(assert (=> b!918713 (=> (not res!619494) (not e!515686))))

(declare-fun v!791 () V!30935)

(declare-fun apply!576 (ListLongMap!11459 (_ BitVec 64)) V!30935)

(assert (=> b!918713 (= res!619494 (= (apply!576 lt!412222 k0!1099) v!791))))

(declare-fun b!918714 () Bool)

(assert (=> b!918714 (= e!515686 e!515691)))

(declare-fun res!619499 () Bool)

(assert (=> b!918714 (=> (not res!619499) (not e!515691))))

(assert (=> b!918714 (= res!619499 (validKeyInArray!0 lt!412226))))

(assert (=> b!918714 (= lt!412226 (select (arr!26405 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918715 () Bool)

(declare-fun e!515690 () Bool)

(declare-fun e!515689 () Bool)

(assert (=> b!918715 (= e!515690 (and e!515689 mapRes!30972))))

(declare-fun condMapEmpty!30972 () Bool)

(declare-fun mapDefault!30972 () ValueCell!9257)

(assert (=> b!918715 (= condMapEmpty!30972 (= (arr!26406 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9257)) mapDefault!30972)))))

(declare-fun b!918716 () Bool)

(declare-fun res!619492 () Bool)

(assert (=> b!918716 (=> (not res!619492) (not e!515686))))

(assert (=> b!918716 (= res!619492 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918717 () Bool)

(assert (=> b!918717 (= e!515689 tp_is_empty!19477)))

(declare-fun mapIsEmpty!30972 () Bool)

(assert (=> mapIsEmpty!30972 mapRes!30972))

(declare-fun res!619490 () Bool)

(assert (=> start!78738 (=> (not res!619490) (not e!515685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78738 (= res!619490 (validMask!0 mask!1881))))

(assert (=> start!78738 e!515685))

(assert (=> start!78738 true))

(assert (=> start!78738 tp_is_empty!19477))

(declare-fun array_inv!20666 (array!54921) Bool)

(assert (=> start!78738 (and (array_inv!20666 _values!1231) e!515690)))

(assert (=> start!78738 tp!59348))

(declare-fun array_inv!20667 (array!54919) Bool)

(assert (=> start!78738 (array_inv!20667 _keys!1487)))

(assert (= (and start!78738 res!619490) b!918712))

(assert (= (and b!918712 res!619496) b!918710))

(assert (= (and b!918710 res!619491) b!918708))

(assert (= (and b!918708 res!619498) b!918709))

(assert (= (and b!918709 res!619493) b!918711))

(assert (= (and b!918711 res!619497) b!918713))

(assert (= (and b!918713 res!619494) b!918716))

(assert (= (and b!918716 res!619492) b!918705))

(assert (= (and b!918705 res!619495) b!918714))

(assert (= (and b!918714 res!619499) b!918706))

(assert (= (and b!918715 condMapEmpty!30972) mapIsEmpty!30972))

(assert (= (and b!918715 (not condMapEmpty!30972)) mapNonEmpty!30972))

(get-info :version)

(assert (= (and mapNonEmpty!30972 ((_ is ValueCellFull!9257) mapValue!30972)) b!918707))

(assert (= (and b!918715 ((_ is ValueCellFull!9257) mapDefault!30972)) b!918717))

(assert (= start!78738 b!918715))

(declare-fun b_lambda!13453 () Bool)

(assert (=> (not b_lambda!13453) (not b!918706)))

(declare-fun t!26248 () Bool)

(declare-fun tb!5541 () Bool)

(assert (=> (and start!78738 (= defaultEntry!1235 defaultEntry!1235) t!26248) tb!5541))

(declare-fun result!10913 () Bool)

(assert (=> tb!5541 (= result!10913 tp_is_empty!19477)))

(assert (=> b!918706 t!26248))

(declare-fun b_and!27651 () Bool)

(assert (= b_and!27649 (and (=> t!26248 result!10913) b_and!27651)))

(declare-fun m!851893 () Bool)

(assert (=> b!918713 m!851893))

(declare-fun m!851895 () Bool)

(assert (=> b!918711 m!851895))

(declare-fun m!851897 () Bool)

(assert (=> b!918711 m!851897))

(declare-fun m!851899 () Bool)

(assert (=> b!918708 m!851899))

(declare-fun m!851901 () Bool)

(assert (=> mapNonEmpty!30972 m!851901))

(declare-fun m!851903 () Bool)

(assert (=> b!918706 m!851903))

(declare-fun m!851905 () Bool)

(assert (=> b!918706 m!851905))

(declare-fun m!851907 () Bool)

(assert (=> b!918706 m!851907))

(declare-fun m!851909 () Bool)

(assert (=> b!918706 m!851909))

(declare-fun m!851911 () Bool)

(assert (=> b!918706 m!851911))

(declare-fun m!851913 () Bool)

(assert (=> b!918706 m!851913))

(assert (=> b!918706 m!851907))

(assert (=> b!918706 m!851909))

(declare-fun m!851915 () Bool)

(assert (=> b!918706 m!851915))

(assert (=> b!918706 m!851903))

(declare-fun m!851917 () Bool)

(assert (=> b!918706 m!851917))

(assert (=> b!918706 m!851913))

(declare-fun m!851919 () Bool)

(assert (=> b!918706 m!851919))

(declare-fun m!851921 () Bool)

(assert (=> b!918706 m!851921))

(declare-fun m!851923 () Bool)

(assert (=> b!918710 m!851923))

(declare-fun m!851925 () Bool)

(assert (=> b!918714 m!851925))

(declare-fun m!851927 () Bool)

(assert (=> b!918714 m!851927))

(declare-fun m!851929 () Bool)

(assert (=> b!918705 m!851929))

(declare-fun m!851931 () Bool)

(assert (=> start!78738 m!851931))

(declare-fun m!851933 () Bool)

(assert (=> start!78738 m!851933))

(declare-fun m!851935 () Bool)

(assert (=> start!78738 m!851935))

(check-sat (not b!918713) (not mapNonEmpty!30972) (not b!918706) (not b!918705) tp_is_empty!19477 (not b_lambda!13453) (not b_next!16969) (not start!78738) (not b!918711) (not b!918708) b_and!27651 (not b!918714) (not b!918710))
(check-sat b_and!27651 (not b_next!16969))
