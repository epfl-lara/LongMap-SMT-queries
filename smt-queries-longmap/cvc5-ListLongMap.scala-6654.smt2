; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83896 () Bool)

(assert start!83896)

(declare-fun b_free!19705 () Bool)

(declare-fun b_next!19705 () Bool)

(assert (=> start!83896 (= b_free!19705 (not b_next!19705))))

(declare-fun tp!68557 () Bool)

(declare-fun b_and!31499 () Bool)

(assert (=> start!83896 (= tp!68557 b_and!31499)))

(declare-fun b!980381 () Bool)

(declare-fun res!656115 () Bool)

(declare-fun e!552599 () Bool)

(assert (=> b!980381 (=> (not res!656115) (not e!552599))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980381 (= res!656115 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980382 () Bool)

(declare-fun e!552598 () Bool)

(declare-fun tp_is_empty!22699 () Bool)

(assert (=> b!980382 (= e!552598 tp_is_empty!22699)))

(declare-fun b!980383 () Bool)

(declare-fun e!552596 () Bool)

(declare-fun e!552600 () Bool)

(declare-fun mapRes!36077 () Bool)

(assert (=> b!980383 (= e!552596 (and e!552600 mapRes!36077))))

(declare-fun condMapEmpty!36077 () Bool)

(declare-datatypes ((V!35249 0))(
  ( (V!35250 (val!11400 Int)) )
))
(declare-datatypes ((ValueCell!10868 0))(
  ( (ValueCellFull!10868 (v!13962 V!35249)) (EmptyCell!10868) )
))
(declare-datatypes ((array!61407 0))(
  ( (array!61408 (arr!29561 (Array (_ BitVec 32) ValueCell!10868)) (size!30040 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61407)

(declare-fun mapDefault!36077 () ValueCell!10868)

