; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83870 () Bool)

(assert start!83870)

(declare-fun b_free!19679 () Bool)

(declare-fun b_next!19679 () Bool)

(assert (=> start!83870 (= b_free!19679 (not b_next!19679))))

(declare-fun tp!68478 () Bool)

(declare-fun b_and!31447 () Bool)

(assert (=> start!83870 (= tp!68478 b_and!31447)))

(declare-fun mapIsEmpty!36038 () Bool)

(declare-fun mapRes!36038 () Bool)

(assert (=> mapIsEmpty!36038 mapRes!36038))

(declare-fun mapNonEmpty!36038 () Bool)

(declare-fun tp!68479 () Bool)

(declare-fun e!552366 () Bool)

(assert (=> mapNonEmpty!36038 (= mapRes!36038 (and tp!68479 e!552366))))

(declare-datatypes ((V!35213 0))(
  ( (V!35214 (val!11387 Int)) )
))
(declare-datatypes ((ValueCell!10855 0))(
  ( (ValueCellFull!10855 (v!13949 V!35213)) (EmptyCell!10855) )
))
(declare-datatypes ((array!61359 0))(
  ( (array!61360 (arr!29537 (Array (_ BitVec 32) ValueCell!10855)) (size!30016 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61359)

(declare-fun mapRest!36038 () (Array (_ BitVec 32) ValueCell!10855))

(declare-fun mapKey!36038 () (_ BitVec 32))

(declare-fun mapValue!36038 () ValueCell!10855)

(assert (=> mapNonEmpty!36038 (= (arr!29537 _values!1278) (store mapRest!36038 mapKey!36038 mapValue!36038))))

(declare-fun b!979926 () Bool)

(declare-fun e!552362 () Bool)

(declare-fun e!552361 () Bool)

(assert (=> b!979926 (= e!552362 (and e!552361 mapRes!36038))))

(declare-fun condMapEmpty!36038 () Bool)

(declare-fun mapDefault!36038 () ValueCell!10855)

