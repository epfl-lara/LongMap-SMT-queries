; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84162 () Bool)

(assert start!84162)

(declare-fun b_free!19863 () Bool)

(declare-fun b_next!19863 () Bool)

(assert (=> start!84162 (= b_free!19863 (not b_next!19863))))

(declare-fun tp!69193 () Bool)

(declare-fun b_and!31803 () Bool)

(assert (=> start!84162 (= tp!69193 b_and!31803)))

(declare-fun b!984142 () Bool)

(declare-fun res!658533 () Bool)

(declare-fun e!554810 () Bool)

(assert (=> b!984142 (=> (not res!658533) (not e!554810))))

(declare-datatypes ((V!35603 0))(
  ( (V!35604 (val!11533 Int)) )
))
(declare-datatypes ((ValueCell!11001 0))(
  ( (ValueCellFull!11001 (v!14095 V!35603)) (EmptyCell!11001) )
))
(declare-datatypes ((array!61911 0))(
  ( (array!61912 (arr!29813 (Array (_ BitVec 32) ValueCell!11001)) (size!30292 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61911)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61913 0))(
  ( (array!61914 (arr!29814 (Array (_ BitVec 32) (_ BitVec 64))) (size!30293 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61913)

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!984142 (= res!658533 (and (= (size!30292 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30293 _keys!1544) (size!30292 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984143 () Bool)

(declare-fun e!554813 () Bool)

(declare-fun tp_is_empty!22965 () Bool)

(assert (=> b!984143 (= e!554813 tp_is_empty!22965)))

(declare-fun res!658532 () Bool)

(assert (=> start!84162 (=> (not res!658532) (not e!554810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84162 (= res!658532 (validMask!0 mask!1948))))

(assert (=> start!84162 e!554810))

(assert (=> start!84162 true))

(assert (=> start!84162 tp_is_empty!22965))

(declare-fun e!554812 () Bool)

(declare-fun array_inv!23055 (array!61911) Bool)

(assert (=> start!84162 (and (array_inv!23055 _values!1278) e!554812)))

(assert (=> start!84162 tp!69193))

(declare-fun array_inv!23056 (array!61913) Bool)

(assert (=> start!84162 (array_inv!23056 _keys!1544)))

(declare-fun b!984144 () Bool)

(declare-fun res!658530 () Bool)

(assert (=> b!984144 (=> (not res!658530) (not e!554810))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984144 (= res!658530 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30293 _keys!1544))))))

(declare-fun b!984145 () Bool)

(declare-fun e!554811 () Bool)

(assert (=> b!984145 (= e!554811 tp_is_empty!22965)))

(declare-fun mapIsEmpty!36476 () Bool)

(declare-fun mapRes!36476 () Bool)

(assert (=> mapIsEmpty!36476 mapRes!36476))

(declare-fun b!984146 () Bool)

(declare-fun res!658531 () Bool)

(assert (=> b!984146 (=> (not res!658531) (not e!554810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984146 (= res!658531 (validKeyInArray!0 (select (arr!29814 _keys!1544) from!1932)))))

(declare-fun b!984147 () Bool)

(declare-fun e!554809 () Bool)

(assert (=> b!984147 (= e!554810 e!554809)))

(declare-fun res!658529 () Bool)

(assert (=> b!984147 (=> (not res!658529) (not e!554809))))

(assert (=> b!984147 (= res!658529 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29814 _keys!1544) from!1932))))))

(declare-fun lt!436690 () V!35603)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15461 (ValueCell!11001 V!35603) V!35603)

(declare-fun dynLambda!1812 (Int (_ BitVec 64)) V!35603)

(assert (=> b!984147 (= lt!436690 (get!15461 (select (arr!29813 _values!1278) from!1932) (dynLambda!1812 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35603)

(declare-datatypes ((tuple2!14748 0))(
  ( (tuple2!14749 (_1!7385 (_ BitVec 64)) (_2!7385 V!35603)) )
))
(declare-datatypes ((List!20640 0))(
  ( (Nil!20637) (Cons!20636 (h!21798 tuple2!14748) (t!29447 List!20640)) )
))
(declare-datatypes ((ListLongMap!13445 0))(
  ( (ListLongMap!13446 (toList!6738 List!20640)) )
))
(declare-fun lt!436691 () ListLongMap!13445)

(declare-fun minValue!1220 () V!35603)

(declare-fun getCurrentListMapNoExtraKeys!3432 (array!61913 array!61911 (_ BitVec 32) (_ BitVec 32) V!35603 V!35603 (_ BitVec 32) Int) ListLongMap!13445)

(assert (=> b!984147 (= lt!436691 (getCurrentListMapNoExtraKeys!3432 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984148 () Bool)

(assert (=> b!984148 (= e!554809 (not true))))

(declare-fun lt!436688 () tuple2!14748)

(declare-fun lt!436687 () tuple2!14748)

(declare-fun +!3031 (ListLongMap!13445 tuple2!14748) ListLongMap!13445)

(assert (=> b!984148 (= (+!3031 (+!3031 lt!436691 lt!436688) lt!436687) (+!3031 (+!3031 lt!436691 lt!436687) lt!436688))))

(assert (=> b!984148 (= lt!436687 (tuple2!14749 (select (arr!29814 _keys!1544) from!1932) lt!436690))))

(assert (=> b!984148 (= lt!436688 (tuple2!14749 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32701 0))(
  ( (Unit!32702) )
))
(declare-fun lt!436689 () Unit!32701)

(declare-fun addCommutativeForDiffKeys!659 (ListLongMap!13445 (_ BitVec 64) V!35603 (_ BitVec 64) V!35603) Unit!32701)

(assert (=> b!984148 (= lt!436689 (addCommutativeForDiffKeys!659 lt!436691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29814 _keys!1544) from!1932) lt!436690))))

(declare-fun b!984149 () Bool)

(declare-fun res!658534 () Bool)

(assert (=> b!984149 (=> (not res!658534) (not e!554810))))

(declare-datatypes ((List!20641 0))(
  ( (Nil!20638) (Cons!20637 (h!21799 (_ BitVec 64)) (t!29448 List!20641)) )
))
(declare-fun arrayNoDuplicates!0 (array!61913 (_ BitVec 32) List!20641) Bool)

(assert (=> b!984149 (= res!658534 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20638))))

(declare-fun mapNonEmpty!36476 () Bool)

(declare-fun tp!69192 () Bool)

(assert (=> mapNonEmpty!36476 (= mapRes!36476 (and tp!69192 e!554811))))

(declare-fun mapValue!36476 () ValueCell!11001)

(declare-fun mapKey!36476 () (_ BitVec 32))

(declare-fun mapRest!36476 () (Array (_ BitVec 32) ValueCell!11001))

(assert (=> mapNonEmpty!36476 (= (arr!29813 _values!1278) (store mapRest!36476 mapKey!36476 mapValue!36476))))

(declare-fun b!984150 () Bool)

(declare-fun res!658535 () Bool)

(assert (=> b!984150 (=> (not res!658535) (not e!554810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61913 (_ BitVec 32)) Bool)

(assert (=> b!984150 (= res!658535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984151 () Bool)

(declare-fun res!658528 () Bool)

(assert (=> b!984151 (=> (not res!658528) (not e!554810))))

(assert (=> b!984151 (= res!658528 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984152 () Bool)

(assert (=> b!984152 (= e!554812 (and e!554813 mapRes!36476))))

(declare-fun condMapEmpty!36476 () Bool)

(declare-fun mapDefault!36476 () ValueCell!11001)

(assert (=> b!984152 (= condMapEmpty!36476 (= (arr!29813 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11001)) mapDefault!36476)))))

(assert (= (and start!84162 res!658532) b!984142))

(assert (= (and b!984142 res!658533) b!984150))

(assert (= (and b!984150 res!658535) b!984149))

(assert (= (and b!984149 res!658534) b!984144))

(assert (= (and b!984144 res!658530) b!984146))

(assert (= (and b!984146 res!658531) b!984151))

(assert (= (and b!984151 res!658528) b!984147))

(assert (= (and b!984147 res!658529) b!984148))

(assert (= (and b!984152 condMapEmpty!36476) mapIsEmpty!36476))

(assert (= (and b!984152 (not condMapEmpty!36476)) mapNonEmpty!36476))

(get-info :version)

(assert (= (and mapNonEmpty!36476 ((_ is ValueCellFull!11001) mapValue!36476)) b!984145))

(assert (= (and b!984152 ((_ is ValueCellFull!11001) mapDefault!36476)) b!984143))

(assert (= start!84162 b!984152))

(declare-fun b_lambda!14895 () Bool)

(assert (=> (not b_lambda!14895) (not b!984147)))

(declare-fun t!29446 () Bool)

(declare-fun tb!6657 () Bool)

(assert (=> (and start!84162 (= defaultEntry!1281 defaultEntry!1281) t!29446) tb!6657))

(declare-fun result!13303 () Bool)

(assert (=> tb!6657 (= result!13303 tp_is_empty!22965)))

(assert (=> b!984147 t!29446))

(declare-fun b_and!31805 () Bool)

(assert (= b_and!31803 (and (=> t!29446 result!13303) b_and!31805)))

(declare-fun m!911237 () Bool)

(assert (=> b!984147 m!911237))

(declare-fun m!911239 () Bool)

(assert (=> b!984147 m!911239))

(declare-fun m!911241 () Bool)

(assert (=> b!984147 m!911241))

(declare-fun m!911243 () Bool)

(assert (=> b!984147 m!911243))

(assert (=> b!984147 m!911239))

(assert (=> b!984147 m!911243))

(declare-fun m!911245 () Bool)

(assert (=> b!984147 m!911245))

(declare-fun m!911247 () Bool)

(assert (=> start!84162 m!911247))

(declare-fun m!911249 () Bool)

(assert (=> start!84162 m!911249))

(declare-fun m!911251 () Bool)

(assert (=> start!84162 m!911251))

(declare-fun m!911253 () Bool)

(assert (=> mapNonEmpty!36476 m!911253))

(declare-fun m!911255 () Bool)

(assert (=> b!984150 m!911255))

(declare-fun m!911257 () Bool)

(assert (=> b!984149 m!911257))

(assert (=> b!984146 m!911237))

(assert (=> b!984146 m!911237))

(declare-fun m!911259 () Bool)

(assert (=> b!984146 m!911259))

(assert (=> b!984148 m!911237))

(assert (=> b!984148 m!911237))

(declare-fun m!911261 () Bool)

(assert (=> b!984148 m!911261))

(declare-fun m!911263 () Bool)

(assert (=> b!984148 m!911263))

(declare-fun m!911265 () Bool)

(assert (=> b!984148 m!911265))

(assert (=> b!984148 m!911263))

(declare-fun m!911267 () Bool)

(assert (=> b!984148 m!911267))

(assert (=> b!984148 m!911265))

(declare-fun m!911269 () Bool)

(assert (=> b!984148 m!911269))

(check-sat b_and!31805 (not mapNonEmpty!36476) (not b_lambda!14895) (not b!984149) (not start!84162) (not b!984147) tp_is_empty!22965 (not b!984150) (not b!984146) (not b!984148) (not b_next!19863))
(check-sat b_and!31805 (not b_next!19863))
