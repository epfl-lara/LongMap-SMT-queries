; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83176 () Bool)

(assert start!83176)

(declare-fun b_free!19169 () Bool)

(declare-fun b_next!19169 () Bool)

(assert (=> start!83176 (= b_free!19169 (not b_next!19169))))

(declare-fun tp!66786 () Bool)

(declare-fun b_and!30657 () Bool)

(assert (=> start!83176 (= tp!66786 b_and!30657)))

(declare-fun b!970385 () Bool)

(declare-fun e!547065 () Bool)

(declare-fun e!547068 () Bool)

(declare-fun mapRes!35110 () Bool)

(assert (=> b!970385 (= e!547065 (and e!547068 mapRes!35110))))

(declare-fun condMapEmpty!35110 () Bool)

(declare-datatypes ((V!34405 0))(
  ( (V!34406 (val!11084 Int)) )
))
(declare-datatypes ((ValueCell!10552 0))(
  ( (ValueCellFull!10552 (v!13643 V!34405)) (EmptyCell!10552) )
))
(declare-datatypes ((array!60193 0))(
  ( (array!60194 (arr!28960 (Array (_ BitVec 32) ValueCell!10552)) (size!29439 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60193)

(declare-fun mapDefault!35110 () ValueCell!10552)

