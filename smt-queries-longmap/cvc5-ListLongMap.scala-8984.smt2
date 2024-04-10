; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108664 () Bool)

(assert start!108664)

(declare-fun b_free!28177 () Bool)

(declare-fun b_next!28177 () Bool)

(assert (=> start!108664 (= b_free!28177 (not b_next!28177))))

(declare-fun tp!99646 () Bool)

(declare-fun b_and!46243 () Bool)

(assert (=> start!108664 (= tp!99646 b_and!46243)))

(declare-fun b!1282661 () Bool)

(declare-fun res!851974 () Bool)

(declare-fun e!732886 () Bool)

(assert (=> b!1282661 (=> (not res!851974) (not e!732886))))

(declare-datatypes ((array!84702 0))(
  ( (array!84703 (arr!40853 (Array (_ BitVec 32) (_ BitVec 64))) (size!41403 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84702)

(declare-datatypes ((List!28944 0))(
  ( (Nil!28941) (Cons!28940 (h!30149 (_ BitVec 64)) (t!42488 List!28944)) )
))
(declare-fun arrayNoDuplicates!0 (array!84702 (_ BitVec 32) List!28944) Bool)

(assert (=> b!1282661 (= res!851974 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28941))))

(declare-fun b!1282662 () Bool)

(declare-fun res!851973 () Bool)

(assert (=> b!1282662 (=> (not res!851973) (not e!732886))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50193 0))(
  ( (V!50194 (val!16983 Int)) )
))
(declare-datatypes ((ValueCell!16010 0))(
  ( (ValueCellFull!16010 (v!19585 V!50193)) (EmptyCell!16010) )
))
(declare-datatypes ((array!84704 0))(
  ( (array!84705 (arr!40854 (Array (_ BitVec 32) ValueCell!16010)) (size!41404 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84704)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282662 (= res!851973 (and (= (size!41404 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41403 _keys!1741) (size!41404 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!851972 () Bool)

(assert (=> start!108664 (=> (not res!851972) (not e!732886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108664 (= res!851972 (validMask!0 mask!2175))))

(assert (=> start!108664 e!732886))

(declare-fun tp_is_empty!33817 () Bool)

(assert (=> start!108664 tp_is_empty!33817))

(assert (=> start!108664 true))

(declare-fun e!732888 () Bool)

(declare-fun array_inv!30991 (array!84704) Bool)

(assert (=> start!108664 (and (array_inv!30991 _values!1445) e!732888)))

(declare-fun array_inv!30992 (array!84702) Bool)

(assert (=> start!108664 (array_inv!30992 _keys!1741)))

(assert (=> start!108664 tp!99646))

(declare-fun mapIsEmpty!52283 () Bool)

(declare-fun mapRes!52283 () Bool)

(assert (=> mapIsEmpty!52283 mapRes!52283))

(declare-fun b!1282663 () Bool)

(declare-fun e!732890 () Bool)

(assert (=> b!1282663 (= e!732890 tp_is_empty!33817)))

(declare-fun b!1282664 () Bool)

(assert (=> b!1282664 (= e!732886 false)))

(declare-fun minValue!1387 () V!50193)

(declare-fun zeroValue!1387 () V!50193)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576562 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21748 0))(
  ( (tuple2!21749 (_1!10885 (_ BitVec 64)) (_2!10885 V!50193)) )
))
(declare-datatypes ((List!28945 0))(
  ( (Nil!28942) (Cons!28941 (h!30150 tuple2!21748) (t!42489 List!28945)) )
))
(declare-datatypes ((ListLongMap!19405 0))(
  ( (ListLongMap!19406 (toList!9718 List!28945)) )
))
(declare-fun contains!7835 (ListLongMap!19405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4802 (array!84702 array!84704 (_ BitVec 32) (_ BitVec 32) V!50193 V!50193 (_ BitVec 32) Int) ListLongMap!19405)

(assert (=> b!1282664 (= lt!576562 (contains!7835 (getCurrentListMap!4802 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52283 () Bool)

(declare-fun tp!99647 () Bool)

(declare-fun e!732889 () Bool)

(assert (=> mapNonEmpty!52283 (= mapRes!52283 (and tp!99647 e!732889))))

(declare-fun mapKey!52283 () (_ BitVec 32))

(declare-fun mapRest!52283 () (Array (_ BitVec 32) ValueCell!16010))

(declare-fun mapValue!52283 () ValueCell!16010)

(assert (=> mapNonEmpty!52283 (= (arr!40854 _values!1445) (store mapRest!52283 mapKey!52283 mapValue!52283))))

(declare-fun b!1282665 () Bool)

(assert (=> b!1282665 (= e!732888 (and e!732890 mapRes!52283))))

(declare-fun condMapEmpty!52283 () Bool)

(declare-fun mapDefault!52283 () ValueCell!16010)

