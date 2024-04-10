; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109424 () Bool)

(assert start!109424)

(declare-fun b_free!28913 () Bool)

(declare-fun b_next!28913 () Bool)

(assert (=> start!109424 (= b_free!28913 (not b_next!28913))))

(declare-fun tp!101858 () Bool)

(declare-fun b_and!47003 () Bool)

(assert (=> start!109424 (= tp!101858 b_and!47003)))

(declare-fun b!1295555 () Bool)

(declare-fun e!739193 () Bool)

(declare-fun e!739192 () Bool)

(assert (=> b!1295555 (= e!739193 (not e!739192))))

(declare-fun res!861066 () Bool)

(assert (=> b!1295555 (=> res!861066 e!739192)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295555 (= res!861066 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51173 0))(
  ( (V!51174 (val!17351 Int)) )
))
(declare-datatypes ((tuple2!22346 0))(
  ( (tuple2!22347 (_1!11184 (_ BitVec 64)) (_2!11184 V!51173)) )
))
(declare-datatypes ((List!29486 0))(
  ( (Nil!29483) (Cons!29482 (h!30691 tuple2!22346) (t!43050 List!29486)) )
))
(declare-datatypes ((ListLongMap!20003 0))(
  ( (ListLongMap!20004 (toList!10017 List!29486)) )
))
(declare-fun contains!8135 (ListLongMap!20003 (_ BitVec 64)) Bool)

(assert (=> b!1295555 (not (contains!8135 (ListLongMap!20004 Nil!29483) k!1205))))

(declare-datatypes ((Unit!42912 0))(
  ( (Unit!42913) )
))
(declare-fun lt!579929 () Unit!42912)

(declare-fun emptyContainsNothing!175 ((_ BitVec 64)) Unit!42912)

(assert (=> b!1295555 (= lt!579929 (emptyContainsNothing!175 k!1205))))

(declare-fun b!1295556 () Bool)

(declare-fun res!861071 () Bool)

(assert (=> b!1295556 (=> (not res!861071) (not e!739193))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86126 0))(
  ( (array!86127 (arr!41564 (Array (_ BitVec 32) (_ BitVec 64))) (size!42114 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86126)

(assert (=> b!1295556 (= res!861071 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42114 _keys!1741))))))

(declare-fun mapNonEmpty!53390 () Bool)

(declare-fun mapRes!53390 () Bool)

(declare-fun tp!101857 () Bool)

(declare-fun e!739195 () Bool)

(assert (=> mapNonEmpty!53390 (= mapRes!53390 (and tp!101857 e!739195))))

(declare-datatypes ((ValueCell!16378 0))(
  ( (ValueCellFull!16378 (v!19954 V!51173)) (EmptyCell!16378) )
))
(declare-fun mapRest!53390 () (Array (_ BitVec 32) ValueCell!16378))

(declare-fun mapValue!53390 () ValueCell!16378)

(declare-datatypes ((array!86128 0))(
  ( (array!86129 (arr!41565 (Array (_ BitVec 32) ValueCell!16378)) (size!42115 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86128)

(declare-fun mapKey!53390 () (_ BitVec 32))

(assert (=> mapNonEmpty!53390 (= (arr!41565 _values!1445) (store mapRest!53390 mapKey!53390 mapValue!53390))))

(declare-fun b!1295557 () Bool)

(declare-fun res!861072 () Bool)

(assert (=> b!1295557 (=> (not res!861072) (not e!739193))))

(declare-fun minValue!1387 () V!51173)

(declare-fun zeroValue!1387 () V!51173)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!5051 (array!86126 array!86128 (_ BitVec 32) (_ BitVec 32) V!51173 V!51173 (_ BitVec 32) Int) ListLongMap!20003)

(assert (=> b!1295557 (= res!861072 (contains!8135 (getCurrentListMap!5051 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53390 () Bool)

(assert (=> mapIsEmpty!53390 mapRes!53390))

(declare-fun b!1295559 () Bool)

(declare-fun res!861064 () Bool)

(assert (=> b!1295559 (=> (not res!861064) (not e!739193))))

(assert (=> b!1295559 (= res!861064 (and (= (size!42115 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42114 _keys!1741) (size!42115 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295560 () Bool)

(assert (=> b!1295560 (= e!739192 true)))

(declare-fun lt!579928 () ListLongMap!20003)

(declare-fun +!4422 (ListLongMap!20003 tuple2!22346) ListLongMap!20003)

(assert (=> b!1295560 (not (contains!8135 (+!4422 lt!579928 (tuple2!22347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579927 () Unit!42912)

(declare-fun addStillNotContains!440 (ListLongMap!20003 (_ BitVec 64) V!51173 (_ BitVec 64)) Unit!42912)

(assert (=> b!1295560 (= lt!579927 (addStillNotContains!440 lt!579928 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6055 (array!86126 array!86128 (_ BitVec 32) (_ BitVec 32) V!51173 V!51173 (_ BitVec 32) Int) ListLongMap!20003)

(assert (=> b!1295560 (= lt!579928 (getCurrentListMapNoExtraKeys!6055 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295561 () Bool)

(declare-fun res!861070 () Bool)

(assert (=> b!1295561 (=> (not res!861070) (not e!739193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86126 (_ BitVec 32)) Bool)

(assert (=> b!1295561 (= res!861070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295562 () Bool)

(declare-fun res!861065 () Bool)

(assert (=> b!1295562 (=> (not res!861065) (not e!739193))))

(declare-datatypes ((List!29487 0))(
  ( (Nil!29484) (Cons!29483 (h!30692 (_ BitVec 64)) (t!43051 List!29487)) )
))
(declare-fun arrayNoDuplicates!0 (array!86126 (_ BitVec 32) List!29487) Bool)

(assert (=> b!1295562 (= res!861065 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29484))))

(declare-fun b!1295558 () Bool)

(declare-fun tp_is_empty!34553 () Bool)

(assert (=> b!1295558 (= e!739195 tp_is_empty!34553)))

(declare-fun res!861069 () Bool)

(assert (=> start!109424 (=> (not res!861069) (not e!739193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109424 (= res!861069 (validMask!0 mask!2175))))

(assert (=> start!109424 e!739193))

(assert (=> start!109424 tp_is_empty!34553))

(assert (=> start!109424 true))

(declare-fun e!739196 () Bool)

(declare-fun array_inv!31469 (array!86128) Bool)

(assert (=> start!109424 (and (array_inv!31469 _values!1445) e!739196)))

(declare-fun array_inv!31470 (array!86126) Bool)

(assert (=> start!109424 (array_inv!31470 _keys!1741)))

(assert (=> start!109424 tp!101858))

(declare-fun b!1295563 () Bool)

(declare-fun e!739194 () Bool)

(assert (=> b!1295563 (= e!739194 tp_is_empty!34553)))

(declare-fun b!1295564 () Bool)

(declare-fun res!861067 () Bool)

(assert (=> b!1295564 (=> (not res!861067) (not e!739193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295564 (= res!861067 (not (validKeyInArray!0 (select (arr!41564 _keys!1741) from!2144))))))

(declare-fun b!1295565 () Bool)

(declare-fun res!861068 () Bool)

(assert (=> b!1295565 (=> (not res!861068) (not e!739193))))

(assert (=> b!1295565 (= res!861068 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42114 _keys!1741))))))

(declare-fun b!1295566 () Bool)

(assert (=> b!1295566 (= e!739196 (and e!739194 mapRes!53390))))

(declare-fun condMapEmpty!53390 () Bool)

(declare-fun mapDefault!53390 () ValueCell!16378)

