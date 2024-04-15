; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113348 () Bool)

(assert start!113348)

(declare-fun b_free!31399 () Bool)

(declare-fun b_next!31399 () Bool)

(assert (=> start!113348 (= b_free!31399 (not b_next!31399))))

(declare-fun tp!110002 () Bool)

(declare-fun b_and!50633 () Bool)

(assert (=> start!113348 (= tp!110002 b_and!50633)))

(declare-fun b!1345112 () Bool)

(declare-fun e!765470 () Bool)

(declare-fun e!765465 () Bool)

(assert (=> b!1345112 (= e!765470 e!765465)))

(declare-fun res!892525 () Bool)

(assert (=> b!1345112 (=> (not res!892525) (not e!765465))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91581 0))(
  ( (array!91582 (arr!44247 (Array (_ BitVec 32) (_ BitVec 64))) (size!44799 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91581)

(declare-datatypes ((V!54969 0))(
  ( (V!54970 (val!18774 Int)) )
))
(declare-datatypes ((tuple2!24260 0))(
  ( (tuple2!24261 (_1!12141 (_ BitVec 64)) (_2!12141 V!54969)) )
))
(declare-datatypes ((List!31398 0))(
  ( (Nil!31395) (Cons!31394 (h!32603 tuple2!24260) (t!45946 List!31398)) )
))
(declare-datatypes ((ListLongMap!21917 0))(
  ( (ListLongMap!21918 (toList!10974 List!31398)) )
))
(declare-fun lt!595112 () ListLongMap!21917)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!595111 () V!54969)

(declare-fun contains!9079 (ListLongMap!21917 (_ BitVec 64)) Bool)

(declare-fun +!4853 (ListLongMap!21917 tuple2!24260) ListLongMap!21917)

(assert (=> b!1345112 (= res!892525 (contains!9079 (+!4853 lt!595112 (tuple2!24261 (select (arr!44247 _keys!1571) from!1960) lt!595111)) k0!1142))))

(declare-fun minValue!1245 () V!54969)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54969)

(declare-datatypes ((ValueCell!17801 0))(
  ( (ValueCellFull!17801 (v!21421 V!54969)) (EmptyCell!17801) )
))
(declare-datatypes ((array!91583 0))(
  ( (array!91584 (arr!44248 (Array (_ BitVec 32) ValueCell!17801)) (size!44800 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91583)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6496 (array!91581 array!91583 (_ BitVec 32) (_ BitVec 32) V!54969 V!54969 (_ BitVec 32) Int) ListLongMap!21917)

(assert (=> b!1345112 (= lt!595112 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22359 (ValueCell!17801 V!54969) V!54969)

(declare-fun dynLambda!3783 (Int (_ BitVec 64)) V!54969)

(assert (=> b!1345112 (= lt!595111 (get!22359 (select (arr!44248 _values!1303) from!1960) (dynLambda!3783 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345113 () Bool)

(declare-fun res!892516 () Bool)

(assert (=> b!1345113 (=> (not res!892516) (not e!765470))))

(assert (=> b!1345113 (= res!892516 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345114 () Bool)

(declare-fun res!892517 () Bool)

(assert (=> b!1345114 (=> (not res!892517) (not e!765470))))

(assert (=> b!1345114 (= res!892517 (not (= (select (arr!44247 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345115 () Bool)

(declare-fun res!892519 () Bool)

(assert (=> b!1345115 (=> (not res!892519) (not e!765470))))

(declare-datatypes ((List!31399 0))(
  ( (Nil!31396) (Cons!31395 (h!32604 (_ BitVec 64)) (t!45947 List!31399)) )
))
(declare-fun arrayNoDuplicates!0 (array!91581 (_ BitVec 32) List!31399) Bool)

(assert (=> b!1345115 (= res!892519 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31396))))

(declare-fun b!1345116 () Bool)

(declare-fun res!892523 () Bool)

(assert (=> b!1345116 (=> (not res!892523) (not e!765470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91581 (_ BitVec 32)) Bool)

(assert (=> b!1345116 (= res!892523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345117 () Bool)

(declare-fun res!892518 () Bool)

(assert (=> b!1345117 (=> (not res!892518) (not e!765470))))

(assert (=> b!1345117 (= res!892518 (and (= (size!44800 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44799 _keys!1571) (size!44800 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57805 () Bool)

(declare-fun mapRes!57805 () Bool)

(declare-fun tp!110003 () Bool)

(declare-fun e!765468 () Bool)

(assert (=> mapNonEmpty!57805 (= mapRes!57805 (and tp!110003 e!765468))))

(declare-fun mapValue!57805 () ValueCell!17801)

(declare-fun mapKey!57805 () (_ BitVec 32))

(declare-fun mapRest!57805 () (Array (_ BitVec 32) ValueCell!17801))

(assert (=> mapNonEmpty!57805 (= (arr!44248 _values!1303) (store mapRest!57805 mapKey!57805 mapValue!57805))))

(declare-fun b!1345118 () Bool)

(declare-fun res!892515 () Bool)

(assert (=> b!1345118 (=> (not res!892515) (not e!765470))))

(assert (=> b!1345118 (= res!892515 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44799 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345119 () Bool)

(declare-fun e!765467 () Bool)

(declare-fun tp_is_empty!37399 () Bool)

(assert (=> b!1345119 (= e!765467 tp_is_empty!37399)))

(declare-fun b!1345120 () Bool)

(assert (=> b!1345120 (= e!765465 (not true))))

(assert (=> b!1345120 (contains!9079 lt!595112 k0!1142)))

(declare-datatypes ((Unit!43940 0))(
  ( (Unit!43941) )
))
(declare-fun lt!595113 () Unit!43940)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!388 ((_ BitVec 64) (_ BitVec 64) V!54969 ListLongMap!21917) Unit!43940)

(assert (=> b!1345120 (= lt!595113 (lemmaInListMapAfterAddingDiffThenInBefore!388 k0!1142 (select (arr!44247 _keys!1571) from!1960) lt!595111 lt!595112))))

(declare-fun b!1345121 () Bool)

(declare-fun res!892520 () Bool)

(assert (=> b!1345121 (=> (not res!892520) (not e!765470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345121 (= res!892520 (validKeyInArray!0 (select (arr!44247 _keys!1571) from!1960)))))

(declare-fun b!1345122 () Bool)

(assert (=> b!1345122 (= e!765468 tp_is_empty!37399)))

(declare-fun b!1345123 () Bool)

(declare-fun e!765469 () Bool)

(assert (=> b!1345123 (= e!765469 (and e!765467 mapRes!57805))))

(declare-fun condMapEmpty!57805 () Bool)

(declare-fun mapDefault!57805 () ValueCell!17801)

(assert (=> b!1345123 (= condMapEmpty!57805 (= (arr!44248 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17801)) mapDefault!57805)))))

(declare-fun b!1345124 () Bool)

(declare-fun res!892524 () Bool)

(assert (=> b!1345124 (=> (not res!892524) (not e!765465))))

(assert (=> b!1345124 (= res!892524 (not (= k0!1142 (select (arr!44247 _keys!1571) from!1960))))))

(declare-fun b!1345125 () Bool)

(declare-fun res!892522 () Bool)

(assert (=> b!1345125 (=> (not res!892522) (not e!765470))))

(declare-fun getCurrentListMap!5818 (array!91581 array!91583 (_ BitVec 32) (_ BitVec 32) V!54969 V!54969 (_ BitVec 32) Int) ListLongMap!21917)

(assert (=> b!1345125 (= res!892522 (contains!9079 (getCurrentListMap!5818 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!892521 () Bool)

(assert (=> start!113348 (=> (not res!892521) (not e!765470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113348 (= res!892521 (validMask!0 mask!1977))))

(assert (=> start!113348 e!765470))

(assert (=> start!113348 tp_is_empty!37399))

(assert (=> start!113348 true))

(declare-fun array_inv!33539 (array!91581) Bool)

(assert (=> start!113348 (array_inv!33539 _keys!1571)))

(declare-fun array_inv!33540 (array!91583) Bool)

(assert (=> start!113348 (and (array_inv!33540 _values!1303) e!765469)))

(assert (=> start!113348 tp!110002))

(declare-fun mapIsEmpty!57805 () Bool)

(assert (=> mapIsEmpty!57805 mapRes!57805))

(assert (= (and start!113348 res!892521) b!1345117))

(assert (= (and b!1345117 res!892518) b!1345116))

(assert (= (and b!1345116 res!892523) b!1345115))

(assert (= (and b!1345115 res!892519) b!1345118))

(assert (= (and b!1345118 res!892515) b!1345125))

(assert (= (and b!1345125 res!892522) b!1345114))

(assert (= (and b!1345114 res!892517) b!1345121))

(assert (= (and b!1345121 res!892520) b!1345113))

(assert (= (and b!1345113 res!892516) b!1345112))

(assert (= (and b!1345112 res!892525) b!1345124))

(assert (= (and b!1345124 res!892524) b!1345120))

(assert (= (and b!1345123 condMapEmpty!57805) mapIsEmpty!57805))

(assert (= (and b!1345123 (not condMapEmpty!57805)) mapNonEmpty!57805))

(get-info :version)

(assert (= (and mapNonEmpty!57805 ((_ is ValueCellFull!17801) mapValue!57805)) b!1345122))

(assert (= (and b!1345123 ((_ is ValueCellFull!17801) mapDefault!57805)) b!1345119))

(assert (= start!113348 b!1345123))

(declare-fun b_lambda!24511 () Bool)

(assert (=> (not b_lambda!24511) (not b!1345112)))

(declare-fun t!45945 () Bool)

(declare-fun tb!12351 () Bool)

(assert (=> (and start!113348 (= defaultEntry!1306 defaultEntry!1306) t!45945) tb!12351))

(declare-fun result!25801 () Bool)

(assert (=> tb!12351 (= result!25801 tp_is_empty!37399)))

(assert (=> b!1345112 t!45945))

(declare-fun b_and!50635 () Bool)

(assert (= b_and!50633 (and (=> t!45945 result!25801) b_and!50635)))

(declare-fun m!1232107 () Bool)

(assert (=> b!1345116 m!1232107))

(declare-fun m!1232109 () Bool)

(assert (=> mapNonEmpty!57805 m!1232109))

(declare-fun m!1232111 () Bool)

(assert (=> b!1345125 m!1232111))

(assert (=> b!1345125 m!1232111))

(declare-fun m!1232113 () Bool)

(assert (=> b!1345125 m!1232113))

(declare-fun m!1232115 () Bool)

(assert (=> b!1345121 m!1232115))

(assert (=> b!1345121 m!1232115))

(declare-fun m!1232117 () Bool)

(assert (=> b!1345121 m!1232117))

(declare-fun m!1232119 () Bool)

(assert (=> b!1345112 m!1232119))

(declare-fun m!1232121 () Bool)

(assert (=> b!1345112 m!1232121))

(declare-fun m!1232123 () Bool)

(assert (=> b!1345112 m!1232123))

(declare-fun m!1232125 () Bool)

(assert (=> b!1345112 m!1232125))

(declare-fun m!1232127 () Bool)

(assert (=> b!1345112 m!1232127))

(declare-fun m!1232129 () Bool)

(assert (=> b!1345112 m!1232129))

(assert (=> b!1345112 m!1232125))

(assert (=> b!1345112 m!1232127))

(assert (=> b!1345112 m!1232119))

(assert (=> b!1345112 m!1232115))

(assert (=> b!1345114 m!1232115))

(declare-fun m!1232131 () Bool)

(assert (=> b!1345115 m!1232131))

(assert (=> b!1345124 m!1232115))

(declare-fun m!1232133 () Bool)

(assert (=> b!1345120 m!1232133))

(assert (=> b!1345120 m!1232115))

(assert (=> b!1345120 m!1232115))

(declare-fun m!1232135 () Bool)

(assert (=> b!1345120 m!1232135))

(declare-fun m!1232137 () Bool)

(assert (=> start!113348 m!1232137))

(declare-fun m!1232139 () Bool)

(assert (=> start!113348 m!1232139))

(declare-fun m!1232141 () Bool)

(assert (=> start!113348 m!1232141))

(check-sat (not b!1345116) (not b_next!31399) (not start!113348) tp_is_empty!37399 (not b!1345112) (not b!1345115) (not mapNonEmpty!57805) b_and!50635 (not b!1345121) (not b!1345120) (not b!1345125) (not b_lambda!24511))
(check-sat b_and!50635 (not b_next!31399))
