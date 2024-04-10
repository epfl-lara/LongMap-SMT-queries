; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!654 () Bool)

(assert start!654)

(declare-fun b_free!127 () Bool)

(declare-fun b_next!127 () Bool)

(assert (=> start!654 (= b_free!127 (not b_next!127))))

(declare-fun tp!599 () Bool)

(declare-fun b_and!265 () Bool)

(assert (=> start!654 (= tp!599 b_and!265)))

(declare-fun b!4311 () Bool)

(declare-fun e!2264 () Bool)

(declare-fun tp_is_empty!205 () Bool)

(assert (=> b!4311 (= e!2264 tp_is_empty!205)))

(declare-fun b!4312 () Bool)

(declare-fun e!2266 () Bool)

(declare-datatypes ((array!341 0))(
  ( (array!342 (arr!163 (Array (_ BitVec 32) (_ BitVec 64))) (size!225 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!341)

(assert (=> b!4312 (= e!2266 (not (bvslt #b00000000000000000000000000000000 (size!225 _keys!1806))))))

(declare-fun e!2265 () Bool)

(assert (=> b!4312 e!2265))

(declare-fun c!203 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(assert (=> b!4312 (= c!203 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!451 0))(
  ( (V!452 (val!108 Int)) )
))
(declare-datatypes ((ValueCell!86 0))(
  ( (ValueCellFull!86 (v!1195 V!451)) (EmptyCell!86) )
))
(declare-datatypes ((array!343 0))(
  ( (array!344 (arr!164 (Array (_ BitVec 32) ValueCell!86)) (size!226 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!343)

(declare-fun minValue!1434 () V!451)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!451)

(declare-datatypes ((Unit!35 0))(
  ( (Unit!36) )
))
(declare-fun lt!591 () Unit!35)

(declare-fun lemmaKeyInListMapIsInArray!7 (array!341 array!343 (_ BitVec 32) (_ BitVec 32) V!451 V!451 (_ BitVec 64) Int) Unit!35)

(assert (=> b!4312 (= lt!591 (lemmaKeyInListMapIsInArray!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!4313 () Bool)

(declare-fun res!5667 () Bool)

(assert (=> b!4313 (=> (not res!5667) (not e!2266))))

(declare-datatypes ((tuple2!92 0))(
  ( (tuple2!93 (_1!46 (_ BitVec 64)) (_2!46 V!451)) )
))
(declare-datatypes ((List!102 0))(
  ( (Nil!99) (Cons!98 (h!664 tuple2!92) (t!2229 List!102)) )
))
(declare-datatypes ((ListLongMap!97 0))(
  ( (ListLongMap!98 (toList!64 List!102)) )
))
(declare-fun contains!34 (ListLongMap!97 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!23 (array!341 array!343 (_ BitVec 32) (_ BitVec 32) V!451 V!451 (_ BitVec 32) Int) ListLongMap!97)

(assert (=> b!4313 (= res!5667 (contains!34 (getCurrentListMap!23 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4314 () Bool)

(declare-fun res!5668 () Bool)

(assert (=> b!4314 (=> (not res!5668) (not e!2266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!341 (_ BitVec 32)) Bool)

(assert (=> b!4314 (= res!5668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4315 () Bool)

(assert (=> b!4315 (= e!2265 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4316 () Bool)

(declare-fun arrayContainsKey!0 (array!341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4316 (= e!2265 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!4317 () Bool)

(declare-fun e!2267 () Bool)

(declare-fun e!2262 () Bool)

(declare-fun mapRes!266 () Bool)

(assert (=> b!4317 (= e!2267 (and e!2262 mapRes!266))))

(declare-fun condMapEmpty!266 () Bool)

(declare-fun mapDefault!266 () ValueCell!86)

