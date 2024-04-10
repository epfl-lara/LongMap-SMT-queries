; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109764 () Bool)

(assert start!109764)

(declare-fun b_free!29177 () Bool)

(declare-fun b_next!29177 () Bool)

(assert (=> start!109764 (= b_free!29177 (not b_next!29177))))

(declare-fun tp!102661 () Bool)

(declare-fun b_and!47285 () Bool)

(assert (=> start!109764 (= tp!102661 b_and!47285)))

(declare-fun mapIsEmpty!53798 () Bool)

(declare-fun mapRes!53798 () Bool)

(assert (=> mapIsEmpty!53798 mapRes!53798))

(declare-fun b!1300186 () Bool)

(declare-fun res!864024 () Bool)

(declare-fun e!741684 () Bool)

(assert (=> b!1300186 (=> (not res!864024) (not e!741684))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86644 0))(
  ( (array!86645 (arr!41819 (Array (_ BitVec 32) (_ BitVec 64))) (size!42369 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86644)

(assert (=> b!1300186 (= res!864024 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42369 _keys!1741))))))

(declare-fun b!1300187 () Bool)

(declare-fun res!864023 () Bool)

(assert (=> b!1300187 (=> (not res!864023) (not e!741684))))

(declare-datatypes ((List!29678 0))(
  ( (Nil!29675) (Cons!29674 (h!30883 (_ BitVec 64)) (t!43250 List!29678)) )
))
(declare-fun arrayNoDuplicates!0 (array!86644 (_ BitVec 32) List!29678) Bool)

(assert (=> b!1300187 (= res!864023 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29675))))

(declare-fun b!1300188 () Bool)

(declare-fun res!864021 () Bool)

(assert (=> b!1300188 (=> (not res!864021) (not e!741684))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86644 (_ BitVec 32)) Bool)

(assert (=> b!1300188 (= res!864021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300189 () Bool)

(declare-fun res!864018 () Bool)

(assert (=> b!1300189 (=> (not res!864018) (not e!741684))))

(declare-datatypes ((V!51525 0))(
  ( (V!51526 (val!17483 Int)) )
))
(declare-datatypes ((ValueCell!16510 0))(
  ( (ValueCellFull!16510 (v!20090 V!51525)) (EmptyCell!16510) )
))
(declare-datatypes ((array!86646 0))(
  ( (array!86647 (arr!41820 (Array (_ BitVec 32) ValueCell!16510)) (size!42370 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86646)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300189 (= res!864018 (and (= (size!42370 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42369 _keys!1741) (size!42370 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300190 () Bool)

(assert (=> b!1300190 (= e!741684 false)))

(declare-fun zeroValue!1387 () V!51525)

(declare-fun lt!581269 () Bool)

(declare-fun minValue!1387 () V!51525)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22546 0))(
  ( (tuple2!22547 (_1!11284 (_ BitVec 64)) (_2!11284 V!51525)) )
))
(declare-datatypes ((List!29679 0))(
  ( (Nil!29676) (Cons!29675 (h!30884 tuple2!22546) (t!43251 List!29679)) )
))
(declare-datatypes ((ListLongMap!20203 0))(
  ( (ListLongMap!20204 (toList!10117 List!29679)) )
))
(declare-fun contains!8241 (ListLongMap!20203 (_ BitVec 64)) Bool)

(declare-fun +!4449 (ListLongMap!20203 tuple2!22546) ListLongMap!20203)

(declare-fun getCurrentListMapNoExtraKeys!6080 (array!86644 array!86646 (_ BitVec 32) (_ BitVec 32) V!51525 V!51525 (_ BitVec 32) Int) ListLongMap!20203)

(assert (=> b!1300190 (= lt!581269 (contains!8241 (+!4449 (getCurrentListMapNoExtraKeys!6080 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun mapNonEmpty!53798 () Bool)

(declare-fun tp!102662 () Bool)

(declare-fun e!741680 () Bool)

(assert (=> mapNonEmpty!53798 (= mapRes!53798 (and tp!102662 e!741680))))

(declare-fun mapValue!53798 () ValueCell!16510)

(declare-fun mapKey!53798 () (_ BitVec 32))

(declare-fun mapRest!53798 () (Array (_ BitVec 32) ValueCell!16510))

(assert (=> mapNonEmpty!53798 (= (arr!41820 _values!1445) (store mapRest!53798 mapKey!53798 mapValue!53798))))

(declare-fun b!1300192 () Bool)

(declare-fun res!864019 () Bool)

(assert (=> b!1300192 (=> (not res!864019) (not e!741684))))

(declare-fun getCurrentListMap!5144 (array!86644 array!86646 (_ BitVec 32) (_ BitVec 32) V!51525 V!51525 (_ BitVec 32) Int) ListLongMap!20203)

(assert (=> b!1300192 (= res!864019 (contains!8241 (getCurrentListMap!5144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1300193 () Bool)

(declare-fun res!864025 () Bool)

(assert (=> b!1300193 (=> (not res!864025) (not e!741684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300193 (= res!864025 (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)))))

(declare-fun b!1300194 () Bool)

(declare-fun res!864017 () Bool)

(assert (=> b!1300194 (=> (not res!864017) (not e!741684))))

(assert (=> b!1300194 (= res!864017 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1300195 () Bool)

(declare-fun tp_is_empty!34817 () Bool)

(assert (=> b!1300195 (= e!741680 tp_is_empty!34817)))

(declare-fun b!1300196 () Bool)

(declare-fun e!741682 () Bool)

(assert (=> b!1300196 (= e!741682 tp_is_empty!34817)))

(declare-fun b!1300197 () Bool)

(declare-fun e!741681 () Bool)

(assert (=> b!1300197 (= e!741681 (and e!741682 mapRes!53798))))

(declare-fun condMapEmpty!53798 () Bool)

(declare-fun mapDefault!53798 () ValueCell!16510)

