; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78728 () Bool)

(assert start!78728)

(declare-fun b_free!16941 () Bool)

(declare-fun b_next!16941 () Bool)

(assert (=> start!78728 (= b_free!16941 (not b_next!16941))))

(declare-fun tp!59264 () Bool)

(declare-fun b_and!27619 () Bool)

(assert (=> start!78728 (= tp!59264 b_and!27619)))

(declare-fun b!918370 () Bool)

(declare-fun res!619189 () Bool)

(declare-fun e!515541 () Bool)

(assert (=> b!918370 (=> (not res!619189) (not e!515541))))

(declare-datatypes ((array!54882 0))(
  ( (array!54883 (arr!26386 (Array (_ BitVec 32) (_ BitVec 64))) (size!26845 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54882)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54882 (_ BitVec 32)) Bool)

(assert (=> b!918370 (= res!619189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918371 () Bool)

(declare-fun e!515544 () Bool)

(declare-fun e!515539 () Bool)

(declare-fun mapRes!30930 () Bool)

(assert (=> b!918371 (= e!515544 (and e!515539 mapRes!30930))))

(declare-fun condMapEmpty!30930 () Bool)

(declare-datatypes ((V!30897 0))(
  ( (V!30898 (val!9775 Int)) )
))
(declare-datatypes ((ValueCell!9243 0))(
  ( (ValueCellFull!9243 (v!12293 V!30897)) (EmptyCell!9243) )
))
(declare-datatypes ((array!54884 0))(
  ( (array!54885 (arr!26387 (Array (_ BitVec 32) ValueCell!9243)) (size!26846 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54884)

(declare-fun mapDefault!30930 () ValueCell!9243)

(assert (=> b!918371 (= condMapEmpty!30930 (= (arr!26387 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9243)) mapDefault!30930)))))

(declare-fun b!918372 () Bool)

(declare-fun e!515542 () Bool)

(declare-fun e!515545 () Bool)

(assert (=> b!918372 (= e!515542 e!515545)))

(declare-fun res!619181 () Bool)

(assert (=> b!918372 (=> (not res!619181) (not e!515545))))

(declare-fun lt!412218 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918372 (= res!619181 (validKeyInArray!0 lt!412218))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918372 (= lt!412218 (select (arr!26386 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918373 () Bool)

(declare-fun res!619187 () Bool)

(assert (=> b!918373 (=> (not res!619187) (not e!515542))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30897)

(declare-datatypes ((tuple2!12702 0))(
  ( (tuple2!12703 (_1!6362 (_ BitVec 64)) (_2!6362 V!30897)) )
))
(declare-datatypes ((List!18508 0))(
  ( (Nil!18505) (Cons!18504 (h!19650 tuple2!12702) (t!26179 List!18508)) )
))
(declare-datatypes ((ListLongMap!11399 0))(
  ( (ListLongMap!11400 (toList!5715 List!18508)) )
))
(declare-fun lt!412217 () ListLongMap!11399)

(declare-fun apply!563 (ListLongMap!11399 (_ BitVec 64)) V!30897)

(assert (=> b!918373 (= res!619187 (= (apply!563 lt!412217 k0!1099) v!791))))

(declare-fun b!918374 () Bool)

(declare-fun e!515540 () Bool)

(declare-fun tp_is_empty!19449 () Bool)

(assert (=> b!918374 (= e!515540 tp_is_empty!19449)))

(declare-fun b!918375 () Bool)

(declare-fun res!619180 () Bool)

(assert (=> b!918375 (=> (not res!619180) (not e!515542))))

(assert (=> b!918375 (= res!619180 (validKeyInArray!0 k0!1099))))

(declare-fun b!918376 () Bool)

(assert (=> b!918376 (= e!515539 tp_is_empty!19449)))

(declare-fun mapNonEmpty!30930 () Bool)

(declare-fun tp!59263 () Bool)

(assert (=> mapNonEmpty!30930 (= mapRes!30930 (and tp!59263 e!515540))))

(declare-fun mapValue!30930 () ValueCell!9243)

(declare-fun mapRest!30930 () (Array (_ BitVec 32) ValueCell!9243))

(declare-fun mapKey!30930 () (_ BitVec 32))

(assert (=> mapNonEmpty!30930 (= (arr!26387 _values!1231) (store mapRest!30930 mapKey!30930 mapValue!30930))))

(declare-fun b!918377 () Bool)

(declare-fun res!619185 () Bool)

(assert (=> b!918377 (=> (not res!619185) (not e!515541))))

(declare-datatypes ((List!18509 0))(
  ( (Nil!18506) (Cons!18505 (h!19651 (_ BitVec 64)) (t!26180 List!18509)) )
))
(declare-fun arrayNoDuplicates!0 (array!54882 (_ BitVec 32) List!18509) Bool)

(assert (=> b!918377 (= res!619185 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18506))))

(declare-fun b!918378 () Bool)

(declare-fun res!619186 () Bool)

(assert (=> b!918378 (=> (not res!619186) (not e!515541))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!918378 (= res!619186 (and (= (size!26846 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26845 _keys!1487) (size!26846 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918379 () Bool)

(declare-fun res!619183 () Bool)

(assert (=> b!918379 (=> (not res!619183) (not e!515541))))

(assert (=> b!918379 (= res!619183 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26845 _keys!1487))))))

(declare-fun b!918380 () Bool)

(assert (=> b!918380 (= e!515545 (not true))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30897)

(declare-fun minValue!1173 () V!30897)

(declare-fun getCurrentListMap!2971 (array!54882 array!54884 (_ BitVec 32) (_ BitVec 32) V!30897 V!30897 (_ BitVec 32) Int) ListLongMap!11399)

(declare-fun +!2627 (ListLongMap!11399 tuple2!12702) ListLongMap!11399)

(declare-fun get!13830 (ValueCell!9243 V!30897) V!30897)

(declare-fun dynLambda!1416 (Int (_ BitVec 64)) V!30897)

(assert (=> b!918380 (= (getCurrentListMap!2971 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2627 (getCurrentListMap!2971 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12703 lt!412218 (get!13830 (select (arr!26387 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1416 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31002 0))(
  ( (Unit!31003) )
))
(declare-fun lt!412219 () Unit!31002)

(declare-fun lemmaListMapRecursiveValidKeyArray!17 (array!54882 array!54884 (_ BitVec 32) (_ BitVec 32) V!30897 V!30897 (_ BitVec 32) Int) Unit!31002)

(assert (=> b!918380 (= lt!412219 (lemmaListMapRecursiveValidKeyArray!17 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918381 () Bool)

(declare-fun res!619182 () Bool)

(assert (=> b!918381 (=> (not res!619182) (not e!515542))))

(assert (=> b!918381 (= res!619182 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918382 () Bool)

(assert (=> b!918382 (= e!515541 e!515542)))

(declare-fun res!619188 () Bool)

(assert (=> b!918382 (=> (not res!619188) (not e!515542))))

(declare-fun contains!4761 (ListLongMap!11399 (_ BitVec 64)) Bool)

(assert (=> b!918382 (= res!619188 (contains!4761 lt!412217 k0!1099))))

(assert (=> b!918382 (= lt!412217 (getCurrentListMap!2971 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!619184 () Bool)

(assert (=> start!78728 (=> (not res!619184) (not e!515541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78728 (= res!619184 (validMask!0 mask!1881))))

(assert (=> start!78728 e!515541))

(assert (=> start!78728 true))

(assert (=> start!78728 tp_is_empty!19449))

(declare-fun array_inv!20572 (array!54884) Bool)

(assert (=> start!78728 (and (array_inv!20572 _values!1231) e!515544)))

(assert (=> start!78728 tp!59264))

(declare-fun array_inv!20573 (array!54882) Bool)

(assert (=> start!78728 (array_inv!20573 _keys!1487)))

(declare-fun mapIsEmpty!30930 () Bool)

(assert (=> mapIsEmpty!30930 mapRes!30930))

(assert (= (and start!78728 res!619184) b!918378))

(assert (= (and b!918378 res!619186) b!918370))

(assert (= (and b!918370 res!619189) b!918377))

(assert (= (and b!918377 res!619185) b!918379))

(assert (= (and b!918379 res!619183) b!918382))

(assert (= (and b!918382 res!619188) b!918373))

(assert (= (and b!918373 res!619187) b!918381))

(assert (= (and b!918381 res!619182) b!918375))

(assert (= (and b!918375 res!619180) b!918372))

(assert (= (and b!918372 res!619181) b!918380))

(assert (= (and b!918371 condMapEmpty!30930) mapIsEmpty!30930))

(assert (= (and b!918371 (not condMapEmpty!30930)) mapNonEmpty!30930))

(get-info :version)

(assert (= (and mapNonEmpty!30930 ((_ is ValueCellFull!9243) mapValue!30930)) b!918374))

(assert (= (and b!918371 ((_ is ValueCellFull!9243) mapDefault!30930)) b!918376))

(assert (= start!78728 b!918371))

(declare-fun b_lambda!13443 () Bool)

(assert (=> (not b_lambda!13443) (not b!918380)))

(declare-fun t!26178 () Bool)

(declare-fun tb!5521 () Bool)

(assert (=> (and start!78728 (= defaultEntry!1235 defaultEntry!1235) t!26178) tb!5521))

(declare-fun result!10865 () Bool)

(assert (=> tb!5521 (= result!10865 tp_is_empty!19449)))

(assert (=> b!918380 t!26178))

(declare-fun b_and!27621 () Bool)

(assert (= b_and!27619 (and (=> t!26178 result!10865) b_and!27621)))

(declare-fun m!852047 () Bool)

(assert (=> mapNonEmpty!30930 m!852047))

(declare-fun m!852049 () Bool)

(assert (=> b!918370 m!852049))

(declare-fun m!852051 () Bool)

(assert (=> b!918372 m!852051))

(declare-fun m!852053 () Bool)

(assert (=> b!918372 m!852053))

(declare-fun m!852055 () Bool)

(assert (=> b!918382 m!852055))

(declare-fun m!852057 () Bool)

(assert (=> b!918382 m!852057))

(declare-fun m!852059 () Bool)

(assert (=> b!918375 m!852059))

(declare-fun m!852061 () Bool)

(assert (=> b!918380 m!852061))

(declare-fun m!852063 () Bool)

(assert (=> b!918380 m!852063))

(declare-fun m!852065 () Bool)

(assert (=> b!918380 m!852065))

(declare-fun m!852067 () Bool)

(assert (=> b!918380 m!852067))

(assert (=> b!918380 m!852061))

(assert (=> b!918380 m!852063))

(declare-fun m!852069 () Bool)

(assert (=> b!918380 m!852069))

(declare-fun m!852071 () Bool)

(assert (=> b!918380 m!852071))

(assert (=> b!918380 m!852065))

(declare-fun m!852073 () Bool)

(assert (=> b!918380 m!852073))

(declare-fun m!852075 () Bool)

(assert (=> start!78728 m!852075))

(declare-fun m!852077 () Bool)

(assert (=> start!78728 m!852077))

(declare-fun m!852079 () Bool)

(assert (=> start!78728 m!852079))

(declare-fun m!852081 () Bool)

(assert (=> b!918377 m!852081))

(declare-fun m!852083 () Bool)

(assert (=> b!918373 m!852083))

(check-sat (not b!918370) (not b!918373) tp_is_empty!19449 (not b!918380) (not b!918382) b_and!27621 (not b!918377) (not b!918375) (not mapNonEmpty!30930) (not start!78728) (not b!918372) (not b_lambda!13443) (not b_next!16941))
(check-sat b_and!27621 (not b_next!16941))
