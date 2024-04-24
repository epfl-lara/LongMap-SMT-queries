; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133976 () Bool)

(assert start!133976)

(declare-fun b_free!31981 () Bool)

(declare-fun b_next!31981 () Bool)

(assert (=> start!133976 (= b_free!31981 (not b_next!31981))))

(declare-fun tp!113067 () Bool)

(declare-fun b_and!51475 () Bool)

(assert (=> start!133976 (= tp!113067 b_and!51475)))

(declare-fun b!1563936 () Bool)

(declare-fun res!1068524 () Bool)

(declare-fun e!871689 () Bool)

(assert (=> b!1563936 (=> (not res!1068524) (not e!871689))))

(declare-datatypes ((array!104128 0))(
  ( (array!104129 (arr!50249 (Array (_ BitVec 32) (_ BitVec 64))) (size!50800 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104128)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563936 (= res!1068524 (validKeyInArray!0 (select (arr!50249 _keys!637) from!782)))))

(declare-fun b!1563937 () Bool)

(assert (=> b!1563937 (= e!871689 (not true))))

(declare-datatypes ((V!59737 0))(
  ( (V!59738 (val!19407 Int)) )
))
(declare-fun lt!672139 () V!59737)

(declare-datatypes ((tuple2!25128 0))(
  ( (tuple2!25129 (_1!12575 (_ BitVec 64)) (_2!12575 V!59737)) )
))
(declare-datatypes ((List!36468 0))(
  ( (Nil!36465) (Cons!36464 (h!37928 tuple2!25128) (t!51231 List!36468)) )
))
(declare-datatypes ((ListLongMap!22571 0))(
  ( (ListLongMap!22572 (toList!11301 List!36468)) )
))
(declare-fun lt!672140 () ListLongMap!22571)

(declare-fun contains!10302 (ListLongMap!22571 (_ BitVec 64)) Bool)

(declare-fun +!5077 (ListLongMap!22571 tuple2!25128) ListLongMap!22571)

(assert (=> b!1563937 (not (contains!10302 (+!5077 lt!672140 (tuple2!25129 (select (arr!50249 _keys!637) from!782) lt!672139)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51839 0))(
  ( (Unit!51840) )
))
(declare-fun lt!672138 () Unit!51839)

(declare-fun addStillNotContains!528 (ListLongMap!22571 (_ BitVec 64) V!59737 (_ BitVec 64)) Unit!51839)

(assert (=> b!1563937 (= lt!672138 (addStillNotContains!528 lt!672140 (select (arr!50249 _keys!637) from!782) lt!672139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18293 0))(
  ( (ValueCellFull!18293 (v!22151 V!59737)) (EmptyCell!18293) )
))
(declare-datatypes ((array!104130 0))(
  ( (array!104131 (arr!50250 (Array (_ BitVec 32) ValueCell!18293)) (size!50801 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104130)

(declare-fun get!26249 (ValueCell!18293 V!59737) V!59737)

(declare-fun dynLambda!3875 (Int (_ BitVec 64)) V!59737)

(assert (=> b!1563937 (= lt!672139 (get!26249 (select (arr!50250 _values!487) from!782) (dynLambda!3875 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59737)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59737)

(declare-fun getCurrentListMapNoExtraKeys!6700 (array!104128 array!104130 (_ BitVec 32) (_ BitVec 32) V!59737 V!59737 (_ BitVec 32) Int) ListLongMap!22571)

(assert (=> b!1563937 (= lt!672140 (getCurrentListMapNoExtraKeys!6700 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59346 () Bool)

(declare-fun mapRes!59346 () Bool)

(declare-fun tp!113066 () Bool)

(declare-fun e!871690 () Bool)

(assert (=> mapNonEmpty!59346 (= mapRes!59346 (and tp!113066 e!871690))))

(declare-fun mapKey!59346 () (_ BitVec 32))

(declare-fun mapValue!59346 () ValueCell!18293)

(declare-fun mapRest!59346 () (Array (_ BitVec 32) ValueCell!18293))

(assert (=> mapNonEmpty!59346 (= (arr!50250 _values!487) (store mapRest!59346 mapKey!59346 mapValue!59346))))

(declare-fun b!1563938 () Bool)

(declare-fun res!1068525 () Bool)

(assert (=> b!1563938 (=> (not res!1068525) (not e!871689))))

(assert (=> b!1563938 (= res!1068525 (and (= (size!50801 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50800 _keys!637) (size!50801 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068526 () Bool)

(assert (=> start!133976 (=> (not res!1068526) (not e!871689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133976 (= res!1068526 (validMask!0 mask!947))))

(assert (=> start!133976 e!871689))

(assert (=> start!133976 tp!113067))

(declare-fun tp_is_empty!38647 () Bool)

(assert (=> start!133976 tp_is_empty!38647))

(assert (=> start!133976 true))

(declare-fun array_inv!39303 (array!104128) Bool)

(assert (=> start!133976 (array_inv!39303 _keys!637)))

(declare-fun e!871691 () Bool)

(declare-fun array_inv!39304 (array!104130) Bool)

(assert (=> start!133976 (and (array_inv!39304 _values!487) e!871691)))

(declare-fun b!1563939 () Bool)

(declare-fun res!1068522 () Bool)

(assert (=> b!1563939 (=> (not res!1068522) (not e!871689))))

(declare-datatypes ((List!36469 0))(
  ( (Nil!36466) (Cons!36465 (h!37929 (_ BitVec 64)) (t!51232 List!36469)) )
))
(declare-fun arrayNoDuplicates!0 (array!104128 (_ BitVec 32) List!36469) Bool)

(assert (=> b!1563939 (= res!1068522 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36466))))

(declare-fun b!1563940 () Bool)

(declare-fun res!1068527 () Bool)

(assert (=> b!1563940 (=> (not res!1068527) (not e!871689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104128 (_ BitVec 32)) Bool)

(assert (=> b!1563940 (= res!1068527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59346 () Bool)

(assert (=> mapIsEmpty!59346 mapRes!59346))

(declare-fun b!1563941 () Bool)

(assert (=> b!1563941 (= e!871690 tp_is_empty!38647)))

(declare-fun b!1563942 () Bool)

(declare-fun e!871693 () Bool)

(assert (=> b!1563942 (= e!871693 tp_is_empty!38647)))

(declare-fun b!1563943 () Bool)

(declare-fun res!1068523 () Bool)

(assert (=> b!1563943 (=> (not res!1068523) (not e!871689))))

(assert (=> b!1563943 (= res!1068523 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50800 _keys!637)) (bvslt from!782 (size!50800 _keys!637))))))

(declare-fun b!1563944 () Bool)

(assert (=> b!1563944 (= e!871691 (and e!871693 mapRes!59346))))

(declare-fun condMapEmpty!59346 () Bool)

(declare-fun mapDefault!59346 () ValueCell!18293)

(assert (=> b!1563944 (= condMapEmpty!59346 (= (arr!50250 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18293)) mapDefault!59346)))))

(assert (= (and start!133976 res!1068526) b!1563938))

(assert (= (and b!1563938 res!1068525) b!1563940))

(assert (= (and b!1563940 res!1068527) b!1563939))

(assert (= (and b!1563939 res!1068522) b!1563943))

(assert (= (and b!1563943 res!1068523) b!1563936))

(assert (= (and b!1563936 res!1068524) b!1563937))

(assert (= (and b!1563944 condMapEmpty!59346) mapIsEmpty!59346))

(assert (= (and b!1563944 (not condMapEmpty!59346)) mapNonEmpty!59346))

(get-info :version)

(assert (= (and mapNonEmpty!59346 ((_ is ValueCellFull!18293) mapValue!59346)) b!1563941))

(assert (= (and b!1563944 ((_ is ValueCellFull!18293) mapDefault!59346)) b!1563942))

(assert (= start!133976 b!1563944))

(declare-fun b_lambda!24849 () Bool)

(assert (=> (not b_lambda!24849) (not b!1563937)))

(declare-fun t!51230 () Bool)

(declare-fun tb!12517 () Bool)

(assert (=> (and start!133976 (= defaultEntry!495 defaultEntry!495) t!51230) tb!12517))

(declare-fun result!26323 () Bool)

(assert (=> tb!12517 (= result!26323 tp_is_empty!38647)))

(assert (=> b!1563937 t!51230))

(declare-fun b_and!51477 () Bool)

(assert (= b_and!51475 (and (=> t!51230 result!26323) b_and!51477)))

(declare-fun m!1439439 () Bool)

(assert (=> b!1563937 m!1439439))

(declare-fun m!1439441 () Bool)

(assert (=> b!1563937 m!1439441))

(declare-fun m!1439443 () Bool)

(assert (=> b!1563937 m!1439443))

(declare-fun m!1439445 () Bool)

(assert (=> b!1563937 m!1439445))

(declare-fun m!1439447 () Bool)

(assert (=> b!1563937 m!1439447))

(assert (=> b!1563937 m!1439441))

(declare-fun m!1439449 () Bool)

(assert (=> b!1563937 m!1439449))

(declare-fun m!1439451 () Bool)

(assert (=> b!1563937 m!1439451))

(assert (=> b!1563937 m!1439443))

(assert (=> b!1563937 m!1439439))

(assert (=> b!1563937 m!1439447))

(declare-fun m!1439453 () Bool)

(assert (=> b!1563937 m!1439453))

(assert (=> b!1563936 m!1439441))

(assert (=> b!1563936 m!1439441))

(declare-fun m!1439455 () Bool)

(assert (=> b!1563936 m!1439455))

(declare-fun m!1439457 () Bool)

(assert (=> mapNonEmpty!59346 m!1439457))

(declare-fun m!1439459 () Bool)

(assert (=> b!1563939 m!1439459))

(declare-fun m!1439461 () Bool)

(assert (=> b!1563940 m!1439461))

(declare-fun m!1439463 () Bool)

(assert (=> start!133976 m!1439463))

(declare-fun m!1439465 () Bool)

(assert (=> start!133976 m!1439465))

(declare-fun m!1439467 () Bool)

(assert (=> start!133976 m!1439467))

(check-sat (not b_next!31981) tp_is_empty!38647 (not b!1563937) (not b!1563936) (not b!1563940) (not b_lambda!24849) (not mapNonEmpty!59346) (not start!133976) (not b!1563939) b_and!51477)
(check-sat b_and!51477 (not b_next!31981))
