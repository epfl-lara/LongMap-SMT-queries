; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78970 () Bool)

(assert start!78970)

(declare-fun b_free!17183 () Bool)

(declare-fun b_next!17183 () Bool)

(assert (=> start!78970 (= b_free!17183 (not b_next!17183))))

(declare-fun tp!59989 () Bool)

(declare-fun b_and!28103 () Bool)

(assert (=> start!78970 (= tp!59989 b_and!28103)))

(declare-fun b!924181 () Bool)

(declare-datatypes ((Unit!31195 0))(
  ( (Unit!31196) )
))
(declare-fun e!518602 () Unit!31195)

(declare-fun Unit!31197 () Unit!31195)

(assert (=> b!924181 (= e!518602 Unit!31197)))

(declare-fun mapIsEmpty!31293 () Bool)

(declare-fun mapRes!31293 () Bool)

(assert (=> mapIsEmpty!31293 mapRes!31293))

(declare-fun res!623002 () Bool)

(declare-fun e!518597 () Bool)

(assert (=> start!78970 (=> (not res!623002) (not e!518597))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78970 (= res!623002 (validMask!0 mask!1881))))

(assert (=> start!78970 e!518597))

(assert (=> start!78970 true))

(declare-fun tp_is_empty!19691 () Bool)

(assert (=> start!78970 tp_is_empty!19691))

(declare-datatypes ((V!31219 0))(
  ( (V!31220 (val!9896 Int)) )
))
(declare-datatypes ((ValueCell!9364 0))(
  ( (ValueCellFull!9364 (v!12414 V!31219)) (EmptyCell!9364) )
))
(declare-datatypes ((array!55354 0))(
  ( (array!55355 (arr!26622 (Array (_ BitVec 32) ValueCell!9364)) (size!27081 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55354)

(declare-fun e!518598 () Bool)

(declare-fun array_inv!20736 (array!55354) Bool)

(assert (=> start!78970 (and (array_inv!20736 _values!1231) e!518598)))

(assert (=> start!78970 tp!59989))

(declare-datatypes ((array!55356 0))(
  ( (array!55357 (arr!26623 (Array (_ BitVec 32) (_ BitVec 64))) (size!27082 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55356)

(declare-fun array_inv!20737 (array!55356) Bool)

(assert (=> start!78970 (array_inv!20737 _keys!1487)))

(declare-fun b!924182 () Bool)

(declare-fun res!623005 () Bool)

(assert (=> b!924182 (=> (not res!623005) (not e!518597))))

(declare-datatypes ((List!18693 0))(
  ( (Nil!18690) (Cons!18689 (h!19835 (_ BitVec 64)) (t!26606 List!18693)) )
))
(declare-fun arrayNoDuplicates!0 (array!55356 (_ BitVec 32) List!18693) Bool)

(assert (=> b!924182 (= res!623005 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18690))))

(declare-fun mapNonEmpty!31293 () Bool)

(declare-fun tp!59990 () Bool)

(declare-fun e!518605 () Bool)

(assert (=> mapNonEmpty!31293 (= mapRes!31293 (and tp!59990 e!518605))))

(declare-fun mapValue!31293 () ValueCell!9364)

(declare-fun mapRest!31293 () (Array (_ BitVec 32) ValueCell!9364))

(declare-fun mapKey!31293 () (_ BitVec 32))

(assert (=> mapNonEmpty!31293 (= (arr!26622 _values!1231) (store mapRest!31293 mapKey!31293 mapValue!31293))))

(declare-fun b!924183 () Bool)

(declare-fun e!518601 () Bool)

(assert (=> b!924183 (= e!518601 false)))

(declare-fun lt!415474 () V!31219)

(declare-datatypes ((tuple2!12890 0))(
  ( (tuple2!12891 (_1!6456 (_ BitVec 64)) (_2!6456 V!31219)) )
))
(declare-datatypes ((List!18694 0))(
  ( (Nil!18691) (Cons!18690 (h!19836 tuple2!12890) (t!26607 List!18694)) )
))
(declare-datatypes ((ListLongMap!11587 0))(
  ( (ListLongMap!11588 (toList!5809 List!18694)) )
))
(declare-fun lt!415465 () ListLongMap!11587)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!639 (ListLongMap!11587 (_ BitVec 64)) V!31219)

(assert (=> b!924183 (= lt!415474 (apply!639 lt!415465 k!1099))))

(declare-fun b!924184 () Bool)

(declare-fun e!518600 () Bool)

(declare-fun e!518608 () Bool)

(assert (=> b!924184 (= e!518600 e!518608)))

(declare-fun res!623007 () Bool)

(assert (=> b!924184 (=> (not res!623007) (not e!518608))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!924184 (= res!623007 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27082 _keys!1487)))))

(declare-fun lt!415464 () Unit!31195)

(declare-fun e!518604 () Unit!31195)

(assert (=> b!924184 (= lt!415464 e!518604)))

(declare-fun c!96384 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924184 (= c!96384 (validKeyInArray!0 k!1099))))

(declare-fun b!924185 () Bool)

(assert (=> b!924185 (= e!518608 e!518601)))

(declare-fun res!623000 () Bool)

(assert (=> b!924185 (=> (not res!623000) (not e!518601))))

(declare-fun contains!4870 (ListLongMap!11587 (_ BitVec 64)) Bool)

(assert (=> b!924185 (= res!623000 (contains!4870 lt!415465 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31219)

(declare-fun minValue!1173 () V!31219)

(declare-fun getCurrentListMap!3061 (array!55356 array!55354 (_ BitVec 32) (_ BitVec 32) V!31219 V!31219 (_ BitVec 32) Int) ListLongMap!11587)

(assert (=> b!924185 (= lt!415465 (getCurrentListMap!3061 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924186 () Bool)

(assert (=> b!924186 (= e!518604 e!518602)))

(declare-fun lt!415466 () (_ BitVec 64))

(assert (=> b!924186 (= lt!415466 (select (arr!26623 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96383 () Bool)

(assert (=> b!924186 (= c!96383 (validKeyInArray!0 lt!415466))))

(declare-fun b!924187 () Bool)

(declare-fun res!623004 () Bool)

(assert (=> b!924187 (=> (not res!623004) (not e!518597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55356 (_ BitVec 32)) Bool)

(assert (=> b!924187 (= res!623004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924188 () Bool)

(declare-fun e!518606 () Bool)

(assert (=> b!924188 (= e!518606 e!518600)))

(declare-fun res!623003 () Bool)

(assert (=> b!924188 (=> (not res!623003) (not e!518600))))

(declare-fun v!791 () V!31219)

(declare-fun lt!415476 () V!31219)

(assert (=> b!924188 (= res!623003 (and (= lt!415476 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415469 () ListLongMap!11587)

(assert (=> b!924188 (= lt!415476 (apply!639 lt!415469 k!1099))))

(declare-fun b!924189 () Bool)

(declare-fun e!518599 () Bool)

(assert (=> b!924189 (= e!518599 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924190 () Bool)

(declare-fun e!518607 () Bool)

(assert (=> b!924190 (= e!518607 tp_is_empty!19691)))

(declare-fun b!924191 () Bool)

(declare-fun res!623006 () Bool)

(assert (=> b!924191 (=> (not res!623006) (not e!518597))))

(assert (=> b!924191 (= res!623006 (and (= (size!27081 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27082 _keys!1487) (size!27081 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924192 () Bool)

(assert (=> b!924192 (= e!518598 (and e!518607 mapRes!31293))))

(declare-fun condMapEmpty!31293 () Bool)

(declare-fun mapDefault!31293 () ValueCell!9364)

