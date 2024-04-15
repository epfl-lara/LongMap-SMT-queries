; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109126 () Bool)

(assert start!109126)

(declare-fun b_free!28615 () Bool)

(declare-fun b_next!28615 () Bool)

(assert (=> start!109126 (= b_free!28615 (not b_next!28615))))

(declare-fun tp!100965 () Bool)

(declare-fun b_and!46687 () Bool)

(assert (=> start!109126 (= tp!100965 b_and!46687)))

(declare-fun b!1290289 () Bool)

(declare-fun e!736646 () Bool)

(declare-fun tp_is_empty!34255 () Bool)

(assert (=> b!1290289 (= e!736646 tp_is_empty!34255)))

(declare-fun mapIsEmpty!52943 () Bool)

(declare-fun mapRes!52943 () Bool)

(assert (=> mapIsEmpty!52943 mapRes!52943))

(declare-fun b!1290290 () Bool)

(declare-fun res!857177 () Bool)

(declare-fun e!736647 () Bool)

(assert (=> b!1290290 (=> (not res!857177) (not e!736647))))

(declare-datatypes ((array!85439 0))(
  ( (array!85440 (arr!41221 (Array (_ BitVec 32) (_ BitVec 64))) (size!41773 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85439)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290290 (= res!857177 (not (validKeyInArray!0 (select (arr!41221 _keys!1741) from!2144))))))

(declare-fun b!1290291 () Bool)

(declare-fun e!736644 () Bool)

(assert (=> b!1290291 (= e!736644 true)))

(declare-fun lt!578395 () Bool)

(declare-datatypes ((V!50777 0))(
  ( (V!50778 (val!17202 Int)) )
))
(declare-datatypes ((tuple2!22154 0))(
  ( (tuple2!22155 (_1!11088 (_ BitVec 64)) (_2!11088 V!50777)) )
))
(declare-datatypes ((List!29314 0))(
  ( (Nil!29311) (Cons!29310 (h!30519 tuple2!22154) (t!42870 List!29314)) )
))
(declare-datatypes ((ListLongMap!19811 0))(
  ( (ListLongMap!19812 (toList!9921 List!29314)) )
))
(declare-fun lt!578391 () ListLongMap!19811)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!578393 () tuple2!22154)

(declare-fun contains!7969 (ListLongMap!19811 (_ BitVec 64)) Bool)

(declare-fun +!4400 (ListLongMap!19811 tuple2!22154) ListLongMap!19811)

(assert (=> b!1290291 (= lt!578395 (contains!7969 (+!4400 lt!578391 lt!578393) k0!1205))))

(declare-fun lt!578394 () ListLongMap!19811)

(assert (=> b!1290291 (not (contains!7969 (+!4400 lt!578394 lt!578393) k0!1205))))

(declare-fun minValue!1387 () V!50777)

(assert (=> b!1290291 (= lt!578393 (tuple2!22155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!42540 0))(
  ( (Unit!42541) )
))
(declare-fun lt!578389 () Unit!42540)

(declare-fun addStillNotContains!377 (ListLongMap!19811 (_ BitVec 64) V!50777 (_ BitVec 64)) Unit!42540)

(assert (=> b!1290291 (= lt!578389 (addStillNotContains!377 lt!578394 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290291 (not (contains!7969 lt!578391 k0!1205))))

(declare-fun zeroValue!1387 () V!50777)

(assert (=> b!1290291 (= lt!578391 (+!4400 lt!578394 (tuple2!22155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578390 () Unit!42540)

(assert (=> b!1290291 (= lt!578390 (addStillNotContains!377 lt!578394 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-datatypes ((ValueCell!16229 0))(
  ( (ValueCellFull!16229 (v!19804 V!50777)) (EmptyCell!16229) )
))
(declare-datatypes ((array!85441 0))(
  ( (array!85442 (arr!41222 (Array (_ BitVec 32) ValueCell!16229)) (size!41774 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85441)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6031 (array!85439 array!85441 (_ BitVec 32) (_ BitVec 32) V!50777 V!50777 (_ BitVec 32) Int) ListLongMap!19811)

(assert (=> b!1290291 (= lt!578394 (getCurrentListMapNoExtraKeys!6031 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290293 () Bool)

(declare-fun res!857181 () Bool)

(assert (=> b!1290293 (=> (not res!857181) (not e!736647))))

(assert (=> b!1290293 (= res!857181 (and (= (size!41774 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41773 _keys!1741) (size!41774 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290294 () Bool)

(declare-fun res!857183 () Bool)

(assert (=> b!1290294 (=> (not res!857183) (not e!736647))))

(assert (=> b!1290294 (= res!857183 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41773 _keys!1741))))))

(declare-fun b!1290295 () Bool)

(declare-fun e!736643 () Bool)

(assert (=> b!1290295 (= e!736643 tp_is_empty!34255)))

(declare-fun b!1290296 () Bool)

(declare-fun res!857184 () Bool)

(assert (=> b!1290296 (=> (not res!857184) (not e!736647))))

(assert (=> b!1290296 (= res!857184 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41773 _keys!1741))))))

(declare-fun b!1290297 () Bool)

(declare-fun res!857180 () Bool)

(assert (=> b!1290297 (=> (not res!857180) (not e!736647))))

(declare-fun getCurrentListMap!4871 (array!85439 array!85441 (_ BitVec 32) (_ BitVec 32) V!50777 V!50777 (_ BitVec 32) Int) ListLongMap!19811)

(assert (=> b!1290297 (= res!857180 (contains!7969 (getCurrentListMap!4871 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52943 () Bool)

(declare-fun tp!100964 () Bool)

(assert (=> mapNonEmpty!52943 (= mapRes!52943 (and tp!100964 e!736643))))

(declare-fun mapKey!52943 () (_ BitVec 32))

(declare-fun mapRest!52943 () (Array (_ BitVec 32) ValueCell!16229))

(declare-fun mapValue!52943 () ValueCell!16229)

(assert (=> mapNonEmpty!52943 (= (arr!41222 _values!1445) (store mapRest!52943 mapKey!52943 mapValue!52943))))

(declare-fun b!1290298 () Bool)

(assert (=> b!1290298 (= e!736647 (not e!736644))))

(declare-fun res!857176 () Bool)

(assert (=> b!1290298 (=> res!857176 e!736644)))

(assert (=> b!1290298 (= res!857176 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290298 (not (contains!7969 (ListLongMap!19812 Nil!29311) k0!1205))))

(declare-fun lt!578392 () Unit!42540)

(declare-fun emptyContainsNothing!70 ((_ BitVec 64)) Unit!42540)

(assert (=> b!1290298 (= lt!578392 (emptyContainsNothing!70 k0!1205))))

(declare-fun res!857182 () Bool)

(assert (=> start!109126 (=> (not res!857182) (not e!736647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109126 (= res!857182 (validMask!0 mask!2175))))

(assert (=> start!109126 e!736647))

(assert (=> start!109126 tp_is_empty!34255))

(assert (=> start!109126 true))

(declare-fun e!736645 () Bool)

(declare-fun array_inv!31407 (array!85441) Bool)

(assert (=> start!109126 (and (array_inv!31407 _values!1445) e!736645)))

(declare-fun array_inv!31408 (array!85439) Bool)

(assert (=> start!109126 (array_inv!31408 _keys!1741)))

(assert (=> start!109126 tp!100965))

(declare-fun b!1290292 () Bool)

(declare-fun res!857178 () Bool)

(assert (=> b!1290292 (=> (not res!857178) (not e!736647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85439 (_ BitVec 32)) Bool)

(assert (=> b!1290292 (= res!857178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290299 () Bool)

(assert (=> b!1290299 (= e!736645 (and e!736646 mapRes!52943))))

(declare-fun condMapEmpty!52943 () Bool)

(declare-fun mapDefault!52943 () ValueCell!16229)

(assert (=> b!1290299 (= condMapEmpty!52943 (= (arr!41222 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16229)) mapDefault!52943)))))

(declare-fun b!1290300 () Bool)

(declare-fun res!857179 () Bool)

(assert (=> b!1290300 (=> (not res!857179) (not e!736647))))

(declare-datatypes ((List!29315 0))(
  ( (Nil!29312) (Cons!29311 (h!30520 (_ BitVec 64)) (t!42871 List!29315)) )
))
(declare-fun arrayNoDuplicates!0 (array!85439 (_ BitVec 32) List!29315) Bool)

(assert (=> b!1290300 (= res!857179 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29312))))

(assert (= (and start!109126 res!857182) b!1290293))

(assert (= (and b!1290293 res!857181) b!1290292))

(assert (= (and b!1290292 res!857178) b!1290300))

(assert (= (and b!1290300 res!857179) b!1290294))

(assert (= (and b!1290294 res!857183) b!1290297))

(assert (= (and b!1290297 res!857180) b!1290296))

(assert (= (and b!1290296 res!857184) b!1290290))

(assert (= (and b!1290290 res!857177) b!1290298))

(assert (= (and b!1290298 (not res!857176)) b!1290291))

(assert (= (and b!1290299 condMapEmpty!52943) mapIsEmpty!52943))

(assert (= (and b!1290299 (not condMapEmpty!52943)) mapNonEmpty!52943))

(get-info :version)

(assert (= (and mapNonEmpty!52943 ((_ is ValueCellFull!16229) mapValue!52943)) b!1290295))

(assert (= (and b!1290299 ((_ is ValueCellFull!16229) mapDefault!52943)) b!1290289))

(assert (= start!109126 b!1290299))

(declare-fun m!1182423 () Bool)

(assert (=> start!109126 m!1182423))

(declare-fun m!1182425 () Bool)

(assert (=> start!109126 m!1182425))

(declare-fun m!1182427 () Bool)

(assert (=> start!109126 m!1182427))

(declare-fun m!1182429 () Bool)

(assert (=> b!1290300 m!1182429))

(declare-fun m!1182431 () Bool)

(assert (=> b!1290290 m!1182431))

(assert (=> b!1290290 m!1182431))

(declare-fun m!1182433 () Bool)

(assert (=> b!1290290 m!1182433))

(declare-fun m!1182435 () Bool)

(assert (=> b!1290291 m!1182435))

(declare-fun m!1182437 () Bool)

(assert (=> b!1290291 m!1182437))

(declare-fun m!1182439 () Bool)

(assert (=> b!1290291 m!1182439))

(declare-fun m!1182441 () Bool)

(assert (=> b!1290291 m!1182441))

(declare-fun m!1182443 () Bool)

(assert (=> b!1290291 m!1182443))

(declare-fun m!1182445 () Bool)

(assert (=> b!1290291 m!1182445))

(declare-fun m!1182447 () Bool)

(assert (=> b!1290291 m!1182447))

(declare-fun m!1182449 () Bool)

(assert (=> b!1290291 m!1182449))

(assert (=> b!1290291 m!1182437))

(assert (=> b!1290291 m!1182441))

(declare-fun m!1182451 () Bool)

(assert (=> b!1290291 m!1182451))

(declare-fun m!1182453 () Bool)

(assert (=> mapNonEmpty!52943 m!1182453))

(declare-fun m!1182455 () Bool)

(assert (=> b!1290297 m!1182455))

(assert (=> b!1290297 m!1182455))

(declare-fun m!1182457 () Bool)

(assert (=> b!1290297 m!1182457))

(declare-fun m!1182459 () Bool)

(assert (=> b!1290292 m!1182459))

(declare-fun m!1182461 () Bool)

(assert (=> b!1290298 m!1182461))

(declare-fun m!1182463 () Bool)

(assert (=> b!1290298 m!1182463))

(check-sat (not b!1290297) tp_is_empty!34255 (not b!1290292) b_and!46687 (not b_next!28615) (not b!1290298) (not mapNonEmpty!52943) (not b!1290290) (not start!109126) (not b!1290300) (not b!1290291))
(check-sat b_and!46687 (not b_next!28615))
