; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113344 () Bool)

(assert start!113344)

(declare-fun b_free!31395 () Bool)

(declare-fun b_next!31395 () Bool)

(assert (=> start!113344 (= b_free!31395 (not b_next!31395))))

(declare-fun tp!109990 () Bool)

(declare-fun b_and!50643 () Bool)

(assert (=> start!113344 (= tp!109990 b_and!50643)))

(declare-fun b!1345094 () Bool)

(declare-fun e!765466 () Bool)

(declare-fun tp_is_empty!37395 () Bool)

(assert (=> b!1345094 (= e!765466 tp_is_empty!37395)))

(declare-fun b!1345095 () Bool)

(declare-fun res!892479 () Bool)

(declare-fun e!765463 () Bool)

(assert (=> b!1345095 (=> (not res!892479) (not e!765463))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91630 0))(
  ( (array!91631 (arr!44271 (Array (_ BitVec 32) (_ BitVec 64))) (size!44821 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91630)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345095 (= res!892479 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44821 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345096 () Bool)

(declare-fun e!765462 () Bool)

(declare-fun e!765464 () Bool)

(declare-fun mapRes!57799 () Bool)

(assert (=> b!1345096 (= e!765462 (and e!765464 mapRes!57799))))

(declare-fun condMapEmpty!57799 () Bool)

(declare-datatypes ((V!54963 0))(
  ( (V!54964 (val!18772 Int)) )
))
(declare-datatypes ((ValueCell!17799 0))(
  ( (ValueCellFull!17799 (v!21420 V!54963)) (EmptyCell!17799) )
))
(declare-datatypes ((array!91632 0))(
  ( (array!91633 (arr!44272 (Array (_ BitVec 32) ValueCell!17799)) (size!44822 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91632)

(declare-fun mapDefault!57799 () ValueCell!17799)

(assert (=> b!1345096 (= condMapEmpty!57799 (= (arr!44272 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17799)) mapDefault!57799)))))

(declare-fun b!1345097 () Bool)

(declare-fun res!892485 () Bool)

(assert (=> b!1345097 (=> (not res!892485) (not e!765463))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91630 (_ BitVec 32)) Bool)

(assert (=> b!1345097 (= res!892485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345098 () Bool)

(declare-fun e!765467 () Bool)

(assert (=> b!1345098 (= e!765463 e!765467)))

(declare-fun res!892481 () Bool)

(assert (=> b!1345098 (=> (not res!892481) (not e!765467))))

(declare-datatypes ((tuple2!24198 0))(
  ( (tuple2!24199 (_1!12110 (_ BitVec 64)) (_2!12110 V!54963)) )
))
(declare-datatypes ((List!31353 0))(
  ( (Nil!31350) (Cons!31349 (h!32558 tuple2!24198) (t!45905 List!31353)) )
))
(declare-datatypes ((ListLongMap!21855 0))(
  ( (ListLongMap!21856 (toList!10943 List!31353)) )
))
(declare-fun lt!595279 () ListLongMap!21855)

(declare-fun lt!595281 () V!54963)

(declare-fun contains!9119 (ListLongMap!21855 (_ BitVec 64)) Bool)

(declare-fun +!4826 (ListLongMap!21855 tuple2!24198) ListLongMap!21855)

(assert (=> b!1345098 (= res!892481 (contains!9119 (+!4826 lt!595279 (tuple2!24199 (select (arr!44271 _keys!1571) from!1960) lt!595281)) k0!1142))))

(declare-fun minValue!1245 () V!54963)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54963)

(declare-fun getCurrentListMapNoExtraKeys!6468 (array!91630 array!91632 (_ BitVec 32) (_ BitVec 32) V!54963 V!54963 (_ BitVec 32) Int) ListLongMap!21855)

(assert (=> b!1345098 (= lt!595279 (getCurrentListMapNoExtraKeys!6468 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22363 (ValueCell!17799 V!54963) V!54963)

(declare-fun dynLambda!3765 (Int (_ BitVec 64)) V!54963)

(assert (=> b!1345098 (= lt!595281 (get!22363 (select (arr!44272 _values!1303) from!1960) (dynLambda!3765 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345099 () Bool)

(declare-fun res!892484 () Bool)

(assert (=> b!1345099 (=> (not res!892484) (not e!765467))))

(assert (=> b!1345099 (= res!892484 (not (= k0!1142 (select (arr!44271 _keys!1571) from!1960))))))

(declare-fun res!892480 () Bool)

(assert (=> start!113344 (=> (not res!892480) (not e!765463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113344 (= res!892480 (validMask!0 mask!1977))))

(assert (=> start!113344 e!765463))

(assert (=> start!113344 tp_is_empty!37395))

(assert (=> start!113344 true))

(declare-fun array_inv!33365 (array!91630) Bool)

(assert (=> start!113344 (array_inv!33365 _keys!1571)))

(declare-fun array_inv!33366 (array!91632) Bool)

(assert (=> start!113344 (and (array_inv!33366 _values!1303) e!765462)))

(assert (=> start!113344 tp!109990))

(declare-fun b!1345100 () Bool)

(declare-fun res!892487 () Bool)

(assert (=> b!1345100 (=> (not res!892487) (not e!765463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345100 (= res!892487 (validKeyInArray!0 (select (arr!44271 _keys!1571) from!1960)))))

(declare-fun b!1345101 () Bool)

(declare-fun res!892486 () Bool)

(assert (=> b!1345101 (=> (not res!892486) (not e!765463))))

(assert (=> b!1345101 (= res!892486 (not (= (select (arr!44271 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57799 () Bool)

(assert (=> mapIsEmpty!57799 mapRes!57799))

(declare-fun b!1345102 () Bool)

(assert (=> b!1345102 (= e!765464 tp_is_empty!37395)))

(declare-fun b!1345103 () Bool)

(declare-fun res!892483 () Bool)

(assert (=> b!1345103 (=> (not res!892483) (not e!765463))))

(declare-fun getCurrentListMap!5897 (array!91630 array!91632 (_ BitVec 32) (_ BitVec 32) V!54963 V!54963 (_ BitVec 32) Int) ListLongMap!21855)

(assert (=> b!1345103 (= res!892483 (contains!9119 (getCurrentListMap!5897 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57799 () Bool)

(declare-fun tp!109989 () Bool)

(assert (=> mapNonEmpty!57799 (= mapRes!57799 (and tp!109989 e!765466))))

(declare-fun mapRest!57799 () (Array (_ BitVec 32) ValueCell!17799))

(declare-fun mapKey!57799 () (_ BitVec 32))

(declare-fun mapValue!57799 () ValueCell!17799)

(assert (=> mapNonEmpty!57799 (= (arr!44272 _values!1303) (store mapRest!57799 mapKey!57799 mapValue!57799))))

(declare-fun b!1345104 () Bool)

(declare-fun res!892478 () Bool)

(assert (=> b!1345104 (=> (not res!892478) (not e!765463))))

(declare-datatypes ((List!31354 0))(
  ( (Nil!31351) (Cons!31350 (h!32559 (_ BitVec 64)) (t!45906 List!31354)) )
))
(declare-fun arrayNoDuplicates!0 (array!91630 (_ BitVec 32) List!31354) Bool)

(assert (=> b!1345104 (= res!892478 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31351))))

(declare-fun b!1345105 () Bool)

(assert (=> b!1345105 (= e!765467 (not true))))

(assert (=> b!1345105 (contains!9119 lt!595279 k0!1142)))

(declare-datatypes ((Unit!44125 0))(
  ( (Unit!44126) )
))
(declare-fun lt!595280 () Unit!44125)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!393 ((_ BitVec 64) (_ BitVec 64) V!54963 ListLongMap!21855) Unit!44125)

(assert (=> b!1345105 (= lt!595280 (lemmaInListMapAfterAddingDiffThenInBefore!393 k0!1142 (select (arr!44271 _keys!1571) from!1960) lt!595281 lt!595279))))

(declare-fun b!1345106 () Bool)

(declare-fun res!892482 () Bool)

(assert (=> b!1345106 (=> (not res!892482) (not e!765463))))

(assert (=> b!1345106 (= res!892482 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345107 () Bool)

(declare-fun res!892488 () Bool)

(assert (=> b!1345107 (=> (not res!892488) (not e!765463))))

(assert (=> b!1345107 (= res!892488 (and (= (size!44822 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44821 _keys!1571) (size!44822 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113344 res!892480) b!1345107))

(assert (= (and b!1345107 res!892488) b!1345097))

(assert (= (and b!1345097 res!892485) b!1345104))

(assert (= (and b!1345104 res!892478) b!1345095))

(assert (= (and b!1345095 res!892479) b!1345103))

(assert (= (and b!1345103 res!892483) b!1345101))

(assert (= (and b!1345101 res!892486) b!1345100))

(assert (= (and b!1345100 res!892487) b!1345106))

(assert (= (and b!1345106 res!892482) b!1345098))

(assert (= (and b!1345098 res!892481) b!1345099))

(assert (= (and b!1345099 res!892484) b!1345105))

(assert (= (and b!1345096 condMapEmpty!57799) mapIsEmpty!57799))

(assert (= (and b!1345096 (not condMapEmpty!57799)) mapNonEmpty!57799))

(get-info :version)

(assert (= (and mapNonEmpty!57799 ((_ is ValueCellFull!17799) mapValue!57799)) b!1345094))

(assert (= (and b!1345096 ((_ is ValueCellFull!17799) mapDefault!57799)) b!1345102))

(assert (= start!113344 b!1345096))

(declare-fun b_lambda!24517 () Bool)

(assert (=> (not b_lambda!24517) (not b!1345098)))

(declare-fun t!45904 () Bool)

(declare-fun tb!12355 () Bool)

(assert (=> (and start!113344 (= defaultEntry!1306 defaultEntry!1306) t!45904) tb!12355))

(declare-fun result!25801 () Bool)

(assert (=> tb!12355 (= result!25801 tp_is_empty!37395)))

(assert (=> b!1345098 t!45904))

(declare-fun b_and!50645 () Bool)

(assert (= b_and!50643 (and (=> t!45904 result!25801) b_and!50645)))

(declare-fun m!1232551 () Bool)

(assert (=> mapNonEmpty!57799 m!1232551))

(declare-fun m!1232553 () Bool)

(assert (=> b!1345103 m!1232553))

(assert (=> b!1345103 m!1232553))

(declare-fun m!1232555 () Bool)

(assert (=> b!1345103 m!1232555))

(declare-fun m!1232557 () Bool)

(assert (=> b!1345098 m!1232557))

(declare-fun m!1232559 () Bool)

(assert (=> b!1345098 m!1232559))

(declare-fun m!1232561 () Bool)

(assert (=> b!1345098 m!1232561))

(declare-fun m!1232563 () Bool)

(assert (=> b!1345098 m!1232563))

(assert (=> b!1345098 m!1232559))

(assert (=> b!1345098 m!1232561))

(declare-fun m!1232565 () Bool)

(assert (=> b!1345098 m!1232565))

(assert (=> b!1345098 m!1232565))

(declare-fun m!1232567 () Bool)

(assert (=> b!1345098 m!1232567))

(declare-fun m!1232569 () Bool)

(assert (=> b!1345098 m!1232569))

(assert (=> b!1345101 m!1232569))

(declare-fun m!1232571 () Bool)

(assert (=> start!113344 m!1232571))

(declare-fun m!1232573 () Bool)

(assert (=> start!113344 m!1232573))

(declare-fun m!1232575 () Bool)

(assert (=> start!113344 m!1232575))

(assert (=> b!1345099 m!1232569))

(assert (=> b!1345100 m!1232569))

(assert (=> b!1345100 m!1232569))

(declare-fun m!1232577 () Bool)

(assert (=> b!1345100 m!1232577))

(declare-fun m!1232579 () Bool)

(assert (=> b!1345097 m!1232579))

(declare-fun m!1232581 () Bool)

(assert (=> b!1345105 m!1232581))

(assert (=> b!1345105 m!1232569))

(assert (=> b!1345105 m!1232569))

(declare-fun m!1232583 () Bool)

(assert (=> b!1345105 m!1232583))

(declare-fun m!1232585 () Bool)

(assert (=> b!1345104 m!1232585))

(check-sat (not b!1345103) (not b!1345098) (not b!1345097) (not b!1345104) (not start!113344) b_and!50645 (not b!1345100) (not b_next!31395) (not b_lambda!24517) (not b!1345105) (not mapNonEmpty!57799) tp_is_empty!37395)
(check-sat b_and!50645 (not b_next!31395))
