; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!630 () Bool)

(assert start!630)

(declare-fun b_free!103 () Bool)

(declare-fun b_next!103 () Bool)

(assert (=> start!630 (= b_free!103 (not b_next!103))))

(declare-fun tp!527 () Bool)

(declare-fun b_and!241 () Bool)

(assert (=> start!630 (= tp!527 b_and!241)))

(declare-fun b!4015 () Bool)

(declare-fun e!2071 () Bool)

(declare-fun tp_is_empty!181 () Bool)

(assert (=> b!4015 (= e!2071 tp_is_empty!181)))

(declare-fun mapNonEmpty!230 () Bool)

(declare-fun mapRes!230 () Bool)

(declare-fun tp!526 () Bool)

(declare-fun e!2074 () Bool)

(assert (=> mapNonEmpty!230 (= mapRes!230 (and tp!526 e!2074))))

(declare-datatypes ((V!419 0))(
  ( (V!420 (val!96 Int)) )
))
(declare-datatypes ((ValueCell!74 0))(
  ( (ValueCellFull!74 (v!1183 V!419)) (EmptyCell!74) )
))
(declare-datatypes ((array!297 0))(
  ( (array!298 (arr!141 (Array (_ BitVec 32) ValueCell!74)) (size!203 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!297)

(declare-fun mapValue!230 () ValueCell!74)

(declare-fun mapRest!230 () (Array (_ BitVec 32) ValueCell!74))

(declare-fun mapKey!230 () (_ BitVec 32))

(assert (=> mapNonEmpty!230 (= (arr!141 _values!1492) (store mapRest!230 mapKey!230 mapValue!230))))

(declare-fun b!4016 () Bool)

(declare-fun e!2073 () Bool)

(assert (=> b!4016 (= e!2073 (and e!2071 mapRes!230))))

(declare-fun condMapEmpty!230 () Bool)

(declare-fun mapDefault!230 () ValueCell!74)

