; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!776 () Bool)

(assert start!776)

(declare-fun b_free!169 () Bool)

(declare-fun b_next!169 () Bool)

(assert (=> start!776 (= b_free!169 (not b_next!169))))

(declare-fun tp!737 () Bool)

(declare-fun b_and!315 () Bool)

(assert (=> start!776 (= tp!737 b_and!315)))

(declare-fun res!6274 () Bool)

(declare-fun e!2994 () Bool)

(assert (=> start!776 (=> (not res!6274) (not e!2994))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!776 (= res!6274 (validMask!0 mask!2250))))

(assert (=> start!776 e!2994))

(assert (=> start!776 tp!737))

(assert (=> start!776 true))

(declare-datatypes ((V!507 0))(
  ( (V!508 (val!129 Int)) )
))
(declare-datatypes ((ValueCell!107 0))(
  ( (ValueCellFull!107 (v!1220 V!507)) (EmptyCell!107) )
))
(declare-datatypes ((array!431 0))(
  ( (array!432 (arr!204 (Array (_ BitVec 32) ValueCell!107)) (size!266 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!431)

(declare-fun e!2995 () Bool)

(declare-fun array_inv!151 (array!431) Bool)

(assert (=> start!776 (and (array_inv!151 _values!1492) e!2995)))

(declare-fun tp_is_empty!247 () Bool)

(assert (=> start!776 tp_is_empty!247))

(declare-datatypes ((array!433 0))(
  ( (array!434 (arr!205 (Array (_ BitVec 32) (_ BitVec 64))) (size!267 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!433)

(declare-fun array_inv!152 (array!433) Bool)

(assert (=> start!776 (array_inv!152 _keys!1806)))

(declare-fun b!5515 () Bool)

(declare-fun res!6277 () Bool)

(assert (=> b!5515 (=> (not res!6277) (not e!2994))))

(declare-datatypes ((List!136 0))(
  ( (Nil!133) (Cons!132 (h!698 (_ BitVec 64)) (t!2271 List!136)) )
))
(declare-fun arrayNoDuplicates!0 (array!433 (_ BitVec 32) List!136) Bool)

(assert (=> b!5515 (= res!6277 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!133))))

(declare-fun b!5516 () Bool)

(assert (=> b!5516 (= e!2994 (not true))))

(declare-fun e!2993 () Bool)

(assert (=> b!5516 e!2993))

(declare-fun c!386 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(assert (=> b!5516 (= c!386 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!507)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!507)

(declare-datatypes ((Unit!73 0))(
  ( (Unit!74) )
))
(declare-fun lt!1014 () Unit!73)

(declare-fun lemmaKeyInListMapIsInArray!22 (array!433 array!431 (_ BitVec 32) (_ BitVec 32) V!507 V!507 (_ BitVec 64) Int) Unit!73)

(assert (=> b!5516 (= lt!1014 (lemmaKeyInListMapIsInArray!22 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!5517 () Bool)

(assert (=> b!5517 (= e!2993 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5518 () Bool)

(declare-fun e!2992 () Bool)

(declare-fun mapRes!341 () Bool)

(assert (=> b!5518 (= e!2995 (and e!2992 mapRes!341))))

(declare-fun condMapEmpty!341 () Bool)

(declare-fun mapDefault!341 () ValueCell!107)

