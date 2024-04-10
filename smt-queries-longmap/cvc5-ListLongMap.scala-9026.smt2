; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108916 () Bool)

(assert start!108916)

(declare-fun b_free!28429 () Bool)

(declare-fun b_next!28429 () Bool)

(assert (=> start!108916 (= b_free!28429 (not b_next!28429))))

(declare-fun tp!100403 () Bool)

(declare-fun b_and!46513 () Bool)

(assert (=> start!108916 (= tp!100403 b_and!46513)))

(declare-fun b!1286846 () Bool)

(declare-fun res!854727 () Bool)

(declare-fun e!734944 () Bool)

(assert (=> b!1286846 (=> (not res!854727) (not e!734944))))

(declare-datatypes ((array!85186 0))(
  ( (array!85187 (arr!41095 (Array (_ BitVec 32) (_ BitVec 64))) (size!41645 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85186)

(declare-datatypes ((List!29126 0))(
  ( (Nil!29123) (Cons!29122 (h!30331 (_ BitVec 64)) (t!42688 List!29126)) )
))
(declare-fun arrayNoDuplicates!0 (array!85186 (_ BitVec 32) List!29126) Bool)

(assert (=> b!1286846 (= res!854727 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29123))))

(declare-fun b!1286847 () Bool)

(declare-fun res!854724 () Bool)

(assert (=> b!1286847 (=> (not res!854724) (not e!734944))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1286847 (= res!854724 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41645 _keys!1741))))))

(declare-fun res!854725 () Bool)

(assert (=> start!108916 (=> (not res!854725) (not e!734944))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108916 (= res!854725 (validMask!0 mask!2175))))

(assert (=> start!108916 e!734944))

(declare-fun tp_is_empty!34069 () Bool)

(assert (=> start!108916 tp_is_empty!34069))

(assert (=> start!108916 true))

(declare-datatypes ((V!50529 0))(
  ( (V!50530 (val!17109 Int)) )
))
(declare-datatypes ((ValueCell!16136 0))(
  ( (ValueCellFull!16136 (v!19711 V!50529)) (EmptyCell!16136) )
))
(declare-datatypes ((array!85188 0))(
  ( (array!85189 (arr!41096 (Array (_ BitVec 32) ValueCell!16136)) (size!41646 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85188)

(declare-fun e!734949 () Bool)

(declare-fun array_inv!31163 (array!85188) Bool)

(assert (=> start!108916 (and (array_inv!31163 _values!1445) e!734949)))

(declare-fun array_inv!31164 (array!85186) Bool)

(assert (=> start!108916 (array_inv!31164 _keys!1741)))

(assert (=> start!108916 tp!100403))

(declare-fun b!1286848 () Bool)

(declare-fun res!854726 () Bool)

(assert (=> b!1286848 (=> (not res!854726) (not e!734944))))

(declare-fun minValue!1387 () V!50529)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!50529)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21942 0))(
  ( (tuple2!21943 (_1!10982 (_ BitVec 64)) (_2!10982 V!50529)) )
))
(declare-datatypes ((List!29127 0))(
  ( (Nil!29124) (Cons!29123 (h!30332 tuple2!21942) (t!42689 List!29127)) )
))
(declare-datatypes ((ListLongMap!19599 0))(
  ( (ListLongMap!19600 (toList!9815 List!29127)) )
))
(declare-fun contains!7931 (ListLongMap!19599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4890 (array!85186 array!85188 (_ BitVec 32) (_ BitVec 32) V!50529 V!50529 (_ BitVec 32) Int) ListLongMap!19599)

(assert (=> b!1286848 (= res!854726 (contains!7931 (getCurrentListMap!4890 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1286849 () Bool)

(declare-fun res!854730 () Bool)

(assert (=> b!1286849 (=> (not res!854730) (not e!734944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286849 (= res!854730 (validKeyInArray!0 (select (arr!41095 _keys!1741) from!2144)))))

(declare-fun b!1286850 () Bool)

(declare-fun e!734951 () Bool)

(assert (=> b!1286850 (= e!734951 tp_is_empty!34069)))

(declare-fun b!1286851 () Bool)

(declare-fun call!63061 () Bool)

(assert (=> b!1286851 call!63061))

(declare-datatypes ((Unit!42549 0))(
  ( (Unit!42550) )
))
(declare-fun lt!577540 () Unit!42549)

(declare-fun call!63060 () Unit!42549)

(assert (=> b!1286851 (= lt!577540 call!63060)))

(declare-fun lt!577544 () ListLongMap!19599)

(declare-fun call!63064 () ListLongMap!19599)

(assert (=> b!1286851 (= lt!577544 call!63064)))

(declare-fun e!734950 () Unit!42549)

(assert (=> b!1286851 (= e!734950 lt!577540)))

(declare-fun b!1286852 () Bool)

(declare-fun e!734945 () Bool)

(declare-fun mapRes!52661 () Bool)

(assert (=> b!1286852 (= e!734949 (and e!734945 mapRes!52661))))

(declare-fun condMapEmpty!52661 () Bool)

(declare-fun mapDefault!52661 () ValueCell!16136)

