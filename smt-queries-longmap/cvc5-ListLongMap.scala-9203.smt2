; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110566 () Bool)

(assert start!110566)

(declare-fun b_free!29401 () Bool)

(declare-fun b_next!29401 () Bool)

(assert (=> start!110566 (= b_free!29401 (not b_next!29401))))

(declare-fun tp!103525 () Bool)

(declare-fun b_and!47609 () Bool)

(assert (=> start!110566 (= tp!103525 b_and!47609)))

(declare-fun b!1307995 () Bool)

(declare-fun e!746371 () Bool)

(declare-fun e!746369 () Bool)

(declare-fun mapRes!54325 () Bool)

(assert (=> b!1307995 (= e!746371 (and e!746369 mapRes!54325))))

(declare-fun condMapEmpty!54325 () Bool)

(declare-datatypes ((V!51945 0))(
  ( (V!51946 (val!17640 Int)) )
))
(declare-datatypes ((ValueCell!16667 0))(
  ( (ValueCellFull!16667 (v!20267 V!51945)) (EmptyCell!16667) )
))
(declare-datatypes ((array!87262 0))(
  ( (array!87263 (arr!42111 (Array (_ BitVec 32) ValueCell!16667)) (size!42661 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87262)

(declare-fun mapDefault!54325 () ValueCell!16667)

