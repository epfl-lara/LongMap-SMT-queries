; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109626 () Bool)

(assert start!109626)

(declare-fun b_free!28891 () Bool)

(declare-fun b_next!28891 () Bool)

(assert (=> start!109626 (= b_free!28891 (not b_next!28891))))

(declare-fun tp!101791 () Bool)

(declare-fun b_and!46983 () Bool)

(assert (=> start!109626 (= tp!101791 b_and!46983)))

(declare-fun b!1296464 () Bool)

(declare-fun e!739841 () Bool)

(assert (=> b!1296464 (= e!739841 true)))

(declare-datatypes ((V!51145 0))(
  ( (V!51146 (val!17340 Int)) )
))
(declare-datatypes ((tuple2!22328 0))(
  ( (tuple2!22329 (_1!11175 (_ BitVec 64)) (_2!11175 V!51145)) )
))
(declare-datatypes ((List!29495 0))(
  ( (Nil!29492) (Cons!29491 (h!30709 tuple2!22328) (t!43051 List!29495)) )
))
(declare-datatypes ((ListLongMap!19993 0))(
  ( (ListLongMap!19994 (toList!10012 List!29495)) )
))
(declare-fun lt!580314 () ListLongMap!19993)

(declare-fun minValue!1387 () V!51145)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8143 (ListLongMap!19993 (_ BitVec 64)) Bool)

(declare-fun +!4457 (ListLongMap!19993 tuple2!22328) ListLongMap!19993)

(assert (=> b!1296464 (not (contains!8143 (+!4457 lt!580314 (tuple2!22329 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42855 0))(
  ( (Unit!42856) )
))
(declare-fun lt!580312 () Unit!42855)

(declare-fun addStillNotContains!433 (ListLongMap!19993 (_ BitVec 64) V!51145 (_ BitVec 64)) Unit!42855)

(assert (=> b!1296464 (= lt!580312 (addStillNotContains!433 lt!580314 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51145)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16367 0))(
  ( (ValueCellFull!16367 (v!19938 V!51145)) (EmptyCell!16367) )
))
(declare-datatypes ((array!86115 0))(
  ( (array!86116 (arr!41554 (Array (_ BitVec 32) ValueCell!16367)) (size!42105 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86115)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86117 0))(
  ( (array!86118 (arr!41555 (Array (_ BitVec 32) (_ BitVec 64))) (size!42106 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86117)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6099 (array!86117 array!86115 (_ BitVec 32) (_ BitVec 32) V!51145 V!51145 (_ BitVec 32) Int) ListLongMap!19993)

(assert (=> b!1296464 (= lt!580314 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296465 () Bool)

(declare-fun res!861290 () Bool)

(declare-fun e!739843 () Bool)

(assert (=> b!1296465 (=> (not res!861290) (not e!739843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296465 (= res!861290 (not (validKeyInArray!0 (select (arr!41555 _keys!1741) from!2144))))))

(declare-fun b!1296466 () Bool)

(assert (=> b!1296466 (= e!739843 (not e!739841))))

(declare-fun res!861295 () Bool)

(assert (=> b!1296466 (=> res!861295 e!739841)))

(assert (=> b!1296466 (= res!861295 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296466 (not (contains!8143 (ListLongMap!19994 Nil!29492) k0!1205))))

(declare-fun lt!580313 () Unit!42855)

(declare-fun emptyContainsNothing!170 ((_ BitVec 64)) Unit!42855)

(assert (=> b!1296466 (= lt!580313 (emptyContainsNothing!170 k0!1205))))

(declare-fun mapIsEmpty!53357 () Bool)

(declare-fun mapRes!53357 () Bool)

(assert (=> mapIsEmpty!53357 mapRes!53357))

(declare-fun b!1296467 () Bool)

(declare-fun res!861291 () Bool)

(assert (=> b!1296467 (=> (not res!861291) (not e!739843))))

(declare-datatypes ((List!29496 0))(
  ( (Nil!29493) (Cons!29492 (h!30710 (_ BitVec 64)) (t!43052 List!29496)) )
))
(declare-fun arrayNoDuplicates!0 (array!86117 (_ BitVec 32) List!29496) Bool)

(assert (=> b!1296467 (= res!861291 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29493))))

(declare-fun b!1296468 () Bool)

(declare-fun res!861289 () Bool)

(assert (=> b!1296468 (=> (not res!861289) (not e!739843))))

(assert (=> b!1296468 (= res!861289 (and (= (size!42105 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42106 _keys!1741) (size!42105 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53357 () Bool)

(declare-fun tp!101792 () Bool)

(declare-fun e!739840 () Bool)

(assert (=> mapNonEmpty!53357 (= mapRes!53357 (and tp!101792 e!739840))))

(declare-fun mapRest!53357 () (Array (_ BitVec 32) ValueCell!16367))

(declare-fun mapValue!53357 () ValueCell!16367)

(declare-fun mapKey!53357 () (_ BitVec 32))

(assert (=> mapNonEmpty!53357 (= (arr!41554 _values!1445) (store mapRest!53357 mapKey!53357 mapValue!53357))))

(declare-fun b!1296469 () Bool)

(declare-fun e!739844 () Bool)

(declare-fun e!739845 () Bool)

(assert (=> b!1296469 (= e!739844 (and e!739845 mapRes!53357))))

(declare-fun condMapEmpty!53357 () Bool)

(declare-fun mapDefault!53357 () ValueCell!16367)

(assert (=> b!1296469 (= condMapEmpty!53357 (= (arr!41554 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16367)) mapDefault!53357)))))

(declare-fun b!1296470 () Bool)

(declare-fun tp_is_empty!34531 () Bool)

(assert (=> b!1296470 (= e!739845 tp_is_empty!34531)))

(declare-fun b!1296471 () Bool)

(assert (=> b!1296471 (= e!739840 tp_is_empty!34531)))

(declare-fun b!1296472 () Bool)

(declare-fun res!861294 () Bool)

(assert (=> b!1296472 (=> (not res!861294) (not e!739843))))

(declare-fun getCurrentListMap!5037 (array!86117 array!86115 (_ BitVec 32) (_ BitVec 32) V!51145 V!51145 (_ BitVec 32) Int) ListLongMap!19993)

(assert (=> b!1296472 (= res!861294 (contains!8143 (getCurrentListMap!5037 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296474 () Bool)

(declare-fun res!861293 () Bool)

(assert (=> b!1296474 (=> (not res!861293) (not e!739843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86117 (_ BitVec 32)) Bool)

(assert (=> b!1296474 (= res!861293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296475 () Bool)

(declare-fun res!861292 () Bool)

(assert (=> b!1296475 (=> (not res!861292) (not e!739843))))

(assert (=> b!1296475 (= res!861292 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42106 _keys!1741))))))

(declare-fun b!1296473 () Bool)

(declare-fun res!861287 () Bool)

(assert (=> b!1296473 (=> (not res!861287) (not e!739843))))

(assert (=> b!1296473 (= res!861287 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42106 _keys!1741))))))

(declare-fun res!861288 () Bool)

(assert (=> start!109626 (=> (not res!861288) (not e!739843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109626 (= res!861288 (validMask!0 mask!2175))))

(assert (=> start!109626 e!739843))

(assert (=> start!109626 tp_is_empty!34531))

(assert (=> start!109626 true))

(declare-fun array_inv!31697 (array!86115) Bool)

(assert (=> start!109626 (and (array_inv!31697 _values!1445) e!739844)))

(declare-fun array_inv!31698 (array!86117) Bool)

(assert (=> start!109626 (array_inv!31698 _keys!1741)))

(assert (=> start!109626 tp!101791))

(assert (= (and start!109626 res!861288) b!1296468))

(assert (= (and b!1296468 res!861289) b!1296474))

(assert (= (and b!1296474 res!861293) b!1296467))

(assert (= (and b!1296467 res!861291) b!1296473))

(assert (= (and b!1296473 res!861287) b!1296472))

(assert (= (and b!1296472 res!861294) b!1296475))

(assert (= (and b!1296475 res!861292) b!1296465))

(assert (= (and b!1296465 res!861290) b!1296466))

(assert (= (and b!1296466 (not res!861295)) b!1296464))

(assert (= (and b!1296469 condMapEmpty!53357) mapIsEmpty!53357))

(assert (= (and b!1296469 (not condMapEmpty!53357)) mapNonEmpty!53357))

(get-info :version)

(assert (= (and mapNonEmpty!53357 ((_ is ValueCellFull!16367) mapValue!53357)) b!1296471))

(assert (= (and b!1296469 ((_ is ValueCellFull!16367) mapDefault!53357)) b!1296470))

(assert (= start!109626 b!1296469))

(declare-fun m!1188825 () Bool)

(assert (=> b!1296472 m!1188825))

(assert (=> b!1296472 m!1188825))

(declare-fun m!1188827 () Bool)

(assert (=> b!1296472 m!1188827))

(declare-fun m!1188829 () Bool)

(assert (=> start!109626 m!1188829))

(declare-fun m!1188831 () Bool)

(assert (=> start!109626 m!1188831))

(declare-fun m!1188833 () Bool)

(assert (=> start!109626 m!1188833))

(declare-fun m!1188835 () Bool)

(assert (=> b!1296466 m!1188835))

(declare-fun m!1188837 () Bool)

(assert (=> b!1296466 m!1188837))

(declare-fun m!1188839 () Bool)

(assert (=> b!1296474 m!1188839))

(declare-fun m!1188841 () Bool)

(assert (=> b!1296465 m!1188841))

(assert (=> b!1296465 m!1188841))

(declare-fun m!1188843 () Bool)

(assert (=> b!1296465 m!1188843))

(declare-fun m!1188845 () Bool)

(assert (=> mapNonEmpty!53357 m!1188845))

(declare-fun m!1188847 () Bool)

(assert (=> b!1296464 m!1188847))

(assert (=> b!1296464 m!1188847))

(declare-fun m!1188849 () Bool)

(assert (=> b!1296464 m!1188849))

(declare-fun m!1188851 () Bool)

(assert (=> b!1296464 m!1188851))

(declare-fun m!1188853 () Bool)

(assert (=> b!1296464 m!1188853))

(declare-fun m!1188855 () Bool)

(assert (=> b!1296467 m!1188855))

(check-sat tp_is_empty!34531 (not b!1296464) (not b_next!28891) (not b!1296474) (not b!1296467) (not b!1296472) (not mapNonEmpty!53357) b_and!46983 (not start!109626) (not b!1296466) (not b!1296465))
(check-sat b_and!46983 (not b_next!28891))
