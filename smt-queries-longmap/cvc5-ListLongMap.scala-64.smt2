; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!916 () Bool)

(assert start!916)

(declare-fun b_free!289 () Bool)

(declare-fun b_next!289 () Bool)

(assert (=> start!916 (= b_free!289 (not b_next!289))))

(declare-fun tp!1100 () Bool)

(declare-fun b_and!437 () Bool)

(assert (=> start!916 (= tp!1100 b_and!437)))

(declare-fun b!7680 () Bool)

(declare-fun res!7543 () Bool)

(declare-fun e!4307 () Bool)

(assert (=> b!7680 (=> (not res!7543) (not e!4307))))

(declare-datatypes ((array!667 0))(
  ( (array!668 (arr!321 (Array (_ BitVec 32) (_ BitVec 64))) (size!383 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!667)

(declare-datatypes ((List!217 0))(
  ( (Nil!214) (Cons!213 (h!779 (_ BitVec 64)) (t!2354 List!217)) )
))
(declare-fun arrayNoDuplicates!0 (array!667 (_ BitVec 32) List!217) Bool)

(assert (=> b!7680 (= res!7543 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!214))))

(declare-fun mapIsEmpty!524 () Bool)

(declare-fun mapRes!524 () Bool)

(assert (=> mapIsEmpty!524 mapRes!524))

(declare-fun b!7681 () Bool)

(declare-fun e!4305 () Bool)

(declare-fun e!4304 () Bool)

(assert (=> b!7681 (= e!4305 (and e!4304 mapRes!524))))

(declare-fun condMapEmpty!524 () Bool)

(declare-datatypes ((V!667 0))(
  ( (V!668 (val!189 Int)) )
))
(declare-datatypes ((ValueCell!167 0))(
  ( (ValueCellFull!167 (v!1281 V!667)) (EmptyCell!167) )
))
(declare-datatypes ((array!669 0))(
  ( (array!670 (arr!322 (Array (_ BitVec 32) ValueCell!167)) (size!384 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!669)

(declare-fun mapDefault!524 () ValueCell!167)

