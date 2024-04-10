; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!896 () Bool)

(assert start!896)

(declare-fun b_free!269 () Bool)

(declare-fun b_next!269 () Bool)

(assert (=> start!896 (= b_free!269 (not b_next!269))))

(declare-fun tp!1039 () Bool)

(declare-fun b_and!417 () Bool)

(assert (=> start!896 (= tp!1039 b_and!417)))

(declare-fun b!7470 () Bool)

(declare-fun res!7423 () Bool)

(declare-fun e!4157 () Bool)

(assert (=> b!7470 (=> (not res!7423) (not e!4157))))

(declare-datatypes ((array!627 0))(
  ( (array!628 (arr!301 (Array (_ BitVec 32) (_ BitVec 64))) (size!363 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!627)

(declare-datatypes ((List!203 0))(
  ( (Nil!200) (Cons!199 (h!765 (_ BitVec 64)) (t!2340 List!203)) )
))
(declare-fun arrayNoDuplicates!0 (array!627 (_ BitVec 32) List!203) Bool)

(assert (=> b!7470 (= res!7423 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!200))))

(declare-fun mapIsEmpty!494 () Bool)

(declare-fun mapRes!494 () Bool)

(assert (=> mapIsEmpty!494 mapRes!494))

(declare-fun b!7471 () Bool)

(declare-fun e!4154 () Bool)

(declare-fun e!4156 () Bool)

(assert (=> b!7471 (= e!4154 (and e!4156 mapRes!494))))

(declare-fun condMapEmpty!494 () Bool)

(declare-datatypes ((V!639 0))(
  ( (V!640 (val!179 Int)) )
))
(declare-datatypes ((ValueCell!157 0))(
  ( (ValueCellFull!157 (v!1271 V!639)) (EmptyCell!157) )
))
(declare-datatypes ((array!629 0))(
  ( (array!630 (arr!302 (Array (_ BitVec 32) ValueCell!157)) (size!364 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!629)

(declare-fun mapDefault!494 () ValueCell!157)

