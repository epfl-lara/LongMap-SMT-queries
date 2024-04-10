; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83942 () Bool)

(assert start!83942)

(declare-fun mapNonEmpty!36146 () Bool)

(declare-fun mapRes!36146 () Bool)

(declare-fun tp!68659 () Bool)

(declare-fun e!552974 () Bool)

(assert (=> mapNonEmpty!36146 (= mapRes!36146 (and tp!68659 e!552974))))

(declare-fun mapKey!36146 () (_ BitVec 32))

(declare-datatypes ((V!35309 0))(
  ( (V!35310 (val!11423 Int)) )
))
(declare-datatypes ((ValueCell!10891 0))(
  ( (ValueCellFull!10891 (v!13985 V!35309)) (EmptyCell!10891) )
))
(declare-fun mapRest!36146 () (Array (_ BitVec 32) ValueCell!10891))

(declare-datatypes ((array!61493 0))(
  ( (array!61494 (arr!29604 (Array (_ BitVec 32) ValueCell!10891)) (size!30083 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61493)

(declare-fun mapValue!36146 () ValueCell!10891)

(assert (=> mapNonEmpty!36146 (= (arr!29604 _values!1278) (store mapRest!36146 mapKey!36146 mapValue!36146))))

(declare-fun mapIsEmpty!36146 () Bool)

(assert (=> mapIsEmpty!36146 mapRes!36146))

(declare-fun b!980989 () Bool)

(declare-fun e!552978 () Bool)

(declare-fun e!552975 () Bool)

(assert (=> b!980989 (= e!552978 (and e!552975 mapRes!36146))))

(declare-fun condMapEmpty!36146 () Bool)

(declare-fun mapDefault!36146 () ValueCell!10891)

