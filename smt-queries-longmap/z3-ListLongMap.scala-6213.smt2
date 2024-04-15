; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79394 () Bool)

(assert start!79394)

(declare-fun b_free!17599 () Bool)

(declare-fun b_next!17599 () Bool)

(assert (=> start!79394 (= b_free!17599 (not b_next!17599))))

(declare-fun tp!61242 () Bool)

(declare-fun b_and!28731 () Bool)

(assert (=> start!79394 (= tp!61242 b_and!28731)))

(declare-fun b!933026 () Bool)

(declare-fun e!523906 () Bool)

(assert (=> b!933026 (= e!523906 (not true))))

(declare-datatypes ((array!56117 0))(
  ( (array!56118 (arr!27003 (Array (_ BitVec 32) (_ BitVec 64))) (size!27464 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56117)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!19050 0))(
  ( (Nil!19047) (Cons!19046 (h!20192 (_ BitVec 64)) (t!27184 List!19050)) )
))
(declare-fun arrayNoDuplicates!0 (array!56117 (_ BitVec 32) List!19050) Bool)

(assert (=> b!933026 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19047)))

(declare-datatypes ((Unit!31402 0))(
  ( (Unit!31403) )
))
(declare-fun lt!420078 () Unit!31402)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56117 (_ BitVec 32) (_ BitVec 32)) Unit!31402)

(assert (=> b!933026 (= lt!420078 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31775 0))(
  ( (V!31776 (val!10104 Int)) )
))
(declare-datatypes ((tuple2!13300 0))(
  ( (tuple2!13301 (_1!6661 (_ BitVec 64)) (_2!6661 V!31775)) )
))
(declare-datatypes ((List!19051 0))(
  ( (Nil!19048) (Cons!19047 (h!20193 tuple2!13300) (t!27185 List!19051)) )
))
(declare-datatypes ((ListLongMap!11987 0))(
  ( (ListLongMap!11988 (toList!6009 List!19051)) )
))
(declare-fun lt!420079 () ListLongMap!11987)

(declare-fun lt!420075 () tuple2!13300)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5006 (ListLongMap!11987 (_ BitVec 64)) Bool)

(declare-fun +!2816 (ListLongMap!11987 tuple2!13300) ListLongMap!11987)

(assert (=> b!933026 (contains!5006 (+!2816 lt!420079 lt!420075) k0!1099)))

(declare-fun lt!420076 () Unit!31402)

(declare-fun lt!420080 () V!31775)

(declare-fun lt!420081 () (_ BitVec 64))

(declare-fun addStillContains!505 (ListLongMap!11987 (_ BitVec 64) V!31775 (_ BitVec 64)) Unit!31402)

(assert (=> b!933026 (= lt!420076 (addStillContains!505 lt!420079 lt!420081 lt!420080 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9572 0))(
  ( (ValueCellFull!9572 (v!12622 V!31775)) (EmptyCell!9572) )
))
(declare-datatypes ((array!56119 0))(
  ( (array!56120 (arr!27004 (Array (_ BitVec 32) ValueCell!9572)) (size!27465 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56119)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31775)

(declare-fun minValue!1173 () V!31775)

(declare-fun getCurrentListMap!3181 (array!56117 array!56119 (_ BitVec 32) (_ BitVec 32) V!31775 V!31775 (_ BitVec 32) Int) ListLongMap!11987)

(assert (=> b!933026 (= (getCurrentListMap!3181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2816 (getCurrentListMap!3181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420075))))

(assert (=> b!933026 (= lt!420075 (tuple2!13301 lt!420081 lt!420080))))

(declare-fun get!14214 (ValueCell!9572 V!31775) V!31775)

(declare-fun dynLambda!1572 (Int (_ BitVec 64)) V!31775)

(assert (=> b!933026 (= lt!420080 (get!14214 (select (arr!27004 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1572 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420077 () Unit!31402)

(declare-fun lemmaListMapRecursiveValidKeyArray!180 (array!56117 array!56119 (_ BitVec 32) (_ BitVec 32) V!31775 V!31775 (_ BitVec 32) Int) Unit!31402)

(assert (=> b!933026 (= lt!420077 (lemmaListMapRecursiveValidKeyArray!180 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!628480 () Bool)

(declare-fun e!523909 () Bool)

(assert (=> start!79394 (=> (not res!628480) (not e!523909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79394 (= res!628480 (validMask!0 mask!1881))))

(assert (=> start!79394 e!523909))

(assert (=> start!79394 true))

(declare-fun tp_is_empty!20107 () Bool)

(assert (=> start!79394 tp_is_empty!20107))

(declare-fun e!523908 () Bool)

(declare-fun array_inv!21086 (array!56119) Bool)

(assert (=> start!79394 (and (array_inv!21086 _values!1231) e!523908)))

(assert (=> start!79394 tp!61242))

(declare-fun array_inv!21087 (array!56117) Bool)

(assert (=> start!79394 (array_inv!21087 _keys!1487)))

(declare-fun mapIsEmpty!31920 () Bool)

(declare-fun mapRes!31920 () Bool)

(assert (=> mapIsEmpty!31920 mapRes!31920))

(declare-fun b!933027 () Bool)

(declare-fun e!523904 () Bool)

(assert (=> b!933027 (= e!523904 e!523906)))

(declare-fun res!628476 () Bool)

(assert (=> b!933027 (=> (not res!628476) (not e!523906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933027 (= res!628476 (validKeyInArray!0 lt!420081))))

(assert (=> b!933027 (= lt!420081 (select (arr!27003 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933028 () Bool)

(declare-fun res!628482 () Bool)

(assert (=> b!933028 (=> (not res!628482) (not e!523909))))

(assert (=> b!933028 (= res!628482 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27464 _keys!1487))))))

(declare-fun b!933029 () Bool)

(declare-fun e!523910 () Bool)

(assert (=> b!933029 (= e!523910 tp_is_empty!20107)))

(declare-fun mapNonEmpty!31920 () Bool)

(declare-fun tp!61241 () Bool)

(assert (=> mapNonEmpty!31920 (= mapRes!31920 (and tp!61241 e!523910))))

(declare-fun mapKey!31920 () (_ BitVec 32))

(declare-fun mapRest!31920 () (Array (_ BitVec 32) ValueCell!9572))

(declare-fun mapValue!31920 () ValueCell!9572)

(assert (=> mapNonEmpty!31920 (= (arr!27004 _values!1231) (store mapRest!31920 mapKey!31920 mapValue!31920))))

(declare-fun b!933030 () Bool)

(declare-fun e!523907 () Bool)

(assert (=> b!933030 (= e!523908 (and e!523907 mapRes!31920))))

(declare-fun condMapEmpty!31920 () Bool)

(declare-fun mapDefault!31920 () ValueCell!9572)

(assert (=> b!933030 (= condMapEmpty!31920 (= (arr!27004 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9572)) mapDefault!31920)))))

(declare-fun b!933031 () Bool)

(assert (=> b!933031 (= e!523909 e!523904)))

(declare-fun res!628479 () Bool)

(assert (=> b!933031 (=> (not res!628479) (not e!523904))))

(assert (=> b!933031 (= res!628479 (contains!5006 lt!420079 k0!1099))))

(assert (=> b!933031 (= lt!420079 (getCurrentListMap!3181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933032 () Bool)

(declare-fun res!628481 () Bool)

(assert (=> b!933032 (=> (not res!628481) (not e!523904))))

(assert (=> b!933032 (= res!628481 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933033 () Bool)

(declare-fun res!628477 () Bool)

(assert (=> b!933033 (=> (not res!628477) (not e!523904))))

(assert (=> b!933033 (= res!628477 (validKeyInArray!0 k0!1099))))

(declare-fun b!933034 () Bool)

(declare-fun res!628478 () Bool)

(assert (=> b!933034 (=> (not res!628478) (not e!523904))))

(declare-fun v!791 () V!31775)

(declare-fun apply!798 (ListLongMap!11987 (_ BitVec 64)) V!31775)

(assert (=> b!933034 (= res!628478 (= (apply!798 lt!420079 k0!1099) v!791))))

(declare-fun b!933035 () Bool)

(declare-fun res!628483 () Bool)

(assert (=> b!933035 (=> (not res!628483) (not e!523909))))

(assert (=> b!933035 (= res!628483 (and (= (size!27465 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27464 _keys!1487) (size!27465 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933036 () Bool)

(assert (=> b!933036 (= e!523907 tp_is_empty!20107)))

(declare-fun b!933037 () Bool)

(declare-fun res!628484 () Bool)

(assert (=> b!933037 (=> (not res!628484) (not e!523909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56117 (_ BitVec 32)) Bool)

(assert (=> b!933037 (= res!628484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933038 () Bool)

(declare-fun res!628475 () Bool)

(assert (=> b!933038 (=> (not res!628475) (not e!523909))))

(assert (=> b!933038 (= res!628475 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19047))))

(assert (= (and start!79394 res!628480) b!933035))

(assert (= (and b!933035 res!628483) b!933037))

(assert (= (and b!933037 res!628484) b!933038))

(assert (= (and b!933038 res!628475) b!933028))

(assert (= (and b!933028 res!628482) b!933031))

(assert (= (and b!933031 res!628479) b!933034))

(assert (= (and b!933034 res!628478) b!933032))

(assert (= (and b!933032 res!628481) b!933033))

(assert (= (and b!933033 res!628477) b!933027))

(assert (= (and b!933027 res!628476) b!933026))

(assert (= (and b!933030 condMapEmpty!31920) mapIsEmpty!31920))

(assert (= (and b!933030 (not condMapEmpty!31920)) mapNonEmpty!31920))

(get-info :version)

(assert (= (and mapNonEmpty!31920 ((_ is ValueCellFull!9572) mapValue!31920)) b!933029))

(assert (= (and b!933030 ((_ is ValueCellFull!9572) mapDefault!31920)) b!933036))

(assert (= start!79394 b!933030))

(declare-fun b_lambda!13915 () Bool)

(assert (=> (not b_lambda!13915) (not b!933026)))

(declare-fun t!27183 () Bool)

(declare-fun tb!5985 () Bool)

(assert (=> (and start!79394 (= defaultEntry!1235 defaultEntry!1235) t!27183) tb!5985))

(declare-fun result!11803 () Bool)

(assert (=> tb!5985 (= result!11803 tp_is_empty!20107)))

(assert (=> b!933026 t!27183))

(declare-fun b_and!28733 () Bool)

(assert (= b_and!28731 (and (=> t!27183 result!11803) b_and!28733)))

(declare-fun m!866609 () Bool)

(assert (=> b!933027 m!866609))

(declare-fun m!866611 () Bool)

(assert (=> b!933027 m!866611))

(declare-fun m!866613 () Bool)

(assert (=> start!79394 m!866613))

(declare-fun m!866615 () Bool)

(assert (=> start!79394 m!866615))

(declare-fun m!866617 () Bool)

(assert (=> start!79394 m!866617))

(declare-fun m!866619 () Bool)

(assert (=> b!933037 m!866619))

(declare-fun m!866621 () Bool)

(assert (=> b!933033 m!866621))

(declare-fun m!866623 () Bool)

(assert (=> b!933034 m!866623))

(declare-fun m!866625 () Bool)

(assert (=> b!933031 m!866625))

(declare-fun m!866627 () Bool)

(assert (=> b!933031 m!866627))

(declare-fun m!866629 () Bool)

(assert (=> b!933026 m!866629))

(declare-fun m!866631 () Bool)

(assert (=> b!933026 m!866631))

(declare-fun m!866633 () Bool)

(assert (=> b!933026 m!866633))

(declare-fun m!866635 () Bool)

(assert (=> b!933026 m!866635))

(assert (=> b!933026 m!866633))

(assert (=> b!933026 m!866635))

(declare-fun m!866637 () Bool)

(assert (=> b!933026 m!866637))

(declare-fun m!866639 () Bool)

(assert (=> b!933026 m!866639))

(declare-fun m!866641 () Bool)

(assert (=> b!933026 m!866641))

(declare-fun m!866643 () Bool)

(assert (=> b!933026 m!866643))

(declare-fun m!866645 () Bool)

(assert (=> b!933026 m!866645))

(declare-fun m!866647 () Bool)

(assert (=> b!933026 m!866647))

(assert (=> b!933026 m!866641))

(declare-fun m!866649 () Bool)

(assert (=> b!933026 m!866649))

(declare-fun m!866651 () Bool)

(assert (=> b!933026 m!866651))

(assert (=> b!933026 m!866629))

(declare-fun m!866653 () Bool)

(assert (=> b!933038 m!866653))

(declare-fun m!866655 () Bool)

(assert (=> mapNonEmpty!31920 m!866655))

(check-sat tp_is_empty!20107 (not b!933034) (not b!933033) (not b!933026) (not start!79394) (not mapNonEmpty!31920) (not b!933031) (not b_lambda!13915) (not b_next!17599) b_and!28733 (not b!933037) (not b!933027) (not b!933038))
(check-sat b_and!28733 (not b_next!17599))
