; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110456 () Bool)

(assert start!110456)

(declare-fun mapIsEmpty!54160 () Bool)

(declare-fun mapRes!54160 () Bool)

(assert (=> mapIsEmpty!54160 mapRes!54160))

(declare-fun b!1306714 () Bool)

(declare-fun e!745547 () Bool)

(declare-fun e!745546 () Bool)

(assert (=> b!1306714 (= e!745547 (and e!745546 mapRes!54160))))

(declare-fun condMapEmpty!54160 () Bool)

(declare-datatypes ((V!51797 0))(
  ( (V!51798 (val!17585 Int)) )
))
(declare-datatypes ((ValueCell!16612 0))(
  ( (ValueCellFull!16612 (v!20212 V!51797)) (EmptyCell!16612) )
))
(declare-datatypes ((array!87056 0))(
  ( (array!87057 (arr!42008 (Array (_ BitVec 32) ValueCell!16612)) (size!42558 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87056)

(declare-fun mapDefault!54160 () ValueCell!16612)

