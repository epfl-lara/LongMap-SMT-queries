; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70170 () Bool)

(assert start!70170)

(declare-fun b_free!12577 () Bool)

(declare-fun b_next!12577 () Bool)

(assert (=> start!70170 (= b_free!12577 (not b_next!12577))))

(declare-fun tp!44448 () Bool)

(declare-fun b_and!21357 () Bool)

(assert (=> start!70170 (= tp!44448 b_and!21357)))

(declare-fun b!815298 () Bool)

(declare-fun e!452064 () Bool)

(declare-fun e!452065 () Bool)

(declare-fun mapRes!23014 () Bool)

(assert (=> b!815298 (= e!452064 (and e!452065 mapRes!23014))))

(declare-fun condMapEmpty!23014 () Bool)

(declare-datatypes ((V!24051 0))(
  ( (V!24052 (val!7191 Int)) )
))
(declare-datatypes ((ValueCell!6728 0))(
  ( (ValueCellFull!6728 (v!9618 V!24051)) (EmptyCell!6728) )
))
(declare-datatypes ((array!44776 0))(
  ( (array!44777 (arr!21447 (Array (_ BitVec 32) ValueCell!6728)) (size!21868 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44776)

(declare-fun mapDefault!23014 () ValueCell!6728)

