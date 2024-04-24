; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78852 () Bool)

(assert start!78852)

(declare-fun b_free!16897 () Bool)

(declare-fun b_next!16897 () Bool)

(assert (=> start!78852 (= b_free!16897 (not b_next!16897))))

(declare-fun tp!59132 () Bool)

(declare-fun b_and!27541 () Bool)

(assert (=> start!78852 (= tp!59132 b_and!27541)))

(declare-fun b!918371 () Bool)

(declare-fun e!515662 () Bool)

(declare-fun e!515661 () Bool)

(declare-fun mapRes!30864 () Bool)

(assert (=> b!918371 (= e!515662 (and e!515661 mapRes!30864))))

(declare-fun condMapEmpty!30864 () Bool)

(declare-datatypes ((V!30839 0))(
  ( (V!30840 (val!9753 Int)) )
))
(declare-datatypes ((ValueCell!9221 0))(
  ( (ValueCellFull!9221 (v!12268 V!30839)) (EmptyCell!9221) )
))
(declare-datatypes ((array!54843 0))(
  ( (array!54844 (arr!26362 (Array (_ BitVec 32) ValueCell!9221)) (size!26822 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54843)

(declare-fun mapDefault!30864 () ValueCell!9221)

(assert (=> b!918371 (= condMapEmpty!30864 (= (arr!26362 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9221)) mapDefault!30864)))))

(declare-fun b!918372 () Bool)

(declare-fun res!618864 () Bool)

(declare-fun e!515659 () Bool)

(assert (=> b!918372 (=> (not res!618864) (not e!515659))))

(declare-datatypes ((array!54845 0))(
  ( (array!54846 (arr!26363 (Array (_ BitVec 32) (_ BitVec 64))) (size!26823 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54845)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54845 (_ BitVec 32)) Bool)

(assert (=> b!918372 (= res!618864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918373 () Bool)

(declare-fun res!618867 () Bool)

(assert (=> b!918373 (=> (not res!618867) (not e!515659))))

(declare-datatypes ((List!18452 0))(
  ( (Nil!18449) (Cons!18448 (h!19600 (_ BitVec 64)) (t!26071 List!18452)) )
))
(declare-fun arrayNoDuplicates!0 (array!54845 (_ BitVec 32) List!18452) Bool)

(assert (=> b!918373 (= res!618867 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18449))))

(declare-fun b!918374 () Bool)

(declare-fun res!618868 () Bool)

(declare-fun e!515660 () Bool)

(assert (=> b!918374 (=> (not res!618868) (not e!515660))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30839)

(declare-datatypes ((tuple2!12630 0))(
  ( (tuple2!12631 (_1!6326 (_ BitVec 64)) (_2!6326 V!30839)) )
))
(declare-datatypes ((List!18453 0))(
  ( (Nil!18450) (Cons!18449 (h!19601 tuple2!12630) (t!26072 List!18453)) )
))
(declare-datatypes ((ListLongMap!11329 0))(
  ( (ListLongMap!11330 (toList!5680 List!18453)) )
))
(declare-fun lt!412380 () ListLongMap!11329)

(declare-fun apply!560 (ListLongMap!11329 (_ BitVec 64)) V!30839)

(assert (=> b!918374 (= res!618868 (= (apply!560 lt!412380 k0!1099) v!791))))

(declare-fun b!918375 () Bool)

(declare-fun e!515664 () Bool)

(assert (=> b!918375 (= e!515660 e!515664)))

(declare-fun res!618870 () Bool)

(assert (=> b!918375 (=> (not res!618870) (not e!515664))))

(declare-fun lt!412381 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918375 (= res!618870 (validKeyInArray!0 lt!412381))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918375 (= lt!412381 (select (arr!26363 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918376 () Bool)

(assert (=> b!918376 (= e!515664 (not true))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30839)

(declare-fun minValue!1173 () V!30839)

(declare-fun getCurrentListMap!2935 (array!54845 array!54843 (_ BitVec 32) (_ BitVec 32) V!30839 V!30839 (_ BitVec 32) Int) ListLongMap!11329)

(declare-fun +!2625 (ListLongMap!11329 tuple2!12630) ListLongMap!11329)

(declare-fun get!13826 (ValueCell!9221 V!30839) V!30839)

(declare-fun dynLambda!1422 (Int (_ BitVec 64)) V!30839)

(assert (=> b!918376 (= (getCurrentListMap!2935 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2625 (getCurrentListMap!2935 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12631 lt!412381 (get!13826 (select (arr!26362 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1422 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30962 0))(
  ( (Unit!30963) )
))
(declare-fun lt!412382 () Unit!30962)

(declare-fun lemmaListMapRecursiveValidKeyArray!5 (array!54845 array!54843 (_ BitVec 32) (_ BitVec 32) V!30839 V!30839 (_ BitVec 32) Int) Unit!30962)

(assert (=> b!918376 (= lt!412382 (lemmaListMapRecursiveValidKeyArray!5 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918377 () Bool)

(declare-fun tp_is_empty!19405 () Bool)

(assert (=> b!918377 (= e!515661 tp_is_empty!19405)))

(declare-fun res!618865 () Bool)

(assert (=> start!78852 (=> (not res!618865) (not e!515659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78852 (= res!618865 (validMask!0 mask!1881))))

(assert (=> start!78852 e!515659))

(assert (=> start!78852 true))

(assert (=> start!78852 tp_is_empty!19405))

(declare-fun array_inv!20656 (array!54843) Bool)

(assert (=> start!78852 (and (array_inv!20656 _values!1231) e!515662)))

(assert (=> start!78852 tp!59132))

(declare-fun array_inv!20657 (array!54845) Bool)

(assert (=> start!78852 (array_inv!20657 _keys!1487)))

(declare-fun b!918378 () Bool)

(declare-fun res!618872 () Bool)

(assert (=> b!918378 (=> (not res!618872) (not e!515659))))

(assert (=> b!918378 (= res!618872 (and (= (size!26822 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26823 _keys!1487) (size!26822 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918379 () Bool)

(declare-fun res!618871 () Bool)

(assert (=> b!918379 (=> (not res!618871) (not e!515659))))

(assert (=> b!918379 (= res!618871 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26823 _keys!1487))))))

(declare-fun b!918380 () Bool)

(assert (=> b!918380 (= e!515659 e!515660)))

(declare-fun res!618873 () Bool)

(assert (=> b!918380 (=> (not res!618873) (not e!515660))))

(declare-fun contains!4738 (ListLongMap!11329 (_ BitVec 64)) Bool)

(assert (=> b!918380 (= res!618873 (contains!4738 lt!412380 k0!1099))))

(assert (=> b!918380 (= lt!412380 (getCurrentListMap!2935 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30864 () Bool)

(declare-fun tp!59133 () Bool)

(declare-fun e!515665 () Bool)

(assert (=> mapNonEmpty!30864 (= mapRes!30864 (and tp!59133 e!515665))))

(declare-fun mapValue!30864 () ValueCell!9221)

(declare-fun mapRest!30864 () (Array (_ BitVec 32) ValueCell!9221))

(declare-fun mapKey!30864 () (_ BitVec 32))

(assert (=> mapNonEmpty!30864 (= (arr!26362 _values!1231) (store mapRest!30864 mapKey!30864 mapValue!30864))))

(declare-fun b!918381 () Bool)

(assert (=> b!918381 (= e!515665 tp_is_empty!19405)))

(declare-fun b!918382 () Bool)

(declare-fun res!618869 () Bool)

(assert (=> b!918382 (=> (not res!618869) (not e!515660))))

(assert (=> b!918382 (= res!618869 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918383 () Bool)

(declare-fun res!618866 () Bool)

(assert (=> b!918383 (=> (not res!618866) (not e!515660))))

(assert (=> b!918383 (= res!618866 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!30864 () Bool)

(assert (=> mapIsEmpty!30864 mapRes!30864))

(assert (= (and start!78852 res!618865) b!918378))

(assert (= (and b!918378 res!618872) b!918372))

(assert (= (and b!918372 res!618864) b!918373))

(assert (= (and b!918373 res!618867) b!918379))

(assert (= (and b!918379 res!618871) b!918380))

(assert (= (and b!918380 res!618873) b!918374))

(assert (= (and b!918374 res!618868) b!918382))

(assert (= (and b!918382 res!618869) b!918383))

(assert (= (and b!918383 res!618866) b!918375))

(assert (= (and b!918375 res!618870) b!918376))

(assert (= (and b!918371 condMapEmpty!30864) mapIsEmpty!30864))

(assert (= (and b!918371 (not condMapEmpty!30864)) mapNonEmpty!30864))

(get-info :version)

(assert (= (and mapNonEmpty!30864 ((_ is ValueCellFull!9221) mapValue!30864)) b!918381))

(assert (= (and b!918371 ((_ is ValueCellFull!9221) mapDefault!30864)) b!918377))

(assert (= start!78852 b!918371))

(declare-fun b_lambda!13413 () Bool)

(assert (=> (not b_lambda!13413) (not b!918376)))

(declare-fun t!26070 () Bool)

(declare-fun tb!5469 () Bool)

(assert (=> (and start!78852 (= defaultEntry!1235 defaultEntry!1235) t!26070) tb!5469))

(declare-fun result!10769 () Bool)

(assert (=> tb!5469 (= result!10769 tp_is_empty!19405)))

(assert (=> b!918376 t!26070))

(declare-fun b_and!27543 () Bool)

(assert (= b_and!27541 (and (=> t!26070 result!10769) b_and!27543)))

(declare-fun m!852505 () Bool)

(assert (=> mapNonEmpty!30864 m!852505))

(declare-fun m!852507 () Bool)

(assert (=> b!918383 m!852507))

(declare-fun m!852509 () Bool)

(assert (=> b!918375 m!852509))

(declare-fun m!852511 () Bool)

(assert (=> b!918375 m!852511))

(declare-fun m!852513 () Bool)

(assert (=> b!918380 m!852513))

(declare-fun m!852515 () Bool)

(assert (=> b!918380 m!852515))

(declare-fun m!852517 () Bool)

(assert (=> b!918376 m!852517))

(declare-fun m!852519 () Bool)

(assert (=> b!918376 m!852519))

(declare-fun m!852521 () Bool)

(assert (=> b!918376 m!852521))

(declare-fun m!852523 () Bool)

(assert (=> b!918376 m!852523))

(assert (=> b!918376 m!852517))

(assert (=> b!918376 m!852519))

(declare-fun m!852525 () Bool)

(assert (=> b!918376 m!852525))

(declare-fun m!852527 () Bool)

(assert (=> b!918376 m!852527))

(assert (=> b!918376 m!852521))

(declare-fun m!852529 () Bool)

(assert (=> b!918376 m!852529))

(declare-fun m!852531 () Bool)

(assert (=> b!918373 m!852531))

(declare-fun m!852533 () Bool)

(assert (=> start!78852 m!852533))

(declare-fun m!852535 () Bool)

(assert (=> start!78852 m!852535))

(declare-fun m!852537 () Bool)

(assert (=> start!78852 m!852537))

(declare-fun m!852539 () Bool)

(assert (=> b!918372 m!852539))

(declare-fun m!852541 () Bool)

(assert (=> b!918374 m!852541))

(check-sat (not b!918380) (not b!918374) (not mapNonEmpty!30864) tp_is_empty!19405 (not start!78852) (not b!918375) (not b!918383) (not b!918376) (not b!918373) (not b!918372) b_and!27543 (not b_next!16897) (not b_lambda!13413))
(check-sat b_and!27543 (not b_next!16897))
