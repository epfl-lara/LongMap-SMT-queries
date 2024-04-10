; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109340 () Bool)

(assert start!109340)

(declare-fun b_free!28829 () Bool)

(declare-fun b_next!28829 () Bool)

(assert (=> start!109340 (= b_free!28829 (not b_next!28829))))

(declare-fun tp!101605 () Bool)

(declare-fun b_and!46919 () Bool)

(assert (=> start!109340 (= tp!101605 b_and!46919)))

(declare-fun b!1294107 () Bool)

(declare-fun res!859995 () Bool)

(declare-fun e!738499 () Bool)

(assert (=> b!1294107 (=> (not res!859995) (not e!738499))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85960 0))(
  ( (array!85961 (arr!41481 (Array (_ BitVec 32) (_ BitVec 64))) (size!42031 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85960)

(assert (=> b!1294107 (= res!859995 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42031 _keys!1741))))))

(declare-fun b!1294108 () Bool)

(assert (=> b!1294108 (= e!738499 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51061 0))(
  ( (V!51062 (val!17309 Int)) )
))
(declare-datatypes ((tuple2!22278 0))(
  ( (tuple2!22279 (_1!11150 (_ BitVec 64)) (_2!11150 V!51061)) )
))
(declare-datatypes ((List!29423 0))(
  ( (Nil!29420) (Cons!29419 (h!30628 tuple2!22278) (t!42987 List!29423)) )
))
(declare-datatypes ((ListLongMap!19935 0))(
  ( (ListLongMap!19936 (toList!9983 List!29423)) )
))
(declare-fun contains!8101 (ListLongMap!19935 (_ BitVec 64)) Bool)

(assert (=> b!1294108 (not (contains!8101 (ListLongMap!19936 Nil!29420) k!1205))))

(declare-datatypes ((Unit!42858 0))(
  ( (Unit!42859) )
))
(declare-fun lt!579686 () Unit!42858)

(declare-fun emptyContainsNothing!150 ((_ BitVec 64)) Unit!42858)

(assert (=> b!1294108 (= lt!579686 (emptyContainsNothing!150 k!1205))))

(declare-fun mapNonEmpty!53264 () Bool)

(declare-fun mapRes!53264 () Bool)

(declare-fun tp!101606 () Bool)

(declare-fun e!738501 () Bool)

(assert (=> mapNonEmpty!53264 (= mapRes!53264 (and tp!101606 e!738501))))

(declare-datatypes ((ValueCell!16336 0))(
  ( (ValueCellFull!16336 (v!19912 V!51061)) (EmptyCell!16336) )
))
(declare-fun mapRest!53264 () (Array (_ BitVec 32) ValueCell!16336))

(declare-fun mapValue!53264 () ValueCell!16336)

(declare-fun mapKey!53264 () (_ BitVec 32))

(declare-datatypes ((array!85962 0))(
  ( (array!85963 (arr!41482 (Array (_ BitVec 32) ValueCell!16336)) (size!42032 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85962)

(assert (=> mapNonEmpty!53264 (= (arr!41482 _values!1445) (store mapRest!53264 mapKey!53264 mapValue!53264))))

(declare-fun b!1294109 () Bool)

(declare-fun e!738502 () Bool)

(declare-fun tp_is_empty!34469 () Bool)

(assert (=> b!1294109 (= e!738502 tp_is_empty!34469)))

(declare-fun b!1294110 () Bool)

(assert (=> b!1294110 (= e!738501 tp_is_empty!34469)))

(declare-fun res!860000 () Bool)

(assert (=> start!109340 (=> (not res!860000) (not e!738499))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109340 (= res!860000 (validMask!0 mask!2175))))

(assert (=> start!109340 e!738499))

(assert (=> start!109340 tp_is_empty!34469))

(assert (=> start!109340 true))

(declare-fun e!738503 () Bool)

(declare-fun array_inv!31419 (array!85962) Bool)

(assert (=> start!109340 (and (array_inv!31419 _values!1445) e!738503)))

(declare-fun array_inv!31420 (array!85960) Bool)

(assert (=> start!109340 (array_inv!31420 _keys!1741)))

(assert (=> start!109340 tp!101605))

(declare-fun b!1294111 () Bool)

(declare-fun res!859999 () Bool)

(assert (=> b!1294111 (=> (not res!859999) (not e!738499))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294111 (= res!859999 (and (= (size!42032 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42031 _keys!1741) (size!42032 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294112 () Bool)

(declare-fun res!859994 () Bool)

(assert (=> b!1294112 (=> (not res!859994) (not e!738499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294112 (= res!859994 (not (validKeyInArray!0 (select (arr!41481 _keys!1741) from!2144))))))

(declare-fun b!1294113 () Bool)

(declare-fun res!860001 () Bool)

(assert (=> b!1294113 (=> (not res!860001) (not e!738499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85960 (_ BitVec 32)) Bool)

(assert (=> b!1294113 (= res!860001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294114 () Bool)

(assert (=> b!1294114 (= e!738503 (and e!738502 mapRes!53264))))

(declare-fun condMapEmpty!53264 () Bool)

(declare-fun mapDefault!53264 () ValueCell!16336)

