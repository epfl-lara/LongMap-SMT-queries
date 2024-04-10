; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78736 () Bool)

(assert start!78736)

(declare-fun b_free!16949 () Bool)

(declare-fun b_next!16949 () Bool)

(assert (=> start!78736 (= b_free!16949 (not b_next!16949))))

(declare-fun tp!59288 () Bool)

(declare-fun b_and!27635 () Bool)

(assert (=> start!78736 (= tp!59288 b_and!27635)))

(declare-fun b!918534 () Bool)

(declare-fun res!619302 () Bool)

(declare-fun e!515627 () Bool)

(assert (=> b!918534 (=> (not res!619302) (not e!515627))))

(declare-datatypes ((array!54898 0))(
  ( (array!54899 (arr!26394 (Array (_ BitVec 32) (_ BitVec 64))) (size!26853 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54898)

(declare-datatypes ((List!18512 0))(
  ( (Nil!18509) (Cons!18508 (h!19654 (_ BitVec 64)) (t!26191 List!18512)) )
))
(declare-fun arrayNoDuplicates!0 (array!54898 (_ BitVec 32) List!18512) Bool)

(assert (=> b!918534 (= res!619302 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18509))))

(declare-fun b!918535 () Bool)

(declare-fun e!515628 () Bool)

(declare-fun tp_is_empty!19457 () Bool)

(assert (=> b!918535 (= e!515628 tp_is_empty!19457)))

(declare-fun b!918537 () Bool)

(declare-fun res!619300 () Bool)

(assert (=> b!918537 (=> (not res!619300) (not e!515627))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918537 (= res!619300 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26853 _keys!1487))))))

(declare-fun b!918538 () Bool)

(declare-fun e!515624 () Bool)

(assert (=> b!918538 (= e!515624 (not true))))

(declare-datatypes ((V!30907 0))(
  ( (V!30908 (val!9779 Int)) )
))
(declare-datatypes ((tuple2!12706 0))(
  ( (tuple2!12707 (_1!6364 (_ BitVec 64)) (_2!6364 V!30907)) )
))
(declare-datatypes ((List!18513 0))(
  ( (Nil!18510) (Cons!18509 (h!19655 tuple2!12706) (t!26192 List!18513)) )
))
(declare-datatypes ((ListLongMap!11403 0))(
  ( (ListLongMap!11404 (toList!5717 List!18513)) )
))
(declare-fun lt!412279 () ListLongMap!11403)

(declare-fun lt!412280 () tuple2!12706)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4763 (ListLongMap!11403 (_ BitVec 64)) Bool)

(declare-fun +!2629 (ListLongMap!11403 tuple2!12706) ListLongMap!11403)

(assert (=> b!918538 (contains!4763 (+!2629 lt!412279 lt!412280) k!1099)))

(declare-fun lt!412282 () (_ BitVec 64))

(declare-fun lt!412281 () V!30907)

(declare-datatypes ((Unit!31006 0))(
  ( (Unit!31007) )
))
(declare-fun lt!412277 () Unit!31006)

(declare-fun addStillContains!353 (ListLongMap!11403 (_ BitVec 64) V!30907 (_ BitVec 64)) Unit!31006)

(assert (=> b!918538 (= lt!412277 (addStillContains!353 lt!412279 lt!412282 lt!412281 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9247 0))(
  ( (ValueCellFull!9247 (v!12297 V!30907)) (EmptyCell!9247) )
))
(declare-datatypes ((array!54900 0))(
  ( (array!54901 (arr!26395 (Array (_ BitVec 32) ValueCell!9247)) (size!26854 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54900)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30907)

(declare-fun minValue!1173 () V!30907)

(declare-fun getCurrentListMap!2973 (array!54898 array!54900 (_ BitVec 32) (_ BitVec 32) V!30907 V!30907 (_ BitVec 32) Int) ListLongMap!11403)

(assert (=> b!918538 (= (getCurrentListMap!2973 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2629 (getCurrentListMap!2973 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412280))))

(assert (=> b!918538 (= lt!412280 (tuple2!12707 lt!412282 lt!412281))))

(declare-fun get!13834 (ValueCell!9247 V!30907) V!30907)

(declare-fun dynLambda!1418 (Int (_ BitVec 64)) V!30907)

(assert (=> b!918538 (= lt!412281 (get!13834 (select (arr!26395 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1418 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412278 () Unit!31006)

(declare-fun lemmaListMapRecursiveValidKeyArray!19 (array!54898 array!54900 (_ BitVec 32) (_ BitVec 32) V!30907 V!30907 (_ BitVec 32) Int) Unit!31006)

(assert (=> b!918538 (= lt!412278 (lemmaListMapRecursiveValidKeyArray!19 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918539 () Bool)

(declare-fun e!515625 () Bool)

(assert (=> b!918539 (= e!515625 tp_is_empty!19457)))

(declare-fun b!918540 () Bool)

(declare-fun res!619306 () Bool)

(declare-fun e!515623 () Bool)

(assert (=> b!918540 (=> (not res!619306) (not e!515623))))

(assert (=> b!918540 (= res!619306 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918541 () Bool)

(declare-fun res!619304 () Bool)

(assert (=> b!918541 (=> (not res!619304) (not e!515627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54898 (_ BitVec 32)) Bool)

(assert (=> b!918541 (= res!619304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30942 () Bool)

(declare-fun mapRes!30942 () Bool)

(assert (=> mapIsEmpty!30942 mapRes!30942))

(declare-fun b!918542 () Bool)

(declare-fun res!619303 () Bool)

(assert (=> b!918542 (=> (not res!619303) (not e!515627))))

(assert (=> b!918542 (= res!619303 (and (= (size!26854 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26853 _keys!1487) (size!26854 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918543 () Bool)

(assert (=> b!918543 (= e!515623 e!515624)))

(declare-fun res!619309 () Bool)

(assert (=> b!918543 (=> (not res!619309) (not e!515624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918543 (= res!619309 (validKeyInArray!0 lt!412282))))

(assert (=> b!918543 (= lt!412282 (select (arr!26394 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918544 () Bool)

(declare-fun res!619308 () Bool)

(assert (=> b!918544 (=> (not res!619308) (not e!515623))))

(assert (=> b!918544 (= res!619308 (validKeyInArray!0 k!1099))))

(declare-fun b!918545 () Bool)

(declare-fun e!515626 () Bool)

(assert (=> b!918545 (= e!515626 (and e!515628 mapRes!30942))))

(declare-fun condMapEmpty!30942 () Bool)

(declare-fun mapDefault!30942 () ValueCell!9247)

