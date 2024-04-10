; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108892 () Bool)

(assert start!108892)

(declare-fun b_free!28405 () Bool)

(declare-fun b_next!28405 () Bool)

(assert (=> start!108892 (= b_free!28405 (not b_next!28405))))

(declare-fun tp!100331 () Bool)

(declare-fun b_and!46471 () Bool)

(assert (=> start!108892 (= tp!100331 b_and!46471)))

(declare-fun mapIsEmpty!52625 () Bool)

(declare-fun mapRes!52625 () Bool)

(assert (=> mapIsEmpty!52625 mapRes!52625))

(declare-fun bm!62841 () Bool)

(declare-datatypes ((V!50497 0))(
  ( (V!50498 (val!17097 Int)) )
))
(declare-datatypes ((tuple2!21922 0))(
  ( (tuple2!21923 (_1!10972 (_ BitVec 64)) (_2!10972 V!50497)) )
))
(declare-datatypes ((List!29109 0))(
  ( (Nil!29106) (Cons!29105 (h!30314 tuple2!21922) (t!42655 List!29109)) )
))
(declare-datatypes ((ListLongMap!19579 0))(
  ( (ListLongMap!19580 (toList!9805 List!29109)) )
))
(declare-fun call!62848 () ListLongMap!19579)

(declare-fun call!62847 () ListLongMap!19579)

(assert (=> bm!62841 (= call!62848 call!62847)))

(declare-fun b!1286191 () Bool)

(declare-datatypes ((Unit!42518 0))(
  ( (Unit!42519) )
))
(declare-fun e!734633 () Unit!42518)

(declare-fun e!734635 () Unit!42518)

(assert (=> b!1286191 (= e!734633 e!734635)))

(declare-fun c!124136 () Bool)

(declare-fun lt!577093 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286191 (= c!124136 (and (not lt!577093) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286192 () Bool)

(declare-fun c!124138 () Bool)

(assert (=> b!1286192 (= c!124138 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577093))))

(declare-fun e!734634 () Unit!42518)

(assert (=> b!1286192 (= e!734635 e!734634)))

(declare-fun b!1286193 () Bool)

(declare-fun e!734632 () Bool)

(declare-fun e!734631 () Bool)

(assert (=> b!1286193 (= e!734632 (and e!734631 mapRes!52625))))

(declare-fun condMapEmpty!52625 () Bool)

(declare-datatypes ((ValueCell!16124 0))(
  ( (ValueCellFull!16124 (v!19699 V!50497)) (EmptyCell!16124) )
))
(declare-datatypes ((array!85142 0))(
  ( (array!85143 (arr!41073 (Array (_ BitVec 32) ValueCell!16124)) (size!41623 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85142)

(declare-fun mapDefault!52625 () ValueCell!16124)

