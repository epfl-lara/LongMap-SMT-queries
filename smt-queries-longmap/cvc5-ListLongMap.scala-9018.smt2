; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108868 () Bool)

(assert start!108868)

(declare-fun b_free!28381 () Bool)

(declare-fun b_next!28381 () Bool)

(assert (=> start!108868 (= b_free!28381 (not b_next!28381))))

(declare-fun tp!100258 () Bool)

(declare-fun b_and!46447 () Bool)

(assert (=> start!108868 (= tp!100258 b_and!46447)))

(declare-fun b!1285709 () Bool)

(declare-fun res!854103 () Bool)

(declare-fun e!734419 () Bool)

(assert (=> b!1285709 (=> (not res!854103) (not e!734419))))

(declare-datatypes ((array!85096 0))(
  ( (array!85097 (arr!41050 (Array (_ BitVec 32) (_ BitVec 64))) (size!41600 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85096)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285709 (= res!854103 (validKeyInArray!0 (select (arr!41050 _keys!1741) from!2144)))))

(declare-fun b!1285710 () Bool)

(declare-fun res!854105 () Bool)

(assert (=> b!1285710 (=> (not res!854105) (not e!734419))))

(declare-datatypes ((V!50465 0))(
  ( (V!50466 (val!17085 Int)) )
))
(declare-fun minValue!1387 () V!50465)

(declare-datatypes ((ValueCell!16112 0))(
  ( (ValueCellFull!16112 (v!19687 V!50465)) (EmptyCell!16112) )
))
(declare-datatypes ((array!85098 0))(
  ( (array!85099 (arr!41051 (Array (_ BitVec 32) ValueCell!16112)) (size!41601 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85098)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!50465)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21902 0))(
  ( (tuple2!21903 (_1!10962 (_ BitVec 64)) (_2!10962 V!50465)) )
))
(declare-datatypes ((List!29090 0))(
  ( (Nil!29087) (Cons!29086 (h!30295 tuple2!21902) (t!42634 List!29090)) )
))
(declare-datatypes ((ListLongMap!19559 0))(
  ( (ListLongMap!19560 (toList!9795 List!29090)) )
))
(declare-fun contains!7912 (ListLongMap!19559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4873 (array!85096 array!85098 (_ BitVec 32) (_ BitVec 32) V!50465 V!50465 (_ BitVec 32) Int) ListLongMap!19559)

(assert (=> b!1285710 (= res!854105 (contains!7912 (getCurrentListMap!4873 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52589 () Bool)

(declare-fun mapRes!52589 () Bool)

(assert (=> mapIsEmpty!52589 mapRes!52589))

(declare-fun b!1285711 () Bool)

(declare-fun e!734416 () Bool)

(declare-fun tp_is_empty!34021 () Bool)

(assert (=> b!1285711 (= e!734416 tp_is_empty!34021)))

(declare-fun b!1285712 () Bool)

(declare-fun res!854109 () Bool)

(assert (=> b!1285712 (=> (not res!854109) (not e!734419))))

(assert (=> b!1285712 (= res!854109 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741))))))

(declare-fun mapNonEmpty!52589 () Bool)

(declare-fun tp!100259 () Bool)

(declare-fun e!734420 () Bool)

(assert (=> mapNonEmpty!52589 (= mapRes!52589 (and tp!100259 e!734420))))

(declare-fun mapKey!52589 () (_ BitVec 32))

(declare-fun mapRest!52589 () (Array (_ BitVec 32) ValueCell!16112))

(declare-fun mapValue!52589 () ValueCell!16112)

(assert (=> mapNonEmpty!52589 (= (arr!41051 _values!1445) (store mapRest!52589 mapKey!52589 mapValue!52589))))

(declare-fun b!1285713 () Bool)

(declare-fun res!854108 () Bool)

(assert (=> b!1285713 (=> (not res!854108) (not e!734419))))

(assert (=> b!1285713 (= res!854108 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41600 _keys!1741))))))

(declare-fun b!1285714 () Bool)

(assert (=> b!1285714 (= e!734419 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41600 _keys!1741))))))

(declare-fun res!854106 () Bool)

(assert (=> start!108868 (=> (not res!854106) (not e!734419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108868 (= res!854106 (validMask!0 mask!2175))))

(assert (=> start!108868 e!734419))

(assert (=> start!108868 tp_is_empty!34021))

(assert (=> start!108868 true))

(declare-fun e!734417 () Bool)

(declare-fun array_inv!31127 (array!85098) Bool)

(assert (=> start!108868 (and (array_inv!31127 _values!1445) e!734417)))

(declare-fun array_inv!31128 (array!85096) Bool)

(assert (=> start!108868 (array_inv!31128 _keys!1741)))

(assert (=> start!108868 tp!100258))

(declare-fun b!1285715 () Bool)

(assert (=> b!1285715 (= e!734417 (and e!734416 mapRes!52589))))

(declare-fun condMapEmpty!52589 () Bool)

(declare-fun mapDefault!52589 () ValueCell!16112)

