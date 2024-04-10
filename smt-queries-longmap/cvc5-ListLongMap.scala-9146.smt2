; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109716 () Bool)

(assert start!109716)

(declare-fun b_free!29149 () Bool)

(declare-fun b_next!29149 () Bool)

(assert (=> start!109716 (= b_free!29149 (not b_next!29149))))

(declare-fun tp!102574 () Bool)

(declare-fun b_and!47251 () Bool)

(assert (=> start!109716 (= tp!102574 b_and!47251)))

(declare-fun b!1299528 () Bool)

(declare-fun res!863583 () Bool)

(declare-fun e!741375 () Bool)

(assert (=> b!1299528 (=> (not res!863583) (not e!741375))))

(declare-datatypes ((array!86586 0))(
  ( (array!86587 (arr!41791 (Array (_ BitVec 32) (_ BitVec 64))) (size!42341 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86586)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299528 (= res!863583 (validKeyInArray!0 (select (arr!41791 _keys!1741) from!2144)))))

(declare-fun b!1299529 () Bool)

(declare-fun res!863582 () Bool)

(assert (=> b!1299529 (=> (not res!863582) (not e!741375))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51489 0))(
  ( (V!51490 (val!17469 Int)) )
))
(declare-datatypes ((ValueCell!16496 0))(
  ( (ValueCellFull!16496 (v!20075 V!51489)) (EmptyCell!16496) )
))
(declare-datatypes ((array!86588 0))(
  ( (array!86589 (arr!41792 (Array (_ BitVec 32) ValueCell!16496)) (size!42342 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86588)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299529 (= res!863582 (and (= (size!42342 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42341 _keys!1741) (size!42342 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299530 () Bool)

(declare-fun res!863578 () Bool)

(assert (=> b!1299530 (=> (not res!863578) (not e!741375))))

(assert (=> b!1299530 (= res!863578 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!53753 () Bool)

(declare-fun mapRes!53753 () Bool)

(assert (=> mapIsEmpty!53753 mapRes!53753))

(declare-fun res!863580 () Bool)

(assert (=> start!109716 (=> (not res!863580) (not e!741375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109716 (= res!863580 (validMask!0 mask!2175))))

(assert (=> start!109716 e!741375))

(declare-fun tp_is_empty!34789 () Bool)

(assert (=> start!109716 tp_is_empty!34789))

(assert (=> start!109716 true))

(declare-fun e!741376 () Bool)

(declare-fun array_inv!31627 (array!86588) Bool)

(assert (=> start!109716 (and (array_inv!31627 _values!1445) e!741376)))

(declare-fun array_inv!31628 (array!86586) Bool)

(assert (=> start!109716 (array_inv!31628 _keys!1741)))

(assert (=> start!109716 tp!102574))

(declare-fun b!1299531 () Bool)

(declare-fun res!863581 () Bool)

(assert (=> b!1299531 (=> (not res!863581) (not e!741375))))

(declare-datatypes ((List!29661 0))(
  ( (Nil!29658) (Cons!29657 (h!30866 (_ BitVec 64)) (t!43231 List!29661)) )
))
(declare-fun arrayNoDuplicates!0 (array!86586 (_ BitVec 32) List!29661) Bool)

(assert (=> b!1299531 (= res!863581 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29658))))

(declare-fun mapNonEmpty!53753 () Bool)

(declare-fun tp!102575 () Bool)

(declare-fun e!741372 () Bool)

(assert (=> mapNonEmpty!53753 (= mapRes!53753 (and tp!102575 e!741372))))

(declare-fun mapValue!53753 () ValueCell!16496)

(declare-fun mapKey!53753 () (_ BitVec 32))

(declare-fun mapRest!53753 () (Array (_ BitVec 32) ValueCell!16496))

(assert (=> mapNonEmpty!53753 (= (arr!41792 _values!1445) (store mapRest!53753 mapKey!53753 mapValue!53753))))

(declare-fun b!1299532 () Bool)

(declare-fun e!741374 () Bool)

(assert (=> b!1299532 (= e!741374 tp_is_empty!34789)))

(declare-fun b!1299533 () Bool)

(assert (=> b!1299533 (= e!741372 tp_is_empty!34789)))

(declare-fun b!1299534 () Bool)

(declare-fun res!863576 () Bool)

(assert (=> b!1299534 (=> (not res!863576) (not e!741375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86586 (_ BitVec 32)) Bool)

(assert (=> b!1299534 (= res!863576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299535 () Bool)

(assert (=> b!1299535 (= e!741375 false)))

(declare-fun minValue!1387 () V!51489)

(declare-fun zeroValue!1387 () V!51489)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!581094 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22530 0))(
  ( (tuple2!22531 (_1!11276 (_ BitVec 64)) (_2!11276 V!51489)) )
))
(declare-datatypes ((List!29662 0))(
  ( (Nil!29659) (Cons!29658 (h!30867 tuple2!22530) (t!43232 List!29662)) )
))
(declare-datatypes ((ListLongMap!20187 0))(
  ( (ListLongMap!20188 (toList!10109 List!29662)) )
))
(declare-fun contains!8231 (ListLongMap!20187 (_ BitVec 64)) Bool)

(declare-fun +!4442 (ListLongMap!20187 tuple2!22530) ListLongMap!20187)

(declare-fun getCurrentListMapNoExtraKeys!6073 (array!86586 array!86588 (_ BitVec 32) (_ BitVec 32) V!51489 V!51489 (_ BitVec 32) Int) ListLongMap!20187)

(assert (=> b!1299535 (= lt!581094 (contains!8231 (+!4442 (+!4442 (getCurrentListMapNoExtraKeys!6073 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun b!1299536 () Bool)

(assert (=> b!1299536 (= e!741376 (and e!741374 mapRes!53753))))

(declare-fun condMapEmpty!53753 () Bool)

(declare-fun mapDefault!53753 () ValueCell!16496)

